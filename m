Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CD2C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.57859.1697817099405287313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tFH4nPNJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c9d922c039so7783645ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817098; x=1698421898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/Grj0ohc8t6pgqsbMApo96uru6LjSPZoujR07AaFcg=;
        b=tFH4nPNJ3WnMoYrMyq4IMTZDdwF4VjH82j/qjCUgIYd2o6WgCkluvD/pJM+X81mfwu
         ploZkfuNfiCJQzvvuZZb8xho/xyGPX86q8ljbdURMkBenQjALvGNZt0MkefhCRmoT2GT
         NLb1372q8fEao76ULklD/0wtZmycrTX5Bz51npDdWlUL2sdFeSUIUHIvnmLyBiUjL10s
         UeJONkTi4dD7F67h68dzM0W980dOyRG9oTjjlhdl2FsUmBEfnVX/rWGeZWV5utbZ9nUA
         9K0b/dwa8SkX+SGBZzfmHbwvXW+CllIWNZBmRDV+F/TNgVSPWJY0x9Eggk7Kuf3+XpAI
         35bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817098; x=1698421898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/Grj0ohc8t6pgqsbMApo96uru6LjSPZoujR07AaFcg=;
        b=gBG2kxBE7++VXoS8IrZWSOpD1ls0O4NTk4MhRGGsB4PeFF1FswhfL1ocres4dw+doB
         u8PFfmLeOmbpAvwJKvOYz65wDFtO4E7UhX4BGOvtKj2dlRlPMSZLNj9BSXvsU75hUOaL
         ARvuL+nFyCZHIrT/O2u9t9ZkMY5BkVxlrdcinyX7t7yDGPAT2cWJGxFaAzuOwGIsWJlX
         fCvtSMjCj1WdxwZ+w9F04Zi0I77pcPW31YwlLLWTUYLKMS/4v0TBiulS+oicoiqg7pqE
         owO8k2dmlja/t2HpOSGawulnS889DeqnvnR2MC5S+W5hkzYWD6GZDdbQOB9wOZQQPFWr
         FfVA==
X-Gm-Message-State: AOJu0YzEJpOuGWEA/xDYj/wFeAh296Ueakkrub1Htq5pVz+kcPhd9zog
	ekiKKBYttriFyydMkTNtzT3EbQDCS46f/wK3A+0=
X-Google-Smtp-Source: AGHT+IH/c6iFMPj+rXC3nhRzqC61fh9HQdM0nIMEBajI5NgZp5nO4+8D1iXAqa1N5yjGXqtz0T1hkA==
X-Received: by 2002:a17:902:db12:b0:1c2:218c:3754 with SMTP id m18-20020a170902db1200b001c2218c3754mr2359924plx.53.1697817098081;
        Fri, 20 Oct 2023 08:51:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/24] qemu: ignore RHEL specific CVE-2023-2680
Date: Fri, 20 Oct 2023 05:51:05 -1000
Message-Id: <7300254fdb6659c0a7462c64133f893d1a152850.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189548

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 00decc57e5..a7f1099dd5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -67,6 +67,10 @@ CVE_CHECK_IGNORE += "CVE-2018-18438"
 # this bug related to windows specific.
 CVE_CHECK_IGNORE += "CVE-2023-0664"
 
+# As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
+# RHEL specific issue
+CVE_CHECK_IGNORE += "CVE-2023-2680"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


