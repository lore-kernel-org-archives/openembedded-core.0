Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id E2398601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 15:48:58 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1gMxPX-0005T5-9s
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2018 16:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jhDxrAbse2ldiLUoqjhfpB4WEuo4v8hi/p/iNBR6eeg=;
	b=MRI9bXpf44fbwJOphx5Whkg8CQ
	sWa8k+/ZRgs9ZsbF1nVvbrx2/q3A+fZCkw39Lhcxbizxe6Ecp1j0Jp7fIbrRQUJZRvANK9YvvewTF
	lzvt5S092YUe5YA1WMfh9VISIbt5Ssf5yxxZnhLs2jEUBl15iyXKPwnpvMnrcSlznvRHcEKcVcoeA
	dDEzw0afbwu65L4OO2KdkdRU0QBnX8xJ4GufnUPTvoX6VF0huF/mznyJg5i7Fmo2T42NxOTNUZ1nE
	ZDUu+K2PE8XRVqHKipdQdcloQl+G4QEUWAe0g5JGD2IGUXdhMRrxgb6XaE6JVr25bQVEoh9E5g/5x
	fMV5ke/g==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gMxPR-0005gH-Lr; Wed, 14 Nov 2018 16:48:57 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 16:48:48 +0100
Message-Id: <20181114154848.21117-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 10a865c42659b27c0304ef85eb81de5b
X-Spam-Tracer: backend.mail.pr.hu -1.8 20181114154857Z
Subject: [PATCH v3] update-alternatives: Allow using relative symlinks
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
X-List-Received-Date: Wed, 14 Nov 2018 15:48:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The alternative links are invalid during do_rootfs.

Add a new ALTERNATIVE_TARGET_RELATIVE family of variables to
conditionally make these links valid.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---

v2: Fix the case when the link source and target are not in
    the same directory.

v3: Moved the patch version information here so it's not polluting
    the git history when applied.

 meta/classes/update-alternatives.bbclass | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index aa01058cf9..540bec94e2 100644
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
 
@@ -229,8 +242,15 @@ python populate_packages_updatealternatives () {
             # Default to generate shell script.. eventually we may want to change this...
             alt_target = os.path.normpath(alt_target)
 
-            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
-            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
+            if alt_relative and os.path.dirname(alt_target) == os.path.dirname(alt_link):
+                alt_target_final = os.path.basename(alt_target)
+            elif alt_relative:
+                alt_target_final = os.path.join(os.path.join(*['..'] * len(list(filter(None, os.path.dirname(alt_link).split('/'))))), *list(filter(None, alt_target.split('/'))))
+            else:
+                alt_target_final = alt_target
+
+            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target_final, alt_priority)
+            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target_final)
 
         if alt_setup_links:
             # RDEPENDS setup
-- 
2.19.1


