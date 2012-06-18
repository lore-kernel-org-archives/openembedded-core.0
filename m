Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SggLb-0005T0-Et
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 20:06:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2012 10:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="159108351"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.122])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2012 10:55:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 18:55:56 +0100
Message-Id: <1340042156-25187-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] conf/bitbake.conf: fix reparsing after -p is used
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
X-List-Received-Date: Mon, 18 Jun 2012 18:06:43 -0000

The bitbake wrapper script is set up such that the -p (--parse-only)
command line option is not executed under pseudo, and it sets the
PSEUDO_BUILD variable to indicate whether or not pseudo is being used.
Since PSEUDO_BUILD is allowed through into the environment via
BB_ENV_EXTRAWHITE it influences the data hash and thus if you run
"bitbake -p" and then run bitbake again to actually build something, the
change to PSEUDO_BUILD causes the cache from the -p execution not to be
used. This is fixed simply by adding PSEUDO_BUILD to
BB_HASHCONFIG_WHITELIST in bitbake.conf so that it doesn't influence the
data hash.

Fixes [YOCTO #2600].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 97930a7..12598f4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -746,7 +746,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasic"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE"
-BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY"
+BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY PSEUDO_BUILD"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc defaultval _append _prepend deps depends lockfiles type vardepsexclude \
                                vardeps vardepvalue file-checksums python func task export unexport noexec \
                                nostamp dirs cleandirs sstate-lockfile-shared prefuncs postfuncs export_func \
-- 
1.7.9.5



