Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.343.1611586325962838394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DmYL65lH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id l18so2741939pji.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p2Fr57bgryJtBAigQG5iZJiksbNM+MXvV7HJEM/fgEg=;
        b=DmYL65lHodmnDkiZbsrW4tElB+MqlLB8iMUcXWyOu97YqOpVgARQsjaKcKxnqJo1oE
         uRUvTGgSZnCqaqYwHBc6sPWkOt4TkRb2escycwg5EEed7vEW08hbKNyCoWKFMUA3EMUD
         DTC3N7FEf+qr8mHIY0oi6b69WRv3nLNqt2LCE2YabF11GuzeTYZ91Cp1H6lVpsUbw0Ck
         yR4/aPAOz0u2idHBXtcSfMgkZt6ujCzXHk+jjmSNmd98kDSd5tSsEt5Vb23dGq0cGRii
         ErysVEfjkbBED7uwD4jpvxYPdbez47vyIzOINag11CeonHy6kDVLb5O8+07/sPGLcuh6
         PKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2Fr57bgryJtBAigQG5iZJiksbNM+MXvV7HJEM/fgEg=;
        b=Rdwf3SmLUIYGs9bo3WQDTQAHxIxVIAy5XfArtVy8kkYrLtMaz1yVH1s5BVzr4iH4wf
         aewYdVa8VXkRgjQoWtBbZqozvcQUnrXvjLtsacXQ2Q+qFw4dQjpWXTIJm9vAr1dms0F8
         n0fqcgfrzu3U9XMJapFo19F9ULg4Ep5yHoj+VgGDWBk+C8Ozv2lezOeirY61N1MXH+dL
         Y2IJ85wZgCxket2HWr92H0/In4mlB7OIN3lwWQKsbGnoeHYxCNCjCRkfRSCPcL+il7D5
         mSsugTS6RorExNiR5AVHpcQoZdNPieX+EJvQvJutCQxa7ak1gWTcV3fYswqn2cAhBWKF
         dvsA==
X-Gm-Message-State: AOAM532qM0LUuqK085EGh4UfpJrazRhYdmxCzdwIjNaWh8rxfg9ZQxck
	nu7B8DRk92g9MrBpjWkcAPccMu7Mfi1pNXzTS7w=
X-Google-Smtp-Source: ABdhPJwTWsV/VQ0Ghq20pzM1DfvMcvopdWVXZT24t01xSoWjgFc3ECvJI4jtoWDxQHAYcsKtNpjOyA==
X-Received: by 2002:a17:902:b08f:b029:dc:8ac6:a147 with SMTP id p15-20020a170902b08fb02900dc8ac6a147mr797409plr.84.1611586325098;
        Mon, 25 Jan 2021 06:52:05 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/47] pseudo: Add pathfix patch
Date: Mon, 25 Jan 2021 04:50:43 -1000
Message-Id: <b75a950dc9c21a9edbfe113ceff439e156476b5c.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

