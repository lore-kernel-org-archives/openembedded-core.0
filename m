Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.155.1617899509345749330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pb+ZKn9z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2885901otq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NkVTHOIz6Tc2XuUkEcl2k4o8BzBv1E/KcjPPv9rEOE8=;
        b=pb+ZKn9zzW3p5SKkAf++Q5SkUtxhGSH0eoE/2mWcGAlbGmT+a1YvIx1acBuo2qA01z
         8xoHEh1o6CBVFeIObI9geIIzNLacnIDULiz76rQeRRinaQptLv5PQDAWNbmTFDGQSap4
         q/C7GvI63ZSK9tAkkDBvkaqtra1Vmq5XyN5VyD0PibWQB4JlS8NUWI70PEmHEAYUUvlg
         fqEQk3iJ526rz26w0S0DG716KvxmbdIJPE8N34wkVWYdvgKU90GuWNdQNRk5ZnHfGuJW
         whSILM3HkSoY0rOHddy/w1KaPRgRMmkhoQKrTnTw2Du+FvwsEwLj8LQ3XtWp8Ihi6tci
         BD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NkVTHOIz6Tc2XuUkEcl2k4o8BzBv1E/KcjPPv9rEOE8=;
        b=lGKMnYgrFkLcGospmn696WlYMPYruf1X/BgL/B6CETHihit3q+mqbAz2SfftK8VToF
         FaAG2klhueDVT7HyW6duIA/Ych+nvfumt4rut9k9BMSXeceLA37WCwXfxqpjszw6PxJ8
         3jbV7AQBMDU2U0YJ56DAZKwBndrQsDBbkJDHHL4fgfsX3VnLh/+yWBELjsQTk0w14ofV
         qrMOlYaTZQdGosVluWCcWnYolGhTjybGQBLV+GziQGWnObfXJiEab1zGXcmuvFdLOIhX
         OmIbXyKEitmZAuxxhNmtNXXPy/yfbOII+oSu9U3/avassQ2Pqgfw+G7hVrGOtsBm14I4
         16Xw==
X-Gm-Message-State: AOAM532tsiYfsNq/kjssMqM94eRhu4OB/3bmoKk9dkQwss8djI/r+/5T
	d0w94SV4W4U6dXhEFDRxj194UqqQR5W6LaUDi4A=
X-Google-Smtp-Source: ABdhPJyDma/T1wMxaPam003HgU4uZFgORrZXKjJWzL+dNGl6E0mh7emtgd3K7rDRpZb9KcniVgPx4w==
X-Received: by 2002:a9d:921:: with SMTP id 30mr8427867otp.49.1617899508152;
        Thu, 08 Apr 2021 09:31:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.31.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:31:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] selftest/reproducible: add an exclusion list for items that are not yet reproducible
Date: Thu,  8 Apr 2021 06:31:02 -1000
Message-Id: <ac1c14fbbe69fe9459fb5741df061b74dad63f04.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
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

