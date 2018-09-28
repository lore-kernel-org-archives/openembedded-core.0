Return-Path: <zhangzl2013@126.com>
Received: from m15-113.126.com (m15-113.126.com [220.181.15.113])
	by mail.openembedded.org (Postfix) with ESMTP id 78BBE7998C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=GT+4IL8YnuZa2Ur4uv
	fWRYkl9UehpYq+EKDHx0eE2EE=; b=GOxF0znUlbxDHP0+mZpJX8Mo4BGpB8Lgtx
	uiVedecCcUioU87e6BdPy0+tDxcuPh/HRHM5HOlgtCHfs6B6q0burzoGkO6BKq7/
	bHC96Jqk9Rh5FNmMwVQrGkc5c5shAJZVnfKQonyapghw+bLqMEP4yMPfaznr2V8q
	79PsGoMPk=
Received: from pek-zhang3-d1.corp.ad.wrs.com (unknown [60.247.85.82])
	by smtp3 (Coremail) with SMTP id DcmowAC3v+eGzq1b9hsIJQ--.12585S2;
	Fri, 28 Sep 2018 14:47:39 +0800 (CST)
From: Zhaolong Zhang <zhangzl2013@126.com>
To: openembedded-core@lists.openembedded.org,
	zhangzl2013@126.com
Date: Fri, 28 Sep 2018 14:39:16 +0800
Message-Id: <1538116756-18222-1-git-send-email-zhangzl2013@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: DcmowAC3v+eGzq1b9hsIJQ--.12585S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1rZF1UWFW3Cw1kZr18Xwb_yoW8Ww43pF
	4v934kJrykX3yrG393AanYkws8G3s0qa47Cry3XwsrC34UWF4UJr12gw45Gr45Xa9IqF4x
	JryrXFyYgFWxX37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRuVbkUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbiaQvPz1pD6RzRHAAAsD
Subject: [PATCH] rpm: fix rpm path in nativesdk
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
X-List-Received-Date: Fri, 28 Sep 2018 06:47:41 -0000

Fix the incorrect path inside the nativesdk 'rpmdeps' wrapper.
Also fix the hard coded path in 'find-provides' and 'find-provides' for nativesdk.

Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.2.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
index 46f8837..f22eee0 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
@@ -103,12 +103,15 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
                 create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
-                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
+                        RPM_CONFIGDIR=$OECORE_NATIVE_SYSROOT/${libdir}/rpm \
+                        RPM_ETCCONFIGDIR=$OECORE_NATIVE_SYSROOT/${base_prefix} \
+                        MAGIC=$OECORE_NATIVE_SYSROOT/${datadir}/misc/magic.mgc \
                         RPM_NO_CHROOT_FOR_SCRIPTS=1
         done
 
+        sed -i -e 's:\/usr\/lib\/rpm\/:$OECORE_NATIVE_SYSROOT\/usr\/lib\/rpm\/:' ${D}${libdir}/rpm/find-provides
+        sed -i -e 's:\/usr\/lib\/rpm\/:$OECORE_NATIVE_SYSROOT\/usr\/lib\/rpm\/:' ${D}${libdir}/rpm/find-requires
+
         rm -rf ${D}/var
 }
 
-- 
1.9.1


