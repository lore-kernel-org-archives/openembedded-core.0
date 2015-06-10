Return-Path: <martinstolpe@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 30FA56AC24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 13:08:15 +0000 (UTC)
Received: by wifx6 with SMTP id x6so46807375wif.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=W712XNnfM44cMcqHvuRpqGuJj4rqmB2QggL0GSNyDqw=;
	b=0E/EL5YoA7ixPdmlD9UgpTdXi6yluJrI8YJ2u/4Qj0yVA1vh1LJ/WMBV5ixOhRfsCf
	dZLk+e+/hFMhBwXpk+3QGAuhzFu7b8ERbE73npmI0/99CMdNfl8B6fTNo+NTnDMkSg2g
	tVT8XVcsN8t41vquaeSfbyp5DwVDfdN1uSP2+eFcV19IPHX+L/eXLdA1pbBwVphZTTUt
	8Xw7KBwSkOPwd3CfNMXPpLd30yWfEo40I3auJfKuc24hHQ47Ag+LladhzFdT0xvuduqL
	8vTN2/2f/DwXljMAoZqGFsVuvedRkNLVimnHOA9mZuwh0R20p/7TUqtc3ZbScWFIOMoc
	7q5A==
X-Received: by 10.180.83.135 with SMTP id q7mr8238559wiy.17.1433941695737;
	Wed, 10 Jun 2015 06:08:15 -0700 (PDT)
Received: from archlinux-vm.localdomain
	(dslb-188-099-229-087.188.099.pools.vodafone-ip.de. [188.99.229.87])
	by mx.google.com with ESMTPSA id q4sm14484652wja.24.2015.06.10.06.08.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jun 2015 06:08:14 -0700 (PDT)
From: Martin Stolpe <martinstolpe@gmail.com>
X-Google-Original-From: Martin Stolpe <martin.stolpe@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 15:07:57 +0200
Message-Id: <1433941677-9681-1-git-send-email-martin.stolpe@gmail.com>
X-Mailer: git-send-email 2.4.2
Cc: Martin Stolpe <martin.stolpe@gmail.com>
Subject: [PATCH] ncurses: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 13:08:20 -0000

GCC"s preprocessor starts to add newlines which are not
handled properly by ncurses build system startin from
version 5.0.

	See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7870

Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 10f7dd1..a7a265d 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -26,7 +26,7 @@ ENABLE_WIDEC ?= "true"
 # _GNU_SOURCE is required for widec stuff and is detected automatically
 # for target objects.  But it must be set manually for native and sdk
 # builds.
-BUILD_CPPFLAGS += "-D_GNU_SOURCE"
+BUILD_CPPFLAGS += "-D_GNU_SOURCE -P"
 
 # natives don't generally look in base_libdir
 base_libdir_class-native = "${libdir}"
-- 
2.4.2


