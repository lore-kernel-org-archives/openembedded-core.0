Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E320C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156300.1783358241365864639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TAzifbk9;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so25165545e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358239; x=1783963039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnKD3M1pVo7mL6NSE3lVKE1GV0oST0ui0D077AemOzw=;
        b=TAzifbk9XlfdEd+vggOe4ak/xW8FVPMSgDC592wa6XcCBeZnTX1RCWOFgNon3cqep+
         w2u3ew7ehbv3HFVHTRpdScYbfKoYRWDlor6KdnkOdNZom0dsHmlwLkYCmrEJ6h/ekIy7
         /f9s05H/QmoXhE2EcKmfBOSkdpaJF6y991lVVOHLiaUTdJQQHotPr9MKMpLFzhvffrfB
         vdFnxi9iCMm20nyYkk2KK9elswyxCYJWYj7Z+S9y3sjiMRIVOle8ANU7TEhl1DIc1Lk1
         vWhhoK7qZSunkDE/7prkLe7zZcnAWB73O6W573tMdwN2B7D8CPGYaD2z+xEglPJpWlkg
         AzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358239; x=1783963039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnKD3M1pVo7mL6NSE3lVKE1GV0oST0ui0D077AemOzw=;
        b=GjV7udbe6sRDtM1aq14g3UF9EfRXZzTUEe1HSXhYn1I5aQr3gt2NoiRv5uqcOmkF4/
         ucb2Mbo62G+KNtXkZaOuN/HmCVpyEAFlYPnQACw7kd6U8G0LbyUUT9xM96disnUC0Fn4
         G7dTh+UqSYgMovDikwNEdqjOtoo4rORYOgrml+rclJ46qqNLsIDzSSI4olSVpDx+WIR+
         r6GMFHS75LKG9nfLAAEAsP28r82ffnnBXYmCn8MAuLzxnU+VzytgCVQK/dfmA5qqU48y
         8fH0X19tCMxKlxf+HjXaB2+n9f/4HhGFqfvTnaKXtjzE0uimdi+Or932wgjNDRB1Q843
         f0VQ==
X-Gm-Message-State: AOJu0Yxs1eIuxiM6/EyQHkU2Ce1myysWPn9kzfrRexOwanq9LkvGq4Fr
	hbWalTKXUNVkLFUTOp8TBb1GVJXqrIusAW+0cLJOllTHVM9b0lhlvynFtHgHAQ==
X-Gm-Gg: AfdE7cmESXgLQlf6IrtLklO8fnmw37SDczHUDeOCb3f2TAMq3KVU5VOC2QS4pXtjTqV
	VYcOtJu1+mFFPFU/3bWVMW1UlJb2RqyDoINnSNDjx+FWARtdxUcQbBUh6LmXsjoX9sp0oenbwlY
	GsgzU2b58fv3uaM4O+CX91RqcxuwygooxUTCfoi9kkiVUCCnG2rP/+ofUJexOUd79HQ0iAE6PMd
	HhBJ/lAmwfxRzGxthsqiuWIUSlqODqk4vaKk2BxqqpXTYP3p76OmhdZD33q2ndyt+M28tDj8YVp
	zIJCsQajfCv9JBLV0TAZlx30BnyvWEpN0SncsNIRzLY+arvDd2lFEsNGnDsFI542hjK3ovWly1f
	3oDdsy3uzxy+Zr9+sNIAZiGRQ4ZJOaLE5O90zy/Ghv1scdC1t21gtPMntxa/zStz5Cw+cnyiTxw
	nhAWP1C83kagbIhlIq6ugLhA+wYGyZhdC06EQg/dPN57tzkN3P
X-Received: by 2002:a05:600c:ac3:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493df0799e2mr14709215e9.36.1783358239461;
        Mon, 06 Jul 2026 10:17:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/45] json-c: upgrade 0.18 -> 0.19
Date: Mon,  6 Jul 2026 19:16:31 +0200
Message-ID: <20260706171701.70536-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240303

From: Alexander Kanavin <alex@linutronix.de>

Tweak ptests installation.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../json-c/{json-c_0.18.bb => json-c_0.19.bb}             | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} (84%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
similarity index 84%
rename from meta/recipes-devtools/json-c/json-c_0.18.bb
rename to meta/recipes-devtools/json-c/json-c_0.19.bb
index c112aacf4b..738566d303 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724"
+SRC_URI[sha256sum] = "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de"
 
 # NVD uses full tag name including date
 CVE_VERSION = "0.18-20240915"
@@ -19,20 +19,22 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-# Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
 EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
-                 -DBUILD_APPS=OFF \
 "
 
 inherit cmake ptest
 
 do_install_ptest() {
     install -d ${D}/${PTEST_PATH}/tests
+    install -d ${D}/${PTEST_PATH}/apps
     install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
     install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*json ${D}/${PTEST_PATH}/tests
+    install ${B}/apps/json_parse ${D}/${PTEST_PATH}/apps
 }
 
+RDEPENDS:${PN}-ptest += "xxd"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


