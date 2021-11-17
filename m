Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D81C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:51 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8688.1637163350544310451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=madvhHA5;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id d24so5578080wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3zCE1N1qJSgogZLdW7x72KnbCVEfnFkNR2/dul1rRzI=;
        b=madvhHA5r4lgGXPCMD6cLVTpVAcnZHYzf8ilgaQyV94Vu0zllYXNykPW5kayKFrqkQ
         AQTE7TnXESLKkljRfZiQ1qypn0cttU3GH9BpbeiNAjpRZSCCa6I7RAzgSUuQP0l3aARx
         aDBKoamblalagxvCWh8ghhQ+xb4dtEafn70mtBJH2jJKNQcnds4x6QXyojMsSQA3yIOU
         uxNQQpPtnHk3HcsPFeAa6EdHAF3oDoSzbgsXVI09kZ+Eq+0sWT56jBZ8XHtdyoYdClK9
         9dQLHShezA6s6qtAegYlYscL4To5S3P0wUBeqrtxdlOfC9TSX4aXWCAATFK+vbaHds9t
         ELpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3zCE1N1qJSgogZLdW7x72KnbCVEfnFkNR2/dul1rRzI=;
        b=W0+N3bVFkmRIZ8EfRN8e0cRcdwKH8GxcDOHISTda+GTQ7HwhCX2/BGiEsWC+5FrGB2
         QmklgPBwGRo6xo329mpQoosdJC2ycqO1UxVl8jvJpOO84PuoSltyjXqYW5TKe0Ixf1km
         0nKiWIfmrblTl7rix0spDVJejfLSgwX53J0sEd0d9lL6zNH774XcL4RRkunP2eD6Nb0C
         NbijTTb3pGUbCCEUWyzE3NSrejiVy4av0VClXlsId5UxW3pUbwE+BSMSxJFbuSWheaJE
         oAf08xRH9CerjiRBan7MPUSgo96Vwt2s0n5FYPklwyVAwHzfgHXkN7Wk8jvQGk7nrpfs
         ZwrQ==
X-Gm-Message-State: AOAM53100ESeKz6CGAkzswirH2T8jdOPAbks9nVjywNHT9qjG7yjjV+/
	EJlXSyJzJ+c+YD+lEysCparQ5mB8nRQ=
X-Google-Smtp-Source: 
 ABdhPJwMaZJZYhufUvs83ep6hynOag6lHfSEl55c+FQJd9JLtcHunKgS2pn5RGf9p9kFxIL8zmtGAg==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr21717507wrr.189.1637163349136;
        Wed, 17 Nov 2021 07:35:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/36] insane.bbclass: add a check that Upstream-Status patch
 tag is present and correctly formed
Date: Wed, 17 Nov 2021 16:35:21 +0100
Message-Id: <20211117153525.257146-32-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158427

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


