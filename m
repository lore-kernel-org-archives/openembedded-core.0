Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7B0C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 07:36:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.8435.1661326588872862769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 00:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kh3xO1Cm;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id k22so921456ljg.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nfnSypyAXpLQAWr8+HeMPxSH8pm8Gh9XPGoJsKFUWAk=;
        b=kh3xO1Cm65P49NRQ/4y+yhuNKtk+YyiMsKNfsO5u+5BFUrbJmHm7+AcIwVUEkRk25M
         3JhBO98eisKzFImCK3F7ERwQEGYgfDPTRL+25Sc+P8a2iE/q+rtIaluS+oX6GNiO9GUm
         Q8Qy/JcyhZfzLqSShe3UEA5FYd9VYaTlkQ/idGZXGks4SJrDOl8Hk+yra7jMMMD4m3Wi
         yHfDb6cKhGLTLrJGeHaA6X0sPOWcDs5pnE6sMfz5P+aBIoFhUzLU42YPFyZJ9C5TCPAc
         u+VkOPNClqrMV8CPLRsJ9jWVXlngXM39Qw3FkFRrh9lcmqcx/nZoJzNzNZdG2FYNviMn
         wPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nfnSypyAXpLQAWr8+HeMPxSH8pm8Gh9XPGoJsKFUWAk=;
        b=x7uVVDko/y2VoRFLdhf7+paoSEkb8axDyxxiAYHS1pyLYTgqeZQ8YiZM5XafXtEvWx
         aCfVEywMMJ0zNXNPt0wYEtW7z3RHaC5A0xIGnnNn3dt02YDjOvOeV9EAYq10xoAx1pMJ
         uX1UywPHh8efakIuK8whEpHMoHUT+P6h/VQIrZY6Qd9SFsbauQlNFNGaPbUJPjHOeYIp
         fTj3OcaJ7tSEK+vCNEm0AXpbK3BjrN6KMpXLpX1vW1qnuZXpKioTaEcKedBnnEirfN+r
         ztirIRLCYiqwkGred5mnSffCMn450WkzY8cCY+BHgyRXb+qgyhmcmmnQQQGmtIDzjjLD
         Qs7g==
X-Gm-Message-State: ACgBeo0m9TvplEgEfUdIGoRv5sfQIWimfgwMwA+olg9UHJ8DwaQbYIPd
	EtIfmrskB4yvXDAXp5uATMLMGPW0YXh4VfR/8Ak=
X-Google-Smtp-Source: 
 AA6agR7qvCOzf7YJs7blELCP5C1H5gtvP5LSMPW2USr8npiiJ0p+8kx5BNCwxaFMuDxKFky8uMCMbbXM4HnODUOxn5o=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr7348823lja.68.1661326586970; Wed, 24 Aug
 2022 00:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
In-Reply-To: <20220823235624.2488133-6-andrei@gherzan.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 09:36:14 +0200
Message-ID: 
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
To: Andrei Gherzan <andrei@gherzan.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 07:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169784

I do not think it is inappropriate, as it does highlight an issue
which we need to inform upstream about. Can you submit it upstream
anyway please?

Alex

On Wed, 24 Aug 2022 at 01:57, Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> The libnss configuration file is only installed when glibc is used. The
> inexistence of it on a musl-based rootfs, will make shadow complain
> about it:
>
> Failed opening /etc/nsswitch.conf
>
> This is because shadow will try to use nsswich when dealing with
> subordinate IDs and the message is just a warning as the tool will still
> generate them correctly in subuid/subgid files.
>
> We drop this log message for class native to avoid an error when rootfs
> logs are checked ('Failed' will match the regex bitbake is using to
> check for rootfs generation errors).
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  ...f-message-when-not-in-place-eg.-musl.patch | 27 +++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       |  2 ++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
> new file mode 100644
> index 0000000000..aeb89ff6a0
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
> @@ -0,0 +1,27 @@
> +From 11290e897a49adddee215833944a518443d9b0d6 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
> +Date: Wed, 24 Aug 2022 00:54:47 +0200
> +Subject: [PATCH] Drop nsswitch.conf message when not in place - eg. musl
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + lib/nss.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/nss.c b/lib/nss.c
> +index 06fa48e..44245da 100644
> +--- a/lib/nss.c
> ++++ b/lib/nss.c
> +@@ -59,7 +59,7 @@ void nss_init(const char *nsswitch_path) {
> +       //   subid:     files
> +       nssfp = fopen(nsswitch_path, "r");
> +       if (!nssfp) {
> +-              fprintf(shadow_logfd, "Failed opening %s: %m\n", nsswitch_path);
> ++              //fprintf(shadow_logfd, "Failed opening %s: %m\n", nsswitch_path);
> +               atomic_store(&nss_init_completed, true);
> +               return;
> +       }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index b2f82e9ac7..414bf467ba 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -25,12 +25,14 @@ SRC_URI:append:class-target = " \
>  SRC_URI:append:class-native = " \
>             file://0001-Disable-use-of-syslog-for-sysroot.patch \
>             file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
> +           file://0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch \
>             "
>  SRC_URI:append:class-nativesdk = " \
>             file://0001-Disable-use-of-syslog-for-sysroot.patch \
>             "
>  SRC_URI[sha256sum] = "9fdb73b5d2b44e8ba9fcee1b4493ac75dd5040bda35b9ac8b06570cd192e7ee3"
>
> +
>  # Additional Policy files for PAM
>  PAM_SRC_URI = "file://pam.d/chfn \
>                 file://pam.d/chpasswd \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169767): https://lists.openembedded.org/g/openembedded-core/message/169767
> Mute This Topic: https://lists.openembedded.org/mt/93217143/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

