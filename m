Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78012C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:28 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.6920.1645799247244459042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jvCS8q81;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 132so4791993pga.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q4HJYj5pB9kLQtJrMHOTf9cbyDICmr+tLzJLMhS6Osw=;
        b=jvCS8q81aRFs2Y/lZ+GnkeqXwe8Zn1cYLsSKg7RYEnNY8c7WqPtBLUuaNhbwn7KFew
         3Tpp9G1mwkTQyc5/q49KegiN/VThPJsQf4j3l9+3Ps4AZgBowMaUTvRFlT5uWYXgzc1i
         Q7n3EtfoQOLqEKbM2Q4JpdQLGakDP5jognyqn1ghs47cvELe1RX1g97sQc0Sw3Ur0TQc
         EOdx2mLnZLbvTnvbbSTJ+Tmg2OepCV10094iZjQXXIid8MLIXJ7Wpggi10CoK/sqeWm5
         EookJwUxTYFDCXslqoVzS3dJxFrg5TRR2olVuyMEpFOVAFajixMjvReAXxY0J1FkZc4+
         Tt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q4HJYj5pB9kLQtJrMHOTf9cbyDICmr+tLzJLMhS6Osw=;
        b=iz0ghcCbmYX9Q4AQ4u8rLAG8x+b7AilOmj6o5bFaCIh6naoh9uLydref4Q4VRD+Xo/
         HyGtdaCvvp5W4pItl2p3FZ8FUW3sq55AA/8cx5sb2ROWmvAu+niGnKgMdQ7DZkBFhxnb
         na/fVfxeJK1lyGf+SWPq0STwaa3iNmR+VJDzJmqtXYqp5BgS8EZUnDg3guyyvCIDEoEf
         emNOaOgZuZwamAyms5+BwI5ESenHDQngGYCCJ0uFHaX5/SBvc+SNJh/WhbkIhAu3TyNQ
         gBjhpXhOChffrppgJvogNN2xUNZGyrR4zWspHYFMiIg9QSRFRRAkcBjy7EqgmfAWcK8K
         myVQ==
X-Gm-Message-State: AOAM530pDTUcyGOY3hVMCqUOREXS2QWSuAwTouITXqczy8mMI98XND1t
	OnyJW2JMmGTmJ6sqJxdC0jVARnm2u7wHXKjh
X-Google-Smtp-Source: 
 ABdhPJzHuxzD4gklpQzGbSZZTK+8GdPHeHQLPvy74ZtWD3z5jr8dHNjSmASucc9hkf0yOEZ6jLDGNg==
X-Received: by 2002:a63:510c:0:b0:378:4f82:9448 with SMTP id
 f12-20020a63510c000000b003784f829448mr1006848pgb.69.1645799246192;
        Fri, 25 Feb 2022 06:27:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/50] grub: add a fix for unnecessary assignements
Date: Fri, 25 Feb 2022 04:25:57 -1000
Message-Id: 
 <bb0841ebfe1035af7eb807afd9bd59979b8a5dd1.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162363

From: Marta Rybczynska <rybczynska@gmail.com>

Add a fix for unnecessary assignements grub's io/lzopio. This patch
is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-unnecessary-self-assignment-errors.patch | 41 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch

diff --git a/meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch b/meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
new file mode 100644
index 0000000000..1190b0d090
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
@@ -0,0 +1,41 @@
+From c529ca446424f1a9c64f0007dfe31fa7645d13ac Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 21 Oct 2020 14:44:10 +0000
+Subject: [PATCH] io/lzopio: Resolve unnecessary self-assignment errors
+
+These 2 assignments are unnecessary since they are just assigning
+to themselves.
+
+Fixes: CID 73643
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=59666e520f44177c97b82a44c169b3b315d63b42]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/io/lzopio.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/grub-core/io/lzopio.c b/grub-core/io/lzopio.c
+index 3014485..a7d4425 100644
+--- a/grub-core/io/lzopio.c
++++ b/grub-core/io/lzopio.c
+@@ -125,8 +125,6 @@ read_block_header (struct grub_lzopio *lzopio)
+ 			  sizeof (lzopio->block.ucheck)) !=
+ 	  sizeof (lzopio->block.ucheck))
+ 	return -1;
+-
+-      lzopio->block.ucheck = lzopio->block.ucheck;
+     }
+ 
+   /* Read checksum of compressed data.  */
+@@ -143,8 +141,6 @@ read_block_header (struct grub_lzopio *lzopio)
+ 			      sizeof (lzopio->block.ccheck)) !=
+ 	      sizeof (lzopio->block.ccheck))
+ 	    return -1;
+-
+-	  lzopio->block.ccheck = lzopio->block.ccheck;
+ 	}
+     }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 4ddb9fc4f1..1906a28f30 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -59,6 +59,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch \
            file://0011-gnulib-regexec-Fix-possible-null-dereference.patch \
            file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
+           file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


