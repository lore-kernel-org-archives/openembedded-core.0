Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A575C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.92693.1738600940928887280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hPrMKE8U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283d48so34530155e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600939; x=1739205739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MRt2CcFiLLeZWMTp7KHszmyGi/5e9ewnNGDr8xWfIE=;
        b=hPrMKE8UfxTmzXcQsbQD458Zi0Z82PC14M6c+v93WZe/QN1NQ9dEluI8b0MSXELvYF
         UATfb6r1gB/SXbjltYgHNdh6SAQTNprAmgwvcxlzpyqEO3ony7q/AfL9/oucrc5l6jDk
         Vb2xR6qu+LtGJUhl5mG+lAtZTW7jbWliqVObQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600939; x=1739205739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MRt2CcFiLLeZWMTp7KHszmyGi/5e9ewnNGDr8xWfIE=;
        b=Y2ln2JAiuqlgnIhVtGhpnn2i707fXz9qRfuAQRRxeSpuBBWxmNGOspFj3pNNUJ+EAh
         ZqFp8h+vIkuiPOKKgjwZXwYpj41PKC9yghsQsmYxNj+/xBObbqIreauP3V4bgylmP68b
         pA/8+FUFWV/pMjg65pw4t8KN0bSJQgIIHr+tjw4tzRagkH7XdNZRw+IzGRfJAC8BIBeK
         9/V8qwN7ni+r8bwemaPMlQysvCK07eDPhaoqrZVsXmzu2oCjIZlSXPHYrUkVjtl14RRy
         EEuGcPTqoWS4FGS8UkX4+Zv+OSv4X/LLmQER1b13ptXRXf9ujupVb3xhUekq4NVDB8QP
         bswA==
X-Gm-Message-State: AOJu0YzqrqLm4NtJ28N88DjyoFYue8o7FK60AaGbgnX5mZKwCzKi2raB
	JRlHQAdZcOsxWtDZMD58YgTTaBkrfRZADfCMq4ZAJW+nj4FpQp/lOAQ1qFOya9beJs3QelOZvJc
	x
X-Gm-Gg: ASbGnctRXjViWe2+OQtzZUXwCsw+X2RD6ObQcnmfV+FuRggMqs+hruAbGTorgCTB1t3
	XhOW1ROntL5jb06LQZ+udgF2SPMNC5S1gnlzthHVX4F/a/+cFJtz1VKhN1Nz0jpjV9FKykMFoaV
	m22IR2JUpFd8jJ8sRSSEETuN1j7vfoeX5LT0GEbYwkjTfdAEN6uwzfugYpP0of/KeaHvU5tifTJ
	NFVOqe2ma3JehOhynas3nGM4WGYPG8uTt9s/kJQdqlDkwlfFboCwkNRf4JRsm8fD+hoV1971pQu
	vbigY8zMvk+Wrn3azVCqrubsSgnHkFhL90dW06p2UwsC
X-Google-Smtp-Source: AGHT+IHlgJ3VlefiKFYNhNLs7PW17IiJ0RH7lE7IbnBuK2QvpNkmC/ZdlYcTW0Vsgh9RgsRwQ2fcjQ==
X-Received: by 2002:a05:6000:1545:b0:385:d7a7:ad60 with SMTP id ffacd0b85a97d-38c5193102emr18323495f8f.3.1738600938846;
        Mon, 03 Feb 2025 08:42:18 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 45/46] wayland-protocols: upgrade 1.39 -> 1.40
Date: Mon,  3 Feb 2025 16:41:29 +0000
Message-ID: <20250203164130.3403325-45-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210718

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{wayland-protocols_1.39.bb => wayland-protocols_1.40.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.39.bb => wayland-protocols_1.40.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
index 82c373df210..4efc1bd548b 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa"
+SRC_URI[sha256sum] = "b21711793247c2c42763914392dfa9fcb9e3728ca4b4aa110adb8d915fc00689"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"

