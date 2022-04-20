Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D9AC64EB4
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:10 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.12585.1650485170851633767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 13:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q8pHDfJB;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id l7so5803077ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6SWmgrO5BqYYC9sVnYQtWINaqViWKVxDPQ6i44SQI8E=;
        b=Q8pHDfJBN5raDNN3oeH1hD0wsl0Atfp1CXWFL7WT1VIgCCZhfBzSLiljjEeglYesoT
         Z4z+6CFB6QFrziu8qi0KgZNPTtirsbR7XwuCWWov6LL+OlUyYfc2wGTYTWh6v3MfupcV
         zSxFRQdCko+rKKS0ywtr61SudltN9FQUotbegJBqU+AvIiwpkRolPonrb3aOmrhsde7I
         uU2j3yPQBe80oYKU5aGYCHYAjkL0Q27EpgIizueiXORgia72qTncAWeGZLf+/CJfQkOZ
         f5wSW1wYiNLRG2xYa0eZ2lTZDsczb6yFAGY556xw9SNj5Av0R2GczlsYkwCRMqi9cupA
         i8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6SWmgrO5BqYYC9sVnYQtWINaqViWKVxDPQ6i44SQI8E=;
        b=UHiwP9FXTaHQRHveDmp0Kchvt864QleTXmG0UHsIDpZO8lWc1emNL0lLWn00vpZ6Y+
         qo9t33bIdb14KidJeQF9I0J21bMvWd8YP/xF5DWG5zu53VJ+FaVwxaqL9n2UE7njSe/h
         IOhOyFQawjQvldEHKJzgKPBy8O4XjI8jMGCB8v9m9eTF6C6G+5nwbkdv8QeK7h82j45N
         uvcxyHyg7/Ymcvtkekymj5CzU+Cq187kzGgBdVKaqoozz0p8Y3HHqhNKmhZmf3d0iPP5
         XpI0LWd566/fTMJE80BVKJGDVX9acMu7+V4UhwPyXVy0HhPM18lHVu2ql426bNTTHkFQ
         baZw==
X-Gm-Message-State: AOAM533czSULTfXfNt3pqlqooc/h6erjJF5BrezBS0QUx2G2TuNSZ+qj
	eYoY9f0moxMdR7RRNQuvfgKkzvnNwy88hPF2CjBaPg==
X-Google-Smtp-Source: 
 ABdhPJwn8ieja3CKRRhlyCw1kIE8xCbUnFRCw9bgFVakY//pQgRQSyemKWgGKTPApAa1aJmBkX2xnxu+d0/bA9dSYog=
X-Received: by 2002:a17:906:9c83:b0:6df:839a:a6d0 with SMTP id
 fj3-20020a1709069c8300b006df839aa6d0mr19604956ejc.419.1650485169150; Wed, 20
 Apr 2022 13:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 20 Apr 2022 10:05:58 -1000
Message-ID: 
 <CAOSpxdYwkknc5MT69Ze1=uN48YFbzf3U8kTGpBCvk1k-G50Ujw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/17] connman-conf: ignore eth0 in qemu in a
 way that is not sysvinit-specific
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164725

I still occasionally get the ping error on dunfell autobuilder runs,
so I suspect it needs something similar to this patch.

I'm not conman literate, so if someone who is can create a patch for
dunfell I would be most appreciative!  The recipe differences between
master and dunfell are great enough that I don't trust myself :-)

Steve

On Thu, Apr 7, 2022 at 7:00 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb        | 7 +++++--
>  meta/recipes-connectivity/connman/connman-conf/main.conf | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman-conf/main.conf
>
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
> index 6b9207c4cb..7959ed8e50 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
>
>  PR = "r2"
>
> +SRC_URI = "file://main.conf \
> +          "
> +
>  S = "${WORKDIR}"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -14,6 +17,6 @@ FILES:${PN} = "${sysconfdir}/*"
>
>  # Kernel IP-Config is perfectly capable of setting up networking passed in via ip=
>  do_install:append:qemuall() {
> -    mkdir -p ${D}${sysconfdir}/default
> -    echo "export EXTRA_PARAM=\"-I eth0\"" > ${D}${sysconfdir}/default/connman
> +    mkdir -p ${D}${sysconfdir}/connman
> +    cp ${S}/main.conf ${D}${sysconfdir}/connman/main.conf
>  }
> diff --git a/meta/recipes-connectivity/connman/connman-conf/main.conf b/meta/recipes-connectivity/connman/connman-conf/main.conf
> new file mode 100644
> index 0000000000..a394e8f25b
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-conf/main.conf
> @@ -0,0 +1,2 @@
> +[General]
> +NetworkInterfaceBlacklist = eth0
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164117): https://lists.openembedded.org/g/openembedded-core/message/164117
> Mute This Topic: https://lists.openembedded.org/mt/90317717/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

