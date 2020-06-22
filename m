Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.404.1592848878120243706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=T6fTv0Kg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.66, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f66.google.com with SMTP id 72so261222otc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PtJKXVFmKPWJT/R3pkwlFDEFKWYMapJXPnQP5HlP/Ow=;
        b=T6fTv0KgRFdoeP7UvDbgyISLFf1RJD0lNBpv1UsND3TrXKg+Iai15HSoxM0L5p9tu9
         b34h8MPF61UNDjqMwTUD/VqAXHV0syzRCr27jwhPjhq35YV/Oag4SWGF7sAzdh+xB4lo
         0ssJuZ35Ymn2wLtX8E0446GvYhW3WvT9dzsDEwcpBh1nc/5fl2KywlhwYqu0QWrzd+94
         bEXq28omLSYK0IyJ1jWX5aIYgeKRuObuOFMnTWx1iTCsip43Ha5Gy7Ln8nbzrLSOabxy
         +/FEmBud/aWNSSvMDIG3TQKAMsHF//CyvEVLk7pxwVd1YOfxoiFv79kLbJM9cLYMObKT
         KN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PtJKXVFmKPWJT/R3pkwlFDEFKWYMapJXPnQP5HlP/Ow=;
        b=ZzCCujQ6yZ/KVC1rjFFN0dUMbB6nMB9lhMWsShhB4F2/4/liBXnl4HWCeBKqxEyCKE
         7T4+EZdjNPxexvO5X7tIeWQgM3j91L+PJBscWtLR5WFce9ZR10hS7R/y0dOEOuO3RKNx
         CrLnH+liqE5076l8BFwbdr994vqHiQoq407YiyCvubWMsvBSUyzIHfgmw+E0yylI17EJ
         WL0dJw+Swca6twb1/8pkIMMaY7p9AiqRtTTiMLFGPBowzkebFYF8YH8rUe1oyx0U/M63
         6Nnfu54/hdPWZFbx6hKnZM1MCxhfCcCjKqYQbOGXFVPPTNoGE13tn26WezFG9qiU7Z3T
         IQqg==
X-Gm-Message-State: AOAM531YDVK6KdOHWJ/8Bu7CqHvoJtj8DAqP5ud+bwdYRkUDriI9rbGC
	I1oykC4VYjvpk2uk4QTNPJpFOGB84KgmqA==
X-Google-Smtp-Source: ABdhPJx+1HuOQtafznCGSfGR9/jNNdWNFYqkra8YCY3yGV7bc/P7/H8eiFNYXITOgOiZGOhx5NkCvQ==
X-Received: by 2002:a9d:4b90:: with SMTP id k16mr14575023otf.69.1592848876868;
        Mon, 22 Jun 2020 11:01:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/33] classes/archiver: Create patched archive before configuring
Date: Mon, 22 Jun 2020 07:58:17 -1000
Message-Id: <3de1b88174073ff1544bb3dd54bf82e87c495681.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

do_configure and do_preconfigure can modify source files, which causes
race conditions if these tasks run in parallel with do_ar_patched. Add
explicit task dependencies to ensure that do_ar_patched finishes before
these tasks start. Specifically, this fixes a race condition with
gcc-source where do_ar_patched races with do_preconfigure deleting
gcc/gengtype-lex.c

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a7c7794870815030239e90b03e37ed302b7e885)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 780c562b68..a8d3afcbe9 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -584,7 +584,7 @@ addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
 addtask do_unpack_and_patch after do_patch
-addtask do_ar_patched after do_unpack_and_patch
+addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.17.1

