Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB28576D72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 17:30:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7QHUboR004286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 10:30:37 -0700 (PDT)
Received: from co-op.corp.ad.wrs.com (128.224.56.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 10:30:36 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Aug 2015 13:30:27 -0400
Message-ID: <1440610227-31587-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.4.4
MIME-Version: 1.0
Subject: [PATCH] gnome: revector some older versions of pkgs back to bz2 compression
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
X-List-Received-Date: Wed, 26 Aug 2015 17:30:46 -0000
Content-Type: text/plain

In commit 429985c1f6e50baec6ba03f35f323a4e8c7f72dd and/or
OE-Core rev: 0f9ea90dde8f63aace19531e066580e41bf3d7cc
("classes/gnomebase: change tarball compression to xz")

the default changed, and some pkgs were kept back on bz2 where
the xz did not exist.  However it seems some were missed, and
I found the fetcher gets 404s on the ones in this commit.

Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 2c526c8edefd..4f95066ec51e 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -10,6 +10,7 @@ PR = "r4"
 inherit gnomebase gtk-icon-cache
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
 SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
+GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "\
     file://disable-scrollkeeper.patch \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 860851d98379..1bbfb17d9f05 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-
 
 SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
 SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
                 ${base_libdir}/security/*${SOLIBSDEV} \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
index 43379bdca2e5..e24188232774 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -17,3 +17,4 @@ DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
 
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
+GNOME_COMPRESS_TYPE="bz2"
-- 
2.4.4


