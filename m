Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64019EE6B5E
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:28:01 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24.1770409674499095258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CDutvP+f;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5014e1312c6so18545131cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409673; x=1771014473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy+cE4UCod1x5sJr+KMmTfGOgfumq2XD3hX3wp0wfo8=;
        b=CDutvP+fmy0z6ZyhaMtmHRL/dS9doGucMqLG3QCJ9WDWOjMdYKHZNqbcX0UmoWCkVF
         t4pwoiEJPjdP28mAPLBmNSRzpcl4lgQ8jvNz59TPdNpPUOfrODzX+0ny1FfUygTEOj4u
         hKe+ZqPX4uvELkeUB6CiNKTgnJaMtoQFsVzxE49odHmiStHWjNRyaVWOG5BwQ19/a2JS
         nlFlXv84jXvNQG93KtY9wN8gzvXPeFBEwABB3fbV4dys6XXZ8rDE8CchkgmL6VXKE1g1
         6fuSUe0qL6gskk+3XkEJWS4UR8/upDgRhJfI1cxfJf76NYOvH0TBk7MS4JYA9KvBzBb1
         Qw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409673; x=1771014473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gy+cE4UCod1x5sJr+KMmTfGOgfumq2XD3hX3wp0wfo8=;
        b=ZT1rM/HzV9MJ90mwMvLJtNMfqkMS8F2GS4C56xNpGkRr9c0RsPnPn+lm4brADSqiEw
         j/ISE8xtjY8OM37pTyEDg0qAIbAbItUJEzDJSgOoq1q73qbs0ArSWGI8qF6GOeeY11rb
         ZiRGT3u7QIXrI9I4wSdNCMwYLJ78B/PzCXbuTuTtaercu5rM/Jf+8VK7hYvTMTP+ZE/7
         YFuqZMAgp8zvwNy78HcOZi3imaSXmHuRqjF6Odtr5GlUox50BByoouo9VWVS6YMoXOPJ
         sxsAAxVARFW5T15POA1oKDSV0q8y4ydihpmkbwyRXMLNAgTiU340bOmJCFYAzoJm+hAV
         4bcA==
X-Gm-Message-State: AOJu0YwFgwEgNF8+Zu/yDaRYsRQbU3gTXBqj94UTRVAoCN+gckSUK/uj
	+dkIm3tR9MWiS/WhYRkL9ChUZg1O0WObPEKNqz/DPhFEmODEMaseqW3rIU96WSDE
X-Gm-Gg: AZuq6aIhllss/L6kFY6eZOnm7rtPG2Poll2VLTFxgk0HWC2ANKG/+WreoQn7f+CVDcD
	nKlV3+ZjBEpQ1Rg+P88teC9vE9ZrE3A+3zv2sbu0x2qCy/88I7gS8hU0pt4hb4EB/zyUJSJUIhg
	oWIsM8boCZ76oM2CgBRlswuldwmy9r2ENrZwh3u3GTUv/LE6El5hdG6d1iYXb517rg7zUFVuL4q
	BniP+pkwlZmWs9qUmlH7xMp9b6QWjNTTTDf7eKjOt6JaPRCmQN4mm9amgWHtJurKg+o+4jkFwPk
	IBIZfE2Dqw99aCpUD8kcDr9s+vZIji620vATJiHduoiEwcYasl5x2ssBVQvdCUG0cveFWBZTOx5
	nYfg+qt1bA/G57u802LC1UvVD6Zvmv6EcYlfkeNeiDN9Wal1/BwVAMQK/zAcbdL4cOCQjxxXCNw
	jYx43UQ9bNspiJhFT5mi021Fp1dpBGMWcWOOrurPiW0FDCUSox4NH7b6kqVmCKpkZVWGNCRyrZ9
	oig39Mhp/iLWI4T6f61rF+MFZQrdgxjdHua9j5jDexFe0c=
X-Received: by 2002:a05:622a:54d:b0:4f1:c805:1602 with SMTP id d75a77b69052e-506399b28c8mr51072141cf.44.1770409673437;
        Fri, 06 Feb 2026 12:27:53 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:52 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 02/04] meta-yocto-bsp: drop 6.12 bbappend
Date: Fri,  6 Feb 2026 15:27:29 -0500
Message-ID: <20260206202732.1080699-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230655

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.12.bbappend    | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend
deleted file mode 100644
index 831cb55..0000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
-COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE:genericx86 = "genericx86"
-COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-
-KMACHINE:beaglebone-yocto ?= "beaglebone"
-KMACHINE:genericx86 ?= "common-pc"
-KMACHINE:genericx86-64 ?= "common-pc-64"
-
-FILESEXTRAPATHS:prepend:genericarm64 := "${THISDIR}/files:"
-SRC_URI:append:genericarm64 = " file://0001-Revert-serial-8250_omap-Drop-pm_runtime_irq_safe.patch"
-- 
2.43.0


