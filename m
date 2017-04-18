Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAF571A3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:31 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id k87so32753511ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHT7fgngDb6VUaNPV3NrScnHUPeYE0QX4o8w6sTkUWA=;
	b=MCi8YweHOXk6O8SsoZStABylWxug37ifyG7supOoVCA8Dke69QxOJbHx1/iFEhEbd9
	4A7D6JDyIeDILOiN8knk+R8M3A38lTHDLJkS+KYiuEpP4ZTTmtxxhV3kTslhCDFGr4PV
	U0cBY9nF2zV/HLvCUC5Y5OygvgzPeuwbTvxAyMoBDC7QoUtC+6tgp23A82OaVDOV7ile
	lMXRWlzf8qUyjjmaCNDJY2MJdNmP9sLs9NzPjrleb6+M9jqGqCB1o9hXB38qG1uJ7i5O
	EgR9YEdyjPSh4GM2WeEjryxMjglEJRFFuLenEhSvzt10XJs8HWSvLo9352B4GzGhV5Ju
	bxbA==
X-Gm-Message-State: AN3rC/6orq4AYtcNky7oPy/HxBXCie8WULOPfKdUYlBOkoKkoOK99+x/
	H4YCaU/DM7qNdQ==
X-Received: by 10.107.35.129 with SMTP id j123mr14696592ioj.214.1492521633214; 
	Tue, 18 Apr 2017 06:20:33 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:32 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:09 -0400
Message-Id: <1492521609-26624-9-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 8/8] bluez5: rename "readline" config option to "client"
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:32 -0000

The configure option is "enable-client" not "enable-readline" (the
latter does exists and is automatically enabled when enable-client is
passed).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     | 8 ++++----
 meta/recipes-connectivity/bluez5/bluez5_5.44.bb | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 01ade7d..0485343 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -12,9 +12,9 @@ RPROVIDES_${PN} += "bluez-hcidump"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "obex-profiles readline ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "obex-profiles client ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
-PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
+PACKAGECONFIG[client] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
 PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
@@ -42,11 +42,11 @@ EXTRA_OECONF = "\
 
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
-NOINST_TOOLS_READLINE ??= ""
+NOINST_TOOLS_CLIENT ??= ""
 NOINST_TOOLS_TESTING ??= ""
 NOINST_TOOLS_BT ??= ""
 NOINST_TOOLS = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'readline', '${NOINST_TOOLS_READLINE}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'client', '${NOINST_TOOLS_CLIENT}', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'testing', '${NOINST_TOOLS_TESTING}', '', d)} \
     ${NOINST_TOOLS_BT} \
 "
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.44.bb b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
index 1095f88..5cb44fc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
@@ -5,9 +5,9 @@ REQUIRED_DISTRO_FEATURES = "bluez5"
 SRC_URI[md5sum] = "94273617129ced06612fcb9f5273d14c"
 SRC_URI[sha256sum] = "0c321e291f8b45e6a78e379dfe80592b65955a0f0ab191f1cca0edd8ec356c85"
 
-# noinst programs in Makefile.tools that are conditional on READLINE
+# noinst programs in Makefile.tools that are conditional on CLIENT
 # support
-NOINST_TOOLS_READLINE ?= " \
+NOINST_TOOLS_CLIENT ?= " \
     attrib/gatttool \
     tools/obex-client-tool \
     tools/obex-server-tool \
-- 
2.7.4


