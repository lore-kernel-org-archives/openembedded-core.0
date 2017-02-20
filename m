Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 728A371C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 11:20:28 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v77so49845448wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=i73ya79YAakfrXvMUybh6QfEEoY69pJ3ExMa6Z8+Co0=;
	b=1IIUIjmk/I6DyVIQ1SARpGoJh2Q0HRIVxJ8ZJKs9jdKY2wq0CF2j06vIRiZzpD6EiS
	JwK1kLYboK51LvoQ7QkxOCfTHliCYO6Vw/PhyCBSczM/sl8nDOmNx+bRRfsHTrUp8Ufx
	cV4XW3a7ipqo8rk8D60f1xQWYFlRBIlseZM8OlS/Nuz0EQIRo01rLGR0NnD1AX6i8W+B
	qYulWzHCaikQXSPv86iEGpOMyLzVQUor3xVEaqFIGBx//2GaqhSC9DtH/fwmfuZIiSMo
	V260QRoWtd8AqSQYddRHswwgOoM5x0v4Nsz9uVonP0ZeoDbi3MWhst94iwrEvspLpGY6
	hZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i73ya79YAakfrXvMUybh6QfEEoY69pJ3ExMa6Z8+Co0=;
	b=cfD2W5VYU2UynNITVALjvdpG6UKQez1ax74ZVOHMDkRxCKgfE8R8J6BstkoacBwBrm
	SePXIRefhCt6g2qBJckHZJ1MTwahktZZZIxlMN+0LC15QGeikMBmxQHO24K9zw8evNOV
	gf6xrFbkinbtsgzY+zcMKBl8gCPg6tX8opVQMYtgXd8rcH8+5CNcAsaRC879jAGobIFT
	QmbVBIOYumfvwIWsels5kU77KRm2RkdiVZ/d6Dc3P/2kwu0ALyLcnV3iySQPjY+ldYg3
	NKZy9rmtE0hCdoqUcsAVsr8Cs1kQrPV3jRKsejBUMCybd8bFJ15OSrkAy7Mf6BdSOq+F
	wpHw==
X-Gm-Message-State: AMke39nLK/6gr2JrA1bhxQYIu8v7+R4xIWFzA0KpcEp74avlZs6kYj85M4c/+T3D2oN/+RSo
X-Received: by 10.28.153.196 with SMTP id b187mr17437695wme.53.1487589627957; 
	Mon, 20 Feb 2017 03:20:27 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m80sm13039727wmi.34.2017.02.20.03.20.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 03:20:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 11:20:23 +0000
Message-Id: <1487589623-6089-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][V2] btrfs-tools: don't run autogen.sh
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
X-List-Received-Date: Mon, 20 Feb 2017 11:20:28 -0000

Instead of running autogen.sh (which runs autoconf et al) before running
autoreconf (which runs autoreconf et al...) just do the one task that we need
from autogen.sh: copying install-sh from automake's libdir.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
index 7047c43..04e1e61 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
@@ -14,17 +14,17 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
 RDEPENDS_${PN} = "libgcc"
 
 SRCREV = "144a19145e248513c7a676defad59836830535c6"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
-"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 
 inherit autotools-brokensep pkgconfig manpages
 
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 
-
 do_configure_prepend() {
-      sh autogen.sh
+	# Upstream doesn't ship this and autoreconf won't install it as automake isn't used.
+	mkdir -p ${S}/config
+	cp -f $(automake --print-libdir)/install-sh ${S}/config/
 }
 
 S = "${WORKDIR}/git"
-- 
2.8.1


