Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1384F60722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:21 +0000 (UTC)
Received: by ioc74 with SMTP id 74so138212154ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=otKWjEuAwXtPy5kc5QDaCxoenyDn444bpR55FTSA8q0=;
	b=KROif8IWLbnMFCVeVSOAonXXFasDr+9vb6PfTQP8yPaF/xFdmF3priRYmmfzGYIqBh
	lq7DfMY17X7J5UflYApp1vLz92MAkrkmtr91a1w9OIQUZdehyQid/vdDANZwjS428CCN
	kcXK6DTI+gMQtknBVQozAdoxwXe15xeVrlgZXDq2Z0NZMbwiCScKol6ho6BWLVlJ/+uN
	saf3Zps+SA69dR14x+JweXGcUdOiowlfWPV9aAxUqaATFo4tAIRV124zkIfaKY6WpP6b
	EccVoqb/DuWjBVYy387EI51hZzFnGrsf2vfbRT/o9W98YStheu/0KZt15urvjbI+7TUI
	kGgw==
X-Received: by 10.107.3.42 with SMTP id 42mr16001282iod.83.1448059462319;
	Fri, 20 Nov 2015 14:44:22 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:51 -0800
Message-Id: <1448059438-24431-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 04/11] busybox.inc: don't set .config CROSS_COMPILER_PREFIX
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:22 -0000

Setting CROSS_COMPILER_PREFIX via .config is redundant (setting
CROSS_COMPILE via the make command line will always over-ride it).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index ac534a4..57da1db 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -80,8 +80,7 @@ def features_to_busybox_del(d):
 	cnf, rem = features_to_busybox_settings(d)
 	return rem
 
-configmangle = '/CROSS_COMPILER_PREFIX/d; \
-		/CONFIG_EXTRA_CFLAGS/d; \
+configmangle = '/CONFIG_EXTRA_CFLAGS/d; \
 		'
 OE_FEATURES := "${@features_to_busybox_conf(d)}"
 OE_DEL      := "${@features_to_busybox_del(d)}"
@@ -97,8 +96,7 @@ python () {
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


