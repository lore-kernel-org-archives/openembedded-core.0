Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25568EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 11:18:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.8568.1692616701088424676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 04:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ay9A4YfZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a41035828so633994b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692616700; x=1693221500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LsiYrqKy1oE0LQXcpDjuMIfbAgR8CUCww6aqau/H5g=;
        b=Ay9A4YfZut7GOraV1DygcUUe/yqC+vRZe9EyQRE++wwdTu3X7IArRRhBU50Ui5KxPe
         djzso4cOCxY/4g50J+vfPH9pOMhdDAo4ABrQpXnQhiVyEH5Uc7BmV4ultgn7EvJpPkmE
         XRCi71MVzpKKS5HuGowFWKOul+dAdXlh0nFSoPZi0GEbaNEsi+JS7lsjNjboYxLv7xmp
         fN2O5cwX3rgyQlMpEyrDnGaTWn9w8tWpcgfd89uHpKac4BkMNRt/BbtjfrSA4n8kyj5C
         Xx8EdfzJaeiLktrV/f9DViRqETH82dCWzizP4anccpt6dneLOrxuFdGfRY/5at6IQvF5
         ik4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692616700; x=1693221500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LsiYrqKy1oE0LQXcpDjuMIfbAgR8CUCww6aqau/H5g=;
        b=epUMC4D2kU8HvRcfuj6vplNwTv2Q4wvl5N4iGDDe90RIbsEOjTaR05nqsJGuq5eS5A
         YKN03W/Xm/MQdCcN28eWQfXXMEzFDs3f0b+l0w9lNLlwcvtEmEn1DLLhkA6wfpp9L9i6
         uAiQKHIBX1vitR3Qxzf9vBIU/QyrYODMWXtD6pGXg1gGssT0bkIBul+FYX92VWWwedth
         nlpsxOtFxPa08FJkzrsJQFeqfX9o4c7qgG63Ezd2ePD0RwijJ24qqT1++mwSwsJ7bNOS
         PqRHNdQQDzuTsK4eMfCH1n6/xigYxTe8Tobr9Gqf7fnqZnoUP90DmTS3X2aP22Yc2DIe
         167w==
X-Gm-Message-State: AOJu0YzcfIlvGEs7DuBaGgzo9KjPRsy/LwylK2dY8B7PnK0S3XiC9S2e
	DS7ZxQIcH5EaK1n+naAlKWqbyfO8D2GndQ==
X-Google-Smtp-Source: AGHT+IEJlVNQ9xwequ49BErSPwzC7zKffE/QOtnM5SGiDuaBhd5N12IAJtssPKzi17fqWzYtq4zmHg==
X-Received: by 2002:a05:6a20:542:b0:140:253b:b658 with SMTP id 2-20020a056a20054200b00140253bb658mr3300727pzq.57.1692616700260;
        Mon, 21 Aug 2023 04:18:20 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id d22-20020aa78696000000b0066f37665a6asm5936539pfo.117.2023.08.21.04.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 04:18:19 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][dunfell][PATCH] rapidjson: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 16:48:03 +0530
Message-Id: <20230821111803.67598-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 11:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186431

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 04ac93e92..bc90bffe5 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
 
 SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
-- 
2.25.1


