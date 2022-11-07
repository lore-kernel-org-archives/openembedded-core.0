Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D3BC4167E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.4224.1667832925081087669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GEYgD/8u;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id v1so16565692wrt.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQjZXQk4edlsVbFxCqAiYNXPSD8vExPmzU+M3vcWFOw=;
        b=GEYgD/8u+zYuiaR55Yr0dMut5LUW67984YP4TX2Iny3CGCLjDrtDZIVbMOkX/AbXxg
         Zz5+6J9dxKcfkIL3CiRmUjEj/omWYOPJZiYhVnt/A0f8+rsUOBA225a0+zg5bw51NXKg
         1buTKsVwAXHfX6cmVsI8X4CmZ3NnoPw5h96Sw8F0Mv7rTCSeo4lwJd9GSv7vjSPZNGHK
         Z8H+N5LJ71uBgrxvfdmPNiso8JDLS0JwQp2CzpgHbyJmFovFS2JSzmxqtX2MrrBNY5ZQ
         PfFm6LoU4kquv2xxqZCnWenNIE4AormJBWAjOBK2LSUOIVp5uzVtpvoShq9mKPSM0vkt
         Nvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQjZXQk4edlsVbFxCqAiYNXPSD8vExPmzU+M3vcWFOw=;
        b=6GrWwJndX4+OK4y2Hl8PdkCcHTFh61MuBVAldoodgb3D4yBMR3N2vab/On/FlvM+nA
         Er3qx+9aFrHhZhNzZn6HfwKacDvjd2/VntjpmTZXFv3qXuRf7HSqEUzTUwkiObewWtwv
         I890On/yGa6wqSDLuQD0+IYvGuKcg/07uXVKQ0MO7KxGfIpq673x90xPS1w5P8QJhvOf
         yHw+UAsKDdkwyg9Fo26eJSxI9nDf2dCSKyzMswlA1o0E0NWavi5LhKZ/8Bpg7PtIatdM
         FuOlOGTp/NntEmZ4o0g5P92INGdrTUahmgrKqbrusIda3ZD9pcaDWmIf2baS/ZXI8Y+t
         6b4w==
X-Gm-Message-State: ACrzQf0FlX5zX7vaC2jFD2AOcS2iuLAXDfLAJhCMCAUW+0LpqlqxxmBp
	9BBfkk4bzZU679DUKKQJtbMooiQ9GsI=
X-Google-Smtp-Source: AMsMyM7OJTWb2TCw5giWPxYtVlDtKDuCje/HI4DSYyYdyns7nYrgGB9TVitlIj8JEMhi3X+9cFB67A==
X-Received: by 2002:adf:f688:0:b0:235:f9ec:ae54 with SMTP id v8-20020adff688000000b00235f9ecae54mr31221448wrp.319.1667832936302;
        Mon, 07 Nov 2022 06:55:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/48] python3-wheel: upgrade 0.37.1 -> 0.38.0
Date: Mon,  7 Nov 2022 15:54:43 +0100
Message-Id: <20221107145508.1051404-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172873

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-wheel_0.37.1.bb => python3-wheel_0.38.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.37.1.bb => python3-wheel_0.38.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.38.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wheel_0.37.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.38.0.bb
index 2f7dd122ba..2a2abd1f25 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.38.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
+SRC_URI[sha256sum] = "d52844afee64cdd4bb28061ba6b5c06818b237fb490263e0dbea227080f7d2d7"
 
 inherit python_flit_core pypi
 
-- 
2.30.2


