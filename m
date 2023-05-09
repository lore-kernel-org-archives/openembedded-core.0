Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7929BC7EE2E
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.3063.1683671580387701849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=08tPjq68;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6436e004954so6692160b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671579; x=1686263579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6oBSvu7Y6dr8ZZiAmepkdKB1jGJkgDtClc7uyLRjsc=;
        b=08tPjq68+7j5HEaQLp2QZ0yt2A/haSsyPMJdebLhANWbMFk+D4w/Cjkc+aLeNIj5a7
         5tvpF/EIV2Zp814WvmyN8yimtjPp+p+APWO9NAeelgfFL2QSUZuT2y4gG9Lha/Ys53YH
         kcc6FL3rhXBMAVd+8sVW7lPTy4VggfxDIg9PqyNU63q46FxiNhm0efr2krXBod9RaGo+
         CDd6NzinlZfc4ot9PJPjxVScPL/nFun9jPIjvQd6q0CPdJLzv4Hc9gNhGUqHss9Bc9kM
         HcI/tQCQDoFmoWtLotTJly+ZRxqyU7nTEx/pk5d1mqlq8u0e1viAd9XHnRWCX/9pxaKA
         onMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671579; x=1686263579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6oBSvu7Y6dr8ZZiAmepkdKB1jGJkgDtClc7uyLRjsc=;
        b=HZLE6ts3hVv+k4bCCsoi2Yn2X3dw6sGbnaY3c+XzlMITOHDElUI1TSLpGbOCxQL8eF
         jUJW1Nng4oSiKgSrC/IrGBcYzAwUGOLdnCo3Jv17j4dHvivG8DOA7Wa515+y3X0ij1rA
         qjbITo4aSaXRE7npk3vkd+hpN8pNgcqu3TzaUoPnJDZ9+YZ3TIbApW4nTGS6xIWc/yzx
         +Vee0xVHuvk7khKTidLl1Zj8GAeehT5hZ89rMjA15/rvCUbYFUHjBnsoxSTdKbt2iMqI
         QA5+Ano05Fgb8y3YSSWx8fHRSzWS/nJ31N20rkHyfoDXS6E+LFojWfUr8Jdx39bbyfjq
         uSSw==
X-Gm-Message-State: AC+VfDxibbnpHO9ZcTbYr84C26rv20IGGP8Yjo95AOwVuy5lKfFYbsA7
	DAHT3xhnyPFmsw7JWpiZj7Tr4D+PQ1lk07WzBkI=
X-Google-Smtp-Source: ACHHUZ6K6Dihs4H4935ZEgOsgHQUmgnB30P1HWtWilFWQqxEucvPFwA9DSaSyp3KxTDLLsk+hOq++Q==
X-Received: by 2002:a05:6a00:238d:b0:643:afd0:aaef with SMTP id f13-20020a056a00238d00b00643afd0aaefmr17733527pfc.18.1683671579518;
        Tue, 09 May 2023 15:32:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] xserver-xorg: upgrade 21.1.7 -> 21.1.8
Date: Tue,  9 May 2023 12:32:33 -1000
Message-Id: <dc32d85983044baa7e535dc5e5fcf043dd922593.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181092

From: Wang Mingyu <wangmy@fujitsu.com>

This release contains the fix for CVE-2023-1393 in today's security
advisory: https://lists.x.org/archives/xorg-announce/2023-March/003374.html

Benno Schulenberg (1):
       xkbUtils: use existing symbol names instead of deleted deprecated ones

Olivier Fourdan (2):
       composite: Fix use-after-free of the COW
       xserver 21.1.8

git tag: xorg-server-21.1.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7b08dff8f46bcaa05f7fbffbe27d524579af4faf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 212c7d39c2..19db7ea434 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
+SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


