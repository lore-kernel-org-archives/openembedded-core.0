Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770E2C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.4291.1667832929812357582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aXBrSqM6;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z14so16606513wrn.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGoe42EaINIJTPkCYlrpSL+29Mu0J5bbSBPnqrF26fo=;
        b=aXBrSqM6YJ4SHp8+7mjkOQuPyaoWk8VSHYnC7uZ/X3ORK2n396oPKdHa44UQgH/Nb8
         oIX3F3g49iEAcVKyM0V+HkScozbC86PnNbm019q28oeywtlahgp38lYiRGJr7SCTvryp
         Ya8I3sXXI6+2yl3w5mtNbubt9vx/TsqjLv/Fq70CyvNhF2KdlR3x9BOrJ07dwhR+DhHl
         s6F4tVdQ+h+QeaSKRYOu3bInV/JpjpDprPx057mxyCFbGqWmyDAtsbNJdqPJ69MboY9z
         HuKpnZHubeRVMYfWMC91/VTB+AspY7l2CSrBMGzFlZhmJxn8urt4HbIF7oFvBqavF/Be
         5NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGoe42EaINIJTPkCYlrpSL+29Mu0J5bbSBPnqrF26fo=;
        b=uz1GTQMAp+Kha7zZonlxHcWulq5B4XHP8SIUdqhG5yO0Ybkaa6E48jjUVwSSHFcodu
         RmRhvFrAMN6VH5gWpssxZG0CvUvaA3gfwS2bkyag0/qwy6bBubb8uWe7n04k/UmmCsTe
         Aojr4QD5jJ5R6nXXU/zEaAlA9UEUXmn7PKaBPB+GrWW6vF7xY5oBVthW3hOu9Fs1INyP
         0ZrLenRHRk6rvBy6rvsXrRXI76a0xBYYNnqv3rzrVAWneR/W2qld9VxZaseaa6/thG6i
         alu8HHPLfM9PY6Q4CtzjgEw5yMDkrN3tQUF3qjQZIlXFKuvofBmvcBUuwvLZC1/zE3Na
         INRQ==
X-Gm-Message-State: ACrzQf3NJgPpVDRgfIq8D2MSQMFBv87/6P/OlHfeUC+uFMflOoE7mL7Q
	dBFdJ6l04ciWHNz9KhUhZGKeWToFLPs=
X-Google-Smtp-Source: AMsMyM6OsgS9JbSI5sskiy9LGmtWxpZhSSSprJiR8qjT7nLubBc1mRBmooNbV0uBTD5sk5Epn1G0zQ==
X-Received: by 2002:a5d:6f1e:0:b0:236:63f8:d03d with SMTP id ay30-20020a5d6f1e000000b0023663f8d03dmr32068916wrb.646.1667832930716;
        Mon, 07 Nov 2022 06:55:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/48] python3-dtschema: upgrade 2022.8.3 -> 2022.9
Date: Mon,  7 Nov 2022 15:54:38 +0100
Message-Id: <20221107145508.1051404-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172868

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-dtschema_2022.8.3.bb => python3-dtschema_2022.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.8.3.bb => python3-dtschema_2022.9.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.8.3.bb b/meta/recipes-devtools/python/python3-dtschema_2022.9.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.8.3.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.9.bb
index bc819c0dd6..3dcbc2dcb2 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.8.3.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.9.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "128c88a393cd04154cef4d4b10a643e4473ae290b436e8e61d2e97ae8e53255d"
+SRC_URI[sha256sum] = "c9533312a2d77c4ccdbffda1504aba850d9b224fd8b43e929cee2aa68478e82a"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


