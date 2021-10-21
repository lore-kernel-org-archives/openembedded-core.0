Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BE7C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:17 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.10902.1634829069120270597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 08:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y4oVtJX8;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id c4so572893pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzw/z1vTBOJBebeMEOpid4qIij1EC2yOe6r06tJ2NAc=;
        b=Y4oVtJX8H0pR3B9YnJMCmFn3uFi8/yMh3PYIlXGCSw+icEfpNmTlPpycR9tWPOjee9
         P/FrBwsTkw8Q/NPjk5dt2bWq4DTtwgTaDhqwzi22V1BwUuIcCNng0DGyWN+lhIgY0IdK
         UcEno9VvWVl3iO+0uVcVyKn6gQP9X5FMoV/Ei/7BSRUv5flo9+9Bw0FYvhkcolf3l1Dh
         LzuG/JyQFYuYGi+OZo5AtVsUoetzTdHfVxGD4dHyusw3odZo5hVudSmY49Zc2Q9NM/bK
         AQkxaopUSQwqQS1/f7Nb0nmign2tjOTSpgJy4owIy7OgLW69kCz6ikQJnmAbQKK55EMX
         PcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzw/z1vTBOJBebeMEOpid4qIij1EC2yOe6r06tJ2NAc=;
        b=SzKCcvDUSRi8JOj6K3nMtf/TJHkfQaO9s03KGaRN9iS9oOKCF2O8Lc9PRO6BC4EVpB
         69F9zt72zO+OWP/iLK40K2c1nHgUO7yaPxjcjGor/QSI3bdAKvTFWP/i5gMLtxo7/4Td
         sANojBLxrTI/MkDcTe6PZg6WvY4a3EsrEi7wRtNw/XZOH4v+MEBJJWtHbgqF6+40UN4y
         V2fPrv6CygebqRf7LV9l44oh3ZVAh8hFcklxCtmSEkeYlEUtJFvp2HKBzKeBQNlZBPB4
         eZN0XpYFCMOrVMX+Z9Vd0/C1pBGR3EY6a1DawPcNhSFxF4gPBXAWTAfFsyJXkcS1Zcqr
         NR3g==
X-Gm-Message-State: AOAM533qp5488zaDkaYvxF3Lrp/d8jeP1GyXx1V/A9hFKukS0ZxQg2RV
	GWT4N3Fh8cc3ujHqb3BLpXIORmlDjRz2hw==
X-Google-Smtp-Source: 
 ABdhPJw40MlNhzW9et2P5+/nHfunrqOFR0/G/dm4EwcIg0a73FMZFGwj4aaQBZCqPX1n+Z6f9kUpfg==
X-Received: by 2002:a63:7e04:: with SMTP id z4mr3269477pgc.221.1634829065962;
        Thu, 21 Oct 2021 08:11:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 ls7sm6636862pjb.16.2021.10.21.08.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:11:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] librsvg: Fix vendored libc to work on riscv and musl
Date: Thu, 21 Oct 2021 08:11:02 -0700
Message-Id: <20211021151102.480668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 15:11:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157286

These are patches applied to rust libc already but since librsvg uses
its own copy of libc, we need to patch it here too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nitions-for-riscv64-musl-libc-0.2.93.patch | 897 ++++++++++++++++++
 ...-mod.rs-add-riscv64-to-b64-set-libc-.patch |  26 +
 ...efinitions-to-match-musl-libc-0.2.93.patch | 736 ++++++++++++++
 ...-for-modified-files-for-rust-1.54.0-.patch |  17 +
 meta/recipes-gnome/librsvg/librsvg_2.52.0.bb  |   4 +
 5 files changed, 1680 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0005-Add-base-defini=
