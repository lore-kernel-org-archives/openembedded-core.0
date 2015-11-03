Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 34C1E770EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:54:58 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so31279219pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vDqnFZLM6T1qNrWVUK7kf2UghHIY4+P9j7V20acyG00=;
	b=HCqKEuJptGq2xk9eEQgLf9V7GIRJQ455pvjTZDqSx/pKzYpNZNIS2GQVI3XfkGJLls
	t5c1vgFurNnbSO/MxYobdJHODoBOHDTvJWccs+L24BLNqw0wp3xuNy58eLXYUgBee+QU
	0Aa3/G4xcmGcMCd8WsWZgUicyb+Q/gGJfCx71SBAs7pfxJ/S2uptNnQWP8zKjMz1haCe
	S/3xfquIGVN24MLXYV7+CFexgGwR0/L4hZyBODTM0gLcSZSX6AjBCxWNBmLlOuqhUlnJ
	2R7Frbzll5AXNkFBnfxnHoH2SULhlqz0N4ScMxUJhm4C+2dk1z2dgGBu3Yv233ibOdmZ
	HSWQ==
X-Received: by 10.66.147.136 with SMTP id tk8mr36256791pab.37.1446591299098;
	Tue, 03 Nov 2015 14:54:59 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	ha3sm31427036pbb.28.2015.11.03.14.54.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 14:54:58 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 16:54:36 -0600
Message-Id: <1446591276-28139-5-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
In-Reply-To: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
References: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 4/4] systemd: make coredump a PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Nov 2015 22:54:59 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 5f6be82..e2d6b16 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -91,6 +91,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
 PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
+PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump,"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
@@ -118,7 +119,6 @@ CACHED_CONFIGUREVARS_class-target = "\
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  --with-roothomedir=${ROOT_HOME} \
-                 --disable-coredump \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
@@ -269,6 +269,7 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
 CONFFILES_${PN} = "${sysconfdir}/machine-id \
+                ${sysconfdir}/systemd/coredump.conf \
                 ${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/logind.conf \
                 ${sysconfdir}/systemd/system.conf \
@@ -298,6 +299,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
+                ${bindir}/coredumpctl \
                 ${bindir}/localectl \
                 ${bindir}/hostnamectl \
                 ${bindir}/timedatectl \
-- 
2.6.2.11.gb05c2f9


