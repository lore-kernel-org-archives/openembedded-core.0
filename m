Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.8399.1626358125870357570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ODIyrkqf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id o4so1790668pgs.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4BCo4U+bIrjGxhC/17qVtcz0mTUR4P6NiFkkZRx0W1w=;
        b=ODIyrkqfVEaxqVrcl4Lzolva3ynGOk0TP2tuX1+YRGPyILeqb7A9DrHUqDpXGrSevr
         O4BQSzeXtm0oTB+iCUA+p129E7TZw/g6o5npHDsJs6HrFp6npdBesP5/cGG4i18qlZH1
         B9GFUaYwSYwP9Xzjd4NAmuinsjziVbj60YueNX45KLpKE18MD90av/hvqehYsjEXPvml
         Ukil7PlE5KtR+J/edWai69DzI0vC5n7XVReop7RynBJ7eIIDmiTjdTgEzttlmRtrHbk7
         gxRQhSKg8WIYiRDybVG0UzrqyO39aiwLUvbao9QF77KNbeE342iP+PvPVplQlilYSTly
         vm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4BCo4U+bIrjGxhC/17qVtcz0mTUR4P6NiFkkZRx0W1w=;
        b=BXHu4Iwuh8ygzUoPpbj6enfLbGt/LlodNFCAjT1CzHUGP4CFZ/Af1m5c/xlXKmq2Ua
         hbEcgVFbHYGi293QyUUF7DaDzeHvhu2WOXWJNr2BSorBuLvvCqn/MnCdYAMyIffy0AfN
         LSFvmobDWjwGV82f7/WvfidzWEp+ULW/z3N8Q5cvsnYP3cEW6UPX5KACo33TlQbmd585
         wAmGDFB7WOQsll3nVxDi/3V8drc12N/wCVhEeN5hqjXn4fnkvCN3uw9XWw273N+/UWo4
         6mSI2PnWTOHCbj5WoCMg5XLAvz1yg6KBPArMtSvT390NrfcxeNUSQMG7Q2PFz+OmyIlp
         fHZw==
X-Gm-Message-State: AOAM533Mf85w6nDMIWw2fQ/uPj3KmbjcbHZMlYduMRdUVHtAyvDhdhin
	S3bwPm9AzATZOmf9o8q28HZm5Tz+cc3RjICE
X-Google-Smtp-Source: ABdhPJyQciH2iU58hLFpxLxOfP5LvrV+EqMgcLfuF2n/O2fdFubW+Ko7ti0ep+jlfktw05o0RpwzMA==
X-Received: by 2002:a65:6442:: with SMTP id s2mr4832715pgv.420.1626358125004;
        Thu, 15 Jul 2021 07:08:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] pseudo: Update to latest version including statx fix
Date: Thu, 15 Jul 2021 04:07:23 -1000
Message-Id: <c78d82c60acd8cf1eabc728d614bf4631a96c2ad.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This updates to the latest pseudo version which includes:

 Revert "client: Fix some compiler warnings"
 ports/linux: Always build statx support
 makewrappers: Handle parameters marked as nonnull
 client: Fix some compiler warnings
 wrappers: Avoid -Wcast-function-type warning

In particular, this pseudo version always has statx enabled which means
we can then remove the need to make pseudo-native host distro specific
which fixes an eSDK issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 58cc70940ff998be49a9b89e1ad0538242cb7998)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4eab133128..0ba460f3e6 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "ee24ebec9e5a11dd5208c9be2870f35eab3b9e20"
+SRCREV = "b988b0a6b8afd8d459bc9a2528e834f63a3d59b2"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

