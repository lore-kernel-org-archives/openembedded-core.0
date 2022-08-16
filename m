Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E388C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 22:46:21 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web09.22544.1660689971399509286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 15:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ldAnbVkA;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-32a09b909f6so189159827b3.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=V/qcg5np8ZRQM+BAA1Sha90VqMSOtlzKUaqQxshPz8I=;
        b=ldAnbVkAcOA+U/wVJ5X2LVnHT/9n/dCVQHuw9rqrTx1++6m4Pw4cIfjjYdG2wGSwkh
         bCEOjg5vV4HRCf/9IsGXCcb6fXXUNXFx83uDuC+gtxhZZRo8HkGaKMmKDh73SLCA+4sF
         fD8gIlWdVMyd6fVkd3pWC/A9hFSGFG8SUc6hGKuXTeUosKimuw+R6btr0CK3FWK8LeZm
         RbKMwyyjTbe9y6KPyfo2L0X1ksTauPqDpY8gxMmWOkYqmwwzOOmVrqAxBt5ie02v1W+H
         ZiR9e0boAqLWzXtOXaUY2Rz24/F58e2NBkGCjsso2migvMc9rNMga1HaW/74F4sJyK0n
         H3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=V/qcg5np8ZRQM+BAA1Sha90VqMSOtlzKUaqQxshPz8I=;
        b=Tov+y6+WnIXkBp2MUS9m4boZrUkqCABGpZG9ObUuMYhyNqwKjWVe2jvEaxjTFb0QBr
         BlPjoXu9frmtJmKbSfA7fZofIVtbQRm71jNTse99eIzHgjFf8YWoLzooP9rEYaY7cN7D
         bZuY/dScRk2wEMbHVlspEuKkOUYx9m7KHT8iGscRJEP0V/ULiSEItpO4p+d2HgKR0OdX
         LqV0ok39qB2F3BzL5z+5tx9DR7Dty7/2RLEm1qBZeVUW7RrtrLQnAZaiIZ3Y9KwfikGt
         rhI4uUDYlVD27iVEpXCYMozEYjmvigCkIeb/o5fsFAm4BcTbSXWKF7rEg0RFyrhXxD5T
         q2eA==
X-Gm-Message-State: ACgBeo0LaUvrwOF/SNPBG8x4dlZ2Y5w/4l0cYKfcxkHjua9ygdVKP2ch
	XQ0lxlXRkg36Mq7o/pbpnJsBRHi6NEocf5KwnwA=
X-Google-Smtp-Source: 
 AA6agR5SGfpONB9SS46t+xRpaMLQEgAlhdk1X9OT8buV5HBIpirywAbL8CZdP65qCSTJ3oztz8KJ8Rc2JBdpdO3LFrk=
X-Received: by 2002:a81:6c43:0:b0:32f:df6d:f7ef with SMTP id
 h64-20020a816c43000000b0032fdf6df7efmr12216340ywc.422.1660689970405; Tue, 16
 Aug 2022 15:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
 <20220816205746.1672987-7-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220816205746.1672987-7-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2022 15:45:43 -0700
Message-ID: 
 <CAMKF1spMaw8huKn=OWCWUE8FYsZ0O0mYh4DeKMdpf2mFXO1ojQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/8] gcc: Add a patch to avoid hardcoded paths
 in libgcc on powerpc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 22:46:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169464

On Tue, Aug 16, 2022 at 1:58 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Tweak the powerpc code to just include filenames rather than full paths
> to avoid build reproducibility issues.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
>  .../gcc/gcc/hardcoded-paths.patch             | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
> index c42fa3d72f0..488e0c95b18 100644
> --- a/meta/recipes-devtools/gcc/gcc-12.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
> @@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
>             file://0026-rust-recursion-limit.patch \
>             file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch \
>             file://prefix-map-realpath.patch \
> +           file://hardcoded-paths.patch \
>  "
>  SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
>
> diff --git a/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch b/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
> new file mode 100644
> index 00000000000..aa3d16f6000
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
> @@ -0,0 +1,19 @@
> +Avoid encoding build paths into sources used for floating point on powerpc.
> +(MACHINE=qemuppc bitbake libgcc).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: gcc-12.1.0/libgcc/config/rs6000/t-float128
> +===================================================================
> +--- gcc-12.1.0.orig/libgcc/config/rs6000/t-float128
> ++++ gcc-12.1.0/libgcc/config/rs6000/t-float128
> +@@ -103,7 +103,7 @@ $(ibm128_dec_objs) : INTERNAL_CFLAGS +=
> + $(fp128_softfp_src) : $(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@)) $(fp128_dep)
> +       @src="$(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@))"; \
> +       echo "Create $@"; \
> +-      (echo "/* file created from $$src */"; \
> ++      (echo "/* file created from `basename $$src` */"; \
> +        echo; \
> +        sed -f $(fp128_sed) < $$src) > $@
> +

This one looks an easily upstreamable change.

> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169461): https://lists.openembedded.org/g/openembedded-core/message/169461
> Mute This Topic: https://lists.openembedded.org/mt/93068152/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

