Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMt2M-0008CM-TJ
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 04:32:31 +0200
Received: by pzk36 with SMTP id 36so1026494pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 19:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gOhvNsAZkpb5aqsgUuRZyLco7TPBpODu0RnY3okH+Eo=;
	b=jOhqEPBb/B5BrhPJ37QUMNf2q+JzylHWSo31VO6h5Xy8fqKJoXXvQ7/+WD1EV0+NOE
	5tQo3j6UM8tAnaePiO95Kes/bDw6Vt7vnyja7ru/ut0AMgvqAp74oBi/SHTuNikyklyf
	X7+w7Xbij23WrnX1RJHUWu7eKeZhlLFX1pCxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZBsRfOj3LQLk5umZyEF3H+QaUU7rFlBb5u6/4ou3i1KIkr6KEPWekc2jq0a5kOqxUI
	DFsqa0c5Pas1AcF4bG/0nVI2+Lk899xTpMgVPzbyLkcRpxkXXG9RDpcdBUvKi6HbyiVM
	yfGGk57DJJj4gffVBYgx6YezcJ3koOXzUbvOY=
Received: by 10.68.48.3 with SMTP id h3mr3934614pbn.505.1305772174362;
	Wed, 18 May 2011 19:29:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f1sm1433018pbm.93.2011.05.18.19.29.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 19:29:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2011 19:29:23 -0700
Message-Id: <b1d1f4f3cdbfd52c547252d2c8663b5877bcc2ed.1305772107.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305772107.git.raj.khem@gmail.com>
References: <cover.1305772107.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Thu, 19 May 2011 02:32:31 -0000

We enable gtk/gnome in distcc that code uses loadavg()
a function unimplemented in uclibc. Therefore for uclibc
we disable gnome and gtk+ features in distcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index 1f5c2af..d6e51d9 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -6,7 +6,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r6"
 
-DEPENDS = "avahi gtk+"
+DEPENDS = "avahi"
+DEPENDS_append-libc-glibc = " gtk+ "
 RRECOMMENDS_${PN} = "avahi-daemon"
 
 # Upstream change this patch periodically so store locally
@@ -24,17 +25,24 @@ inherit autotools pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "distcc"
 
-EXTRA_OECONF = " --with-gtk "
-
-do_install_append() {
+EXTRA_OECONF_libc-glibc = " --with-gtk "
+EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
+do_install_append_libc-glibc() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
+    install -d ${D}${datadir}/distcc/
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
+do_install_append_libc-uclibc() {
+    install -d ${D}${sysconfdir}/init.d/
+    install -d ${D}${sysconfdir}/default
+    install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
+    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
+}
 
-PACKAGES += "distcc-distmon-gnome"
+PACKAGES_append_libc-glibc = " distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
-- 
1.7.4.1



