Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44346C0015E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:34:46 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.76.1689651281852426567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Xwns8JLm;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7653bd3ff2fso595805885a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651281; x=1692243281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2mPi5G/RRwz/oAdToYkHd9x5omdvfbrM2o+SJAuSFE=;
        b=Xwns8JLm3jzWVXvVWuKbG6EWSl0Qi4+drudbMHVzgzK4H3fNCfl1qdfrt3EmdEyOjJ
         UCCmPngfvz7kYwKC/B8jqi4f9FYANE6Jc1I/JeTEcXmHJlvjzZRTxbwPWs//pt+ksfn9
         XRU4W59SR0dkCc8zJAsIjrQeE/6sCiFwbKrRCg6WWc+MmilEQNk7MC0h3vAmF9wUXWXa
         ZVm09l6dJNfQYGHqcv+JvP5LSCD6tdLgzk3EKTT/rOIXElh1vSy8NliAJLV4wHjI/tT7
         5XbgUV4A4tbxMv2u+sByWcV0ypFEnTY0rn/XLVwYxyEVRr5Smnndx9T61fLELO4t8Uhk
         NozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651281; x=1692243281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2mPi5G/RRwz/oAdToYkHd9x5omdvfbrM2o+SJAuSFE=;
        b=H3QowyeCxwxwIGsXAEhNHi317KjcYpUobufPWxo2+r42/+KgKf7a/NcfL2NwkdGsXT
         ptz5xo2e9okiZlv61VRKdhpV9Wg3Phg4KPs8fEX1+pt1FolpYMv/RdjpfsVw4811xfK3
         ezlUEe5oFAKeCVMN6CExqlkgo0mao5+08dxvsUhZ/C7FPaiWYf+I6061dtEnNQzH/ZjK
         JxaQoOT0kJTBS7lLPMUE9OD2oGI0Qbjg5yKmH5D8CEkyvJYI9ihonUskgqg+im6jEu8Q
         MFJ8wZGeevq9fxDYflkrOu2kqui/BIIRMv+hCLIWK2UuHO8Zd7cZTZ45b4e3WGwwUHAO
         1Bew==
X-Gm-Message-State: ABy/qLaV22HKrYU2jE3cqgFdIwgL+cyxshlcTU6cHerAnbLgGN+JJMLW
	CySo+sBPBGK9ALa0LalWVHo=
X-Google-Smtp-Source: APBJJlGOlF0/Lv2Uf8wNn2NhBlylBYY88r2hUZVa1tQQyr5jNU2I6IkyKZ0nHnEZ+qkgAMe9sGbuxA==
X-Received: by 2002:a05:622a:2d6:b0:403:9abf:805c with SMTP id a22-20020a05622a02d600b004039abf805cmr17906590qtx.40.1689651280877;
        Mon, 17 Jul 2023 20:34:40 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k5-20020ac80745000000b00403715e4cb7sm356633qth.79.2023.07.17.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:34:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kernel: set HOSTPKG_CONFIG to use pkg-config-native
Date: Mon, 17 Jul 2023 23:34:35 -0400
Message-Id: <d2da8fef633ea76c9160693ee9536b3022a72df3.1689651113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689651113.git.bruce.ashfield@gmail.com>
References: <cover.1689651113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184492

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.19 kernel introduced a variable to specify the pkg-config
command to use for host tools.

Previously to this being introduced, we needed to overrride the
standard PKG_CONFIG* variables to avoid calls to pkg-config using
the target configuration.

While we can't completely drop the PKG_CONFIG workaround, we
should introduce the new variable, and prepare to only use it
once all supported kernels are 5.19+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2aedf3a31b..b3865dcb0f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -355,6 +355,9 @@ kernel_do_compile() {
 	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
 	export PKG_CONFIG_SYSROOT_DIR=""
 
+	# for newer kernels (5.19+) there's a dedicated variable
+	export HOSTPKG_CONFIG="pkg-config-native"
+
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
-- 
2.34.1


