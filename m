Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22F1E7E640
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:12:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.19889.1695737541775963368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YQbbHkCo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-69101022969so7889042b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695737541; x=1696342341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBZwQsDfcyO2v2bcZBgmoKmM3h9pqrCWo+FUoAKITuI=;
        b=YQbbHkCo1r5SWJqxILG8MeNjrf5fhBYyzNMNX1GIgm8K0zvoDeu45Oqpt4unf2v7Qp
         XEqrmhxhsXg4aJsmeEY51H/EQz+OSdgKc4NjmgoxUByBbLWCjl4nE77BifDRTR68gpWD
         uOHg29loZOwiLULXMAB2ncGMCOdvyFPOGYDSFmRyoz5FSg76okhFKL8Hu1i+YqetOlZQ
         D9vkwk0dJwxloilNVofnq6JyRDJqmj9/BvaXIpqACsL5BZPi7pdKWlZ1yhDC6ONk2GAR
         A3O7okTvJ48vRCU+8DxX3bO1yHu/sA/BW6XnqtcwWpuHX/UrX9OCYSjeh+VDQAdwtHIm
         D+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737541; x=1696342341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBZwQsDfcyO2v2bcZBgmoKmM3h9pqrCWo+FUoAKITuI=;
        b=XQDv6qLcWyo4e++XYeHzFytoqOkQD6BXiRbmZDhfNWnLDx1hjBoKlAhtQNkfF4oMaR
         WZlPWsR3M399Mj8bQmqIGdV1jptrg/GSnygj9dTS33yC2O7jAKlETCfxau225KPCsbjg
         4eJDBSEAqKiNfr67XjLJfkh8LiGd1VJBT7B/HU+u5jd0QEx1NO29ungIqyLpinmf4y+R
         oyazLiqwz5C1Q7VxBcSlmrvJ5IgIwxAaNhD9lTaQ7IJJvojsMiRXdfXNrphcGSe1o2nZ
         dzaeLSaQbMjTkyKuSgUGZv+PrA1zBVEk6e1iYXLKcYvrK2Ie+8ZTtzB1ZecpBRcUpU9C
         i52w==
X-Gm-Message-State: AOJu0Yw7i64BfWfaYicJs2ORcpHDoQ6xLxQtBBrtzAIOaNbgIQtC0nCc
	TnKNkTG9XkSea5z8snZ6ikL8Hx4Tyi7XbtDLJ8o=
X-Google-Smtp-Source: AGHT+IGQQEo95SGf0E4QfX1bbwuoCDvezAACERE0krf/5gViaR23facFiGCyrgj68MrJKBV/+nxroA==
X-Received: by 2002:a05:6a20:6a1f:b0:15e:e0fd:98e7 with SMTP id p31-20020a056a206a1f00b0015ee0fd98e7mr7069811pzk.20.1695737539320;
        Tue, 26 Sep 2023 07:12:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm1348861pgc.80.2023.09.26.07.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:12:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] go: Backport fix for CVE-2022-41725 and CVE-2023-24536
