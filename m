Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPY4p-0004WF-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 14:55:13 +0200
Received: by mail-gh0-f175.google.com with SMTP id f1so1048853ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=VrhADAKQvlPF4hFdK35naapiHOIP9uFvUKfJN2r2JOg=;
	b=xpPuSgQnXiFJUYqdSocq1/0uu8ZXR+20rX86qRRzQcxo39TUj6w9UsSr4tF3fb0Yhh
	5q/1tTf5ZsCWP/VZfPfG+j1YOpaXVzDwNWgKn7NR5nCa7CiaJoKk1lKF6EYAQGWENXKc
	vlnOf7xls/lXQy0G0cbUsUbahzsKBViYaxF6t6aK8IsjDFW5g4e5XGjAbwAZ2dsIgond
	54D+3C5Y87Du9EZLvvEROJYnMFvoFCf0Hy/22uZoRQfW3vmGzwfNNzHwVmGf16ZWdtlP
	O2CLXAn3iQip2Ef26wWT+lHttPEWVTtSBkGSMyyR981m4gvlTcymm58Dkt7ZphUxRLD+
	kozA==
X-Received: by 10.236.60.198 with SMTP id u46mr3295342yhc.28.1365511066999;
	Tue, 09 Apr 2013 05:37:46 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id v60sm42940593yhh.23.2013.04.09.05.37.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 05:37:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Apr 2013 09:37:31 -0300
Message-Id: <1365511051-30507-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5] base.bbclass: Add matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 09 Apr 2013 12:55:18 -0000

When a MACHINEOVERRIDES has more than one value, split by ':' as usual
OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
matching as we need to iterate over each SoC family and check if it is
compatible or not.

The code has been change from SOC_FAMILY to MACHINEOVERRIDES as the
former in fact appends the value to the later, so the right variable
to match is MACHINEOVERRIDES. This also allows for later removal of
SOC_FAMILY if desired as the only functional difference between both
is now ironed out.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v5:
- Improve commit log (pb_)

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



