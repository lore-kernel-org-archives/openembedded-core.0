Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39551C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:09:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.11257.1662275346427254654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gz1RROX3;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id mj6so5719010pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=KEz6F5hWZRget+8QRGscbxeaEa7HBfU9njZZrdEuVHk=;
        b=gz1RROX3cFth+3+36zFmBqNDnQtdwoon5Qnvva6q3W7SxWYCnIV6cz/XY2oEc8bSTV
         wUrDuCOJqAlVnO6EUkQJXk1HC58yTXpBvFK8O49HQN6CW7FmIbk4gv4Q2F8gJURwGY0O
         e6zOivAS+0Bubt+WB4c4N6jfmiy42xwiOovEKAyNF+gjMxk3EcnQfge0vEMds2mXg+q+
         R6RA/7QCaF90KakvtILqXDKJ0aUgRNYp7vRtkcKVA7VLlNacqoT31AH9uKwjyoHweRpv
         ZkUcdTZTkUWQy+s5L186/3GoRoN4ljZQyxFu7JnP4QkdbE4Uly/Vt2ZDjedXB2k7x1ua
         tmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=KEz6F5hWZRget+8QRGscbxeaEa7HBfU9njZZrdEuVHk=;
        b=f5zcVU2ZpPI65WavA3huDtE9TfokdPew5PpDz4oQ+QIS0IFtC96NzPk8ccUwePskEt
         MCkfjgLKCkBVZbiFwjRj3xj82ROCzUtkSi4fVfL3E3mE8q8sNYQPNid6D2a56iB3xOUG
         sGsO4iDm7K5WHrf07HrJc73dnu83Yt4o3g3ACS1KfuniIkhlVy6nhku5NU7G9kGho6IO
         u4F7pAq5OLH13vtNWheEI2pqX/DY3vELafPMCA8dL3Tvf9QTwkR+Blix7qTyUbWAG/Wj
         0coJaupjqOOw9k0pd1VGeu1jp6qN6XBftJRWPwXat5Ca/jL1/sTMPJsKicu6x/xOJ5gm
         JBlQ==
X-Gm-Message-State: ACgBeo3dTRK6twul8S0mAV/wg8uc+oKEroo7czfytj4gbbRLQHu1jPzT
	HGWOU0SN9HWXMKrUTt5Gslj5+QXI5fU=
X-Google-Smtp-Source: 
 AA6agR6ut/VUTlwnJz4sWOCrKwvFE/wo8U02r8Xcc+ROlZjQPvzOT/Ti8LqOLYYohHOC5MUyBSjwXg==
X-Received: by 2002:a17:90b:3e82:b0:1f7:3792:d33c with SMTP id
 rj2-20020a17090b3e8200b001f73792d33cmr13127605pjb.222.1662275345668;
        Sun, 04 Sep 2022 00:09:05 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 jf5-20020a170903268500b0017693bb573bsm1670910plb.219.2022.09.04.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:09:05 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] rust: Fix cross compilation error for rust-testuite
Date: Sun,  4 Sep 2022 12:38:59 +0530
Message-Id: <20220904070859.2706350-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 07:09:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170279

From: pgowda <pgowda.cve@gmail.com>

Fixes the following error while building the rust-testuite
error: linker cc not found

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 284347dedc..a3d93eca4a 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -116,6 +116,9 @@ python do_configure() {
     # Whether or not to optimize the compiler and standard library
     config.set("rust", "optimize", e(True))
 
+    # Override default linker cc.
+    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
+
     # [build]
     config.add_section("build")
     config.set("build", "submodules", e(False))
-- 
2.25.1


