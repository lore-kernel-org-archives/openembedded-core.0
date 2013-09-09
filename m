Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id AB59E6BE17
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:19:18 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id f12so4980394wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 03:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HafpfAlu3aZNwvwtT99kFQlqEgef3HIc4qiql7ejmTk=;
	b=VzW65XsZCUbrYP89sEQ2n0n8pjgEcVUxQG9NsN0s5uhqukP/VPhrV46xkCVbcbTklh
	ppykiDjLpS/xFlHXskf0qyMzJfn6Qyts4/Cx3dXW4YcLqZPt7yj5cehAel3RJPSr6p+Q
	/82Ga4ig8MOmTgnNE6VEXmTx/FLn8y9TdbPV7zNgr0Dhzc3X5EA4lhnFTDxuVWmlEl6/
	j5jMHSJZdO6ZXdXfH5Ewav/Q4oeE6stH2Rah1X4Ioa3/E+9uioSTJhalgk3yDfKLGCAq
	I/h12WvB7QBW0GtHsFtMQZjbkuIAk3CzC646LTwTT2Gj5C2qm3wHBXhcE0RYM+NDTzVD
	ihfw==
X-Gm-Message-State: ALoCoQm6Zwlqy+2oMfX6LWZ6Yh4c33MBTipyDqYW1MDGdDfPya2vukQ2PEEpfUqjMZY4RV7lbBio
X-Received: by 10.180.82.231 with SMTP id l7mr7910289wiy.21.1378721959703;
	Mon, 09 Sep 2013 03:19:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id as5sm2370773wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 03:19:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 11:19:12 +0100
Message-Id: <1378721952-10827-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] xf86-video-intel: allow builds without opengl, add more options
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
X-List-Received-Date: Mon, 09 Sep 2013 10:19:19 -0000

Allow builds without the opengl DISTRO_FEATURE by disabling DRI.

Also add new options for UXA (not default upstream, requires DRI) and udev
(enabled by default)

Finally remove a few obsolete dependencies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
index 54c4d17..f26544b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
@@ -9,11 +9,14 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-DEPENDS += "virtual/libx11 drm xf86driproto glproto \
-            virtual/libgl xineramaproto libpciaccess udev"
+DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
+
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
+PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 
 # --enable-kms-only option is required by ROOTLESS_X
-- 
1.7.10.4


