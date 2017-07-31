Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 43445785D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:57:11 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id z129so82527707pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AIPa3egMTd7tyzqdsSX2OacN0+OtDzYg8SSpzgdX/GI=;
	b=JWqsF5CbGSM4KUYNLz/QcyWEUiDMb9EEBmnEK7JdQ4+eYEirvA0aLAheRsEs8Bcq5S
	lBH2VNUA14iHGrkll1XGyqPlzP2drz80SYhNLzifwECrdMxTAwF37qfLa77x9E2NF03I
	jXDhvP9TVL93DRevd3cfccWVA6op+n7kygXeXVfWPCfBxBQEUFpQOV0Z42i5YT0n+Czp
	/4aY0LAIFWvHbqRoAPUKW5UDlriD03KI+oNPBkOBWBbEYSv5T2o/skLgVyO1+c3A+9/g
	7MYsGkpkYDGS1Zwdx38fqmDiZpuQy2gor2n2AL9r76OOmIHM1rzFSShj9LOZnwRCtd6f
	LZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AIPa3egMTd7tyzqdsSX2OacN0+OtDzYg8SSpzgdX/GI=;
	b=q1NFCQV4oJGKzZ0WfMjlQbWlE1lB7AxyOkHN5Q5NOdDxTZEjXBmd8vfwFtwpZdJgv8
	Fro409IPPKsduFF8Oxq78YjB/IzdtvbK1281Uayz/Jfy2QPi8nSmiTBqgm1Ba77/hoCR
	mla9fHtPw605g18U1qGs5WRgqUb4ZAOzSOOt6GDWtOV4xaY2mElCYEVFDZFWXYkPN0b7
	iM8N/ezJST6I/eifiQFLmBtq4jcAquK1dR82XnSu1146SlCK2eU8xQOBkx3K4RzyAh9z
	FUoe8oOjhQN/z3BMMmAD5VBxs+sy9RpS1aD4pv9Mxkyoq+O7QZg50m6zS1voMGWi1ms7
	AHvQ==
X-Gm-Message-State: AIVw1128JQSsa5Xii4//dRiIRzZ9uk74psIye/DxM8Yba+v51cyKIn1c
	9AWf6oZDtj12Iu0PaJ8=
X-Received: by 10.84.131.163 with SMTP id d32mr17045957pld.16.1501513033139;
	Mon, 31 Jul 2017 07:57:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FE53.dip0.t-ipconnect.de.
	[93.232.254.83])
	by smtp.gmail.com with ESMTPSA id s8sm5823850pfd.77.2017.07.31.07.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 07:57:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 16:56:55 +0200
Message-Id: <beee6b5713f8f497cb6be89840038d9fb1d58dfd.1501512975.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.d5ac661bf06568770da90f3e88828979c242547e.1501512975.git-series.patrick.ohly@intel.com>
References: <cover.d5ac661bf06568770da90f3e88828979c242547e.1501512975.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 2/2] autoconf-archive: simplify and fix recipe
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
X-List-Received-Date: Mon, 31 Jul 2017 14:57:12 -0000

The COPYING file specifies pure GPLv3, not GPLv2 & GPLv3, with the
autoconf exception in COPYING.EXCEPTION. OE-core currently has
GPL-3.0-with-GCC-exception for this in meta/conf/licenses.conf, so
this is used here despite the deprecation note for that license
identifier in https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.

All of the explicit dependencies seem unnecessary, and RDEPENDS_${PN}
doesn't do anything for native recipes either, so all of that gets
removed.

It also built fine without the m4 and parallel build workarounds.

There's no need to have a separate .inc file.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           | 13 -------------
 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 19 ++++++++++---------
 2 files changed, 10 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
deleted file mode 100644
index 4f63e0f..0000000
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-LICENSE = "GPLv3"
-HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
-SECTION = "devel"
-
-DEPENDS += "m4-native"
-DEPENDS_class-native = "m4-native gnu-config-native"
-DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
-RDEPENDS_${PN} = "m4 gnu-config"
-
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-
-inherit autotools
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index 0a1a771..104dc38 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -1,13 +1,14 @@
-require autoconf-archive.inc
-
-
-PARALLEL_MAKE = ""
-
-LICENSE = "GPLv2 & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
+SUMMARY = "a collection of freely re-usable Autoconf macros"
+HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
+SECTION = "devel"
+LICENSE = "GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
 SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
 
-EXTRA_OECONF += "ac_cv_path_M4=m4"
+inherit autotools
+
 BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

