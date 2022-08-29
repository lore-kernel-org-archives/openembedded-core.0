Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF416ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 05:36:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.67340.1661751355256565943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 22:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JeTZakMR;
 spf=pass (domain: mvista.com, ip: 209.85.214.173,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id c2so6941523plo.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zTY963wAkYX6LeF1/pdrrgszG/e4x2qn6sYIEyVx5cY=;
        b=JeTZakMRu5FjGK+IJ0wVz+tuMALnW3Bjytzdzw3zlJo1zwH5w2ES31N1AkdB6tGRTP
         2wRfTx0P/kp+rsDe2HQANf9YOrRvGi06u5wU1ipLHRa+cw+Yzchc/3awzMCBAx8MheH7
         MAbgLoUa3ovYj1kErlrzTj/zzi16Wla/pj7nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zTY963wAkYX6LeF1/pdrrgszG/e4x2qn6sYIEyVx5cY=;
        b=jkqFWLUv9OBIw1d9WsXUmcA/rhK3umSqABmroM8DkD/wF/kSZ72LDkVjzHR7yAjlJh
         BHY7kdkHKmT0EhY29RIyCOXB/nFMQ0WGNsRXYYtikfJAPORX+Jx7tzECw0K2N2V9tDT7
         v43hy8YLLWcarKQuZsMgdj7s+z7yxADZ4lHSyHSMzggn+wbrj+01p9vt7I0uAV7LGDz/
         362mF4kwfFeU4f2oCBLMwToox77xw5kLVyzc6/UZmvbZuwkHv7vNiJ22Png4PU3kRVu0
         oN04P/lA/9wmHj9chrXvaGj13CbvEe64kBXdPhScPcazlKBsEqhWnSTOedngnDMNil3y
         pVFA==
X-Gm-Message-State: ACgBeo1zER3dg4TtqexcJztSYEv0p3ylZxV0ySFvWiLiQmzGvkmwg5dx
	AXAM1ODWOzKO9gMfj8MsZjGjDotXJnq6Bw==
X-Google-Smtp-Source: 
 AA6agR5QDHzFUZuO1usytg5Y3Ki3jMg/YfY67aYMVg90LvRRJgZCglVs8CEL16cTAqXS8Vh8mgA6Jg==
X-Received: by 2002:a17:90b:3144:b0:1f5:829e:cd49 with SMTP id
 ip4-20020a17090b314400b001f5829ecd49mr17082409pjb.80.1661751354401;
        Sun, 28 Aug 2022 22:35:54 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.199])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ce8d00b001749dff717dsm844040plg.227.2022.08.28.22.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 22:35:54 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 11:05:48 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2022-32189 a denial of service
Date: Mon, 29 Aug 2022 11:05:47 +0530
Message-Id: <20220829053547.48991-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 05:36:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170006

