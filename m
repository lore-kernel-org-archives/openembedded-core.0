Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87587C77B71
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 23:43:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.2743.1681515782329676092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 16:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sT1J/ZWa;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id e4-20020a17090a4a0400b0024753a55ac9so1431648pjh.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681515781; x=1684107781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McpysjVywM3lujmLsAJNU4aeY5AqqXppp4ODQ3G6hb0=;
        b=sT1J/ZWa4kJm9dPFm85YpYuhA5lyaYZcxKjD3bXbVo02Wv5cbtR++uh6X0KbEdq10v
         otk7eSgPhWYAUv+osYEwcViTtnwLExHngPvBeXjEzleYQj84djydwN6SFpR5HwrxgLKS
         eBikUErCzQZlPapfMVCb+DAHLsVm3CGUYIwdNye6h77W2Cau68V8WmKpCqszXjcJ+oqx
         4ylkyG9PB2i8/AYNWWWpjDygspPtmGQUje5FaaLt972S6UnlrSvFe82GpOP3i2IXSCYJ
         ZDJNK/m2whBxEKJJsmhvMHpOUhYpcUWuagaoFgL4wPB2NYL6n8SNCYcOqLgWpw10wZcv
         C3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681515781; x=1684107781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McpysjVywM3lujmLsAJNU4aeY5AqqXppp4ODQ3G6hb0=;
        b=Yc+QSSPy9ITGkgKF3K3jeBa/KbLpL3OwswtDmHCWu5ZekMgLdqD+V86qDUFteoeZlE
         kbz81YyFjOSru1HUtc8ymTxwqKpNYnIsyXaxp0/I2lEx0KJFOmzZpC8PX1/gU5LzUNbb
         isxPgMpWTw6Z7TsIvV6n3sN7V5ooC6vPxgbTWeo2WvGwHXWzSoUXcq9HPVxiXnQBJ/Z0
         FiWOwmT9ZTwPOTRnhbli2RVCracmVX2MSaE8uEAWsM9Gl2ZxcLU0OLlwFFa2THawGu+y
         aCC4J7aL0HceNGOWYle3G4CQXzu2TEJ4SOFpLvI9cK4GfpVuUYc7Z1zTzbXvMPk3cW6O
         gugw==
X-Gm-Message-State: AAQBX9c7N/hUljxmnsXdFNb5Ofu0GzYHBJBrxull1fEfHinExbuGSwo/
	o2tXDLTLi4temmXxXknrEHEk1iggIiY=
X-Google-Smtp-Source: AKy350aRo5EnJBH9jDmSY5tysm2dAx8+f3rTDPT0942fbS/1eYLOzHgyLn2w3Cgh7VhtTqO/LIJcUA==
X-Received: by 2002:a05:6a20:4a30:b0:d4:fcb2:7966 with SMTP id fr48-20020a056a204a3000b000d4fcb27966mr6151218pzb.11.1681515781335;
        Fri, 14 Apr 2023 16:43:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id x24-20020a62fb18000000b0062de9ef6915sm3476564pfm.216.2023.04.14.16.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 16:43:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] gawk: Disable known ptest fails on musl
Date: Fri, 14 Apr 2023 16:42:56 -0700
Message-Id: <20230414234258.157267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 23:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180006

Add needed locale rdeps on musl as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete failing tests on musl
v3: No change

 meta/recipes-extended/gawk/gawk_5.2.1.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index e381bad148..bbb26231a1 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -62,8 +62,21 @@ do_install_ptest() {
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
 }
 
-RDEPENDS:${PN}-ptest += "make"
+do_install_ptest:append:libc-musl() {
+	# Reported  https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.html
+	rm -f ${D}${PTEST_PATH}/test/clos1way6.*
+	# Needs en_US.UTF-8 but then does not work with musl
+	rm -f ${D}${PTEST_PATH}/test/backsmalls1.*
+	# Needs en_US.UTF-8 but then does not work with musl
+	rm -f ${D}${PTEST_PATH}/test/commas.*
+	# The below two need LANG=C inside the make rule for musl
+	rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
+	rm -f ${D}${PTEST_PATH}/test/regx8bit.*
+}
+
+RDEPENDS:${PN}-ptest += "make locale-base-en-us"
 
-RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


