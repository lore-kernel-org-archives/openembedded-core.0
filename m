Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4677160593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:40:23 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so4720629eak.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y5OdZKwHnr4EeBwUNY24N0eFCfvEMP9ZP48uIS9DTD0=;
	b=cIuhW1Xs4m/L2mqj3sQ3KwNLg7DBio+g9pnqIPbg9MzVwAx0TEEmMscG/usrOovlby
	YG6VkqNzedJ0CrnK8jhw+BRG90IUFrUOUWt+fTndYWo0QUx4vMfQom59yO9C7Vg4RTYz
	Pqg65CIBLlz/ICQJc4L/fdA5zi9g8v/J1KtIEN1M5bkUDUmrjf3XAdvh31YhHpyZo2P5
	P3IhVp7hzqelYqvQmHGyG8zSfYugrJS5wPBA1pIGvOHrreT4PlHHDDGzktMpeSNvH+Wp
	8cOflqq8Na1IKmzV/kOkP2cFcsgPFlIkOWwnjnlTDxOKLDaTi/wNBRh1CiSkOtn3UkDn
	noUg==
X-Gm-Message-State: ALoCoQkz/cNdeHpJ0uEKd+xq3s40YD9/uZ+C1yEUH58KICXF3ISn+W+RR3nIpm4NEJDblAPZw2kK
X-Received: by 10.14.0.200 with SMTP id 48mr4500154eeb.53.1376480422081;
	Wed, 14 Aug 2013 04:40:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k3sm74487130een.16.2013.08.14.04.40.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:40:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 12:40:12 +0100
Message-Id: <1376480412-26009-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1376480412-26009-1-git-send-email-ross.burton@intel.com>
References: <1376480412-26009-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] matchbox-wm: fix icon handling on 64-bit hosts
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
X-List-Received-Date: Wed, 14 Aug 2013 11:40:23 -0000

Xlib has a historical quirk where 32-bit values are returned in longs (but
always hidden through a cast).  On 32-bit machines this doesn't matter but on
64-bit this leads to problems.  Bump SRCREV to integrate a fix from upstream.

Also, drop the conditional configure_fix.patch, it was integrated long ago.

[ YOCTO #4917 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index c6afd96..015fbc0 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf"
 
-SRCREV = "686178379e5ad00453d9f6f50b53777372a29e68"
+SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
 PV = "1.2+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=git \
-           file://configure_fix.patch;maxrev=1818 \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


