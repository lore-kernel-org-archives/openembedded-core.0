Received: from mail-ia0-f182.google.com ([209.85.210.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5qH0-00030A-PC
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 05:18:20 +0100
Received: by mail-ia0-f182.google.com with SMTP id w33so1929513iag.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 20:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=j2LdY/Mv88Z46lWfaQ5x5BKwA4EfiiQghR87aMMaxGA=;
	b=VggK9LblR2LSZ2ozLwvSfjwLRFYN5U8j/EfOK3laq//M7EyJV6ZKRAb+VbJyuYR1pB
	iIDl5Uev5bwbA5PrVflLczz2QMJYP+URvVR0yfhW0Vxm8V+vBjGvHo5K8ZLvI7abWHz3
	1DPp2XD6pzua+8jSHqomSiQrNY2rhaunE9+ldSb+IqDSjx8A5214Yyj5XON/Nw5qTzrD
	byYrO0/IM/obHx/6TYMwADpnr4TVCDCXa1V3Jt9aqWN800vZW+tgWffEJZFRzQe4TU9e
	nJEtwh4QgBGkxzkYvgpzcOBLp5lDG18hpwM2joUxbEfuSPtTXHKoxRxstMKsfnp61HRh
	oCww==
X-Received: by 10.50.196.162 with SMTP id in2mr16306662igc.76.1360814532582;
	Wed, 13 Feb 2013 20:02:12 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id wo8sm742841igb.6.2013.02.13.20.02.11
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 20:02:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 20:02:00 -0800
Message-Id: <1360814521-24221-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3] systemd.bbclass: Dont use libdir and base_libdir for units
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
X-List-Received-Date: Thu, 14 Feb 2013 04:18:22 -0000

systemd always uses /lib and /usr/lib to store unit files
so using libdir and base_libdir is incorrect. It will work
where libdir is usr/lib and base_libdir is /lib but wont work
when say its /lib64

Add a check to make sure that SYSTEMD_PACKAGES are part of PACKAGES
too, otherwise error out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/systemd.bbclass |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 8b55813..066cc22 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -49,6 +49,12 @@ python systemd_populate_packages() {
             val = (d.getVar(var, True) or "").strip()
         return val
 
+    # Check if systemd-packages already included in PACKAGES
+    def systemd_check_package(pkg_systemd):
+        packages = d.getVar('PACKAGES', True)
+        if not pkg_systemd in packages.split():
+            bb.error('%s does not appear in package list, please add it', " " + pkg_systemd)
+
 
     # Add a runtime dependency on systemd to pkg
     def systemd_add_rdepends(pkg):
@@ -118,11 +124,9 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        base_libdir = d.getVar('base_libdir', True)
         searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
-        searchpaths.append(oe.path.join(d.getVar("base_libdir", True), "systemd", "system"))
-        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "system"))
-        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "user"))
+	searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir", True), "systemd", "system"))
+	searchpaths.append(oe.path.join(d.getVar("exec_prefix", True), d.getVar("nonarch_base_libdir", True), "systemd", "system"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:
@@ -149,6 +153,7 @@ python systemd_populate_packages() {
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D", True)):
         for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
+            systemd_check_package(pkg)
             if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
                 systemd_generate_package_scripts(pkg)
                 systemd_add_rdepends(pkg)
-- 
1.7.9.5



