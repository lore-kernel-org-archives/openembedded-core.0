Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C696C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.456.1748640155965393887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=REwFG2b0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234bfe37cccso33743185ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640155; x=1749244955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsjulOhSvTsLkZTyojqxgT+inFu6FmoAgxQHF+OiG5g=;
        b=REwFG2b00iUhf77IT8CsfYX0gW0cXQX8ChhnHh1mf/IeN9JGJrGBtMlZxhXpUtJ+Ui
         XXl2u8idVKVzd2W8DuGwx7kuGRku6/IF8Rdc90WggPYGJ39C0KaA3ukHRaU7SCc0TX8D
         6kFfp7CgULnzoC0C52E9S9jE7YvtynBF6MaBI/0pgXPGz3YJTFQKGycsPFhf+E+HbAwj
         ZzAaQ2RsCJB0I130gBDL9LndPbscc+RoODbJsdtW6z82r6++/Dlsv7PepgtRlRfANWLB
         pg1MOM+YOuZwb+j74xBEMo1tk1oDU4bSjF1/Tu2NTAxLwnZuU8axFldppSDhibdl4fkY
         v4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640155; x=1749244955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsjulOhSvTsLkZTyojqxgT+inFu6FmoAgxQHF+OiG5g=;
        b=vopEWA3WyVifqHDK8sp/GxHtzIzqzCjhbvrmwm5Qek0wsoLmhXvkflvgxZlgzg7Vfm
         6wof81MjLcd/8pcXrfguZpOur44M68BmQHyD6S3uPOIeav/CSBErKWdeGnbhFhPDLIbt
         DQj0hHuV49KCTZStFPPTCM4iOkrc9ypQpYvcJl/PkDO9D0zJa/MoU/g4kHNk/yrO5s3i
         bs3uFfzQLRsCYMuiPngokyxBx0DVEuJID+ZYFru4Z+f4QV1Sqjwa14tju30jO11jcqyi
         A9I16/JG/AtOqlnnHm+ABKN80cVBbKOaO9nhm8NGsoremibRyDyo494q6mBTatvl7yks
         LfwQ==
X-Gm-Message-State: AOJu0YzDdNBC0bKneHfgLZsd//iNSh18xxa9Iun1fDWlO0GkvzWvr4N1
	svZiw6//iszTAtljerPzTliv6srd1abF0rUKDIVP3nHEGdesgex0o7f8PP6mSoEdnp3K8mTE35u
	srwIb
X-Gm-Gg: ASbGncvvONJNiUm9lrzXKB8k3RxSt/J/j1OI7HY/FIGTvRfuG6NHQbxfRmOzhdp7Lnp
	1XrE2JsDzDJuLr8cM097EO79+Io4nalLA/xqBeitNevvrs8m5ZI6YFebCnhkWEjRFCBRWUwyPoJ
	6QIkliJCcKWKhxOLVSSE+6ig1l49iBwGlFn+6HCPunUu8hbhTdivFxe0g+CKSq6aAx06VWkfCK0
	o3jd/xSlgoMu5cJcWIAWWUDOR4UqLIKyLQ6vXYLHhDWAAu/Uyp9GuLlCsJc2Ec1jrsGzuu0tBD7
	cRf6xqU8oVRIyv4slelqCFICpj9l5ZsoVj+/mdSiGEE=
X-Google-Smtp-Source: AGHT+IG0OCfzyzhoWdUzUBaE24JwgCgvosqh5ScFN3HUq7a62gCiAnx2V9GciEmCQnB2wdE1GSw74g==
X-Received: by 2002:a17:902:da8d:b0:234:8f5d:e3c0 with SMTP id d9443c01a7336-23538ed96dfmr41748155ad.6.1748640155228;
        Fri, 30 May 2025 14:22:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/14] nfs-utils: don't use signals to shut down nfs server.
Date: Fri, 30 May 2025 14:22:03 -0700
Message-ID: <ed325c9554d17f3400033eb3513aee034bb42d06.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217551

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
index 0f5747cc6d..4d78312929 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -66,34 +66,14 @@ start_nfsd(){
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


