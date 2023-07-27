Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C1BC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.16745.1690487038782968056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bUM2lNfs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55adfa61199so920982a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487038; x=1691091838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCmVxG4tMMWIQ1omYf4491TSxu6bhbgauUoO9r8WRkM=;
        b=bUM2lNfskM1IBRKsTlkElxOveeEffddjNXsazAi715wwor6VaLeNte8l51g5Sa5OvC
         BbIiYUa1afpKzuiu2jN2c94cL30JFirB58biH0snz+LVuvU3rCJyqlvQX3QjgRan3F8S
         jeC4VUzZoWYLNCqWOY5tDp6l4nST2VTV47tSh/MroTcys3wiityzPxBOrEPJhwpM7aBp
         Lg1dmpNimUt18wuuQjHqZmUtJfoo7x3gQ1So4ANxBsw6jBFxvbtc8HwOBaH0VDIlpRt0
         2n7BCzNY3PD5GZvgtw5110MH5vW1qPXf1WWBY8GhcvpVj4cDmQLxDYvdwPBAQNei+EK/
         tWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487038; x=1691091838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCmVxG4tMMWIQ1omYf4491TSxu6bhbgauUoO9r8WRkM=;
        b=AG1yJlZzKK8HBbd4fAHrRc0AEGFHMFVS4yfIJcqvcOCOX95X9PcWkFqHF+NWk8ttYY
         /Gib6S0LOMWuwIkHDFnvHcASZ3RLSLECifwJlG+2BCw7iOJUOrwvxROScztvxlYDBWCo
         XoY+YBQuWSxVSgwcHZdw4xN5yDCQEPmZ9Jxvolf1PVfWD724j2yfdBZXCABlZsSs0CYd
         vGpvkI6N6EclaQ+H5yPRBQ/KTsyTgjZoNBK1PEa/l5h/QMsVena1nQHdndMj8loyYDq9
         A0utB62ByuKuxQgLZrp0yFJIYkANCt/CwVTj2a0ru22Krso9HgghFDDzIiOYHsvg0Ggq
         KVaA==
X-Gm-Message-State: ABy/qLZE3PEGsVjw/hlt6c8V1g/Bo2j55MtLq3Xz0tok2UVVjK1j1Uu2
	sD4l7SqOgZft3C9PHEl2HIiZoHP3usLgpl3Pkvs=
X-Google-Smtp-Source: APBJJlEN5UzoD6XoCVLIIH/vJCQqamUI4NA9Huzi8x81lyDfEAnCBLGY2coSJGaqhvq4C2MWCn2ncA==
X-Received: by 2002:a17:90b:1806:b0:263:f39:496d with SMTP id lw6-20020a17090b180600b002630f39496dmr268228pjb.44.1690487037850;
        Thu, 27 Jul 2023 12:43:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.43.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:43:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/27] python3: ignore CVE-2023-36632
Date: Thu, 27 Jul 2023 09:43:20 -1000
Message-Id: <3e7f736fa07a132d4fe42a59baaabe565238da21.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184977

From: Peter Marko <peter.marko@siemens.com>

This CVE shouldn't have been filed as the "exploit" is described in the
documentation as how the library behaves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c652f094d86c4efb7ff99accba63b8169493ab18)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
index 5bd8d32b14..f3be9768bf 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -56,6 +56,8 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
 # The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_IGNORE += "CVE-2015-20107"
+# Not an issue, in fact expected behaviour
+CVE_CHECK_IGNORE += "CVE-2023-36632"
 
 PYTHON_MAJMIN = "3.11"
 
-- 
2.34.1


