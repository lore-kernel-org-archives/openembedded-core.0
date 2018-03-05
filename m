Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B74E078694
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 02:01:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2521qKH027971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2018 18:01:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 4 Mar 2018 18:01:21 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2018 10:02:01 +0800
Message-ID: <e0b79d622ee27701999e1fd2c0691e22d0cc09ba.1520213817.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1520213817.git.Qi.Chen@windriver.com>
References: <cover.1520213817.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Mon, 05 Mar 2018 02:01:51 -0000
Content-Type: text/plain

We should use the value of CC for the c compiler setting in cross
compilation configuration file for meson. For example, if we only
use ${HOST_PREFIX}gcc instead of ${CC}, we would meet the following
do_compile failure for systemd.

  cc1: fatal error: linux/capability.h: No such file or directory

Do the same change for LD, AR, NM, STRIP and READELF.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/meson.bbclass | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 31d32a5..2d7ee4f 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -41,26 +41,22 @@ MESON_CROSS_FILE = ""
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
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
 [binaries]
-c = '${HOST_PREFIX}${CCOMPILER}'
-cpp = '${HOST_PREFIX}${CXXCOMPILER}'
-ar = '${HOST_PREFIX}ar'
-ld = '${HOST_PREFIX}ld'
-strip = '${HOST_PREFIX}strip'
-readelf = '${HOST_PREFIX}readelf'
+c = [${@meson_array('CC', d)}]
+cpp = [${@meson_array('CXX', d)}]
+ar = [${@meson_array('AR', d)}]
+nm = [${@meson_array('NM', d)}]
+ld = [${@meson_array('LD', d)}]
+strip = [${@meson_array('STRIP', d)}]
+readelf = [${@meson_array('READELF', d)}]
 pkgconfig = 'pkg-config'
 
 [properties]
-- 
1.9.1


