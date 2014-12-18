Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D9ED072819
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:54:12 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so1846240wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0i844AjIL+clBSC8kszjkxqKDn7R//PW3yDA1F+PPLg=;
	b=Vq3g9tnF8uTwMB8Jl+IMNhMtF6VklKnmd1WxHk2qYmv7Esj5WZcNyvoMmcRMuZzmpn
	jaaFxEzcuLo5clN+e9uTL2/bXg3+KkZF6wTij1Jdp464/Lf3kYEMAd5q9YXlylC9900P
	w0dm+5rg3u5zfygsSsFudd6jRrVcUqFyPWswzm3IaKsaRHJiDVCGVFQQQFI1bU18/EBU
	XLOVoxdTq6bDBlkJLcxmluyMeE3y8ADXYcDwdbEdwWE3yzIK2ePJIDC4RoRwySVxy5M4
	fzUr5Kx3N0ARjb+X+8VZ8pJe5pKwktojG4uZTC0SBrR9FSn4y/JnEw5zhdmpoRCRDcki
	Z8wA==
X-Received: by 10.194.61.168 with SMTP id q8mr5049744wjr.53.1418914452534;
	Thu, 18 Dec 2014 06:54:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kn7sm2270527wjc.45.2014.12.18.06.54.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 06:54:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 15:54:14 +0100
Message-Id: <1418914454-24213-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] powertop: Fix build for !uclibc
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
X-List-Received-Date: Thu, 18 Dec 2014 14:54:13 -0000

* EXTRA_LDFLAGS isn't defined for !uclibc and configure fails
  when it reads it unexpanded, see config.log snippet:

  configure:4177: checking whether the C compiler works
  configure:4199: i586-oe-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed ${EXTRA_LDFLAGS} conftest.c  >&5
  i586-oe-linux-gcc: error: ${EXTRA_LDFLAGS}: No such file or directory
  configure:4203: $? = 1
  configure:4241: result: no

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/powertop/powertop_2.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.7.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
index dce5d71..5ba07e9 100644
--- a/meta/recipes-kernel/powertop/powertop_2.7.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.7.bb
@@ -14,8 +14,9 @@ SRC_URI[sha256sum] = "8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047
 inherit autotools gettext pkgconfig
 
 # we need to explicitly link with libintl in uClibc systems
-LDFLAGS += "${EXTRA_LDFLAGS}"
+EXTRA_LDFLAGS ?= ""
 EXTRA_LDFLAGS_libc-uclibc = "-lintl"
+LDFLAGS += "${EXTRA_LDFLAGS}"
 
 # we do not want libncursesw if we can
 do_configure_prepend() {
-- 
2.2.0


