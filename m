Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbidW-00040m-A7
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 04:37:15 +0200
Received: by mail-pa0-f52.google.com with SMTP id bg2so4207831pad.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=RsaafxfDCkqGTUlP21KImyGyEQI/fMAfao6kBlfh/P4=;
	b=vEIiIqedWY06Jdl954F9iatlD3HFCX/e7mVq7+WHwieheS3fkSazWpvEVuKHgbt9py
	0wTGn4IgLRXciHJkftGDGkX62M+pzibGUDThnx6ZlxA9CdF+gLl42xxd8G9hvFEo2KON
	Vh2W5duP/0R17FOw/L8RQx1DpkMo0ITYOC0O/GOTNNND9BfPvnWtq0J9xv+mhED6653X
	4VhnXZS3EG8HRfUIG1pEKYJroZSZRRsZub1QOrV8r+V3j/LVs9cd7oGdW1meCdXl+3ij
	rL9WOJB2Fyx20G+IyJXLDvywjp6eYwVk5QyvxX3GCqhxwWvNkfWEcQG9tuUNFFrO2CeM
	RJsg==
X-Received: by 10.66.50.138 with SMTP id c10mr27589455pao.220.1368411543240;
	Sun, 12 May 2013 19:19:03 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	dr6sm12784052pac.11.2013.05.12.19.19.01 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:19:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 19:17:27 -0700
Message-Id: <1368411447-10264-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] image.bbclass: Add package-management image feature to validitems
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
X-List-Received-Date: Mon, 13 May 2013 02:37:16 -0000

Some images dont use core-image bbclass and add this feature directly

Fixes parsing errors like

/builds1/angstrom/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 34734, PID:
24551 Parsing recipes...ERROR: Unable to parse
/builds1/angstrom/sources/meta-kde/recipes-images/angstrom-kde-desktop-imag
e.bb: Exited with "1" ERROR: 'package-management' in IMAGE_FEATURES is
not a
valid image feature. Valid features: dbg-pkgs debug-tweaks dev-pkgs
doc-pkgs ptest-pkgs read-only-rootfs splash staticdev-pkgs ERROR:
'package-management' in IMAGE_FEATURES is not a valid image feature.
Valid
features: dbg-pkgs debug-tweaks dev-pkgs doc-pkgs ptest-pkgs
read-only-rootfs splash staticdev-pkgs ERROR: Command execution failed:
Exited with 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2b42e12..4f07708 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -19,7 +19,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs package-management"
 
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
-- 
1.7.9.5



