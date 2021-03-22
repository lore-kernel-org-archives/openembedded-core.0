Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
 by mx.groups.io with SMTP id smtpd.web08.978.1616427976465689455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=rxo+5hVb;
 spf=pass (domain: flex--gmouse.bounces.google.com, ip: 209.85.221.74, mailfrom: 3xrtyyaykakkpvxdbnpxxpun.lxv@flex--gmouse.bounces.google.com)
Received: by mail-wr1-f74.google.com with SMTP id z17so26306923wrv.23
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=fbAwPMP077X8SA3Zb20oj8WamkwEVvXXRzUxIbCXMrw=;
        b=rxo+5hVbWYebYhCZFD2EEi17oAlQBqmF6DLGVsn2IaNyFQLRMui9TUueTECxJFtG+0
         vP8w5NToorEJBHBq7hCoUy1nP9gXroN8LWhtOIP0B0KTf8AoubyXN5K/todNLdqMWT6m
         Go++1yFygHmAboo87Q1e32AoSxgFw4L+zA0ZliEJqHyvO0E/F8loDoYCCXPSCqY2K3Li
         TJKNzufwRHO2smrosX7I9pjUQ/u+sJK7kdi2X1kIgAXacBUhoB6zumEm0RnseApU4E/Z
         rwiMkYBZ4b5wcQemEGsgXdSoMThGip9wcpaezLoxiVzb6daYCx4Q5fX+goJ1lYqSWSQl
         mChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=fbAwPMP077X8SA3Zb20oj8WamkwEVvXXRzUxIbCXMrw=;
        b=QF5tfgFhqrUJiwfSmbrKupx96nfVbRswWNkfp8EWrGEqwfDiv9aJo0uKeqYDcL9CYN
         9DYOZJDGyKGb6cq1o72tGEdiuvAp26X+nsSJWY8Qm5SLPYfGJrWj24g932xK/SKd7FRH
         wEccH7FpLBV241jSXpyLGqyAwttK6rA7XG27EB0iqxJouyUxvz0MLkrNoMDpQsHLFrjC
         rDDC+zyO9IA3RfesyKEDeH0qL8FSDL5F3LUdmJUNNp8jS/e5j2LEec0+yKWF7qvgAcxH
         q2/M3Lqo9N7kEHAewlDgFUQXDpUBaC52g6Qj4ffV/9B10dyTfOvHl2W4HNOt1cNQlJ/v
         svWw==
X-Gm-Message-State: AOAM533bqnQ2Y3Qw2oUIvjN02eAx2vCObaT8kXR3j+Huy0l2pZkHieV7
	du41f6ubMoTuhvUQ0jRjsE/2YuWeU1jUYlRnwaMMxzQEM5Ox65BshJWmKKxc9GXINbWO2iw1QSa
	s11PaX5FkhZTdB2JHOoyd4UpmUYIgM5XeY5kO66hlf0tOC8qgnflrNpA/HFQg6xNCUNFGbZO2Xo
	jcPnNz3GT8Vw==
X-Google-Smtp-Source: ABdhPJwTnsj//jGgozpi+jzNs8VjlPMQEkbrgyBisCi6DKRBede31tab9D7CEnWZy3CBlR0sMDndoyID0PY=
X-Received: from gmouse.zrh.corp.google.com ([2a00:79e0:42:200:91d7:d858:ceca:4d6])
 (user=gmouse job=sendgmr) by 2002:a05:600c:2247:: with SMTP id
 a7mr419649wmm.131.1616427974653; Mon, 22 Mar 2021 08:46:14 -0700 (PDT)
Date: Mon, 22 Mar 2021 16:45:57 +0100
Message-Id: <20210322154557.1591593-1-gmouse@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [poky][PATCH] package_manager: install versioned postinst scripts
From: "Anton Kachalov" <gmouse@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "Anton D. Kachalov" <gmouse@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Anton D. Kachalov" <gmouse@google.com>

When running on read-only rootfs backed with overlayfs, the processed scripts
are being marked as deleted on upperdir of overlayfs. When it comes to
upgrade the main read-only image, it might contain new postinst scripts that
are different from the already processed. Introduced suffix (sha256 of
the content) allows to distinct updated scripts of the same package.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
---
 meta/lib/oe/package_manager/deb/rootfs.py   | 11 ++++++++++-
 meta/lib/oe/package_manager/ipk/rootfs.py   | 11 ++++++++++-
 meta/lib/oe/package_manager/rpm/__init__.py |  4 +++-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 8fbaca11d6..704d213626 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -4,6 +4,7 @@
 
 import re
 import shutil
+from hashlib import sha256
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
@@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Rootfs):
             bb.utils.mkdirhier(dst_postinst_dir)
 
             if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
+                csum = sha256()
+                with open(src_postinst_dir, p + ".postinst", "rb") as f:
+                    while True:
+                        data = f.read(65536)
+                        if not data:
+                            break
+                        csum.update(data)
+
                 shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
+                            os.path.join(dst_postinst_dir, "%03d-%s.%s" % (num, p, csum.hexdigest())))
 
             num += 1
 
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 26dbee6f6a..6ead6ddef3 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -5,6 +5,7 @@
 import re
 import filecmp
 import shutil
+from hashlib import sha256
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
@@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Rootfs):
             bb.utils.mkdirhier(dst_postinst_dir)
 
             if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
+                csum = sha256()
+                with open(src_postinst_dir, p + ".postinst", "rb") as f:
+                    while True:
+                        data = f.read(65536)
+                        if not data:
+                            break
+                        csum.update(data)
+
                 shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
+                            os.path.join(dst_postinst_dir, "%03d-%s.%s" % (num, p, csum.hexdigest())))
 
             num += 1
 
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 6df0092281..4746e96ce8 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -4,6 +4,7 @@
 
 import shutil
 import subprocess
+from hashlib import sha256
 from oe.package_manager import *
 
 class RpmIndexer(Indexer):
@@ -359,7 +360,8 @@ class RpmPM(PackageManager):
         target_path = oe.path.join(self.target_rootfs, self.d.expand('${sysconfdir}/rpm-postinsts/'))
         bb.utils.mkdirhier(target_path)
         num = self._script_num_prefix(target_path)
-        saved_script_name = oe.path.join(target_path, "%d-%s" % (num, pkg))
+        csum = sha256(output.encode("utf-8")).hexdigest()
+        saved_script_name = oe.path.join(target_path, "%d-%s.%s" % (num, pkg, csum))
         open(saved_script_name, 'w').write(output)
         os.chmod(saved_script_name, 0o755)
 
-- 
2.31.0.rc2.261.g7f71774620-goog

