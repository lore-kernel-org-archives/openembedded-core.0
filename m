Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD8161FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:28:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P0SAqo020338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:28:10 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 24 Jun 2014 17:28:10 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 19:28:04 -0500
Message-ID: <2e2af78e919a8f76d3a833a14c08bd2db39f6e24.1403655933.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403655933.git.mark.hatle@windriver.com>
References: <cover.1403655933.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] classes/package_rpm.bbclass: Fix SDK Suffix reference
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
X-List-Received-Date: Wed, 25 Jun 2014 00:28:13 -0000
Content-Type: text/plain

The meta-mingw layer attempts to change the SDK Suffix, but the rpm
packaging had a hard coded reference to _nativesdk.

I did a quick scan for other hard coded entries and did not fine any
more.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1ff2b36..71cfdc1 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -654,7 +654,8 @@ python do_package_rpm () {
     targetsys = d.getVar('TARGET_SYS', True)
     targetvendor = d.getVar('TARGET_VENDOR', True)
     package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
-    if package_arch not in "all any noarch".split() and not package_arch.endswith("_nativesdk"):
+    sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX', True) or "nativesdk").replace("-", "_")
+    if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
         ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
         d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
     else:
-- 
1.9.3


