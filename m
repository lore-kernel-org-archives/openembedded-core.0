Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id CA6067611B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:50 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so78774994pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UFNO72WFHfkwR7KncsmQrGC7vv4e+7CjeTe7R/PG0ck=;
	b=BzFJy10Www0sqqOTylgDhZxhItbrKq3YUr/bNjFCbZB/BNyRn9w2iyedHchKbCC3w+
	wLejAY1s4jheQrSdyf2Vs8oOnlnK3eShVnm4xLnGMEkZsdrBA022JzaQV5XL0jnQr3I8
	f+YBY/keyiFWTr0qKgpnvrxkEgDy+5JAUF3nU/NtaaHkZ9FbJw9wDB65ABKqZYpb0IQS
	pZMCMOxIOo/rZOxBrUbacdW3IKZLCsa3JZeAPrKCItFPboCpwpsA1AtNLiJEGi+61Ejk
	G5TsO7ntrYF6xkyAlTlVccjgANsqjVKsjYBZyqKWRR6J/QAPG3tYaMqhaBzM4EHiOBjJ
	ohUw==
X-Received: by 10.66.121.163 with SMTP id ll3mr41252837pab.100.1437232611317; 
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	qn7sm9116923pab.14.2015.07.18.08.16.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:49 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id E2FEEFC12F7; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:22 -0700
Message-Id: <471faf33fcf1e553e7a653467c9183da5f3fc93b.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 15/25] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:51 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* install populate-extfs.sh from contrib, be aware that in order
  to use it you need to set DEBUGFS shell variable, otherwise it will
  try to use debugfs from relative path which is almost always
  incorrect:
    CONTRIB_DIR=$(dirname $(readlink -f $0))
    DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 70ccdfd..95c612c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -54,6 +54,8 @@ do_install () {
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
+
+	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
 }
 
 do_install_append_class-target() {
-- 
1.9.1


