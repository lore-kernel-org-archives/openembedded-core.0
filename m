Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RE7Sc-0007zc-Pu for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 00:39:38 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CMeY76026706 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:40:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pR5uJjCfY5mH
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:40:34 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CMeVKX026692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:40:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 23:33:49 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318458837.23801.196.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] gamin: Fix glib 2.30 deprecation issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 22:39:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/gamin/gamin/noconst.patch b/meta/recipes-extended/gamin/gamin/noconst.patch
new file mode 100644
index 0000000..7b2998c
--- a/dev/null
+++ b/meta/recipes-extended/gamin/gamin/noconst.patch
@@ -0,0 +1,59 @@
+G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
+build failures.
+
+RP 2011/10/12
+
+Upstream-Status: Pending
+
+Index: gamin-0.1.10/server/gam_node.c
+===================================================================
+--- gamin-0.1.10.orig/server/gam_node.c	2011-10-12 15:25:45.217178314 +0100
++++ gamin-0.1.10/server/gam_node.c	2011-10-12 15:26:17.807178293 +0100
+@@ -122,7 +122,7 @@
+  * it has finished with the string.  If it must keep it longer, it
+  * should makes its own copy.  The returned string must not be freed.
+  */
+-G_CONST_RETURN char *
++const char *
+ gam_node_get_path(GamNode * node)
+ {
+     g_assert(node);
+Index: gamin-0.1.10/server/gam_node.h
+===================================================================
+--- gamin-0.1.10.orig/server/gam_node.h	2011-10-12 15:25:46.857178269 +0100
++++ gamin-0.1.10/server/gam_node.h	2011-10-12 15:26:28.637178297 +0100
+@@ -58,7 +58,7 @@
+ void                  gam_node_set_is_dir          (GamNode         *node,
+ 						   gboolean        is_dir);
+ 	
+-G_CONST_RETURN char  *gam_node_get_path            (GamNode         *node);
++const char  *gam_node_get_path            (GamNode         *node);
+ 
+ GList                *gam_node_get_subscriptions   (GamNode         *node);
+ 
+Index: gamin-0.1.10/server/gam_subscription.c
+===================================================================
+--- gamin-0.1.10.orig/server/gam_subscription.c	2011-10-12 15:25:40.497177525 +0100
++++ gamin-0.1.10/server/gam_subscription.c	2011-10-12 15:26:39.867178304 +0100
+@@ -141,7 +141,7 @@
+  * @param sub the GamSubscription
+  * @returns The path being monitored.  It should not be freed.
+  */
+-G_CONST_RETURN char *
++const char *
+ gam_subscription_get_path(GamSubscription * sub)
+ {
+     if (sub == NULL)
+Index: gamin-0.1.10/server/gam_subscription.h
+===================================================================
+--- gamin-0.1.10.orig/server/gam_subscription.h	2011-10-12 15:25:28.507178266 +0100
++++ gamin-0.1.10/server/gam_subscription.h	2011-10-12 15:25:58.817178285 +0100
+@@ -21,7 +21,7 @@
+ 
+ int                  gam_subscription_get_reqno    (GamSubscription *sub);
+ 
+-G_CONST_RETURN char *gam_subscription_get_path     (GamSubscription *sub);
++const char *gam_subscription_get_path     (GamSubscription *sub);
+ 
+ GamListener         *gam_subscription_get_listener (GamSubscription *sub);
+ 
diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
index 080a325..9da7e51 100644
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ b/meta/recipes-extended/gamin/gamin_0.1.10.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=412a9be54757a155d0b997b52b519f62"
 
 DEPENDS = "glib-2.0"
 PROVIDES = "fam"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz \
-           file://no-abstract-sockets.patch"
+           file://no-abstract-sockets.patch \
+           file://noconst.patch"
 
 SRC_URI[md5sum] = "b4ec549e57da470c04edd5ec2876a028"
 SRC_URI[sha256sum] = "28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1"




