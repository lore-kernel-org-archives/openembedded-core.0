Return-Path: <gauvin.patrick@gmail.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9717FE20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 14:40:20 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id j5so1126021uak.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=vqWd6xF9GScA8qTokBWRZEoX+g/Bj3uphY8v4lIM5og=;
	b=IU0fkBS3TUw2v95PT4c9ygckurlJxDGPQ7FeE/Lh5HKUe8K34k0NhH2QG6L2q/31RW
	s7v57sS0hJsW5CC7E4s+/ligZJZWcFPNkq1KAYZ3kFi0MkqQ653I8VXm2Dp2WvW5wpkN
	Ib0gLGt9UYCn+DEBn9G+FzXsgDclKJ3s1spb6P7OzCtfEw9FGX707HCoC/P0/mQ9Flt/
	COB4GMD73fhyA6aHLjuV2H2Q6A3fmlYog/U7Jc0FEbVT18hyfcHfGDOBe/+MoSYGcujc
	QWN2p7RxDbMoCh4fLknQnBUJrjWNGhk8PQmsZeGQf1jWa/tONV1iQqIsLtfOv+kqXYG/
	CXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vqWd6xF9GScA8qTokBWRZEoX+g/Bj3uphY8v4lIM5og=;
	b=osnd2bwKc6knDPY5HTRhEcEoAY6MtXUT3/bGoN3JjEu+paFqR/I0q0Yd//CaIeGc55
	QPKdsI/tKYzvkW5LDWaHMbPqWXBWoW7v9CAjresOBldzQpZXJVRMDHZQX37M4utRl0zj
	BPdA6eKcacTOX2mGwOqglw5/hQNIkby80ktQKt3lH9MsrPwPzaG5xiL+ZgqwXoQY6t/6
	/zYGWIPhP+ubwtnqEs5TN+CJXKyFI4+iAq4jjb9T65ZK45KxAYkGa6r4uQfdai3kG3Mc
	l557vqrUlORmTnGx6HPrHE7KJNadda4UbQL/baZS5EzW8M/1pERdnjXD46xNEk/jKpJm
	ucVA==
X-Gm-Message-State: APjAAAV/369Dfz38km+jOGrnyMoO9ZC4PEksDTXF0TnYyNeJGfVdks+p
	PCS1rJJOXAoTVOHhKqzwnp2qKWymefuuTVVzFbM7RTnuvSY=
X-Google-Smtp-Source: APXvYqwPfgbmkWI2cqwK+aVNnozQ9P2mGVmWOqy3zyGfRyczWYJob2uDBe/C1xnUQtdd4UKPzEhK2SLAD25Cdg5xSSA=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr5144148uak.71.1568904021058;
	Thu, 19 Sep 2019 07:40:21 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Gauvin <gauvin.patrick@gmail.com>
Date: Thu, 19 Sep 2019 10:40:10 -0400
Message-ID: <CAOw9cT94wE_Uqz7StfMEsP=Kj1gswzQWe9pTdC8MDtUh21J=Qw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Create partition with a subset of a file system with WIC
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
X-List-Received-Date: Thu, 19 Sep 2019 14:40:20 -0000
Content-Type: multipart/alternative; boundary="000000000000dca7c10592e8ee18"

--000000000000dca7c10592e8ee18
Content-Type: text/plain; charset="UTF-8"

Hello,

I added a feature to wic. It can create a partition from a subdirectory of
an image and preserves permissions, the owner and the group of the files.
Here's an exemple on how I use it in a wks file to create a different
partition for the home directory.

part /home --source rootfs --rootfs-dir=core-image-base:/home --size 500
--ondisk mmcblk --fstype=ext4 --label APPS --align 4096

Here is the patch.

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 3da7e23..580abcb 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -202,7 +202,7 @@ class Partition():
                            (self.mountpoint, self.size, self.fixed_size))

     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
