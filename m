Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9419C4321E
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:19 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.2952.1668262211491441149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Cj/urVWI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k15so7222462pfg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF9yRHSO2XAgo8lgNMn2QzQQPj3QmYnwUAuUGuCVcFE=;
        b=Cj/urVWIR8OXfvEt/3K66BkuCn+A2arP4UgbzfgVEg8T1P4KYAHuRpqlzTkTyyDNSt
         i3ulT4nTqD7RYaqTotnV81lPFmqLW/qC0O7JL/nhuJa2YJfITz9Dx1C/pC+aasNM2t1y
         PVUo54K3Nr0NA2FG5Vb9SC/aHVyteyZ6/Pk40bjkShky8XlVSXcgr3Od+wlqbpoVtFA9
         wDY+b+hrtuF8B5+fJETigNZjOJps0+DS9BHPOVP4XSBmiEONxv3LjkOdhGo7pcyYFjzt
         aDJPvBTqshflvH/OesFwDqmy28fCugPdS5Lsv3s9P0jTMSZ5mP5XaElkPQiwJK2axlmO
         4QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YF9yRHSO2XAgo8lgNMn2QzQQPj3QmYnwUAuUGuCVcFE=;
        b=fljXQ554UD/PygKETjT6r+ibTI7HoVjs4Oe/NZF3DEiisOuNdtoy6ip83iyYf25un1
         k4mxaDJYookGElZV/tDSKl8AKwLEHe0xPk5k48ZJVkldZCaX3CnCE+43MX1dnzT7kij3
         m2cYYqXirHPRu5Mr0kmL1M43dJtrO7irVNuiUKyKAhGETLnpJ6aXeUx6RuHZinoKAw0A
         6fb3t1pjE2roVbXOaVIrIbHdaEAPIQvGMBxYuhwJo/l2uE3Jplns4pWPFeQdockbJZx/
         gaJAl4bbxRwz5fOAlRSg5DIrwN9jBzIQ+0j2h2Acckj7BnmwXGlFcwn9t4FnLX+U6Z9q
         B5NA==
X-Gm-Message-State: ANoB5pkaID7jF8HfJiYR9z53gXS8aOqyUE05QAbphP/Eww/A2dkFjzpN
	nmTJhjCuqW8UdXZeQ5xzuhpzffy+XcEBbhyk
X-Google-Smtp-Source: AA0mqf5ba7qFAGAX87+UDAvpWKqLKNP9SZ3nIqYSEgUGHKIF32TNMXKfFCg3Hxy2CpRSoosA4BpEVg==
X-Received: by 2002:a63:e714:0:b0:46f:13b0:25ea with SMTP id b20-20020a63e714000000b0046f13b025eamr5604664pgi.291.1668262210251;
        Sat, 12 Nov 2022 06:10:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] go: Security Fix for CVE-2022-2879
Date: Sat, 12 Nov 2022 04:09:50 -1000
Message-Id: <a8e2f91edfe2df5204a482c4e53fbdd08f80e878.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173151

From: Sunil Kumar <sukumar@mvista.com>

archive/tar: limit size of headers

Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
GNU link names), to avoid reading arbitrarily large amounts of data
into memory.

Link: https://github.com/golang/go/commit/0a723816cd2

Signed-off-by: Sunil Kumar <sukumar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-2879.patch            | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 3341beb159..e8ff1c4ec9 100644
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
index 0000000000..ea04a82d16
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
2.25.1


