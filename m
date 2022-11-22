Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23757C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 16:08:11 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.23607.1669133286089760365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 08:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OFtR7un7;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id b185so14778715pfb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 08:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCBI+tA/hHvF41AAMV5juefsZZGde5dMx2AxfCLgB2c=;
        b=OFtR7un7+M3TrGKHhK/bsTeet1wvDTTKtdvNUQSNpZKgsbC5xcJUwiMuqQneLPVdRn
         kyBVxu9MLvBkRT+VJij1J9SyLSnOKQY4U00nKNHD9qqyPLGLrzpCPEPzhUdnz5ij5uF+
         h4khuiOGhzU45zVwLS5Ua96Is0/sDgQ5zy1/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCBI+tA/hHvF41AAMV5juefsZZGde5dMx2AxfCLgB2c=;
        b=WPhKllvoplXYPaq1wOMhDG0svARfINmWbOsc5FJL0rxDTSbKCQl8GFpKgqxLPycA1s
         NW/rSQZHJCbYuDxnexFhGnP4pKuBjnN9y/hwkq33yN+dNMduPjZdqu3DM3KtR8UnVOXJ
         4OAXKORb6xQDIx3WDWtD4oNOeD3oVExw9I1mDcNKEYnnanIkxsgoFaXb6KRL1HnZIbVR
         6lseRtloELKRCm3eXXlPcnkuefs6nALL7ZcwE+uK9gTrTz9dfC/budvzELNRVoKjXxl6
         KAKT4p/O4qCswXt9aYqm68s1v4y9ZVcOEq+O6sbTRUaooukrV6sp8hhkxwA3VXR1U95Q
         cHcQ==
X-Gm-Message-State: ANoB5pknfstmxBms8Qt8MTx/P5ap85zsfQ/Eqv+GHWD6sDSiPWKrnO4W
	YbQXt7r3Kwwy91bul2UCYWBjRwYjWP1MdQ==
X-Google-Smtp-Source: AA0mqf6fu7ITcjhBYtAuq51jSU8ojIwKHEKKkhFeeah6VxGRVkJc60BREsH6HbxirncanRtiLFdNvQ==
X-Received: by 2002:a63:554a:0:b0:44c:bfe:9b1c with SMTP id f10-20020a63554a000000b0044c0bfe9b1cmr11008347pgm.103.1669133284962;
        Tue, 22 Nov 2022 08:08:04 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.87.82])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902d49100b00187033cac81sm12329440plg.145.2022.11.22.08.08.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 08:08:04 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 22 Nov 2022 21:37:55 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] golang: Fix CVE-2022-2879\
Date: Tue, 22 Nov 2022 21:37:53 +0530
Message-Id: <20221122160753.11027-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 16:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173691

Reader.Read doesn't set a limit on the maximum size of file headers.

Upstream-Status: Backport from [https://github.com/golang/go/commit/0a723816cd205576945fa57fbdde7e6532d59d08]
CVE: CVE-2022-2879
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-2879.patch            | 202 ++++++++++++++++++
 2 files changed, 203 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b18de66f42..c5e624e4a5 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://CVE-2022-27664.patch \
+    file://CVE-2022-2879.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
new file mode 100644
index 0000000000..c60bae2753
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
@@ -0,0 +1,202 @@
+From 0a723816cd205576945fa57fbdde7e6532d59d08 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 2 Sep 2022 20:45:18 -0700
+Subject: [PATCH] [release-branch.go1.18] archive/tar: limit size of headers
+
+Upstream-Status: Backport from [https://github.com/golang/go/commit/0a723816cd205576945fa57fbdde7e6532d59d08]
+CVE: CVE-2022-2879
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
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
+---
+ src/archive/tar/format.go                     |   4 +++
+ src/archive/tar/reader.go                     |  14 +++++++--
+ src/archive/tar/reader_test.go                |  11 ++++++-
+ .../tar/testdata/pax-bad-hdr-large.tar.bz2    | Bin 0 -> 156 bytes
+ src/archive/tar/writer.go                     |   3 ++
+ src/archive/tar/writer_test.go                |  27 ++++++++++++++++++
+ 6 files changed, 56 insertions(+), 3 deletions(-)
+ create mode 100644 src/archive/tar/testdata/pax-bad-hdr-large.tar.bz2
+
+diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
+index 21b9d9d4dbc62..8898c438b513e 100644
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
+index 4b11909bc9527..e609c15f27af7 100644
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
+@@ -828,6 +828,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, err error) {
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
+index f21a6065b4857..140c736429120 100644
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
+@@ -243,6 +244,9 @@ func TestReader(t *testing.T) {
+ 	}, {
+ 		file: "testdata/pax-bad-hdr-file.tar",
+ 		err:  ErrHeader,
++	}, {
++		file: "testdata/pax-bad-hdr-large.tar.bz2",
++		err:  ErrFieldTooLong,
+ 	}, {
+ 		file: "testdata/pax-bad-mtime-file.tar",
+ 		err:  ErrHeader,
+@@ -625,9 +629,14 @@ func TestReader(t *testing.T) {
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
+diff --git a/src/archive/tar/testdata/pax-bad-hdr-large.tar.bz2 b/src/archive/tar/testdata/pax-bad-hdr-large.tar.bz2
+new file mode 100644
+index 0000000000000000000000000000000000000000..06bf710d3ae4e96a27487124f08e30c9e318699d
+GIT binary patch
+literal 156
+zcmV;N0Av3`T4*^jL0KkKS;SwlM*sj&-;n5#Kmq^806<7UW<Xv*06+)`AOM6LQB%`R
+zAoUtF^&Y00G(AA7R6Rgw0K{a`;)ySob}qf{K(WW#h);2a@?<AStKizfO^|VdbRoJj
+zqj=52lgiv7w2N0MDEF-8t!>m)Y~!#90LDZj0F4RNS<;o$l$z=JG_q>Xyl@Bs{9VZu
+K;X*?Ze#IONT1LeH
+
+literal 0
+HcmV?d00001
+
+diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
+index 3729f7e82c192..9b2e3e25d4ceb 100644
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
+index da3fb89e65e51..640264984a96e 100644
+--- a/src/archive/tar/writer_test.go
++++ b/src/archive/tar/writer_test.go
+@@ -1004,6 +1004,33 @@ func TestIssue12594(t *testing.T) {
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
-- 
2.35.5


