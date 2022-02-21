Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E025C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.4748.1645478664469097120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MO/iy3W+;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id v4so16351712pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X4xVXeduiKApS5jdl9z3vg0p3yiRh7xu17Yg0fxqzdw=;
        b=MO/iy3W+N28g/7TmO1BshWU44A7mmUdibplKab4s36ymcIWnx0OYEcL9kmyG3VoH7S
         tByt5o4qy5hy2FYeXjpEK1WdlcIugpeXVPm2Uv1iawKOXOy3bQeLmKT6WxVZYzHLavL+
         2HDiZ/b88tlXF6y8E8Z7/Nh7V5YyVr1NXG6lHP8vZmf6ulej/VhFBbB3xCSbjoCP8bLg
         7Vjk3PKIGTFLnwcJLBS0oiYBOaKa0K2+6S7F7rBMNN1E9ebCbzEgiKHUzrNnBz1YDz2Q
         +gYV4lOpcxtKzTxcnfiNDHyPoVWAQHyDzHHBwg+xm0ZlAZuRM25nG96bb8HLNzjqDux7
         Aetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X4xVXeduiKApS5jdl9z3vg0p3yiRh7xu17Yg0fxqzdw=;
        b=MqwroMZMmgBFAXf0IYO9J52VYlYl02j6RW7UcSHmaWKGrWSqxa4YKs1SUvb79kNlvx
         xJc8EahBlXBAl8JXvsjECZaB7M4fA4/M2iVjTQz1L2SjyX6M2g0HghBY8MvWyzxyq4hi
         7Abj99YIs3S+EIFP0ZpYsQqjQaMK3JHfdjTV1Qre3pGXRjbOPHMj4dgnBTVPteoAy+cg
         AHg6n/w+48/0dpqN4X5wu4Dl1gtd2DFT27+61Ebqdg4Z935Y/tiLIahRxqFToi4IH1R7
         rQ7OOEFE17qHou8irA+iureioMXWCVfTN4KYypwrtAtjQaWtatzfY+QuvDzSXqjk9oQa
         6cYw==
X-Gm-Message-State: AOAM530jChIbawy26ON/wVBaYVI1EEbjdFGi3jGrf5XwV02uRqYKFqQn
	AR+zUAIZDqLRadz3GREbi5mdnAd6y1wzNQ==
X-Google-Smtp-Source: 
 ABdhPJxnK0BueMfuX47OqiOIhVrclQqrWZVpw5y5xbCESupVkNp+JnFDsVQz0c3v+7YbCgjLc9FXdg==
X-Received: by 2002:a17:902:e84a:b0:14e:d70b:92d5 with SMTP id
 t10-20020a170902e84a00b0014ed70b92d5mr20192181plg.94.1645478663556;
        Mon, 21 Feb 2022 13:24:23 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 14/32] python3-py: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:29 -0800
Message-Id: 
 <a7271e0536a7dd88edb24551122cae761f1b57e7.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162090

Upstreama provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index f8be3935e5e..02027248f46 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


