Return-Path: <f.riccardo87@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B81847D7A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:14:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y5so4416909wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=9+uD0KYmk6JcNMGut5YJE67BJFiUE3l/rSRv8GkRQ94=;
	b=f8UOrz7BxhynPvl+AsZdjwazTmwEuDoyv10RLjvfPaElJSGONzA/i2BPW+e6EIRHaz
	FxI5Jw6+PBOrm0EIq+iOG9UCCOI37OyyikBUiqoY8P5eoxXbXezbmcM3jee7lEsPipky
	y+uNj3C78WkcQVVYlHfa7P5ZMG4084HEJf17+NUJ+GycfkJC3+p3PVakO/72uVAsUV5r
	a9YsMQIynGNnRBp7zeUxWrQYlMu3kPs3h6O80qsBkg6Q3JZkphHp8l4qKheHYHSdjw2D
	JykuVYENdCM1Vlwn5FLyZl4Q3OxynNjnlAgPuavOxcFGZrClxjLiTBi6M2qqctiCvAhE
	PVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=9+uD0KYmk6JcNMGut5YJE67BJFiUE3l/rSRv8GkRQ94=;
	b=ODA5W2FYYvG8l/3WMVAk8K3/hfH9KqOBfy1vwmJVEwliCfqH9uuPgOh7PuOnO/GMmQ
	IhkSueHEdyfuayQxLFhjFUASZ/ZNOmvAIFSo2LiXT18zRRO9/bHBH9n20YGLlz9GrFK/
	IjS5fzjjfvJgtrXucKSRr3o1tSzeHJ2zkX/v6hDKdB3M0gdodYh5DgawyC/bE0zjHVPY
	bA6GvjUzu8yhIZK3P8CoHZhvDv06nBJCmWUutYByqwaTDlgwReyMymhOc7e567+5zBQ8
	jXYapptAyQQtbPuhjmSjT4A2GmupNj+JkX5oSB1dTQfIhRWKue4522v9NlJzmBSTuAuw
	yt3g==
X-Gm-Message-State: APjAAAUkq8B+gw1L0UkYihvdHZ/nHR54S8HPEjktqyYNQb4vqIoDQu1+
	i7/3HrYYJBHaoGVQO5XbjupWYl5hsY8=
X-Google-Smtp-Source: APXvYqziaHFH8eYdNLZwu4Y85P1Mu0SfH1PoDXcWWbemmsW+4f4pcej7DSVGE16zrO+PyVXU03hzwg==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr4046821wmc.100.1556831673196; 
	Thu, 02 May 2019 14:14:33 -0700 (PDT)
Received: from [192.168.1.8]
	(host209-241-dynamic.5-87-r.retail.telecomitalia.it. [87.5.241.209])
	by smtp.gmail.com with ESMTPSA id t67sm521698wmg.0.2019.05.02.14.14.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:14:31 -0700 (PDT)
From: Riccardo Ferrazzo <f.riccardo87@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Message-Id: <F78124D8-05AD-4380-99AD-965085B21A8B@gmail.com>
Date: Thu, 2 May 2019 23:14:30 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.104.8)
Subject: [PATCH] wic: allow to create a rootfs subdir partition
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
X-List-Received-Date: Thu, 02 May 2019 21:14:33 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Allows to create a rootfs partition starting from a subdirectory of the =
rootfs.
The subdirectory path can be specified as a `sourceparams` value in the =
form `subdir=3D<path>`.
The path can either start with `/` or not. It will be treated as =
relative  to the rootfs anyway.
Cannot specify a path outside the rootfs folder.

Signed-off-by: Riccardo Ferrazzo <f.riccardo87@gmail.com>
---
scripts/lib/wic/plugins/source/rootfs.py | 39 ++++++++++++++++--------
1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py =
b/scripts/lib/wic/plugins/source/rootfs.py
index aec720fb22..6193ed273f 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -46,17 +46,29 @@ class RootfsPlugin(SourcePlugin):
    name =3D 'rootfs'

    @staticmethod
-    def __get_rootfs_dir(rootfs_dir):
-        if os.path.isdir(rootfs_dir):
-            return os.path.realpath(rootfs_dir)
-
-        image_rootfs_dir =3D get_bitbake_var("IMAGE_ROOTFS", =
rootfs_dir)
-        if not os.path.isdir(image_rootfs_dir):
-            raise WicError("No valid artifact IMAGE_ROOTFS from image "
-                           "named %s has been found at %s, exiting." %
-                           (rootfs_dir, image_rootfs_dir))
-
-        return os.path.realpath(image_rootfs_dir)
+    def __get_rootfs_dir(rootfs_dir, subdir):
+        real_rootfs=3DTrue
+
+        if not os.path.isdir(rootfs_dir):
+            image_rootfs_dir =3D get_bitbake_var("IMAGE_ROOTFS", =
rootfs_dir)
+            if not os.path.isdir(image_rootfs_dir):
+                raise WicError("No valid artifact IMAGE_ROOTFS from =
image "
+                               "named %s has been found at %s, =
exiting." %
+                               (rootfs_dir, image_rootfs_dir))
+            rootfs_dir =3D image_rootfs_dir
+
+        if subdir:
+            real_rootfs =3D False
+            subdir =3D subdir[1:] if subdir.startswith("/") else subdir
+            sub_rootfs_dir =3D os.path.join(rootfs_dir, subdir)
+            if not sub_rootfs_dir.startswith(rootfs_dir):
+                raise WicError("'%s' points to a path outside the =
rootfs" % (subdir,))
+            if not os.path.isdir(sub_rootfs_dir):
+                raise WicError("Couldn't find subdir=3D%s in rootfs %s" =
%
+                               (subdir, rootfs_dir))
+            rootfs_dir =3D sub_rootfs_dir
+
+        return (os.path.realpath(rootfs_dir), real_rootfs)

    @classmethod
    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
@@ -81,7 +93,8 @@ class RootfsPlugin(SourcePlugin):
                raise WicError("Couldn't find --rootfs-dir=3D%s =
connection or "
                               "it is not a valid path, exiting" % =
part.rootfs_dir)

-        part.rootfs_dir =3D cls.__get_rootfs_dir(rootfs_dir)
+        part.rootfs_dir, real_rootfs =3D =
cls.__get_rootfs_dir(rootfs_dir,
+                                                            =
source_params.get("subdir", ""))

        new_rootfs =3D None
        # Handle excluded paths.
@@ -123,4 +136,4 @@ class RootfsPlugin(SourcePlugin):
                    shutil.rmtree(full_path)

        part.prepare_rootfs(cr_workdir, oe_builddir,
-                            new_rootfs or part.rootfs_dir, =
native_sysroot)
+                            new_rootfs or part.rootfs_dir, =
native_sysroot, real_rootfs)
--
2.21.0


