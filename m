Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AA6F076FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 10:51:08 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Fri, 4 Sep 2015
	12:51:03 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Sep 2015 12:51:00 +0200
Message-ID: <1441363860-25700-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy] icu: CVE-2014-8146-CVE-2014-8147
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
X-List-Received-Date: Fri, 04 Sep 2015 10:51:13 -0000
Content-Type: text/plain

CVE-2014-8146 icu: heap overflow via incorrect isolateCount
CVE-2014-8147 icu: integer truncation in the resolveImplicitLevels function

References:
[1] https://github.com/pedrib/PoC/raw/master/generic/i-c-u-fail.7z
[2] https://www.kb.cert.org/vuls/id/602540
[3] http://bugs.icu-project.org/trac/changeset/37080
[4] http://bugs.icu-project.org/trac/changeset/37162

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch  | 49 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_53.1.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch

diff --git a/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch b/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch
new file mode 100644
index 0000000..2460357
--- /dev/null
+++ b/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch
@@ -0,0 +1,49 @@
+icu: CVE-2014-8146-CVE-2014-8147
+
+CVE-2014-8146 icu: heap overflow via incorrect isolateCount
+CVE-2014-8147 icu: integer truncation in the resolveImplicitLevels function
+
+References:
+[1] https://github.com/pedrib/PoC/raw/master/generic/i-c-u-fail.7z
+[2] https://www.kb.cert.org/vuls/id/602540
+[3] http://bugs.icu-project.org/trac/changeset/37080
+[4] http://bugs.icu-project.org/trac/changeset/37162
+
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/common/ubidi.c b/common/ubidi.c
+--- a/common/ubidi.c	2014-10-03 18:11:20.000000000 +0200
++++ b/common/ubidi.c	2015-08-28 08:22:39.455906194 +0200
+@@ -2138,7 +2138,7 @@
+     /* The isolates[] entries contain enough information to
+        resume the bidi algorithm in the same state as it was
+        when it was interrupted by an isolate sequence. */
+-    if(dirProps[start]==PDI) {
++    if(dirProps[start]==PDI  && pBiDi->isolateCount >= 0) {
+         levState.startON=pBiDi->isolates[pBiDi->isolateCount].startON;
+         start1=pBiDi->isolates[pBiDi->isolateCount].start1;
+         stateImp=pBiDi->isolates[pBiDi->isolateCount].stateImp;
+diff -ruN a/common/ubidiimp.h b/common/ubidiimp.h
+--- a/common/ubidiimp.h	2014-10-03 18:11:16.000000000 +0200
++++ b/common/ubidiimp.h	2015-08-28 08:28:24.069163845 +0200
+@@ -1,7 +1,7 @@
+ /*
+ ******************************************************************************
+ *
+-*   Copyright (C) 1999-2014, International Business Machines
++*   Copyright (C) 1999-2015, International Business Machines
+ *   Corporation and others.  All Rights Reserved.
+ *
+ ******************************************************************************
+@@ -184,8 +184,8 @@
+ typedef struct Isolate {
+     int32_t startON;
+     int32_t start1;
++    int32_t state;
+     int16_t stateImp;
+-    int16_t state;
+ } Isolate;
+
+ typedef struct Run {
diff --git a/meta/recipes-support/icu/icu_53.1.bb b/meta/recipes-support/icu/icu_53.1.bb
index d93af68..2906e8f 100644
--- a/meta/recipes-support/icu/icu_53.1.bb
+++ b/meta/recipes-support/icu/icu_53.1.bb
@@ -11,6 +11,7 @@ ICU_PV = "${@icu_download_version(d)}"
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
+           file://icu-CVE-2014-8146-CVE-2014-8147.patch \
           "
 
 SRC_URI_append_class-target = "\
-- 
1.9.1


