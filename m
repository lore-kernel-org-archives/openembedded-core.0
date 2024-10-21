Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B74BD0E6EE
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:40:17 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.43464.1729507213002130972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AjAE+G3e;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2319490e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507211; x=1730112011; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2W2Ll6R6uaXW16iEuyG13i2UyTe8FKUXQ6i0SJngx0=;
        b=AjAE+G3eWjaE1LQJwxzK6WubCh8xxSZ3hh4Zf//Gs1T7qkMnENerczGoHx4tQ8zeHX
         39+Hl+yTBJY8ystheKEzxxYQDrWevQAkXUoQFua6/FtrnuuyUr9CvutJrRuoh3h2XjI9
         nfBrYaSiDJgGeIq5zLfm8JuGRZKLVHRAKqFCIVvqJAoLg5bKK+NUtz6JAtGvzlAtUSx3
         46B7DpPhtOAcqpcxPn/0IdAHaBILMPu976k3n9xI+HAp9L7ztLAWRDKyuAcdOQmmzezs
         maqMMxkzF8SM0MciZgq+0OJWj5icqUrNE7arYu+ge1QHDJH4kDp1kizEqCxeT0PXNdUb
         SFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507211; x=1730112011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2W2Ll6R6uaXW16iEuyG13i2UyTe8FKUXQ6i0SJngx0=;
        b=ZLPd1PSfFEbqUI5FfY4C5YBkJO7KMtaZOA6CEuOu4j4mgzZUvHyaJsZ6w5Gy2/19vS
         VKJ0pJ9864rA240yRn2q2Xdj3HLhUZ4anO/dh4hgivxmnh/VDty+23/j3hsXlSU8ZwJ1
         coJD6WJW2hP8qnuVUlni2qDrWhJsljJ3WE3ene8RS9lEUcBoxxYQx6q+bPHt0zZMX5BB
         PqEwEZQR7nOgNVWVgCpxZkfqaBykPzqdUHWLBMIT7RNyt6kQ0Za/ACAIMziyFkunhDdY
         sWXAxdiRZG1yMQVHiyQPnQ8Spt94RG6gYuHGeQE900jFeoxr56FR5yk93nriIO9QXylH
         RxPg==
X-Gm-Message-State: AOJu0Yx3AGKtL9cHD9WkUsvhPAm4RUbeqNSXpHaVRTaXfkwkFJsnZze4
	vsRlTONlJm/EfGwEtp4eaklo8PfIPxj+TQj3t3W5/H6P3HHdEwQQm8YhjqWRP3KeML+UhdbWBhC
	baqwu8mLO4SXRgH+IDcuddkjwlTI=
X-Google-Smtp-Source: AGHT+IEyE8BoV4ld7SSSHf3Rv/cysXSNlYwJ3hEzMAJCJfjMChGw6AjGW2FhVJ+SsMuQK7aJSQr6WhsaX5n/jfgaMMc=
X-Received: by 2002:a05:6512:3ca4:b0:536:a52d:f94b with SMTP id
 2adb3069b0e04-53a1520bd2dmr5069664e87.8.1729507211014; Mon, 21 Oct 2024
 03:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241021091535.117383-1-Pawan.Badganchi@kpit.com>
In-Reply-To: <20241021091535.117383-1-Pawan.Badganchi@kpit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:39:59 +0200
Message-ID: <CANNYZj9DC3OTd-Q93f5ucN4f_gFc-8OBHw2jnb-3-uzP3fgH1Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] run-ptest: removed 'sed -u' option
To: badganchipv@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Aditya Tayade <Aditya.Tayade@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206110

The commit header should say "e2fsprogs: do not use -u sed option in run-ptest".

Also can you check run-ptest in other recipes if they have the same problem?

On Mon, 21 Oct 2024 at 11:15, Pawan Badganchi via
lists.openembedded.org <badganchipv=gmail.com@lists.openembedded.org>
wrote:
>
> From: Aditya Tayade <Aditya.Tayade@kpit.com>
>
> In embedded box, sed might be provided another providers like Busybox,
> hence use generic options whenever possible.
> /bin/sed -> /etc/alternatives/sed
> /etc/alternatives/sed -> /bin/busybox.nosuid
>
> Here used 'sed -u' option is not necessary, hence removed it.
>
> Fixes below error:
> sed: invalid option -- 'u'
>
> Also added 'set -eux' option which halts execution of the script
> on any failures.
>
> Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> index 279923db8e..1857a17189 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> @@ -1,7 +1,8 @@
>  #!/bin/sh
>
> +set -eux
>  cd ./test
> -SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
> +SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
>  rm -rf /var/volatile/tmp/*e2fsprogs*
>  rm -f tmp-*
>  rm -f *.tmp
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206101): https://lists.openembedded.org/g/openembedded-core/message/206101
> Mute This Topic: https://lists.openembedded.org/mt/109129050/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

