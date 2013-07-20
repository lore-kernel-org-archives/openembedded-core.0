Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id BE32661663
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 11:55:44 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq12so2025908pab.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 04:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a5Vx9XmhtoM+MYXahVzwiqcQwRUlLRR6tmXYCNFJEX4=;
	b=oEKPqWEYXkBSKUXsIszrLZY0S3deIMesQerJjWBzyXsxm9r9E6p+czFRS88Fe21nbJ
	DdQ5U6vWMoQqpfxEgoyd1OnSEfnGDw27PgsbLyhRJKBzawdpp/M0QL/aQWonvJOWFgGV
	vXAdYlnuLHOVK/upyUVX0rXQlpcRcjYLRIEoMOv2e24u8oW7EJnr4cAZ408ZJT+4nIwn
	pygoTO8e8vFYIBrvV8P7cUZgaW0uY0G3rGZfE+5F5ypRXXTqawyKjT2Ene7hvOSEmvaS
	tzbml3LRsyDL3eWnJad19UnNYi6pB4gIlNmwO6U6cCVIil2CMzUmHukii8f6pG3PTepK
	FbWg==
X-Received: by 10.68.247.226 with SMTP id yh2mr21516295pbc.164.1374321345664; 
	Sat, 20 Jul 2013 04:55:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id iq6sm24893273pbc.1.2013.07.20.04.55.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 04:55:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 22:11:20 +1000
Message-Id: <1374322280-1792-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] boot-directdisk: use awk instead of echo -ne for dash compatibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2013 11:55:44 -0000

The echo command is a dash shell built-in and does not support the
-n and -e options so use awk instead.

This fixes the partition table being corrupted when writing the MBR
disk signature into the image.

[YOCTO #4859]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 182957b..8a55aae 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -81,7 +81,7 @@ build_boot_dd() {
 	parted $IMAGE set 1 boot on 
 	parted $IMAGE print
 
-	echo -ne "$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')" | \
+	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
 
 	OFFSET=`expr $END2 / 512`
-- 
1.8.3.2


