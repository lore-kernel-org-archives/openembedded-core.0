Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECA2C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 20:30:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3046.1787257844562820841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 13:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qm6oKula;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-907ae240ac3so1862616d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787257843; cv=none;
        d=google.com; s=arc-20260327;
        b=gTRMSSzodVa3xsNwrN+KK5Ox1m9KhN0RhTjAMLeZhKSUWz5Piu2OFTso+hmGgy8mGE
         exCEB0uJROLsqh6m9HX/QppuO8Fi1t2eDFXwD3eIScdjhsuzaRU4EVTGw/827MKJxJ9T
         GyWsiLNkOJ+J1qzMB3ySNj7KxZLWdcToSbhoPvb2u1w8apdSNzvjFh3EFa9rLXhwMn0y
         OpJI8PkmbfEaCT11t7Tbvyirhd4q3A9HZkxuOc/RSodCmnh1axAfxygei95a8SIZ0Ay+
         n2ozCAZox5LHmJFoeHnMhOK1/r2G6ICiXayG6i/6HKdVw8k4ojJrodvc6DDrdqhtoDqp
         MHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kxMaIg5vn4jrew7b+ZAf+sj0IUm9wwEYY2P1YM2UCBo=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=CeLzNFQwS2kdzsmEV2Sc9tnc44P24QRJ1UmRTZ0SnRsIMyw5S9KumKZY15+FmDTFLi
         lEh8mlJtn+FyVqRrh6CVyPS5G6jjfNtBarGV1g+SKLruHUPHyoYhQIF/b8VI6dkRNW11
         8DOqIoKzJV8qAkGmqMc89kj0+i0uLYKyuCw3lYCzVIdI7AnJg6xbhZEkHEgkiGG/xLUV
         GGb/xRfkQvEquJZ9VhRHKbh3bBdBXmFiyD1jzgq334Fz/fBv4nqCcLGiclcC/3XNlLIO
         oLNlvGKrvph5A6UpJTbn0KIWIfah+pl1T27AAlI4E0Pvu5dT60CEYZKxUBKv07zBgAbX
         4jqw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257843; x=1787862643; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxMaIg5vn4jrew7b+ZAf+sj0IUm9wwEYY2P1YM2UCBo=;
        b=Qm6oKulaP2hAUP9MvC9LOBTrWD7kvfqbqlfTUQHTEPt5ZjoM/iDX6Lw5NHGHo269qR
         cbkF8Q2O/EHepBpZpiZFQBWqCAeTs3tNb8/peJGP746yIkD8vJVT1DyabJ2rD9y74oP+
         yCFDLLQbWoVrh8lETx87CSsFwTDB2zbE0A3iEqL1VvRAj/QNU+eUOjWccUpax3mwZGzJ
         nAZO5Ff0Ck+BodnDseAFdHjCaM74hEv2iOin5x/9RpzN62plC4IiGyYrT6WAxdcmW3E5
         tGcOuyMapAjxbN1vujS6/rO6X8IfubE1Oh2SAi1uYXdrvirOYFaGYvw/tn3urRUFEIgy
         f1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257843; x=1787862643;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kxMaIg5vn4jrew7b+ZAf+sj0IUm9wwEYY2P1YM2UCBo=;
        b=nZmVkrIGgNKyuuVe1Oc2fhhYwTE9A6Ijm2qEmS7LwwUjJEiE6xnQU+aZM0W0J9KCZu
         k3tnAk2nlfJBtQszT64IUm35GS6ULGfjEEhQqI6biTyISqS0d7XSDQUgADYcKFAXUqAt
         rpfa1nF384hVbsE6KGPSbBxTb6ymPjrJdYA3Eg9Z8SXnIjQ08lDL0x1fLKrfk1au0bU+
         qalD411Ep4ZawCzLthgKge2QFlfDKfcDjvekizBdThA83garw7QYrVXQurf4fcx9U3Ry
         v2J9lcid10jcnPleJ/w0whCMkwmZeVUxoHj0S+siVSmO34uyoB14/DxtUVl1FhTV3e0g
         YW9Q==
X-Gm-Message-State: AFuF++nVOBV1YHcVnzibQSlDGA3zk2wiJ7+BAkRTnlTuGtSqG5gfjGIN
	0vhLI+Fwv0xDyBH610bFPUUAiMFXb0ZRilxD5OQlcSQRTG1sKQB5nERFihfBROPWsrxciRFwiMM
	puCEEyVZ2QGZIltE4q2BJ++FanY8Q/WM=
