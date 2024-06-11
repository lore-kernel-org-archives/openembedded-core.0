Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B7AC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:02:17 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.10399.1718114527528466240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfNFcXKO;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so26200261fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718114525; x=1718719325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIWqwxjDZG42tN4Uzn3i8rWsQmMMNXRIPKElIH6Nsic=;
        b=CfNFcXKOPKgtgjGhlaK6vpin+SlsTi0tkE9YDuesVXiTgqHGEMX0irXEeDhJn8G8Ry
         BC2E9dLsxINykGG2ij4cvT2mwP/mkPwCTR25Yb+Gwe1vFohDMmIByL2yxh+vvQkAObY4
         VNFesnrpDgfBcnxtGhhftNeBERDcvRoBRL8YWC4IlEshtF56/uUzri62TgNzKa+bTnhi
         XZkR/RO9Tlv17S3p/dx7+78RVJ77zgeciLZdUKlMtBAdX1PD3sSeaHpQRNuKEIkQIkLf
         fEur16eMCmeIHIq8Y5uvLU/W9/nMgUtkApn11RTrHumYGdKWGso4eQm1TrFRJOvrCh+9
         BJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718114525; x=1718719325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIWqwxjDZG42tN4Uzn3i8rWsQmMMNXRIPKElIH6Nsic=;
        b=hPKiRUkRKL/Vv1rRvbZtdwpwSym2XSXccl/Y2alWekTle7IPVsAk6mDcGYbcUaNupm
         NAV5fr3kBVYVVR/KNMo9YMs9bAx8ed5zfCasNcKeaB5JZJPjBeoXFoHYbdg++Hhj5I5U
         /YOY0fLvFgfTJzX4NWgmRMT9+jq+SDGIVRHdK4jxDV1sQIGvioTZ/RHNhgSRBva7OwdS
         uJNn2bHMw02oabPzXL7A1ZZKn8pOTKTLYKe4tsyDBYz9x7bD4dZxMWzylO0VHIfsDQ6t
         MdcQuhhRM2UtFDAG+AoqTurWEi5juVLxLp8yy8Mp0Hki1Zx++1jTJNEqn0UQm+0Qu+p+
         Ycug==
X-Gm-Message-State: AOJu0YwZQxFL4+jVD8YqM5E2r+//XlC+chPPNFzdRzdj8c5+xFpAj4my
	QqH/zFY40Fq6XaglsDeK2lgaqrBDItS13i470+7a8XlVx/IPdgCEEMbSV1wL
X-Google-Smtp-Source: AGHT+IGUnsKpB3vGLUdWdSNLnQfwxWJHWzsc5Np+WpGmywcKNVN3CPw/n02MK+afenXxj0/iOFOlHQ==
X-Received: by 2002:a2e:8e92:0:b0:2eb:eef9:6d56 with SMTP id 38308e7fff4ca-2ebeef97646mr23351061fa.25.1718114523928;
        Tue, 11 Jun 2024 07:02:03 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42217ff4302sm47618195e9.31.2024.06.11.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:02:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daiane Angolini <daiane.angolini@foundries.io>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] gobject-introspection: Do not hardcode objdump name
Date: Tue, 11 Jun 2024 15:01:59 +0100
Message-ID: <20240611140159.4213-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200525

From: Khem Raj <raj.khem@gmail.com>

Use OBJDUMP variable in the script, this helps in using the lddwrapper
with recipes which maybe using different objdump tools e.g.l
llvm-objdump or vice-versa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c04b3e0e371859c159b76bff87a5b1299b51d0c8)
Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../gobject-introspection/gobject-introspection_1.72.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
index 9a47e908b7..d935cbd905 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
@@ -103,7 +103,7 @@ EOF
         # for a different architecture
         cat > ${B}/g-ir-scanner-lddwrapper << EOF
 #!/bin/sh
-$OBJDUMP -p "\$@"
+\$OBJDUMP -p "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-lddwrapper
 
-- 
2.45.1


