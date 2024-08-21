Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CF6C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.18869.1724244642580727973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PPNHvJWl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7141feed424so955710b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244642; x=1724849442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/2JNiVuIGTl9fpLg116p8QTpE/1PkUXuejp+yADdu4=;
        b=PPNHvJWlivNUQDAJTE7rrJ/nU7jGFvWmqkz/T+Ekk1T2yKcJ3kZnvrgtbAwWxOjcaq
         QGKsDy6epDMJPqfRC8/KMOjvMOb5vDq7FI0GYOtTRbc5InqnEC8i9e75OaBwI9ERdb5q
         PqES9AtDZW95Nsq3dHbTU0YeTSqkGed8/L/6fF3vWlzL2SCYFW/boYh7+BkszRxFWNKo
         Svi0/u9rokomjZjPvVNcHzL7dezZ+R0k2y6ev/NLg/jPy24gkvcXp+ihy/GOYB2VhWhJ
         +gUU6YvOCsyLd0FJOFAi/spDIW6MMFl/h63V5+c+TfWHfjTIy1s9AYGdejx8BuzyrLbU
         brVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244642; x=1724849442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/2JNiVuIGTl9fpLg116p8QTpE/1PkUXuejp+yADdu4=;
        b=JTSONg9N22fDR9IiHJNWb9skt8wS7C0ljZgSexOymSJbqWURV5IuNZE2PyE6nTWxlQ
         DD71BYUvhiJasfhQBYTDOdO/ZmLLvJF64NOjiZvLJ5cw+f9ZwnLjZFBQHoYB3tcMtcAZ
         CZBJ/ohWSbA/1SQdfeR9tqbubQ+vt1dlc63y6CXhfPNopT4z3uDWRZYTxOPZkk1k9yak
         huqqoTrsJ4aTcOOPwvYlPQzq1lQL1Cmhf4Vp8Bt54ipSCvxOygW3hDx6iz9GfkzWtPxC
         a6ruwJcdVCLASEXYjPiPNAsJAlBAgNJlMU9osr7sZwlNtroF7ttoRjBuMHGluz/1O2aY
         kmfg==
X-Gm-Message-State: AOJu0YzMcNRPS/cy29puX0OAbp15748TkIqPJgtr2kzpbGKGPmRqoHss
	7h48qD9b+qe7zJlnfSNK3Pkms+rHlRZaXLd7PIQVEurw57VmfavKiI3HdTgCW8iucJ9wcqF86Jb
	r3Rc=
X-Google-Smtp-Source: AGHT+IGnKbd3MK7iV1Uw4akXHXnojdEgz4YC051dF4JV1hb7FSLXi3Xc3p96HobSh3F6GNBEnuZc9w==
X-Received: by 2002:a05:6a00:23d4:b0:705:b0c0:d7d7 with SMTP id d2e1a72fcca58-7142346032dmr2566492b3a.7.1724244641753;
        Wed, 21 Aug 2024 05:50:41 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/18] maintainers.inc: add self for unassigned python recipes
Date: Wed, 21 Aug 2024 05:50:16 -0700
Message-Id: <97c2cf74e556511b3827362f6b3439daa26091e9.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203593

From: Trevor Gamblin <tgamblin@baylibre.com>

Add myself as maintainer for the following:

- python3-setuptools
- python3-smmap
- python3-subunit
- python3-testtools

With that, every Python recipe in oe-core has a maintainer assigned.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f7c4ab54d3ff1895d9fcb9aa20dece5e0661579d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 12dfab80a8..baaf971a9a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -697,12 +697,12 @@ RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-setuptools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-smmap = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
@@ -715,8 +715,8 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery = "Tim Orling <tim.orling@kons
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-subunit = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-python3-testtools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-subunit = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-testtools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@baylibre.com>"
-- 
2.34.1


