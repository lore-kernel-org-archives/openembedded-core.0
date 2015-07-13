Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C74A65C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 08:42:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D8ghYd019405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 01:42:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 13 Jul 2015 01:42:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 16:43:29 +0800
Message-ID: <ef5f354a8e2671c90970360bd165caa49418fa82.1436776961.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436776961.git.Qi.Chen@windriver.com>
References: <cover.1436776961.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: add PACKAGECONFIG for valgrind
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
X-List-Received-Date: Mon, 13 Jul 2015 08:42:48 -0000
Content-Type: text/plain

Execute `bitbake valgrind && bitbake systemd -c cleansstate && bitbake
systemd -c configure && bitbake valgrind -c cleansstate && bitbake systemd
-c compile', and we would get the following error.

   src/libsystemd/sd-bus/bus-control.c: fatal error: valgrind/memcheck.h: No such file or directory.

Add PACKAGECONFIG option to sovle this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 8010405..e53802b 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -89,6 +89,7 @@ PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
1.9.1


