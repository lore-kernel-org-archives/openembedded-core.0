Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD30D3C92D
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:53:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.44466.1729511606080194953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 04:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TlT5BS43;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e63c8678so5187242e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729511604; x=1730116404; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqJp0RVrioJe1CN0ZWxJ7/ZXpg/jZFkZtlwIxstcZCQ=;
        b=TlT5BS43JDPC4qriBiM6bocam4kyKDOSN+WTDtLsp0jTJqBfCDqm8KWHzreBTZeX91
         vCHsGaucmq08/CoVXVjPD/NlxyumGs6J9KlniApfmGc26jAaTYjuoiuz5HKAb/ZNgRp8
         H5KMOMUU4Exs1705NdY4zz9OZPrMzsWZKypZ8QpB25h4bgtZ2fEcumPI/wbM3uG3kW74
         W5LY5gaaRHps2l7TJNBoSWv+v6Gh1l3RPQJcN2crJIJxBIGIvJrMCMCJegxoyeT76/82
         9svLe7o+Bc32NqxXN+6biRUNC3iogYjNNnFbVyDVMBDLjP8gQb+gsWXwiTxEwYQ+ZqNN
         fDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511604; x=1730116404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqJp0RVrioJe1CN0ZWxJ7/ZXpg/jZFkZtlwIxstcZCQ=;
        b=vYlmlA2a9DVjgHz21weh52XHordJvvaZCRzu/B9Nds1BPD0k7PZsh28rJD7hX78AcM
         7vrxcg/dDgHdzxJpAxJIlZwulMqfZrZ6/ukcqbIF45ufrT9jatJL1DNztRJg38bOGGSo
         manx3m8eQ5PBAIQxsod/cY3tai3sfkQynF4lzUR82J52sjGh7A4f8jlv9gKBzl2FNHJX
         RjfmUqmrJ9LLQuM1mRPK/IIokUJN3lqrkQ6zxacSmhv2cut0BaIxdtwziJ1z1PUFFMLd
         Q6KMUrwgihZLxSKBw3MJOhUjkt31vxY+O2YEggVnheMypzKFPko4I3Gn9pgWbtuzwiUA
         CFbA==
X-Gm-Message-State: AOJu0Yy/62TYXdSbAGRiP53vPUIYrdnOQd5vuYoKO+yLZpuS6sfd/DHK
	eawvF6m4uwsmxlqwGuA/UnmzboKzwpYM8gIqKLWRES5l3fafDpbD8DOVG0HLNH6P0tdtlpy2+Au
	uykx3j7voJuBPxzcvecyT3RSBO2E=
X-Google-Smtp-Source: AGHT+IGJctc+cxfyZYmwd14ZAy9yKtMJ+wpTTAZddBcVArX0pzmKtfCrQXKDlID66um3zeT3nKex/m/lh6iowMql1io=
X-Received: by 2002:a05:6512:10d1:b0:534:5453:ecda with SMTP id
 2adb3069b0e04-53a154a2b03mr5538204e87.23.1729511604022; Mon, 21 Oct 2024
 04:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241021115026.159503-1-Pawan.Badganchi@kpit.com>
In-Reply-To: <20241021115026.159503-1-Pawan.Badganchi@kpit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 13:53:11 +0200
Message-ID: <CANNYZj-XwHz1Kywa40fm0UzOWPOnEDqLCjrEoaZes2TCzKQAdw@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH v2] e2fsprogs: removed 'sed -u' option
To: badganchipv@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Aditya Tayade <Aditya.Tayade@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206117

This needs to be accepted for master branch first. Also, dunfell is
EOL and no patches are accepted.

Alex

On Mon, 21 Oct 2024 at 13:50, Pawan Badganchi via
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
> View/Reply Online (#206115): https://lists.openembedded.org/g/openembedded-core/message/206115
> Mute This Topic: https://lists.openembedded.org/mt/109130461/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

