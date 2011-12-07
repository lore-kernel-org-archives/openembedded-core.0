Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYJ4P-0005zV-FO
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 16:06:05 +0100
Received: by eaao14 with SMTP id o14so512610eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MPsr59jLicOki06Io5nke74OtgGVpnGf562UhqDBapo=;
	b=Rx97hKAxoigwDjo8Cr1+lbCBV5GQizmXaHabd/5fBuQ0ccMZpXt/IVCtEJ8reLcoys
	0X6XeBqUkiQHfUwO6O7sGS0SomOIuk0LcETvkM+B+47UQdQHCk4Pe9Rl3C3FO0EdtO81
	+2s/wBEALCIB/k97kL/98of4+imsXnmMYluGw=
Received: by 10.213.114.3 with SMTP id c3mr3680738ebq.146.1323269954592;
	Wed, 07 Dec 2011 06:59:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm6441270eet.11.2011.12.07.06.59.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 06:59:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 15:59:02 +0100
Message-Id: <1323269942-29691-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <20111207145727.GF3897@jama.jama.net>
References: <20111207145727.GF3897@jama.jama.net>
Subject: [PATCHv2] sysstat: don't run populate-volatile.sh update in do_rootfs, first boot or without populate-volatile.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 15:06:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 2936f96..9da40a7 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -22,7 +22,12 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-        /etc/init.d/populate-volatile.sh update
+        if [ -n "$D" ]; then
+                exit 0
+        fi
+        if [ -e /etc/init.d/populate-volatile.sh ]; then
+                /etc/init.d/populate-volatile.sh update
+        fi
 }
 
 
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
index d445e88..7ef6c60 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
 SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
-- 
1.7.8



