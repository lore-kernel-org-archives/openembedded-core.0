Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D950C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.3417.1637741321443055317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JWJkjnnv;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so1348628wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9h5bbm54UXVrt3DoL3XE5uCDEycw1cFpsh3UArzsOlo=;
        b=JWJkjnnvGTaHpu91Z3WeTjtDkWjM1TgMGKe4C4bxq24+AwSd1V9mBrAxhME8zyUWCI
         oNht/wjUy+mOzzY3OHy0Td9BEbnNXqMRAbagebufUjhpf1nOuoE33dHcy7/E5WFdTlon
         G13GFVleZZBdd1ghoP1WlcRMRQdZ1RfXt2+TyOxzBZLD4pRpL0kwAulcPgnsBXbpsZGo
         9GubffnUmsb24p1W2qqwmL2dWIX1UehMT7wGjzElCSW+y6ZusXdraNfKNXe0Jxctqs6j
         X8Khr3tnFNC8GGkYbjpo002YYzPRyzDkey7UmRVQDfkuEoQInLDCxrJQ6FfbbXljRdUD
         YqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9h5bbm54UXVrt3DoL3XE5uCDEycw1cFpsh3UArzsOlo=;
        b=ibPhRsLSUzSWoiuEAar26aw6X7MNDGeU4IqxLYBz0F5GSCJBgyI5273dSZ/6Nm3DdJ
         8ZWjU2wS3M8gVgA8q1Jjb3Zbqu4vZbteAOoL8AtR5UWY0FyvNiHo0UaPAnTveNVx2OxO
         C0KQ8QZkCsDOu6OepEMhtZYDF9CfovXlcbcAxSQBYOt8VIqKbtXRSW7+bsQKA7K/JnqS
         QTsyEQC2AKgr4VpxPJI8v2VqXET/4tOd+mhGh0UsxkM+lveap8fscIJKofJo701dN930
         FigvrtOOyyaC9IIXFVXEWRbDlC23BdHZvnf8iKyJ9+EugEo3Tz+9r0uwMNHoi1UciCDQ
         iUVA==
X-Gm-Message-State: AOAM532F80l1FKAPwFRnGADHUw/sfI4mEc2l8zOPiybp6tCuATLEGTCl
	X+4Pj3dkO0hifseFfmi3z42j5oVdPUVsVw==
X-Google-Smtp-Source: 
 ABdhPJyS7tkTD4s2UAHH+6w6gMXpmKSBQJ/3AGWcm69ZuLgtKykNVvpQUoXVCDrRzjE8oa8eNaO82w==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr12344804wmq.111.1637741319963;
        Wed, 24 Nov 2021 00:08:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/21] dpkg: replace a patch with a tweak to an already
 existing sed fixup
Date: Wed, 24 Nov 2021 09:08:18 +0100
Message-Id: <20211124080828.530981-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158667

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/dpkg/dpkg.inc           |  4 ++--
 ...kg-fsys-usrunmess.pl-correct-shebang.patch | 23 -------------------
 meta/recipes-devtools/dpkg/dpkg_1.20.9.bb     |  1 -
 3 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 74074cfdd7..80865a31a1 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -49,9 +49,9 @@ do_install:append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
 		rm ${D}${bindir}/update-alternatives
-		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
+		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-* ${D}${sbindir}/dpkg-*
 	else
-		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
+		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-* ${D}${sbindir}/dpkg-*
 	fi
 }
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch b/meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch
deleted file mode 100644
index 292b72ab5d..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 0decc62904571582147f2273fa1b521e00485dda Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 3 Feb 2021 20:47:58 +0100
-Subject: [PATCH] scripts/dpkg-fsys-usrunmess.pl: correct shebang
-
-Otherwise automake will write the full native perl path into it.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- scripts/dpkg-fsys-usrunmess.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/dpkg-fsys-usrunmess.pl b/scripts/dpkg-fsys-usrunmess.pl
-index 9220df3c0..9ce368955 100755
---- a/scripts/dpkg-fsys-usrunmess.pl
-+++ b/scripts/dpkg-fsys-usrunmess.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/perl
-+#!/usr/bin/env perl
- #
- # dpkg-fsys-usrunmess - Undoes the merged-/usr-via-aliased-dirs mess
- #
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
index 34b6bfe0a8..4c587f2bf2 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.20.
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
-           file://0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch \
            file://0014-arch-Add-support-for-ARCv2-CPU.patch \
            "
 
-- 
2.20.1


