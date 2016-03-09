Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD4FA73167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 22:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29MnFL2026444 for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 22:49:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Rsps60u_m5Mt
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 22:49:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29Mn2nO026427
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 22:49:03 GMT
Message-ID: <1457563742.2804.193.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Mar 2016 22:49:02 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] qemu: Limit paths searched during user mode emulation
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
X-List-Received-Date: Wed, 09 Mar 2016 22:49:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

By default qemu builds a complete list of directories within the user
emulation sysroot (-L option). The OE sysroot directory is large and
this is confusing, for example it indexes all pkgdata. In particular this
confuses strace of qemu binaries with tons of irrelevant paths.

This patch stops the code indexing up front and instead only indexes
things if/as/when it needs to. This drastically reduces the files it
reads and reduces memory usage and cleans up strace.

It would also avoid the infinite directory traversal bug in [YOCTO #6996]
although the code could still be vulnerable if it parsed those specific
paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu/pathlimit.patch b/meta/recipes-devtools/qemu/qemu/pathlimit.patch
new file mode 100644
index 0000000..e8e5151
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/pathlimit.patch
@@ -0,0 +1,90 @@
+By default qemu builds a complete list of directories within the user
+emulation sysroot (-L option). The OE sysroot directory is large and
+this is confusing, for example it indexes all pkgdata. In particular this
+confuses strace of qemu binaries with tons of irrelevant paths.
+
+This patch stops the code indexing up front and instead only indexes
+things if/as/when it needs to. This drastically reduces the files it
+reads and reduces memory usage and cleans up strace.
+
+It would also avoid the infinite directory traversal bug in [YOCTO #6996]
+although the code could still be vulnerable if it parsed those specific 
+paths.
+
+RP
+2016/3/9
+Upstream-Status: Pending
+
+Index: qemu-2.5.0/util/path.c
+===================================================================
+--- qemu-2.5.0.orig/util/path.c
++++ qemu-2.5.0/util/path.c
+@@ -19,6 +19,7 @@ struct pathelem
+     char *name;
+     /* Full path name, eg. /usr/gnemul/x86-linux/lib. */
+     char *pathname;
++    int populated_entries;
+     struct pathelem *parent;
+     /* Children */
+     unsigned int num_entries;
+@@ -49,6 +50,7 @@ static struct pathelem *new_entry(const
+     new->name = g_strdup(name);
+     new->pathname = g_strdup_printf("%s/%s", root, name);
+     new->num_entries = 0;
++    new->populated_entries = 0;
+     return new;
+ }
+ 
+@@ -57,11 +59,11 @@ static struct pathelem *new_entry(const
+ /* Not all systems provide this feature */
+ #if defined(DT_DIR) && defined(DT_UNKNOWN) && defined(DT_LNK)
+ # define dirent_type(dirent) ((dirent)->d_type)
+-# define is_dir_maybe(type) \
+-    ((type) == DT_DIR || (type) == DT_UNKNOWN || (type) == DT_LNK)
++# define is_not_dir(type) \
++    ((type) != DT_DIR && (type) != DT_UNKNOWN && (type) != DT_LNK)
+ #else
+ # define dirent_type(dirent) (1)
+-# define is_dir_maybe(type)  (type)
++# define is_not_dir(type)  (0)
+ #endif
+ 
+ static struct pathelem *add_dir_maybe(struct pathelem *path)
+@@ -78,6 +80,7 @@ static struct pathelem *add_dir_maybe(st
+         }
+         closedir(dir);
+     }
++    path->populated_entries = 1;
+     return path;
+ }
+ 
+@@ -93,8 +96,8 @@ static struct pathelem *add_entry(struct
+     e = &root->entries[root->num_entries-1];
+ 
+     *e = new_entry(root->pathname, root, name);
+-    if (is_dir_maybe(type)) {
+-        *e = add_dir_maybe(*e);
++    if (is_not_dir(type)) {
++        (*e)->populated_entries = 1;
+     }
+ 
+     return root;
+@@ -112,7 +115,7 @@ static void set_parents(struct pathelem
+ 
+ /* FIXME: Doesn't handle DIR/.. where DIR is not in emulated dir. */
+ static const char *
+-follow_path(const struct pathelem *cursor, const char *name)
++follow_path(struct pathelem *cursor, const char *name)
+ {
+     unsigned int i, namelen;
+ 
+@@ -128,6 +131,9 @@ follow_path(const struct pathelem *curso
+     if (strneq(name, namelen, "."))
+         return follow_path(cursor, name + namelen);
+ 
++    if (!cursor->populated_entries)
++        cursor = add_dir_maybe(cursor);
++
+     for (i = 0; i < cursor->num_entries; i++)
+         if (strneq(name, namelen, cursor->entries[i]->name))
+             return follow_path(cursor->entries[i], name + namelen);
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index 4398a18..e9d9a8d 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-1568.patch \
             file://CVE-2016-2197.patch \
             file://CVE-2016-2198.patch \
+            file://pathlimit.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"



