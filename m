Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C13E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 11:25:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.16783.1736335514031482758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 03:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmaWOHi0;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so187765765e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736335512; x=1736940312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9tfbSQ9Xob3G9MEzBRmASjeWvkRxgCFpE1bLjkByvo=;
        b=mmaWOHi0WQ6zbe3mC/O/fGETamJzfK2GWHukbfvaGkcbM9Rc+UwPzRceibOUL3I4b8
         /yCxWk0y32u5tlrAxulHES9ZHGPHvjukrZkNbpK4/R/d9oTe+WVzfiSnG5KqNE6caiOG
         eyAHeY25AdNcIPhk7JzCLbbnZHejXNzfq9xOw8W+mwTNfMzhh/KS2qI8gf+umvW2OmmC
         GdCNEqVwG7eqPt/HggoXxKZs3EmwBxLAo/BT5f/ZbFSHeP7rW3VruSRn6fOFNLsw0z2k
         04m4j5gFxOrxwAo6+75Y6ETTS56aJl7jgnBHuG8TfAsBwZQAo169lC50YR0tl4UeM8zp
         M61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736335512; x=1736940312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9tfbSQ9Xob3G9MEzBRmASjeWvkRxgCFpE1bLjkByvo=;
        b=scFzwZP2HjM18UaJXpg5QzG09wnpea2K29vFtA3FhbbsaVNn3VX8JPzO4NoP66gBCr
         pNlgYRGa/F/yn+7nhoMJ9UbgJGiZLW4sdMwA5+rJiB5Y8c31NRIyjtonmrzzgO72/HZE
         sP5TUb2q66mDpaYM2yPnodFVwzl9E09gMlmu9guHsu581oJuplYrAqgYSVvKkqMgSVSn
         9VnM9TdGD+wHEcBQUkABcUTAHRPMlD0PTi33vmGl1j3OlmTF451OazjH/m9MPHVhzu1C
         BcNTp/RPTKA9xAoB6Sk4v76iwWc1mb8ykudhZMPLWCXBNqtLanw1a/gUlDbg0zPw4Uzy
         iEgA==
X-Gm-Message-State: AOJu0Yx2tx9qsTAAkHnCoG3IzH6npJBcNkYwVccTmaC5+lImPt4Shs+t
	KnFBqa89LMcL9Oi3xdb568UgLgK000Vcxlyco0zCCjrQ5gfBNfisThiItg==
X-Gm-Gg: ASbGncuYYDb59kt5SuSZTrAgXSeKRVXRu2X7OLnF/57ZUjCA5yzbHaPeLCgf4Iz8KJ1
	mzdOyzb0bgCxQp3wsGQOkxQ8j9jlJn3dIXo4I6riJQnXT25sjPS8X9ke/aRnWnfAsQf8FzJcp4W
	PUdJryWMHYaudJqfwalZYmyi1Nn1WkdBy2pfe/vmIUQeoY9B7KnyE+AuJDcrjb8YYeTwthMuFt1
	59fbrGMn4pPcSI3imEdpYASt2K3JWg8t7eylU62OFWZrEjWH8yw7KXVgPbF52pfdzSlDp2p/e/5
	kRDnzJjO1dAFRx9F6g==
X-Google-Smtp-Source: AGHT+IE7h+sGZlJOixbu7BFUGz/XvfU8BDV7sYKePIXjDrKxiD1JHWUVTAlkOJln2OFKU4Rw+M+XmA==
X-Received: by 2002:a05:6000:4712:b0:387:8604:5023 with SMTP id ffacd0b85a97d-38a8732c06amr1897371f8f.44.1736335511839;
        Wed, 08 Jan 2025 03:25:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a7f1c26a6sm4049227f8f.53.2025.01.08.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 03:25:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] bbconfigbuild/configfragments.py: set BBPATH in standalone datastore
Date: Wed,  8 Jan 2025 12:25:00 +0100
Message-Id: <20250108112500.971115-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 11:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209554

From: Alexander Kanavin <alex@linutronix.de>

Otherwise fragments with 'require' statements will not parse,
as the parser will not be able to find files referred to by
those statements.

Add such a statement to the test fragment so that the scenario
is tested.

[YOCTO #15707]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-selftest/conf/fragments/test-fragment.conf | 2 ++
 meta/lib/bbconfigbuild/configfragments.py       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-selftest/conf/fragments/test-fragment.conf b/meta-selftest/conf/fragments/test-fragment.conf
index 4c1d2409453..82dd3537676 100644
--- a/meta-selftest/conf/fragments/test-fragment.conf
+++ b/meta-selftest/conf/fragments/test-fragment.conf
@@ -1,3 +1,5 @@
 BB_CONF_FRAGMENT_SUMMARY = "This is a configuration fragment intended for testing in oe-selftest context"
 BB_CONF_FRAGMENT_DESCRIPTION = "It defines a variable that can be checked inside the test."
+
 SELFTEST_FRAGMENT_VARIABLE = "somevalue"
+require conf/multilib.conf
diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 30cc5ece079..c515a0151a4 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -23,6 +23,7 @@ def plugin_init(plugins):
 class ConfigFragmentsPlugin(LayerPlugin):
     def get_fragment_info(self, path, name):
         d = bb.data.init()
+        d.setVar('BBPATH', self.tinfoil.config_data.getVar('BBPATH'))
         bb.parse.handle(path, d, True)
         summary = d.getVar('BB_CONF_FRAGMENT_SUMMARY')
         description = d.getVar('BB_CONF_FRAGMENT_DESCRIPTION')
-- 
2.39.5


