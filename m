Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63612C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.7514.1739913340572050194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OdzGpFxv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220ecbdb4c2so122838225ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913340; x=1740518140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef6vvRjMWdqPIXNP9V4+maCc2GWlsx2j49kJGJFbL7w=;
        b=OdzGpFxvKqqzhjJXGZfsMS7Dtga9g9VAuWX9ZKQV3/FSR3f5ZnfuioIpmsnWKdHBqB
         74SlQm5k0/wAVNX9uoh9dZCqfHBOK/i8zCMzRelJBY5i4W/epV4TiuoTu9tilPYnkDi+
         munUHh1jMxDgxYXL1oLatQgHqB1h2/6GGMhLw4t0wm6+JA+K62oFB/pOTwQ1skqY/LIG
         3sJ12tlurLLEGxhh72y85MP9mmwpLHqwlBKCe7q/oqHmZ62fTZsyjNUnG2Ea9swMEUdB
         0n9lzdH8UpqRGiEQ0qN3bG/vfo36mdPgns536iHx9gsAM1pyTkCp/kAXb40DFswOBdEq
         dPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913340; x=1740518140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef6vvRjMWdqPIXNP9V4+maCc2GWlsx2j49kJGJFbL7w=;
        b=nuTmyC7bp3BfOeZrg37hqcUvqEy4JH1QdfgGIV5kZgBhg62wzES64PEWX2xjl1ph6c
         EJ5fDxXnNfIUjDDhOHaL91VknUWdra/ovRwx8ElBcnthwTOR8u8gpdTsAMxCyxIeqnZE
         vlsvlZQvUr645MWdKOcxHA1EX3yUaKK24JY/WeWuNN4z5lsKP13WRdVZVytXNdBFv6DI
         DcBmXw948pYu+lpHTXcB9oK/z4LwhhX6QRJkWsfDdFVFXVSHFxgpCf6eVYYETDETzIK6
         yCTB/cYZsi+PanYU1ZwF4EVUnBuH/7ttXZnDWcd6qexlHM2pB6maanf8sVp2nDDWT3ol
         kxuQ==
X-Gm-Message-State: AOJu0YzTDWN1oRrDhOETeKenKRoMikQN5WCQBdBrcjiw/Pmw3KtXxKHE
	6sQPmJenoJp9+9KdnvG3bpje0hrALd1kidyIIINSKzEh4pUaZfAkEQewSOC6gLG4laAle2cpeZr
	G
X-Gm-Gg: ASbGncvrI60NDoaMfTFtTvnfqWSBZ8j4FSyEsVyfSbaoE1K/P7sALk24eHAdPJvDJTj
	q2Q+LizklGrjmYPftB9nGq6EiC3st6pUFPDE94F55HNqaSWLAKCMTkg/8HqEUkBou4zgaup7Rk6
	vdK40RXgMLiRGizV36SOQvpS6agQ1tPHiPWFk4dlB82ph5opjPZFe5Sogn0gwiO6Xbz0fMv3FA2
	DN/Rofg9aPobBPpVUHrTImn1oy+M817VwP5hPHRjoh2RtMeypuo+Q9dLch/85mqcC5OMZ+8K45u
	DQ8+tvM=
X-Google-Smtp-Source: AGHT+IEH7cnMMH288WA8qXrlBhOdU0zA/w/1i8/HIH0wcV0qDYXC67VIBj+Us0OmnlNRbgB2ND3aVg==
X-Received: by 2002:a17:903:2f8c:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22104038460mr226283045ad.20.1739913339812;
        Tue, 18 Feb 2025 13:15:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm93720055ad.22.2025.02.18.13.15.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:15:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/7] vim: Upgrade 9.1.0764 -> 9.1.1043
Date: Tue, 18 Feb 2025 13:15:22 -0800
Message-ID: <dbd40b77df213fa39e70f0e10d88ba75ef784a8d.1739913090.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739913090.git.steve@sakoman.com>
References: <cover.1739913090.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211656

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-22134 and CVE-2025-24014

Changes between 9.1.0764 -> 9.1.1043
====================================
https://github.com/vim/vim/compare/v9.1.0764...v9.1.1043

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 582eddcb9d..4ac9c58c80 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0764"
-SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
+PV .= ".1043"
+SRCREV = "9d1bed5eccdbb46a26b8a484f5e9163c40e63919"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


