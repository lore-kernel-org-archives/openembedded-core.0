Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCC9C46CD4
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.144486.1703850285917020344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QG2tkmz9;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso60194285e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850283; x=1704455083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62AKEId2woukg8VCdNIMr6sxFEAFB84GqB/Z0iWvPPs=;
        b=QG2tkmz9iroy1xPIdf/+mNCyd+tjrqRe5IQQ2Ixri4BX6rI9O3D9AkoSEMwGR0KK+y
         E4kKYDt5S9gOjpJa7hkDMxXnhYEUoqslk2H5A/lNH9QEvYU5E0wlIgdAmXT6uyAKfaPi
         gLBlEfF4O0zn4xPsv7j65iVxjFKTa7qVWHxgBihJgGEXZ8A9HIu3omHZoRurkPqyF573
         9qzahwlNSLKEcrFi1KVd99PJjX1L+R3XULgIOS6fY0tI5Rwlao5/PlCPDWD5zKgcDbUh
         AF4XU5jwSg2T52rJrs/7kKQtuOEV8IqXM61/Vtt97dR/oldYMteY97CswXxp5YJpchHF
         xALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850283; x=1704455083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62AKEId2woukg8VCdNIMr6sxFEAFB84GqB/Z0iWvPPs=;
        b=ULJsn4yxjOJzVu/83yTHhLgtKjUKr0Yx4pwOgYLg0fKWglGP02FsL+tsw/Nv2PICDx
         WjVSLbRHxJjC/qI+88o8/UkQbPmqAhlOmwtASI7lBPT5MoPbuMM2FZdAVtTVXqi5Lrcm
         m+64/49T/Yfc12kTb5rAcTvgAERLEK3Py2y5+bMlE49J4cWpXiaqsrQL4J6qz8jXnA5R
         inX5s5EZMQWW/AZM4SnZ89qHZ169bb330r3BzqcEvMFSUU95BjmD9e10uxgs0G9MFG95
         oz2SWOPLcUizSAIkK9A74BNQ/sUtSEjSr6iJiALxZSE84kl/pAT90697ip119b/uxQYw
         XHqg==
X-Gm-Message-State: AOJu0YwQ1MQCxS0thRJG15FQkvn2GhA7bDUQuu0hbDUsajwrwfzx7dQj
	9sh5NzJ/g8W2SB+m+YSPIe5hheG4BYc=
X-Google-Smtp-Source: AGHT+IGFycj3zcphfWWeVBHlZe0A1VPvqgs75bI7qmlUxocjzxWbOjfisrFgGrU1gF1JXZs8YCLXjA==
X-Received: by 2002:a05:600c:1e8f:b0:40d:802b:424 with SMTP id be15-20020a05600c1e8f00b0040d802b0424mr4061wmb.0.1703850283343;
        Fri, 29 Dec 2023 03:44:43 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:42 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 01/10] devtool: selftest: Fix test_devtool_modify_git_crates_subpath inequality
Date: Fri, 29 Dec 2023 11:44:26 +0000
Message-Id: <20231229114435.27810-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193004

test_devtool_modify_git_crates_subpath expects 2 or more git URIs,
change the test from Greater to GreateEqual.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 47353dadff93..d733dd158106 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -940,7 +940,7 @@ class DevtoolModifyTests(DevtoolBase):
                       'This test expects the %s recipe to have a git uri with subpath' % testrecipe)
         self.assertTrue(any([uri.startswith('crate://') for uri in src_uri]),
                         'This test expects the %s recipe to have some crates in its src uris' % testrecipe)
-        self.assertGreater(sum(map(lambda x:x.startswith('git://'), src_uri)), 2,
+        self.assertGreaterEqual(sum(map(lambda x:x.startswith('git://'), src_uri)), 2,
                            'This test expects the %s recipe to have several git:// uris' % testrecipe)
         self.assertTrue(any([uri.startswith('file://') and '.patch' in uri for uri in src_uri]),
                         'This test expects the %s recipe to have a patch in its src uris' % testrecipe)
-- 
2.39.0


