Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7704ACDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:19:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.202790.1697534363418480315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 02:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TKYLtGCH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-407da05f05aso2725385e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697534361; x=1698139161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHB5LctI/wmq6vM/3BDwX4EJJub6owZ2/MIr2dM+m6o=;
        b=TKYLtGCHBQinhpwEgOXkVnfJZo7exOLAINViqjKOhcVBzCpHh7xpCy/3iLDRPsaV4d
         2rIAolS3tsVy3mSJITBdH0zcuW0vBdv3v2kYW7a8MqPf7lZcswNnaC1REaYZE85oufRu
         yRAC3cbGGCY5hNrxDAnYibeV4cCcgQsPBOoLcB4QJoErpnT+Jh+yrj49z5+HivqYdqxJ
         WI/Ya/pbtOBdZDxrpikIlqg9ppkt9cKeHXMNV2NXzWl6lSKQ/kf0od8K/DkKS/ZA2enF
         0wLQpOGp5gmgojDWmJ7mgRXe+fkaCfzKWkhhJRqs7IPIUwHbeX8jTTRByEwTgx6hDj3G
         FxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534361; x=1698139161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHB5LctI/wmq6vM/3BDwX4EJJub6owZ2/MIr2dM+m6o=;
        b=iOGFDD037VH0MBRJHHXdhYR3iyQFf/0y82C17FgaLR9b42j3L9/rr7Qkj+0jIClHwO
         IIcyg8DFyVBoLKJa9+31Us74CJyphJwlFxTl3uP/zX7nkaPJ3eAvUSi9ZnQu1pKELiOm
         z095o56xgUfMFW1rn1km21/5YvowJqYC+Dq7khsRNqPOIvWwu0g/K9gHeqR1R+z8C7KH
         G50oPn+xzRaQNQjQuU04xu2NQaUs8TbG+7v/8UsZL/UflDKrdkAIox4JLs5/LZ0eI/ul
         PYqLSnCkAHZI+uK5JF7MQPLF7xrmELa78lsX2lrOEx9mAgTmjmPawhz1QdcNzyKRK/AA
         Uk6Q==
X-Gm-Message-State: AOJu0YxoMrgeiC1Ec0Lhq2rtOGWwCxpnbfb+gacahrAkd0ytCufWlsXM
	UB1CFsnQgYysdS7noHY9RmaOOUs1YyQ=
X-Google-Smtp-Source: AGHT+IGie4avSc4liROIASpe6oOWYuHPI5E8IzifP4/6Vf5pKP7iAFPui3L/MH31VW4ejFSkToXmIA==
X-Received: by 2002:a05:6000:400e:b0:32d:90f7:ce46 with SMTP id cp14-20020a056000400e00b0032d90f7ce46mr1916279wrb.16.1697534361491;
        Tue, 17 Oct 2023 02:19:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa75:9e00:42c2:7a32:9a48:d1d3])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d510f000000b0032008f99216sm1210422wrt.96.2023.10.17.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:19:21 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/4] systemd: add systemd-crypt package
Date: Tue, 17 Oct 2023 10:18:58 +0100
Message-ID: <20231017091900.114311-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017091900.114311-1-jose.quaresma@foundries.io>
References: <20231017091900.114311-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 09:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189319

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index d24bf0cb06..2146c130d5 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -387,6 +387,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-analyze \
     ${PN}-binfmt \
     ${PN}-container \
+    ${PN}-crypt \
     ${PN}-extra-utils \
     ${PN}-gui \
     ${PN}-initramfs \
@@ -446,6 +447,11 @@ USERADD_PARAM:${PN}-journal-upload = "--system -d / -M --shell /sbin/nologin sys
 
 FILES:${PN}-analyze = "${bindir}/systemd-analyze"
 
+FILES:${PN}-crypt = "${bindir}/systemd-cryptenroll \
+                     ${nonarch_libdir}/cryptsetup \
+                    "
+RRECOMMENDS:${PN} += "${PN}-crypt"
+
 FILES:${PN}-initramfs = "/init"
 RDEPENDS:${PN}-initramfs = "${PN}"
 
@@ -552,7 +558,6 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
                         ${bindir}/systemd-creds \
-                        ${bindir}/systemd-cryptenroll \
                         ${bindir}/systemd-delta \
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
-- 
2.42.0


