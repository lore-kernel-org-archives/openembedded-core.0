Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9C0C46CA2
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 13:24:12 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.14765.1702733043498490439
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 05:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=S+h72n2f;
 spf=pass (domain: snapchat.com, ip: 209.85.218.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a1e2ded3d9fso182441766b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702733041; x=1703337841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7rO05N3O8fkO8cN/syb0OL8fxJakT5PxfMJ7CTD2cI=;
        b=S+h72n2foaUk++RZPmbKutFqszaNyx6j8H67RLJoyKUDR03cfsI8+I+edY5e2ZbYor
         3btcoASLZSzAI4sV5qX0Tj6evIVbEEt55k5FRDFoZTez6ZAaiW//EC0jHK2VX8aGmiAL
         4GML/ECV1XsqSc8pyyJnBunt4crmO8l3gp8C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702733041; x=1703337841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7rO05N3O8fkO8cN/syb0OL8fxJakT5PxfMJ7CTD2cI=;
        b=oTT9lcDHHOv1CywttKLcnq+QLAK+wneUOBe46zDPOFncMdc8Qco2zUIIguDzMT1HDx
         ByvooCK//WmrRh875I5UbC6jFqbiCCjQx9o9MzCpUIrw0IXXXYq6xZ/9fsIilze+Qwel
         vd6T8XciPQIqnFURA8t8u2JWTbSi8YeqdoDJTEgQ5ubMdY5bvJt366Ak7RZ8EDc7aZmN
         IBmheeA1NXJWGCvRsZw/xxRtnc1WT80gkeUdtMOuKopx4REnqBsCTwgZh6U8uZzmqT5Y
         QR/NeD7lQlrA2TYWC+rCThdH+x92DGtCE4sgMJrblK4eYHqe05epTUCpp7CThAXpF8Hq
         H8jQ==
X-Gm-Message-State: AOJu0YykRhlUjw6VlMqTr6wbxPXc274o1qmuQp671cc5SFx23Vtv0YP8
	oSqQ1WMGVFeOb9vLiTuludidgEC+p0w0/JiswJ/y3w==
X-Google-Smtp-Source: AGHT+IG9sd4emJRbL3EnZsqOzwCH6OBet3avD90ceuU2l3nvruN0WL2w9VvLwrZSfiFwLmHU1FPGzQ==
X-Received: by 2002:a17:906:7d85:b0:a19:a19b:788c with SMTP id v5-20020a1709067d8500b00a19a19b788cmr7080105ejo.79.1702733041145;
        Sat, 16 Dec 2023 05:24:01 -0800 (PST)
Received: from LC49NTQ3.sc-core.net (62-178-121-202.cable.dynamic.surfer.at. [62.178.121.202])
        by smtp.gmail.com with ESMTPSA id ps1-20020a170906bf4100b00a1de8f69dabsm11848377ejb.5.2023.12.16.05.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:24:00 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] make do_symlink_kernelsrc reentrant when S is overriden
Date: Sat, 16 Dec 2023 14:23:55 +0100
Message-Id: <20231216132355.182564-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 13:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192561

From: Etienne Cordonnier <ecordonnier@snap.com>

The function do_symlink_kernsrc is not reentrant in the case where S is defined
to a non-default value. This causes build-failures e.g. when building linux-yocto, then updating
poky to a commit which modifies kernel.bbclass, and then building linux-yocto again.

Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15325

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/kernel.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38..130bedd901 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
             os.symlink(s, kernsrc)
         else:
             import shutil
+            if os.path.islink(s):
+                # this happens for instance when a poky update forces symlink_kernsrc to run again
+                # after s was already moved to kernsrc
+                bb.warn("%s is already a symlink! Not symlinking kernel sources" % s)
+                return 0
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-- 
2.34.1


