Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC2CC04A6A
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7473.1686734976337868674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nDj0sfBL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-976a0a1a92bso88656566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734975; x=1689326975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etcQhOuj47H8j2Cyn5dZ0JSRS1CxtmqTdYIchOI1OrY=;
        b=nDj0sfBL6AHjUtbGKIUZ3uK+Yv51TxCnM6Yvig5ykWVTA5FgYMdQ4gBlC02EZSKPtP
         amiJQN50i0mi8Wle+E48ltEfnpZ3XFJACPbDlMSQz9b8EAMuni44HwoSRnBfbd4/JUVL
         aBIAUEAn4er5oDI8OCBxjDLl2oEW/WXBnEqKN/dQv56/Sm16zjzVXDmG/IwwosAcVyTD
         YFawd5QQU+deCrMwjMC54apYRZhFpkEyVdH1m9grBX7+iIc5s44FMeBKO8iYujhxS9TL
         gnxK3x53DOl8y8AQMvov34Ahl9TD3QjcjHEYl2v+7W22C3q4QEr5RgBem0+CQKc0PlU7
         2rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734975; x=1689326975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etcQhOuj47H8j2Cyn5dZ0JSRS1CxtmqTdYIchOI1OrY=;
        b=bswbymS4pcIAydm/uciSmuVHqsIB/ag9lE3p5bA4USAEwZMGz0xiqU/oT4hf+nWdyu
         TkOUs9taxdz57qIEQ5qf2avNXuH+TkhdbBzjtZAON3zDr+TOaTIFCdyZqmy3wdePKa84
         DNCkbDS1KpwrAOTWXypQjxJmnhi5yo9NzVJeRPiRbPYtZWmw2SrCoNFtm11zggUTk1Ew
         mpe/aEGSy/KemZ94Ww2RvxTIfadmkcET7zMeptYZyJhs3OcU0esw1As9RP18CjdY3bu5
         73kLzeQ9Yo+ANXJdIzZHL/aQZkyiHwGx1BFYa9iSuh+qzrEZ+b1ukV3ANEu89yaKFn3G
         PGjw==
X-Gm-Message-State: AC+VfDzA/EEemNO4C+gbDo5mJTYWR52+GAMwMfjAgHtiZgjT81xqcpZv
	JXWMqqFnj+BKOfV4qR1zmxvNRnBEUa4=
X-Google-Smtp-Source: ACHHUZ7c0bK2+V4yYkX7dpKbPcWPJrGqV9T1pHajRsMnPqflswvZR9ZyraquEO08fwLZfo0fNiqLTQ==
X-Received: by 2002:a17:907:97cd:b0:97b:956f:e6b5 with SMTP id js13-20020a17090797cd00b0097b956fe6b5mr16344266ejc.23.1686734974717;
        Wed, 14 Jun 2023 02:29:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/55] diffoscope: upgrade 236 -> 242
Date: Wed, 14 Jun 2023 11:28:38 +0200
Message-Id: <20230614092918.4065570-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182760

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_236.bb => diffoscope_242.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_236.bb => diffoscope_242.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_236.bb b/meta/recipes-support/diffoscope/diffoscope_242.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_236.bb
rename to meta/recipes-support/diffoscope/diffoscope_242.bb
index 9f89f35c111..4b0d518edcc 100644
--- a/meta/recipes-support/diffoscope/diffoscope_236.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_242.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "84c46840dafffe0223056718e4250ceb52484452a992b85e345e3cf8a2cf7d4b"
+SRC_URI[sha256sum] = "d858c591d2c8d42b2b29eb6d229408607b1cd8a4e7ade72d0cd002db6d1c2a6e"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


