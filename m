Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdmZZ-0000Yt-F9
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 19:41:25 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so10161697lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 10:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VtGBQYaq+vwZPwUPUD3Wah2wHD3MKpunabfWGO0UQT4=;
	b=WyTJMVb8QSCphqlrxz7TDHUG2kxWVvoJGGezwXmxRh3f0oRrZvqWXNvh1WY3noaG9k
	KBJeKrcO2dN2fxMkosMCuP1XCp8vsOY5skC1bKksfOhTUUAbwV3WuVpCGNCPTrOHRuCr
	KLV4P2KgRULVYHg5U17SBJPCP1miT4v1n0PPDyDMolISPP4mV9YokgMK64L8LJMdxcnW
	A2qckoM9Q3xifArUy6AYsYB3mrkhnlcQUytw24iEeQNpR8Cs9IRJJb5HoyVYvYKs3TCy
	JzuKG9YICQAjsWyEAuvb37d9oVysfE1jWZ4thPP1Pk24cmHQ4p7KmFqnNJEGv1EoUl6b
	q2Ng==
Received: by 10.112.88.97 with SMTP id bf1mr1035576lbb.64.1354127230759;
	Wed, 28 Nov 2012 10:27:10 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id ma15sm8442292lab.4.2012.11.28.10.27.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 10:27:09 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TdmLk-0006Sz-0Z; Wed, 28 Nov 2012 20:27:08 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 20:27:06 +0200
Message-Id: <1354127226-24827-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] readline: apply upstream patches
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
X-List-Received-Date: Wed, 28 Nov 2012 18:41:25 -0000

Upstream does not make bugfix releases but releases patches
to apply on top of original releases. Fetch and apply those patches.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-core/readline/readline.inc    |    2 +-
 meta/recipes-core/readline/readline_5.2.bb |   51 +++++++++++++++++++++++++---
 meta/recipes-core/readline/readline_6.2.bb |   21 ++++++++++--
 3 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 2e9c6b1..b61104c 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS += "ncurses"
 
-SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
            file://configure-fix.patch \
            file://norpath.patch \
            file://acinclude.m4"
diff --git a/meta/recipes-core/readline/readline_5.2.bb b/meta/recipes-core/readline/readline_5.2.bb
index 705c526..1aa44f8 100644
--- a/meta/recipes-core/readline/readline_5.2.bb
+++ b/meta/recipes-core/readline/readline_5.2.bb
@@ -9,15 +9,58 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=03b36fdd84f74b8d8189a202b980b67f"
 
 DEPENDS += "ncurses"
 
-PR = "r8"
+PR = "r9"
 
-SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-001;name=patch1;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-002;name=patch2;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-003;name=patch3;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-004;name=patch4;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-005;name=patch5;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-006;name=patch6;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-007;name=patch7;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-008;name=patch8;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-009;name=patch9;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-010;name=patch10;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-011;name=patch11;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-012;name=patch12;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-013;name=patch13;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-014;name=patch14;apply=yes;striplevel=0 \
            file://configure-fix.patch \
            file://acinclude.m4 \
            file://fix-redundant-rpath.patch"
 
