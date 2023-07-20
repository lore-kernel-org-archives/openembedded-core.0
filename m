Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E232EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 10:22:25 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.9664.1689848534800493899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 03:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BGrSrJdq;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b962535808so8684601fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689848533; x=1690453333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QugPQsg0L5y+8ntcQYf6mdVmAP0TiAYI1dzpiagwB3M=;
        b=BGrSrJdqnZyEafkNIFXYXuArOuxckMSUxtiOYp1N/vas+T6oCqQR2aMcrps0CuThp5
         VgaBaiLCURnkd8Ru1sn5CQonH/robFUnzD90kHBeZD9yqu3/zaLciksrVWDV9tgdM6Pw
         aWLPEPivYgGMuClTx8k51REo0LXgcWC30JtX93nhc2ZtuClCsyLOBLyfLSzMJ48WlV8i
         HoPCzsFmutPtG541ih1foSeYpJlStgUP9+ZYlUOCaZgf7jcwp5ZziuhIhlwzJZFnBq/z
         N8Kc+DxFCNqoBOpNMuT5pVwtAu24X7//HuyKk7DBm903N6nOpLmGjFf5+PyQeoTBwV6d
         CIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689848533; x=1690453333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QugPQsg0L5y+8ntcQYf6mdVmAP0TiAYI1dzpiagwB3M=;
        b=Wvuc22nlasMLur1CdTOEwEPctx+zxjQunvCY6AXyU7xrOwPeVMzrtb6kZsFEFweLuX
         4FDpMJq6l4oHCrPiDaGUb2m6fKEjgnW2zuOMb8f+o2tZDAjv44BzqIiUC/LN2ggfQLay
         Vmxz+6Lpp2SKDCdNbn5QuIvfAClU0KTzoQQ9XSJbMMFBcyLiZkAy8SmKyQrOVpKxdtHU
         40JQp5+k78tv/Wjkeb36XYc8xJ6xdAyOcsaf/NtYRekmpdmL92sRuvfAS23bYhm/R14W
         J6EmPUf92J9hrRwunYL6Du8Uq3XnA4wz2yLo/I9pfCTZaft+20bvW1jgXbiAXcOKPGgQ
         5nxw==
X-Gm-Message-State: ABy/qLZW/CmG6i2OFRK7q/rT6kW95PJgvAtz28Upc/dBdnc1zfyLMmBq
	mIKBMWREl70OmRMAh7WvE/r90ReVdfc=
X-Google-Smtp-Source: APBJJlHHFl9vCqkx/eSuDliL83ppL3idYf8bVs/OxvqWOIbpWG4eApcj8uUD09uUK2Ivy7TjlQUd6Q==
X-Received: by 2002:a2e:3c07:0:b0:2b6:daed:494f with SMTP id j7-20020a2e3c07000000b002b6daed494fmr1435183lja.35.1689848532563;
        Thu, 20 Jul 2023 03:22:12 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcc0c000000b003fc0062f0f8sm841604wmh.9.2023.07.20.03.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 03:22:12 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/3] rpm: Pick debugfs package db files/dirs explicitly
Date: Thu, 20 Jul 2023 11:20:13 +0100
Message-Id: <20230720102014.11236-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230720102014.11236-1-alex.kiernan@gmail.com>
References: <20230720102014.11236-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 10:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184630

Rather than copying the entire /etc hierarchy, specify the pieces we
actually need.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- New in v2

 meta/lib/oe/package_manager/rpm/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index d4c415f68cad..3ba539632063 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -110,7 +110,7 @@ class PkgRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
+        self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
-- 
2.39.0


