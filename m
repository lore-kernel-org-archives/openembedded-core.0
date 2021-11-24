Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87339C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.3409.1637741315840998740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=etIZCdLP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so3503206wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3zCE1N1qJSgogZLdW7x72KnbCVEfnFkNR2/dul1rRzI=;
        b=etIZCdLPx7mkTCp/VLyjUuk4x615ZXZ8vln+F9YzFZVZloIqZ1S6Z5+AtNCtcyJWAR
         eW71P7/F5ozzLF/LC+11uginqh18HC9RjwLIxlCbuaKwAuL6VkAZKqVKpvvyxVOhmC0g
         slri1ZilUBlu1yMmXbOfmkiTT9dORVeDqx/j+9EGtnXutM25UyTcZXXMEWWIEyUfskZG
         Q1lwPV+dJf7Q2Rsdci13Klb+yGbFYYfD6Rq8b3DCmEMdgJ/f2X9c9a9OpvCz6/MO6hU4
         qQfgNqMuH6FoK6RC4llx2AhpvM8h14yt499VHILQnW/hgE392QEVzMvUOZPiRg/5muIi
         cxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3zCE1N1qJSgogZLdW7x72KnbCVEfnFkNR2/dul1rRzI=;
        b=fRERyG9ranj4vS/IsnDNca+UTXQ4HFJYHoH1Xm13wgRYzAUUUX88Wp5GQl1U9YN4O3
         S7zI6WmaTmkGbPe3GxPZeKAjCLhb2aoBSidddSJIFR76TY1/yXwpZFsUP+maKJL+UXTx
         vWeyZWx3EyA1viTdTxNM4k3TdnVr7Lex+pXI68EhMyPXBpGu8WPfXYKjHcDfpyGVoBFf
         QzX38wu82zaf9uGWofFiiywKyo3S0lTXqDnPLLMaW8OT04gswiIYBfsU6alutPEjEz6N
         yNUSc94gKEsynIp/OxtAEqwQtUgjk6qTcz0co8MU7cYjdkbXSR3BVD8a1yup7wo8lyj/
         Rt2Q==
X-Gm-Message-State: AOAM531EXnl8Zu7CVVLYYN40G4XxnUXoFbJ46LBqeIJZpaZJivY+M/Nc
	VdRDp7Kw3nVvrDcj9wevB2EJh4MhL8PvIA==
X-Google-Smtp-Source: 
 ABdhPJxjmofZYPhCYm9Tq8RiflTyWQ2LfMmD53oNPffcmRYLwU92EyVzaiNOPXA8wHOn6AoM/taWBg==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr4577288wme.72.1637741314397;
        Wed, 24 Nov 2021 00:08:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/21] insane.bbclass: add a check that Upstream-Status patch
 tag is present and correctly formed
Date: Wed, 24 Nov 2021 09:08:11 +0100
Message-Id: <20211124080828.530981-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158660

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


