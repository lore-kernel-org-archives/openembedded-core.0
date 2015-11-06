Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2916E60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:35 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so92304764pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=snlOjbdX0ffCwLLl+qjsGfdHMwm981th3VsVuN3jlIU=;
	b=XA04FurbMSPrdMRs+BsG23g1I97xuBhhOGEWlGd85I3NzGPHAl3XeVZNT8E+BEOmIm
	ljD4EnpoL7DMqIMlEr5zxIVBu+oz+EvP4x2jWfEHr19pDaTDj0j4/kevEwh0y0pE2RZO
	1vUwg0ZJbGuoK3WrRK7e4p0LD9utfQjL9OEdvFui1eK/TQ/fweNzpTzaJQkLOzQW6Mqj
	rw62AJwwT34e9j7zHdgA3XHVBzdPLxhnVt8NJEcQUx2+OluJUzZ+bwOt34YZdfKhChB6
	6gXcmZycK1go/0zTKjxQGScm3so/MJW7e2WAeg0ZzOcuY7fjhH+bui7G3QqQfe7JZkvm
	OM8w==
X-Received: by 10.68.68.201 with SMTP id y9mr16107566pbt.10.1446799656261;
	Fri, 06 Nov 2015 00:47:36 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:05 -0800
Message-Id: <1446799631-7037-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 05/11] busybox.inc: don't set .config CROSS_COMPILER_PREFIX
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:36 -0000

Setting CROSS_COMPILER_PREFIX via .config is redundant (setting
CROSS_COMPILE via the make command line will always over-ride it).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 8132641..c568361 100644
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


