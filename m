Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE0DCD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:58:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.326.1780412336886272425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zdmUXvKp;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so117543935e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780412335; x=1781017135; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhogJtP/aaKUNHKMJ9OUHd8yyYds2tORGQBbBmLO10Q=;
        b=zdmUXvKprdZOWoTw4JstrnkS2AgWPj3047MakcVUBpNnKZwcog2d3LhLAX50xw1ZPR
         JKHKhAd1wyBcPhZtZ58oMjpgtx7Xfz1L5uxuG4mzP/F9Kcjr7PRD4FirW07E9fyY5NP9
         2znijsy9QTPW/crCaI8SFBIbWrZAgs7jhM6IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780412335; x=1781017135;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhogJtP/aaKUNHKMJ9OUHd8yyYds2tORGQBbBmLO10Q=;
        b=VMQzdf/2HfigsTki09Xt9FBKfoO5/0+2l3AcvziXvBgRX6as8owtMWNeto1mBw6cRm
         C2ReK1iIaEJXm8JkUMDmaVlXunR6XzZn9Y2OExmV+bN9VNxIimolZ86zgqI9eqLnEVtM
         ynfqY5mp78IL4JvnguC/rg1SNaG+Tx1zZ8n5lpr0+vcwF14ORJ4v4eU9nWAuSWQTlNtZ
         uDidBiPs6x9jmPndvzEhyoJ2i1qVSHF5uN6mrfWE7mk09QUh0908H/xfTnGCt6MFbt+J
         Tg5tCwD7Op1Q9SJr9jdcKVbmAFMGWoF2gQfTC+pxewMdXaWyKQTUnUUiQRkJwqrer4SS
         9Q4w==
X-Forwarded-Encrypted: i=1; AFNElJ9OfMpN2qh2QixaEssxJ8dLOxvryX30rEnLw86e7ZNmzMKg4lTTOJigVdD0SsKwTA+ivSCgwo9/cjEaSI4UqUPkug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxThXiHfUC/KlQXChxfZxZqlv7Sltk0LXXrESpz0Iq536WOurEr
	rXmBYHOu5vdz5/Wnmz41c/ZotihI8EV4tR3x3KuxXazfj3iq2+V9m8CzA/oe+wsenIc=
X-Gm-Gg: Acq92OFG6EmCzt+nadIYHp+YQbOS2mCJ7DTGXeFD0QTYbVdOYbbKeN718LVYFdZz7hW
	TayA3PRsHoZdpJJl4WJKFCE5AE94PdoF91A19RsrZKabPUma1PXjERdKmpMN+GWYDY+oE+a1CKa
	HicFsJ5jjGQpHmXe72o3dM3uwDwvrNzgYP5JJfAPW5kdXE9k648WTmxg9zU116ASCmUubzsntb6
	/Zxpt28+rofkD89Mbt0AtV4hE/5NPJp+tDE4B7MqB6vNTWT3mCWAx0EwLemKiCdtqkFirVJ6cGZ
	lSAwHmYXkR2zrU3nEHJ9di0DNLx00Qnt+4kzAdGiLJaA5UFfv6smmJfj9ZVSqoMPidzXuOxBWBu
	LGu6bQGxPof+N2XVVxzfVNp8h+C8OLTfe7BEBYaPF0zWs57XU2qpeH+l8phDaS/n6Wwpy6NY0it
	l78/udOpmUpL4BJx7HWg1fLk5aV91O40MzR1H0MMP9G+cE1HmEnCBN8ZT0n7irGx4tHWlhc3g9W
	87fOhJhuwIil9fKjbvhOw==
X-Received: by 2002:a05:600c:35c5:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-490b508e7b7mr1410295e9.12.1780412334870;
        Tue, 02 Jun 2026 07:58:54 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20a24sm71297545e9.5.2026.06.02.07.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 07:58:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 16:58:54 +0200
Message-Id: <DIYNHYX77NLL.35YKEBVSTLH1G@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] go 1.22.12: fix CVE-2026-32282,
 CVE-2026-32283
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260513052834.193463-1-hprajapati@mvista.com>
In-Reply-To: <20260513052834.193463-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238057

