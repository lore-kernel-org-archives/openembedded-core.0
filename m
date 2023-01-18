Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EE2C46467
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:22:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.16443.1674051745820458003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bVxAwPGw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso1505241wmc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adNb7KXOYcpJAAtnn3lvKYxM0GEGZnav6d9sj93OZnI=;
        b=bVxAwPGw7+fXCyKVWkgE+UKa+/qlQgfqOtT2PIERRChHZpx7/xf9883hX6/SDDvnSb
         PwVGMPMrIZ3nC56LuXIB4LIeNB8GuS7NI3YwBVoorKZxANI+1tTgOljxeKwguI+Z2l7U
         gHHB5ple2LbVU5DK+2IVeX9mmfwqmd7Xm+Jws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adNb7KXOYcpJAAtnn3lvKYxM0GEGZnav6d9sj93OZnI=;
        b=Cr8CmW1NYXj51RlAvC8uK23zr1GbB0aJ2QG5CPbUHVDPdUFPI0DVFOL/SJrfxN+HwE
         fN5jzAXD+b+AxdT76GzeNdNulcupf/svwH+uh2cNg14vJiElHs1XqRICVfdNT++YZdZx
         VL/Qvn3Jo0MI2Yoev14AJNxXgBbREKjfNQSPSlKkJZtKWgPUINSCnJyxoGt0YVOXDrZ2
         6pBpPyhv9QyJznDUzc98ZCmyJ5a4NqFdbHhPaSb/cQ3qTFPDnHGhwEhUSCjhQoYl89ZP
         qw9qMRrJWLJotBXTr6E7igjZiYASx+GGceth/a9mj7QJVIlsfQ+lynfLvQzXFiiK0VrB
         SMqg==
X-Gm-Message-State: AFqh2kpkwYwbnqs/cy83lo8/QAHURoS4AvbVSnUvX7NPkWMRYgbi3mAu
	ugFDErOCzORcQCGFLwevya/kGwKwpM6TlBA7
X-Google-Smtp-Source: AMrXdXsBCCi4fdlYNbDoVVlE/LzwrF3ZlbcOculbhTRFnSCNxjN4Dv6WqPZZ2QekjOolhK7AOImF2Q==
X-Received: by 2002:a05:600c:314b:b0:3d2:3ca2:2d4f with SMTP id h11-20020a05600c314b00b003d23ca22d4fmr7197527wmo.36.1674051744126;
        Wed, 18 Jan 2023 06:22:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05600c1f1800b003db122d5ac2sm2133304wmb.15.2023.01.18.06.22.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:22:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] pseudo: Switch back to the master branch
Date: Wed, 18 Jan 2023 14:22:21 +0000
Message-Id: <20230118142221.1926666-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176100

OE is the main user of pseudo and we've had the changes in the oe-core branch
around long enough that we're going to run with them. Swicth back to directly
using the master branch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c9386c3f090..553f0254ee4 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
+SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
-- 
2.37.2


