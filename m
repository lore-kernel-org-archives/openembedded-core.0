Received: from mail-qe0-f42.google.com ([209.85.128.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPCiU-000846-Jq
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 16:06:42 +0200
Received: by mail-qe0-f42.google.com with SMTP id cz11so3118026qeb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=hF6a+kOQEaNj4gpkgV3MhQOgREPYBWE0fsvenItd9qE=;
	b=Zc4nqdNXoHihwsCpWkWMlKVsq4MaEqe8vL+KdhLdC8LSPYFWIGlN9jtKE/iqp8Q6az
	lAxIt9+jqB26nQQLn1IDKA3M57W2i7X3QvbhpMrdsbcQK5Dwch+oiJJAJzqJclT6h/l0
	JVcyvWeGF+r1a3cm1Jas8ziaIsmeYFAsr0SU4TK7srf5+4C0mk4DgB4UINY+iRMrL0ck
	SmPIoQtfVe/4VtE3u8nu2UcNFrWB6K5fdmXQSznB0lMzXoPWRM1Hrczpq9Oe9W59AlXx
	O4ou1w2TyvrfCsI5VaruLJdApkhP/srkv6JIiZbcngvNJPSkDw2EBmhaX2WiR8Dwy/qs
	xtQQ==
X-Received: by 10.224.26.205 with SMTP id f13mr6870414qac.1.1365428959758;
	Mon, 08 Apr 2013 06:49:19 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id o6sm22914387qek.3.2013.04.08.06.49.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 06:49:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  8 Apr 2013 10:55:41 -0300
Message-Id: <1365429341-14345-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] base.bbclass: Fix matching of SOC_FAMILY in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 14:07:01 -0000

When a SOC_FAMILY has more than one value, split by ':' as usual
OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
matching as we need to iterate over each SoC family and check if it is
compatible or not.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v2:
- Properly handle machine so the error message clearly cite the right
  machine name (Eric)

 meta/classes/base.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index abd6a52..080caa8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -516,10 +516,13 @@ python () {
         if need_machine:
             import re
             this_machine = d.getVar('MACHINE', True)
-            if this_machine and not re.match(need_machine, this_machine):
-                this_soc_family = d.getVar('SOC_FAMILY', True)
-                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
-                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
+            compat_machines = [this_machine]
+            compat_machines.extend((d.getVar('SOC_FAMILY', True) or "").split(":"))
+            for m in compat_machines:
+                if re.match(need_machine, m):
+                    break
+            else:
+                raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
 
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
-- 
1.8.1



