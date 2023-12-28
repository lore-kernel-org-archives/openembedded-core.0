Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939B3C47077
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.124149.1703775581264436348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glhxXH3Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d60ad5f0bso13072255e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775578; x=1704380378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62AKEId2woukg8VCdNIMr6sxFEAFB84GqB/Z0iWvPPs=;
        b=glhxXH3ZxBtCiSBudvFGADRTDaSEuiZBzjdBfH2EqLrqxt8QsbIHw/NFpDjtc8Wu09
         lA7/SwdyMieCCUH7B3hR1MNCTx0+N0zXOjgoX3OprRnyVu/jhL/HlmRGn5wN05x6v/Au
         BV5FPKyaFK0wzxsw/daxFIZ3enRglSzB5KTVv9+ukyAMW6gsuBgNf4DiloDBACprYEYD
         PXWUxkEBlNSq0E0CGWtt+IdaKJ1iFCEVb2ugK/uOyRWkDox5w+ipQ9/XfWQYkYVe5nHd
         VP7h99GWqnXJ0gnRJdy9NDiil5sAik+N1iTyabUx0c1+9Vq4NqC28q9G6lXuMl9uQbEy
         /Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775578; x=1704380378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62AKEId2woukg8VCdNIMr6sxFEAFB84GqB/Z0iWvPPs=;
        b=qwIho/10OSmXbY/21IMzUT6XPZ1YXWRg0oygfZEv95lWFr0PmMn/v88/8H9JxO94iR
         Maa2ClUGGSIGCHcT/k6jYUVx/KXRqJmz2G84zdRXIdB0mP/hcMj26OIQQbIAIF6fyzwr
         j+e6uFq3LQb6SJ7TwaLMBhuFi0ElUg3kF5sd8whvKIFGNVbazdfBk0p7NUX+66h3JZJt
         LThNIREg5ZjV2n+WyRfYM27nYcUWzefcRid7OG2ZusuTyEMWso5K/LRX3bYSl2Vt+65j
         rHNI6v6iP8HBZ7PZBBKp8KqiDWzXRL7tx1xB9LCe1i8EKpRI5RYFUs1CUX8YIlc/hkxm
         55dg==
X-Gm-Message-State: AOJu0YzZyAiaj7HbH3C31qsggPeKnnHmn0M92VVzzo2MnVTte157yTn/
	PhULwPkUAuStfDtFkcSvSzzdPzQxhao=
X-Google-Smtp-Source: AGHT+IFNFxfvoiABa7+T872csScO5bfWUa9oyp8rPHtxWmRgzfVY+JWtY7BZMzPWKSzM/Xzy9uqNWQ==
X-Received: by 2002:a05:600c:6997:b0:40d:581d:7117 with SMTP id fp23-20020a05600c699700b0040d581d7117mr3047293wmb.82.1703775578441;
        Thu, 28 Dec 2023 06:59:38 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 01/10] devtool: selftest: Fix test_devtool_modify_git_crates_subpath inequality
Date: Thu, 28 Dec 2023 14:59:08 +0000
Message-Id: <20231228145917.18147-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228145917.18147-1-alex.kiernan@gmail.com>
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192982

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


