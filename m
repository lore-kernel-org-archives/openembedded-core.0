Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B917C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 10:01:04 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.29301.1632736863354931720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E1O//Wk8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t8so50913999wri.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2n7TIDoyGNFbTeeMPzUZw5pdJ3JVfp9nW1IsK91/NhM=;
        b=E1O//Wk8fFdxK1PhJaP+tMXZF2dsGeB4HNkC+fg/WBozg5VhKb1bjzMiSNS2wBxdz0
         QGalJgHQ9YdlgtqnUrHTU5KEDCUxC0C9vputyLNBLfg2vYKp9z+kcCeeVBOKl9Z8VwzN
         sJ/409A/OgBDwxuL8RLVM+O3rttCqYp2k+GDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2n7TIDoyGNFbTeeMPzUZw5pdJ3JVfp9nW1IsK91/NhM=;
        b=D1D3lMTTLUEvuy0msqzQFq3GHQNZ2b69B4x6BF5MdtYJu+78/zpDY3PSR9a7yjIRnj
         6pz+2U1O37uC59hhqEUUh1q0GRV5m2vVJn+VTMc2409kOthFCAWon/9shhd6OErcW36B
         SI1bwKKZQvU3FyPU8/PhRe0RRxqBP1fDkGqWAQirHs2247V0gWaQgNoFqPWJ8OeXYrLf
         ls2Hdg4gLTIoQ8eZdl0ZOI0ieOoC74M0UgFoFoPMVcWpj+1Pyx5k/L3zlC50mr43n9FW
         QNSrhweCbMx130qIhUK9K5z1Rgo1mG6AKv7KkGwQdZBwiTM54mrHQ/jv4VJiziJY6D10
         Br7g==
X-Gm-Message-State: AOAM530q9fZbkGKLZwHd/iMdbnR7h/X+KFSw41VdNoLnFnvrVZSdgy7N
	INoerVn64oxjO0uYtsuxxgd8ZIg09SS6JYEr
X-Google-Smtp-Source: 
 ABdhPJzd1UjKavcS6jny3sAWxAuxi3jcNjYFTsJZXGnZ26pahSRS0ymz+6+kV2jbb5rGqwxeY/nXLw==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr26553832wrn.238.1632736861348;
        Mon, 27 Sep 2021 03:01:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8a1f:b4a1:54ce:d4b1])
        by smtp.gmail.com with ESMTPSA id
 k10sm4414256wmr.32.2021.09.27.03.01.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 03:01:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glew: Stop polluting /tmp during builds
Date: Mon, 27 Sep 2021 11:01:00 +0100
Message-Id: <20210927100100.2036338-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 10:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156379

Currently the glew code creates a new directory in /tmp for each make
invocation. This is a bit ugly, don't do that. The patch does break the
dist targets but we don't use them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glew/glew/notempdir.patch                 | 19 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |  2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/glew/notempdir.patch

diff --git a/meta/recipes-graphics/glew/glew/notempdir.patch b/meta/recipes-graphics/glew/glew/notempdir.patch
new file mode 100644
index 00000000000..8d79ce0cdf9
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
index 92b60836487..5592dd16abe 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://0001-Fix-build-race-in-Makefile.patch \
+           file://notempdir.patch \
            file://no-strip.patch"
 
 SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
@@ -29,6 +30,7 @@ CFLAGS += "-D_GNU_SOURCE"
 # Override SYSTEM (via PACKAGECONFIG_CONFARGS) to avoid calling config.guess,
 # we're cross-compiling. Pass our CFLAGS via POPT as that's the optimisation
 # variable and safely overwritten.
+# Set DIST_DIR to stop useless empty dirs in /tmp being created
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} \
                 CC='${CC}' LD='${CC}' STRIP='' \
                 LDFLAGS.EXTRA='${LDFLAGS}' \
-- 
2.32.0


