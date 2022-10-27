Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE00DFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 19:51:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.1941.1666900259660776737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 12:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=e30q5fAK;
 spf=pass (domain: baylibre.com, ip: 209.85.218.48, mailfrom: bero@baylibre.com)
Received: by mail-ej1-f48.google.com with SMTP id fy4so7703081ejc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 12:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1szg3F6YHU1KTcMCMrmXPXfYBT38rTEFOGYQjC8by6o=;
        b=e30q5fAKKaGFeLhgzCmOppM0wXI09TBbrhl4X6/GAO1qtdgFBHQV+s/nBM+pT03gtn
         v6Xx0c+GgsxFGpF5QPCFumyyyJTJ/dq1A/zD2tzQBr1negsTH6ytpkElxyCzeBHQMaHB
         55T30YyAn8mZ6F5J9C4DYNYO0QB2gWusaOICYU9jVHBjzKlMAelYdI/MW0JATU+eFGLx
         lPFvXZSjBI2/FbZgN3gaXD+sdBvnm6YyyKUFnNkr2yocpmmqX28KsvTaTHpiVNEVNdDb
         VdznvbCMTyFxaZWdGOjrsFbkZ8ZSPNkNxm5bhOnwKSW+2TcVdCbOHkjiASftKR5oyCda
         2Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1szg3F6YHU1KTcMCMrmXPXfYBT38rTEFOGYQjC8by6o=;
        b=XJBZoiMVDaYhnMtV6DuO6Sx/MHCjxVzpWenFTpERTQp7UXo/KsksBvI4gTH7zTCBaK
         XtLUaBOxpcW4JwU4duLykcVjvDDLSDYVoN2S4CAL57PyLpmTyhrYb6qFl6V+HCz0ZfZl
         tPdRpdyu5LiMB63+hSWX8TV1ObS3obNX3QlcmbE6ulxvqGTxb3sn6h89KWn73GFEsAJV
         9wwtoSvoVLxoMaS0hBJuPjlJwN5Aw2ERWsW/gIH14sJMLeCdgYGUVR9RAMntb69a5VFA
         LZcQETZ8iZUka2okBugb2gdJnuVch9Zy009oKejNXpZo2sAwDBWFCPXBlUdAaOsWy3I3
         jS4A==
X-Gm-Message-State: ACrzQf1q5wHr7FNZyaqckcW80lu0UR5YEL1E8UHAUl1TZyoWlaeKzf7g
	IIHuPErPiSwLVLWDaOT+I2yFcg4Jq20/4w==
X-Google-Smtp-Source: AMsMyM7vS8sXvCDPTWauIwd0CofyBd9ZpQMChHlS33IJyEpeNpB7agJu6mUcMY558bZvOQVutypatw==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr45239014ejc.670.1666900257671;
        Thu, 27 Oct 2022 12:50:57 -0700 (PDT)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id vs18-20020a170907139200b0078ddb518a90sm1156944ejb.223.2022.10.27.12.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 12:50:57 -0700 (PDT)
From: bero@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Subject: [PATCH v2 1/1] cmake-native: Fix host tool contamination (Bug: 14951)
Date: Thu, 27 Oct 2022 21:50:21 +0200
Message-Id: <20221027195020.3937344-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <c78c90b7-5a11-45ed-66cf-8dd0dea08b5c@bootlin.com>
References: <c78c90b7-5a11-45ed-66cf-8dd0dea08b5c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 19:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172204

From: Bernhard Rosenkränzer <bero@baylibre.com>

[v2 should fix the From: header, no functional changes]

Trying to build cmake-native on a host system where curl was built with cmake
(resulting in CURLConfig.cmake and friends, which do not use the same naming
schemes expected by cmake-native's build process, being installed to a system
wide cmake directory like /usr/lib64/cmake/CURL) results in undefined
references to all libcurl symbols.

The problem is that cmake-native sees and uses the system wide
/usr/lib64/cmake/CURL/CURLConfig.cmake, which defines CURL::libcurl and
CURL::curl as opposed to setting ${CURL_LIBRARIES} as expected by
cmake-native.

find_package(CURL) (cmake-native's CMakeLists.txt, line 478) succeeds, but
incorrectly uses the system wide CURLConfig.cmake, resulting
CMAKE_CURL_LIBRARIES to be set to an empty string (cmake-native's
CMakeLists.txt, line 484), causing the cmake-native build to miss -lcurl.

The simplest fix is to let cmake know the right value for
CURL_LIBRARIES. Making it -lcurl should always work with libcurl-native
in recipe-sysroot-native.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.22.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
index ee1f7761c4..45ea78ae00 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
@@ -32,6 +32,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCURL_LIBRARIES=-lcurl \
 "
 
 do_configure () {
-- 
2.38.1


