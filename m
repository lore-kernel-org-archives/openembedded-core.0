Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55164CAC58C
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.900.1757438261573164044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BdZPiFVq;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so3613017a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438260; x=1758043060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFkntEqHgBhPArySb0ljeqNmBm//WgseDCwtCE8gIV8=;
        b=BdZPiFVqNX8a8Q5CuM+iVtMwg0wUDCEVzw3GBD6nTWmkEigIW6wyjpo/Z6V4xT8hzD
         70Fv8gxOrAs2fXbB8ZffIGb+T/TQdyMDkNWl03O0uTzjDShKzzUNFk/5gKZ8BNSSdR/S
         yl8Gn3CYlzGonKMt8azJQjkCh0FP2gVXxBE3pjQWxoPYFrvX46TQ977mnhGmVYzd7Xq0
         d5sR0g/sId7xOLEGEgCqvsXFeI4TkI1wHv5YYdoSWmSyfCINX50lSP70tmSWZOdARwA6
         4mX0hdnwZ2Uaur4/AFhRi4wYWaFqTnznn+C9jsoynRt/NJ7+XgW0QQaKC9J9gCuxZ1Yh
         /Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438260; x=1758043060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFkntEqHgBhPArySb0ljeqNmBm//WgseDCwtCE8gIV8=;
        b=TfMM5LKNWhjJjWU5xgTte+3sDUyTol2XQqFeXnEa/jCfEQjqyX3zSpko73/ty5yr0g
         akd6zdT+og95EW4CKjYySQK2EZbZP69SFxkS1sBGIhlK4ujj9rtbhBjkcXCYLaDqB0nQ
         e+2OfRNAISo+bUB6MaCXdTRl6O6tQC88o+1i8xcFUmyEz+RqrkDtmCLim+JL8c+Jf3jA
         V7iF6ot8PLfdyn+3AnaONdGuhNvlyp6UukipT14V8/WLt7swNzlHSkqR9bslnSvqJBuP
         /5V89RGasK6AJUWdNIHNdWbmo0dxieZKOx8eiF+TMzhp9yf46Nf9RmPhQZvr4RamXAQI
         obsg==
X-Gm-Message-State: AOJu0YxGJvtRd1KFBXkxxGNvjs09wwCXK6eT7cd19BzcSdqydyR+K2Ox
	ofmaHCeLmG8UJ65pzxkPr8LtkpvjTsaLkywNL/A+ILYhOe4vyOjSLHQXWJwDdg==
X-Gm-Gg: ASbGncvPZB/hr+jgpqP/5uUN+Y/JDM8MI3IYGuynonNi0K/neNvMLgSE6oSEHRLn2m6
	74Fa1k/n5yrP2Y+bKnJiAIGZomd+JRdG/oo+8S4AeSYLrMLtBEFv9mrzsDqNHHZi1AnQMqcmmQz
	MVp6ekzGobEvNMWAKjSg1G7hE7hS76RT/gmFGXgt1prlFf54PlMNkHkXE6qh1Dw1sfIFFlYm6PA
	dB/uhjUT3bwAm+oq+y/ix2+x5//jDYBYhiRsLy6AAGVCs11Ak8rmzk+HHfrxcFnUVG5psYqi3Py
	2F3Tlq0ylot1SsBn/3A7q1Nm8ioGlBkcnoDk9mkD8lUTT7Yy+OUUQs8HU3pDrd5ym1hcw+SMF+a
	GSpn4FQrAGIwGYR5k1A3RR2Q27/j+vd8EdMzq
X-Google-Smtp-Source: AGHT+IGB/l+fH7DAszZSvD/rZ4gBXdf3aWTi9If442qFAmssRze43UWIifDVVj0iPXm63ppbCm+KEw==
X-Received: by 2002:a17:907:97c1:b0:b04:23e0:5c0a with SMTP id a640c23a62f3a-b04b14526e6mr1266459566b.20.1757438259896;
        Tue, 09 Sep 2025 10:17:39 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b0783411a26sm19932466b.99.2025.09.09.10.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:17:39 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 1/3] license.py: avoid deprecated ast.Str
Date: Tue,  9 Sep 2025 19:17:33 +0200
Message-ID: <20250909171735.1588343-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223127

From: Martin Jansa <martin.jansa@gmail.com>

* it's deprecated since python-3.12 and removed in 3.14 causing:

openembedded-core/meta/lib/oe/license.py', lineno: 176, function: visit
     0172:
     0173:        LicenseVisitor.__init__(self)
     0174:
     0175:    def visit(self, node):
 *** 0176:        if isinstance(node, ast.Str):
     0177:            lic = node.s
     0178:
     0179:            if license_ok(self._canonical_license(self._d, lic),
     0180:                    self._dont_want_licenses) == True:
Exception: AttributeError: module 'ast' has no attribute 'Str'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index d9c8d94da4..ac5b296e60 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -172,8 +172,8 @@ class ManifestVisitor(LicenseVisitor):
         LicenseVisitor.__init__(self)
 
     def visit(self, node):
-        if isinstance(node, ast.Str):
-            lic = node.s
+        if isinstance(node, ast.Constant):
+            lic = node.value
 
             if license_ok(self._canonical_license(self._d, lic),
                     self._dont_want_licenses) == True:

