Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08940CF9C74
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:24 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.36183.1727097258301680647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DZLyIw8U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso3055417b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097257; x=1727702057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb8yH61NZSlmOeqS+35drLBxNO8F9B/RRTRuqRMdRw0=;
        b=DZLyIw8UJBI/VoThce2fhkdI0RpzJGcj7MBxzoHcpAafsfkhxFQQYH6CiNkkVJ+Pjr
         EhgLEKrT1Sm4V0KHgsk4kzKxYJRNY69mmhd5aRiuEPhhMvqJVfUeBW8whxFmKgHyQnMY
         6bFTUSGipHqz4lsjut1TWNVEq/oAHje3TG81v6MwG5eGf5t9kjWqdqOrKTcRyRW/7Gic
         rmhQyQb4BCVJLdWOKCj7aXpIEqFUnrdKEre3iVY2GHNYZmVv63JWMr7OJ8P/VDN7FwHA
         wai0A0Xrxkt7HXvw0L/5FRtHU3pkHjE7QVNlRxgaqEweqtwGYfaoyz3VeFZexEBVJrP3
         XRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097257; x=1727702057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb8yH61NZSlmOeqS+35drLBxNO8F9B/RRTRuqRMdRw0=;
        b=N+kjSv4tEW9uPUO31tBF1Ilv3O/nDeLDAhJC3lrbHjuV+KINLNDAjrY4RVdmW47Snz
         cQqR39dQOVXip3p9kPqhhEbThZ20/BMERqrr0L0PVjCa8Jyg2GZatSeEe/BDPhqPx7b3
         CR18PD1jjcQysDT4ie7zvBLQLCqJal3XHYshRW/+qn36dU9LXAjm812NGj6hPXHxGupo
         t47q6jjQfKGQD8VgoBAxZq8BHhDBohcpUXhIYCdxRCNmlozavTCTNorE9eMtnWsGSKkA
         DBggJ3PaWp6vRrgT7cV6IVZD239bIUB/J04/E98nazCapwouG7NTien9WoFX8TSTSv7B
         dm/w==
X-Gm-Message-State: AOJu0YzGEUx95fS/iz0Nl50GBfTd5bzaTi0VwGYXv3eqyYfe7rNq1GLa
	y1la5YswRhd/sDO/qKDCa9+h343R4/KtOwNwrQviJa785QnZyad6O9rgZgSSdZc7CsQyYIhcFyW
	th5g=
X-Google-Smtp-Source: AGHT+IEE4QDmzFoLWU+usKyDd8ZEVj/46CuyBjjO4wnAO/sqZUi9bsABfWof7OO4tJdvvPpmriZ7wA==
X-Received: by 2002:a05:6a00:3e11:b0:710:5825:5ba0 with SMTP id d2e1a72fcca58-7199cd62d21mr16528352b3a.3.1727097257482;
        Mon, 23 Sep 2024 06:14:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] buildhistory: Fix intermittent package file list creation
Date: Mon, 23 Sep 2024 06:13:50 -0700
Message-Id: <6817b012763fc32cdcffe30163a304da3ed59ae1.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204815

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
index 4345ffc693..b35508db27 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -597,15 +597,12 @@ buildhistory_list_files_no_owners() {
 
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


