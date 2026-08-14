Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EFAC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:48:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7674.1786690127736168358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xN/dXD5h;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeba09900bso472783e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786690126; x=1787294926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPC3jntb+AJAKQU4njVSNWkn9rEvY6ZvWFgIfdpX8rQ=;
        b=xN/dXD5hyHLLYceCGiD+SOVb8xdXjEwy47zAA7DlL1EqrmtznBw3ZOtg3uNVfNAgPG
         y5NljxgeWplZhMOnM4yol4t5AJytwYNSL/plZo8uM9pPNUGIxmQXdZGUd5n2plMCNghI
         7T3CxFi4wTUpBmKljpifVf9EkRwDP44GB+D8YSwRl82wytf+GbwXNZIn/QTg+W4bxqLs
         iND4J2nyPZJe86zlI2a4Poc50n/VlLh68iXSZHV7gPXY+qJ9MHJAfYvpC645pWKFjYMw
         Gm6FknjO0GjHBBN9q3TP59WxdRy41NW5XyNy9hJG9z7Uqk5u28rRGKdyvKUEdhiCAFcD
         OFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786690126; x=1787294926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPC3jntb+AJAKQU4njVSNWkn9rEvY6ZvWFgIfdpX8rQ=;
        b=ZSsq0Tt0tIy+gNu4NWQJFEc5lpF8Uy3HR+40aM5KFxktIbwQTWi3JCRaMQoJf1hg+y
         42FIuB9ynreAF67kwcVAypYn5Wqx9KAap/N6TqG+7isHlesLGcYcTP6DsLEca9BxDt1O
         yzXK4jQRA18GHFk4ogFCG40HWFq1nQ4DDwUI25GfASfmqgVfs3v5DWEK942dmc3ROQMi
         Br2gUzeIRbJNCwRzOWHq4QEfkZA6JbM6pp5XTFSGccMQYL4y7N/1BfYCU5mrnAqsr11B
         PU9Qvx0Bylveq8hAxqqJFa68WCwlfwb4O4Q5V+zNctON14dh2PLaVoRKpUglvo4VkyzH
         dhJQ==
X-Gm-Message-State: AOJu0YwwtDNOMoPOvnf7dNXNK7uP7WmEZR8cY6Tw8U9XiZK4p8gA55om
	Y0aC31nTBD75T/zXiHFx/gTYLIQ3Dwd7LRAwFIEyiZju46lOFJ7oJuuYV6w4oZYpLre8tuot7lb
	xMmnE
X-Gm-Gg: AR+sD103gZkw8FruIXCf0W5N0DduedJ7Mv9PhwwW/4v3cXMTzP4LP7j2lWNCqDnka2a
	vHPd0HgcNTNsu0lxfziwmyc3SVGN7hbNaWau/fYdSnK5yUM6CiJCsS3+MNOk5p8r5qCIcnTPNMc
	4UkteotZkFg+htECLNa64VUPQM6cjGPuLZ6PU/g2SXCaeevGNoSqCiLv1FGEIrBJof5o2DaY6bh
	Zj9de4zeICUSfvWZMmVLsNGuNH1h1VvTFP2HS477SIHORqTJf7bjwHPa6R8k1yRy4Dw3DWCOIxj
	BH948jFRVdsOLN0HeMWYCfqL15kDbY+CpX99H9sG6q72h9IZZRsSxOMMOLUq5KbdsR5YPAJ+/AX
	tAMrk7h2Fqas7Fl464kcVYHUSaYtiz/as4YgxThXtlMHskH4Mrj0B3qxbaz4dfsj3lUE+ywEVHH
	72S0t9cxuJXHYu4nJmlTLsGsk4XsOZ1GGUVUR3W+/RvsV63Ya/zXVyvkgNJEaEwzBAZ8ekwC2V2
	iFXj5pX07Wfndw=
X-Received: by 2002:a05:6512:6ce:b0:5b3:12b1:cb8c with SMTP id 2adb3069b0e04-5b459190005mr448859e87.51.1786690125676;
        Thu, 13 Aug 2026 23:48:45 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0e9dasm349285e87.78.2026.08.13.23.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:48:45 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 1/4] lttng-modules: update from 2.15.2 to 2.16.0-rc2
Date: Fri, 14 Aug 2026 09:48:09 +0300
Message-ID: <20260814064812.1071873-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243419

To support kernel version 7.2. Fixes build error:

| lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_event':
| lttng-syscalls.c:612:17: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
|   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:101:1: note: include '<string.h>' or provide a declaration of 'strncpy'
|   100 | #include <instrumentation/syscalls/syscalls_unknown.h>
|   +++ |+#include <string.h>
|   101 | #undef TRACE_SYSTEM
| lttng-syscalls.c:612:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
|   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:612:17: note: include '<string.h>' or provide a declaration of 'strncpy'
| lttng-syscalls.c:704:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
|   704 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:704:17: note: include '<string.h>' or provide a declaration of 'strncpy'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.16.0-rc2.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.16.0-rc2.bb
index bfa1fc619a..e19850d4f8 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.16.0-rc2.bb
@@ -20,8 +20,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
-                "
-SRC_URI[sha256sum] = "a8fbe5f76a89856505a4310c549952b7a47350b1115679c59fd303ac457444a8"
+                 "
+
+SRC_URI[sha256sum] = "43c05267526257464c9a048087dc7ac73363bb4ca4ed7a961bcf655e012595d7"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.55.0


