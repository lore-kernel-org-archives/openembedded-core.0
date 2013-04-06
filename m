Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOWuy-0004nk-3f
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 19:28:46 +0200
Received: by mail-qc0-f180.google.com with SMTP id b40so1991086qcq.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 10:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=0AWwQ29YB8DeV8g8byJdCeTiay55t2z6JfyvBnGHO38=;
	b=ZGZ1947Epm1I1nF60t1wDNN92pJIiVogXYF0drUkXsegFAB8kLckrhSXSxFD0oUb+P
	YKwihZwOt3ctArFRJL98eVVBftHFXisLTZUvPZHaM0sjOIk0O2TZIp2jJJHl1J/0ixm8
	pJP7WS8NTp3F9olFkHgiWy7wRmYS9Vyn+kxezwPFNyIygShW5NJm9wH6MN1JL+hZNYbt
	72i1e0WTqRpzJk0QQyoEM5pPbmo2KFhRtEO9zlRSLelsoTf/p91/jScfjAdvuM8E8aih
	rDScg1uPoYIsRVTgOOTgerXScluSVhRmOV3a4gv5eYeXpnlX0IZDYfSSjfUMgdqZ9rE2
	cNCQ==
X-Received: by 10.224.29.145 with SMTP id q17mr2093920qac.75.1365268287783;
	Sat, 06 Apr 2013 10:11:27 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id fr4sm16970541qab.3.2013.04.06.10.11.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 10:11:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat,  6 Apr 2013 14:17:48 -0300
Message-Id: <1365268668-15483-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] base.bbclass: Fix matching of SOC_FAMILY in COMPATIBLE_MACHINE
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
X-List-Received-Date: Sat, 06 Apr 2013 17:28:47 -0000

When a SOC_FAMILY has more than one value, split by ':' as usual
OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
matching as we need to iterate over each SoC family and check if it is
compatible or not.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/base.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index abd6a52..6f24064 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -515,11 +515,13 @@ python () {
         need_machine = d.getVar('COMPATIBLE_MACHINE', True)
         if need_machine:
             import re
-            this_machine = d.getVar('MACHINE', True)
-            if this_machine and not re.match(need_machine, this_machine):
-                this_soc_family = d.getVar('SOC_FAMILY', True)
-                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
-                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
+            compat_machines = [d.getVar('MACHINE', True)]
+            compat_machines.extend((d.getVar('SOC_FAMILY', True) or "").split(":"))
+            for this_machine in compat_machines:
+                if re.match(need_machine, this_machine):
+                    break
+            else:
+                raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
 
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
-- 
1.8.1



