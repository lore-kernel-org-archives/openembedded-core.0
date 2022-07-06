Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162A5CCA487
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:52 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3671.1657094850190641085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mumkTNKG;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y8so12470519eda.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b1aImYkGmrAeDrS4eSt17Hnv2ZajkfymYOtNoPx8klo=;
        b=mumkTNKGGhl7+AL6ecuvot0m4JcrQMM+a9QLTomtpwjbQtMyo+Xr3IGEoXrZ7FJJlz
         1uRPSSvwCa1QJ3XCGhdQmht7sixhg4MAduy0NacFEAot1kemDWIx4Uwz7enTrukt28Sp
         0jBQS7lmMKownZp9MqkvE6gITtgtWX4p6Tzo0CmtRlM9iRMWty3sfwaiC00BgzgrRRvv
         0X/lw7BjFDHxvlT2boRV21pMxo1EPfEqZ795vGdI0GK1IfgFB29qndmkQR20JodHk93y
         1+7w8ujpk9XKTVpfMCF3dL5h56CDDLASHieP+oDLKXsA69QgscOmGHke7WbdQ0HueQ+g
         e1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b1aImYkGmrAeDrS4eSt17Hnv2ZajkfymYOtNoPx8klo=;
        b=RqsIfcFwJUeP3aO0kezOH6BlWgyxVfWHDxuu342/jn2IF1szGl4qGCta5wIY45cDCX
         OxjLUyg9yvOj+lPjPyLENs0JtuEe2B1uVj+1NscDBFPVYsxOsgu3ve1YAzcajl38EDOy
         OjBrvFcCSrbv+w5lTZ0tiqltuG13EnAR4+/TaY0KO/3WN4RORzaGo0SNhQYzh/LYqvHS
         LptYmctt34jfKkmDPoRX+ZO5gSfR2hysHUVlB+XH7Ey/u67EM1Jgl+tN2y5e0hpv+zgl
         vDgsXFnQlcfJsYVCqxMI3j4+u7FzFfb4uZDTOhNdps3Hp/PuaaiFsAQrO7gRflRH3pc0
         ZdSg==
X-Gm-Message-State: AJIora9254NOdSuV6tMyC+OX1gQmBbDOtW9WVFPl6Jkd6Y2q8QPtFmU/
	l7ALn4svjhQHtTXc7xRrNlt36ayWnAoj5A==
X-Google-Smtp-Source: 
 AGRyM1tXs16gA4G7HRK6fF4/1slal1aHwL3NMdyT0zl2UoGx+fjkmKChZ9FM4GYCS7Qe3iScvzTZFA==
X-Received: by 2002:a05:6402:518b:b0:435:c1ed:3121 with SMTP id
 q11-20020a056402518b00b00435c1ed3121mr51571906edd.405.1657094870862;
        Wed, 06 Jul 2022 01:07:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/27] xcb-proto: upgrade 1.15 -> 1.15.2
Date: Wed,  6 Jul 2022 10:07:19 +0200
Message-Id: <20220706080721.3072553-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167712

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-xcb-proto.pc.in-reinstate-libdir.patch | 29 +++++++++++++++++++
 ...{xcb-proto_1.15.bb => xcb-proto_1.15.2.bb} |  6 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcb-proto.pc.in-reinstate-libdir.patch
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.15.bb => xcb-proto_1.15.2.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcb-proto.pc.in-reinstate-libdir.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcb-proto.pc.in-reinstate-libdir.patch
new file mode 100644
index 0000000000..fe0a96c207
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcb-proto.pc.in-reinstate-libdir.patch
@@ -0,0 +1,29 @@
+From ed499cffabe64fc1dc5898cb69ffa7e62c19e9d8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 5 Jul 2022 21:19:20 +0200
+Subject: [PATCH] xcb-proto.pc.in: reinstate libdir
+
+Otherwise the following occurs when building libxcb:
+| checking for xcb-proto >= 1.14... no
+| configure: error: Package requirements (xcb-proto >= 1.14) were not met:
+|
+| Variable 'libdir' not defined in '/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/libxcb/1.15-r0/recipe-sysroot/usr/share/pkgconfig/xcb-proto.pc'
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/merge_requests/31]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ xcb-proto.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xcb-proto.pc.in b/xcb-proto.pc.in
+index 0822b18..c7c8b47 100644
+--- a/xcb-proto.pc.in
++++ b/xcb-proto.pc.in
+@@ -2,6 +2,7 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ datarootdir=@datarootdir@
+ datadir=@datadir@
++libdir=@libdir@
+ xcbincludedir=${pc_sysrootdir}@xcbincludedir@
+ PYTHON_PREFIX=@PYTHON_PREFIX@
+ pythondir=${pc_sysrootdir}@pythondir@
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 070fb62455..4e4472a9c1 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -11,8 +11,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f"
+SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
+           file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
+           "
+SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
 
 inherit autotools pkgconfig python3native
 
-- 
2.30.2


