Return-Path: <zhangzl2013@126.com>
Received: from m15-113.126.com (m15-113.126.com [220.181.15.113])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFB57996E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=lwmmVDXkdIIHG2VYrn
	Okr72ZnzHQ/9GVNwdLjSx0ltQ=; b=UnJ2MddsSGCgJCw4+/lSToMea56K+l7g9z
	NjKyFd4jD6ZiwcSFhxDQAfkiFdJnpOb0wVSwUqVCLiwtdN2LAxLzNGOxArsw+ex8
	9OdhTma/3+yuCFall2FUF1e2GYxe5vnITMBVGkVqEhD+doUamXUH64y6xpo9/uql
	+HboeTtxo=
Received: from pek-zhang3-d1.corp.ad.wrs.com (unknown [60.247.85.82])
	by smtp3 (Coremail) with SMTP id DcmowADX9utB8a1br6sPJQ--.4733S2;
	Fri, 28 Sep 2018 17:15:51 +0800 (CST)
From: Zhaolong Zhang <zhangzl2013@126.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, peter.kjellerstedt@axis.com,
	zhangzl2013@126.com
Date: Fri, 28 Sep 2018 17:07:27 +0800
Message-Id: <1538125647-26509-1-git-send-email-zhangzl2013@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: DcmowADX9utB8a1br6sPJQ--.4733S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF48uFWkKr1xAw4kuw48WFg_yoW8Kw15pa
	nYkr1kJr1kJFWrC39xAanYkw45Gr90qa42kw43Xw4kC345WF4UJr42qa13WF43Xa9Iva9r
	JryrXryFgFWxXa7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmJmUUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbi4xLPz1pD68N1IgAAsX
Subject: [meta-oe][PATCH v3] rpm: fix rpm path in nativesdk
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
X-List-Received-Date: Fri, 28 Sep 2018 09:16:54 -0000

Fix the incorrect path inside the nativesdk 'rpmdeps' wrapper:

In os.path.relpath(), it was assumed that all the WRAPPER_TOOLS are in {bindir},
and all the relative paths was calculated based on {bindir}.

However, the assumption was not true for 'rpmdeps' because it is in {libdir}/rpm/.
So the path in rpmdeps wrapper was incorrectly calculated to ..../usr/lib/lib/rpm.

To fix this, we can simply use $OECORE_NATIVE_SYSROOT as the base path, instead of
the complicated runtime path calculation.

The patch also fix the hard coded path in 'find-provides' and 'find-requires' for
nativesdk.

Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
---

v2 --> v3:
  In commit message, change the second 'find-provides' to 'find-requires'.

v1 --> v2:
  1. upgrade commit message.
  2. change ${libdir} to ${libdir_nativesdk}
  3. change ${datadir} to {prefix_nativesdk}/share

 meta/recipes-devtools/rpm/rpm_4.14.2.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
index 46f8837..361e554 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
@@ -103,12 +103,15 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
                 create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
-                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
+                        RPM_CONFIGDIR=$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/rpm \
+                        RPM_ETCCONFIGDIR=$OECORE_NATIVE_SYSROOT/${base_prefix} \
+                        MAGIC=$OECORE_NATIVE_SYSROOT/${prefix_nativesdk}/share/misc/magic.mgc \
                         RPM_NO_CHROOT_FOR_SCRIPTS=1
         done
 
+        sed -i -e 's:\/usr\/lib\/rpm\/:$OECORE_NATIVE_SYSROOT\/usr\/lib\/rpm\/:' ${D}${libdir}/rpm/find-provides
+        sed -i -e 's:\/usr\/lib\/rpm\/:$OECORE_NATIVE_SYSROOT\/usr\/lib\/rpm\/:' ${D}${libdir}/rpm/find-requires
+
         rm -rf ${D}/var
 }
 
-- 
1.9.1


