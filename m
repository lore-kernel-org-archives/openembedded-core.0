Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A32DC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 06:43:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.14343.1738305838757447213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 22:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IMbfGJhe;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436345cc17bso12071465e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 22:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738305837; x=1738910637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaaMpLqLPeER9sZGHDxQY830Lm9DHWw1oFk62RVMFYw=;
        b=IMbfGJheNbIJRRUWE7YHHKhyP0xi+TYzoWpzLGaxtcUsuGKyGHrwhJIIYSQodDI6qq
         UE8h2LYyJ+TnXSBPjoUhK/3qqmihHHI5aVanHJV+MYVrDDlcz4cDhUqOYI10CUwrC8vp
         EUAVmBjpB/yPpOjrzRN9/jKeSPrHpo1hDMZVtfLGytTTCe7hmWe8pW6vzhJEUAMHbxRb
         e4DCbAdt0l+p5qPSXHPrvHEmmW0TUQ7z+BKULomkTpfnwsidmgI/Bk2msqtyW7tuyg1P
         dLc4gGYbZrgFqdYnyesXpCKDxrL33Y4btveYEdan2IZ5o69ctpWNrajJ9HFR3xUEHdQ/
         EKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305837; x=1738910637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaaMpLqLPeER9sZGHDxQY830Lm9DHWw1oFk62RVMFYw=;
        b=Yd9NgZc3dvdjSRp8zqP7KEYfuFy/igMt1/e0rlrK0yePbcO1E52HHYZenrJYWbvO/O
         pDX2H8XwsQSNY2BI1C93HsbBRE9V/rDljB64mJxN6ZcqIAxxODgeCGd8HpqiOQtaPl6F
         4J9ebOAun7k+WyXuUoWqCEItzLzUjLvHgUKow0q5ZUXTb+2Mqm1sFPQMG7abgoTuKzEH
         jCQE7Ss/muetj97NBLYp0yh5KCFcd6s9Kf5TTm6QSR/+bof6blKvXu6jHo4qXgYaFRrC
         QvIR8J1Ap75jyEJg7LvxZG4pTT0Ndt9da20ODVdStphIjUk0RMjwGa8Fce2DJBb6Zq10
         LzgA==
X-Gm-Message-State: AOJu0YwE7+27l3a2EsaKO3lCZnJq+vb7rGunUAmCqRsQufFi/TBgIQ5n
	STkh/zPOfD30G4DAa9v0bVaZg67TBteyu5Wcdd63aGvxYVPNAg6Hk7IBMg==
X-Gm-Gg: ASbGncuyd676ikQ47cvhA4vMxdd7oB8vYtJtbDeh5id/1yppWOtjkqVRZirTBe23Nn3
	VYTBrrBJ2igQ4LvdycGWyfwTBUiDGfWT8t9Y8nsebKT9JY+R0hvuyfvSzxpCB5VGdgRPRkqEZHf
	sIvU7KsntIEzPtj5nR3cIimOlbuFWuFZFo70gHjE3BOQhsxa1J84erpCNWi7QB4PINP6agxawvg
	apSEIUgz7IQqBj9IFHY6K37yghZYX2GxDPftRJrwrP2Q1eTAuU6DFivVnZOo+xQ55bS4jVOY+nA
	iUXbH91L5+QpToyTaNbagU/EH7/erYI4a8cXD9pfkl8oRg==
X-Google-Smtp-Source: AGHT+IH1BMK0NqXm/8HPOuPTPMo/yQBFfby11uo60ygnnBXjwmlR5xh+eYxGtJabpP9W1cAhOPKbwQ==
X-Received: by 2002:a05:600c:35d3:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-438dc3c3958mr90456295e9.12.1738305836645;
        Thu, 30 Jan 2025 22:43:56 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42d4sm46890745e9.6.2025.01.30.22.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:43:56 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Fri, 31 Jan 2025 07:43:52 +0100
Message-ID: <20250131064352.2613105-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131064352.2613105-1-zboszor@gmail.com>
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <20250131064352.2613105-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210471

Enable building rpm with rpm-seqouia for the test.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


