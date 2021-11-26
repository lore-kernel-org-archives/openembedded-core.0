Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDA5C4332F
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:19 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.20164.1637901378310525906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AUM7a0TF;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id p18so5849131plf.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tghklvfHEEB1MX9anlA9EgX/tgbRc65qK+ewh6e++BA=;
        b=AUM7a0TFu4xUHHWfSwLhk8ZFQIcS3Qo4eW8lvl3JYYn4ihUsyOLtADXgfQiqckV/iJ
         s7SG6LcGemVNXohj3NMasETIeqwALZCXbkJTh7Y+MdK68k1ps8B7s5ZKCdbQ9D5K6ycg
         AcqE2nwqTnB0nJABkrSyfE3JY9E6vb0q3Ki8vBNxdLTi3GfMF8at8731zweigJwc7Vgu
         s2sjlw8BwmbnNb9299ANMxEVhJAHECEMEfCgGTn9w6DGvCEIbdI5t3MEhotkeWh8yMTv
         RpWn2feDdEOiGdVmB0q/nGugMmY9Gxl1UKCmo7JktpPcUaisycQ+sn7/IpQajEhTS48C
         Sk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tghklvfHEEB1MX9anlA9EgX/tgbRc65qK+ewh6e++BA=;
        b=GgZbB+uEbWUoV7Vx6ag+U5zJP5ym46r1uK2evtVmYyBTP4xLyblICbZTydtbBJ1TpN
         B55h0BgWG8CvhTEyK8UMwk5BLmfzEEc9dtg+Hzb9pO/Lq5+uI8xIUkd6azZyadKGyyZk
         yFStHCBfJf5JZ54gj1JSSLPE/U+KAf2Kb++XyrshXMoEwvA/2ncZWkfxStSEEm3wc7mV
         yk3Q5RFJ13SGSeAEBFHcXuj5AchEvBdb+XGvjnEG+EXj+9P9EYCAhJjquukF2hXeXcKY
         Sq/KFJ8oJW9xkmL0ufSpIksrudrqOYWIRMmhdpAGHMkEe+r1TJjb2Bb4/nevc6EzVfLR
         fNyg==
X-Gm-Message-State: AOAM530Foi9KIYMXKH5SLyFM/SW4s3o1Z6bvr6cRuu3W3ALI1Ruk6QPn
	6gVEyqS/PNX+n6f1TDGddmB1z2RWA5k=
X-Google-Smtp-Source: 
 ABdhPJxD7wv46BnWAbwh/JV4IYTAzecFU5T/9zwdSfjTaWGapLfF4xHZ+O9qq8jsauujgFRISk3j/Q==
X-Received: by 2002:a17:902:b712:b0:143:72b7:4096 with SMTP id
 d18-20020a170902b71200b0014372b74096mr35753661pls.25.1637901377604;
        Thu, 25 Nov 2021 20:36:17 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 05/26] libdnf: inherit setuptoools3-base not distutils
Date: Thu, 25 Nov 2021 20:35:44 -0800
Message-Id: 
 <be5902f91d00eda988bb631a8b5983b67de54fcb.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158801

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
index fbda7769c07..81da04c9ca1 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native"
 
-inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
+inherit gtk-doc gobject-introspection cmake pkgconfig setuptools3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF -DPYTHON_DESIRED=3 \
                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWITH_GIR=ON', '-DWITH_GIR=OFF', d)} \
-- 
2.30.2


