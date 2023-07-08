Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAC5EB64DA
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:37 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.357.1688831788188135976
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oGByFulh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2640a8ceefdso2228505a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831787; x=1691423787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77RUO2Z8P8ugG/cl+Iy6oeQCGKKb6QjTbHvOEmN8Cyc=;
        b=oGByFulhb1eOGxzXkILFZZRXKpYLrmkwcuLlDvNuqvNX0EHfk7+JCuffI5QpHrZKAT
         WmG1D8nNZ2vWcIwwNReshdQ8A5y8VJBZ3reZtZVw8adgus3u8ITZElmuS9FcETa91WRD
         4mRM6jR93nc17juZbeTg1GOm1p16VNrVRkKocSrFmKUMLRhXEOnU212MKegwT2QV1THz
         +axl7jVYjWw2lwTashD0gQwwNCWtk0VA02M/ZTkGVQ/26d+qv9iq/HnfKEc52BMeiEpb
         QN9PHeijeKuFp8SQkK6u2YqRbeaqFsx8I9uOmocs2d9wyTxR0bs5aIqB4IqJ6833GKVG
         Ss3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831787; x=1691423787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77RUO2Z8P8ugG/cl+Iy6oeQCGKKb6QjTbHvOEmN8Cyc=;
        b=H2UjDnDuRqmHaHhXAtSRSt0da2ntZ81EgK2MGlVeig8hY5dhTOi3Ak3E8bStuc+5YN
         c/QCc5YA+zMCbJHI4ixz65GrpRFMb4YfOru0D0oXVyelIeRWDdDoljWvCldRdZEVVL1g
         Oj5yayNVs5bDKD0SZspSpdMkwDSG09LW20TekZuBBLKzBlqm+uvDYc6icBqGSpNWcg71
         3sr0Omw97Isd3nH2XGzet1QaSSMfImq6g9rBonAdfFmjEO/VV1nDAxvHf+lmiMmtUsEt
         f/UPAI+zzJiFK4B2VklyIW7W9GGG+ULMZccOYkM8ZUNg78DENSi9ZKhIWA/an44bQ599
         h4hQ==
X-Gm-Message-State: ABy/qLaigdRMS6IB+WcLt1eK8sEbLxs679j5tJZUxVQuIKRw3/MMCat2
	iRr08xPXEgMxE7kJbHTbB3nXOsUR532XXUQ4Vc0=
X-Google-Smtp-Source: APBJJlF3+1duWhZbISEWpV5wF4iSjdPLhOSpDtTbjhTI1lOF6XBoGl2oarRf98R30G/1OJ3hnczN+A==
X-Received: by 2002:a17:90a:b011:b0:263:4164:dfba with SMTP id x17-20020a17090ab01100b002634164dfbamr7990850pjq.6.1688831787264;
        Sat, 08 Jul 2023 08:56:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/17] oeqa/selftest/bbtests: add non-existent prefile/postfile tests
Date: Sat,  8 Jul 2023 05:55:49 -1000
Message-Id: <74fed908b807056cbb10c20d62d494f3089f52ee.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184035

From: Fabien Mahot <fabien.mahot@smile.fr>

Fixes [YOCTO #10725]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0c33655fad5b2e7d96a45b6210527dfb766797b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index e659be5341..0b88316950 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -185,6 +185,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
     def test_prefile(self):
+        # Test when the prefile does not exist
+        result = runCmd('bitbake -r conf/prefile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake didn't error and should have when a specified prefile didn't exist: %s" % result.output)
+        # Test when the prefile exists
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
@@ -195,6 +199,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertIn('localconf', result.output)
 
     def test_postfile(self):
+        # Test when the postfile does not exist
+        result = runCmd('bitbake -R conf/postfile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake didn't error and should have when a specified postfile didn't exist: %s" % result.output)
+        # Test when the postfile exists
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
-- 
2.34.1


