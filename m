Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03520EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 08:36:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.38499.1691742964357009535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 01:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oc31A0bu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbea147034so15223475e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691742962; x=1692347762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfcPpwOcG/y69cv+gXRtTdZxOQg4mVOCH8JN8pBR+G8=;
        b=Oc31A0buuzrc6Ucl2U0yAOmwz/zaqkIQ9rr0ja9Uh8FQ5NbpOedVcCmD3TkM82qkZd
         XH+kkIf5a8GOtc4hCScIAh0GjFW9lNz8EydvzUmuIsmyqTQ625EbZbBfEmSXVY0XAKop
         PNJUBxq5AdvTWPr6B5BIgutz9QlKzslodT6do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691742962; x=1692347762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfcPpwOcG/y69cv+gXRtTdZxOQg4mVOCH8JN8pBR+G8=;
        b=KlFiFR0CDLkuq7OQsz2OS5Vn7IPIYZ/OvmqTlrTlySFigIGq931+1Y5QWHfAAAfOUE
         eVOjp+FxV5MHK47v1XG3rlhNEK/JMLFEljAvo1duHISJE1cK6UrqCsqCUuok0RyT7Y5P
         TgJnfCryxowpoxKLiHfEIrCYFQc2myZyD4eHsJOsNEeG1fC+Vo3+ifovcdONEYumpHIn
         P69ZIfx/UwlT/TGdKQ3GMrrInU35WdXwcY0UGEMOu9FUmCgWbVcvtTH3BDIIMCyRuC7J
         a02zAZHhJN+bTy0nCtmdys3Ae+8haHakTgcO/7TosF5aFP6jtqB2ysPTc/XPSI9uf7Td
         3M1Q==
X-Gm-Message-State: AOJu0YyrAEVlseGDTGrjOwJjVEqId5dp6iuqWNIZl4S7tKc3TxyLNPgJ
	sSIMsTZjNIizkj8b2pDpmQqADPsAtQytMGfahcA=
X-Google-Smtp-Source: AGHT+IFOdSS+D7JrDbLfEMl5KbZRIQ3X7DFGuGSTeh7y3BdR4StysEDG1xIeg8Ee1flAxmfhR850GQ==
X-Received: by 2002:a05:600c:215a:b0:3fe:b78:f4b1 with SMTP id v26-20020a05600c215a00b003fe0b78f4b1mr1094260wml.2.1691742962611;
        Fri, 11 Aug 2023 01:36:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b00317f70240afsm4694439wrz.27.2023.08.11.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 01:36:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Peter Suti <peter.suti@streamunlimited.com>
Subject: [PATCH v2] externalsrc: fix dependency chain issues
Date: Fri, 11 Aug 2023 09:36:01 +0100
Message-Id: <20230811083601.9534-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 08:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185833

From: Peter Suti <peter.suti@streamunlimited.com>

Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set instead.

This seems to fix the compile issues where the populate_sysroot task was
not run when an externalsrc recipe was built as a dependency.

[YOCTO #15164]

[RP addition: The deltask was added by me in 2012 when the class was created.
The trouble is bitbake assumes 'sstate' tasks have a setscene task and by deleting
the setscene task, bitbake stops thinking the task can be accelerated. There is other
code in the sysroot code which assumes some tasks are always sstate tasks.

We cannot delete the task without changes to the way bitbake learns about 'setscene'
tasks so the patch is correct, avoiding creating files is the better approach given
the way the world works now.

There would be concerns about exisitng sstate reuse however this shouldn't occur
since SRC_URI changes and that will change the underlying hashes. Hash equivalency
could potentially cause issues by joining hashes together again however if the output
matches, that shouldn't in theory cause any issue.]

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/externalsrc.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index b00fdba8e98..aedd78a03aa 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -75,6 +75,8 @@ python () {
 
         # Dummy value because the default function can't be called with blank SRC_URI
         d.setVar('SRCPV', '999')
+        # sstate is never going to work for external source trees, disable it
+        d.setVar('SSTATE_SKIP_CREATION', '1')
 
         if d.getVar('CONFIGUREOPT_DEPTRACK') == '--disable-dependency-tracking':
             d.setVar('CONFIGUREOPT_DEPTRACK', '')
@@ -82,10 +84,7 @@ python () {
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
-            if task.endswith("_setscene"):
-                # sstate is never going to work for external source trees, disable it
-                bb.build.deltask(task, d)
-            elif os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
+            if os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-- 
2.39.2


