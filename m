Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 537027317F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 18:21:29 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 72A6E180FDE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:12:04 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 19:12:00 +0100
Message-Id: <1b8e3d820ac8f20f89ba01e1f88543deed69620e.1450288828.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
In-Reply-To: <cover.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
Subject: [PATCH 4/4] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
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
X-List-Received-Date: Wed, 16 Dec 2015 18:21:31 -0000

The typical symlinks are:

* /bin -> usr/bin
* /sbin -> usr/sbin
* /lib -> usr/lib
* /usr/sbin -> bin

It is checked that only sane symlinks are created, so a half-merged /usr
(e.g, merging bin and sbin, but not lib) is feasible as well.

The following options in a distro configuration create a full Fedora-style
merged /usr:

  DISTRO_FEATURES_DEFAULT += "merged-usr"
  base_bindir = "${exec_prefix}/bin"
  base_sbindir = "${exec_prefix}/bin"
  sbindir = "${exec_prefix}/bin"
  base_libdir = "${exec_prefix}/${baselib}"
  nonarch_base_libdir = "${exec_prefix}/lib"

[YOCTO #7040]

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 0c1171f..852f4f5 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -134,6 +134,28 @@ do_install () {
 	fi
 
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','merged-usr','true','false',d)}; then
+		if [ "${base_bindir}" != "/bin" ]; then
+			ln -snf "${@d.getVar('base_bindir', True)[1:]}" ${D}/bin
+		fi
+
+		if [ "${base_sbindir}" != "/sbin"  ]; then
+			ln -snf "${@d.getVar('base_sbindir', True)[1:]}" ${D}/sbin
+		fi
+
+		if [ "${nonarch_base_libdir}" != "/lib" ]; then
+			ln -snf "${@d.getVar('nonarch_base_libdir', True)[1:]}" ${D}/lib
+		fi
+
+		if [ "${base_libdir}" != "/${baselib}" ]; then
+			ln -snf "${@d.getVar('base_libdir', True)[1:]}" ${D}/${baselib}
+		fi
+
+		if [ "${bindir}" = "${exec_prefix}/bin" -a "${sbindir}" = "${exec_prefix}/bin" ]; then
+			ln -snf bin ${D}${exec_prefix}/sbin
+		fi
+	fi
 }
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
-- 
2.6.4


