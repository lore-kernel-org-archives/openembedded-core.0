Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Su4q5-0005iE-Bu
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 18:53:33 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2012 09:41:48 -0700
Received: by wibhr14 with SMTP id hr14so766854wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 09:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lh2Y13sHJYvkkeYEveTe66onN3gJ7htoQ2hip1KLMj0=;
	b=Dm2JS7x2qyljwMWhSyUL86LUvV30U4ET4qS++Yk3nFB3WlStnfcm7nCPfYpsx1UZB+
	JsJnEdQWemVgRzVqounZ1OSNzw0P2kkJxeDPB7WSRGJ+fPSkIt1WUQsIFEejaeLIQGYx
	Gm0PhWsVdgwOfU0l/OCmi4Px9v0sJXdwBPxBvWA7kC1W8iBwjVcBV59+7S5PhqPDJLkb
	1Ml11PCrjEjZxo7KX2aaVwA/6JFLZM5kEOgI9vTf9tlOsiKBOXJnlBDcPQGCmr8T+z3V
	sdn5gDlT/1fPT8XCKEw8OOL+ROBpjeEc/KiubaxBu0i9pK9wUdnaH6pFd99SEcF7weaf
	A14w==
Received: by 10.180.86.133 with SMTP id p5mr6075350wiz.17.1343234507244;
	Wed, 25 Jul 2012 09:41:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm5211641wid.1.2012.07.25.09.41.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 09:41:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 17:41:16 +0100
Message-Id: <1343234476-22803-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <CAJTo0LYgXx4camSSmap_HpitQ+gMOhshDLbJDDEr71=kfYnyUQ@mail.gmail.com>
References: <CAJTo0LYgXx4camSSmap_HpitQ+gMOhshDLbJDDEr71=kfYnyUQ@mail.gmail.com>
X-Gm-Message-State: ALoCoQnYwGZIh2b4MWugFdoFB7SaPYs3SmLvYh36knkxcpHXpav2Nd08OqnTBRg5XyeUT1H+VbgS
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
X-List-Received-Date: Wed, 25 Jul 2012 16:53:33 -0000

If nothing has been installed in the root automake 1.12 won't install the
directory, which means os.walk will throw a file not found exception.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fc83424..85d6e81 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -74,6 +74,12 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     given package, usually plugins or modules.
     """
 
+    dvar = d.getVar('PKGD', True)
+
+    # If the root doesn't exist, return early
+    if not os.path.exists(dvar + root):
+        return
+
     ml = d.getVar("MLPREFIX", True)
     if ml:
         if not output_pattern.startswith(ml):
@@ -88,8 +94,6 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
         if newdeps:
             extra_depends = " ".join(newdeps)
 
-    dvar = d.getVar('PKGD', True)
-
     packages = d.getVar('PACKAGES', True).split()
 
     if postinst:
-- 
1.7.10