X-Gm-Gg: AR+sD12QaG0a+EIBn2kICFcroKMXxjuD7jLHQqVWfmfFYZQtwDorIWVcMVaYSzCu5t6
	4bWT44yul+X31cddYzCbtD0tdRkLw+/HtqcGzxtpahxmwnx0JTwvDWQJPshcIC8byDnNu1i9MPp
	7LHUPQk9Z9iLJjF+4f0Qc5tmDe5cG8+gNE2CMoXX2skpaPHpK19C8zHbpCUBhH8JifhGUhqujCp
	IQe+oo/6DhJxK0iJI+/7bVeZKBDVE9o/6kFSgCGPSHB8+KLkD9plAwyvkvaZ3GskIfrSOj7sleE
	KXnfOI3JuNpPaX/4vlKFHiQvSXnrJMhizoKU2tLks3Sf2iS4G2cCE3wCa+WTILsJ9vuurHvxCVX
	U4HQ=
X-Received: by 2002:a05:6214:5d87:b0:904:4275:e165 with SMTP id
 6a1803df08f44-90c80fb9877mr9007266d6.19.1787257843368; Thu, 20 Aug 2026
 13:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260820120646.21045-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260820120646.21045-1-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Aug 2026 22:30:30 +0200
X-Gm-Features: AcwNN1VGDBVUNXVtQkhdKEXWOPsWRLuzNXfqeSCtlqZEUKC1Ns4NQFVvtB5QV30
Message-ID: <CANNYZj_599us=HxbW+BcLm_m7O1RXsufNnX7topuR7rO+FqXtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libtracefs: use meson to build
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 20:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243885

Thanks, this looks good.

Alex

On Thu, 20 Aug 2026 at 14:06, Jaipaul Cheernam via
lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:
>
> Since 1.8.3 libtracefs supports meson
>
> - cleanup copyright and stale license comment from recipe
> - drop the makefile patch for preserving ownership in cp
> - remove do_compile:prepend for sqlhist.tab.c and custom do_installs
>   as the meson class handles
> - Add PACKAGECONFIG entries for doc, samples and utest.
>   Meson defaults these to true,  disable them to match the previous make-based build
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...not-preserve-ownership-in-cp-command.patch | 28 -------------------
>  .../libtracefs/libtracefs_1.8.3.bb            | 21 ++++++--------
>  2 files changed, 8 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
>
> diff --git a/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
> deleted file mode 100644
> index 7eaf29e4c4..0000000000
> --- a/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 21 Dec 2022 22:50:56 -0800
> -Subject: [PATCH] makefile: Do not preserve ownership in cp command
> -
> -Fixes
> -ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs: /usr/lib/libtracefs.so is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 7f4f5c3..1ba7b9d 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -296,7 +296,7 @@ endif # DESTDIR = ""
> -
> - install_libs: libs install_pkgconfig
> -       $(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
> --              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> -+              cp --no-preserve=ownership --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> -       $(Q)$(call do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
> -       $(Q)$(call install_ld_config)
> -
> diff --git a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
> index c010555b1f..0f3d0ebe2c 100644
> --- a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
> +++ b/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
> @@ -1,6 +1,3 @@
> -# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -
>  SUMMARY = "Library to access the kernel tracefs directory"
>  HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/"
>  LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
> @@ -10,16 +7,14 @@ SECTION = "libs"
>  DEPENDS = "libtraceevent bison-native flex-native"
>
>  SRCREV = "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
> -SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
> -           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
> -           "
> +SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[doc] = ",-Ddoc=false,asciidoc-native xmlto-native"
> +PACKAGECONFIG[samples] = ",-Dsamples=false"
> +PACKAGECONFIG[utest] = ",-Dutest=false,cunit"
>
> -inherit pkgconfig bash-completion
> +EXTRA_OEMESON = "--bindir=${sbindir}"
>
> -do_compile:prepend() {
> -    touch ${S}/src/sqlhist.tab.c
> -}
> +inherit meson pkgconfig bash-completion
>
> -do_install() {
> -    oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
> -}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243855): https://lists.openembedded.org/g/openembedded-core/message/243855
> Mute This Topic: https://lists.openembedded.org/mt/120844481/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

