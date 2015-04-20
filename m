Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4003873D81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:48:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2015 09:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716384572"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:47:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:47:05 +0100
Message-Id: <ffbf5f215d20cab0790340c5e622423faa58c09e.1429548323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] devtool: force use of bash when running build within extensible SDK
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
X-List-Received-Date: Mon, 20 Apr 2015 16:48:02 -0000

Ubuntu's default dash shell causes oe-init-build-env to behave a bit
differently - (a) it can't pick up the OE root directory and (b) it
can't see any build directory specified as a command-line argument
(since dash doesn't pass through any arguments specified to sourced
scripts). We could work around these but doing so requires some internal
knowledge of the script; a much simpler fix is just to force running the
command under bash since it's expected to be installed on every distro.

Thanks to Chen Qi <Qi.Chen@windriver.com> for this fix.

Fixes [YOCTO #7614].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 3f8158e..78ae0aa 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -30,6 +30,11 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
     if not 'cwd' in options:
         options["cwd"] = builddir
     if init_path:
+        # As the OE init script makes use of BASH_SOURCE to determine OEROOT,
+        # and can't determine it when running under dash, we need to set
+        # the executable to bash to correctly set things up
+        if not 'executable' in options:
+            options['executable'] = 'bash'
         logger.debug('Executing command: "%s" using init path %s' % (cmd, init_path))
         init_prefix = '. %s %s > /dev/null && ' % (init_path, builddir)
     else:
-- 
2.1.0


