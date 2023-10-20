Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C7C07480
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.58029.1697817104387097989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1Rfki50e;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c9b95943beso7861775ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817103; x=1698421903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMOWdGzIcW9qYtVM9JRjFQL0hp1IQfgR0ZbBTEj/1F8=;
        b=1Rfki50e9YwwtvgixktT3A/qjBn6LqqF8kCNiUIZSKkYbaEl8lWqFOM/enOSyQ2CLf
         iffScfL3AvKdbfvmPQD89RB8jqiA05F1qBQRSqq8BVLMMogs2sYEV0EH5djhEDW8N/bh
         lzZVlG+LzlCheY9kv1LZuLV9BVdikuLBM3rkx6d23cYQBgjnKKPgbuQOPAO5DIII2wuO
         +HQl7m9CE/jx2b60L/P7hqD3DnZmcfYKSwltfG3GRvdk7sUUPwlAh5mAUe7qzEGB0cNL
         tidPiNiw7qx2Y98xVvstBUex2dEBGaPZcOGF7zPER0alC+thbQ++0viWg4MBg4/29ByV
         3rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817103; x=1698421903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMOWdGzIcW9qYtVM9JRjFQL0hp1IQfgR0ZbBTEj/1F8=;
        b=S7irqbm5m7ySVH5rAJP1/W4+52b207RMZ+0gsP70ZSK+ON3luaQQXFCL5IteZ4d423
         RQwYpIFtYSyTA4KA6ohw8w1iMyPOurrMaZgc0YWqgyQ+LGEbJMlJejRgURJtxTOBMV1h
         IzsAcZsOAE6E119n92bp5j6kiiI0LFzk6wYZE2geduMs3stYslqC5ooIVpM9Oh1kxHa0
         P1iaPlCIFllaKa/hkYLU60qX92A+yIREIdXxYB3+EA4Al0fWaDKQG5/xT3nMPq/0u0jq
         wo670txkLMdBXEP7vUXupIwcuCSPvyWFe01FiWfy/QetD5E82DaJFCYNzS/PdBgouz4f
         TL9w==
X-Gm-Message-State: AOJu0Yx56pQUIl4bb5Zm1AmckiaRdSZHlb0F19oUjofWrlJAxFoG/LS9
	Kz5yG9rRv0VXQI3RRO2WLt4YiwHSBkbrP27xOC0=
X-Google-Smtp-Source: AGHT+IHBuvQHXhswLVjoIbqu7Yd6Tn646Z4P+L6s5ZP56YvVuW+/WiKV3TXEEhaJ8uj7bU8MSMD9OA==
X-Received: by 2002:a17:902:d054:b0:1c9:ff46:163d with SMTP id l20-20020a170902d05400b001c9ff46163dmr2198764pll.38.1697817103516;
        Fri, 20 Oct 2023 08:51:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/24] libx11: upgrade to 1.8.7
Date: Fri, 20 Oct 2023 05:51:08 -1000
Message-Id: <79f9c062df37ca15649d41bb6501e6fab2d73114.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189551

From: Ross Burton <ross.burton@arm.com>

This incorporates fixes for the following CVEs:

- CVE-2023-43785
- CVE-2023-43786
- CVE-2023-43787

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1534bb34b680bfc5cb2f35b5fd5a0c2afed6368)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libx11_1.8.6.bb => libx11_1.8.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.6.bb => libx11_1.8.7.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
index 1cfa56b21e..5f14e62446 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9"
+SRC_URI[sha256sum] = "05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee"
 
 inherit gettext
 
-- 
2.34.1


