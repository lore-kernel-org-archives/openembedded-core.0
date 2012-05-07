Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRVON-0007P7-7d
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 23:22:51 +0200
Received: by werb13 with SMTP id b13so1089647wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 14:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=eqXYNaPSdFFP5e7ARgKy7QXBVYKrxRkDl6ApcNKs7Qw=;
	b=qEd3WWch9GveIErKpGzGBoIXzj+LhbL5F50fi7LNPWsO50zuiR4Ic4uI8rv5wP+CYO
	DMJteL8G+MOXsC5horOA2NQ+Grr9+K9TJHXADvwbUSG8tPhvXG1v1VxuO/VuQy5AEaAh
	kplkwbYJPFyB185wC/1fZCKDWLKOfrgwTH/fBtiCbqC8y4g+uCbybWfLSb0Wv06WoxId
	e9DDZp8sc5oG/8olgs/v5w7caw2RDwI0kUUW8p0dtD8AZje/vmswjNMYBDNYD5ss8EBl
	2qziGWFjGKLPBWsl5B1zM6bKuGXcWtOE3xOZQfMosRWDtLX+fUnQS60LZd783fmoKwWB
	8Trg==
Received: by 10.180.97.4 with SMTP id dw4mr38334168wib.18.1336425180597;
	Mon, 07 May 2012 14:13:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca3sm24346601wib.6.2012.05.07.14.12.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 14:12:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 23:12:44 +0200
Message-Id: <1336425164-5991-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1336425164-5991-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQem7Wiba2MLqkANC-retpk7WBre7gUpAtJsXF+b5P43aw@mail.gmail.com>
	<1336425164-5991-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] kmod: fix upgrade path from module-init-tools
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
X-List-Received-Date: Mon, 07 May 2012 21:22:51 -0000

* PROVIDES does not need _${PN}
* CONFLICTS should be RCONFLICTS
* opkg needs RREPLACES to automatically remove older module-init-tools
  instead of just reporting it conflicts with kmod

SHR root@gjama ~ $ opkg install kmod
Installing kmod (7+git02629fa02e96763db7460a930239cc93649a52f8-r0.0) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/kmod_7+git02629fa02e96763db7460a930239cc93649a52f8-r0.0_armv4t.ipk.
Removing package module-init-tools-depmod from root...
update-alternatives: removing //sbin/depmod as no more alternatives exist for it
Removing package module-init-tools from root...
update-alternatives: Linking //sbin/insmod to ../bin/busybox
update-alternatives: Linking //sbin/modprobe to ../bin/busybox
update-alternatives: Linking //sbin/rmmod to ../bin/busybox
update-alternatives: removing //sbin/modinfo as no more alternatives exist for it
update-alternatives: removing //bin/lsmod as no more alternatives exist for it
update-alternatives: Linking //sbin/lsmod to ../bin/busybox
Configuring kmod.
update-alternatives: Linking //sbin/insmod to /sbin/insmod.kmod
update-alternatives: Linking //sbin/modprobe to /sbin/modprobe.kmod
update-alternatives: Linking //sbin/rmmod to /sbin/rmmod.kmod
update-alternatives: Linking //sbin/modinfo to /sbin/modinfo.kmod
update-alternatives: Linking //bin/lsmod to /bin/lsmod.kmod
update-alternatives: Linking //sbin/lsmod to /bin/lsmod.kmod
update-alternatives: Linking //sbin/depmod to /sbin/depmod.kmod

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 8178f1c..28b5a68 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,11 +3,15 @@
 
 require kmod.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-PROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
-CONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+RCONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+RREPLACES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+
+# to force user to remove old module-init-tools and replace them with kmod variants
+RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 
 # autotools set prefix to /usr, however we want them in /bin and /sbin
 bindir = "${base_bindir}"
-- 
1.7.8.6



