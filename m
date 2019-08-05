Return-Path: <prvs=113152c95=Andreas.Obergschwandtner@skidata.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Aug 2019 14:43:49 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0B97ED8E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1565016231; x=1596552231;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=208CT7lwuNCE4+ZIregii/jDSo1RssBh7ovLX1qPM3o=;
	b=ZWmNcrayMRtF9lE2pMTjzb5+shj0dm4nTzNBHlrr2pqzM4Ow6VjBRHC7
	zxW8dr6GckRLWFZXlF8u76T24mt6wGzX6RVewXV2Fu4sPU19UI9StTWyu
	m936zsdoEwf4ql51ZqZ4ddDJfxiCExgaXHg1zv1xm8YfuZ/SeRv9jQHFg
	zgBLY+BKonICxn9p0OAWya3Yq0fRwPrbxFgl9kw4g6zMwcsOs8XA0IUGj
	JOlQgFgBundSd7bRa6qb/jy+ihigyW3vqRlFUFpVIYBjMwtglI77xYJzL
	FEZLGdi3jcLPmWz8F3EsM1DUzEpiyvRRsS3ggVlh8EBnuYS5CR4/992jJ A==;
IronPort-SDR: /uI3k39q+YsTC1A2mYlMm0JCIMTBDpwvGXKM8HlD7mSP6Ghcj3jhIau8xKydQHX7OYwLbyYnWT
	HuoGCfCAjCBp62QTBFXepS85g/rdaHFZyP5vMdb8SSrYyobi18CiUAdDbbY5xokopaSOA2B523
	MJ3tRu3mFCQPo1V67QVUa1Xe3mble8TUVNcxEzsuUYEpN+0TbQRCoyQU1a4d0nTSfSW3ka++px
	PVwPdhOL/yt5ARk3HoNkaJz5PpVC7hSSQqjoY41S5KTum3igtc32D9BZjaNLjr8r8IXwD/GJaA
	LXM=
X-IronPort-AV: E=Sophos;i="5.64,350,1559512800"; d="scan'208";a="18789615"
From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2019 16:35:55 +0200
Message-ID: <20190805143555.15669-1-andreas.obergschwandtner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex4srv.skidata.net (192.168.111.82)
Subject: [meta-oe][PATCH] bzip2: set the autoconf package version to the recipe version
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
X-List-Received-Date: Mon, 05 Aug 2019 14:43:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is done to require only a single version change if bzip2
is updated and fixes also setting package version 1.0.6 for
bzip2 1.0.8.

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
---
 meta/recipes-extended/bzip2/bzip2/configure.ac | 2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb     | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/configure.ac b/meta/recipes-extended/bzip2/bzip2/configure.ac
index e2bf1bf110..b8abade2d9 100644
--- a/meta/recipes-extended/bzip2/bzip2/configure.ac
+++ b/meta/recipes-extended/bzip2/bzip2/configure.ac
@@ -1,6 +1,6 @@
 AC_PREREQ([2.57])
 
-AC_INIT(bzip2, 1.0.6)
+AC_INIT(bzip2, %BZIP2_VERSION%)
 AM_INIT_AUTOMAKE(foreign)
 AM_MAINTAINER_MODE
 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 6f86b451ae..8e9b779e67 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -29,6 +29,10 @@ ALTERNATIVE_${PN} = "bunzip2 bzcat bzip2"
 #install binaries to bzip2-native under sysroot for replacement-native
 EXTRA_OECONF_append_class-native = " --bindir=${STAGING_BINDIR_NATIVE}/${PN}"
 
+do_configure_prepend () {
+    sed -i -e "s|%BZIP2_VERSION%|${PV}|" ${S}/configure.ac
+}
+
 do_install_ptest () {
 	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
 }
-- 
2.20.1


