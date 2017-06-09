Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 86D7D78268
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 00:00:28 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id h82so2782952ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 17:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AzUqHdrE4IwaCXWG0Lho0bhWOdB5Xnkfrq7zdT0oCzs=;
	b=pMqB/Si0N3E/XgMO/y25RhmUC08+kDdt8Ajl28qKpM5G9Rvv3jldm29oIaNfupTHDw
	554htI6RuhIkEKoJOUXOANtFCgs41O1SSpHsJdJsl8rc4fK62OOeSkdpGqNuQHbKK4zd
	6C2ZSIcVAEFW8V5XRSJYAv6FvjP9BBq0ivrMfjS62gDLkMX140bnIfYIw61RTAFObVBr
	o+1O5AzAj+Lni86jiK4tlSG9VCgAuL+kAQlUgBBPp/hiG1vYrei+UW6tg2XjWHR04HH5
	tgDga0NS0tZ27B9bMe/aByVdErs1jF/j2XDraa1qyJJBCehbbI9AtZs5OvuD1jCVZwau
	pqjg==
X-Gm-Message-State: AODbwcC4efMeRWIPD8cJS1R2dsJ1Mx6doOYJfMA0l6e+cecjx1Txejr3
	IM85HgilpwpW3kmX
X-Received: by 10.129.128.70 with SMTP id q67mr12638627ywf.232.1496966427802; 
	Thu, 08 Jun 2017 17:00:27 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	w191sm3085796ywg.10.2017.06.08.17.00.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 17:00:27 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:00:40 -0400
Message-Id: <1496966441-30260-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496966441-30260-1-git-send-email-trini@konsulko.com>
References: <1496966441-30260-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/3] dpkg: Fix perl modules by moving them to the versioned perl directory
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
X-List-Received-Date: Fri, 09 Jun 2017 00:00:28 -0000

In order for the dpkg perl modules to be used the must reside in the
versioned perl library directory (as to be in the default include path).
Be explicit about this location in our FILES_${PN}-perl directive, so
that if this breaks in the future, the recipe will fail).  We can now
drop the custom do_configure as it wasn't fixing this problem.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 870117a3250c..a61839b21540 100644
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
+export PERL_LIBDIR = "${libdir}/perl/${PERLVERSION}"
+PERL_LIBDIR_class-native = "${libdir}/perl-native/perl/${PERLVERSION}"
 
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
+FILES_${PN}-perl = "${libdir}/perl/${PERLVERSION}"
 
 # Split out start-stop-daemon to its own package.  Note that it
 # is installed in a different directory than the one used for
-- 
1.9.1


