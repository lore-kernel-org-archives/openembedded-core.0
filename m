Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980ADC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156332.1783358264401243294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tBbSkcCM;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b27c7451so535145e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358263; x=1783963063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjoyU3qN5vEHeivTqxitjWNe1n+CRhJfx1dMcwVQ4M4=;
        b=tBbSkcCMgQ4qDZQadGgTDYfS47veggGz41Y79m+sYD7Ukie8bXqpk6CrBWf2dGEa6z
         t5huU4Ls3MJO9Bpb2MRggc+KHtP38RMDyFDWDMmJ4p2vkIAEmvnfUa3edLK25T3pyiTK
         FykjH0Jjs1uTuQdSZRmO4sL2GTnuqoDMlVGuWdTxKd0CGBK/iL/UIM/IlDnr3gMjuniR
         r4m1xerYvvyMBI+gJR06mF2XV9XSJYJuw7U2Uxi/o4lD8weKXow7gtW90qocIpn5nVtp
         KkB9W8l0Od5d1GceQCbZPCXEzsBukWz0B/RCVnTUpM3eIhtbgdur3TnxNo/AZgUKz+vu
         Amkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358263; x=1783963063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjoyU3qN5vEHeivTqxitjWNe1n+CRhJfx1dMcwVQ4M4=;
        b=nbqlxkBv0zP4MhcUAb1JJhb3EhE4VSo+9+KBuGVbYljKnal171p1xJPLqLALHi458d
         Q05whsK36BhVECG/xy7BFCpHcSHqSPkbXhYft6uXkL5sm89A599qZrYWfp2l/T8GPt4a
         bfrEJ4z5UvjKbLH51bebl2w5+z0PAa2NsQPmoLuizN0Q0A6Q8BaiOLp2Hb9p3NNcOjmp
         NpD56bN/PRrkJNPcQwq8oldtfKMxW89J2g26ZpCXVuuQ9ONL6jjEMk6Uxu8edFZkZxgZ
         VMk1QNHdfV+9UnuNThEOrJO7POXaKTCmgs51GM9O23RG2545jVCUnH5xUioxytoMOulY
         n+cQ==
X-Gm-Message-State: AOJu0YzayAcpMAujLSNOx7gTlSSWV0FeQHxgy700cqi/gbZ74rilUxou
	p1B1lgY5fDHNKsB1jSG3wXgw1q+Hrw1qwuNqYiA8vhZdggRpkHmG+CZvz/H77g==
X-Gm-Gg: AfdE7cn0VnTYMW0df/efwkq+xq+pbwp27p2Hs9pILDWBujqYSbqKYycUKhPLhG4ZIHA
	ppni6xnS+1PJOYFW8pmK4SmhHHBxh9EL4//p9gasJf53b+vK9301wITU8kdnYVE0CvIn584V1tL
	ucJ35e28PI5KwNQRJYMpskUnb3ZGrTa3uE+cc1BYaEJ3XwNqD7zcoIJJ1vYrM6WBgu74TcS5nXx
	xzl0UYbaRNFe1jqtu/blZQyBjUc1pIQK/rws4Jpvb6tk5uYeMgsP4IZf/nArmFI+XHoPJVENE5A
	Bs9mJqBg5DcePejN4OPI2tc/d9Z1S5GyOfkUjiOym4AC9HIxe7skWkmqX2vxSCrlCtYmmKpjOEi
	NPgKWMF5iYu3kNnHN23TS6I/TkACJllTXEDN/fovJYYL5C+Ji5H3qVMyNnOpplas4M48CFVhhlQ
	pAQr3EWS8chS9Hp7W/6UAolMu+1vZ/pimoS2WJRnKucQsfzANl
X-Received: by 2002:a7b:ce08:0:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493decf58d8mr13514095e9.17.1783358262623;
        Mon, 06 Jul 2026 10:17:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/45] wic: upgrade 0.3.0 -> 0.3.1
Date: Mon,  6 Jul 2026 19:16:58 +0200
Message-ID: <20260706171701.70536-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240330

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.1.bb
similarity index 90%
rename from meta/recipes-support/wic/wic_0.3.0.bb
rename to meta/recipes-support/wic/wic_0.3.1.bb
index 7dbf84b039..d9b4cc05c4 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
 
 SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "5974ade11032f218841d9f449ef0efeee3f9a2ca"
+SRCREV = "6c66da65bf2aac618092811c13792dcbd453d140"
 
 CVE_PRODUCT = "yoctoproject:wic"
 
-- 
2.47.3


