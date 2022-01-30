Return-Path: <vivien.didelot@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07BDC433FE
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 19:26:53 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.22726.1643570812709202551
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 11:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Py2yX71M;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 13so10192772qkd.13
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 11:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vdUKKGgB86curG4xSzsqKcsonwbXxyXIv/zpmolQ35o=;
        b=Py2yX71MfRANQui346t28djOYaJpnjy1tmEuwW4sMF3vr1b+UmD5lPIde0bfR/ilbI
         l9yXoLI+KBxA2nhclB5F7pea56qHaRO/7Xol4Iq896UQrW9cXquuZHjNCIq0oiu2wQni
         BTvbi1hWZ8t3DnJu92PLoQyVylXVYD57fZQAgeTZBmLmdldLXrHLBuPCK4hXbv3lblIe
         /fR8/rdrLMQe79VMfVT0jf3WJ1HwWQHcjAwrW9vb0jpYHrDwZe9AkAAeMBG4BeHO0kj/
         M69MazBtyAaYNIa2ioLApR14D/BvCZKLFDO++BE2li5SXwpVW/yPtPP7rOMIqfDrRai+
         wZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vdUKKGgB86curG4xSzsqKcsonwbXxyXIv/zpmolQ35o=;
        b=GEpKUgcxDCnw5iRNDKKb9d5d4JBK070NvycANxkjCigpgQ2H9eTYuH9jmzXm7xbVoK
         zahkwq9YQiiUpg6eTJA1/s4VlL5UZewDLkVloVf/6fm5uifzgLY/xfdsirqMZomHI9ks
         N7XZyhQxOjPSEIrTet0l18tv4nVcKzN4gu2og/1jaBdtKG9WelX2RaQ3+q2VucLp60gO
         0Pf12I4TtyGL+wuLwp2u/815ZtshA5nEtdN0sqcjmrcjZ4px5RT7NufCww6IuEH6rRIa
         Sgj3R0M5mR4msci4rPxkap3y3TOuZ5S4IJl0MS4c+kObSkrIcKbK5Ip43aYxHNp27j6B
         OYjg==
X-Gm-Message-State: AOAM5305sEAmGoJ46OSa0vactC+vh4sZpLNqdwsrGmGL2ANLAAPFsdMU
	Dej3JEII8lujdLRmRLbFgXAw3v9GNiA=
X-Google-Smtp-Source: 
 ABdhPJyuN1kOsy3A9oKktUPoS8XURCTfp7p1jDLFc5jNnO6xF5/bcZf3kS+2R68k+4zjs0FgawMM1g==
X-Received: by 2002:a05:620a:13ee:: with SMTP id
 h14mr11117760qkl.741.1643570811785;
        Sun, 30 Jan 2022 11:26:51 -0800 (PST)
Received: from localhost
 (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id
 m16sm228255qkp.21.2022.01.30.11.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:26:51 -0800 (PST)
From: Vivien Didelot <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vivien Didelot <vdidelot@pbsc.com>
Subject: [OE-Core][PATCH 2/2] wic: bootimg-partition: allow empty partition
Date: Sun, 30 Jan 2022 09:25:27 -0500
Message-Id: <20220130142527.2960188-2-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220130142527.2960188-1-vdidelot@pbsc.com>
References: <20220130142527.2960188-1-vdidelot@pbsc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jan 2022 19:26:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161115

It is possible to use the bootimg-partition source plugin to fill an
optional boot partition, e.g. for data files or for kernel artifacts,
in case they aren't embedded in the root filesystem. In these scenarios
such partition may be empty, which is correct.

Instead of erroring out, just warn the user. While at it, make
it clearer how to populate such partition, by mentioning the
IMAGE_BOOT_FILES{,_uuid-<uuid>,_label-<label>} variables, as well as
their presence in WICVARS, which isn't obvious for a new user.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index f22364766a..d7d9842b8c 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -55,7 +55,8 @@ class BootimgPartitionPlugin(SourcePlugin):
                 break
 
         if boot_files is None:
-            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset for entry #%d' % part.lineno)
+            logger.warn('No boot files defined for entry #%d, %s unset or not in WICVARS.' % (part.lineno, ', '.join(vars)))
+            return
 
         logger.debug('Boot files: %s', boot_files)
 
-- 
2.35.0


