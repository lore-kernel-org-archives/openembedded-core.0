Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id D47786C3BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:40:33 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1gMtX7-0007aI-Mm
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2018 12:40:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F/zsZegHzn6pL1MwZczRYwqdurSLnbDy3rKWFhXY73M=;
	b=FZsO6NWQphO6AVkJI/CSbssZ6w
	2ll16uoTiaRLNS02NJ0gO5FUtuc4E1DfzDyFp1sz6wYJEAqGblgJZo7yAcx3yfZyiD5VPtT8N+c8P
	2WzPfWJm5++o6N/PWZlK5oaoXd8EeDQQGobzFaBP9TCCKoUBQdIZwZ2jadyJ3emmN0w7pCGqZkzGm
	jz13RX73228oBdw1WScwUSUEcs+Er9nWpxc2cPplOT25BMeGUIL+zKyUrjwXMjoTbNCGS0g0rwgdN
	1j8M9dv+zQUXPwq+FIK2zezcCBlMvx3njVlp2h62ShFBkRigH6VRpInltehUDkVNa7O9VLhARQ+08
	QjwLnc6w==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gMtX3-0007Ev-6G; Wed, 14 Nov 2018 12:40:31 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 12:40:25 +0100
Message-Id: <20181114114025.7010-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Scan-Signature: 85009d953b1791c297252820971497a4
X-Spam-Tracer: backend.mail.pr.hu -1.6 20181114114031Z
Subject: [PATCH] update-alternatives: Allow using relative symlinks
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
X-List-Received-Date: Wed, 14 Nov 2018 11:40:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The alternative links are invalid during do_rootfs.

Add a new ALTERNATIVE_TARGET_RELATIVE family of variables to
conditionally make these links valid. This is limited to the
case when the binary and the symlink are in the same directory.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta/classes/update-alternatives.bbclass | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index aa01058cf9..7af559c918 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -47,6 +47,15 @@
 # the need to rename alternative files in the do_install step, but still
 # supports it if necessary for some reason.)
 #
+# The default to use relative link for all targets
+# ALTERNATIVE_TARGET_RELATIVE = "1"
+#
+# A non-default setting to use relative link for a target
+# ALTERNATIVE_TARGET_RELATIVE[name] = "1"
+#
+# A package specific setting to use relative link for a target
+# ALTERNATIVE_TARGET_RELATIVE_<pkg>[name] = "1"
+#
 # The default priority for any alternatives
 # ALTERNATIVE_PRIORITY = "priority"
 #
@@ -214,6 +223,10 @@ python populate_packages_updatealternatives () {
             # Sometimes alt_target is specified as relative to the link name.
             alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
 
+            # Whether to use relative symlink target
+            alt_relative = d.getVarFlag('ALTERNATIVE_TARGET_RELATIVE_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET_RELATIVE', alt_name)
+            alt_relative = alt_relative or d.getVar('ALTERNATIVE_TARGET_RELATIVE_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET_RELATIVE')
+
             alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name)
             alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
 
@@ -229,8 +242,13 @@ python populate_packages_updatealternatives () {
             # Default to generate shell script.. eventually we may want to change this...
             alt_target = os.path.normpath(alt_target)
 
-            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
-            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
+            if alt_relative and alt_target.startswith(alt_link):
+                alt_target_final = os.path.basename(alt_target)
+            else:
+                alt_target_final = alt_target
+
+            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target_final, alt_priority)
+            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target_final)
 
         if alt_setup_links:
             # RDEPENDS setup
-- 
2.19.1


