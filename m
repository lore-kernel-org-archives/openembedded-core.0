Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C35FF7831C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 08:14:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAS8Evh6005511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 00:14:57 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 28 Nov 2017 00:14:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Nov 2017 16:16:08 +0800
Message-ID: <238bf1169a8d0f408cf388a7051452e749617e9f.1511854231.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1511854231.git.Qi.Chen@windriver.com>
References: <cover.1511854231.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] procps: fix two small problems
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
X-List-Received-Date: Tue, 28 Nov 2017 08:14:57 -0000
Content-Type: text/plain

1. Fix HOMEPAGE. The old one is obsolete.

2. Remove the setting of CPPFLAGS.
It was used to support out-of-tree build. But the problem has been
fixed upstream since commit 90cc5460aa0e9ca10a0d7c8c44064fd14789f750
(build-sys: add $(top_srcdir) to include search dir).

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/procps/procps_3.3.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index adabd75..99e43c5 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -1,7 +1,7 @@
 SUMMARY = "System and process monitoring utilities"
 DESCRIPTION = "Procps contains a set of system utilities that provide system information about processes using \
 the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill, and skill."
-HOMEPAGE = "https://gitorious.org/procps"
+HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
@@ -23,8 +23,6 @@ S = "${WORKDIR}/procps-ng-${PV}"
 
 EXTRA_OECONF = "--enable-skill --disable-modern-top"
 
-CPPFLAGS += "-I${S}"
-
 do_install_append () {
 	install -d ${D}${base_bindir}
 	[ "${bindir}" != "${base_bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
-- 
1.9.1


