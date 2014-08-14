Return-Path: <voipio@kos.to>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Aug 2014 09:10:08 UTC
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0FE65D9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:10:08 +0000 (UTC)
Received: from aimless.kos.to (91-157-196-38.elisa-laajakaista.fi
	[91.157.196.38])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 7C88E2651C;
	Thu, 14 Aug 2014 11:04:09 +0200 (CEST)
Received: (nullmailer pid 22813 invoked by uid 1000);
	Thu, 14 Aug 2014 09:04:07 -0000
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 12:03:53 +0300
Message-Id: <1408007033-22777-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 2.0.1
Cc: patches@linaro.org
Subject: [PATCH] udev: fix /var/volatile/tmp permissions
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
X-List-Received-Date: Thu, 14 Aug 2014 09:10:09 -0000

Mariadb postinstall will fail with:

ERROR: 1  Can't create/write to file '/tmp/#sql_a2a_0.MAI' (Errcode: 13)
140814  8:14:06 [ERROR] Aborting

/tmp is a link to /var/volatile/tmp, set as:

drwxr-xr-x 3 root root 60 Aug 14 08:07 .

populate-volatiles.sh does not create the directory or set
permissions, because it already exists:

Checking for -/var/volatile/tmp-.
Creating directory -/var/volatile/tmp-.
Target already exists. Skipping.

Traced the creation to the initfile in udev. Create with -m 1755
to be sure. With this patch applied, mysql postinst succeeds and
creates the neccesary user tables.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 meta/recipes-core/udev/udev/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index f2c84d5..a442c74 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -57,7 +57,7 @@ case "$1" in
     # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
     # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
     # /var/volatile/tmp directory to be available.
-    mkdir -p /var/volatile/tmp
+    mkdir -m 1777 -p /var/volatile/tmp
 
     # Cache handling.
     # A list of files which are used as a criteria to judge whether the udev cache could be reused.
-- 
2.0.1


