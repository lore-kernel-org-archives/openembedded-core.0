Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TwLN5-0007zU-St
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 00:29:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0INDpLa002750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 15:13:51 -0800 (PST)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 18 Jan 2013 15:13:48 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2013 17:13:38 -0600
Message-ID: <392a0740fdf2e435aef68924757d3372015380a9.1358550581.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1358550581.git.mark.hatle@windriver.com>
References: <cover.1358550581.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 2/2] update-alternatives: Add a build-time dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 23:29:27 -0000
Content-Type: text/plain

We need to add a build time dependency on virtual/update-alternatives,
however we can't just do DEPENDS +=, or we end up with various problems.  To
work around this, in the anonymous python space we ensure we only do the
addition when the package does not provide virtual/update-alternatives and
it is a target package.

Also the system wide PREFERRED_PROVIDER was incorrect.  It references a
runtime package, and not the recipe it should have.  This has been corrected.

[YOCTO #3691]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Tested-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/update-alternatives.bbclass       |   13 +++++++++++++
 meta/conf/distro/include/default-providers.inc |    2 +-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 556ee7c..a75e282 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -167,12 +167,25 @@ def gen_updatealternativesvardeps(d):
                     continue
                 d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
 
+def ua_extend_depends(d):
+    if not 'virtual/update-alternatives' in d.getVar('PROVIDES', True):
+        d.appendVar('DEPENDS', ' virtual/update-alternatives')
+
 python __anonymous() {
+    # Update Alternatives only works on target packages...
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or \
+       bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or \
+       bb.data.inherits_class('cross-canadian', d):
+        return
+
     # deprecated stuff...
     update_alternatives_after_parse(d)
 
     # compute special vardeps
     gen_updatealternativesvardeps(d)
+
+    # extend the depends to include virtual/update-alternatives
+    ua_extend_depends(d)
 }
 
 def gen_updatealternativesvars(d):
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 8ed703c..93752b3 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
-- 
1.7.1



