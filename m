Received: from mail-qe0-f51.google.com ([209.85.128.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPJPn-0000SB-1U
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:15:47 +0200
Received: by mail-qe0-f51.google.com with SMTP id 1so1606207qec.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=CuFnKzENP+EBVaZLOjIaLmhLuuwQeZqu+A5RnxrIiTs=;
	b=BdED0zFY6iwBdgTJkwiL7jA/QB7871dtvCCmIZMWdUVLcvcLObyMX2xLoUm4lzzsjE
	YaLQd3cer7+J7CL+7L/TND7yUQ5D6EK141uPdcqqFCYJhG/pubfe+u+HEnr/3koKQRbX
	igE5KQ2xYSCuPsHTfAzEUaJDM5nemMETWW3Pfo97ydskTaupeJaHlshVuEeuTPUK8lT6
	AMi4YPme1t+hfCuHMnngIcm6HlnmHJpj/0AGpQM7alJu6w5Tdl3Khc+Z2HpyrHLNMq2J
	1PgGfdc+aPKBgZniS9Lk0kMtpFmBszCaHE7uQXJz2Xfyw1rns5chDRrpnOKr7aV9oFFL
	eRhw==
X-Received: by 10.49.48.43 with SMTP id i11mr20816391qen.65.1365454707665;
	Mon, 08 Apr 2013 13:58:27 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id e3sm24258045qeo.0.2013.04.08.13.58.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 13:58:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  8 Apr 2013 17:58:06 -0300
Message-Id: <1365454686-951-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 21:15:49 -0000

When a MACHINEOVERRIDES has more than one value, split by ':' as usual
OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
matching as we need to iterate over each SoC family and check if it is
compatible or not.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v3:
- Stop checking for SOC_FAMILY as it is just for compatibility with
  old BSPs; we move to MACHINEOVERRIDES for this case (RP)

 meta/classes/base.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index abd6a52..313359c 100644
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
+            compat_machines.extend((d.getVar('MACHINEOVERRIDES', True) or "").split(":"))
+            for m in compat_machines:
+                if re.match(need_machine, m):
+                    break
+            else:
+                raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
 
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
-- 
1.8.1



