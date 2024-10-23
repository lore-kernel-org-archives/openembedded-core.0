Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F7BCF5376
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7690.1729686907207240358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lB2qY31F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c77459558so56880085ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686906; x=1730291706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29KQ7iCvssIKgU1zRs2Ztpv+u2y8dKI/q9WbY+v5XZU=;
        b=lB2qY31FHaPN8WnMULKPDJb9eYG+U1c78vZZmZGjDbonbAc6d6biCTZoUuKe7Tc+8d
         JxQ+s5sK6x0sm3Wnh9lcjwAL87Y3p/ZqGWQ/1FRnilh7+trEo/OYiymfLbQaeCvGAqIj
         txNsJl+mCuchfx9Pvk6U23BzwiUx2PIGlRgbGRiyah1tahROyi2PIYmmEBVxS6OdqK9R
         naDZ1QxOuOYPc6Lcka+BTs4uJypjYyyOBWkRdHjdpeaDnFQAkodljA79KEF38QuOkBzJ
         PQv4qTo4tmOiD9880LH7zB+qFSSmKl2VGZUrm7+WrIJ+qeDvkq401YcQTeOPGkmt0fbI
         IXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686906; x=1730291706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29KQ7iCvssIKgU1zRs2Ztpv+u2y8dKI/q9WbY+v5XZU=;
        b=srg6sT0NsKCRZS4UEhNVcsVhtXdZGJj7t5+jr2Wvd6B6MHhGJrbEwEVhItwPlJMUJ/
         +01Sio/tEtbRhPAMCQjUvLBL6PXUXgu9dr+A1ckVxLZYRpVW2KIwnXz1g+uqS15ODRzE
         u0NkEdMqU7c7sEx8ZVCgei6GPie+RVB+L8Q1/FuNocnsa+Wcv7p4S/rdE1Nxw4+FSlmk
         nqSJiqXK4JKSpOCpXJt/Gm/VgqW9XrHyludcf3gLXhqhsWHQfRpGsnIxMx6jbvzG8u3m
         w6eXhFjpWp0re4LDnNgq8SAd2LAUNdxqLo50pd4OZXjTkcrGWmFfded1cKG5Zf3qSbTB
         metw==
X-Gm-Message-State: AOJu0YynC9cTu7L/02m0oGGOYqvNVhweFBC9iHkPsmBIq981rMFl0Yqc
	a5MOc4lQmD+lBRn7GEdIIyRp5EyjYc+2vTXG2S6+tDms3tSJa28e+vnBHho+CGOhkSV/mjaNpxy
	m
X-Google-Smtp-Source: AGHT+IHn55mux330Sy6AZlycE0AtIxGBzaCKa0wstwtvbw84FpIh3sIv/ISJ4pu/T1egTGaBxdxkSA==
X-Received: by 2002:a17:902:db0d:b0:20c:ee32:759f with SMTP id d9443c01a7336-20fa9e99c98mr32769865ad.39.1729686906492;
        Wed, 23 Oct 2024 05:35:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 14/27] kmscube: Upgrade to latest revision
Date: Wed, 23 Oct 2024 05:34:22 -0700
Message-Id: <42ddd6d531dd4925a3fcd9515674e3aab3ee211c.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206225

From: Purushottam Choudhary <purushottam27.kumar@lge.com>

Upgrade to the latest kmscube revision.

Changelog:
b2f97f5 common: fix cast type in init_egl()
4961a04 gst-decoder.c: switch to decodebin3
d12ba65 kmscube: warn of missing mode argument in offscreen renders

Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 34d5a7d71d..01ea80a142 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
+SRCREV = "b2f97f53e01e07a920761e5d3e3ba22898b794a4"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
-- 
2.34.1


