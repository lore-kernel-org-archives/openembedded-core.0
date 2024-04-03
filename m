Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E0BCD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 13:57:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.11674.1712152645113041810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 06:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HGBRssKL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A10A1C0004;
	Wed,  3 Apr 2024 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712152643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LpBCGw2wZbvtdeTCxC4NURxkRO4pXUyK7WuSfQv8IJw=;
	b=HGBRssKL0hIOM3rKVEkOGKzNBGopG8s5KyvP+0XuhZNOBncnz7836PgQxPkvfFMAIswF7t
	akNcjMid9PjLmqsIflXeiHSskePWOwWoDhEqpkr1IrpOmXWBSKHX4ljaYcNECD0uKwkeRU
	EicdPMSgVKd39a/F5C8zivBjGXX15aL03kfgm9XBh8O4rcb/48ExWeRJFu36Iq0vW9YuT+
	vKthNjJlflRV1fdvamML45ax5ACkNyXUZ996xmmXxuQQqKnsse57W/1tYI3aji94iilDmF
	h+lopKcqgrka+ti+bd6wQIwH7ak+G7gxH5bx2y+CLP5vTYOcaQG7+ZFLG4Ktwg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH] package: fix issue converting PR to string
Date: Wed,  3 Apr 2024 15:57:06 +0200
Message-Id: <20240403135706.535976-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 13:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197920

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The upcoming introduction of "passthrough" PR servers
will add non integer PR values, such as '0.3'.

With such a value, the current conversion of this
value to a string, to define the package file name,
can result in incorrect strings such as "0.30000000000000004"!

Introduce a safe_str() function which, when given a float
value, rounds it up to the 6th decimal first, before the
conversion to string.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: thomas.petazzoni@bootlin.com

---

Notes: this has been tested successfully on the "master" branch.
No obvious regression was found and the package file names
look normal.
---
 meta/classes-global/package.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index aa1eb5e901..82747d5467 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -250,6 +250,13 @@ package_get_auto_pr[vardeps] += "PRSERV_ACTIVE"
 python package_get_auto_pr() {
     import oe.prservice
 
+    def safe_str(pr):
+        # Avoids turning 0.3 to 0.30000000000000004 (for example)
+        # during the conversion of a float to a string
+        if type(pr) == float:
+            pr = round(pr, 6)
+        return str(pr)
+
     def get_do_package_hash(pn):
         if d.getVar("BB_RUNTASK") != "do_package":
             taskdepdata = d.getVar("BB_TASKDEPDATA", False)
@@ -289,7 +296,7 @@ python package_get_auto_pr() {
         auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
         if auto_pr is None:
             bb.fatal("Can NOT get PRAUTO from lockdown exported file")
-        d.setVar('PRAUTO',str(auto_pr))
+        d.setVar('PRAUTO', safe_str(auto_pr))
         return
 
     try:
@@ -299,7 +306,7 @@ python package_get_auto_pr() {
                 srcpv = bb.fetch2.get_srcrev(d)
                 base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PRSERV_PV_AUTOINC", str(value))
+                d.setVar("PRSERV_PV_AUTOINC", safe_str(value))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
             conn.close()
@@ -307,7 +314,7 @@ python package_get_auto_pr() {
         bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
     if auto_pr is None:
         bb.fatal("Can NOT get PRAUTO from remote PR service")
-    d.setVar('PRAUTO',str(auto_pr))
+    d.setVar('PRAUTO', safe_str(auto_pr))
 }
 
 #
-- 
2.34.1


