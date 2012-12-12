Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1Tigf9-0004Bq-T3
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 08:23:28 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so259674lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 23:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Bbfq7s35mg6Eyyic7TCO3XxOTlg9L3ZRK9vJa2ztKIY=;
	b=xba/AhKYyu1Xt/PzNjrl+14TxnO7zQ+NeejyiUhWpTULsQ4ekq66rcmQdAr+e0+2gy
	8YeFF4WAu2j9pTP3JZyOePL1P38Hvn1Oe9ld81z4v+DJ/c/Y7Ap3uv/VJMjPVGYDqumm
	bd2nPuCUJv+u7IUwW0icJwbWS7rowDIFjmotaFmulFAbXYFzp3VPA073k4czpFPu1atw
	d/eupJNNAU0uXwqggmdINiHQHAcC+F5bdhQBPWq1zEoSPEidJt+z4tDEe72b3YGdSyFG
	65Xi/8RdDR2MXST4L5sh0Vhgn+JwHpaCv1c9gNBOAzm+XmEBrz2kuTshrNc6sKbRDxs7
	8f3A==
Received: by 10.152.124.68 with SMTP id mg4mr11376lab.51.1355296134619;
	Tue, 11 Dec 2012 23:08:54 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id
	ps11sm10188831lab.12.2012.12.11.23.08.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 23:08:53 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 12:08:37 +0500
Message-Id: <1355296117-6980-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] perf: kill -Werror
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
X-List-Received-Date: Wed, 12 Dec 2012 07:23:28 -0000

this fails to build using a recent sourcery toolchain due to
unused-but-set-variable

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit ids
82e96b3baa1c64d03412871fce56d496a338f167 and
ae325d011bd50501fe677c8b37295ae83030c526

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index b094362..4e6d03d 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r5"
+PR = "r6"
 
 require perf.inc
 
@@ -79,6 +79,10 @@ do_install() {
 	fi
 }
 
+do_configure_prepend () {
+    sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
+}
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} += "${libexecdir}/perf-core"
-- 
1.7.9.5



