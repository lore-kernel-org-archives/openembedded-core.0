Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537D8C54EE3
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 12:06:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11612.1724846784022307133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 05:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VirZlo3d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42816ca797fso59849655e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724846782; x=1725451582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2XAh/RTJYckohC59iS4tXCzAfOIESt6dmkHlQ2Oqdg=;
        b=VirZlo3dS3K7iuzJbXV9Eep40mFzsggu/L4flty4YwZM7bML6Q4R9MIWLM3klAsjt3
         DoGcKegbBQLCa8yLWgtQr68Tw3N2jIch77+3n28iYKa+5H9e/CZ8cZPQKlko8ViDGvGi
         KJdQvxd3+OuxYezAdtTYgXgyAeOVlZfykgaEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724846782; x=1725451582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2XAh/RTJYckohC59iS4tXCzAfOIESt6dmkHlQ2Oqdg=;
        b=Xo2VasoXzHOGxkP4GjGuEC5sELk5Zavo9hXcYFzUDXZCb9znzGk7e3iZi19BUuuU1s
         WSXDC7os4WMlpJZoGd7zPkTnm2vtVmTWsaoSxuWP4HqVsODHqBtctMBLB2BKCEKHYwn1
         y3kYNvnyf7Aboc5hLIQ9ru8CTFd1xKtm6G2tE+OAegJsgj4zjailqkEjDTPAccJVkagm
         /5wB8xFZ4z5+cPGGw63CiAL2AuYVmv24uSoweKDujxRoyyYxIlyH7/gL57keUBHQKaLC
         GbaZHuM0fzi0VJ7slIQ6OypWYlWkxBiVIz4whT2fjbePEUUr9qIXvGViNBFFKnkMXZ1s
         n6OA==
X-Gm-Message-State: AOJu0Yx53elWhs6Ed38mgIvJgbBf6cPyF50GnhjsC/75GG7SUo7VXvWe
	CIG3kzFNgfSmo4siTijdhP3btgs5+fsaK7p2GZWNK4vDPQ6VNPEoNcbbRjz+lteKEppHjEbz2TV
	B
X-Google-Smtp-Source: AGHT+IFiQGxZcg0TiMU69DhiwJ+QNEGvS8CbkbnY+2D0KBvtUDm2rT16akcQ9zgcYCTOoMIIHJBDew==
X-Received: by 2002:a5d:4e43:0:b0:371:88a1:3e49 with SMTP id ffacd0b85a97d-37496857428mr1257570f8f.53.1724846781682;
        Wed, 28 Aug 2024 05:06:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffeb8sm15396085f8f.88.2024.08.28.05.06.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:06:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lib/oe: Use new visitorcode functionality for qa.handle_error()
Date: Wed, 28 Aug 2024 13:06:19 +0100
Message-ID: <20240828120620.1458816-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 12:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203880

Early functions like do_recipe_qa (which do_fetch depends upon) reference
oe.qa.handle_error() which in turn adds dependencies on ERROR_QA and
WARN_QA. This means that ERROR_QA:append = " nothing" will cause
literally everything to rebuild and break sstate reuse.

Take advantage of new bitbake functionality to add a custom visitorcode
function to handle_error which optimises the references into contains
expressions which means the ERROR_QA and WARN_QA references are optmised
to containing specific strings. This dramatically improves sstate reuse.

The qa module has to be imported first since other code in later modules
references it and bitbake can't handle the dependency ordering internally
without a lot of unwanted complexity.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/__init__.py |  6 ++++--
 meta/lib/oe/qa.py       | 11 +++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 6eb536ad284..d7604812834 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -7,6 +7,8 @@
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
 
-BBIMPORTS = ["data", "path", "utils", "types", "package", "packagedata", \
+# Modules with vistorcode need to go first else anything depending on them won't be
+# processed correctly (e.g. qa)
+BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
-             "qa", "reproducible", "rust", "buildcfg", "go"]
+             "reproducible", "rust", "buildcfg", "go"]
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index f8ae3c743ff..2c558673701 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -199,6 +199,17 @@ def handle_error(error_class, error_msg, d):
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
     return True
 
+handle_error.visitorcode = """
+if isinstance(args[0], ast.Constant) and isinstance(args[0].value, str):
+    for i in ["ERROR_QA", "WARN_QA"]:
+        if i not in self.contains:
+            self.contains[i] = set()
+    self.contains[i].add(args[0].value)
+else:
+    self.warn(node.func, args[0])
+    self.execs.add(name)
+"""
+
 def add_message(messages, section, new_msg):
     if section not in messages:
         messages[section] = new_msg

