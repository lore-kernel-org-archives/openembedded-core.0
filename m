Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXAhk-0002IT-QD
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 14:30:16 +0200
Received: by wibhm14 with SMTP id hm14so3976899wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=V8zxU6s3+SbQ7tMpYRp4INQ1G0tGdSm4hdwbam0MMMM=;
	b=C6Fu0yAd/xOKVS/0wTbxdjqhkXmAl7SooW7/hIiZoa7wJqn7EdrlrlFHhdoDQFouU1
	Udtj4UscIDfVM+52XFZUx1FE8iRt4z0M5Q8GrWcyyQd2ak9OiTHHGb/gztggCChmoPun
	eAaZvwZ3VpWskMRbP8u9F0Q4/LzqGq4ZZqOD0OcDMUrSp9qNpjvCO3WyrGfsO/IwnoB4
	Z9htxIa6vg0jLdskEHiccNw4V+BiBPE+6GqL+qgEnZd0dvjAdeMZ8vucI+pGN85lbH5G
	jzyXoaeUcN0o5qPxf3uOnMcDIBmEi2Jb1oJ90Tur2Y8uFULKReUsruW3fg5hi2iuBZvq
	sExw==
Received: by 10.180.95.136 with SMTP id dk8mr555601wib.0.1337775602579;
	Wed, 23 May 2012 05:20:02 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id d10sm4629651wiy.3.2012.05.23.05.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 05:20:02 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 14:19:46 +0200
Message-Id: <1337775586-32611-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] valgrind: Enable valgrind for omap3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 12:30:17 -0000

Valgrind supports the armv7 architecture, this patch allows users of the omap3 soc family to build and use valgrind

This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
* The test consisted of running valgrinds memcheck (memory leakage detection),
* and callgrind (profiling) on a Qt 4 application

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index d7c7b24..0311d75 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -22,14 +22,17 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
 
-COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
+COMPATIBLE_HOST_omap3 = 'arm.*-linux'
 
 inherit autotools
 
 EXTRA_OECONF = "--enable-tls"
+EXTRA_OECONF_omap3 = "--enable-tls -host=armv7-none-linux-gnueabi"
 EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
 RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
 RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
+RRECOMMENDS_${PN}_omap3 += "libc6-dbg"
\ No newline at end of file
-- 
1.7.5.4



