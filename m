Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.61178.1629322111287230763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 14:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BuFHS4am;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso5325764wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 14:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2osNNm1SesDy6x0oR4mYJLNylbjskeRmPSTyYdG5d5E=;
        b=BuFHS4amoHQVFY2rZsP7yK2SAsFAtyMNnZNQukT75nDvTzJ0azywUyNl+8Lc/sDuYh
         0jrwzbGYdBub5baWb5fEIKLKvC2HJwa6uP4TnrTw2oCD0Gp6PP8sseWcJBCqbV7AgiAO
         Z0GsFwSWT4JQVqXGqndLcYomLXf75+HmnWsG/k3ryrfpKi75ogsvzil4WrzPEihzpQUW
         a7st7C8vAe25tSWJZG+vTr2Q5FMAAeYEvvhlD4UCWxWhKgdsxT3i7Xrqvp/Y926UX/PR
         Cu2Pa0z9zPYjQ5WHzFNsmaDe4EWGEHBEc06j3arGUOV4gMWcF3I7XZRo0o0WCXNRHBis
         nDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2osNNm1SesDy6x0oR4mYJLNylbjskeRmPSTyYdG5d5E=;
        b=QVio3MHdEVg8ZephUoUxwyJuv4h5SGosccN4luMs0NU/tPaipMb/CbYzlaZwmdZmhV
         CMSX1WZ0tq2r0v1rWC2zLU/e1zhsvPkLaZ08sy6QouOm98xJyc8RCZrUXbw3qLB0VHrp
         WagHuzEITsN2ng1oMgpLFYWOeKAeP6DSkTaKGKzgKp222mD+PRE29HvYfgN2EcJTan02
         NXBCvK6CkNHH91hcrfWBNQeMol6Q1Zdgr3gWG6GG11HScZgWbyNu8QQ6HElhx/11DY4B
         FQu7656X3Sw8NLQsKrRxzcOVswmZQ/QTm91atPq/zPdzX+r5WdO0mXwKqG44QqTnMXrU
         JDMg==
X-Gm-Message-State: AOAM533ojs9aTXqoBg07ZbpdskAxOhVupoKl0Qn918HivqmXFzLcTcJW
	YYoM1nLjNaPPB6aSsQ8/lwbrwJZYRvQ=
X-Google-Smtp-Source: ABdhPJw4+PWajXEjKcXOixbmv0dlE9Nrb5ETDeSyZqKeeAsJM657Ai1UwY61eku7LkQwtjEN8K3Sjg==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr10228857wmh.99.1629322109570;
        Wed, 18 Aug 2021 14:28:29 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id c2sm927597wrs.60.2021.08.18.14.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:28:29 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] patch.bbclass: show to the user where the patch is applied
Date: Wed, 18 Aug 2021 22:28:24 +0100
Message-Id: <20210818212824.146143-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- There are situration when the user have the 'patchdir' defined
as a parameter on SRC_URI. However he doesn't know with this,
the patch is applied relatively to the receipe source 'S'.

* On the next example, the patch is applied on ${WORKDIR}/contrib.
But if the user specifies a path on 'patchdir' that don't exist,
the patch will fail and there are no message that indicates the real cause.
So showing the source path where the patch is applied can be useful.

S = "${WORKDIR}/git"
SRCREV_FORMAT = "opencv_contrib"
SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
           "

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/patch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 388773a237..559c6f45bd 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -142,7 +142,7 @@ python patch_do_patch() {
         else:
             patchset, resolver = classes[patchdir]
 
-        bb.note("Applying patch '%s' (%s)" % (parm['patchname'], oe.path.format_display(local, d)))
+        bb.note("Applying patch '%s' (%s) on '%s'" % (parm['patchname'], oe.path.format_display(local, d), patchdir))
         try:
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
-- 
2.33.0

