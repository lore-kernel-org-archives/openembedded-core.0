Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsz5d-00087O-7n
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:05:34 +0100
Received: from mail-ee0-f71.google.com ([74.125.83.71])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 08:50:07 -0800
Received: by mail-ee0-f71.google.com with SMTP id c1so1249152eek.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=FWgPCbSIqYGoetA263EIR7NrrmDD3LCzR+Szm3m48pM=;
	b=bYdw+beXXU76IKzf+9Npw/M2fkkFeL0PghDfPcgtC7x+QOrUty6XyX096Lzv/QmINs
	OucMkoFXOX9DrDTwFVVw+CXXXOPNWsh3bo6XDcw2Ng6CAlA+QrNt/lu9lVAK3PJ64QE9
	MmjJgD+B+BTcsNDi8JPYpDfqBnZMHu9O9VNPrSCjP9qDfbbC4AY0BdTZ1BOCZKdxSBRn
	eFfsU2gQu3A07XfiK1GngU/bi23RcjPgIUx53dTIrrlzGWyfAbfhkz4tvEqimC7+B1hF
	E3NltbSU0H+rA5yvyQVdqmcOz/Y/4lzRrqh+9zCPnv8kr7Qmk3SpWFIK8S4RrxblOthN
	1hIA==
X-Received: by 10.194.92.180 with SMTP id cn20mr109767154wjb.51.1357750205406; 
	Wed, 09 Jan 2013 08:50:05 -0800 (PST)
X-Received: by 10.194.92.180 with SMTP id cn20mr109767143wjb.51.1357750205318; 
	Wed, 09 Jan 2013 08:50:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gz3sm4637422wib.2.2013.01.09.08.50.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 08:50:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 16:48:06 +0000
Message-Id: <3871eb23bfa3bad736cccf1076a4424258039403.1357749457.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357749457.git.ross.burton@intel.com>
References: <cover.1357749457.git.ross.burton@intel.com>
In-Reply-To: <cover.1357749457.git.ross.burton@intel.com>
References: <cover.1357749457.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnRU8Rzq65etlv3aYXw3NSYsVKyzx/RgxWn98374qmBY8BO6yaDVAO/j2L+3pRfFoFhBfhrcodrqboWjLav1OAwAjITSbvL9sxLtnutiudA2nBnp2q86IDl7TvQUCUAlOoXBiVrB+BxpROs/hxFnOFnYDrII2uWthhvb1Cr5FAXoqtj4isUIIqo2Q933li6f5nFybEi
Subject: [PATCH 1/3] gtk+: version installed gtk-update-icon-cache and use alternatives
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
X-List-Received-Date: Wed, 09 Jan 2013 17:05:51 -0000

With GTK+ 3 being added soon we'll have potentially two providers of
gtk-update-icon-cache.  Append a version to the binary and use
update-alternatives to ensure that the unversioned name works.

For gtk+-native the alternatives won't take effect, so install a symlink
explicitly.  This will break if we have a gtk+3-native but we can fix that if
and when that happens.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc        |   15 +++++++++++++--
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb |    2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index c6d235f..97d3650 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -23,11 +23,11 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 PACKAGECONFIG[gtk-directfb] = "--with-gdktarget=directfb,,directfb"
 
-inherit autotools gtk-doc pkgconfig
+inherit autotools gtk-doc pkgconfig update-alternatives
 
 PACKAGES += "libgail gtk-demo"
 
-FILES_${PN} = "${bindir}/gtk-update-icon-cache \
+FILES_${PN} = "${bindir}/gtk-update-icon-cache-2.0 \
 	${bindir}/gtk-query-immodules-2.0 \
 	${libdir}/lib*${SOLIBS} \
 	${datadir}/themes ${sysconfdir} \
@@ -66,6 +66,9 @@ GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
 
+ALTERNATIVE_${PN} = "gtk-update-icon-cache"
+ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-2.0"
+
 do_install () {
 	autotools_do_install
 
@@ -77,6 +80,14 @@ do_install () {
 	install -m 0644 gtk/gtkfilechooserprivate.h ${D}${includedir}/gtk-2.0/gtk/
 	install -m 0644 gtk/gtkfilechooserutils.h   ${D}${includedir}/gtk-2.0/gtk/
 	install -m 0644 gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
+
+	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
+}
+
+do_install_append_class-native () {
+	# Ideally we'd use alternatives in the sysroot, but they don't work.
+	# As we know we don't have a native GTK+ 3 (yet), make a symlink instead.
+	ln -s gtk-update-icon-cache-2.0 ${D}${bindir}/gtk-update-icon-cache
 }
 
 SYSROOT_PREPROCESS_FUNCS += "gtk_sysroot_preprocess"
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
index 553196a..028b238 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
@@ -43,7 +43,7 @@ RRECOMMENDS_${PN}_class-native = ""
 DEPENDS_class-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
 
 do_install_append_class-native () {
-	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
+	create_wrapper ${D}/${bindir}/gtk-update-icon-cache-2.0 \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 }
 
-- 
1.7.10.4



