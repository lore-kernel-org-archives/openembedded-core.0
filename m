Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A7EECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:02:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.3640.1661806977345980966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t6VoSS+a;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id x23so9162550pll.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2xQyMOC62YHwAxLUpdKa9hdFyY7KkEEMTJf4uTleCO4=;
        b=t6VoSS+atJwSW2w8E5n4ni6ayWhMuF5Yf7UQO7PtOwmoY7xyLIrTWk51xkyS7MVYfn
         aeANFiFLd/ztOrofHJQFX1cl6k/8+9/iDjwoDMyJiAd19gDyWSWgDqya7vClvh7TIlHi
         3vNI90rGZ3qRwrgZQjMdkr1Ck13xBvBaIPlL3MN1CSgb6JJQIoOypcGjwMqlsoh3u9NA
         axWJ4twov3L8fq6t1USFB/cO95W0uV3VW/yJX7n/O0jOz5Un5ywpMUelSo5kKgejecDQ
         NlQke4i4ar7JPIkcQa6/HgVMr3sPEHfwByCzitkjHRiQpb/Ag8NpybxHl/w7qUaHGkQz
         9uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2xQyMOC62YHwAxLUpdKa9hdFyY7KkEEMTJf4uTleCO4=;
        b=BgTVOUnbzrEjToAfH/dkCfRsAhs+t/1pLmFkde5XBdmvX6IOzlcBEbwjTfgwCW22Jq
         /N7Ztxz4AyFB4N0QwCt7KD/OcgKQsH+gY6eeT0hlb4GK21Z7ipqhtL5OYoiI6IYRprL7
         83UizvOK7vKTIK36pA7cWeyBhka5rVr7NcDUoBODUGUCiAp8JH0d8Jz8MW4+H3vLAvOI
         ooIBuPnbsqyDaaLzfOkx5Wcjm7oymt3NV1esq4fqxmQVfTMUUQjpQYb471zqhfn/+v/k
         bc/aI4NcJaBWVieTlsqVnXo8Ex8fYoGATOziIO3TX08eKDr5MYv3ivr6CLzjU1dGGoLW
         iu1Q==
X-Gm-Message-State: ACgBeo0LmnYlfdVoaim6uTsW9L6hNLIt9o0pYLOP0PvHoaUfzNDK06UV
	scyCwlZf7YHTX7avXpVCUoZ75OCr8dRVkwdd
X-Google-Smtp-Source: 
 AA6agR7Z2yObcWdP/6baEBjTr9dSh3uVUbDN0FmLtBcJX22AoP1jbAE1fuQnBRyYll/ao0rYwLdnmA==
X-Received: by 2002:a17:90b:3e8d:b0:1fa:facf:672f with SMTP id
 rj13-20020a17090b3e8d00b001fafacf672fmr20636812pjb.0.1661806976025;
        Mon, 29 Aug 2022 14:02:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.02.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:02:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] golang: CVE-2022-32189 a denial of service
Date: Mon, 29 Aug 2022 11:02:24 -1000
Message-Id: 
 <9b3420c9a91059eb55754078bb1e733972e94489.1661806803.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170030

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/golang/go
MR: 120634
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/703c8ab7e5ba75c95553d4e249309297abad7102
ChangeID: 3ade323dd52a6b654358f6738a0b3411ccc6d3f8
Description:
	CVE-2022-32189 golang: math/big: decoding big.Float and big.Rat types can panic if the encoded message is too short, potentially allowing a denial of service.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


