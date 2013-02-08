Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwl-0002Go-Oi
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:33 +0100
Received: by mail-wi0-f173.google.com with SMTP id hq4so1442594wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Y11wwo2fTTpNJwxFKgn+KHwmiZ2v5Ol5zNTBEIS523g=;
	b=jE4mam/9OyXUp7m7qHoPad7GnlMA6qXGLZEbQL6llgAjUCKNSyfz3G7zVI14AwTtyn
	vvA+oYfWDxdqJw142at6Qj1IPDFdcXEIDLSNhvvAvZv9pldExigMbBaa4z2cSE6rSX7u
	LHQPwYWrpU+wySlMJqlTZ6/tajUOSZab+lg8v58EdOKGebG4PaHmdUVXqbMQbxDW3LYy
	u6MXWQSPAcTGY/5Ay2PE6DMHx2xXIqmi/fmu2Xupu32Ii+lus7k5NN4+e2cJ9uDlpop9
	SJEB/5jSTN2MdxzNAhNv/OP3RVYpD7shRhRtO4N3havgX6ymx95q4zixAyEsvaL9xq3f
	b+Fg==
X-Received: by 10.180.106.34 with SMTP id gr2mr5219572wib.18.1360363537703;
	Fri, 08 Feb 2013 14:45:37 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:16 +0000
Message-Id: <2f3ac96fb6a599b3c8a62eb68417dd8e26b21676.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmh4HmHx3Jbky4+10G1joCpA9p/VHLed/xKPWmSh5Rp83niQ5qwrFcJaqO28PevtQF2pdxQ
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] update-rc.d: don't do anything if systemd.bbclass is inherited
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
X-List-Received-Date: Fri, 08 Feb 2013 23:01:34 -0000

We need the update-rc.d class to work when systemd is being used so that
packages that only have SysV init scripts still work.  However if a recipe
supports both we don't want to install SysV and systemd files under systemd.

To solve this, before doing real work in update-rc.d check if the systemd class
has been inherited and don't do anything if it has.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index f9d55fb..51ad8b1 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -75,12 +75,15 @@ python populate_packages_updatercd () {
         postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-    pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
-    if pkgs == None:
-        pkgs = d.getVar('UPDATERCPN', True)
-        packages = (d.getVar('PACKAGES', True) or "").split()
-        if not pkgs in packages and packages != []:
-            pkgs = packages[0]
-    for pkg in pkgs.split():
-        update_rcd_package(pkg)
+    # If the systemd class has also been inherited, then don't do anything as
+    # the systemd units will override anything created by update-rc.d.
+    if not d.getVar("SYSTEMD_BBCLASS_ENABLED", True):
+        pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
+        if pkgs == None:
+            pkgs = d.getVar('UPDATERCPN', True)
+            packages = (d.getVar('PACKAGES', True) or "").split()
+            if not pkgs in packages and packages != []:
+                pkgs = packages[0]
+        for pkg in pkgs.split():
+            update_rcd_package(pkg)
 }
-- 
1.7.10.4



