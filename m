Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9C2C02181
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 03:00:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2990.1737601222240235415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 19:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r+2lgyWI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso665528a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 19:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737601221; x=1738206021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3nmiGO9aH9qD9B8e4Xts+vQ5mOP/DZdsmyMdMOzzx8=;
        b=r+2lgyWIigbkmcfkvNpc3ZTlNDQ3Gqep6c8ZIw6FZjjodhNNCjJSkWWlWkZlS15ota
         C1RdQmpXWiB4Z7FKGjUWl9uxbIp5RRE4eb5lzreYu0DVnECV8WFs/uXVZzdzVDpmr0Nr
         mhfF5XYt03NZGC8f0xr3Kjwiw+btVuCc/M9FnYqvdw0njz3whCnLBnmep6ne4GgBrcDQ
         yr9PpXIeIe5oglzf2Dkdx+I6oCkX5VwD3zQ4RRuod1+hiPl6AKHSWh8ubMwCFuHJJJ3y
         hH87oF/VLx/UdkkzAqt6yGwT2TVJqBDoP+cTJ3MgK/mAz9WvUM2JWsTBIL4VCMoq1oHS
         RXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737601221; x=1738206021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3nmiGO9aH9qD9B8e4Xts+vQ5mOP/DZdsmyMdMOzzx8=;
        b=R/+H9UCZlexZu+VIBz2i3m07HSbhoNLgLj9nOJT17MszN1C9y6vc1wFDVXJpuNtQsr
         1Cab0kpyQ9g12cF9v1mZ2784a8uK/Z2DWIhsb4rURoHlgsKSzqiXJmLGtFLk3LikSPGK
         GMljbll/1qNoGGWHKNHx3r+Q75OK1ShrHdU0DmOB54TZ54IRtSu2g6alBJL12CcSctL/
         khqDwydgr9bjE6rKqHH0XEgqmIXzfb96bC8j7NKUpnY0pBBmJs5McQjRl6G3JuAOsUGn
         2fVDIPmGOthln4uSphA5DgyBZ8CuZ7RxU0E/4ArGdniJX0O0xoymOTTSWTMgDRN3ppxL
         UWAg==
X-Gm-Message-State: AOJu0YyODx8iTRJd063nxvFN7nhkVP4Ku+JQJN3nJt9E6PX4MlyA9aL/
	1UUK/+Vx1ce4ce47fblEyjvbX50gLPQxmsMrKC4taaf3YC/9a/0/5xFLfayJyzwbVKrY9wO7h4J
	6PzI=
X-Gm-Gg: ASbGnct/a8h4nzEMlgWBTOHDS3lXjjjXBsUDWGwQxif0/EUjCgHBoN5bX658Fq2/bkN
	uMVJJFiZyDCwsSqim5iOPsuAPfFEvAdENb10S8OGUGj8XhK8pokrLoXXUKKqNSj+7HUeMQXfEWH
	yktYCv4PR20rg0GcH8VbTzbNX5Huje++56MNAXnGqw86MZ+9gAxXa5FUS7PJ1QbbFlXj+11ebUR
	eD/ADb/1XJE8L3KRojuoMUAxFw1j5npA+L9IcZm7s2G/U15ZfgcAXfGLaD06JhF7dtwOA==
X-Google-Smtp-Source: AGHT+IHUUsN7ZbTGLWmFS+Z/6CkWkrNcI3x+LI3v/RFD8sgsq0CmEu/Lc32zDtX+1IRCWd1j1oXIoA==
X-Received: by 2002:aa7:8887:0:b0:725:d956:aa6f with SMTP id d2e1a72fcca58-72daf931de0mr27355687b3a.5.1737601221526;
        Wed, 22 Jan 2025 19:00:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm12048389b3a.69.2025.01.22.19.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:00:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] boost: fix do_fetch error
Date: Wed, 22 Jan 2025 18:59:58 -0800
Message-ID: <7ecd0d5584b7692b58ac8039b4107c4e0836d553.1737601063.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737601063.git.steve@sakoman.com>
References: <cover.1737601063.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210173

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.84.0-r0 do_fetch: Checksum failure encountered with download of https://boostorg.jfrog.io/artifactory/main/release/1.84.0/source/boost_1_84_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/boost/boost-1.84.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.84.0.inc b/meta/recipes-support/boost/boost-1.84.0.inc
index 5bbea2ba5b..be1ad20f47 100644
--- a/meta/recipes-support/boost/boost-1.84.0.inc
+++ b/meta/recipes-support/boost/boost-1.84.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14c3e7949c24109454"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.43.0


