Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB45C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 16:24:37 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.55005.1683217476948712615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 09:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=anz8jENe;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-546de76c23eso354561eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683217476; x=1685809476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzNAxoylHg5WVMV3lnjf6CBOJsnaJD79lZbeGpIeepY=;
        b=anz8jENe+81bAf6v08Ldaqqj0tryCCf1T5jRSZK/EN8psImcL6RYmqdWJtgkfzLbUw
         lg8KKu2ML/prHGtRCMFl6D/c5WSsLbZZOuukNEIH7vUG4oVuhyGW0fZq4lVDI5qMfkby
         91RH4flpRgUlIZp1W7F3yLT1s24DMaM9K6WQmppLRgIZGrzjWCNLGr5nQgR1nH4X/UmN
         uaqf1lgmmWfaDFuEzkHBxa9UZTqdRrw26Pn6xbX5NkxSQRgI4lM0Bak2EdV6ODfE+gDE
         wmeHmnPLsGWIbzyY1vldB1RHiKQC/7HGH95HRBLiv16Yg5QNWpvL95RqDMhplTfQEi2z
         xcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683217476; x=1685809476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzNAxoylHg5WVMV3lnjf6CBOJsnaJD79lZbeGpIeepY=;
        b=gjAOVSDrB4hsZkmRycQzRAYso+qSlpl25iIDXSAEdzXn+G4/BP+OhViWPnNn1xIGsn
         jc+uYrw6YbM7tWFasDu3URWZLO9Cus0xeCbHgpNp9bgeMZXYJIDm7w782NJER36aOVjO
         hijqx4ZmyKfvodLir3P5tvcH91NUDO+jvyDtmLFX8owxKb0lavHXQFYSzbHfKBsICxp0
         HRbREo+v09mr9xfRlP2iKARwvEj7RMxsj+Dlw+hapSzxHBNYLjyg1sElKLLby+LWabX8
         qyzfzm0pltgrCJVNh6f0EBBJ/Ght1izbtL0zTBk6vAz9ul98kOHFo5/9UAOdKsO6zDR+
         gQwQ==
X-Gm-Message-State: AC+VfDzAte4XQ0srbkjljFPXl0R2of5ttuduFwYXVLlO6o1Ly4jKitkw
	LofFPVMIJZpXQaijJZ9YZy/FfAebQexwfQHgozW0YI3oeIs=
X-Google-Smtp-Source: ACHHUZ5tAA3X8ApOCkqlNROOQXNTWQp32009V52f6CyVemKPg9mRAKfy3ZcGopSm6youTR06dol5gvJvtMhepidG5WM=
X-Received: by 2002:a05:6820:502:b0:547:5593:d6 with SMTP id
 m2-20020a056820050200b00547559300d6mr15003144ooj.5.1683217476111; Thu, 04 May
 2023 09:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <72Qn.1682583986150981484.FBVe@lists.openembedded.org>
In-Reply-To: <72Qn.1682583986150981484.FBVe@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 May 2023 09:24:10 -0700
Message-ID: <CAMKF1soZiL82M5y14agXb=OBU4Y3EeqUp=nzpD-kWO95q_z+3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V1] e2fsprogs: fix ptest bug for second running
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 16:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180883

This seems to be problematic. See

Log data follows:


[265/1914]
| DEBUG: Executing shell function do_install_ptest_base
| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/e2fsprogs/1.47.0=
-r0/temp/run.do_install_ptest_base.2332727:
line 192:  : command not found
| WARNING: /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/e2fspro=
gs/1.47.0-r0/temp/run.do_install_ptest_base.2332727:192
exit 127 from '  install -Dm 0644
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-lin
ux-musl/e2fsprogs/1.47.0-r0/build/tests/test_data.tmp
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/e2fsprogs/1.47.0-r=
0/image/usr/lib/e2fsprogs/ptest/data/test_data.tmp'

On Thu, Apr 27, 2023 at 1:26=E2=80=AFAM qiutt@fujitsu.com <qiutt@fujitsu.co=
m> wrote:
>
> From db4b5e31703e4143450b1e7239b2502a89ed042a Mon Sep 17 00:00:00 2001
> From: Qiu Tingting <qiutt@fujitsu.com>
> Date: Thu, 27 Apr 2023 15:29:14 +0800
> Subject: [PATCH V1] e2fsprogs: fix ptest bug for second running
>
> At second running, there are four new failed case:
>   d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_resize
>
> The test_data.tmp is necessary, but it is deleted by run-ptest.
> So it should be restored after testing.
>
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> index c97c0377e9..279923db8e 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> @@ -8,3 +8,4 @@ rm -f *.tmp
>  rm -f *.ok
>  rm -f *.failed
>  rm -f *.log
> +cp ../data/test_data.tmp ./
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> index a2eb4f8f8f..87e13d744b 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> @@ -143,4 +143,7 @@ do_install_ptest() {
>
>          install -d ${D}${PTEST_PATH}/lib
>          install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
> +
> +        install -d ${D}${PTEST_PATH}/data
> +        install -m 0644 ${B}/tests/test_data.tmp ${D}${PTEST_PATH}/data/
>  }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180487): https://lists.openembedded.org/g/openembedde=
d-core/message/180487
> Mute This Topic: https://lists.openembedded.org/mt/98532860/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

