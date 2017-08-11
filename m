Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 808AE78260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 10:52:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 03:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,357,1498546800"; d="scan'208";a="1002559054"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2017 03:52:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 13:51:56 +0300
Message-Id: <5b8afa61105f5eaa6b8f7eff5c25704cfef191d4.1502447434.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
References: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/5] dnf: rrecommend gnupg
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
X-List-Received-Date: Fri, 11 Aug 2017 10:52:03 -0000

This makes it possible to enable 'repo_gpgcheck' in dnf.conf. That is, do
GPG signature check on repository metadata. Without gnupg dnf fails with
"error: Invalid crypto engine."

[YOCTO #11209]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/dnf/dnf_2.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_2.5.1.bb b/meta/recipes-devtools/dnf/dnf_2.5.1.bb
index cdc2a8549f..88172532bf 100644
--- a/meta/recipes-devtools/dnf/dnf_2.5.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.5.1.bb
@@ -27,6 +27,8 @@ EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -
 
 BBCLASSEXTEND = "native nativesdk"
 RDEPENDS_${PN}_class-target += "python3-core python3-codecs python3-netclient python3-email python3-threading python3-distutils librepo python3-shell python3-subprocess libcomps libdnf python3-sqlite3 python3-compression python3-rpm python3-iniparse python3-json python3-importlib python3-curses python3-argparse python3-misc python3-gpg"
+# Recommend gnupg so that GPG signature check on repository metadata is possible
+RRECOMMENDS_${PN}_class-target += "gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
 # .spec file in dnf source tree does (and then Fedora and dnf documentation
-- 
2.12.3


