Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A6DC78850
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:40 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.18442.1726839574657900077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KzPvOQTZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso1488969b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839574; x=1727444374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAPqTmD61SY6qHOaDpZXSeIoQRfU6PO2miW6SG2+IDE=;
        b=KzPvOQTZ8RM/7KjAmcZPt4lb1fQPkxLcfn6Hhfj1t3+wN2ASzOFiWRWJqYWthWsvmv
         z/XulUSg8RAUvxEcg1472S2iCfsF3rOo2tnAvWBNQ68Hcyzer1wapUWu2HynDEDd90np
         f5vLzojr+lujcaByYBVroyjhv8cXW+sGPHfqejxT4FiGgj4CPaLq+rpGamoPBT13zBvg
         GQfbjg+HkPbqV5H2I9Y+3/huP4ro8Wudz8b1XZQTj6GI9mRPbzYbAHkPFtbtKyz0MweX
         cygsfTlNCIlJsBhsjubYjOPs6mm14gxDAWLF6+gVRJJl5JPrSv/c6cD6IlOsai76op7f
         +nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839574; x=1727444374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAPqTmD61SY6qHOaDpZXSeIoQRfU6PO2miW6SG2+IDE=;
        b=Uq4uvNlFbx8yBGJb7pOUo7Zln+MbGkg7sy2h8c+RQYhLlOaDw/tUJayZiWsYIaRIBL
         qQIP9BtVKsnrSfetU9oPyaAWgkOSCJYS2uwyRPzIyvhO5IMaYGuHexlIlvpYwL6lrZ3m
         lyuu6M8bCqREuS1r12QYvAa4vxxAYCqBXY4AFJciK/qs4uwM2W8fO5mCreezTahPYdL7
         3qwS7iOeoEzpQd3FI12fORZ5PsUj1cIDPOnDrziGupCHpIKmXJAa8s/EpEpbQacY64hq
         TdqtouPeQjPCc8DJy2KQj/o5H84Taix6iTqHIvEr93uIJEKXPWTRQFPgUkTXAlTOJr26
         jqSw==
X-Gm-Message-State: AOJu0YxqzMcUtLIzVFMFRgh2O1M9gWYLVniV0MjH/huZ+MQhbWSsRA0w
	xxsUuVET0SpFL533C+oB/i7UC2KusPTHw7JJGkOvDEwt+kQtvGgjkP8WsAhsSjboRcOmoZNhLoc
	G
X-Google-Smtp-Source: AGHT+IE+w6cCWHEgB2p8/xI4VH5qliY0XWbB6bYhpz3bKOgprtafySuXuF6CsoZ0KJxpqZqB5w3PnQ==
X-Received: by 2002:a05:6a20:c78e:b0:1c0:ef24:4125 with SMTP id adf61e73a8af0-1d30ca212fdmr3279040637.26.1726839573786;
        Fri, 20 Sep 2024 06:39:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/16] buildhistory: Fix intermittent package file list creation
Date: Fri, 20 Sep 2024 06:39:05 -0700
Message-Id: <eb94b09a9183e0b0d9cfc45287e0967ae185c099.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204746

From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>

The directory that buildhistory_list_pkg_files writes to during do_package
is created by do_packagedata so a clean buildhistory doesn't have
files-in-package written during the first build since packagedata happens
after do_package.

Ensure the output package folder is created to avoid missing
files-in-package.txt files.

Also it ensures that in case of `find` fails we leave with
a hard error instead of hiding the error on the for loop.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de9b8c1e199896b9a7bc5ed64967c6bfbf84bea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index fd53e92402..d219519f86 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -599,15 +599,12 @@ buildhistory_list_files_no_owners() {
 
 buildhistory_list_pkg_files() {
 	# Create individual files-in-package for each recipe's package
-	for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
+	for pkgdir in $pkgdirlist; do
 		pkgname=$(basename $pkgdir)
 		outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
 		outfile="$outfolder/files-in-package.txt"
-		# Make sure the output folder exists so we can create the file
-		if [ ! -d $outfolder ] ; then
-			bbdebug 2 "Folder $outfolder does not exist, file $outfile not created"
-			continue
-		fi
+		mkdir -p $outfolder
 		buildhistory_list_files $pkgdir $outfile fakeroot
 	done
 }
-- 
2.34.1


