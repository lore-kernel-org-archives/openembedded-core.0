Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74F6D7503E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7F9OWCw026121
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 02:24:32 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 02:24:31 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2018 17:24:30 +0800
Message-ID: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] rpm: remove depend on dbus for rpm native
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
X-List-Received-Date: Wed, 15 Aug 2018 09:24:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

This depend cause a big problem that for one package,
build enviroment for clean compile and second time compile
are different. And also rpm-native actually don't need to
depend on dbus, so remove it.

Take libfastjson as example:
(libfastjson don't have autoconf-archive-native in DEPEND)
if don't remove this dependency, it will have below dependency list:
libfastjson -> gcc-runtime -> libgcc -> glibc -> linux-libc-headers -> rpm-native
rpm-native -> dbus-native
dbus-native -> autoconf-archive-native

in this way:
do_package of libfastjson will depend on do_populate_sysroot
of autoconf-archive-native

for clean compile:
during do_configure, since do_package not executed,  so .m4 files
provide by autoconf-archive-native will not under recipe_sysroot_native,

for second time configure:
.m4 already copy under recipe_sysroot_native when run do_package last time

so if there is code related .m4 of autoconf-archive-native in the configure.ac
there will be differences and may cause problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index e5e87d3..91617a4 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -52,6 +52,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
+DEPENDS_remove_class-native = "dbus"
 
 inherit autotools gettext pkgconfig python3native
 export PYTHON_ABI
-- 
2.7.4


