Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BC4EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.9015.1689690408136485139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AqKTaPDU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-668711086f4so3573213b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690407; x=1692282407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIepBY8k7tKz2JB08d2zJjTMmG7jcBBJO59iVolCAbo=;
        b=AqKTaPDUk5a+VqrGiyX+t4CyQT+7ONVu9A0N05lM+HEBgoXYcKdMglMuFudWDIz4SI
         i+fmbs4QMEzYQn1e3PGJh1w+vPj3bGYM0a9MalwCriVUY08Pm8N+LZqnTivP8Z7ncnnJ
         IV+IKxL7NtYtGZK6sPknZ3yHVoyfTo7YE/g4dksqtPsIkJL3qxr5rgQ7rszOqATz32vp
         PUBtehIBk2BdCTFqUwE0lFmoRxAtjmAjf7SS+1CUbzXbZYsWrBBOHskcm0G7r5LHIKMo
         U29LQQcFLHjeZ/OECMxLv0D5Oh9B403BX6VFhON/KUf/XZiXmptm01U8jFHGPQlFXV6M
         zJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690407; x=1692282407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIepBY8k7tKz2JB08d2zJjTMmG7jcBBJO59iVolCAbo=;
        b=Ri9oXMYZQ03e1e+ePiIiI9gmJ1WJJPAQajrJthYVVM7hRzqdSS1O3d7VM7KESdcTXd
         LpmjYHlZcECN+8VjqoYG6SCl6LAYd+chceu+Tj5uZ6zYwQAFq/wovlSIDP56v5T1nnFv
         7Dk/zu+2pAE4Vu9yGLA/LXzJ1ggEWCbPFuYGewtO1LxmkYKYhULT4STYt17DavYAiDfm
         abvHjz+uLjkJ7/nD1DavyA+iS1Jk61peq1mfnkQqKAQ7HYNizpyPv2zI/3hFOvEofXvS
         NziCGiiQTOOtzJ1gc38E0Rq3hjk1qD5FnbJ8FN09dDpgl1nxBU321SFmqgosy3mf2Gra
         ZOzQ==
X-Gm-Message-State: ABy/qLbfu/V8XH1LiJoneOONEWYnEZZbJ4DrAmbTiEl4l29m9CSTrRP+
	/+Qq9zhuDWg/NMnhxmUEXwIeRsZnbWIVawts9sQ=
X-Google-Smtp-Source: APBJJlHLzJ6W4jBVA5f+d61xTKodUb2Ms8cb+OZHkHNniTjkUk6KPMfy1oYZgaLKJudF96kAWEM1rg==
X-Received: by 2002:a05:6a00:194c:b0:657:1fe5:eb63 with SMTP id s12-20020a056a00194c00b006571fe5eb63mr16324786pfk.7.1689690407179;
        Tue, 18 Jul 2023 07:26:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/27] selftest/reproducible: Allow chose the package manager
Date: Tue, 18 Jul 2023 04:25:48 -1000
Message-Id: <4402b746f49611abe71719dd1d174de79bb030bb.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184518

From: Jose Quaresma <quaresma.jose@gmail.com>

This is a follow-up of 76e5fcb2 that also allow users to chose
the package manager using OEQA_REPRODUCIBLE_TEST_PACKAGE

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d414d85b44077bac57aba36707b0fc699a73e97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 98259ae515..49318be43a 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -126,7 +126,11 @@ class DiffoscopeTests(OESelftestTestCase):
 class ReproducibleTests(OESelftestTestCase):
     # Test the reproducibility of whatever is built between sstate_targets and targets
 
-    package_classes = ['deb', 'ipk', 'rpm']
+    package_classes = get_bb_var("OEQA_REPRODUCIBLE_TEST_PACKAGE")
+    if package_classes:
+        package_classes = package_classes.split()
+    else:
+        package_classes = ['deb', 'ipk', 'rpm']
 
     # Maximum report size, in bytes
     max_report_size = 250 * 1024 * 1024
-- 
2.34.1


