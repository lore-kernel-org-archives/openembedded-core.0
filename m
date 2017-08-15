Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 421FD784F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:35:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843455"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:35:01 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:51 +0300
Message-Id: <0fb1783b18ae67dc7b2528f42090dc3c9c2537b3.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
References: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v4 2/8] dnf: rrecommend gnupg
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
X-List-Received-Date: Tue, 15 Aug 2017 11:35:00 -0000

This makes it possible to enable 'repo_gpgcheck' in dnf.conf. That is, do
GPG signature check on repository metadata. Without gnupg dnf fails with
"error: Invalid crypto engine."

[YOCTO #11209]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/dnf/dnf_2.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_2.6.3.bb b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
index ade55ea0a8..51072901e4 100644
--- a/meta/recipes-devtools/dnf/dnf_2.6.3.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
@@ -26,6 +26,8 @@ EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -
 
 BBCLASSEXTEND = "native nativesdk"
 RDEPENDS_${PN}_class-target += "python3-core python3-codecs python3-netclient python3-email python3-threading python3-distutils librepo python3-shell python3-subprocess libcomps libdnf python3-sqlite3 python3-compression python3-rpm python3-iniparse python3-json python3-importlib python3-curses python3-argparse python3-misc python3-gpg"
+# Recommend gnupg so that GPG signature check on repository metadata is possible
+RRECOMMENDS_${PN}_class-target += "gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
 # .spec file in dnf source tree does (and then Fedora and dnf documentation
-- 
2.12.3


