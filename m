Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896EFD4A5F4
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 15:07:34 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15760.1768748846549467939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 07:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2vpMUNm;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124566b6693so2644537c88.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 07:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768748846; x=1769353646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Cu2xyH7JAmego4ZNQbbNTBXClGWvJC5nDELJmQZylA=;
        b=c2vpMUNmHYTPMvH31mBBtMac0Ww99sucIhffjk1hfyhFBPqqqFImlofg1zDx10YDj6
         i/CqxEsHakBfNx69LS/rFR9Z0M7MnKdYzTqBnjYzOHjn+CL/2um4Bnd/e8fSkEIkiLOt
         zii4bTamVkmQ5JubCA1KFAStm5IOdM9fXpaD4iQsvil8E9JdE4Qk66vL0dt1DglHKoRR
         Vt63oTg6A7yfOXl89Bs82WJ1Hdlx4oHd6iM3Y+smA4VMwTCGK+EDCttDE/fsycyCmWcH
         cUJU+n4DHVhUDD4nHhZkKEfao8MGWQLpNG2APAoN97TD7Dzu2vA9BAnFiAynorAXqSRm
         pNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768748846; x=1769353646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Cu2xyH7JAmego4ZNQbbNTBXClGWvJC5nDELJmQZylA=;
        b=RpVyfbtH2ErX89FuDO4WBBhsKbbpGLQgIzKODfqqlyATGtb26iIxx0Qq+Mp3RU4o/O
         9QeqpHpe838jR2+TvNzSql7j1RIO7KGSPjLvoVxGH5XdmuQCfl7m7FO+B15T8YRO79hV
         DDIVwlDWqBO//EqfRjQIfJg+lEHyTht4rkSx5/hXQ8xLDsc+236ofG/ZtC6arNj+hvwT
         EZo+j+JCTFmi0WX/vhvAFQ27PRQ6kwm66/3xOFaSd/e4pxnhVm6rJ9h3uhcQuLTPcn8G
         JhpiVQvmFqNr/r5UC1V48bB/hyoFcUltxtf0fkE124/IKVO9Jm2dgwTE0wu6YRIh3hoe
         4bmQ==
X-Gm-Message-State: AOJu0Yz/Z3jGSzvrJ3sqGbKqCOShmsY4d08Hi9KGz5RvIdDLGTaPBvXV
	tBo5mSna4XMSv0L8thKnPZIg1kuG5SrEfgvmlkjlnK0fDTyoWjKiX9g9cazYgw==
X-Gm-Gg: AY/fxX5i9gFE9q90bmIaVdGxq+KQoa7lM7swTK736LHhsGY1gT8X5ub1g7llI7mjhil
	mWPJYhci2+6OAd6hL/A9QgGYNqIdUMlN0GeXukq5Ybs8g/tOKTEZtB1Urkfhi3ta9uTLBuEQDg9
	YRwp+mbRHIujvkiH8vRzL72Gl02CTbZCkB33Z7WwRDrzhsvwK/dg9BBPAjnvbmlFlM59b7bCKVb
	0C9Z7L1w//OHXVJXNNjTZK60m5J/0mXAb8xWO/7OoEDP2pknDCMu9occk3dMDLyUFgr2vDqcHcu
	kg5FnGC8McKYO1ssGZEX7Poer/29ZKQt2cARy7miyBU1byUHKn3dVmjkZpHfTb5CH1VCQ2usLRg
	voyvK/rWtrOnCc5xJmYh3e79RZBXXd7QGUW+KzYQ1O4zRJehJNgE3dFgw0YNrAY7SqQMfDkp9uZ
	Fm/CNtgm8geiHsTBF6IkPnidq2ccBY913kCgthh55oJN77OBWS3gTGR7RCJ2ODBEVJCQrsbXRWX
	vlSid/GbVwedGDo+iqQwdBb8jsTqx+rL/H0P80bVQ==
X-Received: by 2002:a05:7022:2386:b0:119:e569:f277 with SMTP id a92af1059eb24-1244b370588mr6250484c88.32.1768748845607;
        Sun, 18 Jan 2026 07:07:25 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefa7c5sm12274637c88.10.2026.01.18.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:07:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] python3-pdm: upgrade 2.26.2 -> 2.26.4
Date: Sun, 18 Jan 2026 07:07:21 -0800
Message-ID: <20260118150722.2045208-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118150722.2045208-1-raj.khem@gmail.com>
References: <20260118150722.2045208-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 15:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229581

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb b/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.4.bb
index 13dd1ec0db..de4a7618d4 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "98207f8aabd6913a25ee0b4985e79e1652e2db274915f3ccf9408e33191ede4e"
+SRC_URI[sha256sum] = "d1030f6bd8e9449b5791e7768f1a856cc54617ee7b00f56fa1a843a84ad77f6e"
 
 inherit pypi python_pdm
 

