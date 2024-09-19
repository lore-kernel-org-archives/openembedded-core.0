Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7531CE8D6B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:01:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.16043.1726740092428479031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VxAs1OZQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so5262375e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726740091; x=1727344891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjcImidVtIvDiXB/hutGMCSvG4r7HWzm3nWYgdhXa98=;
        b=VxAs1OZQFwy+r7Y7NrYJw2HybRfNPMpKdzpx3btxnW4hDQYsXjAha5wUaudS8dkS2Y
         GrOwNM4PJNZDkDC6zPOwWPBKqj8oPWKK6m1HilOVfDtbp20zsdgE8W0rr8ULesO2+WUV
         +vz35pW4X0wYb56N3qQnx8WKSIQDNLZl3VX6VeUNj6iaWcRHcqxvZlAURAOU4cIrhT78
         DQzRrzl0uf4zVmBrCiUcU9+eY4kRImQfsi4a+YeH4en1Y4wcZQ1t2oP2quOy5Us/yHpY
         EYSjsT8tX3P9MBd6skZrHMyfcIZluY7a8Vj+oArUytw7muEgVrAtvLBm8HtJuS6Xo3qD
         dkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740091; x=1727344891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjcImidVtIvDiXB/hutGMCSvG4r7HWzm3nWYgdhXa98=;
        b=tMEH3nR0F8wNwWE8nPMffiIjuUrn2TmVk5uuf/RUbOw7Q8XSRODjNNbS5CMlDobveV
         3qCVRtdZLipdCes6+09xQNrQ1wb5HNspObazcSAdPv2M2IxumuJRpN2LRdQw3vO5uXR5
         Jvy+mMhPUo+qfl/NlWyjvUByMUn9K7wfVDQzBg6ZNK2Bu71O109mzmqy7IOCd33U/GaW
         fE75Ye6l8C2qtXQKA6vjJA+GYeu1leX255B6PbbX208Qkt2Pultc1M452SHpm6HCA/aE
         9IHaILDyosrdTQVB2ZeJ9/1RWOXkEnJIe9c1nen6mYoJCuL7cZ+jLKhfWQ0kFKIv6qdH
         ggkw==
X-Gm-Message-State: AOJu0Yy4kAWr/PPCjB7D/0Egpq/69oh/4UA29Z48M1mTrT2a0R3t1zAa
	2EYZ40Jf0iu0qeEhncypzsb+jvKWN1neOx+3eMQNex+dWPKbl8f+PouobZyi
X-Google-Smtp-Source: AGHT+IHnJzvXCzHUuUzUfD6/wpJegq2kBIbLDfHbn3qcwd9TnloxMBq2iC09HBmng37uCAWNQTlHeQ==
X-Received: by 2002:a05:600c:4709:b0:42c:ac9f:b505 with SMTP id 5b1f17b1804b1-42cdb58e130mr167346205e9.31.1726740090458;
        Thu, 19 Sep 2024 03:01:30 -0700 (PDT)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75452b8esm17679405e9.28.2024.09.19.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:01:29 -0700 (PDT)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v3 1/3] buildhistory: Fix intermittent package file list creation
Date: Thu, 19 Sep 2024 11:01:25 +0100
Message-Id: <20240919100127.2857748-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204662

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