Date: Tue, 26 Sep 2023 04:12:04 -1000
Message-Id: <532eb2c57fb1817999a857fc71db4438717ccadb.1695737244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695737244.git.steve@sakoman.com>
References: <cover.1695737244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188249

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit:
https://github.com/golang/go/commit/874b3132a84cf76da6a48978826c04c380a37a50
&
https://github.com/golang/go/commit/4e5a313524da62600eb59dbf98624cfe946456f8
&
https://github.com/golang/go/commit/5246fa5e75b129a7dbd9722aa4de0cbaf7ceae43
&
https://github.com/golang/go/commit/5c55ac9bf1e5f779220294c843526536605f42ab
&
https://github.com/golang/go/commit/ef41a4e2face45e580c5836eaebd51629fc23f15
&
https://github.com/golang/go/commit/7a359a651c7ebdb29e0a1c03102fce793e9f58f0
&
https://github.com/golang/go/commit/7917b5f31204528ea72e0629f0b7d52b35b27538

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   7 +
 .../go/go-1.14/CVE-2022-41725-pre1.patch      |  85 +++
 .../go/go-1.14/CVE-2022-41725-pre2.patch      |  97 +++
 .../go/go-1.14/CVE-2022-41725-pre3.patch      |  98 +++
 .../go/go-1.14/CVE-2022-41725.patch           | 660 ++++++++++++++++++
 .../go/go-1.14/CVE-2023-24536_1.patch         | 134 ++++
 .../go/go-1.14/CVE-2023-24536_2.patch         | 184 +++++
 .../go/go-1.14/CVE-2023-24536_3.patch         | 349 +++++++++
 8 files changed, 1614 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24536_1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24536_2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24536_3.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 20377e095b..784b502f46 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -70,6 +70,13 @@ SRC_URI += "\
     file://CVE-2023-29400.patch \
     file://CVE-2023-29406.patch \
     file://CVE-2023-29409.patch \
+    file://CVE-2022-41725-pre1.patch \
+    file://CVE-2022-41725-pre2.patch \
+    file://CVE-2022-41725-pre3.patch \
+    file://CVE-2022-41725.patch \
+    file://CVE-2023-24536_1.patch \
+    file://CVE-2023-24536_2.patch \
+    file://CVE-2023-24536_3.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre1.patch
new file mode 100644
index 0000000000..37ebc41947
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre1.patch
@@ -0,0 +1,85 @@
+From 874b3132a84cf76da6a48978826c04c380a37a50 Mon Sep 17 00:00:00 2001
+From: avivklas <avivklas@gmail.com>
+Date: Fri, 7 Aug 2020 21:50:12 +0300
+Subject: [PATCH] mime/multipart: return overflow errors in Reader.ReadForm
+
+Updates Reader.ReadForm to check for overflow errors that may
+result from a leeway addition of 10MiB to the input argument
+maxMemory.
+
+Fixes #40430
+
+Change-Id: I510b8966c95c51d04695ba9d08fcfe005fd11a5d
+Reviewed-on: https://go-review.googlesource.com/c/go/+/247477
+Run-TryBot: Emmanuel Odeke <emm.odeke@gmail.com>
+Trust: Cuong Manh Le <cuong.manhle.vn@gmail.com>
+Trust: Emmanuel Odeke <emm.odeke@gmail.com>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Emmanuel Odeke <emm.odeke@gmail.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/874b3132a84cf76da6a48978826c04c380a37a50]
+CVE: CVE-2022-41725 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata.go      |  4 ++++
+ src/mime/multipart/formdata_test.go | 18 ++++++++++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 832d0ad693666..4eb31012941ac 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -7,6 +7,7 @@ package multipart
+ import (
+ 	"bytes"
+ 	"errors"
++	"fmt"
+ 	"io"
+ 	"io/ioutil"
+ 	"net/textproto"
+@@ -41,6 +42,9 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 
+ 	// Reserve an additional 10 MB for non-file parts.
+ 	maxValueBytes := maxMemory + int64(10<<20)
++	if maxValueBytes <= 0 {
++		return nil, fmt.Errorf("multipart: integer overflow from maxMemory(%d) + 10MiB for non-file parts", maxMemory)
++	}
+ 	for {
+ 		p, err := r.NextPart()
+ 		if err == io.EOF {
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index 7d756c8c244a0..7112e0d3727fe 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -7,6 +7,7 @@ package multipart
+ import (
+ 	"bytes"
+ 	"io"
++	"math"
+ 	"os"
+ 	"strings"
+ 	"testing"
+@@ -52,6 +53,23 @@ func TestReadFormWithNamelessFile(t *testing.T) {
+ 	}
+ }
+ 
++// Issue 40430: Ensure that we report integer overflows in additions of maxMemory,
++// instead of silently and subtly failing without indication.
++func TestReadFormMaxMemoryOverflow(t *testing.T) {
++	b := strings.NewReader(strings.ReplaceAll(messageWithTextContentType, "\n", "\r\n"))
++	r := NewReader(b, boundary)
++	f, err := r.ReadForm(math.MaxInt64)
++	if err == nil {
++		t.Fatal("Unexpected a non-nil error")
++	}
++	if f != nil {
++		t.Fatalf("Unexpected returned a non-nil form: %v\n", f)
++	}
++	if g, w := err.Error(), "integer overflow from maxMemory"; !strings.Contains(g, w) {
++		t.Errorf(`Error mismatch\n%q\ndid not contain\n%q`, g, w)
++	}
++}
++
+ func TestReadFormWithTextContentType(t *testing.T) {
+ 	// From https://github.com/golang/go/issues/24041
+ 	b := strings.NewReader(strings.ReplaceAll(messageWithTextContentType, "\n", "\r\n"))
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre2.patch
new file mode 100644
index 0000000000..b951ee893e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre2.patch
@@ -0,0 +1,97 @@
+From 4e5a313524da62600eb59dbf98624cfe946456f8 Mon Sep 17 00:00:00 2001
+From: Emmanuel T Odeke <emmanuel@orijtech.com>
+Date: Tue, 20 Oct 2020 04:11:12 -0700
+Subject: [PATCH] net/http: test that ParseMultipartForm catches overflows
+
+Tests that if the combination of:
+* HTTP multipart file payload size
+* ParseMultipartForm's maxMemory parameter
+* the internal leeway buffer size of 10MiB
+
+overflows, then we'll report an overflow instead of silently
+passing.
+
+Reapplies and fixes CL 254977, which was reverted in CL 263658.
+
+The prior test lacked a res.Body.Close(), so fixed that and
+added a leaked Transport check to verify correctness.
+
+Updates 40430.
+
+Change-Id: I3c0f7ef43d621f6eb00f07755f04f9f36c51f98f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/263817
+Run-TryBot: Emmanuel Odeke <emm.odeke@gmail.com>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Bryan C. Mills <bcmills@google.com>
+Trust: Damien Neil <dneil@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/4e5a313524da62600eb59dbf98624cfe946456f8]
+CVE: CVE-2022-41725 #Dependency Patch2
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/net/http/request_test.go | 45 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
+index b4ef472e71229..19526b9ad791a 100644
+--- a/src/net/http/request_test.go
++++ b/src/net/http/request_test.go
+@@ -13,6 +13,7 @@ import (
+ 	"fmt"
+ 	"io"
+ 	"io/ioutil"
++	"math"
+ 	"mime/multipart"
+ 	. "net/http"
+ 	"net/http/httptest"
+@@ -245,6 +246,50 @@ func TestParseMultipartForm(t *testing.T) {
+ 	}
+ }
+ 
++// Issue #40430: Test that if maxMemory for ParseMultipartForm when combined with
++// the payload size and the internal leeway buffer size of 10MiB overflows, that we
++// correctly return an error.
++func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T) {
++	defer afterTest(t)
++
++	payloadSize := 1 << 10
++	cst := httptest.NewServer(HandlerFunc(func(rw ResponseWriter, req *Request) {
++		// The combination of:
++		//      MaxInt64 + payloadSize + (internal spare of 10MiB)
++		// triggers the overflow. See issue https://golang.org/issue/40430/
++		if err := req.ParseMultipartForm(math.MaxInt64); err != nil {
++			Error(rw, err.Error(), StatusBadRequest)
++			return
++		}
++	}))
++	defer cst.Close()
++	fBuf := new(bytes.Buffer)
++	mw := multipart.NewWriter(fBuf)
++	mf, err := mw.CreateFormFile("file", "myfile.txt")
++	if err != nil {
++		t.Fatal(err)
++	}
++	if _, err := mf.Write(bytes.Repeat([]byte("abc"), payloadSize)); err != nil {
++		t.Fatal(err)
++	}
++	if err := mw.Close(); err != nil {
++		t.Fatal(err)
++	}
++	req, err := NewRequest("POST", cst.URL, fBuf)
++	if err != nil {
++		t.Fatal(err)
++	}
++	req.Header.Set("Content-Type", mw.FormDataContentType())
++	res, err := cst.Client().Do(req)
++	if err != nil {
++		t.Fatal(err)
++	}
++	res.Body.Close()
++	if g, w := res.StatusCode, StatusBadRequest; g != w {
++		t.Fatalf("Status code mismatch: got %d, want %d", g, w)
++	}
++}
++
+ func TestRedirect_h1(t *testing.T) { testRedirect(t, h1Mode) }
+ func TestRedirect_h2(t *testing.T) { testRedirect(t, h2Mode) }
+ func testRedirect(t *testing.T, h2 bool) {
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre3.patch
new file mode 100644
index 0000000000..767225b888
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre3.patch
@@ -0,0 +1,98 @@
+From 5246fa5e75b129a7dbd9722aa4de0cbaf7ceae43 Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Thu, 3 Dec 2020 09:45:07 -0500
+Subject: [PATCH] mime/multipart: handle ReadForm(math.MaxInt64) better
+
+Returning an error about integer overflow is needlessly pedantic.
+The meaning of ReadForm(MaxInt64) is easily understood
+(accept a lot of data) and can be implemented.
+
+Fixes #40430.
+
+Change-Id: I8a522033dd9a2f9ad31dd2ad82cf08d553736ab9
+Reviewed-on: https://go-review.googlesource.com/c/go/+/275112
+Trust: Russ Cox <rsc@golang.org>
+Run-TryBot: Russ Cox <rsc@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Ian Lance Taylor <iant@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5246fa5e75b129a7dbd9722aa4de0cbaf7ceae43]
+CVE: CVE-2022-41725 #Dependency Patch3
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata.go      |  8 ++++++--
+ src/mime/multipart/formdata_test.go | 14 +++++---------
+ src/net/http/request_test.go        |  2 +-
+ 3 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 4eb31012941ac..9c42ea8c023b5 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -7,9 +7,9 @@ package multipart
+ import (
+ 	"bytes"
+ 	"errors"
+-	"fmt"
+ 	"io"
+ 	"io/ioutil"
++	"math"
+ 	"net/textproto"
+ 	"os"
+ )
+@@ -43,7 +43,11 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	// Reserve an additional 10 MB for non-file parts.
+ 	maxValueBytes := maxMemory + int64(10<<20)
+ 	if maxValueBytes <= 0 {
+-		return nil, fmt.Errorf("multipart: integer overflow from maxMemory(%d) + 10MiB for non-file parts", maxMemory)
++		if maxMemory < 0 {
++			maxValueBytes = 0
++		} else {
++			maxValueBytes = math.MaxInt64
++		}
+ 	}
+ 	for {
+ 		p, err := r.NextPart()
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index 7112e0d3727fe..e3a3a3eae8e15 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -53,20 +53,16 @@ func TestReadFormWithNamelessFile(t *testing.T) {
+ 	}
+ }
+ 
+-// Issue 40430: Ensure that we report integer overflows in additions of maxMemory,
+-// instead of silently and subtly failing without indication.
++// Issue 40430: Handle ReadForm(math.MaxInt64)
+ func TestReadFormMaxMemoryOverflow(t *testing.T) {
+ 	b := strings.NewReader(strings.ReplaceAll(messageWithTextContentType, "\n", "\r\n"))
+ 	r := NewReader(b, boundary)
+ 	f, err := r.ReadForm(math.MaxInt64)
+-	if err == nil {
+-		t.Fatal("Unexpected a non-nil error")
+-	}
+-	if f != nil {
+-		t.Fatalf("Unexpected returned a non-nil form: %v\n", f)
++	if err != nil {
++		t.Fatalf("ReadForm(MaxInt64): %v", err)
+ 	}
+-	if g, w := err.Error(), "integer overflow from maxMemory"; !strings.Contains(g, w) {
+-		t.Errorf(`Error mismatch\n%q\ndid not contain\n%q`, g, w)
++	if f == nil {
++		t.Fatal("ReadForm(MaxInt64): missing form")
+ 	}
+ }
+ 
+diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
+index 19526b9ad791a..689498e19d5dd 100644
+--- a/src/net/http/request_test.go
++++ b/src/net/http/request_test.go
+@@ -285,7 +285,7 @@ func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T) {
+ 		t.Fatal(err)
+ 	}
+ 	res.Body.Close()
+-	if g, w := res.StatusCode, StatusBadRequest; g != w {
++	if g, w := res.StatusCode, StatusOK; g != w {
+ 		t.Fatalf("Status code mismatch: got %d, want %d", g, w)
+ 	}
+ }
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41725.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725.patch
new file mode 100644
index 0000000000..5f80c62b0b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41725.patch
@@ -0,0 +1,660 @@
+From 5c55ac9bf1e5f779220294c843526536605f42ab Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 25 Jan 2023 09:27:01 -0800
+Subject: [PATCH] [release-branch.go1.19] mime/multipart: limit memory/inode consumption of ReadForm
+
+Reader.ReadForm is documented as storing "up to maxMemory bytes + 10MB"
+in memory. Parsed forms can consume substantially more memory than
+this limit, since ReadForm does not account for map entry overhead
+and MIME headers.
+
+In addition, while the amount of disk memory consumed by ReadForm can
+be constrained by limiting the size of the parsed input, ReadForm will
+create one temporary file per form part stored on disk, potentially
+consuming a large number of inodes.
+
+Update ReadForm's memory accounting to include part names,
+MIME headers, and map entry overhead.
+
+Update ReadForm to store all on-disk file parts in a single
+temporary file.
+
+Files returned by FileHeader.Open are documented as having a concrete
+type of *os.File when a file is stored on disk. The change to use a
+single temporary file for all parts means that this is no longer the
+case when a form contains more than a single file part stored on disk.
+
+The previous behavior of storing each file part in a separate disk
+file may be reenabled with GODEBUG=multipartfiles=distinct.
+
+Update Reader.NextPart and Reader.NextRawPart to set a 10MiB cap
+on the size of MIME headers.
+
+Thanks to Jakob Ackermann (@das7pad) for reporting this issue.
+
+Updates #58006
+Fixes #58362
+Fixes CVE-2022-41725
+
+Change-Id: Ibd780a6c4c83ac8bcfd3cbe344f042e9940f2eab
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1714276
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+(cherry picked from commit ed4664330edcd91b24914c9371c377c132dbce8c)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1728949
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/468116
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Than McIntosh <thanm@google.com>
+Run-TryBot: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5c55ac9bf1e5f779220294c843526536605f42ab]
+CVE: CVE-2022-41725
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata.go       | 132 ++++++++++++++++++++-----
+ src/mime/multipart/formdata_test.go  | 140 ++++++++++++++++++++++++++-
+ src/mime/multipart/multipart.go      |  25 +++--
+ src/mime/multipart/readmimeheader.go |  14 +++
+ src/net/http/request_test.go         |   2 +-
+ src/net/textproto/reader.go          |  27 ++++++
+ 6 files changed, 303 insertions(+), 37 deletions(-)
+ create mode 100644 src/mime/multipart/readmimeheader.go
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 9c42ea8..1eeb340 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -7,6 +7,7 @@ package multipart
+ import (
+ 	"bytes"
+ 	"errors"
++	"internal/godebug"
+ 	"io"
+ 	"io/ioutil"
+ 	"math"
+@@ -34,23 +35,58 @@ func (r *Reader) ReadForm(maxMemory int64) (*Form, error) {
+ 
+ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	form := &Form{make(map[string][]string), make(map[string][]*FileHeader)}
++	var (
++		file    *os.File
++		fileOff int64
++	)
++	numDiskFiles := 0
++	multipartFiles := godebug.Get("multipartfiles")
++	combineFiles := multipartFiles != "distinct"
+ 	defer func() {
++		if file != nil {
++			if cerr := file.Close(); err == nil {
++				err = cerr
++			}
++		}
++		if combineFiles && numDiskFiles > 1 {
++			for _, fhs := range form.File {
++				for _, fh := range fhs {
++					fh.tmpshared = true
++				}
++			}
++		}
+ 		if err != nil {
+ 			form.RemoveAll()
++			if file != nil {
++				os.Remove(file.Name())
++			}
+ 		}
+ 	}()
+ 
+-	// Reserve an additional 10 MB for non-file parts.
+-	maxValueBytes := maxMemory + int64(10<<20)
+-	if maxValueBytes <= 0 {
++	// maxFileMemoryBytes is the maximum bytes of file data we will store in memory.
++	// Data past this limit is written to disk.
++	// This limit strictly applies to content, not metadata (filenames, MIME headers, etc.),
++	// since metadata is always stored in memory, not disk.
++	//
++	// maxMemoryBytes is the maximum bytes we will store in memory, including file content,
++	// non-file part values, metdata, and map entry overhead.
++	//
++	// We reserve an additional 10 MB in maxMemoryBytes for non-file data.
++	//
++	// The relationship between these parameters, as well as the overly-large and
++	// unconfigurable 10 MB added on to maxMemory, is unfortunate but difficult to change
++	// within the constraints of the API as documented.
++	maxFileMemoryBytes := maxMemory
++	maxMemoryBytes := maxMemory + int64(10<<20)
++	if maxMemoryBytes <= 0 {
+ 		if maxMemory < 0 {
+-			maxValueBytes = 0
++			maxMemoryBytes = 0
+ 		} else {
+-			maxValueBytes = math.MaxInt64
++			maxMemoryBytes = math.MaxInt64
+ 		}
+ 	}
+ 	for {
+-		p, err := r.NextPart()
++		p, err := r.nextPart(false, maxMemoryBytes)
+ 		if err == io.EOF {
+ 			break
+ 		}
+@@ -64,16 +100,27 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		}
+ 		filename := p.FileName()
+ 
++		// Multiple values for the same key (one map entry, longer slice) are cheaper
++		// than the same number of values for different keys (many map entries), but
++		// using a consistent per-value cost for overhead is simpler.
++		maxMemoryBytes -= int64(len(name))
++		maxMemoryBytes -= 100 // map overhead
++		if maxMemoryBytes < 0 {
++			// We can't actually take this path, since nextPart would already have
++			// rejected the MIME headers for being too large. Check anyway.
++			return nil, ErrMessageTooLarge
++		}
++
+ 		var b bytes.Buffer
+ 
+ 		if filename == "" {
+ 			// value, store as string in memory
+-			n, err := io.CopyN(&b, p, maxValueBytes+1)
++			n, err := io.CopyN(&b, p, maxMemoryBytes+1)
+ 			if err != nil && err != io.EOF {
+ 				return nil, err
+ 			}
+-			maxValueBytes -= n
+-			if maxValueBytes < 0 {
++			maxMemoryBytes -= n
++			if maxMemoryBytes < 0 {
+ 				return nil, ErrMessageTooLarge
+ 			}
+ 			form.Value[name] = append(form.Value[name], b.String())
+@@ -81,35 +128,45 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		}
+ 
+ 		// file, store in memory or on disk
++		maxMemoryBytes -= mimeHeaderSize(p.Header)
++		if maxMemoryBytes < 0 {
++			return nil, ErrMessageTooLarge
++		}
+ 		fh := &FileHeader{
+ 			Filename: filename,
+ 			Header:   p.Header,
+ 		}
+-		n, err := io.CopyN(&b, p, maxMemory+1)
++		n, err := io.CopyN(&b, p, maxFileMemoryBytes+1)
+ 		if err != nil && err != io.EOF {
+ 			return nil, err
+ 		}
+-		if n > maxMemory {
+-			// too big, write to disk and flush buffer
+-			file, err := ioutil.TempFile("", "multipart-")
+-			if err != nil {
+-				return nil, err
++		if n > maxFileMemoryBytes {
++			if file == nil {
++				file, err = ioutil.TempFile(r.tempDir, "multipart-")
++				if err != nil {
++					return nil, err
++				}
+ 			}
++			numDiskFiles++
+ 			size, err := io.Copy(file, io.MultiReader(&b, p))
+-			if cerr := file.Close(); err == nil {
+-				err = cerr
+-			}
+ 			if err != nil {
+-				os.Remove(file.Name())
+ 				return nil, err
+ 			}
+ 			fh.tmpfile = file.Name()
+ 			fh.Size = size
++			fh.tmpoff = fileOff
++			fileOff += size
++			if !combineFiles {
++				if err := file.Close(); err != nil {
++					return nil, err
++				}
++				file = nil
++			}
+ 		} else {
+ 			fh.content = b.Bytes()
+ 			fh.Size = int64(len(fh.content))
+-			maxMemory -= n
+-			maxValueBytes -= n
++			maxFileMemoryBytes -= n
++			maxMemoryBytes -= n
+ 		}
+ 		form.File[name] = append(form.File[name], fh)
+ 	}
+@@ -117,6 +174,17 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	return form, nil
+ }
+ 
++func mimeHeaderSize(h textproto.MIMEHeader) (size int64) {
++	for k, vs := range h {
++		size += int64(len(k))
++		size += 100 // map entry overhead
++		for _, v := range vs {
++			size += int64(len(v))
++		}
++	}
++	return size
++}
++
+ // Form is a parsed multipart form.
+ // Its File parts are stored either in memory or on disk,
+ // and are accessible via the *FileHeader's Open method.
+@@ -134,7 +202,7 @@ func (f *Form) RemoveAll() error {
+ 		for _, fh := range fhs {
+ 			if fh.tmpfile != "" {
+ 				e := os.Remove(fh.tmpfile)
+-				if e != nil && err == nil {
++				if e != nil && !errors.Is(e, os.ErrNotExist) && err == nil {
+ 					err = e
+ 				}
+ 			}
+@@ -149,15 +217,25 @@ type FileHeader struct {
+ 	Header   textproto.MIMEHeader
+ 	Size     int64
+ 
+-	content []byte
+-	tmpfile string
++	content   []byte
++	tmpfile   string
++	tmpoff    int64
++	tmpshared bool
+ }
+ 
+ // Open opens and returns the FileHeader's associated File.
+ func (fh *FileHeader) Open() (File, error) {
+ 	if b := fh.content; b != nil {
+ 		r := io.NewSectionReader(bytes.NewReader(b), 0, int64(len(b)))
+-		return sectionReadCloser{r}, nil
++		return sectionReadCloser{r, nil}, nil
++	}
++	if fh.tmpshared {
++		f, err := os.Open(fh.tmpfile)
++		if err != nil {
++			return nil, err
++		}
++		r := io.NewSectionReader(f, fh.tmpoff, fh.Size)
++		return sectionReadCloser{r, f}, nil
+ 	}
+ 	return os.Open(fh.tmpfile)
+ }
+@@ -176,8 +254,12 @@ type File interface {
+ 
+ type sectionReadCloser struct {
+ 	*io.SectionReader
++	io.Closer
+ }
+ 
+ func (rc sectionReadCloser) Close() error {
++	if rc.Closer != nil {
++		return rc.Closer.Close()
++	}
+ 	return nil
+ }
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index e3a3a3e..5cded71 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -6,8 +6,10 @@ package multipart
+ 
+ import (
+ 	"bytes"
++	"fmt"
+ 	"io"
+ 	"math"
++	"net/textproto"
+ 	"os"
+ 	"strings"
+ 	"testing"
+@@ -208,8 +210,8 @@ Content-Disposition: form-data; name="largetext"
+ 		maxMemory int64
+ 		err       error
+ 	}{
+-		{"smaller", 50, nil},
+-		{"exact-fit", 25, nil},
++		{"smaller", 50 + int64(len("largetext")) + 100, nil},
++		{"exact-fit", 25 + int64(len("largetext")) + 100, nil},
+ 		{"too-large", 0, ErrMessageTooLarge},
+ 	}
+ 	for _, tc := range testCases {
+@@ -224,7 +226,7 @@ Content-Disposition: form-data; name="largetext"
+ 				defer f.RemoveAll()
+ 			}
+ 			if tc.err != err {
+-				t.Fatalf("ReadForm error - got: %v; expected: %v", tc.err, err)
++				t.Fatalf("ReadForm error - got: %v; expected: %v", err, tc.err)
+ 			}
+ 			if err == nil {
+ 				if g := f.Value["largetext"][0]; g != largeTextValue {
+@@ -234,3 +236,135 @@ Content-Disposition: form-data; name="largetext"
+ 		})
+ 	}
+ }
++
++// TestReadForm_MetadataTooLarge verifies that we account for the size of field names,
++// MIME headers, and map entry overhead while limiting the memory consumption of parsed forms.
++func TestReadForm_MetadataTooLarge(t *testing.T) {
++	for _, test := range []struct {
++		name string
++		f    func(*Writer)
++	}{{
++		name: "large name",
++		f: func(fw *Writer) {
++			name := strings.Repeat("a", 10<<20)
++			w, _ := fw.CreateFormField(name)
++			w.Write([]byte("value"))
++		},
++	}, {
++		name: "large MIME header",
++		f: func(fw *Writer) {
++			h := make(textproto.MIMEHeader)
++			h.Set("Content-Disposition", `form-data; name="a"`)
++			h.Set("X-Foo", strings.Repeat("a", 10<<20))
++			w, _ := fw.CreatePart(h)
++			w.Write([]byte("value"))
++		},
++	}, {
++		name: "many parts",
++		f: func(fw *Writer) {
++			for i := 0; i < 110000; i++ {
++				w, _ := fw.CreateFormField("f")
++				w.Write([]byte("v"))
++			}
++		},
++	}} {
++		t.Run(test.name, func(t *testing.T) {
++			var buf bytes.Buffer
++			fw := NewWriter(&buf)
++			test.f(fw)
++			if err := fw.Close(); err != nil {
++				t.Fatal(err)
++			}
++			fr := NewReader(&buf, fw.Boundary())
++			_, err := fr.ReadForm(0)
++			if err != ErrMessageTooLarge {
++				t.Errorf("fr.ReadForm() = %v, want ErrMessageTooLarge", err)
++			}
++		})
++	}
++}
++
++// TestReadForm_ManyFiles_Combined tests that a multipart form containing many files only
++// results in a single on-disk file.
++func TestReadForm_ManyFiles_Combined(t *testing.T) {
++	const distinct = false
++	testReadFormManyFiles(t, distinct)
++}
++
++// TestReadForm_ManyFiles_Distinct tests that setting GODEBUG=multipartfiles=distinct
++// results in every file in a multipart form being placed in a distinct on-disk file.
++func TestReadForm_ManyFiles_Distinct(t *testing.T) {
++	t.Setenv("GODEBUG", "multipartfiles=distinct")
++	const distinct = true
++	testReadFormManyFiles(t, distinct)
++}
++
++func testReadFormManyFiles(t *testing.T, distinct bool) {
++	var buf bytes.Buffer
++	fw := NewWriter(&buf)
++	const numFiles = 10
++	for i := 0; i < numFiles; i++ {
++		name := fmt.Sprint(i)
++		w, err := fw.CreateFormFile(name, name)
++		if err != nil {
++			t.Fatal(err)
++		}
++		w.Write([]byte(name))
++	}
++	if err := fw.Close(); err != nil {
++		t.Fatal(err)
++	}
++	fr := NewReader(&buf, fw.Boundary())
++	fr.tempDir = t.TempDir()
++	form, err := fr.ReadForm(0)
++	if err != nil {
++		t.Fatal(err)
++	}
++	for i := 0; i < numFiles; i++ {
++		name := fmt.Sprint(i)
++		if got := len(form.File[name]); got != 1 {
++			t.Fatalf("form.File[%q] has %v entries, want 1", name, got)
++		}
++		fh := form.File[name][0]
++		file, err := fh.Open()
++		if err != nil {
++			t.Fatalf("form.File[%q].Open() = %v", name, err)
++		}
++		if distinct {
++			if _, ok := file.(*os.File); !ok {
++				t.Fatalf("form.File[%q].Open: %T, want *os.File", name, file)
++			}
++		}
++		got, err := io.ReadAll(file)
++		file.Close()
++		if string(got) != name || err != nil {
++			t.Fatalf("read form.File[%q]: %q, %v; want %q, nil", name, string(got), err, name)
++		}
++	}
++	dir, err := os.Open(fr.tempDir)
++	if err != nil {
++		t.Fatal(err)
++	}
++	defer dir.Close()
++	names, err := dir.Readdirnames(0)
++	if err != nil {
++		t.Fatal(err)
++	}
++	wantNames := 1
++	if distinct {
++		wantNames = numFiles
++	}
++	if len(names) != wantNames {
++		t.Fatalf("temp dir contains %v files; want 1", len(names))
++	}
++	if err := form.RemoveAll(); err != nil {
++		t.Fatalf("form.RemoveAll() = %v", err)
++	}
++	names, err = dir.Readdirnames(0)
++	if err != nil {
++		t.Fatal(err)
++	}
++	if len(names) != 0 {
++		t.Fatalf("temp dir contains %v files; want 0", len(names))
++	}
++}
+diff --git a/src/mime/multipart/multipart.go b/src/mime/multipart/multipart.go
+index 1750300..958cef8 100644
+--- a/src/mime/multipart/multipart.go
++++ b/src/mime/multipart/multipart.go
+@@ -121,12 +121,12 @@ func (r *stickyErrorReader) Read(p []byte) (n int, _ error) {
+ 	return n, r.err
+ }
+ 
+-func newPart(mr *Reader, rawPart bool) (*Part, error) {
++func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
+ 	bp := &Part{
+ 		Header: make(map[string][]string),
+ 		mr:     mr,
+ 	}
+-	if err := bp.populateHeaders(); err != nil {
++	if err := bp.populateHeaders(maxMIMEHeaderSize); err != nil {
+ 		return nil, err
+ 	}
+ 	bp.r = partReader{bp}
+@@ -142,12 +142,16 @@ func newPart(mr *Reader, rawPart bool) (*Part, error) {
+ 	return bp, nil
+ }
+ 
+-func (bp *Part) populateHeaders() error {
++func (bp *Part) populateHeaders(maxMIMEHeaderSize int64) error {
+ 	r := textproto.NewReader(bp.mr.bufReader)
+-	header, err := r.ReadMIMEHeader()
++	header, err := readMIMEHeader(r, maxMIMEHeaderSize)
+ 	if err == nil {
+ 		bp.Header = header
+ 	}
++	// TODO: Add a distinguishable error to net/textproto.
++	if err != nil && err.Error() == "message too large" {
++		err = ErrMessageTooLarge
++	}
+ 	return err
+ }
+ 
+@@ -287,6 +291,7 @@ func (p *Part) Close() error {
+ // isn't supported.
+ type Reader struct {
+ 	bufReader *bufio.Reader
++	tempDir   string // used in tests
+ 
+ 	currentPart *Part
+ 	partsRead   int
+@@ -297,6 +302,10 @@ type Reader struct {
+ 	dashBoundary     []byte // "--boundary"
+ }
+ 
++// maxMIMEHeaderSize is the maximum size of a MIME header we will parse,
++// including header keys, values, and map overhead.
++const maxMIMEHeaderSize = 10 << 20
++
+ // NextPart returns the next part in the multipart or an error.
+ // When there are no more parts, the error io.EOF is returned.
+ //
+@@ -304,7 +313,7 @@ type Reader struct {
+ // has a value of "quoted-printable", that header is instead
+ // hidden and the body is transparently decoded during Read calls.
+ func (r *Reader) NextPart() (*Part, error) {
+-	return r.nextPart(false)
++	return r.nextPart(false, maxMIMEHeaderSize)
+ }
+ 
+ // NextRawPart returns the next part in the multipart or an error.
+@@ -313,10 +322,10 @@ func (r *Reader) NextPart() (*Part, error) {
+ // Unlike NextPart, it does not have special handling for
+ // "Content-Transfer-Encoding: quoted-printable".
+ func (r *Reader) NextRawPart() (*Part, error) {
+-	return r.nextPart(true)
++	return r.nextPart(true, maxMIMEHeaderSize)
+ }
+ 
+-func (r *Reader) nextPart(rawPart bool) (*Part, error) {
++func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
+ 	if r.currentPart != nil {
+ 		r.currentPart.Close()
+ 	}
+@@ -341,7 +350,7 @@ func (r *Reader) nextPart(rawPart bool) (*Part, error) {
+ 
+ 		if r.isBoundaryDelimiterLine(line) {
+ 			r.partsRead++
+-			bp, err := newPart(r, rawPart)
++			bp, err := newPart(r, rawPart, maxMIMEHeaderSize)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+diff --git a/src/mime/multipart/readmimeheader.go b/src/mime/multipart/readmimeheader.go
+new file mode 100644
+index 0000000..6836928
+--- /dev/null
++++ b/src/mime/multipart/readmimeheader.go
+@@ -0,0 +1,14 @@
++// Copyright 2023 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++package multipart
++
++import (
++	"net/textproto"
++	_ "unsafe" // for go:linkname
++)
++
++// readMIMEHeader is defined in package net/textproto.
++//
++//go:linkname readMIMEHeader net/textproto.readMIMEHeader
++func readMIMEHeader(r *textproto.Reader, lim int64) (textproto.MIMEHeader, error)
+diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
+index 94133ee..170d3f5 100644
+--- a/src/net/http/request_test.go
++++ b/src/net/http/request_test.go
+@@ -962,7 +962,7 @@ func testMissingFile(t *testing.T, req *Request) {
+ 		t.Errorf("FormFile file = %v, want nil", f)
+ 	}
+ 	if fh != nil {
+-		t.Errorf("FormFile file header = %q, want nil", fh)
++		t.Errorf("FormFile file header = %v, want nil", fh)
+ 	}
+ 	if err != ErrMissingFile {
+ 		t.Errorf("FormFile err = %q, want ErrMissingFile", err)
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index f63f5ec..96553fb 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -7,9 +7,11 @@ package textproto
+ import (
+ 	"bufio"
+ 	"bytes"
++	"errors"
+ 	"fmt"
+ 	"io"
+ 	"io/ioutil"
++	"math"
+ 	"strconv"
+ 	"strings"
+ 	"sync"
+@@ -482,6 +484,12 @@ func (r *Reader) ReadDotLines() ([]string, error) {
+ //	}
+ //
+ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
++	return readMIMEHeader(r, math.MaxInt64)
++}
++
++// readMIMEHeader is a version of ReadMIMEHeader which takes a limit on the header size.
++// It is called by the mime/multipart package.
++func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 	// Avoid lots of small slice allocations later by allocating one
+ 	// large one ahead of time which we'll cut up into smaller
+ 	// slices. If this isn't big enough later, we allocate small ones.
+@@ -525,6 +533,15 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+ 			continue
+ 		}
+ 
++		// backport 5c55ac9bf1e5f779220294c843526536605f42ab
++		//
++		// value is computed as
++		// value := string(bytes.TrimLeft(v, " \t"))
++		//
++		// in the original patch from 1.19.  This relies on
++		// 'v' which does not exist in 1.14.  We leave the
++		// 1.14 method unchanged.
++
+ 		// Skip initial spaces in value.
+ 		i++ // skip colon
+ 		for i < len(kv) && (kv[i] == ' ' || kv[i] == '\t') {
+@@ -533,6 +550,16 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+ 		value := string(kv[i:])
+ 
+ 		vv := m[key]
++		if vv == nil {
++			lim -= int64(len(key))
++			lim -= 100 // map entry overhead
++		}
++		lim -= int64(len(value))
++		if lim < 0 {
++			// TODO: This should be a distinguishable error (ErrMessageTooLarge)
++			// to allow mime/multipart to detect it.
++			return m, errors.New("message too large")
++		}
+ 		if vv == nil && len(strs) > 0 {
+ 			// More than likely this will be a single-element key.
+ 			// Most headers aren't multi-valued.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_1.patch
new file mode 100644
index 0000000000..39e1304fbd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_1.patch
@@ -0,0 +1,134 @@
+From ef41a4e2face45e580c5836eaebd51629fc23f15 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 16 Mar 2023 14:18:04 -0700
+Subject: [PATCH] [release-branch.go1.19] mime/multipart: avoid excessive copy
+ buffer allocations in ReadForm
+
+When copying form data to disk with io.Copy,
+allocate only one copy buffer and reuse it rather than
+creating two buffers per file (one from io.multiReader.WriteTo,
+and a second one from os.File.ReadFrom).
+
+Thanks to Jakob Ackermann (@das7pad) for reporting this issue.
+
+For CVE-2023-24536
+For #59153
+For #59269
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802453
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802395
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Change-Id: Ie405470c92abffed3356913b37d813e982c96c8b
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481983
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/ef41a4e2face45e580c5836eaebd51629fc23f15]
+CVE: CVE-2023-24536
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata.go      | 15 +++++++--
+ src/mime/multipart/formdata_test.go | 49 +++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index a7d4ca97f0484..975dcb6b26db4 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -84,6 +84,7 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 			maxMemoryBytes = math.MaxInt64
+ 		}
+ 	}
++	var copyBuf []byte
+ 	for {
+ 		p, err := r.nextPart(false, maxMemoryBytes)
+ 		if err == io.EOF {
+@@ -147,14 +148,22 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 				}
+ 			}
+ 			numDiskFiles++
+-			size, err := io.Copy(file, io.MultiReader(&b, p))
++			if _, err := file.Write(b.Bytes()); err != nil {
++				return nil, err
++			}
++			if copyBuf == nil {
++				copyBuf = make([]byte, 32*1024) // same buffer size as io.Copy uses
++			}
++			// os.File.ReadFrom will allocate its own copy buffer if we let io.Copy use it.
++			type writerOnly struct{ io.Writer }
++			remainingSize, err := io.CopyBuffer(writerOnly{file}, p, copyBuf)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+ 			fh.tmpfile = file.Name()
+-			fh.Size = size
++			fh.Size = int64(b.Len()) + remainingSize
+ 			fh.tmpoff = fileOff
+-			fileOff += size
++			fileOff += fh.Size
+ 			if !combineFiles {
+ 				if err := file.Close(); err != nil {
+ 					return nil, err
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index 5cded7170c6b8..f5b56083b2377 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -368,3 +368,52 @@ func testReadFormManyFiles(t *testing.T, distinct bool) {
+ 		t.Fatalf("temp dir contains %v files; want 0", len(names))
+ 	}
+ }
++
++func BenchmarkReadForm(b *testing.B) {
++	for _, test := range []struct {
++		name string
++		form func(fw *Writer, count int)
++	}{{
++		name: "fields",
++		form: func(fw *Writer, count int) {
++			for i := 0; i < count; i++ {
++				w, _ := fw.CreateFormField(fmt.Sprintf("field%v", i))
++				fmt.Fprintf(w, "value %v", i)
++			}
++		},
++	}, {
++		name: "files",
++		form: func(fw *Writer, count int) {
++			for i := 0; i < count; i++ {
++				w, _ := fw.CreateFormFile(fmt.Sprintf("field%v", i), fmt.Sprintf("file%v", i))
++				fmt.Fprintf(w, "value %v", i)
++			}
++		},
++	}} {
++		b.Run(test.name, func(b *testing.B) {
++			for _, maxMemory := range []int64{
++				0,
++				1 << 20,
++			} {
++				var buf bytes.Buffer
++				fw := NewWriter(&buf)
++				test.form(fw, 10)
++				if err := fw.Close(); err != nil {
++					b.Fatal(err)
++				}
++				b.Run(fmt.Sprintf("maxMemory=%v", maxMemory), func(b *testing.B) {
++					b.ReportAllocs()
++					for i := 0; i < b.N; i++ {
++						fr := NewReader(bytes.NewReader(buf.Bytes()), fw.Boundary())
++						form, err := fr.ReadForm(maxMemory)
++						if err != nil {
++							b.Fatal(err)
++						}
++						form.RemoveAll()
++					}
++
++				})
++			}
++		})
++	}
++}
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_2.patch
new file mode 100644
index 0000000000..9ba5114c82
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_2.patch
@@ -0,0 +1,184 @@
+From 7a359a651c7ebdb29e0a1c03102fce793e9f58f0 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 16 Mar 2023 16:56:12 -0700
+Subject: [PATCH] [release-branch.go1.19] net/textproto, mime/multipart:
+ improve accounting of non-file data
+
+For requests containing large numbers of small parts,
+memory consumption of a parsed form could be about 250%
+over the estimated size.
+
+When considering the size of parsed forms, account for the size of
+FileHeader structs and increase the estimate of memory consumed by
+map entries.
+
+Thanks to Jakob Ackermann (@das7pad) for reporting this issue.
+
+For CVE-2023-24536
+For #59153
+For #59269
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802454
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802396
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Change-Id: I31bc50e9346b4eee6fbe51a18c3c57230cc066db
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481984
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/7a359a651c7ebdb29e0a1c03102fce793e9f58f0]
+CVE: CVE-2023-24536
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata.go      |  9 +++--
+ src/mime/multipart/formdata_test.go | 55 ++++++++++++-----------------
+ src/net/textproto/reader.go         |  8 ++++-
+ 3 files changed, 37 insertions(+), 35 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 975dcb6b26db4..3f6ff697ca608 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -103,8 +103,9 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		// Multiple values for the same key (one map entry, longer slice) are cheaper
+ 		// than the same number of values for different keys (many map entries), but
+ 		// using a consistent per-value cost for overhead is simpler.
++		const mapEntryOverhead = 200
+ 		maxMemoryBytes -= int64(len(name))
+-		maxMemoryBytes -= 100 // map overhead
++		maxMemoryBytes -= mapEntryOverhead
+ 		if maxMemoryBytes < 0 {
+ 			// We can't actually take this path, since nextPart would already have
+ 			// rejected the MIME headers for being too large. Check anyway.
+@@ -128,7 +129,10 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		}
+ 
+ 		// file, store in memory or on disk
++		const fileHeaderSize = 100
+ 		maxMemoryBytes -= mimeHeaderSize(p.Header)
++		maxMemoryBytes -= mapEntryOverhead
++		maxMemoryBytes -= fileHeaderSize
+ 		if maxMemoryBytes < 0 {
+ 			return nil, ErrMessageTooLarge
+ 		}
+@@ -183,9 +187,10 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ }
+ 
+ func mimeHeaderSize(h textproto.MIMEHeader) (size int64) {
++	size = 400
+ 	for k, vs := range h {
+ 		size += int64(len(k))
+-		size += 100 // map entry overhead
++		size += 200 // map entry overhead
+ 		for _, v := range vs {
+ 			size += int64(len(v))
+ 		}
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index f5b56083b2377..8ed26e0c34081 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -192,10 +192,10 @@ func (r *failOnReadAfterErrorReader) Read(p []byte) (n int, err error) {
+ // TestReadForm_NonFileMaxMemory asserts that the ReadForm maxMemory limit is applied
+ // while processing non-file form data as well as file form data.
+ func TestReadForm_NonFileMaxMemory(t *testing.T) {
+-	n := 10<<20 + 25
+ 	if testing.Short() {
+-		n = 10<<10 + 25
++		t.Skip("skipping in -short mode")
+ 	}
++	n := 10 << 20
+ 	largeTextValue := strings.Repeat("1", n)
+ 	message := `--MyBoundary
+ Content-Disposition: form-data; name="largetext"
+@@ -203,38 +203,29 @@ Content-Disposition: form-data; name="largetext"
+ ` + largeTextValue + `
+ --MyBoundary--
+ `
+-
+ 	testBody := strings.ReplaceAll(message, "\n", "\r\n")
+-	testCases := []struct {
+-		name      string
+-		maxMemory int64
+-		err       error
+-	}{
+-		{"smaller", 50 + int64(len("largetext")) + 100, nil},
+-		{"exact-fit", 25 + int64(len("largetext")) + 100, nil},
+-		{"too-large", 0, ErrMessageTooLarge},
+-	}
+-	for _, tc := range testCases {
+-		t.Run(tc.name, func(t *testing.T) {
+-			if tc.maxMemory == 0 && testing.Short() {
+-				t.Skip("skipping in -short mode")
+-			}
+-			b := strings.NewReader(testBody)
+-			r := NewReader(b, boundary)
+-			f, err := r.ReadForm(tc.maxMemory)
+-			if err == nil {
+-				defer f.RemoveAll()
+-			}
+-			if tc.err != err {
+-				t.Fatalf("ReadForm error - got: %v; expected: %v", err, tc.err)
+-			}
+-			if err == nil {
+-				if g := f.Value["largetext"][0]; g != largeTextValue {
+-					t.Errorf("largetext mismatch: got size: %v, expected size: %v", len(g), len(largeTextValue))
+-				}
+-			}
+-		})
++	// Try parsing the form with increasing maxMemory values.
++	// Changes in how we account for non-file form data may cause the exact point
++	// where we change from rejecting the form as too large to accepting it to vary,
++	// but we should see both successes and failures.
++	const failWhenMaxMemoryLessThan = 128
++	for maxMemory := int64(0); maxMemory < failWhenMaxMemoryLessThan*2; maxMemory += 16 {
++		b := strings.NewReader(testBody)
++		r := NewReader(b, boundary)
++		f, err := r.ReadForm(maxMemory)
++		if err != nil {
++			continue
++		}
++		if g := f.Value["largetext"][0]; g != largeTextValue {
++			t.Errorf("largetext mismatch: got size: %v, expected size: %v", len(g), len(largeTextValue))
++		}
++		f.RemoveAll()
++		if maxMemory < failWhenMaxMemoryLessThan {
++			t.Errorf("ReadForm(%v): no error, expect to hit memory limit when maxMemory < %v", maxMemory, failWhenMaxMemoryLessThan)
++		}
++		return
+ 	}
++	t.Errorf("ReadForm(x) failed for x < 1024, expect success")
+ }
+ 
+ // TestReadForm_MetadataTooLarge verifies that we account for the size of field names,
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 9a21777df8be0..c1284fde25eb7 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -503,6 +503,12 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 
+ 	m := make(MIMEHeader, hint)
+ 
++	// Account for 400 bytes of overhead for the MIMEHeader, plus 200 bytes per entry.
++	// Benchmarking map creation as of go1.20, a one-entry MIMEHeader is 416 bytes and large
++	// MIMEHeaders average about 200 bytes per entry.
++	lim -= 400
++	const mapEntryOverhead = 200
++
+ 	// The first line cannot start with a leading space.
+ 	if buf, err := r.R.Peek(1); err == nil && (buf[0] == ' ' || buf[0] == '\t') {
+ 		line, err := r.readLineSlice()
+@@ -538,7 +544,7 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 		vv := m[key]
+ 		if vv == nil {
+ 			lim -= int64(len(key))
+-			lim -= 100 // map entry overhead
++			lim -= mapEntryOverhead
+ 		}
+ 		lim -= int64(len(value))
+ 		if lim < 0 {
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_3.patch
new file mode 100644
index 0000000000..58c0a484ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24536_3.patch
@@ -0,0 +1,349 @@
+From 7917b5f31204528ea72e0629f0b7d52b35b27538 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 20 Mar 2023 10:43:19 -0700
+Subject: [PATCH] [release-branch.go1.19] mime/multipart: limit parsed mime message sizes
+
+The parsed forms of MIME headers and multipart forms can consume
+substantially more memory than the size of the input data.
+A malicious input containing a very large number of headers or
+form parts can cause excessively large memory allocations.
+
+Set limits on the size of MIME data:
+
+Reader.NextPart and Reader.NextRawPart limit the the number
+of headers in a part to 10000.
+
+Reader.ReadForm limits the total number of headers in all
+FileHeaders to 10000.
+
+Both of these limits may be set with with
+GODEBUG=multipartmaxheaders=<values>.
+
+Reader.ReadForm limits the number of parts in a form to 1000.
+This limit may be set with GODEBUG=multipartmaxparts=<value>.
+
+Thanks for Jakob Ackermann (@das7pad) for reporting this issue.
+
+For CVE-2023-24536
+For #59153
+For #59269
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802455
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1801087
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Change-Id: If134890d75f0d95c681d67234daf191ba08e6424
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481985
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/7917b5f31204528ea72e0629f0b7d52b35b27538]
+CVE: CVE-2023-24536
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata.go       | 19 ++++++++-
+ src/mime/multipart/formdata_test.go  | 61 ++++++++++++++++++++++++++++
+ src/mime/multipart/multipart.go      | 31 ++++++++++----
+ src/mime/multipart/readmimeheader.go |  2 +-
+ src/net/textproto/reader.go          | 19 +++++----
+ 5 files changed, 115 insertions(+), 17 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 216cccb..0b508ae 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -13,6 +13,7 @@ import (
+ 	"math"
+ 	"net/textproto"
+ 	"os"
++	"strconv"
+ )
+ 
+ // ErrMessageTooLarge is returned by ReadForm if the message form
+@@ -42,6 +43,15 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	numDiskFiles := 0
+ 	multipartFiles := godebug.Get("multipartfiles")
+ 	combineFiles := multipartFiles != "distinct"
++	maxParts := 1000
++	multipartMaxParts := godebug.Get("multipartmaxparts")
++	if multipartMaxParts != "" {
++		if v, err := strconv.Atoi(multipartMaxParts); err == nil && v >= 0 {
++			maxParts = v
++		}
++	}
++	maxHeaders := maxMIMEHeaders()
++
+ 	defer func() {
+ 		if file != nil {
+ 			if cerr := file.Close(); err == nil {
+@@ -87,13 +97,17 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	}
+ 	var copyBuf []byte
+ 	for {
+-		p, err := r.nextPart(false, maxMemoryBytes)
++		p, err := r.nextPart(false, maxMemoryBytes, maxHeaders)
+ 		if err == io.EOF {
+ 			break
+ 		}
+ 		if err != nil {
+ 			return nil, err
+ 		}
++		if maxParts <= 0 {
++			return nil, ErrMessageTooLarge
++		}
++		maxParts--
+ 
+ 		name := p.FormName()
+ 		if name == "" {
+@@ -137,6 +151,9 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		if maxMemoryBytes < 0 {
+ 			return nil, ErrMessageTooLarge
+ 		}
++		for _, v := range p.Header {
++			maxHeaders -= int64(len(v))
++		}
+ 		fh := &FileHeader{
+ 			Filename: filename,
+ 			Header:   p.Header,
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index 8ed26e0..c78eeb7 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -360,6 +360,67 @@ func testReadFormManyFiles(t *testing.T, distinct bool) {
+ 	}
+ }
+ 
++func TestReadFormLimits(t *testing.T) {
++	for _, test := range []struct {
++		values           int
++		files            int
++		extraKeysPerFile int
++		wantErr          error
++		godebug          string
++	}{
++		{values: 1000},
++		{values: 1001, wantErr: ErrMessageTooLarge},
++		{values: 500, files: 500},
++		{values: 501, files: 500, wantErr: ErrMessageTooLarge},
++		{files: 1000},
++		{files: 1001, wantErr: ErrMessageTooLarge},
++		{files: 1, extraKeysPerFile: 9998}, // plus Content-Disposition and Content-Type
++		{files: 1, extraKeysPerFile: 10000, wantErr: ErrMessageTooLarge},
++		{godebug: "multipartmaxparts=100", values: 100},
++		{godebug: "multipartmaxparts=100", values: 101, wantErr: ErrMessageTooLarge},
++		{godebug: "multipartmaxheaders=100", files: 2, extraKeysPerFile: 48},
++		{godebug: "multipartmaxheaders=100", files: 2, extraKeysPerFile: 50, wantErr: ErrMessageTooLarge},
++	} {
++		name := fmt.Sprintf("values=%v/files=%v/extraKeysPerFile=%v", test.values, test.files, test.extraKeysPerFile)
++		if test.godebug != "" {
++			name += fmt.Sprintf("/godebug=%v", test.godebug)
++		}
++		t.Run(name, func(t *testing.T) {
++			if test.godebug != "" {
++				t.Setenv("GODEBUG", test.godebug)
++			}
++			var buf bytes.Buffer
++			fw := NewWriter(&buf)
++			for i := 0; i < test.values; i++ {
++				w, _ := fw.CreateFormField(fmt.Sprintf("field%v", i))
++				fmt.Fprintf(w, "value %v", i)
++			}
++			for i := 0; i < test.files; i++ {
++				h := make(textproto.MIMEHeader)
++				h.Set("Content-Disposition",
++					fmt.Sprintf(`form-data; name="file%v"; filename="file%v"`, i, i))
++				h.Set("Content-Type", "application/octet-stream")
++				for j := 0; j < test.extraKeysPerFile; j++ {
++					h.Set(fmt.Sprintf("k%v", j), "v")
++				}
++				w, _ := fw.CreatePart(h)
++				fmt.Fprintf(w, "value %v", i)
++			}
++			if err := fw.Close(); err != nil {
++				t.Fatal(err)
++			}
++			fr := NewReader(bytes.NewReader(buf.Bytes()), fw.Boundary())
++			form, err := fr.ReadForm(1 << 10)
++			if err == nil {
++				defer form.RemoveAll()
++			}
++			if err != test.wantErr {
++				t.Errorf("ReadForm = %v, want %v", err, test.wantErr)
++			}
++		})
++	}
++}
++
+ func BenchmarkReadForm(b *testing.B) {
+ 	for _, test := range []struct {
+ 		name string
+diff --git a/src/mime/multipart/multipart.go b/src/mime/multipart/multipart.go
+index 958cef8..94464a8 100644
+--- a/src/mime/multipart/multipart.go
++++ b/src/mime/multipart/multipart.go
+@@ -16,11 +16,13 @@ import (
+ 	"bufio"
+ 	"bytes"
+ 	"fmt"
++	"internal/godebug"
+ 	"io"
+ 	"io/ioutil"
+ 	"mime"
+ 	"mime/quotedprintable"
+ 	"net/textproto"
++	"strconv"
+ 	"strings"
+ )
+ 
+@@ -121,12 +123,12 @@ func (r *stickyErrorReader) Read(p []byte) (n int, _ error) {
+ 	return n, r.err
+ }
+ 
+-func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
++func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize, maxMIMEHeaders int64) (*Part, error) {
+ 	bp := &Part{
+ 		Header: make(map[string][]string),
+ 		mr:     mr,
+ 	}
+-	if err := bp.populateHeaders(maxMIMEHeaderSize); err != nil {
++	if err := bp.populateHeaders(maxMIMEHeaderSize, maxMIMEHeaders); err != nil {
+ 		return nil, err
+ 	}
+ 	bp.r = partReader{bp}
+@@ -142,9 +144,9 @@ func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
+ 	return bp, nil
+ }
+ 
+-func (bp *Part) populateHeaders(maxMIMEHeaderSize int64) error {
++func (bp *Part) populateHeaders(maxMIMEHeaderSize, maxMIMEHeaders int64) error {
+ 	r := textproto.NewReader(bp.mr.bufReader)
+-	header, err := readMIMEHeader(r, maxMIMEHeaderSize)
++	header, err := readMIMEHeader(r, maxMIMEHeaderSize, maxMIMEHeaders)
+ 	if err == nil {
+ 		bp.Header = header
+ 	}
+@@ -306,6 +308,19 @@ type Reader struct {
+ // including header keys, values, and map overhead.
+ const maxMIMEHeaderSize = 10 << 20
+ 
++func maxMIMEHeaders() int64 {
++	// multipartMaxHeaders is the maximum number of header entries NextPart will return,
++	// as well as the maximum combined total of header entries Reader.ReadForm will return
++	// in FileHeaders.
++	multipartMaxHeaders := godebug.Get("multipartmaxheaders")
++	if multipartMaxHeaders != "" {
++		if v, err := strconv.ParseInt(multipartMaxHeaders, 10, 64); err == nil && v >= 0 {
++			return v
++		}
++	}
++	return 10000
++}
++
+ // NextPart returns the next part in the multipart or an error.
+ // When there are no more parts, the error io.EOF is returned.
+ //
+@@ -313,7 +328,7 @@ const maxMIMEHeaderSize = 10 << 20
+ // has a value of "quoted-printable", that header is instead
+ // hidden and the body is transparently decoded during Read calls.
+ func (r *Reader) NextPart() (*Part, error) {
+-	return r.nextPart(false, maxMIMEHeaderSize)
++	return r.nextPart(false, maxMIMEHeaderSize, maxMIMEHeaders())
+ }
+ 
+ // NextRawPart returns the next part in the multipart or an error.
+@@ -322,10 +337,10 @@ func (r *Reader) NextPart() (*Part, error) {
+ // Unlike NextPart, it does not have special handling for
+ // "Content-Transfer-Encoding: quoted-printable".
+ func (r *Reader) NextRawPart() (*Part, error) {
+-	return r.nextPart(true, maxMIMEHeaderSize)
++	return r.nextPart(true, maxMIMEHeaderSize, maxMIMEHeaders())
+ }
+ 
+-func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
++func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize, maxMIMEHeaders int64) (*Part, error) {
+ 	if r.currentPart != nil {
+ 		r.currentPart.Close()
+ 	}
+@@ -350,7 +365,7 @@ func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize int64) (*Part, error)
+ 
+ 		if r.isBoundaryDelimiterLine(line) {
+ 			r.partsRead++
+-			bp, err := newPart(r, rawPart, maxMIMEHeaderSize)
++			bp, err := newPart(r, rawPart, maxMIMEHeaderSize, maxMIMEHeaders)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+diff --git a/src/mime/multipart/readmimeheader.go b/src/mime/multipart/readmimeheader.go
+index 6836928..25aa6e2 100644
+--- a/src/mime/multipart/readmimeheader.go
++++ b/src/mime/multipart/readmimeheader.go
+@@ -11,4 +11,4 @@ import (
+ // readMIMEHeader is defined in package net/textproto.
+ //
+ //go:linkname readMIMEHeader net/textproto.readMIMEHeader
+-func readMIMEHeader(r *textproto.Reader, lim int64) (textproto.MIMEHeader, error)
++func readMIMEHeader(r *textproto.Reader, maxMemory, maxHeaders int64) (textproto.MIMEHeader, error)
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 1c79f0a..ad2d777 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -484,12 +484,12 @@ func (r *Reader) ReadDotLines() ([]string, error) {
+ //	}
+ //
+ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+-	return readMIMEHeader(r, math.MaxInt64)
++	return readMIMEHeader(r, math.MaxInt64, math.MaxInt64)
+ }
+ 
+ // readMIMEHeader is a version of ReadMIMEHeader which takes a limit on the header size.
+ // It is called by the mime/multipart package.
+-func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
++func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error) {
+ 	// Avoid lots of small slice allocations later by allocating one
+ 	// large one ahead of time which we'll cut up into smaller
+ 	// slices. If this isn't big enough later, we allocate small ones.
+@@ -507,7 +507,7 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 	// Account for 400 bytes of overhead for the MIMEHeader, plus 200 bytes per entry.
+ 	// Benchmarking map creation as of go1.20, a one-entry MIMEHeader is 416 bytes and large
+ 	// MIMEHeaders average about 200 bytes per entry.
+-	lim -= 400
++	maxMemory -= 400
+ 	const mapEntryOverhead = 200
+ 
+ 	// The first line cannot start with a leading space.
+@@ -539,6 +539,11 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 			continue
+ 		}
+ 
++		maxHeaders--
++		if maxHeaders < 0 {
++			return nil, errors.New("message too large")
++		}
++
+ 		// backport 5c55ac9bf1e5f779220294c843526536605f42ab
+ 		//
+ 		// value is computed as
+@@ -557,11 +562,11 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 
+ 		vv := m[key]
+ 		if vv == nil {
+-			lim -= int64(len(key))
+-			lim -= mapEntryOverhead
++			maxMemory -= int64(len(key))
++			maxMemory -= mapEntryOverhead
+ 		}
+-		lim -= int64(len(value))
+-		if lim < 0 {
++		maxMemory -= int64(len(value))
++		if maxMemory < 0 {
+ 			// TODO: This should be a distinguishable error (ErrMessageTooLarge)
+ 			// to allow mime/multipart to detect it.
+ 			return m, errors.New("message too large")
+-- 
+2.25.1
+
-- 
2.34.1


