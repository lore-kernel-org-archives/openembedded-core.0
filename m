Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E86C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.9290.1635325660559576023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qZ/dqv+E;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d13so2842251wrf.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MDRkpU6oOWOhwBBHEblnXVhhyypeOzSNQwgPk2YyD6Q=;
        b=qZ/dqv+E0odAAirkR5YweQcCyK1JDx7M0EWL7e3RETiwCGtmCxVNkjjgkuUB/JG4si
         3ssFrE+TqOhCDK7nQPrmYAQrmjO/YYKuw7lQA9lu+BiyXLda716ylFl6/tkjnzm/2On3
         tE+jNylhuSE0XTaSh/dcTgLzOkaLhBij/EXvn3zFUvYJaJyiRRrUb/Cjzxaj2eZoqIh7
         wJ16MydJATSP+W5APwfg8sIFKP91eL7xhG7J+o6my8MnbUrofo23ehOjXi4OLoD+aeJk
         GLB+nAxaG1N1JE4x2NaGf1qeWUl5ezh6IZnfZzcgbUex+SPLqZiw9m+jxgrCZHYs4tkN
         ERAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MDRkpU6oOWOhwBBHEblnXVhhyypeOzSNQwgPk2YyD6Q=;
        b=AqC2CHm6A6E5a4pxw23pP4X5rUXozy3VepKhPylqiJ1SP1v/kcz6ykgSn3q+d8Vm+k
         kXOzm+oqYcjiJUyDBZlETSxAgFnZUM3+NZjQ3X85ZoR/35DRBK1X72rRaAfNqU0n9KJO
         EH9mCEr83NLmI6APszzMGyzc1C+6+Rie7Z3GjN2hBLzhZC3HCR/38hlW3Wdw4GOa00Zx
         34IGNzyCP3pVrseQMzxmtqQlxT6AvodmVg0KU1fJii0KlczKaK3J9KsNVudjoqKAczD+
         43i4ew+QmvX3M2OKZV9bDeKq3TIQFu2jXhX2FquhCuE/90O1Muor2bpxE1rW6Kcn1zXX
         Q3uQ==
X-Gm-Message-State: AOAM533ibeFKU+6JGj+rYDQ41kabvVDffM1fqJLkqrA5d2dGha7O5/RP
	LgvvZ/BiNjMjn78kLVcJFJPbh15lC5s=
X-Google-Smtp-Source: 
 ABdhPJx1t/Pz7hGqR0j8WEt0VrKBqAGzblXkc70Btbv2Itw4dmGSLuUpwaPYq6I0HIQ8tG7aMLxVZA==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr656321wrv.160.1635325659033;
        Wed, 27 Oct 2021 02:07:39 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/30] psplash: upgrade to latest revision
Date: Wed, 27 Oct 2021 11:07:07 +0200
Message-Id: <20211027090736.2546759-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157477

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 1be7ece79d..28f385b7ba 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
+SRCREV = "fdbd111d6bab2fbbae62a041123fc6b644aa97aa"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-- 
2.20.1


