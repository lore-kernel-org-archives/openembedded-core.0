Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.22706.1627645518915347383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rpk0gpLv;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m12so6157893wru.12
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMmTqLY9KhTvNWUyhsvYZ3T+3nyM/6SKMfi7K8Grv64=;
        b=rpk0gpLvCgmcceZAXU8RvLxrarFh4a2BvhkYKesuoS357joc4GW4b+uN7segpIBa7U
         r20LAVp8Azvg85sG0AqV/AujAhAvKiseDy5GZNIP3vRph+mJ5qjxzuZ7zzq86kO+Ntx6
         OwWgIdDu4izd/Nh0SPSqOnRFJvfMR24tCjua6Xq2vTue/KBaa+tQPGDerzwC5KfQ9W4u
         Z6zuzXV0fleU56XLDFKlypwjfX3qdA5wELJs9SvdJTzLRXFKmLS6cRQBn1kJ9Wp+w8JI
         MEVRcS8aHNWIj4j9+sZZCSKcIMEQCz5RwsfiidQsDbPEKefRIGz32T6LOzgitVjq7Fz0
         KMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMmTqLY9KhTvNWUyhsvYZ3T+3nyM/6SKMfi7K8Grv64=;
        b=cZtuSoeZLsGHYg/U01tjOrIMpVZ48jfzgts4qwErDo5/dKP6fXGg1EYq6RoYsxjHYt
         4YdSF0CzWfsWgURt5Lm4d4Lmg9kANfgHqDpFWI4Mlj3E7DuA8EfDVirjI/f8WuNtIkqk
         TwuStjGWH9vJ1DdoeA+tWSfNeZfxnS5LuEEYI88a8+jfRdXu3dMku4AoSPlrw5dB4O8p
         mcBRKoTm61vdV7S5X+wR8lC9OVoIOufbu3VHbnnkNBd/S2bxOSbPSo6dPhr3eeN+Re1S
         hRFF7rWI7XDKupgHhDInId5/W5zidw7eBxaWeb6zeF3DhQB8u4setbcNYFaDORZ2EkIk
         DCiw==
X-Gm-Message-State: AOAM530obXhvnyPI4xqJXxoYQV2x82VMC16iecR188KLYDAplSaJSqKn
	C/HgUsEiofCrsRk0KNscWxKdZhlJuqU=
X-Google-Smtp-Source: ABdhPJw6SUeAHD3CgiDHJutW5OiYZlcZwyMw8I88UnownCEQ358DqFAXyHQCDmzU5dy6rdNe54zF2w==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr2654641wri.149.1627645517566;
        Fri, 30 Jul 2021 04:45:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 8/9] rpm: do not RRECOMMEND rpm-build
Date: Fri, 30 Jul 2021 13:45:06 +0200
Message-Id: <20210730114507.732448-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids pulling in perl, python and (especially) bash;
rpm building functionality should be neither hard nor soft
dependency of rpm package management.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 95a6f5cf71..33834eca9f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -148,7 +148,7 @@ FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
 PACKAGE_BEFORE_PN += "${PN}-build ${PN}-sign ${PN}-archive"
 
-RRECOMMENDS_${PN} += "rpm-build rpm-sign rpm-archive"
+RRECOMMENDS_${PN} += "rpm-sign rpm-archive"
 
 FILES_${PN}-build = "\
     ${bindir}/rpmbuild \
-- 
2.31.1

