Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9D83560B05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:21:47 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so952030wes.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=RQbRyYO97MN0JGv3YThlWt2jXxPtqcwThVknkN6Z4FU=;
	b=PNEMsWhvvU4BgSTlIQU6SH828+12qjcoBsuodRlsNG2YWZzXEDJ6k2MsG/D8SkLPMU
	PLUcrE7u8Bc+as0RWDsT+tALaKDRuMESFg7T8qX9OE8icFUDD7PRIe60Lpe6D7GUU2YH
	7p5tr3FTQ6U5dp3Z1+RG81WHbmmlIf2OpxTyhdAUHKv5F6r6YG0us6GujS+Bp049ep2j
	VGV/jMO0aeM7whSE5Ga+84aIP4TIHhE7zjnHXC2ix3v6dcUcmPr3RwmIVj+pIctCWDm1
	mgZYemqJiDkLetPhyiuCWzrPE2djigzNtjvrLY057MzkAAZ7W6lLQaZ3mcbr40Wtkq73
	odgQ==
X-Gm-Message-State: ALoCoQngLuTaDLwogcPHwBhuHo9zEOAXiLACShOihW9ouERxCoOBM3oHC4A2I+yb14u5tDhIFchF
X-Received: by 10.180.189.234 with SMTP id gl10mr5183931wic.56.1403641307755; 
	Tue, 24 Jun 2014 13:21:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gp15sm2696215wjc.10.2014.06.24.13.21.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 13:21:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 21:21:32 +0100
Message-Id: <1403641292-20161-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] cmake.bbclass: restore OECMAKE_SOURCEPATH
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
X-List-Received-Date: Tue, 24 Jun 2014 20:21:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some packages put their CMakeLists.txt file in a subdirectory, so assuming that
it is in ${S} won't work.

Restore OECMAKE_SOURCEPATH (defaulting to ${S}) so that the location of
CMakeLists.txt can be set if required.

Based on a patch by Miroslav Keš <miroslav.kes@gmail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index c9c15f3..ab2adec 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -1,3 +1,6 @@
+# Path to the CMake file to process.
+OECMAKE_SOURCEPATH ?= "${S}"
+
 DEPENDS_prepend = "cmake-native "
 B = "${WORKDIR}/build"
 
@@ -65,8 +68,8 @@ EOF
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
-		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
+	if [ "${OECMAKE_BUILDPATH}" ]; then
+		bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
 	fi
 
 	if [ "${S}" != "${B}" ]; then
@@ -84,7 +87,7 @@ cmake_do_configure() {
 
 	cmake \
 	  ${OECMAKE_SITEFILE} \
-	  ${S} \
+	  ${OECMAKE_SOURCEPATH} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
 	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
-- 
1.7.10.4


