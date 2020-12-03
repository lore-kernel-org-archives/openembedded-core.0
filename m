Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11673.1607008147805512258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EsCKf7tN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id o7so1277765pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xS0jTASihAuAdIQPV6928DK9CrzUJiiwpDFFuMlPwwo=;
        b=EsCKf7tN+yWKwxHEJkd3FwdWpa54XSMK1DN5JBvCNesp/vjGoxIFwQpYHLHMssLO5+
         qPWCPSWo3Y9Q2ggz2bFbMrUaPLh7n5fVgF+g6yjaa6PQIca/EGq6DgYDoOYrGObHdp+g
         vKA/72h69qboOY1Ve3KOxatdMPpe5zKxwr81RcFK0Ulr/nJW8dwVKyOsyRxbClNOqejK
         I+Rdxy/PmY8QS+Faez3tkSCtsu7Gmu73RVd3loWOzFNJZCQRrludNfxS3nNhI1TXntg2
         Zh2eU8IDdbr93PdfKe4fqU12tsdERoTP+XpWIy3/Vzak2AVSj291+7GHqhCuIdu21DnF
         lRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xS0jTASihAuAdIQPV6928DK9CrzUJiiwpDFFuMlPwwo=;
        b=biN/MJFir4lma1nPAEvBMdbR2D8hEmjS8heH5u72M/J2DXdpUXsHiFcHbf23c5JWsr
         Y0s7xDOevTGcWo0hCgDv3zpQ7Ytg0IefNhDcsdzSdVkRSAapJNeB2BVFiBbNx5a3hXqo
         OicD7YFZ7DAMAdJq/V/iqbp9RU1BVO1ViCUBdUialaXCI/hwQCSk4TXnSPgivsQrrQbE
         ieRPGv794WLVrYw5ts1hxAdIA3cld+49X6dgjaFu13nk1q7O+0GPz1d4hXocZ7NwiGik
         pRfCZcD/3jkxTtA3ZmE6fDOmfnzCtSz9FtVQvMf+UPWS3JaepFEO13dciWf5Y1OxXfJx
         4kkA==
X-Gm-Message-State: AOAM530emwVZZAFb0JmX7IqTF4xYMFZ8GtnbWpMqJiqnn9Ywv/8rhYho
	9XXM7x9K8MauLaOmq9K6lVdRPs92sMW00wHY
X-Google-Smtp-Source: ABdhPJzJ2gkYeXDfefoywFgsT0mdAg4BlDhQHHmAV3IAB+MIy/t3/W1Op1/OiN0vtXaOoOxkklmR9Q==
X-Received: by 2002:a17:90b:4acc:: with SMTP id mh12mr3492594pjb.54.1607008146726;
        Thu, 03 Dec 2020 07:09:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/28] pseudo: Add pathfix patch
Date: Thu,  3 Dec 2020 05:08:01 -1000
Message-Id: <485e95f48ec6d8fb28610a0983d86122808f0301.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a path to fix up handling of dirfd being passed as a full file
and with path="".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3006bbe7768e4efe33d3d2d3f5786a561ecbe96f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/pathfix.patch                | 25 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/pathfix.patch

diff --git a/meta/recipes-devtools/pseudo/files/pathfix.patch b/meta/recipes-devtools/pseudo/files/pathfix.patch
new file mode 100644
index 0000000000..b3e63fa28f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/pathfix.patch
@@ -0,0 +1,25 @@
+We're seeing systems in the wild (e.g. ubuntu 20.04) which call
+with a dirfd set to the full filename and path set to "". Since
+this seems to be expected to work, handle it accordingly.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -1549,8 +1549,12 @@ base_path(int dirfd, const char *path, i
+ 
+ 	if (!path)
+ 		return NULL;
+-	if (!*path)
++
++	if (!*path) {
++		if (dirfd != -1 && dirfd != AT_FDCWD)
++			return fd_path(dirfd);
+ 		return "";
++	}
+ 
+ 	if (path[0] != '/') {
+ 		if (dirfd != -1 && dirfd != AT_FDCWD) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c5040f5f7f..bc20a2f134 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://track_link_fds.patch \
            file://xattr_fix.patch \
            file://mayunlink.patch \
+           file://pathfix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.17.1

