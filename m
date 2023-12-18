Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B54C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.40235.1702889058632475346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YJQqMdhC;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a235eb41251so46350366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889057; x=1703493857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1GVh7bIHF7CLeoOrEXTpECP0j/CvgbnNp+1vHC+XMg=;
        b=YJQqMdhCVDRZ9CAD0GhRIA7xikVpRG1DR3YTlCuS/5mXccL3LfIY/kUH334H6oUkn5
         TGcQ1U0jmU0qI+BCWCUw1z+JSog4ZK/sK/qM08rjZFWQAhgYr1vJxiMA8ehLGT8Ix6wi
         bWxGIknJBj4LUX7OMYPlckFAuX4HQpB83pAb1cprp8ncWj7v5mQSPTCfL/iUr3C1ECqP
         UaxCCVveGJEVP6wQiXGn7A47svI4sBT4qyoZ2bB9Z6LoGyfvRWOjWepz6cCO7plSSO14
         ZCBjqZ27M4PoKFSgi7ra1wVgR5dDDVW02UqLMrEKsS1gYSmkc+feWeZxwHOvXqqLx+bQ
         Y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889057; x=1703493857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1GVh7bIHF7CLeoOrEXTpECP0j/CvgbnNp+1vHC+XMg=;
        b=IdEolkeJvp+rU4qYHO7jNsTZEig4EaPJCbtjh1ufPcE4hTkWWPihIeFtNhwMwxV8tB
         Sl2JoNgRSe0DTMEuvOe5kw1L7a6oPSvjuLQhhzjufXQ8FIjPy/BCq/XHtpDoc91zxoCY
         0YCRSLSpZbyKEYkEpAtYS6Xe121tb6GGwvBq8Qr8ri7Z8+QXGTcG/bnKFEFc1Hx6sBXD
         n/7nYURcRlbJVePQGBZqAGjEssidMZJ1HGC/Oe5fY4+GbXj0gW3rc6xq5eCzuyN45z+j
         HUs/upYuma4T2MnHINdn/bxcf5PwkVKYuFbyM/u4+nWNuRdhwJ2ceOwhEFWwdLFKjNuH
         hwgg==
X-Gm-Message-State: AOJu0Yyv1r7lNrf4h6N9/Vcu6pykUhSBDLRc9kdTVgU8lVd5jTpzgZS1
	PjtAiOTb8LLDVt2uc+QaRbYwlKmmIeA=
X-Google-Smtp-Source: AGHT+IEub0SxbomKZIbcWGE0pTPGbFDxDX276YT75TESujoo3B/DwnzW3/vyueE4E+f49jxgCGgFjw==
X-Received: by 2002:a17:906:1708:b0:a19:a19b:4238 with SMTP id c8-20020a170906170800b00a19a19b4238mr4859378eje.163.1702889057111;
        Mon, 18 Dec 2023 00:44:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] selftest/sstatetest: re-enable gcc printdiff test
Date: Mon, 18 Dec 2023 09:44:03 +0100
Message-Id: <20231218084403.599015-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218084403.599015-1-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192618

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 6da3ef3ca77..62b7a79bbb6 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -842,7 +842,7 @@ do_install:append() {
 expected_sametmp_output, expected_difftmp_output)
 
     # Check if changes to gcc-source (which uses tmp/work-shared) are correctly discovered
-    def _test_gcc_runtime_vs_gcc_source(self):
+    def test_gcc_runtime_vs_gcc_source(self):
         gcc_source_pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
 
         expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
-- 
2.39.2


