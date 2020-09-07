Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.6537.1599512020492994739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WeiL8QJP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id e11so13017050wme.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+APAHdES93mr8L6Gcn2s8+XXh9u0YyfMIaiD65Hs7SI=;
        b=WeiL8QJP9amOPnUhdWQmPMUCazAeJrUyFyFXdMAF2FSelMSLFb5A8cS/LyEBhobFaY
         Y2C7zxUwswF/aueMr28nVOT1ut6MJKiByB1WKH0UeFQBk8AranM15FySabh8r6Ua3X3L
         gWNpM6ayy84ChNA1EaKZBRYXlRK/6O6W02CVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+APAHdES93mr8L6Gcn2s8+XXh9u0YyfMIaiD65Hs7SI=;
        b=eamgwh1u0rLpzqAU6DO3qE3kVSNOOzhgoZbGAcbbezT5+zxePBBuxL9KQciL2bwP5n
         +YIUWQ8pkpJppRNcQeuN11AOe+DU4e2VpGGQJbvBw1Tsnh8lmaHWrunO21ee06hMvNbl
         J9CVUoxHfc0WSlFTeKUhoFnhamR9Dlq8JZqMpeIfotx5JxnVG2F4GdK2h/g8iTH8ATpK
         l2M38XMwqMr/vXcQd6UPZ1J1vSLlngnIczn1Yh3toiW2kWgujPV05tjlUJQhNWU/eMU8
         auLMc2IPN8idPLzocr+M702RV3ItyaOPFaNzlwz+MusjcQViY33GBzaVk8JTdvQoHyrH
         vocQ==
X-Gm-Message-State: AOAM532nYAUpxNrboF+KANGQkJWETPsQi3aUA/CxQUSa2HO4Tj4rarQR
	mVulAyPdjmtiYfqAmm0dlLuYlHUiToxuWw==
X-Google-Smtp-Source: ABdhPJwKNbPYahc64Cf0o81uGHnM5BS1nxG9OOTbGOpLPYVXExY/0tWTbHEle48g1Zygvb/+TyFc1Q==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr1018966wmk.69.1599512018702;
        Mon, 07 Sep 2020 13:53:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 17/19] attr: Disable parallel make install
Date: Mon,  7 Sep 2020 21:53:19 +0100
Message-Id: <20200907205321.1941682-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_install fails on newer versions of make with interesting and hard to
debug errors. Disablle parallle make install as a workaround. Later verisons
of attr in newer releases don't have the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/attr/attr_2.4.47.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index fc88bef830b..c3da66a0c72 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -12,4 +12,7 @@ SRC_URI += "file://attr-Missing-configure.ac.patch \
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
 SRC_URI[sha256sum] = "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
 
+# Has issues with newer versions of make
+PARALLEL_MAKEINST = ""
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

