Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.3688.1588796824090080271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 13:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cBy5HUGn;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id u16so4205748wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 13:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GFMgLtmRWVpq6aFqzTOosvK+Nc6y6L1Xivw5bojTa5c=;
        b=cBy5HUGnkdyLbZcZHkPrf+BvMzw5z+MG17GFdEUVNEBIRmzpO7QhzU9vhTlccXm+tm
         9g7ZMjMvsIiPbr0SBrlBiXAMO6b7KIXdKsxPqhgdxBqomwvv+L2rPnMJTlD4z6CiGUi2
         LWc3ypSk05TkwGveNb27CT60lL6fr86V4eoaIvPm6XSMfKiIisGHq7Tx13vqlQJwJXzR
         c2XuSabrTq0C/2BlaowDEW9nJPLOTm8UiQRHhFAgf+z/STMlR9IjtvHJZKXAi4ZxwM+t
         sLgVZ4qph68I6YcegNIk0ZLrwmi5/QPIoUpaVd4ifnk9fjQjOxZgiBGvn/nYpyBHxz++
         fiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GFMgLtmRWVpq6aFqzTOosvK+Nc6y6L1Xivw5bojTa5c=;
        b=Uvtn7EmPMPVNEa7XTrDEkREqSEKYH1eh0wbMF+uITkUhf7y4hM5zu8bnKjSGZ83Q7k
         Y++Va8pXeiEpe89JQRxT0LZ0MEdXLYzTbHEQuHgYH3wCQiVc+qfVzvrWIZdzmlc9aEs6
         mzD1EDQqQqEJsgrUY8CXNHcd59xBo3eMg1z0IRQNUchhtAscEmmpWYRjCoiDirDm+wxz
         KcAcqJHmSXMltIysgz2XOmAlbqs8nXlNbD9IDNzFZ+WqMoIch0a47XHmGzL/HlYJjRZq
         gdY8/m7RcMPQFK0vreE5IxeY75iq2mXT29gUZAkukQ6oh5+2YNFHiBCKutkVpijBgyOv
         8wHw==
X-Gm-Message-State: AGi0PubJ54L6ouKMUZk2fdMckxlh6BEMYHg/api+lyFt9EiAnVRXpQus
	tZ1s9db7Y3Yd9guIfHff4cuYLY7+QQE=
X-Google-Smtp-Source: APiQypII+f4yfA9kWzbzSjhwvgtQFEVoZuJ5ezPgghi8r21LwR9rzJXjb09iXYFwAKA9FNz87S4cQg==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr6190736wml.122.1588796822350;
        Wed, 06 May 2020 13:27:02 -0700 (PDT)
Return-Path: <jan.vermaete@gmail.com>
Received: from localhost.localdomain (78-20-166-56.access.telenet.be. [78.20.166.56])
        by smtp.gmail.com with ESMTPSA id s18sm5015326wra.94.2020.05.06.13.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:27:01 -0700 (PDT)
From: "jan" <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [scripts][PATCH] Newer Linux kernels are producing built-in.a files.
Date: Wed,  6 May 2020 22:26:49 +0200
Message-Id: <20200506202649.23638-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.17.1

In the past the file was named 'built-in.o'.
Nowadays it is 'built-in.a'.

The script is modified to work with both.  I expect
it will not happen that there are built-in.a and built-in.o
files in the same kernel.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 scripts/tiny/ksize.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 8316b85cb1..63c5495c91 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -4,7 +4,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Display details of the kernel build size, broken up by built-in.o. Sort
+# Display details of the kernel build size, broken up by built-in.[o,a]. Sort
 # the objects by size. Run from the top level kernel build directory.
 #
 # Author: Darren Hart <dvhart@linux.intel.com>
@@ -48,7 +48,7 @@ class Report:
         r = Report(filename, title)
         path = os.path.dirname(filename)
 
-        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o",
+        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o | grep -v built-in.a",
                   shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
         glob = ' '.join(p.communicate()[0].splitlines())
         oreport = Report(glob, str(path) + "/*.o")
@@ -59,7 +59,7 @@ class Report:
             p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
             for f in p.communicate()[0].splitlines():
                 path = os.path.dirname(f)
-                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
+                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.[o,a]"))
             r.parts.sort(reverse=True)
 
         for b in r.parts:
@@ -139,7 +139,7 @@ def main():
         else:
             assert False, "unhandled option"
 
-    glob = "arch/*/built-in.o */built-in.o"
+    glob = "arch/*/built-in.[o,a] */built-in.[o,a]"
     vmlinux = Report.create("vmlinux",  "Linux Kernel", glob)
 
     vmlinux.show()
-- 
2.17.1

