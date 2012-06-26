Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SjSjp-00062p-Rg
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 12:11:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5QA0L37022690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 03:00:21 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 26 Jun 2012 03:00:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2012 18:01:04 +0800
Message-ID: <f3ed48ee5e3307e45781d80f81cc9d5019f2c90f.1340619275.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1340619275.git.liezhi.yang@windriver.com>
References: <cover.1340619275.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] bitbake.conf: disable ccache explicitly if it is not enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2012 10:11:14 -0000
Content-Type: text/plain

The autogen-native built error on FC17:

ccache: failed to create /dev/null/.ccache

This is because the default gcc command of FC17 is a symlink to ccache,
so the ccache will always be used regardless to the setting of CCACHE,
ccache uses $HOME/.ccache as the CACHE_DIR by default, but autogen set
HOME=/dev/null, so the error happens.

Disable ccache explicitly if it is not enabled would fix the problem,
otherwise it would always use ccache regardless to the setting of CCACHE
on Fedora 17.

The ccache 3.1.7 has a bug, it would always create $CCCHE_DIR/.ccache
even CCACHE_DISABLE=1.

Unset CCACHE_DISABLE in ccache.bbclass, since ccache only checks whether
there is a CCACHE_DISABLE in the environment or not, it doesn't care about
its value, so we need unset it explicitly when enable ccache.

[YOCTO #2554]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass |    1 +
 meta/conf/bitbake.conf      |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 10f9b9f..5aa2da2 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,5 +1,6 @@
 CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
 export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+CCACHE_DISABLE[unexport] = "1"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b6fbc7a..da8e780 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -414,6 +414,14 @@ export PATH
 ##################################################################
 
 CCACHE ??= ""
+# Disable ccache explicitly if CCACHE is null since gcc may be a symlink
+# of ccache some distributions (e.g., Fedora 17).
+export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
+# Assign CCACHE_DIR a default vaule to fix a bug of ccache 3.1.7,
+# since it would always create CCACHE_DIR/.ccache even if
+# CCACHE_DISABLE = 1.
+export CCACHE_DIR ??= "${@os.getenv('HOME')}"
+
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.1



