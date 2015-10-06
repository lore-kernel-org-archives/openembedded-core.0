Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6917701A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:53 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so207615127ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ndViG1eIJuomaI4pftp6xefZ1o4VMLn1KmdYsh6Q88=;
	b=Kv76muaMwGItFmUub27xi9hWni5uy4Z3o05VyamSdtd2R7XeHxSfHYrbNbG9N8Kc/j
	VS4Kk+Hl4RJn7mcBQES2/g/KZ0VDqx2xzp4fu7rocihzCEEpxp9fyvH1Dy/oR8kjWj7N
	GZ3f7G5iNbqcumckS0ECKQZ24VUETuL6xtbhd+4VlS+kYTFawPeNk7ZJU4cg8WlGgYDD
	4aLk68pEmGuFy4dJHR1jtG0o89crEdgDnyRzbtSU2GLiJ/rwKOpcBx3Lt97XwDy8ULh2
	BFRXbiXuLbHemRTtKgzYYk604C3nRjG59aVSzLLM+V3KHDUmES7MRI7C2OnmyPWQWmds
	yBGQ==
X-Received: by 10.107.47.32 with SMTP id j32mr31585533ioo.76.1444101594150;
	Mon, 05 Oct 2015 20:19:54 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:26 -0700
Message-Id: <1444101568-16639-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/7] busybox.inc: don't set .config CROSS_COMPILER_PREFIX
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:55 -0000

Setting CROSS_COMPILER_PREFIX via .config is redundant (setting
CROSS_COMPILE via the make command line will always over-ride it).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index a4ecfa4..48a28bc 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -81,8 +81,7 @@ def features_to_busybox_del(d):
 	cnf, rem = features_to_busybox_settings(d)
 	return rem
 
-configmangle = '/CROSS_COMPILER_PREFIX/d; \
-		/CONFIG_EXTRA_CFLAGS/d; \
+configmangle = '/CONFIG_EXTRA_CFLAGS/d; \
 		'
 OE_FEATURES := "${@features_to_busybox_conf(d)}"
 OE_DEL      := "${@features_to_busybox_del(d)}"
@@ -98,8 +97,7 @@ python () {
                    ("\\n".join((d.expand("${OE_FEATURES}").split("\n")))))
   d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
-                  ("\\n".join(["CONFIG_CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
-			       "CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\" \"${HOST_CC_ARCH}\""
+                  ("\\n".join(["CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\" \"${HOST_CC_ARCH}\""
                         ])
                   ))
 }
-- 
1.9.1


