Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1323781F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:36:15 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id h82so5251457ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to;
	bh=TstDLeu+DqWp2f4BMsFf5bs2Hcnb3jdVKrsTxWzGJ1I=;
	b=R8IdVjvfig7aqjQ9p0YtRYYxC8o4RoRV/ldqu5CqzHxZXobBq65UzkCkT1teSYkkdX
	d6TRxw9pYy8v+5le3tSsZXCkVYgEiUGap0cxuKoz0vp3efxlejVlg+kki2p5N859PeUm
	4aekbQaI2yRElcpTS0Do6uhRx5DMPfcxG4gFVF3uKM1L59loyVF1HjQtajsmCyHAF2T9
	z/kvE23xj0aBItv+TBlbCrwEyO85XlkEkx1Y90WZR8pOXMv8BiU4BuTsTEv4zW92sult
	6A6xG2vKCFnK+iwvuHI8crwgZLtzgph45AEVdBsg1HwLezrYm81Bo260JH/X3XpdIFa1
	dbAQ==
X-Gm-Message-State: AODbwcBu7ma4efzZcXpF+JZ3RcyGbU23bOcTfidbR4La1yiE7ttCIVZE
	Bj00mJf2LyOedFHx
X-Received: by 10.129.174.81 with SMTP id g17mr16082822ywk.53.1497184576676;
	Sun, 11 Jun 2017 05:36:16 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	v75sm2629901ywa.51.2017.06.11.05.36.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:36:15 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Jun 2017 08:36:32 -0400
Message-Id: <1497184592-28388-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1497184592-28388-1-git-send-email-trini@konsulko.com>
References: <1497184592-28388-1-git-send-email-trini@konsulko.com>
In-Reply-To: 1496966441-30260-2-git-send-email-trini@konsulko.com
Subject: [PATCHv2 2/3] dpkg: Fix perl modules by moving them to the versioned perl directory
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
X-List-Received-Date: Sun, 11 Jun 2017 12:36:16 -0000

In order for the dpkg perl modules to be used the must reside in the
versioned perl library directory (as to be in the default include path).
Be explicit about this location in our FILES_${PN}-perl directive, so
that if this breaks in the future, the recipe will fail).  We can now
drop the custom do_configure as it wasn't fixing this problem.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
Use ${@get_perl_version(d)} not $[PERLVERSION} as only the former
evaluates correctly with per-recipe sysroots.
---
 meta/recipes-devtools/dpkg/dpkg.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 870117a3250c..3dd8193f7fa3 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -9,7 +9,7 @@ RDEPENDS_${PN}_class-native = ""
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
-inherit autotools gettext perlnative pkgconfig systemd
+inherit autotools gettext perlnative pkgconfig systemd perl-version
 
 python () {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
@@ -20,8 +20,8 @@ python () {
 export PERL = "${bindir}/perl"
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
-export PERL_LIBDIR = "${libdir}/perl"
-PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
+export PERL_LIBDIR = "${libdir}/perl/${@get_perl_version(d)}"
+PERL_LIBDIR_class-native = "${libdir}/perl-native/perl/${@get_perl_version(d)}"
 
 EXTRA_OECONF = "\
 		--disable-dselect \
@@ -37,12 +37,6 @@ PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
 EXTRA_OECONF += "TAR=tar"
 EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
 
-do_configure () {
-    echo >> ${S}/m4/compiler.m4
-    sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
-    autotools_do_configure
-}
-
 do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
@@ -73,7 +67,7 @@ FILES_update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}
 RPROVIDES_update-alternatives-dpkg += "update-alternatives"
 
 PACKAGES += "${PN}-perl"
-FILES_${PN}-perl = "${libdir}/perl"
+FILES_${PN}-perl = "${libdir}/perl/${@get_perl_version(d)}"
 
 # Split out start-stop-daemon to its own package.  Note that it
 # is installed in a different directory than the one used for
-- 
1.9.1


