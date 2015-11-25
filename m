Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD0860620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:44:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPKiWHM003407
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:44:32 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 12:44:32 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 14:44:27 -0600
Message-ID: <1448484269-132667-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
References: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] allarch.bbclass: allarch packages are having their hashes altered by baselib
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
X-List-Received-Date: Wed, 25 Nov 2015 20:44:33 -0000
Content-Type: text/plain

In a multilib configuration baselib can change, but allarch packages should not
changed from multilib to multilib.  So we set the value of baselib to none
which should act as a market for any errant users of libdir.
nonarch_base_libdir / nonarch_libdir should be used instead.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/allarch.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 2fea7c0..6fa7a23 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -28,6 +28,11 @@ python () {
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
 
+        # In a multilib configuration baselib can change, but we shouldn't be
+        # using it anyway.  All packages should use nonarch_base_libdir or 
+        # nonarch_libdir.
+        d.setVar("baselib", "none")
+
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
         # packages.
-- 
1.9.3


