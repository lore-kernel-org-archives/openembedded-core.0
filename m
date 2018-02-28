Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 526FA78853
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:56:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1S5ubqk027581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:56:37 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Feb 2018 21:56:11 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Feb 2018 13:56:36 +0800
Message-ID: <c3450d9b913dd74b47d5a6b68518d3d06802d7a8.1519797175.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1519797175.git.Qi.Chen@windriver.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] meson.bbclass: fix to build for more projects
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
X-List-Received-Date: Wed, 28 Feb 2018 05:56:37 -0000
Content-Type: text/plain

We should use the value of CC for the c compiler setting in cross
compilation configuration file for meson. For example, if we only
use ${HOST_PREFIX}gcc instead of ${CC}, we would meet the following
do_compile failure for systemd.

  cc1: fatal error: linux/capability.h: No such file or directory

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/meson.bbclass | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 31d32a5..97dcf81 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -41,24 +41,19 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
-CCOMPILER ?= "gcc"
-CXXCOMPILER ?= "g++"
-CCOMPILER_toolchain-clang = "clang"
-CXXCOMPILER_toolchain-clang = "clang++"
-
 def meson_array(var, d):
     return "', '".join(d.getVar(var).split()).join(("'", "'"))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS"
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
 [binaries]
-c = '${HOST_PREFIX}${CCOMPILER}'
-cpp = '${HOST_PREFIX}${CXXCOMPILER}'
+c = [${@meson_array('CC', d)}]
+cpp = [${@meson_array('CXX', d)}]
 ar = '${HOST_PREFIX}ar'
-ld = '${HOST_PREFIX}ld'
+ld = [${@meson_array('LD', d)}]
 strip = '${HOST_PREFIX}strip'
 readelf = '${HOST_PREFIX}readelf'
 pkgconfig = 'pkg-config'
-- 
1.9.1


