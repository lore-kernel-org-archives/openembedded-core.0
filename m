Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.276.1616517456191780837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF5FED6E
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:37:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5900C3F718
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:37:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lib/oe/utils: add directory size function
Date: Tue, 23 Mar 2021 16:37:21 +0000
Message-Id: <20210323163722.2603178-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@intel.com>

For the purpose of image construction using du on a rootfs directory isn'=
t
entirely satisfactory.  Bare "du" will report the actual disk usage so fi=
le
systems which can compress the data will report less than the actual spac=
e
required.  Using "du --apparent-size" will report the actual space used, =
but as
this simply sums the bytes used for content across an entire file system =
can
result in significant under-reporting due to block size overhead.

Attempt to solve these problems by implementing our own function to calcu=
late
how large a rootfs will be.  This function handles hardlinks correctly bu=
t
rounds up all sizes to multiples of the block size (currently, 4KB is the
hard-coded block size).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/utils.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 9a2187e36f..a84039f585 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -536,3 +536,34 @@ class ImageQAFailed(Exception):
 def sh_quote(string):
     import shlex
     return shlex.quote(string)
+
+def directory_size(root, blocksize=3D4096):
+    """
+    Calculate the size of the directory, taking into account hard links,
+    rounding up every size to multiples of the blocksize.
+    """
+    def roundup(size):
+        """
+        Round the size up to the nearest multiple of the block size.
+        """
+        import math
+        return math.ceil(size / blocksize) * blocksize
+
+    def getsize(filename):
+        """
+        Get the size of the filename, not following symlinks, taking int=
o
+        account hard links.
+        """
+        stat =3D os.lstat(filename)
+        if stat.st_ino not in inodes:
+            inodes.add(stat.st_ino)
+            return stat.st_size
+        else:
+            return 0
+
+    inodes =3D set()
+    total =3D 0
+    for root, dirs, files in os.walk(root):
+        total +=3D sum(roundup(getsize(os.path.join(root, name))) for na=
me in files)
+        total +=3D roundup(getsize(root))
+    return total
--=20
2.25.1

