Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB8871A00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:15:55 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id t196so47087458lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Or2lN4AtqBv3aScd12GZO0umiHuli08DTcYTNUtlWNE=;
	b=MViLI8rMzX0GnV8FDYrtZld7euP9DwtovpIX86lIJrumZH8iUJlHRWgtBPP5Kkhzjh
	HIQk6hSALsFQW7tnrrJRFYmnqCsHrmfKrTdC/QKhPpUBIlfW725N6XBjGc98ihod7Z+P
	IU1jh4I5QTg8rq16nm0Su/vqc87Il0vCADVLso/7LfT53pnpYRCECT6iSwsUIbzCshqm
	PGzvDO16SXlZXkPOyFhSJEgpUcwtE3HuSfqZyREChrbuzaYK3+ZQUCPz517F4fI1X418
	Gkjzi1REE4ceDGjNpOZ42qqcb0cuEnLZomypMdZH8octI3g6clCfJMfFQGKT7ESje0ab
	yirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Or2lN4AtqBv3aScd12GZO0umiHuli08DTcYTNUtlWNE=;
	b=R/WVoHGW+yHv7Xr7BhAFTDihFWW4HOURbSHjPd5/YF+NuIWhWWL6cayriZ65KkrSrt
	Eb/xFgGW6PnE8m+f/gMO+P8sVAO9E0WxG+I/jiybgoYrmltEWDg3AY/NPN/RZNwFMKdw
	xVl78KLCRzqQCh/6FqEoJXFNWtKfb2b5JnpOK2UDny2DmrCytLn/NsbEy+IkyTuHQnAC
	ToXn2kSgzK0lAd/1bgqyoDaizvcx5D53wMKq5+XUtqPK3fU4UGRY3RfrVtzRBUJD7Uua
	RnqYndr+uXfjTS8KW7QwWsj3yg9OS/ZFPZFtKJgcA8ljHz3OphYUY/5lSDrlGSJGngsf
	KcfQ==
X-Gm-Message-State: AKaTC03pq+RssO6fsHGQY/PUk7wIz2Jx3kR3EDUJnM+mp4phwHkMjWcNjSs67fh8ZdlIMA==
X-Received: by 10.25.87.149 with SMTP id l143mr3149055lfb.61.1480068956337;
	Fri, 25 Nov 2016 02:15:56 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	c77sm9082167lfg.29.2016.11.25.02.15.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Nov 2016 02:15:55 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Nov 2016 11:15:55 +0100
Message-Id: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 10:15:56 -0000

It will omit the given path from the resulting partition, and if the
given path ends in a slash, it will only delete the content, and keep
the directory.

Since mkfs only accepts whole directories as input, we need to copy
the rootfs directory to the workdir so that we can selectively delete
files from it.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/help.py                  |  6 ++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 51 +++++++++++++++++++++++++++++++-
 4 files changed, 58 insertions(+), 1 deletion(-)

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
index 0894e2b..17b97fd0 100644
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
index 425da8b..d97d99c 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -26,10 +26,11 @@
 #
 
 import os
+import shutil
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import get_bitbake_var
+from wic.utils.oe.misc import get_bitbake_var, exec_cmd
 
 class RootfsPlugin(SourcePlugin):
     """
@@ -78,6 +79,54 @@ class RootfsPlugin(SourcePlugin):
 
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
+            if os.stat(real_rootfs_dir).st_dev == os.stat(cr_workdir).st_dev:
+                # Optimization if both directories are on the same file system:
+                # copy using hardlinks.
+                cp_args = "-al"
+            else:
+                cp_args = "-a"
+            exec_cmd("cp %s %s %s" % (cp_args, real_rootfs_dir, new_rootfs))
+
+            real_rootfs_dir = new_rootfs
+
+            for orig_path in part.exclude_path:
+                path = orig_path
+                if not os.path.isabs(path):
+                    msger.error("Must be absolute: --exclude-path=%s" % orig_path)
+
+                while os.path.isabs(path):
+                    path = path[1:]
+
+                # Disallow '..', because doing so could be quite disastrous
+                # (we will delete the directory).
+                remaining = path
+                while True:
+                    (head, tail) = os.path.split(remaining)
+                    if tail == '..':
+                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
+                    elif head == "":
+                        break
+                    remaining = head
+
+                full_path = os.path.join(new_rootfs, path)
+
+                if path.endswith(os.sep):
+                    # Delete content only.
+                    for entry in os.listdir(full_path):
+                        shutil.rmtree(os.path.join(full_path, entry))
+                else:
+                    # Delete whole directory.
+                    shutil.rmtree(full_path)
+
         part.rootfs_dir = real_rootfs_dir
         part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
 
-- 
2.7.4


