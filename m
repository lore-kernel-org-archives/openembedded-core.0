Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241E9C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31377.1782853471034155374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=glwkGSa+;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9b95eda2cso2248586a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853470; x=1783458270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+XQpnw9v7TVvEBOMxphVfZW+nXOMhS750eRlXYwl+o=;
        b=glwkGSa+ZIMqHdeUGFUzhh9bdFefnsZPe4mH7wm1Xsb9I+NeYEW+lDpM0dsEFKsTYo
         pljn964HHbEuQ13eyWjsE+DAkA4wuFkD9YK+cWmI56aaiX6XpSI4Rgw0HgT9qyIq+KNH
         MAHVBf2zfjUKccBNiO70vOdspTNUTw0YxgBhK5mbppHuG+T/8sRDyoyniT65Q2rM9TVD
         92gB58MQYGG6fUbPzAG6kEEVwb77uRV061Qizp1JPk2IJ/jl/S25PfTMMPsBEdXadI5Q
         wtTDLpH5+SWGX/BjuKE/1ztrjqOgxZB6TE+HIJPwtIPmFzmHnZBIiR9VQExCUgPaakom
         pN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853470; x=1783458270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+XQpnw9v7TVvEBOMxphVfZW+nXOMhS750eRlXYwl+o=;
        b=AAERYT9NWYcJNRelcf8Jr04Nm3Dzc8os0Rau+m/sXx7Z/Aflg7sfXg7aTgcG7mAmCj
         s2+2siHWLps/7FJnykgH3g4nAU5UysxfXRT4ZMrfMWtt0ddIK4te0eX92oEO4FtPXV6u
         4qaGT5Bdz83stQUux9dU3NX4mLkggFlMA+JHnTmhNVv7JgqGLSgWGDzVeLEJ+Yn7ukI4
         nh+YWqHLlsp9gxDIqiXZZMyY9SEK06BCLX2Ll6CoD4rLtXf7PDFBVcUHd+OhUbKLwf1H
         X0Bx7g2YgmQJxyLdyKDhj3PvOcw3fTWn2qMP5k4KisgfH2culiUmuGrWdp3k4CSK3fOG
         p/UQ==
X-Gm-Message-State: AOJu0YyA3FnQYI7vLpiWw55Fk0DSsLeXn0Kp9Md1lFrEhyMnHP0qzUG1
	1R7Mtmoyds0ocvwHlLT4VTXuMK2xJ+kQ11ehQSKZQC4WUKEllpepWBz5xDW+kA==
X-Gm-Gg: AfdE7clMRB/8UC9P+Tf4prh68quVDuB/r7yge0VqmS+kH4M+cQqPx7d/34WielYyL4y
	/akgPSUsaEkTDtbQCBoCNuV2f210RkJRUQsk/OxVikX8y1XgTgiAIVYUb9+guMR4hjlpjrHpHKD
	KYNYQGhuJk7QjwzUF8T98iLNIjcu5uYhlMfH1x4zqVSnU4S+PHXQKEptoVMRW2rW80PlSx6frJt
	kiGyRY8T5eGLMA09R4wn6+UIBqneILM/8Cp+4BeVZNbqsXuO78olDHC+QnzYfjVMAfcNRXwKrdY
	gLMrY1Y8uAPr4bL5xCTwZJYq7B7jqc9WACmw7Kz/6KaqtdwdN1W3XUAucTxNsFplMQcPB0ouqI0
	4sggH7f7Z8QSoZ/eNhjwSP75MoPclj9Mlov56SjT+XD4G32MdgPKMCKlz9PyRfmlRpBFJg5+neX
	DnqY4btxyHYw==
X-Received: by 2002:a05:6830:6d0f:b0:7e9:e891:fb56 with SMTP id 46e09a7af769-7e9ec79ff22mr4760783a34.32.1782853470252;
        Tue, 30 Jun 2026 14:04:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 08/10] systemd-boot: Change to MACHINE_ARCH
Date: Tue, 30 Jun 2026 15:01:42 -0600
Message-ID: <20260630210422.1903245-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239923

Machines can change EFI_PROVIDER which changes the way systemd-boot is
built, meaning two machine may not build it the same way. As such, the
arch should be MACHINE_ARCH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index 9e61dfa3c6..c9bc3e2a91 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -8,6 +8,8 @@ DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftoo
 inherit meson pkgconfig gettext
 inherit deploy
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 LDFLAGS =+ "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
-- 
2.54.0


