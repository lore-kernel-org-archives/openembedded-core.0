Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B55CC3DA40
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.7491.1686734988203708273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RL1Se6wc;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5187a752745so2039792a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734986; x=1689326986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dk/fZguXXIBIeCu6M6yWxSvmfeZ/3Fxd7sEYKWnHWD4=;
        b=RL1Se6wcvMIPXBgK2OVa+SGXtJLiA/yHgtb4HALDM20Q0rR/s+y+8fhMl6woRdzVpv
         6Un5HwSQvG7z2v/jm1gL74uL1UXk4b8mEmVeTR0x+BfuM59gMzDU+kEtyu3vfI55MUqk
         I/OSDu71IZw6hfBcGvKXRkX2i6w0efBk3eF+oQeO5L+M0fSB5qsTMHoOXQAfCoDjbEmQ
         cwi7k4fLjLwOoZlApq4NbGVXUpSjSuYLijUJC2OjcXUgCTZmX9Df2bXyc1KgsaGlqfjD
         PY33W2cRtm02JUt+78rj1XMnavgHoOUqyYcKT7JiJDEicGHnuCrm4zxlFr9qxYXwBJ6l
         rDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734986; x=1689326986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dk/fZguXXIBIeCu6M6yWxSvmfeZ/3Fxd7sEYKWnHWD4=;
        b=gy3YCfOOByQ5/Q4lfpvQ+F47gEqtl4UlT1XBfmsEdMt99DRNNxVpdKpat4Uj3mNuSv
         pTdcvr1ZAXwtwQIyBMqr/3jgw2h97ViDtci8RpJZitfc6hQLm16px0ebrvL/h7jwsHVe
         N7JyHXdS1GetM3T3QvsoJYehBGdt741hygwW4m0LBSgfdG643CUpSKg0ubk2TYrrRqJJ
         C8CqIW0viFOeFHrdI5AHG0jKnntsRLorGCCHYoCyjHd1FgRSJwPqtyhWrDswt9jAluuL
         gE/VUZUz0s3/mpWODxFYn4fPlenYaHorB8F1jQLhEXPRwJ9ukVo166z6+HPDonx8dLVn
         yxPg==
X-Gm-Message-State: AC+VfDzbHZXY/O5H0GrD52Yz9RBzDxkJ+yn0CE0iQWwOVNEOYTUvTars
	MJHZJJoDtMXihfoyFJOv2Um3rdLvwfI=
X-Google-Smtp-Source: ACHHUZ65Y3QuX+MMhAM55fjABkQInBqglA9rQeGVjBZ+2vQgNOpAfBo+98F/RXOpwQkVsZM0M8RRGg==
X-Received: by 2002:a17:907:368d:b0:961:78c2:1d27 with SMTP id bi13-20020a170907368d00b0096178c21d27mr16217297ejc.19.1686734986717;
        Wed, 14 Jun 2023 02:29:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/55] parted: upgrade 3.5 -> 3.6
Date: Wed, 14 Jun 2023 11:28:58 +0200
Message-Id: <20230614092918.4065570-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182780

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/parted/{parted_3.5.bb => parted_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/parted/{parted_3.5.bb => parted_3.6.bb} (96%)

diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes-extended/parted/parted_3.6.bb
similarity index 96%
rename from meta/recipes-extended/parted/parted_3.5.bb
rename to meta/recipes-extended/parted/parted_3.6.bb
index ea2b68bbd81..05d57507fbd 100644
--- a/meta/recipes-extended/parted/parted_3.5.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2"
+SRC_URI[sha256sum] = "3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.30.2


