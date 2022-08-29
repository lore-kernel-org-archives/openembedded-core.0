Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7795ECAAD8
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:02:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.3749.1661806971017654839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XiK03JIa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 j9-20020a17090a3e0900b001fd9568b117so6207333pjc.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=LiQfhe4eONNEXc1pnEL8NMkcEErXa90ULk7OXvaTzWo=;
        b=XiK03JIa92LG0+RBkDYS5Vywz0oyJ1hcAQ6pyDDJzYCcgcSSqn0pF5PHaJf3baGVLI
         2RxL8v6dbld5wFecI0P9D9sg20l1rgs+R8HWw/Oz/i32KwuV7hN/8Gc0Zmqx3khrcZ1L
         Pg+R0bZJ4hSWBxvq9MEiqv3p41oLIoznCkJMXEjXbqFsw+uUClbYQLqd36+qSC8E07T5
         viRX57nAKaaSWgkn0edNFVnS21n84KLSqt/ovAqQeovaIE8KpmeGaIqFWiP08dfmmjTa
         B+wktP3fYvK6X8j8vBPvXiERYymMSPS7BkPoUVNFuz9O2o1GGpHz2h3gamwHpAMuwVrK
         V7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=LiQfhe4eONNEXc1pnEL8NMkcEErXa90ULk7OXvaTzWo=;
        b=ay8Fu9SQueEMvJCcawZ2esWEstlzWIftQtCOqUez7igTkNyuJhV8eMs96G581f6G4t
         7zTy/+fmF3cREYKozWX2YGFGNXT2D9WyxaoT6Ip0zZaK18ZFFB2F5nlCBbuaZaiH2WFl
         FvyEHPrpsGKU41DFB56eNnnfByM6Se5Pc2jAzK5wLHNwInUt7eZlXfPtfVlgO/AeXbDK
         39o461mjddrjFzntpQcd/GDbk/47wT2nLbSojZmEMO/a39JQ7XQJUUgIzJndamj2N3DA
         ijwYkX+DCUmzm2sM7MgtnrhcqiK0wLQQoKhOJXh62F1L+pzE7Yw1GuytAgDad+Ib2l22
         A9UA==
X-Gm-Message-State: ACgBeo0y1cC71rEwHR2AhpQ79NB3lhDn/ekjGM+QQDKj/Elghsdr2Noi
	PpVJrOG+DtR6rpo8qDXrUVcdV6SdRZZ21zAq
X-Google-Smtp-Source: 
 AA6agR4MdiGh6LNVMLDM5QwYUAAoKMWg5ar7EgFBtq3eTypwS8blGJ1eS7SQIf/GzCz1P4ZVO8zubg==
X-Received: by 2002:a17:902:eccd:b0:172:cff9:5796 with SMTP id
 a13-20020a170902eccd00b00172cff95796mr17636231plh.151.1661806969905;
        Mon, 29 Aug 2022 14:02:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.02.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:02:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] golang: fix CVE-2022-30629 and
 CVE-2022-30631
Date: Mon, 29 Aug 2022 11:02:21 -1000
Message-Id: 
 <6813a265c7c21e24636d07a6a8df16ef0cf7da50.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170027

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


