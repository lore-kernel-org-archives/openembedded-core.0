Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0366E77087
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:57 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id p186so118758449qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hOA/Iid3+ixYQWFNswb2iyqhmFYBvOsDq4nM8hUXMuE=;
	b=K28kXYcIr7jLWCLZqIxQQJ3xnK6t43COcq9J7mktFYvAxfLHK9dx7BWGMhcxrcGUMv
	bPP+cbl2iSyRpO522ekkiW8X0bJ+pqU630udkFnXb11eP4AdaNrXOvPWmGVnb3eObjfy
	i+l8ns1XxYryMdY6MV1r8uG8fQDbac1Q9CDquC/YkTBBxmpEBc7OxQUKaWzxGB7L7D0z
	HwkK365sWxdg6TH3Yfw+pMYcebzkIiorJx/GVWUqPt2m8kaERwiEe59mgPYlV5gB6H2i
	PNXC3Rc2psLN6yZxaFQ8TFUD0tVwxsqjaIShPoZP/Uc/PvOxw+rpP6/trEdlhMnksWaW
	D3ZQ==
X-Received: by 10.55.75.131 with SMTP id y125mr79383968qka.61.1452248398481;
	Fri, 08 Jan 2016 02:19:58 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:14 +0000
Message-Id: <f2be4884ffaed3002529491586a39ad81618917c.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 46/53] irda-utils: Fix header inclusions
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:58 -0000

Helps compile with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../irda-utils/irda-utils-0.9.18/musl.patch        | 29 ++++++++++++++++++++++
 .../irda-utils/irda-utils_0.9.18.bb                |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
new file mode 100644
index 0000000..97eb975
--- /dev/null
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
@@ -0,0 +1,29 @@
+Replace use of <net/if_packet.h> with <linux/if_packet.h>.
+
+kernel headers <linux/if_packet.h> already provides the
+needed definitions, moreover not all libc implementations
+provide if_packet.h e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: irda-utils-0.9.18/irdaping/irdaping.c
+===================================================================
+--- irda-utils-0.9.18.orig/irdaping/irdaping.c
++++ irda-utils-0.9.18/irdaping/irdaping.c
+@@ -33,7 +33,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>		/* For struct ifreq */
+-#include <net/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <net/if_arp.h>		/* For ARPHRD_IRDA */
+ #include <netinet/if_ether.h>	/* For ETH_P_ALL */
+ #include <netinet/in.h>		/* For htons */
+@@ -46,6 +45,7 @@
+ #include <asm/byteorder.h>	/* __cpu_to_le32 and co. */
+ 
+ #include <linux/types.h>	/* For __u8 and co. */
++#include <linux/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <irda.h>
+ 
+ #ifndef AF_IRDA
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index bd2f815..11b2ee9 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
            file://ldflags.patch \
+           file://musl.patch \
            file://init"
 
 SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
-- 
2.7.0


