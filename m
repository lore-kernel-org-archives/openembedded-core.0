Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXO9-00077y-74
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:23 +0100
Received: by mail-we0-f182.google.com with SMTP id k14so3640439wer.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=958vYwHxcuKpUFynxx2Uv3B9Mq3IPT5oSOB2QahcQbE=;
	b=CpkBClAVX10W3aqWKhOXrAqhl1jXxFiK1pVDrFCquQbSTTUX6ywDFQqSM6j2aS3Xug
	zPv37sPBTHTGfF/l2b2E6p8LCwWBNrmiFVYqVMX8YGlVeG52TDB3EJD2z72VgxmcbhTk
	w9tEGCLdNQFY9j7qyhTr2yx1DLdV4UiLb2mMIflK7+OiuLmbXO3Rjz6EaSlLgTKNl1y4
	vNnaS6athsDNTgl4q++cwSogj1L1Gpi+dGiR1wGDoS+AEeX4nYXEc9rw9a2MekMQEYoV
	CSo014/34unbIDqgWwQOjdmJlFUyZOpHTgYz36ybfyElajJGzavt6meh86Ega26aL/fF
	6AFw==
X-Received: by 10.194.122.131 with SMTP id ls3mr26120582wjb.55.1364316801590; 
	Tue, 26 Mar 2013 09:53:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:12 +0000
Message-Id: <b6b0a10f9f72efa068270df9d47694c9a8eaf6c8.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkUKhvd6kkHMvNCFdBNBLUVVq0SCaGUiULHEN/mGhbNX4zl2NRFC/Nrm+hALvaQiOu0A7pK
Subject: [PATCH 14/24] update-rc.d/systemd: change communication variable name
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:29 -0000

Rename SYSTEMD_BBCLASS_ENABLED to INHIBIT_UPDATERCD_BBCLASS to reflect the
action, for clarity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass     |   11 +++++++----
 meta/classes/update-rc.d.bbclass |    8 +++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index cca2152..42fa554 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -10,11 +10,14 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
 # changes directly but check the DISTRO_FEATURES first.
 python __anonymous() {
-    if "systemd" in d.getVar("DISTRO_FEATURES", True).split():
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    # If the distro features have systemd but not sysvinit, inhibit update-rcd
+    # from doing any work so that pure-systemd images don't have redundant init
+    # files.
+    if "systemd" in features:
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        # Set a variable so that update-rcd.bbclass knows we're active and can
-        # disable itself.
-        d.setVar("SYSTEMD_BBCLASS_ENABLED", "1")
+        if "sysvinit" not in features:
+            d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
 systemd_postinst() {
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 0997702..9f1e28a 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -80,12 +80,10 @@ python populate_packages_updatercd () {
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



