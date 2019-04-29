Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76F247D9FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:38:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3T7cAsl010173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 00:38:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 29 Apr 2019 00:37:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2019 15:37:56 +0800
Message-ID: <1556523477-268112-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556523477-268112-1-git-send-email-changqing.li@windriver.com>
References: <1556523477-268112-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 V3] waffle: supprt build waffle without x11
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
X-List-Received-Date: Mon, 29 Apr 2019 07:38:29 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

respect DISTRO_FEATURES to make waffle support different platform,
gbm platform is supported by default.

[YOCTO #6077]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/waffle/waffle_1.5.2.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
index 43c3edc..31572f2 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
@@ -15,10 +15,9 @@ inherit cmake distro_features_check lib_package
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
-PACKAGECONFIG ??= "glx"
-
-# libx11 requires x11 in DISTRO_FEATURES.
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+                   gbm"
 
 # virtual/libgl requires opengl in DISTRO_FEATURES.
 REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX}libgl', 'opengl', '', d)}"
-- 
2.7.4


