Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081F1C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:18:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5787.1641899892505573971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d1OrYTho;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id w26so4881871wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b22QQIEyu+9dzHs+8WqjzbjJ2v8yFLLd5+A25nCVysg=;
        b=d1OrYTholz9nHhEF4SSlE4ktrRw3sH/I1EclK5DPid0kAHVWKVjgQtR7F67ccxvSbj
         4ZjUOgRGsSM7yegKG/7s/MN4oV/Zf5QI/fmw9ijBs0UbuYq6EUTFJ0bStpOYv82uLHYH
         aII5lu5YHC8GKFpD1MZ8U+RFqv/yEmKnu5f3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b22QQIEyu+9dzHs+8WqjzbjJ2v8yFLLd5+A25nCVysg=;
        b=yyIbP8ccEI/eX9yN55bagKEDwCCG4jhqwQb2n+nzrIiHv1TEh/Tp5sO2L5fWAMu8QJ
         f0f25OU7FX9yo8xFe7iIRfn6jBQV6Vwo41ftfB0HoDP26/xPcERorh6VKNP/LzLDIy8W
         PT/6MQHQYGAVWetFV4DzeI+oWhQkt3V8/3CHlIicYxFEaXkVFZ3AAqrLXTvZOnolK2NR
         DblTdVGE4G08RtNheuRwGdExJImc0TYY2F6GgLlTSjYI49qHPYGhoTIIznMKu/oYmgPZ
         MurJkkn1TKZjEY7IeuvlT4d4hpGD+rDY6oXH4i47LSr4YxRWjY0Udgu7+dziRh6bmnMj
         y0jw==
X-Gm-Message-State: AOAM533m2IYCaKbI2uPGVy3OaPf9KL/XW0wrPCT7Xs0vnEzNYxptANJR
	hIEh5OzTSfKwnIIN1bn7/UG3xR6w0vG4gw==
X-Google-Smtp-Source: 
 ABdhPJwDPTkIjznWHd0Eaa+6K7YFilifS7RyCdCM9r29oCfy/CNid7yLEgEpJijTXi2XuObG8dZPNw==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr2078043wmc.33.1641899891070;
        Tue, 11 Jan 2022 03:18:11 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 m39sm1553215wms.33.2022.01.11.03.18.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:18:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/sstate: Fix allarch samesigs test
Date: Tue, 11 Jan 2022 11:18:09 +0000
Message-Id: <20220111111809.1633613-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111111809.1633613-1-richard.purdie@linuxfoundation.org>
References: <20220111111809.1633613-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 11:18:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160397

The allarch sstate sigs test is supposed to compare the allarch sigs but
does not. Fix this.

Also rename the common function to make it clear it isn't just used by
the allarch test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 70ef10cda53..96b2d115ed7 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -350,7 +350,7 @@ MACHINE = \"qemuarm\"
 OLDEST_KERNEL = \"3.3.0\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
-        self.sstate_allarch_samesigs(configA, configB)
+        self.sstate_common_samesigs(configA, configB, allarch=True)
 
     def test_sstate_nativesdk_samesigs_multilib(self):
         """
@@ -374,9 +374,9 @@ require conf/multilib.conf
 MULTILIBS = \"\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
-        self.sstate_allarch_samesigs(configA, configB)
+        self.sstate_common_samesigs(configA, configB)
 
-    def sstate_allarch_samesigs(self, configA, configB):
+    def sstate_common_samesigs(self, configA, configB, allarch=False):
 
         self.write_config(configA)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
@@ -404,6 +404,13 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertEqual(files1, files2)
 
+        if allarch:
+            allarchdir = os.path.basename(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/all-*-linux")[0])
+
+            files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/" + allarchdir)
+            files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/" + allarchdir)
+            self.assertEqual(files1, files2)
+
     def test_sstate_sametune_samesigs(self):
         """
         The sstate checksums of two identical machines (using the same tune) should be the
-- 
2.32.0


