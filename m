Return-Path: <zhangzl2013@126.com>
Received: from m15-113.126.com (m15-113.126.com [220.181.15.113])
	by mail.openembedded.org (Postfix) with ESMTP id C9DBA605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8Up/ysYx4+ybj/QgV9
	rHG7Mj8mVNya0sh+/Xc/RYlmk=; b=OjC/B4TGveRWtcZTx9QVVqji709Oh+oYZY
	9febsIH9eRXiBLWeA3jNKUSrN7+d8Uh5PmaBeB6/LywwgiFrtSYE2BRczD9bZTwT
	xbouQ7fxR3CVOng6hwSta8h1ViH9Zabvw5oBN3oOUKfLo3zVtnGXp9Vfg1tOQJ3X
	BGybyVjfw=
Received: from pek-zhang3-d1.corp.ad.wrs.com (unknown [60.247.85.82])
	by smtp3 (Coremail) with SMTP id DcmowABHZOkY7K1biaYOJQ--.4625S2;
	Fri, 28 Sep 2018 16:53:49 +0800 (CST)
From: Zhaolong Zhang <zhangzl2013@126.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, zhangzl2013@126.com
Date: Fri, 28 Sep 2018 16:45:27 +0800
Message-Id: <1538124327-25753-1-git-send-email-zhangzl2013@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: DcmowABHZOkY7K1biaYOJQ--.4625S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF48uFWkKr1xAw4kuw48WFg_yoW8Kr4UpF
	sYkrykJr1kJFWrG39xAan5Kw45Gr90qa42kw13Xw4DC34YgF4Utr47ta15GF43Xa9IvFZr
	JryrXryFgFWxXa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYQ6JUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbitBXPz1pD67KBjgABsv
Subject: [meta-oe][PATCH v2] rpm: fix rpm path in nativesdk
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
X-List-Received-Date: Fri, 28 Sep 2018 08:55:04 -0000

Fix the incorrect path inside the nativesdk 'rpmdeps' wrapper:

In os.path.relpath(), it was assumed that all the WRAPPER_TOOLS are in {bindir},
and all the relative paths was calculated based on {bindir}.

However, the assumption was not true for 'rpmdeps' because it is in {libdir}/rpm/.
So the path in rpmdeps wrapper was incorrectly calculated to ..../usr/lib/lib/rpm.

To fix this, we can simply use $OECORE_NATIVE_SYSROOT as the base path, instead of
the complicated runtime path calculation.

The patch also fix the hard coded path in 'find-provides' and 'find-provides' for
nativesdk.

Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
---

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