-SRC_URI[md5sum] = "e39331f32ad14009b9ff49cc10c5e751"
-SRC_URI[sha256sum] = "12e88d96aee2cd1192500356f0535540db499282ca7f76339fb4228c31249f45"
+SRC_URI[archive.md5sum] = "e39331f32ad14009b9ff49cc10c5e751"
+SRC_URI[archive.sha256sum] = "12e88d96aee2cd1192500356f0535540db499282ca7f76339fb4228c31249f45"
+
+SRC_URI[patch1.md5sum]    = "9d4d41622aa9b230c57f68548ce87d8f"
+SRC_URI[patch1.sha256sum] = "eac304c369154059f93049ada328739faaf40338d3cb1fb4b544c93d5ce3f8d5"
+SRC_URI[patch2.md5sum]    = "f03e512d14206e37f7d6a748b56b9476"
+SRC_URI[patch2.sha256sum] = "9deacaef25507a0c2ae0b661bf9342559b59a2954d66ea3c5f5bcd900fdfcf78"
+SRC_URI[patch3.md5sum]    = "252b42d8750f1a94b6bdf086612dceb2"
+SRC_URI[patch3.sha256sum] = "2a55d2ecb1c9b0147aeb193a6323616ab31c1c525a83b2db3a994b15594ba934"
+SRC_URI[patch4.md5sum]    = "a32333c2e603a3ed250514e91050e552"
+SRC_URI[patch4.sha256sum] = "a03b65633781efa7c3aae5d57162985e7b7a3c10acf0f2621be610e16f27e5f2"
+SRC_URI[patch5.md5sum]    = "8106796c09b789523a3a78ab69c04b6d"
+SRC_URI[patch5.sha256sum] = "06001896514148a757ea6edbbd40c4fc4331dc653847244386c37b138b150f64"
+SRC_URI[patch6.md5sum]    = "512188e2bf0837f7eca19dbf71f182ae"
+SRC_URI[patch6.sha256sum] = "dfef3e982c0adf8bb5a9b7d0468ec8f5f18138b325e28759437464de5be71013"
+SRC_URI[patch7.md5sum]    = "ac17aca62eb6fb398c9f2fe9de540aff"
+SRC_URI[patch7.sha256sum] = "775b028c7b761397ac6ae1bdfbac7e896dc3b9b3adc2f91312499180ca13bdd1"
+SRC_URI[patch8.md5sum]    = "2484c392db021905f112cf97a94dfd4c"
+SRC_URI[patch8.sha256sum] = "a21b4e0bf0530b878bad24d5be23d18a9e03a75a31ae30844dc0933bb3d77ecd"
+SRC_URI[patch9.md5sum]    = "fc6eb35d07914fae5c57d49c12483ff7"
+SRC_URI[patch9.sha256sum] = "138d5e0f0709a47a2d1621295a3dd5e3cc73b63b5cc28dab03abc4e94fe95ecf"
+SRC_URI[patch10.md5sum]    = "7a2bf3dc7ac7680b1461a5701100e91b"
+SRC_URI[patch10.sha256sum] = "83f8c1aadb86b1a2fad8821a9c6be72a8de5afd7fd9fde58a30b3b57d939693e"
+SRC_URI[patch11.md5sum]    = "ef6cef6822663470f6ac8c517c5a7ec6"
+SRC_URI[patch11.sha256sum] = "08ad3384ab0906e6fa4cc417eb8c43ff59375bcead15fd5c8e31730f0413b3d6"
+SRC_URI[patch12.md5sum]    = "e3e9f441c8111589855bc363e5640f6c"
+SRC_URI[patch12.sha256sum] = "20f0243be2299c23213492cc2c19cfd15cc528d2b566a76a2de58306bb9e4c9e"
+SRC_URI[patch13.md5sum]    = "3e2e5f543ed268a68fd1fa839faade1a"
+SRC_URI[patch13.sha256sum] = "0cc649516a5bdfa61c5e56937407570288b6972d75aa1bd060ad30ebe98144d5"
+SRC_URI[patch14.md5sum]    = "a1be30e1c6f1099bb5fcef00a2631fb8"
+SRC_URI[patch14.sha256sum] = "6f1a68320d01522ca1ea5a737124ecc8739f3dcbfea2dee21e3ccf839a21a817"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
index 09c4908..45fa4e7 100644
--- a/meta/recipes-core/readline/readline_6.2.bb
+++ b/meta/recipes-core/readline/readline_6.2.bb
@@ -1,6 +1,21 @@
 require readline.inc
 
-PR = "r3"
+PR = "r4"
 
-SRC_URI[md5sum] = "67948acb2ca081f23359d0256e9a271c"
-SRC_URI[sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
+SRC_URI += "${GNU_MIRROR}/readline/readline-6.2-patches/readline62-001;name=patch1;apply=yes;striplevel=0 \
+${GNU_MIRROR}/readline/readline-6.2-patches/readline62-002;name=patch2;apply=yes;striplevel=0 \
+${GNU_MIRROR}/readline/readline-6.2-patches/readline62-003;name=patch3;apply=yes;striplevel=0 \
+${GNU_MIRROR}/readline/readline-6.2-patches/readline62-004;name=patch4;apply=yes;striplevel=0 \
+"
+
+SRC_URI[archive.md5sum] = "67948acb2ca081f23359d0256e9a271c"
+SRC_URI[archive.sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
+
+SRC_URI[patch1.md5sum]    = "83287d52a482f790dfb30ec0a8746669"
+SRC_URI[patch1.sha256sum] = "38a86c417437692db01069c8ab40a9a8f548e67ad9af0390221b024b1c39b4e3"
+SRC_URI[patch2.md5sum]    = "0665020ea118e8434bd145fb71f452cc"
+SRC_URI[patch2.sha256sum] = "1e6349128cb573172063ea007c67af79256889c809973002ca66c5dfc503c7d4"
+SRC_URI[patch3.md5sum]    = "c9d5d79718856e711667dede87cb7622"
+SRC_URI[patch3.sha256sum] = "cb2131ff352d6e5f82edc09755191f74220b15f026bdb6c52624931c79622374"
+SRC_URI[patch4.md5sum]    = "c08e787f50579ce301075c523fa660a4"
+SRC_URI[patch4.sha256sum] = "09bd342479ea5bb8b6411bfdf7d302fab2e521d1d241bcb8344d3bad5d9f5476"
-- 
1.7.10.4



