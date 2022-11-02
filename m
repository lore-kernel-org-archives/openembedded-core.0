Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D2EC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 13:27:25 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.6228.1667395635371410574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 06:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GkxIPkzq;
 spf=pass (domain: mvista.com, ip: 209.85.215.169, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id q71so16232396pgq.8
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhxTytnJmMa4LyKildQMsqyKDhFupJ15EZqOthn2wU8=;
        b=GkxIPkzqfdCLhriqrn6XFIj9KKPtCpEZt313Hu3nFbpKwqQSyM8qheTeOXZhObuqd6
         lBp4VxBN1NNvtnuLgT1wJCPYamtq4r2xLLOiS3DVLCR7TICIGvjAsoOL1GV6ZKO6XpRi
         u5pyt8lWSTgmGB2RhjtqkVP/oHd9FJ36Eottg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhxTytnJmMa4LyKildQMsqyKDhFupJ15EZqOthn2wU8=;
        b=IeTvudhT6jXzMoad2oCL7G7B4hzcpWLGdz62HF+5NOx3Rv+fKfzv4wepO8e3m1v2Aa
         3cvv1zzpYmUkzU+i4zdAHdGmTE4E4b0DoO8rDqDkwbwhUiPhNzKgAwTh/vi7m5WfZXXq
         uarZpW0XvaN8kcHVEdXTQenNll5+tqOBoZNgKA0V1qQjDOxf1ZHEgUBPPi9UrLNlRCb1
         1051dkni4fd6QWl9bwfDVcCyQ7LYUpmUvMSq0kf/kzjDGq7d+ddXh/ZgLQBLU1dswdyK
         MLDPVu3iF9ZWtdOeDkieYJp/i6sPKPDBRtqA05cb1A5oIQRDmHbNNA5yt/CEJUTFHtKv
         SJDA==
X-Gm-Message-State: ACrzQf3ZpbiUkvuENnJa4RTcJLNufPm0+Cw2YwYIiDzKrnaOHmy80tKu
	O3xLHsepSL9lr6lhMU2q76BDvPVE9X50xA==
X-Google-Smtp-Source: AMsMyM6CbiEsYRrVbZN56NiajVCOcJt5kOQgJe/unTGU6xVSDwgS8wKIUL0qxnBgJlwPkunu8v4bQw==
X-Received: by 2002:a63:ce0f:0:b0:46f:868f:291 with SMTP id y15-20020a63ce0f000000b0046f868f0291mr19572855pgf.23.1667395634539;
        Wed, 02 Nov 2022 06:27:14 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.119])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902a3cc00b0017f7c4e2604sm8224634plb.296.2022.11.02.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:27:14 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 02 Nov 2022 18:57:08 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] libX11: CVE-2022-3554 Fix memory leak
Date: Wed,  2 Nov 2022 18:57:06 +0530
Message-Id: <20221102132706.302463-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 13:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172588

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1d11822601fd24a396b354fa616b04ed3df8b4ef

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../xorg-lib/libx11/CVE-2022-3554.patch       | 58 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
new file mode 100644
index 0000000000..fb61195225
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
@@ -0,0 +1,58 @@
+From 8b51d1375a4dd6a7cf3a919da83d8e87e57e7333 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 2 Nov 2022 17:04:15 +0530
+Subject: [PATCH] CVE-2022-3554
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1d11822601fd24a396b354fa616b04ed3df8b4ef]
+CVE: CVE-2022-3554
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+fix a memory leak in XRegisterIMInstantiateCallback
+
+Analysis:
+
+    _XimRegisterIMInstantiateCallback() opens an XIM and closes it using
+    the internal function pointers, but the internal close function does
+    not free the pointer to the XIM (this would be done in XCloseIM()).
+
+Report/patch:
+
+    Date: Mon, 03 Oct 2022 18:47:32 +0800
+    From: Po Lu <luangruo@yahoo.com>
+    To: xorg-devel@lists.x.org
+    Subject: Re: Yet another leak in Xlib
+
+    For reference, here's how I'm calling XRegisterIMInstantiateCallback:
+
+    XSetLocaleModifiers ("");
+    XRegisterIMInstantiateCallback (compositor.display,
+                                    XrmGetDatabase (compositor.display),
+                                    (char *) compositor.resource_name,
+                                    (char *) compositor.app_name,
+                                    IMInstantiateCallback, NULL);
+    and XMODIFIERS is:
+
+        @im=ibus
+
+Signed-off-by: Thomas E. Dickey's avatarThomas E. Dickey <dickey@invisible-island.net>
+---
+ modules/im/ximcp/imInsClbk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClbk.c
+index 961aaba..0a8a874 100644
+--- a/modules/im/ximcp/imInsClbk.c
++++ b/modules/im/ximcp/imInsClbk.c
+@@ -204,6 +204,9 @@ _XimRegisterIMInstantiateCallback(
+     if( xim ) {
+ 	lock = True;
+ 	xim->methods->close( (XIM)xim );
++	/* XIMs must be freed manually after being opened; close just
++	   does the protocol to deinitialize the IM.  */
++	XFree( xim );
+ 	lock = False;
+ 	icb->call = True;
+ 	callback( display, client_data, NULL );
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index ff2a6f7265..72ab1d4150 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://CVE-2020-14344.patch \
             file://CVE-2020-14363.patch \
             file://CVE-2021-31535.patch \
+            file://CVE-2022-3554.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1


