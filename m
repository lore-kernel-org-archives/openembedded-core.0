Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C891EC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:11:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.169425.1783409869236989848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b4GhlNXY;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cad8076b01so49053945ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 00:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783409868; cv=none;
        d=google.com; s=arc-20260327;
        b=Sglh9IDuK62Pu5qTJaVYg1eHYrutGuD+D/3kMtis3bnab9fa4vD79p9sis0VUM6HsX
         2Fg7rlTi+nhk/BBhqD9mlfn6CXee6BuKiYHgRl7nIXjLw5ia7CygSFQBH3CExGpDsFZf
         YyY3OYUxyiAgOLL+1sRpA1gSLYHAFvW16uD2oGaI1oAshxCCMrc4vIXMxKteP+JBccmN
         dRxcsI6LC2/7zuc9NwR3tOPBX5RS2U+G2u2O0AIXO1yATtV3e6A22F/vR24vB5THhuC4
         CPUsLqdSdGalOt2dcT90q/MM5u5ZkGjUXn+5r8BvMCWQSZ/ylXYTK6Nk+ZbvmeazUCEF
         G4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2AhFX/yfQGCN4XF2ogevxksnjmx3Yac+sbJ5rdsClb8=;
        fh=fatBUKgUxvMANN6YmcGaMx2Oa4RSAb7gLxL0txDlo18=;
        b=MrUlQRoDHQrYEVGEXdEs5QGmwAKxexkEkWVP2pxEhaetkxFi3GW8aaEebPgD0gHEa+
         wWTP800XoZpVo5vQVk6Fhj4WWmPADITgbe2KRoh5IndtdHuclUDqlKy0hfgLQ+wbkL5O
         FBR9veGGOwy4X1D2TIUFV/VDrajIPjWPBU+p68QC4siQuO0TfhoXrZh4eesDvQnXinKc
         1+ZxtOTMqXkiBa51Yv33heu0O3PokpJz7JClNf44Rgv2AokQOqjDsthd2GFRMs0YKhe7
         La/ZhAT28BIFAJE52Sp4P75G9rey4Ci3zSQ1h1ITQeazWnXLr5RrlyTN57zduA88mTU7
         EUfw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409868; x=1784014668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2AhFX/yfQGCN4XF2ogevxksnjmx3Yac+sbJ5rdsClb8=;
        b=b4GhlNXYVJ23Rr6ua0sXa+FfBSddaAPPnqFyO6zl/8UHZ/0ZkPUkAIjpUt1BvRjj5C
         sqtfg2BzbLkaZB/UvGCfqnkr0VrVz8g5jl0kDmb2i0YsPz5I6uPO6wrcUyfhhoybIl2P
         HFc8xafALhJciSRK5i4vIlKcKTY200m1jPlKfYzC3NNoMnQ0moeIxzlRfe5T5xrY2AWg
         2EligTe+Dt2s20BpU+iURTV7EV+xXCFiZYKoNddF0wcxgr2Gov5hpuDWDWW+woYZ8Va9
         jGWkwVKxLFYmtaMCz7YmKjxcy0jVdyZt3YWZRWKAWh+39U3QK8N7+gd+9Sajn9baZ9oG
         e07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409868; x=1784014668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AhFX/yfQGCN4XF2ogevxksnjmx3Yac+sbJ5rdsClb8=;
        b=Z1of4jW/jmuF0cHPsqVHmsWVyE2jgdzbtInmEezS8pbsFLJdFTbPbwYQwOrSrEE32p
         lLjpyihPx/u6UdOOemgs+UcIr2yWJpH05ZUooSSwh9FbQnFoEYbAk+fJlWUJU7HI7h1H
         C5pAjJMsgLKXVS2YmWeQPL/2wsxGPPQVgeid4ZSMscU8AYUHuWWF7a4XXy4rpEXTsHI7
         DP4XxvN+YwqMVg+roFTvaazjm1q8BkaSb+i7qFxZXrucvLS2V8OnkUj8BucUu2cFGvt0
         +J41B9Wu355XaCvmuu56uorz/jTAMgr0xpAiZRr7DzPji++eAWNkJHIZgi2Dd2Sphf3V
         WWFQ==
