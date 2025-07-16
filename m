Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519D8C83F37
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:49:06 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.22787.1752673737509570133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UogZg3LY;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e2e3108841so400545885a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752673736; x=1753278536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXjRFmXXsZ0GEwxlttVhifi4yrWkEV8G/BI4lCM79YE=;
        b=UogZg3LYbWwj8fKgD7pxXWGuCW9z1MR3DE+CywACMVcMMzTWKOyOHpXzc12NrwJxPp
         mIoygRjqchnJSFsNgzgXNWIm7OzhedE70KafGLwub/03Xu0Ac+LZ5B8J0dzAC/5JHSCz
         nDxybsbd5BIuszwmxxMpqPcKzEu1p9ugnrDWkBhSf9KlcMkcaTwOQaN5Xl0dJweMbJaS
         rv6o/nEOhuI81FBUEdh5cF85xw9zxMy6KvEbW8VRoqL6pIfc8PbJhl531CL2WQgIAAis
         P08/pYyxARillC5XwtrxF6YwvtuOeshfx5x7ZVDssfv9+1DP9vXl57ATFjpvRVoN+QjJ
         DBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752673736; x=1753278536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXjRFmXXsZ0GEwxlttVhifi4yrWkEV8G/BI4lCM79YE=;
        b=s6j6Hl1qfZ8Ou074cE6K5+CM0oJCf+QDkkPU6LViuVNgXy8SiINUeL9kZKjYOT8c05
         VXRmmjCdZKUhoW77UTfbIqxx/i5tQYhSKFworu4xFOAOIH3jfzBSxdRXulwevpEqa1qw
         QiNLphlm7gqMfOKn/7uF1LgQyHsBW090Je/7zH9AFDNKw/ITYHFBuUMnemiQ99VGdnr5
         HpbfA+T0oTS9Y2p6ThSWiSEtMKvd8NNfIhOCq1V45V7b1oj34i55WC22N+GIjbfO5jnG
         oAFgMo+YNTZleIOI/RxnePQYxzYzdstacEeZcwGuo1JOCq5G35eKeZpfunBtqe2mIGsQ
         HZ8g==
X-Gm-Message-State: AOJu0YwKDqiTzcqdksXfe4Si5ZoPDpPqWgIlzMZPKENarVzAfAD7cKLv
	GrlQ877YkktBUqVmu7nXOkxkhPiGwMrsI57/D12vuu/4S+UPb3GsZjjdqxuabd+n
X-Gm-Gg: ASbGncu6gQ6dy6uxFZNXySiG0V17Tg+Zz6dlBD9BTQGbIBDHr3hSejgAAbkPe2WJ2c2
	gLkZDplW/mVW7876m1Sw3v346ya4QRya+HX4n95LfrxLAzGwGsfv8+W55dh2Gmzw1Ck+mvasUvf
	dz7vImYAoZ8Q8nWrZDa/HXU9pPfRyg4W+/2e4QEPhPheCkXgOSfoXT+1/1daprXuYZ+TAEkPCL/
	6/Nc5TTTFzG713GIGOxPJBhyoKFqTPdUkWrHznSqxakOxJM2PMBd1XFRy77ZurEsCq4kaOpR3cP
	iETHWy02OHMMs+dedgNAjY6JxxNsKNsOhGU4Fiu/YjVz4AVhN2nFaUy3a3kf5tU+LNAceQH809h
	7DDFvJbQ/WnuGw4r3yHby6fpj74YzaJgx0GvkIm/Lj71SLPG4XIBqu5NPW97zFse3C7PMU7vt9U
	ZMREEj/lIQZlv59klpfMqhgaw=
X-Google-Smtp-Source: AGHT+IHJdv/NIxIOMN1HtnlRCRjlC9Xqi5zNIgruijL50h4rHJ0sU42l9ZaDFRBtfRbCwdD3K1Cy3w==
X-Received: by 2002:a05:620a:438a:b0:7e3:2c8e:a22d with SMTP id af79cd13be357-7e343563fe8mr400413985a.13.1752673736262;
        Wed, 16 Jul 2025 06:48:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3443d830bsm84245085a.25.2025.07.16.06.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:48:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto-dev: bump to v6.16
Date: Wed, 16 Jul 2025 09:48:50 -0400
Message-Id: <c99a13a49af7359dbee8d05764bba4df96047357.1752673419.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1752673419.git.bruce.ashfield@gmail.com>
References: <cover.1752673419.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220456

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 4b1f93a692..a4aa6df256 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.15/standard/base"
+KBRANCH = "v6.16/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.15"
+LINUX_VERSION ?= "6.16"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


