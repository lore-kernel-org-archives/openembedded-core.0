Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRtRc-0005mt-5o
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 01:03:48 +0200
Received: by pbbrq2 with SMTP id rq2so7319871pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=t8Xk7mihHOGb9EANLyUn99kOlI7AH//MIVYNGeDqwhg=;
	b=X7ioPZsb4tOHHay8P/JF+XxO31uw5VW5uimcZOElTpEEvF+CW1VPBzgo6yHbKCmuw2
	NfcKG1jBk9TrvoWa93A5ofu0zMaQ3q/23m3Wk/xb8VM9x0ohk2F2jZr+iD8MiGL3lqtp
	IF0/6oftaDHsAB8x5CPcuOsR4Ke3hkpZgBBxY6mbMQtbzBZAkK9CgzGBzP+i1ZwBWeYo
	gFXEQlos+jWwsNe8aK/IEz9EuZjs7c8ZBAtOjPY94/qxHpq5bSfcwjO8wgXEosFxtbFK
	iTTSJu/RcVAL3kMYVPBOOGHSboUQ6yk1OH23gRDzdJv+B32GFhu3Sxu4/K7U67k/xmWQ
	XjxA==
Received: by 10.68.237.198 with SMTP id ve6mr2205908pbc.116.1336517635204;
	Tue, 08 May 2012 15:53:55 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ka5sm3770829pbb.37.2012.05.08.15.53.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 15:53:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 15:53:38 -0700
Message-Id: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336517492.git.raj.khem@gmail.com>
References: <cover.1336517492.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] kmod: fix upgrade path from module-init-tools
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
X-List-Received-Date: Tue, 08 May 2012 23:03:48 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 1ab9f44..4c860f0 100644
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
1.7.5.4



