Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC06CCF65FB
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:36:26 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18483.1769430983102469964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AxDacwjl;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382f9930e54so44026501fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 04:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430981; x=1770035781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAV4K864QPTCRHM/1QTUlAW4A4zWfABebo76ZOX4V94=;
        b=AxDacwjlZk40uUDKHGmn6POizEkxgwhhgF2FTqp8EUA/bjgfZ8I00WwqKAmDBf3Wnv
         HM09FxQcIWJe9N5H3SKMaxVpj5vztcQ3QNovJejfGhpGK+bKLvzPYJrOl3bA4UYHB7OO
         bg9pcCTcsjlD3AnTB+wU4OB5tA3t6Dzpk0Int1H3VNIO5G83MGEt6bGRj2G1ZqpCRzLT
         xXwn3yP5l0FgpLdxrV02KUXaMttZPqf6n2PwL2TWzUuuCr/7yZFV0bstjLI6vkr1SYuc
         aZ4YyVGTb8B7kWARLUoeeRNqBrCWkO/tidJwfLHmDTmXEiyRA8yeIXrAji79DZt26FBW
         Laug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430981; x=1770035781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAV4K864QPTCRHM/1QTUlAW4A4zWfABebo76ZOX4V94=;
        b=W27TBu2DN2QSt31pzkpfOMcJ5Y9ga97jAIxTKqADQqjXXjVWnnYGhE7raqimeZAyxN
         Sc0rSdR7S22e5r5nmLgLrEs0/Pscruwe9DxkcF63hSbDyUVJp8fRZYHWHPqL3GyDl9Ek
         Sno3bXQ8tW/kNs7wMCvvWhZxSFdDTo3Bniu9Up7jNgCgueCAKrXE+IesuJJZGVkikqpO
         OQy4laLuCfSmbqztisbSzjvZeVGnYV5OejyZl/yhwGcJdPR68FdbaGqqXQqTIWuoI68w
         8Fbh4lSHdeflL3AJ0/WvqMLNUCHnZf8r0OazG537GFHWNVat2Ct63PJZcnjnE5LFrIzu
         JN+A==
X-Gm-Message-State: AOJu0YzKUbpOotJgeZBARkxBx/9N+T/EtKWgJE3k3vH0VNg0EvIo4k0n
	Imdx9N2nNJ5HtLT8oRJg3lbai6ULKv7iamm/dvzpuuka1YraXrwtjPlpBkypQQ==
X-Gm-Gg: AZuq6aL9SPW115+ei/2dILZcfMqMcEyKulFigE0+j3srWQk/h4182IFnZ28CawJN0e/
	+7n5Ho+mvH9ww1ZWbOMtU6IzyyjA2oXTw6ioj6BgK9iUzUWXf508fdGVq2K2a2UGRP4mGnLGFbs
	ALbQ66eoMk7guA30y5gBMjpOKfwqOIfHK3TK8cow96gJl0G1QcEuPyqOhFz5fBPfM2EKwxkDA8F
	gSet8dK1CapNszxttE6xAj2Z1Fb3TKpCFINSS93SNntX2OK3ywkXsKrdf8KPN/r29IfltDqFSx3
	ZT5TYAiCh5E9zQ7DfpUgOeLphiNzUsU38ymzaKr93Ym1DWODq4IclpBnF23JZ/X1f1pXmyWlR6E
	0MunbySGzvZwpnXOAQTBCQf1job7pxrU8b/MPAZS6NeeT+C69mxybp8lNE9Tz8DiPmaUGPW5MU4
	bKRoDYtcyyX5YhKrJcX8ciZbdrkL6s+IkMJLU5ynNzCcPQdD5KLUdfroQTTv3bgg8Jkg4+vs3ua
	bOoqhL5zl3WM/f4NuNAN/Q52/OvUZOh4w==
X-Received: by 2002:a2e:a815:0:b0:385:e89a:4bb8 with SMTP id 38308e7fff4ca-385fad22dcdmr13238411fa.8.1769430980490;
        Mon, 26 Jan 2026 04:36:20 -0800 (PST)
Received: from peterliu-precision-5680.emea.group.atlascopco.com ([2a02:aa1:1645:3481:fb46:936e:eb2d:93a2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9feec92sm24250041fa.18.2026.01.26.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:36:20 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] busybox: fix a incomplete condition check
Date: Mon, 26 Jan 2026 13:36:15 +0100
Message-ID: <20260126123615.66340-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229995

When deleting syslog sysvinit related config files, also check if
'systemd' is being enabled, after the change, it behaves same with the
check logic in rm_sysvinit_initddir.

${sysconfdir}/syslog.conf is also a sysvinit related config file, also
delete it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 22972baaae..c85117efc8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -358,8 +358,10 @@ do_install () {
 	fi
 
 	# Remove the sysvinit specific configuration file for systemd systems to avoid confusion
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)} &&
+		${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		rm -f ${D}${sysconfdir}/syslog-startup.conf
+		rm -f ${D}${sysconfdir}/syslog.conf
 	fi
 }
 
-- 
2.43.0


