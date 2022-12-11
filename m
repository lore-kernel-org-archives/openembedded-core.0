Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C32C4167B
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 16:12:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.19893.1670775163541178952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 08:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HatUjRBV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o15so3293478wmr.4
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 08:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzIs2TDXJGQ0P+pf+mFQejyr54Mb1/pQvwqISFl4bfE=;
        b=HatUjRBVesHYkpPq1O/DZTIYdGC3EREOBv61e7kAJh6t81jSS9bgraYtq1DoeOj0W1
         d/7P6KKxAoA8dvjm+nVSLxByxEo+bH8Lz++2NPYpmCvDDznLEqJFqJkWdu/ZOIKcLQvi
         2I91Nrzzkoe5fLzY7g3kQOq2L9eKfn6DVIKWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzIs2TDXJGQ0P+pf+mFQejyr54Mb1/pQvwqISFl4bfE=;
        b=fo82GZmGCyNE9lcy7+atju/glvyf5i9Fm/sB5eZpKy6SPPlhKBV3CFrugcc8GOEqlD
         iyTFUya+ytCg4qMiMklZGZm1IwAwzcTyQcOTaFvL88MTIb6GTc/7td5feBUtLOnXU/RZ
         dbw9gWgL26vt9LRfdfQR/+T6H35NWQdKJoJQKBHMreO/lVKibciFZPv6UgJUcCodkW/G
         AAe3H6c/JikFVlBAvRjaJM1bDyHx3wzRC4i3Nxm9I9wj+B3WOB4hb8cIIP2+FDURQFBb
         +mTtY7kgtuQMo1L1mkD8pzwv8ATV4a1MdNKJymkipxwe1pwUGddp1n0R8kPb+TcvoFv4
         8h+g==
X-Gm-Message-State: ANoB5pnusPhcClBJXe6uH8IKgw5+S1ot/NBt0Niy6x4RqgDAvNdkoEcF
	nipuK9gVlErGzoIBEvERstCrEdoi26pDHNRR
X-Google-Smtp-Source: AA0mqf7F0/ECt+hVHEKUaLgjbqDlTf9qpHUo01N5oEtg3GB1Sflr5+FlMJgbYDDi8Bibng8v/ZZizQ==
X-Received: by 2002:a7b:c417:0:b0:3c6:e63e:8155 with SMTP id k23-20020a7bc417000000b003c6e63e8155mr9855435wmi.12.1670775161626;
        Sun, 11 Dec 2022 08:12:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:db5:b2f0:a022:4502])
        by smtp.gmail.com with ESMTPSA id n3-20020a056000170300b002368f6b56desm7966324wrc.18.2022.12.11.08.12.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 08:12:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/sstatesig: Drop OEBasic siggen
Date: Sun, 11 Dec 2022 16:12:39 +0000
Message-Id: <20221211161239.17710-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 16:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174475

We're now used to using hashes as part of the task hashes and the sstate code
relies on this. The older OEBasic hash approach therefore wouldn't work and
can be removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index bf48aed7e11..f0224454c93 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -101,15 +101,6 @@ def sstate_lockedsigs(d):
             sigs[pn][task] = [h, siggen_lockedsigs_var]
     return sigs
 
-class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
-    name = "OEBasic"
-    def init_rundepcheck(self, data):
-        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
-        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
-        pass
-    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches = None):
-        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
-
 class SignatureGeneratorOEBasicHashMixIn(object):
     supports_multiconfig_datacaches = True
 
@@ -326,7 +317,6 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
 
 # Insert these classes into siggen's namespace so it can see and select them
-bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
 bb.siggen.SignatureGeneratorOEEquivHash = SignatureGeneratorOEEquivHash
 
-- 
2.37.2


