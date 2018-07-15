Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7917520C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id z13-v6so13418326wma.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HIV6pSXqB7KwrT63DmEqxEafsUHTsb21llk7SNbWrjo=;
	b=PM9Mx14fpzRzy31q7koWlvUHmkJbs9pesLp4z5ZkNc/A5+vmh0871306dw2MS2mS4v
	1TJ+Ij/pgUsgPVVi7Bjz0PtZ8AxdS+snI9nrW8TottYR0VduNtXJHrmhYW32tmc5zO+S
	XlP91l6G5/jGooTdj6yAMzrUdEZm11b9o4w5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HIV6pSXqB7KwrT63DmEqxEafsUHTsb21llk7SNbWrjo=;
	b=mYR4lJOXc4MYLN1TVmcSBmy7roN33AZZOrslVb7UboNcdbh1QjPTTA/9U1bfFsA7tH
	K1ynfgoclYlOIkefFQs3Gj271+tPw6nkVkeVAKniJdEmfbUm9RwfXbdpAN5wkRL0GjWY
	plG1BFtHbJ2fU9m6O7glUSn9syoIhbpSjC83+PJklPfEk6YW1A8uIgb5Rf43fxIDeyGD
	gkEowTLXB3QwSpodOicruKXbXxX+aiSU9pkpopBiGebZ3hZclftEKHD/LUxWoFNy4E2b
	ZzqcZo9WitMxow7DGO8N+wMjMjEJ36xBnKSYuC3dIt8Yngso3R/tZHqWC/KQgA9mrePM
	aHeA==
X-Gm-Message-State: AOUpUlEDuPYDxY7dqwt29p9l0QsxYasencLd0OOVCsvF/AAYRUZUDFfx
	D4ZdUblCdwFkcKlQl52J+lWRmLXWHK4=
X-Google-Smtp-Source: AAOMgpcWYDu9glaufTyfYZ0IDpSaUGSHT3NjSEoGDVDSPk/pHdHLF54daWCLC4rXyzS7Z9/0jau0OA==
X-Received: by 2002:a1c:cc08:: with SMTP id h8-v6mr7420325wmb.82.1531669010895;
	Sun, 15 Jul 2018 08:36:50 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:34 +0100
Message-Id: <20180715153641.21029-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/12] oeqa/selftest/package: Use setUpLocal, not setUp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jul 2018 15:36:50 -0000

The main setUp function needs to be called and tests are meant to
define setUpLocal. For some reason this one didn't leading to errors
with recent code changes. Fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 169698f780d..ef6eabef665 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -29,7 +29,7 @@ class VersionOrdering(OESelftestTestCase):
         cls.bindir = oe.path.join(cls.staging, vars["bindir_native"])
         cls.libdir = oe.path.join(cls.staging, vars["libdir_native"])
 
-    def setUp(self):
+    def setUpLocal(self):
         # Just for convenience
         self.staging = type(self).staging
         self.bindir = type(self).bindir
-- 
2.17.1


