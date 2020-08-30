Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.37099.1598811548368627131
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qXSX7f6z;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.196, mailfrom: steve@sakoman.com)
Received: by mail-il1-f196.google.com with SMTP id m1so4704596ilj.10
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NKNgzPakwEFt58jziq5mxMyBF8f+s4J1t1JUqxxw0UI=;
        b=qXSX7f6z3zEEK/LdxUFUG2YHEj+k+W/oQfd1BxkLRUcTqI23tTSGYroflynxLxVBFP
         OV/2wAHg8PhSGDZkiblGsvRLz2DhATLfj2CWoCDG+rHYyjPG/SuzGKsHp/Gno2mKL6rk
         l1EdrWECkie/w/Ih8UtwCZ7tBQh3RhoxWWDsJy0wnJPjRshXanmDkaYQdE+0cZ1KtDXk
         4bWLi2KnxrsWkr9b6cKHPRAFu8ZMml+2gbj4mUJM5YC/8DMNuAGGDiFh05fM+6hqRUXZ
         hFHmH9rM6jTM4RS1rb0JsKTPRYJaADMuPP53tdNyNG5Khgfqib1F2FaryJvq0Xp7T/yg
         y3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NKNgzPakwEFt58jziq5mxMyBF8f+s4J1t1JUqxxw0UI=;
        b=URxC3uXUdptavyFxxNs2ZCfJ0K4jugWngTe3CksJct+ylsUmumEuK+tJH4hOcORf2v
         Fs+xk5NjkmRqoW4bSMxBbdn3Qfyclkj3LsPtLLU5aZbrFtdk1bzNb2+54L3/9xUr4qp5
         9rsjh8hdPOmKdUe01FoJI4KJv06pkeCt6E4sVdnuasjNtAzV5AgZqlVbrGbrY8IqL++z
         G0Rw4VY2Hu/z9Iq2eReFif/CgOwwJ6MT6WcwHRTJvX5/S9fdgYlMGzBSr+w/wtnT2hOQ
         cw64fUWxPFwWfqnaJkzazska6p/YZU9vduDHxSxdH1tvGq4tm3EMZ8UIJFK4+g9bdr7s
         lzvw==
X-Gm-Message-State: AOAM533ONqvwZUvBmMG5tkdLSTx+jcJDnpzuHdirO9bOXu0J9Xk3wmKY
	AKEZP+6JZa5/3Mk5jD6MFtvAJuBn3fiQKWUQkQU=
X-Google-Smtp-Source: ABdhPJz7uMOYu/2UUcJpT9gPR7DZpGmDUdeiSuE2DFujJsEv1i28GJcP0/+asTmt0A2G/CyCsGuSxA==
X-Received: by 2002:a92:a302:: with SMTP id a2mr6250017ili.116.1598811547237;
        Sun, 30 Aug 2020 11:19:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.19.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:19:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/25] kernel-yocto: checksum all modifications to available kernel fragments directories
Date: Sun, 30 Aug 2020 08:16:16 -1000
Message-Id: <828aa360dc91f7a22d5ab50bac145274b3ba8220.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is based on the patch from Zhaolong Zhang <zhangzl2013@126.com>
[kernel-yocto: checksum indirect cfg and scc files]

While the recommended manner to share/reuse feature fragments is to
maintain them in a kernel-meta repository and track the changes via the
standard SRCREV fetcher mechanism, that method is not always practical
for small sets of features or for quick testing of changes.

These other flows use .scc files on the SRC_URI. It has been noted that
config fragments or other features indirectly included by those .scc
files will not trigger the kernel meta-data to be re-run and hence a
build can continue with stale data (or not be triggered at all).

To solve this issue, we can collect the directories that are searchable
via FILESEXTRAPATHS and add them to the do_kernel_metadata task
checksum.

This allows modifications, additions and removals from the potential
kernel feature directories to trigger a re-execution of the meta data
task.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09f4db415fb6a1398e9e9b359630043c833f6118)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3311f6e84e..cc8bcb909a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -85,6 +85,21 @@ def get_machine_branch(d, default):
 	    
     return default
 
+# returns a list of all directories that are on FILESEXTRAPATHS (and
+# hence available to the build) that contain .scc or .cfg files
+def get_dirs_with_fragments(d):
+    extrapaths = []
+    extrafiles = []
+    extrapathsvalue = (d.getVar("FILESEXTRAPATHS") or "")
+    # Remove default flag which was used for checking
+    extrapathsvalue = extrapathsvalue.replace("__default:", "")
+    extrapaths = extrapathsvalue.split(":")
+    for path in extrapaths:
+        if path + ":True" not in extrafiles:
+            extrafiles.append(path + ":" + str(os.path.exists(path)))
+
+    return " ".join(extrafiles)
+
 do_kernel_metadata() {
 	set +e
 	cd ${S}
@@ -330,6 +345,7 @@ do_kernel_checkout[dirs] = "${S}"
 addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
+do_kernel_metadata[file-checksums] = " ${@get_dirs_with_fragments(d)}"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
-- 
2.17.1

