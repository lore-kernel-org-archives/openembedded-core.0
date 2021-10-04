Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190D5C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:34 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.10166.1633357293156234038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ti47iBpw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 75so16694034pga.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jer5mKP/4F/Pgnptsi0eItkm1Mv258RyG8JlRYb/97Y=;
        b=ti47iBpwuQqag44DM+gZ5ugIHT+pEcVEVOMhLtihuOF28m2sJCndG86RAhgEuMpWYc
         wSXYoyMd4ZriW78bZgFfo7qJE7Mvjx6ioPKkZryValOrl3i5KC6CQa9dN7BoeiAC8DyC
         9bNoVeaKScSanYY8EFHDay5GxzMrNQpTyGVN0DPkag4kflBpBZC3aygVcsam7Ckkb6UN
         t+9ouqCx2bZq9FU/oKv+jQoOugVYYmHPcVc4WsyG4zaW5qf8hEFjbT6xjgmBn/H+LfOT
         mGtbK4agp78B6xxSLUyLWhyx0gX6bjHYWtg1diJwc/8FEOO9rVB9gBQIFEXGPWaMTqR1
         0sVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jer5mKP/4F/Pgnptsi0eItkm1Mv258RyG8JlRYb/97Y=;
        b=qZsHyxFrZRKs+YNE+XF7GO5rD+Njl0f5ETgR1+HabYu5niOvt6vDZxxg8VQvXIjJSd
         XebHTIFC5GTyBw2/mJUYTyIKqG5p3krDorVgA3ffT4i3nZvv+41hzBiwRwocxHMK/hRJ
         Uneo66jc4R0o2+HC4TS25HX6Tl10bGLegTtkA5sOiAuj8X4Ugm/aE1fl3oa9d1iV0CDl
         0qTS0Sx4qgOXrIcfuPPObQrw7f8CmUC8+miwXNCZI/jp7Pm/I73eJWtTH35Kz39r7ScM
         oiP6NiM1r4JTRwozDxoRPKc4H1IpBaeEoTXEsNQ7yB4CXPiz6SoFH2ajxal6rPmFvL2a
         9ZCg==
X-Gm-Message-State: AOAM531eZfuWztcmi14B1HLtvkWjECE9mu9I9uPeIzrbNL3CERwJETNg
	It4vCHjMZsPhsmSnYUB/ViDhOvouSY5OQwq4cHI=
X-Google-Smtp-Source: 
 ABdhPJwsxI5N34IWGghdIm9XYE6eDWK0k+cg/GIaPypjAAQJcGHqBIWy17jss89mrwO4vD17Prt03Q==
X-Received: by 2002:a63:7045:: with SMTP id a5mr10949467pgn.404.1633357292262;
        Mon, 04 Oct 2021 07:21:32 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/15] glew: Stop polluting /tmp during builds
Date: Mon,  4 Oct 2021 04:18:43 -1000
Message-Id: 
 <d12c44df66ca065a1526c7d6885e726cf50aab46.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156608

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently the glew code creates a new directory in /tmp for each make
invocation. This is a bit ugly, don't do that. The patch does break the
dist targets but we don't use them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a55194f90e11da5671b24391a4aaf2b86a8e1e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glew/glew/notempdir.patch                 | 19 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/glew/notempdir.patch

diff --git a/meta/recipes-graphics/glew/glew/notempdir.patch b/meta/recipes-graphics/glew/glew/notempdir.patch
new file mode 100644
index 0000000000..8d79ce0cdf
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/notempdir.patch
@@ -0,0 +1,19 @@
+We don't use the dist-* targets and hence DIST_DIR isn't used. The current code
+creates a new temp directory in /tmp/ for every invocation of make. Lets
+not do that.
+
+Upstream-Status: Pending [a revised version would be needed for upstream]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: glew-2.2.0/Makefile
+===================================================================
+--- glew-2.2.0.orig/Makefile
++++ glew-2.2.0/Makefile
+@@ -56,7 +56,6 @@ DIST_SRC_ZIP ?= $(shell pwd)/$(DIST_NAME
+ DIST_SRC_TGZ ?= $(shell pwd)/$(DIST_NAME).tgz
+ DIST_WIN32   ?= $(shell pwd)/$(DIST_NAME)-win32.zip
+ 
+-DIST_DIR := $(shell mktemp -d /tmp/glew.XXXXXX)/$(DIST_NAME)
+ 
+ # To disable stripping of linked binaries either:
+ #   - use STRIP= on gmake command-line
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
index 92b6083648..d7a26a3438 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://0001-Fix-build-race-in-Makefile.patch \
+           file://notempdir.patch \
            file://no-strip.patch"
 
 SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
-- 
2.25.1


