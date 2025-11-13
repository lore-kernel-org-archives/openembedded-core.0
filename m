Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA866CD4F52
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 08:08:06 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18877.1763021279354864790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 00:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=N98U1sGQ;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo486122b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763021278; x=1763626078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKmuAuk9eMeKSJgz3GNGz4VsTgIWP3t2V4LXhkhmH7Y=;
        b=N98U1sGQNRDSmOZ5D9iWjb6DGk9NEl1lzZcLo910UInFGuQnIlqlL07DTWb1QLIORq
         0PPk5egHC/3huxVoB1JjmY09blo8/rvvLao5SXieEbkRev5DsTLnrUE8n7Cs6IZgpErV
         1+gUx3DFPTcb1SUtfq2ccpNrJIryo1TLcpJX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763021278; x=1763626078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tKmuAuk9eMeKSJgz3GNGz4VsTgIWP3t2V4LXhkhmH7Y=;
        b=apyc5M2GYo5PROrvHZYA9NrvOcNoGyFSeObiiiLsDZ14ty7r42UkRFUQF7GC//rlp3
         cs3mVsAS00RK6StlfDrkLv8K798zO5JQkkOtf8UaGY6ngjU3OAIwf07Eu8sHaNV2L7sV
         Sbdg3Oe1b2w12yHWX2kgFDOB2bhRmka8T/iNIrlgYhFNCgIxcdiVXCPTZMSdXpNxcxS3
         HK+Mrfh5BwkwHNOUG6fqeGLn1bJLO+v09/yRYu38ksnI7/NWKHnrpXNCDKQdFy1TeLGI
         MTYQsUZfLP/TBbqz5G287129dx8Smc3fnBRWjtV9DuBIHccUffuDfFipTtRFrMk68ckr
         MzrA==
X-Gm-Message-State: AOJu0YwlDE+lVMsjsfPPQn5TsCJRarIBRC1iRSSoRbUhdW8ELHUt1MgE
	CiW0+22uP/kLL9ktp6BifrBM2WU8wXrmSIzJOzr/mhNyyTLSrOzcGivd+DjIKat/gqHgJPoGbyn
	VIO1u
X-Gm-Gg: ASbGncvyiVzFdBo/wxXG95kJl623zJTgazdDpngXxExkGZ9x82oSM58DCzlKP0DAXYe
	D0WFVMm6E7vmlQbENOCbn7BLLtIMDTc7LiIx4qSuZar1CSzYExJ1A15lqAPmO6dzoNQYW4/tcBp
	rxl8rSqG4N98O3oUCAnlFGMHe4v6m2uuiznFiXmF5afyBrNQeSn82mnOTWV8AaNFy8HctbyLgra
	hlXtcq1UxFvMfyMX+e6tfy4RUhA6lYDCfEiMbQiu0hO75KUXKgQnGCYJid+CRpS2ZxmZOm7biFV
	JQOdfyOALGSLPqWN7wZaweMBt8vdUrSDzrHueClPZx/2E+ndV23qr3wPoNmdU8JcG2wFoCUSO0P
	Rfo6jdjn6iw5jaG5djEjQIPt+DeaFUOauHED1OBmRyipv5KRN5iUgZhogLW4mdgyZ6Tj+uOH1nC
	KOHoiv0Oxw2y3q2ZiSzANDBf8=
X-Google-Smtp-Source: AGHT+IEqrTLSgrugY9AexhLypQ6tFm0ObmE4PtysExCbO2j1vjTLQsgSOSVWiAlCxmss6UBT9KHlKQ==
X-Received: by 2002:a17:902:f60a:b0:294:cc8d:c0c2 with SMTP id d9443c01a7336-2984ed78ff6mr75723475ad.27.1763021278034;
        Thu, 13 Nov 2025 00:07:58 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcc:9fc0:90f5:815:6543:22e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm15950635ad.47.2025.11.13.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:07:57 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/3] xserver-xorg: Fix for CVE-2025-62231
Date: Thu, 13 Nov 2025 13:37:40 +0530
Message-Id: <20251113080740.2285064-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251113080740.2285064-1-vanusuri@mvista.com>
References: <20251113080740.2285064-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 08:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226230

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-62231.patch         | 53 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch
new file mode 100644
index 0000000000..4bcf362531
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch
@@ -0,0 +1,53 @@
+From 3baad99f9c15028ed8c3e3d8408e5ec35db155aa Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 16:30:29 +0200
+Subject: [PATCH] xkb: Prevent overflow in XkbSetCompatMap()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The XkbCompatMap structure stores its "num_si" and "size_si" fields
+using an unsigned short.
+
+However, the function _XkbSetCompatMap() will store the sum of the
+input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
+"size_si" without first checking if the sum overflows the maximum
+unsigned short value, leading to a possible overflow.
+
+To avoid the issue, check whether the sum does not exceed the maximum
+unsigned short value, or return a "BadValue" error otherwise.
+
+CVE-2025-62231, ZDI-CAN-27560
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa]
+CVE: CVE-2025-62231
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 26d965d482..137d70da27 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,6 +2992,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped = 0;
+ 
++        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
++            return BadValue;
+         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
+             compat->num_si = compat->size_si = req->firstSI + req->nSI;
+             compat->sym_interpret = reallocarray(compat->sym_interpret,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index ed543f6270..1d486fc0bc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -47,6 +47,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-62229.patch \
            file://CVE-2025-62230-1.patch \
            file://CVE-2025-62230-2.patch \
+           file://CVE-2025-62231.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


