Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmVS0-0001e1-4c
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 21:13:40 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so3080921eek.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3wAmkxrlpbsB4zJN8iJ/fGtlSUYpp54TJHeYjL9MC2o=;
	b=M1qCLBKsI+VksQvpwGhKagK+Frj71NLw/l+P806t2oMJZLaJ5r8flMWJWfWenKxiLp
	J6wT/vWD/HgoHcepAtuOqYUNnNlEdhohwHwjNic+tPw3WiH7Af7kMyaKvwaaEPTm6zcW
	ZqEQ3AGCmvWjXp4C2rj3TK7fKEq4ZdwTs2XUVoi10pp36Y1gRsHNYtOWhWpx9HTyJ0r3
	aBe9sGydeAvWlq3WKPCYmZTy/kQmLiYAhZaoKfxyheCXSrwgazTGE2IsuL+DZI1XJPb8
	9Hlmbn3h0gE8ZL4foYE46r4wZXPZomG7NxedD2II/tKbm7xzFT+NojXmGKB3qLxwYnoT
	bliQ==
X-Received: by 10.14.0.3 with SMTP id 3mr42147557eea.16.1356206332492;
	Sat, 22 Dec 2012 11:58:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm30153987eeg.4.2012.12.22.11.58.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 11:58:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Dec 2012 20:58:49 +0100
Message-Id: <1356206329-12627-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] gtk-icon-cache: don't call gtk-update-icon-cache on files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Dec 2012 20:13:40 -0000

* check if icondir is directory before calling gtk-update-icon-cache, like all other calls do
* fixes:
  | > Executing update_icon_cache
  | + chmod +x update_icon_cache
  | + ./update_icon_cache
  | gtk-update-icon-cache.real: Failed to open file /tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-image-all/2.0-r20/rootfs/usr/share/icons/enjoy.png/.icon-theme.cache : Not a directory
  | gtk-update-icon-cache.real: Failed to open file /tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-image-all/2.0-r20/rootfs/usr/share/icons/monav.png/.icon-theme.cache : Not a directory
  | gtk-update-icon-cache.real: Failed to open file /tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-image-all/2.0-r20/rootfs/usr/share/icons/orrery.png/.icon-theme.cache : Not a directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/gtk-icon-cache.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index f87a30f..7c7dd78 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -12,7 +12,9 @@ if [ "x$D" != "x" ]; then
 gdk-pixbuf-query-loaders --update-cache
 
 for icondir in $D/usr/share/icons/*/ ; do
-	gtk-update-icon-cache -fqt  $icondir
+    if [ -d $icondir ] ; then
+        gtk-update-icon-cache -fqt  $icondir
+    fi
 done
 EOF
     fi
-- 
1.8.0.2



