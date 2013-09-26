Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id DADC86CBAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 16:06:39 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hj3so1488542wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=h+JvLrZG99TBpkNcTvjwUM+8wV66TSRvJW6aETxY3as=;
	b=DrbyHwE6rDrgzRsyIgFCMtuTXkukj88p6lyZAPIFGGaDWhJhI82h1jSpfD9jUpF2NS
	dvSMSnrZ9XGZ+oWugfrSva/sIOZtjGlvA7aCDmIDQNONY9bh2YC3dYKSVFToYM672T7a
	5X2lQaStLVoQRM7dgUTe4Gh5TfnuLZT0cVKIHbveWL+Q3OisBPXsfcpA89HEXH9McUl1
	MdODu5jZwg7NCcpJDsNTSGT8E5bnCX6OhfW1NmFAFrMGioMtQvywZJxG1mFk08SgSHhI
	13DSYnZ6Kh/ymxsIF1RhjZDtCjZmeV9JElwY99hAA4qidckEg6tpmfWX5/NR0+hqQoGC
	owvg==
X-Gm-Message-State: ALoCoQmRjviA1jHJOWltuQbt3SwgkkPVyw968QlIy1YWx8ZSlW7jK6UabNFzwiIniBLPq071nuLR
X-Received: by 10.180.229.103 with SMTP id sp7mr1599282wic.2.1380211600694;
	Thu, 26 Sep 2013 09:06:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mw9sm3036962wib.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 09:06:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 17:06:36 +0100
Message-Id: <1380211596-18381-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] matchbox-panel: silence some pointless warnings
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
X-List-Received-Date: Thu, 26 Sep 2013 16:06:40 -0000

The battery applet emits a warning if the hardware doesn't have a battery (it
shouldn't) and the parser emits a warning if two separators are used in a row
(which happens if the hardware has a keyboard).  Silence these with a patch from
upstream.

[ YOCTO #4061 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-panel-2/files/silence-warnings.patch  |   64 ++++++++++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    3 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch b/meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
new file mode 100644
index 0000000..45ba9a0
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
@@ -0,0 +1,64 @@
+Don't warn if the machine doesn't actually have a battery, or if the applets
+string contains consecutive separators.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/applets/battery/battery-acpi.c b/applets/battery/battery-acpi.c
+index 6515cb0..c44dd12 100644
+--- a/applets/battery/battery-acpi.c
++++ b/applets/battery/battery-acpi.c
+@@ -14,8 +14,6 @@ int batt_state, ac_state;
+ int pm_support(void)
+ {
+ 	if(check_acpi_support() == NOT_SUPPORTED){
+-		g_warning("No ACPI support\n");
+-
+ 		return 0;
+ 	}
+ 
+@@ -32,8 +30,9 @@ const char* pm_battery_icon(void)
+ 	const char *icon;
+ 	battery_t *binfo;
+ 
++        /* No battery available (not present, disabled, or something
++           else. Silently do nothing. */
+ 	if (batt_state != SUCCESS) {
+-		g_warning("Couldnt initialize ACPI battery\n");
+ 		return NULL;
+ 	}
+ 
+diff --git a/applets/battery/battery-apm.c b/applets/battery/battery-apm.c
+index 5467438..2f39cb6 100644
+--- a/applets/battery/battery-apm.c
++++ b/applets/battery/battery-apm.c
+@@ -10,8 +10,6 @@
+ int pm_support(void)
+ {
+ 	if (1 == apm_exists ()) {
+-                g_warning ("No APM support");
+-
+                 return 0;
+         }
+ 
+diff --git a/matchbox-panel/mb-panel.c b/matchbox-panel/mb-panel.c
+index 2d8cafd..828a36d 100644
+--- a/matchbox-panel/mb-panel.c
++++ b/matchbox-panel/mb-panel.c
+@@ -110,10 +110,15 @@ load_applets (const char    *applets_desc,
+         applets = g_strsplit (applets_desc, ",", -1);
+ 
+         for (i = 0; applets[i]; i++) {
++                char *s;
+                 char **bits;
+                 GtkWidget *applet;
+ 
+-                bits = g_strsplit (applets[i], ":", 2);
++                s = applets[i];
++                if (s == NULL || s[0] == '\0')
++                        continue;
++
++                bits = g_strsplit (s, ":", 2);
+ 
+                 applet = load_applet (bits[0],
+                                       bits[1],
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 1e2a7ae..eff20f0 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -19,7 +19,8 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
+           file://silence-warnings.patch"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
-- 
1.7.10.4


