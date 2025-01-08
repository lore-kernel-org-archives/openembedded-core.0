Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FBFE7719F
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:50 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.14684.1736325760626945364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJgbnalL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aab925654d9so2897720466b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325759; x=1736930559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t32YYmdND63KQlb3EfkKKbPdXOTRoF4yhISxtDFCDfY=;
        b=DJgbnalLXjgaLLusMlHWFMd+YXV4roeM1GcJgy12Q6m4x2hwIabwgoXfeU0tvDYFyK
         lfaFGCrVg2aP13z8nDZvMIEpTS6xoF6nEoMI6v2StJMly/7th41QzjEUZCbOC1n8ADWI
         HyKGHzkKuztTN+BEFl67xlKhVY5issfzXTFVuu/r1LuzwhUuVYWmiERzJB5/+hQXlISy
         HHnyyRVBK4LqYBt8XQVyTdT7TnngTyxKv7A0GBgQ0bQ0ISNrAjzkeNAP/kdjIRhSv1P0
         ED2t5MeOU5EcE3TxeV3yeG0pVzJpu9eQJtJGf6aSd3fem0wPtzDyAnj+OWxhmeUrESQS
         qoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325759; x=1736930559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t32YYmdND63KQlb3EfkKKbPdXOTRoF4yhISxtDFCDfY=;
        b=v5UcVpUbQx9W92B90PHbPNFblZ9XLNU1Q68yycMMB4wwjD3X5S9t5OodjZwi6dk1wp
         QpbWkHxhmaE9Aw0FxfSwqylJUT/hdJAi3cyEctjFhGVoXjXEQ0pcczPe4r1QY/Qo/P1y
         rIt9fiTWB12jbBThBaBwt0GjCr3EOKQLKrnWoAA9PzAMcyoZPQUctJn/WKMObu6qqx1u
         Jem9R1rLvXUd3rBVQiuDjYrQSZa0K1BDAAfDgF26Nh49b7BttWcHm3v3jdQ9uza/kN3X
         TYGiAlEn0+3/VRy2+Z5HOE1vmErBll1GmDPmx7CGPzZp2jr5ne87REzq3N3aoNg6YA7r
         Zhfg==
X-Gm-Message-State: AOJu0YwVmIi16EVEKeK2LHIMExsBHimwOMcTDbV7ZQ4FT5ouE+4Hhoko
	Mclfo4chTJCHJlDqi2dONNDVxiWBBqZuI3gnf61J5iYLvy/JgzE2zjXTZw==
X-Gm-Gg: ASbGnctSH+2sIylDWpqTqML93bmMgrLqLq6R7qBgdAvSYXRZCH9nyUHpYYhUMLQJrm0
	SImOYCwcC/I+ZFrMjLy6EQUIYsv4hfpcgXXvC9m+M5Z2WHGh5sHsd7YZJHT+uAZTBhVfy7axdCF
	oIjGMnSzEmIWb/2QQZwtpAP8LfXziV/rNvQPx/vMDuDf9SyavEYXBX32jbOD6wyFbX2khFFz5FX
	u90RQXBOec6DFiP51MR/1+KCboMyt2bml9n2fk5GgHk28NKCnH0a4+rHVDPmMH3RgUa0NMWnEPT
	MrJxYme4qUe/9Tqh+A==
X-Google-Smtp-Source: AGHT+IFX1WGIokxaqcnjeGnCDxrytqFzWgX+GFSe+LeRCYN9jFDGfthjQQ0rKVQlEaQ46k8vd3dERQ==
X-Received: by 2002:a17:906:c142:b0:aab:e07c:78b7 with SMTP id a640c23a62f3a-ab2ab70a36dmr151214766b.23.1736325758861;
        Wed, 08 Jan 2025 00:42:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/20] liburcu: update 0.14.1 -> 0.15.0
Date: Wed,  8 Jan 2025 09:42:19 +0100
Message-Id: <20250108084226.117178-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209535

From: Alexander Kanavin <alex@linutronix.de>

License-update: formatting, file rename, spdx tags.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../liburcu/{liburcu_0.14.1.bb => liburcu_0.15.0.bb}   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.14.1.bb => liburcu_0.15.0.bb} (65%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.14.1.bb b/meta/recipes-support/liburcu/liburcu_0.15.0.bb
similarity index 65%
rename from meta/recipes-support/liburcu/liburcu_0.14.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.0.bb
index 3b083b25140..95d9ba17e19 100644
--- a/meta/recipes-support/liburcu/liburcu_0.14.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.0.bb
@@ -6,13 +6,15 @@ HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPL-2.1-or-later & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
-                    file://include/urcu/urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
-                    file://include/urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
+                    file://include/urcu/urcu.h;beginline=1;endline=18;md5=d35fe8cc2613ca70e0a624ed8bf6fef9 \
+                    file://include/urcu/uatomic/x86.h;beginline=1;endline=6;md5=358d69272ba7b5f85e29e342430d440c \
+                    "
+
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "231acb13dc6ec023e836a0f0666f6aab47dc621ecb1d2cd9d9c22f922678abc0"
+SRC_URI[sha256sum] = "4f2d839af67905ad396d6d53ba5649b66113d90840dcbc89941e0da64bccd38c"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.39.5


