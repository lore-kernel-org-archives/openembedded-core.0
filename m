Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TgYRc-0003Tn-SU
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:12:44 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.78])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 887D9401A2;
	Thu,  6 Dec 2012 10:14:05 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 10:49:27 +0100
Message-Id: <1354787367-18543-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354787367-18543-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1354787367-18543-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>,
	Lukas Bulwahn <Lukas.Bulwahn@oss.bmw-carit.de>
Subject: [PATCH] distutils: Replacing path to native python by path to python in the image to support python packages with console-script setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 10:12:46 -0000

From: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>

When using distutils for a python package based on a python-setuptools
installation script that sets up a console script, the header
of the console script created by setuptools points to the
python-native path.

The console scripts are commonly executed in the image, but not
in the sysroot environment. Therefore, the header of the
console scripts should point to the python interpreter in the
image.

Setuptools does not allow to set the path of the python
interpreter via some command-line argument.
Hence after the installation script ran, the distutils
class replaces the path in the console script files created by
the installation.

Signed-off-by: Lukas Bulwahn <Lukas.Bulwahn@oss.bmw-carit.de>
---
 meta/classes/distutils.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 552e5f3..f67297e 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -47,12 +47,14 @@ distutils_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/python:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/python:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
@@ -64,7 +66,6 @@ distutils_do_install() {
         #
         if test -e ${D}${datadir}/share; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
-            rmdir ${D}${datadir}/share
         fi
 }
 
-- 
1.7.9.5



