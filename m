Return-Path: <joel@jms.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D448C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 11:47:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.12711.1690976838606019543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 04:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Qhi4HXPg;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: joel.stan@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bba2318546so57167795ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 04:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690976837; x=1691581637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2calBg0NTA+7UkD4BSwR3vF/QS+kbfG+SJJJu3V2raA=;
        b=Qhi4HXPgXxiPkrlU6DBf9liyOoDUldYWASh9HX9DXub0ghQYglx+iETbrLbIm1lAKS
         AWpXpYlZiVwLynk5iCpkHsxiW0uv52RxOk/1FXq1aHfG4fm/eURAr/IRwlsLnW78H/U4
         TCda/hS65ZCIK5a4Qr0/groO+JX+BBokoSau9SrqxIjkBMYhP9IVcKXSU+j6NlHlSUW8
         hk2YHJPh+GAXLK3S94+shy4PR9VLt6nfn49vE6eUh3A7ah/jCzEo3UJ9Z6b10VUNvylN
         3r3cyo3o5//TN7ecDqeXCWGYN4pLjMWFCmFWHbuqfjTAXXShDgHYjlqWL4zx6fYBKZNU
         NHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690976837; x=1691581637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2calBg0NTA+7UkD4BSwR3vF/QS+kbfG+SJJJu3V2raA=;
        b=bkZZF5ax2pMEsZ1mgaIzB0igz9z9vQmHnDH+Fin7tJbkArIm43tVBJ1qfJpd88RD4s
         RNgwPBpBRT2OSEQSYbmK+ujmUykIVltKK6uGL1J7EDWA1rU9ItFjR+TV2lI5qoRlHMk5
         6b0tHtWxiOsi9Tw0nYozbdcVeMSQ8ZTCRHPk6EuADOj+HJpRoo+fE0k3dDe4sMQeoqQ4
         rfxoq976l3ZYQ8v/L+zGyQjvZf/Vj32UQVrBFMocvE4a4AFKYzbBNhxRmGdhPaD64hSa
         EJCTxm2Bm3aeOAB7woFUENIxHfIc/e/56inTKwU6DlU3yR3lWHQPIPbOc8ijycK3p0Pi
         WIAA==
X-Gm-Message-State: ABy/qLa+IDH+f0YQNYSLgrkbBVeoSaZZ4qm/RavE0yPyWQr+5DqvW+ZZ
	snB6zy7AMNDE9eRBCWsQEL8iIRan2/o=
X-Google-Smtp-Source: APBJJlH5EubwJqdZwImX0g7aRI+VV8M2T/htoKYdo/m59U5vWyiYJDoJMp2TO7mU3UBimLLONCAF+Q==
X-Received: by 2002:a17:902:f683:b0:1bc:1b01:8961 with SMTP id l3-20020a170902f68300b001bc1b018961mr8248512plg.1.1690976837209;
        Wed, 02 Aug 2023 04:47:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902dad000b001b89c313185sm12254445plx.205.2023.08.02.04.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 04:47:16 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>,
	mdmii@outlook.com
Subject: [PATCH] kernel: Don't fail if Modules.symvers doesn't exist
Date: Wed,  2 Aug 2023 21:17:05 +0930
Message-Id: <20230802114705.90137-1-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 11:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185386

The one liner tests using `[ ] && action` need to have || true after the action,
otherwise the line returns false and the recipie fails.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 247ef4a48aa7..f1bc41e82be8 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -486,7 +486,7 @@ kernel_do_install() {
 	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
+	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
@@ -555,7 +555,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	[ -e Module.symvers ] && cp Module.symvers $kerneldir/ || true
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.40.1