Source: https://github.com/golang/go
MR: 120634
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/703c8ab7e5ba75c95553d4e249309297abad7102
ChangeID: 3ade323dd52a6b654358f6738a0b3411ccc6d3f8
Description:
	CVE-2022-32189 golang: math/big: decoding big.Float and big.Rat types can panic if the encoded message is too short, potentially allowing a denial of service.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-32189.patch           | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-32189.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 7c32246012..1458a11b3f 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -31,6 +31,7 @@ SRC_URI += "\
     file://CVE-2022-30633.patch \
     file://CVE-2022-30635.patch \
     file://CVE-2022-32148.patch \
+    file://CVE-2022-32189.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-32189.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-32189.patch
new file mode 100644
index 0000000000..15fda7de1b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-32189.patch
@@ -0,0 +1,113 @@
+From 027e7e1578d3d7614f7586eff3894b83d9709e14 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 29 Aug 2022 10:08:34 +0530
+Subject: [PATCH] CVE-2022-32189
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/703c8ab7e5ba75c95553d4e249309297abad7102]
+CVE: CVE-2022-32189
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/math/big/floatmarsh.go      |  7 +++++++
+ src/math/big/floatmarsh_test.go | 12 ++++++++++++
+ src/math/big/ratmarsh.go        |  6 ++++++
+ src/math/big/ratmarsh_test.go   | 12 ++++++++++++
+ 4 files changed, 37 insertions(+)
+
+diff --git a/src/math/big/floatmarsh.go b/src/math/big/floatmarsh.go
+index d1c1dab..990e085 100644
+--- a/src/math/big/floatmarsh.go
++++ b/src/math/big/floatmarsh.go
+@@ -8,6 +8,7 @@ package big
+ 
+ import (
+ 	"encoding/binary"
++	"errors"
+ 	"fmt"
+ )
+ 
+@@ -67,6 +68,9 @@ func (z *Float) GobDecode(buf []byte) error {
+ 		*z = Float{}
+ 		return nil
+ 	}
++	if len(buf) < 6 {
++		return errors.New("Float.GobDecode: buffer too small")
++	}
+ 
+ 	if buf[0] != floatGobVersion {
+ 		return fmt.Errorf("Float.GobDecode: encoding version %d not supported", buf[0])
+@@ -83,6 +87,9 @@ func (z *Float) GobDecode(buf []byte) error {
+ 	z.prec = binary.BigEndian.Uint32(buf[2:])
+ 
+ 	if z.form == finite {
++		if len(buf) < 10 {
++			return errors.New("Float.GobDecode: buffer too small for finite form float")
++		}
+ 		z.exp = int32(binary.BigEndian.Uint32(buf[6:]))
+ 		z.mant = z.mant.setBytes(buf[10:])
+ 	}
+diff --git a/src/math/big/floatmarsh_test.go b/src/math/big/floatmarsh_test.go
+index c056d78..401f45a 100644
+--- a/src/math/big/floatmarsh_test.go
++++ b/src/math/big/floatmarsh_test.go
+@@ -137,3 +137,15 @@ func TestFloatJSONEncoding(t *testing.T) {
+ 		}
+ 	}
+ }
++
++func TestFloatGobDecodeShortBuffer(t *testing.T) {
++	for _, tc := range [][]byte{
++		[]byte{0x1, 0x0, 0x0, 0x0},
++		[]byte{0x1, 0xfa, 0x0, 0x0, 0x0, 0x0},
++	} {
++		err := NewFloat(0).GobDecode(tc)
++		if err == nil {
++			t.Error("expected GobDecode to return error for malformed input")
++		}
++	}
++}
+diff --git a/src/math/big/ratmarsh.go b/src/math/big/ratmarsh.go
+index fbc7b60..56102e8 100644
+--- a/src/math/big/ratmarsh.go
++++ b/src/math/big/ratmarsh.go
+@@ -45,12 +45,18 @@ func (z *Rat) GobDecode(buf []byte) error {
+ 		*z = Rat{}
+ 		return nil
+ 	}
++	if len(buf) < 5 {
++		return errors.New("Rat.GobDecode: buffer too small")
++	}
+ 	b := buf[0]
+ 	if b>>1 != ratGobVersion {
+ 		return fmt.Errorf("Rat.GobDecode: encoding version %d not supported", b>>1)
+ 	}
+ 	const j = 1 + 4
+ 	i := j + binary.BigEndian.Uint32(buf[j-4:j])
++	if len(buf) < int(i) {
++		return errors.New("Rat.GobDecode: buffer too small")
++	}
+ 	z.a.neg = b&1 != 0
+ 	z.a.abs = z.a.abs.setBytes(buf[j:i])
+ 	z.b.abs = z.b.abs.setBytes(buf[i:])
+diff --git a/src/math/big/ratmarsh_test.go b/src/math/big/ratmarsh_test.go
+index 351d109..55a9878 100644
+--- a/src/math/big/ratmarsh_test.go
++++ b/src/math/big/ratmarsh_test.go
+@@ -123,3 +123,15 @@ func TestRatXMLEncoding(t *testing.T) {
+ 		}
+ 	}
+ }
++
++func TestRatGobDecodeShortBuffer(t *testing.T) {
++	for _, tc := range [][]byte{
++		[]byte{0x2},
++		[]byte{0x2, 0x0, 0x0, 0x0, 0xff},
++	} {
++		err := NewRat(1, 2).GobDecode(tc)
++		if err == nil {
++			t.Error("expected GobDecode to return error for malformed input")
++		}
++	}
++}
+-- 
+2.25.1
+
-- 
2.25.1


