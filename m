Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A71C77B7C
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 18:06:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.122.1682532359907925075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 11:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.com header.s=google header.b=XiixaTKg;
 spf=pass (domain: meraki.net, ip: 209.85.214.181, mailfrom: alex.yao@meraki.net)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a920d4842bso56432635ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682532359; x=1685124359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAFaWKG2Sg8jGUMknDcoV059vGiKoEf8Dsy6U5UePTQ=;
        b=XiixaTKgsFtMEuLngV/MjaJ/WdMWdJ3MSjw/TmXVeBS8977ZegHaRXVkw9tUJmdy8v
         ZJW7JXuu381FVvHkx8VGqyTOp9OdFDZW0UP7nJun9W7aOQ2LF9ZTnNL1AeRqqSlCVlQL
         YVQqOmLHJFWXao0s2HIrbn+yOuktlFoWvI6ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682532359; x=1685124359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAFaWKG2Sg8jGUMknDcoV059vGiKoEf8Dsy6U5UePTQ=;
        b=hBoAmDz+NTod0lviLwHTftFTTUaWofSfdl+/nwdvi07gyqNKkkxhiEB9uH7BqxqX3M
         3Sy7t9EgIpijSI0RjxVJeIL/9zTi/UVlu2PvQKGMvi5jwOgOE8EmXPRw5hyfTKZFlPTu
         zFZkAtu/KEfgM0HAEhvNM5mHKpF2P+NrgYR4lZiFMfdpz0jaQhJg1mqmL9m0IIw3zn5c
         vIOE5Mv2Pb+6TaPO2haBMjCVC492KYQA7bWgAl6cK3Wy0SbRmYJLVS4LdOPENVgR/kXe
         GIMEF/RNSaYsn0AY7tXErxC0g5Iu7tWtbItyyK5EvwHrj0Ii29BEKpCoZFVdcChxnNU4
         kSYQ==
X-Gm-Message-State: AAQBX9cIsbiwxUcL4fHPpuSnTP3btQiuMkujcWbhyMfGXPd98iV1LwUP
	FlDwvHLTq9sg0ZxuHP9rnxiWJgf86vGUPB1BCW4=
X-Google-Smtp-Source: AKy350bkiW+w99kpitvpPa/hsVoye9ZqKW3PGY9mLP+d2acdohdirmiZGBwFqo5fOkKtqH3X1+TZTA==
X-Received: by 2002:a17:903:2341:b0:1a1:b528:9bea with SMTP id c1-20020a170903234100b001a1b5289beamr27353232plh.50.1682532359193;
        Wed, 26 Apr 2023 11:05:59 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a858400b0024bcad691d4sm4458832pjn.14.2023.04.26.11.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:05:58 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Alex Yao <alexyao1@meraki.com>
Subject: [dunfell][PATCH 1/3] lcov: Fix Perl Path
Date: Wed, 26 Apr 2023 11:05:48 -0700
Message-Id: <20230426180550.22949-1-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 18:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180452

From: Alex Yao <alexyao1@meraki.com>

Fixes an issue where lcov is using the system Perl rather than the yocto
provided Perl. This causes packages to not be found during runtime such
as PerlIO::gzip.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 0cc8b31b3f..5e8fb938cf 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -59,7 +59,7 @@ SRC_URI[md5sum] = "0220d01753469f83921f8f41ae5054c1"
 SRC_URI[sha256sum] = "14995699187440e0ae4da57fe3a64adc0a3c5cf14feab971f8db38fb7d8f071a"
 
 do_install() {
-    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir}
+    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


