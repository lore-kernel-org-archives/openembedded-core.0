Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B615FC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 07:24:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.21280.1661412277818508805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g/yLn+e0;
 spf=pass (domain: mvista.com, ip: 209.85.210.182,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id p185so4397648pfb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZRTZN3wLXrteU9+hjph/LibEyz5tziYM0FtnuJm/XAE=;
        b=g/yLn+e0WT6k1w4Z7gpr4r3FMRvbQUiltQMW0LsvG7RewK4xH8ohA2yLIlQKrQ7MOL
         wkgguNUO8xLQ8POh1MD17tRB55u/DBj0XZpi93b6pdMypUMYzKxorqtfAoLk2Jzn36q+
         lRz9Ww8/bNsIKcMeUIRKR/JHtADHAbnuUN00s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZRTZN3wLXrteU9+hjph/LibEyz5tziYM0FtnuJm/XAE=;
        b=gOISEaAlnmeeBNE4b0X/gtrX25HPtvBzOUKPKax1E74ZRUucK9MX31/KVHRweYetEb
         Zg5nlvRswR4o9j7/Lfv5mu3zEnIp+OVEMCDbEzJLidJTS4RNXCytteEDFTUvpf0YRzTW
         YOjEIk64XxaYn9tDyrX2f3Sxaq3RyL+wijHp/kLkTye5H2sQ0pmIj4ulTKP99w/qwp8F
         ikF+8LzmxIgIsA46RjJMkl6VLnpxftzc7Jndn1PC91mmYOkMEbacw1w1+RCML4ihWAmh
         X/rBEqcLCXsx65ERuMmj3DfhgFcZP/uuG8bjbCeKva1F0e+PC2S5xGGnJk++Yu23+QnB
         SDAw==
X-Gm-Message-State: ACgBeo3FMGpugvfrghNB/Bezmi+FygJ8z8byDnl1Bv3zb+x2o627Fll9
	TSsJVuJxoteolmpAEGu0wl0nfE4GOHqtuA==
X-Google-Smtp-Source: 
 AA6agR7bsgzPDPmJTDYtNjFeTNr6fty9twJwQdkMBRyNiE82dKWFFfw+/WtvemhbPixjHMYHW4wVUQ==
X-Received: by 2002:a05:6a00:1402:b0:536:bf1c:3d16 with SMTP id
 l2-20020a056a00140200b00536bf1c3d16mr2912843pfu.20.1661412276932;
        Thu, 25 Aug 2022 00:24:36 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.197])
        by smtp.gmail.com with ESMTPSA id
 67-20020a621846000000b005367c28fd32sm23758pfy.185.2022.08.25.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:24:36 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 25 Aug 2022 12:54:31 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: Fix security issue
Date: Thu, 25 Aug 2022 12:54:30 +0530
Message-Id: <20220825072430.49726-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 07:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169834

