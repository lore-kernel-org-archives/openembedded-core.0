Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TQZUi-0007uH-P7
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 10:05:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9N7qLJv010893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:52:21 -0700 (PDT)
Received: from usp-ub10.wrs.com (128.224.163.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 00:52:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2012 15:52:27 +0800
Message-ID: <7ed4d03d62b0fe0e05bb974122e544ae02f7354e.1350957811.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1350957811.git.liezhi.yang@windriver.com>
References: <cover.1350957811.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] bitbake.conf: add BUILDNAME to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Tue, 23 Oct 2012 08:05:49 -0000
Content-Type: text/plain

There is an error when "bitbake -S <image>", e.g., core-image-minimal:

NOTE: Reparsing files to collect dependency data
ERROR: Bitbake's cached basehash does not match the one we just generated (/path/to/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
ERROR: The mismatched hashes were 730202c9538c4fc1f2e3d1fefa3595f0 and a91bb9451c182e19bfe405ac1bafcc0f

The mismatch can be caused by 2 reasons:

1) BUILDNAME, there is no member of BUILDNAME in the cache when first
   parsing the recipes, it is added by the BBCooker::buildSetVars before
   start the building, so there would be mismatches when compare the
   re-parsed basehash (contains BUILDNAME) to the previous one (no
   BUILDNAME) which is from the cache.

   Add the BUILDNAME to BB_HASHBASE_WHITELIST would fix the problem.

2) DATE or TIME, they are in the cache data and will change when
   re-parsing, move them from BB_HASHCONFIG_WHITELIST to
   BB_HASHBASE_WHITELIST which can be ingored by basehash would fix the
   problem.

   Another fix for DATE or TIME is not to let them expand immediately,
   change: (":=" to "=")
   DATE := "${@time.strftime('%Y%m%d',time.gmtime())}"
   TIME := "${@time.strftime('%H%M%S',time.gmtime())}"

   To:

   DATE = "${@time.strftime('%Y%m%d',time.gmtime())}"
   TIME = "${@time.strftime('%H%M%S',time.gmtime())}"

[YOCTO #3299]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 65efbb9..41c27eb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -774,8 +774,8 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
-    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE"
-BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER \
+    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE DATE TIME BUILDNAME"
+BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} SESSION_MANAGER \
     DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK \
     XAUTHORITY PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS"
-- 
1.7.1



