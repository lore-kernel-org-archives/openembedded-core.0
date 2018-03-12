Return-Path: <xiao.zhang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC90788BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:13:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2C9DPB3011041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:13:41 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:12:37 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:12:58 -0700
Message-ID: <20180312091303.121887-2-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] python3: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:13:50 -0000
Content-Type: text/plain

Config file python3.5m-config conflicts between 32 and 64 bit packages.
Use update-alternatives to add base_libdir as suffix to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-devtools/python/python3_3.5.4.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.4.bb b/meta/recipes-devtools/python/python3_3.5.4.bb
index a94d0096f1..7544e3318c 100644
--- a/meta/recipes-devtools/python/python3_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3_3.5.4.bb
@@ -48,7 +48,13 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header python3native pkgconfig
+inherit autotools multilib_header python3native pkgconfig update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+ALTERNATIVE_${PN}-core = "python3.5m-config"
+ALTERNATIVE_LINK_NAME[python3.5m-config] = "${bindir}/python3.5m-config"
+ALTERNATIVE_TARGET[python3.5m-config] = "${bindir}/python3.5m-config-${MULTILIB_SUFFIX}"
 
 CONFIGUREOPTS += " --with-system-ffi "
 
@@ -204,6 +210,8 @@ py_package_preprocess () {
 	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
 	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=2)"
 	cd -
+
+	mv ${PKGD}/${bindir}/python3.5m-config ${PKGD}/${bindir}/python3.5m-config-${MULTILIB_SUFFIX}
 }
 
 # manual dependency additions
-- 
2.11.0


