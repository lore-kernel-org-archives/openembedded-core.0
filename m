Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Su4lN-0005bT-F2
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 18:48:41 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2012 09:37:10 -0700
Received: by wibhm11 with SMTP id hm11so4302798wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 09:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=CwoFYFDwpwC37sr9cowm/+i0wHk40Ky2G4vcoAMlMIg=;
	b=VjnJRNNjDvftPTwqunijm5ZxkG/WISiZTv86aAMe8z3iR66tMxIdGCJj+z2B9xtIvI
	dShJ0nsY0bgP2wxUqwwkeb6+FssdKFw43wELdJ3gwAOp5RQQiXBC0WJemeeZjf/Ls785
	Pzd8zREtvpjXcT7dXEWW3i+u6kjYwVhoQWe+t2Jyvt2OoTDegDYz4nKJP+hIrn4f/2q8
	EiTN3JIuACum/Ixx3MHSLKaTLyAbygsvbJa60qrfNsXoNZAoZm4gUQMub5pGMvgoVBok
	dcVZl2DJV6szbJAB2hUafvgApf7tgi3i3S11qYL/amyzLpSh4U3ou3dsUl1IfzGiFz3V
	CD0w==
Received: by 10.180.100.131 with SMTP id ey3mr6051226wib.15.1343234228407;
	Wed, 25 Jul 2012 09:37:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm3323874wiw.9.2012.07.25.09.37.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 09:37:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 17:36:39 +0100
Message-Id: <1343234199-21520-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkBxgYoNlIYkpJoFoTDvMG1VL3HAlOStsPNLCSOy6AKzmm0/4P4qATL3kxwjygS4qHk6Eoi
Subject: [PATCH] package.bbclass: don't error when the root doesn't exist in do_split_packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 16:48:41 -0000

If nothing has been installed in the root automake 1.12 won't install the
directory, which means os.walk will throw a file not found exception.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fc83424..0ddf788 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -74,6 +74,10 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     given package, usually plugins or modules.
     """
 
+    # If the root doesn't exist, return early
+    if not os.path.exists(dvar + root):
+        return
+
     ml = d.getVar("MLPREFIX", True)
     if ml:
         if not output_pattern.startswith(ml):
-- 
1.7.10



