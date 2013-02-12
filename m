Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5K8B-0005jz-MQ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:59:26 +0100
Received: by mail-pa0-f48.google.com with SMTP id hz10so213632pad.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 09:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=y2sbBqAS+rLS5sicbu4kGdUjqz/twArcwfA2fKNeJlc=;
	b=jHFiyq2/wFACHZg1OytdVvVDTDkqJ38kTNNkIwYqUAe+EAI9azsjjxYuXsV+oJK0SN
	tJSg1xyf35f2fLz4dD/jURlh6mmFOaiN6WRCGsWUfq2/PRV4XK9wNvzDvDx6dDdHvJhi
	UJIoNof+13UdD2V5G+747epuKIz0X5iZj8YatpP09DkVCUgP/hDJq52BjZKGIrB64CUi
	EUN0dzLXPgEnVNMlMfrW+UtEhZglMXDAlh3GVVJsaupQSe0So5za89GYF5c6j+eMAbNs
	Qrya0nMUE/ejFj5Eq6/VONNqTnaG/cN7Ryjo18njl9DpRnBV5NWFthGSu8laPNhwjv3C
	bRbw==
X-Received: by 10.66.52.50 with SMTP id q18mr54662640pao.16.1360690979194;
	Tue, 12 Feb 2013 09:42:59 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id w2sm71208372pax.22.2013.02.12.09.42.57
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 09:42:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 09:42:50 -0800
Message-Id: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd.bbclass: Introduce do_install_append and use systemd unitdir
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
X-List-Received-Date: Tue, 12 Feb 2013 17:59:33 -0000

systemd always uses /lib and /usr/lib to store unit files
so using libdir and base_libdir is incorrect. It will work
where libdir is usr/lib and base_libdir is /lib but wont work
when say its /lib64

Additionally introduce the install append from meta-oe
lot of recipe appends in meta-systemd depend on that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/systemd.bbclass |   21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index e0ea65c..32cc5c2 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -115,11 +115,9 @@ def systemd_populate_packages(d):
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        base_libdir = d.getVar('base_libdir', True)
-        searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
-        searchpaths.append(oe.path.join(d.getVar("base_libdir", True), "systemd", "system"))
-        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "system"))
-        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "user"))
+        searchpaths = '/etc/systemd/system/' + ' '
+        searchpaths += '/lib/systemd/system/' + ' '
+        searchpaths += '/usr/lib/systemd/system/' + ' '
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:
@@ -133,7 +131,7 @@ def systemd_populate_packages(d):
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
                 path_found = ''
-                for path in searchpaths:
+                for path in searchpaths.split():
                     if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
                         path_found = path
                         break
@@ -156,3 +154,14 @@ python populate_packages_prepend () {
     if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         systemd_populate_packages (d)
 }
+# automatically install all *.service and *.socket supplied in recipe's SRC_URI
+do_install_append() {
+	for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
+	# ensure installing systemd-files only (e.g not avahi *.service)
+		if grep -q '\[Unit\]' $service ; then
+			install -d ${D}${systemd_unitdir}/system
+			install -m 644 $service ${D}${systemd_unitdir}/system
+		fi
+	done
+}
+
-- 
1.7.9.5



