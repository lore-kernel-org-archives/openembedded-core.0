Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F06C433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.34223.1638006849620849489
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VshU9VRB;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d24so24124511wra.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3zCE1N1qJSgogZLdW7x72KnbCVEfnFkNR2/dul1rRzI=;
        b=VshU9VRBFwfaUHPirtqTRvbESeV7RU+e2cDELBRNtMgD4jYjynSzW5rzi29L479/fJ
         DPYKy5rMBtnkicP1/J0XMec1otWEHvPz9FMiys7KjDl971ZIqWIA7/bgXmhPv+yCYXIM
         FV/k5WNhKzPOTg8thlP+6RDA9imrVKLdzH1EOBzFe0PltoQIiwFdI5nZV+Acyx4N9CbC
         JaAeh0g/42lYsLYiU2/wyhgxSNPEOnPZyHXGby6oNmmIN2ULM+/N/UItf2NTpcpX73RZ
         zsKIPvYNEQ6L/58AsabwmZPBSBQe5NGDvXOHI7mxWAXWbDw19LLi6YiXQOtYhZ47/G9A
         Tn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3zCE1N1qJSgogZLdW7x72KnbCVEfnFkNR2/dul1rRzI=;
        b=xsh0fgtxl4ibqCVE2im1cFD3qV4Tp7fp/9yu25dcWh4Inido2ewVaNVt7xLePjnXLi
         eMiAjpAW4qxMVHzK3OdQuPbi6ut1tcEq3/L/aYMDKnOKulKesV9CJ3m9jZ5bLVgSFsIO
         ODl9kMtqcFvZd4XWk2eSBec/T6V4i9c9MkrG3YiQcgQUsjZyfq44LdlsjSJB8Z2ii6AI
         txAjx8oyTj73cOvu0VuLMLcGKuyQ3ciPS/q/Ge848R8YSZP9FKiAd5qNeVUa5v9+Qu2d
         CAqEFI0v3DsMfIhJe07ucQrC03jvmtYlra9HN6W0q3vUmQppPLsJJMb+B6gdEULeo/JS
         0cBQ==
X-Gm-Message-State: AOAM530eZ5zVcxPDQLd51nXwRPwgreqykPm6T6oiDQ0s0GNOZoXoICva
	Fg+FaTAg+V05tjBq+f2m3IgfGXjP826wRA==
X-Google-Smtp-Source: 
 ABdhPJwaGYr0sbkHa4PNAsoRzU9dPSe2B/c47aLdLGUp45l4R8M9QukKLsoIezblXJiSuv5abzOjYQ==
X-Received: by 2002:adf:f40b:: with SMTP id
 g11mr19378424wro.296.1638006848083;
        Sat, 27 Nov 2021 01:54:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/13] insane.bbclass: add a check that Upstream-Status patch
 tag is present and correctly formed
Date: Sat, 27 Nov 2021 10:53:45 +0100
Message-Id: <20211127095357.1748429-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158850

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 27b1a00fb9..240f3aad62 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1167,6 +1167,30 @@ python do_qa_patch() {
                 bb.warn(msg)
             msg = "Patch log indicates that patches do not apply cleanly."
             oe.qa.handle_error("patch-fuzz", msg, d)
+
+    # Check if the patch contains a correctly formatted and spelled Upstream-Status
+    import re
+    from oe import patch
+
+    for url in patch.src_patches(d):
+       (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
+
+       # skip patches not in oe-core
+       if '/meta/' not in fullpath:
+           continue
+
+       content = open(fullpath, encoding='utf-8', errors='ignore').read()
+       kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
+       strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
+       match_kinda = kinda_status_re.search(content)
+       match_strict = strict_status_re.search(content)
+       guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
+
+       if not match_strict:
+           if match_kinda:
+               bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
+           else:
+               bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
 }
 
 python do_qa_configure() {
-- 
2.20.1


