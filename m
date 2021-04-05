Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.5829.1617634450368547778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IdWyjHIy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id t23so2971161pjy.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NkVTHOIz6Tc2XuUkEcl2k4o8BzBv1E/KcjPPv9rEOE8=;
        b=IdWyjHIyiMHArmGyezhG9i71M+yvzA10CWadWsor2dh0PFDwuQRDj3CmJx+cO/W6gM
         KFDMMzC6icL3r7TBClKPTgaF1gpshPONLLVV9Hi8tjW7K7VY4gxBoV75rh85cS+kmQj9
         k8oacVkuTB0IwkvAYp6hgh345VE2IWrwjvqmzQ+d4YwNYukvopvCnLSA9f+Ep78nZ0cz
         GNCB5hwBhvi4pgYv00jUl+6WPToVTKxutxnN5qbrRB63Dq253ooLK1PydtXBlJElSVSD
         JB0miaxP47KFUvSi0IATg4H2l+bnkmZud/U8aAvTM9Yh5qVqIVlNwef5r3j/hg9GqARd
         g9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NkVTHOIz6Tc2XuUkEcl2k4o8BzBv1E/KcjPPv9rEOE8=;
        b=scdfPZNI5Lmp9RhIMXKHXDpJTME2xIps5o7dWxQ3KZcJxkkrrvFQthBZvpHjWTzQ8F
         ih1CmrjZk7M/LbkzhTJOU5Oe5ioBqdu/bmMd1Bb62WPGGE03NPZZyPEuvKHDgIbiJ/pi
         PFwFfL+sGxbHWdkNwomuf/0cWryt/1b8XU4ybCjHrZWcJultysJwZG0bRxsyqijjI8hl
         B1yI2GtX+gpkeQPh0V/akUWOqbc4wFHQRX0KbMhRVhOrcYq6AgDlLkUZIg5TEiWYgEN6
         5oMIBEkOQGoB3pUSmPw8v9rWeHdEU/NcT+t0hZvg0S0/AqKywmEYvIrVtuyUis13QhWN
         dBsA==
X-Gm-Message-State: AOAM533I7iTGL0VTH7wc2ebugq0QQhMmr9PVMoUygLN/hp/j/BKt+Ske
	6Ym0EISWkPDEg5NzmjyfpDzV26kXhSA5qZbErAk=
X-Google-Smtp-Source: ABdhPJw5K/V2WMI2sph1EEjJOGRis1VKO/1SG7zBkJ+vFgsaHKDltlhfljKTcNJ/DuqKPQCHHIfSsw==
X-Received: by 2002:a17:90a:5910:: with SMTP id k16mr27832188pji.207.1617634449438;
        Mon, 05 Apr 2021 07:54:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.54.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] selftest/reproducible: add an exclusion list for items that are not yet reproducible
Date: Mon,  5 Apr 2021 04:53:28 -1000
Message-Id: <ac1c14fbbe69fe9459fb5741df061b74dad63f04.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Hopefully over time this list will be reduced to an empty one.

Non-reproducible excluded packages are not given to diffoscope and do not cause a
failure, but still saved side-by-side with non-reproducible failing ones to make
investigation easier.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 406bd0d48d8f90e2c836f7d3e204f21d5f13c833)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 82 +++++++++++++++++++-
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 4b60b2e1b0..cf0375c8a1 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -17,6 +17,72 @@ import stat
 import os
 import datetime
 
+# For sample packages, see:
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-0t7wr_oo/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-4s9ejwyp/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-haiwdlbr/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-hwds3mcl/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201203-sua0pzvc/
+# (both packages/ and packages-excluded/)
+exclude_packages = [
+	'acpica-src',
+	'babeltrace2-ptest',
+	'bootchart2-doc',
+	'cups',
+	'cwautomacros',
+	'dtc',
+	'efivar',
+	'epiphany',
+	'gcr',
+	'git',
+	'glide',
+	'go-dep',
+	'go-helloworld',
+	'go-runtime',
+	'go_',
+	'groff',
+	'gst-devtools',
+	'gstreamer1.0-python',
+	'gtk-doc',
+	'igt-gpu-tools',
+        'kernel-devsrc',
+	'libaprutil',
+	'libcap-ng',
+	'libhandy-1-src',
+	'libid3tag',
+	'libproxy',
+	'libsecret-dev',
+	'libsecret-src',
+	'lttng-tools-dbg',
+	'lttng-tools-ptest',
+	'ltp',
+	'meson',
+	'ovmf-shell-efi',
+	'parted-ptest',
+	'perf',
+	'python3-cython',
+	'qemu',
+	'quilt-ptest',
+	'rsync',
+	'ruby',
+	'spirv-tools-dev',
+	'swig',
+	'syslinux-misc',
+	'systemd-bootchart',
+	'valgrind-ptest',
+	'vim',
+	'watchdog',
+	'xmlto',
+	'xorg-minimal-fonts'
+	]
+
+def is_excluded(package):
+    package_name = os.path.basename(package)
+    for i in exclude_packages:
+        if package_name.startswith(i):
+            return True
+    return False
+
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
 SAME = 'SAME'
@@ -39,6 +105,7 @@ class PackageCompareResults(object):
         self.total = []
         self.missing = []
         self.different = []
+        self.different_excluded = []
         self.same = []
 
     def add_result(self, r):
@@ -46,7 +113,10 @@ class PackageCompareResults(object):
         if r.status == MISSING:
             self.missing.append(r)
         elif r.status == DIFFERENT:
-            self.different.append(r)
+            if is_excluded(r.reference):
+                self.different_excluded.append(r)
+            else:
+                self.different.append(r)
         else:
             self.same.append(r)
 
@@ -54,10 +124,11 @@ class PackageCompareResults(object):
         self.total.sort()
         self.missing.sort()
         self.different.sort()
+        self.different_excluded.sort()
         self.same.sort()
 
     def __str__(self):
-        return 'same=%i different=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.missing), len(self.total))
+        return 'same=%i different=%i different_excluded=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total))
 
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
@@ -226,6 +297,7 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
+                self.write_package_list(package_class, 'different_excluded', result.different_excluded)
                 self.write_package_list(package_class, 'same', result.same)
 
                 if self.save_results:
@@ -233,8 +305,12 @@ class ReproducibleTests(OESelftestTestCase):
                         self.copy_file(d.reference, '/'.join([save_dir, 'packages', strip_topdir(d.reference)]))
                         self.copy_file(d.test, '/'.join([save_dir, 'packages', strip_topdir(d.test)]))
 
+                    for d in result.different_excluded:
+                        self.copy_file(d.reference, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.reference)]))
+                        self.copy_file(d.test, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.test)]))
+
                 if result.missing or result.different:
-                    fails.append("The following %s packages are missing or different: %s" %
+                    fails.append("The following %s packages are missing or different and not in exclusion list: %s" %
                             (c, '\n'.join(r.test for r in (result.missing + result.different))))
 
         # Clean up empty directories
-- 
2.25.1

