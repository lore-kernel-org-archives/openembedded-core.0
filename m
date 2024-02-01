Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439DBC4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:26:12 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.16705.1706797570710222782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 06:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXvJD5Rd;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55f15762840so1144462a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 06:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797569; x=1707402369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqDaEomArWdNFyNfcnrHseUlqKFcRlml63BqLWPaODc=;
        b=NXvJD5Rd8dfhQaSVR3WebpElgA9fYOXXIz7DpdU7M4OjFv1S2OfRSD603raDkvskVU
         KLp7SIbDSFj8oQs2AXGvWvfvAsUTxwq7Z/yn7/8TJzgYDXi2Wn8QnKEfIeOR7R97sbZ9
         JAz4oaVXUPR3rzutEI7aYYvnr0FIXEP2S5Csk6ckfBU+a0aE/CC0dQqrQOTM9MBpCFhm
         1ZK3Qutb1iY0ZMI3UHvIVvMsxkJXp9obDQ04pydGfh4O81nfUqxvkg91AByPymnGYCQY
         /6kgn4wRZlYr4qog/02QRZW+M3U+5eyaHzgEJ3CXobTT9PeIeEOLlfhvOK3rzN/0MDNA
         8wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797569; x=1707402369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqDaEomArWdNFyNfcnrHseUlqKFcRlml63BqLWPaODc=;
        b=uziFCrGg+dZx7SB9SNdWwoSxQDyr5N0+Xgs8CGcINRaRX85DUCuOI+io2f60/lDZt6
         fgv6/94zISN8DeDD22OE0xOlwponH+9D/+6k8dE8larRMIUCYhaBDs9oG/ZzpUYPLFSR
         te+Ova3+ReKTApkeEDP4A53exzCkWbyKPe0AMvK2kps4+W2x1nY44YytsoFINUU85NFM
         1Dd99tMcDuyVh7jWcgYIQZWP577ZJM028mhFe/3+KDhfaNmTrsQhUsTZ3L83i/KS7QuA
         RceOTOvUol5FJR6QGrp+tHgntg8BOcE6VePPupSF+KgTGiFKVFcP6lOTS8SzHSPtCFUK
         URbg==
X-Gm-Message-State: AOJu0YyvnJ0pevb52eGy9r1IFMSvxGgyYD+nikJoyGLD1yXpNQi9Zm85
	9pGkCAOfkGeS/lEV2YwtV3v2Oz2D6egxwnF6uiu+HeCxTI2ypuBHVbsfJp8J
X-Google-Smtp-Source: AGHT+IHPTUiFGoFkI8bTdVPDaG7m8mVr6CGTQa1qOTWrnMMCepXQ+VMqTD9FLZMR1qyGLBEuIScdHQ==
X-Received: by 2002:aa7:d044:0:b0:55f:4f1a:cf72 with SMTP id n4-20020aa7d044000000b0055f4f1acf72mr3569088edo.0.1706797568780;
        Thu, 01 Feb 2024 06:26:08 -0800 (PST)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id ij5-20020a056402158500b0055eed463c4fsm4617511edb.84.2024.02.01.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:26:08 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][PATCH] kernel-devsrc: fix RDEPENDS for make
Date: Thu,  1 Feb 2024 15:25:31 +0100
Message-ID: <20240201142531.765590-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 14:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194590

Since kernel version 6.6 the debian package rules has been split up into
a separate rules file, resulting in a runtime requirement for make.
See scripts/package/debian/rules

Remove the rules file, for not RDEPENDS on make for something we are
not using for building modules.

For reproducing the issue on a normal qemux86-64 machine, change to the
linux-yocto-dev kernel, add the kernel-devsrc to the toolchain target
task and disable ptest in distro features. (Notice ptest adds make as
RDEPENDS for other packages hiding the issue)

when populating sdk you will see dnf failing.

 Problem: conflicting requests
  - nothing provides /usr/bin/make needed by kernel-devsrc-1.0-r0.qemux86_64 from oe-repo

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index ce5777fbe9..4ff751d9f0 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -148,6 +148,10 @@ do_install() {
 	# for v6.1+ (otherwise we are missing multiple default targets)
 	cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
+	# For v6.6+ the debian packing is moved out to seperate rules file
+	# Remove as we else would ned to RDEPEND on make
+	rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
+
 	# if our build dir had objtool, it will also be rebuilt on target, so
 	# we copy what is required for that build
 	if [ -f ${B}/tools/objtool/objtool ]; then
-- 
2.43.0


