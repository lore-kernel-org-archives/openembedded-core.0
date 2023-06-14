Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D931C3DA41
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.7364.1686734990405225341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iTd9MfjY;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-977d0ee1736so74374266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734989; x=1689326989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFB0O5yt3Kn52gylYuoA7NcHNSEKlwVuzMySc0NweRY=;
        b=iTd9MfjYNKi2wZiOZA+vkVfQC/etK4vO6whnbAv0yj6jmU+pFQQZsCPxsQV3a+NTGo
         jvYIRm64XNYno9UO23kN5YL8/kuiXtNb9/BSaj8bT94GganYdZcZJ2qNk7rTgx/HJ7Z1
         ps5ajM3873vsZUdiFVHam+aR1U6FGEKg+J5uc8EPe5tsCazptS+0TBNMhha6TedNO1Uc
         PG121D/D9JeTl/rSn3WhQuTW2kqRJSJUYSlxvIyntN+L0O/YmeL5cX/Btt6LN8sS+Wko
         324SFg111CGUr62fZ/xNsTGnuaUMMisAP/f3w8JpD6rrjCLU2/xe4dxTgIaT/Mau2L+7
         YmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734989; x=1689326989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFB0O5yt3Kn52gylYuoA7NcHNSEKlwVuzMySc0NweRY=;
        b=Hu0dqL2I7rx1+6l3cpw90WUZ2IXOPsIU0vKR2pKpwqhqcAFhHnZgNe+QYvTO3D5qli
         +Fl1W4/ApTr1bVymDCJ6ZHUBpM4bc3Of8nL34uvcN8lnJl2hnHtCnhIplqdF4SqOI0dP
         KFAbV/Mog64632oG+lGMjkuo5LBLAMMdud7nCHp5Utr5SBLS1ZMnJm3+8vUBid4JHpV1
         vRYHVASyVHpz7KMTt+C1ETgqvuRAG41RbjeziYvDGDk+YcOqqffiUd69KOjyeHg6TdDX
         co8kDngwLUXJtmfbMDWRTxfplF+moPhMpljU+fJvjctOHMu9DlR4D6nVmM507SsvMwYC
         t2ww==
X-Gm-Message-State: AC+VfDyMnm/cYzv8xLaakr1nDn4PhImZkla3AsMZfEatTfOVje/ijKwP
	ojhuB1TvjhDiQJdP9qHleemsL5Io7d8=
X-Google-Smtp-Source: ACHHUZ440uMJkjVAs0+/W1JuyR/HF4ETw7tqdZUhEsQva2dFSbylO3kVrjBFxFaX18qsFJG33sljog==
X-Received: by 2002:a17:906:9744:b0:982:82aa:86b1 with SMTP id o4-20020a170906974400b0098282aa86b1mr316129ejy.43.1686734988829;
        Wed, 14 Jun 2023 02:29:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/55] python3-docutils: upgrade 0.19 -> 0.20.1
Date: Wed, 14 Jun 2023 11:29:02 +0200
Message-Id: <20230614092918.4065570-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182784

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-docutils_0.19.bb => python3-docutils_0.20.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.19.bb => python3-docutils_0.20.1.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.19.bb b/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-docutils_0.19.bb
rename to meta/recipes-devtools/python/python3-docutils_0.20.1.bb
index 7ae93ab557b..65ca55e07bf 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.19.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=41001b296a89bb2780bbe306e947ecee"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=08f5f8aa6a1db2500c08a2bb558e45af"
 
-SRC_URI[sha256sum] = "33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6"
+SRC_URI[sha256sum] = "f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b"
 
 inherit pypi setuptools3
 
-- 
2.30.2


