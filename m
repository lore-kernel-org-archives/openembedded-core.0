Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE158770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:51 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so70669172pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ndViG1eIJuomaI4pftp6xefZ1o4VMLn1KmdYsh6Q88=;
	b=ya5f+Z4Zv7EQk1id4TYI+nBI8m5xf9puUxESmPHW6nm09S//42kNX/SkpnDuFF+ds8
	M4MtDeBm3Gt46TChnss9MEkk7DRH3yEJsPVbfSFHiq3TktTb6Bls8xb67X1yBhVDNb40
	Yu/278dUkWXS5nOa2rZ1uRDUdXqjnW55FnsB8WUnIUso9OIqt8x437vyiVx+e5/SE2BS
	VSzn9ca78ZS3dUEZBUTPR+p5QQbH7gxPKlSJ00awAGGPPe9XAE55G28Jq8P+mkhonpEm
	EAjEKAx92LVUBwuQo7rFLZjyfA2AbhAujYAAgppfdkW0beLnaYah6w4bKyy4YyzjyQ0T
	R7yw==
X-Received: by 10.66.230.169 with SMTP id sz9mr7007186pac.136.1444873432058;
	Wed, 14 Oct 2015 18:43:52 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:51 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:17 -0700
Message-Id: <1444873403-21093-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:52 -0000

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


