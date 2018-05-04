Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id BEC9374A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:53:05 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id q22so18502685pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=as7Vp/nYDHyGO4ijsFDqQqCaaBzYtAAEN7Ajep1VOg0=;
	b=oFWGeWIkp7b6I2SzMan+8CWUg614sYZ2opekoML8mPH9KM5kLxcRahiXIIVYkPhMTE
	//euKsT7/JUKDwQ42OKpWQRG0LLznxh1qH75cHtVSD6YH1NEQ8Iymm/WhnTXYzAsOyKT
	IWw0aZcXmJdxfHOP2x4UX/qCTYrzKJ90+qojYHc9Y7frwgsj1J2p8bz1Hnc88PGN7qGf
	QKhGEQfjULmcdYlvkoMoFoG37lzRtS0Vk61nQkVBMWeF1EfMG51wTtUrky+EK0QaDKFX
	j7/ubcJudahByT5WBrCauswvJXDZMWs24cQcDsILJy6KBJmMKLwQXVI6Qqf+seQfErcJ
	WaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=as7Vp/nYDHyGO4ijsFDqQqCaaBzYtAAEN7Ajep1VOg0=;
	b=g3r4QIAT/VJKIlzCmuT+Pg1jbSZgJxUZnPI9ooP9dvc20/G8As5GvYABN+Z5THHFF+
	6FPAwTduQFg+pdpvlYI40hJO0ZIShfcWlyPwt33F3nYMcrwYKzWtX2Cy6eb8n6wdJD4N
	Rjjzj2AaMiliERZ39nLanbEu9nbXyv9VTry4qhuOZX16dut6HLrLY5V9oxgIzrIORVHc
	6DP4ylXWB+evoVp8KgrmXVGMa47cIOI8U8xWct/SyjoeHmSfNMo6tOxh2yrxE2Ro/kmf
	4gZyr6ALnSoTK3bQkgZCNHl7Cd8CHv4An0nmCHhs7aLF5LnuoCEqbbMcKIXV0qArB5rs
	Xz/Q==
X-Gm-Message-State: ALQs6tDVkeIrbXxS2QGSwLzkqIl7kuyAMLDsY7mCHLA89EId7Nf14tCK
	Svt+adyreZgTcMLJlWtxYCxVDQ==
X-Google-Smtp-Source: AB8JxZqXko4zC6UYNSNGDXY5NH0oZvT1Bo7hPyQ15q7qcGY9N9K/7JycBmFyXZbTM3iAicXnqgZY8A==
X-Received: by 10.98.33.151 with SMTP id o23mr28697676pfj.202.1525474386528;
	Fri, 04 May 2018 15:53:06 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:53:06 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:49 -0700
Message-Id: <1525474370-7913-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/8] puzzles: move ASNEEDED over-ride into the puzzles recipe
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
X-List-Received-Date: Fri, 04 May 2018 22:53:05 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc   |  1 -
 meta/recipes-sato/puzzles/puzzles_git.bb | 35 +++++++++++++++++---------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index c67f2f3..f56d432 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,7 +2,6 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-puzzles = ""
 ASNEEDED_pn-rpm = ""
 
 TARGET_LDFLAGS += "${ASNEEDED}"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 3670ab8..7d08b96 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,20 +1,20 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=da6110d4ed1225a287eab2bf0ac0193b"
 
 DEPENDS = "libxt"
 
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=da6110d4ed1225a287eab2bf0ac0193b"
-
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            "
+
 UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "c6e0161dd475415316ed66dc82794d68e52f0025"
 PE = "2"
@@ -24,24 +24,13 @@ S = "${WORKDIR}/git"
 
 inherit autotools distro_features_check pkgconfig
 
-CFLAGS_append = " -Wno-deprecated-declarations"
-
 PACKAGECONFIG ??= "gtk3"
 PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
 PACKAGECONFIG[gtk3] = "--with-gtk=3,,gtk+3,"
 
-PACKAGES += "${PN}-extra"
-FILES_${PN} = ""
-FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
+CFLAGS_append = " -Wno-deprecated-declarations"
 
-python __anonymous () {
-    var = d.expand("FILES_${PN}")
-    data = d.getVar(var, False)
-    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
-        data = data + " ${bindir}/%s" % name
-        data = data + " ${datadir}/applications/%s.desktop" % name
-    d.setVar(var, data)
-}
+ASNEEDED = ""
 
 do_configure_prepend () {
     cd ${S}
@@ -74,3 +63,17 @@ STOP
         fi
     done
 }
+
+PACKAGES += "${PN}-extra"
+
+FILES_${PN} = ""
+FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
+
+python __anonymous () {
+    var = d.expand("FILES_${PN}")
+    data = d.getVar(var, False)
+    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
+        data = data + " ${bindir}/%s" % name
+        data = data + " ${datadir}/applications/%s.desktop" % name
+    d.setVar(var, data)
+}
-- 
1.9.1


