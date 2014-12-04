Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C9CAC601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 16:31:17 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so23115687wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 08:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FLQMaedyenWMjRLfSFW+JinFeXsdF0pfaOfbqIq3zBI=;
	b=druVgj625Kx0PCWddS24w4QIS5EaUR1pJ24d7k3ZpLPXVNOpF2hueXUVzb+vxjNPzM
	hApf/lVraK7rwtUKwwC7ttTNXYhbLLaxfpVqkqS57Xj0B8TgkTUQEhqY9KSWnKGtqU5U
	C+3+k8CGr9/S7gH/CshTgjrM2F95csQZEJJIYKnlBeIcJXyN4Q4MJS7pU5tUjhNcHSpq
	LY8sF9Tc2V/qvjGmh1o7FxezdLnCemGV+BsHuM6c678+0Yuf8jYQg9fwuLoc2MKHM8Ao
	wqpcSnB+VGpfqMP1wxssrjjhVn22McdRxdr7lG/w5aVUhYdtHvtg6tU04sP5mKX8rZQ/
	XY1w==
X-Gm-Message-State: ALoCoQl6CTO7ldTKbgDdnxlph691oZ/7kjOrHZF/B8/pBprBK0VbVoAfHMtsSvL3OHzF8XatE06x
X-Received: by 10.180.95.68 with SMTP id di4mr22324226wib.49.1417710677772;
	Thu, 04 Dec 2014 08:31:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	dg7sm41970297wib.24.2014.12.04.08.31.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 08:31:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 16:30:47 +0000
Message-Id: <1417710647-15954-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bzip2: use subdir SRC_URI param instead of adding tasks
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
X-List-Received-Date: Thu, 04 Dec 2014 16:31:26 -0000

Instead of adding new tasks to move files around, just use the subdir SRC_URI
parameter.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 9dd9e6a..ed12277 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -8,10 +8,10 @@ LICENSE = "bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
 PR = "r5"
 
-SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
-           file://configure.ac \
-           file://run-ptest \
-           file://Makefile.am"
+SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
+           file://configure.ac;subdir=${BP} \
+           file://Makefile.am;subdir=${BP} \
+           file://run-ptest"
 
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
@@ -27,12 +27,6 @@ ALTERNATIVE_${PN} = "bunzip2 bzcat"
 
 #install binaries to bzip2-native under sysroot for replacement-native
 EXTRA_OECONF_append_class-native = " --bindir=${STAGING_BINDIR_NATIVE}/${PN}"
-do_extraunpack () {
-	cp ${WORKDIR}/configure.ac ${S}/
-	cp ${WORKDIR}/Makefile.am ${S}/
-}
-
-addtask extraunpack after do_unpack before do_patch
 
 do_install_ptest () {
 	cp -f ${B}/Makefile ${D}${PTEST_PATH}/Makefile
-- 
1.7.10.4


