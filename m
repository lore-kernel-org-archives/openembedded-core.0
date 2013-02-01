Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1U1FX4-00062k-Pw
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 13:16:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r118q8vn009619
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 00:52:08 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 1 Feb 2013 00:52:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 16:55:29 +0800
Message-ID: <47b20bea7d354a047a2d4b0284007bd45fa93b2c.1359687579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1359687579.git.liezhi.yang@windriver.com>
References: <cover.1359687579.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] bitbake.conf: add STAMPS_DIR for constructing STAMP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 12:16:14 -0000
Content-Type: text/plain

Add STAMPS_DIR for constructing STAMP, the defination of STAMP is:

STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"

We can only change the TMPDIR if we want to change the STAMP's location,
but the bb_cache.dat would be regenerated if TMPDIR changes, so add
STAMPS_DIR for constructing it, and add it to the BB_ENV_EXTRAWHITE,
this is very usefull for the "bitbake -S", since then it can be run by:

STAMPS_DIR=<path> bitbake -S <recipe>

which will avoid putting the stamps to ${TMPDIR}/stamps.

BTW, break the too long BB_ENV_EXTRAWHITE into several lines.

[YOCTO #1659]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf       | 5 +++--
 scripts/oe-buildenv-internal | 6 +++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 223c03f..31afbee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -336,8 +336,9 @@ GITDIR = "${CO_DIR}/git2"
 BZRDIR = "${CO_DIR}/bzr"
 HGDIR = "${CO_DIR}/hg"
 
-STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
-STAMPCLEAN = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
+STAMPS_DIR ?= "${TMPDIR}/stamps"
+STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
+STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index c3a30fb..d3a8beb 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -80,4 +80,8 @@ unset BITBAKEDIR
 # Used by the runqemu script
 export BUILDDIR
 export PATH
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER SCREENDIR"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy
+    https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK
+    BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE
+    GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER SCREENDIR
+    STAMPS_DIR"
-- 
1.7.11.2