tions-for-riscv64-musl-libc-0.2.93.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-mus=
l-mod.rs-add-riscv64-to-b64-set-libc-.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-d=
efinitions-to-match-musl-libc-0.2.93.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0008-Update-checksum=
s-for-modified-files-for-rust-1.54.0-.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-f=
or-riscv64-musl-libc-0.2.93.patch b/meta/recipes-gnome/librsvg/librsvg/0005=
-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
new file mode 100644
index 0000000000..c141e7a539
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-for-risc=
v64-musl-libc-0.2.93.patch
@@ -0,0 +1,897 @@
+From 4e188d047dee33a19902113a3c90cdf1d8310a9e Mon Sep 17 00:00:00 2001
+From: Ralf Anton Beier <ralf_beier@me.com>
+Date: Sun, 8 Aug 2021 11:05:06 +0200
+Subject: [PATCH 5/8] Add base definitions for riscv64 + musl - libc-0.2.93
+
+https://github.com/rust-lang/libc/pull/1994/commits/030a07761f61f3293d5375=
2e60edbd330a9d718d
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
+---
+ .../src/unix/linux_like/linux/musl/b64/mod.rs |   3 +
+ .../linux_like/linux/musl/b64/riscv64/mod.rs  | 867 ++++++++++++++++++
+ 2 files changed, 870 insertions(+)
+ create mode 100644 vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/=
riscv64/mod.rs
+
+--- a/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
+@@ -163,6 +163,9 @@ cfg_if! {
+     } else if #[cfg(any(target_arch =3D "x86_64"))] {
+         mod x86_64;
+         pub use self::x86_64::*;
++    } else if #[cfg(any(target_arch =3D "riscv64"))] {
++        mod riscv64;
++        pub use self::riscv64::*;
+     } else {
+         // Unknown target_arch
+     }
+--- /dev/null
++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+@@ -0,0 +1,867 @@
++//! RISC-V-specific definitions for 64-bit linux-like values
++
++pub type c_char =3D u8;
++pub type c_long =3D i64;
++pub type c_ulong =3D u64;
++pub type wchar_t =3D ::c_int;
++
++pub type nlink_t =3D ::c_uint;
++pub type blksize_t =3D ::c_int;
++pub type fsblkcnt64_t =3D ::c_ulong;
++pub type fsfilcnt64_t =3D ::c_ulong;
++pub type suseconds_t =3D i64;
++pub type __u64 =3D ::c_ulonglong;
++
++s! {
++    pub struct pthread_attr_t {
++        __size: [::c_ulong; 7],
++    }
++
++    pub struct stat {
++        pub st_dev: ::dev_t,
++        pub st_ino: ::ino_t,
++        pub st_mode: ::mode_t,
++        pub st_nlink: ::nlink_t,
++        pub st_uid: ::uid_t,
++        pub st_gid: ::gid_t,
++        pub st_rdev: ::dev_t,
++        pub __pad1: ::dev_t,
++        pub st_size: ::off_t,
++        pub st_blksize: ::blksize_t,
++        pub __pad2: ::c_int,
++        pub st_blocks: ::blkcnt_t,
++        pub st_atime: ::time_t,
++        pub st_atime_nsec: ::c_long,
++        pub st_mtime: ::time_t,
++        pub st_mtime_nsec: ::c_long,
++        pub st_ctime: ::time_t,
++        pub st_ctime_nsec: ::c_long,
++        __unused: [::c_int; 2usize],
++    }
++
++    pub struct stat64 {
++        pub st_dev: ::dev_t,
++        pub st_ino: ::ino64_t,
++        pub st_mode: ::mode_t,
++        pub st_nlink: ::nlink_t,
++        pub st_uid: ::uid_t,
++        pub st_gid: ::gid_t,
++        pub st_rdev: ::dev_t,
++        pub __pad1: ::dev_t,
++        pub st_size: ::off64_t,
++        pub st_blksize: ::blksize_t,
++        pub __pad2: ::c_int,
++        pub st_blocks: ::blkcnt_t,
++        pub st_atime: ::time_t,
++        pub st_atime_nsec: ::c_long,
++        pub st_mtime: ::time_t,
++        pub st_mtime_nsec: ::c_long,
++        pub st_ctime: ::time_t,
++        pub st_ctime_nsec: ::c_long,
++        __unused: [::c_int; 2],
++    }
++
++    pub struct statfs {
++        pub f_type: ::c_long,
++        pub f_bsize: ::c_long,
++        pub f_blocks: ::fsblkcnt_t,
++        pub f_bfree: ::fsblkcnt_t,
++        pub f_bavail: ::fsblkcnt_t,
++        pub f_files: ::fsfilcnt_t,
++        pub f_ffree: ::fsfilcnt_t,
++        pub f_fsid: ::fsid_t,
++        pub f_namelen: ::c_long,
++        pub f_frsize: ::c_long,
++        pub f_flags: ::c_long,
++        pub f_spare: [::c_long; 4],
++    }
++
++    pub struct statfs64 {
++        pub f_type: ::c_long,
++        pub f_bsize: ::c_long,
++        pub f_blocks: ::fsblkcnt64_t,
++        pub f_bfree: ::fsblkcnt64_t,
++        pub f_bavail: ::fsblkcnt64_t,
++        pub f_files: ::fsfilcnt64_t,
++        pub f_ffree: ::fsfilcnt64_t,
++        pub f_fsid: ::fsid_t,
++        pub f_namelen: ::c_long,
++        pub f_frsize: ::c_long,
++        pub f_flags: ::c_long,
++        pub f_spare: [::c_long; 4],
++    }
++
++    pub struct statvfs {
++        pub f_bsize: ::c_ulong,
++        pub f_frsize: ::c_ulong,
++        pub f_blocks: ::fsblkcnt_t,
++        pub f_bfree: ::fsblkcnt_t,
++        pub f_bavail: ::fsblkcnt_t,
++        pub f_files: ::fsfilcnt_t,
++        pub f_ffree: ::fsfilcnt_t,
++        pub f_favail: ::fsfilcnt_t,
++        pub f_fsid: ::c_ulong,
++        pub f_flag: ::c_ulong,
++        pub f_namemax: ::c_ulong,
++        pub __f_spare: [::c_int; 6],
++    }
++
++    pub struct statvfs64 {
++        pub f_bsize: ::c_ulong,
++        pub f_frsize: ::c_ulong,
++        pub f_blocks: ::fsblkcnt64_t,
++        pub f_bfree: ::fsblkcnt64_t,
++        pub f_bavail: ::fsblkcnt64_t,
++        pub f_files: ::fsfilcnt64_t,
++        pub f_ffree: ::fsfilcnt64_t,
++        pub f_favail: ::fsfilcnt64_t,
++        pub f_fsid: ::c_ulong,
++        pub f_flag: ::c_ulong,
++        pub f_namemax: ::c_ulong,
++        pub __f_spare: [::c_int; 6],
++    }
++
++    pub struct siginfo_t {
++        pub si_signo: ::c_int,
++        pub si_errno: ::c_int,
++        pub si_code: ::c_int,
++        #[doc(hidden)]
++        #[deprecated(
++            since=3D"0.2.54",
++            note=3D"Please leave a comment on \
++                  https://github.com/rust-lang/libc/pull/1316 if you're u=
sing \
++                  this field"
++        )]
++        pub _pad: [::c_int; 29],
++        _align: [u64; 0],
++    }
++
++    pub struct stack_t {
++        pub ss_sp: *mut ::c_void,
++        pub ss_flags: ::c_int,
++        pub ss_size: ::size_t,
++    }
++
++    pub struct sigaction {
++        pub sa_sigaction: ::sighandler_t,
++        pub sa_mask: ::sigset_t,
++        pub sa_flags: ::c_int,
++        pub sa_restorer: ::Option<unsafe extern "C" fn()>,
++    }
++
++    pub struct ipc_perm {
++        pub __key: ::key_t,
++        pub uid: ::uid_t,
++        pub gid: ::gid_t,
++        pub cuid: ::uid_t,
++        pub cgid: ::gid_t,
++        pub mode: ::c_ushort,
++        __pad1: ::c_ushort,
++        pub __seq: ::c_ushort,
++        __pad2: ::c_ushort,
++        __unused1: ::c_ulong,
++        __unused2: ::c_ulong,
++    }
++
++    pub struct shmid_ds {
++        pub shm_perm: ::ipc_perm,
++        pub shm_segsz: ::size_t,
++        pub shm_atime: ::time_t,
++        pub shm_dtime: ::time_t,
++        pub shm_ctime: ::time_t,
++        pub shm_cpid: ::pid_t,
++        pub shm_lpid: ::pid_t,
++        pub shm_nattch: ::shmatt_t,
++        __unused5: ::c_ulong,
++        __unused6: ::c_ulong,
++    }
++
++    pub struct flock {
++        pub l_type: ::c_short,
++        pub l_whence: ::c_short,
++        pub l_start: ::off_t,
++        pub l_len: ::off_t,
++        pub l_pid: ::pid_t,
++    }
++
++    pub struct flock64 {
++        pub l_type: ::c_short,
++        pub l_whence: ::c_short,
++        pub l_start: ::off64_t,
++        pub l_len: ::off64_t,
++        pub l_pid: ::pid_t,
++    }
++
++    pub struct ip_mreqn {
++        pub imr_multiaddr: ::in_addr,
++        pub imr_address: ::in_addr,
++        pub imr_ifindex: ::c_int,
++    }
++}
++
++pub const POSIX_FADV_DONTNEED: ::c_int =3D 4;
++pub const POSIX_FADV_NOREUSE: ::c_int =3D 5;
++pub const VEOF: usize =3D 4;
++pub const RTLD_DEEPBIND: ::c_int =3D 0x8;
++pub const RTLD_GLOBAL: ::c_int =3D 0x100;
++pub const RTLD_NOLOAD: ::c_int =3D 0x4;
++pub const TIOCGSOFTCAR: ::c_ulong =3D 21529;
++pub const TIOCSSOFTCAR: ::c_ulong =3D 21530;
++pub const TIOCGRS485: ::c_int =3D 21550;
++pub const TIOCSRS485: ::c_int =3D 21551;
++pub const RLIMIT_RSS: ::__rlimit_resource_t =3D 5;
++pub const RLIMIT_AS: ::__rlimit_resource_t =3D 9;
++pub const RLIMIT_MEMLOCK: ::__rlimit_resource_t =3D 8;
++pub const RLIMIT_NOFILE: ::__rlimit_resource_t =3D 7;
++pub const RLIMIT_NPROC: ::__rlimit_resource_t =3D 6;
++pub const O_APPEND: ::c_int =3D 1024;
++pub const O_CREAT: ::c_int =3D 64;
++pub const O_EXCL: ::c_int =3D 128;
++pub const O_NOCTTY: ::c_int =3D 256;
++pub const O_NONBLOCK: ::c_int =3D 2048;
++pub const O_SYNC: ::c_int =3D 1052672;
++pub const O_RSYNC: ::c_int =3D 1052672;
++pub const O_DSYNC: ::c_int =3D 4096;
++pub const O_FSYNC: ::c_int =3D 1052672;
++pub const O_NOATIME: ::c_int =3D 262144;
++pub const O_PATH: ::c_int =3D 2097152;
++pub const O_TMPFILE: ::c_int =3D 4259840;
++pub const MAP_GROWSDOWN: ::c_int =3D 256;
++pub const EDEADLK: ::c_int =3D 35;
++pub const ENAMETOOLONG: ::c_int =3D 36;
++pub const ENOLCK: ::c_int =3D 37;
++pub const ENOSYS: ::c_int =3D 38;
++pub const ENOTEMPTY: ::c_int =3D 39;
++pub const ELOOP: ::c_int =3D 40;
++pub const ENOMSG: ::c_int =3D 42;
++pub const EIDRM: ::c_int =3D 43;
++pub const ECHRNG: ::c_int =3D 44;
++pub const EL2NSYNC: ::c_int =3D 45;
++pub const EL3HLT: ::c_int =3D 46;
++pub const EL3RST: ::c_int =3D 47;
++pub const ELNRNG: ::c_int =3D 48;
++pub const EUNATCH: ::c_int =3D 49;
++pub const ENOCSI: ::c_int =3D 50;
++pub const EL2HLT: ::c_int =3D 51;
++pub const EBADE: ::c_int =3D 52;
++pub const EBADR: ::c_int =3D 53;
++pub const EXFULL: ::c_int =3D 54;
++pub const ENOANO: ::c_int =3D 55;
++pub const EBADRQC: ::c_int =3D 56;
++pub const EBADSLT: ::c_int =3D 57;
++pub const EMULTIHOP: ::c_int =3D 72;
++pub const EOVERFLOW: ::c_int =3D 75;
++pub const ENOTUNIQ: ::c_int =3D 76;
++pub const EBADFD: ::c_int =3D 77;
++pub const EBADMSG: ::c_int =3D 74;
++pub const EREMCHG: ::c_int =3D 78;
++pub const ELIBACC: ::c_int =3D 79;
++pub const ELIBBAD: ::c_int =3D 80;
++pub const ELIBSCN: ::c_int =3D 81;
++pub const ELIBMAX: ::c_int =3D 82;
++pub const ELIBEXEC: ::c_int =3D 83;
++pub const EILSEQ: ::c_int =3D 84;
++pub const ERESTART: ::c_int =3D 85;
++pub const ESTRPIPE: ::c_int =3D 86;
++pub const EUSERS: ::c_int =3D 87;
++pub const ENOTSOCK: ::c_int =3D 88;
++pub const EDESTADDRREQ: ::c_int =3D 89;
++pub const EMSGSIZE: ::c_int =3D 90;
++pub const EPROTOTYPE: ::c_int =3D 91;
++pub const ENOPROTOOPT: ::c_int =3D 92;
++pub const EPROTONOSUPPORT: ::c_int =3D 93;
++pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
++pub const EOPNOTSUPP: ::c_int =3D 95;
++pub const EPFNOSUPPORT: ::c_int =3D 96;
++pub const EAFNOSUPPORT: ::c_int =3D 97;
++pub const EADDRINUSE: ::c_int =3D 98;
++pub const EADDRNOTAVAIL: ::c_int =3D 99;
++pub const ENETDOWN: ::c_int =3D 100;
++pub const ENETUNREACH: ::c_int =3D 101;
++pub const ENETRESET: ::c_int =3D 102;
++pub const ECONNABORTED: ::c_int =3D 103;
++pub const ECONNRESET: ::c_int =3D 104;
++pub const ENOBUFS: ::c_int =3D 105;
++pub const EISCONN: ::c_int =3D 106;
++pub const ENOTCONN: ::c_int =3D 107;
++pub const ESHUTDOWN: ::c_int =3D 108;
++pub const ETOOMANYREFS: ::c_int =3D 109;
++pub const ETIMEDOUT: ::c_int =3D 110;
++pub const ECONNREFUSED: ::c_int =3D 111;
++pub const EHOSTDOWN: ::c_int =3D 112;
++pub const EHOSTUNREACH: ::c_int =3D 113;
++pub const EALREADY: ::c_int =3D 114;
++pub const EINPROGRESS: ::c_int =3D 115;
++pub const ESTALE: ::c_int =3D 116;
++pub const EDQUOT: ::c_int =3D 122;
++pub const ENOMEDIUM: ::c_int =3D 123;
++pub const EMEDIUMTYPE: ::c_int =3D 124;
++pub const ECANCELED: ::c_int =3D 125;
++pub const ENOKEY: ::c_int =3D 126;
++pub const EKEYEXPIRED: ::c_int =3D 127;
++pub const EKEYREVOKED: ::c_int =3D 128;
++pub const EKEYREJECTED: ::c_int =3D 129;
++pub const EOWNERDEAD: ::c_int =3D 130;
++pub const ENOTRECOVERABLE: ::c_int =3D 131;
++pub const EHWPOISON: ::c_int =3D 133;
++pub const ERFKILL: ::c_int =3D 132;
++pub const SOL_SOCKET: ::c_int =3D 1;
++pub const SO_REUSEADDR: ::c_int =3D 2;
++pub const SO_TYPE: ::c_int =3D 3;
++pub const SO_ERROR: ::c_int =3D 4;
++pub const SO_DONTROUTE: ::c_int =3D 5;
++pub const SO_BROADCAST: ::c_int =3D 6;
++pub const SO_SNDBUF: ::c_int =3D 7;
++pub const SO_RCVBUF: ::c_int =3D 8;
++pub const SO_SNDBUFFORCE: ::c_int =3D 32;
++pub const SO_RCVBUFFORCE: ::c_int =3D 33;
++pub const SO_KEEPALIVE: ::c_int =3D 9;
++pub const SO_OOBINLINE: ::c_int =3D 10;
++pub const SO_NO_CHECK: ::c_int =3D 11;
++pub const SO_PRIORITY: ::c_int =3D 12;
++pub const SO_LINGER: ::c_int =3D 13;
++pub const SO_BSDCOMPAT: ::c_int =3D 14;
++pub const SO_REUSEPORT: ::c_int =3D 15;
++pub const SO_PASSCRED: ::c_int =3D 16;
++pub const SO_PEERCRED: ::c_int =3D 17;
++pub const SO_RCVLOWAT: ::c_int =3D 18;
++pub const SO_SNDLOWAT: ::c_int =3D 19;
++pub const SO_RCVTIMEO: ::c_int =3D 20;
++pub const SO_SNDTIMEO: ::c_int =3D 21;
++pub const SO_SECURITY_AUTHENTICATION: ::c_int =3D 22;
++pub const SO_SECURITY_ENCRYPTION_TRANSPORT: ::c_int =3D 23;
++pub const SO_SECURITY_ENCRYPTION_NETWORK: ::c_int =3D 24;
++pub const SO_BINDTODEVICE: ::c_int =3D 25;
++pub const SO_ATTACH_FILTER: ::c_int =3D 26;
++pub const SO_DETACH_FILTER: ::c_int =3D 27;
++pub const SO_GET_FILTER: ::c_int =3D 26;
++pub const SO_PEERNAME: ::c_int =3D 28;
++pub const SO_TIMESTAMP: ::c_int =3D 29;
++pub const SO_ACCEPTCONN: ::c_int =3D 30;
++pub const SO_PEERSEC: ::c_int =3D 31;
++pub const SO_PASSSEC: ::c_int =3D 34;
++pub const SO_TIMESTAMPNS: ::c_int =3D 35;
++pub const SCM_TIMESTAMPNS: ::c_int =3D 35;
++pub const SO_MARK: ::c_int =3D 36;
++pub const SO_PROTOCOL: ::c_int =3D 38;
++pub const SO_DOMAIN: ::c_int =3D 39;
++pub const SO_RXQ_OVFL: ::c_int =3D 40;
++pub const SO_WIFI_STATUS: ::c_int =3D 41;
++pub const SCM_WIFI_STATUS: ::c_int =3D 41;
++pub const SO_PEEK_OFF: ::c_int =3D 42;
++pub const SO_NOFCS: ::c_int =3D 43;
++pub const SO_LOCK_FILTER: ::c_int =3D 44;
++pub const SO_SELECT_ERR_QUEUE: ::c_int =3D 45;
++pub const SO_BUSY_POLL: ::c_int =3D 46;
++pub const SO_MAX_PACING_RATE: ::c_int =3D 47;
++pub const SO_BPF_EXTENSIONS: ::c_int =3D 48;
++pub const SO_INCOMING_CPU: ::c_int =3D 49;
++pub const SO_ATTACH_BPF: ::c_int =3D 50;
++pub const SO_DETACH_BPF: ::c_int =3D 27;
++pub const SOCK_STREAM: ::c_int =3D 1;
++pub const SOCK_DGRAM: ::c_int =3D 2;
++pub const SA_ONSTACK: ::c_int =3D 134217728;
++pub const SA_SIGINFO: ::c_int =3D 4;
++pub const SA_NOCLDWAIT: ::c_int =3D 2;
++pub const SIGTTIN: ::c_int =3D 21;
++pub const SIGTTOU: ::c_int =3D 22;
++pub const SIGXCPU: ::c_int =3D 24;
++pub const SIGXFSZ: ::c_int =3D 25;
++pub const SIGVTALRM: ::c_int =3D 26;
++pub const SIGPROF: ::c_int =3D 27;
++pub const SIGWINCH: ::c_int =3D 28;
++pub const SIGCHLD: ::c_int =3D 17;
++pub const SIGBUS: ::c_int =3D 7;
++pub const SIGUSR1: ::c_int =3D 10;
++pub const SIGUSR2: ::c_int =3D 12;
++pub const SIGCONT: ::c_int =3D 18;
++pub const SIGSTOP: ::c_int =3D 19;
++pub const SIGTSTP: ::c_int =3D 20;
++pub const SIGURG: ::c_int =3D 23;
++pub const SIGIO: ::c_int =3D 29;
++pub const SIGSYS: ::c_int =3D 31;
++pub const SIGSTKFLT: ::c_int =3D 16;
++pub const SIGPOLL: ::c_int =3D 29;
++pub const SIGPWR: ::c_int =3D 30;
++pub const SIG_SETMASK: ::c_int =3D 2;
++pub const SIG_BLOCK: ::c_int =3D 0;
++pub const SIG_UNBLOCK: ::c_int =3D 1;
++pub const POLLWRNORM: ::c_short =3D 256;
++pub const POLLWRBAND: ::c_short =3D 512;
++pub const O_ASYNC: ::c_int =3D 8192;
++pub const O_NDELAY: ::c_int =3D 2048;
++pub const PTRACE_DETACH: ::c_uint =3D 17;
++pub const EFD_NONBLOCK: ::c_int =3D 2048;
++pub const F_GETLK: ::c_int =3D 5;
++pub const F_GETOWN: ::c_int =3D 9;
++pub const F_SETOWN: ::c_int =3D 8;
++pub const F_SETLK: ::c_int =3D 6;
++pub const F_SETLKW: ::c_int =3D 7;
++pub const F_RDLCK: ::c_int =3D 0;
++pub const F_WRLCK: ::c_int =3D 1;
++pub const F_UNLCK: ::c_int =3D 2;
++pub const F_OFD_GETLK: ::c_int =3D 36;
++pub const F_OFD_SETLK: ::c_int =3D 37;
++pub const F_OFD_SETLKW: ::c_int =3D 38;
++pub const SFD_NONBLOCK: ::c_int =3D 2048;
++pub const TCSANOW: ::c_int =3D 0;
++pub const TCSADRAIN: ::c_int =3D 1;
++pub const TCSAFLUSH: ::c_int =3D 2;
++pub const TIOCLINUX: ::c_ulong =3D 21532;
++pub const TIOCGSERIAL: ::c_ulong =3D 21534;
++pub const TIOCEXCL: ::c_ulong =3D 21516;
++pub const TIOCNXCL: ::c_ulong =3D 21517;
++pub const TIOCSCTTY: ::c_ulong =3D 21518;
++pub const TIOCSTI: ::c_ulong =3D 21522;
++pub const TIOCMGET: ::c_ulong =3D 21525;
++pub const TIOCMBIS: ::c_ulong =3D 21526;
++pub const TIOCMBIC: ::c_ulong =3D 21527;
++pub const TIOCMSET: ::c_ulong =3D 21528;
++pub const TIOCCONS: ::c_ulong =3D 21533;
++pub const TIOCM_ST: ::c_int =3D 8;
++pub const TIOCM_SR: ::c_int =3D 16;
++pub const TIOCM_CTS: ::c_int =3D 32;
++pub const TIOCM_CAR: ::c_int =3D 64;
++pub const TIOCM_RNG: ::c_int =3D 128;
++pub const TIOCM_DSR: ::c_int =3D 256;
++pub const SFD_CLOEXEC: ::c_int =3D 524288;
++pub const NCCS: usize =3D 32;
++pub const O_TRUNC: ::c_int =3D 512;
++pub const O_CLOEXEC: ::c_int =3D 524288;
++pub const EBFONT: ::c_int =3D 59;
++pub const ENOSTR: ::c_int =3D 60;
++pub const ENODATA: ::c_int =3D 61;
++pub const ETIME: ::c_int =3D 62;
++pub const ENOSR: ::c_int =3D 63;
++pub const ENONET: ::c_int =3D 64;
++pub const ENOPKG: ::c_int =3D 65;
++pub const EREMOTE: ::c_int =3D 66;
++pub const ENOLINK: ::c_int =3D 67;
++pub const EADV: ::c_int =3D 68;
++pub const ESRMNT: ::c_int =3D 69;
++pub const ECOMM: ::c_int =3D 70;
++pub const EPROTO: ::c_int =3D 71;
++pub const EDOTDOT: ::c_int =3D 73;
++pub const SA_NODEFER: ::c_int =3D 1073741824;
++pub const SA_RESETHAND: ::c_int =3D -2147483648;
++pub const SA_RESTART: ::c_int =3D 268435456;
++pub const SA_NOCLDSTOP: ::c_int =3D 1;
++pub const EPOLL_CLOEXEC: ::c_int =3D 524288;
++pub const EFD_CLOEXEC: ::c_int =3D 524288;
++pub const __SIZEOF_PTHREAD_CONDATTR_T: usize =3D 4;
++pub const __SIZEOF_PTHREAD_MUTEXATTR_T: usize =3D 4;
++pub const O_DIRECT: ::c_int =3D 16384;
++pub const O_DIRECTORY: ::c_int =3D 65536;
++pub const O_NOFOLLOW: ::c_int =3D 131072;
++pub const MAP_HUGETLB: ::c_int =3D 262144;
++pub const MAP_LOCKED: ::c_int =3D 8192;
++pub const MAP_NORESERVE: ::c_int =3D 16384;
++pub const MAP_ANON: ::c_int =3D 32;
++pub const MAP_ANONYMOUS: ::c_int =3D 32;
++pub const MAP_DENYWRITE: ::c_int =3D 2048;
++pub const MAP_EXECUTABLE: ::c_int =3D 4096;
++pub const MAP_POPULATE: ::c_int =3D 32768;
++pub const MAP_NONBLOCK: ::c_int =3D 65536;
++pub const MAP_STACK: ::c_int =3D 131072;
++pub const MAP_SYNC : ::c_int =3D 0x080000;
++pub const EDEADLOCK: ::c_int =3D 35;
++pub const EUCLEAN: ::c_int =3D 117;
++pub const ENOTNAM: ::c_int =3D 118;
++pub const ENAVAIL: ::c_int =3D 119;
++pub const EISNAM: ::c_int =3D 120;
++pub const EREMOTEIO: ::c_int =3D 121;
++pub const FIOCLEX: ::c_ulong =3D 21585;
++pub const FIONCLEX: ::c_ulong =3D 21584;
++pub const FIONBIO: ::c_ulong =3D 21537;
++pub const MCL_CURRENT: ::c_int =3D 1;
++pub const MCL_FUTURE: ::c_int =3D 2;
++pub const SIGSTKSZ: ::size_t =3D 8192;
++pub const MINSIGSTKSZ: ::size_t =3D 2048;
++pub const CBAUD: ::tcflag_t =3D 4111;
++pub const TAB1: ::tcflag_t =3D 2048;
++pub const TAB2: ::tcflag_t =3D 4096;
++pub const TAB3: ::tcflag_t =3D 6144;
++pub const CR1: ::tcflag_t =3D 512;
++pub const CR2: ::tcflag_t =3D 1024;
++pub const CR3: ::tcflag_t =3D 1536;
++pub const FF1: ::tcflag_t =3D 32768;
++pub const BS1: ::tcflag_t =3D 8192;
++pub const VT1: ::tcflag_t =3D 16384;
++pub const VWERASE: usize =3D 14;
++pub const VREPRINT: usize =3D 12;
++pub const VSUSP: usize =3D 10;
++pub const VSTART: usize =3D 8;
++pub const VSTOP: usize =3D 9;
++pub const VDISCARD: usize =3D 13;
++pub const VTIME: usize =3D 5;
++pub const IXON: ::tcflag_t =3D 1024;
++pub const IXOFF: ::tcflag_t =3D 4096;
++pub const ONLCR: ::tcflag_t =3D 4;
++pub const CSIZE: ::tcflag_t =3D 48;
++pub const CS6: ::tcflag_t =3D 16;
++pub const CS7: ::tcflag_t =3D 32;
++pub const CS8: ::tcflag_t =3D 48;
++pub const CSTOPB: ::tcflag_t =3D 64;
++pub const CREAD: ::tcflag_t =3D 128;
++pub const PARENB: ::tcflag_t =3D 256;
++pub const PARODD: ::tcflag_t =3D 512;
++pub const HUPCL: ::tcflag_t =3D 1024;
++pub const CLOCAL: ::tcflag_t =3D 2048;
++pub const ECHOKE: ::tcflag_t =3D 2048;
++pub const ECHOE: ::tcflag_t =3D 16;
++pub const ECHOK: ::tcflag_t =3D 32;
++pub const ECHONL: ::tcflag_t =3D 64;
++pub const ECHOPRT: ::tcflag_t =3D 1024;
++pub const ECHOCTL: ::tcflag_t =3D 512;
++pub const ISIG: ::tcflag_t =3D 1;
++pub const ICANON: ::tcflag_t =3D 2;
++pub const PENDIN: ::tcflag_t =3D 16384;
++pub const NOFLSH: ::tcflag_t =3D 128;
++pub const CIBAUD: ::tcflag_t =3D 269418496;
++pub const CBAUDEX: ::tcflag_t =3D 4096;
++pub const VSWTC: usize =3D 7;
++pub const OLCUC: ::tcflag_t =3D 2;
++pub const NLDLY: ::tcflag_t =3D 256;
++pub const CRDLY: ::tcflag_t =3D 1536;
++pub const TABDLY: ::tcflag_t =3D 6144;
++pub const BSDLY: ::tcflag_t =3D 8192;
++pub const FFDLY: ::tcflag_t =3D 32768;
++pub const VTDLY: ::tcflag_t =3D 16384;
++pub const XTABS: ::tcflag_t =3D 6144;
++pub const B0: ::speed_t =3D 0;
++pub const B50: ::speed_t =3D 1;
++pub const B75: ::speed_t =3D 2;
++pub const B110: ::speed_t =3D 3;
++pub const B134: ::speed_t =3D 4;
++pub const B150: ::speed_t =3D 5;
++pub const B200: ::speed_t =3D 6;
++pub const B300: ::speed_t =3D 7;
++pub const B600: ::speed_t =3D 8;
++pub const B1200: ::speed_t =3D 9;
++pub const B1800: ::speed_t =3D 10;
++pub const B2400: ::speed_t =3D 11;
++pub const B4800: ::speed_t =3D 12;
++pub const B9600: ::speed_t =3D 13;
++pub const B19200: ::speed_t =3D 14;
++pub const B38400: ::speed_t =3D 15;
++pub const EXTA: ::speed_t =3D 14;
++pub const EXTB: ::speed_t =3D 15;
++pub const B57600: ::speed_t =3D 4097;
++pub const B115200: ::speed_t =3D 4098;
++pub const B230400: ::speed_t =3D 4099;
++pub const B460800: ::speed_t =3D 4100;
++pub const B500000: ::speed_t =3D 4101;
++pub const B576000: ::speed_t =3D 4102;
++pub const B921600: ::speed_t =3D 4103;
++pub const B1000000: ::speed_t =3D 4104;
++pub const B1152000: ::speed_t =3D 4105;
++pub const B1500000: ::speed_t =3D 4106;
++pub const B2000000: ::speed_t =3D 4107;
++pub const B2500000: ::speed_t =3D 4108;
++pub const B3000000: ::speed_t =3D 4109;
++pub const B3500000: ::speed_t =3D 4110;
++pub const B4000000: ::speed_t =3D 4111;
++pub const VEOL: usize =3D 11;
++pub const VEOL2: usize =3D 16;
++pub const VMIN: usize =3D 6;
++pub const IEXTEN: ::tcflag_t =3D 32768;
++pub const TOSTOP: ::tcflag_t =3D 256;
++pub const FLUSHO: ::tcflag_t =3D 4096;
++pub const EXTPROC: ::tcflag_t =3D 65536;
++pub const TCGETS: ::c_ulong =3D 21505;
++pub const TCSETS: ::c_ulong =3D 21506;
++pub const TCSETSW: ::c_ulong =3D 21507;
++pub const TCSETSF: ::c_ulong =3D 21508;
++pub const TCGETA: ::c_ulong =3D 21509;
++pub const TCSETA: ::c_ulong =3D 21510;
++pub const TCSETAW: ::c_ulong =3D 21511;
++pub const TCSETAF: ::c_ulong =3D 21512;
++pub const TCSBRK: ::c_ulong =3D 21513;
++pub const TCXONC: ::c_ulong =3D 21514;
++pub const TCFLSH: ::c_ulong =3D 21515;
++pub const TIOCINQ: ::c_ulong =3D 21531;
++pub const TIOCGPGRP: ::c_ulong =3D 21519;
++pub const TIOCSPGRP: ::c_ulong =3D 21520;
++pub const TIOCOUTQ: ::c_ulong =3D 21521;
++pub const TIOCGWINSZ: ::c_ulong =3D 21523;
++pub const TIOCSWINSZ: ::c_ulong =3D 21524;
++pub const FIONREAD: ::c_ulong =3D 21531;
++pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
++pub const __SIZEOF_PTHREAD_RWLOCK_T: usize =3D 56;
++pub const SYS_read: ::c_long =3D 63;
++pub const SYS_write: ::c_long =3D 64;
++pub const SYS_close: ::c_long =3D 57;
++pub const SYS_fstat: ::c_long =3D 80;
++pub const SYS_lseek: ::c_long =3D 62;
++pub const SYS_mmap: ::c_long =3D 222;
++pub const SYS_mprotect: ::c_long =3D 226;
++pub const SYS_munmap: ::c_long =3D 215;
++pub const SYS_brk: ::c_long =3D 214;
++pub const SYS_rt_sigaction: ::c_long =3D 134;
++pub const SYS_rt_sigprocmask: ::c_long =3D 135;
++pub const SYS_rt_sigreturn: ::c_long =3D 139;
++pub const SYS_ioctl: ::c_long =3D 29;
++pub const SYS_pread64: ::c_long =3D 67;
++pub const SYS_pwrite64: ::c_long =3D 68;
++pub const SYS_readv: ::c_long =3D 65;
++pub const SYS_writev: ::c_long =3D 66;
++pub const SYS_sched_yield: ::c_long =3D 124;
++pub const SYS_mremap: ::c_long =3D 216;
++pub const SYS_msync: ::c_long =3D 227;
++pub const SYS_mincore: ::c_long =3D 232;
++pub const SYS_madvise: ::c_long =3D 233;
++pub const SYS_shmget: ::c_long =3D 194;
++pub const SYS_shmat: ::c_long =3D 196;
++pub const SYS_shmctl: ::c_long =3D 195;
++pub const SYS_dup: ::c_long =3D 23;
++pub const SYS_nanosleep: ::c_long =3D 101;
++pub const SYS_getitimer: ::c_long =3D 102;
++pub const SYS_setitimer: ::c_long =3D 103;
++pub const SYS_getpid: ::c_long =3D 172;
++pub const SYS_sendfile: ::c_long =3D 71;
++pub const SYS_socket: ::c_long =3D 198;
++pub const SYS_connect: ::c_long =3D 203;
++pub const SYS_accept: ::c_long =3D 202;
++pub const SYS_sendto: ::c_long =3D 206;
++pub const SYS_recvfrom: ::c_long =3D 207;
++pub const SYS_sendmsg: ::c_long =3D 211;
++pub const SYS_recvmsg: ::c_long =3D 212;
++pub const SYS_shutdown: ::c_long =3D 210;
++pub const SYS_bind: ::c_long =3D 200;
++pub const SYS_listen: ::c_long =3D 201;
++pub const SYS_getsockname: ::c_long =3D 204;
++pub const SYS_getpeername: ::c_long =3D 205;
++pub const SYS_socketpair: ::c_long =3D 199;
++pub const SYS_setsockopt: ::c_long =3D 208;
++pub const SYS_getsockopt: ::c_long =3D 209;
++pub const SYS_clone: ::c_long =3D 220;
++pub const SYS_execve: ::c_long =3D 221;
++pub const SYS_exit: ::c_long =3D 93;
++pub const SYS_wait4: ::c_long =3D 260;
++pub const SYS_kill: ::c_long =3D 129;
++pub const SYS_uname: ::c_long =3D 160;
++pub const SYS_semget: ::c_long =3D 190;
++pub const SYS_semop: ::c_long =3D 193;
++pub const SYS_semctl: ::c_long =3D 191;
++pub const SYS_shmdt: ::c_long =3D 197;
++pub const SYS_msgget: ::c_long =3D 186;
++pub const SYS_msgsnd: ::c_long =3D 189;
++pub const SYS_msgrcv: ::c_long =3D 188;
++pub const SYS_msgctl: ::c_long =3D 187;
++pub const SYS_fcntl: ::c_long =3D 25;
++pub const SYS_flock: ::c_long =3D 32;
++pub const SYS_fsync: ::c_long =3D 82;
++pub const SYS_fdatasync: ::c_long =3D 83;
++pub const SYS_truncate: ::c_long =3D 45;
++pub const SYS_ftruncate: ::c_long =3D 46;
++pub const SYS_getcwd: ::c_long =3D 17;
++pub const SYS_chdir: ::c_long =3D 49;
++pub const SYS_fchdir: ::c_long =3D 50;
++pub const SYS_fchmod: ::c_long =3D 52;
++pub const SYS_fchown: ::c_long =3D 55;
++pub const SYS_umask: ::c_long =3D 166;
++pub const SYS_gettimeofday: ::c_long =3D 169;
++pub const SYS_getrlimit: ::c_long =3D 163;
++pub const SYS_getrusage: ::c_long =3D 165;
++pub const SYS_sysinfo: ::c_long =3D 179;
++pub const SYS_times: ::c_long =3D 153;
++pub const SYS_ptrace: ::c_long =3D 117;
++pub const SYS_getuid: ::c_long =3D 174;
++pub const SYS_syslog: ::c_long =3D 116;
++pub const SYS_getgid: ::c_long =3D 176;
++pub const SYS_setuid: ::c_long =3D 146;
++pub const SYS_setgid: ::c_long =3D 144;
++pub const SYS_geteuid: ::c_long =3D 175;
++pub const SYS_getegid: ::c_long =3D 177;
++pub const SYS_setpgid: ::c_long =3D 154;
++pub const SYS_getppid: ::c_long =3D 173;
++pub const SYS_setsid: ::c_long =3D 157;
++pub const SYS_setreuid: ::c_long =3D 145;
++pub const SYS_setregid: ::c_long =3D 143;
++pub const SYS_getgroups: ::c_long =3D 158;
++pub const SYS_setgroups: ::c_long =3D 159;
++pub const SYS_setresuid: ::c_long =3D 147;
++pub const SYS_getresuid: ::c_long =3D 148;
++pub const SYS_setresgid: ::c_long =3D 149;
++pub const SYS_getresgid: ::c_long =3D 150;
++pub const SYS_getpgid: ::c_long =3D 155;
++pub const SYS_setfsuid: ::c_long =3D 151;
++pub const SYS_setfsgid: ::c_long =3D 152;
++pub const SYS_getsid: ::c_long =3D 156;
++pub const SYS_capget: ::c_long =3D 90;
++pub const SYS_capset: ::c_long =3D 91;
++pub const SYS_rt_sigpending: ::c_long =3D 136;
++pub const SYS_rt_sigtimedwait: ::c_long =3D 137;
++pub const SYS_rt_sigqueueinfo: ::c_long =3D 138;
++pub const SYS_rt_sigsuspend: ::c_long =3D 133;
++pub const SYS_sigaltstack: ::c_long =3D 132;
++pub const SYS_personality: ::c_long =3D 92;
++pub const SYS_statfs: ::c_long =3D 43;
++pub const SYS_fstatfs: ::c_long =3D 44;
++pub const SYS_getpriority: ::c_long =3D 141;
++pub const SYS_setpriority: ::c_long =3D 140;
++pub const SYS_sched_setparam: ::c_long =3D 118;
++pub const SYS_sched_getparam: ::c_long =3D 121;
++pub const SYS_sched_setscheduler: ::c_long =3D 119;
++pub const SYS_sched_getscheduler: ::c_long =3D 120;
++pub const SYS_sched_get_priority_max: ::c_long =3D 125;
++pub const SYS_sched_get_priority_min: ::c_long =3D 126;
++pub const SYS_sched_rr_get_interval: ::c_long =3D 127;
++pub const SYS_mlock: ::c_long =3D 228;
++pub const SYS_munlock: ::c_long =3D 229;
++pub const SYS_mlockall: ::c_long =3D 230;
++pub const SYS_munlockall: ::c_long =3D 231;
++pub const SYS_vhangup: ::c_long =3D 58;
++pub const SYS_pivot_root: ::c_long =3D 41;
++pub const SYS_prctl: ::c_long =3D 167;
++pub const SYS_adjtimex: ::c_long =3D 171;
++pub const SYS_setrlimit: ::c_long =3D 164;
++pub const SYS_chroot: ::c_long =3D 51;
++pub const SYS_sync: ::c_long =3D 81;
++pub const SYS_acct: ::c_long =3D 89;
++pub const SYS_settimeofday: ::c_long =3D 170;
++pub const SYS_mount: ::c_long =3D 40;
++pub const SYS_umount2: ::c_long =3D 39;
++pub const SYS_swapon: ::c_long =3D 224;
++pub const SYS_swapoff: ::c_long =3D 225;
++pub const SYS_reboot: ::c_long =3D 142;
++pub const SYS_sethostname: ::c_long =3D 161;
++pub const SYS_setdomainname: ::c_long =3D 162;
++pub const SYS_init_module: ::c_long =3D 105;
++pub const SYS_delete_module: ::c_long =3D 106;
++pub const SYS_quotactl: ::c_long =3D 60;
++pub const SYS_nfsservctl: ::c_long =3D 42;
++pub const SYS_gettid: ::c_long =3D 178;
++pub const SYS_readahead: ::c_long =3D 213;
++pub const SYS_setxattr: ::c_long =3D 5;
++pub const SYS_lsetxattr: ::c_long =3D 6;
++pub const SYS_fsetxattr: ::c_long =3D 7;
++pub const SYS_getxattr: ::c_long =3D 8;
++pub const SYS_lgetxattr: ::c_long =3D 9;
++pub const SYS_fgetxattr: ::c_long =3D 10;
++pub const SYS_listxattr: ::c_long =3D 11;
++pub const SYS_llistxattr: ::c_long =3D 12;
++pub const SYS_flistxattr: ::c_long =3D 13;
++pub const SYS_removexattr: ::c_long =3D 14;
++pub const SYS_lremovexattr: ::c_long =3D 15;
++pub const SYS_fremovexattr: ::c_long =3D 16;
++pub const SYS_tkill: ::c_long =3D 130;
++pub const SYS_futex: ::c_long =3D 98;
++pub const SYS_sched_setaffinity: ::c_long =3D 122;
++pub const SYS_sched_getaffinity: ::c_long =3D 123;
++pub const SYS_io_setup: ::c_long =3D 0;
++pub const SYS_io_destroy: ::c_long =3D 1;
++pub const SYS_io_getevents: ::c_long =3D 4;
++pub const SYS_io_submit: ::c_long =3D 2;
++pub const SYS_io_cancel: ::c_long =3D 3;
++pub const SYS_lookup_dcookie: ::c_long =3D 18;
++pub const SYS_remap_file_pages: ::c_long =3D 234;
++pub const SYS_getdents64: ::c_long =3D 61;
++pub const SYS_set_tid_address: ::c_long =3D 96;
++pub const SYS_restart_syscall: ::c_long =3D 128;
++pub const SYS_semtimedop: ::c_long =3D 192;
++pub const SYS_fadvise64: ::c_long =3D 223;
++pub const SYS_timer_create: ::c_long =3D 107;
++pub const SYS_timer_settime: ::c_long =3D 110;
++pub const SYS_timer_gettime: ::c_long =3D 108;
++pub const SYS_timer_getoverrun: ::c_long =3D 109;
++pub const SYS_timer_delete: ::c_long =3D 111;
++pub const SYS_clock_settime: ::c_long =3D 112;
++pub const SYS_clock_gettime: ::c_long =3D 113;
++pub const SYS_clock_getres: ::c_long =3D 114;
++pub const SYS_clock_nanosleep: ::c_long =3D 115;
++pub const SYS_exit_group: ::c_long =3D 94;
++pub const SYS_epoll_ctl: ::c_long =3D 21;
++pub const SYS_tgkill: ::c_long =3D 131;
++pub const SYS_mbind: ::c_long =3D 235;
++pub const SYS_set_mempolicy: ::c_long =3D 237;
++pub const SYS_get_mempolicy: ::c_long =3D 236;
++pub const SYS_mq_open: ::c_long =3D 180;
++pub const SYS_mq_unlink: ::c_long =3D 181;
++pub const SYS_mq_timedsend: ::c_long =3D 182;
++pub const SYS_mq_timedreceive: ::c_long =3D 183;
++pub const SYS_mq_notify: ::c_long =3D 184;
++pub const SYS_mq_getsetattr: ::c_long =3D 185;
++pub const SYS_kexec_load: ::c_long =3D 104;
++pub const SYS_waitid: ::c_long =3D 95;
++pub const SYS_add_key: ::c_long =3D 217;
++pub const SYS_request_key: ::c_long =3D 218;
++pub const SYS_keyctl: ::c_long =3D 219;
++pub const SYS_ioprio_set: ::c_long =3D 30;
++pub const SYS_ioprio_get: ::c_long =3D 31;
++pub const SYS_inotify_add_watch: ::c_long =3D 27;
++pub const SYS_inotify_rm_watch: ::c_long =3D 28;
++pub const SYS_migrate_pages: ::c_long =3D 238;
++pub const SYS_openat: ::c_long =3D 56;
++pub const SYS_mkdirat: ::c_long =3D 34;
++pub const SYS_mknodat: ::c_long =3D 33;
++pub const SYS_fchownat: ::c_long =3D 54;
++pub const SYS_newfstatat: ::c_long =3D 79;
++pub const SYS_unlinkat: ::c_long =3D 35;
++pub const SYS_linkat: ::c_long =3D 37;
++pub const SYS_symlinkat: ::c_long =3D 36;
++pub const SYS_readlinkat: ::c_long =3D 78;
++pub const SYS_fchmodat: ::c_long =3D 53;
++pub const SYS_faccessat: ::c_long =3D 48;
++pub const SYS_pselect6: ::c_long =3D 72;
++pub const SYS_ppoll: ::c_long =3D 73;
++pub const SYS_unshare: ::c_long =3D 97;
++pub const SYS_set_robust_list: ::c_long =3D 99;
++pub const SYS_get_robust_list: ::c_long =3D 100;
++pub const SYS_splice: ::c_long =3D 76;
++pub const SYS_tee: ::c_long =3D 77;
++pub const SYS_sync_file_range: ::c_long =3D 84;
++pub const SYS_vmsplice: ::c_long =3D 75;
++pub const SYS_move_pages: ::c_long =3D 239;
++pub const SYS_utimensat: ::c_long =3D 88;
++pub const SYS_epoll_pwait: ::c_long =3D 22;
++pub const SYS_timerfd_create: ::c_long =3D 85;
++pub const SYS_fallocate: ::c_long =3D 47;
++pub const SYS_timerfd_settime: ::c_long =3D 86;
++pub const SYS_timerfd_gettime: ::c_long =3D 87;
++pub const SYS_accept4: ::c_long =3D 242;
++pub const SYS_signalfd4: ::c_long =3D 74;
++pub const SYS_eventfd2: ::c_long =3D 19;
++pub const SYS_epoll_create1: ::c_long =3D 20;
++pub const SYS_dup3: ::c_long =3D 24;
++pub const SYS_pipe2: ::c_long =3D 59;
++pub const SYS_inotify_init1: ::c_long =3D 26;
++pub const SYS_preadv: ::c_long =3D 69;
++pub const SYS_pwritev: ::c_long =3D 70;
++pub const SYS_rt_tgsigqueueinfo: ::c_long =3D 240;
++pub const SYS_perf_event_open: ::c_long =3D 241;
++pub const SYS_recvmmsg: ::c_long =3D 243;
++pub const SYS_fanotify_init: ::c_long =3D 262;
++pub const SYS_fanotify_mark: ::c_long =3D 263;
++pub const SYS_prlimit64: ::c_long =3D 261;
++pub const SYS_name_to_handle_at: ::c_long =3D 264;
++pub const SYS_open_by_handle_at: ::c_long =3D 265;
++pub const SYS_clock_adjtime: ::c_long =3D 266;
++pub const SYS_syncfs: ::c_long =3D 267;
++pub const SYS_sendmmsg: ::c_long =3D 269;
++pub const SYS_setns: ::c_long =3D 268;
++pub const SYS_getcpu: ::c_long =3D 168;
++pub const SYS_process_vm_readv: ::c_long =3D 270;
++pub const SYS_process_vm_writev: ::c_long =3D 271;
++pub const SYS_kcmp: ::c_long =3D 272;
++pub const SYS_finit_module: ::c_long =3D 273;
++pub const SYS_sched_setattr: ::c_long =3D 274;
++pub const SYS_sched_getattr: ::c_long =3D 275;
++pub const SYS_renameat2: ::c_long =3D 276;
++pub const SYS_seccomp: ::c_long =3D 277;
++pub const SYS_getrandom: ::c_long =3D 278;
++pub const SYS_memfd_create: ::c_long =3D 279;
++pub const SYS_bpf: ::c_long =3D 280;
++pub const SYS_execveat: ::c_long =3D 281;
++pub const SYS_userfaultfd: ::c_long =3D 282;
++pub const SYS_membarrier: ::c_long =3D 283;
++pub const SYS_mlock2: ::c_long =3D 284;
++pub const SYS_copy_file_range: ::c_long =3D 285;
++pub const SYS_preadv2: ::c_long =3D 286;
++pub const SYS_pwritev2: ::c_long =3D 287;
++pub const SYS_pkey_mprotect: ::c_long =3D 288;
++pub const SYS_pkey_alloc: ::c_long =3D 289;
++pub const SYS_pkey_free: ::c_long =3D 290;
++pub const SYS_statx: ::c_long =3D 291;
++pub const SYS_pidfd_open: ::c_long =3D 434;
++pub const SYS_clone3: ::c_long =3D 435;
diff --git a/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.r=
s-add-riscv64-to-b64-set-libc-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
new file mode 100644
index 0000000000..e993c45dea
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.rs-add-r=
iscv64-to-b64-set-libc-.patch
@@ -0,0 +1,26 @@
+From 4319893ebb7fca8bbd2bffc4bddb8d3ecdc08cc2 Mon Sep 17 00:00:00 2001
+From: Ralf Anton Beier <ralf_beier@me.com>
+Date: Sun, 8 Aug 2021 11:07:21 +0200
+Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set -
+ libc-0.2.93
+
+https://github.com/rust-lang/libc/pull/1994/commits/30070c822be2ef399b2ba3=
8cdc1d72ac694d65a3
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
+---
+ vendor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
++++ b/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
+@@ -800,7 +800,8 @@ cfg_if! {
+                  target_arch =3D "aarch64",
+                  target_arch =3D "mips64",
+                  target_arch =3D "powerpc64",
+-                 target_arch =3D "s390x"))] {
++                 target_arch =3D "s390x",
++                 target_arch =3D "riscv64"))] {
+         mod b64;
+         pub use self::b64::*;
+     } else if #[cfg(any(target_arch =3D "x86",
diff --git a/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definiti=
ons-to-match-musl-libc-0.2.93.patch b/meta/recipes-gnome/librsvg/librsvg/00=
07-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
new file mode 100644
index 0000000000..77e6b0ae1b
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definitions-to-=
match-musl-libc-0.2.93.patch
@@ -0,0 +1,736 @@
+From 9d240d05c6e6620f36e4ddbcbcb5862fb3269d9f Mon Sep 17 00:00:00 2001
+From: Ralf Anton Beier <ralf_beier@me.com>
+Date: Sun, 8 Aug 2021 11:09:17 +0200
+Subject: [PATCH 7/8] FIXUP Correct definitions to match musl - libc-0.2.93
+
+https://github.com/rust-lang/libc/pull/1994/commits/5f6a4d9745c79c81be63c7=
08515ab116786554a3
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
+---
+ .../linux_like/linux/musl/b64/riscv64/mod.rs  | 708 ++++++++----------
+ 1 file changed, 311 insertions(+), 397 deletions(-)
+
+--- a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+@@ -191,403 +191,8 @@ s! {
+         pub l_len: ::off64_t,
+         pub l_pid: ::pid_t,
+     }
+-
+-    pub struct ip_mreqn {
+-        pub imr_multiaddr: ::in_addr,
+-        pub imr_address: ::in_addr,
+-        pub imr_ifindex: ::c_int,
+-    }
+ }
+=20
+-pub const POSIX_FADV_DONTNEED: ::c_int =3D 4;
+-pub const POSIX_FADV_NOREUSE: ::c_int =3D 5;
+-pub const VEOF: usize =3D 4;
+-pub const RTLD_DEEPBIND: ::c_int =3D 0x8;
+-pub const RTLD_GLOBAL: ::c_int =3D 0x100;
+-pub const RTLD_NOLOAD: ::c_int =3D 0x4;
+-pub const TIOCGSOFTCAR: ::c_ulong =3D 21529;
+-pub const TIOCSSOFTCAR: ::c_ulong =3D 21530;
+-pub const TIOCGRS485: ::c_int =3D 21550;
+-pub const TIOCSRS485: ::c_int =3D 21551;
+-pub const RLIMIT_RSS: ::__rlimit_resource_t =3D 5;
+-pub const RLIMIT_AS: ::__rlimit_resource_t =3D 9;
+-pub const RLIMIT_MEMLOCK: ::__rlimit_resource_t =3D 8;
+-pub const RLIMIT_NOFILE: ::__rlimit_resource_t =3D 7;
+-pub const RLIMIT_NPROC: ::__rlimit_resource_t =3D 6;
+-pub const O_APPEND: ::c_int =3D 1024;
+-pub const O_CREAT: ::c_int =3D 64;
+-pub const O_EXCL: ::c_int =3D 128;
+-pub const O_NOCTTY: ::c_int =3D 256;
+-pub const O_NONBLOCK: ::c_int =3D 2048;
+-pub const O_SYNC: ::c_int =3D 1052672;
+-pub const O_RSYNC: ::c_int =3D 1052672;
+-pub const O_DSYNC: ::c_int =3D 4096;
+-pub const O_FSYNC: ::c_int =3D 1052672;
+-pub const O_NOATIME: ::c_int =3D 262144;
+-pub const O_PATH: ::c_int =3D 2097152;
+-pub const O_TMPFILE: ::c_int =3D 4259840;
+-pub const MAP_GROWSDOWN: ::c_int =3D 256;
+-pub const EDEADLK: ::c_int =3D 35;
+-pub const ENAMETOOLONG: ::c_int =3D 36;
+-pub const ENOLCK: ::c_int =3D 37;
+-pub const ENOSYS: ::c_int =3D 38;
+-pub const ENOTEMPTY: ::c_int =3D 39;
+-pub const ELOOP: ::c_int =3D 40;
+-pub const ENOMSG: ::c_int =3D 42;
+-pub const EIDRM: ::c_int =3D 43;
+-pub const ECHRNG: ::c_int =3D 44;
+-pub const EL2NSYNC: ::c_int =3D 45;
+-pub const EL3HLT: ::c_int =3D 46;
+-pub const EL3RST: ::c_int =3D 47;
+-pub const ELNRNG: ::c_int =3D 48;
+-pub const EUNATCH: ::c_int =3D 49;
+-pub const ENOCSI: ::c_int =3D 50;
+-pub const EL2HLT: ::c_int =3D 51;
+-pub const EBADE: ::c_int =3D 52;
+-pub const EBADR: ::c_int =3D 53;
+-pub const EXFULL: ::c_int =3D 54;
+-pub const ENOANO: ::c_int =3D 55;
+-pub const EBADRQC: ::c_int =3D 56;
+-pub const EBADSLT: ::c_int =3D 57;
+-pub const EMULTIHOP: ::c_int =3D 72;
+-pub const EOVERFLOW: ::c_int =3D 75;
+-pub const ENOTUNIQ: ::c_int =3D 76;
+-pub const EBADFD: ::c_int =3D 77;
+-pub const EBADMSG: ::c_int =3D 74;
+-pub const EREMCHG: ::c_int =3D 78;
+-pub const ELIBACC: ::c_int =3D 79;
+-pub const ELIBBAD: ::c_int =3D 80;
+-pub const ELIBSCN: ::c_int =3D 81;
+-pub const ELIBMAX: ::c_int =3D 82;
+-pub const ELIBEXEC: ::c_int =3D 83;
+-pub const EILSEQ: ::c_int =3D 84;
+-pub const ERESTART: ::c_int =3D 85;
+-pub const ESTRPIPE: ::c_int =3D 86;
+-pub const EUSERS: ::c_int =3D 87;
+-pub const ENOTSOCK: ::c_int =3D 88;
+-pub const EDESTADDRREQ: ::c_int =3D 89;
+-pub const EMSGSIZE: ::c_int =3D 90;
+-pub const EPROTOTYPE: ::c_int =3D 91;
+-pub const ENOPROTOOPT: ::c_int =3D 92;
+-pub const EPROTONOSUPPORT: ::c_int =3D 93;
+-pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
+-pub const EOPNOTSUPP: ::c_int =3D 95;
+-pub const EPFNOSUPPORT: ::c_int =3D 96;
+-pub const EAFNOSUPPORT: ::c_int =3D 97;
+-pub const EADDRINUSE: ::c_int =3D 98;
+-pub const EADDRNOTAVAIL: ::c_int =3D 99;
+-pub const ENETDOWN: ::c_int =3D 100;
+-pub const ENETUNREACH: ::c_int =3D 101;
+-pub const ENETRESET: ::c_int =3D 102;
+-pub const ECONNABORTED: ::c_int =3D 103;
+-pub const ECONNRESET: ::c_int =3D 104;
+-pub const ENOBUFS: ::c_int =3D 105;
+-pub const EISCONN: ::c_int =3D 106;
+-pub const ENOTCONN: ::c_int =3D 107;
+-pub const ESHUTDOWN: ::c_int =3D 108;
+-pub const ETOOMANYREFS: ::c_int =3D 109;
+-pub const ETIMEDOUT: ::c_int =3D 110;
+-pub const ECONNREFUSED: ::c_int =3D 111;
+-pub const EHOSTDOWN: ::c_int =3D 112;
+-pub const EHOSTUNREACH: ::c_int =3D 113;
+-pub const EALREADY: ::c_int =3D 114;
+-pub const EINPROGRESS: ::c_int =3D 115;
+-pub const ESTALE: ::c_int =3D 116;
+-pub const EDQUOT: ::c_int =3D 122;
+-pub const ENOMEDIUM: ::c_int =3D 123;
+-pub const EMEDIUMTYPE: ::c_int =3D 124;
+-pub const ECANCELED: ::c_int =3D 125;
+-pub const ENOKEY: ::c_int =3D 126;
+-pub const EKEYEXPIRED: ::c_int =3D 127;
+-pub const EKEYREVOKED: ::c_int =3D 128;
+-pub const EKEYREJECTED: ::c_int =3D 129;
+-pub const EOWNERDEAD: ::c_int =3D 130;
+-pub const ENOTRECOVERABLE: ::c_int =3D 131;
+-pub const EHWPOISON: ::c_int =3D 133;
+-pub const ERFKILL: ::c_int =3D 132;
+-pub const SOL_SOCKET: ::c_int =3D 1;
+-pub const SO_REUSEADDR: ::c_int =3D 2;
+-pub const SO_TYPE: ::c_int =3D 3;
+-pub const SO_ERROR: ::c_int =3D 4;
+-pub const SO_DONTROUTE: ::c_int =3D 5;
+-pub const SO_BROADCAST: ::c_int =3D 6;
+-pub const SO_SNDBUF: ::c_int =3D 7;
+-pub const SO_RCVBUF: ::c_int =3D 8;
+-pub const SO_SNDBUFFORCE: ::c_int =3D 32;
+-pub const SO_RCVBUFFORCE: ::c_int =3D 33;
+-pub const SO_KEEPALIVE: ::c_int =3D 9;
+-pub const SO_OOBINLINE: ::c_int =3D 10;
+-pub const SO_NO_CHECK: ::c_int =3D 11;
+-pub const SO_PRIORITY: ::c_int =3D 12;
+-pub const SO_LINGER: ::c_int =3D 13;
+-pub const SO_BSDCOMPAT: ::c_int =3D 14;
+-pub const SO_REUSEPORT: ::c_int =3D 15;
+-pub const SO_PASSCRED: ::c_int =3D 16;
+-pub const SO_PEERCRED: ::c_int =3D 17;
+-pub const SO_RCVLOWAT: ::c_int =3D 18;
+-pub const SO_SNDLOWAT: ::c_int =3D 19;
+-pub const SO_RCVTIMEO: ::c_int =3D 20;
+-pub const SO_SNDTIMEO: ::c_int =3D 21;
+-pub const SO_SECURITY_AUTHENTICATION: ::c_int =3D 22;
+-pub const SO_SECURITY_ENCRYPTION_TRANSPORT: ::c_int =3D 23;
+-pub const SO_SECURITY_ENCRYPTION_NETWORK: ::c_int =3D 24;
+-pub const SO_BINDTODEVICE: ::c_int =3D 25;
+-pub const SO_ATTACH_FILTER: ::c_int =3D 26;
+-pub const SO_DETACH_FILTER: ::c_int =3D 27;
+-pub const SO_GET_FILTER: ::c_int =3D 26;
+-pub const SO_PEERNAME: ::c_int =3D 28;
+-pub const SO_TIMESTAMP: ::c_int =3D 29;
+-pub const SO_ACCEPTCONN: ::c_int =3D 30;
+-pub const SO_PEERSEC: ::c_int =3D 31;
+-pub const SO_PASSSEC: ::c_int =3D 34;
+-pub const SO_TIMESTAMPNS: ::c_int =3D 35;
+-pub const SCM_TIMESTAMPNS: ::c_int =3D 35;
+-pub const SO_MARK: ::c_int =3D 36;
+-pub const SO_PROTOCOL: ::c_int =3D 38;
+-pub const SO_DOMAIN: ::c_int =3D 39;
+-pub const SO_RXQ_OVFL: ::c_int =3D 40;
+-pub const SO_WIFI_STATUS: ::c_int =3D 41;
+-pub const SCM_WIFI_STATUS: ::c_int =3D 41;
+-pub const SO_PEEK_OFF: ::c_int =3D 42;
+-pub const SO_NOFCS: ::c_int =3D 43;
+-pub const SO_LOCK_FILTER: ::c_int =3D 44;
+-pub const SO_SELECT_ERR_QUEUE: ::c_int =3D 45;
+-pub const SO_BUSY_POLL: ::c_int =3D 46;
+-pub const SO_MAX_PACING_RATE: ::c_int =3D 47;
+-pub const SO_BPF_EXTENSIONS: ::c_int =3D 48;
+-pub const SO_INCOMING_CPU: ::c_int =3D 49;
+-pub const SO_ATTACH_BPF: ::c_int =3D 50;
+-pub const SO_DETACH_BPF: ::c_int =3D 27;
+-pub const SOCK_STREAM: ::c_int =3D 1;
+-pub const SOCK_DGRAM: ::c_int =3D 2;
+-pub const SA_ONSTACK: ::c_int =3D 134217728;
+-pub const SA_SIGINFO: ::c_int =3D 4;
+-pub const SA_NOCLDWAIT: ::c_int =3D 2;
+-pub const SIGTTIN: ::c_int =3D 21;
+-pub const SIGTTOU: ::c_int =3D 22;
+-pub const SIGXCPU: ::c_int =3D 24;
+-pub const SIGXFSZ: ::c_int =3D 25;
+-pub const SIGVTALRM: ::c_int =3D 26;
+-pub const SIGPROF: ::c_int =3D 27;
+-pub const SIGWINCH: ::c_int =3D 28;
+-pub const SIGCHLD: ::c_int =3D 17;
+-pub const SIGBUS: ::c_int =3D 7;
+-pub const SIGUSR1: ::c_int =3D 10;
+-pub const SIGUSR2: ::c_int =3D 12;
+-pub const SIGCONT: ::c_int =3D 18;
+-pub const SIGSTOP: ::c_int =3D 19;
+-pub const SIGTSTP: ::c_int =3D 20;
+-pub const SIGURG: ::c_int =3D 23;
+-pub const SIGIO: ::c_int =3D 29;
+-pub const SIGSYS: ::c_int =3D 31;
+-pub const SIGSTKFLT: ::c_int =3D 16;
+-pub const SIGPOLL: ::c_int =3D 29;
+-pub const SIGPWR: ::c_int =3D 30;
+-pub const SIG_SETMASK: ::c_int =3D 2;
+-pub const SIG_BLOCK: ::c_int =3D 0;
+-pub const SIG_UNBLOCK: ::c_int =3D 1;
+-pub const POLLWRNORM: ::c_short =3D 256;
+-pub const POLLWRBAND: ::c_short =3D 512;
+-pub const O_ASYNC: ::c_int =3D 8192;
+-pub const O_NDELAY: ::c_int =3D 2048;
+-pub const PTRACE_DETACH: ::c_uint =3D 17;
+-pub const EFD_NONBLOCK: ::c_int =3D 2048;
+-pub const F_GETLK: ::c_int =3D 5;
+-pub const F_GETOWN: ::c_int =3D 9;
+-pub const F_SETOWN: ::c_int =3D 8;
+-pub const F_SETLK: ::c_int =3D 6;
+-pub const F_SETLKW: ::c_int =3D 7;
+-pub const F_RDLCK: ::c_int =3D 0;
+-pub const F_WRLCK: ::c_int =3D 1;
+-pub const F_UNLCK: ::c_int =3D 2;
+-pub const F_OFD_GETLK: ::c_int =3D 36;
+-pub const F_OFD_SETLK: ::c_int =3D 37;
+-pub const F_OFD_SETLKW: ::c_int =3D 38;
+-pub const SFD_NONBLOCK: ::c_int =3D 2048;
+-pub const TCSANOW: ::c_int =3D 0;
+-pub const TCSADRAIN: ::c_int =3D 1;
+-pub const TCSAFLUSH: ::c_int =3D 2;
+-pub const TIOCLINUX: ::c_ulong =3D 21532;
+-pub const TIOCGSERIAL: ::c_ulong =3D 21534;
+-pub const TIOCEXCL: ::c_ulong =3D 21516;
+-pub const TIOCNXCL: ::c_ulong =3D 21517;
+-pub const TIOCSCTTY: ::c_ulong =3D 21518;
+-pub const TIOCSTI: ::c_ulong =3D 21522;
+-pub const TIOCMGET: ::c_ulong =3D 21525;
+-pub const TIOCMBIS: ::c_ulong =3D 21526;
+-pub const TIOCMBIC: ::c_ulong =3D 21527;
+-pub const TIOCMSET: ::c_ulong =3D 21528;
+-pub const TIOCCONS: ::c_ulong =3D 21533;
+-pub const TIOCM_ST: ::c_int =3D 8;
+-pub const TIOCM_SR: ::c_int =3D 16;
+-pub const TIOCM_CTS: ::c_int =3D 32;
+-pub const TIOCM_CAR: ::c_int =3D 64;
+-pub const TIOCM_RNG: ::c_int =3D 128;
+-pub const TIOCM_DSR: ::c_int =3D 256;
+-pub const SFD_CLOEXEC: ::c_int =3D 524288;
+-pub const NCCS: usize =3D 32;
+-pub const O_TRUNC: ::c_int =3D 512;
+-pub const O_CLOEXEC: ::c_int =3D 524288;
+-pub const EBFONT: ::c_int =3D 59;
+-pub const ENOSTR: ::c_int =3D 60;
+-pub const ENODATA: ::c_int =3D 61;
+-pub const ETIME: ::c_int =3D 62;
+-pub const ENOSR: ::c_int =3D 63;
+-pub const ENONET: ::c_int =3D 64;
+-pub const ENOPKG: ::c_int =3D 65;
+-pub const EREMOTE: ::c_int =3D 66;
+-pub const ENOLINK: ::c_int =3D 67;
+-pub const EADV: ::c_int =3D 68;
+-pub const ESRMNT: ::c_int =3D 69;
+-pub const ECOMM: ::c_int =3D 70;
+-pub const EPROTO: ::c_int =3D 71;
+-pub const EDOTDOT: ::c_int =3D 73;
+-pub const SA_NODEFER: ::c_int =3D 1073741824;
+-pub const SA_RESETHAND: ::c_int =3D -2147483648;
+-pub const SA_RESTART: ::c_int =3D 268435456;
+-pub const SA_NOCLDSTOP: ::c_int =3D 1;
+-pub const EPOLL_CLOEXEC: ::c_int =3D 524288;
+-pub const EFD_CLOEXEC: ::c_int =3D 524288;
+-pub const __SIZEOF_PTHREAD_CONDATTR_T: usize =3D 4;
+-pub const __SIZEOF_PTHREAD_MUTEXATTR_T: usize =3D 4;
+-pub const O_DIRECT: ::c_int =3D 16384;
+-pub const O_DIRECTORY: ::c_int =3D 65536;
+-pub const O_NOFOLLOW: ::c_int =3D 131072;
+-pub const MAP_HUGETLB: ::c_int =3D 262144;
+-pub const MAP_LOCKED: ::c_int =3D 8192;
+-pub const MAP_NORESERVE: ::c_int =3D 16384;
+-pub const MAP_ANON: ::c_int =3D 32;
+-pub const MAP_ANONYMOUS: ::c_int =3D 32;
+-pub const MAP_DENYWRITE: ::c_int =3D 2048;
+-pub const MAP_EXECUTABLE: ::c_int =3D 4096;
+-pub const MAP_POPULATE: ::c_int =3D 32768;
+-pub const MAP_NONBLOCK: ::c_int =3D 65536;
+-pub const MAP_STACK: ::c_int =3D 131072;
+-pub const MAP_SYNC : ::c_int =3D 0x080000;
+-pub const EDEADLOCK: ::c_int =3D 35;
+-pub const EUCLEAN: ::c_int =3D 117;
+-pub const ENOTNAM: ::c_int =3D 118;
+-pub const ENAVAIL: ::c_int =3D 119;
+-pub const EISNAM: ::c_int =3D 120;
+-pub const EREMOTEIO: ::c_int =3D 121;
+-pub const FIOCLEX: ::c_ulong =3D 21585;
+-pub const FIONCLEX: ::c_ulong =3D 21584;
+-pub const FIONBIO: ::c_ulong =3D 21537;
+-pub const MCL_CURRENT: ::c_int =3D 1;
+-pub const MCL_FUTURE: ::c_int =3D 2;
+-pub const SIGSTKSZ: ::size_t =3D 8192;
+-pub const MINSIGSTKSZ: ::size_t =3D 2048;
+-pub const CBAUD: ::tcflag_t =3D 4111;
+-pub const TAB1: ::tcflag_t =3D 2048;
+-pub const TAB2: ::tcflag_t =3D 4096;
+-pub const TAB3: ::tcflag_t =3D 6144;
+-pub const CR1: ::tcflag_t =3D 512;
+-pub const CR2: ::tcflag_t =3D 1024;
+-pub const CR3: ::tcflag_t =3D 1536;
+-pub const FF1: ::tcflag_t =3D 32768;
+-pub const BS1: ::tcflag_t =3D 8192;
+-pub const VT1: ::tcflag_t =3D 16384;
+-pub const VWERASE: usize =3D 14;
+-pub const VREPRINT: usize =3D 12;
+-pub const VSUSP: usize =3D 10;
+-pub const VSTART: usize =3D 8;
+-pub const VSTOP: usize =3D 9;
+-pub const VDISCARD: usize =3D 13;
+-pub const VTIME: usize =3D 5;
+-pub const IXON: ::tcflag_t =3D 1024;
+-pub const IXOFF: ::tcflag_t =3D 4096;
+-pub const ONLCR: ::tcflag_t =3D 4;
+-pub const CSIZE: ::tcflag_t =3D 48;
+-pub const CS6: ::tcflag_t =3D 16;
+-pub const CS7: ::tcflag_t =3D 32;
+-pub const CS8: ::tcflag_t =3D 48;
+-pub const CSTOPB: ::tcflag_t =3D 64;
+-pub const CREAD: ::tcflag_t =3D 128;
+-pub const PARENB: ::tcflag_t =3D 256;
+-pub const PARODD: ::tcflag_t =3D 512;
+-pub const HUPCL: ::tcflag_t =3D 1024;
+-pub const CLOCAL: ::tcflag_t =3D 2048;
+-pub const ECHOKE: ::tcflag_t =3D 2048;
+-pub const ECHOE: ::tcflag_t =3D 16;
+-pub const ECHOK: ::tcflag_t =3D 32;
+-pub const ECHONL: ::tcflag_t =3D 64;
+-pub const ECHOPRT: ::tcflag_t =3D 1024;
+-pub const ECHOCTL: ::tcflag_t =3D 512;
+-pub const ISIG: ::tcflag_t =3D 1;
+-pub const ICANON: ::tcflag_t =3D 2;
+-pub const PENDIN: ::tcflag_t =3D 16384;
+-pub const NOFLSH: ::tcflag_t =3D 128;
+-pub const CIBAUD: ::tcflag_t =3D 269418496;
+-pub const CBAUDEX: ::tcflag_t =3D 4096;
+-pub const VSWTC: usize =3D 7;
+-pub const OLCUC: ::tcflag_t =3D 2;
+-pub const NLDLY: ::tcflag_t =3D 256;
+-pub const CRDLY: ::tcflag_t =3D 1536;
+-pub const TABDLY: ::tcflag_t =3D 6144;
+-pub const BSDLY: ::tcflag_t =3D 8192;
+-pub const FFDLY: ::tcflag_t =3D 32768;
+-pub const VTDLY: ::tcflag_t =3D 16384;
+-pub const XTABS: ::tcflag_t =3D 6144;
+-pub const B0: ::speed_t =3D 0;
+-pub const B50: ::speed_t =3D 1;
+-pub const B75: ::speed_t =3D 2;
+-pub const B110: ::speed_t =3D 3;
+-pub const B134: ::speed_t =3D 4;
+-pub const B150: ::speed_t =3D 5;
+-pub const B200: ::speed_t =3D 6;
+-pub const B300: ::speed_t =3D 7;
+-pub const B600: ::speed_t =3D 8;
+-pub const B1200: ::speed_t =3D 9;
+-pub const B1800: ::speed_t =3D 10;
+-pub const B2400: ::speed_t =3D 11;
+-pub const B4800: ::speed_t =3D 12;
+-pub const B9600: ::speed_t =3D 13;
+-pub const B19200: ::speed_t =3D 14;
+-pub const B38400: ::speed_t =3D 15;
+-pub const EXTA: ::speed_t =3D 14;
+-pub const EXTB: ::speed_t =3D 15;
+-pub const B57600: ::speed_t =3D 4097;
+-pub const B115200: ::speed_t =3D 4098;
+-pub const B230400: ::speed_t =3D 4099;
+-pub const B460800: ::speed_t =3D 4100;
+-pub const B500000: ::speed_t =3D 4101;
+-pub const B576000: ::speed_t =3D 4102;
+-pub const B921600: ::speed_t =3D 4103;
+-pub const B1000000: ::speed_t =3D 4104;
+-pub const B1152000: ::speed_t =3D 4105;
+-pub const B1500000: ::speed_t =3D 4106;
+-pub const B2000000: ::speed_t =3D 4107;
+-pub const B2500000: ::speed_t =3D 4108;
+-pub const B3000000: ::speed_t =3D 4109;
+-pub const B3500000: ::speed_t =3D 4110;
+-pub const B4000000: ::speed_t =3D 4111;
+-pub const VEOL: usize =3D 11;
+-pub const VEOL2: usize =3D 16;
+-pub const VMIN: usize =3D 6;
+-pub const IEXTEN: ::tcflag_t =3D 32768;
+-pub const TOSTOP: ::tcflag_t =3D 256;
+-pub const FLUSHO: ::tcflag_t =3D 4096;
+-pub const EXTPROC: ::tcflag_t =3D 65536;
+-pub const TCGETS: ::c_ulong =3D 21505;
+-pub const TCSETS: ::c_ulong =3D 21506;
+-pub const TCSETSW: ::c_ulong =3D 21507;
+-pub const TCSETSF: ::c_ulong =3D 21508;
+-pub const TCGETA: ::c_ulong =3D 21509;
+-pub const TCSETA: ::c_ulong =3D 21510;
+-pub const TCSETAW: ::c_ulong =3D 21511;
+-pub const TCSETAF: ::c_ulong =3D 21512;
+-pub const TCSBRK: ::c_ulong =3D 21513;
+-pub const TCXONC: ::c_ulong =3D 21514;
+-pub const TCFLSH: ::c_ulong =3D 21515;
+-pub const TIOCINQ: ::c_ulong =3D 21531;
+-pub const TIOCGPGRP: ::c_ulong =3D 21519;
+-pub const TIOCSPGRP: ::c_ulong =3D 21520;
+-pub const TIOCOUTQ: ::c_ulong =3D 21521;
+-pub const TIOCGWINSZ: ::c_ulong =3D 21523;
+-pub const TIOCSWINSZ: ::c_ulong =3D 21524;
+-pub const FIONREAD: ::c_ulong =3D 21531;
+-pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
+-pub const __SIZEOF_PTHREAD_RWLOCK_T: usize =3D 56;
+ pub const SYS_read: ::c_long =3D 63;
+ pub const SYS_write: ::c_long =3D 64;
+ pub const SYS_close: ::c_long =3D 57;
+@@ -863,5 +468,314 @@ pub const SYS_pkey_mprotect: ::c_long =3D
+ pub const SYS_pkey_alloc: ::c_long =3D 289;
+ pub const SYS_pkey_free: ::c_long =3D 290;
+ pub const SYS_statx: ::c_long =3D 291;
+-pub const SYS_pidfd_open: ::c_long =3D 434;
+-pub const SYS_clone3: ::c_long =3D 435;
++
++pub const O_APPEND: ::c_int =3D 1024;
++pub const O_DIRECT: ::c_int =3D 0x4000;
++pub const O_DIRECTORY: ::c_int =3D 0x10000;
++pub const O_LARGEFILE: ::c_int =3D 0;
++pub const O_NOFOLLOW: ::c_int =3D 0x20000;
++pub const O_CREAT: ::c_int =3D 64;
++pub const O_EXCL: ::c_int =3D 128;
++pub const O_NOCTTY: ::c_int =3D 256;
++pub const O_NONBLOCK: ::c_int =3D 2048;
++pub const O_SYNC: ::c_int =3D 1052672;
++pub const O_RSYNC: ::c_int =3D 1052672;
++pub const O_DSYNC: ::c_int =3D 4096;
++pub const O_ASYNC: ::c_int =3D 0x2000;
++
++pub const TIOCGRS485: ::c_int =3D 0x542E;
++pub const TIOCSRS485: ::c_int =3D 0x542F;
++
++pub const SIGSTKSZ: ::size_t =3D 8192;
++pub const MINSIGSTKSZ: ::size_t =3D 2048;
++
++pub const ENAMETOOLONG: ::c_int =3D 36;
++pub const ENOLCK: ::c_int =3D 37;
++pub const ENOSYS: ::c_int =3D 38;
++pub const ENOTEMPTY: ::c_int =3D 39;
++pub const ELOOP: ::c_int =3D 40;
++pub const ENOMSG: ::c_int =3D 42;
++pub const EIDRM: ::c_int =3D 43;
++pub const ECHRNG: ::c_int =3D 44;
++pub const EL2NSYNC: ::c_int =3D 45;
++pub const EL3HLT: ::c_int =3D 46;
++pub const EL3RST: ::c_int =3D 47;
++pub const ELNRNG: ::c_int =3D 48;
++pub const EUNATCH: ::c_int =3D 49;
++pub const ENOCSI: ::c_int =3D 50;
++pub const EL2HLT: ::c_int =3D 51;
++pub const EBADE: ::c_int =3D 52;
++pub const EBADR: ::c_int =3D 53;
++pub const EXFULL: ::c_int =3D 54;
++pub const ENOANO: ::c_int =3D 55;
++pub const EBADRQC: ::c_int =3D 56;
++pub const EBADSLT: ::c_int =3D 57;
++pub const EMULTIHOP: ::c_int =3D 72;
++pub const EOVERFLOW: ::c_int =3D 75;
++pub const ENOTUNIQ: ::c_int =3D 76;
++pub const EBADFD: ::c_int =3D 77;
++pub const EBADMSG: ::c_int =3D 74;
++pub const EREMCHG: ::c_int =3D 78;
++pub const ELIBACC: ::c_int =3D 79;
++pub const ELIBBAD: ::c_int =3D 80;
++pub const ELIBSCN: ::c_int =3D 81;
++pub const ELIBMAX: ::c_int =3D 82;
++pub const ELIBEXEC: ::c_int =3D 83;
++pub const EILSEQ: ::c_int =3D 84;
++pub const ERESTART: ::c_int =3D 85;
++pub const ESTRPIPE: ::c_int =3D 86;
++pub const EUSERS: ::c_int =3D 87;
++pub const ENOTSOCK: ::c_int =3D 88;
++pub const EDESTADDRREQ: ::c_int =3D 89;
++pub const EMSGSIZE: ::c_int =3D 90;
++pub const EPROTOTYPE: ::c_int =3D 91;
++pub const ENOPROTOOPT: ::c_int =3D 92;
++pub const EPROTONOSUPPORT: ::c_int =3D 93;
++pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
++pub const EOPNOTSUPP: ::c_int =3D 95;
++pub const EPFNOSUPPORT: ::c_int =3D 96;
++pub const EAFNOSUPPORT: ::c_int =3D 97;
++pub const EADDRINUSE: ::c_int =3D 98;
++pub const EADDRNOTAVAIL: ::c_int =3D 99;
++pub const ENETDOWN: ::c_int =3D 100;
++pub const ENETUNREACH: ::c_int =3D 101;
++pub const ENETRESET: ::c_int =3D 102;
++pub const ECONNABORTED: ::c_int =3D 103;
++pub const ECONNRESET: ::c_int =3D 104;
++pub const ENOBUFS: ::c_int =3D 105;
++pub const EISCONN: ::c_int =3D 106;
++pub const ENOTCONN: ::c_int =3D 107;
++pub const ESHUTDOWN: ::c_int =3D 108;
++pub const ETOOMANYREFS: ::c_int =3D 109;
++pub const ETIMEDOUT: ::c_int =3D 110;
++pub const ECONNREFUSED: ::c_int =3D 111;
++pub const EHOSTDOWN: ::c_int =3D 112;
++pub const EHOSTUNREACH: ::c_int =3D 113;
++pub const EALREADY: ::c_int =3D 114;
++pub const EINPROGRESS: ::c_int =3D 115;
++pub const ESTALE: ::c_int =3D 116;
++pub const EDQUOT: ::c_int =3D 122;
++pub const ENOMEDIUM: ::c_int =3D 123;
++pub const EMEDIUMTYPE: ::c_int =3D 124;
++pub const ECANCELED: ::c_int =3D 125;
++pub const ENOKEY: ::c_int =3D 126;
++pub const EKEYEXPIRED: ::c_int =3D 127;
++pub const EKEYREVOKED: ::c_int =3D 128;
++pub const EKEYREJECTED: ::c_int =3D 129;
++pub const EOWNERDEAD: ::c_int =3D 130;
++pub const ENOTRECOVERABLE: ::c_int =3D 131;
++pub const EHWPOISON: ::c_int =3D 133;
++pub const ERFKILL: ::c_int =3D 132;
++
++pub const SA_ONSTACK: ::c_int =3D 0x08000000;
++pub const SA_SIGINFO: ::c_int =3D 0x00000004;
++pub const SA_NOCLDWAIT: ::c_int =3D 0x00000002;
++
++pub const SIGCHLD: ::c_int =3D 17;
++pub const SIGBUS: ::c_int =3D 7;
++pub const SIGTTIN: ::c_int =3D 21;
++pub const SIGTTOU: ::c_int =3D 22;
++pub const SIGXCPU: ::c_int =3D 24;
++pub const SIGXFSZ: ::c_int =3D 25;
++pub const SIGVTALRM: ::c_int =3D 26;
++pub const SIGPROF: ::c_int =3D 27;
++pub const SIGWINCH: ::c_int =3D 28;
++pub const SIGUSR1: ::c_int =3D 10;
++pub const SIGUSR2: ::c_int =3D 12;
++pub const SIGCONT: ::c_int =3D 18;
++pub const SIGSTOP: ::c_int =3D 19;
++pub const SIGTSTP: ::c_int =3D 20;
++pub const SIGURG: ::c_int =3D 23;
++pub const SIGIO: ::c_int =3D 29;
++pub const SIGSYS: ::c_int =3D 31;
++pub const SIGSTKFLT: ::c_int =3D 16;
++pub const SIGPOLL: ::c_int =3D 29;
++pub const SIGPWR: ::c_int =3D 30;
++pub const SIG_SETMASK: ::c_int =3D 2;
++pub const SIG_BLOCK: ::c_int =3D 0x000000;
++pub const SIG_UNBLOCK: ::c_int =3D 0x01;
++
++pub const F_GETLK: ::c_int =3D 5;
++pub const F_GETOWN: ::c_int =3D 9;
++pub const F_SETLK: ::c_int =3D 6;
++pub const F_SETLKW: ::c_int =3D 7;
++pub const F_SETOWN: ::c_int =3D 8;
++pub const F_OFD_GETLK: ::c_int =3D 36;
++pub const F_OFD_SETLK: ::c_int =3D 37;
++pub const F_OFD_SETLKW: ::c_int =3D 38;
++
++pub const VEOF: usize =3D 4;
++
++pub const POLLWRNORM: ::c_short =3D 0x100;
++pub const POLLWRBAND: ::c_short =3D 0x200;
++
++pub const SOCK_STREAM: ::c_int =3D 1;
++pub const SOCK_DGRAM: ::c_int =3D 2;
++pub const SOL_SOCKET: ::c_int =3D 1;
++pub const SO_REUSEADDR: ::c_int =3D 2;
++pub const SO_TYPE: ::c_int =3D 3;
++pub const SO_ERROR: ::c_int =3D 4;
++pub const SO_DONTROUTE: ::c_int =3D 5;
++pub const SO_BROADCAST: ::c_int =3D 6;
++pub const SO_SNDBUF: ::c_int =3D 7;
++pub const SO_RCVBUF: ::c_int =3D 8;
++pub const SO_KEEPALIVE: ::c_int =3D 9;
++pub const SO_OOBINLINE: ::c_int =3D 10;
++pub const SO_NO_CHECK: ::c_int =3D 11;
++pub const SO_PRIORITY: ::c_int =3D 12;
++pub const SO_LINGER: ::c_int =3D 13;
++pub const SO_BSDCOMPAT: ::c_int =3D 14;
++pub const SO_REUSEPORT: ::c_int =3D 15;
++pub const SO_ACCEPTCONN: ::c_int =3D 30;
++pub const SO_SNDBUFFORCE: ::c_int =3D 32;
++pub const SO_RCVBUFFORCE: ::c_int =3D 33;
++pub const SO_PROTOCOL: ::c_int =3D 38;
++pub const SO_DOMAIN: ::c_int =3D 39;
++
++pub const MAP_ANON: ::c_int =3D 0x0020;
++pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
++pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
++pub const MAP_EXECUTABLE: ::c_int =3D 0x01000;
++pub const MAP_LOCKED: ::c_int =3D 0x02000;
++pub const MAP_NORESERVE: ::c_int =3D 0x04000;
++pub const MAP_POPULATE: ::c_int =3D 0x08000;
++pub const MAP_NONBLOCK: ::c_int =3D 0x010000;
++pub const MAP_STACK: ::c_int =3D 0x020000;
++pub const MAP_HUGETLB: ::c_int =3D 0x040000;
++pub const MAP_SYNC : ::c_int =3D 0x080000;
++
++pub const RLIMIT_NLIMITS: ::c_int =3D 15;
++pub const TIOCINQ: ::c_int =3D ::FIONREAD;
++pub const MCL_CURRENT: ::c_int =3D 0x0001;
++pub const MCL_FUTURE: ::c_int =3D 0x0002;
++pub const CBAUD: ::tcflag_t =3D 0o0010017;
++pub const TAB1: ::c_int =3D 0x00000800;
++pub const TAB2: ::c_int =3D 0x00001000;
++pub const TAB3: ::c_int =3D 0x00001800;
++pub const CR1: ::c_int =3D 0x00000200;
++pub const CR2: ::c_int =3D 0x00000400;
++pub const CR3: ::c_int =3D 0x00000600;
++pub const FF1: ::c_int =3D 0x00008000;
++pub const BS1: ::c_int =3D 0x00002000;
++pub const VT1: ::c_int =3D 0x00004000;
++pub const VWERASE: usize =3D 14;
++pub const VREPRINT: usize =3D 12;
++pub const VSUSP: usize =3D 10;
++pub const VSTART: usize =3D 8;
++pub const VSTOP: usize =3D 9;
++pub const VDISCARD: usize =3D 13;
++pub const VTIME: usize =3D 5;
++pub const IXON: ::tcflag_t =3D 0x00000400;
++pub const IXOFF: ::tcflag_t =3D 0x00001000;
++pub const ONLCR: ::tcflag_t =3D 0x4;
++pub const CSIZE: ::tcflag_t =3D 0x00000030;
++pub const CS6: ::tcflag_t =3D 0x00000010;
++pub const CS7: ::tcflag_t =3D 0x00000020;
++pub const CS8: ::tcflag_t =3D 0x00000030;
++pub const CSTOPB: ::tcflag_t =3D 0x00000040;
++pub const CREAD: ::tcflag_t =3D 0x00000080;
++pub const PARENB: ::tcflag_t =3D 0x00000100;
++pub const PARODD: ::tcflag_t =3D 0x00000200;
++pub const HUPCL: ::tcflag_t =3D 0x00000400;
++pub const CLOCAL: ::tcflag_t =3D 0x00000800;
++pub const ECHOKE: ::tcflag_t =3D 0x00000800;
++pub const ECHOE: ::tcflag_t =3D 0x00000010;
++pub const ECHOK: ::tcflag_t =3D 0x00000020;
++pub const ECHONL: ::tcflag_t =3D 0x00000040;
++pub const ECHOPRT: ::tcflag_t =3D 0x00000400;
++pub const ECHOCTL: ::tcflag_t =3D 0x00000200;
++pub const ISIG: ::tcflag_t =3D 0x00000001;
++pub const ICANON: ::tcflag_t =3D 0x00000002;
++pub const PENDIN: ::tcflag_t =3D 0x00004000;
++pub const NOFLSH: ::tcflag_t =3D 0x00000080;
++pub const CIBAUD: ::tcflag_t =3D 0o02003600000;
++pub const CBAUDEX: ::tcflag_t =3D 0o010000;
++pub const VSWTC: usize =3D 7;
++pub const OLCUC: ::tcflag_t =3D 0o000002;
++pub const NLDLY: ::tcflag_t =3D 0o000400;
++pub const CRDLY: ::tcflag_t =3D 0o003000;
++pub const TABDLY: ::tcflag_t =3D 0o014000;
++pub const BSDLY: ::tcflag_t =3D 0o020000;
++pub const FFDLY: ::tcflag_t =3D 0o100000;
++pub const VTDLY: ::tcflag_t =3D 0o040000;
++pub const XTABS: ::tcflag_t =3D 0o014000;
++pub const B57600: ::speed_t =3D 0o010001;
++pub const B115200: ::speed_t =3D 0o010002;
++pub const B230400: ::speed_t =3D 0o010003;
++pub const B460800: ::speed_t =3D 0o010004;
++pub const B500000: ::speed_t =3D 0o010005;
++pub const B576000: ::speed_t =3D 0o010006;
++pub const B921600: ::speed_t =3D 0o010007;
++pub const B1000000: ::speed_t =3D 0o010010;
++pub const B1152000: ::speed_t =3D 0o010011;
++pub const B1500000: ::speed_t =3D 0o010012;
++pub const B2000000: ::speed_t =3D 0o010013;
++pub const B2500000: ::speed_t =3D 0o010014;
++pub const B3000000: ::speed_t =3D 0o010015;
++pub const B3500000: ::speed_t =3D 0o010016;
++pub const B4000000: ::speed_t =3D 0o010017;
++
++pub const FIOCLEX: ::c_int =3D 0x5451;
++pub const FIONCLEX: ::c_int =3D 0x5450;
++pub const FIONBIO: ::c_int =3D 0x5421;
++pub const EDEADLK: ::c_int =3D 35;
++pub const EDEADLOCK: ::c_int =3D EDEADLK;
++pub const SO_PASSCRED: ::c_int =3D 16;
++pub const SO_PEERCRED: ::c_int =3D 17;
++pub const SO_RCVLOWAT: ::c_int =3D 18;
++pub const SO_SNDLOWAT: ::c_int =3D 19;
++pub const SO_RCVTIMEO: ::c_int =3D 20;
++pub const SO_SNDTIMEO: ::c_int =3D 21;
++pub const EXTPROC: ::tcflag_t =3D 0x00010000;
++pub const VEOL: usize =3D 11;
++pub const VEOL2: usize =3D 16;
++pub const VMIN: usize =3D 6;
++pub const IEXTEN: ::tcflag_t =3D 0x00008000;
++pub const TOSTOP: ::tcflag_t =3D 0x00000100;
++pub const FLUSHO: ::tcflag_t =3D 0x00001000;
++pub const TCGETS: ::c_int =3D 0x5401;
++pub const TCSETS: ::c_int =3D 0x5402;
++pub const TCSETSW: ::c_int =3D 0x5403;
++pub const TCSETSF: ::c_int =3D 0x5404;
++pub const TCGETA: ::c_int =3D 0x5405;
++pub const TCSETA: ::c_int =3D 0x5406;
++pub const TCSETAW: ::c_int =3D 0x5407;
++pub const TCSETAF: ::c_int =3D 0x5408;
++pub const TCSBRK: ::c_int =3D 0x5409;
++pub const TCXONC: ::c_int =3D 0x540A;
++pub const TCFLSH: ::c_int =3D 0x540B;
++pub const TIOCGSOFTCAR: ::c_int =3D 0x5419;
++pub const TIOCSSOFTCAR: ::c_int =3D 0x541A;
++pub const TIOCLINUX: ::c_int =3D 0x541C;
++pub const TIOCGSERIAL: ::c_int =3D 0x541E;
++pub const TIOCEXCL: ::c_int =3D 0x540C;
++pub const TIOCNXCL: ::c_int =3D 0x540D;
++pub const TIOCSCTTY: ::c_int =3D 0x540E;
++pub const TIOCGPGRP: ::c_int =3D 0x540F;
++pub const TIOCSPGRP: ::c_int =3D 0x5410;
++pub const TIOCOUTQ: ::c_int =3D 0x5411;
++pub const TIOCSTI: ::c_int =3D 0x5412;
++pub const TIOCGWINSZ: ::c_int =3D 0x5413;
++pub const TIOCSWINSZ: ::c_int =3D 0x5414;
++pub const TIOCMGET: ::c_int =3D 0x5415;
++pub const TIOCMBIS: ::c_int =3D 0x5416;
++pub const TIOCMBIC: ::c_int =3D 0x5417;
++pub const TIOCMSET: ::c_int =3D 0x5418;
++pub const FIONREAD: ::c_int =3D 0x541B;
++pub const TIOCCONS: ::c_int =3D 0x541D;
++
++pub const TIOCM_LE: ::c_int =3D 0x001;
++pub const TIOCM_DTR: ::c_int =3D 0x002;
++pub const TIOCM_RTS: ::c_int =3D 0x004;
++pub const TIOCM_ST: ::c_int =3D 0x008;
++pub const TIOCM_SR: ::c_int =3D 0x010;
++pub const TIOCM_CTS: ::c_int =3D 0x020;
++pub const TIOCM_CAR: ::c_int =3D 0x040;
++pub const TIOCM_RNG: ::c_int =3D 0x080;
++pub const TIOCM_DSR: ::c_int =3D 0x100;
++pub const TIOCM_CD: ::c_int =3D TIOCM_CAR;
++pub const TIOCM_RI: ::c_int =3D TIOCM_RNG;
++
++extern "C" {
++    pub fn ioctl(fd: ::c_int, request: ::c_int, ...) -> ::c_int;
++}
diff --git a/meta/recipes-gnome/librsvg/librsvg/0008-Update-checksums-for-m=
odified-files-for-rust-1.54.0-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
008-Update-checksums-for-modified-files-for-rust-1.54.0-.patch
new file mode 100644
index 0000000000..5397e62a8f
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0008-Update-checksums-for-modified=
-files-for-rust-1.54.0-.patch
@@ -0,0 +1,17 @@
+From 2b1c373f9a3341e8926d6be8d7cdcedc1fc6fca3 Mon Sep 17 00:00:00 2001
+From: Ralf Anton Beier <ralf_beier@me.com>
+Date: Sun, 8 Aug 2021 11:19:24 +0200
+Subject: [PATCH 8/8] Update checksums for modified files for rust 1.54.0 a=
nd
+ libc-0.2.93
+
+Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
+---
+ vendor/libc-0.2.93/.cargo-checksum.json | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/vendor/libc/.cargo-checksum.json
++++ b/vendor/libc/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"1a940eb7542de3255de41e1849164fc949934b4=
ca72320c1f76856a06121fe7c","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"bd63a2745497d8dbb4109d64a5f=
04153fd0c47fc171096608b690d997186cdc3","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"db0167148e1e5915a4d5192b5da5=
955ab1eb02d5d6d354b8d77ac10edcd2f0a5","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"2a215bd6136b8617aacedf9be738ccee94da9d29b418e9a78101d6291c182352"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"08215=
43bf2073cb3dc46157e47140caa30704e062b23099d52bf80cb56e25321","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc=
80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/freebsd1=
3/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"21416cad3e76f53d10d0=
c73840469290aa80c2d92c773307a1ca92485d3c0e13","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3=
daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"433349d5328359=
004f1624547918ac817d9c9268023c51bc6dc7834c7e73a3d9","src/unix/bsd/freebsdli=
ke/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da58=
20492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87e=
ac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebs=
dlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05=
a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88=
fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/free=
bsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99e7d9cbee4cf088d3dd4799=
5110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.rs":"9ff67329eb131a446=
51d013d31cebb3dbf6cf10659743fe31804ccfaa75a0c2a","src/unix/bsd/mod.rs":"2fe=
d08973739d7f6a7412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bs=
d/netbsdlike/mod.rs":"4e9da54e541773c7ad4cca9dade1df00f28f2fdac3f8df5957f4c=
74b7e082344","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028=
401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/n=
etbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a92=
4452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"349bccc41f0c7ce04618316ed8e1=
e970a1af6fa8aad458ab908b128c72c51317","src/unix/bsd/netbsdlike/netbsd/power=
pc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","=
src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960=
613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":=
"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/uni=
x/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6=
db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd=
91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/b=
sd/netbsdlike/openbsd/mod.rs":"f259586d51d3fcaf7a8515301e2128e84e45bd1f7bfd=
08f4f8915686a4b0382e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd28=
7afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/ne=
tbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569=
e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289=
c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs=
":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/u=
nix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337f=
c995900b","src/unix/haiku/mod.rs":"912969bc1d59a6cec74de3140982b7f0b69e74d4=
4936646587f1c8820be7c0fe","src/unix/haiku/native.rs":"44855f52906f607de137f=
c4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/haiku/x86_64.rs":"3e=
c3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/h=
ermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe08=
777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed4=
13841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49=
ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android=
/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e00150063b24ddc6076833=
2a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a96f5892f98e1edc31=
33cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like/android/b32/x86/=
align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab=
","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc=
95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aar=
ch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca=
35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"8fe667d2b14abc5ac8=
aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/unix/linux_like/androi=
d/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5c=
ce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d2121587=
8c95fe07c19","src/unix/linux_like/android/mod.rs":"8688204b3236db28b66ff0f1=
de5320f47ec5c1ef5395dddcc9df025a8d78630a","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"6ef97140ca6fb24125fdd0aacb986ef78=
5aa21993229660d7f703f8875ebfe49","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7=
fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff=
1fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c0=
0e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88=
cf581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded70=
8124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed00=
9dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5=
c049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"=
429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix=
/linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac=
9118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"=
794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4b401478fcd9","src/unix=
/linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2=
bfcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mo=
d.rs":"ee5145a383386b716605a8d1ff3df212d418aae1aa1f37d2307d4f9cd1a08e99","s=
rc/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf=
733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32=
/sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eead=
afb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a=
81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/=
gnu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc=
2f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b16=
08fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a85780=
11cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.=
rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src=
/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef=
2633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/m=
ips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c99=
51e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e8=
648948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linu=
x/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13e163fdadaefd108bd=
8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868b=
becfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_li=
ke/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a=
2d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.r=
s":"5b982c41097f4f91adcb0968290afeccb27dce1695a261c964d34ef85df87cf4","src/=
unix/linux_like/linux/gnu/b64/s390x.rs":"a9484dfd3c7ca1174537957bef997c3ba7=
ea41989cdf61ede22b1bbc45a667bf","src/unix/linux_like/linux/gnu/b64/sparc64/=
align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9=
","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c24=
6e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu=
/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21=
696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c9=
2f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_lik=
e/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b540=
4995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs=
":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/u=
nix/linux_like/linux/gnu/mod.rs":"40c27ffea8b9be8aae451468efdc656a452ab48dd=
8f1cc0664fa3f434b824806","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/mod.rs":"a35acd9727c9046879479a4a2b3e571bf085a19d5afbb672a4764=
3ce4a1105c7","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10=
43764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like=
/linux/musl/b32/arm/mod.rs":"6255abe2ee04986832d12b7b2190589580f2a43e9bfb28=
5b32b5747227f62727","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a88117=
91809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux=
_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs=
":"b9e9ff42363ebbb884ddf6445129ec4164471df45846874fc08f5f458e659254","src/u=
nix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edba=
fc0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.r=
s":"4592dc5f1f2fe888dfef85fa862d42d168e73a2c6f4fc052b58287d0f4d4ffcd","src/=
unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433b=
ece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs":"a19a8decfab185af3cebd34aae4b15082e7552be573904b8c1a3f0c0e493ef34=
","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce23539=
4f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/=
musl/b64/aarch64/mod.rs":"a73035c6d9b776f13b839008e15c04c2c53455571efd06664=
affcb047e457112","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451=
f3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_lik=
e/linux/musl/b64/mod.rs":"d18abc0aeba2e26342bf3416a4dba0836db2bb0ee013b0a39=
629475cf8640289","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a5552=
5b42493923956d668f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8f=
a437cc5dbd54882c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf=
137b800d0ff323286a92c8a2c382b5456","src/unix/linux_like/linux/musl/mod.rs":=
"81690cfec80ae3de9dc7e3d31b251de46863a87b534e038a56fa0bedc0986889","src/uni=
x/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac5333016268=
3d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed161=
38d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux=
_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec=
7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"9b6=
91eeec0a9bf7b2abb87e09062d2c148d18e11c96ecad0edd0b74d1d0509fd","src/unix/li=
nux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb=
632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips3=
2/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"18753a99b820d69e=
062e3ba22a63fa86577b6dcc42f740479c7be1a4c658e1be","src/unix/linux_like/linu=
x/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b9=
6b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/ali=
gn.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","=
src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c=
55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucl=
ibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2a=
d4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"656fbf=
5157ab6d06fc365a8353b138818ad5b8429ea5628ff35a3972c63a1a7c","src/unix/linux=
_like/linux/uclibc/mod.rs":"6885187dc15e9239981ad36ac5bdc8559ae4c55775c8e30=
4ae1a2093568d93f2","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370=
46524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_l=
ike/linux/uclibc/x86_64/l4re.rs":"bb31053d6403091e11f95ac2203982f279f8b984a=
19adf30796878c45fdd8c25","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"=
02e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix=
/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31=
b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"9f6eadebed1=
53e31777482932dae2f3fd3471d5b5465099f98f1e2a9429922fe","src/unix/mod.rs":"6=
b2b57833e37cd3231944696c8216eb587a2a68069346150cf321153eaf04d03","src/unix/=
newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b31=
09639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf6=
5f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd=
7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/esp=
idf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3110394ed5a=
3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a7a1d6d4382=
149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4=
d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs"=
:"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/un=
ix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22d=
e78e53","src/unix/redox/mod.rs":"267a413e63dbdcaed6e758f9a5c10bd00178ed76c7=
b3527e8e984341f617d3a5","src/unix/solarish/compat.rs":"b07a5bfac925eb012003=
a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs=
":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca13252278e","src/u=
nix/solarish/mod.rs":"c64c346ee61175c23cc4fa750bfdab4486fcabf20aec54dac4f05=
a782a89a26a","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfe=
c80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs":"9d761573=
bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vxworks/aarc=
h64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99",=
"src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15=
ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d=
98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0=
afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/=
x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba",=
"src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b90=
0a7f98ed6b514a","src/wasi.rs":"2c945bce3ddd26bf20ff03fb4192c9c3f625f1308a47=
9c5cb4bd4510a892629a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80=
c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb=
7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.=
rs":"cf605ceefc10481aaf6274a205b2899abeb7c043bd384ff766dcb301318dfa2a","src=
/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e80b5d09f6e4502e85daa4=
797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a3=
94e7774c7e545f21f1f4"},"package":"a2a5ac8f984bfcf3a823267e5fde638acc3325f64=
96633a5da6bb6eb2171e103"}
+\ No newline at end of file
++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"1a940eb7542de3255de41e1849164fc949934b4=
ca72320c1f76856a06121fe7c","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"bd63a2745497d8dbb4109d64a5f=
04153fd0c47fc171096608b690d997186cdc3","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"db0167148e1e5915a4d5192b5da5=
955ab1eb02d5d6d354b8d77ac10edcd2f0a5","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"2a215bd6136b8617aacedf9be738ccee94da9d29b418e9a78101d6291c182352"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"08215=
43bf2073cb3dc46157e47140caa30704e062b23099d52bf80cb56e25321","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc=
80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/freebsd1=
3/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"21416cad3e76f53d10d0=
c73840469290aa80c2d92c773307a1ca92485d3c0e13","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3=
daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"433349d5328359=
004f1624547918ac817d9c9268023c51bc6dc7834c7e73a3d9","src/unix/bsd/freebsdli=
ke/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da58=
20492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87e=
ac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebs=
dlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05=
a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88=
fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/free=
bsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99e7d9cbee4cf088d3dd4799=
5110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.rs":"9ff67329eb131a446=
51d013d31cebb3dbf6cf10659743fe31804ccfaa75a0c2a","src/unix/bsd/mod.rs":"2fe=
d08973739d7f6a7412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bs=
d/netbsdlike/mod.rs":"4e9da54e541773c7ad4cca9dade1df00f28f2fdac3f8df5957f4c=
74b7e082344","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028=
401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/n=
etbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a92=
4452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"349bccc41f0c7ce04618316ed8e1=
e970a1af6fa8aad458ab908b128c72c51317","src/unix/bsd/netbsdlike/netbsd/power=
pc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","=
src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960=
613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":=
"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/uni=
x/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6=
db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd=
91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/b=
sd/netbsdlike/openbsd/mod.rs":"f259586d51d3fcaf7a8515301e2128e84e45bd1f7bfd=
08f4f8915686a4b0382e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd28=
7afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/ne=
tbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569=
e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289=
c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs=
":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/u=
nix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337f=
c995900b","src/unix/haiku/mod.rs":"912969bc1d59a6cec74de3140982b7f0b69e74d4=
4936646587f1c8820be7c0fe","src/unix/haiku/native.rs":"44855f52906f607de137f=
c4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/haiku/x86_64.rs":"3e=
c3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/h=
ermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe08=
777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed4=
13841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49=
ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android=
/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e00150063b24ddc6076833=
2a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a96f5892f98e1edc31=
33cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like/android/b32/x86/=
align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab=
","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc=
95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aar=
ch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca=
35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"8fe667d2b14abc5ac8=
aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/unix/linux_like/androi=
d/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5c=
ce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d2121587=
8c95fe07c19","src/unix/linux_like/android/mod.rs":"8688204b3236db28b66ff0f1=
de5320f47ec5c1ef5395dddcc9df025a8d78630a","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"6ef97140ca6fb24125fdd0aacb986ef78=
5aa21993229660d7f703f8875ebfe49","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7=
fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff=
1fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c0=
0e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88=
cf581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded70=
8124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed00=
9dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5=
c049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"=
429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix=
/linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac=
9118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"=
794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4b401478fcd9","src/unix=
/linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2=
bfcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mo=
d.rs":"ee5145a383386b716605a8d1ff3df212d418aae1aa1f37d2307d4f9cd1a08e99","s=
rc/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf=
733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32=
/sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eead=
afb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a=
81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/=
gnu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc=
2f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b16=
08fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a85780=
11cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.=
rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src=
/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef=
2633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/m=
ips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c99=
51e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e8=
648948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linu=
x/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13e163fdadaefd108bd=
8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868b=
becfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_li=
ke/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a=
2d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.r=
s":"5b982c41097f4f91adcb0968290afeccb27dce1695a261c964d34ef85df87cf4","src/=
unix/linux_like/linux/gnu/b64/s390x.rs":"a9484dfd3c7ca1174537957bef997c3ba7=
ea41989cdf61ede22b1bbc45a667bf","src/unix/linux_like/linux/gnu/b64/sparc64/=
align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9=
","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c24=
6e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu=
/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21=
696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c9=
2f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_lik=
e/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b540=
4995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs=
":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/u=
nix/linux_like/linux/gnu/mod.rs":"40c27ffea8b9be8aae451468efdc656a452ab48dd=
8f1cc0664fa3f434b824806","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/mod.rs":"a35acd9727c9046879479a4a2b3e571bf085a19d5afbb672a4764=
3ce4a1105c7","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10=
43764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like=
/linux/musl/b32/arm/mod.rs":"6255abe2ee04986832d12b7b2190589580f2a43e9bfb28=
5b32b5747227f62727","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a88117=
91809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux=
_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs=
":"b9e9ff42363ebbb884ddf6445129ec4164471df45846874fc08f5f458e659254","src/u=
nix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edba=
fc0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.r=
s":"4592dc5f1f2fe888dfef85fa862d42d168e73a2c6f4fc052b58287d0f4d4ffcd","src/=
unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433b=
ece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs":"a19a8decfab185af3cebd34aae4b15082e7552be573904b8c1a3f0c0e493ef34=
","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce23539=
4f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/=
musl/b64/aarch64/mod.rs":"a73035c6d9b776f13b839008e15c04c2c53455571efd06664=
affcb047e457112","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451=
f3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_lik=
e/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938cdccf40d985dafc11e90f=
235947735a09bac","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a5552=
5b42493923956d668f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8f=
a437cc5dbd54882c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf=
137b800d0ff323286a92c8a2c382b5456","src/unix/linux_like/linux/musl/mod.rs":=
"c3848f5f02360d96e300ef942b186b9e6e885009ee8a2ce4d2aec0a201c7ae25","src/uni=
x/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac5333016268=
3d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed161=
38d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux=
_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec=
7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"9b6=
91eeec0a9bf7b2abb87e09062d2c148d18e11c96ecad0edd0b74d1d0509fd","src/unix/li=
nux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb=
632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips3=
2/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"18753a99b820d69e=
062e3ba22a63fa86577b6dcc42f740479c7be1a4c658e1be","src/unix/linux_like/linu=
x/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b9=
6b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/ali=
gn.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","=
src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c=
55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucl=
ibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2a=
d4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"656fbf=
5157ab6d06fc365a8353b138818ad5b8429ea5628ff35a3972c63a1a7c","src/unix/linux=
_like/linux/uclibc/mod.rs":"6885187dc15e9239981ad36ac5bdc8559ae4c55775c8e30=
4ae1a2093568d93f2","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370=
46524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_l=
ike/linux/uclibc/x86_64/l4re.rs":"bb31053d6403091e11f95ac2203982f279f8b984a=
19adf30796878c45fdd8c25","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"=
02e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix=
/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31=
b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"9f6eadebed1=
53e31777482932dae2f3fd3471d5b5465099f98f1e2a9429922fe","src/unix/mod.rs":"6=
b2b57833e37cd3231944696c8216eb587a2a68069346150cf321153eaf04d03","src/unix/=
newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b31=
09639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf6=
5f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd=
7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/esp=
idf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3110394ed5a=
3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a7a1d6d4382=
149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4=
d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs"=
:"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/un=
ix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22d=
e78e53","src/unix/redox/mod.rs":"267a413e63dbdcaed6e758f9a5c10bd00178ed76c7=
b3527e8e984341f617d3a5","src/unix/solarish/compat.rs":"b07a5bfac925eb012003=
a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs=
":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca13252278e","src/u=
nix/solarish/mod.rs":"c64c346ee61175c23cc4fa750bfdab4486fcabf20aec54dac4f05=
a782a89a26a","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfe=
c80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs":"9d761573=
bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vxworks/aarc=
h64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99",=
"src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15=
ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d=
98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0=
afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/=
x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba",=
"src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b90=
0a7f98ed6b514a","src/wasi.rs":"2c945bce3ddd26bf20ff03fb4192c9c3f625f1308a47=
9c5cb4bd4510a892629a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80=
c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb=
7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.=
rs":"cf605ceefc10481aaf6274a205b2899abeb7c043bd384ff766dcb301318dfa2a","src=
/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e80b5d09f6e4502e85daa4=
797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a3=
94e7774c7e545f21f1f4"},"package":"a2a5ac8f984bfcf3a823267e5fde638acc3325f64=
96633a5da6bb6eb2171e103"}
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.0.bb
index 47d3880873..2574d8d0c7 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
@@ -24,6 +24,10 @@ SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-t=
o-cargo-also-when-not-.pat
            file://0004-impl-ToPixel-for-CairoARGB.patch \
            file://0001-crossbeam-utils-check-only-the-architecture-not-the=
-.patch \
            file://0001-vendor-system-deps-sort-dependencies-before-using-t=
h.patch \
+           file://0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.p=
atch \
+           file://0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc=
-.patch \
+           file://0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93=
.patch \
+           file://0008-Update-checksums-for-modified-files-for-rust-1.54.0=
-.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "bd821fb3e16494b61f5185addd23b726b064f20312=
2b3ab4b3d5d7a44e6bf393"
--=20
2.33.1


