Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWrC0-0005R5-F5 for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:35:40 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWr8i-0005k7-7s
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:32:16 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308125091.6879.39.camel@lenovo.internal.reciva.com>
References: <1308065443.25285.268.camel@phil-desktop>
	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
	<1308125091.6879.39.camel@lenovo.internal.reciva.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 15 Jun 2011 15:32:15 +0100
Message-ID: <1308148335.25285.1774.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 14:35:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 09:04 +0100, Phil Blundell wrote:
> One slightly annoying thing is that (e)glibc isn't buildable with gold
> because the linker scripts don't work.  So a little bit of patching is
> going to be needed to have it use ld.bfd there.  There might be some
> other packages with similar issues but I haven't come across any yet.

I think something like this is probably what's required for that.

From 48eaba1da89086b8edccaa03c27075d78635ab01 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Wed, 15 Jun 2011 15:22:47 +0100
Subject: [PATCH] gcc-cross-intermediate: use ld.bfd if distro prefers gold


Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../gcc/gcc-cross-intermediate.inc                 |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index 92c3ce2..05b5dbc 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -7,6 +7,10 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
 # sysroot is needed in case we use libc-initial
+#
+# Glibc won't compile with gold, and building glibc is the whole point of
+# this recipe.   So we select ld.bfd explicitly here if gold is the distro's 
+# preferred linker.
 EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--enable-shared \
 		--disable-multilib \
@@ -17,7 +21,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--with-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
 		--with-build-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
 		${EXTRA_OECONF_INTERMEDIATE} \
-		${@get_gcc_fpu_setting(bb, d)}"
+		${@get_gcc_fpu_setting(bb, d)} \
+		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
-- 
1.7.2.5





