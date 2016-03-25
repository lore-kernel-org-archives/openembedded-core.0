Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6312365CB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 09:07:23 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id n5so78626847pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QE5vwm4koGo/5RaBFeCBTTp+ZAAx3SKQpj6spQhp0I4=;
	b=cxZziYN4BQzlRwGv6rTQFCfILUd28piHXeAXAA/BZFwOOFzT2EHuftDuxzCgy9MuWE
	Sm3CQchphU2QSIL1ps4GM0+yXFg26bKdXGYGXYyUukvqnj/DtPgWgFXcApu0/hgT/54F
	+rPQ6SPjFk84SdMgk1/7kBAJohlzH0uqTofxR7XGZhbDyPLrOn7LdlJYbptTXs2nEsSH
	jhXDNfEXMELPAM6a8xwwxl+JVoaq5KZ0gFC9Pvts1CE1k8YOcoKJkEdfbXuvBcjbX1bU
	GE6XubfcbbXKOaLgAnlPMUXZxGMw6KOJ1zs5avIKcwZ0d5qOZsd8boyVXPUggUTckfFJ
	XNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QE5vwm4koGo/5RaBFeCBTTp+ZAAx3SKQpj6spQhp0I4=;
	b=KdGllEOCbGrh4WBDeS6KTzj9XO8SOIZibp3BRfuyjH0X7e9smkwNinyv5/PT+jKNdb
	ZAz9UMCGuTHsqNki6ulibgllJ+WbD5TcyOj581TELK6Zd+9RbfuHGpLmqRZSUgwmAlaB
	s6HujljQl3pZdzZ/BqJq6c2D0KhQFo+3PNZJ8dy85sTZfe3smXvLyQc3r9t2KcxlZ+On
	G7mPuOv90pYrfzRFj5v+1Rlr63ebNXmNVNZZsqeZOh1V5/M+hp1TOGgJYXAxwohdoM3q
	w31TMqLlqr9skhGs2dSDJe/rPjvD5qCMdBN1O2diSNnX+oVMifb+ZFr4O1wOSa1DxQqb
	v3ag==
X-Gm-Message-State: AD7BkJKdM2AOnVBJrnVzsulyI0DokhyCgPOdYt8bbDajqYCLgl1fgrPj5gICrWaIEcID/w==
X-Received: by 10.98.15.135 with SMTP id 7mr19291690pfp.142.1458896844032;
	Fri, 25 Mar 2016 02:07:24 -0700 (PDT)
Received: from nathanbox.home.gateway ([101.162.5.44])
	by smtp.gmail.com with ESMTPSA id
	yx1sm15066149pac.29.2016.03.25.02.07.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Mar 2016 02:07:22 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 19:07:12 +1000
Message-Id: <1458896832-7388-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] u-boot.inc: Add sub-dir support for SPL_BINARY
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
X-List-Received-Date: Fri, 25 Mar 2016 09:07:23 -0000

Add support for the SPL_BINARY variable to handle sub directories. In
some cases the SPL binary that needs to be deployed is only built to the
spl/ directory in U-Boot. So that a sub directory can be specified in
the SPL_BINARY variable, handle the case so that the deploy code uses
the basename of the path specified in SPL_BINARY.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 48be71d..3ba866d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -50,8 +50,9 @@ UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
 # deploy directory.  For those versions they can set the following variables
 # to allow packaging the SPL.
 SPL_BINARY ?= ""
-SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
-SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
+SPL_BINARYNAME ?= "${@os.path.basename(d.getVar("SPL_BINARY", True))}"
+SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
+SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}"
 
 # Additional environment variables or a script can be installed alongside
 # u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
@@ -166,8 +167,8 @@ do_install () {
                     if [ $j -eq $i ]
                     then
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARY}-${type}
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARY}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
                     fi
                 done
                 unset  j
@@ -175,7 +176,7 @@ do_install () {
             unset  i
         else
             install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
         fi
     fi
 
@@ -257,9 +258,9 @@ do_deploy () {
                      if [ $j -eq $i ]
                      then
                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
-                         rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARY}-${type}
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARY}
+                         rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}
                      fi
@@ -269,8 +270,8 @@ do_deploy () {
              unset  i
          else
              install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-             rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+             rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
          fi
      fi
-- 
2.7.0


