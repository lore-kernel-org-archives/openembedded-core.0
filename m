Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6C26EC89
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 07:22:03 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id rd3so13221743pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 23:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/FpJvgeqVB+kG/oSNVF8Y64Cp3ORFLA9T3VDivuGG2c=;
	b=jO1lCi9HB2jqJy1r8k+Vm5q8w0LOFx2yocArfAoFPN1D0xVik0xCmOrTeUzxGdebQf
	36ELpQ1WOTRzKI04SKWz4sTKXPsPVpzUfHbSM9rwHbr4H6YA8ApUSMdsroEzeK3WJB+Y
	ucCRH9h8vxmAgp71lAPaVCC0K0on1ZWQF5okTqoUatrf4Yxy0LexqndbKOXErCLOKFpD
	tcFY1JkcKYWnA1ybkxhwo09I/9FqhIFXX4Ny8+kfDbawzKjx0m5p3h+B6i8D4NSG3qXN
	QXVOFp73d7Pb3E0Ugsxl+7Mt9yWTOt7AzqdfmooinqXqOg5sx+UKijFPBxUDok5rqxiO
	oTYg==
X-Received: by 10.68.197.133 with SMTP id iu5mr13926268pbc.132.1392448924150; 
	Fri, 14 Feb 2014 23:22:04 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id vf7sm24328313pbc.5.2014.02.14.23.22.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Feb 2014 23:22:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 23:23:24 -0800
Message-Id: <1392449004-2212-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH] rootfs.py: Check for LDCONFIGDEPEND being empty string
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
X-List-Received-Date: Sat, 15 Feb 2014 07:22:04 -0000

We override LDCONFIGDEPEND to be empty string for uclibc
however the current check is for it being None as a result
the function is still executed but ldconfig-native is not
built as dependency for rootfs when building with uclibc

Fixes errors like below

File:
'/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/oe/rootfs.py',
lineno: 191, function: _run_ldconfig
     0187:    def _run_ldconfig(self):
     0188:        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
     0189:            bb.note("Executing: ldconfig -r" +
self.image_rootfs + "-c new -v")
     0190:            self._exec_shell_cmd(['ldconfig', '-r',
self.image_rootfs, '-c',
 *** 0191:                                  'new', '-v'])

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 6114f56..285c769 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -185,7 +185,7 @@ class Rootfs(object):
                         self._handle_intercept_failure(registered_pkgs)
 
     def _run_ldconfig(self):
-        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
+        if self.d.getVar('LDCONFIGDEPEND', True) != "":
             bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v'])
-- 
1.8.5.5


