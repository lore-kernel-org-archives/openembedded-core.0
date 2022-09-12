Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6193BC6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 22:19:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.2161.1663021170700697994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 15:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=miMviEFI;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id v16so23381387ejr.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 15:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=Q3pYeSaJ37xWwI7Jkcjr53aiUhvIfqMVf404+j1qWmk=;
        b=miMviEFI4fs903K3BQMxEcRF1bCCuntNw6kihM1tcIclIE2B+hJi4cfq+i+FpsNT7q
         jcCGmbqm/GEVBwFTSZjhDPvdl0bFlhPepiwg6Q4U1C1PIxVAr/em4SG5LsoUBzJD3myK
         f9TZPOYANzMHMKelgUAqIp8w9LfFek5DCZb1xA9srbd2YDLXiwwo/9Ue6Zq5CfARJ3zW
         GrbSF59Q0FkEw58jLcXn6yPreix8RmpKvbVVavrPtAGsnyjdAu0xrbouGIgaqJuLhrNb
         5lhYkdEL3wIEeLk3X6kF6w91fu/ni8A4zaO3COiAg9fOjiAjmZiYNyYxhlZtw32Jou2s
         WuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=Q3pYeSaJ37xWwI7Jkcjr53aiUhvIfqMVf404+j1qWmk=;
        b=bsvp4t8icMkJIx2y4bqRO+IqxMD/NjEzwnlcmB2/WmnqfbDAY6yf1VIwSHKs/glDTu
         9Kr3c+TknVgH8o/UxUNP/K6YF58wrvD6t9emcpCSloLn9jlDeJMQvyD1iZEKwOuGX4ir
         1eU77wyaclkSmrjg333tPmegPZyoUqKIMfxUBDz/Wo8bMm1pHRD1hlUYASkdvQWHD4s4
         lG+EDqsMeuGkop2+3cEc6jtxJ/GotdGMP/pBlHQR3rQvPVHmKMO+v55RySicUasePTNu
         zd//CI0mTKUw672gf7wMVBqi+YPNGBULSZHYAnTjJ+fRhuIAV9S1/QHE5D6tzkVram9l
         wpbw==
X-Gm-Message-State: ACgBeo1ipqRDfOvafUv+8Y3vAkdyVhwvkiPAlGtKtQ8U3hC67Si/tQBG
	QvljtmtKbHnRHMG9pTtaK8U=
X-Google-Smtp-Source: 
 AA6agR50UBBJqkiy7S6/2GzSMuxLpD1z8Jp8pvBCJhbAzzXOFUVTrLv8B/iWLoDDios8d/H1te28Pw==
X-Received: by 2002:a17:906:db0c:b0:77b:7d7d:5805 with SMTP id
 xj12-20020a170906db0c00b0077b7d7d5805mr8419243ejb.726.1663021168720;
        Mon, 12 Sep 2022 15:19:28 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170906069000b007414152ec4asm5047892ejb.163.2022.09.12.15.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 15:19:27 -0700 (PDT)
Message-ID: <7fb942a0e57211a8ae1a462706632efa872978b4.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] nfs-ganesha: Replace unfs3 with
 nfs-ganesha
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2022 00:19:26 +0200
In-Reply-To: <20220828174356.3074391-2-ptsneves@gmail.com>
References: <20220828174356.3074391-1-ptsneves@gmail.com>
	 <20220828174356.3074391-2-ptsneves@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 22:19:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170548

Hi Paulo

This looks very interesting. Is the goal here to just replace unfs3 on
a device running a Yocto-based firmware, or is the goal also to enable
the User Space NFS server for development without root privileges as
documented here:
https://docs.yoctoproject.org/dev-manual/qemu.html?highlight=runqemu+rootfs+export#running-under-a-network-file-system-nfs-server
?
Not sure if the patches would break the runqemu-export-rootfs script.
The script starts "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd".

It would be really nice if nfs-ganesha could replace unfs3 also for
this use case. From my point of view, the user space NFS based
development setup has still significant advantages over using a kernel
space NFS server. Might be that the stability of unfs3 was one reason
why many developers still prefer a kernel space NFS server for
development. But with nfs-ganesha I see a great chance to get this
fixed and the possibility to create an even better solution for NFS
booted devices than with the kernel space server.

Maybe there is an other issue with the user space NFS based setup: The
linux-yocto kernel does not contain the corresponding patch to
configure the nfs ports via the kernel command line for some time now
https://docs.yoctoproject.org/dev-manual/qemu.html?highlight=runqemu+rootfs+export#running-under-a-network-file-system-nfs-server.
However, with the current state it is still possible to run a patched
kernel for that reason. Without unfs3 this will no longer be supported.

What will be the state of the runqemu-export-rootfs script after
merging this?

Thank you and regards,
Adrian