Source: https://github.com/golang/go
MR: 120613, 120613
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/c15a8e2dbb5ac376a6ed890735341b812d6b965c && https://github.com/golang/go/commit/0117dee7dccbbd7803d88f65a2ce8bd686219ad3
ChangeID: 366db775dec045d7b312b8da0436af36ab322046
Description:
Fixed CVE:
	1. CVE-2022-30629
	2. CVE-2022-30631

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2022-30629.patch           |  47 +++++++
 .../go/go-1.14/CVE-2022-30631.patch           | 116 ++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30629.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30631.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index b160222f76..6089fd501d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -25,6 +25,8 @@ SRC_URI += "\
     file://CVE-2021-44717.patch \
     file://CVE-2022-24675.patch \
     file://CVE-2021-31525.patch \
+    file://CVE-2022-30629.patch \
+    file://CVE-2022-30631.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-30629.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-30629.patch
new file mode 100644
index 0000000000..47313a547f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-30629.patch
@@ -0,0 +1,47 @@
+From 8d0bbb5a6280c2cf951241ec7f6579c90d38df57 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 25 Aug 2022 10:55:08 +0530
+Subject: [PATCH] CVE-2022-30629
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c15a8e2dbb5ac376a6ed890735341b812d6b965c]
+CVE: CVE-2022-30629
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/crypto/tls/handshake_server_tls13.go | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index 5432145..d91797e 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -9,6 +9,7 @@ import (
+ 	"crypto"
+ 	"crypto/hmac"
+ 	"crypto/rsa"
++	"encoding/binary"
+ 	"errors"
+ 	"hash"
+ 	"io"
+@@ -742,6 +743,19 @@ func (hs *serverHandshakeStateTLS13) sendSessionTickets() error {
+ 	}
+ 	m.lifetime = uint32(maxSessionTicketLifetime / time.Second)
+ 
++	// ticket_age_add is a random 32-bit value. See RFC 8446, section 4.6.1
++	// The value is not stored anywhere; we never need to check the ticket age
++	// because 0-RTT is not supported.
++	ageAdd := make([]byte, 4)
++	_, err = hs.c.config.rand().Read(ageAdd)
++	if err != nil {
++		return err
++	}
++	m.ageAdd = binary.LittleEndian.Uint32(ageAdd)
++
++	// ticket_nonce, which must be unique per connection, is always left at
++	// zero because we only ever send one ticket per connection.
++
+ 	if _, err := c.writeRecord(recordTypeHandshake, m.marshal()); err != nil {
+ 		return err
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-30631.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-30631.patch
new file mode 100644
index 0000000000..5dcfd27f16
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-30631.patch
@@ -0,0 +1,116 @@
+From d10fc3a84e3344f2421c1dd3046faa50709ab4d5 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 25 Aug 2022 11:01:21 +0530
+Subject: [PATCH] CVE-2022-30631
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/0117dee7dccbbd7803d88f65a2ce8bd686219ad3]
+CVE: CVE-2022-30631
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/compress/gzip/gunzip.go      | 60 +++++++++++++++-----------------
+ src/compress/gzip/gunzip_test.go | 16 +++++++++
+ 2 files changed, 45 insertions(+), 31 deletions(-)
+
+diff --git a/src/compress/gzip/gunzip.go b/src/compress/gzip/gunzip.go
+index 924bce1..237b2b9 100644
+--- a/src/compress/gzip/gunzip.go
++++ b/src/compress/gzip/gunzip.go
+@@ -248,42 +248,40 @@ func (z *Reader) Read(p []byte) (n int, err error) {
+ 		return 0, z.err
+ 	}
+ 
+-	n, z.err = z.decompressor.Read(p)
+-	z.digest = crc32.Update(z.digest, crc32.IEEETable, p[:n])
+-	z.size += uint32(n)
+-	if z.err != io.EOF {
+-		// In the normal case we return here.
+-		return n, z.err
+-	}
++	for n == 0 {
++		n, z.err = z.decompressor.Read(p)
++		z.digest = crc32.Update(z.digest, crc32.IEEETable, p[:n])
++		z.size += uint32(n)
++		if z.err != io.EOF {
++			// In the normal case we return here.
++			return n, z.err
++		}
+ 
+-	// Finished file; check checksum and size.
+-	if _, err := io.ReadFull(z.r, z.buf[:8]); err != nil {
+-		z.err = noEOF(err)
+-		return n, z.err
+-	}
+-	digest := le.Uint32(z.buf[:4])
+-	size := le.Uint32(z.buf[4:8])
+-	if digest != z.digest || size != z.size {
+-		z.err = ErrChecksum
+-		return n, z.err
+-	}
+-	z.digest, z.size = 0, 0
++		// Finished file; check checksum and size.
++		if _, err := io.ReadFull(z.r, z.buf[:8]); err != nil {
++			z.err = noEOF(err)
++			return n, z.err
++		}
++		digest := le.Uint32(z.buf[:4])
++		size := le.Uint32(z.buf[4:8])
++		if digest != z.digest || size != z.size {
++			z.err = ErrChecksum
++			return n, z.err
++		}
++		z.digest, z.size = 0, 0
+ 
+-	// File is ok; check if there is another.
+-	if !z.multistream {
+-		return n, io.EOF
+-	}
+-	z.err = nil // Remove io.EOF
++		// File is ok; check if there is another.
++		if !z.multistream {
++			return n, io.EOF
++		}
++		z.err = nil // Remove io.EOF
+ 
+-	if _, z.err = z.readHeader(); z.err != nil {
+-		return n, z.err
++		if _, z.err = z.readHeader(); z.err != nil {
++			return n, z.err
++		}
+ 	}
+ 
+-	// Read from next file, if necessary.
+-	if n > 0 {
+-		return n, nil
+-	}
+-	return z.Read(p)
++	return n, nil
+ }
+ 
+ // Close closes the Reader. It does not close the underlying io.Reader.
+diff --git a/src/compress/gzip/gunzip_test.go b/src/compress/gzip/gunzip_test.go
+index 1b01404..95220ae 100644
+--- a/src/compress/gzip/gunzip_test.go
++++ b/src/compress/gzip/gunzip_test.go
+@@ -516,3 +516,19 @@ func TestTruncatedStreams(t *testing.T) {
+ 		}
+ 	}
+ }
++
++func TestCVE202230631(t *testing.T) {
++	var empty = []byte{0x1f, 0x8b, 0x08, 0x00, 0xa7, 0x8f, 0x43, 0x62, 0x00,
++		0x03, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}
++	r := bytes.NewReader(bytes.Repeat(empty, 4e6))
++	z, err := NewReader(r)
++	if err != nil {
++		t.Fatalf("NewReader: got %v, want nil", err)
++	}
++	// Prior to CVE-2022-30631 fix, this would cause an unrecoverable panic due
++	// to stack exhaustion.
++	_, err = z.Read(make([]byte, 10))
++	if err != io.EOF {
++		t.Errorf("Reader.Read: got %v, want %v", err, io.EOF)
++	}
++}
+-- 
+2.25.1
+
-- 
2.25.1


