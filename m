Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503FCC761AF
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.48829.1680453749259822773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YmOpnYpS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id f22so21716378plr.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453748; x=1683045748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lm0KMG9qiv7MxKutcAZROxYlLNGDq8tTJMJvzkl6HpU=;
        b=YmOpnYpS64AdwnBPMPYRGWLKiMkRrQ1A5zWCaBQa6edcgRDnql9wfHGM0K9Sezolp5
         YnhzIHKB2NTtOzt3XWK3TAowZYbCd5pYE7QfJnVKzhskc85QZd4a4KLB+poKQusQRH03
         rtJDtkirZxvj+FBS6YTW84G3ZJcHmtQWDpALeHavJx9otlWrOIVDy/ZfskW1NcrevsLQ
         sFDv43NkekJeYq6r7Exl6bM7/4P8hPVk1R1XjZg9Fd9tYgl5wKCMIpmu9cMW5ux33jHI
         X4+6GDjE89XFyA1/XQDp6voSijazeytrQbS/FjMwI1LJ0ZfM++oa1xMZGPcybFbgY4CH
         xOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453748; x=1683045748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lm0KMG9qiv7MxKutcAZROxYlLNGDq8tTJMJvzkl6HpU=;
        b=2L2lRqqq7nOTaY137m2axbltK+d9KBEgj9oQXbA3/hDr/KNh3D7StTVTOYhtsRKcig
         VxWdJPZYD9xF+WfXRV+O590PermIsLIFaamBiStr0Jj0GnNe2j9NrJsv7h72jdI40Gba
         j6N2D5blvLdssoBM/GQqscqxQpeo3JOB27xILTxQ+T1zw9BVgDhsmu3mqPIBvzD7JLRU
         Ul7D/ClS1w83oUh1+sIyYhv8hXVHD0lqB/x3ukoteNLEyOVyQdwFq/ATMv6QNVXRk7aC
         sVMo9UWz947NAj5hwr4+dWFtm0nyKxIo+/HYvcBGAQ+QoZCwWySZK+lG7IpCJxHM82ty
         qWtg==
X-Gm-Message-State: AAQBX9doIueJv9d7koPnz7b11s7Tn3K7O9qnZ0XzZkg4uDTdUpK+Oz8P
	QYF9VyF5aZCMZwKqJ6D12FdiEnrekVyBe4yQsh0=
X-Google-Smtp-Source: AKy350YypYXWyyKdSc5+0AKiZNH0naFiZn9D9QiFw0RC5WXWCIK19FN+HaiD8PB+rlzebJbDhZD6Cg==
X-Received: by 2002:a17:90b:3b49:b0:237:62f7:3106 with SMTP id ot9-20020a17090b3b4900b0023762f73106mr35341728pjb.17.1680453747736;
        Sun, 02 Apr 2023 09:42:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/21] go: fix CVE-2022-2879 and CVE-2022-41720
Date: Sun,  2 Apr 2023 06:41:57 -1000
Message-Id: <a896cebe1ce2363b501723475154350acf0e0783.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179583

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport appropriate patches to fix CVE-2022-2879 and CVE-2022-41720.

Modified the original fix for CVE-2022-2879 to remove a testdata tarball
and any references to it since git binary diffs are not supported in
quilt.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.18/CVE-2022-2879.patch            | 177 ++++++
 .../go/go-1.18/CVE-2022-41720.patch           | 514 ++++++++++++++++++
 3 files changed, 693 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41720.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 99662bd298..856c14de40 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -20,6 +20,8 @@ SRC_URI += "\
     file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
     file://CVE-2022-41715.patch \
     file://CVE-2022-41717.patch \