X-Gm-Message-State: AOJu0YzDRpiuPYdzmPxCIGPMiptNK8CaOQaVnJ/DoxP3/C2CjlBZiDnH
	QRkeiYqszQTAoDQjCxzOSdxXDkYLvjzWYrHEsMWaro2Y0GE3FHFMBlvgvFWyiee0PCRlluvzKzF
	0an3Qvb3pdlQhlGA6TEvYjBjOJjmouuE=
X-Gm-Gg: AfdE7ckiSAASj51D3PzeD+eVmtbPdH2sgjxcO4iZm3lCenrCCODvX00rZj9CSXJcSe6
	3nuF9uS9hRoWZlU2J7qBFSel8/eS+TFg0+yY8f8c2PHeo54CmCcNamepPa9Oxyye2VaWAJm4sMU
	LgQToeydSPgUQuLU8uzFQkREZ7o1JdX/GYKnW+a1RYCghITgytOYuA6SE1cX8KzPisMxV8W968M
	W8oCtDD+2RMTuYg/wMSEj1q4jcq1m1IMPB2/QAw/VHBRaGg2QFsIczlfuDjPljjte8x8TZHydtb
	hSOJy5R88n4x
X-Received: by 2002:a17:902:d50f:b0:2ca:5970:732d with SMTP id
 d9443c01a7336-2ccbf1a766amr43110005ad.41.1783409868463; Tue, 07 Jul 2026
 00:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260706210232.794171-1-jakubszczudlo40@gmail.com> <DJRT6I1TY4RN.7XFZ0925KYBS@smile.fr>
In-Reply-To: <DJRT6I1TY4RN.7XFZ0925KYBS@smile.fr>
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Date: Tue, 7 Jul 2026 09:37:36 +0200
X-Gm-Features: AVVi8CfhyzCfRWr3m1yvjM_rZZlotPWvw46_OOF97pjl59oof3QYLzcdXUx461k
Message-ID: <CA+gq5Ji6fR-W5kz4Zqp70r=rm5+aa69MM5bbXrvMOJd_1_hN-Q@mail.gmail.com>
Subject: Re: [scarthgap][PATCH v2] libgcrypt: upgrade 1.10.3 -> 1.10.4
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Hongxu Jia <hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240366

