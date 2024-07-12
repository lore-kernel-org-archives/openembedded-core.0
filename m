Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6A8C3DA4B
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:51:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.8337.1720792309464534363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YEM5r9j7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so13526835e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720792307; x=1721397107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmJk/9bj3nr9aE6XQvI8TaK7RPLj9xgy/JsPu5AXqEQ=;
        b=YEM5r9j7qxP/TF3trf6osoOSg6avhGNeB5wC3Z9A3ayzLyrxkdJcnyJvkYLzGDzgcm
         rmZDFpV9M7XYiMLlUCu7sQQIwKcMGSOncv18pwjq02Jn/c+qSjucJQmcb+eUtErGYrTK
         cYgeKqmvPGi9DpXi5JCGIHX+9T5lvwL2zSXSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792307; x=1721397107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmJk/9bj3nr9aE6XQvI8TaK7RPLj9xgy/JsPu5AXqEQ=;
        b=B3hiIKMcAoLAD5Ofz1BOL0O/9o3Yhcug5QNfxmU9s32PguZiI10jINxt88LsGQavQa
         lF8fCSxb3/Zwr7nsRYuc5yiyL3HOHgm97wvr1dtZ6FGD0h3y9bblFY/dEibYX702GYkK
         6EoL9sXqIiOZw3VpEsmz4htTQiB4rOxXz8ZVhHEA8w0uXxaYCyeGfimUqWFV3B8cw9ds
         jlGYWrnJ4HkNst04rA9LNuOlr4HSGK4FJoDXhfZ5lJqnPbmo/pFcSLTw6BxuZ0ATddgU
         CV82FFTtTv/1FMnVOj6R2e/1SZ3Ktw3JRZT5l9MOtXlVSnqNfuWS94dkdRSNeFlt2+7P
         jr6Q==
X-Gm-Message-State: AOJu0YzH/VVE+vLMfUPQQCB7Lmaqbbvq4Z7eRRPdgHkmFi0mFK4DWuK3
	yF+Lwyht1iopMZ3RM+AabcaY5hHGFQORHo2sUV3L865lKwweJCJrldnWVU8+d8qSwjpHCNZGsny
	z
X-Google-Smtp-Source: AGHT+IHO3W2WIfZb9PNTfC/W4zkfOG9R/ZN4vaHzy2zGUT2MTBj+MpeXadi/KXNkVo4JTPC4F6oQeA==
X-Received: by 2002:a5d:6345:0:b0:367:9988:84a0 with SMTP id ffacd0b85a97d-367ceadc7a7mr7138335f8f.58.1720792307348;
        Fri, 12 Jul 2024 06:51:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa078fsm10270492f8f.71.2024.07.12.06.51.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:51:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] busybox: reconfigure wget https support by default for security
Date: Fri, 12 Jul 2024 14:51:46 +0100
Message-ID: <20240712135146.1614566-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201830

The default busybox wget https support is suboptimal, it silently ignores
checking certificate validity which isn't great for security.

Switch our defaults to disable the internal busybox tls code and the
https support using it and configure the openssl backend instead.

This this is done by spawning an openssl command, we don't need
dependencies on openssl for build. For runtime, we can assume
people would install openssl if they need/want this.

These changes put our default busybox configuration in a more secure
initial set of settings.

[YOCTO #14125]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/busybox/busybox/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index f3d545dc3fb..8e3b6e480ca 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -983,7 +983,7 @@ CONFIG_FEATURE_TFTP_GET=y
 CONFIG_FEATURE_TFTP_PUT=y
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
 # CONFIG_TFTP_DEBUG is not set
-CONFIG_TLS=y
+# CONFIG_TLS is not set
 CONFIG_TRACEROUTE=y
 # CONFIG_TRACEROUTE6 is not set
 # CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
@@ -997,8 +997,8 @@ CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_FTP=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
 CONFIG_FEATURE_WGET_TIMEOUT=y
-CONFIG_FEATURE_WGET_HTTPS=y
-# CONFIG_FEATURE_WGET_OPENSSL is not set
+# CONFIG_FEATURE_WGET_HTTPS is not set
+CONFIG_FEATURE_WGET_OPENSSL=y
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
 CONFIG_UDHCPD=y

