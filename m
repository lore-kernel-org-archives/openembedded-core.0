Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64634C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:52:09 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9347.1783835519207852938
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=cN57GGNt;
 spf=pass (domain: underview.tech, ip: 74.125.224.43, mailfrom: vince@underview.tech)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664c535f1a0so3913169d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835518; x=1784440318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Mw4u9iOt6xITCSyc+2c0c74t3BrvipjIyJ7fyj5AnM=;
        b=cN57GGNt3ONy0CnSRHWN5mPaLu6objB2x4zk/4GnLkggj7s2qe6xKjfBWnmsstkTza
         l5QzB3v12G1SUmtL3mxn+xCWCZKBZVy942ljvfiFCubbbOBrH76JXscAmW+H0XWkei0P
         R2XigB/wn8ihnuLHejlD1QdDTS5C9PLmYvHI3lDW6nPlF/Btovd2arGWL+ZhVZmmHJri
         T7/Jk5fnBNG+p7qCFTxhiCL8/GK6ysrUQClJlLN4zBUylzQWJaojIiY8K8OJgen2IYvj
         JvKeiPS8eDDRkoezH2z1hBsOFCsxD8Uf4mXuos6oMkHXd206PS44MFb8+MFW2yZi2ym4
         0jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835518; x=1784440318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Mw4u9iOt6xITCSyc+2c0c74t3BrvipjIyJ7fyj5AnM=;
        b=Dfxr9EUPHtgqUDqz4xQ08qSqVOfTUa5VYHGI9ve8L/tbxOvsMf3Iq7XOgXsW361Jip
         cLOTB8cEIItQc3cAfVCM4Hq+O/60rnTSWxJ2BIf6n1f+GZJJm7qZHtdXqCkDYX5mO+gD
         lfTfrUDkzRSwH2hvT/1sLHimzHVT/p39hjrVrWHpDeEdQcKDEK1T3Ryw0MgSaIuX/GXO
         D0N5Dr5Kp6d66FtuD4ywdMMJB/Sz/fnzkh5mL6ZbY3857MiRWK/AEZRr9pEjoH8Gvp+C
         z5WpXZBemEglevqKJdtzUy+gTkhYNKp3dYWAACp+yE/4VI3MDUb6030qWB485B9z+brg
         azUw==
X-Gm-Message-State: AOJu0YwrQsVmikQahsIcSzlQhOnGWAAdnRKVbbEYAIgMLx8EQ5TcCmr4
	bPcfy8onVkp3T+EssU7P8hGo6ils6uHQkl5sQBxrXrWKhS2y8n+zvcWFDQpkrWMmcRipvLM7Tzc
	VtK9Z8wU=
X-Gm-Gg: AfdE7cn4LyFnF2Xfi5rxdKd2kQjqjlb6baB+ilpzKoVdM4D8qERdEVeeGWxXeVCG1yn
	ozJBzfDU2Sfkm3XYImuYadbUSWJRGHt1g8cLJie9Jv8shn2lcz+IvuNWCjHWOsLIxbDskbsVfDQ
	hytjDN3TVRZICMwjLFUMnhrJT19H20ynZUbA+nJKSZTngbEeWiSwdiCBdFtSIppV+6mYD59Z011
	RA39MLWlZmHfM/H8n7rbNuk/qIFng4AyNA6mr9Blp+tpJSb4Pqpk57X1XAca2UDe3Ge/Ri4TBUj
	GIxzt3/NSPSqbuBYXy6PW+VHKFIN0oRd4W2sXZ/d0sC3O92RtL2Z3+umunFSUSE/2H4BC7vMYjs
	pODBJ3ES58azdRlv12ToBhdVUqH0q94A8uG1AkwoD29FHwu3tqL4siPsnzZcSGyrna1aqMsNFUR
	1sRGBpgbqY8scwuQ==
X-Received: by 2002:a05:690e:120d:b0:664:edf2:1d5a with SMTP id 956f58d0204a3-667d7c87eadmr3404111d50.72.1783835518258;
        Sat, 11 Jul 2026 22:51:58 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:56 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 26/26] make-mod-scripts: preset STAGING_KERNEL_DIR
Date: Sun, 12 Jul 2026 01:49:54 -0400
Message-ID: <20260712054954.4063745-26-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240751

STAGING_KERNEL_DIR changes if KERNEL_PACKAGE_NAME
is not set to default string "kernel". Add workaround
to find virtual/kernel WORKDIR.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 4b0630313f..f4222375c5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -10,6 +10,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${UNPACKDIR}"
 
+python set_kernel_vars() {
+    set_kernel_staging_vars(d)
+}
+
+do_configure[prefuncs] += "set_kernel_vars"
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
-- 
2.43.0


