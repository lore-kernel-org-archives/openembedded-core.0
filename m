Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2468A7E63A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 19:39:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r19so698423wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9PBrFUE6NhOGn6vtoNDNz8LZUhNmGiwPq879IqAhn9E=;
	b=M0NoNspmmvtdd/xy6HPSBp4wExkTy1IG+6+g1cQfH5ElDO6un/wiag9zXUvpDEN3Ne
	e8KwU6ywFeFZK2sW3qfINxd9eVXhd7dORQNcLFnNdoEeyqapjf6biL2bP847SL4m7emF
	Me/Pl772dAhGhtYoqbJ5ZbnIi11sXkHW+HjRP629/VMVfvE7pcpnENfa11Y+gGKFIaLP
	d9cSd1eFrBMNLANeIhcJhaQvb16v1xteM3yKzhoUdhgSg01XNMCPuU7ANPeP223JFLz8
	JTpwNypKS5eArw5seew9k9J1nlBYHxeBE/4mOtBr+bjaYF5lyTUsSMbYR1D2l7XTto/q
	vGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9PBrFUE6NhOGn6vtoNDNz8LZUhNmGiwPq879IqAhn9E=;
	b=nafPTqQ6kVDGTR9H75JaMmn1D8xzIqMa/Y8Q9bJxCxmnnTFm9qT1Q6jRAbS0JlepdM
	mDygheLBQs14mkVOGMTq5MspXd75lXrXqtvIrx3h5awkwRgmMib9nYFsFAc7XLHtslRF
	XmMjnCjcsINgNQzDT5xMgmFD09/4MCI37L/pWeCXDRiIx3aU1SRmC2ZQQXoUpemt1YUP
	Qi+iEdfADp6JAP9pGkQ5sbWRqYXx+NJyWLwAkfK1k+0t6uLsG/dYpSPG0yyyXoRKlSkY
	y2tpsFs/p6DMmNPiS4GfK4Z7ci6eelFKST/LwMk/5JqdXpTYznHIq851EWHKl+N19JIz
	TshA==
X-Gm-Message-State: APjAAAXjsLak/2ubCZAJxMVV/fLLYM02NHuZWK2XX1wowLdaVhNu63cN
	K+S1hWfZlewtl175Im8Lvwp6R/Kh3GI=
X-Google-Smtp-Source: APXvYqxQMR455jBo+T03K2d8jCRVDs7YjLla8YR1C5wCCDH90jHE04N4cBAsAhE/iApbR6VUmAeCIQ==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr659107wmh.105.1570477152419; 
	Mon, 07 Oct 2019 12:39:12 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e3sm737194wme.39.2019.10.07.12.39.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 12:39:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 20:39:07 +0100
Message-Id: <20191007193907.13467-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] systemd: don't install systemd-hwdb-update.service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Oct 2019 19:39:12 -0000
Content-Transfer-Encoding: 8bit

This service file is designed to do first-boot initialisation of the udev hwdb
database, but the condition logic to fire it is suboptimal: it can fire if not
needed, and can also not fire if needed.  Specifically it will always fire on
first boot, even though as part of rootfs generation we build the hwdb database.
On slow machines this can take a significant amount of time, the pathological
case being qemumips where the service can time out after 90 seconds of
processing.

Other distributions have also noticed this problem (specifically, at least
Debian and Clear) and solve it by using traditional postinst scripts to generate
the hwdb (which we already do) and deleting the service file (which we don't).

Finish the fix and improve boot times across all boards by deleting the service
file.

[ YOCTO #13504 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_243.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index b9097593f17..a4a744ce9ba 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -297,13 +297,10 @@ do_install() {
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
-}
 
-do_install_append () {
-	# Mips qemu is extremely slow, allow more time for the hwdb update
-	# This is a workaround until https://github.com/systemd/systemd/issues/13581 is resolved
-	[ ! -e ${D}${systemd_unitdir}/system/systemd-hwdb-update.service ] ||
-		sed -i -e s#TimeoutSec=90s#TimeoutSec=180s# ${D}${systemd_unitdir}/system/systemd-hwdb-update.service
+    # We use package postinsts for the hwdb update, as the update service is
+    # easily triggered for no reason and will slow down boots.
+    find ${D} -name systemd-hwdb-update.service -delete
 }
 
 python populate_packages_prepend (){
-- 
2.20.1