On Wed May 13, 2026 at 7:28 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] & [2] also mentioned at Debian report in [3] & [4]
>
> [1] https://github.com/golang/go/commit/4c79c4223e42b4727d1600e71ad6983cf=
b21f534
> [2] https://github.com/golang/go/commit/02f574a8303560a4a79a42834f3092ce7=
c9a57cc
> [3] https://security-tracker.debian.org/tracker/CVE-2026-32282
> [4] https://security-tracker.debian.org/tracker/CVE-2026-32283
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
>  .../go/go/CVE-2026-32282.patch                | 240 ++++++++++++++++++
>  .../go/go/CVE-2026-32283.patch                | 178 +++++++++++++
>  3 files changed, 420 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32282.patch
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32283.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devto=
ols/go/go-1.22.12.inc
> index 5753243f0e..7e61a51362 100644
> --- a/meta/recipes-devtools/go/go-1.22.12.inc
> +++ b/meta/recipes-devtools/go/go-1.22.12.inc
> @@ -45,6 +45,8 @@ SRC_URI +=3D "\
>      file://CVE-2026-27143.patch \
>      file://CVE-2026-27144.patch \
>      file://CVE-2026-32280.patch \
> +    file://CVE-2026-32282.patch \
> +    file://CVE-2026-32283.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b=
9cf4d9ca02db986e17d71"
> =20
> diff --git a/meta/recipes-devtools/go/go/CVE-2026-32282.patch b/meta/reci=
pes-devtools/go/go/CVE-2026-32282.patch
> new file mode 100644
> index 0000000000..b0633b092c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2026-32282.patch
> @@ -0,0 +1,240 @@
> +From 4c79c4223e42b4727d1600e71ad6983cfb21f534 Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Mon, 23 Mar 2026 10:34:50 -0700
> +Subject: [PATCH] [release-branch.go1.25] internal/syscall/unix: properly
> + support AT_SYMLINK_NOFOLLOW on Linux
> +
> +On Linux, the fchmodat syscall silently ignores the AT_SYMLINK_NOFOLLOW =
flag.
> +
> +Change the Linux Fchmodat function to use the fstatat2 syscall
> +(added in Linux 6.6) when available.
> +
> +When fstatat2 is not available, use the same workaround as
> +GNU libc and musl, which is to open the target file
> +with O_PATH and then chmod it via /proc/self/fd.
> +
> +This change fixes an os.Root escape, where Root.Chmod could follow
> +a symlink and act on a file outside of the root.  Root.Chmod checks
> +to see if its target is a symlink before calling fchmodat, so this
> +escape requires the target to be replaced with a symlink in between
> +the initial check and the fchmodat.
> +
> +Thanks to Uuganbayar Lkhamsuren (https://github.com/uug4na)
> +for reporting this issue.
> +
> +Fixes CVE-2026-32282
> +Fixes #78293
> +
> +Change-Id: Ie487be1a853b341a77b42ae0c59301d46a6a6964
> +Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3900
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-by: Neal Patel <nealpatel@google.com>
> +Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3982
> +Commit-Queue: Damien Neil <dneil@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/763550
> +Reviewed-by: David Chase <drchase@google.com>
> +Auto-Submit: Gopher Robot <gobot@golang.org>
> +TryBot-Bypass: Gopher Robot <gobot@golang.org>
> +Reviewed-by: Junyang Shao <shaojunyang@google.com>
> +
> +
> +CVE: CVE-2026-32282
> +Upstream-Status: Backport [https://github.com/golang/go/commit/4c79c4223=
e42b4727d1600e71ad6983cfb21f534]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/cmd/dist/buildtool.go                    |  1 +
> + src/internal/syscall/unix/at_sysnum_linux.go |  2 +
> + src/internal/syscall/unix/fchmodat_linux.go  | 51 ++++++++++++++++
> + src/internal/syscall/unix/fchmodat_other.go  | 29 +++++++++
> + src/internal/syscall/unix/fchmodat_test.go   | 62 ++++++++++++++++++++
> + 5 files changed, 145 insertions(+)
> + create mode 100644 src/internal/syscall/unix/fchmodat_linux.go
> + create mode 100644 src/internal/syscall/unix/fchmodat_other.go
> + create mode 100644 src/internal/syscall/unix/fchmodat_test.go
> +
> +diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
> +index 3232896..9cc7075 100644
> +--- a/src/cmd/dist/buildtool.go
> ++++ b/src/cmd/dist/buildtool.go
> +@@ -74,6 +74,7 @@ var bootstrapDirs =3D []string{
> + 	"internal/goroot",
> + 	"internal/gover",
> + 	"internal/goversion",
> ++	"internal/itoa",
> + 	// internal/lazyregexp is provided by Go 1.17, which permits it to
> + 	// be imported by other packages in this list, but is not provided
> + 	// by the Go 1.17 version of gccgo. It's on this list only to
> +diff --git a/src/internal/syscall/unix/at_sysnum_linux.go b/src/internal=
/syscall/unix/at_sysnum_linux.go
> +index 7c3b15c..12ee1d4 100644
> +--- a/src/internal/syscall/unix/at_sysnum_linux.go
> ++++ b/src/internal/syscall/unix/at_sysnum_linux.go
> +@@ -16,4 +16,6 @@ const (
> + 	AT_SYMLINK_NOFOLLOW =3D 0x100
> +=20
> + 	UTIME_OMIT =3D 0x3ffffffe
> ++
> ++	O_PATH =3D 0x200000
> + )
> +diff --git a/src/internal/syscall/unix/fchmodat_linux.go b/src/internal/=
syscall/unix/fchmodat_linux.go
> +new file mode 100644
> +index 0000000..a9fa42b
> +--- /dev/null
> ++++ b/src/internal/syscall/unix/fchmodat_linux.go
> +@@ -0,0 +1,51 @@
> ++// Copyright 2026 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++//go:build linux
> ++
> ++package unix
> ++
> ++import (
> ++	"internal/itoa"
> ++	"syscall"
> ++)
> ++
> ++func Fchmodat(dirfd int, path string, mode uint32, flags int) error {

Hello,

Upstream patch *moves* the function but this path only add the new one.
I find that surprising... Can you check that this is correct?

Thanks!

> ++	// On Linux, the fchmodat syscall silently ignores the AT_SYMLINK_NOFO=
LLOW flag.
> ++	// We need to use fchmodat2 instead.
> ++	// syscall.Fchmodat handles this.
> ++	if err :=3D syscall.Fchmodat(dirfd, path, mode, flags); err !=3D sysca=
ll.EOPNOTSUPP {
> ++		return err
> ++	}
> ++
> ++	// This kernel doesn't appear to support fchmodat2 (added in Linux 6.6=
).
> ++	// We can't fall back to Fchmod, because it requires write permissions=
 on the file.
> ++	// Instead, use the same workaround as GNU libc and musl, which is to =
open the file
> ++	// and then fchmodat the FD in /proc/self/fd.
> ++	// See: https://lwn.net/Articles/939217/
> ++	fd, err :=3D Openat(dirfd, path, O_PATH|syscall.O_NOFOLLOW|syscall.O_C=
LOEXEC, 0)
> ++	if err !=3D nil {
> ++		return err
> ++	}
> ++	defer syscall.Close(fd)
> ++	procPath :=3D "/proc/self/fd/" + itoa.Itoa(fd)
> ++
> ++	// Check to see if this file is a symlink.
> ++	// (We passed O_NOFOLLOW above, but O_PATH|O_NOFOLLOW will open a syml=
ink.)
> ++	var st syscall.Stat_t
> ++	if err :=3D syscall.Stat(procPath, &st); err !=3D nil {
> ++		if err =3D=3D syscall.ENOENT {
> ++			// /proc has probably not been mounted. Give up.
> ++			return syscall.EOPNOTSUPP
> ++		}
> ++		return err
> ++	}
> ++	if st.Mode&syscall.S_IFMT =3D=3D syscall.S_IFLNK {
> ++		// fchmodat on the proc FD for a symlink apparently gives inconsisten=
t
> ++		// results, so just refuse to try.
> ++		return syscall.EOPNOTSUPP
> ++	}
> ++
> ++	return syscall.Fchmodat(AT_FDCWD, procPath, mode, flags&^AT_SYMLINK_NO=
FOLLOW)
> ++}
> +diff --git a/src/internal/syscall/unix/fchmodat_other.go b/src/internal/=
syscall/unix/fchmodat_other.go
> +new file mode 100644
> +index 0000000..76f478c
> +--- /dev/null
> ++++ b/src/internal/syscall/unix/fchmodat_other.go
> +@@ -0,0 +1,29 @@
> ++// Copyright 2026 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++//go:build dragonfly || freebsd || netbsd || (openbsd && mips64)
> ++
> ++package unix
> ++
> ++import (
> ++	"syscall"
> ++	"unsafe"
> ++)
> ++
> ++func Fchmodat(dirfd int, path string, mode uint32, flags int) error {
> ++	p, err :=3D syscall.BytePtrFromString(path)
> ++	if err !=3D nil {
> ++		return err
> ++	}
> ++	_, _, errno :=3D syscall.Syscall6(fchmodatTrap,
> ++		uintptr(dirfd),
> ++		uintptr(unsafe.Pointer(p)),
> ++		uintptr(mode),
> ++		uintptr(flags),
> ++		0, 0)
> ++	if errno !=3D 0 {
> ++		return errno
> ++	}
> ++	return nil
> ++}
> +diff --git a/src/internal/syscall/unix/fchmodat_test.go b/src/internal/s=
yscall/unix/fchmodat_test.go
> +new file mode 100644
> +index 0000000..49a0985
> +--- /dev/null
> ++++ b/src/internal/syscall/unix/fchmodat_test.go
> +@@ -0,0 +1,62 @@
> ++// Copyright 2026 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++//go:build unix || wasip1
> ++
> ++package unix_test
> ++
> ++import (
> ++	"internal/syscall/unix"
> ++	"os"
> ++	"runtime"
> ++	"testing"
> ++)
> ++
> ++// TestFchmodAtSymlinkNofollow verifies that Fchmodat honors the AT_SYM=
LINK_NOFOLLOW flag.
> ++func TestFchmodatSymlinkNofollow(t *testing.T) {
> ++	if runtime.GOOS =3D=3D "wasip1" {
> ++		t.Skip("wasip1 doesn't support chmod")
> ++	}
> ++
> ++	dir :=3D t.TempDir()
> ++	filename :=3D dir + "/file"
> ++	linkname :=3D dir + "/symlink"
> ++	if err :=3D os.WriteFile(filename, nil, 0o100); err !=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++	if err :=3D os.Symlink(filename, linkname); err !=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++
> ++	parent, err :=3D os.Open(dir)
> ++	if err !=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++	defer parent.Close()
> ++
> ++	lstatMode :=3D func(path string) os.FileMode {
> ++		st, err :=3D os.Lstat(path)
> ++		if err !=3D nil {
> ++			t.Fatal(err)
> ++		}
> ++		return st.Mode()
> ++	}
> ++
> ++	// Fchmodat with no flags follows symlinks.
> ++	const mode1 =3D 0o200
> ++	if err :=3D unix.Fchmodat(int(parent.Fd()), "symlink", mode1, 0); err =
!=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++	if got, want :=3D lstatMode(filename), os.FileMode(mode1); got !=3D wa=
nt {
> ++		t.Errorf("after Fchmodat(parent, symlink, %v, 0); mode =3D %v, want %=
v", mode1, got, want)
> ++	}
> ++
> ++	// Fchmodat with AT_SYMLINK_NOFOLLOW does not follow symlinks.
> ++	// The Fchmodat call may fail or chmod the symlink itself, depending o=
n the kernel version.
> ++	const mode2 =3D 0o400
> ++	unix.Fchmodat(int(parent.Fd()), "symlink", mode2, unix.AT_SYMLINK_NOFO=
LLOW)
> ++	if got, want :=3D lstatMode(filename), os.FileMode(mode1); got !=3D wa=
nt {
> ++		t.Errorf("after Fchmodat(parent, symlink, %v, AT_SYMLINK_NOFOLLOW); m=
ode =3D %v, want %v", mode1, got, want)
> ++	}
> ++}
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/go/go/CVE-2026-32283.patch b/meta/reci=
pes-devtools/go/go/CVE-2026-32283.patch
> new file mode 100644
> index 0000000000..bae4b7b605
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
> @@ -0,0 +1,178 @@
> +From 02f574a8303560a4a79a42834f3092ce7c9a57cc Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Mon, 23 Mar 2026 11:54:41 -0700
> +Subject: [PATCH] [release-branch.go1.25] crypto/tls: prevent deadlock wh=
en
> + client sends multiple key update messages
> +
> +When we made setReadTrafficSecret send an alert when there are pending
> +handshake messages, we introduced a deadlock when the client sends
> +multiple key update messages that request a response, as handleKeyUpdate
> +will lock the mutex, and defer the unlocking until the end of the
> +function, but setReadTrafficSecret called sendAlert in the failure case,
> +which also tries to lock the mutex.
> +
> +Add an argument to setReadTrafficSecret which lets the caller indicate
> +if the mutex is already locked, and if so, call sendAlertLocked instead
> +of sendAlert.
> +
> +Thanks to Jakub Ciolek for reporting this issue.
> +
> +Fixes #78334
> +Fixes CVE-2026-32283
> +
> +Change-Id: Id8e56974233c910e0d66ba96eafbd2ea57832610
> +Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3881
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-by: Nicholas Husin <husin@google.com>
> +Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3988
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/763555
> +Auto-Submit: Gopher Robot <gobot@golang.org>
> +Reviewed-by: David Chase <drchase@google.com>
> +TryBot-Bypass: Gopher Robot <gobot@golang.org>
> +Reviewed-by: Junyang Shao <shaojunyang@google.com>
> +
> +CVE: CVE-2026-32283
> +Upstream-Status: Backport [https://github.com/golang/go/commit/02f574a83=
03560a4a79a42834f3092ce7c9a57cc]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/crypto/tls/conn.go                   | 10 +++--
> + src/crypto/tls/handshake_client_tls13.go |  4 +-
> + src/crypto/tls/handshake_server_tls13.go |  4 +-
> + src/crypto/tls/handshake_test.go         | 48 ++++++++++++++++++++++++
> + 4 files changed, 59 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
> +index 08609ce..770d456 100644
> +--- a/src/crypto/tls/conn.go
> ++++ b/src/crypto/tls/conn.go
> +@@ -1345,7 +1345,7 @@ func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdat=
eMsg) error {
> + 	}
> +=20
> + 	newSecret :=3D cipherSuite.nextTrafficSecret(c.in.trafficSecret)
> +-	if err :=3D c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelIni=
tial, newSecret); err !=3D nil {
> ++	if err :=3D c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelIni=
tial, newSecret, keyUpdate.updateRequested); err !=3D nil {
> + 		return err
> + 	}
> +=20
> +@@ -1675,12 +1675,16 @@ func (c *Conn) VerifyHostname(host string) error=
 {
> + // setReadTrafficSecret sets the read traffic secret for the given encr=
yption level. If
> + // being called at the same time as setWriteTrafficSecret, the caller m=
ust ensure the call
> + // to setWriteTrafficSecret happens first so any alerts are sent at the=
 write level.
> +-func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUIC=
EncryptionLevel, secret []byte) error {
> ++func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUIC=
EncryptionLevel, secret []byte, locked bool) error {
> + 	// Ensure that there are no buffered handshake messages before changin=
g the
> + 	// read keys, since that can cause messages to be parsed that were enc=
rypted
> + 	// using old keys which are no longer appropriate.
> + 	if c.hand.Len() !=3D 0 {
> +-		c.sendAlert(alertUnexpectedMessage)
> ++		if locked {
> ++			c.sendAlertLocked(alertUnexpectedMessage)
> ++		} else {
> ++			c.sendAlert(alertUnexpectedMessage)
> ++		}
> + 		return errors.New("tls: handshake buffer not empty before setting rea=
d traffic secret")
> + 	}
> + 	c.in.setTrafficSecret(suite, level, secret)
> +diff --git a/src/crypto/tls/handshake_client_tls13.go b/src/crypto/tls/h=
andshake_client_tls13.go
> +index 68ff92b..2d58b21 100644
> +--- a/src/crypto/tls/handshake_client_tls13.go
> ++++ b/src/crypto/tls/handshake_client_tls13.go
> +@@ -396,7 +396,7 @@ func (hs *clientHandshakeStateTLS13) establishHandsh=
akeKeys() error {
> + 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, client=
Secret)
> + 	serverSecret :=3D hs.suite.deriveSecret(handshakeSecret,
> + 		serverHandshakeTrafficLabel, hs.transcript)
> +-	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandsh=
ake, serverSecret); err !=3D nil {
> ++	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandsh=
ake, serverSecret, false); err !=3D nil {
> + 		return err
> + 	}
> +=20
> +@@ -607,7 +607,7 @@ func (hs *clientHandshakeStateTLS13) readServerFinis=
hed() error {
> + 		clientApplicationTrafficLabel, hs.transcript)
> + 	serverSecret :=3D hs.suite.deriveSecret(hs.masterSecret,
> + 		serverApplicationTrafficLabel, hs.transcript)
> +-	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplic=
ation, serverSecret); err !=3D nil {
> ++	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplic=
ation, serverSecret, false); err !=3D nil {
> + 		return err
> + 	}
> +=20
> +diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/h=
andshake_server_tls13.go
> +index 1ecee3a..f73b536 100644
> +--- a/src/crypto/tls/handshake_server_tls13.go
> ++++ b/src/crypto/tls/handshake_server_tls13.go
> +@@ -636,7 +636,7 @@ func (hs *serverHandshakeStateTLS13) sendServerParam=
eters() error {
> + 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, server=
Secret)
> + 	clientSecret :=3D hs.suite.deriveSecret(hs.handshakeSecret,
> + 		clientHandshakeTrafficLabel, hs.transcript)
> +-	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandsh=
ake, clientSecret); err !=3D nil {
> ++	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandsh=
ake, clientSecret, false); err !=3D nil {
> + 		return err
> + 	}
> +=20
> +@@ -1005,7 +1005,7 @@ func (hs *serverHandshakeStateTLS13) readClientFin=
ished() error {
> + 		return errors.New("tls: invalid client finished hash")
> + 	}
> +=20
> +-	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplic=
ation, hs.trafficSecret); err !=3D nil {
> ++	if err :=3D c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplic=
ation, hs.trafficSecret, false); err !=3D nil {
> + 		return err
> + 	}
> +=20
> +diff --git a/src/crypto/tls/handshake_test.go b/src/crypto/tls/handshake=
_test.go
> +index 4991a0e..a95d751 100644
> +--- a/src/crypto/tls/handshake_test.go
> ++++ b/src/crypto/tls/handshake_test.go
> +@@ -673,3 +673,51 @@ func concatHandshakeMessages(msgs ...handshakeMessa=
ge) ([]byte, error) {
> + 	outBuf =3D append(outBuf, marshalled...)
> + 	return outBuf, nil
> + }
> ++
> ++func TestMultipleKeyUpdate(t *testing.T) {
> ++	for _, requestUpdate :=3D range []bool{true, false} {
> ++		t.Run(fmt.Sprintf("requestUpdate=3D%t", requestUpdate), func(t *testi=
ng.T) {
> ++
> ++			c, s :=3D localPipe(t)
> ++			cfg :=3D testConfig.Clone()
> ++			cfg.MinVersion =3D VersionTLS13
> ++			cfg.MaxVersion =3D VersionTLS13
> ++			client :=3D Client(c, testConfig)
> ++			server :=3D Server(s, testConfig)
> ++
> ++			clientHandshakeDone :=3D make(chan struct{})
> ++			go func() {
> ++				if err :=3D client.Handshake(); err !=3D nil {
> ++				}
> ++				close(clientHandshakeDone)
> ++				io.Copy(io.Discard, server)
> ++			}()
> ++
> ++			if err :=3D server.Handshake(); err !=3D nil {
> ++				t.Fatalf("server handshake failed: %v\n", err)
> ++			}
> ++			<-clientHandshakeDone
> ++
> ++			c.SetReadDeadline(time.Now().Add(1 * time.Second))
> ++			s.SetReadDeadline(time.Now().Add(1 * time.Second))
> ++
> ++			kuMsg, err :=3D (&keyUpdateMsg{updateRequested: requestUpdate}).mars=
hal()
> ++			if err !=3D nil {
> ++				t.Fatalf("failed to marshal key update message: %v", err)
> ++			}
> ++
> ++			client.out.Lock()
> ++			if _, err :=3D client.writeRecordLocked(recordTypeHandshake, append(=
kuMsg, kuMsg...)); err !=3D nil {
> ++				t.Fatalf("failed to write key update messages: %v", err)
> ++			}
> ++			client.out.Unlock()
> ++
> ++			_, err =3D io.Copy(io.Discard, client)
> ++			if err =3D=3D nil {
> ++				t.Fatal("expected multiple key update messages to cause an error, g=
ot nil")
> ++			} else if !strings.HasSuffix(err.Error(), "tls: unexpected message")=
 {
> ++				t.Fatalf("unexpected error: %v", err)
> ++			}
> ++		})
> ++	}
> ++}
> +--=20
> +2.50.1
> +


--=20
Yoann Congal
Smile ECS


