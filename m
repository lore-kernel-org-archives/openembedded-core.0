Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935E9CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:28:53 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.942.1778650123042408199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LC9ErNGb;
 spf=pass (domain: mvista.com, ip: 74.125.82.179, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ee990e8597so10854455eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778650122; x=1779254922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuFVWbUs6PFCF2bsJxIZt6yeEPNz1JQ6cHNTpzO9rmc=;
        b=LC9ErNGbSgBae6TjwA/17UmxczSqhpmDF97Dv4NgkfCE6Z7tJuk6xeIWWhu34qmcwe
         pSSZ5zDlSZJnnGZtgI/2UnhvLcnkSA/Z8O8N1EwBm98ht1uvfS4faVq3KfGrJVyS7XQ2
         hS/KTNS9tBvekLqWPIW3yY4REtmwM5ieiui5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778650122; x=1779254922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuFVWbUs6PFCF2bsJxIZt6yeEPNz1JQ6cHNTpzO9rmc=;
        b=eN2AWHLAzPHQ3I8o163U1kk+rqrqz4NtNsrPQqsMz+rMlWEXI1/Wxvm4c9nNsyavQx
         nU7J7O8i5gKosAyPSpQxj5IDYb8mrr/2ORUaLHNXA7lZwhtAdiqmV4EjEf0CR8zxl0E7
         nRj5O1A0qGW/ctFJ2XQj7Yda72sXYypyAS3ZwMtGvbWAvw2aVw2t6hqSzSs7XYcUyEIb
         1QdNLwNHvmIo6yt1waABFHLRM5WMWp1dVYYGlTzZzbT1Yvxxa/Ycvh5STpoOzRNbqnEK
         bkI4hN/zWv6QWz4P17xBfAVOK/M97cE46yPuyokcHDV7doYP55oDzw5XPWP1wcLyLD1/
         VBIQ==
X-Gm-Message-State: AOJu0Ywu42Mn0SLQrMHfcUntT59yQUxD0b89fijkdQnCs4Pi1Eua0a0h
	c4r5V6Wiz8cRhaX9G779IFq/btNxUdNpqYlDBbP2JHrm1wXNeStNtqiKFSLF1jkhzEdRn+4vFD1
	tdy+zjJY=
X-Gm-Gg: Acq92OGoF/QXFfdP41c6GzVBpeiOEBX5RjTiW8oFQuZHeuG1ncP7geaIaL+6uQxe1P7
	wD5cP4ySbXdsNA4pLOBFg97qGbeyzRVbdpXvyzNFKCumh9ZutWnAo6dnGsMftYuv5+L12dQfJgI
	qp1RFYnJ/Bt5Ng3kfoMjQJbTk08rkFsedoJKqGmUn693cmiQ8AsbfSdk6wKnCSJrqA7mc2BE2rz
	R2c1e7Ww9Km4Qng4okr/4ogfnuHCWkjxNyksRCqvC4ptE/sxCpPp232FRObxZ5XfO/nk1/TEXn7
	sBEXmXIy6Wzk6S90hGphBJmq/sXVknfes3pF626xfFPpT1E4yuDMHPzwfvAyFkus4D5hF8KGb4K
	jHYCYQV0c0celrsWWYYjMthjpnKtIi403f7nya87A2zSJDzkDgJg2v5y9ifSZy6fDTDUIYyt9KR
	UOn/+xI3lFyVwAvvU28NQp3gxlgu94+btLVm1k
X-Received: by 2002:a05:7300:1486:b0:2c1:7b61:8731 with SMTP id 5a478bee46e88-3011758689amr1122865eec.10.1778650121922;
        Tue, 12 May 2026 22:28:41 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88924af95sm20672153eec.30.2026.05.12.22.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:28:41 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] go 1.22.12: fix CVE-2026-32282, CVE-2026-32283
Date: Wed, 13 May 2026 10:58:34 +0530
Message-ID: <20260513052834.193463-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236927

Pick patch from [1] & [2] also mentioned at Debian report in [3] & [4]

