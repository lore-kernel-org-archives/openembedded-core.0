Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id F282E6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d131so19396547qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kKFXHKTKArKxwrlRQqHu8Id5QcQlTaidRep+gH+ltlg=;
	b=bHI3X9sC1r/9qt0Z/0b6wTEG7ZW/JOqOGCcQxxEqX9ydAlN4p42sM+PQ+ch6ahYDrD
	MwCFqvtEu/ajJn098F1vpKCNRi8+IWXfN1GpOBY5WxDIf1K479eiMXUYQcDDRP996fJH
	G9giN4/wDeYP3f77JunqijttPOAUiSB4vi2Oa6UGbA3kXmyJek1f9+ztLNlmzViCfhR0
	iHFRrirKOIF67vuGgzJ/0NnP9XmK6zjsmLcQOKjexpcuHPqUjnBrK/ofD3ysIFiX/hll
	iYcYeELn+maqq3V/ECw0HdVwBmXQE23fnRzLLZ2CtPDa4Dr4Xg0rCwOrL3/nLwXvTSCg
	liyg==
X-Gm-Message-State: AN3rC/7BONr7OprXiR1QstK5Qg9UAyYHH9HGe46mmBTLy3f9HxH+7Grr
	bt19MmZLhlJJuqSE
X-Received: by 10.55.130.131 with SMTP id e125mr9531316qkd.109.1492436373286; 
	Mon, 17 Apr 2017 06:39:33 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:32 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:58 -0400
Message-Id: <1492436338-32048-9-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 8/8] bluez5: rename "readline" config option to "client"
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:32 -0000

The configure option is "enable-client" not "enable-readline" (the
latter does exists and is automatically enabled when enable-client is
passed).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     | 8 ++++----
 meta/recipes-connectivity/bluez5/bluez5_5.44.bb | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 98fb9b3..3183e9d 100644
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


