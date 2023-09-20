Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1264C2FC0C
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:09:49 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2682.1695247781350644694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVkOQ6vq;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-690d2441b95so154143b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695247780; x=1695852580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/hstVTfqpUw6l6854tYbJ45TbQ7112duVAXQOJzK38=;
        b=XVkOQ6vqD9lP2Lnu14zt7RxoZvwoBgne02DZ7EuzbwuRdp1sypzg+aeVu57pYIc/OG
         csWc9g0FZnoXAW+bHTaDYSE+l/Sp81pb3HpCQN9oQ4DNA7O8+M9HGOKQSJbSY5NNq2xv
         lLD7nqe+HQHSpuU+ZmhLDDCyE9tIZNjOMOwNrDh9O8kdjcT3l8XzWI7uWf/9AWGud6aa
         QbCxiIyYnATejuaKxOBH7/w/JMjwlXC0NzetOfHQwb1DIOUUsOYjcu16DaMsFXTm5FBj
         ab/yOV+wZta2Af6ERXM95J16lvP/D+nOWCBawWpR0wCxDaCSZH1rqMKybCrHUM+ZVm1e
         VTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695247780; x=1695852580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/hstVTfqpUw6l6854tYbJ45TbQ7112duVAXQOJzK38=;
        b=C8Pj+YMOZ7vFhL/PTf7EIOBwDJEjz3sWJe3kLWuXeF8hyaeH+UtvaR7MEyxyP1U3Ut
         HF50CPhGhfoGoH41DwihiyMj4IK5XWh5OAGW9fAPqkT4hEcDPibmW/pOglGICuGX0Hit
         tHaKE5zxPYW2rdKW8GHpiIwcm4J/+ruzRYoro7cNUeyZ8mGcLDF8nHFd9Z55cFFdrqNh
         CePZsLqnPa2D+APsjN2q7l/AVyFsM+73Pe+PaHxu7M8isMx1RSkiZR3CY3s0xWjs/bAR
         p2heoHmNAys4JYJZXFff4Y+2JXkJTAESsGUOiipU/S2qDvKZQloD1Cb3gmtJLJr7Sjdq
         JG5A==
X-Gm-Message-State: AOJu0YzCAr7zA86u4mB91W+DtraY2mpctaKHGgM1W/E4xM2o7Yt3uPLy
	ynfTP2X4+bJG58OwHcMU4bp2/G1/ACc=
X-Google-Smtp-Source: AGHT+IGqL2adymxlTnJOLpNLVGOSR/PJqH61Rp82YYIJWx/Wl07O9gKj+iWRWTwmhut4DRgaW9Zjtg==
X-Received: by 2002:a05:6a00:3316:b0:68f:b986:ff69 with SMTP id cq22-20020a056a00331600b0068fb986ff69mr9023433pfb.6.1695247780318;
        Wed, 20 Sep 2023 15:09:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id r22-20020a62e416000000b0068fe68de4e1sm24324pfh.145.2023.09.20.15.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:09:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] common-musl: Disable error_at_line detection for musl
Date: Wed, 20 Sep 2023 15:09:35 -0700
Message-ID: <20230920220935.970957-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920220935.970957-1-raj.khem@gmail.com>
References: <20230920220935.970957-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187946

bsd-headers provide error.h file and static functions to implement error
API and related functions, which confuses gnulib provided functions. So
lets prefer gnulib provided functions if they are used by a package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-musl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/site/common-musl b/meta/site/common-musl
index 0fd0413819e..003e46b51dc 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -54,3 +54,6 @@ ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 
 # Xorg
 xorg_cv_malloc0_returns_null=${xorg_cv_malloc0_returns_null=yes}
+
+# gnulib error
+ac_cv_lib_error_at_line=${ac_cv_lib_error_at_line=no}
-- 
2.42.0


