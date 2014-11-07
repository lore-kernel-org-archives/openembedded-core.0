Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0A15471FC7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 16:23:52 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id n3so5071402wiv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 08:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yekIL5vN/XVTyk9XvGdgfM8LghlKNXnAc+HQDem8Vew=;
	b=YLXgvEldtqc08XAPXsaytcEqADa8oBJyLCv5iH1nf23yjuEovypKoxshF2X05AbroJ
	ladJRflcWtvhOjbDQSPz3sH6XdPNQsvEC7Up3s16+GhjVsCUmNzBYo+qLcgGjap6pyvS
	ncg48K9h8rlABziUZ/JXORCqI8G+XdtGCvE7xTtmZJV7zPCewMP/aBSFg0xViexx5DB+
	2xd/Hq6LJeIxklMNAB/y/TwnRoJMZdLm9fctCiW62OeNOaeK1TwGHjoGfkdbL097wnHh
	xlC3U1IT9XnXTYNyoX/QI4ZeU42tcYmKdNFJewbiJ50HQcz6KIRhehiSlyJ2/BGQYaRy
	nIqw==
X-Gm-Message-State: ALoCoQnCArUCIlg2fXBi14TH/5rnrMSw9vJrxHpB8gsr1sxeM9q9TDBi+HvTswBbj8EOeDPPehMd
X-Received: by 10.194.87.168 with SMTP id az8mr18012229wjb.65.1415377432242;
	Fri, 07 Nov 2014 08:23:52 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com (dhcp-189-34.gjk.dk.
	[195.249.189.34]) by mx.google.com with ESMTPSA id
	pn4sm12327582wjc.38.2014.11.07.08.23.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 08:23:51 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
X-Google-Original-From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 17:23:44 +0100
Message-Id: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.9.3
Subject: [master][dizzy][PATCH] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Fri, 07 Nov 2014 16:23:54 -0000

In a GPLv3-free build we have two different versions of gettext in sysroot due
to GPLv3 restrictions. In this case we need gettext-native too so we can have
the needed macros and avoid errors like:
"error: possibly undefined macro: AM_GNU_GETTEXT"

The needed dependency is added by gettext class which is prefered because it
takes care of NLS flags too.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
index 61e3847..adac0ee 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
 FILES_${PN} += "${datadir}/X11/xkb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 do_install_append () {
     install -d ${D}${datadir}/X11/xkb/compiled
-- 
1.9.3


