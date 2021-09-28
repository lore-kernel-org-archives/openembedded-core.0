Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9652BC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 17:05:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.2395.1632848757910505986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 10:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gPb3T03i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g16so59259930wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 10:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0dyal3R4m9OQVhvmu5THf6v3GwqI0+Y1WrAczXUH6e4=;
        b=gPb3T03iprOzirL1Jwugh2wUbHdJVDbQkakiRHDrJmznk/9cEcfdQlwdZOsXmFKKSJ
         XDMVfy01Ir3Hlzh6/anYfFNYuOFdl5TNVcYyXLa3Uwb7rWWoHS9uTVKUrwqTpS+vzAF/
         z+HXCpZ3eHrYpaiP1oj2Qzzyd7+aB3W4zBNUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0dyal3R4m9OQVhvmu5THf6v3GwqI0+Y1WrAczXUH6e4=;
        b=GukznRq9U8pwTfQ6/5+F2tLCkwqkrXjRKfN8kn4juO1ib4OK7K21CBhAzDBtIYrKAj
         /U4dFLTVBbL0d37tbOellDRCaQ3EVY/871rig7BHkp5ys9qTj36t4Pt3B3fK6pKwhLHE
         6tDQH12VNGT0IuX9Wy9zj7oqO43wOvTiD/+MXSqwovlHizlJSxPqWFoI9Vkv0WsFUjhE
         fMkCiJocCOCLVqWSJPQ1ycECAAh0OpD1kbYrtbLzdcdTuh3xUJXN5EuWRTDHHONud5nQ
         SQ8O9vrLmF3c6SNe7UmpfLnxow9OZpNR6thi+ri7GbR8evCzqJsvJIP1/DiKbdjnI8TD
         yr/g==
X-Gm-Message-State: AOAM531bEwQ4CymdF2D7pNM1GTezCNn8bMATM7Ed+1CMqmGoJFEthBbT
	0YVybJy66PTwFJbwTJZUaJCSLwLiPJiKNGkK
X-Google-Smtp-Source: 
 ABdhPJzc3PrDtemErS93r5sTbiRNWd+NsN8ToEuFIORy7P2TQj/FmnbjYjoMYw8VPMEyAWt0+6rCgQ==
X-Received: by 2002:a5d:6cb4:: with SMTP id a20mr1401743wra.428.1632848755946;
        Tue, 28 Sep 2021 10:05:55 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2a38:b35f:af4c:6fb5])
        by smtp.gmail.com with ESMTPSA id
 j7sm24590181wrr.27.2021.09.28.10.05.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 10:05:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: Revert "Test cross/native hashserv method
 extension"
Date: Tue, 28 Sep 2021 18:05:54 +0100
Message-Id: <20210928170554.2098933-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 17:05:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156426

This reverts commit 2a76082363d189880613765ad339718e3614049d.

We have an issue where x86 host builds are not matching hashes with
aarch64 host builds. We'd expect that for a given target, the target
artefacts should work regardless of the host architecture, compiler
version etc. but this isn't happening and the hashes are differing.
This is due to issues from hash equivalence.

I believe the commit being reverted was added as a test and there were
other fixes at the time which resolved these issues.

As illustration of that, different gcc versions are not cauing issues
with hash equivalence. That should be similar to the aarch64 case vs.
x86-64 and hence if we're not seeing gcc verison issues, we also don't
need this special case. As such, revert it as we don't need it and it
is in fact breaking sstate reuse cross platform.

[YOCTO #14578]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index dd6b9de7bbd..24577249ffa 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -108,7 +108,6 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES") or
                                 "").split()
         self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
-        self.buildarch = data.getVar('BUILD_ARCH')
         self._internal = False
         pass
 
@@ -147,13 +146,6 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
-    def prep_taskhash(self, tid, deps, dataCaches):
-        super().prep_taskhash(tid, deps, dataCaches)
-        if hasattr(self, "extramethod"):
-            (mc, _, _, fn) = bb.runqueue.split_tid_mcfn(tid)
-            inherits = " ".join(dataCaches[mc].inherits[fn])
-            if inherits.find("/native.bbclass") != -1 or inherits.find("/cross.bbclass") != -1:
-                self.extramethod[tid] = ":" + self.buildarch
 
     def get_taskhash(self, tid, deps, dataCaches):
         if tid in self.lockedhashes:
-- 
2.32.0


