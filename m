Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8512F71B18
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 20:19:46 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f82so12274073wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=GXv5l9W18D6eP77mnyaH3rlqV4GXe33va/CUw+rgMhU=;
	b=axBGuKvpLU7lH/NeAJuuChGF6Tp8SiZjy/80mP5es9ye7q7v/lrZjyOlcSevHxRJl2
	spd8w/LyYwQH8fhmPOyuk7mKop1ldBdxf+jMmMkTODnEGB5LUIYUQ+Y5EY/IndXXA0D0
	CBr3z+RhVmsdWl4ATH5ZkvjMKQvZ25uRj5gUi3tWLVs+E/kaCcoAN2fA+OtzLvTBLK0l
	nUW9fDIYgwN5ipIQW7v0VKGGw4KiPmsdHTrzAn7Q2pJj1g/Bl4ciuBde0+6ieITmCzS9
	f+otUqW00B8vbfakyQmKx1keaD07sfrwJueMdph3s0sg0zPufHFS92rF8eNWsz0eHkU9
	Zdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GXv5l9W18D6eP77mnyaH3rlqV4GXe33va/CUw+rgMhU=;
	b=KcRJ8q79PEcNEhv+UEDc3nSjoCUQlNueFm+Bt/TaQlJEwHUPDI5g3+g2czbznxo85K
	GyPxJLCADIY6A52DmGUDVXishZnv/1R6PxKGdQRIQt4VtAkKmOzFXteLi8WHeV9PDsT/
	Weqps2wV29MTJws0Z78NMCtfnmHIcHtxdaPK6VGjhBoHghvrCuAcR0+/2HpBfZmsRcn3
	eJvhsZzvgm6VHrprBzG6pqqo51DlB7jMQZ9pHc6BU4cdBCsE2ppeIjXJ/gS0V94BiNSH
	XxNlskiLu6eAurPHHxmdpzLlLcb/ej2zaQT4mIDNLKD0dXIaAmBOh5EClBvIGnh3malw
	mcww==
X-Gm-Message-State: ABUngvdV44rX8SjuQCa/SRZakjLaL1fg0azu4vNKrw0KxODlBFtXBvdmqFA/8W/UVdCvBpvj
X-Received: by 10.194.115.135 with SMTP id jo7mr13331777wjb.21.1478290787435; 
	Fri, 04 Nov 2016 13:19:47 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w66sm6371763wme.4.2016.11.04.13.19.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Nov 2016 13:19:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 20:19:44 +0000
Message-Id: <1478290784-20316-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] distro_check: MeeGo is long dead, compare against Clear Linux instead
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
X-List-Received-Date: Fri, 04 Nov 2016 20:19:47 -0000

Instead of checking against a file that represents a distribution that hasn't
existed for years, fetch package names for Clear Linux instead.

[ YOCTO #10601 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/distro_check.py | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 00c827e..c666ddc 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -43,15 +43,6 @@ def package_name_from_srpm(srpm):
     (name, version, release) = srpm.replace(".src.rpm", "").rsplit("-", 2)
     return name
 
-def get_latest_released_meego_source_package_list(d):
-    "Returns list of all the name os packages in the latest meego distro"
-
-    package_names = set()
-    with open("/tmp/Meego-1.1", "r") as f:
-        for line in f:
-            package_names.add(line.strip() + ":" + "main")
-    return "1.1", package_names
-
 def get_source_package_list_from_url(url, section, d):
     "Return a sectioned list of package names from a URL list"
 
@@ -99,6 +90,11 @@ def get_latest_released_mandriva_source_package_list(d):
     package_names |= get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/updates/" % latest, "updates", d)
     return latest, package_names
 
+def get_latest_released_clear_source_package_list(d):
+    latest = find_latest_numeric_release("https://download.clearlinux.org/releases/", d)
+    package_names = get_source_package_list_from_url("https://download.clearlinux.org/releases/%s/clear/source/SRPMS/" % latest, "main", d)
+    return latest, package_names
+
 def find_latest_debian_release(url, d):
     "Find the latest listed debian release on the given url"
 
@@ -167,7 +163,7 @@ def create_distro_packages_list(distro_check_dir, d):
                             ("Fedora", get_latest_released_fedora_source_package_list),
                             ("OpenSuSE", get_latest_released_opensuse_source_package_list),
                             ("Mandriva", get_latest_released_mandriva_source_package_list),
-                            ("Meego", get_latest_released_meego_source_package_list)
+                            ("Clear", get_latest_released_clear_source_package_list),
                            )
 
     for name, fetcher_func in per_distro_functions:
-- 
2.8.1


