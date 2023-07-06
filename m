Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3A0EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 17:16:31 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.30512.1688663789338587036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 10:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=YDFLKIBn;
 spf=pass (domain: baylibre.com, ip: 209.85.221.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-47e4521e5baso373260e0c.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688663788; x=1691255788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy+24g5Nv5bCBqUd6y4NAvOwxaxxiRx8GjlLaQd8X2M=;
        b=YDFLKIBn7j3r5NScqzHpag8jEeRUfMQOjn8IFq7se7UJXbCS5NIsFGeXtP+7s1Mo1t
         hGkZpxtDEzSYT30kboRe6uxLRDaHt+mT6UUqkzxMNaaIfwcTXW9eoxv8yu++RsjeT3fw
         59oDx+QDQPVhM/sei9tsKuYkVcWIKR2l3Tm56dRez/RwGY0P06+ccPyqrWDBYoLQSC5v
         bS0uRqY6aLIOzx9YRljrWnWafPS903NXGCvWEW3Sqixy0pzJQr5BxSfT3XL9ID8ScGak
         ZvvNQA0Lt7LSB4KUT3BvzHYYN5OxPWpiVGtmRNf7J00U0TObPKR5cRFeFDO7eCUsf6HW
         ZFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688663788; x=1691255788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy+24g5Nv5bCBqUd6y4NAvOwxaxxiRx8GjlLaQd8X2M=;
        b=bjJ+GecCOp9pnGjauz/R1zyfd3cPdXc9RJHYsjsRjEt9rvysNlrNPRWs6ajJWtdDJj
         /qOZz3CFNXvoPkSuKD+kptF53Eg0cPJ0jKzaKsI/05RrYUoPF+6uGt5NKxnV1D/pPQ0n
         j6iKFBMywfCeBHIrpd25rQl62W4LLQUmu6O/rdHxwo8dwBzuNLBCLd8BY1CTTW6/PKDm
         7UBz1/Q8hoL0NSdcv4eXhduYj7MxtDySmk0Gw/25P5RfAfsC2DiOvQ7axEmB3O17+q0L
         1dAmYyJdwWBc/tQw4IxO4iXnpfCple+4VO1lVg+op8xdgwUfL6N4PsrsDwwJKE04XcS8
         VhqA==
X-Gm-Message-State: ABy/qLbxLuhLJqhklWWFq9afkQa9EycR9tE4y49l8/NHXmXMr+ABG4X2
	MTSe0E6jTxidAF6JAu/JGccOMbolC14Rygm5S64=
X-Google-Smtp-Source: APBJJlExJpYNIRm3Jyny/R+72TtddHGi199Dv2zxuhSLr0fuV+D3X0WY/NRKFzFbi0iuwJL9wk9R6Q==
X-Received: by 2002:a1f:3fca:0:b0:47e:672e:304c with SMTP id m193-20020a1f3fca000000b0047e672e304cmr2049209vka.4.1688663787968;
        Thu, 06 Jul 2023 10:16:27 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id q6-20020a0cf5c6000000b00636bde318bcsm1081537qvm.61.2023.07.06.10.16.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:16:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] p11-kit: upgrade 0.24.1 -> 0.25.0
Date: Thu,  6 Jul 2023 13:16:26 -0400
Message-ID: <20230706171626.3356772-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 17:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183983

Changelog:

- add PKCS#11 3.0 support
- add support for profile objects
- add ability to adjust module and config paths at run-time via system environmental exports
- make terminal output nicer
- p11-kit: add command to print merged configuration
- p11-kit: add commands to list, add and delete profiles of a token
- trust: add command to check format of .p11-kit files
- virtual: fix libffi type signatures for PKCS#11 3.0 functions
- server: fix umask setting when --group is specified
- server: check SHELL only when neither --sh nor --csh is specified
- rpc: use space string in C_InitToken
- rpc: fix two off-by-one errors identified by asan
- modules: make logging message more translatable
- pkcs11.h: support CRYPTOKI_GNU for IBM vendor mechanisms
- pkcs11.h: add IBM specific mechanism and attributes
- pkcs11.h: add ChaCha20/Salsa20 and Poly1305 mechanisms
- pkcs11.h: add AES-GCM mechanism parameters for message-based encryption
- po: update translations from Transifex
- bug and build fixes
- test fixes

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../p11-kit/{p11-kit_0.24.1.bb => p11-kit_0.25.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.24.1.bb => p11-kit_0.25.0.bb} (96%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
similarity index 96%
rename from meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
index 72b446204a..ad207d0c9f 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
-SRCREV = "dd0590d4e583f107e3e9fafe9ed754149da335d0"
+SRCREV = "a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.41.0


