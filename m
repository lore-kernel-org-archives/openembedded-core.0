Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA11C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:42:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9746.1738147316187504373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzyQTU2B;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3345983f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738147314; x=1738752114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uab0cWFK0TxB8Ox2nPMc2VJLEMnLaB/oHzQmFd1jHnY=;
        b=GzyQTU2BJmYGWcJUPi1BV9czpwpuO57OwUZIlqN63KK56MEQnb0ev51pG6LS66j/hl
         rKG3JvNDopz+QVug3p8yYGda4TqrToTgdrch/GMkPiPUZK/0qZ3+WX/WTrzjwBcQnyfO
         QXnb8iGJRL/4pvCRr8YFaSu8nruCusBzIZSxHR8O5V6wxNBj645YtgKOAtEBwGxuSjR0
         07Inwn179cR4eDwc088kmO2E85zhNya13hNYYZbAOjzHBkT5sno2k70eOddW+0CSaDbT
         XYDbunZYLjb7kB5Dq03Pi7aXrUDn1Bgx9Hacxanc37qPE+3q8v4SFpNcj4vwxnwYrZoa
         IPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738147314; x=1738752114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uab0cWFK0TxB8Ox2nPMc2VJLEMnLaB/oHzQmFd1jHnY=;
        b=tJYUT/SLSmxQNdpgeVHyBQ5ITPynBegwDtomh/JRuI1G1ffghVLXKTD0iZQuGHMEQV
         2lJWU8Wxni92b8Py/lZ0C64RSlukOdylvUA08WRhaxz3Oa1sBYJmJr3IJc7ONZ1JqV6c
         XLd6MYm9yXLV0JtCRJcxb4fNd/NppGc2qLLl4eFiMSWmRUZEJQfixoeDn3Nq+vXkBXPo
         crwVNrwN8UngjaTSoA5pF7oMlHEge0yGdAzlcRqjlOtxTUgi596jt4hJgs6VCNw1BBdm
         ELdERf9/abGqZy8rjFoOhwhkoDC0FOAA8Z+5PdMNrHhP/0sLPKtxviJ4vDQYUEazWGlm
         XtaA==
X-Gm-Message-State: AOJu0YzDnCmpqJtHsW7UkxicctceDtR58EWTWyPpI6xDzkwRPvCTHlKz
	Cu0Xz7RGOb60/LGKnX45nGblszMY7ghyMLn/Jum5M3VqO/QJmDwUy6QE4g==
X-Gm-Gg: ASbGncuvkaWpFbMdqQFdJVzAY75rAmdKrTAohhEPkO/85CTypMGVTb1Cwyu7y14FAnQ
	9bKcd+rpCxMzXWAcBbAwUgM69ylBM02OOqEDukxidZorIIZxLNZDJnp1UE+FFPj/5S8D5JLr3fS
	3Rg+mp272mjtdhDH3ni34GEFWOla63OH/ImcsCfh57j+eMRHqj7BBURqPu8UzRGwE2YJTWvioDQ
	eosnjVmJGa8CXQh5hhhszXOlyJrrwtK1xTbGmbC/WSmaiGX9drhON2soYQJj9wM0JXi7okKHuWL
	jX0GjQLexo7oUtP0qs/jDXSsHW2mFMIJ85nkjyZUz36wTw==
X-Google-Smtp-Source: AGHT+IHf3JLblXpdwMhUM/g68fSJ912zsWewF6hxTZ2ZlHwVRITcnB7d5OIDHGTlFvjDzyhFZlL6sg==
X-Received: by 2002:a5d:5987:0:b0:38a:5122:5a07 with SMTP id ffacd0b85a97d-38c5194a22emr2324726f8f.15.1738147313628;
        Wed, 29 Jan 2025 02:41:53 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad16sm17060559f8f.68.2025.01.29.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:41:53 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v2 2/2] rpm: Re-enable signing
Date: Wed, 29 Jan 2025 11:41:50 +0100
Message-ID: <20250129104150.2391653-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129104150.2391653-1-zboszor@gmail.com>
References: <20250129104150.2391653-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210366

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 1 -
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..18cce0ba25 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 6c995ff50c..a4ccb5d1c8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -62,7 +62,7 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= "archive"
+PACKAGECONFIG ??= "archive sequoia"
 
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
-- 
2.48.1


