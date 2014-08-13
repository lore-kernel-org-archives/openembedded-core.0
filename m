Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3A207609BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:36:06 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id z11so318948lbi.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P52088Tq/VWxB5hc0kOlpeWpBDl6CaH1VmMzT+HXsiE=;
	b=V5ONtLZVgg49BFCmfhViOSgdvmdL5vgL7q4dSBYuTwwbJgIqwEb0o4C4Qrm6mApDy8
	fPfdH41nI5eQqSvzzo23kjHz6bnFFiIUgXgCXwdowR6KCfxvJkyjrOmPMMvKAUspZ/Bh
	K8RFDdnz2h/HOfOyG5V+KaanrZs7oiCjFsht4IW4qSrqpz76Lf4w20hA4c5LR8DTCUZ1
	a5wiTIGlB1eXO/7P8VlbBPpl1Mtj0djFziuYLzxyl2HJwQ3FOr5HnNovZurXXPPr1p9U
	BN9bWxyFmH3BRAD2pLkn2Lkp+uPEsTW1VAQpCkjtmCyK9lRBw9a2r8QIICXl1ncPnkyC
	tsBA==
X-Received: by 10.112.78.38 with SMTP id y6mr789243lbw.94.1407969367825;
	Wed, 13 Aug 2014 15:36:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xu8sm1955554lab.41.2014.08.13.15.36.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 15:36:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 00:36:42 +0200
Message-Id: <1407969402-9952-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [RFC][PATCH] cmake: drop -fpermissive
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
X-List-Received-Date: Wed, 13 Aug 2014 22:36:11 -0000

* it was dropped from default CXXFLAGS in:
  commit 24dd8e129447013ee98609f3892ec414b1b21340
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Sun Mar 2 17:38:33 2014 +0000

    bitbake.conf: Drop -fpermissive

    Drop the -fpermissive C++ compiler flag. We've had this around for years, most
    code should have been fixed long ago. Its possible some recipes may fail
    however we can (and should) just use the flag where needed.

* I haven't build world with this yet, but maybe it's time to
  drop it here as well at least for consistency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index ab2adec..c51b1cf 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -16,7 +16,7 @@ OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
 
 # Compiler flags
 OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
-OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} -fpermissive"
+OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
 OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CFLAGS} -DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
 OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
-- 
2.0.4


