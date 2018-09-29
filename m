Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF4B7999F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 09:34:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T9YbRZ019450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:34:47 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 02:34:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 17:39:55 +0800
Message-ID: <16e11291dea2788cfd669a94e5342e308cfd8b66.1538212391.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1538212391.git.Qi.Chen@windriver.com>
References: <cover.1538212391.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libepoxy: fix PACKAGECONFIG to get rid of required opengl distro feature
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
X-List-Received-Date: Sat, 29 Sep 2018 09:34:56 -0000
Content-Type: text/plain

The 'virtual/libgl' dependency was introduced by the following commit
without saying why.

  "libepoxy: update to version 1.5.0"

And it's added if 'x11' is enabled. That does not seem right. Restore
its previous dependency to only depend on virtual/libx11.

Also, do not unconditionally enable egl PACKAGECONFIG, enable it if
opengl is in DISTRO_FEATURES. Remove the required distro feature
setting accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
index 1067212..be1b86a 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
@@ -11,12 +11,11 @@ SRC_URI[md5sum] = "4a6b9e581da229dee74c2263c84b1eca"
 SRC_URI[sha256sum] = "a9562386519eb3fd7f03209f279f697a8cba520d3c155d6e253c3e138beca7d8"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
-inherit meson pkgconfig distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "opengl"
+inherit meson pkgconfig
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
-PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
+PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl', '', d)}"
 
 EXTRA_OEMESON += "-Dtests=false"
-- 
1.9.1


