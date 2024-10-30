Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D47CD6B6B7
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 17:08:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.20752.1730308108931365119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 10:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Avk3v7Ra;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so25966b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308108; x=1730912908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sveDlogw3ytE7R7FNhqNoZXCY3xI/dgaY6niLztg72M=;
        b=Avk3v7RaGbg+m2MUARGB0azf+tz3KFHMB+Sq+k5tC6Qv1QtSMmecWSPKFgnU/L7Vk/
         VFfde2y2hxPRJWuHI3HvFti5nyhRFXWijU4mcd8KCWSBCTqRAC+IH8iGNfAq3+aYeNAL
         y7NMq42F2n5PkFQ1L66Pe2ujKdX3vFVXJ/bN9LVdwTrGfWT3k63/H9296/+pnfslQAIc
         omVkRzKGJ2HHmx4p3z3bWqPIXFnhM1Bsr/X03/riES7Dvfk/xYOOcDMG2tH/CTQr5iCt
         lyhcFac/LGPmk+eXdTXa1ZQhtdPASQA7y5acCLqf1D5gGQfV9FbKpDlQPi2A8XecAQnd
         6R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308108; x=1730912908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sveDlogw3ytE7R7FNhqNoZXCY3xI/dgaY6niLztg72M=;
        b=ka49xBowj+7cOXH0F3wv3A3/8c734v6EGDTtcb/VSntQuy4KRmKHcDdNoW+snSMQyq
         ofuX6mAuLlQ1t4WK+GmKaBFwG4mhuqtR45YPKddgbUjhTKW9iuJ9rEBbhe/rDW+RTwci
         aOBjBBiF05uFik50F63hgWQxu3G7jabsQ46yQ106RHS3bJKgcRaY6pW5821iBjT/Jw4x
         f+I4MoMCiiN/t+w0ENx3DYNwXngR7OWXBlw30P1NHtUWxfiMMn36RjAvo/yTHCyHbj1R
         BnD7TE3pmyz7jwCXO/7ZXgK4X6jeYsKslkQ2F1LpzvGDcWEjabSDUWabhKME5zYX1hgy
         DHOg==
X-Gm-Message-State: AOJu0YyUI5MaXdAb2aPzQYtKvZBkFAscFXgmoVI/6bPCf7yvCNCCplCD
	r+fDN1SQAjSaJlpKO0R0fuR95Eo0ysE3ljnMTx3+30gbHEiCaWMSeSSsqL8R
X-Google-Smtp-Source: AGHT+IFZOA1DBhZ3E0dq9Psljqg8mZEUaZ3OchE+RT2i91b7JoYHFTOxSg7TZGcSeJF3SJCyZFBxVQ==
X-Received: by 2002:a05:6a00:2305:b0:71e:7046:c0f8 with SMTP id d2e1a72fcca58-72063095e6emr20159009b3a.26.1730308108093;
        Wed, 30 Oct 2024 10:08:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::35b3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720579397d8sm9540744b3a.86.2024.10.30.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:08:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-jsonschema: Fix annotation for validator_for's default
Date: Wed, 30 Oct 2024 10:08:25 -0700
Message-ID: <20241030170825.607520-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 17:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206555

Backport the fix, it helps some ptests on meta-python packages
e.g. pydantic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...96a6523875c9694fcdf468c9f458323d07f2.patch | 44 +++++++++++++++++++
 .../python/python3-jsonschema_4.23.0.bb       |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch

diff --git a/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch b/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
new file mode 100644
index 00000000000..65cc2b4cf0a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
@@ -0,0 +1,44 @@
+From d71f96a6523875c9694fcdf468c9f458323d07f2 Mon Sep 17 00:00:00 2001
+From: Julian Berman <Julian@GrayVines.com>
+Date: Thu, 17 Oct 2024 09:36:35 -0400
+Subject: [PATCH] Fix the annotation for validator_for's default.
+
+This still doesn't seem to satisfy mypy, so tell it to be quiet.
+
+Upstream-Status: Backport [https://github.com/python-jsonschema/jsonschema/commit/d71f96a6523875c9694fcdf468c9f458323d07f2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ jsonschema/validators.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/jsonschema/validators.py b/jsonschema/validators.py
+index 85c39160..b8ca3bd4 100644
+--- a/jsonschema/validators.py
++++ b/jsonschema/validators.py
+@@ -857,7 +857,7 @@ def extend(
+     version="draft2020-12",
+ )
+ 
+-_LATEST_VERSION = Draft202012Validator
++_LATEST_VERSION: type[Validator] = Draft202012Validator
+ 
+ 
+ class _RefResolver:
+@@ -1334,7 +1334,7 @@ def validate(instance, schema, cls=None, *args, **kwargs):  # noqa: D417
+ 
+ def validator_for(
+     schema,
+-    default: Validator | _utils.Unset = _UNSET,
++    default: type[Validator] | _utils.Unset = _UNSET,
+ ) -> type[Validator]:
+     """
+     Retrieve the validator class appropriate for validating the given schema.
+@@ -1396,7 +1396,7 @@ class is returned:
+     DefaultValidator = _LATEST_VERSION if default is _UNSET else default
+ 
+     if schema is True or schema is False or "$schema" not in schema:
+-        return DefaultValidator
++        return DefaultValidator  # type: ignore[return-value]
+     if schema["$schema"] not in _META_SCHEMAS and default is _UNSET:
+         warn(
+             (
diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
index 126258255d7..82b7bb23ed7 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
@@ -4,6 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
+SRC_URI += "file://d71f96a6523875c9694fcdf468c9f458323d07f2.patch"
+
 SRC_URI[sha256sum] = "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
 
 inherit pypi python_hatchling

