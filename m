Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 833SUUvvKfEwkkZDRlZXhcbYLIAQChnvzRL/dis2IYPJ6GIhE6u8NMdwpCypFQzBDa1bZnyuHr
 Xxrol/Wg4W1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392488"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392488"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:36 -0800
IronPort-SDR: dwhiOGEEoxyNp7ak2DPQT55azZ7fORQ8RD/Cps1Yh+C9TpSdB/YJLdJGLez47NQ30IIZnVgMXU
 lQ+9iRFMJwvw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413831"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/20] wic: Update pseudo db when excluding content from rootfs
Date: Fri, 22 Jan 2021 00:22:00 +0800
Message-Id: <9f33aa6f1dd66b1b6990b256ad822fa4cf8daa94.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

To exclude content from the rootfs, wic makes a copy (using hardlinks if
possible) of the rootfs directory and associated pseudo db, then removes
files & directories as needed. However if these files and directories
are removed using the python functions os.remove and shutil.rmtree, the
copied pseudo db will not be updated correctly. For files copied from
the original rootfs, if hardlinks were used successfully when copying
the rootfs this should mean that the relevant inodes can't be reused and
so the risk of pseudo aborts should be avoided. However, this logic
doesn't apply for directories (as they can't be hardlinked) or for files
added via the '--include-path' argument (as they weren't present in the
original rootfs) and so there remains some risk of inodes being reused
and the pseudo db becoming corrupted.

To fix this, use the 'rm' command under pseudo when removing files &
directories from the copied rootfs to ensure that the copied pseudo db
is updated.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5db7e268947f0392c2126137571a44acd29ccd6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index f1db83f8a1..afb1eb9202 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -199,17 +199,20 @@ class RootfsPlugin(SourcePlugin):
                 if not os.path.lexists(full_path):
                     continue
 
+                if new_pseudo:
+                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
+                else:
+                    pseudo = None
                 if path.endswith(os.sep):
                     # Delete content only.
                     for entry in os.listdir(full_path):
                         full_entry = os.path.join(full_path, entry)
-                        if os.path.isdir(full_entry) and not os.path.islink(full_entry):
-                            shutil.rmtree(full_entry)
-                        else:
-                            os.remove(full_entry)
+                        rm_cmd = "rm -rf %s" % (full_entry)
+                        exec_native_cmd(rm_cmd, native_sysroot, pseudo)
                 else:
                     # Delete whole directory.
-                    shutil.rmtree(full_path)
+                    rm_cmd = "rm -rf %s" % (full_path)
+                    exec_native_cmd(rm_cmd, native_sysroot, pseudo)
 
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             new_rootfs or part.rootfs_dir, native_sysroot,
-- 
2.29.2

