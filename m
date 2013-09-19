Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id A026F61013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:48:55 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id q4so5846513qcx.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=N5ksxk3Xzs8IE2zY+pzT6/qhyzKABhlme7mBl9eqQo8=;
	b=vMLNp1UXKfdMNDu3theRbH73UYnGLeNPppwlwecN2fpxI4zecnbsRZsacUQUo37bs9
	iPw8vcCBeAI0AdiL6t2cqAIdLwBde7n8aWR6ucgIQVi4Oo1jxwgmTTKKNIOQ2uCxM2FU
	aQEl/V0OKFJ+1yeDJC/QMRdHvKT9QmbvKO6skwqUKGuHrGSjB6d9+nz8AcVwIx7DqXo2
	VfI1Xl+PMQ1QE0JevHV7Yy+6OCybo0xaQPlkBh9+iR2iHjlIF6NFqZje1WeZD3DCOcnL
	fQgVBMgEuOmyoTO8G9deV1BkauTM3BjecGRvwv1NxQST+TuBK3ujEJq2mAOVjm7Vl98p
	P31A==
X-Received: by 10.49.58.174 with SMTP id s14mr139505qeq.73.1379623737459;
	Thu, 19 Sep 2013 13:48:57 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id h20sm13258086qen.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 13:48:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 17:48:36 -0300
Message-Id: <1379623718-29690-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
References: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] uboot-config.bbclass: Use an annonymous python function
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
X-List-Received-Date: Thu, 19 Sep 2013 20:48:55 -0000

The processing needs to happen per recipe and thus it ought to use
annonymous python function instead to be triggered at event.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

 meta/classes/uboot-config.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index fc37620..44b46ff 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -7,14 +7,12 @@
 #
 # Copyright 2013 (C) O.S. Systems Software LTDA.
 
-addhandler uboot_config_eventhandler
-uboot_config_eventhandler[eventmask] = "bb.event.ConfigParsed"
-python uboot_config_eventhandler() {
-    ubootconfigflags = e.data.getVarFlags('UBOOT_CONFIG')
+python () {
+    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
     if not ubootconfigflags:
         return
 
-    ubootconfig = (e.data.getVar('UBOOT_CONFIG', True) or "").split()
+    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
     if len(ubootconfig) > 1:
         raise bb.parse.SkipPackage('You can only have a single default for UBOOT_CONFIG.')
     elif len(ubootconfig) == 0:
@@ -31,9 +29,9 @@ python uboot_config_eventhandler() {
 
         if ubootconfig == f:
             bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
-            e.data.setVar('UBOOT_MACHINE', items[0])
+            d.setVar('UBOOT_MACHINE', items[0])
 
             if items[1]:
                 bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
-                e.data.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
 }
-- 
1.8.4.rc3


