Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 542CE72491
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 10:34:25 +0000 (UTC)
Received: by wgez8 with SMTP id z8so53402664wge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jun 2015 03:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sH90WeO1dtCqNPlPGDbQvU4T/Hk06QKzsB2HrQSAnDQ=;
	b=lH4AtyNDld41arT4Mcu3333O2GmeMPV8kH8VUI5/w3BHdolBwqeNLA5WWvGvkatx6T
	XbF276L01LSfTZbs3WwzLsBA1FhnOrf/t4jYJFO8ZvHASAFn+h+4AHBrmJ0h7YFIx33S
	IHzUbncbSTN4ccEiLp+tyn+Z9vvIYICbO+RwntBHwPXgRVRloSDrI7W3c0YsT08LQKe+
	gQDSUWkUwNtBqELmBjNvB6fUMgE/Ykr/Pe7aRXJmEFhOLtFnP+iweW2cxaP2VTXrqfaB
	U+aCxF/fgOX3jNAlrmBtYqsZ4ZTrobmiKv6hF1x3kWdQD9C8cDFGDKpA/QnK1QWXGxft
	9JMg==
X-Gm-Message-State: ALoCoQkeYjkl9+0+UNgSf2EVEGvkTIvij02IWC6HsxCotrR8aitqaE6/Xzse0yj7bypbsd4L4ZBs
X-Received: by 10.180.13.175 with SMTP id i15mr3083441wic.30.1433500465862;
	Fri, 05 Jun 2015 03:34:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id fa8sm2633779wib.14.2015.06.05.03.34.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Jun 2015 03:34:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 11:29:48 +0100
Message-Id: <1433500188-11209-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xserver-xorg: always enable DRI2 by default
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
X-List-Received-Date: Fri, 05 Jun 2015 10:34:28 -0000

DRI2 is more abstract than the original DRI and isn't tied to OpenGL or any
other rendering system, and as such is being used by more than OpenGL support in
xserver.  In particular, the new modesettings driver uses DRI2 to accelerate
drawing, so enable DRI2 by default.

This was spotted because the "nodistro" DISTRO doesn't enable OpenGL, so xserver
failed to build as dri2proto wasn't built.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 04289f8..02a170a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -122,7 +122,7 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)} \
+PACKAGECONFIG ??= "dri2 udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "xwayland", "", d)} \
 "
 
-- 
2.1.4


