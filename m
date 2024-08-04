Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023CAC52D71
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:42 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.30091.1722791377197813709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kOcbj7z8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d150e8153so3199988b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791376; x=1723396176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSidrCShGbJuugfeH/ISorc0o/1RW4R5HZ7EpB813og=;
        b=kOcbj7z8u61liP0DnLZTtKhsETTPXoMTchNoHjpPrDxtZ9d0v4gR5af7L8/r+No3Za
         0opA9mdzqJV3LhpTKgGxvrjsY/8IAWM6+nmKodUgAU3+NJaKmqwnIplhxV3EWeoUtXgL
         1mBHu4eVTXT4tk+Qo6769KzRQStRwSVz/M2gwI8FVONkscPIqDCLnScTROgzgYb+liKV
         9qYvKO+16VoWSlHtyccF8/HHeseEl+GD74RiAybIKwp4tlKmLEJAqTpHf0YLh/Gts0i8
         JMLQI02eGwWHesGCLsjNy0YP9tJ1FIRhK9WiOdQiJ3ThJ8nfFJ07iL4XdqlKsDfy3/+P
         RBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791376; x=1723396176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSidrCShGbJuugfeH/ISorc0o/1RW4R5HZ7EpB813og=;
        b=XEnPOvSZd1Aj9tYPnnRTI5r1JSZjoF2pYvfLIwVahlX9AMBZn81J6B/TWcDa13H0lT
         cEEX7ZXz9EBfkEO3hoJ36DsHh0ovnq8PYKCp9ZHiLrKkoZ+pHU+W8VADGqTjQsQlqQpm
         FkD5taBMEGkorGuvGXf/oPA6uX7wlsfnc14LWKxTVMZIE9YW5wl+3zLv7ShY3cL2UFSK
         vduYYG3VNHmPDH2pD6cn4FrSSmES6cvPJCgMQPDHLMi6DiUtzBjOQcpcnziLvBqOVFG6
         ear2VZq5Z5/OX4hoZH+PRptsCwLmfla+0qKwEu0xm1CF/WV9P8gagtasuw/q6JIi3b6i
         iWbA==
X-Gm-Message-State: AOJu0YxFw/eC7R+tOpX6Oa1sPEsy+BpgJed6RvauaFs0pcoRecC0GCJy
	xC9yd/wk5x/FamcxtflJQ53RYjMC1zCJbDouf0Ow7uRBajymP5dG/14K+3oAwivqZTbghKj/yZU
	P95Ki7Q==
X-Google-Smtp-Source: AGHT+IFvFOz9Dy9I4OocCVniSIUsnwXpKBtwwIEJjQ3GHhwDB+DACNZW+ROhAnaUQE2b/NBY6s2eBg==
X-Received: by 2002:a05:6a00:85a3:b0:70d:2a1b:422c with SMTP id d2e1a72fcca58-7106da29926mr14565827b3a.7.1722791376352;
        Sun, 04 Aug 2024 10:09:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/18] package.py: Fix static library processing
Date: Sun,  4 Aug 2024 10:09:10 -0700
Message-Id: <c2809691992dab48a360c9516d205ec031378cda.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202966

From: Mark Hatle <mark.hatle@amd.com>

When PACKAGE_STRIP_STATIC is enabled the system did not pay attention to
hardlinks.  This could trigger a race condition during stripping of static
libraries where multiple strips (through hardlinks) could run at the same
time triggering a truncated or modified file error.

The hardlink breaking code is based on the existing code for elf files, but
due to the nature of the symlinks needed to be done in a separate block of
code.

Add support for static-library debugfs hardlinking through the existing
inode processing code.

Print a note to the logs if the link target can't be found.  This isn't
strictly an error, but may be useful for debugging an issue where a file
isn't present.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff371d69f60a1529ed456acb7d8e9305242e74bd)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package.py | 56 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ffe5a2157b..af0923a63f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1065,6 +1065,7 @@ def process_split_and_strip_files(d):
             d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         checkelf = {}
         checkelflinks = {}
+        checkstatic = {}
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
@@ -1078,10 +1079,6 @@ def process_split_and_strip_files(d):
                 if file in skipfiles:
                     continue
 
-                if oe.package.is_static_lib(file):
-                    staticlibs.append(file)
-                    continue
-
                 try:
                     ltarget = cpath.realpath(file, dvar, False)
                     s = cpath.lstat(ltarget)
@@ -1093,6 +1090,13 @@ def process_split_and_strip_files(d):
                     continue
                 if not s:
                     continue
+
+                if oe.package.is_static_lib(file):
+                    # Use a reference of device ID and inode number to identify files
+                    file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+                    checkstatic[file] = (file, file_reference)
+                    continue
+
                 # Check its an executable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) \
                         or (s[stat.ST_MODE] & stat.S_IXOTH) \
@@ -1157,6 +1161,27 @@ def process_split_and_strip_files(d):
                 # Modified the file so clear the cache
                 cpath.updatecache(file)
 
+        # Do the same hardlink processing as above, but for static libraries
+        results = list(checkstatic.keys())
+
+        # As above, sort the results.
+        results.sort(key=lambda x: x[0])
+
+        for file in results:
+            # Use a reference of device ID and inode number to identify files
+            file_reference = checkstatic[file][1]
+            if file_reference in inodes:
+                os.unlink(file)
+                os.link(inodes[file_reference][0], file)
+                inodes[file_reference].append(file)
+            else:
+                inodes[file_reference] = [file]
+                # break hardlink
+                bb.utils.break_hardlinks(file)
+                staticlibs.append(file)
+            # Modified the file so clear the cache
+            cpath.updatecache(file)
+
     def strip_pkgd_prefix(f):
         nonlocal dvar
 
@@ -1195,11 +1220,24 @@ def process_split_and_strip_files(d):
                 dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
                 fpath = dvar + dest
                 ftarget = dvar + dv["libdir"] + os.path.dirname(target) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
-                bb.utils.mkdirhier(os.path.dirname(fpath))
-                # Only one hardlink of separated debug info file in each directory
-                if not os.access(fpath, os.R_OK):
-                    #bb.note("Link %s -> %s" % (fpath, ftarget))
-                    os.link(ftarget, fpath)
+                if os.access(ftarget, os.R_OK):
+                    bb.utils.mkdirhier(os.path.dirname(fpath))
+                    # Only one hardlink of separated debug info file in each directory
+                    if not os.access(fpath, os.R_OK):
+                        #bb.note("Link %s -> %s" % (fpath, ftarget))
+                        os.link(ftarget, fpath)
+                elif (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
+                    deststatic = dv["staticlibdir"] + os.path.dirname(src) + dv["staticdir"] + "/" + os.path.basename(file) + dv["staticappend"]
+                    fpath = dvar + deststatic
+                    ftarget = dvar + dv["staticlibdir"] + os.path.dirname(target) + dv["staticdir"] + "/" + os.path.basename(target) + dv["staticappend"]
+                    if os.access(ftarget, os.R_OK):
+                        bb.utils.mkdirhier(os.path.dirname(fpath))
+                        # Only one hardlink of separated debug info file in each directory
+                        if not os.access(fpath, os.R_OK):
+                            #bb.note("Link %s -> %s" % (fpath, ftarget))
+                            os.link(ftarget, fpath)
+                else:
+                    bb.note("Unable to find inode link target %s" % (target))
 
         # Create symlinks for all cases we were able to split symbols
         for file in symlinks:
-- 
2.34.1