[1] https://github.com/golang/go/commit/4c79c4223e42b4727d1600e71ad6983cfb21f534
[2] https://github.com/golang/go/commit/02f574a8303560a4a79a42834f3092ce7c9a57cc
[3] https://security-tracker.debian.org/tracker/CVE-2026-32282
[4] https://security-tracker.debian.org/tracker/CVE-2026-32283

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2026-32282.patch                | 240 ++++++++++++++++++
 .../go/go/CVE-2026-32283.patch                | 178 +++++++++++++
 3 files changed, 420 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32282.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32283.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 5753243f0e..7e61a51362 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -45,6 +45,8 @@ SRC_URI += "\
     file://CVE-2026-27143.patch \
     file://CVE-2026-27144.patch \
     file://CVE-2026-32280.patch \
+    file://CVE-2026-32282.patch \
+    file://CVE-2026-32283.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32282.patch b/meta/recipes-devtools/go/go/CVE-2026-32282.patch
new file mode 100644
index 0000000000..b0633b092c
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32282.patch
@@ -0,0 +1,240 @@
+From 4c79c4223e42b4727d1600e71ad6983cfb21f534 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 23 Mar 2026 10:34:50 -0700
+Subject: [PATCH] [release-branch.go1.25] internal/syscall/unix: properly
+ support AT_SYMLINK_NOFOLLOW on Linux
+
+On Linux, the fchmodat syscall silently ignores the AT_SYMLINK_NOFOLLOW flag.
+
+Change the Linux Fchmodat function to use the fstatat2 syscall
+(added in Linux 6.6) when available.
+
+When fstatat2 is not available, use the same workaround as
+GNU libc and musl, which is to open the target file
+with O_PATH and then chmod it via /proc/self/fd.
+
+This change fixes an os.Root escape, where Root.Chmod could follow
+a symlink and act on a file outside of the root.  Root.Chmod checks
+to see if its target is a symlink before calling fchmodat, so this
+escape requires the target to be replaced with a symlink in between
+the initial check and the fchmodat.
+
+Thanks to Uuganbayar Lkhamsuren (https://github.com/uug4na)
+for reporting this issue.
+
+Fixes CVE-2026-32282
+Fixes #78293
+
+Change-Id: Ie487be1a853b341a77b42ae0c59301d46a6a6964
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3900
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3982
+Commit-Queue: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763550
+Reviewed-by: David Chase <drchase@google.com>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+
+
+CVE: CVE-2026-32282
+Upstream-Status: Backport [https://github.com/golang/go/commit/4c79c4223e42b4727d1600e71ad6983cfb21f534]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/dist/buildtool.go                    |  1 +
+ src/internal/syscall/unix/at_sysnum_linux.go |  2 +
+ src/internal/syscall/unix/fchmodat_linux.go  | 51 ++++++++++++++++
+ src/internal/syscall/unix/fchmodat_other.go  | 29 +++++++++
+ src/internal/syscall/unix/fchmodat_test.go   | 62 ++++++++++++++++++++
+ 5 files changed, 145 insertions(+)
+ create mode 100644 src/internal/syscall/unix/fchmodat_linux.go
+ create mode 100644 src/internal/syscall/unix/fchmodat_other.go
+ create mode 100644 src/internal/syscall/unix/fchmodat_test.go
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index 3232896..9cc7075 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -74,6 +74,7 @@ var bootstrapDirs = []string{
+ 	"internal/goroot",
+ 	"internal/gover",
+ 	"internal/goversion",
++	"internal/itoa",
+ 	// internal/lazyregexp is provided by Go 1.17, which permits it to
+ 	// be imported by other packages in this list, but is not provided
+ 	// by the Go 1.17 version of gccgo. It's on this list only to
+diff --git a/src/internal/syscall/unix/at_sysnum_linux.go b/src/internal/syscall/unix/at_sysnum_linux.go
+index 7c3b15c..12ee1d4 100644
+--- a/src/internal/syscall/unix/at_sysnum_linux.go
++++ b/src/internal/syscall/unix/at_sysnum_linux.go
+@@ -16,4 +16,6 @@ const (
+ 	AT_SYMLINK_NOFOLLOW = 0x100
+ 
+ 	UTIME_OMIT = 0x3ffffffe
++
++	O_PATH = 0x200000
+ )
+diff --git a/src/internal/syscall/unix/fchmodat_linux.go b/src/internal/syscall/unix/fchmodat_linux.go
+new file mode 100644
+index 0000000..a9fa42b
+--- /dev/null
++++ b/src/internal/syscall/unix/fchmodat_linux.go
+@@ -0,0 +1,51 @@
++// Copyright 2026 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build linux
++
++package unix
++
++import (
++	"internal/itoa"
++	"syscall"
++)
++
++func Fchmodat(dirfd int, path string, mode uint32, flags int) error {
++	// On Linux, the fchmodat syscall silently ignores the AT_SYMLINK_NOFOLLOW flag.
++	// We need to use fchmodat2 instead.
++	// syscall.Fchmodat handles this.
++	if err := syscall.Fchmodat(dirfd, path, mode, flags); err != syscall.EOPNOTSUPP {
++		return err
++	}
++
++	// This kernel doesn't appear to support fchmodat2 (added in Linux 6.6).
++	// We can't fall back to Fchmod, because it requires write permissions on the file.
++	// Instead, use the same workaround as GNU libc and musl, which is to open the file
++	// and then fchmodat the FD in /proc/self/fd.
++	// See: https://lwn.net/Articles/939217/
++	fd, err := Openat(dirfd, path, O_PATH|syscall.O_NOFOLLOW|syscall.O_CLOEXEC, 0)
++	if err != nil {
++		return err
++	}
++	defer syscall.Close(fd)
++	procPath := "/proc/self/fd/" + itoa.Itoa(fd)
++
++	// Check to see if this file is a symlink.
++	// (We passed O_NOFOLLOW above, but O_PATH|O_NOFOLLOW will open a symlink.)
++	var st syscall.Stat_t
++	if err := syscall.Stat(procPath, &st); err != nil {
++		if err == syscall.ENOENT {
++			// /proc has probably not been mounted. Give up.
++			return syscall.EOPNOTSUPP
++		}
++		return err
++	}
++	if st.Mode&syscall.S_IFMT == syscall.S_IFLNK {
++		// fchmodat on the proc FD for a symlink apparently gives inconsistent
++		// results, so just refuse to try.
++		return syscall.EOPNOTSUPP
++	}
++
++	return syscall.Fchmodat(AT_FDCWD, procPath, mode, flags&^AT_SYMLINK_NOFOLLOW)
++}
+diff --git a/src/internal/syscall/unix/fchmodat_other.go b/src/internal/syscall/unix/fchmodat_other.go
+new file mode 100644
+index 0000000..76f478c
+--- /dev/null
++++ b/src/internal/syscall/unix/fchmodat_other.go
+@@ -0,0 +1,29 @@
++// Copyright 2026 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build dragonfly || freebsd || netbsd || (openbsd && mips64)
++
++package unix
++
++import (
++	"syscall"
++	"unsafe"
++)
++
++func Fchmodat(dirfd int, path string, mode uint32, flags int) error {
++	p, err := syscall.BytePtrFromString(path)
++	if err != nil {
++		return err
++	}
++	_, _, errno := syscall.Syscall6(fchmodatTrap,
++		uintptr(dirfd),
++		uintptr(unsafe.Pointer(p)),
++		uintptr(mode),
++		uintptr(flags),
++		0, 0)
++	if errno != 0 {
++		return errno
++	}
++	return nil
++}
+diff --git a/src/internal/syscall/unix/fchmodat_test.go b/src/internal/syscall/unix/fchmodat_test.go
+new file mode 100644
+index 0000000..49a0985
+--- /dev/null
++++ b/src/internal/syscall/unix/fchmodat_test.go
+@@ -0,0 +1,62 @@
++// Copyright 2026 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build unix || wasip1
++
++package unix_test
++
++import (
++	"internal/syscall/unix"
++	"os"
++	"runtime"
++	"testing"
++)
++
++// TestFchmodAtSymlinkNofollow verifies that Fchmodat honors the AT_SYMLINK_NOFOLLOW flag.
++func TestFchmodatSymlinkNofollow(t *testing.T) {
++	if runtime.GOOS == "wasip1" {
++		t.Skip("wasip1 doesn't support chmod")
++	}
++
++	dir := t.TempDir()
++	filename := dir + "/file"
++	linkname := dir + "/symlink"
++	if err := os.WriteFile(filename, nil, 0o100); err != nil {
++		t.Fatal(err)
++	}
++	if err := os.Symlink(filename, linkname); err != nil {
++		t.Fatal(err)
++	}
++
++	parent, err := os.Open(dir)
++	if err != nil {
++		t.Fatal(err)
++	}
++	defer parent.Close()
++
++	lstatMode := func(path string) os.FileMode {
++		st, err := os.Lstat(path)
++		if err != nil {
++			t.Fatal(err)
++		}
++		return st.Mode()
++	}
++
++	// Fchmodat with no flags follows symlinks.
++	const mode1 = 0o200
++	if err := unix.Fchmodat(int(parent.Fd()), "symlink", mode1, 0); err != nil {
++		t.Fatal(err)
++	}
++	if got, want := lstatMode(filename), os.FileMode(mode1); got != want {
++		t.Errorf("after Fchmodat(parent, symlink, %v, 0); mode = %v, want %v", mode1, got, want)
++	}
++
++	// Fchmodat with AT_SYMLINK_NOFOLLOW does not follow symlinks.
++	// The Fchmodat call may fail or chmod the symlink itself, depending on the kernel version.
++	const mode2 = 0o400
++	unix.Fchmodat(int(parent.Fd()), "symlink", mode2, unix.AT_SYMLINK_NOFOLLOW)
++	if got, want := lstatMode(filename), os.FileMode(mode1); got != want {
++		t.Errorf("after Fchmodat(parent, symlink, %v, AT_SYMLINK_NOFOLLOW); mode = %v, want %v", mode1, got, want)
++	}
++}
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32283.patch b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
new file mode 100644
index 0000000000..bae4b7b605
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
@@ -0,0 +1,178 @@
+From 02f574a8303560a4a79a42834f3092ce7c9a57cc Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 23 Mar 2026 11:54:41 -0700
+Subject: [PATCH] [release-branch.go1.25] crypto/tls: prevent deadlock when
+ client sends multiple key update messages
+
+When we made setReadTrafficSecret send an alert when there are pending
+handshake messages, we introduced a deadlock when the client sends
+multiple key update messages that request a response, as handleKeyUpdate
+will lock the mutex, and defer the unlocking until the end of the
+function, but setReadTrafficSecret called sendAlert in the failure case,
+which also tries to lock the mutex.
+
+Add an argument to setReadTrafficSecret which lets the caller indicate
+if the mutex is already locked, and if so, call sendAlertLocked instead
+of sendAlert.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes #78334
+Fixes CVE-2026-32283
+
+Change-Id: Id8e56974233c910e0d66ba96eafbd2ea57832610
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3881
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3988
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763555
+Auto-Submit: Gopher Robot <gobot@golang.org>
+Reviewed-by: David Chase <drchase@google.com>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+
+CVE: CVE-2026-32283
+Upstream-Status: Backport [https://github.com/golang/go/commit/02f574a8303560a4a79a42834f3092ce7c9a57cc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/crypto/tls/conn.go                   | 10 +++--
+ src/crypto/tls/handshake_client_tls13.go |  4 +-
+ src/crypto/tls/handshake_server_tls13.go |  4 +-
+ src/crypto/tls/handshake_test.go         | 48 ++++++++++++++++++++++++
+ 4 files changed, 59 insertions(+), 7 deletions(-)
+
+diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
+index 08609ce..770d456 100644
+--- a/src/crypto/tls/conn.go
++++ b/src/crypto/tls/conn.go
+@@ -1345,7 +1345,7 @@ func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error {
+ 	}
+ 
+ 	newSecret := cipherSuite.nextTrafficSecret(c.in.trafficSecret)
+-	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret); err != nil {
++	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret, keyUpdate.updateRequested); err != nil {
+ 		return err
+ 	}
+ 
+@@ -1675,12 +1675,16 @@ func (c *Conn) VerifyHostname(host string) error {
+ // setReadTrafficSecret sets the read traffic secret for the given encryption level. If
+ // being called at the same time as setWriteTrafficSecret, the caller must ensure the call
+ // to setWriteTrafficSecret happens first so any alerts are sent at the write level.
+-func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte) error {
++func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte, locked bool) error {
+ 	// Ensure that there are no buffered handshake messages before changing the
+ 	// read keys, since that can cause messages to be parsed that were encrypted
+ 	// using old keys which are no longer appropriate.
+ 	if c.hand.Len() != 0 {
+-		c.sendAlert(alertUnexpectedMessage)
++		if locked {
++			c.sendAlertLocked(alertUnexpectedMessage)
++		} else {
++			c.sendAlert(alertUnexpectedMessage)
++		}
+ 		return errors.New("tls: handshake buffer not empty before setting read traffic secret")
+ 	}
+ 	c.in.setTrafficSecret(suite, level, secret)
+diff --git a/src/crypto/tls/handshake_client_tls13.go b/src/crypto/tls/handshake_client_tls13.go
+index 68ff92b..2d58b21 100644
+--- a/src/crypto/tls/handshake_client_tls13.go
++++ b/src/crypto/tls/handshake_client_tls13.go
+@@ -396,7 +396,7 @@ func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error {
+ 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret)
+ 	serverSecret := hs.suite.deriveSecret(handshakeSecret,
+ 		serverHandshakeTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+@@ -607,7 +607,7 @@ func (hs *clientHandshakeStateTLS13) readServerFinished() error {
+ 		clientApplicationTrafficLabel, hs.transcript)
+ 	serverSecret := hs.suite.deriveSecret(hs.masterSecret,
+ 		serverApplicationTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index 1ecee3a..f73b536 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -636,7 +636,7 @@ func (hs *serverHandshakeStateTLS13) sendServerParameters() error {
+ 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret)
+ 	clientSecret := hs.suite.deriveSecret(hs.handshakeSecret,
+ 		clientHandshakeTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+@@ -1005,7 +1005,7 @@ func (hs *serverHandshakeStateTLS13) readClientFinished() error {
+ 		return errors.New("tls: invalid client finished hash")
+ 	}
+ 
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_test.go b/src/crypto/tls/handshake_test.go
+index 4991a0e..a95d751 100644
+--- a/src/crypto/tls/handshake_test.go
++++ b/src/crypto/tls/handshake_test.go
+@@ -673,3 +673,51 @@ func concatHandshakeMessages(msgs ...handshakeMessage) ([]byte, error) {
+ 	outBuf = append(outBuf, marshalled...)
+ 	return outBuf, nil
+ }
++
++func TestMultipleKeyUpdate(t *testing.T) {
++	for _, requestUpdate := range []bool{true, false} {
++		t.Run(fmt.Sprintf("requestUpdate=%t", requestUpdate), func(t *testing.T) {
++
++			c, s := localPipe(t)
++			cfg := testConfig.Clone()
++			cfg.MinVersion = VersionTLS13
++			cfg.MaxVersion = VersionTLS13
++			client := Client(c, testConfig)
++			server := Server(s, testConfig)
++
++			clientHandshakeDone := make(chan struct{})
++			go func() {
++				if err := client.Handshake(); err != nil {
++				}
++				close(clientHandshakeDone)
++				io.Copy(io.Discard, server)
++			}()
++
++			if err := server.Handshake(); err != nil {
++				t.Fatalf("server handshake failed: %v\n", err)
++			}
++			<-clientHandshakeDone
++
++			c.SetReadDeadline(time.Now().Add(1 * time.Second))
++			s.SetReadDeadline(time.Now().Add(1 * time.Second))
++
++			kuMsg, err := (&keyUpdateMsg{updateRequested: requestUpdate}).marshal()
++			if err != nil {
++				t.Fatalf("failed to marshal key update message: %v", err)
++			}
++
++			client.out.Lock()
++			if _, err := client.writeRecordLocked(recordTypeHandshake, append(kuMsg, kuMsg...)); err != nil {
++				t.Fatalf("failed to write key update messages: %v", err)
++			}
++			client.out.Unlock()
++
++			_, err = io.Copy(io.Discard, client)
++			if err == nil {
++				t.Fatal("expected multiple key update messages to cause an error, got nil")
++			} else if !strings.HasSuffix(err.Error(), "tls: unexpected message") {
++				t.Fatalf("unexpected error: %v", err)
++			}
++		})
++	}
++}
+-- 
+2.50.1
+
-- 
2.50.1


