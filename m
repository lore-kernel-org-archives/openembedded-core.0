Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F32C0219D
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.92303.1738600913434088104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=be8BT8kK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso4204632f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600911; x=1739205711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SS1qLkjPKhs+Rscw7w2XlsjMsTu05m0RwbdGAg7dhs=;
        b=be8BT8kK8V5lpWZpCyniA7gD7wX1NxOAnJOTuNu3qd3rgooneiip6L0yROVa4ZbJOq
         xjQ/EKY9Y8XMTT1jlaFJYVcWy/yIhWfl305IDfKi3c3QvnA7wQNWq6yL5ltuobZ3/dzY
         XVwuHCOYaQgI/YK7Owu5FaBCil1skWFqn5ePk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600911; x=1739205711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SS1qLkjPKhs+Rscw7w2XlsjMsTu05m0RwbdGAg7dhs=;
        b=f3hArUHO/aE+6R0GPfeFEYvf0JUeLfTp3VO4OjiMnff0cwMxW+6GdMlUUvNQTMPev+
         PxZq3/JD5IYOUi2KxF7wy6slEDGxNqtF3gw+iInC+v6vwD9rCrYHJO+r0zAEDss5UimJ
         nLJqMWxQqNbChXEOBCJK9IQ1g319n6JgVNl0QkUg+kUCVvlf/COqCUOEVzjCmOKkqtRr
         Jl9Qb3sKMD2cZ/z+jMVcLxuf86bvCVLINzaZQdknlQX5DhdQRz8Fz5G3EfSre8Y5Rr8q
         kIqzC2ejka4NXaH0BdvwgYqR2wPDAGF4/c9A6bubsezNDTn1XzvBXkfOhyoBq/ibMNRg
         Bv8g==
X-Gm-Message-State: AOJu0YyZFOM2s9/t2TtfnzQlOAy7C63tyUj+OLk9BErTOviqCS3wgBZB
	Ua5a8uwSWhF5DRk14sv1cpD/vxwhFrEaRbWPlilBUbv9+NYk708+0PQNRLDJ2MG153VbF2ZIn4D
	4
X-Gm-Gg: ASbGncsGdipGqN1HJOTPU3sT38XhC97ZLmJ0aW06VPcoiTmpyXu/m3xy6/8d6/LV6tL
	ArNrWHkEzllHjSMXrE/bJTqoODt4az7fjeER4UYDZegXsNVW01Spap50tuiHqPF2nm9i5VAQEII
	nDLBviW6wS5A/Cwgh7JSU04ApXQVQhPeeiLaYwJiVqpf30KK7RupijsC8DrcrXy6Sfex7K6ocKO
	tBdGUPrRbttextduts40RoFoc6IlayEviA3Thr8SHPfpIy8bYqsgD/XGVii0jExEvhmPKmqCG+A
	vX/c+5OAKtVqYb2sK+B5QbF70xcyDFGDPNwpjrkv7kRe
X-Google-Smtp-Source: AGHT+IG16kGe3aEqHJJ3v1N3d3v8x8taWqEB/6niLqV1x0dcwRE3Vjyjk2Kf1k3t82+1T3UmnOtXCQ==
X-Received: by 2002:a05:6000:154e:b0:385:e9de:d521 with SMTP id ffacd0b85a97d-38c519395bamr20762196f8f.8.1738600911473;
        Mon, 03 Feb 2025 08:41:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Upgrade Helper <auh@yoctoproject.org>
Subject: [PATCH 20/46] lighttpd: upgrade 1.4.76 -> 1.4.77
Date: Mon,  3 Feb 2025 16:41:04 +0000
Message-ID: <20250203164130.3403325-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210693

From: Upgrade Helper <auh@yoctoproject.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lighttpd/{lighttpd_1.4.76.bb => lighttpd_1.4.77.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.76.bb => lighttpd_1.4.77.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
index 153f451ea76..2e248a6b11c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011"
+SRC_URI[sha256sum] = "acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce"
 
 DEPENDS = "virtual/crypt"
 

