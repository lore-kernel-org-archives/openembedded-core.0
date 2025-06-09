Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A6BC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 15:28:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.62699.1749482916637112982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 08:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EOzFK/C/;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a52874d593so4337442f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749482915; x=1750087715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/ZlfhwFpACnmvTC8BnpBAbnxYOzGNWMOdO763m3qcA=;
        b=EOzFK/C/HKi+dLlFz8YCttB9cUVqmPEOWi5ax8XGHlIypSnyO1PsKiIyCSvSojFyEs
         M+2BJyeV/tKI963ozd6+uH2PZWaj0Gc+7mNBmmW30yFL+lWJNDjcXzK/PeuTAG2/uGAr
         snb6pPeJnCN+C4zRwf1E+mY2iJENYY+cQfvbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482915; x=1750087715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/ZlfhwFpACnmvTC8BnpBAbnxYOzGNWMOdO763m3qcA=;
        b=crXr43zTgJlmAZlaekXHgnz+i4t4E1pbu/b6kwuMRz7acEykcTxjO/qdpC7B8RK4yw
         iS3HVThnFAutVa+mpGEiXs6L4txQxyYbIhf7GMx3jm5YoRPxWJ/mq83Od2eqUOP8fMGA
         +3AlQusEFeeUsdr27qGfrkTFX6N+xBXSjrwyv42tG9JF1XZlWy/PhjK6VBriyckfwWKT
         TQu23Dq/A7CCzYq17WsJH3c3TAXQT3TGKI40uT/dhCzxeuPWApckC209thuuqa+SKWvV
         Q2vY+JWpDmPBZ1gFT/CGO82QdQuVtX60CffHRRbWBHQndUBuC69cOEgUgXsNomuBvkv5
         Eq8Q==
X-Gm-Message-State: AOJu0YxYcRpwnrasCEcylj3h6bmasMuB3R2qTjAVah2nSwyUXR244KHt
	lmKhZOYiV3oc5IepuesAjh8XEvfthqpbQyC+z2oFDt8zB7PomNNEEWxK9hl31X+4U3xRuOeUHzl
	LW9pa2dU=
X-Gm-Gg: ASbGncvfSmpXv1WEI34C//ekrNn8lIjTzpQK6YRlbe+2BovdXqt6Zy6yIZKa/AxYvl8
	i1x4yyKlvcNXKr257vvi+kq4icx3IVsKDwPxK1n4khBMQiRh7fTqppIzkGjSYePSKuh6dG2UYws
	40m7wIKlk/RoYTbeEfvCkRcrsNRTP3HcQ9UyI7zbwzMjnTVJZgXVcc3E3EDgAY7iBAt1bXMiPRi
	s9z3iTaVCKr4+/GwmdJZQSaYI/2CE6hLCsnbirG1sm4HnB6ufC/HjoajtfNZ310UC6qm6rITZtB
	MZMVBdQvhpUNSQLdBdt7vFLyvtlfMQzFuLm9HLK8glIyjdEmL/AieSOlpSzMoJAaR/rpuK6q3LP
	tfpx7EPrdWiSSxYt8BOL/wGVDhBlaOqyklzfoMbo/ubB32NXuQdKnFXK6cafPbkCXRFqn3Q==
X-Google-Smtp-Source: AGHT+IGlsv3N0C6jZcU8w+h9Ce7FHGQpHfYcolXollx1/IBcMRcB3rqkBhX9F00fU98W/6kEyxJOaw==
X-Received: by 2002:a05:6000:1ac6:b0:3a5:2f23:377d with SMTP id ffacd0b85a97d-3a531cb1037mr10510785f8f.50.1749482914612;
        Mon, 09 Jun 2025 08:28:34 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm10116058f8f.63.2025.06.09.08.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:28:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v2] reproducible: allow each layer to define its known non-repro packages
Date: Mon,  9 Jun 2025 17:27:58 +0200
Message-Id: <20250609152757.1153027-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 15:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218296

From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

With this change, layers can use a conf/include/known_non_repro.inc file
to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their own known
non-reproducible packages to make them automatically excluded from the
reproducible test.

Example of usage, in conf/include/known_non_repro.inc:
  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
        this-package-is-not-reproducible \
  "

This uses the new "include_all" in the reproducible test and will move
the maintenance burden from AB config[0] to the layers themselves.

Fixes [YOCTO #15699]

[0]: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n343

Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f06027cb03..94d3db3677 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -14,6 +14,7 @@ import shutil
 import stat
 import os
 import datetime
+import oeqa.utils.ftools as ftools
 
 exclude_packages = [
 	]
@@ -158,6 +159,13 @@ class ReproducibleTests(OESelftestTestCase):
     # reproducible, disable this in your derived test class
     build_from_sstate = True
 
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        # include layer exclusion files (populate OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES)
+        ftools.append_file(os.path.join(cls.builddir, "conf/local.conf"), \
+             "\ninclude_all conf/include/known_non_repro.inc\n")
+
     def setUpLocal(self):
         super().setUpLocal()
         needed_vars = [

