Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <xiao.zhang@windriver.com>) id 1UcvG4-0005Z4-Ur
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 12:18:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4G9xj5d021546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 02:59:45 -0700 (PDT)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 16 May 2013 02:59:44 -0700
Message-ID: <5194AE0D.8030508@windriver.com>
Date: Thu, 16 May 2013 17:59:41 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1368689187-4714-1-git-send-email-xiao.zhang@windriver.com>
	<1368689187-4714-2-git-send-email-xiao.zhang@windriver.com>
In-Reply-To: <1368689187-4714-2-git-send-email-xiao.zhang@windriver.com>
X-Originating-IP: [128.224.162.169]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r4G9xj5d021546
Subject: Re: [PATCH] util-linux: replace package files
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
X-List-Received-Date: Thu, 16 May 2013 10:18:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

And, another method lies on meta/recipes-core/util-linux/util-linux.inc:
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -69,11 +69,11 @@ FILES_util-linux-uuidd =3D "${sbindir}/uuidd"
  FILES_util-linux-reset =3D "${base_bindir}/reset"

  FILES_util-linux-libblkid =3D "${base_libdir}/libblkid.so.*"
-FILES_util-linux-libblkid-dev =3D "${base_libdir}/libblkid.so=20
${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.=
pc"
+FILES_util-linux-libblkid-dev =3D "${libdir}/libblkid.so=20
${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.=
pc"
  FILES_util-linux-libmount =3D "${base_libdir}/libmount.so.*"
-FILES_util-linux-libmount-dev =3D "${base_libdir}/libmount.so=20
${base_libdir}/libmount.la ${includedir}/libmount=20
${libdir}/pkgconfig/mount.pc"
+FILES_util-linux-libmount-dev =3D "${libdir}/libmount.so=20
${base_libdir}/libmount.la ${includedir}/libmount=20
${libdir}/pkgconfig/mount.pc"
  FILES_util-linux-libuuid =3D "${base_libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev =3D "${base_libdir}/libuuid.so=20
${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
+FILES_util-linux-libuuid-dev =3D "${libdir}/libuuid.so=20
${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
  FILES_util-linux-lscpu =3D "${bindir}/lscpu"

  FILES_util-linux-fsck =3D "${base_sbindir}/fsck*"

Which one is better?

Thanks
Xiao

On 2013=E5=B9=B405=E6=9C=8816=E6=97=A5 15:26, Zhang Xiao wrote:
> Move libuuid.so, libmount.so and libblkid.so from util-linux's dev RPM
> package to related library's dev RPM packages.
>
> [YOCTO #4500]
> [CQID: WIND00412705]
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>   .../util-linux-replace-package-files.patch         |   56 +++++++++++=
+++++++++
>   meta/recipes-core/util-linux/util-linux_2.22.2.bb  |    1 +
>   2 files changed, 57 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux=
-replace-package-files.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-replace=
-package-files.patch b/meta/recipes-core/util-linux/util-linux/util-linux=
-replace-package-files.patch
> new file mode 100644
> index 0000000..32868cc
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/util-linux-replace-packag=
e-files.patch
> @@ -0,0 +1,56 @@
> +Upstream-Status: Pending
> +Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> +
> +Move libuuid.so, libmount.so and libblkid.so from util-linux's dev RPM
> +package to related library's dev RPM packages.
> +---
> + libblkid/src/Makemodule.am |    6 +-----
> + libmount/src/Makemodule.am |    6 +-----
> + libuuid/src/Makemodule.am  |    6 +-----
> + 3 files changed, 3 insertions(+), 15 deletions(-)
> +
> +--- util-linux-2.22.2/libuuid/src/Makemodule.am.orig
> ++++ util-linux-2.22.2/libuuid/src/Makemodule.am
> +@@ -42,11 +42,7 @@ install-exec-hook-libuuid:
> + 	if test "$(usrlib_execdir)" !=3D "$(libdir)"; then \
> + 		mkdir -p $(DESTDIR)$(libdir); \
> + 		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so.* $(DESTDIR)$(libdir); \
> +-		so_img_name=3D$$(readlink $(DESTDIR)$(usrlib_execdir)/libuuid.so); =
\
> +-		so_img_rel_target=3D$$(echo $(usrlib_execdir) | sed 's,\(^/\|\)[^/]=
[^/]*,..,g'); \
> +-		(cd $(DESTDIR)$(usrlib_execdir) && \
> +-			rm -f libuuid.so && \
> +-			$(LN_S) $$so_img_rel_target$(libdir)/$$so_img_name libuuid.so); \
> ++		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so $(DESTDIR)$(libdir); \
> + 	fi
> +
> + uninstall-hook-libuuid:
> +--- util-linux-2.22.2/libmount/src/Makemodule.am.orig
> ++++ util-linux-2.22.2/libmount/src/Makemodule.am
> +@@ -123,11 +123,7 @@ install-exec-hook-libmount:
> + 	if test "$(usrlib_execdir)" !=3D "$(libdir)"; then \
> + 		mkdir -p $(DESTDIR)$(libdir); \
> + 		mv $(DESTDIR)$(usrlib_execdir)/libmount.so.* $(DESTDIR)$(libdir); \
> +-		so_img_name=3D$$(readlink $(DESTDIR)$(usrlib_execdir)/libmount.so);=
 \
> +-		so_img_rel_target=3D$$(echo $(usrlib_execdir) | sed 's,\(^/\|\)[^/]=
[^/]*,..,g'); \
> +-		(cd $(DESTDIR)$(usrlib_execdir) && \
> +-			rm -f libmount.so && \
> +-			$(LN_S) $$so_img_rel_target$(libdir)/$$so_img_name libmount.so); \
> ++		mv $(DESTDIR)$(usrlib_execdir)/libmount.so $(DESTDIR)$(libdir); \
> + 	fi
> +
> + uninstall-hook-libmount:
> +--- util-linux-2.22.2/libblkid/src/Makemodule.am.orig
> ++++ util-linux-2.22.2/libblkid/src/Makemodule.am
> +@@ -219,11 +219,7 @@ install-exec-hook-libblkid:
> + 	if test "$(usrlib_execdir)" !=3D "$(libdir)"; then \
> + 		mkdir -p $(DESTDIR)$(libdir); \
> + 		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so.* $(DESTDIR)$(libdir); \
> +-		so_img_name=3D$$(readlink $(DESTDIR)$(usrlib_execdir)/libblkid.so);=
 \
> +-		so_img_rel_target=3D$$(echo $(usrlib_execdir) | sed 's,\(^/\|\)[^/]=
[^/]*,..,g'); \
> +-		(cd $(DESTDIR)$(usrlib_execdir) && \
> +-			rm -f libblkid.so && \
> +-			$(LN_S) $$so_img_rel_target$(libdir)/$$so_img_name libblkid.so); \
> ++		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so $(DESTDIR)$(libdir); \
> + 	fi
> +
> + uninstall-hook-libblkid:
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/r=
ecipes-core/util-linux/util-linux_2.22.2.bb
> index 43a55a6..526308d 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -8,6 +8,7 @@ SRC_URI +=3D "file://util-linux-ng-replace-siginterrupt=
.patch \
>               file://configure-sbindir.patch \
>               file://fix-configure.patch \
>               file://mbsalign-license.patch \
> +            file://util-linux-replace-package-files.patch \
>   "
>
>   SRC_URI[md5sum] =3D "3e379b4d8b9693948d751c154614c73e"
>


