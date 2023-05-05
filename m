Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3EBC7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.30365.1683300075872242449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Uw7CJ63j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6436e004954so2089479b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300075; x=1685892075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaY+MTjWoBTHwRALJ962id34TeW1766tI204yUuVMhc=;
        b=Uw7CJ63jcJZPhlwOAj5Ed6UnWvdkXoXQ5kj1FcDjOObEJW8w0KfxQ5F8/CfStoECrw
         CAXeL2JDg4jg0Kbhg6yKuxv+4S3GCdS6hKSAeZRI4RhqjTdvu2jUYWoH6Zg25q8jiFrQ
         VN/SYW7yqEpbcy0DUNVA+DzOyodYLCoZ4KAJdLktMwakBYl6IE46v1hK42+hjC60ooEL
         f3VRBzPPhSgXM7ahBtZ603LBh2ObCgTyFTEmajMfQJvftXv0qMBi07cVvntQkx+MN7nM
         nzSlaNxgPpCPFNeCjQ1vwzQHRVPy/lCQDNsTBMg2OmzHQR6hDbQsuj0Y6xYmsUqY/Sfg
         93rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300075; x=1685892075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaY+MTjWoBTHwRALJ962id34TeW1766tI204yUuVMhc=;
        b=UaKzH0NDzhYzQ4WBqMK47PhqcCNao4RmHx4w+CSAj75MQky5J38aNcaSd5l0SJ6qhz
         66IQZjaWVYZ33gikKaiwF7dmju1nAqckeiD/vScgOcFiboL6zp8cs6GG0nqmJqrjUG0z
         CU/4IxJdXo9sOQClfKKIVZiY+2lYgfWY6dmobxUjDbKRf5w7tqgyUC7rt6s4GpGVrkhm
         E6iiTJeq6EnBnAEm99fByxNvRIMaWduEg5tfe96l9kHPt1gGZ8728G6aqnembEMJQdca
         8DDwbmOWccZVfsB8FfjK6GQ/1OFnLczaGfKvSHR7KdFqjelC7jk16vZyyLZJMkugQLqQ
         Y+2Q==
X-Gm-Message-State: AC+VfDz7bhx+ksquGtDPbXYVLtNVFCGLnz28+W3jAqCAXQMZadvN3qhp
	nlNxz7ogZRBjquF9Qw3RO4Comvqy5/dqWtuA+s0=
X-Google-Smtp-Source: ACHHUZ6kUH3SsDQpITpe5bhPit2TqFaMz3Q3A+7itjU2c52Z8tbmNNBWx5HZdEWzbyZEjwLDdL3lww==
X-Received: by 2002:a05:6a00:1252:b0:63b:8df5:f8d with SMTP id u18-20020a056a00125200b0063b8df50f8dmr2698067pfi.3.1683300074751;
        Fri, 05 May 2023 08:21:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:21:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 34/35] kernel: improve initramfs bundle processing time
Date: Fri,  5 May 2023 05:19:45 -1000
Message-Id: <126cbad716377f024dae5cc8e2faee9bd661f5c5.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180954

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is a partial fix for bugzilla 15059 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=15059]

It has been noted by several people that when an initramfs is bundled:

  - a lot of the kernel is rebuilt
  - it takes a really long time

When looking at the logs, the second kernel compilation (that performs
the bundle) is not using the parallel make settings, and builds with
-j1.

We are already explicitly passing PARALLEL_MAKE when building kernel
modules, and by extending that explicit use to the main kernel
compilation, we ensure that we always get a parallel build.

Build times chnaged from more than 30 minutes for the bundle, to
3 minutes in local testing.

The question of whether or not too much is rebuilding during the
bundle step is still an open question, but with this tweak, at least
the build time is back in the realm of acceptable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 88fd394ecf0f2174b792075d409d87046896426b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index aefa0d21bc..e634eabd49 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -382,7 +382,7 @@ kernel_do_compile() {
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
 }
 
-- 
2.34.1


