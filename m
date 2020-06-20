Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.10411.1592658652890854432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 06:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: valentin.longchamp@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id l17so10802211wmj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 06:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xnmQDbXt+mVcx6QnKtkXCRT6YyrAK69eGu7OpjM61Zw=;
        b=frqYUW4xgswQxog1mqZAGOStPqQX+bN7B23H3rb1MpBtk5a/nTUwhD1osFkGgMLZ1h
         Xd0dOGTiIhNilXxlp30/Dz2iQedROnOAia8WK4Ztl7I3LXKJzqf4Bp4d5UYhOaD/zmV5
         zTFzMiWYszCAi/4EjWDouSKqqGcUUFK9/HDQE+0bcE72PNAD508zBflFV+K4nauTe37P
         4vvkymyksbVErVMx+j9njeeJaFaiX2QP0oarsi6KVExNRtsh8vpZHu3BSb2WTulAy8JP
         23w/10KqmXDvg4rA68DWSkeknXtzOG4ghLoN9Wd0vYcjwNBBvxc4MXUqJsqRPzuKJiB/
         C8dg==
X-Gm-Message-State: AOAM531Xwt6jx+3/p0lpnGNDNF3555kHOztZ3cS7vdU2Fi4NeYaJRfD8
	i3pkiWHFSGG6CRgfg2aoI1dHg2bwsAQ=
X-Google-Smtp-Source: ABdhPJxTMIgyjCajHZNfngXeiRk1gfigB8ShdrN0L6TXkOUW1nng7V0PjtvPcjIZoJ2o5MC56xerVg==
X-Received: by 2002:a1c:48:: with SMTP id 69mr8978367wma.32.1592658651148;
        Sat, 20 Jun 2020 06:10:51 -0700 (PDT)
Return-Path: <valentin.longchamp@gmail.com>
Received: from silentold.home ([2a02:21b0:9002:414a:f66d:4ff:fe13:bb3d])
        by smtp.gmail.com with ESMTPSA id h13sm6498362wrp.77.2020.06.20.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 06:10:50 -0700 (PDT)
From: "Valentin Longchamp" <valentin@longchamp.me>
To: openembedded-core@lists.openembedded.org
Cc: Valentin Longchamp <valentin@longchamp.me>
Subject: [PATCH 2/2] valgrind: disable it for powerpc soft-float
Date: Sat, 20 Jun 2020 13:10:46 +0000
Message-Id: <20200620131046.31603-2-valentin@longchamp.me>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620131046.31603-1-valentin@longchamp.me>
References: <20200620131046.31603-1-valentin@longchamp.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

valgrind doesn't build for powerpc soft-float. It is thus disabled for
such architectures.

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
---
 meta/recipes-devtools/valgrind/valgrind_3.16.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb
index 5402f39a5b..4b6f5949dd 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb
@@ -52,6 +52,9 @@ COMPATIBLE_HOST_armv4 = 'null'
 COMPATIBLE_HOST_armv5 = 'null'
 COMPATIBLE_HOST_armv6 = 'null'
 
+# valgrind fails with powerpc soft-float
+COMPATIBLE_HOST_powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', 'null', '.*-linux', d)}"
+
 # X32 isn't supported by valgrind at this time
 COMPATIBLE_HOST_linux-gnux32 = 'null'
 COMPATIBLE_HOST_linux-muslx32 = 'null'
-- 
2.25.1

