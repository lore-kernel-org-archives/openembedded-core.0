Return-Path: <ungerer.ricardo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D551D2629B
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:47:39 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15236.1768938455108816665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 11:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bTp1UjDl;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ungerer.ricardo@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so43291151fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938453; x=1769543253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyl+veSfTu9TaNN2ceFFTUMZJYSaf7zWSsKBnlA/+6g=;
        b=bTp1UjDleSWHIHoion+1lTFz7J6M+eUf5g75IFKXdOg188zEAu9YUYqNj+x1l5Buxa
         d59Fo0I40d8+OH2J+3BU4cqTqHyxYB0JJZJSNOx1dy0jFOV8cfi2R5LPPyes650KtRsJ
         KPFypkAkEHy3duLVxybZH/RIKZDRry4L7ZY/faIqc3n9bRs9dK3c/tDY5B3os5BUJ7NH
         oTBJkLOoDsGf1mEPErgDLCS3F9s6Dcuw/PFEMu8JxedfnPurRTTO4jrKdVqsANT6/ja3
         ifb1Hu7pGY7uxIpDoT5lHbT2EX4iIUEq1DbouTsjtnlNn3ICIHnGRp4rYV65uOUUEmfB
         /k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938453; x=1769543253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dyl+veSfTu9TaNN2ceFFTUMZJYSaf7zWSsKBnlA/+6g=;
        b=weUMC4m7w0Oi6u+ev2GkTYeQO+ysIRwdHMwNqy6A0DNykbnSIFbVFmmovU1xFKWTdn
         mRnNxY0PKyseE0C2jzNd9k33RPk6mF61xXQaewxD8h/cGw2zn/HBIr+EcbFTsNMy73I/
         /yBTHyNo9BecGaxv/8y3fmyuFXPDifXICFN0GpVXBGKu+UqwVsSmc4XlIQJUyaI3mCvU
         N0tIhJCkf4yrNmZ4Keb5x9jfcqriOnimqZ6FaqGn2I80zI0OMCxjSHZruLCQv/4QMybe
         Ww/5/+k/KBcbEVhYLlxlJjONbTapUifdu7gWRLzxNtq3A3s+tB/gwxeOeV360X9Mmxx2
         /Pnw==
X-Gm-Message-State: AOJu0Yy8yRlH9/+w040bHvpXBE4MuNFi8Z4Iq6AC/wKuuWlkM4oEqp1B
	0pnaM5IU9WppcyrNVFw2At87PMjnCtgg2hIjg8FrG8vuBxS9YMsz98Zc3kjLjjLV
X-Gm-Gg: AZuq6aL7ODUi4gmQMlmbek/n94uQjDAVMpqFsD4/Gj95gACCnqRI2LUVKxsrFytxD3N
	TrxTt/oYXDTDWzMAwRHOtH8t6GqJJUfawXehlMEoooNaL6z8y5UB6JbWwcSmSCsojva48uEUdno
	mQ7aK+oPNyv4WaHlduniQdzqGLbwHF1UZ4w0qybAi4ten0ZLamJib0aPtp00lQlsWxH4nRIE6/F
	wzJGyIRcqIo88HLy6dgh28YGGYEjq9MVIbB9663rBJBeyi3A08WU/LbWXMEpmExRg++/t5oMCIe
	KBNR2NFY3JQYMx+SqzPXe5DrgFxfh6lxR9CKc1ahlrLMyNiV1+Cb1s97H8x5UDITPnOqoW7eqc2
	7gpB73UJnBN2uU/4UrN9ZAa/jENE62L4rYOuAqezYd4FLPB7C1l8vP1bI7I6oWY1BDSDgHRYGSC
	ED2/8q5D3XN6aRpr4K
X-Received: by 2002:a05:6512:3b89:b0:598:faf1:3c95 with SMTP id 2adb3069b0e04-59baffd3394mr4948142e87.36.1768938452362;
        Tue, 20 Jan 2026 11:47:32 -0800 (PST)
Received: from bolonheso.. ([45.94.208.114])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59baf9d442dsm4395035e87.94.2026.01.20.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:47:31 -0800 (PST)
From: Ricardo Ungerer <ungerer.ricardo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Ungerer <ungerer.ricardo@gmail.com>
Subject: [PATCH 1/3] yocto-check-layer: Add messages in test_readme assertions
Date: Tue, 20 Jan 2026 19:47:20 +0000
Message-ID: <20260120194722.142355-2-ungerer.ricardo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
References: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 19:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229789

Assertions in test_readme does not provide context message when they
fail. Which leads to errors like:

  File "/media/workspace/yocto_master/openembedded-core/scripts/lib/checklayer/cases/common.py", line 41, in test_readme
    self.assertTrue(email_regex.match(data))
    AssertionError: None is not true

This patch adds context messages to the assertions to help identify the
issue when they fail.

Signed-off-by: Ricardo Ungerer <ungerer.ricardo@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index ddead69a7b..0114481434 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -32,13 +32,14 @@ class CommonCheckLayer(OECheckLayerTestCase):
 
         # If a layer's README references another README, then the checks below are not valid
         if re.search('README', data, re.IGNORECASE):
+            print("Layer README references another README; skipping further README checks.")
             return
 
-        self.assertIn('maintainer', data.lower())
-        self.assertIn('patch', data.lower())
+        self.assertIn('maintainer', data.lower(), msg="No maintainer info found in README.")
+        self.assertIn('patch', data.lower(), msg="No patching information found in README.")
         # Check that there is an email address in the README
         email_regex = re.compile(r"[^@]+@[^@]+")
-        self.assertTrue(email_regex.match(data))
+        self.assertTrue(email_regex.match(data), msg="No email address found in README.")
 
     def find_file_by_name(self, globs):
         """
-- 
2.43.0


