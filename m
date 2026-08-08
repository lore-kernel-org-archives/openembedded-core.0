Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB24CC5AD44
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 21:10:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13714.1786223400393401631
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 14:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L6oNUbZF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso2595295e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786223399; x=1786828199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=83eHlbbOJDaxgZsh86wwnhPkeMOkLFZQohVuMuuFvyo=;
        b=L6oNUbZFTE1LaniHU/PICUIpX2a25Ma5EV1emkYoldiImVMa9bwKUGGj/dGNF0Mous
         ClqR419Rwum6oXNrQZrZy/VLOkrNYEx0cakllfQu9n1zUx2vAO269x7z8/ShfQsN7PBP
         Dkrsz4AKaO7rhsS9qFEky7wi7OWkuiYSXB4aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786223399; x=1786828199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=83eHlbbOJDaxgZsh86wwnhPkeMOkLFZQohVuMuuFvyo=;
        b=bIuWo0wJABU7/nTXY3lKddeIfgUsfQRumYmp9Q1TgEVbR43xiw+KoVy8gNFRtzV1Gw
         aynEgBhRrTY9m8dakEgss38rjYMp/1uDL8s5BgWa9HhYynLC5HBAbfpiGuhx58tf1kUE
         afxixbWDAyntvOK1lD3heiQvVN7vFe3y358UBBUORDvCdIOoDvn6EPGV1X/19jWJAnLc
         YhNNRV5gOSjivljuZOc964K3b7ykc9VlqMHLXa/hmIlZnONORpTWlQNJbnWwIi7O/E9p
         4UPXdUBKu9DXEg10KNeo67fqmeV9VTluR89DGLWsQrSqUiOv6/0J8MHCNKqyjcX/Z+Dc
         26CA==
X-Gm-Message-State: AOJu0Yyeu0TfSF7pGRT5isuqayyMGjrabwRjxQ8bABZmSuV0eu0lOaRZ
	AW5Dz9afzIMN7meDRiC+RLRwxKN+YltRSCCxYqVx3TX6ns3FyUUJgHKpN1pd5CD7/KJExzghFnP
	iOBuOCh8=
X-Gm-Gg: AR+sD10A9+yaPuCIiVbUjKuKwGdt5Z99gKvMTIe7DVAMHPL5b5QZOogFkUZkErHQM4d
	hyLjrTqwIuyvLonMHVrx5YeXOKtRe//hXTAB9Sz7rsIG/I8KT4b+Lol8kvYMOn9qBhYg7G0Yf8L
	yFWJBjm9+wIwThhcRCEnuIH7TW07105RWeTqC8YLU5BdDzTYOEYdbVtn/6G0zA7nxrjo1Cxh1mK
	wUNfO5rNnT5DyNYgolnNxLQzVFBl1+IWUhqe46zjVtW4d1j04Fx8JkaLd6Ydi9yKRZAKxPNvXHu
	QsNjrXTNe+nmbuA7wpbNRvpgr2dJkl17kodQr6KfE6rFgJKDasIqLHewQaehZ6yWOnglFzNP4z7
	V1riuUskV8otK4qSRxn1bhX3dtKgfaKvbDQMsSunCJSHFsLWLpiZ1g6GiqJx2Rojkq/RQUmRKux
	88JwkifSjVsivx7R4I7QRGDmWy+txHPumxqyGky/DupuMXgOzcbjVGJQKbpz+6eA4QaTszBXK74
	mZwQhvoQqEmU58JDg==
X-Received: by 2002:a05:600c:37c9:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-4994e6eacc1mr460255245e9.0.1786223398667;
        Sat, 08 Aug 2026 14:09:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145679sm17050471f8f.3.2026.08.08.14.09.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 14:09:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-pycairo: upgrade 1.29.0 -> 1.29.1
Date: Sat,  8 Aug 2026 22:09:52 +0100
Message-ID: <20260808210954.994064-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808210954.994064-1-richard.purdie@linuxfoundation.org>
References: <20260808210954.994064-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 21:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243052

1.29.1 - 2026-08-07
-------------------

* Update dependencies (libpng, zlib) for the Windows wheels :pr:`442`
* Fix documentation build with Python 3.15 :pr:`441`
* Build wheels for Python 3.15 (except for 32bit Windows) :pr:`444`
* Fix a memory leak in :meth:`ScaledFont.text_to_glyphs` :pr:`446`
* Fix some minor reference leaks :pr:`447`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-pycairo_1.29.0.bb => python3-pycairo_1.29.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.29.0.bb => python3-pycairo_1.29.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
index 2d018e676ad..19e41baac41 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142"
+SRC_URI[sha256sum] = "4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f"
 
 S = "${UNPACKDIR}/pycairo-${PV}"
 

