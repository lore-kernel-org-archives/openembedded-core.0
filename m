Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 51B077725B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:29:13 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so2327175wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TNxTvhY9fgOK7kZV6uyCqT+NNC8+fIuZ7Axi5Tk2poU=;
	b=fiNP+eYljettt+t0AnQDxe0SSKmkVLPXcA9OfcZMafTfihlhg1yGZOYknUI3AFZ3Tw
	Il3yGQ0W2tukwLi6xBuw7AUUnK3BzfKMx6/fHl77DJby370PYW3kj7VRYOxRy5OZ1TeR
	ZNWgCtZC5llkJAC42FrQN9dgbEzGwZSezB90vutDz/AxURrWgAu9wmqpBGIiCRI3tADP
	SZOkR8nFDsR9EmIHiC5M8Dqaw7UzSqsc/ZbbJ/+pY+XsQPWlbK2yP8emupRHKskmSREt
	7qesa7rys6y8XW989m6tCYSbjS0H+3jc9Z1575o3SoG+YPyhtM8r9IZFAiWDqy+5bIFM
	qyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TNxTvhY9fgOK7kZV6uyCqT+NNC8+fIuZ7Axi5Tk2poU=;
	b=CCaoIb9F4PAlKbyuGtTBgoabq1xJkiG37UdrAnHwyHlRRtAnsXx8iKXH5+/75Vk/6i
	MTzDqfybrMpOUGyjwLH98O2U61OPA48vyBFSuX/5aUVmgwlwDP6P6WNKPKymLpI68/go
	awUUP+WfqnwtM4A3bDsEE/gOixZO0EN0WntiBPpUwHa8qw83RiCn/9VPCACx/mTqQZD0
	uHRHdfLd4Dio3I/NYwLs/z9iibDlh1yFpIk9eu/3Zn9oBZxGIEAppm3e5b5rWwXH7cYW
	CAGE7T7RFg3HrCHm98dP+LBS7UW3AUDuZcOdx129lNKHFb8BnQyew+MphahYzD6mA3tj
	IytQ==
X-Gm-Message-State: AKaTC021hkApORhBD40kH1qWvrESo95Tp2ba4beMlvEkopiVGtWDl2AyrlZFwgqqzXlZ+g==
X-Received: by 10.25.32.74 with SMTP id g71mr4440613lfg.28.1481732954974;
	Wed, 14 Dec 2016 08:29:14 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	9sm10891875ljn.20.2016.12.14.08.29.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Dec 2016 08:29:14 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 17:28:52 +0100
Message-Id: <1481732934-5128-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
References: <20161128111825.GA16035@linux.intel.com>
	<1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH v2 1/3] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Wed, 14 Dec 2016 16:29:15 -0000

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
index e5347ec..9dab670 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -715,6 +715,12 @@ DESCRIPTION
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
index 0894e2b..17b97fd 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -127,6 +127,7 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
+        part.add_argument('--exclude-path', nargs='+')
         part.add_argument("--extra-space", type=sizetype, default=10*1024)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ac4c836..cba78a5 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -45,6 +45,7 @@ class Partition():
         self.align = args.align
         self.disk = args.disk
         self.extra_space = args.extra_space
+        self.exclude_path = args.exclude_path
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 425da8b..794ad69 100644
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
-from wic.utils.oe.misc import get_bitbake_var
+from wic.utils.oe.misc import get_bitbake_var, exec_cmd
 
 class RootfsPlugin(SourcePlugin):
     """
@@ -78,6 +81,44 @@ class RootfsPlugin(SourcePlugin):
 
         real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
+        # Handle excluded paths.
+        if part.exclude_path is not None:
+            # We need a new rootfs directory we can delete files from. Copy to
+            # workdir.
+            new_rootfs = os.path.join(cr_workdir, "rootfs")
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
         part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
 
diff --git a/scripts/wic b/scripts/wic
index fe2c33f..f58843e 100755
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