On Sun, 2022-08-28 at 19:43 +0200, Paulo Neves wrote:
> nfs-ganesha is actively maintained in contrast with unfs3. glibc tests
> pass with nfs-ganesha.
> 
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/lib/oeqa/utils/nfs.py                    |   2 +-
>  ...ix-possible-null-pointer-dereference.patch |  38 +++++
>  ...-Workaround-for-erroneous-gcc-Werror.patch |  33 ++++
>  ...ke-nfsv3_optype-guarded-by-_USE_NFS3.patch |  35 ++++
>  .../nfs-ganesha/nfs-ganesha/module.patch      |  27 +++
>  .../nfs-ganesha/nfs-ganesha_4.0.bb            |  44 +++++
>  ...1-Add-listen-action-for-a-tcp-socket.patch |  54 ------
>  .../0001-attr-fix-utime-for-symlink.patch     |  85 ----------
>  ...0001-daemon.c-Libtirpc-porting-fixes.patch |  37 ----
>  .../unfs3/unfs3/alternate_rpc_ports.patch     | 158 ------------------
>  .../unfs3/unfs3/fix_compile_warning.patch     |  25 ---
>  ...fix_pid_race_parent_writes_child_pid.patch |  61 -------
>  .../unfs3/unfs3/no-yywrap.patch               |  14 --
>  .../unfs3/relative_max_socket_path_len.patch  |  74 --------
>  .../unfs3/unfs3/rename_fh_cache.patch         |  64 -------
>  .../unfs3/unfs3/tcp_no_delay.patch            |  56 -------
>  .../unfs3/unfs3/unfs3_parallel_build.patch    |  37 ----
>  meta/recipes-devtools/unfs3/unfs3_git.bb      |  45 -----
>  18 files changed, 178 insertions(+), 711 deletions(-)
>  create mode 100644 meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0001-Fix-possible-null-pointer-dereference.patch
>  create mode 100644 meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0002-Workaround-for-erroneous-gcc-Werror.patch
>  create mode 100644 meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0003-Make-nfsv3_optype-guarded-by-_USE_NFS3.patch
>  create mode 100644 meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/module.patch
>  create mode 100644 meta/recipes-connectivity/nfs-ganesha/nfs-ganesha_4.0.bb
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
>  delete mode 100644 meta/recipes-devtools/unfs3/unfs3_git.bb
> 
> diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
> index c1218656ce..bd947c0b88 100644
> --- a/meta/lib/oeqa/utils/nfs.py
> +++ b/meta/lib/oeqa/utils/nfs.py
> @@ -16,7 +16,7 @@ def unfs_server(directory, logger = None):
>      unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
>      if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
>          # build native tool
> -        bitbake("unfs3-native -c addto_recipe_sysroot")
> +        bitbake("nfs-ganesha-native -c addto_recipe_sysroot")
>  
>      exports = None
>      cmd = None
> diff --git a/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0001-Fix-possible-null-pointer-dereference.patch b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0001-Fix-possible-null-pointer-dereference.patch
> new file mode 100644
> index 0000000000..6c98a8a59e
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0001-Fix-possible-null-pointer-dereference.patch
> @@ -0,0 +1,38 @@
> +From e70f112dc79263298baf7a1b92c19234b8f1e506 Mon Sep 17 00:00:00 2001
> +From: Paulo Neves <ptsneves@gmail.com>
> +Date: Tue, 23 Aug 2022 14:56:44 +0200
> +Subject: [PATCH] Fix possible null pointer dereference
> +
> +If logging is enabled on nfs3_lookup, name is NULL initialized
> +and used. Assign name to a valid location before it is used.
> +
> +Upstream-Status: Submitted [https://github.com/nfs-ganesha/nfs-ganesha/pull/846]
> +
> +Change-Id: Ia1a922a1d34268a7d0b5ba97293e647ef07f8b3a
> +Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> +
> +---
> + src/Protocols/NFS/nfs3_lookup.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/src/Protocols/NFS/nfs3_lookup.c b/src/Protocols/NFS/nfs3_lookup.c
> +index da65769..97c9603 100644
> +--- a/src/Protocols/NFS/nfs3_lookup.c
> ++++ b/src/Protocols/NFS/nfs3_lookup.c
> +@@ -74,6 +74,7 @@ int nfs3_lookup(nfs_arg_t *arg, struct svc_req *req, nfs_res_t *res)
> + 	 */
> + 	fsal_prepare_attrs(&attrs, ATTRS_NFS3 | ATTR_RDATTR_ERR);
> + 
> ++	name = arg->arg_lookup3.what.name;
> + 	LogNFS3_Operation(COMPONENT_NFSPROTO, req, &arg->arg_lookup3.what.dir,
> + 			  " name: %s", name);
> + 
> +@@ -89,8 +90,6 @@ int nfs3_lookup(nfs_arg_t *arg, struct svc_req *req, nfs_res_t *res)
> + 		goto out;
> + 	}
> + 
> +-	name = arg->arg_lookup3.what.name;
> +-
> + 	fsal_status = fsal_lookup(obj_dir, name, &obj_file, &attrs);
> + 
> + 	if (FSAL_IS_ERROR(fsal_status)) {
> diff --git a/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0002-Workaround-for-erroneous-gcc-Werror.patch b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0002-Workaround-for-erroneous-gcc-Werror.patch
> new file mode 100644
> index 0000000000..97010d2a6f
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0002-Workaround-for-erroneous-gcc-Werror.patch
> @@ -0,0 +1,33 @@
> +From b8fa32c779b968fbbbe5d5dcaafa664b98cec81c Mon Sep 17 00:00:00 2001
> +From: Paulo Neves <ptsneves@gmail.com>
> +Date: Tue, 23 Aug 2022 14:59:19 +0200
> +Subject: [PATCH] Workaround for erroneous gcc Werror.
> +
> +gcc incorrectly decides that pos_len and pos_end are used
> +unninitialized. It is incorrect because the condition of their
> +use is the same as their early initialization. Apparently
> +gcc does not pick this fact and with Werror, emits an error
> +
> +Upstream-Status: Inappropriate [reason above]
> +
> +Change-Id: I30a345483b5a4bc4b5ceb46badaec3a9d27d1782
> +Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> +
> +---
> + src/Protocols/NFS/nfs_proto_tools.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/Protocols/NFS/nfs_proto_tools.c b/src/Protocols/NFS/nfs_proto_tools.c
> +index d0f628d..a741482 100644
> +--- a/src/Protocols/NFS/nfs_proto_tools.c
> ++++ b/src/Protocols/NFS/nfs_proto_tools.c
> +@@ -3688,7 +3688,8 @@ bool xdr_fattr4_encode(XDR *xdrs, struct xdr_attrs_args *args,
> + 	struct bitmap4 bitmap_encoded;
> + 	struct bitmap4 *bitmap;
> + 	/* Remember where we put the length of the attr data */
> +-	u_int pos_len, pos_end;
> ++	u_int pos_len = 0;
> ++	u_int pos_end = 0;
> + 	uint32_t attr_len = 0;
> + 
> + 	bitmap = attr_bitmap != NULL ? attr_bitmap : &bitmap_encoded;
> diff --git a/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0003-Make-nfsv3_optype-guarded-by-_USE_NFS3.patch b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0003-Make-nfsv3_optype-guarded-by-_USE_NFS3.patch
> new file mode 100644
> index 0000000000..4c622f3c64
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/0003-Make-nfsv3_optype-guarded-by-_USE_NFS3.patch
> @@ -0,0 +1,35 @@
> +From 48086cb311e37ea58de60352609e270be62ee7e8 Mon Sep 17 00:00:00 2001
> +From: Paulo Neves <ptsneves@gmail.com>
> +Date: Tue, 23 Aug 2022 22:59:46 +0200
> +Subject: [PATCH] Make nfsv3_optype guarded by _USE_NFS3
> +
> +-Wunused-variable will trigger when NFS3 is not enabled.
> +
> +Upstream-Status: Submitted [https://github.com/nfs-ganesha/nfs-ganesha/pull/846]
> +
> +Change-Id: Ib1fab2e1a59b834cda8317b2a3450e3c19437975
> +Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> +
> +---
> + src/support/server_stats.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/support/server_stats.c b/src/support/server_stats.c
> +index 19a8cac..a92b035 100644
> +--- a/src/support/server_stats.c
> ++++ b/src/support/server_stats.c
> +@@ -246,11 +246,14 @@ enum proto_op_type {
> + 	LAYOUT_OP
> + };
> + 
> ++#ifdef _USE_NFS3
> + static const uint32_t nfsv3_optype[NFS_V3_NB_COMMAND] = {
> + 	[NFSPROC3_READ] = READ_OP,
> + 	[NFSPROC3_WRITE] = WRITE_OP,
> + };
> + 
> ++#endif
> ++
> + static const uint32_t nfsv40_optype[NFS_V40_NB_OPERATION] = {
> + 	[NFS4_OP_READ] = READ_OP,
> + 	[NFS4_OP_WRITE] = WRITE_OP,
> diff --git a/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/module.patch b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/module.patch
> new file mode 100644
> index 0000000000..e096afe4ce
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha/module.patch
> @@ -0,0 +1,27 @@
> +From 4d8ec5e1b04455b3f6ca40743a298e16a57cfaa4 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross@burtonini.com>
> +Date: Fri, 5 Oct 2018 15:12:46 +0100
> +Subject: [PATCH] Install fsalmem as a module
> +
> +Upstream-Status: Submitted [https://github.com/nfs-ganesha/nfs-ganesha/pull/354]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +This isn't a shared library, it's a module.
> +
> +---
> + src/FSAL/FSAL_MEM/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/FSAL/FSAL_MEM/CMakeLists.txt b/src/FSAL/FSAL_MEM/CMakeLists.txt
> +index 0f30fff..a9191ae 100644
> +--- a/src/FSAL/FSAL_MEM/CMakeLists.txt
> ++++ b/src/FSAL/FSAL_MEM/CMakeLists.txt
> +@@ -14,7 +14,7 @@ SET(fsalmem_LIB_SRCS
> +    mem_up.c
> + )
> + 
> +-add_library(fsalmem SHARED ${fsalmem_LIB_SRCS})
> ++add_library(fsalmem MODULE ${fsalmem_LIB_SRCS})
> + add_sanitizers(fsalmem)
> + 
> + target_link_libraries(fsalmem
> diff --git a/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha_4.0.bb b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha_4.0.bb
> new file mode 100644
> index 0000000000..ea9e9b0e55
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-ganesha/nfs-ganesha_4.0.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "NFS fileserve implementation"
> +DESCRIPTION = "NFS-Ganesha is an NFSv3,v4,v4.1 fileserver that runs in user mode on most UNIX/Linux systems"
> +HOMEPAGE = "https://github.com/nfs-ganesha/nfs-ganesha/wiki"
> +LICENSE = "LGPL-3.0-only & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://src/LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> +                    file://src/cidr/LICENSE;md5=ab952b9c4b37753b18d79f305e8d8593"
> +
> +SRC_URI = "https://download.nfs-ganesha.org/4/4.0/nfs-ganesha-4.0.tar.gz \
> +           file://module.patch \
> +           file://0001-Fix-possible-null-pointer-dereference.patch \
> +           file://0002-Workaround-for-erroneous-gcc-Werror.patch \
> +           file://0003-Make-nfsv3_optype-guarded-by-_USE_NFS3.patch \
> +           "
> +SRC_URI[sha256sum] = "7a7214f0cec054f2dd45a44c107f02812c1478730c4c85681d1bfe7ca1e64f8c"
> +
> +DEPENDS = "flex-native bison-native ntirpc util-linux"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG[dbus] = "-DUSE_DBUS=ON,-DUSE_DBUS=OFF,dbus"
> +PACKAGECONFIG[nfsidmap] = "-DUSE_NFSIDMAP=ON,-DUSE_NFSIDMAP=OFF,nfs-utils"
> +PACKAGECONFIG[nfsv3] = "-DUSE_NFS3=ON,-DUSE_NFS3=OFF"
> +PACKAGECONFIG[winbind] = "-D_MSPAC_SUPPORT=true,-D_MSPAC_SUPPORT=false,samba"
> +PACKAGECONFIG[lttng] = "-DUSE_LTTNG=ON,-DUSE_LTTNG=OFF,lttng-ust liburcu"
> +PACKAGECONFIG[acl] = "-DUSE_ACL_MAPPING=ON,USE_ACL_MAPPING=OFF,acl"
> +PACKAGECONFIG[jemalloc] = ",,jemalloc"
> +
> +
> +OECMAKE_SOURCEPATH = "${S}/src"
> +
> +EXTRA_OECMAKE += "-DUSE_SYSTEM_NTIRPC=ON"
> +EXTRA_OECMAKE += "-DUSE_GSS=OFF"
> +
> +# Sort out the brain-dead cmake file
> +# (https://github.com/nfs-ganesha/ntirpc/issues/150)
> +do_install:append() {
> +    if [ "${prefix}/lib64" != "${libdir}" -a -d ${D}${prefix}/lib64 ]; then
> +        mv ${D}${prefix}/lib64 ${D}${libdir}
> +    fi
> +}
> +
> +FILES:${PN} += "${libdir}/ganesha/*.so"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch b/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
> deleted file mode 100644
> index e9b9d3df46..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From b42ab8e1aca951dd06c113159491b3fd5cf06f2e Mon Sep 17 00:00:00 2001
> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
> -Date: Thu, 24 Oct 2019 09:39:04 +0800
> -Subject: [PATCH] Add "listen" action for a tcp socket which does not call
> - 'listen' after 'bind'
> -
> -It is found that /usr/bin/unfsd customus 100% cpu after starting qemu with 'nfs'
> -option, and below lots of error messages shows when strace the process:
> -
> -poll([{fd=3, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=4, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},
> -{fd=5, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=6, events =POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND}],
> -4, 2000) = 2 ([{fd=4, revents=POLLHUP},{fd=6, revents=POLLHUP}])
> -accept(4, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
> -accept(6, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
> -
> -% time     seconds  usecs/call     calls    errors syscall
> ------- ----------- ----------- --------- --------- ----------------
> - 70.87    0.005392           0    513886    513886 accept
> - 29.13    0.002216           0    256943           poll
> -  0.00    0.000000           0         4           read
> -
> -The root cause is that 'listen' is not called for the binded
> -socket. The depended libtipc does not call 'listen' if found
> -the incomming socket is binded, so 'accept' reports the error
> -in the 'for' loop and cpu consumed.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ----
> - daemon.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/daemon.c b/daemon.c
> -index 028a181..4c85903 100644
> ---- a/daemon.c
> -+++ b/daemon.c
> -@@ -814,6 +814,13 @@ static SVCXPRT *create_tcp_transport(unsigned int port)
> - 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
> - 	    exit(1);
> - 	}
> -+
> -+	if (listen(sock, SOMAXCONN) < 0) {
> -+	    perror("listen");
> -+	    fprintf(stderr, "Couldn't listen on the address \n");
> -+	    close(sock);
> -+	    exit(1);
> -+	}
> -     }
> - 
> -     transp = svctcp_create(sock, 0, 0);
> --- 
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
> deleted file mode 100644
> index 6957d102b8..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From 3f4fcb62661059bad77a2e957b4621137797bc2f Mon Sep 17 00:00:00 2001
> -From: Rui Wang <rui.wang@windriver.com>
> -Date: Fri, 15 Jun 2018 14:19:10 +0800
> -Subject: [PATCH] attr: fix utime for symlink
> -
> -unfs3 has an old defect that it can not change the timestamps of a
> -symlink file because it only uses utime(), which will follow the
> -symlink. This will not cause an error if the symlink points to an
> -existent file. But under some special situation, such as installing
> -a rpm package, rpm tool will create the symlink first and try to
> -modify the timestamps of it, when the target file is non-existent.
> -This will cause an ESTALE error. Making rpm tool ignore this error
> -is a solution, but not the best one. An acceptable approach is
> -Making unfs3 support lutimes(), which can modify the symlink file
> -itself. Considering not every system support this function, so a
> -function checking is necessary.
> -
> -Upstream-Status: Submitted [https://sourceforge.net/p/unfs3/bugs/12/]
> -
> -Signed-off-by: Rui Wang <rui.wang@windriver.com>
> ----
> - attr.c         | 15 +++++++++++----
> - backend_unix.h |  2 ++
> - configure.ac   |  1 +
> - 3 files changed, 14 insertions(+), 4 deletions(-)
> -
> -diff --git a/attr.c b/attr.c
> -index 73e5c75..427d0e2 100644
> ---- a/attr.c
> -+++ b/attr.c
> -@@ -280,7 +280,7 @@ post_op_attr get_post_cached(struct svc_req * req)
> - static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
> - {
> -     time_t new_atime, new_mtime;
> --    struct utimbuf utim;
> -+    struct timeval stamps[2];
> -     int res;
> -
> -     /* set atime and mtime */
> -@@ -302,10 +302,17 @@ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
> -	else			       /* DONT_CHANGE */
> -	    new_mtime = buf.st_mtime;
> -
> --	utim.actime = new_atime;
> --	utim.modtime = new_mtime;
> -+	stamps[0].tv_sec = new_atime;
> -+	stamps[0].tv_usec = 0;
> -+	stamps[1].tv_sec = new_mtime;
> -+	stamps[1].tv_usec = 0;
> -+
> -+#if HAVE_LUTIMES
> -+	res = backend_lutimes(path, stamps);
> -+#else
> -+	res = backend_utimes(path, stamps);
> -+#endif
> -
> --	res = backend_utime(path, &utim);
> -	if (res == -1)
> -	    return setattr_err();
> -     }
> -diff --git a/backend_unix.h b/backend_unix.h
> -index fbc2af3..813ffd3 100644
> ---- a/backend_unix.h
> -+++ b/backend_unix.h
> -@@ -61,6 +61,8 @@
> - #define backend_symlink symlink
> - #define backend_truncate truncate
> - #define backend_utime utime
> -+#define backend_utimes utimes
> -+#define backend_lutimes lutimes
> - #define backend_statstruct struct stat
> - #define backend_dirstream DIR
> - #define backend_statvfsstruct struct statvfs
> -diff --git a/configure.ac b/configure.ac
> -index aeec598..ea7f167 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -37,6 +37,7 @@ AC_CHECK_FUNCS(setresuid setresgid)
> - AC_CHECK_FUNCS(vsyslog)
> - AC_CHECK_FUNCS(lchown)
> - AC_CHECK_FUNCS(setgroups)
> -+AC_CHECK_FUNCS(lutimes)
> - UNFS3_SOLARIS_RPC
> - UNFS3_PORTMAP_DEFINE
> - UNFS3_COMPILE_WARNINGS
> diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
> deleted file mode 100644
> index 6eee6748f9..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From c7a2a65d6c2a433312540c207860740d6e4e7629 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 11 Mar 2018 17:32:54 -0700
> -Subject: [PATCH] daemon.c: Libtirpc porting fixes
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - daemon.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/daemon.c b/daemon.c
> -index 22f30f6..028a181 100644
> ---- a/daemon.c
> -+++ b/daemon.c
> -@@ -117,7 +117,7 @@ void logmsg(int prio, const char *fmt, ...)
> -  */
> - struct in_addr get_remote(struct svc_req *rqstp)
> - {
> --    return (svc_getcaller(rqstp->rq_xprt))->sin_addr;
> -+    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_addr;
> - }
> - 
> - /*
> -@@ -125,7 +125,7 @@ struct in_addr get_remote(struct svc_req *rqstp)
> -  */
> - short get_port(struct svc_req *rqstp)
> - {
> --    return (svc_getcaller(rqstp->rq_xprt))->sin_port;
> -+    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_port;
> - }
> - 
> - /*
> --- 
> -2.16.2
> -
> diff --git a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
> deleted file mode 100644
> index ff745d4774..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -Add ability to specify rcp port numbers
> -
> -In order to run more than one unfs server on a host system, you must
> -be able to specify alternate rpc port numbers.
> -
> -Jason Wessel <jason.wessel@windriver.com>
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - daemon.c |   44 +++++++++++++++++++++++++++++++-------------
> - mount.c  |    4 ++--
> - 2 files changed, 33 insertions(+), 15 deletions(-)
> -
> ---- a/daemon.c
> -+++ b/daemon.c
> -@@ -78,6 +78,8 @@ int opt_testconfig = FALSE;
> - struct in_addr opt_bind_addr;
> - int opt_readable_executables = FALSE;
> - char *opt_pid_file = NULL;
> -+int nfs_prog = NFS3_PROGRAM;
> -+int mount_prog = MOUNTPROG;
> - 
> - /* Register with portmapper? */
> - int opt_portmapper = TRUE;
> -@@ -206,7 +208,7 @@ static void parse_options(int argc, char
> - {
> - 
> -     int opt = 0;
> --    char *optstring = "bcC:de:hl:m:n:prstTuwi:";
> -+    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
> - 
> -     while (opt != -1) {
> - 	opt = getopt(argc, argv, optstring);
> -@@ -261,8 +263,24 @@ static void parse_options(int argc, char
> - 		printf
> - 		    ("\t-r          report unreadable executables as readable\n");
> - 		printf("\t-T          test exports file and exit\n");
> -+		printf("\t-x <port>   alternate NFS RPC port\n");
> -+		printf("\t-y <port>   alternate MOUNTD RPC port\n");
> - 		exit(0);
> - 		break;
> -+	    case 'x':
> -+		nfs_prog = strtol(optarg, NULL, 10);
> -+		if (nfs_prog == 0) {
> -+		    fprintf(stderr, "Invalid NFS RPC port\n");
> -+		    exit(1);
> -+		}
> -+		break;
> -+	    case 'y':
> -+		mount_prog = strtol(optarg, NULL, 10);
> -+		if (mount_prog == 0) {
> -+		    fprintf(stderr, "Invalid MOUNTD RPC port\n");
> -+		    exit(1);
> -+		}
> -+		break;
> - 	    case 'l':
> - 		opt_bind_addr.s_addr = inet_addr(optarg);
> - 		if (opt_bind_addr.s_addr == (unsigned) -1) {
> -@@ -347,12 +365,12 @@ void daemon_exit(int error)
> - #endif				       /* WIN32 */
> - 
> -     if (opt_portmapper) {
> --	svc_unregister(MOUNTPROG, MOUNTVERS1);
> --	svc_unregister(MOUNTPROG, MOUNTVERS3);
> -+	svc_unregister(mount_prog, MOUNTVERS1);
> -+	svc_unregister(mount_prog, MOUNTVERS3);
> -     }
> - 
> -     if (opt_portmapper) {
> --	svc_unregister(NFS3_PROGRAM, NFS_V3);
> -+	svc_unregister(nfs_prog, NFS_V3);
> -     }
> - 
> -     if (error == SIGSEGV)
> -@@ -657,13 +675,13 @@ static void mountprog_3(struct svc_req *
> - static void register_nfs_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
> - {
> -     if (opt_portmapper) {
> --	pmap_unset(NFS3_PROGRAM, NFS_V3);
> -+	pmap_unset(nfs_prog, NFS_V3);
> -     }
> - 
> -     if (udptransp != NULL) {
> - 	/* Register NFS service for UDP */
> - 	if (!svc_register
> --	    (udptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
> -+	    (udptransp, nfs_prog, NFS_V3, nfs3_program_3,
> - 	     opt_portmapper ? IPPROTO_UDP : 0)) {
> - 	    fprintf(stderr, "%s\n",
> - 		    "unable to register (NFS3_PROGRAM, NFS_V3, udp).");
> -@@ -674,7 +692,7 @@ static void register_nfs_service(SVCXPRT
> -     if (tcptransp != NULL) {
> - 	/* Register NFS service for TCP */
> - 	if (!svc_register
> --	    (tcptransp, NFS3_PROGRAM, NFS_V3, nfs3_program_3,
> -+	    (tcptransp, nfs_prog, NFS_V3, nfs3_program_3,
> - 	     opt_portmapper ? IPPROTO_TCP : 0)) {
> - 	    fprintf(stderr, "%s\n",
> - 		    "unable to register (NFS3_PROGRAM, NFS_V3, tcp).");
> -@@ -686,14 +704,14 @@ static void register_nfs_service(SVCXPRT
> - static void register_mount_service(SVCXPRT * udptransp, SVCXPRT * tcptransp)
> - {
> -     if (opt_portmapper) {
> --	pmap_unset(MOUNTPROG, MOUNTVERS1);
> --	pmap_unset(MOUNTPROG, MOUNTVERS3);
> -+	pmap_unset(mount_prog, MOUNTVERS1);
> -+	pmap_unset(mount_prog, MOUNTVERS3);
> -     }
> - 
> -     if (udptransp != NULL) {
> - 	/* Register MOUNT service (v1) for UDP */
> - 	if (!svc_register
> --	    (udptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
> -+	    (udptransp, mount_prog, MOUNTVERS1, mountprog_3,
> - 	     opt_portmapper ? IPPROTO_UDP : 0)) {
> - 	    fprintf(stderr, "%s\n",
> - 		    "unable to register (MOUNTPROG, MOUNTVERS1, udp).");
> -@@ -702,7 +720,7 @@ static void register_mount_service(SVCXP
> - 
> - 	/* Register MOUNT service (v3) for UDP */
> - 	if (!svc_register
> --	    (udptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
> -+	    (udptransp, mount_prog, MOUNTVERS3, mountprog_3,
> - 	     opt_portmapper ? IPPROTO_UDP : 0)) {
> - 	    fprintf(stderr, "%s\n",
> - 		    "unable to register (MOUNTPROG, MOUNTVERS3, udp).");
> -@@ -713,7 +731,7 @@ static void register_mount_service(SVCXP
> -     if (tcptransp != NULL) {
> - 	/* Register MOUNT service (v1) for TCP */
> - 	if (!svc_register
> --	    (tcptransp, MOUNTPROG, MOUNTVERS1, mountprog_3,
> -+	    (tcptransp, mount_prog, MOUNTVERS1, mountprog_3,
> - 	     opt_portmapper ? IPPROTO_TCP : 0)) {
> - 	    fprintf(stderr, "%s\n",
> - 		    "unable to register (MOUNTPROG, MOUNTVERS1, tcp).");
> -@@ -722,7 +740,7 @@ static void register_mount_service(SVCXP
> - 
> - 	/* Register MOUNT service (v3) for TCP */
> - 	if (!svc_register
> --	    (tcptransp, MOUNTPROG, MOUNTVERS3, mountprog_3,
> -+	    (tcptransp, mount_prog, MOUNTVERS3, mountprog_3,
> - 	     opt_portmapper ? IPPROTO_TCP : 0)) {
> - 	    fprintf(stderr, "%s\n",
> - 		    "unable to register (MOUNTPROG, MOUNTVERS3, tcp).");
> ---- a/mount.c
> -+++ b/mount.c
> -@@ -155,8 +155,8 @@ mountres3 *mountproc_mnt_3_svc(dirpath *
> -     /* error out if not version 3 */
> -     if (rqstp->rq_vers != 3) {
> - 	logmsg(LOG_INFO,
> --	       "%s attempted mount with unsupported protocol version",
> --	       inet_ntoa(get_remote(rqstp)));
> -+	       "%s attempted mount with unsupported protocol version: %i",
> -+	       inet_ntoa(get_remote(rqstp)), rqstp->rq_vers);
> - 	result.fhs_status = MNT3ERR_INVAL;
> - 	return &result;
> -     }
> diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
> deleted file mode 100644
> index aada014117..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -daemon.c: Check exit code of chdir()
> -
> -Stop the compile warning and fix the code to act on a chdir() failure.
> -If this one does fail something is very, very wrong.
> -
> -Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - daemon.c |    3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> ---- a/daemon.c
> -+++ b/daemon.c
> -@@ -964,7 +964,8 @@ int main(int argc, char **argv)
> - 	sigaction(SIGALRM, &act, NULL);
> - 
> - 	/* don't make directory we started in busy */
> --	chdir("/");
> -+	if(chdir("/") < 0)
> -+	    daemon_exit(0);
> - 
> - 	/* detach from terminal */
> - 	if (opt_detach) {
> diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
> deleted file mode 100644
> index 46b187e5f3..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -daemon.c: Fix race window for writing of the pid file
> -
> -The parent process should write the pid file such that the pid file
> -will can be checked immediately following exit of the fork from the
> -parent.
> -
> -This allows external monitoring applications to watch the daemon
> -without having to add sleep calls to wait for the pid file be written
> -on a busy system.
> -
> -Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - daemon.c |   12 +++++++++---
> - 1 file changed, 9 insertions(+), 3 deletions(-)
> -
> ---- a/daemon.c
> -+++ b/daemon.c
> -@@ -153,7 +153,7 @@ int get_socket_type(struct svc_req *rqst
> - /*
> -  * write current pid to a file
> -  */
> --static void create_pid_file(void)
> -+static void create_pid_file(int pid)
> - {
> -     char buf[16];
> -     int fd, res, len;
> -@@ -175,7 +175,7 @@ static void create_pid_file(void)
> -     }
> - #endif
> - 
> --    sprintf(buf, "%i\n", backend_getpid());
> -+    sprintf(buf, "%i\n", pid);
> -     len = strlen(buf);
> - 
> -     res = backend_pwrite(fd, buf, len, 0);
> -@@ -970,6 +970,10 @@ int main(int argc, char **argv)
> - 	    fprintf(stderr, "could not fork into background\n");
> - 	    daemon_exit(0);
> - 	}
> -+	if (pid)
> -+	    create_pid_file(pid);
> -+    } else {
> -+	create_pid_file(backend_getpid());
> -     }
> - #endif				       /* WIN32 */
> - 
> -@@ -1006,8 +1010,10 @@ int main(int argc, char **argv)
> - 	/* no umask to not screw up create modes */
> - 	umask(0);
> - 
> -+#ifdef WIN32
> - 	/* create pid file if wanted */
> --	create_pid_file();
> -+	create_pid_file(backend_getpid());
> -+#endif
> - 
> - 	/* initialize internal stuff */
> - 	fh_cache_init();
> diff --git a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch b/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
> deleted file mode 100644
> index e3496814d8..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Upstream-Status: Backport [https://github.com/unfs3/unfs3/commit/3fa0568e6ef96e045286afe18444bc28fe93962b]
> -
> -diff --git a/Config/exports.l b/Config/exports.l
> -index 662603c..7e7c4fc 100644
> ---- a/Config/exports.l
> -+++ b/Config/exports.l
> -@@ -50,6 +50,7 @@ OLDNET {IP}"/"{IP}
> - 
> - %option nounput
> - %option noinput
> -+%option noyywrap
> - 
> - %%
> - 
> diff --git a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
> deleted file mode 100644
> index 219dd35aec..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -nfs.c: Allow max sa.sun_path for a localdomain socket with the user nfs-server
> -
> -There is a hard limit for the kernel of 108 characters for a
> -localdomain socket name.  To avoid problems with the user nfs
> -server it should maximize the number of characters by using
> -a relative path on the server side.
> -
> -Previously the nfs-server used the absolute path name passed to
> -the sa.sunpath arg for binding the socket and this has caused
> -problems for both the X server and UST binaries which make
> -heavy use of named sockets with long names.
> -
> -Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - nfs.c |   29 +++++++++++++++++++++++++++--
> - 1 file changed, 27 insertions(+), 2 deletions(-)
> -
> ---- a/nfs.c
> -+++ b/nfs.c
> -@@ -672,6 +672,7 @@ SYMLINK3res *nfsproc3_symlink_3_svc(SYML
> - }
> - 
> - #ifndef WIN32
> -+static char pathbuf_tmp[NFS_MAXPATHLEN + NFS_MAXNAMLEN + 1];
> - 
> - /*
> -  * create Unix socket
> -@@ -680,17 +681,41 @@ static int mksocket(const char *path, mo
> - {
> -     int res, sock;
> -     struct sockaddr_un addr;
> -+    unsigned int len = strlen(path);
> - 
> -     sock = socket(PF_UNIX, SOCK_STREAM, 0);
> --    addr.sun_family = AF_UNIX;
> --    strcpy(addr.sun_path, path);
> -     res = sock;
> -     if (res != -1) {
> -+	addr.sun_family = AF_UNIX;
> -+	if (len < sizeof(addr.sun_path) -1) {
> -+	    strcpy(addr.sun_path, path);
> -+	} else {
> -+	    char *ptr;
> -+	    res = -1;
> -+	    if (len >= sizeof(path))
> -+		goto out;
> -+	    strcpy(pathbuf_tmp, path);
> -+	    ptr = strrchr(pathbuf_tmp,'/');
> -+	    if (ptr) {
> -+		*ptr = '\0';
> -+		ptr++;
> -+		if (chdir(pathbuf_tmp))
> -+		    goto out;
> -+	    } else {
> -+		ptr = pathbuf_tmp;
> -+	    }
> -+	    if (strlen(ptr) >= sizeof(addr.sun_path))
> -+		goto out;
> -+	    strcpy(addr.sun_path, ptr);
> -+	}
> - 	umask(~mode);
> - 	res =
> - 	    bind(sock, (struct sockaddr *) &addr,
> - 		 sizeof(addr.sun_family) + strlen(addr.sun_path));
> - 	umask(0);
> -+out:
> -+	if (chdir("/"))
> -+	    fprintf(stderr, "Internal failure to chdir /\n");
> - 	close(sock);
> -     }
> -     return res;
> diff --git a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
> deleted file mode 100644
> index e6d89530f8..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From: Jason Wessel <jason.wessel@windriver.com>
> -Date: Sat, 23 Feb 2013 08:49:08 -0600
> -Subject: [PATCH] fh_cache: fix statle nfs handle on rename problem
> -
> -The following test case fails with modern linunx kernels which cache
> -the renamed inode.
> -
> -  % mkdir a;mkdir b;mv b a/;ls -l a
> -  ls: a/b: Stale NFS file handle
> -
> -The issue is that nfserver was not updating the fh_cache with the new
> -location of the inode, when it moves directories.
> -
> -Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - fh_cache.c |   12 ++++++++++++
> - fh_cache.h |    1 +
> - nfs.c      |    2 ++
> - 3 files changed, 15 insertions(+)
> -
> ---- a/fh_cache.c
> -+++ b/fh_cache.c
> -@@ -199,6 +199,18 @@ static char *fh_cache_lookup(uint32 dev,
> - }
> - 
> - /*
> -+ * update a fh inode cache for an operation like rename
> -+ */
> -+void fh_cache_update(nfs_fh3 fh, char *path)
> -+{
> -+    unfs3_fh_t *obj = (void *) fh.data.data_val;
> -+    backend_statstruct buf;
> -+
> -+    if (backend_lstat(path, &buf) != -1) {
> -+	fh_cache_add(obj->dev, buf.st_ino, path);
> -+    }
> -+}
> -+/*
> -  * resolve a filename into a path
> -  * cache-using wrapper for fh_decomp_raw
> -  */
> ---- a/fh_cache.h
> -+++ b/fh_cache.h
> -@@ -19,5 +19,6 @@ unfs3_fh_t fh_comp(const char *path, str
> - unfs3_fh_t *fh_comp_ptr(const char *path, struct svc_req *rqstp, int need_dir);
> - 
> - char *fh_cache_add(uint32 dev, uint64 ino, const char *path);
> -+void fh_cache_update(nfs_fh3 fh, char *path);
> - 
> - #endif
> ---- a/nfs.c
> -+++ b/nfs.c
> -@@ -876,6 +876,8 @@ RENAME3res *nfsproc3_rename_3_svc(RENAME
> - 	    res = backend_rename(from_obj, to_obj);
> - 	    if (res == -1)
> - 		result.status = rename_err();
> -+	    /* Update the fh_cache with moved inode value */
> -+	    fh_cache_update(argp->to.dir, to_obj);
> - 	}
> -     }
> - 
> diff --git a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
> deleted file mode 100644
> index b3521c63eb..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -daemon.c: Add option for tcp no delay
> -
> -Allow the NFS tcp sockets to conditionally use TCP_NODELAY
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - daemon.c |    9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> ---- a/daemon.c
> -+++ b/daemon.c
> -@@ -17,6 +17,7 @@
> - #ifndef WIN32
> - #include <sys/socket.h>
> - #include <netinet/in.h>
> -+#include <netinet/tcp.h>
> - #include <arpa/inet.h>
> - #include <syslog.h>
> - #else				       /* WIN32 */
> -@@ -75,6 +76,7 @@ unsigned int opt_mount_port = NFS_PORT;
> - int opt_singleuser = FALSE;
> - int opt_brute_force = FALSE;
> - int opt_testconfig = FALSE;
> -+int opt_tcp_nodelay = FALSE;
> - struct in_addr opt_bind_addr;
> - int opt_readable_executables = FALSE;
> - char *opt_pid_file = NULL;
> -@@ -208,7 +210,7 @@ static void parse_options(int argc, char
> - {
> - 
> -     int opt = 0;
> --    char *optstring = "bcC:de:hl:m:n:prstTuwi:x:y:";
> -+    char *optstring = "bcC:de:hl:m:Nn:prstTuwi:x:y:";
> - 
> -     while (opt != -1) {
> - 	opt = getopt(argc, argv, optstring);
> -@@ -295,6 +297,9 @@ static void parse_options(int argc, char
> - 		    exit(1);
> - 		}
> - 		break;
> -+	    case 'N':
> -+		opt_tcp_nodelay = TRUE;
> -+		break;
> - 	    case 'n':
> - 		opt_nfs_port = strtol(optarg, NULL, 10);
> - 		if (opt_nfs_port == 0) {
> -@@ -802,6 +807,8 @@ static SVCXPRT *create_tcp_transport(uns
> - 	sin.sin_addr.s_addr = opt_bind_addr.s_addr;
> - 	sock = socket(PF_INET, SOCK_STREAM, 0);
> - 	setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char *) &on, sizeof(on));
> -+	if (opt_tcp_nodelay)
> -+	    setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, &on, sizeof(on));
> - 	if (bind(sock, (struct sockaddr *) &sin, sizeof(struct sockaddr))) {
> - 	    perror("bind");
> - 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
> diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
> deleted file mode 100644
> index 6f64dd5b3e..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Fix parallel build dependency issue
> -
> -If building with make -j2 the lib.a will not get built in time.
> -
> -Jason Wessel <jason.wessel@windriver.com>
> -
> -Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
> -
> ----
> - Config/Makefile.in |    3 +++
> - Makefile.in        |    3 ++-
> - 2 files changed, 5 insertions(+), 1 deletion(-)
> -
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -29,7 +29,8 @@ DESTDIR =
> - 
> - VPATH = $(srcdir)
> - 
> --all: subdirs unfsd$(EXEEXT)
> -+all: subdirs
> -+	$(MAKE) unfsd$(EXEEXT)
> - 
> - unfsd$(EXEEXT): $(OBJS) $(CONFOBJ) $(EXTRAOBJ)
> - 	$(CC) -o $@ $(OBJS) $(CONFOBJ) $(EXTRAOBJ) $(LDFLAGS)
> ---- a/Config/Makefile.in
> -+++ b/Config/Makefile.in
> -@@ -16,6 +16,9 @@ lib.a: $(OBJS)
> - 	$(AR) crs lib.a $(OBJS)
> - 
> - y.tab.h y.tab.c: $(srcdir)/exports.y
> -+y.tab.h: y.tab.c
> -+
> -+y.tab.c: $(srcdir)/exports.y
> - 	$(YACC) -d $(srcdir)/exports.y
> - 
> - y.tab.o: y.tab.c $(srcdir)/exports.h $(top_srcdir)/nfs.h $(top_srcdir)/mount.h $(top_srcdir)/daemon.h
> diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
> deleted file mode 100644
> index 7a5d273851..0000000000
> --- a/meta/recipes-devtools/unfs3/unfs3_git.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -SUMMARY = "Userspace NFS server v3 protocol"
> -DESCRIPTION = "UNFS3 is a user-space implementation of the NFSv3 server \
> -specification. It provides a daemon for the MOUNT and NFS protocols, which \
> -are used by NFS clients for accessing files on the server."
> -HOMEPAGE = "https://github.com/unfs3/unfs3"
> -SECTION = "console/network"
> -LICENSE = "unfs3"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
> -
> -DEPENDS = "flex-native bison-native flex"
> -DEPENDS += "libtirpc"
> -DEPENDS:append:class-nativesdk = " flex-nativesdk"
> -
> -ASNEEDED = ""
> -
> -S = "${WORKDIR}/git"
> -SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
> -           file://unfs3_parallel_build.patch \
> -           file://alternate_rpc_ports.patch \
> -           file://fix_pid_race_parent_writes_child_pid.patch \
> -           file://fix_compile_warning.patch \
> -           file://rename_fh_cache.patch \
> -           file://relative_max_socket_path_len.patch \
> -           file://tcp_no_delay.patch \
> -           file://0001-daemon.c-Libtirpc-porting-fixes.patch \
> -           file://0001-attr-fix-utime-for-symlink.patch \
> -           file://0001-Add-listen-action-for-a-tcp-socket.patch \
> -           file://no-yywrap.patch \
> -          "
> -SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
> -UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>.+)"
> -
> -PV = "0.9.22+${SRCPV}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -inherit autotools
> -EXTRA_OECONF:append:class-native = " --sbindir=${bindir}"
> -CFLAGS:append = " -I${STAGING_INCDIR}/tirpc"
> -EXTRA_OECONF:append = " LIBS=-ltirpc"
> -
> -# Turn off these header detects else the inode search
> -# will walk entire file systems and this is a real problem
> -# if you have 2 TB of files to walk in your file system
> -CACHED_CONFIGUREVARS = "ac_cv_header_mntent_h=no ac_cv_header_sys_mnttab_h=no"
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169993): https://lists.openembedded.org/g/openembedded-core/message/169993
> Mute This Topic: https://lists.openembedded.org/mt/93311086/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


