Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4F6CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 19:14:50 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11919.1762842663932996301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 22:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASVi7v7e;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: saquibiltaf@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-656eb0b1294so1166127eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 22:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762842663; x=1763447463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBYAxhk1w7qjCCoVrcNiPGjOOHRz1+X991rReKzMLIQ=;
        b=ASVi7v7ebx5POoLfZowe4L/zqjdUQI/wtEogoPSX+JEj6vIB9sk7iupL8WJV8nIaes
         Kqt+gVAc+FLKjTPZb9mICAji/t4LNZLiQlst9XnSn1mO9Cf8jgE3OXyNrrNrEq+muOsb
         flMol3YKkNZ/pFNkfmtYtEGs+laurNtVZo6ifJr589ow03DHN+nfdk9ElorOGPl3lkbS
         74SS8vkfPqFP0YuNFVDbMa+YYBBPh17TOE/k9kPR8Xzt8UZxqCjtPnBUrT9NcTAASDRJ
         fsknMesnr8rRCBbz1MGin9y0I/ODjOMuP5TID8cWvY3e2T77Srw1LZH1y1nQevew2b3u
         5erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762842663; x=1763447463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBYAxhk1w7qjCCoVrcNiPGjOOHRz1+X991rReKzMLIQ=;
        b=VJilTT7L3enTvexZO/ER49CpHyrutqCh3BUF1h7MXBn6QFJ0eQBVlJMbwu8FofY7xL
         nUSlQh0xXn9yrLxsalq4ENAlfaaZ0GDlgr+5zy3Q6D7m/7OPoldEeMjE311OEuHIcxuc
         S3VIQhx8HxwYhmoA2s4IQ3+/Pk2+X/MLdTaEA7uChp/66KU+Cijyu23Ps9NpZsX05S+C
         Hm+31Piw6z0m4qcdlgTIUjmVHkdAHq55tv/wMyxMxLcd+431bnBiG/Xhc5D8JmMNrtDI
         85bexZRLqVtbSpZRGvFvNRMff071rAL/CBovDGmRdSObwcfy5rRlimbChKvNMi/hmx0+
         4BoA==
X-Gm-Message-State: AOJu0Yz7pObKUVtRTxCX8w2uW3aZdUXtmXSMyIlqjHVBmh8Oxb8VXIU8
	ISYqbnZg1ysrqNTf+K1ZlHrk1toG7RQqoDYxVT2PMPM/rmwSzTwn5r1n0J52PQ==
X-Gm-Gg: ASbGnctWQW29mQHv+UWyqBX0oUiJvKi05hDw8lnu/YnYc/lELsU/WfbSNvq+DXSz6tS
	/CL4Txm/Zb8LrTPf/tyiju6gWTqd0mru/AKOnA4TkaaEjadbJK6hT60ONFZ+qlTJzfog2it/yLb
	VsKAksH/jWtpUoXf3HvyiR/9E7yruW4M+XxnytdwC6l2+Q2+t0y26/+1Fegko8pLclLNMBvklkA
	wO1mhg8be8ttsjz2zOBT054iNPsi+gxw63ZNnJ4EY1KzwJpMt+ajBbx48f9yhxK680zY5otFVkf
	S5/Wk5tsjwiE0nB0so8bMehjVTOMbCv/dFHkHL1dSBMLzo8rfUq1OSzAkJFmj1uhQ7ThaKlWtad
	E83286DI6lxyxVfKonA+i4MBmkgT5nptXzShvkvJYlT7Tezgv0JRisMsROylf20CwLwhCweyqpM
	t8AfHaV/9qtQ==
X-Google-Smtp-Source: AGHT+IFEg2TVAv1I6WGzfBvb0vhEj+8LDrBdMYN0mEwbLuQRDgnJFhtxTRwArSvAXd6iHCmqyQb5TA==
X-Received: by 2002:a17:902:da4b:b0:265:47:a7bd with SMTP id d9443c01a7336-297e53e7ce6mr125492445ad.4.1762842171495;
        Mon, 10 Nov 2025 22:22:51 -0800 (PST)
Received: from L-18433L.kpit.com ([45.250.227.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968602sm171031885ad.9.2025.11.10.22.22.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:22:51 -0800 (PST)
From: Saquib Iltaf <saquibiltaf@gmail.com>
X-Google-Original-From: Saquib Iltaf <saquib.iltaf@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH] rust-cross-canadian: Ignore CVE-2024-43402
Date: Tue, 11 Nov 2025 11:52:22 +0530
Message-Id: <20251111062222.2870876-1-saquib.iltaf@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 19:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226189

Ignore CVE-2024-43402 as its not applicable.

CVEs are specific to Microsoft Windows.

Signed-off-by: Saquib Iltaf <saquib.iltaf@kpit.com>
---
 recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-devtools/rust/rust-cross-canadian.inc b/recipes-devtools/rust/rust-cross-canadian.inc
index 50d9e6c..0a87c64 100644
--- a/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/recipes-devtools/rust/rust-cross-canadian.inc
@@ -15,6 +15,9 @@ SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
 S = "${WORKDIR}"
 
+# These CVEs are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-43402"
+
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
-- 
2.34.1


