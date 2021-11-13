Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EA9C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 16:08:16 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.218.1636819695836890071
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K5gr5cX9;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 188so10664278pgb.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qPgVZXS7tO4TIgIuHfHO8n+MQFEupNEwDs4iu0WozKA=;
        b=K5gr5cX9Mugb12JW6gdhisXgchgWx3Jf7AkXOze+Vuq/KIgQNv1u3RwmxH4KaSecw2
         KFxvD6tvJKcplX72dd+VwT+i1CV9ub1Nt9qWqHn2Zi1fdlPVoTjYsvIcX7PfmpOIfZG0
         cQlU0WE48IrRm810zg9q2mso4yVEvnaPuupwe2/q5MkTmlF5ox5J08tFwXG3rWmN5X05
         SCEtzxElPm+XCm6JJIogfGWOK5DTz6BDUfH5hLBy0zZ5DVCtCbNI0GbVj9MLwM7NDUhX
         zLKDMN/e4lVEx9yHDU+gTbGoY6g/uh+BydsSJ4DFQea9GOCIbnhQzeiRNM0RBVrw/+wa
         UN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qPgVZXS7tO4TIgIuHfHO8n+MQFEupNEwDs4iu0WozKA=;
        b=PHQZQ4noJp1Bk/9+2uyQnInvNnca9IArxcjaWINThrJV+ZNTz0EUCgWKDc68+jY0Fj
         XjtzKwgWqp4n+dCrTmcp4KT95Ra6KHEtrSdz/vIoTEQlxqTagVJKjDLUejjvJud11DHW
         lSJn4VtJnz+qF1YaoMzb0Bi7U+SN+AN7rmV9JOL/yrmgPh/BLfgQrtK4Ovsh6ExPQOlx
         U/DRlZ1evURL5pE14SRkN/H+l63x1ZKOI1hA9LeaIACKVL+gz+D1eRgwUgISYsEqnaFO
         7cMGrbbhamozPxJPIOeQa5ncxWF1UhD53TbPvUWxr07MS+A3j0hNHI4dcwp6iZQUl8ye
         hlpw==
X-Gm-Message-State: AOAM531QYOm0rG84OpfgmIuvKYGW0G8uhdENxU13QqVRas8GdaeJf3e0
	2XMxGzY45ZHEaRVzRozCwaT4UR00WJE=
X-Google-Smtp-Source: 
 ABdhPJz10IzsURFoLI3tImOw4WQC7Ua2wk5NFM1ppOG5Orz/j7Mpw2VfJjc8sLATZwf4EJ3NhyTloA==
X-Received: by 2002:a63:6c44:: with SMTP id
 h65mr15518696pgc.423.1636819695043;
        Sat, 13 Nov 2021 08:08:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 z22sm9854045pfe.93.2021.11.13.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 08:08:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] gstreamer1.0-python: Do not add -Dintrospection
Date: Sat, 13 Nov 2021 08:08:12 -0800
Message-Id: <20211113160813.2011818-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 16:08:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158245

This also reverts commit f4bbbf2cd3e711875489b19f9b55b52ebd7be4bd.

meson 0.60 turns unknown options into hard errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Squash revert and fix typo

 .../gstreamer/gstreamer1.0-python_1.18.5.bb          | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index a32805d1298..045aea44099 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -21,14 +21,6 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+GIR_MESON_OPTION = ""
 
-inherit meson pkgconfig distutils3-base upstream-version-is-even features_check
-
-# Generating introspection data depends on a combination of native and target
-# introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
-
-# Even though introspection is disabled on -native, gobject-introspection package is still
-# needed for m4 macros.
-DEPENDS:append:class-native = " gobject-introspection-native"
-DEPENDS:append:class-nativesdk = " gobject-introspection-native"
+inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
-- 
2.33.1


