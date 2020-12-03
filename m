Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.11338.1607008132923272073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qEa/nG5q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id b26so1478408pfi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MGvgnno78boYZGq1i9XhTpcyLz5iG/KHP+9CLYLgsWA=;
        b=qEa/nG5qC1F4dpCOamXNwpyLB+EXmEYBnWAlF5yrrg8e9vW7uXimCN+PY0yBJMCMgm
         0I1Hczg3+toxnwg6m3VyfdCZeuy9X1q67J6qQiqdP/9SwXLCLTLB6QpJZSUHeOMm1pKG
         Bd3H2kbDFZX+Mcperg+DO7LWIlUjGOSd1xwpkTAngR6bzshl913KapxPF3wUpRwbQLQV
         BI1ja7nQQ0VIAoPcMVDOBKB1iLe8ShL7R4//igHV+lMQSK5grFPT6C/DXG4accfQcteW
         rG0k9XeYt4TGU+zO8LiDXMDd3mbF29rV1tZSRmo5pG7Q6w+xmOQXo6+gUCIho04AWSzO
         5GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MGvgnno78boYZGq1i9XhTpcyLz5iG/KHP+9CLYLgsWA=;
        b=WuvCVossGs5W+wmSdA7UPB5Qc6kMW1Rg6I56YCwHThqfeUJjfVDvo/HSXWkcAs2O0y
         iA1gGt3innTw0nz9tUcxyicePVTdoylcQOmvRbOc5ImW/fLrK7ZN6rhif3KPJsEzbP14
         ziXSIp0yAPJHDPXjQgFe8i3bPELttS5s/IbXj67OitIyQuer8dBT1RJE7m0csU4dABgs
         Gf+gVKMxNkYiL+O/mZj6Upn5JWIRQ33m/8/5+Of9sWs08jRn9ohsJVc8+Na9ayX2aCqD
         WD3Hzw+UO3biyZcVIDfQV36lh60+YJKTqrvc/hv72y48bnjWUNIgzBRQ/zjjcsMDv7hF
         0rIw==
X-Gm-Message-State: AOAM532biQre1oijo0jB1P9tGiexlHJ72LVIosH9rLja63DrX92aQkdm
	Gh84U3meYdu+gavzcnS5iAT4G1KSBDM7I9VF
X-Google-Smtp-Source: ABdhPJzse1g0D/J70Xz+dQos8NcNlQadlbAjccQfhY2GN0mLxed7KWGjCr5n/KuAhGGZCdIB2KPX9Q==
X-Received: by 2002:a63:df05:: with SMTP id u5mr3411497pgg.73.1607008131570;
        Thu, 03 Dec 2020 07:08:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/28] pseudo: Ignore mismatched inodes from the db
Date: Thu,  3 Dec 2020 05:07:55 -1000
Message-Id: <dac78840ea71e67aedc3141d3839f1519c7ba1ae.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, where pseudo finds a database entry for an inode but the path
doesn't match, it reuses that database entry metadata. This is causing
real world "corruption" of file attributes.

See [YOCTO #14057] for an example of this.

This can happen when files are deleted outside of pseudo context and the
inode is reused by a new file which pseduo then "sees".

Its possible the opposite could happen, it needs to reuse attributes
but this change would prevent it. As far as I can tell, we don't want
pseuo to reuse these attributes though so this code should be safer
and avoid bugs like the above.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c13149b81e03a1ac48b27a208a139d5493c3ce7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/delete_mismatches.patch      | 51 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/delete_mismatches.patch

diff --git a/meta/recipes-devtools/pseudo/files/delete_mismatches.patch b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
new file mode 100644
index 0000000000..6c78d787c7
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
@@ -0,0 +1,51 @@
+When we see cases where the inode no longer matches the file path, pseudo 
+notices but currently reuses the database entry. This can happen where for
+example, a file is deleted and a new file created outside of pseudo where
+the inode number is reused.
+
+Change this to ignore the likely stale database entry instead. We're
+seeing bugs where inode reuse for deleted files causes permission corruption.
+(See bug #14057 for example). We don't want to delete the database entry
+as the permissions may need to be applied to that file (and testing shows
+we do need the path matching code which handles that).
+
+I appreciate this should never happen under the original design of pseudo
+where all file accesses are monitored by pseudo. The reality is to do that,
+we'd have to run pseudo:
+
+a) for all tasks
+b) as one pseudo database for all of TMPDIR
+
+Neither of these is realistically possible for performance reasons.
+
+I believe pseudo to be much better at catching all accesses than it
+might once have been. As such, these "fixups" are in the cases I've
+seen in the logs, always incorrect.
+
+It therefore makes more sense to ignore the database data rather than
+corrupt the file permissions or worse. Looking at the pseudo logs
+in my heavily reused build directories, the number of these
+errors is staggering. This issue would explain many weird bugs we've
+seen over the years.
+
+There is a risk that we could not map permissions in some case where
+we currently would. I have not seen evidence of this in any logs I've
+read though. This change, whilst going against the original design,
+is in my view the safer option for the project at this point given we
+don't use pseudo as originally designed and never will be able to.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -699,6 +701,7 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 						(unsigned long long) msg_header.ino,
+ 						path_by_ino ? path_by_ino : "no path",
+ 						msg->path);
++					found_ino = 0;
+ 				}
+ 			}
+ 		} else {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 3b623d8bd7..7eb72f0eab 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://delete_mismatches.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.17.1

