Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194F7C0219E
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:04 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.1168.1738966019521569556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qa6FoVpz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f49837d36so25899565ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966019; x=1739570819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq5tgPrmSLlMrvvs0SFGnfM9qKsf8PryjOwPh1rRQJU=;
        b=qa6FoVpze51g1iaOYAIpNS5b18PBIxcac5p/0hjWDGHXmp+WZBh3JjXXzCX+73zTaj
         3zqwDDhFvxsBA7yKLDTJXjgmKoNU6gCKtWsziyMz3EAllE34mLHCfEcp+axKodQZhy9A
         SjVOZzRYqIlgAWsrFBc9eJpDdgJx7+2QS3iXA/75j69b7aZRy/BwOQ9K5n/gh5yZDy2+
         Lp1pNQmRjK7NctllUqqJ2r3IPK9mWMavcggvY1H+M9qqEyM6TVn1w29Lh6qJ5lIe1gkB
         hT0kVvUg/3KBAfkcRNUuiEGNXbqpSTTRsXwMhab5D/xnhtp08C6sTEl5/7R3jc5lJvFw
         GFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966019; x=1739570819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq5tgPrmSLlMrvvs0SFGnfM9qKsf8PryjOwPh1rRQJU=;
        b=wiGIV4AoBSXFEmV1lGMk1Hju4AU9yYXwjSmPJvPYfUKABFRwEmXbegzhpJ5UMg1phY
         JoJlOaEsxeM8VAlz5SGSaXcZhXYEjUeSMyCRQJOVGLdNVUvwROcrmmQ/LgyY2XD4iSIG
         uwQlUtOZj1tYi4UkUD9CfQ10dATjTgX3gLxo9OUZBO6o02hcY3ih4Nlirkc83CNrzRoV
         f8YuHi9SARKw+1gC9O9+pFrBFwWepS1KDJMsE1VYh70DHaDxuKEDE0nMP1CCwxwCv6Fr
         AO+B/6wRvo2maCJEz5HLRe710hP7jkWOKa3Iw2vrLp38H9O3xjVIPshGFFL1Zr1sCAUK
         v/ZQ==
X-Gm-Message-State: AOJu0Yy6U26HF3QQ1VAJAEMOxdS+jnky040f/C5g+g8+gE2vHVFcrJpd
	fV/UE42mZWPMb6k0c0bdjFygqMR1L1aoRSZ8n/hiT+bhqv1SlVLT+/KPEURigUEY+G4bRB4MJDk
	r
X-Gm-Gg: ASbGnct3p0uq4B38gO4f/TnxBY20ZFBV6uxaH6HLuETaMw9vvJ24hLyKKB55wmoVgEq
	W/8h01dnwB7a0lbPB3Cn9aJXssz5AF1IPMOYGM4qczzmwv5QTpiH2HvhQf5O4WncSGnGf6YC6po
	3sXLSJ21EhMFadarcfIdOwxo4eid/KUylQyRFFQhAV53Ya/1mwV36LzymCEbqglBpC5uLTx2YM2
	RfZiIBYf9KuRxbsCuRoNNm+Only7ikL+HknNDS6VQzkmCXblJlUMrV4R9Oa38ZZIX/uPH1AfCNX
	Ijo8
X-Google-Smtp-Source: AGHT+IH0Ft+D/PZ0vAbm3l/hbre7yvQSgStQeMVos0+m+Gy39RSUqrj6PYRCxUnoonZ1gVuTaGQZPw==
X-Received: by 2002:a05:6a20:394c:b0:1e1:ca91:b0e3 with SMTP id adf61e73a8af0-1ee03bc591dmr8752452637.36.1738966018749;
        Fri, 07 Feb 2025 14:06:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.06.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:06:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/12] libnsl2: set CVE_PRODUCT
Date: Fri,  7 Feb 2025 14:06:42 -0800
Message-ID: <c8e9cde342e935b309aeab06029fc5a46ef89028.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211000

From: Ross Burton <ross.burton@arm.com>

Our libnsl2 recipe is just libnsl version 2.x, so set the CVE vendor and
product pair appropriately as per:

https://www.cvedetails.com/version/1177013/Libnsl-Project-Libnsl-2.0.0.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0e77d3f9217b96f1c77ba65fc9b8420f413c401)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 8cc1f7cec3..082c888be2 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
+CVE_PRODUCT = "libnsl_project:libnsl"
+
 PV = "2.0.1"
 
 SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
-- 
2.43.0


