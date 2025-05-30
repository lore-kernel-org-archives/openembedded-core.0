Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FA0C5B559
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.1270.1748626765866444653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NwJn7Kf0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c035f2afso1488291b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626765; x=1749231565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErejzOqFYaeR5nRaER0TyqIDrvLrraHeAvlvN81tAOI=;
        b=NwJn7Kf0qHPS0wvXkQFQZQnScabGr76c2uwU7dnvtNrtUU0gHmHUaguMOZbq/+t+T7
         Yi9pbdeNsLGeS33nQnzERp9dTCBNhDf0LxPE02piPdsfzmPyPdD+46ZG/jQlEBlET8Jl
         l12JH/V6b5bjoK4/LD7JQrYV6VPEgzj0JjNOSTCe1VyPgNVwh/ztb6ftrfCWMekYr9Yf
         jHoNoJkWiwriQ7Uhf4k718Tys7nHZoA8+CdMTxoRnsoCZkq0zn0XCLoQsaEhU+HHGeKM
         z/GciYL+A4JKVzUZhp+nZXO4EPpuYsstJNpHLp/5XQSCDzF7AxRna4z6BaRCRxNUsuTo
         li1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626765; x=1749231565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErejzOqFYaeR5nRaER0TyqIDrvLrraHeAvlvN81tAOI=;
        b=Ag59Lq4Yr0FGs2JfIIUZPqp1cohul0+/EjCiUICYgqfj7+0aDjQLShRZguRDj8K2HY
         r68N9w6JU6ZhUk8OzkURmA8gbD4TExKyCGOrdaC/hYJh1QkrZYfP1zgZAcgU1mS0Q3v3
         iq9fbuNZDfBT0hXEsHg7CWTtceu9dUIcMeBKvKdBv7wE72daC06u7177Csqe108O3yff
         OQF+IKF9QFBJ7Tl577w0zplC+/xxcBWwwymLgQTtCmzNftWWTGciwoHbBCJ3jhQw8rHA
         cUGdiWIwJtXGujxbdUTKwPtcwsdPp7Zt+rpzuv91O8q/iLV8+CyQzqmyfhhsgmv1ovxH
         fk/Q==
X-Gm-Message-State: AOJu0YyU72yyK1caLZBZFrTMMo0HyCpijaTqQwdKyivu6ltLSwO4RgFC
	9at52Oe0EYW9uOhRWhPR7uo1mAYg9KMwe6deYCscglfCKZMolE5CJMEreJw7IQ5X5WXLDc5uI3r
	0m0K7
X-Gm-Gg: ASbGnctPzTZyp7lckmJBXZGhAsedSK/lrEQcoCHUK4t+1zmP8Pi/Tuf2GcVQKjfEi7t
	kaNLe/74KpRm3gAbFBdAfQDUA1zr4kMt3fI1EsR4rkKRQujhhqN4eHbuny/bACt+WKV/GTaSE0s
	IHLHQffDxE9MsHkiQxSbgx4I2VtlogGATtuh0bl4WlnaQl5gdEdswS5aFRmmgw5yghdh1SmfUcc
	KLduG57MYy7SHwBKLOFfVy5AEDN2i12u7XytfMmbuMq/3mRZ/3MlZJXqVzuxsb82UFrTQ6A5BiX
	/BCNAU/qp8V6oNciGK7joJaw5IiZnLitCMbqCbOW6OM=
X-Google-Smtp-Source: AGHT+IG7N1WzmnyT3TXyY8WCgfaNMpT1v/YIntR4nN4FnVUeYnX9npOr7o1dFxCOLS0WZKLg+yV1fg==
X-Received: by 2002:a05:6a20:93a1:b0:1ee:e46d:58a2 with SMTP id adf61e73a8af0-21ad9527794mr7198735637.3.1748626765084;
        Fri, 30 May 2025 10:39:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/12] nfs-utils: don't use signals to shut down nfs server.
Date: Fri, 30 May 2025 10:38:58 -0700
Message-ID: <b530827b938bcae33da08b65bab96d2549056f2e.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217534

From: NeilBrown <neilb@suse.de>

Since Linux v2.4 it has been possible to stop all NFS server by running

   rpc.nfsd 0

i.e.  by requesting that zero threads be running.  This is preferred as
it doesn't risk killing some other process which happens to be called
"nfsd".

Since Linux v6.6 - and other stable kernels to which

  Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
  signalled.")

has been backported - sending a signal no longer works to stop nfs server
threads.

This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
server threads.

Signed-off-by: NeilBrown <neil@brown.name>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b09ad289a36)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index cb6c1b4d08..99ec280b35 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -89,34 +89,14 @@ start_nfsd(){
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
-delay_nfsd(){
-	for delay in 0 1 2 3 4 5 6 7 8 9 
-	do
-		if pidof nfsd >/dev/null
-		then
-			echo -n .
-			sleep 1
-		else
-			return 0
-		fi
-	done
-	return 1
-}
 stop_nfsd(){
-	# WARNING: this kills any process with the executable
-	# name 'nfsd'.
 	echo -n 'stopping nfsd: '
-	start-stop-daemon --stop --quiet --signal 1 --name nfsd
-	if delay_nfsd || {
-		echo failed
-		echo ' using signal 9: '
-		start-stop-daemon --stop --quiet --signal 9 --name nfsd
-		delay_nfsd
-	}
+	$NFS_NFSD 0
+	if pidof nfsd
 	then
-		echo done
-	else
 		echo failed
+	else
+		echo done
 	fi
 }
 
-- 
2.43.0


