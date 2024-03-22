Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4670EC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 13:51:01 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.13762.1711115452925629946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 06:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nH+HlBJb;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-366c6170706so10097355ab.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711115451; x=1711720251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+TGu6CtpX6nYAWm+7lm6A4IFuqTJIekuovAx30q5qI=;
        b=nH+HlBJbz9ebjWS4WCNi8wg+sulfZE58tsbPAgN3+UtdbJgSey7Lf6OZ8R9gH5dG7z
         lMg14Jy9qOfHaFbEKmp4SvmF8gXuIPliMohB1FK6m6kcIKHtvA8nNdrUu8sWvPFQxeI6
         c/OSgjLQuZKyefq8UIInM5z8IwYDFtyUnnLuwwOaqr551q5V7FRQhX8pHwBx8AZK9XlH
         n8Yv8v3yelV/ll9kMK54Cx1geflJeRUjePI9GejfQLUt9Uy73N0y3R26wduUiuWDeeQB
         4nTxVdA5oF4iDH8Sy3cLdJrE++rLFkg3qfj97TCDn7FEyzXKnOklMoTaTGg6+P5J8zPZ
         q1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711115451; x=1711720251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+TGu6CtpX6nYAWm+7lm6A4IFuqTJIekuovAx30q5qI=;
        b=Cq9Oc6sUmRpjgYAdCFMEhJo+oc9awNmuihXI6wQMCJoxEzQPYe34ZexaV7gRXio1gL
         Cqm4DeCy66qo60sSPg1I8fSbQMDSaHnDkIrNoWLGQ67E/JiKbitjflJUFwgGewC1McCD
         gCyTHC6g/piOr3sm5/fNqwQyWoJftfoxmpG5Er1q9lAqRDwXZaSDt3PSqY2u7ufTR87H
         I+y4xyh87IMhmYhoUMJG5DEKPH1j75d+iD6Jg1cVVT8rYSzQzYzqVclHFOWzwfUwuizW
         UJsnxXDveZrPCq+1p+AXKpCcQDv2K4SV1R7sZBidjRlFlqkXUtLejrZSiaONo+xI9VAJ
         4pmg==
X-Gm-Message-State: AOJu0YwRQE0kMSWPbRpbVj33323Suv+CHEQmZ3S8jV1sb4Hqy+Eyfs6S
	aHW1KJzU/v7KAI4ND06HftpZ25H1mCqb7LTdGdDSlLIKegQyXgtP6P2G3pa2
X-Google-Smtp-Source: AGHT+IGUz9a8rZdotISbP3MWG1xAfr5DAmsEc5daCMv8ovVDnv5JGYpv6PhIOBp/BCUm/nvSFsm3gA==
X-Received: by 2002:a92:d448:0:b0:366:31dc:ed4a with SMTP id r8-20020a92d448000000b0036631dced4amr2788818ilm.13.1711115451530;
        Fri, 22 Mar 2024 06:50:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::dd43])
        by smtp.gmail.com with ESMTPSA id x3-20020a92dc43000000b00368521be73asm582471ilq.86.2024.03.22.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 06:50:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Set hash server credentials from bitbake variables
Date: Fri, 22 Mar 2024 07:50:47 -0600
Message-Id: <20240322135047.1113840-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 13:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197446

Allows the hash server credentials to be specified in bitbake variables.
If omitted, the users .netrc will be checked

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aa891ecf0a0..b867e2a0529 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -6,6 +6,7 @@
 import bb.siggen
 import bb.runqueue
 import oe
+import netrc
 
 def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     # Return True if we should keep the dependency, False to drop it
@@ -327,6 +328,16 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
         self.max_parallel = int(data.getVar('BB_HASHSERVE_MAX_PARALLEL') or 1)
+        self.username = data.getVar("BB_HASHSERVE_USERNAME")
+        self.password = data.getVar("BB_HASHSERVE_PASSWORD")
+        if not self.username or not self.password:
+            try:
+                n = netrc.netrc()
+                auth = n.authenticators(self.server)
+                if auth is not None:
+                    self.username, _, self.password = auth
+            except FileNotFoundError:
+                pass
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
-- 
2.34.1


