Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2926DE92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:27 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hm4so9076964wib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EsJp0yPV6Z1oid/P39JHK91OEjVaK7/LwGb6CeKcYAI=;
	b=o8t7ZJBrxzc2AvXdw3KaGAKN4Lj2ukypk7IPR9RYJeLKRHgtg3kixezWjR4cU2/h9l
	I2pG9eI2+D4bAIOg8WxoLvQHwjilimH25BMl0P5fitd7AHJGu1zRKgtJ8D3oun66Vcz6
	kDl+ehj27pQkTrtO3tU8OhhHSvW3va9PuOs/CW7O+yoHuIeivHc74V6966eXkcmRsDpK
	CXfh9ltIoZsBEmD+jVpH4Vb/yUJub4m2anXlt4YlIf8uSW9zjglg13JkPAXZeNygT1Lt
	p2iaOKkTTyyH8qG6/eSrcjRqbrW+VnJhInU1K+sJIh/uz2PIDlyeJoq6AFVhlJVZD1aE
	r0DQ==
X-Received: by 10.180.206.18 with SMTP id lk18mr23940531wic.64.1385575646659; 
	Wed, 27 Nov 2013 10:07:26 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:25 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:07 -0700
Message-Id: <c39555e418cf1bbb70e06dbe905411a864727e42.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 7/7] pulseaudio: fix RDEPENDS traversal for consolekit
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

Include the console-kit module in PACKSGES explicitly so bitbake can map to
the RDEPENDS we define for it in this recipe, and thereby ensure that when
adding the console-kit module to an image, we also get the necessary
consolekit package produced.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 7e87ef8..2bee9eb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -69,8 +69,12 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
 
+# The console-kit module is included here explicitly so bitbake can map to the
+# RDEPENDS we define for it in this recipe, and thereby ensure that when
+# adding the console-kit module to an image, we also get the necessary
+# consolekit package produced.
 PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc"
+             pulseaudio-server pulseaudio-misc pulseaudio-module-console-kit"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
-- 
1.8.3.4


