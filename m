Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 105D778C30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:40:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6QEe62q001635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 07:40:06 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 26 Jul 2018 07:40:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 26 Jul 2018 22:50:21 +0800
Message-ID: <1532616621-20871-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] distutils/distutils3: do not try to fetch code during do_configure
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
X-List-Received-Date: Thu, 26 Jul 2018 14:40:07 -0000
Content-Type: text/plain

For distutils3, any setup.py invoking will cause setup_requires
argument to trigger a code fetching. Since the following commit
applied in oe-core, code fetching occurs during do_confugire
before the do_compile.
...
b805cef distutils: clean the build tree in do_configure
...

Refer what do_compile did, add var-NO_FETCH_BUILD to do_configure.

Sync with distutils3, add do_configure to distutils also.

[YOCTO #12084]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/distutils.bbclass  | 9 ++++++++-
 meta/classes/distutils3.bbclass | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 3cf1d6b..e7d48ab 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -9,6 +9,13 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
+distutils_do_configure() {
+        if [ "${CLEANBROKEN}" != "1" ] ; then
+                NO_FETCH_BUILD=1 \
+                ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean ${DISTUTILS_BUILD_ARGS}
+        fi
+}
+
 distutils_do_compile() {
          NO_FETCH_BUILD=1 \
          STAGING_INCDIR=${STAGING_INCDIR} \
@@ -80,6 +87,6 @@ distutils_do_install() {
 	fi
 }
 
-EXPORT_FUNCTIONS do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
 
 export LDSHARED="${CCLD} -shared"
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index d01d9d7..1d0c54a 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -12,6 +12,7 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
 
 distutils3_do_configure() {
 	if [ "${CLEANBROKEN}" != "1" ] ; then
+		NO_FETCH_BUILD=1 \
 		${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean ${DISTUTILS_BUILD_ARGS}
 	fi
 }
-- 
2.7.4


