Received: from mail-bk0-f46.google.com ([209.85.214.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TlRfV-0005qy-JR
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 22:59:24 +0100
Received: by mail-bk0-f46.google.com with SMTP id q16so1304926bkw.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 13:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=vKfWZXLPqj/WUc5bfpPV2yi5qXjpA8CHiek+AEr/Q3c=;
	b=fO96f3YsMaWiLLqp/jTEduezpxrbDglqrqWSni2TOLp7f7gD4wKxd/+BIFIUQiCgk6
	gOSg3mHeCgj6lw0u4nHr85jvGFr6fPqEdpHk6G1bHQVKpry2KSjKyptzJRHAH5pswXyd
	lHTrCahJBELvyc0GLz0mPDoaHzWm++BRfYZloFbyw+67KCETIR8bKmo4vPlyZLsl3+3d
	Qg1R34dONLU9t5BWC/ZkcEVM5NjztaH+NvqK+WI+i1qmGCtHfhit9F4epdqshez5QW9P
	H5cPsztfMhd6liQ6YqoDlh1bt+arnD4So0No2wxzZShFniWdOQ1HcKeexi+d9+BbnM1e
	Kzzg==
X-Received: by 10.204.129.66 with SMTP id n2mr3471505bks.94.1355953469055;
	Wed, 19 Dec 2012 13:44:29 -0800 (PST)
Received: from dromedary.sx76x.gigaset.net (93-139-137-177.adsl.net.t-com.hr.
	[93.139.137.177])
	by mx.google.com with ESMTPS id v8sm5533073bku.6.2012.12.19.13.44.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 13:44:28 -0800 (PST)
From: dromede@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 22:44:22 +0100
Message-Id: <1355953462-16689-1-git-send-email-dromede@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] udev: make sure udev-utils package always contains udevadm
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
X-List-Received-Date: Wed, 19 Dec 2012 21:59:24 -0000

From: Marko Katic <dromede@gmail.com>

Default installation path of udevadm was changed
from ${base_sbindir} to ${bindir} in udev v176.

Also, udevinfo and udevtest no longer exist in
current (v182) udev sources.

This can break udev-utils packaging since udev-utils
package expects udevadm only in ${base_sbindir}.
And since udevinfo and udevtest no longer exist in
current udev versions, udev-utils could be empty
and thus will not be created.

We should also make sure that udevadm stays in udev-utils
since it might be needed for other packages i.e, busybox
and mdev.

Udev.inc should support all versions of udev. This patch
makes udevadm always available in udev-utils package and
it also makes sure that udevadm is available in both
${base_sbindir} and ${bindir} paths.

Signed-off-by: Marko Katic <dromede@gmail.com>
---
 meta/recipes-core/udev/udev.inc |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 4705b9b..a0f9f3b 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -74,7 +74,7 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
+FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm ${bindir}/udevadm"
 
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
@@ -97,4 +97,19 @@ do_install_append () {
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+	
+	#Starting with udev v176, udevadm is by default installed in ${bindir}
+	#Make sure udevadm is available both in ${bindir} and ${base_sbindir}
+	#so we can support all versions of udev.
+
+       if [ "${PV}" -gt "175" ]
+       then
+               install -d ${D}${base_sbindir}
+               ln -s ${bindir}/udevadm ${D}${base_sbindir}/udevadm
+
+       else
+               install -d ${D}${bindir}
+               ln -s ${base_sbindir}/udevadm ${D}${bindir}/udevadm
+
+       fi
 }
-- 
1.7.10.4



