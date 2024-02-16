Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E112C48BEF
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:17:10 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.806.1708100225385185573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/2ZerW9;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-296dcd75be7so1814134a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708100224; x=1708705024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKymF1tnbOFjYo1S3h+eVOF9vuTYx0NNK7/OcCzAvJ8=;
        b=D/2ZerW9csCK0MzP6PWKWz3SSMoSjCg9t5mW89C3E8w4klVo0dcT9GH3ZA1p0eEwSi
         tx/L9QAdgjbSexhMiVqp8LyAFIk44eCJh+W3uK3xpx2aE73qglKxpEs20xvlRqL1dMww
         UEihl5yToCAWdML0wh4XkpnZvZEMbeFMH/RlgrOM+pjHCrAkFBcBfVXJdaZ0vWfMdlbJ
         x6ONeP7bhT8a6k1GjnkT+Qvl1YekyGT/p4lKq+hVHMTWO8rBNhyzoxOcf3iarJAeObtV
         SAE1JLuGBep58NJQdtEENxQZw2q0tvx6uRjA0AgWRqik2x/dpadGew958AbCuUgC+iqN
         8nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100224; x=1708705024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKymF1tnbOFjYo1S3h+eVOF9vuTYx0NNK7/OcCzAvJ8=;
        b=hel8BdXxTkwHprZM7pBAme4CvrnhlhkUXxDYPRvMtXJfzrJHGRMoIST66MuNHWmUBK
         bBL3G+rtjmEao1c2EbH3vB1QaTHJCnZcxlz0X+rm/tZxcTVp9F0AsMlNlAZi+VfD73nv
         V4L9V6i9pNWeIJ8DYqQqyHGPOewCqwenR/0JYMFT2OXdS5la7060zHkBnzkWNQdjtxwZ
         dqZiu+H+DdIZoVdbVzksfKEaXP5GrmID6anVpYcBZudhD2D9TAFXXVTcLxsFSggD19T8
         +X/wI47561EB4Vw/x9DHv/LPG4SNeUM5x/fmmu3ADpEVCF+xdWE0J9pSQG1lOnZWPebB
         ByCA==
X-Gm-Message-State: AOJu0Yw5KksBy+Yygf5VQoM/tWGPX1QRtV2kcmHz6Hghl4jQjeYsN1Eh
	nYIYaRi6D7JCxIthtRQkTQgvlv3/2OAhljUKiH9gEsBwbH15/4Uw8qmSqIEu
X-Google-Smtp-Source: AGHT+IHeNv+E9sE+7fdRMhfPlO6VW+u7apTq4svRdTcij1RNnk2uUL478dcNXc8gEwO9I4VG5z6byg==
X-Received: by 2002:a17:90a:3ee2:b0:299:2434:e4b1 with SMTP id k89-20020a17090a3ee200b002992434e4b1mr3710688pjc.2.1708100224362;
        Fri, 16 Feb 2024 08:17:04 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:ef9e:327e:12eb:73bf])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a528300b002990d91d31dsm198925pjh.15.2024.02.16.08.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:17:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-attrs: skip test failing with pytest-8
Date: Fri, 16 Feb 2024 08:15:56 -0800
Message-Id: <20240216161553.3217554-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216161553.3217554-1-tim.orling@konsulko.com>
References: <20240216161553.3217554-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195779

tests/test_funcs.py test_unknown test case is failing with
pytest 8. Skip it for now until upstream has a fix.

https://github.com/python-attrs/attrs/issues/1233

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-attrs on qemux86-64.

 ...funcs-skip-test_unknown-for-pytest-8.patch | 30 +++++++++++++++++++
 .../python/python3-attrs_23.2.0.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch

diff --git a/meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch b/meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch
new file mode 100644
index 00000000000..bb69c0f1573
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch
@@ -0,0 +1,30 @@
+From cbe95e1aa6d95195dce13406a6f0522b2964babc Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 16 Feb 2024 07:17:19 -0800
+Subject: [PATCH] test_funcs: skip test_unknown for pytest 8
+
+https://github.com/python-attrs/attrs/issues/1233
+
+Upstream-Status: Inappropriate [Test case needs to be properly fixed upstream]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ tests/test_funcs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_funcs.py b/tests/test_funcs.py
+index 044aaab..0872c31 100644
+--- a/tests/test_funcs.py
++++ b/tests/test_funcs.py
+@@ -593,7 +593,7 @@ class TestAssoc:
+         for k, v in change_dict.items():
+             assert getattr(changed, k) == v
+ 
+-    @given(simple_classes())
++    @pytest.mark.skip('Broken with pytest 8. See https://github.com/python-attrs/attrs/issues/1233')
+     def test_unknown(self, C):
+         """
+         Wanting to change an unknown attribute raises an
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index 7b6a6bd94c9..cdd78c2bd9d 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19
 inherit pypi ptest python_hatchling
 
 SRC_URI += " \
+	file://0001-test_funcs-skip-test_unknown-for-pytest-8.patch \
 	file://run-ptest \
 "
 
-- 
2.34.1


