Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.14974.1611678757240330104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 08:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qidJjgA9;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id b2so1519099lfq.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TJ8D0bO5WPNQ6QOFYnf61+xJvoXj8YFEptxoXJpzwlo=;
        b=qidJjgA9yC28PnG//KqrmtIG+y0Yw+5l6odZwuBzjop56pNMJCwnrZz9x6jcaTIybc
         p9n2v3BCVuRoVRYjHfVHk5MIhoz+Kv3dGA4pQM3XBw1sLvkumttybN+FutyXw8PNVRXR
         cdvbuh3Eb/T9MSdDBIKhsfC5+N5V4ypTwLPSvbX8YXrfp9Jz9Yvd7FG9+5wDTrB/tuK2
         7AojcAhY1u11yHKjOjA0hmD4NZUiOGjqU7VPTc2LjkCMPxQR+q5ci+816AIUFDem6eAS
         o4HJk8mWyOiCq7n8YNZr91g2N+oP+fsN77ySJ3gBa18xOmQ+bXSi8/OdPu1J/+BN9Sz7
         96nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TJ8D0bO5WPNQ6QOFYnf61+xJvoXj8YFEptxoXJpzwlo=;
        b=FnVu6zYhZWSIcadiBUjFz+91oHTnRj2pRN3yKQWXRCBTobmNQBFT1mR0XD2OPxjzl6
         eN2HDiQXB6hYxlJptl7jG4NNdw0OLcKapkrD7S0nUBTSMwpivhkvHzzq1oHAH7g/WbJB
         sfzNwEx2mCZhxpjWFn5SMPyT0icaj8p6YRd+WouDqG8lVsm4t70MRbGCkep0NH8oh8Z3
         1U4x7MgRZj2txpQm/eA4u5PqcEWnElazDc2247oVLPXg6jLYbc2lAquyEdicU8D7LzWS
         gfoqXovWKb9dl6ymjExuXSISM7SM9XfvJ7b3j/7yEYoE6ahwhWA/MFPg0NCicOxYFAQK
         MTXQ==
X-Gm-Message-State: AOAM533X5NwENaFwt8JiK/k7QJMk//0U25w5VqAgtz5EzFkJLoKL0trW
	kCgJhb5qa+4cQ2PlQglBOwlRDsQMcfU=
X-Google-Smtp-Source: ABdhPJxB8ZGH3XPSjE3P600UqxeN5xoZZOIqiFjWc+oenzHqJaGmOPhR8QrwavDTIyyuIIKbQIlmeA==
X-Received: by 2002:ac2:5bd0:: with SMTP id u16mr3065549lfn.36.1611678755123;
        Tue, 26 Jan 2021 08:32:35 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id b5sm188836lfi.3.2021.01.26.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 08:32:34 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] lib/oe/package_manager: Do not pass stderr to package manager as an argument
Date: Tue, 26 Jan 2021 17:35:13 +0100
Message-Id: <20210126163513.7840-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmd redirected stderr to stdout that was then assigned to variable
with pkgs to install. Then this variable was passed to package manager
that then tried to install it and generated confusing warnings.

For example this variable could contain:
| ['(en_US.UTF-8)', 'LC_ALL:', 'bash:', 'cannot', 'change', 'locale', 'setlocale:', 'warning:']

and the warning was:

| WARNING: addon-bci-1.0-r0 do_populate_sdk: Unable to install packages.
| Command 'PATH/usr/bin/opkg ... install (en_US.UTF-8) LC_ALL: bash:
| cannot change locale setlocale: warning:' returned 255:
| Collected errors:
|  * opkg_prepare_url_for_install: Couldn't find anything to satisfy '(en_US.UTF-8)'.

In this change I remove stderr redirection to stdout and pass it to
bb.note instead.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/package_manager/__init__.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 42225a3b2e..8e7128b195 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -328,7 +328,11 @@ class PackageManager(object, metaclass=ABCMeta):
         try:
             bb.note("Installing globbed packages...")
             cmd = ["oe-pkgdata-util", "-p", pkgdatadir, "list-pkgs", globs]
-            pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note('Running %s' % cmd)
+            proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            stdout, stderr = proc.communicate()
+            if stderr: bb.note(stderr.decode("utf-8"))
+            pkgs = stdout.decode("utf-8")
             self.install(pkgs.split(), attempt_only=True)
         except subprocess.CalledProcessError as e:
             # Return code 1 means no packages matched
@@ -384,7 +388,10 @@ class PackageManager(object, metaclass=ABCMeta):
                 cmd.extend(['--exclude=' + '|'.join(exclude.split())])
             try:
                 bb.note('Running %s' % cmd)
-                complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+                proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+                stdout, stderr = proc.communicate()
+                if stderr: bb.note(stderr.decode("utf-8"))
+                complementary_pkgs = stdout.decode("utf-8")
                 complementary_pkgs = set(complementary_pkgs.split())
                 skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
                 install_pkgs = sorted(complementary_pkgs - provided_pkgs)
-- 
2.30.0