>
> Hello,
>
> On Mon Jul 6, 2026 at 11:02 PM CEST, Jakub Szczudlo wrote:
> > Release notes are here:
> > https://dev.gnupg.org/T8233.html
> > Update contains fix for CVE-2026-41989 and patch that need to be updated to
> > correct setting compile flags in new version.
> >
> > Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> > ---
> > v2:
> >  - Added new patch to fix building error with '-O2' in sysroot path for libgcrypt 1.10.4, patch
> >    was taken from wrynose and backported.
> >
> >  ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
> >  ...ilding-error-with-O2-in-sysroot-path.patch | 49 ++++++++++++++
> >  ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  4 +-
> >  3 files changed, 51 insertions(+), 66 deletions(-)
> >  delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
> >  create mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> >  rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)
> >
> > diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
> > deleted file mode 100644
> > index dee4969f35..0000000000
> > --- a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
> > -From: "simit.ghane" <simit.ghane@lge.com>
> > -Date: Tue, 7 May 2024 14:09:03 +0530
> > -Subject: [PATCH] Fix building error with '-O2' in sysroot path
> > -
> > -* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
> > -* random/Makefile.am (o_flag_munging): Ditto.
> > ---
> > -
> > -Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> > -respectively when compiling cipher and random in the filesystem
> > -paths as well if they happen to contain '-O2' or '-Ofast
> > -
> > -If we are cross compiling libgcrypt and sysroot contains such
> > -characters, we would
> > -get compile errors because the sysroot path has been modified.
> > -
> > -Fix this by adding blank spaces and tabs before the original matching
> > -pattern in the sed command.
> > -
> > -Signed-off-by: simit.ghane <simit.ghane@lge.com>
> > -
> > -ChangeLog entries added by wk
> > -
> > -Note that there is also the configure option --disable-O-flag-munging;
> > -see the README.
> > -
> > -Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123cc18454c74]
> > -
> > -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ----
> > - cipher/Makefile.am | 2 +-
> > - random/Makefile.am | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> > -index 2c39586e..a914ed2b 100644
> > ---- a/cipher/Makefile.am
> > -+++ b/cipher/Makefile.am
> > -@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
> > -
> > -
> > - if ENABLE_O_FLAG_MUNGING
> > --o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
> > -+o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> > - else
> > - o_flag_munging = cat
> > - endif
> > -diff --git a/random/Makefile.am b/random/Makefile.am
> > -index 0c935a05..340df38a 100644
> > ---- a/random/Makefile.am
> > -+++ b/random/Makefile.am
> > -@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
> > -
> > - # The rndjent module needs to be compiled without optimization.  */
> > - if ENABLE_O_FLAG_MUNGING
> > --o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
> > -+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> > - else
> > - o_flag_munging = cat
> > - endif
> > ---
> > -2.44.1
> > -
> > diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> > new file mode 100644
> > index 0000000000..d1b82ec11e
> > --- /dev/null
> > +++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> > @@ -0,0 +1,49 @@
> > +From e96df0c82e086bf348753d2d0fa37fa6191b4b14 Mon Sep 17 00:00:00 2001
> > +From: "simit.ghane" <simit.ghane@lge.com>
> > +Date: Tue, 11 Jun 2024 07:22:28 +0530
> > +Subject: [PATCH] random:cipher: handle substitution in sed command
>
> Can you name the patch file something related to its title? Here name
> and title are really different and this is confusing.
>
> > +
> > +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14]
>
> The URL does not work for me.
> You can use the official mirror:
> https://github.com/gpg/libgcrypt/commit/e96df0c82e086bf348753d2d0fa37fa6191b4b14
>
> > +
> > +* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
> > +expression.
> > +* random/Makefile.am (o_flag_munging): Likewise.
> > +--
> > +
> > +It was there earlier and accidentally removed from
> > +Makefile.am of cipher and random
> > +
> > +Signed-off-by: simit.ghane <simit.ghane@lge.com>
> > +[jk: add changelog to commit message]
> > +Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
>
> This patch needs your signed-off-by.
> > +---
> > + cipher/Makefile.am | 2 +-
> > + random/Makefile.am | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> > +index ea9014cc98..149c9f2101 100644
> > +--- a/cipher/Makefile.am
> > ++++ b/cipher/Makefile.am
> > +@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
> > +
> > +
> > + if ENABLE_O_FLAG_MUNGING
> > +-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> > ++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> > + else
> > + o_flag_munging = cat
> > + endif
> > +diff --git a/random/Makefile.am b/random/Makefile.am
> > +index c7100ef8b8..a42e430649 100644
> > +--- a/random/Makefile.am
> > ++++ b/random/Makefile.am
> > +@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
> > +
> > + # The rndjent module needs to be compiled without optimization.  */
> > + if ENABLE_O_FLAG_MUNGING
> > +-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> > ++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> > + else
> > + o_flag_munging = cat
> > + endif
> > diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> > similarity index 92%
> > rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> > rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> > index 3d49d586bb..a887dc355e 100644
> > --- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> > +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> > @@ -25,9 +25,9 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
> >             file://no-native-gpg-error.patch \
> >             file://no-bench-slope.patch \
> >             file://run-ptest \
> > -           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
> > +           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
> >             "
> > -SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
> > +SRC_URI[sha256sum] = "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268a6557e12908a90a0"
> >
> >  BINCONFIG = "${bindir}/libgcrypt-config"
> >
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>

Patch name and commit link corrected in v3:
https://lists.openembedded.org/g/openembedded-core/message/240364?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Clibgcrypt%2C20%2C2%2C0%2C120153110

Best regards,
Jakub Szczudlo