-                       native_sysroot, real_rootfs = True):
+                       native_sysroot, real_rootfs = True, folder = ""):
         """
         Prepare content for a rootfs partition i.e. create a partition
         and fill it from a /rootfs dir.
@@ -241,7 +241,7 @@ class Partition():

         prefix = "ext" if self.fstype.startswith("ext") else self.fstype
         method = getattr(self, "prepare_rootfs_" + prefix)
-        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
+        method(rootfs, oe_builddir, rootfs_dir + folder, native_sysroot,
pseudo)
         self.source_file = rootfs

         # get the rootfs size in the right units for kickstart (kB)
diff --git a/scripts/lib/wic/plugins/source/rootfs.py
b/scripts/lib/wic/plugins/source/rootfs.py
index aec720f..8861156 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -81,6 +81,13 @@ class RootfsPlugin(SourcePlugin):
                 raise WicError("Couldn't find --rootfs-dir=%s connection
or "
                                "it is not a valid path, exiting" %
part.rootfs_dir)

+        # You can select the subfolder of an image by using ":" to
separate the image name and the sub folder name.
+        # i.e. --rootfs-dir=core-image-base:/home
+        folder = ""
+        folder_index = rootfs_dir.find(":")
+        if folder_index >= 0:
+            folder = rootfs_dir[folder_index + 1:]
+            rootfs_dir = rootfs_dir[:folder_index]
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)

         new_rootfs = None
@@ -123,4 +130,4 @@ class RootfsPlugin(SourcePlugin):
                     shutil.rmtree(full_path)

         part.prepare_rootfs(cr_workdir, oe_builddir,
-                            new_rootfs or part.rootfs_dir, native_sysroot)
+                            new_rootfs or part.rootfs_dir, native_sysroot,
True, folder)

I hope you will consider adding it to wic.

Thank you.
-- 
Patrick Gauvin

--000000000000dca7c10592e8ee18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div></div><div><br></div><div>I added a =
feature to wic. It can create a partition from a subdirectory of an image a=
nd preserves permissions, the owner and the group of the files. Here&#39;s =
an exemple on how I use it in a wks file to create a different partition fo=
r the home directory.</div><div><br>part /home --source rootfs --rootfs-dir=
=3Dcore-image-base:/home --size 500 --ondisk mmcblk --fstype=3Dext4 --label=
 APPS --align 4096<br></div><div><br></div><div>Here is the patch.</div><di=
v><br></div><div>diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wi=
c/partition.py<br>index 3da7e23..580abcb 100644<br>--- a/scripts/lib/wic/pa=
rtition.py<br>+++ b/scripts/lib/wic/partition.py<br>@@ -202,7 +202,7 @@ cla=
ss Partition():<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (self.mountpoint, self.size, self=
.fixed_size))<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0def prepare_rootfs(self, cr_=
workdir, oe_builddir, rootfs_dir,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, real_rootfs =3D T=
rue):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 native_sysroot, real_rootfs =3D True, folder =3D &quot;&quot;=
):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Prepare content for a rootfs partition i.e. create a p=
artition<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and fill it from a /rootfs di=
r.<br>@@ -241,7 +241,7 @@ class Partition():<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0prefix =3D &quot;ext&quot; if self.fstype.startswith(&quot=
;ext&quot;) else self.fstype<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =
=3D getattr(self, &quot;prepare_rootfs_&quot; + prefix)<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo=
)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0method(rootfs, oe_builddir, rootfs_dir + =
folder, native_sysroot, pseudo)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.s=
ource_file =3D rootfs<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# get =
the rootfs size in the right units for kickstart (kB)<br>diff --git a/scrip=
ts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs=
.py<br>index aec720f..8861156 100644<br>--- a/scripts/lib/wic/plugins/sourc=
e/rootfs.py<br>+++ b/scripts/lib/wic/plugins/source/rootfs.py<br>@@ -81,6 +=
81,13 @@ class RootfsPlugin(SourcePlugin):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicError(&quot;Couldn&#39;t find --=
rootfs-dir=3D%s connection or &quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;it is not a valid path, exiting&quot; % part.rootfs_dir)<br>=C2=
=A0<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# You can select the subfolder of an im=
age by using &quot;:&quot; to separate the image name and the sub folder na=
me.<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# i.e. --rootfs-dir=3Dcore-image-base:/=
home<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0folder =3D &quot;&quot;<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0folder_index =3D rootfs_dir.find(&quot;:&quot;)<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if folder_index &gt;=3D 0:<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0folder =3D rootfs_dir[folder_index + 1:]<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_dir =3D rootfs_dir[:folder_=
index]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.rootfs_dir =3D cls.__get_r=
ootfs_dir(rootfs_dir)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_ro=
otfs =3D None<br>@@ -123,4 +130,4 @@ class RootfsPlugin(SourcePlugin):<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0shutil.rmtree(full_path)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
part.prepare_rootfs(cr_workdir, oe_builddir,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ne=
w_rootfs or part.rootfs_dir, native_sysroot)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ne=
w_rootfs or part.rootfs_dir, native_sysroot, True, folder)<br></div><div><b=
r></div><div>I hope you will consider adding it to wic.</div><div><br></div=
><div>Thank you.</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">Patrick Gauvin</div></div>

--000000000000dca7c10592e8ee18--
