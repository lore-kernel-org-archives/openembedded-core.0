Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCC671993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:17:09 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id n124so47461039lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RDKEWkYAyQz6ZDCk19j9N+DLAAuU2kuk5S0TqcC5dwo=;
	b=KczacIGO23wYktW2ntJWTYxZ23PuIvzOZfAPp9Js1YDZvTAN3JZlR+AaOz8R/gEID6
	GNiKfvi8vR7v98z1CGzl5mzdgoYmGiUNyCfT0f8FV7N9apME7g+6NLrh6QbqTzecAP1w
	2WCE9rXThsw9pCCDvFVUSSYmFkAj2C0ZYDMJQStz0FT4hTdMk2pf/+bpTwF0E1ItyqDj
	sHemFRNnMBp46yuFqGQnkxfrk3o2hEKdY5w5v9EoQZU0bOlDyIbc8WgF7AwPPRwke4Cd
	qdMwLNezRKOuYUg5KIIXZZ/kxYo/lktGN9XbP4LSWVExpau0mcaMegVJ2589llu4GAL0
	GPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RDKEWkYAyQz6ZDCk19j9N+DLAAuU2kuk5S0TqcC5dwo=;
	b=FfwLA+yGoccRQwJP/RO072DPUbVsHb4Zi/lqYnYIqfqn7DOXRBp/Nj0dtKx7kTy7bK
	11xQwVRCeNo6Iq0Xzt8rbx5uJW+me7UY6KDyjubzfS4OQkDjtiDwLpprmt+DtS0Lmm1p
	9QZZ5Av8EisaftxeEEHIPaXDX9t+N2z7DwaWjEQF1BROVpYQGmMjtjKd/Kc8jmKGiUJ8
	lNuOKIe9GkLlClZBtOC3f5VZy0FljQhxDgd0FK8i698eScHmrMe0P3/YJ2OhpOHdzlsm
	u59xueMq1zs0RHoFLZKXGsHZ7QJhUOAkrRW2OKT2O7N46ae8YIhjAMA4CjM19mLgqT2X
	d47Q==
X-Gm-Message-State: AMke39lQyMSZuAw1DZF9Pb3o832SXVX1S1WgH4IVwz7LRqqmtLAk2DKLJcOxQmTS/uSMnQ==
X-Received: by 10.25.209.195 with SMTP id i186mr4097149lfg.109.1486397829516; 
	Mon, 06 Feb 2017 08:17:09 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	a138sm429619lfb.2.2017.02.06.08.17.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 08:17:08 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Mon,  6 Feb 2017 17:16:46 +0100
Message-Id: <1486397807-11699-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
References: <f181ed99-ed09-59d9-96a8-cf5d77a179d7@mender.io>
	<1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH 1/2] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 06 Feb 2017 16:17:10 -0000

It will omit the given path from the resulting partition, and if the
given path ends in a slash, it will only delete the content, and keep
the directory.

Since mkfs only accepts whole directories as input, we need to copy
the rootfs directory to the workdir so that we can selectively delete
files from it.

Since we want to use the copyhardlinktree() function, we need to put
the generic oe lib in the module search path.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/help.py                  |  6 +++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 43 +++++++++++++++++++++++++++++++-
 scripts/wic                              |  2 ++
 5 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 1bd411d..63bbc23 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -721,6 +721,12 @@ DESCRIPTION
                      partition table. It may be useful for
                      bootloaders.
 
+         --exclude-path: This option is specific to wic. It excludes the given
+                         absolute path from the resulting image. If the path
+                         ends with a slash, only the content of the directory
+                         is omitted, not the directory itself. This option only
+                         has an effect with the rootfs source plugin.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 41d3cc6..f0aa5d0 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -130,6 +130,7 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
+        part.add_argument('--exclude-path', nargs='+')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 69b369c..5f6cf76 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -39,6 +39,7 @@ class Partition():
         self.align = args.align
         self.disk = args.disk
         self.extra_space = args.extra_space
+        self.exclude_path = args.exclude_path
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 9d959fa..c57a434 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -26,10 +26,13 @@
 #
 
 import os
+import shutil
+
+from oe.path import copyhardlinktree
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import get_bitbake_var
+from wic.utils.misc import get_bitbake_var, exec_cmd
 
 class RootfsPlugin(SourcePlugin):
     """
@@ -78,6 +81,44 @@ class RootfsPlugin(SourcePlugin):
 
         real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
+        # Handle excluded paths.
+        if part.exclude_path is not None:
+            # We need a new rootfs directory we can delete files from. Copy to
+            # workdir.
+            new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs"))
+
+            if os.path.lexists(new_rootfs):
+                shutil.rmtree(os.path.join(new_rootfs))
+
+            copyhardlinktree(real_rootfs_dir, new_rootfs)
+
+            real_rootfs_dir = new_rootfs
+
+            for orig_path in part.exclude_path:
+                path = orig_path
+                if os.path.isabs(path):
+                    msger.error("Must be relative: --exclude-path=%s" % orig_path)
+
+                full_path = os.path.realpath(os.path.join(new_rootfs, path))
+
+                # Disallow climbing outside of parent directory using '..',
+                # because doing so could be quite disastrous (we will delete the
+                # directory).
+                if not full_path.startswith(new_rootfs):
+                    msger.error("'%s' points to a path outside the rootfs" % orig_path)
+
+                if path.endswith(os.sep):
+                    # Delete content only.
+                    for entry in os.listdir(full_path):
+                        full_entry = os.path.join(full_path, entry)
+                        if os.path.isdir(full_entry) and not os.path.islink(full_entry):
+                            shutil.rmtree(full_entry)
+                        else:
+                            os.remove(full_entry)
+                else:
+                    # Delete whole directory.
+                    shutil.rmtree(full_path)
+
         part.rootfs_dir = real_rootfs_dir
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             real_rootfs_dir, native_sysroot)
diff --git a/scripts/wic b/scripts/wic
index 8a959a0..e872096 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -41,6 +41,8 @@ from distutils import spawn
 scripts_path = os.path.abspath(os.path.dirname(__file__))
 lib_path = scripts_path + '/lib'
 sys.path.insert(0, lib_path)
+oe_lib_path = os.path.join(os.path.dirname(scripts_path), 'meta', 'lib')
+sys.path.insert(0, oe_lib_path)
 
 bitbake_exe = spawn.find_executable('bitbake')
 if bitbake_exe:
-- 
2.7.4


