Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61398CD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.27142.1694943555933954670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiD74Yl2;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso59416931fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943554; x=1695548354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJe8g6RhOARaN6FISWY0rNffu4kYDY4uBi0QNM4AX5I=;
        b=OiD74Yl2csKkie+8MdVVFaq3f1/ewvGzBcg0K9C2e6oUPQw/66dl844aIc3npX/4TB
         HP/ytG4TcojyoU8EmY2SPlsfeNlkUXcZ2CswR+gMFLwVVFn0OOfRe6vH7wW3aTdUhesg
         kg6C/b/wsPMpBke3QYCEBbNAU+wj81H1p65BHNo4UehQNrF/uNr5kZftowdvdYOd2+hL
         K2pYkzbPrFnrtRmaT8NjHkrq8lLIbGBsMK7o7ogh9GqOcRDPuSYstR8ADAHi/KFxCuOf
         LSauLTOpvKk8p+0ZVJHPMCg1phFrZwSq47WgPX/TqTPMSNv2h03+39ZcdA9RvJoRNADl
         7L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943554; x=1695548354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJe8g6RhOARaN6FISWY0rNffu4kYDY4uBi0QNM4AX5I=;
        b=ra7RrLWK1DEidovupvawNW3wSniB+qCHCrzcwd3V3dK9OVQq2TSoSpNB6ceQllfYqH
         o4Dqy2aSjwQt4RwcpagbyNDPkUIdoZSEdzHpDEOnjuX7Rb2vV+QyrCi+4eZ0D0UD/ume
         U40K/q9Kcmo8TwcGwMOOi+2ukxM1Bg2P35imGPj/eKhDW1DrDWIP7xbuFtofiIPw0ed1
         BUMsLpK6LjPKbmQuc9li0BMW5k9imM+S1BBOFhQiRYHuHudPNqrVzCbKsBaShojIaNgO
         L8IglHc2K7tZp2XzA/+n0whIZQrov2gs/TIym10dIqzv+iHBgTkHfj6JOtvK+GtZPeTv
         ELzg==
X-Gm-Message-State: AOJu0YzuSeFYhkEw9SwSwAtC1urAIIDlpgJJoXfQrQCtz4yUa9TdvSsK
	8YH7VSjHjtGuFOJQH0S2XRSVVm2UXM8=
X-Google-Smtp-Source: AGHT+IE168UoBlIllqWtx7RzqP+yR5Wc7aEx010iUBREgJp/EVLxL/DlLlTOxhOWtA79wAqfSFfSsw==
X-Received: by 2002:a2e:9dc1:0:b0:2b6:df71:cff1 with SMTP id x1-20020a2e9dc1000000b002b6df71cff1mr4430454ljj.52.1694943553943;
        Sun, 17 Sep 2023 02:39:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/29] sysstat: update 12.6.2 -> 12.7.4
Date: Sun, 17 Sep 2023 11:38:47 +0200
Message-Id: <20230917093901.428214-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187788

Old homepage is no longer being updated and will be taken down soon.
Let's switch to git, as the new homepage is still being set up.

Upstream has confirmed that odd-even version scheme is no longer in place:
https://github.com/sysstat/sysstat/issues/373

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...figure.in-remove-check-for-chkconfig.patch | 10 ++--
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 -------------------
 .../{sysstat_12.6.2.bb => sysstat_12.7.4.bb}  | 11 ++---
 3 files changed, 10 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
 rename meta/recipes-extended/sysstat/{sysstat_12.6.2.bb => sysstat_12.7.4.bb} (85%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 4067bb983bc..84383f955f9 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,7 +1,7 @@
 From 1590cc614aaf0fb81cd804414d6c9d5a9227352c Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
-Subject: [PATCH] configure.in: remove check for chkconfig
+Subject: [PATCH] configure.ac: remove check for chkconfig
 
 chkconfig can't work on cross-platform, so should remove check for it.
 
@@ -9,13 +9,13 @@ Upstream-Status: Inappropriate [ embedded specific ]
 
 Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
 ---
- configure.in | 3 ++-
+ configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
+diff --git a/configure.ac b/configure.ac
 index 48b9a31..cedeb43 100644
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
  AC_SUBST(VER_XML)
  
diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
deleted file mode 100644
index a7b51f3217f..00000000000
--- a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0764cb56df4a5afdf04980c9eb6735f789f5aa42 Mon Sep 17 00:00:00 2001
-From: Pavel Kopylov <pkopylov@cloudlinux.com>
-Date: Wed, 17 May 2023 11:33:45 +0200
-Subject: [PATCH] Fix an overflow which is still possible for some values.
-
-CVE: CVE-2023-33204
-Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/954ff2e2673c]
-
-Backport Changes:
-Adopt additional changes as per following merge commit of pull request:
-https://github.com/sysstat/sysstat/commit/6f8dc568e6ab
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
----
- common.c | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/common.c b/common.c
-index a3d31a5..138920c 100644
---- a/common.c
-+++ b/common.c
-@@ -447,15 +447,17 @@ int check_dir(char *dirname)
- void check_overflow(unsigned int val1, unsigned int val2,
- 		    unsigned int val3)
- {
--	if ((unsigned long long) val1 * (unsigned long long) val2 *
--	    (unsigned long long) val3 > UINT_MAX) {
-+	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
-+		(((unsigned long long)UINT_MAX / (unsigned long long)val1 <
-+		(unsigned long long)val2) ||
-+		((unsigned long long)UINT_MAX / ((unsigned long long)val1 *
-+		(unsigned long long)val2) < (unsigned long long)val3))) {
- #ifdef DEBUG
--		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
--			__FUNCTION__, (unsigned long long) val1 * (unsigned long long) val2 *
--			(unsigned long long) val3);
-+		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
-+			__FUNCTION__, val1, val2, val3);
- #endif
- 	exit(4);
--		}
-+	}
- }
- 
- #ifndef SOURCE_SADC
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
similarity index 85%
rename from meta/recipes-extended/sysstat/sysstat_12.6.2.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.4.bb
index 335ddd5746c..134fd5cf964 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
@@ -1,25 +1,24 @@
 SUMMARY = "System performance tools"
 DESCRIPTION = "The sysstat utilities are a collection of performance monitoring tools for Linux."
-HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
+HOMEPAGE = "https://sysstat.github.io/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "console/utils"
 
-SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
+SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
            file://99_sysstat \
            file://sysstat.service \
            file://0001-configure.in-remove-check-for-chkconfig.patch \
-           file://CVE-2023-33204.patch \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
-UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+SRCREV = "1df0d61306ae826c896a5cf6f665d58c671c0498"
+S = "${WORKDIR}/git"
 
 DEPENDS += "base-passwd"
 
 # autotools-brokensep as this package doesn't use automake
-inherit autotools-brokensep gettext systemd upstream-version-is-even
+inherit autotools-brokensep gettext systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
-- 
2.30.2


