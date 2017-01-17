Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B53ED601F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:28:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so6748604wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 07:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iGlqxbxyIpcU/ZSOEPdYXFw44569Pc9K9LbPAtshOg4=;
	b=EhAZNAizwfdiV2fXk+UvMeDwTOClm7an5mrv+jd6wU4cc/EgW599VXK8KyHWkvog7w
	pvqDEY8UYYgHZxC+hxdqLW0U3ke3I96NVQFlf29h+NuAuLvEt3CWYlZkHl5Fek7IQtA7
	KDVMgktS7A4d8Hfy37BcYGPh+QKdn1FakifC+2meOnSCb53905PZiEvrTUGGmomIWIBc
	2cCR5Qa3OH4J13KPQ0ViXiVpF3XXFEK4qvOHa7DkdKwePdyfl1u3WLN+bRVRrZNST/bU
	9X9mCmadbagsMVHqVYaMtcCqhCrinPdiFphQKUQr0rugM3A8e7vYgr58nA53wuooSz9l
	mNfg==
X-Gm-Message-State: AIkVDXLg/RPAdPfCAXfr2RCUHPALpuSsDQA9mJeKlmnX0dU/l0Hh63Aji0JOymSul3ocAA==
X-Received: by 10.28.165.199 with SMTP id o190mr17396484wme.113.1484666910392; 
	Tue, 17 Jan 2017 07:28:30 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	204sm37846973wmj.7.2017.01.17.07.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jan 2017 07:28:29 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 15:28:28 +0000
Message-Id: <20170117152828.10729-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] python3-pygobject: enable cairo only when a display is available
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
X-List-Received-Date: Tue, 17 Jan 2017 15:28:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

It doesn't seem to make sense to unconditionally enable cairo
support, as this pulls in lots of other dependencies, where
none of these can actually be used without some sort of
graphical interface.

Not having a generic distro feature to detect this, we just
use any of DirectFB / Wayland / X11

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
index 5a895441fc..143048d9ef 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 
-PACKAGECONFIG ??= "cairo"
+PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
-- 
2.11.0


