Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C661C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34926.1788788160929562076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QSRMl+2N;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2546245f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788159; x=1789392959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PzGRD5qmzD4epxo/cFESLmiBb9azDplO9McuQDpMmNc=;
        b=QSRMl+2NgmP4bGokJ+bFme/R6g0LyA8dyAV1oSmxJqiL0untI5IQGMFvrSp26HI4mt
         hRptrl1vI8UJRoIDIg5R90uBrUVf2om8ySrGna8xqPnOPHy8c/qTOdIRZ+fQ90TXZOIR
         Vzj8MnmikdSi1JEg4QgEJxSzbaRAE1AgRaMsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788159; x=1789392959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PzGRD5qmzD4epxo/cFESLmiBb9azDplO9McuQDpMmNc=;
        b=ddxhukbQrh60WDFVMpKZLFapm0jOqmSFy2fIFl/+Y+FVUcrITePkJbpwG4FsIuLNWL
         Jjf6G3CplNMW50DhqAd5ariu+MK8amJRGec4W8715xcV5fGc3DJVRCZ/5qzLZ81QzMeM
         zK6KD2b2kSKRDIjvWzLO1pC6kD4pZ/P1/cm/Cqmuxkzk2UuCTU8vJqhiH/N7qp8nSGBj
         V03MqLC/miQGNWQfAGCD3zaIibi5RmBr+pmbxh/XX5ZEZemypveIGhSNsHQOFMVN96zS
         37ioFnDMwc68VlEhR2UIejyNJ5uG1++O1oYzGoxy0YHPbF1y8upNg34V7/InMQsAK3cR
         LmJA==
X-Gm-Message-State: AFuF++nlp49dkPlqzmWvLD8FUi+KfFtlXkIYxX/3XpOGNcHuTXyrA/4V
	mokcEZ/2NICTOzI6w0Oqote3z+5Ow+/FZfEdMlvOmJpnlgy+9jR1bK9+n7adG5aMtoHkBd111G6
	2QO2a+Lk=
X-Gm-Gg: AYBFou1ZjNl/mxlvgjR/7RAx9hDFjklsbjvX9YyWZeLDW+l6Az3lnWiPTLhGzRaiQKB
	e9hWo5myOKm3XT5WmBMc3zwxyoY9krMmiS66PJnEbDArhlOzBEImN2bNEF7XRy1o2I9FbelKA6k
	8F3iRShrPzNgilaOJ00U6Q9CsVfVv4ODdXcSMz8sIWqQWClU7yzuooYDiuIC6Dj/jjMEKedgDCX
	zeHf7xsmCy39qBd6fIl5b2o8KyeN04KRzJNKU5C/tN0Kq5iE+W1D9qAypnC6g3NdFqSLJY1agew
	6/7ac/F6dfjphM2CjxlMEqXWKLt8BEmGdF8/fMO0k91ZA7CReRxdpMqA5xLIysfG+onJcVwri8Y
	V8s8CM0pSlRPk94bT8iDwnHz8a7TiQgaFpL0/92pIb0H2Q3pWY3ajOnKB5qJ0RWodX85/CiTn5i
	/4NINDeMuWA0J1OSvLbl1GfgR9d4OjddvtmdCTa5StKfNAvlHKd6t8192nOQaYzFI3JArLYuYdf
	nuTwZNXAbMWRSG4yQ3y6jNb5S9w9eFRvYvD6gF0146EQCGZRefInnv3JjSC0dLK
X-Received: by 2002:a05:6000:4286:b0:484:416b:7590 with SMTP id ffacd0b85a97d-485872a3cfemr25873771f8f.10.1788788159130;
        Mon, 07 Sep 2026 06:35:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/35] python3-babel: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:11 +0200
Message-ID: <27c524d5c69993338612461831f7aec054eb4d00.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245273

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-babel (2.14.0)
Before -> After: python:Babel -> pocoo:babel
Newly caught CVEs: CVE-2021-42771 (locale .dat deserialization RCE)
Status: patched (fixed 2.9.1)

Note: The original commit targeted python3-babel_2.18.0.bb. This is
adjusted for Scarthgap, where the recipe version is 2.14.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 134175fa92b85e639dc4646d9a88eeaba0fae4d3)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-babel_2.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.14.0.bb b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
index cd40d4222bf..5185fb21f56 100644
--- a/meta/recipes-devtools/python/python3-babel_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
@@ -9,6 +9,8 @@ PYPI_PACKAGE = "Babel"
 
 inherit pypi setuptools3
 
+CVE_PRODUCT = "pocoo:babel"
+
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \

