Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE41C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.33237.1635699488098663953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hDNeXv3q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y1so10069140plk.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OUQrc2pmcfXKCim7WnaN0u1iMPBPrG6o+SCAbLmEw2w=;
        b=hDNeXv3qoHRrmVYeHmFkZYEHktbIAQ1G6oUYWqk8zuTvRR1klrbYw4pgbEwrv2weDQ
         bu6ldj5Y7KF0ESNWEF2Ev3a8lCcIi9ZAYG1COuAz2W9ucQXg9IK9f69gGWnSlrPYyLxU
         tDB4PnesE4tVI9NAY7nVnQPhvn8h/pNhF6EGOlAFcirBYrXnaeeItV6nA65fdJCM03i8
         Yujj441cSGm3ugImDeWusr0h0P78cFEqj4N5x5t+BDXMAeNAelu6H9tDWScjEZuRz8RS
         jOjfzdIF/QyKYeIEEmJrPhluYZDeYK2K6vJRcXpRVr87gWRwwSdQEfWvbAtu5DG7Pgad
         g81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUQrc2pmcfXKCim7WnaN0u1iMPBPrG6o+SCAbLmEw2w=;
        b=Yd/B1W0sgAozJDyPG5F8GoNxNKDXDE5mevhWJTptYHpyQT6nrmt06SBIlgJfirq/Q2
         PH4nDK4qvzSRcwUTBZYEq2b93Xe+SzYTizsBjw+c1BtB1tkuHb7Wfo1PinJHGcNok8ir
         VgvRMg2UolxhmnYdg8HlqMwUCr2uz122iAvs/QmAYsGTgY8Qw3qaA6Z6UuBlNeapqob+
         Abir6psz75U8DRXVTbE0LQVGN6c5p24nevoBcOW4tpQuwhf12lkrgjaAd99VQh9nuUAO
         vK40IdwT5ZZ2jf8PSbHfDg5fj0RtZV8ms0QljTfbTrthRdxizRhofLI43dkiaN3qiimE
         gMKg==
X-Gm-Message-State: AOAM530GSKwzR/ysTWSpC/I6Nepnfab41I37h5S0uzftpnk4HKVvfBII
	rb6LEpcyuAkGlULwdVK028Iln2ph+KsD9nC25D4=
X-Google-Smtp-Source: 
 ABdhPJzsy1Z8HitXOYyZSD7tDOae9Rodp55KGwfoVkoexxX542uJqeEffVHv4x3mSin9QR/Jhx9KYA==
X-Received: by 2002:a17:90b:4d92:: with SMTP id
 oj18mr18066811pjb.237.1635699487032;
        Sun, 31 Oct 2021 09:58:07 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/29] sstate: fix touching files inside pseudo
Date: Sun, 31 Oct 2021 06:57:22 -1000
Message-Id: 
 <590de1dd89cfd5f0ca7395880ba88b27ee35470d.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157661

From: Jose Quaresma <quaresma.jose@gmail.com>

running the 'id' command inside the sstate_create_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for touch files [ ! -w ${SSTATE_PKG} ]
will always return true and the touch can fail
when the real user don't have permission or
in readonly filesystem.

As the documentation refers, the file test operator "-w"
check if the file has write permission (for the user running the test).

We can avoid this test running the touch and mask any return errors
that we have.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6e7445c94443544e92fda97a017ce93393c5f84)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2ff0d6850c..a2496dce2b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -796,7 +796,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
-		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+		touch ${SSTATE_PKG} 2>/dev/null || true
 		return
 	fi
 
@@ -830,7 +830,7 @@ sstate_create_package () {
 	else
 		rm $TFILE
 	fi
-	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+	touch ${SSTATE_PKG} 2>/dev/null || true
 }
 
 python sstate_sign_package () {
-- 
2.25.1


