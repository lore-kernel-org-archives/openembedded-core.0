Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A129FC04E69
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7488.1686734986089833733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qcGYmHhR;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-977c89c47bdso84861666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734984; x=1689326984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwJrVnTJLz5DuA/KkyntQeKlV3S/wBT8YGHt/wNS8BU=;
        b=qcGYmHhRWzAh0KvSyPHMvGzP374XSjkjhaKambzpccobzDx/p8ALGH7fi8mGQYG67P
         Kv/WEZnzML+K7j8azAFm5vJCCHZjZmFJJ8XK9++choi/q5KumO571ngQgK+52pQoEZJL
         Af7Y+YgJpsXonIAa/b2Qy0DUkpypH4ej9UlCwqt4J5lGe7rfRNStV1m5QlE+JjKXLp8g
         rkvZP/BW9Twb29DQCKiErQe0O8mPLk5XDhi5pcMFZ75qnt6oF1LQqxlePtVspHjrkT51
         p90GUkGPUaW/VE3ZLRbSzfT7yuqHelI7InjslvEk4daHB3V/bHMtDgoyyGTHRa+yR4hV
         2YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734984; x=1689326984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwJrVnTJLz5DuA/KkyntQeKlV3S/wBT8YGHt/wNS8BU=;
        b=J9mNlPwj1SHGFItpHp8W3mei12ca4tdwdiBHQFBA2YMeJg7oKSO05cl+qSNDab4NQf
         yi/BGq+2Eq1XXRnn0AaInA5Up54bgMgOzLnC8aOgo1dxmw9Y0SHdNEcTIr+ekGwtUpmD
         N0HQDCInYZ7fV+jIdZ61PHHOm7K7bSBEmIGihxG9Cu72w9mKCofmfgP9MPDBTAO55XH9
         tvtE4jnVNutWG6mbwdg0sFApPW9FutsgOnB38nZBpQZ5130mRRA59mXRjkKUQMz5SiKQ
         +rfU+e40US6goM8dhKZpmxxwSGqIyCI4fKfnJieJFMknAXlbVeV0H1QRBZxYo3WkHpbA
         c8og==
X-Gm-Message-State: AC+VfDyqKurJPzXsFPKPMIc2p2mZvINsTlTjs6j+Sii9GwpV7W+qvG5f
	ND2eXDLCyH90iUanO0Y/CY6n1E7DFvc=
X-Google-Smtp-Source: ACHHUZ7f4gaB/na81ZlvX+jKki8SAsIgTzcGzU/Pnwaw3so+NxMGX4S5o7hrAuvbSi3svR+NKYq/GA==
X-Received: by 2002:a17:907:2d29:b0:96f:bcea:df87 with SMTP id gs41-20020a1709072d2900b0096fbceadf87mr16859767ejc.42.1686734984517;
        Wed, 14 Jun 2023 02:29:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/55] meson: upgrade 1.1.0 -> 1.1.1
Date: Wed, 14 Jun 2023 11:28:54 +0200
Message-Id: <20230614092918.4065570-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182776

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/meson/{meson_1.1.0.bb => meson_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.1.0.bb => meson_1.1.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.1.0.bb b/meta/recipes-devtools/meson/meson_1.1.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.1.0.bb
rename to meta/recipes-devtools/meson/meson_1.1.1.bb
index 1190d5c34d9..500e13775f4 100644
--- a/meta/recipes-devtools/meson/meson_1.1.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "d9616c44cd6c53689ff8f05fc6958a693f2e17c3472a8daf83cee55dabff829f"
+SRC_URI[sha256sum] = "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.30.2


