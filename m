Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DE1CD4F25
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.16023.1695367500993519567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WdnXolSl;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-530ce262ab2so2003886a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367499; x=1695972299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ltyxl9hGvZB97iBGDusNqsWGZW3TKFjhZVY7NFRXSeU=;
        b=WdnXolSlcgFIRRncRq5vW8IHHxtZsWW+W+7Vv9dqtcwFTJMDn0w9PdmEqToYu75uVv
         JX/x8cWcM9tpRjLh8aQ4At4e3kMUtrIC8LKOWVL3AFBMXxt5AF/uTWEb7DogBjv7XjUK
         YgaVkKi7TM3A5Fngr93uS/1Jjn7r0HXTmknjsrxUW67a+1KvB756a/wTahxBESBKGn6R
         FaVnE1dHnNPn7i8NfzigfugQSl3LzlhbA1gVHEGOS0Wd6KScddtaJRkGQbjpY47oF9hC
         sOgQ1NA/Uo+CiHarg9n8ERpwSef36m8F6wxpoofDlbYVjRc3swvbaiIVQWcnV8t+7W5x
         mY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367499; x=1695972299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ltyxl9hGvZB97iBGDusNqsWGZW3TKFjhZVY7NFRXSeU=;
        b=DXGhFLNi9W/LdOwwGFc17feMbaDt83ePMRkH683SMc9iGcEGbA+82zROJCGKsFHeB8
         WIXOMVIoyk66ZXH0cbVTJ+jIzvCfP65Qbw6rHpk2TGS1N0tVQ8N3ZoQ0rGDX+zhP7nwG
         Tcg5Cpriqxiz+z9u6q2CAWae36YWwLyCc3dw3eTe3XqwFk3VoTBj4vU+Vosc0vYMaJCg
         tnLwDgE4u2sTYYpdz0IsSvVTJUZIzzwe697E+2ecwQ+pkIBzCGG3RdLdaFjiSzx+/1GC
         FV+iBCYt5P0dHE5yg1BDbRl0Ngq1xpCSKPvobs74s1EKt4E+3i148q1iPwKyinDD4HxJ
         JaEg==
X-Gm-Message-State: AOJu0YwfXYkVFb7rEIfXtRFbjg5N7hpQPOQApu16kC2boQL6qVxCiUdd
	JPgoitOiW2gOZOl4bfmrMn7c91nQBsQ=
X-Google-Smtp-Source: AGHT+IFhIbREy+/kg6H3Otab1OHE6MUSZEAmdS/3mQ6ubeCmJabEcFZV069VAYPRuvNHSCJfYhnV0w==
X-Received: by 2002:a17:907:1de4:b0:9ae:52af:1128 with SMTP id og36-20020a1709071de400b009ae52af1128mr5437180ejc.70.1695367499393;
        Fri, 22 Sep 2023 00:24:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/40] python3-setuptools-scm: fix upstream version check
Date: Fri, 22 Sep 2023 09:24:31 +0200
Message-Id: <20230922072431.1481743-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188082

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
index 7961ff71989..bb13c654606 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
 
-UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
+UPSTREAM_CHECK_REGEX = "scm-(?P<pver>.*)\.tar"
 
 DEPENDS += "python3-tomli-native python3-packaging-native python3-typing-extensions-native"
 
-- 
2.30.2


