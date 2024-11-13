Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED55D597D6
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:38 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.3422.1731467793964230511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QgPFXfVR;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e600add5dcso3108906b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467793; x=1732072593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JWKEoYr2gO+ZL7KItOe0rp1Oe+l//9QIKMwsDLTjSA=;
        b=QgPFXfVREKvpoYCLFgQGnHHXWB0VeeoxWonAvaJr3Bff6mhFM6KS3gG8PEWm10ev9R
         985BtVwiMLLoGsJDkeQXMe4A83CuLs2cq+O3Y+gi9D4E+SJh0tCFhTlgBeiola+2aNo1
         /+rmLM+cPEQnG22tmcjy1xVzx1e3ZUPQelG1FaiDQGeLq3wsp1yvXovajKg0Ric9mPF0
         IPU+dDjNVLMajJzJDiIay+jiLliWIfIP/zdkCi+XqS4pDvs1S0Aa107Bj89BYYsl0FsS
         VYv3XnzwGidbuZXMz398yI98YA7HhTCwh06f/ZEpM1NSwpqUU/nBPJ2R13sqSj0vw7wx
         r0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467793; x=1732072593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JWKEoYr2gO+ZL7KItOe0rp1Oe+l//9QIKMwsDLTjSA=;
        b=Cba2vJbOxax/5aMr1nq9dRT33QggiwDUJ58wBIC/jZ6kxPtMw+YxBhny2UjSv+n67M
         EJvI0oEuGzQOqc21dS1fzrC2F4gjJUkkmJqZ5kC/CNSyIyYmw2FYPVrX6KiJNXXwYhJC
         G0Ek+SPijUVZ7cMvfx/7TL5f+0yQ4YBysH1T+ddSsXmYzi9GANNKF4/iDaxiqg47plMZ
         6ijtekrL6lkGRRh6uauhJZEUWoO+7iGdDeE4I6clVfOyID2tyvNB9Lgab7kIOWXAMPTb
         0Z2RMhnkgl68WSrk8X/AzCsBL6Z/ke9/YjPc8p+hD8VXpIEj8yjlpW75i9edNXB7CEGt
         L6Og==
X-Gm-Message-State: AOJu0Yzn3oq06s06EmzvCyDUBmY0UTYZpa2+fUouyLMrShIU+BaB84aR
	aMIWb5z8Mxec0Ov8rTnX+MRnNM94jneVsXQ/JBgi8DZhUypy/5uFBzq09R+xOif7t8Y9XHuXAn+
	g
X-Google-Smtp-Source: AGHT+IEFoRsFkLtOVBxGE+t2VCsKJ24aS3Iux0Ls/Q/UVhJqlzbQEkGqZL0sOo8foB3pV2TAcgeWVw==
X-Received: by 2002:a05:6808:1a1b:b0:3e6:3878:35c8 with SMTP id 5614622812f47-3e7946a3a1fmr19324975b6e.15.1731467792986;
        Tue, 12 Nov 2024 19:16:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] pseudo: Disable LFS on 32bit arches
Date: Tue, 12 Nov 2024 19:16:02 -0800
Message-Id: <215367b62ac1f48ba224e56e7b8862c0a7bdbcd0.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207082

From: Khem Raj <raj.khem@gmail.com>

pseudo overrides certain libc functions which are aliases when LFS64 is
enabled. In anycase pseudo may not be of much use on 32bit systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 6b0cb598e2..00af809689 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -18,5 +18,12 @@ SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
+# largefile and 64bit time_t support adds these macros via compiler flags globally
+# remove them for pseudo since pseudo intercepts some of the functions which will be
+# aliased due to this e.g. open/open64 and it will complain about duplicate definitions
+# pseudo on 32bit systems is not much of use anyway and these features are not of much
+# use for it.
+TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.34.1


