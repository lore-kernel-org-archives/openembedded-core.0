Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DB2C624CE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9429.1788100183423032694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DD+0Vm5C;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2026083014294183556ab2fc00020779-jiznzj@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026083014294183556ab2fc00020779
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zkgVD51Vz547vo1vKaTITG5ZTUX2Ui45Jsazf727SXA=;
 b=DD+0Vm5CveCjzA46uh0/XinLormlzEWDMua8F+lT4kUaDbYtWhxO5/HHeod2+l+9UYbKxg
 corgw3mvyA0Ki4Z6eenVrZsH0L5hXEdIgK4ZyuM4lZjmEgweBeolEPDRwGifHC17keV6mDlg
 xsR7Oe9icS9+fzFsMbBFZgUZ5QYbuXgOjS216r+sJBxhFVm4nH37Pc3hckPp/0N5phJxXqRr
 1mAuNrcdOQVUPf4hhd6bO7q+J3uC2yLDzfgGTh56qsfFea99WfVuhxghAkNHSKAx/N5WZxCL
 iltTzN52n953cjCH9mtBZUTFZVmkVXIsa+ppBQpWEinV06dgCE4JtvZQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/24] devtool: ide-sdk: auto-disable ssh host key checking for loopback targets
Date: Sun, 30 Aug 2026 16:28:36 +0200
Message-ID: <20260830142922.17241-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244663

From: Adrian Freihofer <adrian.freihofer@siemens.com>

QEMU instances reached via slirp/hostfwd (e.g. root@localhost) get a new
ephemeral ssh host key on every boot, so StrictHostKeyChecking would
fail on the second and later runs unless --no-host-check is passed
explicitly. Detect loopback targets (localhost, 127.0.0.1, ::1) and
disable host key checking automatically, both in TargetDevice and in
the generated do_install-through-bitbake script that re-parses the
target args on the build host.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 50 ++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 719648a3eb..e45752aff1 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -45,22 +45,24 @@ class DevtoolIdeMode(Enum):
     shared = 'shared'
 
 
+# Hosts a ssh target is considered to loop back to the local machine, e.g. a
+# QEMU instance reached through slirp/hostfwd port forwarding (root@localhost)
+# which has an ephemeral ssh host key that changes on every boot.
+LOOPBACK_HOSTS = ('localhost', '127.0.0.1', '::1')
+
+
+def target_host(target):
+    return target.split('@')[-1]
+
+
+def is_loopback_target(target):
+    return target_host(target) in LOOPBACK_HOSTS
+
+
 class TargetDevice:
     """SSH remote login parameters"""
 
     def __init__(self, args):
-        self.extraoptions = []
-        if args.no_host_check:
-            self.extraoptions += ['-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no']
-        self.ssh_sshexec = 'ssh'
-        if args.ssh_exec:
-            self.ssh_sshexec = args.ssh_exec
-        self.ssh_port = []
-        if args.port:
-            self.ssh_port = ['-p', args.port]
-        if args.key:
-            self.extraoptions += ['-i', args.key]
-
         self.target = args.target
         target_sp = args.target.split('@')
         if len(target_sp) == 1:
@@ -72,6 +74,25 @@ class TargetDevice:
         else:
             logger.error("Invalid target argument: %s" % args.target)
 
+        no_host_check = args.no_host_check
+        if not no_host_check and is_loopback_target(args.target):
+            logger.debug(
+                "Target %s is a loopback address, disabling ssh host key checking "
+                "(assuming a QEMU instance with an ephemeral host key)." % args.target)
+            no_host_check = True
+
+        self.extraoptions = []
+        if no_host_check:
+            self.extraoptions += ['-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no']
+        self.ssh_sshexec = 'ssh'
+        if args.ssh_exec:
+            self.ssh_sshexec = args.ssh_exec
+        self.ssh_port = []
+        if args.port:
+            self.ssh_port = ['-p', args.port]
+        if args.key:
+            self.extraoptions += ['-i', args.key]
+
 
 class RecipeNative:
     """Base class for calling bitbake to provide a -native recipe"""
@@ -1324,6 +1345,8 @@ class RecipeModified:
                        'no_preserve', 'port', 'show_status', 'ssh_exec', 'strip', 'target']
         filtered_args_dict = {key: value for key, value in vars(
             args).items() if key in args_filter}
+        if is_loopback_target(filtered_args_dict['target']):
+            filtered_args_dict['no_host_check'] = True
         cmd_lines.append('filtered_args_dict = %s' % str(filtered_args_dict))
         cmd_lines.append('class Dict2Class(object):')
         cmd_lines.append('    def __init__(self, my_dict):')
@@ -1340,6 +1363,9 @@ class RecipeModified:
         cmd_lines.append('        i += 2')
         cmd_lines.append('    else:')
         cmd_lines.append('        i += 1')
+        cmd_lines.append(
+            "if filtered_args.target.split('@')[-1] in %s:" % str(LOOPBACK_HOSTS))
+        cmd_lines.append('    filtered_args.no_host_check = True')
         cmd_lines.append(
             'setattr(filtered_args, "recipename", "%s")' % self.bpn)
         cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
-- 
2.55.0


