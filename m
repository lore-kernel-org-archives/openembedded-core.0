Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 28C4673CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 15:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id AD0CB3C88754
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:41:20 +0100
Message-Id: <85affef7f7513d7653589f3352ab6bf19d1e4fde.1442245106.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1442245106.git.joshua.lock@collabora.co.uk>
References: <cover.1442245106.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1442245106.git.joshua.lock@collabora.co.uk>
References: <cover.1442245106.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 1/1] kmod: fix link creation when base_bindir != /bin
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
X-List-Received-Date: Mon, 14 Sep 2015 15:41:28 -0000

If base_bindir is not a direct child of / the link creation in
do_install_append creates incorrect relative links.

Instead pass a full path to the link source too the lnr script
to create a relative link.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index ba4d85e..e0bb95c 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -21,9 +21,9 @@ do_install_append () {
         install -dm755 ${D}${base_bindir}
         install -dm755 ${D}${base_sbindir}
         # add symlinks to kmod
-        ln -s ..${base_bindir}/kmod ${D}${base_bindir}/lsmod
+        lnr ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
         for tool in insmod rmmod depmod modinfo modprobe; do
-                ln -s ..${base_bindir}/kmod ${D}${base_sbindir}/${tool}
+                lnr ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
         done
         # configuration directories
         install -dm755 ${D}${base_libdir}/depmod.d
-- 
2.1.4


