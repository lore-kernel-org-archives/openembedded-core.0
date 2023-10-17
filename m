Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BA6CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 15:16:39 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.219969.1697555796103377363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 08:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QD4x748r;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-41820eecff2so40156831cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697555795; x=1698160595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXWj6W4MQc3jLIKBXAmEM8uTC4rkTYL5nxqMgkNUFXA=;
        b=QD4x748r+ukoWBhVbP3scB0FjW/J/d8lzFaSxclcF1EN9Ki0XA/PkkDIXseLUdPXgo
         Doad0GtQAAcJuHrIAKEECJQo3jiFYbg1j7i5vas5Lv8SzUGXtI/mEwpStDKZ3VcnrU8R
         TvtarejB2Rg7ihdlx34nc1qRLPoWt2YIr/JsA50Ci80bdnOhWsxo2dWNcZSjF0mQTxi6
         oAHEh2FFq6nQSdHE9LjouwTqNL4V3V+Cpk5KMLVepDlxB7gJkWsJgLAXua3jQZ0t4hmL
         s3OUU2mASpM/qXbzmXNJT3DPFb4ZwQqdbm5k3qnKGLzqC+sanpJuTzj+aYIB3MW+urVG
         o+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697555795; x=1698160595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXWj6W4MQc3jLIKBXAmEM8uTC4rkTYL5nxqMgkNUFXA=;
        b=Ftzl1pIjMb5eZlaF1NBgvtdUq278bZSz5v/u8VOIyhizChpB9Duc7Pqt4UEZsliQ8S
         6+xxsgjFv1ihUf5M0um3zU8JClLUHmV7nq9CkmJPh005V9YuFstTXKTAZTwtKQTGcsyA
         SI0k553NCmgZOW7zAwTXZTC5dsx1oBsKoZ14qEsTd7U1fvA1qhR/4foLeZw8STQZTrj4
         YKg2wSaU/1mCjPdF2pWq9uByy28cQ6EgyAnjhKS4IQwOhT17OVjgExD6z2nq8YAM9nEt
         cMn098NRG0A98p7Jm0lobAb2ONTGb+uItwW6vKfRkAqzIDdCUUuZ4pEsA2Tz+ahzPz0s
         q+LQ==
X-Gm-Message-State: AOJu0YzsvAjTgYj4TXdSWTqtaVfhUz8M5s+cFaf/pGFtWY5wuplVToLX
	SBDQSwl6eskXq1E+WqSlVVN7V/EikGSnIavF5eyd/A==
X-Google-Smtp-Source: AGHT+IGU9n8hNXjMnK9AlYq2dxdyGLmyZMBJIS/2EFiT0golSUt6jqRpyf0C9lbYowtOVN+ziG2MCQ==
X-Received: by 2002:a05:622a:11ca:b0:417:a514:72cd with SMTP id n10-20020a05622a11ca00b00417a51472cdmr2898824qtk.19.1697555794672;
        Tue, 17 Oct 2023 08:16:34 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id bp43-20020a05622a1bab00b0041520676966sm693235qtb.47.2023.10.17.08.16.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:16:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest/selftest: fix command arguments
Date: Tue, 17 Oct 2023 11:16:33 -0400
Message-ID: <20231017151633.2263811-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 15:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189340

Changes to patchtest's command-line arguments to work with oe-core by
default do not match the selftest script's argument list. Explicitly use
the --testdir and --repodir flags in selftest so that it is compatible
them.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/selftest/selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 79b12542488..006d1badf83 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -37,7 +37,7 @@ def test(root, patch):
     res = True
     patchpath = os.path.abspath(os.path.join(root, patch))
     
-    cmd     = 'patchtest %s %s/tests --patch %s' % (repodir, topdir, patchpath)
+    cmd     = 'patchtest --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
     results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
 
     return results
-- 
2.41.0


