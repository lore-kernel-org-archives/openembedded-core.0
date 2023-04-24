Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94639C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 20:07:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.62783.1682366786186147411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 13:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@meraki.com header.s=google header.b=S25j8gSw;
 spf=pass (domain: meraki.net, ip: 209.85.210.170, mailfrom: alex.yao@meraki.net)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63d4595d60fso30767530b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682366785; x=1684958785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=isMFQtBnD9bjPYETKS6tE4uFtHLdajU/pfcys2spAgQ=;
        b=S25j8gSw6GkUI2jO3JCtkDUBEBvOkRJ9JGMw+6+q72Q8SEq0kmEzmXYk6G8sQAGN5J
         8HiXcADEp2WR8+G22thT/Mo1Oo1IwDvO85Ht3dIFCOLX5+1Oeq8NapvVyBH97ItcD4hQ
         1GZOAlhdK4y8lUGtE/SS6He0q+jcySbncS87k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682366785; x=1684958785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isMFQtBnD9bjPYETKS6tE4uFtHLdajU/pfcys2spAgQ=;
        b=XlEHIHmJr5VEaqFy7E3esBuVCKUG6HeJGvUF44Jdk/QeSMsXnIenf6wzd1gqjXt71K
         PO0/prrjfepkwIjGFrIMBAqnkF9yv8uXJOTw73nR10NuEdZhePi3TudJMn50i4j8W8Aj
         DIzWl8fOfKTAyG/kw55ylXOrRF7sQGSkAzDeBpphARWGIHW/w7JkOAjOYB9UXtcIxPaL
         9BzvG96EGI/hkR+pMFf4eP1KUkgGPeBBGwYnslv+4tng/qAReJlETV2k+NsKW1pCrirU
         0t8Ckfc3tltjUkkqbbOPPXxW9mXMjNDxOg/s+25913UgKvsjXDxai/M58P0rc388kh5v
         ICMw==
X-Gm-Message-State: AAQBX9fZ+EbSgWIcqbPhFhYMlHGV8kRVqpkvUCc7Y/IWKwLaX8hLPO3H
	zHpZMr/tRf2M6LGjGvMm8k4kfUFXPBbFjDY379LgaA==
X-Google-Smtp-Source: AKy350aCgWU72OfhyyVQTh56OU7fvn8w3+4+BUJlN/ghW3rNCk9OcTp7i3HPZN3gKgMxDYi6yQqVNw==
X-Received: by 2002:a05:6a00:bc1:b0:635:d9e1:8e1e with SMTP id x1-20020a056a000bc100b00635d9e18e1emr17865051pfu.11.1682366785359;
        Mon, 24 Apr 2023 13:06:25 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id u25-20020a62d459000000b0063b70f0b657sm7716964pfl.24.2023.04.24.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 13:06:25 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Yao <alexyao1@meraki.com>
Subject: [meta-oe][PATCH 1/2] lcov: Fix Perl Path
Date: Mon, 24 Apr 2023 13:06:19 -0700
Message-Id: <20230424200619.34452-1-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 20:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180365

From: Alex Yao <alexyao1@meraki.com>

Fixes an issue where lcov is using the system Perl rather than the yocto
provided Perl. This causes packages to not be found during runtime such
as PerlIO::gzip.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 47062cca5..f18c7b18e 100755
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
2.40.0


