Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52503C61DB4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15961.1787576457405061680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hfjtee4M;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so25117015e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576456; x=1788181256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W6XMdbZph53Qh3PdLfxcIQHjGL4UJpDCYscD2eSLJak=;
        b=Hfjtee4MMAbuWF9uHET4vRJrqjsm3CL6cR88p/1iooBmHvKIYvp/X7xUY/P2fZ5qFm
         u1M0Pft5Aw0Jgnw2qThPU9236ZgEcMceUFeethh6vE35gsZss7CYY5ThpSzvVhwZPpWO
         EMO2/3fWQv3FzFoWj4GSX1fgJHAI01378sv6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576456; x=1788181256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W6XMdbZph53Qh3PdLfxcIQHjGL4UJpDCYscD2eSLJak=;
        b=Vhikj4XXN43v/v/v5NSvud79uOZk9AnuiP3aaMOe0P4jwWD4Qor0gTKgvFxCev/wGq
         DSb7Wf6k8Pjl9kPQYFu6vSRbRInJWtSNgQsiV3sahVL3lObamQoCPUTjUx/UqxCPmlZ5
         7P0zFMUoT6JZxs+iIKZAx8vhIbZfabuOSotEMFNemQMXlORDSi2o7AhiFYsXQldEEAYt
         8URdO7tsuEpbpgsFUnsV0TxDuYjk1hnwv0itUr8tcqrDdlPYtkNxsoC5i/cuIZ+4Vw4o
         JSFLkRFaZXPyIGHph9s1KF7ajstk9qnaN5mcW9KX3XhzkOmxOIHneG+OdpLa9tjPQyyA
         GpQA==
X-Gm-Message-State: AFuF++m8pSMlQ0GG8jkgF56gdGqyNvxICFSVoOQ1pSLwjwVjdWD/pUeL
	aoxLlByqmVAaxXGBcF+wHNRQ1PBiQ1O6ZzahH1rDmZolD3MYroMB7f3/3qNpx0bd1spcpYaNJwW
	l9Hz1uRc=
X-Gm-Gg: AR+sD1163o2TiHpNkxw9tkIWB4vgvDH4+y7n6abVbUiQXnMvU/FnXuDodMjz6gKNH34
	IvMxvso2LujHDREka11gV22CgJoKa6H9Ar4yaZ6WHNveyWAI5l95HwLJ9/Xb3rQ1tqc514HUHMM
	qbyjisxBcS4syGaz2pVQd9XlLTEerVhsGgrZT763XgUadAKLM4TAmKheDCzZEzxYurMa3XUXyt6
	fZsVWQ+zR83eZ6RnOzEFzPXczAocRWp7XbX1/Pkqq2irBxBsbWhBu/0pMa4VubW3tvRbC0XNKwZ
	MxPjWbud7BFhYFQE/dlpZCJ2lExC2r2+klwJmYtFLkpR62qBGX1R2NK9kECcyjddDLuDrFUzfEy
	zGVLVBxT91Chv0YRphNMv6MrXgfjE62Hna2WQzANetSbD0cFmAwMKz1dVq/Og7Y9h51FrAiX+aS
	VQdEgAhwJF56m+gi7att5ZD+qg2cT9m7fmxHSVAem9pBdccb5Xg+XdmshAsq/2A2ELhk4lMojJZ
	zjcjRowN8ECLRELGDPRak3+1C6+MC3gk6PNs6119e+i9So6eng29lhC6JWXqmeny4UTgUI=
X-Received: by 2002:a05:600d:4452:20b0:499:7219:122f with SMTP id 5b1f17b1804b1-499c19a351amr164885495e9.4.1787576455539;
        Mon, 24 Aug 2026 06:00:55 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/19] mirrors: Disable YP mirrors on autobuilder
Date: Mon, 24 Aug 2026 15:00:01 +0200
Message-ID: <f7397af248e1e338929d70a910b0fbc2341528ec.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244112

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The YP mirrors (and hence some bits of kernel.org) are initially populated by the
autobuilder, so having it reference itself creates a log of stress and delay when
things go wrong (such as a missing kernel revision).

Trying to remove those but not the others is hard to maintain, so add a
variable specifically to allow it. Use that variable from the autobuilder
configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a7e73e90a66611ce358601b041d5cd81ad61ed2)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/classes-global/mirrors.bbclass           | 19 ++++++++++++-------
 .../yocto-autobuilder/autobuilder.conf        |  1 +
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 6f54b257f2c..04b7a25106e 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -5,6 +5,7 @@
 #
 
 MIRRORS += "\
+${YOCTO_MIRRORS} \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20250101T023759Z/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \
@@ -29,14 +30,18 @@ ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \
 ftp://sourceware.org/pub http://mirrors.edge.kernel.org/sourceware \
 ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
 ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \
-svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-gitsm://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \
-hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
-https?://.*/.*  http://downloads.yoctoproject.org/mirror/sources/ \
-ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
 ${CPAN_MIRROR}  https://cpan.metacpan.org/ \
+"
+
+# Having a way to disable the Yocto Project related mirrors for YP CI purposes is valuable.
+YOCTO_MIRRORS ??= "\
+svn://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
+git://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
+gitsm://.*/.*   https://downloads.yoctoproject.org/mirror/sources/ \
+hg://.*/.*      https://downloads.yoctoproject.org/mirror/sources/ \
+https?://.*/.*  https://downloads.yoctoproject.org/mirror/sources/ \
+ftp://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
+npm://.*/?.*    https://downloads.yoctoproject.org/mirror/sources/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.edge.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.edge.kernel.org/yocto-sources/ \
 "
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index a9ae99a451e..ad874384a9f 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -11,4 +11,5 @@ SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
 SDK_TOOLCHAIN_LANGS += 'go rust'
 PTEST_EXPECT_FAILURE = '1'
+YOCTO_MIRRORS = ""
 

