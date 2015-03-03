Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A62BC6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 11:01:56 +0000 (UTC)
Received: by widem10 with SMTP id em10so21700473wid.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rf8GIlAQtUXE5P6VKcoeZHDkk4/hl9XExXmhjbKc9KI=;
	b=FEsyoM/o3sXyJpo5Nb4oVzzGS25EUjMtnmHBRJySaMuO4I6/C/DfHhATHSUDLn7L5L
	NSMT+fvbFeR6dhi2IG0BRLvv88qR/4chvNAsXBOEFrURLOkWKLzgY5Pqxj5rrjGhroAR
	rgD1GsQFb4pEbLNavZSowu+uW9tRbyu3hiVCZwLItw0iiGiH3vBrIaZOdP+0XPMOTExU
	9a5GFfMGUcCbM5t/oY4iu2yNMxDvO/KTtP8dlBrejHouiJLY8JRdBpd6mCVgT35t45mE
	VXULJexr4jC7/PHpsYNQgpy0YpoCSKX0FSlIC2J40PWK0hzgeId4syJHM0QADKUO8g3J
	JgbA==
X-Received: by 10.194.193.9 with SMTP id hk9mr69893947wjc.42.1425380517891;
	Tue, 03 Mar 2015 03:01:57 -0800 (PST)
Received: from PCL140002.eurogiciel.fr (130.167.26.109.rev.sfr.net.
	[109.26.167.130])
	by mx.google.com with ESMTPSA id fu1sm1963451wic.2.2015.03.03.03.01.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 03:01:57 -0800 (PST)
From: Baptiste DURAND <baptiste.durand@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 12:01:17 +0100
Message-Id: <1425380477-16279-1-git-send-email-baptiste.durand@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] sanity.bbclass: Add syntax check on MACHINE variable
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
X-List-Received-Date: Tue, 03 Mar 2015 11:02:00 -0000

MACHINE variable should not contain uppercase characters.

Having uppercase in Machine name can lead to this kind of error : (here Machine is set to nuc-E3815)
ERROR: initramfs-live-boot not found in the base feeds (nuc_E3815 corei7-64-intel-common corei7-64 core2-64 x86_64 noarch any all).

Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
---
 meta/classes/sanity.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 31b99d4..1fa2e58 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -713,12 +713,17 @@ def check_sanity_everybuild(status, d):
 
     # Check that the MACHINE is valid, if it is set
     machinevalid = True
-    if d.getVar('MACHINE', True):
-        if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
-            status.addresult('Please set a valid MACHINE in your local.conf or environment\n')
-            machinevalid = False
+    machinevar = d.getVar('MACHINE', True)
+    if machinevar:
+        if machinevar == machinevar.lower():
+            if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
+               status.addresult('Please set a valid MACHINE in your local.conf or environment\n')
+               machinevalid = False
+            else:
+               status.addresult(check_sanity_validmachine(d))
         else:
-            status.addresult(check_sanity_validmachine(d))
+            status.addresult('Please set a valid MACHINE : uppercase characters are not allowed in machine name : ${MACHINE} should be ' + machinevar.lower() + ' \n    Please rename file conf/machine/${MACHINE}.conf as conf/machine/' + machinevar.lower() + '.conf\n')
+            machinevalid = False
     else:
         status.addresult('Please set a MACHINE in your local.conf or environment\n')
         machinevalid = False
-- 
1.8.1.4


