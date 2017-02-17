Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0BA7733D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 19:53:59 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id q39so6290728wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 11:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=al5HRRfHkgS+j4HwqLGrQKSZ/7APxK4HX3OFzqTJsgo=;
	b=t1puoy3cWJDG2ZbHPSkd3d5u0VrbEgDltKLxgUUbnv8G5I000zgydf9raS5nw7wpT/
	kKG9+8dwzdMRm5wG7d+Dfkasu0hfwgm38ZOmto+Y3eEnhoRCxsWwRc7WKnXmM0kz+Fea
	d8G0Qp9KRBTOA5R+fNIkIQ9puL2Ir1hE73zVJOi/UoWITPbyM27Sb2hWhcKRzPY6UezQ
	dMG+8FeEgz8qdI9E7VKs6kuTM9vlRl0zc0NuA53+Y/Phoo1C83vW+c4i92hLV8dWP8rf
	4fhVmMaXBEpYAOFCo2dqIlJ14BeyUmHRZg7galf0PUZdvroYFkFM73xghWFs8p7A6ROL
	uVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=al5HRRfHkgS+j4HwqLGrQKSZ/7APxK4HX3OFzqTJsgo=;
	b=t7NtiUumpvFFPQ8HImno2vZawMH0I55jM1X+suSd3L5uD1Brb2SRig0PULR3watLMn
	wMGbY/kQPl7fyPKbKRZT9eo8EKtTAjLP52sfJknF/7oex4eNOfmWnz4lJYz3/jNGNA1P
	B1t68X6QdAbN8iJorqT3s16JE6P0pXZ/lEIbZNzz2uWqacHi8w22Ru7Ms3Pm+N+x8upf
	YnPlRCBMs6x9allbirAocVg4Rdck4ZcNyd/7OkpMIihBGsPAuuJ71Xpk9A29HseY9o0d
	Oo+y/uMMbViEZpYmLAkeEhkvn8BG+blZdCoi7ZUYDAyGwqFO8J07nTa2mfPXCyoTgWvn
	uL5Q==
X-Gm-Message-State: AMke39nSN1xlsiWsEdf9qerf6uPOmgGVWeJJioEBE947NXnRAiB1wNa8BEkq586eD8c8wg==
X-Received: by 10.223.150.54 with SMTP id b51mr3689189wra.171.1487361239770;
	Fri, 17 Feb 2017 11:53:59 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	m80sm2841613wmi.34.2017.02.17.11.53.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 11:53:58 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 21:50:52 +0200
Message-Id: <1487361052-30521-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] LSB 4.1: lsb_release script incompatible with busybox head and find
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 19:54:01 -0000

Busybox implementation only supports head -1 option if ENABLE_INCLUDE_SUSv2
or ENABLE_FEATURE_FANCY_HEAD configuration options are enabled. Also the -and
option for find is only supported if ENABLE_DESKTOP configuration option is
enabled. These configuration options are not enabled in several builds, which is
why this patch is needed.

[YOCTO #11041]

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 ...elease-to-work-with-busybox-head-and-find.patch | 38 ++++++++++++++++++++++
 meta/recipes-extended/lsb/lsb_4.1.bb               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch

diff --git a/meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch b/meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
new file mode 100644
index 0000000..0175752
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
@@ -0,0 +1,38 @@
+From cba901945c5a6da9586550498f8e3787c57c3098 Mon Sep 17 00:00:00 2001
+From: Athanasios Oikonomou <athoik@gmail.com>
+Date: Fri, 17 Feb 2017 21:04:04 +0200
+Subject: [PATCH] fix lsb_release to work with busybox head and find
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
+
+diff --git a/lsb_release b/lsb_release
+index e7d6024..233b8c1 100755
+--- a/lsb_release
++++ b/lsb_release
+@@ -209,7 +209,7 @@ EASE ($DISTRIB_CODENAME)"
+             || [ -n "$(echo $DISTRIB_DESCRIPTION |                            \
+                        sed -e "s/.*$DESCSTR_DELI.*//")" ]
+         then
+-            TMP_DISTRIB_DESC=$(head -1 $FILENAME 2>/dev/null)
++            TMP_DISTRIB_DESC=$(head -n 1 $FILENAME 2>/dev/null)
+             [ -z "$DISTRIB_DESCRIPTION" ]                                     \
+                 && DISTRIB_DESCRIPTION=$TMP_DISTRIB_DESC
+         else
+@@ -249,10 +249,10 @@ GetDistribInfo() {
+         then
+             CHECKFIRST=$(find $INFO_ROOT/ -maxdepth 1                         \
+                    -name \*$INFO_DISTRIB_SUFFIX                               \
+-                   -and ! -name $INFO_LSB_FILE                                \
+-                   -and -type f                                               \
++                   -type f                                                    \
+                    2>/dev/null                                                \
+-                   | head -1 ) # keep one of the files found (if many)
++                   | grep -v $INFO_LSB_FILE                                   \
++                   | head -n 1 ) # keep one of the files found (if many)
+         fi
+         InitDistribInfo $CHECKFIRST
+     fi
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index ece0eab..b4e8832 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -15,6 +15,7 @@ RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
+           file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
            file://init-functions \
            file://lsb_killproc \
            file://lsb_log_message \
-- 
2.1.4


