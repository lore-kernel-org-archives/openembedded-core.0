Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDD1C021A2
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:35:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8011.1739334944187956449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=deLaK7Y4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a823036so22340275e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739334942; x=1739939742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=deLaK7Y47NNr06cZlmZdsivsndJ+6MJfW5LdD8DcCbZpNksQFi7ZaGqAPgRDJthfqM
         4LmHmMNu57STkl9qLdlRpttvFUhen1HHS4flRTYXlSAcE1DnU9WKpiyEZcv367Z57SDo
         MD2rJUc2KGxs/aIsijbsQdhwbUxpdBcB6qQl9khmtL6VolCdXRXJZlnyX0PSJrLvVLsO
         0qxuPK5aFFRPc3w9cE9xHiXHYEH9uui/oZcPrk3VRl+zROaGP1kq6cylUq50CkLel9Do
         rM6iNayByKt/0FNoA/T8x3aX1KET1HNHE4aNOXnSAgSm5tilpm43xpW78hKIIyt+nOaC
         EioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739334942; x=1739939742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=Y7jJKN3pGHzcAP9hPQ/o4Mfna1evu9j+GCLSqch2IYhb1lOICspChvTzQAo2SNsoGv
         6fv1YATlNb4XhxeyFN04aUiYZJF7wWxVUmRTjSud9dDjqhYY+xJ3oJSJql1pe1gz4ZEU
         dG8w3+Hk915qsziqXCyN2qD64cgFXESKRhPH7wfZTENfuM2Y+bp7uBcOmWDB+Ac0QkqI
         UvwWs23Q6x46dumP4Ntr7fexPavW9pAFWrGB5ltwl5VkLSjgRWLWT6KLhkwKPMJ5LPtm
         grHzdg/acB9b21xVirtwHCklGy5eo89Zrjr8JbfrdvBMOjs5feflqtcnEGgFX9eF+p5R
         Vm2g==
X-Gm-Message-State: AOJu0Yxrt62yrOEN3a1RXm1tiSkstB8ZXzBnzyV3vvj7LhV52D7HdA9t
	AZ/YgY8dYc1VX2NVcvT4zE5koCNHq53TkHBKhXsw5VeieovRSgxv0NQXAg==
X-Gm-Gg: ASbGncsX/EpCWRdAgb2rYzApNmDYOEf5lyHR3VYxmsXLxqsiJprTXUu5COShBlmIDJp
	KZrWLngEjbFeM5s9ER1HB70/3hmt4TnAiVeQCqNQcXegW1BBXY2tn5p5WMCWwMMx8btqqCD92dI
	eJgeIddRuaL67WS3aq2i6a+tE+sxhyngjDVfa3hL2034/+gAJpHvJ1YjyXF2nRRNTq3fIA3pK3b
	CEGUTko07hhypglfUfg5ET3v1mnGjPhPZzukzkcCkyH5GqRlQx7DzhUMK7yckjL/IjBj0rbgh2S
	JdBapLFkACLI9VyxUtA6sU0Bb5bh1jNjKDCsO/ry5RVXtQ==
X-Google-Smtp-Source: AGHT+IHLLihk97y0SRyVuTSFYYI8HM39ah20WIsz5FdNxP2xwqCG0ygC3U2vm/xY3JKfn6i3ykPgLw==
X-Received: by 2002:a05:600c:46ce:b0:439:4706:ae04 with SMTP id 5b1f17b1804b1-43958183d00mr15586955e9.16.1739334941957;
        Tue, 11 Feb 2025 20:35:41 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a070ea7sm7487815e9.25.2025.02.11.20.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 20:35:41 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Wed, 12 Feb 2025 05:35:32 +0100
Message-ID: <20250212043532.1258912-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212043532.1258912-1-zboszor@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211207

With all the pieces in place, the self test can be re-enabled.

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


