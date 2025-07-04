Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0130DC83F0E
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.14819.1751642952214989226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ASxxoyau;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74b27c1481bso680759b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642951; x=1752247751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeiMRS5ZYXWINlnMBTnTt9ZQnHdfQOaX157141oCVZc=;
        b=ASxxoyaufzJyMmCcPJDvZhXFST8uzih1DiOQJlEH3z9zSm4aT6riOBdgRVzsxM7zXh
         WHf+imLYqauPA2duvMW82sg0cfTTQhC4HWjxWg2h3THuvVNV31Fzy4NG0zKYqkoHn1LA
         nMJc/SGjD9WEALfhDxiU9dSRTYl+ssyDYqJK2KAKtbmMd+Tftj/gd1lH7NzmYOAnZ5wl
         7LmHVvZzHUD5RQo4qBfC3blcv6OruCNhXZb6K26C4i7W/FJkj3rtIR+3gga/naLViEB1
         SbBgzMqmsZZSAmjDVBfY0sG3acnjreYs0YWLblk3ZhpGSUODc+gyjs5ZCao0nLgSGCBI
         4juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642951; x=1752247751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeiMRS5ZYXWINlnMBTnTt9ZQnHdfQOaX157141oCVZc=;
        b=e+BduhRg7Cri+Px4uL2j477fXf7OU6oAcNVjB/YKysgs0tfLYTUkBZfgmGDrUrR96I
         0aWctW6TZW4s+CMxvJxnRNBwkLZHBMXyUM1p3d8ZPIWEq4aSsz7s5QQ9o3cfBX7EzJtN
         amkEUsewfA2yyFYoopSvBjlk5kcyuZT120qPxkmpTEDb68fcv2jMgvfvIU5qzy325wDb
         cNwDhZWr/7HakQvy8OVWTsaiMCuMtCPngiEGy99UB6K66IkPELMKCaxZPmKNML7RABYN
         s23nCRF7pEgN+S6QUXNiVOO4jA/vCOL83JBvZSghcdlbvfgahVNrQYMA2W4sjJ20Eo07
         Lb/w==
X-Gm-Message-State: AOJu0Yzc8/XKsHxar1q1MdUae+/SMYDa3FkK1eA36NcaJnh8ad9/CEqh
	ulnXJmTnJkuDQUnt1YB/ZwLa7ZxRnWk1PQEQiEtaRjuyqhQmm6+FnCyWG/J+s4l3HkIbqV7ddW7
	R99Qh
X-Gm-Gg: ASbGncslJY8Z0lcL9JpgJjzZST8F6mU705JyU42cjkhbyj+D5fAH2x3I9GgIo7hzule
	LJS3NXS5iFTuX/G4nqXTsUKk2TZTmIgIyRheDuqEIEhXP9w7o3rCLT4z3Xcjyb7V+PKygVgp9Ky
	A5+7b+8EAIkH+hNYNrSX5PiM8IbbuB/l7lzVuf8lxLK42q/TfBhb8gnD/yuo4PTrhrHVMql4XW5
	flaIoOgA7ZNMD+/vLW/K2gBZZ/bb9ZVG75auVoANNGM+dA6G6HgzAQvQLVk9E+Hf01jnigig+7+
	PTgZb8IiN1uzCVq8l3/WXod3asjibYVSx3WDS8sxX8xa8hTbwq+PMA==
X-Google-Smtp-Source: AGHT+IGt1qVkmDm0ibXDAmcVAUFoBOLXSIETdmPmkjZEHD9VppvWxwld1VSLG0+PyhLfRgh6BBM2FA==
X-Received: by 2002:a05:6a00:2289:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-74ce698eed7mr4685895b3a.15.1751642951438;
        Fri, 04 Jul 2025 08:29:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] xwayland: fix CVE-2025-49177
Date: Fri,  4 Jul 2025 08:28:52 -0700
Message-ID: <89dde7f86e1c2e61ed71ecf92e908dbe402a2668.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219945

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the XFIXES extension. The XFixesSetClientDisconnectMode handler
does not validate the request length, allowing a client to read unintended memory
from previous requests

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49177.patch    | 55 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
new file mode 100644
index 0000000000..56ae1de800
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
@@ -0,0 +1,55 @@
+From ab02fb96b1c701c3bb47617d965522c34befa6af Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:05:36 +0200
+Subject: [PATCH] xfixes: Check request length for SetClientDisconnectMode
+
+The handler of XFixesSetClientDisconnectMode does not check the client
+request length.
+
+A client could send a shorter request and read data from a former
+request.
+
+Fix the issue by checking the request size matches.
+
+CVE-2025-49177
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Fixes: e167299f6 - xfixes: Add ClientDisconnectMode
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49177
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ xfixes/disconnect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfixes/disconnect.c b/xfixes/disconnect.c
+index 28aac45..d6da1f9 100644
+--- a/xfixes/disconnect.c
++++ b/xfixes/disconnect.c
+@@ -67,6 +67,7 @@ ProcXFixesSetClientDisconnectMode(ClientPtr client)
+     ClientDisconnectPtr pDisconnect = GetClientDisconnect(client);
+
+     REQUEST(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+
+     pDisconnect->disconnect_mode = stuff->disconnect_mode;
+
+@@ -80,7 +81,7 @@ SProcXFixesSetClientDisconnectMode(ClientPtr client)
+
+     swaps(&stuff->length);
+
+-    REQUEST_AT_LEAST_SIZE(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+
+     swapl(&stuff->disconnect_mode);
+
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 40f010865e..fefc0d4e3a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49175.patch \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
+           file://CVE-2025-49177.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


