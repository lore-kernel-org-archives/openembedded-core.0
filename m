Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.107.1624553665597035625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 09:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kMS9afhH;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso3872987pjp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aJfB+g4VmUv7Je7OM58nra3ZaOModHMOxPQbWVF7RZc=;
        b=kMS9afhHDMCZxpUfQN/rMgXlfV5cH/icblyLmoWns+B/1udXYo+h2MhaKFfRY9L5tj
         CJ12645oxygaoDLD6700mEBAg0nytpVIa+yYWBh6ZHpaSt23N45hC+/A0tFxvbW8k7L0
         Z8QdyFiWy3lK7PSvg4nbNLKvsTBtBO1uIVAIoRpvocNlyoerpSjlbS6Ggjy3BFRjJZrs
         OQKLAI7bxZYlplbZ53oiL72G/NARTnx5GIIuT1Os8icPVCBAcb6aU8V05cFJg+f32xcu
         OF1jQQn63ac3ZxT0BnoLx2lWBxcyB7/h54aydhfqJUj2fPGNg8/DjKLooymwyywBH8/G
         0iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aJfB+g4VmUv7Je7OM58nra3ZaOModHMOxPQbWVF7RZc=;
        b=oVtyD2vPlNiokRwZ2Zp36Q89zXOBf4SxCi2YzU5rvXOCBGD/4EXg5ofyaZ7eWt0R/f
         54UP+42wwp1eDyOZk9gO0uC4RY1axAYju9iL6upSoZlXcGKmVtjyIwE1AHCn1wP70Hc8
         9LmnI1jlTYzqP5TauQDZrOAhym6I90GMFWzq4fzWOXWArAacGoEju1L0arW4nq3bBean
         WVGn30b9sxhZsR5P+SDN/aR4bJXdjkWUrPTuDKfhCefryPHtuqg7NmA62VbdCWh2iyFG
         0/jsHNgUdMCeWxxJE42Mv6o7+QYHNwz4wp+kIxOTNHfhCZvH4YWH4jdC5eVRUrrKpNXk
         L9yA==
X-Gm-Message-State: AOAM531/UAPLXowk6/CmxWmU8w8ZpHlv9druVpHtqRpZkz9ubP+P3gDn
	cgbupdyfg/jYWRocxilm1ktFPqMd1r1URg==
X-Google-Smtp-Source: ABdhPJwDazUl0XddN+x+4QbFs3fp09nO60EEzEeuL7vlyAa0wv98iDteOj1RKIBmcLoV6zYDUic3BA==
X-Received: by 2002:a17:902:bcca:b029:127:a4f2:845c with SMTP id o10-20020a170902bccab0290127a4f2845cmr1032462pls.29.1624553664897;
        Thu, 24 Jun 2021 09:54:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e0be])
        by smtp.gmail.com with ESMTPSA id n69sm3470899pfd.132.2021.06.24.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 09:54:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mani Selvaraj <mani_selvaraj@comcast.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] esdk: locked sig mismatch warnings when build from esdk env
Date: Thu, 24 Jun 2021 09:54:21 -0700
Message-Id: <20210624165421.32088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mani Selvaraj <mani_selvaraj@comcast.com>

A repo with multiple layers are placed under /layers/ and a repo
with single layer is placed under /layers/openembedded-core in esdk.
This tiggered locked sig mismatch warnings when building image from
esdk environment.
-----
TOPDIR=/Code/build
corebase=/Code/openembedded-core
-----
/Code/meta-java
/Code/meta-gplv2
/Code/meta-openembedded/meta-webserver
/Code/meta-openembedded/meta-oe
/Code/openembedded-core/meta
Are moved to
/sdk_org/layers/openembedded-core/meta-gplv2
/sdk_org/layers/openembedded-core/meta-java
/sdk_org/layers/meta-openembedded/meta-webserver
/sdk_org/layers/meta-openembedded/meta-oe
/sdk_org/layers/openembedded-core/meta

here fix it to move all layers under /layers dir.

to check this fix build image from esdk environment and
check for sig mismatch warnings.

Signed-off-by: Mani Selvaraj <mani_selvaraj@comcast.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/copy_buildsystem.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index d97bf9d1b9..4998afa60f 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -102,8 +102,6 @@ class BuildSystem(object):
                 layerdestpath += '/' + os.path.basename(corebase)
             else:
                 layer_relative = os.path.relpath(layer, corebase)
-                if os.path.dirname(layer_relative) == corebase_relative:
-                    layer_relative = os.path.dirname(corebase_relative) + '/' + layernewname
                 layer_relative = os.path.basename(corebase) + '/' + layer_relative
                 if os.path.dirname(layer_relative) != layernewname:
                     layerdestpath += '/' + os.path.dirname(layer_relative)
-- 
2.32.0

