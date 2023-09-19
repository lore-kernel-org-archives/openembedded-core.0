Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64784CE79B0
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.22624.1695159988950585924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aP+qEv7B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so5787094f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159987; x=1695764787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n42VeLZx3OUuo7cIFQ0rW03T/RAdnGMA8htNqiINBsw=;
        b=aP+qEv7BMdcnUUzpQ5BddcQOqt2KRFU/BoYtupVdr1yEhMnUw8hPhkHvfvShhTHwxV
         bz1PiBPJ8789cvVdhe0NGlxx23CcW8dLdnArUIoFm3NwJx2VGZ2X7AdE/AaQD9WBxKgx
         AARGqlLEEfV2RSiobMC3LTxTMqAZTmCSM9JMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159987; x=1695764787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n42VeLZx3OUuo7cIFQ0rW03T/RAdnGMA8htNqiINBsw=;
        b=v1zdwjzP+RdvY0+8cFx7O0wJgI9o0ky7FYvnLQ0W7GIjQGu8lp0hGceq2ZmtaaquNh
         IF3Ys6aqyc6oUoQ4a7Fzvb2fQTgQO6P56xTwu5pBPwT5UNUZ/9z9nUrKzkT9V0iYPmYM
         OkKcj2hu1P0wgqOZj2191Ba8Lj8tuHxuoRZtGmXefuUGXgcKeEPRl43BBRdjnW4zZ4Gu
         2VoOSRoCsU2sKwbFeuJOtp26CX1rxNLm2KU+RaYneqQPjTGdbAOt3YxFdvR+sOLX/0pk
         wOw1b66gWhcxidGuGkKtXd2Afo2WY68g7ejvzEkXVc070UU2y3gKmWTx6rj5c9RxtwPJ
         6fXw==
X-Gm-Message-State: AOJu0YwRJ5B+Lee4MDmP509Z44/dsOQC5togKCvyKEImRgmEtOJtAyfT
	UUD75eb//k1sCKAqSNr8ynyYSLfvO1PDiUhYdq8=
X-Google-Smtp-Source: AGHT+IEUnRN1H9udndERKcSca3o152GbOPGMvCgP6zwq1WTKDOKMD5MD2TdEhtNGw11OkftvZHJrDA==
X-Received: by 2002:adf:dc8f:0:b0:321:5d9f:2d9f with SMTP id r15-20020adfdc8f000000b003215d9f2d9fmr701272wrj.47.1695159987258;
        Tue, 19 Sep 2023 14:46:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] oeqa/selftest/bbtests: Improve and update test_non_gplv3
Date: Tue, 19 Sep 2023 22:46:21 +0100
Message-Id: <20230919214621.903967-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
References: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187883

This test no longer worked with fixes to avoid overlapping license files
in deploy. Fix the test but also improve the logging messages so we don't
get "False is not True" messages upon failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 31aa5680f01..d242352ea2d 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -236,8 +236,11 @@ INHERIT:remove = \"report-error\"
         result = bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
-        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPL-3.0-or-later')))
-        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPL-2.0-or-later')))
+        arch = get_bb_var('SSTATE_PKGARCH')
+        filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-3.0-or-later')
+        self.assertFalse(os.path.isfile(filename), msg="License file %s exists and shouldn't" % filename)
+        filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-2.0-or-later')
+        self.assertTrue(os.path.isfile(filename), msg="License file %s doesn't exist" % filename)
 
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
-- 
2.39.2


