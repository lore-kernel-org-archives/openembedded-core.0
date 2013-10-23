Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD3A6D183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 18:33:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9NIXKTd026027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 11:33:20 -0700 (PDT)
Received: from yow-kscherer-l1.wrs.com (128.224.147.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 23 Oct 2013 11:33:20 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2013 14:33:18 -0400
Message-ID: <1382553198-11119-2-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382553198-11119-1-git-send-email-konrad.scherer@windriver.com>
References: <1382553198-11119-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] pixbufcache.bbclass: gdk-pixbuf-query-loaders depends on libz
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
X-List-Received-Date: Wed, 23 Oct 2013 18:33:19 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

ldd sysroots/x86_64-linux/usr/bin/gdk-pixbuf-query-loaders.real
<snip>
libz.so.1 => /sysroots/x86_64-linux/usr/bin/../../usr/lib/libz.so.1 (0x00007fab55393000)

If zlib-native has not been unpacked, host libz is used which can fail.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index d46a8ba..0fe5163 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -65,5 +65,5 @@ pixbufcache_sstate_postinst() {
 # Packages that use this class should extend this variable with their runtime
 # dependencies.
 PIXBUFCACHE_SYSROOT_DEPS = ""
-PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene"
+PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene"
 do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
-- 
1.8.1.2


