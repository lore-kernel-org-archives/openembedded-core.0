Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.1480.1586887717002409252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 11:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@izotope.com header.s=google header.b=d78PIXUu;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: parse error for token &{10 18 _netblocks.google.com}: limit exceeded (domain: izotope.com, ip: 209.85.160.196, mailfrom: mwillard@izotope.com)
Received: by mail-qt1-f196.google.com with SMTP id o10so10974253qtr.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izotope.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JKKky/MK+YqA6KEVTQehMG1BZuCV/UKg2bMXpil99kU=;
        b=d78PIXUudSaqWVpa0rN7AoWhXqryD1dafVxxj+iw1sBy6li1PX2d9pUbmo7yf846cI
         9M2DWtt1B+cXE8g7S5W3hhvgze+d99dKfph6IvsLxxuii75NuIlhIy3y2E8To2HC8xMU
         xeFHZPLWASbYClQqo8uyA1sPdKbpupz9t25As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JKKky/MK+YqA6KEVTQehMG1BZuCV/UKg2bMXpil99kU=;
        b=Uct2aXdaD4c3RbiJf4th0kgs7BkhJD4C3JnNqNoa7qOj6nAPfTgpio9837V9G1yxgP
         L5xQFRScwXTAncJOv3HQJjEBKUfftTKNaLF7BP/Hq/7DuVKLNNJNVhypldTyI9P+M8pW
         VL7cX0arinEfhUpQFN7VjLJ3kSbJK1SvovaRVVne7u/feFFVllUxyBTPqeODOAeAuPWs
         AbhuW32/6DvTw3l/eIFqIlys0TPUMcig1KsV0bQlV58DV9Mf2tfWS3LmK+pvfA6LAZKZ
         9gygcuBqRVd/DmJHOsnANiQU0ZIA4C9t3qb0UbisqGthuo0GpoLkoe52zIKwjcoRIWuA
         1YfA==
X-Gm-Message-State: AGi0PubojIuTo+rgOIMdr28Q29ltWmqLwOdhoA8rMWAB4+9iUweLL4W1
	tpQ96bh/XpeOHGIqRQJg/oT495xM1t4PKg==
X-Google-Smtp-Source: APiQypKGo3gLi8Q5iPJ1HKmB15lCHb3J4o2MvVq0uz2KRvMInujk+hU/DoV+Z/+Heo1P9Gg9Us5P7g==
X-Received: by 2002:ac8:2c33:: with SMTP id d48mr17448697qta.323.1586887715914;
        Tue, 14 Apr 2020 11:08:35 -0700 (PDT)
Return-Path: <mwillard@izotope.com>
Received: from localhost.localdomain (pool-71-184-149-228.bstnma.fios.verizon.net. [71.184.149.228])
        by smtp.gmail.com with ESMTPSA id f68sm10900676qtb.19.2020.04.14.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:08:35 -0700 (PDT)
From: "Mike Willard" <mwillard@izotope.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Willard <mwillard@izotope.com>
Subject: [PATCH 1/1] insane.bbclass: Warning for so file version mismatch
Date: Tue, 14 Apr 2020 18:08:26 +0000
Message-Id: <908ebd3f3e9c539593802c0b81780f9292bcfd2d.1586887105.git.mwillard@izotope.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586887105.git.mwillard@izotope.com>
References: <cover.1586887105.git.mwillard@izotope.com>

Adds a warning if a package produces a .so file with a
version that doesn't match the package PV.

Signed-off-by: Mike Willard <mwillard@izotope.com>
---
 meta/classes/insane.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 478240fa57..bb7f625667 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-            mime mime-xdg \
+            mime mime-xdg so-file-version \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -488,6 +488,24 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
                 package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
+QAPATHTEST[so-file-version] = "package_qa_check_so_file_version"
+def package_qa_check_so_file_version(path, name, d, elf, messages):
+    """
+    Check for ".so" files that do not match the package version
+    """
+    import re
+
+    pv = d.getVar('PV')
+    # Search for .so file with version number following
+    prog = re.compile(r'.*\.so\.(\d+\.\d+\.\d+)')
+    matches = prog.findall(path)
+    if len(matches) > 0:
+        so_file_version = matches[0]
+        if so_file_version != pv:
+            package_qa_add_message(messages, "so-file-version",
+                ".so file version does not match package version:\nFile: {}\nFile version:\t{}\nPV:\t\t{}\n".format(
+                    path, so_file_version, pv))
+
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
 python populate_lic_qa_checksum() {
-- 
2.17.1

