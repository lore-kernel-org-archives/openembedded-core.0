Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BB0D17716E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:51:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 79CB860068B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:51:18 +0100
Message-Id: <013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445010332.git.joshua.lock@collabora.co.uk>
References: <cover.1445010332.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445010543.git.joshua.lock@collabora.co.uk>
References: <cover.1445010543.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 1/6] systemd: build with compatibility libraries
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
X-List-Received-Date: Fri, 16 Oct 2015 15:51:46 -0000

There are recipes in the Core metadata that have optional systemd
support but expect the old, separate, libsystemd-foo pkg-config files
(not the newer unified libsystemd).

Add a PACKAGECONFIG option to build systemd with the compatibility
pc files and default to enabling this option so that we can make use of
them in the weston recipe.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index c2dad58..594c5aa 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -58,7 +58,7 @@ LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz ldconfig \
+PACKAGECONFIG ??= "xz ldconfig compat \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
@@ -89,6 +89,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
 PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
+PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.1.4


