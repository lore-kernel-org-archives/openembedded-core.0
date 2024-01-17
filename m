Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FACC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:00:10 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.6463.1705507201355448525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nzi3e98D;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so5047112a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507200; x=1706112000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fmrKrllHxnKHgkx//H16xQhZrFFjWBaa8OBDsO4hMs=;
        b=nzi3e98DHM/cGvk/Iz4CEnBIUWm4ipB5FS/PdAM2Mzl3HYLNY1Qx93H3rrT9BWXih3
         yHceGua58ePHegUrlxNfy6cCjw8N2ppAH/4rn4qB8ft4nnE+7cdD/zOy35xOX/yFX94h
         ZGcWcEm7MqvkKCUW1nnaP6iBBSdGVe3U8V+Vm+NCtV/rlXHlHTzrnZlvj6wqz1ROqKLL
         ftke6g2KBjHpQyPusFoAHnueHS0CjYN0CaFvXhgzVMXd2ZjUhIMqUGePxWaBFOuEoKbx
         Rwwp9gJhjMlrxcBb2WFvOkUmQBEFy8pEw3yFm+ynR95sNGT7ruM9jCSRYvepMZYkZIRF
         Zzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507200; x=1706112000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fmrKrllHxnKHgkx//H16xQhZrFFjWBaa8OBDsO4hMs=;
        b=gbxnH1munvZ2VGSHG5fSfbh5Mg7ismhelX4S4hJQ3KOCuUnXpgxiZCTV6pdBGzeQPm
         p+Bo9p/2VZHsc0S2NBjgxERQsTOqHLe+AOl4Z0rGV93fBGXk/gIITGhcSGIKNmAQmXzT
         j7CjVgn3o+VT0PE8V8YPf9lNKEqhsyKjRqHeK9MzQUesd7PqDr0cfRUH6wqdQmkef/ca
         4wiDsZHPLSln0X8ZPSQRGJvAWRx7KqL0ktB1vO4XFIKywAfD32xf1GEVwFQKt/SwFgkk
         FElT9IetQW3KqXwOkRwnDM6fPM5qKi1nXLwczhFo/pgfvfjwFhODu70HONyXlGqpWi/7
         KTsA==
X-Gm-Message-State: AOJu0Yx0IwAazWGCI/LsLVd13A4JcCVtkhOGQPT4ajxrH+pG5AMGqiMW
	pFJOm1dXFFHNlT8kwMQcow7TwwBexOM+7DOy09aonpZlWFyhVA==
X-Google-Smtp-Source: AGHT+IFPxRzfZBbtkImE+7zW2kdakZ7dbXjs07Aom76PLljHp9LVD3zeDFFFgM68PLY2cfEBug45eg==
X-Received: by 2002:a05:6a20:49af:b0:199:9da2:3f28 with SMTP id fs47-20020a056a2049af00b001999da23f28mr4159370pzb.91.1705507199958;
        Wed, 17 Jan 2024 07:59:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.07.59.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:59:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] zlib: ignore CVE-2023-6992
Date: Wed, 17 Jan 2024 05:58:57 -1000
Message-Id: <f46c9105d4253153a5986f2b307273e43ee98c33.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193928

From: Peter Marko <peter.marko@siemens.com>

This CVE is for iCPE cloudflare:zlib.

Alternative to ignoring would be to limit CVE_PRODUCT, but
historic CVEs already have two - gnu:zlib and zlib:zlib.
So limiting it could miss future CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index d75474dcb6..393ac61e3d 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -54,3 +54,6 @@ do_install:append:class-target() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# this CVE is for cloudflare zlib
+CVE_CHECK_IGNORE += "CVE-2023-6992"
-- 
2.34.1


