Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809F9C54E6A
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:48:59 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.8548.1710366536032234128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xnOiIamo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso58234b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366535; x=1710971335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=la7jHsYPD67LaZ5A3I3nqrlPvFubLaMPcduMY2SbGK0=;
        b=xnOiIamorgi2PMjaNrhe90J70BaGyb0sMFE6zlglzZcj1D4jDsCLtti7q3fSZOzWaU
         NgMFzCNlAicD/l8Q1ZO+fTK0XICCmBIoX1glBsjcbOVMaI2Q3XK7MlW0kH8PPTNQ/LBb
         XPzmxde2zBVQtxIA3LuBu/5rat4yV3o8XeG3oIXcp+IsXz/xCpqFYP2vwGMiQ+tRgHjG
         oPQk1WJGkhQ+o8ZGWdzf8heZQWlrlpkSCBH/jBE1zkdL6vMK6corJBnTbsj7/BbI7ftr
         0LW39CA0+Oqtwl2RNKvVn/cYYBZokQQdU2eqp3Rlun/Og9+lrSFP9ef2r7XoYmZQpYfi
         w3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366535; x=1710971335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la7jHsYPD67LaZ5A3I3nqrlPvFubLaMPcduMY2SbGK0=;
        b=FQVTzy651hjF/zIvnEKB2Vv6+KfDKD2Dx0XbYzKYi+nynOce2syzU66+0/1Pb1j1y+
         91tqYFEzVOlNWDQz1JGDwa6gRafvau00aeGcRstGVlY080jvPU56KqTN4F+UARVVHHyk
         rqQV4LNe7eaQCOchkki7YNxiqqGkYQkFxn6Xhx7eBxbi1EqxkWkJM2GmJZChRgQmOGqJ
         fUtYeWY/TcEBYm6Cj2fjUbZ0tN6kVfN8UM0IUjRAf50X3cTaD2f1Qx8o6T+80Nsd1gAE
         vKdLkajM6C38wgDX6mCzkWdbGCwNTfXYbPz0usCsDgSQkQN0KU8EjgyM+sa4A5sfcdGV
         uTaQ==
X-Gm-Message-State: AOJu0YyNhYK4PxOHMdek7cnqxWc9HpMtScIMpgI1AbwmlCzXPNBe7fpb
	zwb2eBomqSPW4hfLW/6OcgMD5fAwCmuWr+9qCgKbo27cXwX/SaGeGlxyPYg38InQ+C4aaCMOJHm
	iDUU=
X-Google-Smtp-Source: AGHT+IE9CT5VwYO9x+FSRC93BTd+jTG6LWefNPAdZq8fLw4zoV+auijpgLuxQV8WKwdB/vn2wmh9iw==
X-Received: by 2002:a05:6a00:928c:b0:6e6:a8f5:6dc9 with SMTP id jw12-20020a056a00928c00b006e6a8f56dc9mr4470929pfb.2.1710366535223;
        Wed, 13 Mar 2024 14:48:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:48:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 2/7] libxml2: upgrade to 2.11.7
Date: Wed, 13 Mar 2024 11:48:40 -1000
Message-Id: <a0d164d7705034b2c351c518cebad8811ed5026f.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197086

From: Lee Chee Yang <chee.yang.lee@intel.com>

libxml2 2.11.7
Security
[CVE-2024-25062] xmlreader: Don't expand XIncludes when backtracking

libxml2 2.11.6
Regressions
threads: Fix --with-thread-alloc
xinclude: Fix 'last' pointer in xmlXIncludeCopyNode

Bug fixes
parser: Fix potential use-after-free in xmlParseCharDataInternal

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.11.5.bb => libxml2_2.11.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.11.7.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.11.7.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.11.7.bb
index fc82912df2..482ce9042d 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.7.bb
@@ -18,7 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
+SRC_URI[archive.sha256sum] = "fb27720e25eaf457f94fd3d7189bcf2626c6dccf4201553bc8874d50e3560162"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


