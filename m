Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F2BC47079
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.124151.1703775583137890850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QgEugTnj;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d5adef341so19803165e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775581; x=1704380381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBHd3jO1E3mDXuOdJyh9xQ4oMz5mNMlC1NncEr/sYKY=;
        b=QgEugTnjcv78fHkD/o2rRcCHxwuBD2AyuMbf16vrTFmKZ04vjQTfrW1gX78rPSZz3h
         oWKULyuWPttWg0Guximmyps+sgv9wnYYAuae1206T0lQBvDy0ehQNblnm8jDbNHwLIjL
         /RHSWbhQ9ptwD0uKN2nFbEjw2Yihs0cHhydpYvGDxuuaY0Y/cTNSVpemeWU+/GasezEk
         ZKUoEq0t63tf75Jyu8pU6w4NAasM9Ud2klEZStNMrNGR6L4AnM3X/hZxsQKkYUKF2xFB
         HOyBHzMs0B23VMPczka163hjdYToKjtFPQZFHP0NYUyjuyNehlK7A4asoxzQJ8rhJZ65
         oxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775581; x=1704380381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBHd3jO1E3mDXuOdJyh9xQ4oMz5mNMlC1NncEr/sYKY=;
        b=ldRFDNl5Hnw3zPyfR6jk0IUVHsLfa+9WpTtaTlc3oI1znYwHFqmxkrIwPQl7astxTe
         XsqBzDj3KBVOQRyX1gGGfR8kReZaXinoJFPL6sCQWUDLyJau5S3013Yiu/2+4RaIvrCm
         cztzN5yRAWdKw/F9k2tWvT6Hribh6M3/4OBVaJOYpXdZsYAM0x5xSNRby9Mwa6gBWCCM
         yuGfMwUDgXk3xbUhGtaxknSj0FSoUrF7q4rs2iITqe+rscT0AGNgPsXrtF5I8pCgoRWb
         G8D+0dg9LTnUmQw4DJqz66bSQhWwLYAMAWVhx2bZM4EjjHXz43VEhamaWsA19DN57exx
         qYBw==
X-Gm-Message-State: AOJu0Yx4lw7okKhLbI0z3nW5EPypXSfNbIb3WUL2NuDCqFaaTovVj+lI
	TEEUzBiGPLZY9XTkWBjuDYAWh552EKs=
X-Google-Smtp-Source: AGHT+IFZ0WxhxapJ0StSGN1Cu1KlzQUzjNcT2DVE/51z2bqI3qx2j5jVRIN5SBJ4v0j3L7Hi/Zqb4g==
X-Received: by 2002:a05:600c:538c:b0:40b:5f03:b3f4 with SMTP id hg12-20020a05600c538c00b0040b5f03b3f4mr3228848wmb.278.1703775580683;
        Thu, 28 Dec 2023 06:59:40 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 02/10] devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappend check
Date: Thu, 28 Dec 2023 14:59:09 +0000
Message-Id: <20231228145917.18147-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228145917.18147-1-alex.kiernan@gmail.com>
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192984

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


