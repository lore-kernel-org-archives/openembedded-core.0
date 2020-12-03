Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.9909.1607002668851337977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BAf+1D1z;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id bo9so3428423ejb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sN/ZBnXufPtx09YypT/NoI237W6W0N2rQAlzTrwKUvI=;
        b=BAf+1D1zNP0n3emX+5BMVaFC043CgqtRMlGZakag7U3YvXU5AO7K5DrBxpWHHVaBAe
         abPhgFzrAPwo4qdnTi9Nd6gs24StP/Off761dxrAdFcQZRK9Ks9/RmfOxcEQ6k5UX+AL
         EXIyhkqr/CnDf2I4pg0NblInQ2tLK8odETEixsdb6l1uiIgBDUYvQluspypy+gjjeeW6
         nY3JXFzBqoy4ezquX5GJ5TyppRkBn4LCA76OM6mItLoLxRY9EEE6tksAhx3Gd3x8UEw2
         GcO5EbQds1iWStbOUXXl5y/FXD0ENgF2uCK2lKid2OP2fzH1KBPInOlVbJ137xUuyTXt
         vq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sN/ZBnXufPtx09YypT/NoI237W6W0N2rQAlzTrwKUvI=;
        b=iJprcSlr6yDQx9//NJPgwQJSGN8rLbuXtSdMz/4RvGT9re+//jjqc7pYbUL3fCqeSA
         6P2RHbFyhAkBumRc02DAtWh1z9W1sE8JPge/3GHvaPzKGA6TT4tPyrTEDh6ARI34cA7c
         /lwj57JJF/9cjhH271Q81rwbcCp4PN3WncD6OuUJ9bo6FaxExc7WaoR0WHka8D7lI6hD
         CbZ/ycRyvKhqceGLAw75oz5eqMg8F1Zg71c4DU2xhyLyqRFGF/p7If7ehy/XZLiuYzhK
         O1Tn0rz/Mdzl9Q/GiPEA32xROcg86JzoD/NPPZ8vIv0EDH/AZx8IpqbRJWEK69lLml9V
         l3tA==
X-Gm-Message-State: AOAM53113gQG0KA0yPeeouRJvg6E46S4p7wO8VhtaEtyDPn6LLxGvdpX
	U80r/uBseERtS8IrAaKMDSbJVN1jRAVhFQ==
X-Google-Smtp-Source: ABdhPJxlkL5aPnleWJUbi6Uy47M+hPHNwv2YNXvSUXdGtLMBlUahwI0TDqOCuEArpi1+eArne7IILw==
X-Received: by 2002:a17:906:c248:: with SMTP id bl8mr2518440ejb.343.1607002666921;
        Thu, 03 Dec 2020 05:37:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/11] selftest/reproducible: add an exclusion list for items that are not yet reproducible
Date: Thu,  3 Dec 2020 14:37:27 +0100
Message-Id: <20201203133727.12936-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hopefully over time this list will be reduced to an empty one.

Non-reproducible excluded packages are not given to diffoscope and do not cause a
failure, but still saved side-by-side with non-reproducible failing ones to make
investigation easier.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 82 +++++++++++++++++++-
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 6faeedb544..e3597d5081 100644
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
@@ -237,6 +308,7 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
+                self.write_package_list(package_class, 'different_excluded', result.different_excluded)
                 self.write_package_list(package_class, 'same', result.same)
 
                 if self.save_results:
@@ -244,8 +316,12 @@ class ReproducibleTests(OESelftestTestCase):
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
2.29.2

