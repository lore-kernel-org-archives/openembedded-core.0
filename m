Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B3BC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 14:41:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.11310.1664462484453849625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UiDI7oYs;
 spf=pass (domain: mvista.com, ip: 209.85.210.176,
 mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id i6so1648914pfb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9tesIzOemJIFnyukkfL36oduDCHkMKpXTVQiMcXks3w=;
        b=UiDI7oYstLScHHfMULrWQcTa4XZL8KRZ5fxRKGgWFY1e7qGQ7hsFYBLPF9wJApzBsP
         PEy3KPj43R5iSkzI3NQC1NU95QZ0MvzWs6OEjXzJi3Q23xt9WZpH0HZph0taiUfPP+SW
         oQn6U1NXSiqHuX+6MYSN24c5aH6XN9zu5MtKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9tesIzOemJIFnyukkfL36oduDCHkMKpXTVQiMcXks3w=;
        b=b7iGr8cH5b7opdk2xA6A7xbg/37LpKdbRZto6dFr//I8hWaEbWt6eJgexB702h5Oy+
         urlC5hpT/A1m1Pv8y1CLp2IrUIE/4dAyqMDy/z7bSJ9IAPr7Qwq7llhjxeiYrWn75Jx7
         1BRQx41Mgvph2EsMi8pQZ+C/fY4ryPbX7KSdx459adxuEjL4mJV234ardj8F7yXioQ+s
         fRMl2zH9JbcSvQxWgAKHYPocBqlxAm7hOz8MkSjOlXoh24rnRD2ujcBSSwQXnq0OFRbZ
         QDD0MX89dm0N8fXch7cMKdOm09Mv1UuwyBpbdvzxqm9Qxj2BiFUwqxRD3YUVUyi8ND6a
         oioQ==
X-Gm-Message-State: ACrzQf1kd5o8iPKHJL/sXeeBP1M02bpmNkfGBq2jpziF2htKWpKMGrWb
	7sFXc9g5RQJbD5yY7bENx8NBcZdXW31HGbma
X-Google-Smtp-Source: 
 AMsMyM6p9FyQL9HH9zvceeoaI1oek5SRodWyrDqDmscbWLsyC8Xrb9IbDo4oSSyVCs6FnDc90mPN5g==
X-Received: by 2002:a05:6a00:cc6:b0:541:3fff:35a5 with SMTP id
 b6-20020a056a000cc600b005413fff35a5mr3847872pfv.67.1664462483082;
        Thu, 29 Sep 2022 07:41:23 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id
 w2-20020a17090a380200b0020255f4960bsm3553133pjb.24.2022.09.29.07.41.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:41:22 -0700 (PDT)
From: Shubham Kulkarni <skulkarni@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Add fix for CVE-2022-32190
Date: Thu, 29 Sep 2022 20:11:11 +0530
Message-Id: <1664462471-29264-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 14:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171190

Link: https://github.com/golang/go/commit/28335508913a46e05ef0c04a18e8a1a6beb775ec

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc               |  4 ++
 .../go/go-1.14/0001-CVE-2022-32190.patch           | 74 +++++++++++++++++++
 .../go/go-1.14/0002-CVE-2022-32190.patch           | 48 +++++++++++++
 .../go/go-1.14/0003-CVE-2022-32190.patch           | 36 ++++++++++
 .../go/go-1.14/0004-CVE-2022-32190.patch           | 82 ++++++++++++++++++++++
 5 files changed, 244 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/0001-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0002-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0003-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0004-CVE-2022-32190.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index af63452..6e37150 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -36,6 +36,10 @@ SRC_URI += "\
     file://CVE-2021-36221.patch \
     file://CVE-2021-39293.patch \
     file://CVE-2021-41771.patch \
+    file://0001-CVE-2022-32190.patch \
+    file://0002-CVE-2022-32190.patch \
+    file://0003-CVE-2022-32190.patch \
+    file://0004-CVE-2022-32190.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/0001-CVE-2022-32190.patch b/meta/recipes-devtools/go/go-1.14/0001-CVE-2022-32190.patch
new file mode 100644
index 0000000..ad263b8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/0001-CVE-2022-32190.patch
@@ -0,0 +1,74 @@
+From 755f2dc35a19e6806de3ecbf836fa06ad875c67a Mon Sep 17 00:00:00 2001
+From: Carl Johnson <me@carlmjohnson.net>
+Date: Fri, 4 Mar 2022 14:49:52 +0000
+Subject: [PATCH 1/4] net/url: add JoinPath, URL.JoinPath
+
+Builds on CL 332209.
+
+Fixes #47005
+
+Change-Id: I82708dede05d79a196ca63f5a4e7cb5ac9a041ea
+GitHub-Last-Rev: 51b735066eef74f5e67c3e8899c58f44c0383c61
+GitHub-Pull-Request: golang/go#50383
+Reviewed-on: https://go-review.googlesource.com/c/go/+/374654
+Reviewed-by: Russ Cox <rsc@golang.org>
+Auto-Submit: Russ Cox <rsc@golang.org>
+Trust: Ian Lance Taylor <iant@golang.org>
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/604140d93111f89911e17cb147dcf6a02d2700d0]
+CVE: CVE-2022-32190
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/net/url/url.go | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 2880e82..dea8bfe 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -13,6 +13,7 @@ package url
+ import (
+	"errors"
+	"fmt"
++	"path"
+	"sort"
+	"strconv"
+	"strings"
+@@ -1104,6 +1105,17 @@ func (u *URL) UnmarshalBinary(text []byte) error {
+	return nil
+ }
+
++// JoinPath returns a new URL with the provided path elements joined to
++// any existing path and the resulting path cleaned of any ./ or ../ elements.
++func (u *URL) JoinPath(elem ...string) *URL {
++	url := *u
++	if len(elem) > 0 {
++		elem = append([]string{u.Path}, elem...)
++		url.setPath(path.Join(elem...))
++	}
++	return &url
++}
++
+ // validUserinfo reports whether s is a valid userinfo string per RFC 3986
+ // Section 3.2.1:
+ //     userinfo    = *( unreserved / pct-encoded / sub-delims / ":" )
+@@ -1144,3 +1156,14 @@ func stringContainsCTLByte(s string) bool {
+	}
+	return false
+ }
++
++// JoinPath returns a URL string with the provided path elements joined to
++// the existing path of base and the resulting path cleaned of any ./ or ../ elements.
++func JoinPath(base string, elem ...string) (result string, err error) {
++	url, err := Parse(base)
++	if err != nil {
++		return
++	}
++	result = url.JoinPath(elem...).String()
++	return
++}
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/0002-CVE-2022-32190.patch b/meta/recipes-devtools/go/go-1.14/0002-CVE-2022-32190.patch
new file mode 100644
index 0000000..1a11cc7
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/0002-CVE-2022-32190.patch
@@ -0,0 +1,48 @@
+From 985108de87e7d2ecb2b28cb53b323d530387b884 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Thu, 31 Mar 2022 13:21:39 -0700
+Subject: [PATCH 2/4] net/url: preserve a trailing slash in JoinPath
+
+Fixes #52074
+
+Change-Id: I30897f32e70a6ca0c4e11aaf07088c27336efaba
+Reviewed-on: https://go-review.googlesource.com/c/go/+/397256
+Trust: Ian Lance Taylor <iant@golang.org>
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Matt Layher <mdlayher@gmail.com>
+Trust: Matt Layher <mdlayher@gmail.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/dbb52cc9f3e83a3040f46c2ae7650c15ab342179]
+CVE: CVE-2022-32190
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/net/url/url.go | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index dea8bfe..3436707 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -1107,11 +1107,18 @@ func (u *URL) UnmarshalBinary(text []byte) error {
+
+ // JoinPath returns a new URL with the provided path elements joined to
+ // any existing path and the resulting path cleaned of any ./ or ../ elements.
++// Any sequences of multiple / characters will be reduced to a single /.
+ func (u *URL) JoinPath(elem ...string) *URL {
+	url := *u
+	if len(elem) > 0 {
+		elem = append([]string{u.Path}, elem...)
+-		url.setPath(path.Join(elem...))
++		p := path.Join(elem...)
++		// path.Join will remove any trailing slashes.
++		// Preserve at least one.
++		if strings.HasSuffix(elem[len(elem)-1], "/") && !strings.HasSuffix(p, "/") {
++			p += "/"
++		}
++		url.setPath(p)
+	}
+	return &url
+ }
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/0003-CVE-2022-32190.patch b/meta/recipes-devtools/go/go-1.14/0003-CVE-2022-32190.patch
new file mode 100644
index 0000000..816d914
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/0003-CVE-2022-32190.patch
@@ -0,0 +1,36 @@
+From 2c632b883b0f11084cc247c8b50ad6c71fa7b447 Mon Sep 17 00:00:00 2001
+From: Sean Liao <sean@liao.dev>
+Date: Sat, 9 Jul 2022 18:38:45 +0100
+Subject: [PATCH 3/4] net/url: use EscapedPath for url.JoinPath
+
+Fixes #53763
+
+Change-Id: I08b53f159ebdce7907e8cc17316fd0c982363239
+Reviewed-on: https://go-review.googlesource.com/c/go/+/416774
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Bryan Mills <bcmills@google.com>
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/bf5898ef53d1693aa572da0da746c05e9a6f15c5]
+CVE: CVE-2022-32190
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/net/url/url.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 3436707..73079a5 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -1111,7 +1111,7 @@ func (u *URL) UnmarshalBinary(text []byte) error {
+ func (u *URL) JoinPath(elem ...string) *URL {
+	url := *u
+	if len(elem) > 0 {
+-		elem = append([]string{u.Path}, elem...)
++		elem = append([]string{u.EscapedPath()}, elem...)
+		p := path.Join(elem...)
+		// path.Join will remove any trailing slashes.
+		// Preserve at least one.
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/0004-CVE-2022-32190.patch b/meta/recipes-devtools/go/go-1.14/0004-CVE-2022-32190.patch
new file mode 100644
index 0000000..4bdff3a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/0004-CVE-2022-32190.patch
@@ -0,0 +1,82 @@
+From f61e428699cbb52bab31fe2c124f49d085a209fe Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 12 Aug 2022 16:21:09 -0700
+Subject: [PATCH 4/4] net/url: consistently remove ../ elements in JoinPath
+
+JoinPath would fail to remove relative elements from the start of
+the path when the first path element is "".
+
+In addition, JoinPath would return the original path unmodified
+when provided with no elements to join, violating the documented
+behavior of always cleaning the resulting path.
+
+Correct both these cases.
+
+    JoinPath("http://go.dev", "../go")
+    // before: http://go.dev/../go
+    // after:  http://go.dev/go
+
+    JoinPath("http://go.dev/../go")
+    // before: http://go.dev/../go
+    // after:  http://go.dev/go
+
+For #54385.
+Fixes #54635.
+Fixes CVE-2022-32190.
+
+Change-Id: I6d22cd160d097c50703dd96e4f453c6c118fd5d9
+Reviewed-on: https://go-review.googlesource.com/c/go/+/423514
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Alan Donovan <adonovan@google.com>
+(cherry picked from commit 0765da5884adcc8b744979303a36a27092d8fc51)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/425357
+Run-TryBot: Damien Neil <dneil@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/28335508913a46e05ef0c04a18e8a1a6beb775ec]
+CVE: CVE-2022-32190
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/net/url/url.go | 26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 73079a5..1e8baf9 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -1109,17 +1109,23 @@ func (u *URL) UnmarshalBinary(text []byte) error {
+ // any existing path and the resulting path cleaned of any ./ or ../ elements.
+ // Any sequences of multiple / characters will be reduced to a single /.
+ func (u *URL) JoinPath(elem ...string) *URL {
+-	url := *u
+-	if len(elem) > 0 {
+-		elem = append([]string{u.EscapedPath()}, elem...)
+-		p := path.Join(elem...)
+-		// path.Join will remove any trailing slashes.
+-		// Preserve at least one.
+-		if strings.HasSuffix(elem[len(elem)-1], "/") && !strings.HasSuffix(p, "/") {
+-			p += "/"
+-		}
+-		url.setPath(p)
++	elem = append([]string{u.EscapedPath()}, elem...)
++	var p string
++	if !strings.HasPrefix(elem[0], "/") {
++		// Return a relative path if u is relative,
++		// but ensure that it contains no ../ elements.
++		elem[0] = "/" + elem[0]
++		p = path.Join(elem...)[1:]
++	} else {
++		p = path.Join(elem...)
+	}
++	// path.Join will remove any trailing slashes.
++	// Preserve at least one.
++	if strings.HasSuffix(elem[len(elem)-1], "/") && !strings.HasSuffix(p, "/") {
++		p += "/"
++	}
++	url := *u
++	url.setPath(p)
+	return &url
+ }
+
+--
+2.7.4
-- 
2.7.4


