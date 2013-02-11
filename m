Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U4w6O-0004gk-2d
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:19:32 +0100
Received: by mail-we0-f172.google.com with SMTP id x10so5037940wey.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 08:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=hK3xDberxU9l24VUPbccjG94zbZyQe18wwMSn9qX9y4=;
	b=DYhxAz/4Xma3kkbAwH8sFnQ4BCRHjGbEi6rSZsqqtryQfeOZTXsPqLa8q87kML5mhf
	Bxh9Yd+JIK9+2LhBFP0R6s283Q3cmHvvqMHxweAoWVadhhHAnGNT0uzRGlhUsZkbzVKI
	1QUIV7m3is4zYdb19aVGUJY6PnqIqn86kG1FZVAsafw1p/U6DR3ddjiR3eotCOKM+iWB
	4Vi7e8LSv+LHX61Xfc68wusbpK7E8BLhWQLHth29Jl1tOO2GEU44F6nnqJ43G5c2KuFV
	TV8+TIA7E9pUDI5Qntm8S8jP5vRsQaigeAWKu7u15KPzG3e5NJQKZI02d5phqAhiXHEx
	nAkg==
X-Received: by 10.194.104.137 with SMTP id ge9mr24884929wjb.59.1360598613435; 
	Mon, 11 Feb 2013 08:03:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ec3sm31457144wib.1.2013.02.11.08.03.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 08:03:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 16:01:20 +0000
Message-Id: <1360598480-20674-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQla44UQ/YG04OK7nLm/R8P1QhtsKNMzkfg9oF5rvPzjPizZfrYmH5J9RoeQXMjx8ph2XWb+
Subject: [PATCH] systemd.bbclass: use PACKAGESPLITFUNCS instead of populate_packages_prepend
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
X-List-Received-Date: Mon, 11 Feb 2013 16:19:32 -0000

This is cleaner and leads to more accurate profiles.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index e0ea65c..8b55813 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -10,7 +10,7 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
 # changes directly but check the DISTRO_FEATURES first.
 python __anonymous() {
-    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+    if "systemd" in d.getVar("DISTRO_FEATURES", True).split():
         d.appendVar("DEPENDS", " systemd-systemctl-native")
         # Set a variable so that update-rcd.bbclass knows we're active and can
         # disable itself.
@@ -39,7 +39,10 @@ fi
 systemctl disable ${SYSTEMD_SERVICE}
 }
 
-def systemd_populate_packages(d):
+python systemd_populate_packages() {
+    if "systemd" not in d.getVar("DISTRO_FEATURES", True).split():
+        return
+
     def get_package_var(d, var, pkg):
         val = (d.getVar('%s_%s' % (var, pkg), True) or "").strip()
         if val == "":
@@ -150,9 +153,6 @@ def systemd_populate_packages(d):
                 systemd_generate_package_scripts(pkg)
                 systemd_add_rdepends(pkg)
         systemd_check_services()
-
-
-python populate_packages_prepend () {
-    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        systemd_populate_packages (d)
 }
+
+PACKAGESPLITFUNCS_prepend = "systemd_populate_packages "
-- 
1.7.10.4



