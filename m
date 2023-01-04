Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094D0C54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9362.1672830366643340608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hy6ZCNYv;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d4so24592852wrw.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvnU/d7QBQq5B1wdYlcW/7eBPkZWDXgoqIJigxNTSNs=;
        b=hy6ZCNYvtUhoHW4MqXF7d0ESgzC0BP0LHVzwIiInpeHWFsIOBBkuz5r/owQXH1t9E3
         SM9gV/wlybIqlIes3OlzJzbtWWtqWTe8zKhUJmzqUibgyTMKWo09wjg79aRITgx73uDV
         sh3wDBH+NJxPISgBZkqIa83i7/rN9VU0wuVDkeOdQl9cO1IQW4e7Kkhcz5cv35J4crC/
         SAKrpkxzcXkT24PHKAP45bQxhNsZqryTLt/+I4HMV/zLicJ7wI1FNT4rip+OaqrV/vI5
         kCY5Kz0MzL0fNPjIhGhW6p65IOClj4wy9Eu66VmNDxv05G9BlC3+ayXMewUu1cukCtui
         o+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvnU/d7QBQq5B1wdYlcW/7eBPkZWDXgoqIJigxNTSNs=;
        b=qWueaPuPoI6MbddaoBLSKvOV5Ce5vG6680NYIkGYZwGL2cNoTFT87A5fyZ6KOgvmJi
         5jvJJMUiNjlOOqGBUQCJyx3WYbVUj2owE5u1GmEBcMESJACV436U5CETI5prUCvSEpVG
         ZizP2Ug84ahvjDyTRsaG5iwELg+ti7SEzUeGDq8HP/NP10fc0C7J+cMhrmeq2rWT5Qi3
         /p5R2zOreU5OCukDXX7SNXIe5tJdxHMFa5hNaKlVl73x0rDDBffn/Ue/AiyWJqUO9COD
         phw2j4UPjV9ym/CctEn3TFoer6oNPV8MTj5/PHwDoMu4etEoYGP2ittIa6Gy8o2tZO7v
         2A4g==
X-Gm-Message-State: AFqh2krXhOkFVZEGbxKArhmDkdxgDWq4gp6TRaeD6n1i3wuJwHneRv2f
	SEDhfmc+cXAbihh8dwFkwwTQuyB5d50=
X-Google-Smtp-Source: AMrXdXvbZijDZMxvCZ/qA8rFOlFvNhqtFSvGbN+OtZRSE0XgrC4/ejT/rgWrllWHN4Z+GIiApGZ3FA==
X-Received: by 2002:a05:6000:18cb:b0:242:63e5:2451 with SMTP id w11-20020a05600018cb00b0024263e52451mr30382613wrq.71.1672830387673;
        Wed, 04 Jan 2023 03:06:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/77] libsdl2: upgrade 2.26.0 -> 2.26.1
Date: Wed,  4 Jan 2023 12:05:17 +0100
Message-Id: <20230104110548.2537259-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175431

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsdl2/{libsdl2_2.26.0.bb => libsdl2_2.26.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.0.bb => libsdl2_2.26.1.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.1.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.26.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.26.1.bb
index 3dda082593..0b2231bc7a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "8000d7169febce93c84b6bdf376631f8179132fd69f7015d4dadb8b9c2bdb295"
+SRC_URI[sha256sum] = "02537cc7ebd74071631038b237ec4bfbb3f4830ba019e569434da33f42373e04"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.30.2


