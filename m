Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF90CD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105038.1781424209051575091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JzhR48VT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b9318997so16289155e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424207; x=1782029007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44ZPgUPkhuHMekQtD2652JB5mDCh8Ye5/K+JDzcxMSk=;
        b=JzhR48VTRoBS6SCij2wWV4bIyLu3uTvnhVSwQKiddlEi8Ywk+ORpjWQJYb5RFEvB43
         AVYhXFuR8tNg79E5mWKsiLxO2UhIs3I6/DcmmhGfgF4YpyAuKs8P3EDYeShj7cARGpcA
         50yaWRQrlAIDZmT+k1YXfNbDyZlrfmmh+Y3s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424207; x=1782029007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44ZPgUPkhuHMekQtD2652JB5mDCh8Ye5/K+JDzcxMSk=;
        b=AwOFX2sVb5tV2QqSlFeVMs805D614JgAZHcHd/2sa+7tQVigIti4qK1rkUZgqIdmvj
         Mg4ZHjowNKdgdwcG3u2vpmO6B5yaNMBw3Ihtx4xWrM5GU8Hw50Ak6QfsjBdPH5R2xxEf
         UIu2LlNDlh7BWeouu4X6QvzwpxfmHgKM80QmVoas6bf/L2ifZPyf7LbFozqc+jN7qZCh
         1t+JMb4DFwMuEKqzsqJ622gC9ATaLhSHYG2Tc6aaX2RM8uj1f61AtU85ADFFGlmbaPLJ
         42KtXakWUcZ2Mo29HrSVWg8G8rktyAq3MYkFSM1h0jskBsJdf7yuuoRwz6ZBNC+8HKiF
         0auA==
X-Gm-Message-State: AOJu0YzLhv/CTQ7k9EzE9atCQ2u0jZl2GCwMIiItODS4qDR3xCqYENt0
	qvrfX8qZ8pAqBrnoHo7guOBKytcCvm1D7sAaQJ6sWo6N0fzTciTfbo6sTSEkOUWpiirw1YNXirb
	IeDrA
X-Gm-Gg: Acq92OHxbCBFxoNAllTLuS9M5Fou9WMj8mFLTira3cgXntICyWc0ZNDV/+7lqZ7NTyP
	FVlk+3RPVwOtP58UX3xHDOE9IU2D71lMGxtKYxWWmqUUs+VNzTORCUlAjGIBiFZVARqba912PBr
	iPrAr33tfpaeZbN5t0M4ZSNxj9f/njRaR2pfnvb+wu9sC6viyB5myt8W97ysVA1l+o3T3EenvgA
	jpGMW+1lYZMdaLEbKylSpmSCdhq8HYmbgGHgVqP2pprrlKTEE9GTGtvKz4a8Q0VEPn3DGUy65ag
	JXgIi1FAoXcE8/LRQ30WGNZo5XGMC4f1MfDs26hyOTAlkbO1mEd8R3CYzqN2/Znr2WgXP/GA1CK
	Qn87M8jg10ic+75zd1GZYFkzhtDVSX91ro28ZcefE+31WQcRZcNAcbsh+JE4TSiqPwe5L7VVFba
	SwB/HKSwLKziDkV7ZMOkQoO1P/ZNbjMQ0aokUrnL9XMLFkDmt54Njw
X-Received: by 2002:a7b:cbd3:0:b0:492:834:24a2 with SMTP id 5b1f17b1804b1-49220095624mr43134595e9.16.1781424207370;
        Sun, 14 Jun 2026 01:03:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/56] ccache: upgrade 4.13.5 -> 4.13.6
Date: Sun, 14 Jun 2026 09:02:22 +0100
Message-ID: <20260614080307.4017177-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238695

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ccache/{ccache_4.13.5.bb => ccache_4.13.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.5.bb => ccache_4.13.6.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.5.bb b/meta/recipes-devtools/ccache/ccache_4.13.6.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.5.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.6.bb
index d0e154f51f7..789440f7612 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.5.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.6.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2fb4896269a1ef15da99ba940ac1478b38f2c4b720797205860bf40364f37d37"
+SRC_URI[sha256sum] = "d42ace95dec14583fb8af19ed117919995bd910376f52d9b6f546046b792dfb7"
 
 inherit cmake github-releases
 

