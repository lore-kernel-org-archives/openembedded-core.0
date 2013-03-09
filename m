Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UETrR-00048r-DL
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Mar 2013 01:11:34 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so2490887pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2013 15:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+Yyh34Qp/mNiRQ5rjgI6/Hdq2A/U/Y9pFQoG6Qe+6ok=;
	b=oN2cgPCF7CGPLITUGsJFN80ITcbmiIkcrW89XB/wH/cqs3OWkJjc49oP6kClEzPiYW
	tfdnjG9RS+RBTO2ggHq85DwsE1/b38OtDLsOaXJRzKE/EL9rlgPV7zS6ho3RoXosHc9K
	NRIgW+RKsRgPgWO7uTT4xlUYT4egamRKkoHVDI8MxRfgCNAYgCnvnFe3e6jM7K0GFtL1
	bn8K7PloABVkjzaK5FUQG87MsGFYym2RLDFINw6ju9yPfL+ES20C4ls49SgxF2GhnskB
	UyFLOv44cx7DJLNXyQF0UwQGv0ni1GgX4VO835ryrq1d5CyMzzl3z1gpjr9QGMH9mliF
	47xA==
X-Received: by 10.68.245.201 with SMTP id xq9mr15235448pbc.160.1362873297132; 
	Sat, 09 Mar 2013 15:54:57 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp13sm12441718pbb.3.2013.03.09.15.54.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 15:54:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Mar 2013 15:54:28 -0800
Message-Id: <4a7f6b52607ac6dfd7651f1d740e1c8f436884c0.1362873102.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
In-Reply-To: <cover.1362873102.git.raj.khem@gmail.com>
References: <cover.1362873102.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] systemd: spin libnss_myhostname to package of its own
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
X-List-Received-Date: Sun, 10 Mar 2013 00:11:35 -0000

Fix packaging warning

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_198.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_198.bb b/meta/recipes-core/systemd/systemd_198.bb
index c57ee52..381a67b 100644
--- a/meta/recipes-core/systemd/systemd_198.bb
+++ b/meta/recipes-core/systemd/systemd_198.bb
@@ -98,7 +98,9 @@ do_install() {
 }
 
 python populate_packages_prepend (){
-    systemdlibdir = d.getVar("base_libdir", True)
+    systemdbaselibdir = d.getVar("base_libdir", True)
+    do_split_packages(d, systemdbaselibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+    systemdlibdir = d.getVar("libdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
@@ -146,7 +148,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${systemd_unitdir}/system/* \
                 /lib/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
-                ${libdir}/libnss_myhostname.so.2 \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/localectl \
-- 
1.7.9.5



