Received: from mail-qc0-f178.google.com ([209.85.216.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPK6z-0004NM-5b
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 00:00:25 +0200
Received: by mail-qc0-f178.google.com with SMTP id d10so2722784qca.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=D2VS6ZcZ7hC9E1WaurBUB1Toz2wQgcGdYOHOnjEDkd8=;
	b=jTkadbw0oayDkS3zhtnIsSb1gJPAr973Ng2NfRnp86bezKm+PW8u7VxYaUInl1TrY4
	mL+sRt4DFSR/w/baDODTHkrRAMH+AaMzDmDpLUPe1JEQEW0J5X3pktqZowLLa06Z6yxZ
	SAZ9zlbdbArkMQwHk/hKf/OyQ5SiTGtlxUfDefVFUtiNttpZC0Rq+5HVAaTHUeE2LDIL
	SDAcOKt/Bw0RijA1BaDCBIvWsTVnBZJ9wwtpJiP0Ks31tAd3lyQ8+98aRXJgyQFcjQnR
	xPkkyXCXGW8oXOJnrnlGGjBGKka6b73w5yH3yN9vVdAvEc3RKIsYiFbZH2qpTBt6Kalr
	/oCw==
X-Received: by 10.224.25.145 with SMTP id z17mr8175013qab.15.1365457385817;
	Mon, 08 Apr 2013 14:43:05 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id hm4sm24030544qab.2.2013.04.08.14.43.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 14:43:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  8 Apr 2013 18:42:44 -0300
Message-Id: <1365457364-3089-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 22:00:26 -0000

When a MACHINEOVERRIDES has more than one value, split by ':' as usual
OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
matching as we need to iterate over each SoC family and check if it is
compatible or not.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v4:
- Fix wrong assignment of compat_machines

 meta/classes/base.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index abd6a52..641316d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -515,11 +515,12 @@ python () {
         need_machine = d.getVar('COMPATIBLE_MACHINE', True)
         if need_machine:
             import re
-            this_machine = d.getVar('MACHINE', True)
-            if this_machine and not re.match(need_machine, this_machine):
-                this_soc_family = d.getVar('SOC_FAMILY', True)
-                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
-                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
+            compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
+            for m in compat_machines:
+                if re.match(need_machine, m):
+                    break
+            else:
+                raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
 
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
-- 
1.8.1



