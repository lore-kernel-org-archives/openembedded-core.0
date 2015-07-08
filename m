Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF7F73E36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 06:27:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t686R4NQ006686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 23:27:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 7 Jul 2015 23:27:04 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 14:26:01 +0800
Message-ID: <33aa3bf1d21634a68daedac78083e42ad0ad8a64.1436336502.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436336502.git.kai.kang@windriver.com>
References: <cover.1436336502.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 2/2] systemd: add PACKAGECONFIG selinux
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
X-List-Received-Date: Wed, 08 Jul 2015 06:27:07 -0000
Content-Type: text/plain

Add PACKAGECONFIG 'selinux' for systemd. debug-shell.service starts
different shell according whether selinux is enabled.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 6ed4fe0..8abd4e5 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -61,7 +61,9 @@ GTKDOC_DOCDIR = "${S}/docs/"
 
 PACKAGECONFIG ??= "xz ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                  "
 
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
@@ -85,6 +87,7 @@ PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
1.9.1


