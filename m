Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360A3CE8D74
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:10:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16170.1726740627927856957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sv/y9RSe;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: pmi183@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374cacf18b1so393502f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726740626; x=1727345426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QiWhXCosKJS1HW38IOZLhg86LZ1TgmFqLRpecCBnw8=;
        b=Sv/y9RSe8y462A4Q5E7esjsSZClO3dM6QeexnwwifDyKE4qDDdsJSMbLPDN+dNZKD3
         REuFpdM8ynYxGBcPwh1hMbk2YmypAVdn9NZ3m2lNVMel3zfYUGmcFMHZRs50P+fH17ea
         Z5tjaslj4Lk5U2nOYT000JgpNQv/AIyS8dz+5r4wuoNEa62wBz3I8+YKezBwqzGDbrM1
         VdAaYhily3n2LXh8LBZhAQaJujKE6yeBm6cCZBbVP2PLxFaijynbPD3PEfnBRzkJ0JgW
         cpCcnx7ftpdCytqdwGni40LmXWu50CSaX9t0nXQStyWpCtXfG4W5WXRQv7hBGYIS/E3y
         E/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740626; x=1727345426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QiWhXCosKJS1HW38IOZLhg86LZ1TgmFqLRpecCBnw8=;
        b=YPeab4dT6n28aeFuO1DG+3krRZqfMh82aespUiMH9iuvXQQj4Gi0K1q3EIFy7tziU7
         zZYpzm1vn9JM7Qm/rFHy9jtYYAeMqmpH1GWiEzsYTG5taxzUYknRdpI3/PNlJTtwQAU3
         nwaWXvwXKxVLcF8HavOvGFo19p0BIckWEN0EYRivv3RfXgTibtMH/gjfEayEv53Ly0HY
         MZdGJrDe2Nk68T6IJ3HNzzyafN7CNhqF7ch5+IF/GfqDdH8o2AAKfHIUxT2H/CU9diP7
         g6Y6evv05KG32HnwUnmwJb5MOFYhQ06VFfGZjEwL9zf/GYeAnBPsXPS0fzQ0QLGbq0iY
         kIhQ==
X-Gm-Message-State: AOJu0Ywuw1NK1k+1h67zjrIC1rRiNTyv1EnbVqwp9XgALA0mFJsV/Hue
	2/1nNva1SRv/birPOFrTAeoAN48NhBjgHz53CwcDtTucjIminEMsx+vXjNBX
X-Google-Smtp-Source: AGHT+IEhcjVTYoMmTSjyScXkdXBSVEevH23assu0quyzRzGXzE+Y6hgxjvxRw2zGyHXpiXSA2h3vew==
X-Received: by 2002:a5d:554d:0:b0:374:c847:85e with SMTP id ffacd0b85a97d-378c2cfb3b7mr14362544f8f.13.1726740626098;
        Thu, 19 Sep 2024 03:10:26 -0700 (PDT)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7805193sm14561716f8f.98.2024.09.19.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:10:25 -0700 (PDT)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v3 1/3] buildhistory: Fix intermittent package file list creation
Date: Thu, 19 Sep 2024 11:10:18 +0100
Message-Id: <20240919101020.2858204-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204667

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


