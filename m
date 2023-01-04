Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24120C61DB3
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9362.1672830366643340608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F9LDYjzl;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d4so24592699wrw.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoVZNT+8Vv4dHLebruV8481vN6y8pyRsNRoj6mcZDJM=;
        b=F9LDYjzliHcxBEB36XbPUrYRBcQbkljl5bBY2LE3nXWJk2r4WeFntX8T/U2gHk7Cpq
         CcBHFIKWXFKXLvs1w1+amxUw9t3yBiU4n2HQtxIt94IVchKf77Uj5bCZ07r7EmPu4/+4
         zrQ+eYyx3SpMCYdHCSw3/U8UadWOfA5MdWqxeosdX4qoyzEaVadD1yoGOLp9lZmxXVVh
         XcPZBtQkENu81aqaVn8Oc9wedGvh5Ihh0/j8U2LzY5eRgxdJHeJCNGC2e0CtIkDfngfu
         CaZtRh8OQLXYXNhyYH949HbLC1E/N6V5sgbLbllQo0hJDZJ/aHadEHu0K1cTopSHViVb
         VuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoVZNT+8Vv4dHLebruV8481vN6y8pyRsNRoj6mcZDJM=;
        b=Hcm/hsP7V3OHvWnbC1eyh80RwKOeJtB4l/NkMVSO/GxZSePO3JcdtAj3HLKB/NL7LI
         jW/agCl6tS4+oHwHioEyromSoJ1WLe07rNyJrvHX2etTP0uoE1det5Gz6Yw1+e7WJEhr
         P+3Lo3jyEL0X60iRcxiEVgvV0MTiGb7ct+37QIY+5EkwbBpUDClYrYu/T5VWOCQStQDl
         fQ+69mExGwSlkb/njxrQqh5TyarxZ5P98oKVL5jsJzyZqyu8dZvE5qX2AmPkHt2GSV/1
         Em3ETMcQLSRzveEXHIwkfTrOSIzvEN2Y4jzzp20Xm5lds8JE40ibhQSnaUlGB4f7ZIkX
         qmvg==
X-Gm-Message-State: AFqh2kpyxqvv96u/ncPhcFtbcDsQ6Rj113yi4AjXEOa0SqtQtfbJZbgu
	MmgdyVcLC+XwjZ67AJhK858sKd9E62k=
X-Google-Smtp-Source: AMrXdXskn3yF1gT8MZDqFcfful31g/RgGuSKSZbKBd0/c04qLiYhHm/l2t5WbS26quAnsN0/QFmakQ==
X-Received: by 2002:a5d:6210:0:b0:236:695b:82d4 with SMTP id y16-20020a5d6210000000b00236695b82d4mr29468477wru.30.1672830383661;
        Wed, 04 Jan 2023 03:06:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/77] python3-pathspec: upgrade 0.10.1 -> 0.10.3
Date: Wed,  4 Jan 2023 12:05:12 +0100
Message-Id: <20230104110548.2537259-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175426

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pathspec_0.10.1.bb => python3-pathspec_0.10.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.10.1.bb => python3-pathspec_0.10.3.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.10.1.bb b/meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
index 8f2af0ec99..bd1e7e3639 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.10.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d"
+SRC_URI[sha256sum] = "56200de4077d9d0791465aa9095a01d421861e405b5096955051deefd697d6f6"
 
 inherit pypi setuptools3
 
-- 
2.30.2


