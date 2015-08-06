Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4897573905
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:37:02 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so1436202igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TRLHQkcWTBovfqoXs8scKjAkBOvj+U8Sq3QyTJcNlCY=;
	b=CWNigZuZOLaD/dcYUC2X8E/+zynssLAlwUm8g95s1My5Iu0+mbSiTJn7Mu1Q8mzkiT
	A9A6dqTMMVL5r7qfze2KnTCBKCjO+74o2gRCUHv0YEUy4/evMtoFnmS/sBXTu97jXgcp
	jNeZ0bcWyqp7HLoLUVo4PE7jqjrUq+NG05YV0wtubExT+jBsIuHMXoS9l+GJu/WpyqUv
	5cKRGA+rUI+ERihipa7O6Y3n1bIdsOH4AcVXVU8w+jKOU4bss2K9uFcESBFt0t/IiKSk
	J7McTGA/go/Elk5lddC/4T3vU4e3fZiq3Wb8zUhhBHlVPlIrv23Rcm9KdlWokfUF3MnG
	yllg==
X-Received: by 10.50.2.33 with SMTP id 1mr466528igr.68.1438821423096;
	Wed, 05 Aug 2015 17:37:03 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	k19sm3330223iok.20.2015.08.05.17.37.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:37:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:36:50 -0700
Message-Id: <1438821410-22693-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438821410-22693-1-git-send-email-armccurdy@gmail.com>
References: <1438821410-22693-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc builds
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
X-List-Received-Date: Thu, 06 Aug 2015 00:37:03 -0000

Fix linker errors due to posix_spawnp etc being in librt for uclibc.

 | sh4-rdk-linux-uclibc-libtool: link: sh4-rdk-linux-uclibc-gcc -ml -m4 --sysroot=/build-foo/tmp/sysroots/foo -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/test-names test-names.o  libuniname.a ../gnulib-lib/.libs/libgettextlib.so /build-foo/tmp/work/sh4-rdk-linux-uclibc/gettext/0.16.1-r6/build/gettext-tools/intl/.libs/libintl.so -lc /build-foo/tmp/sysroots/foo/usr/lib/libiconv.so
 | ../gnulib-lib/.libs/libgettextlib.so: undefined reference to `posix_spawnp'
 | ../gnulib-lib/.libs/libgettextlib.so: undefined reference to `posix_spawn_file_actions_adddup2'
 | ../gnulib-lib/.libs/libgettextlib.so: undefined reference to `posix_spawn_file_actions_addopen'
 | ../gnulib-lib/.libs/libgettextlib.so: undefined reference to `posix_spawn_file_actions_addclose'
 | collect2: error: ld returned 1 exit status

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 956d238..f9f7a7f 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://hardcode_macro_version.patch \
           "
 
+LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
+
 SRC_URI[md5sum] = "3d9ad24301c6d6b17ec30704a13fe127"
 SRC_URI[sha256sum] = "0bf850d1a079fb5a61f0a47b1a9efd35eb44032255375e1cedb0253bc27b376d"
 
-- 
1.9.1


