Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D49BC4450D
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:38 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9337.1783835497827892387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=LCO6fAFG;
 spf=pass (domain: underview.tech, ip: 74.125.224.47, mailfrom: vince@underview.tech)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664d530fcfdso4244178d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835497; x=1784440297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiF+AWUVrVrA1vH1XbwKZ5X4AZAwL5QfV2D6bEA/FjI=;
        b=LCO6fAFGOWDwh+08XaopHPaqg3hxPrjEqionqN1BIHOo5xPeFdNZovK403mUDhB4Wf
         klNKC38+opvswLxvkP1hZmWsHJ1sOnLSPF1ytS1EDwqanWIZpbjIZBXqeOYWjuEPXm64
         fewN3BtST58n7ALn0ruhaxh3TMoVUdyv/Dc4jt/13RgjikPHgL+eaG7GIv8lg378I8w0
         l3A5t944Eq+n0ROFdjPUfkGkxV6uB1EUn7knFQpRPEwDulA6cYo+y5sDq1y6FLYaVm1B
         o28jaOtTy3NFtSe82aq/8bUk5A6J3Hqt2UgPu+o/wuHPDPenRrM0055j2sMUOOOzsQTP
         6C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835497; x=1784440297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiF+AWUVrVrA1vH1XbwKZ5X4AZAwL5QfV2D6bEA/FjI=;
        b=FLBkR4Rbw1OFxT9hX2KZPSdSd4CszA9Hkl+O3nDZh+J+1I35lwJWlAlGn2Akp76my6
         5TwXOfy/zqeSQZ3PoK7NOxbOFxazyJqgR7hOqOAQ2vdJLcO+khLF56ocp2NOZh8MayzM
         Npn6fzivcVoZR6qmkdsRH1Z25yKw5G+F48c7Jhh2yspFScwQNy4IenbXtBU2+dAzX4br
         Z4aGtfeCCWVnR84W7Psryvk1R1Z9BlgS2DPH2ipSEc4wZRnOk5b9uQmJxETGKI1qqBX4
         K7pY8IggVI9iwIf1ST2DGYDhB2ZGgiG0N07Nf/O/aYxjsPy45hmFAmknJYdzRBqKslNM
         Ti+g==
X-Gm-Message-State: AOJu0Yyc4mvrMEo4ZvUo0+S48sRP/wT+YIfK/alQ4mZy7q5f6RCl/Y45
	PhXiVfCvnaIq8jUsB3jx4EiLxuG4bSFMO3b4X2ugsBm+Ci4Vtzufi56r7KB4MLZ2VxRkDAqwtAY
	eIbNDLQg=
X-Gm-Gg: AfdE7cl/sFsOJEVX9ZYzJeoNgqb83ojLpf3I0w1O4MPOg23voI5hg5JJI3h9jw2G1fF
	qcQ0/s3R6qy602Jqzz3N1atH7Wgg+oCzmwZsmr8xjcW1GPzPIyNbd7iU5U34CET9fvIoOHtLWn8
	xhAhd7jr818+6gp6vo0izAYNx86mxh3gcGlLCyZdRT/Y6HQLDANwRAmH0Umalf71f8K2MJBWJRn
	uCbjF/oiMzv/OlGPpkPhIhYDx4/bEm0euP3CMPTXS4iah8ihk6+5qEkkCdvXvCKgMRkmMIBV2eX
	8ut/qIqJJVRH+2CV1NjMeV4Tl/hnZEdqgN7bQB6V8JM6rBuXRm88WtWj893P9c4MC1nn5/1NqjD
	i+XW1W0X4DOE54umW1ned/H/mnf5esxnVBqAAjy12uchDfuw0LH6TIRW6thI8mCd+G7jH6r/7Qp
	Qiy6VMpkBBjdLesg==
X-Received: by 2002:a05:690e:438b:b0:667:c93a:82f6 with SMTP id 956f58d0204a3-667d7b82922mr2917104d50.35.1783835496940;
        Sat, 11 Jul 2026 22:51:36 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:36 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 10/26] iptables: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:38 -0400
Message-ID: <20260712054954.4063745-10-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240735

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


