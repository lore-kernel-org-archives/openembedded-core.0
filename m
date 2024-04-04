Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D70CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 12:26:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.36542.1712233568201359178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 05:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=iXiq/vRc;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-415523d9824so8652165e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712233566; x=1712838366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EogffJ/kC3uUhJcsgVF7A7oR16D4bfPdCDBuAGwhLY4=;
        b=iXiq/vRcyVcGc9as7RNm52dtcP4vXCiOZxPd7sKxytsqHASM5n+xh78do8Bjlo9ldt
         BL4KqmUOlbIDuu02Y7VBrxhhFXZEojrc8zK98MOwlyMdreH2T+N+HFRxsQUmA0YSlps9
         +Wz0C2Sn1LKDsINGO+tJiC0amIRxmPpcZ1AnAXU8GZwptn3W7OAvOThDj53tDkZP9spp
         LTO3wia63cFJZXq0LlKj7GDbfPA/t2pop4uNwRDEI00FgikXRuuFg/Vn3x7fK5YezvRN
         BHTyaCFJuzqSk8j44IDssaf6WN5ihdyCaV8NT7hNsO5IZJkgXB4rUWq46CRxnyrMFuWv
         qgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233566; x=1712838366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EogffJ/kC3uUhJcsgVF7A7oR16D4bfPdCDBuAGwhLY4=;
        b=UsiGCYoEXb11+aUKFcdi2sHhkuP7HyR+NnK7tnKB7+lPsMMo68rUE+/RLJRB43hS+e
         2IStBZM+T49dNlIWmh6GIalLIjUMiqetKsj7C3sbtm5D2zTy9v7uoRtMhuN8GI0H9v5i
         aMM5tNSyy6pwuE2NqaFAp2MNu+j2whWfN+xvRFALtCfWAS0Opzj8Hkx58WooIlJ87Ina
         tExt5TUwTwQ6ZAi+VDW5cAMOWTgDzm0m8DU13pUXebXvmuqPfi3lQYMlKmclNXjyLhZQ
         RPjjFmHqFsxLaaG6zHJNRExVoBVSrGeEVqX3kslV1i/iAufp8el+fkw3D8acl1tgodpK
         FUUA==
X-Gm-Message-State: AOJu0YzJX4r/njczi171Crd/DhKiySXQ8q0oigA6GHte6igcsFtuE+L/
	h8gIXFI0Tx/hQXhxfdSjdZhhOkyDX25pjES29KAm7n5/t2gnM+Oo7+Njq2dgS4CbvwYM3m4hEPd
	G
X-Google-Smtp-Source: AGHT+IEAuhT6lCeNXuaRv0DFtfz2H28QbWIfIA9uZx5KRIyr02V/sGPkK7NHKuOPewlmNW7ZhpcNrA==
X-Received: by 2002:a05:600c:54ef:b0:415:533b:1071 with SMTP id jb15-20020a05600c54ef00b00415533b1071mr2316068wmb.19.1712233566435;
        Thu, 04 Apr 2024 05:26:06 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ck17-20020a5d5e91000000b003438e98e727sm4971073wrb.84.2024.04.04.05.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:05 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest/devtool: fix test_devtool_add_git_style2
Date: Thu,  4 Apr 2024 14:25:55 +0200
Message-Id: <20240404122555.34934-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 12:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197961

The problem is the following:
AssertionError: 'gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master' != 'git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master'

Mbedlts made changes to their repository, adding a sub-module, thus the
assert triggers an error with the url:
git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master

To fix the issue, the url has been changed to:
gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a1cccc39eb..bc1e40ef83 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -482,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
-        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
 
     def test_devtool_add_library(self):
-- 
2.34.1


