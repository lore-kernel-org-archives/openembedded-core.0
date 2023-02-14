Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A603DC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:31:17 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.2099.1676399473607849775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EcQFjARO;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id h24so18672455qtr.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNuP37MxrIXRXzJfyU4SeXy0tQefKWx2vn6DFerqlzc=;
        b=EcQFjAROvbj/gPaWDm88KJgTkSk9uyXu4CKLoJTHcVxkQ6P1GWboCxJJyWwaznBcps
         Py1n5jmJjRk80Y/UBwQNOhI/RBMF7KE0k3IOP+8cOhPGAi25t3mrrDg1gJg6t0StBrbG
         ySjjutYbY+iv0e7KLOfwbTg7RxKoLkzyD4WU7qH56Rij+vOqEm9a3swAc1BVU80dvaYr
         y4IOqb87Ng7WqusHE8WURqR8U6blKv7aJoUrrry2BP9I+TwnbuLF4nSsEfy01fSsC2Ph
         G+7hPbyZPjUgoD7c/siwN8y86vEb/fSnC58lgNjN+YQNc+O/FbBYK4jQNyeklBjZU/NM
         DqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNuP37MxrIXRXzJfyU4SeXy0tQefKWx2vn6DFerqlzc=;
        b=acgoAj/z7ilL1WSMcN/vTo4Fi5X+U5gxWWezI4qeAY6gpNXTZbzwE2GXrNn5PHuwex
         7A8QxZlmjwlhwP5F/u++SQINigjME1kAozGFsw3ENV7yjmPZnmhh6eD2FB7CcFSTfya9
         gUbGXYrEKv1BJ0Xae4oTQ8qLQ3gyENuMEBWxY+qRFbBtT1GxOMjV7dskAj0+UbCrEmb3
         U3Eg6qtJJW8GqBI4e6pU4RBIWcRS8CiLQtrLIYHg56WPIRgC//dBRskBIfzfV5hAV32E
         xFPwU/+0Yl+TsL/wgZkqd3uQEMs7uqXMBTWUZSC70WoyesUvnh6B2wvTsV4sjdmgd91I
         Hmyg==
X-Gm-Message-State: AO0yUKW/+VoiSzxL1UzTv9TGHGif+stl4lOualBB1rCp8fZa7WqDP7dT
	+Cf/zviF6uDsIgnHokZ4h9t6ighqaUQ=
X-Google-Smtp-Source: AK7set8bPmO5GQ9aSn7Z+/vOFhHh0X7wvJF0gUpsCkj0Sug3O6xocO8l9Q8c0Kqc2UY+oVe4dLJ6vw==
X-Received: by 2002:ac8:6693:0:b0:3b9:bc8c:c212 with SMTP id d19-20020ac86693000000b003b9bc8cc212mr750868qtp.29.1676399472326;
        Tue, 14 Feb 2023 10:31:12 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e7-20020a378207000000b0071a49ac0e05sm12184387qkd.111.2023.02.14.10.31.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:31:11 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/4] python3-dtschema: add dependency on dtc-pylibfdt
Date: Tue, 14 Feb 2023 13:30:59 -0500
Message-Id: <20230214183101.33761-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230214183101.33761-1-twoerner@gmail.com>
References: <20230214183101.33761-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177171

dt-schema has a dependency on pylibfdt from dtc.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-devtools/python/python3-dtschema_2023.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
index 9767c95d3043..7d69b568514c 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "dtschema"
 SRC_URI[sha256sum] = "8fc8c269e4c57e9d008af7b32cd33b77afd4ea1ac9552bcfa96b41b9e0c52586"
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987 dtc-pylibfdt"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.36.0.rc2.17.g4027e30c53


