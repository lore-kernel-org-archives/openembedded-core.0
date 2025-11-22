Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09274CFD312
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:14 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3771.1763849709767269477
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KeQAjm7b;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso2694530a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849709; x=1764454509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6qrDvYIEIfh+2qIXs2fwpRfxs+PLi4NhOmViKiDRU4=;
        b=KeQAjm7bnwoDdw8jhTFcsPD+czcqTg50iPcJwNNXRFjkMvJ5c+XL1FbtFB4bvSvJRr
         6vswwVjvzay3kgrnxRZ4MDtOfuhI9PHvsg32LcsBHDxutp0rinu5/A1sR2SvrJt4G08w
         4PD6g4c0o1M5HH9Tu3slXEfyTEBfSdg6ZANJkxg9p2StRmW1zsa86RgdYRCUJsqbt2SQ
         IdOS/EKnTaq+RaCjL889Ew0ZyCRuYYyLTf1q84I5nSN5AwL+4BWEIV3tm7UV24+LHq+5
         UhHsp7Ji6wTH069YaAV/F/fWKS68EHCbRXWGuI3DlAj7VJgqeTxI6AJGacmm9AouczZv
         Ld8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849709; x=1764454509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6qrDvYIEIfh+2qIXs2fwpRfxs+PLi4NhOmViKiDRU4=;
        b=ADu5E1/37lVGEPL5VpFCXHzc1IbAqpqE+23eBimn9SD5tKD3OtjB3YWIouOPmLYjgi
         fqZxCQunh7hoU4CdnoXl9BB4R3OTWvBAv4e+msKJSgsZ97Z9/xjpLSYV5fcAyMZSejUu
         v+9nztHOHRoVlATJmV2y5ETmzjinp9KaLA976IRToFDcO5xmV0U0lF0N+uJxf7EjKI6V
         E/1lm+0VNnYy+WjA8X+urRlmzfirFF6XZIDKzx3h0sXtSBB0SoaK5+B800iPpSDpIvIm
         /rUnI/rZuOc79nbRyAN0vw9WeQVWiVTvOzSHhSTwSXQdrHsdyiaCL6YqQQEK7x5AQs5E
         b2Uw==
X-Gm-Message-State: AOJu0YxlfQI/eq92xDySxgiE1NBIo+6YocEp5XXJQ+FE2h/PdIuF7L2L
	2yRoyyrYw2jIMPhYWXjq2QpUsTIZLGG+mAMNwAZnmHRUI1rhApiyyXD2ohaEWLrMVPYpssCukCJ
	T2RuB
X-Gm-Gg: ASbGncuatUZH1OTScXa5lnxP0J4JWY73TGamylXzGAokkbIt+ntuMz8AIJbcHMDHPeg
	uM0yhEpiq7yT/4LuMJOw1HhBbr2zzhQUUtkgMqOLY6bY0BKmE0BSw0Zl1WQKPxLTRNaL4UG2OZK
	nEq8zyuFf6hVvJSFaNMhGAFdbecXN4XCnCpIkEkSM7h6ko1IF45TtDhS+TKjhRsu80FV8TARfOq
	HUMNnw4duEElVbcMFx8d/QhirfBmSmVv2iDZd60r9hpipeqpQGxFvOgGOBTubMeC0KWyhcrGcpD
	sJWCBwkMWT5B1hxIFXchcxUEL26gD/+p0pSjMhtOj+AfgVh5QxqQl8wxEy4uTyM+EyClkI6YnhI
	i/+t7dWKt8EyHczkIr7mEqjLWf+bmL5irm2yTWJCzyi7ERZsWnmjZqs6XqSYdbOExdNxnbz0yNl
	sqLQ==
X-Google-Smtp-Source: AGHT+IGmO1Uzxe5PC97n5Z2rbJ4OXAY+y9P36RJSOypf6la11wdoBxew3NDQkmEC58QMAfUfeDx9NA==
X-Received: by 2002:a17:90b:1c85:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-34733e46dc6mr8631682a91.7.1763849709008;
        Sat, 22 Nov 2025 14:15:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/21] oeqa: fix package detection in go sdk tests
Date: Sat, 22 Nov 2025 14:14:25 -0800
Message-ID: <82a46b70bfba7c4ce4fd20e2658b182b03e55037.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226717

From: Peter Marko <peter.marko@siemens.com>

The test are skipped if architecture contains dash because TARGET_ARCH
contains underscore while package name contains dash. Here the
translation needs to be done.

Note that poky distro default arch has dash:
MACHINE="qemux86-64"
TARGET_ARCH="x86_64"
ERROR: Nothing PROVIDES 'go-cross-canadian-x86_64'. Close matches:
  gcc-cross-canadian-x86-64
  gdb-cross-canadian-x86-64
  go-cross-canadian-x86-64
TRANSLATED_TARGET_ARCH="x86-64"

Quoting meta/classes-recipe/cross-canadian.bbclass:
TRANSLATED_TARGET_ARCH is added into PN

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
index a050df7a9f..693be89e1d 100644
--- a/meta/lib/oeqa/sdk/cases/go.py
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -25,9 +25,9 @@ class GoCompileTest(OESDKTestCase):
                         os.path.join(self.tc.sdk_dir, 'test.go'))
 
     def setUp(self):
-        target_arch = self.td.get("TARGET_ARCH")
+        translated_target_arch = self.td.get("TRANSLATED_TARGET_ARCH")
         # Check for go-cross-canadian package (uses target architecture)
-        if not self.tc.hasHostPackage("go-cross-canadian-%s" % target_arch):
+        if not self.tc.hasHostPackage("go-cross-canadian-%s" % translated_target_arch):
             raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
 
         # Additional runtime check for go command availability
@@ -63,9 +63,9 @@ class GoHostCompileTest(OESDKTestCase):
                         os.path.join(self.tc.sdk_dir, 'test.go'))
 
     def setUp(self):
-        target_arch = self.td.get("TARGET_ARCH")
+        translated_target_arch = self.td.get("TRANSLATED_TARGET_ARCH")
         # Check for go-cross-canadian package (uses target architecture)
-        if not self.tc.hasHostPackage("go-cross-canadian-%s" % target_arch):
+        if not self.tc.hasHostPackage("go-cross-canadian-%s" % translated_target_arch):
             raise unittest.SkipTest("GoHostCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
 
         # Additional runtime check for go command availability
-- 
2.43.0


