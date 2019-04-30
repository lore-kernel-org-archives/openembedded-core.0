Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 7734F7DBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 02:34:09 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id D34B51C0687;
	Tue, 30 Apr 2019 14:34:08 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 14:34:05 +1200
Message-Id: <20190430023405.29459-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] distutils: Run python from the PATH in the -native case as well
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
X-List-Received-Date: Tue, 30 Apr 2019 02:34:09 -0000

The python distutils generate a python wrapper script for each package.
These python scripts have shebang lines pointing to the python executable.
In our case, this is a fully-qualified path to python-native in the
recipe-sysroot-native.

Ubuntu 18.04 restricts the useful length of the shebang line to 125
characters, and Ubuntu 16.04 restricts it to 77. In both cases, the
staged python script fails to run due to the length of the path to
the python-native executable.

Replace the shebang line with:

    #!/usr/bin/env python

We were already doing this for on-target distutils components.
This change applies the sed-line to -native distutils components as
well.

The python executable must be in the PATH.
Client components must inherit pythonnative.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/distutils.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 9862731493..e7d79271e3 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -53,18 +53,14 @@ distutils_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                if [ ${PN} != "${BPN}-native" ]; then
-			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
-		fi
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if [ -e ${D}${sbindir} ]; then
             for i in ${D}${sbindir}/* ; do \
-                if [ ${PN} != "${BPN}-native" ]; then
-			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
-		fi
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
-- 
2.17.1


