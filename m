Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5AA7372E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 21:14:36 +0000 (UTC)
Received: by wggx12 with SMTP id x12so22793948wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 13:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rmRRxlvP0c0ItWIwoUQXx2dDFxXOP6MGyWsUgWtRXVI=;
	b=aCS2aBxh8p/R3GNb+ksqtkPVYezQZEH7X9ZRSPhlaFakp1JbmzcTrIvcK/7VvKUJhy
	pDu1IVnOIsnzkMRWP/4qPf24xSNO41q1fGxKbd7/cC23N+WakVBJE6dXxHsbHSg6ncf7
	NfwpW0g42QXJLbF4hZx2xl5wGRv//Jp4w+qhoLVbZEpmNef3uskI7z2JW3MgE26HZfVe
	Fyn9vsLKS3Tz18FXHErc/nE5z6+HqnHlGcHdlyvnKZ+qKuDxEBqo3bkw/jcQl9Jhj2cg
	jtkjlDn9Yiz8+248iVbLcaJnej/U68gVOT+WPOyGLGmXC7VCHe8xDJIn3JjNtW+SQDyZ
	lBbQ==
X-Gm-Message-State: ALoCoQkVvxM31EsVQrFjOl7xwfpu6l9ZqL9soB2fV13LMqqVtVACwZ1NhTkIE++TFbKOCIvlq76o
X-Received: by 10.180.14.196 with SMTP id r4mr10240701wic.77.1425071677887;
	Fri, 27 Feb 2015 13:14:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id l4sm4440960wiw.9.2015.02.27.13.14.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 13:14:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:12:12 +0000
Message-Id: <1425071532-24969-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gst-player: only depend on -ugly plugins if commercial licenses enabled
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
X-List-Received-Date: Fri, 27 Feb 2015 21:14:41 -0000

gstreamer1.0-plugins-ugly is protected by the "commercial" LICENSE_FLAGS, so
only recommend it if those licenses are enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-player_git.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index a7df526..cd96d77 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -28,4 +28,7 @@ do_install_append() {
 FILES_${PN}-bin += "${datadir}/applications/*.desktop"
 
 RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
-RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta gstreamer1.0-plugins-good-meta gstreamer1.0-plugins-bad-meta gstreamer1.0-plugins-ugly-meta"
+RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
+                         gstreamer1.0-plugins-good-meta \
+                         gstreamer1.0-plugins-bad-meta \
+                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
-- 
1.7.10.4


