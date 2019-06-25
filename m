Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 29C747E6DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 22:13:20 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.76.69.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 235DA2086D;
	Tue, 25 Jun 2019 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561500802;
	bh=mhHaJvEWDqRBYr0uR07V1A3jfNMw8GNAvgtBOojguzw=;
	h=From:To:Cc:Subject:Date:From;
	b=Eh0oTqOmNfafu0CR2ICV4bnbWtVWWIb7Bkd5mSWXz3wBlPNGMMKKPxk5PgoZ1MLun
	/qJWW1Ns59FH87caWR+D4GnzHppvGjxbcbbOVPgZGeNVGyweVWBw9S0ExFxuPGpHXU
	a7RXM9bfPa6RFGJAWmtCHEvz+XdEK9GzftoVYdro=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 22:13:19 +0000
Message-Id: <20190625221319.102643-1-okaya@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Tue, 25 Jun 2019 22:13:21 -0000
Content-Transfer-Encoding: 8bit

do_rootfs: The postinstall intercept hook 'update_udev_hwdb'
do_rootfs: The postinstall intercept hook 'update_gio_module_cache' failed
do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
do_rootfs: The postinstall intercept hook 'update_icon_cache' failed

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 scripts/postinst-intercepts/update_font_cache    |  6 ++++--
 .../postinst-intercepts/update_gio_module_cache  | 10 +++++++---
 scripts/postinst-intercepts/update_icon_cache    | 16 +++++++++-------
 scripts/postinst-intercepts/update_pixbuf_cache  |  5 ++++-
 scripts/postinst-intercepts/update_udev_hwdb     |  6 ++++--
 5 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 3053c7065f4..954acbb41b2 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -5,5 +5,7 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
-chown -R root:root $D${fontconfigcachedir}
+if [ -f $D${libexecdir}/${binprefix}fc-cache ]; then
+	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+	chown -R root:root $D${fontconfigcachedir}
+fi
diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index c87fa85db9e..e8483cb0bf5 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -5,7 +5,11 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
+if [ -f $D${libexecdir}/${binprefix}gio-querymodules ]; then
+
+	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
+
+	[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
+		chown root:root $D${libdir}/gio/modules/giomodule.cache
+fi
 
-[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
-	chown root:root $D${libdir}/gio/modules/giomodule.cache
diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
index 212209a9daf..a67ff7ef970 100644
--- a/scripts/postinst-intercepts/update_icon_cache
+++ b/scripts/postinst-intercepts/update_icon_cache
@@ -5,12 +5,14 @@
 
 set -e
 
-# update native pixbuf loaders
-$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
+if [ -d $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0 ]; then
+	# update native pixbuf loaders
+	$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
-for icondir in $D/usr/share/icons/*/ ; do
-    if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
-    fi
-done
+	for icondir in $D/usr/share/icons/*/ ; do
+	    if [ -d $icondir ] ; then
+	        gtk-update-icon-cache -fqt  $icondir
+	    fi
+	done
+fi
 
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index ea12814474e..166422e5c37 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -8,6 +8,9 @@ set -e
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 export GDK_PIXBUF_FATAL_LOADER=1
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
+if [ -d $D${libdir}/gdk-pixbuf-2.0 ]; then
+	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
     >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
     sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
+fi
+
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index c4fb2bffcbf..7b6e38338f3 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -5,5 +5,7 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
-chown root:root $D${sysconfdir}/udev/hwdb.bin
+if [ -d $D/lib/udev/hwdb.d ]; then
+	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
+	chown root:root $D${sysconfdir}/udev/hwdb.bin
+fi
-- 
2.21.0


