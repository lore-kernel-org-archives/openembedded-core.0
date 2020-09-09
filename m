Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.8957.1599639107362172797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zMWY2nERlKoF1KKAf9Pz0XNr1jOjJa++Wguol/F+xKCWMP6W7EyqtdaUdQcgu6ZCg7NU/QkNi0
 rmrKnjfs5SFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767006"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767006"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:26 -0700
IronPort-SDR: xChIJPpGRIBPRoXEMcRIRMB2SdEKw728UuWIXfJThyg6QG0ma8945WUX8WYXXRp7hLql6GKrKT
 qgQSstB9PwdA==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371043"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 03/11] go: CVE-2020-16845
Date: Wed,  9 Sep 2020 16:11:05 +0800
Message-Id: <909251b7760e7df08e93f9159149842b432f5cba.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport CVE patch from the upstream:
https://github.com/golang/go.git
commit 027d7241ce050d197e7fabea3d541ffbe3487258

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |   1 +
 .../go/go-1.12/CVE-2020-16845.patch           | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-16845.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index c3c2d0cfee..fd2d641554 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
     file://0010-fix-CVE-2019-17596.patch \
     file://CVE-2020-15586.patch \
+    file://CVE-2020-16845.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/CVE-2020-16845.patch b/meta/recipes-devtools/go/go-1.12/CVE-2020-16845.patch
new file mode 100644
index 0000000000..80f467522f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/CVE-2020-16845.patch
@@ -0,0 +1,110 @@
+From 027d7241ce050d197e7fabea3d541ffbe3487258 Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Tue, 4 Aug 2020 11:45:32 -0400
+Subject: [PATCH] encoding/binary: read at most MaxVarintLen64 bytes in
+ ReadUvarint
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This CL ensures that ReadUvarint consumes only a limited
+amount of input (instead of an unbounded amount).
+
+On some inputs, ReadUvarint could read an arbitrary number
+of bytes before deciding to return an overflow error.
+After this CL, ReadUvarint returns that same overflow
+error sooner, after reading at most MaxVarintLen64 bytes.
+
+Fix authored by Robert Griesemer and Filippo Valsorda.
+
+Thanks to Diederik Loerakker, Jonny Rhea, Raúl Kripalani,
+and Preston Van Loon for reporting this.
+
+Fixes #40618
+Fixes CVE-2020-16845
+
+Change-Id: Ie0cb15972f14c38b7cf7af84c45c4ce54909bb8f
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/812099
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/247120
+Run-TryBot: Katie Hockman <katie@golang.org>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+Reviewed-by: Alexander Rakoczy <alex@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go.git]
+CVE: CVE-2020-16845
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ src/encoding/binary/varint.go      |  5 +++--
+ src/encoding/binary/varint_test.go | 18 ++++++++++++------
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/encoding/binary/varint.go b/src/encoding/binary/varint.go
+index bcb8ac9a45..38af61075c 100644
+--- a/src/encoding/binary/varint.go
++++ b/src/encoding/binary/varint.go
+@@ -106,13 +106,13 @@ var overflow = errors.New("binary: varint overflows a 64-bit integer")
+ func ReadUvarint(r io.ByteReader) (uint64, error) {
+ 	var x uint64
+ 	var s uint
+-	for i := 0; ; i++ {
++	for i := 0; i < MaxVarintLen64; i++ {
+ 		b, err := r.ReadByte()
+ 		if err != nil {
+ 			return x, err
+ 		}
+ 		if b < 0x80 {
+-			if i > 9 || i == 9 && b > 1 {
++			if i == 9 && b > 1 {
+ 				return x, overflow
+ 			}
+ 			return x | uint64(b)<<s, nil
+@@ -120,6 +120,7 @@ func ReadUvarint(r io.ByteReader) (uint64, error) {
+ 		x |= uint64(b&0x7f) << s
+ 		s += 7
+ 	}
++	return x, overflow
+ }
+ 
+ // ReadVarint reads an encoded signed integer from r and returns it as an int64.
+diff --git a/src/encoding/binary/varint_test.go b/src/encoding/binary/varint_test.go
+index ca411ecbd6..6ef4c99505 100644
+--- a/src/encoding/binary/varint_test.go
++++ b/src/encoding/binary/varint_test.go
+@@ -121,21 +121,27 @@ func TestBufferTooSmall(t *testing.T) {
+ 	}
+ }
+ 
+-func testOverflow(t *testing.T, buf []byte, n0 int, err0 error) {
++func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error) {
+ 	x, n := Uvarint(buf)
+ 	if x != 0 || n != n0 {
+ 		t.Errorf("Uvarint(%v): got x = %d, n = %d; want 0, %d", buf, x, n, n0)
+ 	}
+ 
+-	x, err := ReadUvarint(bytes.NewReader(buf))
+-	if x != 0 || err != err0 {
+-		t.Errorf("ReadUvarint(%v): got x = %d, err = %s; want 0, %s", buf, x, err, err0)
++	r := bytes.NewReader(buf)
++	len := r.Len()
++	x, err := ReadUvarint(r)
++	if x != x0 || err != err0 {
++		t.Errorf("ReadUvarint(%v): got x = %d, err = %s; want %d, %s", buf, x, err, x0, err0)
++	}
++	if read := len - r.Len(); read > MaxVarintLen64 {
++		t.Errorf("ReadUvarint(%v): read more than MaxVarintLen64 bytes, got %d", buf, read)
+ 	}
+ }
+ 
+ func TestOverflow(t *testing.T) {
+-	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x2}, -10, overflow)
+-	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x1, 0, 0}, -13, overflow)
++	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x2}, 0, -10, overflow)
++	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x1, 0, 0}, 0, -13, overflow)
++	testOverflow(t, []byte{0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, 1<<64-1, 0, overflow) // 11 bytes, should overflow
+ }
+ 
+ func TestNonCanonicalZero(t *testing.T) {
+-- 
+2.17.0
+
-- 
2.26.2

