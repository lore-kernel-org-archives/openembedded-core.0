Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5D88D77B3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490705003; x=1522241003;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xlvdZW2GQsueToGzO0yHT7D9buZGZ77F5Tyd/JjtvO4=;
	b=u/YfEqpEjpnDd6HLT1GiE2aYfM5vlu6EA8iVXyCvhO6QueBD7hTC12EF
	4hmmvYoUc3C2MnCRK8wQoTM0oPpVHw==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="241207887"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2017 05:43:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E8D636A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:04 +0300
Message-Id: <0e5fc0c9daf40d6e89d02755f8b387eb465b1202.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/9] wic: remove runner.show API
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:21 -0000

Replaced runner.show call to exec_cmd call in bootimg-pcbios
plugin. Removed runner.show API as it's not used anywhere else.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  6 ++----
 scripts/lib/wic/utils/runner.py                  | 24 ------------------------
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index bfb8ff5..5890c12 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -81,10 +81,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         logger.debug("Installing MBR on disk %s as %s with size %s bytes",
                      disk_name, full_path, disk.min_size)
 
-        rcode = runner.show(['dd', 'if=%s' % mbrfile,
-                             'of=%s' % full_path, 'conv=notrunc'])
-        if rcode != 0:
-            raise WicError("Unable to set MBR to %s" % full_path)
+        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
+        exec_cmd(dd_cmd, native_sysroot)
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 56d7ea3..348557a 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -82,30 +82,6 @@ def runtool(cmdln_or_args, catch=1):
 
     return (process.returncode, out)
 
-def show(cmdln_or_args):
-    """Show all messages using logger.debug."""
-
-    rcode, out = runtool(cmdln_or_args, catch=3)
-
-    if isinstance(cmdln_or_args, list):
-        cmd = ' '.join(cmdln_or_args)
-    else:
-        cmd = cmdln_or_args
-
-    msg = 'running command: "%s"' % cmd
-    if out:
-        out = out.strip()
-    if out:
-        msg += ', with output::'
-        msg += '\n  +----------------'
-        for line in out.splitlines():
-            msg += '\n  | %s' % line
-        msg += '\n  +----------------'
-
-    logger.debug(msg)
-
-    return rcode
-
 def outs(cmdln_or_args, catch=1):
     # get the outputs of tools
     return runtool(cmdln_or_args, catch)[1].strip()
-- 
2.1.4


