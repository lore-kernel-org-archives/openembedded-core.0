Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20B3F6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:48:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9VFn0ZT014631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:49:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Oct 2016 08:49:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2016 08:48:58 -0700
Message-ID: <bc402b553331b622af35b7fea7d30d82c7f2f686.1477928374.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1477928374.git.liezhi.yang@windriver.com>
References: <cover.1477928374.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe/copy_buildsystem.py: dereference symlink
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
X-List-Received-Date: Mon, 31 Oct 2016 15:49:00 -0000
Content-Type: text/plain

When there is a relative symlink in the layer, for example:
symA -> ../out/of/layer/file

symA will be invalid fater copied, it would be invalid from build time
if it points to a relative path, and would be invalid after extracted
the sdk if it points to a absolute py. Dereference symlink when copy
will fix the problem.

Use tar rather than shutil.copytree() to copy is because:
1) shutil.copytree(symlinks=Fasle) has bugs when dereference symlinks:
   https://bugs.python.org/issue21697
   And Ubunutu 1404 doesn't upgrade python3 to fix the problem.

2) shutil.copytree(symlinks=False) raises errors when there is a invalid
   symlink, and tar just prints a warning, tar is preferred here since
   the real world is unpredicatable

3) tar is faster than shutil.copytree() as said by oe.path.copytree()

So use tar to copy.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index afaff68..29ac6d4 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -4,11 +4,15 @@ import stat
 import shutil
 
 def _smart_copy(src, dest):
+    import subprocess
     # smart_copy will choose the correct function depending on whether the
     # source is a file or a directory.
     mode = os.stat(src).st_mode
     if stat.S_ISDIR(mode):
-        shutil.copytree(src, dest, symlinks=True, ignore=shutil.ignore_patterns('.git'))
+        bb.utils.mkdirhier(dest)
+        cmd = "tar --exclude='.git' --xattrs --xattrs-include='*' -chf - -C %s -p . \
+        | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dest)
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
         shutil.copyfile(src, dest)
         shutil.copymode(src, dest)
-- 
2.9.0


