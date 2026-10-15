Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6021CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32829.1792040638044184044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uHX4ofxM;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so38966705e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040636; x=1792645436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N4mb3exRhET/zlsVgYFdva03LbSPFF6299g8N0aMv3k=;
        b=uHX4ofxMMUmVT7JG8Bbg7GWh1h3UBhadqpgQ/ksv49FJz/HT0RZ9S8qj8dR8nypRDi
         K9H/N4xsU2T1X5UYm7uu+3zmVdOlhv7jdmuL4lyNSvoSGHd2mHpQDJ+Qrcc/DdU3N7Xy
         rpc3dVMRwkeZZ2gHWKVsD3oH/Pzm1R6gjcX9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040636; x=1792645436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N4mb3exRhET/zlsVgYFdva03LbSPFF6299g8N0aMv3k=;
        b=cXu3o7B/kO+yGW9xWSNoYHt/PFHkYyak8t2fw6n6Reg+lXNcdjHZ0oCgjdT2HDlkiS
         ywtwnx8cAfnoAu+b2NOyUq7huFSlInMy94mf9UmVxwquTJNPGdlVow/cSPUfo3a2Q2KK
         jtHFcq1gvod9RlviUonYUOWqaO4mBn5sPREnmouLwiQUwAlcoTiRn4XWNUQXpIEqkHlr
         J9QeHxglN81Fj8+YS23vv6RNSR79Jccve5FUO923+RQUuswAqwVkQaI1gMGZt7IPAwnX
         LHkL9hG/Qbk/qGSMBlrE1mb/r4N3ZzzSG67SbusOX92Ged2aRWtxMLwBTT2A/BOueBMx
         BKLw==
X-Gm-Message-State: AFq9FYKP02rZ6fkfMxfPg+EgBrgSmQg8mcmsW2beBFS/pdqVfVEGRLVX
	m/muAeqZ43pe1QTZeAsYHemHLPgsVxiCguIPclYKfQFzG8G7FluYiY8eDfw1LhhtQ8JbIY2fQkY
	l1l9UNaI=
X-Gm-Gg: AYBFou2SABrzkOYG8UaUq+MIc3oQOVBztdYYJT8uiNJCMjVXKof9mCMx30lrLywWcWu
	YLc0hhV+cJHC2CckNEcz/tDyGAJ0TqQwVsXLG1jv0pvEIKwrkzO0hNsltDmfxGhwlDLNvdztHHg
	MVXO7WZeETBZ2on9IypwA4NX/9ci288N49IQ1nwH4cLNAo8TxPzWGxnY6M03RR1C3/CHiB6wlif
	xmA5zrdc7EkdnxKFcOkQhfuDhNlNxaEycCh8F16m0BOZjN1k5qFHn0tCqlvuthfAHEjSMlVtgmD
	L14jzh6J5KHJb1QTCKWiwRhscW/d/9UpLp5r/jneSDhaek+V3y77zI5VGjNZZSYeN/DPKBZNLXH
	FWXJLJQtB7nmWaRzHEDrXF+/2bg2UZa2Cm0umPOyw4OeosTPxK/yy27vTsmaVTS2MUPB5cTdlae
	MYCkPDJXPEapBnVwjIUw8IL9bqf419zX5yQWpkKoc9WshxG1Bi+gSGlRyqB8RuKDY2EqKf6bJjO
	S5FGmee06w34VT0qJT2SHIRhbjLbHEiMGGljyjW0d1TnppU1bXxHGgXwulQFGJuxQkfNU+b0FI4
	Niu+T1xP
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a18e4d2b31mr362665665e9.27.1792040636307;
        Wed, 14 Oct 2026 22:03:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/55] vim: set CVE_STATUS for CVE-2026-51401
Date: Thu, 15 Oct 2026 07:02:51 +0200
Message-ID: <df8f6b0403190429cc424638e26db1bfd7b9f53e.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247826

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51401 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51401

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d5fbdd0a590..f84d2a9688d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -70,6 +70,8 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 
 CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
 
+CVE_STATUS[CVE-2026-51401] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"

