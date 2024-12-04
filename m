Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA6FE77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:55 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.21457.1733334888956324543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DUxf+7Ct;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fc88476a02so58965a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334888; x=1733939688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CS6ldFKk8PgBT9GaTqdembmsijoMfX4VV8EOWuGbeBA=;
        b=DUxf+7Ct5zH+Sld36it1kCHzIRrn+XrjaD5LBBfB7Smq1/QyisbKtM3FviZLDyEoDI
         gu4wyR/GgMb0XprYLDImbSC2Z8k0/X0dP7paaQWzyWSmLmNaLdg8NpPXewbSXKDCP0mj
         7nxrbFW7AD+Vp70wUfrw+TTZZ+dDWROCMULOGqKEH536gYS/v/60l0JFBecSoeeujnia
         /HRA/KQlH+YseiVNUzxH48o+sBO89fGAzcIOuLW6k/xWopmFTaPsTG9WcVjstyFh6M9z
         fF2UZyGZoo4n40GnTm1ocmPmhFEZCLZLRoBsRTMdx7dnD2+pz1WHMRnb7KOUpEBRerI8
         tjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334888; x=1733939688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS6ldFKk8PgBT9GaTqdembmsijoMfX4VV8EOWuGbeBA=;
        b=Vx5LFJcghUeE5zNM0iKgvwaYgFtlZuky0KfvdNW+jmuEi57ivUR17Dl/6Rw0ClNF1d
         LZh0aN46SvcUTnPwiy3xD9XIUuy/gHZ3rFNyismHQkcm3V5n48xH0cqi7MNc5iWFVn7y
         ZLtZ4m8hy+qY8arET+cTnvYBXm97JFyzn6Z27+WtWrVgVGJUVOBEaIiYF5MpDM5jECCJ
         b6C4hgwUK7jyp8WSQT5e3xnZMGF0El7lZ8lD0U/q3o4bjm+nPWMrcVgsZGrD1uWDERol
         29iQvPLlkbFaqNpk4mOVucy863/5C5RblQ0Yp1gJLnmgiOVw/E8PSx8nrRyRUBprpZVX
         jIRA==
X-Gm-Message-State: AOJu0Yz0hzVjo7bGT2Yu7T3iyXSRGChez0FATlxfKB06FrIqNFgpT3GR
	GLtfw3LiPVWwE1iQ3i0NGcWq8+iuKtIp29obJ56QrNGJ7o88XRGlHtHj5FCQbu+dN6cglvhsOrc
	b
X-Gm-Gg: ASbGnctuCcoXCn7lpLt8yuEeFISbvOxK0aNrGLJFMi4UT4dqwggJToSMmOZaomRJJbv
	3vsY/iSVYHgzn/8r2uL1JF8xx0hBFlJDtfWMsEg/nJIezo7BSAhgpJXyjtBBWnRmVqoHeyWznfc
	ARVhGcek4QAp6Gs5CopH68E/hhe2Q5A/wfQtNl2seMMrhezejsfckthoxt/85eFjJWcPDQPnBu0
	BjWHjP6CefdL3HENbiAE+gyQ760tI2zXx4MpMY=
X-Google-Smtp-Source: AGHT+IHivMuzAgZ5MzI/LzruTxTjLouHiWh6XptCiXNJuVF7/DNpshR5/B6QbjSC79CV2jh+hNqFfw==
X-Received: by 2002:a05:6a20:cfa6:b0:1dc:bdbd:9017 with SMTP id adf61e73a8af0-1e165412f33mr10752158637.40.1733334888196;
        Wed, 04 Dec 2024 09:54:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/38] qemu: ignore CVE-2022-36648
Date: Wed,  4 Dec 2024 09:53:46 -0800
Message-Id: <bd01091c33c1de6ae7e1605301e3f73350ee7e7e.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208302

From: Peter Marko <peter.marko@siemens.com>

The CVE has disputed flag in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1c0e8a93f1..cc78d7db06 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -148,6 +148,11 @@ CVE_CHECK_IGNORE += "CVE-2023-0664"
 # RHEL specific issue
 CVE_CHECK_IGNORE += "CVE-2023-2680"
 
+# The CVE has disputed flag in NVD DB and also descrition contains:
+# Note: This has been disputed by multiple third parties as not a valid vulnerability
+#       due to the rocker device not falling within the virtualization use case.
+CVE_CHECK_IGNORE += "CVE-2022-36648"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