+    file://CVE-2022-2879.patch \
+    file://CVE-2022-41720.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
new file mode 100644
index 0000000000..0315e1a3ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
@@ -0,0 +1,177 @@
+From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 2 Sep 2022 20:45:18 -0700
+Subject: [PATCH] archive/tar: limit size of headers
+
+Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
+GNU link names), to avoid reading arbitrarily large amounts of data
+into memory.
+
+Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
+this issue.
+
+Fixes CVE-2022-2879
+Updates #54853
+Fixes #55925
+
+Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1565555
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1590622
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/438500
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+CVE: CVE-2022-2879
+Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/archive/tar/format.go      |  4 ++++
+ src/archive/tar/reader.go      | 14 ++++++++++++--
+ src/archive/tar/reader_test.go |  8 +++++++-
+ src/archive/tar/writer.go      |  3 +++
+ src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
+ 5 files changed, 53 insertions(+), 3 deletions(-)
+
+diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
+index cfe24a5..6642364 100644
+--- a/src/archive/tar/format.go
++++ b/src/archive/tar/format.go
+@@ -143,6 +143,10 @@ const (
+ 	blockSize  = 512 // Size of each block in a tar stream
+ 	nameSize   = 100 // Max length of the name field in USTAR format
+ 	prefixSize = 155 // Max length of the prefix field in USTAR format
++
++	// Max length of a special file (PAX header, GNU long name or link).
++	// This matches the limit used by libarchive.
++	maxSpecialFileSize = 1 << 20
+ )
+ 
+ // blockPadding computes the number of bytes needed to pad offset up to the
+diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
+index 1b1d5b4..f645af8 100644
+--- a/src/archive/tar/reader.go
++++ b/src/archive/tar/reader.go
+@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
+ 			continue // This is a meta header affecting the next header
+ 		case TypeGNULongName, TypeGNULongLink:
+ 			format.mayOnlyBe(FormatGNU)
+-			realname, err := io.ReadAll(tr)
++			realname, err := readSpecialFile(tr)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]string) (err error) {
+ // parsePAX parses PAX headers.
+ // If an extended header (type 'x') is invalid, ErrHeader is returned
+ func parsePAX(r io.Reader) (map[string]string, error) {
+-	buf, err := io.ReadAll(r)
++	buf, err := readSpecialFile(r)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, err error) {
+ 	return n, err
+ }
+ 
++// readSpecialFile is like io.ReadAll except it returns
++// ErrFieldTooLong if more than maxSpecialFileSize is read.
++func readSpecialFile(r io.Reader) ([]byte, error) {
++	buf, err := io.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
++	if len(buf) > maxSpecialFileSize {
++		return nil, ErrFieldTooLong
++	}
++	return buf, err
++}
++
+ // discard skips n bytes in r, reporting an error if unable to do so.
+ func discard(r io.Reader, n int64) error {
+ 	// If possible, Seek to the last byte before the end of the data section.
+diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_test.go
+index 789ddc1..926dc3d 100644
+--- a/src/archive/tar/reader_test.go
++++ b/src/archive/tar/reader_test.go
+@@ -6,6 +6,7 @@ package tar
+ 
+ import (
+ 	"bytes"
++	"compress/bzip2"
+ 	"crypto/md5"
+ 	"errors"
+ 	"fmt"
+@@ -625,9 +626,14 @@ func TestReader(t *testing.T) {
+ 			}
+ 			defer f.Close()
+ 
++			var fr io.Reader = f
++			if strings.HasSuffix(v.file, ".bz2") {
++				fr = bzip2.NewReader(fr)
++			}
++
+ 			// Capture all headers and checksums.
+ 			var (
+-				tr      = NewReader(f)
++				tr      = NewReader(fr)
+ 				hdrs    []*Header
+ 				chksums []string
+ 				rdbuf   = make([]byte, 8)
+diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
+index e80498d..893eac0 100644
+--- a/src/archive/tar/writer.go
++++ b/src/archive/tar/writer.go
+@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error {
+ 			flag = TypeXHeader
+ 		}
+ 		data := buf.String()
++		if len(data) > maxSpecialFileSize {
++			return ErrFieldTooLong
++		}
+ 		if err := tw.writeRawFile(name, data, flag, FormatPAX); err != nil || isGlobal {
+ 			return err // Global headers return here
+ 		}
+diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_test.go
+index a00f02d..4e709e5 100644
+--- a/src/archive/tar/writer_test.go
++++ b/src/archive/tar/writer_test.go
+@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
+ 	}
+ }
+ 
++func TestWriteLongHeader(t *testing.T) {
++	for _, test := range []struct {
++		name string
++		h    *Header
++	}{{
++		name: "name too long",
++		h:    &Header{Name: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "linkname too long",
++		h:    &Header{Linkname: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "uname too long",
++		h:    &Header{Uname: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "gname too long",
++		h:    &Header{Gname: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "PAX header too long",
++		h:    &Header{PAXRecords: map[string]string{"GOLANG.x": strings.Repeat("a", maxSpecialFileSize)}},
++	}} {
++		w := NewWriter(io.Discard)
++		if err := w.WriteHeader(test.h); err != ErrFieldTooLong {
++			t.Errorf("%v: w.WriteHeader() = %v, want ErrFieldTooLong", test.name, err)
++		}
++	}
++}
++
+ // testNonEmptyWriter wraps an io.Writer and ensures that
+ // Write is never called with an empty buffer.
+ type testNonEmptyWriter struct{ io.Writer }
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41720.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41720.patch
new file mode 100644
index 0000000000..6c2e8804b3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41720.patch
@@ -0,0 +1,514 @@
+From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 10 Nov 2022 12:16:27 -0800
+Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.Dir on
+ Windows
+
+Do not permit access to Windows reserved device names (NUL, COM1, etc.)
+via os.DirFS and http.Dir filesystems.
+
+Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
+the root to the relative path with a path separator, making
+os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
+a UNC name. Not only does this not open the intended file, but permits
+reference to any file on the system rather than only files on the
+current drive.
+
+Make os.DirFS("") invalid, with all file access failing. Previously,
+a root of "" was interpreted as "/", which is surprising and probably
+unintentional.
+
+Fixes CVE-2022-41720.
+Fixes #56694.
+
+Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1663832
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/455360
+Reviewed-by: Michael Pratt <mpratt@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Jenny Rakoczy <jenny@golang.org>
+
+CVE: CVE-2022-41720
+Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/go/build/deps_test.go                 |  1 +
+ src/internal/safefilepath/path.go         | 21 +++++
+ src/internal/safefilepath/path_other.go   | 23 ++++++
+ src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
+ src/internal/safefilepath/path_windows.go | 95 +++++++++++++++++++++++
+ src/net/http/fs.go                        |  8 +-
+ src/net/http/fs_test.go                   | 28 +++++++
+ src/os/file.go                            | 36 +++++++--
+ src/os/os_test.go                         | 38 +++++++++
+ 9 files changed, 328 insertions(+), 10 deletions(-)
+ create mode 100644 src/internal/safefilepath/path.go
+ create mode 100644 src/internal/safefilepath/path_other.go
+ create mode 100644 src/internal/safefilepath/path_test.go
+ create mode 100644 src/internal/safefilepath/path_windows.go
+
+diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
+index 45e2f25..dc3bb8c 100644
+--- a/src/go/build/deps_test.go
++++ b/src/go/build/deps_test.go
+@@ -165,6 +165,7 @@ var depsRules = `
+ 	io/fs
+ 	< internal/testlog
+ 	< internal/poll
++	< internal/safefilepath
+ 	< os
+ 	< os/signal;
+ 
+diff --git a/src/internal/safefilepath/path.go b/src/internal/safefilepath/path.go
+new file mode 100644
+index 0000000..0f0a270
+--- /dev/null
++++ b/src/internal/safefilepath/path.go
+@@ -0,0 +1,21 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++// Package safefilepath manipulates operating-system file paths.
++package safefilepath
++
++import (
++	"errors"
++)
++
++var errInvalidPath = errors.New("invalid path")
++
++// FromFS converts a slash-separated path into an operating-system path.
++//
++// FromFS returns an error if the path cannot be represented by the operating
++// system. For example, paths containing '\' and ':' characters are rejected
++// on Windows.
++func FromFS(path string) (string, error) {
++	return fromFS(path)
++}
+diff --git a/src/internal/safefilepath/path_other.go b/src/internal/safefilepath/path_other.go
+new file mode 100644
+index 0000000..f93da18
+--- /dev/null
++++ b/src/internal/safefilepath/path_other.go
+@@ -0,0 +1,23 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build !windows
++
++package safefilepath
++
++import "runtime"
++
++func fromFS(path string) (string, error) {
++	if runtime.GOOS == "plan9" {
++		if len(path) > 0 && path[0] == '#' {
++			return path, errInvalidPath
++		}
++	}
++	for i := range path {
++		if path[i] == 0 {
++			return "", errInvalidPath
++		}
++	}
++	return path, nil
++}
+diff --git a/src/internal/safefilepath/path_test.go b/src/internal/safefilepath/path_test.go
+new file mode 100644
+index 0000000..dc662c1
+--- /dev/null
++++ b/src/internal/safefilepath/path_test.go
+@@ -0,0 +1,88 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package safefilepath_test
++
++import (
++	"internal/safefilepath"
++	"os"
++	"path/filepath"
++	"runtime"
++	"testing"
++)
++
++type PathTest struct {
++	path, result string
++}
++
++const invalid = ""
++
++var fspathtests = []PathTest{
++	{".", "."},
++	{"/a/b/c", "/a/b/c"},
++	{"a\x00b", invalid},
++}
++
++var winreservedpathtests = []PathTest{
++	{`a\b`, `a\b`},
++	{`a:b`, `a:b`},
++	{`a/b:c`, `a/b:c`},
++	{`NUL`, `NUL`},
++	{`./com1`, `./com1`},
++	{`a/nul/b`, `a/nul/b`},
++}
++
++// Whether a reserved name with an extension is reserved or not varies by
++// Windows version.
++var winreservedextpathtests = []PathTest{
++	{"nul.txt", "nul.txt"},
++	{"a/nul.txt/b", "a/nul.txt/b"},
++}
++
++var plan9reservedpathtests = []PathTest{
++	{`#c`, `#c`},
++}
++
++func TestFromFS(t *testing.T) {
++	switch runtime.GOOS {
++	case "windows":
++		if canWriteFile(t, "NUL") {
++			t.Errorf("can unexpectedly write a file named NUL on Windows")
++		}
++		if canWriteFile(t, "nul.txt") {
++			fspathtests = append(fspathtests, winreservedextpathtests...)
++		} else {
++			winreservedpathtests = append(winreservedpathtests, winreservedextpathtests...)
++		}
++		for i := range winreservedpathtests {
++			winreservedpathtests[i].result = invalid
++		}
++		for i := range fspathtests {
++			fspathtests[i].result = filepath.FromSlash(fspathtests[i].result)
++		}
++	case "plan9":
++		for i := range plan9reservedpathtests {
++			plan9reservedpathtests[i].result = invalid
++		}
++	}
++	tests := fspathtests
++	tests = append(tests, winreservedpathtests...)
++	tests = append(tests, plan9reservedpathtests...)
++	for _, test := range tests {
++		got, err := safefilepath.FromFS(test.path)
++		if (got == "") != (err != nil) {
++			t.Errorf(`FromFS(%q) = %q, %v; want "" only if err != nil`, test.path, got, err)
++		}
++		if got != test.result {
++			t.Errorf("FromFS(%q) = %q, %v; want %q", test.path, got, err, test.result)
++		}
++	}
++}
++
++func canWriteFile(t *testing.T, name string) bool {
++	path := filepath.Join(t.TempDir(), name)
++	os.WriteFile(path, []byte("ok"), 0666)
++	b, _ := os.ReadFile(path)
++	return string(b) == "ok"
++}
+diff --git a/src/internal/safefilepath/path_windows.go b/src/internal/safefilepath/path_windows.go
+new file mode 100644
+index 0000000..909c150
+--- /dev/null
++++ b/src/internal/safefilepath/path_windows.go
+@@ -0,0 +1,95 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package safefilepath
++
++import (
++	"syscall"
++	"unicode/utf8"
++)
++
++func fromFS(path string) (string, error) {
++	if !utf8.ValidString(path) {
++		return "", errInvalidPath
++	}
++	for len(path) > 1 && path[0] == '/' && path[1] == '/' {
++		path = path[1:]
++	}
++	containsSlash := false
++	for p := path; p != ""; {
++		// Find the next path element.
++		i := 0
++		dot := -1
++		for i < len(p) && p[i] != '/' {
++			switch p[i] {
++			case 0, '\\', ':':
++				return "", errInvalidPath
++			case '.':
++				if dot < 0 {
++					dot = i
++				}
++			}
++			i++
++		}
++		part := p[:i]
++		if i < len(p) {
++			containsSlash = true
++			p = p[i+1:]
++		} else {
++			p = ""
++		}
++		// Trim the extension and look for a reserved name.
++		base := part
++		if dot >= 0 {
++			base = part[:dot]
++		}
++		if isReservedName(base) {
++			if dot < 0 {
++				return "", errInvalidPath
++			}
++			// The path element is a reserved name with an extension.
++			// Some Windows versions consider this a reserved name,
++			// while others do not. Use FullPath to see if the name is
++			// reserved.
++			if p, _ := syscall.FullPath(part); len(p) >= 4 && p[:4] == `\\.\` {
++				return "", errInvalidPath
++			}
++		}
++	}
++	if containsSlash {
++		// We can't depend on strings, so substitute \ for / manually.
++		buf := []byte(path)
++		for i, b := range buf {
++			if b == '/' {
++				buf[i] = '\\'
++			}
++		}
++		path = string(buf)
++	}
++	return path, nil
++}
++
++// isReservedName reports if name is a Windows reserved device name.
++// It does not detect names with an extension, which are also reserved on some Windows versions.
++//
++// For details, search for PRN in
++// https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-file.
++func isReservedName(name string) bool {
++	if 3 <= len(name) && len(name) <= 4 {
++		switch string([]byte{toUpper(name[0]), toUpper(name[1]), toUpper(name[2])}) {
++		case "CON", "PRN", "AUX", "NUL":
++			return len(name) == 3
++		case "COM", "LPT":
++			return len(name) == 4 && '1' <= name[3] && name[3] <= '9'
++		}
++	}
++	return false
++}
++
++func toUpper(c byte) byte {
++	if 'a' <= c && c <= 'z' {
++		return c - ('a' - 'A')
++	}
++	return c
++}
+diff --git a/src/net/http/fs.go b/src/net/http/fs.go
+index 57e731e..43ee4b5 100644
+--- a/src/net/http/fs.go
++++ b/src/net/http/fs.go
+@@ -9,6 +9,7 @@ package http
+ import (
+ 	"errors"
+ 	"fmt"
++	"internal/safefilepath"
+ 	"io"
+ 	"io/fs"
+ 	"mime"
+@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error, name string) error {
+ // Open implements FileSystem using os.Open, opening files for reading rooted
+ // and relative to the directory d.
+ func (d Dir) Open(name string) (File, error) {
+-	if filepath.Separator != '/' && strings.ContainsRune(name, filepath.Separator) {
+-		return nil, errors.New("http: invalid character in file path")
++	path, err := safefilepath.FromFS(path.Clean("/" + name))
++	if err != nil {
++		return nil, errors.New("http: invalid or unsafe file path")
+ 	}
+ 	dir := string(d)
+ 	if dir == "" {
+ 		dir = "."
+ 	}
+-	fullName := filepath.Join(dir, filepath.FromSlash(path.Clean("/"+name)))
++	fullName := filepath.Join(dir, path)
+ 	f, err := os.Open(fullName)
+ 	if err != nil {
+ 		return nil, mapDirOpenError(err, fullName)
+diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
+index b42ade1..941448a 100644
+--- a/src/net/http/fs_test.go
++++ b/src/net/http/fs_test.go
+@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
+ 	}
+ }
+ 
++func TestFileServerNamesEscape(t *testing.T) {
++	t.Run("h1", func(t *testing.T) {
++		testFileServerNamesEscape(t, h1Mode)
++	})
++	t.Run("h2", func(t *testing.T) {
++		testFileServerNamesEscape(t, h2Mode)
++	})
++}
++func testFileServerNamesEscape(t *testing.T, h2 bool) {
++	defer afterTest(t)
++	ts := newClientServerTest(t, h2, FileServer(Dir("testdata"))).ts
++	defer ts.Close()
++	for _, path := range []string{
++		"/../testdata/file",
++		"/NUL", // don't read from device files on Windows
++	} {
++		res, err := ts.Client().Get(ts.URL + path)
++		if err != nil {
++			t.Fatal(err)
++		}
++		res.Body.Close()
++		if res.StatusCode < 400 || res.StatusCode > 599 {
++			t.Errorf("Get(%q): got status %v, want 4xx or 5xx", path, res.StatusCode)
++		}
++
++	}
++}
++
+ type fakeFileInfo struct {
+ 	dir      bool
+ 	basename string
+diff --git a/src/os/file.go b/src/os/file.go
+index e717f17..cb87158 100644
+--- a/src/os/file.go
++++ b/src/os/file.go
+@@ -37,12 +37,12 @@
+ // Note: The maximum number of concurrent operations on a File may be limited by
+ // the OS or the system. The number should be high, but exceeding it may degrade
+ // performance or cause other issues.
+-//
+ package os
+ 
+ import (
+ 	"errors"
+ 	"internal/poll"
++	"internal/safefilepath"
+ 	"internal/testlog"
+ 	"internal/unsafeheader"
+ 	"io"
+@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool {
+ // the /prefix tree, then using DirFS does not stop the access any more than using
+ // os.Open does. DirFS is therefore not a general substitute for a chroot-style security
+ // mechanism when the directory tree contains arbitrary content.
++//
++// The directory dir must not be "".
+ func DirFS(dir string) fs.FS {
+ 	return dirFS(dir)
+ }
+@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
+ type dirFS string
+ 
+ func (dir dirFS) Open(name string) (fs.File, error) {
+-	if !fs.ValidPath(name) || runtime.GOOS == "windows" && containsAny(name, `\:`) {
+-		return nil, &PathError{Op: "open", Path: name, Err: ErrInvalid}
++	fullname, err := dir.join(name)
++	if err != nil {
++		return nil, &PathError{Op: "stat", Path: name, Err: err}
+ 	}
+-	f, err := Open(string(dir) + "/" + name)
++	f, err := Open(fullname)
+ 	if err != nil {
+ 		return nil, err // nil fs.File
+ 	}
+@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, error) {
+ }
+ 
+ func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
+-	if !fs.ValidPath(name) || runtime.GOOS == "windows" && containsAny(name, `\:`) {
+-		return nil, &PathError{Op: "stat", Path: name, Err: ErrInvalid}
++	fullname, err := dir.join(name)
++	if err != nil {
++		return nil, &PathError{Op: "stat", Path: name, Err: err}
+ 	}
+-	f, err := Stat(string(dir) + "/" + name)
++	f, err := Stat(fullname)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+ 	return f, nil
+ }
+ 
++// join returns the path for name in dir.
++func (dir dirFS) join(name string) (string, error) {
++	if dir == "" {
++		return "", errors.New("os: DirFS with empty root")
++	}
++	if !fs.ValidPath(name) {
++		return "", ErrInvalid
++	}
++	name, err := safefilepath.FromFS(name)
++	if err != nil {
++		return "", ErrInvalid
++	}
++	if IsPathSeparator(dir[len(dir)-1]) {
++		return string(dir) + name, nil
++	}
++	return string(dir) + string(PathSeparator) + name, nil
++}
++
+ // ReadFile reads the named file and returns the contents.
+ // A successful call returns err == nil, not err == EOF.
+ // Because ReadFile reads the whole file, it does not treat an EOF from Read
+diff --git a/src/os/os_test.go b/src/os/os_test.go
+index 506f1fb..be269bb 100644
+--- a/src/os/os_test.go
++++ b/src/os/os_test.go
+@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
+ 	if err == nil {
+ 		t.Fatalf(`Open testdata\dirfs succeeded`)
+ 	}
++
++	// Test that Open does not open Windows device files.
++	_, err = d.Open(`NUL`)
++	if err == nil {
++		t.Errorf(`Open NUL succeeded`)
++	}
++}
++
++func TestDirFSRootDir(t *testing.T) {
++	cwd, err := os.Getwd()
++	if err != nil {
++		t.Fatal(err)
++	}
++	cwd = cwd[len(filepath.VolumeName(cwd)):] // trim volume prefix (C:) on Windows
++	cwd = filepath.ToSlash(cwd)               // convert \ to /
++	cwd = strings.TrimPrefix(cwd, "/")        // trim leading /
++
++	// Test that Open can open a path starting at /.
++	d := DirFS("/")
++	f, err := d.Open(cwd + "/testdata/dirfs/a")
++	if err != nil {
++		t.Fatal(err)
++	}
++	f.Close()
++}
++
++func TestDirFSEmptyDir(t *testing.T) {
++	d := DirFS("")
++	cwd, _ := os.Getwd()
++	for _, path := range []string{
++		"testdata/dirfs/a",                          // not DirFS(".")
++		filepath.ToSlash(cwd) + "/testdata/dirfs/a", // not DirFS("/")
++	} {
++		_, err := d.Open(path)
++		if err == nil {
++			t.Fatalf(`DirFS("").Open(%q) succeeded`, path)
++		}
++	}
+ }
+ 
+ func TestDirFSPathsValid(t *testing.T) {
-- 
2.34.1


