Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5768C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:24 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.14363.1644184403163082510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F1LfNYBb;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id j14so13104017ejy.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwLkBYLsdE+2FitukB4SsRRFAYuo4XBOEg8u7APTgR4=;
        b=F1LfNYBbatW8EpC/a5kml9xrT1lNL0QT6XEoclHIQUjCnphQJQsPEVKgqiA4HH8vLw
         DI5oYUwfr+UuUsFAh1gWgU/fInRaZyN+dO5P2xSXcRjg1WFAYnQqbEqtnRyc9/EbaI2r
         jx7aHC/rjoOu6Uf1YPo6auwSql0uJxSngQ0pBf2ePNorPoCzQmolFMwX6Mc9mekPSICu
         Q6k7fEMw0WvEn9vRhmZEr86/QPaXUetw4TBvgEB+oj/v1Yjz46QIJksNMBngPoSSQtK3
         BexCfo7nnnn695z/+i+gZSiZwS2F9A622SHBo/w+rXWETTMuyBIAs/uXD4z2uZEK98KQ
         e3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwLkBYLsdE+2FitukB4SsRRFAYuo4XBOEg8u7APTgR4=;
        b=01vrvrkapCaUchMSaWDOU/Z//GPVZZUVoTciUFTOlsUFCZkTcA4Hlud4lANxgXhFXj
         0rqP+7C1t8irKCmWyYsj/WiMkrW0qcqf4X/Y6KYeup8Xy9tSj5v68khl8v+HoGizbmcy
         ELeRwTnC/2V50EIF/Enwj3f07O+mZloBEvuohpW5MDiwn7lrz5OKlE1OuXDL+26mmHVg
         CiJ4MskeYdcpoM+B4+cI4INwkRJC/d2vlTSmPe0yndt9SrtK46s/hTdjvNp2BfRD2znz
         b5Ab3Umd0BqRwM5tpZ4WywbZkFw3MkpsckuAQ10xX06SVItRs7d74oNhtSdtzzJvY0Cf
         1gew==
X-Gm-Message-State: AOAM532liZckuzHiRYzmPqbKSB/WHsetj2+c/+5iMEjtPhoUc1YfCWLW
	yIJ2WrXapB4eyfh5KVL1brGto0DBeYI=
X-Google-Smtp-Source: 
 ABdhPJy7EuLLiNaGX/QErTpmdUNzaCi/5kAnKGILSDl8hMrFRfVsd8whck8dbmfB+nKppWXjLuqMOA==
X-Received: by 2002:a17:907:7e85:: with SMTP id
 qb5mr7587092ejc.557.1644184401579;
        Sun, 06 Feb 2022 13:53:21 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/8] insane.bbclass: use multiprocessing for collecting
 'objdump -p' output
Date: Sun,  6 Feb 2022 22:53:11 +0100
Message-Id: <20220206215316.367469-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206215316.367469-1-alex@linutronix.de>
References: <20220206215316.367469-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161415

This was prompted by ltp's unreasonably long package_qa times; it has
a massive amount of executables and insane runs objdump for all of
them, serially.

This reduces the time from 4 minutes to 1m20s on my machine.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 22 ++++++++++++++++++++--
 meta/lib/oe/qa.py           |  6 ++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 11532ecd08..a13a947bcf 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -684,6 +684,10 @@ def package_qa_recipe(warnfuncs, errorfuncs, pn, d):
 
     return len(errors) == 0
 
+def prepopulate_objdump_p(elf, d):
+    output = elf.run_objdump("-p", d)
+    return (elf.name, output)
+
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, package, d):
     #if this will throw an exception, then fix the dict above
@@ -692,18 +696,32 @@ def package_qa_walk(warnfuncs, errorfuncs, package, d):
 
     warnings = {}
     errors = {}
+    elves = {}
     for path in pkgfiles[package]:
             elf = None
             if os.path.isfile(path):
                 elf = oe.qa.ELFFile(path)
                 try:
                     elf.open()
+                    elf.close()
                 except oe.qa.NotELFFileError:
                     elf = None
+            if elf:
+                elves[path] = elf
+
+    results = oe.utils.multiprocess_launch(prepopulate_objdump_p, elves.values(), d, extraargs=(d,))
+    for item in results:
+        elves[item[0]].set_objdump("-p", item[1])
+
+    for path in pkgfiles[package]:
+            if path in elves:
+                elves[path].open()
             for func in warnfuncs:
-                func(path, package, d, elf, warnings)
+                func(path, package, d, elves.get(path), warnings)
             for func in errorfuncs:
-                func(path, package, d, elf, errors)
+                func(path, package, d, elves.get(path), errors)
+            if path in elves:
+                elves[path].close()
 
     for w in warnings:
         oe.qa.handle_error(w, warnings[w], d)
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index efab7e8564..89acd3ead0 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -48,6 +48,9 @@ class ELFFile:
         return self
 
     def __exit__(self, exc_type, exc_value, traceback):
+        self.close()
+
+    def close(self):
         if self.data:
             self.data.close()
 
@@ -128,6 +131,9 @@ class ELFFile:
         """
         return self.getShort(ELFFile.E_MACHINE)
 
+    def set_objdump(self, cmd, output):
+        self.objdump_output[cmd] = output
+
     def run_objdump(self, cmd, d):
         import bb.process
         import sys
-- 
2.20.1


