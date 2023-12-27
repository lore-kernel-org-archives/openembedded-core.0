Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C54BC47079
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:42:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.107172.1703702514504798727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxv35RjP;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d60a96533so4739185e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702512; x=1704307312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBHd3jO1E3mDXuOdJyh9xQ4oMz5mNMlC1NncEr/sYKY=;
        b=kxv35RjPmXX2QUz0Fh+KinqeLOx63wiCwX2+Nb/zMz8oE4r/fSWZCDOACOY/9tk3zL
         QolSDG/zkLoln3TpFbHAD3hLK9z4TVfPIO03QlEPVJj4ND29pnsItqfdXoVMKwCeho17
         11wG5Z7s2tUxHELPAtMpKA8ZW4pLlFheSrMZazI+rYXxK8wVhLFW6NXHjbbuDQfKdrqf
         Elm8jWJjaRs+D8ZIfWx3A+LPA1zEtrQKzu5kfdthCg+dpAu2RAx6s9YYprw+543FkuOz
         rg6Cd1E2xspK/oVs3nsNDHYpsfoTvp+hlORpB2yf5tDZTiVxQttvln9Rfx1dogNsP2gN
         1CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702512; x=1704307312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBHd3jO1E3mDXuOdJyh9xQ4oMz5mNMlC1NncEr/sYKY=;
        b=C2hfsQLDQNNtb5d4E4bpIeF/Qk8PnloXQ7oSLcfBJp6JRJTdKd8ZM8AMMgktu+Z7U9
         XsBXEzWGU/XIj3kA+gpFNHrZmIDaV6YytUgEfexdzok6E0MuWaoxb2H0we8TkY/VEDs6
         kDFQu5VXqqUULtk1XvOI9ekMYn3erM/dj5Ns82Prz5My0Tjw5Hn6zCgFDQew3mdBiCD/
         2krdtMNN9av1lIVQmIE8ittPQ8Fcelm3DAW5p0C11icWUsZ490TIAhhU4GojlXyKCae6
         bOcPNVVdDqOX2qUiryuCz7h6PJ2tmm68CfmrJwclBro+7M/DCkw0cNMgOk4AjFKIOc29
         wRQA==
X-Gm-Message-State: AOJu0YwFRUyTxttCRrL3cahDD766WLJM4YHyFEe22Dbl/UFDGg7kuJCR
	+rrwqczgmxHgki3Pj9EhExrX0W9DYOA=
X-Google-Smtp-Source: AGHT+IF0FSkU7eUW03ohQ5RbFn1eolSU3NGuiCalrZ1WVf2g+1Qrl3kbI2IT/uScTlsrwD5PCF17SQ==
X-Received: by 2002:a05:600c:1caa:b0:40c:6136:2882 with SMTP id k42-20020a05600c1caa00b0040c61362882mr4826227wms.160.1703702512355;
        Wed, 27 Dec 2023 10:41:52 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm32680977wmb.7.2023.12.27.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:41:51 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/8] devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappend check
Date: Wed, 27 Dec 2023 18:41:42 +0000
Message-Id: <20231227184148.4374-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231227184148.4374-1-alex.kiernan@gmail.com>
References: <20231227184148.4374-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192959

The recipe being tested is in `testrecipe`, use that rather than the
literal `zvariant`.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d733dd158106..cc28731402e7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -958,7 +958,7 @@ class DevtoolModifyTests(DevtoolBase):
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'Cargo.toml'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
-        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'zvariant_*.bbappend'))
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % testrecipe))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
         result = runCmd('devtool status')
-- 
2.39.0


