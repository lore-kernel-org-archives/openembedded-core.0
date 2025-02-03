Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208E2C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 23:49:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.103983.1738626541042596753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 15:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s+y4i/qZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso36912855e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 15:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738626539; x=1739231339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPjs3UEwB3l8oKyXgobzjkXu+4/KLm7aJ7xS5FOaPxM=;
        b=s+y4i/qZjvMSurP+9aiwj1uSYfVa/FW21Lq+igqQ/QhQfu1U5yT7EoY+YAUJoa1gPE
         onmIkgyH8XwB7IM6KID21fkiGiZeb26RJ4mNnWmta95BqGoVgE5DMzk6V0lf6eyrwbm7
         qX+NGh14DpRp1JPO2Fw/1P2VY2lXTRclx+044=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738626539; x=1739231339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPjs3UEwB3l8oKyXgobzjkXu+4/KLm7aJ7xS5FOaPxM=;
        b=RWGn51FXMmX4WApjhwsho6h7MVavdNT4KV+RE9QByRmumvOIbR842B9VmFPZ7ek/lT
         LgWULCW+eCKNw9XT6rZJm6cAWUVt1mHcvmeaXzDAli60CKe9htFRr7gdSkLCe0HglpzI
         J6BVmKn1hIcp2bmlaeaZTU5PDeI3gLqz/4e2+02RwvMenFWMdJ5bVtaiSZvqmAsnMpFK
         sC9wQBiB5RbJ+m33ppJWx00iBdmpuqMwBeYIzO9xpIaxXXAjcYEewmbep8iUUkTf6fl5
         aNytoldTO+PV+zqDDN5qZoQ2pazzUjQzCgIf7W9srYUXZBIIZWFZ9bu8BnoaIIwr1DVO
         AZpQ==
X-Gm-Message-State: AOJu0YyUtTd2yC4MOg3L7LyVK+l+ryFuT6CGbxAqSeD5Wm8HX7PI7Uur
	eRdy3904WkZo8Q7VMVsEm7OzdMdiP9ba0iz6xKkPUhhlDjfCK7LkORHDIJ+H0dzhv2q/VP42AWv
	g
X-Gm-Gg: ASbGncv1PUJti6fLCNZYggFwjVPlcpkZ6MlXZIdEIB1++IkQS1AXALHR2z8OAk4yrLQ
	jMOFEEgNBVrhk0h8eKlpQdHE+fkvb0+tqxHRcs1OBsv0k1I6CFwtNq9UTv73oiyvyt3246HRkA2
	HKjpXcDaPEEOSme36cAasSyaja1E/Wr/W8WDKdk4z3PPXORbQ16CC4rHxa7NdHeEj7joQrR8H2C
	iXzf9Cwir0gP3a0jCBj1qukkeFYs97IoHXN/mEf4GZG/ZJNQHDbwwlJW580olYBzRLFaXdWhhVX
	OjPUAlCt/82Q2B5qtwtd4hp1qhEyVf3Du81q3pWC+4lX0vIrU/+ObAxdoUJ/TapR6n7ykII0c/E
	ycYbs/56Qg+9Hsnp4srIztw==
X-Google-Smtp-Source: AGHT+IFdIXLjR5TIhxiViuSPVKKpWKYLH18rw6i/bG5PG5KpNugVQqJvbKsFfa2wc7hevMelZu4Ahw==
X-Received: by 2002:a05:6000:1446:b0:38c:5d95:305a with SMTP id ffacd0b85a97d-38c5d953273mr14759254f8f.26.1738626538903;
        Mon, 03 Feb 2025 15:48:58 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm14314537f8f.98.2025.02.03.15.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:48:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] selftest/reproducible: Add a method to test a single recipe
Date: Tue,  4 Feb 2025 00:48:36 +0100
Message-Id: <20250203234836.3635582-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203234836.3635582-1-yoann.congal@smile.fr>
References: <20250203234836.3635582-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210744

From: Yoann Congal <yoann.congal@smile.fr>

Introduce a new variable "OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS".
It can be used like OEQA_REPRODUCIBLE_TEST_TARGET but will try to use
sstate for the dependencies.

This can be used to "quickly" test the reproducibility of a single recipe.

[YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
NB: Some dependencies are not from DEPENDS and are therefore rebuilt
from scratch: In my test I found that PACKAGE_DEPENDS,
PACKAGE_WRITE_DEPS, PATCHTOOL create dependencies that are rebuilt in
the reproducible test but I'm not sure it's valid to explicitly prebuild
them using sstate.

What I need is the definitive list of recipe dependency in the task
graph of my leaf recipe. I don't know if I can get that easily, parsing
$_taskdep maybe?
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 30eea2675e..1e094892e9 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -162,6 +162,7 @@ class ReproducibleTests(OESelftestTestCase):
             'OEQA_REPRODUCIBLE_TEST_TARGET',
             'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
             'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES',
+            'OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS',
         ]
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
@@ -170,12 +171,17 @@ class ReproducibleTests(OESelftestTestCase):
         if bb_vars['OEQA_REPRODUCIBLE_TEST_PACKAGE']:
             self.package_classes = bb_vars['OEQA_REPRODUCIBLE_TEST_PACKAGE'].split()
 
-        if bb_vars['OEQA_REPRODUCIBLE_TEST_TARGET']:
-            self.targets = bb_vars['OEQA_REPRODUCIBLE_TEST_TARGET'].split()
+        if bb_vars['OEQA_REPRODUCIBLE_TEST_TARGET'] or bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS']:
+            self.targets = (bb_vars['OEQA_REPRODUCIBLE_TEST_TARGET'] or "").split() + (bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS'] or "").split()
 
         if bb_vars['OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS']:
             self.sstate_targets = bb_vars['OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS'].split()
 
+        if bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS']:
+            # Setup to build every DEPENDS of leaf recipes using sstate
+            for leaf_recipe in bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS'].split():
+                self.sstate_targets.extend(get_bb_var('DEPENDS', leaf_recipe).split())
+
         self.extraresults = {}
         self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 

