Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9HI-0002tp-GK
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:25:03 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so4178110pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=b6//vVKhpAoEk6Vor4ha1muAjA1XX3JBELDXt58+G5Q=;
	b=pzK/7wy3bkHBTp/F9+5FL6nkt/k91JT3eY04Agb95JHCKf6N7FqBwiaghrGXUNnt2N
	LNDyciN8UolreqCXpVYwjI0nkPyvEbhHDt1ZluH2mfkYk7tH0UK1UdGCCR5IdpT4Cktt
	7WeU0zQ/hd2/egw2/vCIVKJ26D1JuJo0hJqPWnwhBqoCdv4LZ1aCe1WhkS5swPiE/9qq
	1kWdHNGEP50OyPp4LT4L4lsmFxQWhUbtvcM/F7xp44jTYgeLHEI2AMPAclC19BsXRPNe
	NDuq8bVq3/sLPLgnNgvZ58dYxO0Of7cnR3LIqOZQ3WytjxIOsKm6Q29DzPWL1y6eh3hG
	3/Ow==
X-Received: by 10.68.198.97 with SMTP id jb1mr17388315pbc.23.1363032501178;
	Mon, 11 Mar 2013 13:08:21 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:38 -0700
Message-Id: <43743ae972f7ddb1216be7f9dab2d95e5e753604.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlS8JI8n8cR3JnbJ+AS5/IENgXfxlYsFg+xRy7IjXLx6zSP5EtEG82riKBE9T/2Er0tsve+
Subject: [PATCH 8/9] update-rc.d/systemd: change communication variable name
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
X-List-Received-Date: Mon, 11 Mar 2013 20:25:33 -0000

Rename SYSTEMD_BBCLASS_ENABLED to INHIBIT_UPDATERCD_BBCLASS to reflect it's
side-effect for clarity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass     |   10 ++++++----
 meta/classes/update-rc.d.bbclass |    8 +++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index f622f9c..e1129c6 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -10,11 +10,13 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
 # changes directly but check the DISTRO_FEATURES first.
 python __anonymous() {
-    if "systemd" in d.getVar("DISTRO_FEATURES", True).split():
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    # If the distro features have systemd but not sysvinit, inhibit update-rcd
+    # from doing any work so that pure-systemd images don't have redundant init
+    # files.
+    if "systemd" in features and "sysvinit" not in features:
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        # Set a variable so that update-rcd.bbclass knows we're active and can
-        # disable itself.
-        d.setVar("SYSTEMD_BBCLASS_ENABLED", "1")
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
 systemd_postinst() {
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 06b91c1..e527fcc 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -75,12 +75,10 @@ python populate_packages_updatercd () {
         postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-    # Run if the sysvinit feature is present, or if the systemd feature is present
-    # but the systemd class hasn't been inherited.  We want to run in the latter case
-    # as systemd has sysvinit compatibility, but we don't want to always so that
-    # pure systemd images don't have redundent sysvinit files.
+    # Check that this class isn't being inhibited (generally, by
+    # systemd.bbclass) before doing any work.
     if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
-       ("systemd" in d.getVar("DISTRO_FEATURES").split() and not d.getVar("SYSTEMD_BBCLASS_ENABLED", True)):
+       not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
             pkgs = d.getVar('UPDATERCPN', True)
-- 
1.7.10.4



