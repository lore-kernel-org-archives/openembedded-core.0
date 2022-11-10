Return-Path: <sukumar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054B1C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 12:01:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.6452.1668081679394455842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 04:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=i0MGwgg8;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: sukumar@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 136so1616357pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 04:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWmJ6ESxcj+EFZKXhjNXftBVVm9CeXgsc2s4AbGGZis=;
        b=i0MGwgg8MUQSSUd8UKO33EX0SF5Yxq9RN8qFxDWpnUk7JC8r5Z0eWgEBERaNLXy+pX
         dLdgAi2I9DHZ1BAJ4jHfvuH9vGTZV54mbKgpwHf8sRSEms0T104PGL1OWRveqNhHguaB
         97gqyzGMiIXO2YNfE8BMKD7OIlArKznHHVbZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWmJ6ESxcj+EFZKXhjNXftBVVm9CeXgsc2s4AbGGZis=;
        b=yQdjxrpi2bJqCXfvAnsEmol00CkELYPdQYRMb9pV3ECmG39SeSdklfactK2MYOLmky
         ctWFJvdmUT22oCleHg0MP6IDG5T29dleHG+V9iUgmNEqaqV9VzindF3PTYUibESqMEI9
         r7kXUEqSTs7E3zzRVc1KYz2HIeJ4Q7MW4l4y3M1+aNz8z18mDiUdrhC55bI+ve1pj5bJ
         IPrTs7S6gf4vOY18xVLjaU2MhvBsTWD6Vfj3jvntp/zBOjjWPJR2IRnsjHdu0jOXgLwe
         lKCwBQZnzk51uo+jJ8oHRsTeNeludI1a9HD2Pxp4m8xc7glNVRc2Yh3sPBfDlK1Hatak
         RURQ==
X-Gm-Message-State: ACrzQf1xGFmnYtB5sT+el17tWDAQvnz5NV/bw5XUhlzwXEnSit8hO89f
	qDrhHHyRBZiV5lD4cmSsbtI4MmvOECa0wtCb
X-Google-Smtp-Source: AMsMyM64ML065F40Nzk/zcE+5Q0e4YReGlhvUGVcnXvAhHkUlu+Y4absfL4ZWLTaYTvDgXqpGzinrw==
X-Received: by 2002:a63:2d01:0:b0:43c:e6cd:a9e4 with SMTP id t1-20020a632d01000000b0043ce6cda9e4mr2307275pgt.546.1668081677692;
        Thu, 10 Nov 2022 04:01:17 -0800 (PST)
Received: from mars-sukumar.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b00186afd756edsm11054905ple.283.2022.11.10.04.01.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2022 04:01:16 -0800 (PST)
From: sukumar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Sunil Kumar <sukumar@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Security Fix for CVE-2022-2879
Date: Thu, 10 Nov 2022 17:30:59 +0530
Message-Id: <1668081659-29302-1-git-send-email-sukumar@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 12:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173073

From: Sunil Kumar <sukumar@mvista.com>

archive/tar: limit size of headers

Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
GNU link names), to avoid reading arbitrarily large amounts of data
into memory.

Link: https://github.com/golang/go/commit/0a723816cd2

Signed-off-by: Sunil Kumar <sukumar@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc               |   1 +
 .../go/go-1.14/CVE-2022-2879.patch                 | 111 +++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 3341beb..e8ff1c4 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://0003-CVE-2022-32190.patch \
     file://0004-CVE-2022-32190.patch \
     file://CVE-2022-2880.patch \
+    file://CVE-2022-2879.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch
new file mode 100644
index 0000000..ea04a82
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch
@@ -0,0 +1,111 @@
+From 9d339f1d0f53c4116a7cb4acfa895f31a07212ee Mon Sep 17 00:00:00 2001
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
+Fixes #55926
+
+Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1565555
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1591053
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/438498
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/0a723816cd2]
+CVE: CVE-2022-2879
+Signed-off-by: Sunil Kumar <sukumar@mvista.com>
+---
+ src/archive/tar/format.go |  4 ++++
+ src/archive/tar/reader.go | 14 ++++++++++++--
+ src/archive/tar/writer.go |  3 +++
+ 3 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
+index cfe24a5..6642364 100644
+--- a/src/archive/tar/format.go
++++ b/src/archive/tar/format.go
+@@ -143,6 +143,10 @@ const (
+	blockSize  = 512 // Size of each block in a tar stream
+	nameSize   = 100 // Max length of the name field in USTAR format
+	prefixSize = 155 // Max length of the prefix field in USTAR format
++
++	// Max length of a special file (PAX header, GNU long name or link).
++	// This matches the limit used by libarchive.
++	maxSpecialFileSize = 1 << 20
+ )
+
+ // blockPadding computes the number of bytes needed to pad offset up to the
+diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
+index 4f9135b..e996595 100644
+--- a/src/archive/tar/reader.go
++++ b/src/archive/tar/reader.go
+@@ -104,7 +104,7 @@ func (tr *Reader) next() (*Header, error) {
+			continue // This is a meta header affecting the next header
+		case TypeGNULongName, TypeGNULongLink:
+			format.mayOnlyBe(FormatGNU)
+-			realname, err := ioutil.ReadAll(tr)
++			realname, err := readSpecialFile(tr)
+			if err != nil {
+				return nil, err
+			}
+@@ -294,7 +294,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]string) (err error) {
+ // parsePAX parses PAX headers.
+ // If an extended header (type 'x') is invalid, ErrHeader is returned
+ func parsePAX(r io.Reader) (map[string]string, error) {
+-	buf, err := ioutil.ReadAll(r)
++	buf, err := readSpecialFile(r)
+	if err != nil {
+		return nil, err
+	}
+@@ -827,6 +827,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, err error) {
+	return n, err
+ }
+
++// readSpecialFile is like ioutil.ReadAll except it returns
++// ErrFieldTooLong if more than maxSpecialFileSize is read.
++func readSpecialFile(r io.Reader) ([]byte, error) {
++	buf, err := ioutil.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
++	if len(buf) > maxSpecialFileSize {
++		return nil, ErrFieldTooLong
++	}
++	return buf, err
++}
++
+ // discard skips n bytes in r, reporting an error if unable to do so.
+ func discard(r io.Reader, n int64) error {
+	// If possible, Seek to the last byte before the end of the data section.
+diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
+index e80498d..893eac0 100644
+--- a/src/archive/tar/writer.go
++++ b/src/archive/tar/writer.go
+@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error {
+			flag = TypeXHeader
+		}
+		data := buf.String()
++		if len(data) > maxSpecialFileSize {
++			return ErrFieldTooLong
++		}
+		if err := tw.writeRawFile(name, data, flag, FormatPAX); err != nil || isGlobal {
+			return err // Global headers return here
+		}
+--
+2.7.4
-- 
2.7.4


