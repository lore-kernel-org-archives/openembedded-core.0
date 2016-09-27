Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1085F60190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E3CC72091B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:40:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 2XAUnQ-YUd82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:40:46 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-110-130.washdc.fios.verizon.net
	[100.15.110.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB2B5202B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:40:46 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 4B80116214D; Tue, 27 Sep 2016 15:40:46 -0400 (EDT)
Date: Tue, 27 Sep 2016 15:40:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160927194046.GA19346@denix.org>
References: <1475004335-22336-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1475004335-22336-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [krogoth][PATCH] libarchive: respect disable-acl configuration option
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
X-List-Received-Date: Tue, 27 Sep 2016 19:40:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 27, 2016 at 03:25:35PM -0400, Denys Dmytriyenko wrote:
> From: "Maxin B. John" <maxin.john@intel.com>
> 
> Update configure.ac to properly handle --disable-acl option
> 
> [YOCTO #9668]

FYI, last night's updates to krogoth invalidated most of my sstate cache and 
this issue re-surfaced again and broke half of my builds...


> (From OE-Core rev: 84fe3f29f2bdaf98c9beefdfede143084fba093b)
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...c-check-acl-libacl.h-and-sys-acl.h-based-.patch | 66 ++++++++++++++++++++++
>  .../libarchive/libarchive_3.1.2.bb                 |  1 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch b/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
> new file mode 100644
> index 0000000..4b41d62
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
> @@ -0,0 +1,66 @@
> +From b30c530aaf5068a652a479f3e46c74eb1716861a Mon Sep 17 00:00:00 2001
> +From: "Maxin B. John" <maxin.john@intel.com>
> +Date: Thu, 2 Jun 2016 16:08:02 +0300
> +Subject: [PATCH] configure.ac: check acl/libacl.h and sys/acl.h based on
> + requirement
> +
> +acl/libacl.h and sys/acl.h check should not happen when we explicitly
> +disable it with --disable-acl.
> +
> +Similarly, update attr/xattr.h for --disable-xattr option.
> +
> +Update the help texts to reflect what it really does.
> +
> +Upstream-Status: Accepted
> +
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +---
> + configure.ac | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index cb6943f..0638182 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -252,7 +252,7 @@ esac
> + # Checks for header files.
> + AC_HEADER_DIRENT
> + AC_HEADER_SYS_WAIT
> +-AC_CHECK_HEADERS([acl/libacl.h attr/xattr.h copyfile.h ctype.h])
> ++AC_CHECK_HEADERS([copyfile.h ctype.h])
> + AC_CHECK_HEADERS([errno.h ext2fs/ext2_fs.h fcntl.h grp.h])
> + 
> + AC_CACHE_CHECK([whether EXT2_IOC_GETFLAGS is usable],
> +@@ -272,7 +272,7 @@ AC_CHECK_HEADERS([linux/fiemap.h linux/fs.h linux/magic.h linux/types.h])
> + AC_CHECK_HEADERS([locale.h paths.h poll.h pthread.h pwd.h])
> + AC_CHECK_HEADERS([readpassphrase.h signal.h spawn.h])
> + AC_CHECK_HEADERS([stdarg.h stdint.h stdlib.h string.h])
> +-AC_CHECK_HEADERS([sys/acl.h sys/cdefs.h sys/extattr.h])
> ++AC_CHECK_HEADERS([sys/cdefs.h sys/extattr.h])
> + AC_CHECK_HEADERS([sys/ioctl.h sys/mkdev.h sys/mount.h])
> + AC_CHECK_HEADERS([sys/param.h sys/poll.h sys/select.h sys/statfs.h sys/statvfs.h])
> + AC_CHECK_HEADERS([sys/time.h sys/utime.h sys/utsname.h sys/vfs.h])
> +@@ -644,7 +644,7 @@ AC_CHECK_MEMBER(struct dirent.d_namlen,,,
> + # Check for Extended Attributes support
> + AC_ARG_ENABLE([xattr],
> + 		AS_HELP_STRING([--disable-xattr],
> +-		[Enable Extended Attributes support (default: check)]))
> ++		[Disable Extended Attributes support (default: check)]))
> + 
> + if test "x$enable_xattr" != "xno"; then
> + 	AC_CHECK_HEADERS([attr/xattr.h])
> +@@ -670,9 +670,10 @@ fi
> + #
> + AC_ARG_ENABLE([acl],
> + 		AS_HELP_STRING([--disable-acl],
> +-		[Enable ACL support (default: check)]))
> ++		[Disable ACL support (default: check)]))
> + 
> + if test "x$enable_acl" != "xno"; then
> ++   AC_CHECK_HEADERS([acl/libacl.h])
> +    AC_CHECK_HEADERS([sys/acl.h])
> +    AC_CHECK_LIB([acl],[acl_get_file])
> +    AC_CHECK_FUNCS([acl_create_entry acl_init acl_set_fd acl_set_fd_np acl_set_file])
> +-- 
> +2.4.0
> +
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> index ed677ac..e388226 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> @@ -36,6 +36,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
>             file://libarchive-CVE-2015-2304.patch \
>             file://mkdir.patch \
>             file://0001-Set-xattrs-after-setting-times.patch \
> +           file://0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch \
>             "
>  
>  SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

