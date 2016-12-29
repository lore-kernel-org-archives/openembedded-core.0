Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3DC60778
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 10:05:46 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b14so218444124lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 02:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TNxTvhY9fgOK7kZV6uyCqT+NNC8+fIuZ7Axi5Tk2poU=;
	b=dPTfWo4NzP4wdu8ku9Y0ynBfom2F9hvnQyago3Lcz9YdBKYNmqX3kPW/Xf4V6Kbpeh
	K9GcUVHFhDsLw87CHnsac+BXdrO/IBg8xxJwTaihba7xgNXcJ+BJ7TrJNDVwelctsDnf
	UuS24YsbOAVszRr5f8wU4gaa1j0czg8YYlPVZaEisWfKpsoBcWnL83iDI195fviJDNCX
	Jd2Acw8FFcvZY1Q7vPJ7pwW1VA0Oy1JPQQBAf291lShKp+RAO8Lw4StOVAHgyedoRjKf
	fcXBjGvgCGTkfCnJp9b5rjUx42plA9UFuWjptFE7MjGy1aSV6h+g45Rmv6n61Kbmn8/i
	gcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TNxTvhY9fgOK7kZV6uyCqT+NNC8+fIuZ7Axi5Tk2poU=;
	b=Bkj7i5CVbfVODC97g94k64wj61Ujla6vv80Ne4ZyQOgLvm46po1LH/shMvgLCeYDJ+
	89ZQduDaMWVw0zDABI2n/AImprMudESBrdEtyPB6TR8T+wHUM/7+4QnJGs9w/V59ZXJO
	NWRQD/kS/93DLT9By37yhskzk+UilxB77iMqix1PMGz0vL/pRaeAshdy7aC+RPmm1VT0
	CDE7V6g50rcNbuFZKGEByMjW8C4ybDBaL/kRZuUf3WRcuHOU4MgcGjgjghqLwGMUPJ5Z
	005WIeUrynCKFDL7TMKr/yO6tB8ZJWC5qtnw5GxH9swkQycG0UXiTM6jl06WKtXadttF
	Sqxw==
X-Gm-Message-State: AIkVDXLM9W+Mbgfzoyrz/IjbXMiRdzdX2yt9IqgQLgfprPHRQY1IJpYgS+uSLHYN0KwypQ==
X-Received: by 10.25.230.18 with SMTP id d18mr11521791lfh.98.1483005947781;
	Thu, 29 Dec 2016 02:05:47 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	c25sm12913685ljb.32.2016.12.29.02.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 02:05:46 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Dec 2016 11:05:28 +0100
Message-Id: <1483005929-8231-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483005929-8231-1-git-send-email-kristian.amlie@mender.io>
References: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
	<1483005929-8231-1-git-send-email-kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 1/2] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Thu, 29 Dec 2016 10:05:47 -0000

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


