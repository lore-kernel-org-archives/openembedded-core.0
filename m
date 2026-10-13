Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02CFCC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 14:25:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8550.1791901496384836921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 07:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=K3SlOrKb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so25624695e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791901494; x=1792506294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9teO0oiu9zIKm1vpCmePBYq8G2DCaSFspUSeaz6dMx4=;
        b=K3SlOrKbLsByat8NF6eTgNdj1aDWrIa6nXAX0FMdtmWUotuwfUq7xYJzV7U3hs/9dg
         EczNw1gnX+BkzKg1Xl7JUNGUtfQ75yTsV8Vt4GSLm4sMUqNZDT9qJZl4HJESObSzeRGS
         L9qBFRQADJz8BCbDanxKuatP3S1tYEj8QRlvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901494; x=1792506294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9teO0oiu9zIKm1vpCmePBYq8G2DCaSFspUSeaz6dMx4=;
        b=GWXQtCW+0+JbgEePFYFU4Xd11fpdrykKMNKywXfb1CWsQooF8sR+oQbbh7pHDcYm3U
         Cani1UgMV/P8LSUPZ90ROc7SpsMNWW1kILRaWwnmUiHPwP1LvaeJDBU87i7I5rUwNJEE
         a5uoQNdJTL70wXhuK9Qj98s50/QTO+Wl+t93W0M4gq3j/SZh86RKKdI8IvfjfduZzEiT
         5PbkcPQoHTlwBr5uhfF5rUnwkAHDmObOFqnoEgQv5DM+6wbw5hCLeKcFbdNPvzczNCbg
         2E3dVE+B/gv5FYMBWfSwGy29+q3wGSd6NAvUI56j4S7W/AOPmZ7VtOUpALxCTz8px79/
         VD9g==
X-Gm-Message-State: AFq9FYL+g7+hXQ+CtZaNuk4Djq6/YYvz+6lq/p2Qki/OwLbLyiq2HQ7q
	DEzTz5dyhuFBJpk4I9y7ywK07+hIMowHhJD2B5orzXF7YY0v1ebcFR92VE2zdIVzD01IO5kUdHz
	yfgg/
X-Gm-Gg: AYBFou3wN3eBF5twEe0udCHaeWskLD+oFotunfDILsiRWBJ4PIruEJ+6zq0sO/eUTGY
	4O+n/DthxDoq/jxCsaGi80qCCJSfoPkYH65jN0g7qlRNECmHJ1NyjFECpAV3XuxZWQLj57IUL2H
	2cQbeNKZVLq6JTEX10uFOPHMdnqsXi8mFrFZATb4/y4+XX6vHNcqarH1X7l7gif63F+NzvR94g+
	yu/IgnjXBnNex75kdSrSt5nTpPWwN03XIYtGy7SmCjKiAZ0LZjm3SUktrTrgmKr0Ku4KAPKE4kF
	Xidr4RVsUdoZh4UDOBeOGCk2FBofJ4C7PoJ6CwWFhtfg4tVFeO1n9xGLM4rxF0tOtIc7oKpThdg
	gZ3iKP1hS1DNs90kwEGVr3L0/PnUGdq0CCcrCTIUsbC0/BIoGCmhf47WsiXSBxYOXce0D17U3fG
	WL5c082zroVX+OWVYAmisnBaPdEFsx0UfftkhPaEICCZt25UcMbtRkOhTJLwPiAKFLBcyFppUIc
	e4fdRgi4XSNME25Qioh3HvaxAKjhX7TrAXsMF7T0+75A35ya7AdYCFaIxC6PiUTgHZ1YPG6B2d+
	MdBhmfzsQ/cmJlTQa57mgOQ=
X-Received: by 2002:a05:600c:8b58:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18e4ca287mr223933045e9.24.1791901494285;
        Tue, 13 Oct 2026 07:24:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm473009815e9.11.2026.10.13.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:24:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/2] python3-testtools: Add native
Date: Tue, 13 Oct 2026 17:24:49 +0300
Message-ID: <20261013142450.2456130-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 14:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247727

Add native to BBCLASSEXTEND because python3-subunit DEPENDS on it.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-devtools/python/python3-testtools_2.9.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.9.1.bb b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
index 31809fe1ed..d5dc148756 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
@@ -16,5 +16,4 @@ RDEPENDS:${PN} += "\
     python3-json \
     "
 
-BBCLASSEXTEND = "nativesdk"
-
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


