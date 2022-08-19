Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5C5C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.479.1660894099948719279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6Y09L2P;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so3687616wme.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/3borQe5lQFRs/Bt6q2ordtekNhZeO5PAk1CUSnLsio=;
        b=K6Y09L2PqPXhb/2kck4fgxvrVFB9TGmOUHjtCvLTUenMKb8k7Gm5uVgK9lEQNZJtY4
         LC6H8FVbZ/zB+ZL3i9Z2TuoL3bbSoogH4oLMgLGD2d73NQVRrv1k2t8fKXOBbuJzoylG
         tTY5vUnzgJ53bePyjfdt/BHeNxfIDGqUONYwfrR4mbBIIHFs3WsG/p4Yj/84x3bjZ29r
         NoJvp7Zfhn5pxcVfDnhUJdg2T4t1uJRkDxzxXo/TMSSIqHteH0hf4lNVrRwvV0dtgwlQ
         TpteE9Lw7i0Fi+APsKsI/LUuSzNfumKRd/0v8VElhH7QadrJ/E/3DMaOstxuINb8gl+p
         CNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/3borQe5lQFRs/Bt6q2ordtekNhZeO5PAk1CUSnLsio=;
        b=eiENdsyd0FigES0XtNy4bdDOtplDJXUBtZWs4XsmJwfcM8yFNPjkOb8tyh2QbqgDQO
         lgU6cAN0UjS/PUL0VGQvlCfFa1CvAMw6hbkR2mFWw5HuKkgY5bBSAXKNB3dLAMkMBiHe
         Uu5fZP5Kb2uf3LQhiKOWl18d6DfynFGUTSIRffYS5hgryWWlnEOXcCcI2zjQ0lTNwD20
         ZYbGupqgXDYQvIA6uGL8bbvYrpeReA3eIoOt5w/QoAZO0ZIsP2kFe9ujNVwboJv6Nigc
         xjZHqIg9lU7ANFYAbHNV814veQ2i4VFiAf0qByV5GtwIMXq5q5f4zsdVcMXtj+PIYSQA
         UjMw==
X-Gm-Message-State: ACgBeo0cvLccGouPcftwLV4ajJYXPSFucZnDWcvtxZdq8LFwlCe5+omk
	APojD12MDi4I7CjyFcQeLjLTP8QWFzg=
X-Google-Smtp-Source: 
 AA6agR64MH8xtYTG/0ALRL83QLfpIgqS3dY1K910gLfw6sF+IfYj8t4bglTyDupS5gP2NLXYPbjWPA==
X-Received: by 2002:a05:600c:3b02:b0:3a6:a51:a300 with SMTP id
 m2-20020a05600c3b0200b003a60a51a300mr7138241wms.129.1660894098272;
        Fri, 19 Aug 2022 00:28:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/42] sysklogd: upgrade 2.4.2 -> 2.4.4
Date: Fri, 19 Aug 2022 09:27:20 +0200
Message-Id: <20220819072727.2236928-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169606

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sysklogd/{sysklogd_2.4.2.bb => sysklogd_2.4.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.4.2.bb => sysklogd_2.4.4.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.4.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.4.4.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.4.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.4.4.bb
index 948acbcf59..a19b4f58eb 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.4.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.4.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "78505913888b71b2fa2e8616636fcc430ffa30bb"
+SRCREV = "51d471543ce59eace6df6da0e42658911f1fb8c0"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


