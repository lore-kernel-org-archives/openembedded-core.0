Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A46C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 07:28:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1284.1787902085556359507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 00:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=klRs5RNH;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6f624c323so5978705ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787902085; x=1788506885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voHBWDeGLLNUMcCjmxzmPjAd5Fnj4GdZpdRIQz24nsU=;
        b=klRs5RNH/vZ6cK6lAkTVanecZhqa1wU3WDZFFzWsFLkNVxdMoOSTv7GVYA+VWJtICK
         SdSvcO+wsYzEVutJrrvfKlWKEet9OlogP4XvRFA97VD1vpZBaY558wldgYFw1tqhbPHf
         rd8w3ksxafkykbOvwjjfvTyhwtNeZlv9iXEJ0hRP1tWWWzB3EecX2a2Kxb812uQB2N0V
         9BYSoIg67wPl1QiQfjii2jSRAsuO7TaK1MeOMmkj6dpxHvXBq/ocdMmWpMxEMmRbkdgt
         xJ3GLOIkTJ+mcIb5OEgF1oh+pRELRtgaqCn2HO6Uo15k44O9fW6jUBYCFp0sU2auXugz
         7ldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787902085; x=1788506885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=voHBWDeGLLNUMcCjmxzmPjAd5Fnj4GdZpdRIQz24nsU=;
        b=busZHsIm6tWABcnvy4QYIjsAeibQDyn6kVxuzAz01+sBuePD3jPj0/UZhBty6hkYVZ
         74XVD/4nfenFFm7JnS/hSJMzxAOFj/vT36wz5aKVKmmO2D+gQuE8JJ2WKfmk72W/tQJM
         /Sh0WKjoQjapnqX8aPRBbArOOGJiitEvasmdhHGL12/4iEz15i52kHFxcbnzyHNTsoZx
         R0x9wEwAipKmtNb4aYyi72fsc/1izkstrUrzmTW3Zy6zMBITeWAIza4T9NjpTOraX60k
         pjuuHfk4D0NdAphPWFZcOiGzCb0IVhkSBUPxr5mOI9Egkva4rVvdQViXhOvksCv3xGMM
         YEgg==
X-Gm-Message-State: AFuF++kgslZ/9VubLfUOcI7gbLm0b5OasjYwPdUGqZGg0V8vkFwKdNIU
	JsECYNBj0cT3N4RrhHmNv1rngc1sORyiLZyIsgSz5LrdlwaOdOgAr+GPkNSjsw==
X-Gm-Gg: AR+sD10ItIqMWifz8Hy6MNKsxFFgmFwt7DGR13LjVEP6fgROwaqOoUABSH2jSJ6MOMk
	nek6mWeMyEdRUWon3UMtWtcwG4WvnVsKMfYcOCak19KJxTUFEEValOyb6/pHeOPgToZHXg79LC6
	lVgaOdHdMcJN4IVxvmVT9ZQDP6ALvKdrNSj26qQgh/UP+W8LU2qkvGI4yiclCiwFwVBiHiWiltp
	pD0RktXWKPAAg3GmlJAg2Zw2snV2kz7de5ZxJSig2SZWbVSIyOm9N+w5lYMtVquTtmnUjKcZTtD
	p8LaFboZF5Dxx/M5j1/JWEgSbbA2fbQkEbyoxVlWNIRdVnqAdxRHq9p/lFF0qozoZCsPjp1aJ5I
	aj6D3H6eDUzp9INL6CZz7CsRYhFLI/GqvvZC19pbKMAjj14qgNUklLIOop73WM0BCA/SDGCOl4Q
	T/FQcAPSTsK8UwDSJVqPd13aLO8CD7iGUqZIwjMlZtfpoaisgNX/FIfhugDreyJT4BdwL015qn
X-Received: by 2002:a17:90b:440d:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-396d0e5e891mr9192887a91.2.1787902084838;
        Fri, 28 Aug 2026 00:28:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1868086sm6043192a91.9.2026.08.28.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:28:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][PATCH 2/2] dos2unix: upgrade 7.5.6 -> 7.5.7
Date: Fri, 28 Aug 2026 19:27:53 +1200
Message-ID: <20260828072753.3287708-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828072753.3287708-1-ankur.tyagi85@gmail.com>
References: <20260828072753.3287708-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 07:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244520

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* Detect a missing UTF-16 low surrogate at the end of a file.
* Fixed the processing of files containing only half a BOM.
* unix2dos: Fixed conversion of a DOS line break immediately
  after a Mac line break.
* mac2unix/unix2mac: Fixed counting line breaks in verbose
  mode of files with mixed line break types.
* Code cleanup.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dos2unix/{dos2unix_7.5.6.bb => dos2unix_7.5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.6.bb => dos2unix_7.5.7.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.7.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.7.bb
index 8ef1d427e3..d081ed2bc8 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https;tag=${BPN}-${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "9c2ea173af3bc49324f8288d81c5a2bbfc0884d0"
+SRCREV = "5a6f3306165567e9828d694d73705ad86366cc61"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 

