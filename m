Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 70B8460684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 14:04:00 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id t196so221905924lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F0xGAQ4fdipEMEExYTHGfOjfIMtgBM1xoCEjSwMfKCg=;
	b=N+QBdQdfJejJFeH4lZ2ULe0j13QK9OyuieYdpCfUphiic9SAAf6+rlYUasJT9tmult
	QWMf4YSzLDEkZYpYaXyXTVu/w4zZHKeNYeJV/FnoFsWO+qTErj0qzRaKvw+J5M7kwoik
	oTDK+qYxChCq0Xo/IZwQy+D06/NjLvxt0TAU5B7ELJCJC+pPgZqUwaYHIZr8i31aWgba
	I9jatE0zeUegIQbzosN9lKTnT56Tz66yNtqxe0jXty7vbOjX/r/PwZLkCYCbSl3LotnD
	iLFAVqDAIxNbNQQFrTJGElxXSHD/NM9a8pqdN9+W1a9fz111XVYD9iPLKo2N0rqulk9U
	ZgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F0xGAQ4fdipEMEExYTHGfOjfIMtgBM1xoCEjSwMfKCg=;
	b=jTyGsSgLfTeLVR0MCU9yrLXVD5aD7Dy2f3C6gmg4cjkn+U95xQ1g5Pl58oYK6JVOFd
	rCjLLy9VGWopDUOwsXmNlWhEyInQijeXcM8cL02etfBzrjvSWnnmRHsdMvQiZi08hlgT
	QjHeLdoiXy9gvPfI0llIvLYAUYGi3szRIoGp8JLbmW/UvObGBo3fTJZxJ1PmTwFvnjAL
	aVQ8nRZkTZXiQeO4+u9yKtnT5dkB5JzZA9DM1+2ZOlpx4S9tdVnY0vHQtrxYZ2DLLwEf
	roA66U7nWUNyUY7CDmdoO/DyDAyY8I63t6OJvjrUth6MUdYS0kZCZBDuFFjdametJs42
	tjbQ==
X-Gm-Message-State: AIkVDXJtTFAqCDgDCuskb3nkSVJL+P2Fue2WX/VohHxjJlnkP6XhqRV8i51PPngXitQw4g==
X-Received: by 10.46.7.1 with SMTP id 1mr15983066ljh.76.1483020241179;
	Thu, 29 Dec 2016 06:04:01 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	y131sm12961910lfd.36.2016.12.29.06.03.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 06:04:00 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Dec 2016 15:03:47 +0100
Message-Id: <1483020228-1267-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
References: <b7a30224-1198-ac92-7f70-708196ca7814@mender.io>
	<1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 1/2] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Thu, 29 Dec 2016 14:04:01 -0000

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
index daa11bf..4d48fb7 100644
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
index 62c4902..56a12b0 100644
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
index aa8f8a7..9c130c4 100644
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
index 1ad1666..4328ba5 100755
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


