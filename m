Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2E970507
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 12:40:36 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id 10so1517565lbg.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=0LoGug89nJrJYIbNNWBZeIITGUV1spBVMEBlm9VtW5s=;
	b=YhzwiRmhlag+o4aCtgDguaPr9snHuhvU827/6pd9mls/UrjWO7QeejnCOORy9gOuHK
	5PEpZu0bzCK1HVQJFfQwEGewBtFrgfKH94d5NwSmgZhJ4j8bG0y8eGUt3p56uNY6ahZ7
	4LKH2uZ04pvihBGIWu/IzDQzSdg0WJEFHbODjAXpJ7EemrXNYFbloBww67mpX8HhNohW
	oaGaVmLBDbKo2uvWVsAvHckWJT34pDzBLwVHNdpJLwE4SHDiH2UJaPwX/ZCDaRswRgsM
	ACfzCFZ9LyfMjECFJlTqWjShLn5gev5ZiHFwcKsJKqAMSwK+Cce/io2eqMa6A34Wg72/
	bXjw==
X-Received: by 10.152.206.105 with SMTP id ln9mr26603011lac.45.1405946436754; 
	Mon, 21 Jul 2014 05:40:36 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	qv5sm25030139lbb.19.2014.07.21.05.40.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 05:40:36 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 14:39:09 +0200
Message-Id: <1405946349-16124-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] pixbufcache: Add missing dependency on jpeg-native
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
X-List-Received-Date: Mon, 21 Jul 2014 12:40:42 -0000

gdk-pixbuf-native uses png and jpeg loaders. When updating the
loader-cache, these needs to be already populated in the sysroot.

Although png was present, the jpeg dependency was missing, so add it.

Fixes:
  DEBUG: Executing shell function pixbufcache_sstate_postinst
  g_module_open() failed for <snip>/libpixbufloader-jpeg.so:
    libjpeg.so.8: cannot open shared object file: No such file or directory

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index b8d75bd..418ace0 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -67,6 +67,6 @@ pixbufcache_sstate_postinst() {
 # Packages that use this class should extend this variable with their runtime
 # dependencies.
 PIXBUFCACHE_SYSROOT_DEPS = ""
-PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene"
+PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene jpeg-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene"
 do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
 do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene','')}"
-- 
1.9.3


