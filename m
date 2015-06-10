Return-Path: <martinstolpe@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D495065C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 14:28:48 +0000 (UTC)
Received: by wigg3 with SMTP id g3so50503667wig.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Np3gg4L+3BZZLzyBO1aq3fIb7+khWI4rvMF6lCymvr0=;
	b=qDL4Cbmh/NmSWvz3sSC4T3MyHCT6IrRdb4+YQAYLSSOMaEhwwCb9HwUKzFNSzWc/oI
	Ra7j2mHRXze6uz6sKbFcK4TY19dLs6ZeRe4aQ21Zl2bIl+KionQRJp72pMuVwcNmZEf2
	l/CXLJBpB5z+bi8nQvbKk4n1JQisX/D2dyf1IaW6T8wuH28GaEXSmH6h3SQF0jHEMuej
	lhi4T0pKEiVvbqPbpXwjnRYvkIISRKOkAMuhkD8Yhhd6QRKPWcbSAtdUPhn4L4rX13EP
	WnyhD7GOhptlObBqFmlsMFwmsK1vEGNt/nqfVYcyu6/jmsY84tTC9GQm04DbQvNSumYH
	V9nQ==
X-Received: by 10.180.109.111 with SMTP id hr15mr9155489wib.53.1433946529488; 
	Wed, 10 Jun 2015 07:28:49 -0700 (PDT)
Received: from archlinux-vm.localdomain
	(dslb-188-099-229-087.188.099.pools.vodafone-ip.de. [188.99.229.87])
	by mx.google.com with ESMTPSA id ha4sm8248386wib.0.2015.06.10.07.28.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jun 2015 07:28:48 -0700 (PDT)
From: Martin Stolpe <martinstolpe@gmail.com>
X-Google-Original-From: Martin Stolpe <martin.stolpe@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 16:28:26 +0200
Message-Id: <1433946506-85872-1-git-send-email-martin.stolpe@gmail.com>
X-Mailer: git-send-email 2.4.2
Cc: Martin Stolpe <martin.stolpe@gmail.com>
Subject: [PATCH] [fido] ncurses: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 14:28:51 -0000

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


