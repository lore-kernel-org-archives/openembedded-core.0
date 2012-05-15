Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUEGu-0004fW-L2
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 11:42:24 +0200
Received: by wgbdr1 with SMTP id dr1so4965652wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 02:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HMz3F2YbdEGez4x0GhR7AaV3aI53X485WJqNfWPFuWc=;
	b=Vryfdeuf2CBfyqbw9b4KyjBufB3exad3F8mqWwlQYjzRiGidhTafTFGo6/2cACBEvZ
	Sc+xaJxv3h7le9K01Pk5AD4vLgXbGfJz1sjxl4pdntCoUoVy7a/i74SpliwkLNPVPUSB
	VwuiB82OGBExmlpieIsTcG09DTcGjqqp04aucL3PdrhJBRLKhxfmTDfKWTBC4qR81yzW
	Fq0P5JRn4mtmdK4IGdJ/2iudk1ONQhH9ucx9bu90y+RBdsVHWg1UiVL4HmNMmHiJjb/n
	RDOeXVBYVUexpOyKwBNrpMrz1RnNs7upjGoywguUOhKX6Vll3RRQ8ZAXR2jN3OScdDuU
	tYyA==
Received: by 10.216.136.131 with SMTP id w3mr7375496wei.15.1337074344876;
	Tue, 15 May 2012 02:32:24 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id b3sm41268524wib.4.2012.05.15.02.32.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 02:32:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2012 11:32:21 +0200
Message-Id: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQko2HMwTiam+dkGPCw7UCMAVZw29qpmDtdSFbHxrmiJPhC+qIFsIFKOzzQDJwn7yDrhUrwy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Tue, 15 May 2012 09:42:24 -0000

The commit breaks pkgconfig and after discussing it with the kmod and udev maintainers the conclusion was reached that putting the libraries in /lib instead of /usr/lib is not supported.

This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
---
 meta/recipes-kernel/kmod/kmod_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d9c4d8b..fd38d87 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,7 +3,7 @@
 
 require kmod.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
@@ -16,7 +16,7 @@ RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod
 # autotools set prefix to /usr, however we want them in /bin and /sbin
 bindir = "${base_bindir}"
 sbindir = "${base_sbindir}"
-libdir = "${base_libdir}"
+# libdir = "${base_libdir}"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
-- 
1.7.10



