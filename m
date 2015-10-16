Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4C577128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 00:50:51 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so3483338igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 17:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TlHlgzakQXpMeBxyjOEGPgknWv1+0mMpo1h1ghk+veE=;
	b=BvPpEiKMBNFMrrwUNEvX3/0SwlIKNwxkOEw2dqnp3/NM7wwgUSg73S0hSThruLKdHS
	X5ByUp1EFkZ2G7rv8Gj58SOxpKBY/gyAUeWU9wOQfpCoZi+5Sm5bdOpVylBfZG0okyDH
	oqxxRxrlEbjnJSKL0TN92ZbK93D4ZvTp6ahTMqlDipnZEQVRtCOa3aR/ghxX9QjeWkFn
	JBuvqt7MVJItXOiCD70bQSyHB+9ahVyQSRvbPZ+GL+34V8XXI1ucPfubXIbVNT0Do48J
	Nw4w0ESgt5EeKUnMBs4pm3Nmi/zqGJfytJiM1JVmpeT+7Hd0dejoDsbRT25gLLHABG8g
	YmwQ==
X-Received: by 10.50.111.83 with SMTP id ig19mr2107708igb.82.1444956651767;
	Thu, 15 Oct 2015 17:50:51 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id hz3sm755621igb.19.2015.10.15.17.50.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Oct 2015 17:50:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Oct 2015 17:50:43 -0700
Message-Id: <1444956643-21187-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] syslinux: exclude -fschedule-insns from TUNE_CCARGS for x86
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
X-List-Received-Date: Fri, 16 Oct 2015 00:50:52 -0000

Combining -fschedule-insns with the CFLAGS provided by syslinux (in
particular -fPIC and -mregparm) causes build failures with gcc 5.2.

Since -fschedule-insns is of questionable benefit for ia32, exclude
it from TUNE_CCARGS when building for x86.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.03.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 8534528..c07703b 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -37,6 +37,11 @@ EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
 	DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
 "
+
+# Combining -fschedule-insns with the CFLAGS provided by syslinux (in
+# particular -fPIC and -mregparm) causes build failures with gcc 5.2.
+TUNE_CCARGS_remove_x86 = "-fschedule-insns"
+
 # syslinux uses $LD for linking, strip `-Wl,' so it can work
 export LDFLAGS = "`echo $LDFLAGS | sed 's/-Wl,//g'`"
 
-- 
1.9.1


