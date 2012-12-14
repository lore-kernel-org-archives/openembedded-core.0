Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TjYO8-0007Xp-1J
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 17:45:28 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1739407bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:content-type:x-mailer:mime-version
	:content-transfer-encoding;
	bh=rMRD/WpVtneGanrqH1EwVW4EloCBehY6pG4wnWW0hGQ=;
	b=fypx001EhvBZExAMrjFETuIjyvUwWNSUP16Wz/MrqMWxoXHcGchqZCXzDayAdPEjbJ
	dHyDQDRr6yZC5FJnHZx7rV1WTPLgTd075uVHmLw5VzpebiFGAf0vmCgyu2gVsJ32p66s
	9SW3w7z+snDNQLuXOSNtCr2omMB2RRCgzZeK1gBH2lJ+/cq03RQ8Eoxx/oqbN692cJsl
	KWRpFYFrxO3L8Kz1ck12mnx1TdcfAw5tjfhVvi9bTjngKDR7wmgRjvxyG5wzcpJ7Mqfe
	ksfzrG/vIjBbPdF4sagRdy9ENftHZWxQIvdS/L2fsHpvN/PRpxNdf8OHd5nHPeDyqVyN
	a6WA==
Received: by 10.204.149.11 with SMTP id r11mr2973729bkv.93.1355502651574;
	Fri, 14 Dec 2012 08:30:51 -0800 (PST)
Received: from [192.168.1.25] (93-139-163-243.adsl.net.t-com.hr.
	[93.139.163.243])
	by mx.google.com with ESMTPS id y11sm5091163bkw.8.2012.12.14.08.30.48
	(version=SSLv3 cipher=OTHER); Fri, 14 Dec 2012 08:30:50 -0800 (PST)
Message-ID: <1355502646.9104.25.camel@dromedary>
From: Marko =?UTF-8?Q?Kati=C4=87?= <dromede@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 17:30:46 +0100
X-Mailer: Evolution 3.6.0-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] udev: make sure udev-utils package always includes udevadm
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
X-List-Received-Date: Fri, 14 Dec 2012 16:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Default installation path of udevadm was changed 
from ${base_sbindir} to ${bindir} in udev v176.

Also, udevinfo and udevtest no longer exist in
current (v182) udev sources.

This can break udev-utils packaging since udev-utils 
package expects udevadm only in ${base_sbindir}.
And since udevinfo and udevtest no longer exist in
current udev versions,
udev-utils could be empty and thus will not be created.
This can break do_rootfs stages when building images
that depend on udev since we have RRECOMMENDS += udev-utils.
We should also make sure that udevadm stays in udev-utils
since it might be needed for other packages i.e, busybox
and mdev.

Udev.inc should support all versions of udev. This patch
makes udevadm always available in udev-utils package and
it also makes sure that udevadm is available in both 
${base_sbindir} and ${bindir} paths.


Signed-off-by: Marko Katić <dromede@gmail.com>
---
diff --git a/meta/recipes-core/udev/udev.inc
b/meta/recipes-core/udev/udev.inc
index 4705b9b..b46ad2c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -74,7 +74,7 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache
${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl
${base_libdir}/udev/rules.d/70-acl.rules"
 
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest
${base_sbindir}/udevadm"
+FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest
${base_sbindir}/udevadm ${bindir}/udevadm"
 
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
@@ -97,4 +97,19 @@ do_install_append () {
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+
+	#Starting from udev v176, udevadm is by default installed in
${bindir}.
+	#Make sure udevadm is available both in ${bindir} and ${base_sbindir}
+	#so we can support all versions of udev.
+	
+	if [ "${PV}" -gt "175" ]
+	then
+		install -d ${D}${base_sbindir}
+		ln -s ${bindir}/udevadm ${D}${base_sbindir}/udevadm
+
+	else
+		install -d ${D}${bindir}
+		ln -s ${base_sbindir}/udevadm ${D}${bindir}/udevadm
+
+	fi
 }



