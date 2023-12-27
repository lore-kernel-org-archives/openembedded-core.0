Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319DDC4707C
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:42:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.107846.1703702515650396933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSef2Zgh;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d5d8a6730so8121925e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702513; x=1704307313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBr/U3ydCAUCH8MOMdVY003uIovvO2+SROuiTKbzSs4=;
        b=DSef2Zghti9lFISWv8ibumcONRjtgIKU2B03x1JXb2Dm+aOztlufR+hN6eiSa/HaIj
         /5MmdvXoBCcgbXWpgThcQ7VSZS73AimqyiiMS3Na9zLxT7mHss6xv9ThI3fY7pE2YIts
         xZM00ncnEKiQ7bws9mNiyzhvkOEWZe79jcEcbwAFDaCHeAbQeST4Gi6bzYeT7CVH6lG7
         UdhEJ6Hrfh2AjdGeg67/j2QOKoJjsNhuTFMJAYebt9f6N3Dq4zRx3n39nkSeFGcCciTM
         +IwpAat9ZChUK7KvdsIp8FHUxlInN+EvnkX6PFRMmjovfy+0my2j49pDebTynkW0ZzG+
         nw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702513; x=1704307313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBr/U3ydCAUCH8MOMdVY003uIovvO2+SROuiTKbzSs4=;
        b=kGZ5bcVet0ArVzvmIfYpsHxxNzcN/owj5++Mr9VvkJ6NaGYb3OL1UwGx4LiINUqx2/
         DxZ90NuqslVw+b8tj6QoxRPUbSIAEh8dG4mfetm/w5X36ZfuaZCGxMq/EAu0R+zmRBdt
         cAkpTv8Ab5MYnc3Izxo7isCbm4lssI0Z6cfDNJ1FyGRfWUKr+a8ZCWkP+aakG26PPvRZ
         usvkIUVYVk2dZyxTtlBOIhEh3Nm/kzEvYqHUu5TDAqEZOtSlbMOKo6lwZtFt2/MsxfYT
         rgMcLAJ2O1SvQPK8oQTR2nNtISVA2xENT9TEIuIg6GEEsWy3tlS7j3rNuArFZYZ5DKNf
         uZpg==
X-Gm-Message-State: AOJu0Ywekgk5ufDV/5W8KlsJxIZrskqdZlxxg4goWOz3nGjBU8eLAQRL
	cUWcU4PEEz+MvS8DLILl/lyQhBTtU6g=
X-Google-Smtp-Source: AGHT+IEHQ9ul/esjWRb1t4+r8cFHhHvFKgooOJEpfPX0P+wtFihw1iaZ9jiXXPE9+BsfdGLxf6Rcxg==
X-Received: by 2002:a05:600c:1c18:b0:40d:5b97:a23a with SMTP id j24-20020a05600c1c1800b0040d5b97a23amr1259412wms.95.1703702513086;
        Wed, 27 Dec 2023 10:41:53 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm32680977wmb.7.2023.12.27.10.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:41:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 3/8] devtool: selftest: Skip test_devtool_modify_git_crates_subpath
Date: Wed, 27 Dec 2023 18:41:43 +0000
Message-Id: <20231227184148.4374-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231227184148.4374-1-alex.kiernan@gmail.com>
References: <20231227184148.4374-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192960

This fails to build upgrading rust and whilst the upgraded recipe works,
it no longer includes the essential things tested; skip it for now.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cc28731402e7..291530e0a581 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -918,6 +918,8 @@ class DevtoolModifyTests(DevtoolBase):
         bitbake(testrecipe)
 
     def test_devtool_modify_git_crates_subpath(self):
+        self.skipTest("zvariant tests fail after rust upgrade.")
+
         # This tests two things in devtool context:
         #   - that we support local git dependencies for cargo based recipe
         #   - that we support patches in SRC_URI when git url contains subpath parameter
-- 
2.39.0


