Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5117CC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9383.1672830373513666754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YwulNQI4;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id s9so554200wru.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQK7ozFrijQ3BUhDW5LdFr1rtnCHzViL8l6eKBFHM7Y=;
        b=YwulNQI4XyqHKAEKZepGMCXC8LMBsYA56r7/rVbfX++FkCxoBMq26H42SIX2Q74lzc
         nSMy5NrkUXYj/W6kENK6fDVkrT00KCa2qQCtRh0HpyPRGMtw0wSxIPk+qaHuiYMf92Hh
         YGQ/zFSSborst20ktIPJ8OhwxSdoRS2h28SaKgLVz9D70vtWcRf0UW6yxVRy2c57fdCu
         qKGkZyPk1lpgwkAlyet9YiPCzWKlMebrJYeqE8Ot24oC3Tt7N70MG7y5nrmAxCO3f2SF
         sfuENmhhbhIFmPteHhezRw1pAYd5Fxza4+RI8UeJuCFXzHDJ8Mh8cVpDMnIP/nae+RMA
         qQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQK7ozFrijQ3BUhDW5LdFr1rtnCHzViL8l6eKBFHM7Y=;
        b=REXCV+kfLDYQ76BtSysJiZdie8v7SKq0bbJhEL3KH88lk6udtqh6Yudjygj+ObXCgR
         LVZfCQr+kePjeuLnNUzBjxv3PAm3/gSSE3tueTvtkZd8P/R2nU1FY2nOWKOMYjKybwnh
         Lk+QsfaKOsWpglXvU+DfIpOyfLUWMLja2Tl/N5Ta/fDz0pGXXHPGyGPpHatPFyBkbwZk
         0OtQKCSSTnlq8tOwyqqF9B6NASBRAj9hF8hntgCW3QI64eI/pGt+vJzZJ2XwquwJI90d
         /ny/8Y7r7d1E8J+bUQnr/o2u0LNAriqIOGsz5DQ+a5LqhX4TIjWoy9H6QkEGR2KevJa9
         OgQg==
X-Gm-Message-State: AFqh2koQ42GjGrNB3imba9hBy+afiId8CX/ihabU8n59G6ef7a+00PEY
	tSQCW+0LsUvECYt+SHKlDXwc9O+FBqI=
X-Google-Smtp-Source: AMrXdXs2kqGbzhqLrBWgjb8wkjJ76tfoHyqHhkJf6EsAA1sLdoQCU7VMsDhvgbnhT3R5HhDMLVVacA==
X-Received: by 2002:adf:e810:0:b0:276:4089:81c2 with SMTP id o16-20020adfe810000000b00276408981c2mr22316915wrm.41.1672830410557;
        Wed, 04 Jan 2023 03:06:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 76/77] gcr3: limit version check to 3.x versions without odd-even rule
Date: Wed,  4 Jan 2023 12:05:47 +0100
Message-Id: <20230104110548.2537259-76-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175461

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr3_3.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
index 5318768db6..8d0f1e972a 100644
--- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
@@ -18,7 +18,7 @@ CFLAGS += "-D_GNU_SOURCE"
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
-UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
 
 SRC_URI = " \
 	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive \
-- 
2.30.2


