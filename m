Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5XIP-00016q-Nr
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 09:02:48 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so431866daj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 23:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vpU0wy6Ktqquq4bjhq6cC2S04jSheAwesEx4AuSRJ4Y=;
	b=goCnvhmCn4fxAfpiEw+ck9eFBdF+/SgU5cY+kstr/i/lLCqwqbkEif9GBoIA8faF+p
	MhbTIWQ1AAOfmEIC3nFnv9X5rf9FJyenhl7lSSTiOTyYj4+oWu9xueQRhnRzu+vSS9Xg
	4qJfwN/q0EzyRHi61wSbYgXn8IYmsM22WhWJA7GxpnUuh/lvsUo9VaRk+Gz+e6nybIyT
	XzdQM8KRp4gMlfHqUkMDZz/Uc8lmCt0jJ0uS736tN/7nuJeVBLjPpGl9Bb8Mv4q14wNM
	kxYW6x+PA5Xxqf/TSFw/mKOTBsK+xCDHSlc04g0SeSHP1bMOKkQd1ByUY4PxRUhvqgyL
	qXqg==
X-Received: by 10.66.73.165 with SMTP id m5mr61119914pav.78.1360741584556;
	Tue, 12 Feb 2013 23:46:24 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id a4sm81409989paw.21.2013.02.12.23.46.23
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 23:46:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 23:46:10 -0800
Message-Id: <1360741570-11148-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360741570-11148-1-git-send-email-raj.khem@gmail.com>
References: <1360741570-11148-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH V2] systemd.bbclass: Dont use libdir and base_libdir for units
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
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 08:02:54 -0000

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
index 8b55813..269e3f9 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -49,6 +49,12 @@ python systemd_populate_packages() {
             val = (d.getVar(var, True) or "").strip()
         return val
 
+    # Check if systemd-packages already included in PACKAGES
+    def systemd_check_package(pkg_systemd):
+        packages = d.getVar('PACKAGES', True)
+        if not pkg_systemd in packages:
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



