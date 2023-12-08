Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678CDC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:15:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.17058.1702030529325565299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BgH8XoB2;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c09d62b70so22396025e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030528; x=1702635328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DnBnPKsa65szyhujGlcDCXSATwp4DF8RSjxWKzs7tI=;
        b=BgH8XoB2vccUpvMyNKBQvWMggvwJGL7wSA0e4Kg33leuFTYF9bT9ENuUaPFUbtmFEp
         AVIuAqkmIdHkWgs7OqF0iD7MeNZBDPyx2Sp5bEL85yhfvc83Y6ZFjVDAX1kzIZna1fAF
         M3293L4cbGVlviJ3QINq/OV82AnFQ5l6WFNGNldgagJmAHdw52MtTDZblxVi47srd8L4
         DI3mnDQP9TAa0BBnMv9z9uw9KYqWGnG2+YpupqVD2XhHAO0dLfK/8VHkA5uQUanTrVVK
         IniXmixp0EWB8V1xL2Dp5Tgs9HJQdArg5su28s8UCtFOVA7wDWyohY9MxKlDo/GpwnNP
         jYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030528; x=1702635328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DnBnPKsa65szyhujGlcDCXSATwp4DF8RSjxWKzs7tI=;
        b=td4Ev1wHlFzfyuMMAJGzM5M2RFcvFzgz5taWJwf9HpeC2nV6Exxb1r3b2gr8KrL8ce
         OJZWYS6enPg4sdv0GIlbseIcSJTiZeG1EzT3DYfK1XaMVF7L4RBpIcL1weGQhSkBUW2u
         tXUQlQIVeOoAoipPf9tk79zcSysoTVXIkl7jPz6+c383Eou0JilFHBFaS0BlnBF1hXs7
         NcoP0T+INi7O3MDxtHGzoQoWb44YjUdIZIG6FjfZIfIxTnVxeqTVvs/U2DS9EUZJC6cA
         OPj+cwcY6CKiGYy3BswXmiiB53cWZxRgrwyZ9o3WT7QNzjsF8bJU43v3hVmcAR3L9/ev
         zMrQ==
X-Gm-Message-State: AOJu0Yx8YdyHsmYg5Z1MWKvXo7zyX3uswGJNu4/xnE9xbv5F9eWxe7Or
	LOlmkFCPIQtRY+E4M+dudOeIhzVNoxY=
X-Google-Smtp-Source: AGHT+IGNSqEfMiL8G+w1q7drAVcr8B78IkgrO3rovEEtbtc/uyHssn+275McPC8y5ktIFDjbwbYGfw==
X-Received: by 2002:a05:600c:130e:b0:40b:5e21:c59c with SMTP id j14-20020a05600c130e00b0040b5e21c59cmr1642090wmf.106.1702030527418;
        Fri, 08 Dec 2023 02:15:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm2746707wmq.43.2023.12.08.02.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:15:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] selftest/sstatetest: print output from bitbake with actual newlines, not \n
Date: Fri,  8 Dec 2023 11:15:17 +0100
Message-Id: <20231208101522.198832-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192028

Assert*() functions from python unittest would join the multiline output with \n, making it
almost unreadable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7c2b14e95f6..79001854501 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -798,9 +798,9 @@ TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
 
         self.delete_recipeinc(change_recipe)
         for item in expected_sametmp_output:
-            self.assertIn(item, result_sametmp.output)
+            self.assertIn(item, result_sametmp.output, msg = "Item {} not found in output:\n{}".format(item, result_sametmp.output))
         for item in expected_difftmp_output:
-            self.assertIn(item, result_difftmp.output)
+            self.assertIn(item, result_difftmp.output, msg = "Item {} not found in output:\n{}".format(item, result_difftmp.output))
 
     def run_test_printdiff_changeconfig(self, target, change_content, expected_sametmp_output, expected_difftmp_output):
         self.write_config("""
@@ -820,9 +820,9 @@ TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
         result_difftmp = bitbake("-S printdiff {}".format(target))
 
         for item in expected_sametmp_output:
-            self.assertIn(item, result_sametmp.output)
+            self.assertIn(item, result_sametmp.output, msg = "Item {} not found in output:\n{}".format(item, result_sametmp.output))
         for item in expected_difftmp_output:
-            self.assertIn(item, result_difftmp.output)
+            self.assertIn(item, result_difftmp.output, msg = "Item {} not found in output:\n{}".format(item, result_difftmp.output))
 
 
     # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
-- 
2.39.2


