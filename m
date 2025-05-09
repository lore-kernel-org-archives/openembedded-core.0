Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A3FC3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.2675.1746807445315944077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p0lz6DgM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2546290b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807444; x=1747412244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGu27gG0l4xz4akIsue4WxgAyvhX0ZUJ62UrIZu72ls=;
        b=p0lz6DgMgk5stbalGddwAo3yngNsSCmUMsyc5ETCfL/wuZirhoD8vn9DLpS7ereH6t
         V9v8hWjB2Bo2zEjvu0mbOlB8ugduLrrfbNzYCfYqCgka72wuwk7JAnng1MZulFEHqaOO
         9pbuj9Fp8cqrdo93WexNwQHf5cjMPEmqW7sJkjuKfj8LZyRKhoQh6DnJJ6LICulpi7C3
         6HRooCbWB9DjcVetIQKUjdlOH6a80STys5I0bAmhJTDWNd6rfYy432jsBOH9uryVdgoL
         S6rHHcT5dmg+rc9fgVrJehK9N5X11GiSfdSFyqwJFeWkNnJW9vDNwi672ES5e+QHCSdV
         lM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807444; x=1747412244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGu27gG0l4xz4akIsue4WxgAyvhX0ZUJ62UrIZu72ls=;
        b=DBYHJKuELB2LrPdbNe01yknTs4Fb8JuE0iT6WVSUhGSqFuAi2C8RxHz9gQqB/5xtTK
         HJQKXGfPwNfYB/1t8xaQ3EkMKIMqOIlb1s7+zunsJ8T5EAkvGSjQJEqjDx9qP884SmiP
         BNNY5rRbqAWFUqdi5ZoXcdtPAnXxIczSe0o0fNqTO2AoUR1Y5shCmOOeSYoT4Kzjs4wk
         aTBPGXOLt2FXLaF3BUXFWojJ2jYmMW1hsHgxkVGVz2JTpQ6eFB3wWaE+pqwUAd8ag+gD
         qP4NBYFD0VPhewxcP9J5fdrLdXtI/9Xyp4OttUGc2hYSxzr6XxUJG7hgTtSTBkgIQ018
         s+fg==
X-Gm-Message-State: AOJu0YzKxkFk3Em3wPwt71smOqqrAKsh879ys0b7ZBHlBGNjMIepXQlV
	rIEPSx5AL3vh5FBLhMS97oSvZbhQZoT6L8j49q785dNrd1SzY1+9kn+JbFSVfPDR8YSrXQDdX8r
	a
X-Gm-Gg: ASbGncsXhHF51FvpKZOgCKSV8qNFoz1dJ/CPckEvIsXmuoiHyi1Xgjf1/pAA/uG+FGi
	gNFVDHRu2IhJtzOsjRTu5ptpClge0fftVWNoTZ3xsvbnhbmntEHe1Z7FBlsAKZVov28qC5fjUpe
	rAPD9pmS5xp4dA/rPaXF1SgRTQzZzz4k4vTphGKZsnrCOldEOkHkblKHNxK9ztcGSR0OxPON9/N
	qUTPsgxJDG65Cw34P0pzlH45gITepc9XF5QjxxMs3jNLuZMfgpqNv2im8qENaiBVA4vExp+3VpB
	QjzCYD/TmHchr2+IW7D96eAsZhjC6m8U
X-Google-Smtp-Source: AGHT+IGfPZwVKiPYUyDSbClYyWJcD7OaVBJRuGIpIQKpZMIaBIrm0XBH7qhiPNSQZurqEWKGG4K+CQ==
X-Received: by 2002:a05:6a00:a10:b0:740:b372:be5 with SMTP id d2e1a72fcca58-7423bd653a4mr4982945b3a.9.1746807444412;
        Fri, 09 May 2025 09:17:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] ghostscript: ignore CVE-2024-29507
Date: Fri,  9 May 2025 09:16:40 -0700
Message-ID: <5c9f3c244971aadee65a98d83668e3d5d63825a0.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746806788.git.steve@sakoman.com>
References: <cover.1746806788.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216238

From: Peter Marko <peter.marko@siemens.com>

Fix for this CVE is [3] (per [1] and [2]).
It fixes cidfsubstfont handling which is not present in 9.55.0 yet.
It was introduced (as cidsubstpath) in 9.56.0 via [4] and later modified
to cidfsubstfont in [5].
Since this recipe has version 9.55.0, mark it as not affected yet.

[1] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=7745dbe24514710b0cfba925e608e607dee9eb0f
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-29507
[3] https://security-tracker.debian.org/tracker/CVE-2024-29507
[4] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=82efed6cae8b0f2a3d10593b21083be1e7b1ab23
[5] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=4422012f6b40f0627d3527dba92f3a1ba30017d3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index fd0506f438..e872fbe88c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -25,7 +25,7 @@ CVE_CHECK_IGNORE += "CVE-2013-6629"
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
 CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 # Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet
-CVE_CHECK_IGNORE += "CVE-2025-27833"
+CVE_CHECK_IGNORE += "CVE-2024-29507 CVE-2025-27833"
 # Only impacts codepaths relevant for Windows builds
 CVE_CHECK_IGNORE += "CVE-2025-27837"
 
-- 
2.43.0


