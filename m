Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 526AA731C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R5pn7j023580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:51:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 22:51:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 13:52:06 +0800
Message-ID: <0afb5f75385876d2ecbca040449289bb39fae4d7.1469598081.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1469598081.git.Qi.Chen@windriver.com>
References: <cover.1469598081.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] distutils: fix to avoid file-rdeps QA issue
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
X-List-Received-Date: Wed, 27 Jul 2016 05:51:49 -0000
Content-Type: text/plain

For some nativesdk python packages, we would sometimes have the following
QA issue.

WARNING: nativesdk-python-django-1.8.8-r0 do_package_qa: QA Issue: /opt/windriver/wrlinux/9.0-qemux86/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/django-admin contained in package nativesdk-python-django require\
s /opt/windriver/wrlinux/9.0-qemux86/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/env, but no providers found in RDEPENDS_nativesdk-python-django? [file-rdeps]

The problem is that in distutils.bbclass (and distutils3.bbclass), we replace
${STAGING_BINDIR_NATIVE}/python-native/python with ${bindir}/env. In nativesdk
situation, ${bindir} is not /usr/bin, and this causes the QA issue.

Fix this problem by hardcoding '/usr/bin/env'.

Usually, we don't like hardcoding. But as far as I can see, /usr/bin/env is
a little special. We skip the 'file-rdeps' QA checking for '/usr/bin/env'
dependency. Besides, scripts in many packages do use '/usr/bin/env'. So we
should assume it's there in our system.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/distutils.bbclass  | 4 ++--
 meta/classes/distutils3.bbclass | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 857572d..e74cd81 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -44,7 +44,7 @@ distutils_do_install() {
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
-                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:/usr/bin/env\ python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
@@ -53,7 +53,7 @@ distutils_do_install() {
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
-                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:/usr/bin/env\ python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index a6720c5..1132f72 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -47,14 +47,14 @@ distutils3_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:/usr/bin/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:/usr/bin/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
-- 
1.9.1


