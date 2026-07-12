Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E563C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.885.1783881807271598781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=J+CCBPna;
 spf=pass (domain: underview.tech, ip: 209.85.128.174, mailfrom: vince@underview.tech)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e771226b0so34332377b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881806; x=1784486606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiF+AWUVrVrA1vH1XbwKZ5X4AZAwL5QfV2D6bEA/FjI=;
        b=J+CCBPnalBvxbqdg6jblIPuwE24HJewIDTQWF/RLjtbFP3Myl6dC33hr9bsIlDydDh
         +xM1wZzkYUCIl+cwx9FletnRlg42XNtYUEwBviXKGn4cW3rF92WSI+zDSPyfi4tfyQg0
         lQlUIliI3JgJHpyAOuNJqyIDc2pVXgP/k93gOBzBkL44m++tBMNan3Nkc3kfvAyAslRZ
         6TdGx3LtdmVIWUs58baL9ZRkqKzwxi7n6Yx4wdfIWv4FItaHXKcZbJS4i7LosCSuxuJk
         WOf6ZwdbmPNXn/Her0fqkW/w5+kBIeOoHjXFJP7QOMddNd6FfueIJvdcEHUyNZ0OGhV0
         1bNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881806; x=1784486606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiF+AWUVrVrA1vH1XbwKZ5X4AZAwL5QfV2D6bEA/FjI=;
        b=qGnJe6DunvLK/3mrHO/iDmkffaDk0P0JrJQJ7SKfDjUesaxXufLquYVdm1MbeR86AI
         hETXI2YThPTli1/wyyj2girr9tTsuGYQaWyaUOlKm00wavh5A2PmgafFZ5hVsZgU1Ak0
         IroQAqsQP8EhwqFBDC/nX14B1pymwKanIi7Kwr2cZAZrhJMWIbDxryZi0rPHB31i803l
         UKsuzsfhoy2+UyfOGs7wEX5NShdgBUpwEEguiPcftJDGroU7uftsVJX0roP11NEW8nPd
         y23wuRN7sADZZ67Bmh5fMkWFh3dD0YKwbKt4hO27dC8DDAEJl+hzJcBnIk+sRc8sPl10
         PMWw==
X-Gm-Message-State: AOJu0YyoQiAE5xrpmdr7s+ly7X2tVYRkXJ9q1bTplYP4hDIYtxETvp9X
	0ejoaGp58trpMdP0C7gtTts09WDdNZjB9E47bOOUdUhoA7fRt2Rrppg+gu71C1N8D2Tfh4qU5vG
	/yD0FJZQ=
X-Gm-Gg: AfdE7cmB0LMbXGq1fQn+e9aRwDDe+HM4HELpTZxhecHLpgGYGHG73kbN/jlZxQS8lKa
	IflmB4KAIp/nYv0/KrsrkbEjk84D5RM+oYIBAG6cMTKgeSChwlTGfbHzvxLbm9K6tszyTkk3sHI
	cKkb9odYKBL2Fwlc2HSWei/a6Mxb4P+FVU+sGSmumIBB1LVjgKYgVWVmohX4iA8rB0Ew/UumABZ
	58ZmkZacYAt10Y7zzTc6vUAIEKqk25s36TDUI33zOOuFJTJ1gpv8QQ6bzbVkoeOPHtsMvIT+T4Z
	izJ/OF0pcfMpeYmMICGPW94HqagDbLZgY2FGrmseTs0n1axu8wPKOPhOZc12bFn4ezCG42tAocI
	9SOz3eKS475qR6f2+xCfZb0F77KZd27krD8G8uxP6stR3d5VY6LEZp7CAxX3GowZZwz8SlJMMf5
	Rg784gUsIWuAvd6w==
X-Received: by 2002:a05:690e:4419:b0:664:b2e5:a79c with SMTP id 956f58d0204a3-667d7b31ea3mr3451045d50.26.1783881806275;
        Sun, 12 Jul 2026 11:43:26 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:25 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 10/27] iptables: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:50 -0400
Message-ID: <20260712184307.3259642-10-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240800

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../iptables/iptables_1.8.13.bb               | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
index 11b287ed3b..0fa5bf40b2 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -92,18 +92,18 @@ python populate_packages:prepend() {
 RDEPENDS:${PN} = "${PN}-module-xt-standard"
 RRECOMMENDS:${PN} = " \
     ${PN}-modules \
-    kernel-module-x-tables \
-    kernel-module-ip-tables \
-    kernel-module-iptable-filter \
-    kernel-module-iptable-nat \
-    kernel-module-nf-defrag-ipv4 \
-    kernel-module-nf-conntrack \
-    kernel-module-nf-conntrack-ipv4 \
-    kernel-module-nf-nat \
-    kernel-module-ipt-masquerade \
+    ${KERNEL_PACKAGE_NAME}-module-x-tables \
+    ${KERNEL_PACKAGE_NAME}-module-ip-tables \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-nf-defrag-ipv4 \
+    ${KERNEL_PACKAGE_NAME}-module-nf-conntrack \
+    ${KERNEL_PACKAGE_NAME}-module-nf-conntrack-ipv4 \
+    ${KERNEL_PACKAGE_NAME}-module-nf-nat \
+    ${KERNEL_PACKAGE_NAME}-module-ipt-masquerade \
     ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', '\
-        kernel-module-ip6table-filter \
-        kernel-module-ip6-tables \
+        ${KERNEL_PACKAGE_NAME}-module-ip6table-filter \
+        ${KERNEL_PACKAGE_NAME}-module-ip6-tables \
     ', '', d)} \
 "
 
-- 
2.43.0


