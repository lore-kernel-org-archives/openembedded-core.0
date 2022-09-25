Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F29DC54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:19:02 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.20404.1664133532923937238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QhhEUltJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 129so3356785pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=rWTIDmEYEgBwgwM27FAAf0FkVap0+vHzmvC4K47QcGQ=;
        b=QhhEUltJ6KWDADU7GKsNQDsGbC0DDhxyu8LUCIJ1b36lnUi9DTKnd/RXUKBg57lsme
         IeZoDgHEmbjDlXv9/AsSgrVppTSYlRCl/fJqPjrm1KH/YRklBu/zC6CliE3VxFOVbtVD
         cklCKcyb+Ic6jac4NjQabIN/TAMMSHpuNw4RtNRY5EVSgf9+AGsM7j4+khixh2F5X5Q6
         EHUB8nbgW4lXnNODXgJSlZxbz4CjY6JEl0ygiHSbZn2rGyxRXAHGbznPAP8PE/3khOIK
         /RU3CVz6jVdmdH+pCQ3D9vuWlRMQyE1Ij6MusOOrRnkDTHzyTbGT1jxiMeBc9wFLt3dA
         dzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rWTIDmEYEgBwgwM27FAAf0FkVap0+vHzmvC4K47QcGQ=;
        b=gvxD0uQoEBMWF1MrSDperGMgwvkkhY4imSYp2kaL/uqzlrrzj9HUjBPKbTuX/EIUcH
         Hz90+Josolftzr4qMmiHGHD2rHWTRJx8HADbF6BseLtIsRsELQeJS7LgqYz4vYwTDzuM
         Ai94ngJcr92KvgZprC0+jQkDOMa5jbt3i8jOFi6VQGFtyHvJX0C4LuGLH8MzYtGpyW+w
         GSvQ2nwRx+HH8YDTA63wfncKkLPvpI09Iv9lcaZLKZ6E+JmTyw6ZQIZ2ToO/VPVpUlqt
         lQWXdq0Jwihseq89F381K8CW43XlO++U2QlWA3Tapkpi5ehuLLIZLoZ4gOEi4wwzwlnp
         0mEg==
X-Gm-Message-State: ACrzQf2spNhzTYeOc0TfL3I55tzjmzU0x1feziThNJty1ttfXIx7Ya6P
	YfuGC8CNRLi5G8t9ALWNOBR/jSatsKr4tAg8
X-Google-Smtp-Source: 
 AMsMyM6XvdpwYDouxRMnhTR4AI18TTTf1qlpAvoQxB86Nas3+4kqaGe5wj+qXbZWGeR3XC8TVDPFiw==
X-Received: by 2002:a63:688:0:b0:435:41f0:258d with SMTP id
 130-20020a630688000000b0043541f0258dmr17027202pgg.135.1664133532032;
        Sun, 25 Sep 2022 12:18:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/33] Revert "gcc-cross-canadian: Add symlink to
 real-ld alongside other symlinks"
Date: Sun, 25 Sep 2022 09:17:38 -1000
Message-Id: 
 <3d13ef9e457ad3854c5e9bc37f8ea9a6b0e6c54f.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171041

From: Samuli Piippo <samuli.piippo@gmail.com>

This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.

real-ld is always used if that is found, which means you cannot
switch between bfd and gold linkers using -fuse-ld gcc option.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 53ae417c63a4a7ff4a729d3653a31cf1c0758f10)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index a87b446c4f..38c972aa7c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -134,8 +134,6 @@ do_install () {
 
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
 	done
-	t=real-ld
-	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
 
 	# libquadmath headers need to  be available in the gcc libexec dir
 	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
-- 
2.25.1


