Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZlrs-0005Kb-Gx
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:35:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2012 09:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149558432"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.128])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2012 09:25:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 17:25:04 +0100
Message-Id: <8fdf88cfb533fdca1ff36ff37c9ecee98193430b.1338395048.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1338395048.git.paul.eggleton@linux.intel.com>
References: <cover.1338395048.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1338395048.git.paul.eggleton@linux.intel.com>
References: <cover.1338395048.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] bitbake.conf: set an exclusion list for varflags in checksums
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
X-List-Received-Date: Wed, 30 May 2012 16:35:30 -0000

Set BB_SIGNATURE_EXCLUDE_FLAGS, which is used by the new varflag
checksum code in BitBake. The list is intended to cut out most of the
varflags that are generated internally, don't influence the output or
are already included in the checksum in some way. If need be this list
can be extended in the future. The existing vardepsexclude mechanism
can also be used to exclude undesired varflags, but they must be fully
specified, e.g.:

do_patch[vardepsexclude] += "do_patch[someflag]"

Implements [YOCTO #2517].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 48287a7..cdc2dba 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -747,6 +747,10 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 BB_SIGNATURE_HANDLER ?= "OEBasic"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY"
+BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc defaultval _append _prepend deps depends lockfiles type vardepsexclude \
+                               vardeps vardepvalue file-checksums python func task export unexport noexec \
+                               nostamp dirs cleandirs sstate-lockfile-shared prefuncs postfuncs export_func \
+                               deptask rdeptask recrdeptask nodeprrecs stamp-base stamp-extra-info"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
1.7.9.5



