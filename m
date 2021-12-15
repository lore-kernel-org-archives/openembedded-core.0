Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700F0C31D68
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.2676.1639608041514264002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+bBOo8X;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t18so40673544wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6sndoN8aXGQG/6tzI2o2PP/ipeqlTsQIn11B+PdQCI=;
        b=Y+bBOo8XRs0wJmaXFiDaRC3SMCT8lEHmroKHkYJasbF35IWEw6uzBDfFl6XMXHgOO0
         fhSr09RjUSF4PurjuNzyEeRdng7epHyMXg/zQRLjNhQagOHfS4yJWxIOmfLFmm7maQVu
         LqGDx04fnZST0C3iQMEHFHs1EgHpYmTdcuC8IR7qWyj8T/cM39q5awGNblDQOT+Rl771
         ISiPzETwsJHho1cufd4l0lTl5FbjCootgEOAqezGH4TLUzg+OsnXaCPifSrTPvLTI7NR
         SbSQCNq3MkV0x/Vm9lh4TOIZqIZmOdrE37PvPMI4bo0KnIgtcW4MynXTHCff4F0Teirm
         cROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6sndoN8aXGQG/6tzI2o2PP/ipeqlTsQIn11B+PdQCI=;
        b=Tq7O47fJ6XJlHVbvWhELK1hMwlTKoIqEM9ML940RvM6kh0sXJRRLISPHtMkW5A6tMv
         Jglc22c9H5QC6a5tmbzm+qFINBRVKyZMXINxLcMOhsvqJhvGdJOIllN8VpMqKI082ski
         j8UNh410fp9EwbmLGE5BWPaww1q0iLwl+Pz75EVPJ/WxHXoQiMQToOvoOOnBN9vHrnFr
         eEs4vCcNETvHxQ51DdVwyeRN2aRrsEgbErgntLt6dRyJ/DY/WKFqAHK6mcZG9mjSdi/a
         xreQ1TXYK5wx3GWJewXN2TOqkLe0OWPwGBIK7w0aibzu1iquW1yRF6Dzi4h1esq2uTJk
         O6ZA==
X-Gm-Message-State: AOAM530yadPgUwBD8Aw/DS3Jygs2iAFMsGDr0MMSrhe6pocw3rQd0i10
	mcaU/ZK1eWEtKp8zWKiDK5MhuMUiX6yNUw==
X-Google-Smtp-Source: 
 ABdhPJwEawldKn+612r89FU7mudvPV4Hy9yKQWAhTgeoRB2el3EkrjaAvt6Jze9562LrWbkTV7ZDZw==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr6241225wry.358.1639608039716;
        Wed, 15 Dec 2021 14:40:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/26] insane: add Inactive-Upstream to possible patch status
 list
Date: Wed, 15 Dec 2021 23:40:09 +0100
Message-Id: <20211215224034.1814148-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159743

See https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..de6d65c809 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1181,7 +1181,7 @@ python do_qa_patch() {
 
        content = open(fullpath, encoding='utf-8', errors='ignore').read()
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-       strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
+       strict_status_re = re.compile(r"^Upstream-Status: (Inactive-Upstream|Pending|Submitted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
        match_kinda = kinda_status_re.search(content)
        match_strict = strict_status_re.search(content)
        guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
-- 
2.20.1


