Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7994AC7EE26
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3065.1683671586011021361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hBSwX8GM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64388cf3263so4640869b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671592; x=1686263592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewtxxnmbR+qVZVL4M8EvboFYNjbpouXBsqSl39cviDI=;
        b=hBSwX8GMQFaU8v7M7Urs1NM8OxKT3kyxe7fkdl7C3azMqAawocuYiUA9iodqPfhUSS
         TdUmKlr4edjuvP7Q5OBb9GkqboyDxJdY0F5H5KA71+8zuqBFkm2oHjBM2A8wfUoj2USv
         P38ryN2dVQ1il53Pgnx3FVd8iX1+9WztQEA+45WD0BRmajwPkULyK6gmejIfvES4bXJY
         3v95jw9RBycS4JekkTykf8kCQiJeLostcLxKEvcPifzCMetZQ6mSLeN/AIm/pB6DRSKI
         u2LVtW+qzApSDy1oq9i2Or/Lm1u3qOKKBk+loMf2VJwI5QsYcqmIegjLXTaDPk6QpYCA
         Ykrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671592; x=1686263592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewtxxnmbR+qVZVL4M8EvboFYNjbpouXBsqSl39cviDI=;
        b=MsBoYjpnGXzZZ1MRmwxRXNn5PYh7iCdec3O40ORIamS+DyFzFzUL0eGsutGqP5PLSc
         oy0o8bA0b1qZREpWbljnp7Y7+6xpmE6l9kPjUPdxPaApiF76IQ0NBfvlZVtTKQj6ojpA
         f+t63oL5/aD2WPksGuCSUosxiLIVHFaC2z1lKJfpmvBzFWDpTUnH4yNFsdoIAZ3GCyWL
         X9/pnmTuAKpb2ttCPemgGmB/47XDTs2c0W6HXaAfgNgX7uW2hGgbH9XPmfgODZhRxVM1
         iweCR+REWRCCgflYctjQ3fuleDpvllVwM0EUBCd44hGlMtwqNxed5oR55flb43RdSfMI
         DPEQ==
X-Gm-Message-State: AC+VfDx1NtiMNu+TrDSDeuBMtDIjA1c8h4FQVNgMKEaZpBW3SE/Z1CiW
	YKgiNmpswDdzcxXNJK+Z5Xi2xzeloxOUTtK3MlY=
X-Google-Smtp-Source: ACHHUZ4WXKhec/7g1i/QxZJU4x46rIywpzIWz2Ztguf0BAAV6a6QH04zPsTwWbJEpaYJMzk0PMQHEw==
X-Received: by 2002:a05:6a20:8e07:b0:101:8f00:595f with SMTP id y7-20020a056a208e0700b001018f00595fmr2737028pzj.44.1683671591722;
        Tue, 09 May 2023 15:33:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] kernel: improve initramfs bundle processing time
Date: Tue,  9 May 2023 12:32:40 -1000
Message-Id: <f75e7bbe7cd463c3e8c95b19678fcc2a925dc7b8.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181099

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
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b315737fd2..d45fa25c32 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -377,7 +377,7 @@ kernel_do_compile() {
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
 }
 
-- 
2.34.1


