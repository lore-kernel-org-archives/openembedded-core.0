Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.1769.1599498155604946604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yBBIIUKb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id b124so8864585pfg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NKNgzPakwEFt58jziq5mxMyBF8f+s4J1t1JUqxxw0UI=;
        b=yBBIIUKb2xz4fZwZhCiM+r72cZogJ99ATxXnBv+5InScLSrHgkaTPzeSqVRCbsaJS3
         xRW/PI9ess5BXejCyHTVQfAY7cw3q1j/ciiMAeGqAUXFlcpzHZb7v4pr+RV+bbqO2P3J
         Hw33gdsW6wJtgv+fvHJPQBEzYyZGNPvMsk9zo2SwDEYWzxaEp0rT+c/Z4MRiPvLu9gjp
         kDmQyjpX6dJUsc6F6aifvrc/HPQ8TMQKFOJVAL1zBDzWrOZ7moqGGo3avEtfXxMh1hMZ
         LxieulA966Q/eygBvgpZ0/X7LIkFXJGZvRj19vPVJ8DctXtQ+whuT7zqnZWj0840ql2u
         t7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NKNgzPakwEFt58jziq5mxMyBF8f+s4J1t1JUqxxw0UI=;
        b=ia0kyQbs+UZu93JHjaVy+jzX94BP+m4PiTPvhNNaoz0c1bQ/vHYJTSk5RFt5ncFSTv
         I+dXgILKN3Xp5IdJohoNuXHGz4OOfYxERIlYiKSr+08VW6hL+LK20eVZltCw4zRAUXW1
         UqPXdGPBOfarcCW++/wnkfw4L1kzlIAYgV09Bnvb5EQ+Zy2xMLGovEFqMfoDzMPzgJh0
         6oVjHGbJaasYKT5aZFWSgq69n86GhojG0jH7MsL+AVAKtNpgCV+zhmxu7emyBcpjEVLQ
         KSSDDql7kmheRygNreik64Es+wHfB04jg7mpiuUlRcwBamZBjhO8kZOGLEp6tR/lvwDj
         Slwg==
X-Gm-Message-State: AOAM532zYWiCT7pa6KcYrQT6ybwlY/2ixCCuQCuk25NKgvzNYph3a11Q
	UfhP5Iq557tK9HTZ9i3/ROvC84BOo9FBqxk3
X-Google-Smtp-Source: ABdhPJyU08bLRkUNw764jsAaKj4SOJvOEtn6qY5iynvXStQ76TLmAugoK4Tp5wMrL5j39RKm4nL9gw==
X-Received: by 2002:a05:6a00:792:b029:13c:1611:652d with SMTP id g18-20020a056a000792b029013c1611652dmr19546764pfu.13.1599498154701;
        Mon, 07 Sep 2020 10:02:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/18] kernel-yocto: checksum all modifications to available kernel fragments directories
Date: Mon,  7 Sep 2020 07:02:02 -1000
Message-Id: <e397859ceac42d926134d5cb7828526d8d649c95.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

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

