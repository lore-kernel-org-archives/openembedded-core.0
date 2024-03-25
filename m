Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D9C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:55:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.56085.1711382142798070242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgQqgH/3;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e7425a6714so2823630b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382142; x=1711986942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LGgkigzHagK7OR+FEVi03+XlCKZypNuYv07bOA1xSA=;
        b=bgQqgH/3qKaww3VWPomhiqISaTAbaRdn/fdjm7tNantPvDPSI8xu6y7Q+C8xKWwWHd
         YryyasfrU19THlyLAlgpZAQj3aKEef5pxppt1Byiao5H8Ec9NHI+/9AnhWEfxTMS26Mu
         tPbIuZWRFYcyasVEdUSP2MpNSZpQs7lv68FybcH+Uu//swuM58bbXhvC7xuldKWYAtEg
         IosCNyyH5mB70dnLx2allmirg/S9Izxp5E0Htkz1I0VRyli4PA0IPEvm2BbVydcVANlp
         7SA247LTX5JAlpTRHXyKAh1rIA2xr3zvOeEkVfJ5OmIZA0IJ2+zP4mvq9w5uFCzfCyPz
         W1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382142; x=1711986942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LGgkigzHagK7OR+FEVi03+XlCKZypNuYv07bOA1xSA=;
        b=STgxN98yJdH96rkcYVFk8pwkKbcfC8STUKnvF1+FmLyFXgXVr5GSkVXOTfPRlYR1Eu
         7uMtkZN9WjHqakWNZajqEPQxudV8qbn+ODwDKGK+KHkMh83m0go/K8QRmARHbjfS1Phr
         pxoPkkT2LKPqTsjcff9LHHF4oH/4R4OERYOGmZGabdXrm47bqkwNveAd5LNIRfhFXF2u
         VIHu19aD9cIrJ2tx3uP1wEd1iVA/yXtfNbV9WR1qlp+OTgtTrlUGO75yA16a1qT8TVgc
         31ExNNSGXR21GeXmtGYfFE3H+UNUFLbcixErN9xC99pp2R8su31TSn6QGhQL/ePqIGvL
         AaOQ==
X-Gm-Message-State: AOJu0YyhjDXdSpa9oDxLiySNZQ+F++3xCdxSy6jmwm/JfTr+Ij2B1ajU
	cpAlI4CRTRcDpAFaCscoIGhVsk+mZrxrKsAuja5WMeWANzApAgHMN6lwNRrm
X-Google-Smtp-Source: AGHT+IE6zfORLd9xqLLPoMaqC3+SDAHELcqBSlypgrcOsSX0balc0ADZNMWwKoPdUsUcMbXVa66NOg==
X-Received: by 2002:a05:6a00:198e:b0:6ea:b69a:7c71 with SMTP id d14-20020a056a00198e00b006eab69a7c71mr593851pfl.19.1711382141829;
        Mon, 25 Mar 2024 08:55:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id h8-20020aa79f48000000b006e6c04efd9dsm4220079pfr.206.2024.03.25.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 08:55:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mdadm: Fix build with new musl
Date: Mon, 25 Mar 2024 08:55:39 -0700
Message-ID: <20240325155539.3182799-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 15:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197488

new musl has removed basename prototype from string.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-include-libgen.h-for-basename-API.patch | 56 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.3.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch b/meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch
new file mode 100644
index 00000000000..70be43c15ec
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch
@@ -0,0 +1,56 @@
+From 7759ceda978aba38861d4846d0c1657465b72f04 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Mar 2024 23:13:32 -0700
+Subject: [PATCH] include libgen.h for basename API
+
+Musl does no more provide it via string.h therefore builds with newer
+compilers e.g. clang-18 fails due to missing prototype for basename
+therefore add libgen.h to included headers list
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20240325061537.275811-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Monitor.c        | 1 +
+ platform-intel.c | 1 +
+ super-intel.c    | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/Monitor.c b/Monitor.c
+index 824a69f..e3942e1 100644
+--- a/Monitor.c
++++ b/Monitor.c
+@@ -26,6 +26,7 @@
+ #include	"udev.h"
+ #include	"md_p.h"
+ #include	"md_u.h"
++#include  <libgen.h>
+ #include	<sys/wait.h>
+ #include	<limits.h>
+ #include	<syslog.h>
+diff --git a/platform-intel.c b/platform-intel.c
+index ac282bc..5d6687d 100644
+--- a/platform-intel.c
++++ b/platform-intel.c
+@@ -19,6 +19,7 @@
+ #include "mdadm.h"
+ #include "platform-intel.h"
+ #include "probe_roms.h"
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/super-intel.c b/super-intel.c
+index dbea235..881dbda 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -23,6 +23,7 @@
+ #include "dlink.h"
+ #include "sha1.h"
+ #include "platform-intel.h"
++#include <libgen.h>
+ #include <values.h>
+ #include <scsi/sg.h>
+ #include <ctype.h>
+-- 
+2.44.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.3.bb b/meta/recipes-extended/mdadm/mdadm_4.3.bb
index fc58fcb86c6..228fc6f84e5 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
            file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
            file://0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch \
+           file://0001-include-libgen.h-for-basename-API.patch \
            "
 
 SRC_URI[sha256sum] = "416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f"
-- 
2.44.0


