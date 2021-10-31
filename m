Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D61C4332F
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.32822.1635699494378159523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4Ola6F9I;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id p18so6781197plf.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wvmw5XvFhsX4e62eZAn53ahcZ/UTv8wcIvkwjzsPxVs=;
        b=4Ola6F9IxVXGqnY7CISrJUtWrs9wYqMpguDzI+zsI4xgC52juUxOJ1BLkFmYs1OxOK
         fu8j1PbiUlcXsTA7FeT4JBX6N+GvtC//gXobz4r7nFz6+MzENmE4C2rPu0AeYcUD8oXO
         JzTAxU6HrfY7lLRjpncWs1LRRYWv1bIFwqjuVbNPwoTidmpzRhiAhNvILFbo9L4fBIxC
         oiFVxlJOKDAXzkT90QQRtUwPuv1UDRSNTJYBrROQAI3xpWjXL4nVF0/e00xg6+Om9hTs
         vwB54jyGiJKr2OA7b/pw9viPeGJ7mHcIQj4u1hPW0kY+WQQ+ZQP2UAhHm/vbAHXGSAHC
         M71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wvmw5XvFhsX4e62eZAn53ahcZ/UTv8wcIvkwjzsPxVs=;
        b=lsxDpMGSRRR8gc+d62ZW3ZsrJ/nZBuR1AXSOigk/MJSHto/EIZfZE9nelsNJQFUtBX
         Njv64TioNyJsMBaVsPFvjGGho3qj/qKBWMW1DnolYg0x4CVqoBy9gW9b8I/+dyH+5/3y
         qfQfCzBvsaSbYj/UOR7UE5aUJeSbsYIGoNxb4PKkOZooT4Of703DapEypAZB0sj0NBY2
         jWncEZFgIqZWMpukW2+eAp2AXXZM9UGVpvUhvgBpUX1D+Ypno+KjSbigcQb31XIOv5w4
         x2KASARZbnhftqhaX//ZIG3j5bGsyRA5pSXu6D6u4eYTZ/GtRqdrZaf7flfW23fquNet
         IaXw==
X-Gm-Message-State: AOAM533vp8NAGa9zjPXqNCmkYi0OarQ1e7SCmNonsqo1FYnvX2cqTo9C
	q5t+J3watClIgMthFMqcEIpC4yEZBRwAtdzhnx4=
X-Google-Smtp-Source: 
 ABdhPJwbsxi8VV6KgRsdRsGLyPXFtd4Ah481x/xfqok5LPuOcJCW1olhYAx/pTul/jqUzV6zt03IvQ==
X-Received: by 2002:a17:902:d4cf:b0:141:d36c:78f6 with SMTP id
 o15-20020a170902d4cf00b00141d36c78f6mr6173733plg.56.1635699493516;
        Sun, 31 Oct 2021 09:58:13 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/29] base: Clean up unneeded len() calls
Date: Sun, 31 Oct 2021 06:57:25 -1000
Message-Id: 
 <e0cecf7b4a4b966f11527a88e632997bdf74af96.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157664

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This code pattern isn't very pythonic, improve it to drop the unneeded
len() calls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69376ac1a6147b26fe1abaa4cf68414024814d63)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8a1b5f79c1..a3e98d1b50 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -153,7 +153,7 @@ do_fetch[vardeps] += "SRCREV"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
+    if not src_uri:
         return
 
     try:
@@ -170,7 +170,7 @@ do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != o
 
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
+    if not src_uri:
         return
 
     try:
@@ -688,7 +688,7 @@ python () {
             if os.path.basename(p) == machine and os.path.isdir(p):
                 paths.append(p)
 
-        if len(paths) != 0:
+        if paths:
             for s in srcuri.split():
                 if not s.startswith("file://"):
                     continue
@@ -721,7 +721,7 @@ do_cleansstate[nostamp] = "1"
 
 python do_cleanall() {
     src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
+    if not src_uri:
         return
 
     try:
-- 
2.25.1


