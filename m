Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5758F737FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 15:00:18 +0000 (UTC)
Received: by wesw55 with SMTP id w55so20904471wes.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hRu0Sb0KeWbSG9dMl9ARvDpaXKJBJqY+4aZuU8q85GA=;
	b=JoHtBczysGwCUeTy3YQdbSY7S80j0C84THYyn1dnW+vqfjTmS3m4n3yUD5C7+U8EQ8
	CKeuZwK1kEY+x3yb+Yd1u0Y2XRd5zs2evWH4+BIZTvPnPzSZGQ3KPxTKpRcvX5GVAyYZ
	bNn2gTKXJnqbiZSFGTt3IPTwTaqR/2dZcvTU8gRzwot7NzNd51UjIQQzhZMEN1h/URga
	JE4+Fl6LGWJ/k66ZdvVJCQRYV2C35+IoaRA1c3epPU5ZimMMkV2OPs1rlRyc0dPJ6uTg
	WAkJPlfTrKp9CbXOGoPl6uXFriLN6jyEHp/jI5b/P0/PcYrvXKTSquZ0MJXdLtRGLnD9
	IpvQ==
X-Gm-Message-State: ALoCoQleiU1clwPoJkAU7z4lLkXvOhLH04ocPt7ZlF4yjQO+UVonCLMqvUZehEH6+uiDIG7qntST
X-Received: by 10.194.192.4 with SMTP id hc4mr28937044wjc.59.1425049219534;
	Fri, 27 Feb 2015 07:00:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dt7sm3138905wib.19.2015.02.27.07.00.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 07:00:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 14:57:47 +0000
Message-Id: <1425049068-11139-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425049068-11139-1-git-send-email-ross.burton@intel.com>
References: <1425049068-11139-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] systemd: use PACKAGECONFIG for PAM enable/disable
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
X-List-Received-Date: Fri, 27 Feb 2015 15:00:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_219.bb |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 800a495..747964e 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -20,7 +20,6 @@ PROVIDES = "udev"
 PE = "1"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
@@ -56,7 +55,7 @@ LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz"
+PACKAGECONFIG ??= "xz ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
@@ -73,6 +72,7 @@ PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
@@ -86,7 +86,6 @@ rootlibexecdir = "${rootprefix}/lib"
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  --with-roothomedir=${ROOT_HOME} \
-                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --disable-coredump \
                  --disable-introspection \
                  --disable-kdbus \
@@ -252,6 +251,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/pam.d/ \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
@@ -279,7 +279,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/71-seat.rules \
                 /lib/udev/rules.d/73-seat-late.rules \
                 /lib/udev/rules.d/99-systemd.rules \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
                "
 
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-- 
1.7.10.4


