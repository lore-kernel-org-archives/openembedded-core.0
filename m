Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C66AC4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9125.1635325668244952999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WsqgUat+;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id i9so2900568wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qs5oVX1Xqep4cm/AKnnAJh7NgbiBMWFQSAtr2VpHkxE=;
        b=WsqgUat+s4Wm+bFbTi/FAXG5LfoNxl4ush7wcA5podtzpboUUjjs/3b/mB/kNF/qqk
         g3iVKDVV/25YBqpyQ+58N/iq8Mq7tYJIXvIgqzNL+CypDPFfxNF3dXDxYFMP0Ve9yEPM
         VKKNXCj4cKUjVWVxCUkYqQkQ/+WFsE/yFa1UcIc4DdilBVd2oOb6i0p35XGHCmIkRVWZ
         vpU2Om9fBnbu3FPc5/iBJX1Wtjh4v4kESZzSRz1WAGXEdRDPHJib0UCY1MueGJsCYzTi
         B4dhtW1I3lYroPTzYa5ucyN0h2YnFrF/nUyPmO/tngviA80/3XW7beKdsP406udeTgJM
         36aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qs5oVX1Xqep4cm/AKnnAJh7NgbiBMWFQSAtr2VpHkxE=;
        b=RMdlBYG2eGe2d+uSSyJc1GWAlrSfSOvf5jYE3gHTyGwG8nynSTiqOCj+M+xH7e5xuz
         J62BAZdrMLtwEAKY97h412ni9R7faRmh4ADn0oMk8ETub6ZSzCZ1DhvjoLV8Eb6212TL
         3LZr4damlqaFNPTIPUpIhXqmQY6W5oVuSCTVlHLm/DAOALqfRjV7qHwe/VB6O7KVBPya
         tWr5cPpNr3tsUd0A6pTFbAF++Q8Wal9rTm2byWnEINSkVl0p/+5Bk4+xsWLFjYI9XJMt
         Bu9+IEq2CxuSJ+Pajjqwk5m2xkhnrR7ijkGodY9HrTVR9yh9SlByrV/aQWwGd6pSJqKl
         Nv3A==
X-Gm-Message-State: AOAM531yy5TVfeG2D+KNmLL7sTdVM3IpEg6s/j4gSHVxX2o4E+8aYS4/
	yJSJVyRsO5X9b3+p3c6VgbYuS5UEFV0=
X-Google-Smtp-Source: 
 ABdhPJy5jtoLkfjpeqCOu1S1Lmp1DWPV61vFubLKxqNqPsUr/KMNUg+6cP3B72rRLfR9aYek5efm5Q==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr657078wrv.160.1635325666701;
        Wed, 27 Oct 2021 02:07:46 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/30] puzzles: upgrade to latest revision
Date: Wed, 27 Oct 2021 11:07:19 +0200
Message-Id: <20211027090736.2546759-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157489

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 1da9bb3676..1355630cf4 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "42cbd7688a7f05e0a5d56a603a04293307c1e1b2"
+SRCREV = "ad1c6ade2af0e681fb964a17cc3a031951047068"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


