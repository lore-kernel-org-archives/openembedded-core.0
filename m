Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.152.1620250813122026321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 14:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fGBGdvma;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so3072861oth.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/yWJOKZddbUzetSnd4eaqTYjusp+EVDT14XWQfYJ80=;
        b=fGBGdvma3JuBnO7M03oj6IwQXpXHUU404DDc3y9AA66+/MRqKpn9pOXgrNGjm5jWw9
         EmyOAr/L5Z7k9vMnDZgOyTxvym/kC7+E4M3icId6Q8v37uGLQX2rY2ZJQJldp7emwkM3
         SvGsDWw3YAmYzsKiezzRJBeuQqm3s1ws0C9/1urIZJSxvfm2YnCHL874kFW6IEyQs7zI
         MIML58o+T2VSsLLb/xEqIKTlwt0ySSVR0tuEWXwntqPNjDJFfM69rJEIubQohsZzoAQ3
         kJS0oLqwOdT9p33vc13AqPU8/qBcV5KRtCnsbuG1jxzuqM0R4mWOWjU+dA6JSVj0tQBo
         0dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/yWJOKZddbUzetSnd4eaqTYjusp+EVDT14XWQfYJ80=;
        b=PO0y7HKNHCEPkbVt9UWnWjnzFp8JWtQZwKPlGW3uzgWd8Dfxr8hPfgxMlyeKdXDwRF
         Hd6P3dqHeLxgWCapU7/OFUD4KrqZqQQcereV7ODscGc9YO3mjxrg9R8FW/Iy+kq05rQU
         kGU52P3oIn03mZzzPgB0kwOwQT22/6pR2a/UjbTXXgycW2J03Mfdm00kDzCwHyxcuTxw
         XhAPZCOSu8usumz97NiP9dYzAASZPMtDZNZ+cWxoi2qpX4/4uQPihO95jMm6HmjdR0Jk
         CQw/9BroEbny+zzxqdnuFwj/Kl6OMvoqnALbxqMEui+ig+mvkAA89ttbG2FQRWLoH3Qw
         Ad6g==
X-Gm-Message-State: AOAM530xe39oWKmm5jXwL3I71TsVHkCZrCZJnRhNafGTOhh4TdlnIxI9
	ZL9Pn/5DJ2pm4fuA5Y8BCNSbK/4IQ5I=
X-Google-Smtp-Source: ABdhPJyavmIZvozB1BDtFfq/H0cfErcjAJP53LL+7Jf2AEI5fe/XoBQ3WEBSAvk8ySscha6XzG9tuw==
X-Received: by 2002:a05:6830:2117:: with SMTP id i23mr646736otc.170.1620250812299;
        Wed, 05 May 2021 14:40:12 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id g26sm169915otr.37.2021.05.05.14.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:40:11 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/image: Use xargs to set file timestamps
Date: Wed,  5 May 2021 16:40:06 -0500
Message-Id: <20210505214006.10382-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having find directly invoke touch for each file in the root
file system, pass a list to xargs for batching. This significantly
reduces the number of times the touch program is invoked and speeds up
the do_image task time:

    PKG           TASK      ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
    my-image      do_image   -45.3s   -94.2%     48.1s -> 2.8s

    Cumulative cputime:
      -44.3s    -92.3%    00:48.1 (48.1s) -> 00:03.7 (3.7s)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 013455f492..353cc67175 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -657,7 +657,7 @@ reproducible_final_image_task () {
         fi
         # Set mtime of all files to a reproducible value
         bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
+        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
     fi
 }
 
-- 
2.31.1

