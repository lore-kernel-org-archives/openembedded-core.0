Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681AEC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 07:33:34 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.18938.1704440007941297807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 23:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JVTFwMOF;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28cb1286e10so914995a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 23:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704440006; x=1705044806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6FAjhQKz0WOUlTKCl2QgV5Mmqr4l6FGm4EmfZYwUl5w=;
        b=JVTFwMOF/MjQF09VYxeFY2WIe+l/LPlKvrX9sN1JNz8tv5wrSDeluqTUGrPKFivV+G
         nEwfYoxzbmpXFMLnKrlGvW+s2KoJsB3Jkd7KLAMJYNRrj+l/BLY/jQffTH2/37U6UfjH
         rW5khu2GwQJLjJxRUv/QViMpwuxnjKowQIxOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704440006; x=1705044806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FAjhQKz0WOUlTKCl2QgV5Mmqr4l6FGm4EmfZYwUl5w=;
        b=vKToHZnQBRCaRBXsdhJb0/t4z4ib7gVzREebnuPe5YwQ6QSfmzB4rD+0dFnPWrXjqf
         KlZb7Y5KqsvxZMKbY7JW3eCMvu25VuXfugx8ouKu7h/jyoiOEw6CtTcn7hsm56Vldulk
         Ki9dtv/kv/n42M48QTs4KBuBNdYrVu4DpnmMHb7EDPHS7ssvzGPevuBPtWPthmU47OBt
         IcgGb91knMpeT9sw0Ro5GLUPTsjp3m3edkR6NsYLmu4vhjKOMErlfz2Jm+M4S73FajrC
         MNUi2LhvwwvwOIplAamapOHCmym+J8RtfrlrORxw5cMLEMT9RmRDaubJgiWRImKQAetb
         h6zQ==
X-Gm-Message-State: AOJu0Yxsggew4JXSp31E592r0QtZjAM+hBJ5FNhQYhnrsu6648CuNeMo
	ZKUNfygEMUUYv5GxXcasBqiUKbb9ra03U0pY0O+fYgyEysY=
X-Google-Smtp-Source: AGHT+IGxio5FVSHXgHtMMT6nkPkRbsSKhIHbLj1/LzKgVsY+8iFW2BJzgnpmhB/sgLvc6vm+22akzA==
X-Received: by 2002:a17:90a:98e:b0:28c:a45c:5e11 with SMTP id 14-20020a17090a098e00b0028ca45c5e11mr1406394pjo.13.1704440004257;
        Thu, 04 Jan 2024 23:33:24 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb2:b94a:83a:56f4:b572:f5a2])
        by smtp.gmail.com with ESMTPSA id p11-20020a17090ad30b00b0028ca92ab09asm573402pju.56.2024.01.04.23.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 23:33:23 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] go: Backport fix for CVE-2023-45287
Date: Fri,  5 Jan 2024 13:03:14 +0530
Message-Id: <20240105073314.1537646-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 07:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193344

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/golang/go/commit/9baafabac9a84813a336f068862207d2bb06d255
&
https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3
&
https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6807
&
https://github.com/golang/go/commit/8a81fdf165facdcefa06531de5af98a4db343035]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |    4 +
 .../go/go-1.14/CVE-2023-45287-pre1.patch      |  393 ++++
 .../go/go-1.14/CVE-2023-45287-pre2.patch      |  401 ++++
 .../go/go-1.14/CVE-2023-45287-pre3.patch      |   86 +
 .../go/go-1.14/CVE-2023-45287.patch           | 1697 +++++++++++++++++
 5 files changed, 2581 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index b827a3606d..42a9ac8435 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -83,6 +83,10 @@ SRC_URI += "\
     file://CVE-2023-39318.patch \
     file://CVE-2023-39319.patch \
     file://CVE-2023-39326.patch \
+    file://CVE-2023-45287-pre1.patch \
+    file://CVE-2023-45287-pre2.patch \
+    file://CVE-2023-45287-pre3.patch \
+    file://CVE-2023-45287.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
new file mode 100644
index 0000000000..4d65180253
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
@@ -0,0 +1,393 @@
+From 9baafabac9a84813a336f068862207d2bb06d255 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Wed, 1 Apr 2020 17:25:40 -0400
+Subject: [PATCH] crypto/rsa: refactor RSA-PSS signing and verification
+
+Cleaned up for readability and consistency.
+
+There is one tiny behavioral change: when PSSSaltLengthEqualsHash is
+used and both hash and opts.Hash were set, hash.Size() was used for the
+salt length instead of opts.Hash.Size(). That's clearly wrong because
+opts.Hash is documented to override hash.
+
+Change-Id: I3e25dad933961eac827c6d2e3bbfe45fc5a6fb0e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/226937
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/9baafabac9a84813a336f068862207d2bb06d255]
+CVE: CVE-2023-45287 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/rsa/pss.go | 173 ++++++++++++++++++++++--------------------
+ src/crypto/rsa/rsa.go |   9 ++-
+ 2 files changed, 96 insertions(+), 86 deletions(-)
+
+diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
+index 3ff0c2f4d0076..f9844d87329a8 100644
+--- a/src/crypto/rsa/pss.go
++++ b/src/crypto/rsa/pss.go
+@@ -4,9 +4,7 @@
+ 
+ package rsa
+ 
+-// This file implements the PSS signature scheme [1].
+-//
+-// [1] https://www.emc.com/collateral/white-papers/h11300-pkcs-1v2-2-rsa-cryptography-standard-wp.pdf
++// This file implements the RSASSA-PSS signature scheme according to RFC 8017.
+ 
+ import (
+ 	"bytes"
+@@ -17,8 +15,22 @@ import (
+ 	"math/big"
+ )
+ 
++// Per RFC 8017, Section 9.1
++//
++//     EM = MGF1 xor DB || H( 8*0x00 || mHash || salt ) || 0xbc
++//
++// where
++//
++//     DB = PS || 0x01 || salt
++//
++// and PS can be empty so
++//
++//     emLen = dbLen + hLen + 1 = psLen + sLen + hLen + 2
++//
++
+ func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byte, error) {
+-	// See [1], section 9.1.1
++	// See RFC 8017, Section 9.1.1.
++
+ 	hLen := hash.Size()
+ 	sLen := len(salt)
+ 	emLen := (emBits + 7) / 8
+@@ -30,7 +42,7 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byt
+ 	// 2.  Let mHash = Hash(M), an octet string of length hLen.
+ 
+ 	if len(mHash) != hLen {
+-		return nil, errors.New("crypto/rsa: input must be hashed message")
++		return nil, errors.New("crypto/rsa: input must be hashed with given hash")
+ 	}
+ 
+ 	// 3.  If emLen < hLen + sLen + 2, output "encoding error" and stop.
+@@ -40,8 +52,9 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byt
+ 	}
+ 
+ 	em := make([]byte, emLen)
+-	db := em[:emLen-sLen-hLen-2+1+sLen]
+-	h := em[emLen-sLen-hLen-2+1+sLen : emLen-1]
++	psLen := emLen - sLen - hLen - 2
++	db := em[:psLen+1+sLen]
++	h := em[psLen+1+sLen : emLen-1]
+ 
+ 	// 4.  Generate a random octet string salt of length sLen; if sLen = 0,
+ 	//     then salt is the empty string.
+@@ -69,8 +82,8 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byt
+ 	// 8.  Let DB = PS || 0x01 || salt; DB is an octet string of length
+ 	//     emLen - hLen - 1.
+ 
+-	db[emLen-sLen-hLen-2] = 0x01
+-	copy(db[emLen-sLen-hLen-1:], salt)
++	db[psLen] = 0x01
++	copy(db[psLen+1:], salt)
+ 
+ 	// 9.  Let dbMask = MGF(H, emLen - hLen - 1).
+ 	//
+@@ -81,47 +94,57 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byt
+ 	// 11. Set the leftmost 8 * emLen - emBits bits of the leftmost octet in
+ 	//     maskedDB to zero.
+ 
+-	db[0] &= (0xFF >> uint(8*emLen-emBits))
++	db[0] &= 0xff >> (8*emLen - emBits)
+ 
+ 	// 12. Let EM = maskedDB || H || 0xbc.
+-	em[emLen-1] = 0xBC
++	em[emLen-1] = 0xbc
+ 
+ 	// 13. Output EM.
+ 	return em, nil
+ }
+ 
+ func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error {
++	// See RFC 8017, Section 9.1.2.
++
++	hLen := hash.Size()
++	if sLen == PSSSaltLengthEqualsHash {
++		sLen = hLen
++	}
++	emLen := (emBits + 7) / 8
++	if emLen != len(em) {
++		return errors.New("rsa: internal error: inconsistent length")
++	}
++
+ 	// 1.  If the length of M is greater than the input limitation for the
+ 	//     hash function (2^61 - 1 octets for SHA-1), output "inconsistent"
+ 	//     and stop.
+ 	//
+ 	// 2.  Let mHash = Hash(M), an octet string of length hLen.
+-	hLen := hash.Size()
+ 	if hLen != len(mHash) {
+ 		return ErrVerification
+ 	}
+ 
+ 	// 3.  If emLen < hLen + sLen + 2, output "inconsistent" and stop.
+-	emLen := (emBits + 7) / 8
+ 	if emLen < hLen+sLen+2 {
+ 		return ErrVerification
+ 	}
+ 
+ 	// 4.  If the rightmost octet of EM does not have hexadecimal value
+ 	//     0xbc, output "inconsistent" and stop.
+-	if em[len(em)-1] != 0xBC {
++	if em[emLen-1] != 0xbc {
+ 		return ErrVerification
+ 	}
+ 
+ 	// 5.  Let maskedDB be the leftmost emLen - hLen - 1 octets of EM, and
+ 	//     let H be the next hLen octets.
+ 	db := em[:emLen-hLen-1]
+-	h := em[emLen-hLen-1 : len(em)-1]
++	h := em[emLen-hLen-1 : emLen-1]
+ 
+ 	// 6.  If the leftmost 8 * emLen - emBits bits of the leftmost octet in
+ 	//     maskedDB are not all equal to zero, output "inconsistent" and
+ 	//     stop.
+-	if em[0]&(0xFF<<uint(8-(8*emLen-emBits))) != 0 {
++	var bitMask byte = 0xff >> (8*emLen - emBits)
++	if em[0] & ^bitMask != 0 {
+ 		return ErrVerification
+ 	}
+ 
+@@ -132,37 +155,30 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error {
+ 
+ 	// 9.  Set the leftmost 8 * emLen - emBits bits of the leftmost octet in DB
+ 	//     to zero.
+-	db[0] &= (0xFF >> uint(8*emLen-emBits))
++	db[0] &= bitMask
+ 
++	// If we don't know the salt length, look for the 0x01 delimiter.
+ 	if sLen == PSSSaltLengthAuto {
+-	FindSaltLength:
+-		for sLen = emLen - (hLen + 2); sLen >= 0; sLen-- {
+-			switch db[emLen-hLen-sLen-2] {
+-			case 1:
+-				break FindSaltLength
+-			case 0:
+-				continue
+-			default:
+-				return ErrVerification
+-			}
+-		}
+-		if sLen < 0 {
++		psLen := bytes.IndexByte(db, 0x01)
++		if psLen < 0 {
+ 			return ErrVerification
+ 		}
+-	} else {
+-		// 10. If the emLen - hLen - sLen - 2 leftmost octets of DB are not zero
+-		//     or if the octet at position emLen - hLen - sLen - 1 (the leftmost
+-		//     position is "position 1") does not have hexadecimal value 0x01,
+-		//     output "inconsistent" and stop.
+-		for _, e := range db[:emLen-hLen-sLen-2] {
+-			if e != 0x00 {
+-				return ErrVerification
+-			}
+-		}
+-		if db[emLen-hLen-sLen-2] != 0x01 {
++		sLen = len(db) - psLen - 1
++	}
++
++	// 10. If the emLen - hLen - sLen - 2 leftmost octets of DB are not zero
++	//     or if the octet at position emLen - hLen - sLen - 1 (the leftmost
++	//     position is "position 1") does not have hexadecimal value 0x01,
++	//     output "inconsistent" and stop.
++	psLen := emLen - hLen - sLen - 2
++	for _, e := range db[:psLen] {
++		if e != 0x00 {
+ 			return ErrVerification
+ 		}
+ 	}
++	if db[psLen] != 0x01 {
++		return ErrVerification
++	}
+ 
+ 	// 11.  Let salt be the last sLen octets of DB.
+ 	salt := db[len(db)-sLen:]
+@@ -181,19 +197,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error {
+ 	h0 := hash.Sum(nil)
+ 
+ 	// 14. If H = H', output "consistent." Otherwise, output "inconsistent."
+-	if !bytes.Equal(h0, h) {
++	if !bytes.Equal(h0, h) { // TODO: constant time?
+ 		return ErrVerification
+ 	}
+ 	return nil
+ }
+ 
+-// signPSSWithSalt calculates the signature of hashed using PSS [1] with specified salt.
++// signPSSWithSalt calculates the signature of hashed using PSS with specified salt.
+ // Note that hashed must be the result of hashing the input message using the
+ // given hash function. salt is a random sequence of bytes whose length will be
+ // later used to verify the signature.
+ func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) (s []byte, err error) {
+-	nBits := priv.N.BitLen()
+-	em, err := emsaPSSEncode(hashed, nBits-1, salt, hash.New())
++	emBits := priv.N.BitLen() - 1
++	em, err := emsaPSSEncode(hashed, emBits, salt, hash.New())
+ 	if err != nil {
+ 		return
+ 	}
+@@ -202,7 +218,7 @@ func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed,
+ 	if err != nil {
+ 		return
+ 	}
+-	s = make([]byte, (nBits+7)/8)
++	s = make([]byte, priv.Size())
+ 	copyWithLeftPad(s, c.Bytes())
+ 	return
+ }
+@@ -223,16 +239,15 @@ type PSSOptions struct {
+ 	// PSSSaltLength constants.
+ 	SaltLength int
+ 
+-	// Hash, if not zero, overrides the hash function passed to SignPSS.
+-	// This is the only way to specify the hash function when using the
+-	// crypto.Signer interface.
++	// Hash is the hash function used to generate the message digest. If not
++	// zero, it overrides the hash function passed to SignPSS. It's required
++	// when using PrivateKey.Sign.
+ 	Hash crypto.Hash
+ }
+ 
+-// HashFunc returns pssOpts.Hash so that PSSOptions implements
+-// crypto.SignerOpts.
+-func (pssOpts *PSSOptions) HashFunc() crypto.Hash {
+-	return pssOpts.Hash
++// HashFunc returns opts.Hash so that PSSOptions implements crypto.SignerOpts.
++func (opts *PSSOptions) HashFunc() crypto.Hash {
++	return opts.Hash
+ }
+ 
+ func (opts *PSSOptions) saltLength() int {
+@@ -242,56 +257,50 @@ func (opts *PSSOptions) saltLength() int {
+ 	return opts.SaltLength
+ }
+ 
+-// SignPSS calculates the signature of hashed using RSASSA-PSS [1].
+-// Note that hashed must be the result of hashing the input message using the
+-// given hash function. The opts argument may be nil, in which case sensible
+-// defaults are used.
+-func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed []byte, opts *PSSOptions) ([]byte, error) {
++// SignPSS calculates the signature of digest using PSS.
++//
++// digest must be the result of hashing the input message using the given hash
++// function. The opts argument may be nil, in which case sensible defaults are
++// used. If opts.Hash is set, it overrides hash.
++func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte, opts *PSSOptions) ([]byte, error) {
++	if opts != nil && opts.Hash != 0 {
++		hash = opts.Hash
++	}
++
+ 	saltLength := opts.saltLength()
+ 	switch saltLength {
+ 	case PSSSaltLengthAuto:
+-		saltLength = (priv.N.BitLen()+7)/8 - 2 - hash.Size()
++		saltLength = priv.Size() - 2 - hash.Size()
+ 	case PSSSaltLengthEqualsHash:
+ 		saltLength = hash.Size()
+ 	}
+ 
+-	if opts != nil && opts.Hash != 0 {
+-		hash = opts.Hash
+-	}
+-
+ 	salt := make([]byte, saltLength)
+ 	if _, err := io.ReadFull(rand, salt); err != nil {
+ 		return nil, err
+ 	}
+-	return signPSSWithSalt(rand, priv, hash, hashed, salt)
++	return signPSSWithSalt(rand, priv, hash, digest, salt)
+ }
+ 
+ // VerifyPSS verifies a PSS signature.
+-// hashed is the result of hashing the input message using the given hash
+-// function and sig is the signature. A valid signature is indicated by
+-// returning a nil error. The opts argument may be nil, in which case sensible
+-// defaults are used.
+-func VerifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte, opts *PSSOptions) error {
+-	return verifyPSS(pub, hash, hashed, sig, opts.saltLength())
+-}
+-
+-// verifyPSS verifies a PSS signature with the given salt length.
+-func verifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte, saltLen int) error {
+-	nBits := pub.N.BitLen()
+-	if len(sig) != (nBits+7)/8 {
++//
++// A valid signature is indicated by returning a nil error. digest must be the
++// result of hashing the input message using the given hash function. The opts
++// argument may be nil, in which case sensible defaults are used. opts.Hash is
++// ignored.
++func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []byte, opts *PSSOptions) error {
++	if len(sig) != pub.Size() {
+ 		return ErrVerification
+ 	}
+ 	s := new(big.Int).SetBytes(sig)
+ 	m := encrypt(new(big.Int), pub, s)
+-	emBits := nBits - 1
++	emBits := pub.N.BitLen() - 1
+ 	emLen := (emBits + 7) / 8
+-	if emLen < len(m.Bytes()) {
++	emBytes := m.Bytes()
++	if emLen < len(emBytes) {
+ 		return ErrVerification
+ 	}
+ 	em := make([]byte, emLen)
+-	copyWithLeftPad(em, m.Bytes())
+-	if saltLen == PSSSaltLengthEqualsHash {
+-		saltLen = hash.Size()
+-	}
+-	return emsaPSSVerify(hashed, em, emBits, saltLen, hash.New())
++	copyWithLeftPad(em, emBytes)
++	return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.New())
+ }
+diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
+index 5a42990640164..b4bfa13defbdf 100644
+--- a/src/crypto/rsa/rsa.go
++++ b/src/crypto/rsa/rsa.go
+@@ -2,7 +2,7 @@
+ // Use of this source code is governed by a BSD-style
+ // license that can be found in the LICENSE file.
+ 
+-// Package rsa implements RSA encryption as specified in PKCS#1.
++// Package rsa implements RSA encryption as specified in PKCS#1 and RFC 8017.
+ //
+ // RSA is a single, fundamental operation that is used in this package to
+ // implement either public-key encryption or public-key signatures.
+@@ -10,13 +10,13 @@
+ // The original specification for encryption and signatures with RSA is PKCS#1
+ // and the terms "RSA encryption" and "RSA signatures" by default refer to
+ // PKCS#1 version 1.5. However, that specification has flaws and new designs
+-// should use version two, usually called by just OAEP and PSS, where
++// should use version 2, usually called by just OAEP and PSS, where
+ // possible.
+ //
+ // Two sets of interfaces are included in this package. When a more abstract
+ // interface isn't necessary, there are functions for encrypting/decrypting
+ // with v1.5/OAEP and signing/verifying with v1.5/PSS. If one needs to abstract
+-// over the public-key primitive, the PrivateKey struct implements the
++// over the public key primitive, the PrivateKey type implements the
+ // Decrypter and Signer interfaces from the crypto package.
+ //
+ // The RSA operations in this package are not implemented using constant-time algorithms.
+@@ -111,7 +111,8 @@ func (priv *PrivateKey) Public() crypto.PublicKey {
+ 
+ // Sign signs digest with priv, reading randomness from rand. If opts is a
+ // *PSSOptions then the PSS algorithm will be used, otherwise PKCS#1 v1.5 will
+-// be used.
++// be used. digest must be the result of hashing the input message using
++// opts.HashFunc().
+ //
+ // This method implements crypto.Signer, which is an interface to support keys
+ // where the private part is kept in, for example, a hardware module. Common
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
new file mode 100644
index 0000000000..1327b44545
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
@@ -0,0 +1,401 @@
+From c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Mon, 27 Apr 2020 21:52:38 -0400
+Subject: [PATCH] math/big: add (*Int).FillBytes
+
+Replaced almost every use of Bytes with FillBytes.
+
+Note that the approved proposal was for
+
+    func (*Int) FillBytes(buf []byte)
+
+while this implements
+
+    func (*Int) FillBytes(buf []byte) []byte
+
+because the latter was far nicer to use in all callsites.
+
+Fixes #35833
+
+Change-Id: Ia912df123e5d79b763845312ea3d9a8051343c0a
+Reviewed-on: https://go-review.googlesource.com/c/go/+/230397
+Reviewed-by: Robert Griesemer <gri@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3]
+CVE: CVE-2023-45287 #Dependency Patch2
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/elliptic/elliptic.go | 13 ++++----
+ src/crypto/rsa/pkcs1v15.go      | 20 +++---------
+ src/crypto/rsa/pss.go           | 17 +++++------
+ src/crypto/rsa/rsa.go           | 32 +++----------------
+ src/crypto/tls/key_schedule.go  |  7 ++---
+ src/crypto/x509/sec1.go         |  7 ++---
+ src/math/big/int.go             | 15 +++++++++
+ src/math/big/int_test.go        | 54 +++++++++++++++++++++++++++++++++
+ src/math/big/nat.go             | 15 ++++++---
+ 9 files changed, 106 insertions(+), 74 deletions(-)
+
+diff --git a/src/crypto/elliptic/elliptic.go b/src/crypto/elliptic/elliptic.go
+index e2f71cdb63bab..bd5168c5fd842 100644
+--- a/src/crypto/elliptic/elliptic.go
++++ b/src/crypto/elliptic/elliptic.go
+@@ -277,7 +277,7 @@ var mask = []byte{0xff, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f}
+ func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error) {
+ 	N := curve.Params().N
+ 	bitSize := N.BitLen()
+-	byteLen := (bitSize + 7) >> 3
++	byteLen := (bitSize + 7) / 8
+ 	priv = make([]byte, byteLen)
+ 
+ 	for x == nil {
+@@ -304,15 +304,14 @@ func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err e
+ 
+ // Marshal converts a point into the uncompressed form specified in section 4.3.6 of ANSI X9.62.
+ func Marshal(curve Curve, x, y *big.Int) []byte {
+-	byteLen := (curve.Params().BitSize + 7) >> 3
++	byteLen := (curve.Params().BitSize + 7) / 8
+ 
+ 	ret := make([]byte, 1+2*byteLen)
+ 	ret[0] = 4 // uncompressed point
+ 
+-	xBytes := x.Bytes()
+-	copy(ret[1+byteLen-len(xBytes):], xBytes)
+-	yBytes := y.Bytes()
+-	copy(ret[1+2*byteLen-len(yBytes):], yBytes)
++	x.FillBytes(ret[1 : 1+byteLen])
++	y.FillBytes(ret[1+byteLen : 1+2*byteLen])
++
+ 	return ret
+ }
+ 
+@@ -320,7 +319,7 @@ func Marshal(curve Curve, x, y *big.Int) []byte {
+ // It is an error if the point is not in uncompressed form or is not on the curve.
+ // On error, x = nil.
+ func Unmarshal(curve Curve, data []byte) (x, y *big.Int) {
+-	byteLen := (curve.Params().BitSize + 7) >> 3
++	byteLen := (curve.Params().BitSize + 7) / 8
+ 	if len(data) != 1+2*byteLen {
+ 		return
+ 	}
+diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
+index 499242ffc5b57..3208119ae1ff4 100644
+--- a/src/crypto/rsa/pkcs1v15.go
++++ b/src/crypto/rsa/pkcs1v15.go
+@@ -61,8 +61,7 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey, msg []byte) ([]byte, error)
+ 	m := new(big.Int).SetBytes(em)
+ 	c := encrypt(new(big.Int), pub, m)
+ 
+-	copyWithLeftPad(em, c.Bytes())
+-	return em, nil
++	return c.FillBytes(em), nil
+ }
+ 
+ // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding scheme from PKCS#1 v1.5.
+@@ -150,7 +149,7 @@ func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) (valid
+ 		return
+ 	}
+ 
+-	em = leftPad(m.Bytes(), k)
++	em = m.FillBytes(make([]byte, k))
+ 	firstByteIsZero := subtle.ConstantTimeByteEq(em[0], 0)
+ 	secondByteIsTwo := subtle.ConstantTimeByteEq(em[1], 2)
+ 
+@@ -256,8 +255,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed []b
+ 		return nil, err
+ 	}
+ 
+-	copyWithLeftPad(em, c.Bytes())
+-	return em, nil
++	return c.FillBytes(em), nil
+ }
+ 
+ // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.
+@@ -286,7 +284,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte)
+ 
+ 	c := new(big.Int).SetBytes(sig)
+ 	m := encrypt(new(big.Int), pub, c)
+-	em := leftPad(m.Bytes(), k)
++	em := m.FillBytes(make([]byte, k))
+ 	// EM = 0x00 || 0x01 || PS || 0x00 || T
+ 
+ 	ok := subtle.ConstantTimeByteEq(em[0], 0)
+@@ -323,13 +321,3 @@ func pkcs1v15HashInfo(hash crypto.Hash, inLen int) (hashLen int, prefix []byte,
+ 	}
+ 	return
+ }
+-
+-// copyWithLeftPad copies src to the end of dest, padding with zero bytes as
+-// needed.
+-func copyWithLeftPad(dest, src []byte) {
+-	numPaddingBytes := len(dest) - len(src)
+-	for i := 0; i < numPaddingBytes; i++ {
+-		dest[i] = 0
+-	}
+-	copy(dest[numPaddingBytes:], src)
+-}
+diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
+index f9844d87329a8..b2adbedb28fa8 100644
+--- a/src/crypto/rsa/pss.go
++++ b/src/crypto/rsa/pss.go
+@@ -207,20 +207,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error {
+ // Note that hashed must be the result of hashing the input message using the
+ // given hash function. salt is a random sequence of bytes whose length will be
+ // later used to verify the signature.
+-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) (s []byte, err error) {
++func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) ([]byte, error) {
+ 	emBits := priv.N.BitLen() - 1
+ 	em, err := emsaPSSEncode(hashed, emBits, salt, hash.New())
+ 	if err != nil {
+-		return
++		return nil, err
+ 	}
+ 	m := new(big.Int).SetBytes(em)
+ 	c, err := decryptAndCheck(rand, priv, m)
+ 	if err != nil {
+-		return
++		return nil, err
+ 	}
+-	s = make([]byte, priv.Size())
+-	copyWithLeftPad(s, c.Bytes())
+-	return
++	s := make([]byte, priv.Size())
++	return c.FillBytes(s), nil
+ }
+ 
+ const (
+@@ -296,11 +295,9 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []byte, opts
+ 	m := encrypt(new(big.Int), pub, s)
+ 	emBits := pub.N.BitLen() - 1
+ 	emLen := (emBits + 7) / 8
+-	emBytes := m.Bytes()
+-	if emLen < len(emBytes) {
++	if m.BitLen() > emLen*8 {
+ 		return ErrVerification
+ 	}
+-	em := make([]byte, emLen)
+-	copyWithLeftPad(em, emBytes)
++	em := m.FillBytes(make([]byte, emLen))
+ 	return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.New())
+ }
+diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
+index b4bfa13defbdf..28eb5926c1a54 100644
+--- a/src/crypto/rsa/rsa.go
++++ b/src/crypto/rsa/rsa.go
+@@ -416,16 +416,9 @@ func EncryptOAEP(hash hash.Hash, random io.Reader, pub *PublicKey, msg []byte, l
+ 	m := new(big.Int)
+ 	m.SetBytes(em)
+ 	c := encrypt(new(big.Int), pub, m)
+-	out := c.Bytes()
+ 
+-	if len(out) < k {
+-		// If the output is too small, we need to left-pad with zeros.
+-		t := make([]byte, k)
+-		copy(t[k-len(out):], out)
+-		out = t
+-	}
+-
+-	return out, nil
++	out := make([]byte, k)
++	return c.FillBytes(out), nil
+ }
+ 
+ // ErrDecryption represents a failure to decrypt a message.
+@@ -597,12 +590,9 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext
+ 	lHash := hash.Sum(nil)
+ 	hash.Reset()
+ 
+-	// Converting the plaintext number to bytes will strip any
+-	// leading zeros so we may have to left pad. We do this unconditionally
+-	// to avoid leaking timing information. (Although we still probably
+-	// leak the number of leading zeros. It's not clear that we can do
+-	// anything about this.)
+-	em := leftPad(m.Bytes(), k)
++	// We probably leak the number of leading zeros.
++	// It's not clear that we can do anything about this.
++	em := m.FillBytes(make([]byte, k))
+ 
+ 	firstByteIsZero := subtle.ConstantTimeByteEq(em[0], 0)
+ 
+@@ -643,15 +633,3 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext
+ 
+ 	return rest[index+1:], nil
+ }
+-
+-// leftPad returns a new slice of length size. The contents of input are right
+-// aligned in the new slice.
+-func leftPad(input []byte, size int) (out []byte) {
+-	n := len(input)
+-	if n > size {
+-		n = size
+-	}
+-	out = make([]byte, size)
+-	copy(out[len(out)-n:], input)
+-	return
+-}
+diff --git a/src/crypto/tls/key_schedule.go b/src/crypto/tls/key_schedule.go
+index 2aab323202f7d..314016979afb8 100644
+--- a/src/crypto/tls/key_schedule.go
++++ b/src/crypto/tls/key_schedule.go
+@@ -173,11 +173,8 @@ func (p *nistParameters) SharedKey(peerPublicKey []byte) []byte {
+ 	}
+ 
+ 	xShared, _ := curve.ScalarMult(x, y, p.privateKey)
+-	sharedKey := make([]byte, (curve.Params().BitSize+7)>>3)
+-	xBytes := xShared.Bytes()
+-	copy(sharedKey[len(sharedKey)-len(xBytes):], xBytes)
+-
+-	return sharedKey
++	sharedKey := make([]byte, (curve.Params().BitSize+7)/8)
++	return xShared.FillBytes(sharedKey)
+ }
+ 
+ type x25519Parameters struct {
+diff --git a/src/crypto/x509/sec1.go b/src/crypto/x509/sec1.go
+index 0bfb90cd5464a..52c108ff1d624 100644
+--- a/src/crypto/x509/sec1.go
++++ b/src/crypto/x509/sec1.go
+@@ -52,13 +52,10 @@ func MarshalECPrivateKey(key *ecdsa.PrivateKey) ([]byte, error) {
+ // marshalECPrivateKey marshals an EC private key into ASN.1, DER format and
+ // sets the curve ID to the given OID, or omits it if OID is nil.
+ func marshalECPrivateKeyWithOID(key *ecdsa.PrivateKey, oid asn1.ObjectIdentifier) ([]byte, error) {
+-	privateKeyBytes := key.D.Bytes()
+-	paddedPrivateKey := make([]byte, (key.Curve.Params().N.BitLen()+7)/8)
+-	copy(paddedPrivateKey[len(paddedPrivateKey)-len(privateKeyBytes):], privateKeyBytes)
+-
++	privateKey := make([]byte, (key.Curve.Params().N.BitLen()+7)/8)
+ 	return asn1.Marshal(ecPrivateKey{
+ 		Version:       1,
+-		PrivateKey:    paddedPrivateKey,
++		PrivateKey:    key.D.FillBytes(privateKey),
+ 		NamedCurveOID: oid,
+ 		PublicKey:     asn1.BitString{Bytes: elliptic.Marshal(key.Curve, key.X, key.Y)},
+ 	})
+diff --git a/src/math/big/int.go b/src/math/big/int.go
+index 8816cf5266cc4..65f32487b58c0 100644
+--- a/src/math/big/int.go
++++ b/src/math/big/int.go
+@@ -447,11 +447,26 @@ func (z *Int) SetBytes(buf []byte) *Int {
+ }
+ 
+ // Bytes returns the absolute value of x as a big-endian byte slice.
++//
++// To use a fixed length slice, or a preallocated one, use FillBytes.
+ func (x *Int) Bytes() []byte {
+ 	buf := make([]byte, len(x.abs)*_S)
+ 	return buf[x.abs.bytes(buf):]
+ }
+ 
++// FillBytes sets buf to the absolute value of x, storing it as a zero-extended
++// big-endian byte slice, and returns buf.
++//
++// If the absolute value of x doesn't fit in buf, FillBytes will panic.
++func (x *Int) FillBytes(buf []byte) []byte {
++	// Clear whole buffer. (This gets optimized into a memclr.)
++	for i := range buf {
++		buf[i] = 0
++	}
++	x.abs.bytes(buf)
++	return buf
++}
++
+ // BitLen returns the length of the absolute value of x in bits.
+ // The bit length of 0 is 0.
+ func (x *Int) BitLen() int {
+diff --git a/src/math/big/int_test.go b/src/math/big/int_test.go
+index e3a1587b3f0ad..3c8557323a032 100644
+--- a/src/math/big/int_test.go
++++ b/src/math/big/int_test.go
+@@ -1840,3 +1840,57 @@ func BenchmarkDiv(b *testing.B) {
+ 		})
+ 	}
+ }
++
++func TestFillBytes(t *testing.T) {
++	checkResult := func(t *testing.T, buf []byte, want *Int) {
++		t.Helper()
++		got := new(Int).SetBytes(buf)
++		if got.CmpAbs(want) != 0 {
++			t.Errorf("got 0x%x, want 0x%x: %x", got, want, buf)
++		}
++	}
++	panics := func(f func()) (panic bool) {
++		defer func() { panic = recover() != nil }()
++		f()
++		return
++	}
++
++	for _, n := range []string{
++		"0",
++		"1000",
++		"0xffffffff",
++		"-0xffffffff",
++		"0xffffffffffffffff",
++		"0x10000000000000000",
++		"0xabababababababababababababababababababababababababa",
++		"0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
++	} {
++		t.Run(n, func(t *testing.T) {
++			t.Logf(n)
++			x, ok := new(Int).SetString(n, 0)
++			if !ok {
++				panic("invalid test entry")
++			}
++
++			// Perfectly sized buffer.
++			byteLen := (x.BitLen() + 7) / 8
++			buf := make([]byte, byteLen)
++			checkResult(t, x.FillBytes(buf), x)
++
++			// Way larger, checking all bytes get zeroed.
++			buf = make([]byte, 100)
++			for i := range buf {
++				buf[i] = 0xff
++			}
++			checkResult(t, x.FillBytes(buf), x)
++
++			// Too small.
++			if byteLen > 0 {
++				buf = make([]byte, byteLen-1)
++				if !panics(func() { x.FillBytes(buf) }) {
++					t.Errorf("expected panic for small buffer and value %x", x)
++				}
++			}
++		})
++	}
++}
+diff --git a/src/math/big/nat.go b/src/math/big/nat.go
+index c31ec5156b81d..6a3989bf9d82b 100644
+--- a/src/math/big/nat.go
++++ b/src/math/big/nat.go
+@@ -1476,19 +1476,26 @@ func (z nat) expNNMontgomery(x, y, m nat) nat {
+ }
+ 
+ // bytes writes the value of z into buf using big-endian encoding.
+-// len(buf) must be >= len(z)*_S. The value of z is encoded in the
+-// slice buf[i:]. The number i of unused bytes at the beginning of
+-// buf is returned as result.
++// The value of z is encoded in the slice buf[i:]. If the value of z
++// cannot be represented in buf, bytes panics. The number i of unused
++// bytes at the beginning of buf is returned as result.
+ func (z nat) bytes(buf []byte) (i int) {
+ 	i = len(buf)
+ 	for _, d := range z {
+ 		for j := 0; j < _S; j++ {
+ 			i--
+-			buf[i] = byte(d)
++			if i >= 0 {
++				buf[i] = byte(d)
++			} else if byte(d) != 0 {
++				panic("math/big: buffer too small to fit value")
++			}
+ 			d >>= 8
+ 		}
+ 	}
+ 
++	if i < 0 {
++		i = 0
++	}
+ 	for i < len(buf) && buf[i] == 0 {
+ 		i++
+ 	}
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
new file mode 100644
index 0000000000..ae9fcc170c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
@@ -0,0 +1,86 @@
+From 8f676144ad7b7c91adb0c6e1ec89aaa6283c6807 Mon Sep 17 00:00:00 2001
+From: Himanshu Kishna Srivastava <28himanshu@gmail.com>
+Date: Tue, 16 Mar 2021 22:37:46 +0530
+Subject: [PATCH] crypto/rsa: fix salt length calculation with
+ PSSSaltLengthAuto
+
+When PSSSaltLength is set, the maximum salt length must equal:
+
+    (modulus_key_size - 1 + 7)/8 - hash_length - 2
+and for example, with a 4096 bit modulus key, and a SHA-1 hash,
+it should be:
+
+     (4096 -1 + 7)/8 - 20 - 2 = 490
+Previously we'd encounter this error:
+
+     crypto/rsa: key size too small for PSS signature
+
+Fixes #42741
+
+Change-Id: I18bb82c41c511d564b3f4c443f4b3a38ab010ac5
+Reviewed-on: https://go-review.googlesource.com/c/go/+/302230
+Reviewed-by: Emmanuel Odeke <emmanuel@orijtech.com>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+Trust: Emmanuel Odeke <emmanuel@orijtech.com>
+Run-TryBot: Emmanuel Odeke <emmanuel@orijtech.com>
+TryBot-Result: Go Bot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6807]
+CVE: CVE-2023-45287 #Dependency Patch3
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/rsa/pss.go      |  2 +-
+ src/crypto/rsa/pss_test.go | 20 +++++++++++++++++++-
+ 2 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
+index b2adbedb28fa8..814522de8181f 100644
+--- a/src/crypto/rsa/pss.go
++++ b/src/crypto/rsa/pss.go
+@@ -269,7 +269,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte,
+ 	saltLength := opts.saltLength()
+ 	switch saltLength {
+ 	case PSSSaltLengthAuto:
+-		saltLength = priv.Size() - 2 - hash.Size()
++		saltLength = (priv.N.BitLen()-1+7)/8 - 2 - hash.Size()
+ 	case PSSSaltLengthEqualsHash:
+ 		saltLength = hash.Size()
+ 	}
+diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
+index dfa8d8bb5ad02..c3a6d468497cd 100644
+--- a/src/crypto/rsa/pss_test.go
++++ b/src/crypto/rsa/pss_test.go
+@@ -12,7 +12,7 @@ import (
+ 	_ "crypto/md5"
+ 	"crypto/rand"
+ 	"crypto/sha1"
+-	_ "crypto/sha256"
++	"crypto/sha256"
+ 	"encoding/hex"
+ 	"math/big"
+ 	"os"
+@@ -233,6 +233,24 @@ func TestPSSSigning(t *testing.T) {
+ 	}
+ }
+ 
++func TestSignWithPSSSaltLengthAuto(t *testing.T) {
++	key, err := GenerateKey(rand.Reader, 513)
++	if err != nil {
++		t.Fatal(err)
++	}
++	digest := sha256.Sum256([]byte("message"))
++	signature, err := key.Sign(rand.Reader, digest[:], &PSSOptions{
++		SaltLength: PSSSaltLengthAuto,
++		Hash:       crypto.SHA256,
++	})
++	if err != nil {
++		t.Fatal(err)
++	}
++	if len(signature) == 0 {
++		t.Fatal("empty signature returned")
++	}
++}
++
+ func bigFromHex(hex string) *big.Int {
+ 	n, ok := new(big.Int).SetString(hex, 16)
+ 	if !ok {
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
new file mode 100644
index 0000000000..a62c1258f8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
@@ -0,0 +1,1697 @@
+From 8a81fdf165facdcefa06531de5af98a4db343035 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?L=C3=BAc=C3=A1s=20Meier?= <cronokirby@gmail.com>
+Date: Tue, 8 Jun 2021 21:36:06 +0200
+Subject: [PATCH] crypto/rsa: replace big.Int for encryption and decryption
+
+Infamously, big.Int does not provide constant-time arithmetic, making
+its use in cryptographic code quite tricky. RSA uses big.Int
+pervasively, in its public API, for key generation, precomputation, and
+for encryption and decryption. This is a known problem. One mitigation,
+blinding, is already in place during decryption. This helps mitigate the
+very leaky exponentiation operation. Because big.Int is fundamentally
+not constant-time, it's unfortunately difficult to guarantee that
+mitigations like these are completely effective.
+
+This patch removes the use of big.Int for encryption and decryption,
+replacing it with an internal nat type instead. Signing and verification
+are also affected, because they depend on encryption and decryption.
+
+Overall, this patch degrades performance by 55% for private key
+operations, and 4-5x for (much faster) public key operations.
+(Signatures do both, so the slowdown is worse than decryption.)
+
+name                    old time/op  new time/op    delta
+DecryptPKCS1v15/2048-8  1.50ms ± 0%    2.34ms ± 0%    +56.44%  (p=0.000 n=8+10)
+DecryptPKCS1v15/3072-8  4.40ms ± 0%    6.79ms ± 0%    +54.33%  (p=0.000 n=10+9)
+DecryptPKCS1v15/4096-8  9.31ms ± 0%   15.14ms ± 0%    +62.60%  (p=0.000 n=10+10)
+EncryptPKCS1v15/2048-8  8.16µs ± 0%  355.58µs ± 0%  +4258.90%  (p=0.000 n=10+9)
+DecryptOAEP/2048-8      1.50ms ± 0%    2.34ms ± 0%    +55.68%  (p=0.000 n=10+9)
+EncryptOAEP/2048-8      8.51µs ± 0%  355.95µs ± 0%  +4082.75%  (p=0.000 n=10+9)
+SignPKCS1v15/2048-8     1.51ms ± 0%    2.69ms ± 0%    +77.94%  (p=0.000 n=10+10)
+VerifyPKCS1v15/2048-8   7.25µs ± 0%  354.34µs ± 0%  +4789.52%  (p=0.000 n=9+9)
+SignPSS/2048-8          1.51ms ± 0%    2.70ms ± 0%    +78.80%  (p=0.000 n=9+10)
+VerifyPSS/2048-8        8.27µs ± 1%  355.65µs ± 0%  +4199.39%  (p=0.000 n=10+10)
+
+Keep in mind that this is without any assembly at all, and that further
+improvements are likely possible. I think having a review of the logic
+and the cryptography would be a good idea at this stage, before we
+complicate the code too much through optimization.
+
+The bulk of the work is in nat.go. This introduces two new types: nat,
+representing natural numbers, and modulus, representing moduli used in
+modular arithmetic.
+
+A nat has an "announced size", which may be larger than its "true size",
+the number of bits needed to represent this number. Operations on a nat
+will only ever leak its announced size, never its true size, or other
+information about its value. The size of a nat is always clear based on
+how its value is set. For example, x.mod(y, m) will make the announced
+size of x match that of m, since x is reduced modulo m.
+
+Operations assume that the announced size of the operands match what's
+expected (with a few exceptions). For example, x.modAdd(y, m) assumes
+that x and y have the same announced size as m, and that they're reduced
+modulo m.
+
+Nats are represented over unsatured bits.UintSize - 1 bit limbs. This
+means that we can't reuse the assembly routines for big.Int, which use
+saturated bits.UintSize limbs. The advantage of unsaturated limbs is
+that it makes Montgomery multiplication faster, by needing fewer
+registers in a hot loop. This makes exponentiation faster, which
+consists of many Montgomery multiplications.
+
+Moduli use nat internally. Unlike nat, the true size of a modulus always
+matches its announced size. When creating a modulus, any zero padding is
+removed. Moduli will also precompute constants when created, which is
+another reason why having a separate type is desirable.
+
+Updates #20654
+
+Co-authored-by: Filippo Valsorda <filippo@golang.org>
+Change-Id: I73b61f87d58ab912e80a9644e255d552cbadcced
+Reviewed-on: https://go-review.googlesource.com/c/go/+/326012
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Joedian Reid <joedian@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/8a81fdf165facdcefa06531de5af98a4db343035]
+CVE: CVE-2023-45287
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/rsa/example_test.go |  21 +-
+ src/crypto/rsa/nat.go          | 626 +++++++++++++++++++++++++++++++++
+ src/crypto/rsa/nat_test.go     | 384 ++++++++++++++++++++
+ src/crypto/rsa/pkcs1v15.go     |  47 +--
+ src/crypto/rsa/pss.go          |  50 ++-
+ src/crypto/rsa/pss_test.go     |  10 +-
+ src/crypto/rsa/rsa.go          | 174 ++++-----
+ 7 files changed, 1143 insertions(+), 169 deletions(-)
+ create mode 100644 src/crypto/rsa/nat.go
+ create mode 100644 src/crypto/rsa/nat_test.go
+
+diff --git a/src/crypto/rsa/example_test.go b/src/crypto/rsa/example_test.go
+index 1435b70..1963609 100644
+--- a/src/crypto/rsa/example_test.go
++++ b/src/crypto/rsa/example_test.go
+@@ -12,7 +12,6 @@ import (
+ 	"crypto/sha256"
+ 	"encoding/hex"
+ 	"fmt"
+-	"io"
+ 	"os"
+ )
+ 
+@@ -36,21 +35,17 @@ import (
+ // a buffer that contains a random key. Thus, if the RSA result isn't
+ // well-formed, the implementation uses a random key in constant time.
+ func ExampleDecryptPKCS1v15SessionKey() {
+-	// crypto/rand.Reader is a good source of entropy for blinding the RSA
+-	// operation.
+-	rng := rand.Reader
+-
+ 	// The hybrid scheme should use at least a 16-byte symmetric key. Here
+ 	// we read the random key that will be used if the RSA decryption isn't
+ 	// well-formed.
+ 	key := make([]byte, 32)
+-	if _, err := io.ReadFull(rng, key); err != nil {
++	if _, err := rand.Read(key); err != nil {
+ 		panic("RNG failure")
+ 	}
+ 
+ 	rsaCiphertext, _ := hex.DecodeString("aabbccddeeff")
+ 
+-	if err := DecryptPKCS1v15SessionKey(rng, rsaPrivateKey, rsaCiphertext, key); err != nil {
++	if err := DecryptPKCS1v15SessionKey(nil, rsaPrivateKey, rsaCiphertext, key); err != nil {
+ 		// Any errors that result will be “public” – meaning that they
+ 		// can be determined without any secret information. (For
+ 		// instance, if the length of key is impossible given the RSA
+@@ -86,10 +81,6 @@ func ExampleDecryptPKCS1v15SessionKey() {
+ }
+ 
+ func ExampleSignPKCS1v15() {
+-	// crypto/rand.Reader is a good source of entropy for blinding the RSA
+-	// operation.
+-	rng := rand.Reader
+-
+ 	message := []byte("message to be signed")
+ 
+ 	// Only small messages can be signed directly; thus the hash of a
+@@ -99,7 +90,7 @@ func ExampleSignPKCS1v15() {
+ 	// of writing (2016).
+ 	hashed := sha256.Sum256(message)
+ 
+-	signature, err := SignPKCS1v15(rng, rsaPrivateKey, crypto.SHA256, hashed[:])
++	signature, err := SignPKCS1v15(nil, rsaPrivateKey, crypto.SHA256, hashed[:])
+ 	if err != nil {
+ 		fmt.Fprintf(os.Stderr, "Error from signing: %s\n", err)
+ 		return
+@@ -151,11 +142,7 @@ func ExampleDecryptOAEP() {
+ 	ciphertext, _ := hex.DecodeString("4d1ee10e8f286390258c51a5e80802844c3e6358ad6690b7285218a7c7ed7fc3a4c7b950fbd04d4b0239cc060dcc7065ca6f84c1756deb71ca5685cadbb82be025e16449b905c568a19c088a1abfad54bf7ecc67a7df39943ec511091a34c0f2348d04e058fcff4d55644de3cd1d580791d4524b92f3e91695582e6e340a1c50b6c6d78e80b4e42c5b4d45e479b492de42bbd39cc642ebb80226bb5200020d501b24a37bcc2ec7f34e596b4fd6b063de4858dbf5a4e3dd18e262eda0ec2d19dbd8e890d672b63d368768360b20c0b6b8592a438fa275e5fa7f60bef0dd39673fd3989cc54d2cb80c08fcd19dacbc265ee1c6014616b0e04ea0328c2a04e73460")
+ 	label := []byte("orders")
+ 
+-	// crypto/rand.Reader is a good source of entropy for blinding the RSA
+-	// operation.
+-	rng := rand.Reader
+-
+-	plaintext, err := DecryptOAEP(sha256.New(), rng, test2048Key, ciphertext, label)
++	plaintext, err := DecryptOAEP(sha256.New(), nil, test2048Key, ciphertext, label)
+ 	if err != nil {
+ 		fmt.Fprintf(os.Stderr, "Error from decryption: %s\n", err)
+ 		return
+diff --git a/src/crypto/rsa/nat.go b/src/crypto/rsa/nat.go
+new file mode 100644
+index 0000000..da521c2
+--- /dev/null
++++ b/src/crypto/rsa/nat.go
+@@ -0,0 +1,626 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package rsa
++
++import (
++	"math/big"
++	"math/bits"
++)
++
++const (
++	// _W is the number of bits we use for our limbs.
++	_W = bits.UintSize - 1
++	// _MASK selects _W bits from a full machine word.
++	_MASK = (1 << _W) - 1
++)
++
++// choice represents a constant-time boolean. The value of choice is always
++// either 1 or 0. We use an int instead of bool in order to make decisions in
++// constant time by turning it into a mask.
++type choice uint
++
++func not(c choice) choice { return 1 ^ c }
++
++const yes = choice(1)
++const no = choice(0)
++
++// ctSelect returns x if on == 1, and y if on == 0. The execution time of this
++// function does not depend on its inputs. If on is any value besides 1 or 0,
++// the result is undefined.
++func ctSelect(on choice, x, y uint) uint {
++	// When on == 1, mask is 0b111..., otherwise mask is 0b000...
++	mask := -uint(on)
++	// When mask is all zeros, we just have y, otherwise, y cancels with itself.
++	return y ^ (mask & (y ^ x))
++}
++
++// ctEq returns 1 if x == y, and 0 otherwise. The execution time of this
++// function does not depend on its inputs.
++func ctEq(x, y uint) choice {
++	// If x != y, then either x - y or y - x will generate a carry.
++	_, c1 := bits.Sub(x, y, 0)
++	_, c2 := bits.Sub(y, x, 0)
++	return not(choice(c1 | c2))
++}
++
++// ctGeq returns 1 if x >= y, and 0 otherwise. The execution time of this
++// function does not depend on its inputs.
++func ctGeq(x, y uint) choice {
++	// If x < y, then x - y generates a carry.
++	_, carry := bits.Sub(x, y, 0)
++	return not(choice(carry))
++}
++
++// nat represents an arbitrary natural number
++//
++// Each nat has an announced length, which is the number of limbs it has stored.
++// Operations on this number are allowed to leak this length, but will not leak
++// any information about the values contained in those limbs.
++type nat struct {
++	// limbs is a little-endian representation in base 2^W with
++	// W = bits.UintSize - 1. The top bit is always unset between operations.
++	//
++	// The top bit is left unset to optimize Montgomery multiplication, in the
++	// inner loop of exponentiation. Using fully saturated limbs would leave us
++	// working with 129-bit numbers on 64-bit platforms, wasting a lot of space,
++	// and thus time.
++	limbs []uint
++}
++
++// expand expands x to n limbs, leaving its value unchanged.
++func (x *nat) expand(n int) *nat {
++	for len(x.limbs) > n {
++		if x.limbs[len(x.limbs)-1] != 0 {
++			panic("rsa: internal error: shrinking nat")
++		}
++		x.limbs = x.limbs[:len(x.limbs)-1]
++	}
++	if cap(x.limbs) < n {
++		newLimbs := make([]uint, n)
++		copy(newLimbs, x.limbs)
++		x.limbs = newLimbs
++		return x
++	}
++	extraLimbs := x.limbs[len(x.limbs):n]
++	for i := range extraLimbs {
++		extraLimbs[i] = 0
++	}
++	x.limbs = x.limbs[:n]
++	return x
++}
++
++// reset returns a zero nat of n limbs, reusing x's storage if n <= cap(x.limbs).
++func (x *nat) reset(n int) *nat {
++	if cap(x.limbs) < n {
++		x.limbs = make([]uint, n)
++		return x
++	}
++	for i := range x.limbs {
++		x.limbs[i] = 0
++	}
++	x.limbs = x.limbs[:n]
++	return x
++}
++
++// clone returns a new nat, with the same value and announced length as x.
++func (x *nat) clone() *nat {
++	out := &nat{make([]uint, len(x.limbs))}
++	copy(out.limbs, x.limbs)
++	return out
++}
++
++// natFromBig creates a new natural number from a big.Int.
++//
++// The announced length of the resulting nat is based on the actual bit size of
++// the input, ignoring leading zeroes.
++func natFromBig(x *big.Int) *nat {
++	xLimbs := x.Bits()
++	bitSize := bigBitLen(x)
++	requiredLimbs := (bitSize + _W - 1) / _W
++
++	out := &nat{make([]uint, requiredLimbs)}
++	outI := 0
++	shift := 0
++	for i := range xLimbs {
++		xi := uint(xLimbs[i])
++		out.limbs[outI] |= (xi << shift) & _MASK
++		outI++
++		if outI == requiredLimbs {
++			return out
++		}
++		out.limbs[outI] = xi >> (_W - shift)
++		shift++ // this assumes bits.UintSize - _W = 1
++		if shift == _W {
++			shift = 0
++			outI++
++		}
++	}
++	return out
++}
++
++// fillBytes sets bytes to x as a zero-extended big-endian byte slice.
++//
++// If bytes is not long enough to contain the number or at least len(x.limbs)-1
++// limbs, or has zero length, fillBytes will panic.
++func (x *nat) fillBytes(bytes []byte) []byte {
++	if len(bytes) == 0 {
++		panic("nat: fillBytes invoked with too small buffer")
++	}
++	for i := range bytes {
++		bytes[i] = 0
++	}
++	shift := 0
++	outI := len(bytes) - 1
++	for i, limb := range x.limbs {
++		remainingBits := _W
++		for remainingBits >= 8 {
++			bytes[outI] |= byte(limb) << shift
++			consumed := 8 - shift
++			limb >>= consumed
++			remainingBits -= consumed
++			shift = 0
++			outI--
++			if outI < 0 {
++				if limb != 0 || i < len(x.limbs)-1 {
++					panic("nat: fillBytes invoked with too small buffer")
++				}
++				return bytes
++			}
++		}
++		bytes[outI] = byte(limb)
++		shift = remainingBits
++	}
++	return bytes
++}
++
++// natFromBytes converts a slice of big-endian bytes into a nat.
++//
++// The announced length of the output depends on the length of bytes. Unlike
++// big.Int, creating a nat will not remove leading zeros.
++func natFromBytes(bytes []byte) *nat {
++	bitSize := len(bytes) * 8
++	requiredLimbs := (bitSize + _W - 1) / _W
++
++	out := &nat{make([]uint, requiredLimbs)}
++	outI := 0
++	shift := 0
++	for i := len(bytes) - 1; i >= 0; i-- {
++		bi := bytes[i]
++		out.limbs[outI] |= uint(bi) << shift
++		shift += 8
++		if shift >= _W {
++			shift -= _W
++			out.limbs[outI] &= _MASK
++			outI++
++			if shift > 0 {
++				out.limbs[outI] = uint(bi) >> (8 - shift)
++			}
++		}
++	}
++	return out
++}
++
++// cmpEq returns 1 if x == y, and 0 otherwise.
++//
++// Both operands must have the same announced length.
++func (x *nat) cmpEq(y *nat) choice {
++	// Eliminate bounds checks in the loop.
++	size := len(x.limbs)
++	xLimbs := x.limbs[:size]
++	yLimbs := y.limbs[:size]
++
++	equal := yes
++	for i := 0; i < size; i++ {
++		equal &= ctEq(xLimbs[i], yLimbs[i])
++	}
++	return equal
++}
++
++// cmpGeq returns 1 if x >= y, and 0 otherwise.
++//
++// Both operands must have the same announced length.
++func (x *nat) cmpGeq(y *nat) choice {
++	// Eliminate bounds checks in the loop.
++	size := len(x.limbs)
++	xLimbs := x.limbs[:size]
++	yLimbs := y.limbs[:size]
++
++	var c uint
++	for i := 0; i < size; i++ {
++		c = (xLimbs[i] - yLimbs[i] - c) >> _W
++	}
++	// If there was a carry, then subtracting y underflowed, so
++	// x is not greater than or equal to y.
++	return not(choice(c))
++}
++
++// assign sets x <- y if on == 1, and does nothing otherwise.
++//
++// Both operands must have the same announced length.
++func (x *nat) assign(on choice, y *nat) *nat {
++	// Eliminate bounds checks in the loop.
++	size := len(x.limbs)
++	xLimbs := x.limbs[:size]
++	yLimbs := y.limbs[:size]
++
++	for i := 0; i < size; i++ {
++		xLimbs[i] = ctSelect(on, yLimbs[i], xLimbs[i])
++	}
++	return x
++}
++
++// add computes x += y if on == 1, and does nothing otherwise. It returns the
++// carry of the addition regardless of on.
++//
++// Both operands must have the same announced length.
++func (x *nat) add(on choice, y *nat) (c uint) {
++	// Eliminate bounds checks in the loop.
++	size := len(x.limbs)
++	xLimbs := x.limbs[:size]
++	yLimbs := y.limbs[:size]
++
++	for i := 0; i < size; i++ {
++		res := xLimbs[i] + yLimbs[i] + c
++		xLimbs[i] = ctSelect(on, res&_MASK, xLimbs[i])
++		c = res >> _W
++	}
++	return
++}
++
++// sub computes x -= y if on == 1, and does nothing otherwise. It returns the
++// borrow of the subtraction regardless of on.
++//
++// Both operands must have the same announced length.
++func (x *nat) sub(on choice, y *nat) (c uint) {
++	// Eliminate bounds checks in the loop.
++	size := len(x.limbs)
++	xLimbs := x.limbs[:size]
++	yLimbs := y.limbs[:size]
++
++	for i := 0; i < size; i++ {
++		res := xLimbs[i] - yLimbs[i] - c
++		xLimbs[i] = ctSelect(on, res&_MASK, xLimbs[i])
++		c = res >> _W
++	}
++	return
++}
++
++// modulus is used for modular arithmetic, precomputing relevant constants.
++//
++// Moduli are assumed to be odd numbers. Moduli can also leak the exact
++// number of bits needed to store their value, and are stored without padding.
++//
++// Their actual value is still kept secret.
++type modulus struct {
++	// The underlying natural number for this modulus.
++	//
++	// This will be stored without any padding, and shouldn't alias with any
++	// other natural number being used.
++	nat     *nat
++	leading int  // number of leading zeros in the modulus
++	m0inv   uint // -nat.limbs[0]⁻¹ mod _W
++}
++
++// minusInverseModW computes -x⁻¹ mod _W with x odd.
++//
++// This operation is used to precompute a constant involved in Montgomery
++// multiplication.
++func minusInverseModW(x uint) uint {
++	// Every iteration of this loop doubles the least-significant bits of
++	// correct inverse in y. The first three bits are already correct (1⁻¹ = 1,
++	// 3⁻¹ = 3, 5⁻¹ = 5, and 7⁻¹ = 7 mod 8), so doubling five times is enough
++	// for 61 bits (and wastes only one iteration for 31 bits).
++	//
++	// See https://crypto.stackexchange.com/a/47496.
++	y := x
++	for i := 0; i < 5; i++ {
++		y = y * (2 - x*y)
++	}
++	return (1 << _W) - (y & _MASK)
++}
++
++// modulusFromNat creates a new modulus from a nat.
++//
++// The nat should be odd, nonzero, and the number of significant bits in the
++// number should be leakable. The nat shouldn't be reused.
++func modulusFromNat(nat *nat) *modulus {
++	m := &modulus{}
++	m.nat = nat
++	size := len(m.nat.limbs)
++	for m.nat.limbs[size-1] == 0 {
++		size--
++	}
++	m.nat.limbs = m.nat.limbs[:size]
++	m.leading = _W - bitLen(m.nat.limbs[size-1])
++	m.m0inv = minusInverseModW(m.nat.limbs[0])
++	return m
++}
++
++// bitLen is a version of bits.Len that only leaks the bit length of n, but not
++// its value. bits.Len and bits.LeadingZeros use a lookup table for the
++// low-order bits on some architectures.
++func bitLen(n uint) int {
++	var len int
++	// We assume, here and elsewhere, that comparison to zero is constant time
++	// with respect to different non-zero values.
++	for n != 0 {
++		len++
++		n >>= 1
++	}
++	return len
++}
++
++// bigBitLen is a version of big.Int.BitLen that only leaks the bit length of x,
++// but not its value. big.Int.BitLen uses bits.Len.
++func bigBitLen(x *big.Int) int {
++	xLimbs := x.Bits()
++	fullLimbs := len(xLimbs) - 1
++	topLimb := uint(xLimbs[len(xLimbs)-1])
++	return fullLimbs*bits.UintSize + bitLen(topLimb)
++}
++
++// modulusSize returns the size of m in bytes.
++func modulusSize(m *modulus) int {
++	bits := len(m.nat.limbs)*_W - int(m.leading)
++	return (bits + 7) / 8
++}
++
++// shiftIn calculates x = x << _W + y mod m.
++//
++// This assumes that x is already reduced mod m, and that y < 2^_W.
++func (x *nat) shiftIn(y uint, m *modulus) *nat {
++	d := new(nat).resetFor(m)
++
++	// Eliminate bounds checks in the loop.
++	size := len(m.nat.limbs)
++	xLimbs := x.limbs[:size]
++	dLimbs := d.limbs[:size]
++	mLimbs := m.nat.limbs[:size]
++
++	// Each iteration of this loop computes x = 2x + b mod m, where b is a bit
++	// from y. Effectively, it left-shifts x and adds y one bit at a time,
++	// reducing it every time.
++	//
++	// To do the reduction, each iteration computes both 2x + b and 2x + b - m.
++	// The next iteration (and finally the return line) will use either result
++	// based on whether the subtraction underflowed.
++	needSubtraction := no
++	for i := _W - 1; i >= 0; i-- {
++		carry := (y >> i) & 1
++		var borrow uint
++		for i := 0; i < size; i++ {
++			l := ctSelect(needSubtraction, dLimbs[i], xLimbs[i])
++
++			res := l<<1 + carry
++			xLimbs[i] = res & _MASK
++			carry = res >> _W
++
++			res = xLimbs[i] - mLimbs[i] - borrow
++			dLimbs[i] = res & _MASK
++			borrow = res >> _W
++		}
++		// See modAdd for how carry (aka overflow), borrow (aka underflow), and
++		// needSubtraction relate.
++		needSubtraction = ctEq(carry, borrow)
++	}
++	return x.assign(needSubtraction, d)
++}
++
++// mod calculates out = x mod m.
++//
++// This works regardless how large the value of x is.
++//
++// The output will be resized to the size of m and overwritten.
++func (out *nat) mod(x *nat, m *modulus) *nat {
++	out.resetFor(m)
++	// Working our way from the most significant to the least significant limb,
++	// we can insert each limb at the least significant position, shifting all
++	// previous limbs left by _W. This way each limb will get shifted by the
++	// correct number of bits. We can insert at least N - 1 limbs without
++	// overflowing m. After that, we need to reduce every time we shift.
++	i := len(x.limbs) - 1
++	// For the first N - 1 limbs we can skip the actual shifting and position
++	// them at the shifted position, which starts at min(N - 2, i).
++	start := len(m.nat.limbs) - 2
++	if i < start {
++		start = i
++	}
++	for j := start; j >= 0; j-- {
++		out.limbs[j] = x.limbs[i]
++		i--
++	}
++	// We shift in the remaining limbs, reducing modulo m each time.
++	for i >= 0 {
++		out.shiftIn(x.limbs[i], m)
++		i--
++	}
++	return out
++}
++
++// expandFor ensures out has the right size to work with operations modulo m.
++//
++// This assumes that out has as many or fewer limbs than m, or that the extra
++// limbs are all zero (which may happen when decoding a value that has leading
++// zeroes in its bytes representation that spill over the limb threshold).
++func (out *nat) expandFor(m *modulus) *nat {
++	return out.expand(len(m.nat.limbs))
++}
++
++// resetFor ensures out has the right size to work with operations modulo m.
++//
++// out is zeroed and may start at any size.
++func (out *nat) resetFor(m *modulus) *nat {
++	return out.reset(len(m.nat.limbs))
++}
++
++// modSub computes x = x - y mod m.
++//
++// The length of both operands must be the same as the modulus. Both operands
++// must already be reduced modulo m.
++func (x *nat) modSub(y *nat, m *modulus) *nat {
++	underflow := x.sub(yes, y)
++	// If the subtraction underflowed, add m.
++	x.add(choice(underflow), m.nat)
++	return x
++}
++
++// modAdd computes x = x + y mod m.
++//
++// The length of both operands must be the same as the modulus. Both operands
++// must already be reduced modulo m.
++func (x *nat) modAdd(y *nat, m *modulus) *nat {
++	overflow := x.add(yes, y)
++	underflow := not(x.cmpGeq(m.nat)) // x < m
++
++	// Three cases are possible:
++	//
++	//   - overflow = 0, underflow = 0
++	//
++	// In this case, addition fits in our limbs, but we can still subtract away
++	// m without an underflow, so we need to perform the subtraction to reduce
++	// our result.
++	//
++	//   - overflow = 0, underflow = 1
++	//
++	// The addition fits in our limbs, but we can't subtract m without
++	// underflowing. The result is already reduced.
++	//
++	//   - overflow = 1, underflow = 1
++	//
++	// The addition does not fit in our limbs, and the subtraction's borrow
++	// would cancel out with the addition's carry. We need to subtract m to
++	// reduce our result.
++	//
++	// The overflow = 1, underflow = 0 case is not possible, because y is at
++	// most m - 1, and if adding m - 1 overflows, then subtracting m must
++	// necessarily underflow.
++	needSubtraction := ctEq(overflow, uint(underflow))
++
++	x.sub(needSubtraction, m.nat)
++	return x
++}
++
++// montgomeryRepresentation calculates x = x * R mod m, with R = 2^(_W * n) and
++// n = len(m.nat.limbs).
++//
++// Faster Montgomery multiplication replaces standard modular multiplication for
++// numbers in this representation.
++//
++// This assumes that x is already reduced mod m.
++func (x *nat) montgomeryRepresentation(m *modulus) *nat {
++	for i := 0; i < len(m.nat.limbs); i++ {
++		x.shiftIn(0, m) // x = x * 2^_W mod m
++	}
++	return x
++}
++
++// montgomeryMul calculates d = a * b / R mod m, with R = 2^(_W * n) and
++// n = len(m.nat.limbs), using the Montgomery Multiplication technique.
++//
++// All inputs should be the same length, not aliasing d, and already
++// reduced modulo m. d will be resized to the size of m and overwritten.
++func (d *nat) montgomeryMul(a *nat, b *nat, m *modulus) *nat {
++	// See https://bearssl.org/bigint.html#montgomery-reduction-and-multiplication
++	// for a description of the algorithm.
++
++	// Eliminate bounds checks in the loop.
++	size := len(m.nat.limbs)
++	aLimbs := a.limbs[:size]
++	bLimbs := b.limbs[:size]
++	dLimbs := d.resetFor(m).limbs[:size]
++	mLimbs := m.nat.limbs[:size]
++
++	var overflow uint
++	for i := 0; i < size; i++ {
++		f := ((dLimbs[0] + aLimbs[i]*bLimbs[0]) * m.m0inv) & _MASK
++		carry := uint(0)
++		for j := 0; j < size; j++ {
++			// z = d[j] + a[i] * b[j] + f * m[j] + carry <= 2^(2W+1) - 2^(W+1) + 2^W
++			hi, lo := bits.Mul(aLimbs[i], bLimbs[j])
++			z_lo, c := bits.Add(dLimbs[j], lo, 0)
++			z_hi, _ := bits.Add(0, hi, c)
++			hi, lo = bits.Mul(f, mLimbs[j])
++			z_lo, c = bits.Add(z_lo, lo, 0)
++			z_hi, _ = bits.Add(z_hi, hi, c)
++			z_lo, c = bits.Add(z_lo, carry, 0)
++			z_hi, _ = bits.Add(z_hi, 0, c)
++			if j > 0 {
++				dLimbs[j-1] = z_lo & _MASK
++			}
++			carry = z_hi<<1 | z_lo>>_W // carry <= 2^(W+1) - 2
++		}
++		z := overflow + carry // z <= 2^(W+1) - 1
++		dLimbs[size-1] = z & _MASK
++		overflow = z >> _W // overflow <= 1
++	}
++	// See modAdd for how overflow, underflow, and needSubtraction relate.
++	underflow := not(d.cmpGeq(m.nat)) // d < m
++	needSubtraction := ctEq(overflow, uint(underflow))
++	d.sub(needSubtraction, m.nat)
++
++	return d
++}
++
++// modMul calculates x *= y mod m.
++//
++// x and y must already be reduced modulo m, they must share its announced
++// length, and they may not alias.
++func (x *nat) modMul(y *nat, m *modulus) *nat {
++	// A Montgomery multiplication by a value out of the Montgomery domain
++	// takes the result out of Montgomery representation.
++	xR := x.clone().montgomeryRepresentation(m) // xR = x * R mod m
++	return x.montgomeryMul(xR, y, m)            // x = xR * y / R mod m
++}
++
++// exp calculates out = x^e mod m.
++//
++// The exponent e is represented in big-endian order. The output will be resized
++// to the size of m and overwritten. x must already be reduced modulo m.
++func (out *nat) exp(x *nat, e []byte, m *modulus) *nat {
++	// We use a 4 bit window. For our RSA workload, 4 bit windows are faster
++	// than 2 bit windows, but use an extra 12 nats worth of scratch space.
++	// Using bit sizes that don't divide 8 are more complex to implement.
++	table := make([]*nat, (1<<4)-1) // table[i] = x ^ (i+1)
++	table[0] = x.clone().montgomeryRepresentation(m)
++	for i := 1; i < len(table); i++ {
++		table[i] = new(nat).expandFor(m)
++		table[i].montgomeryMul(table[i-1], table[0], m)
++	}
++
++	out.resetFor(m)
++	out.limbs[0] = 1
++	out.montgomeryRepresentation(m)
++	t0 := new(nat).expandFor(m)
++	t1 := new(nat).expandFor(m)
++	for _, b := range e {
++		for _, j := range []int{4, 0} {
++			// Square four times.
++			t1.montgomeryMul(out, out, m)
++			out.montgomeryMul(t1, t1, m)
++			t1.montgomeryMul(out, out, m)
++			out.montgomeryMul(t1, t1, m)
++
++			// Select x^k in constant time from the table.
++			k := uint((b >> j) & 0b1111)
++			for i := range table {
++				t0.assign(ctEq(k, uint(i+1)), table[i])
++			}
++
++			// Multiply by x^k, discarding the result if k = 0.
++			t1.montgomeryMul(out, t0, m)
++			out.assign(not(ctEq(k, 0)), t1)
++		}
++	}
++
++	// By Montgomery multiplying with 1 not in Montgomery representation, we
++	// convert out back from Montgomery representation, because it works out to
++	// dividing by R.
++	t0.assign(yes, out)
++	t1.resetFor(m)
++	t1.limbs[0] = 1
++	out.montgomeryMul(t0, t1, m)
++
++	return out
++}
+diff --git a/src/crypto/rsa/nat_test.go b/src/crypto/rsa/nat_test.go
+new file mode 100644
+index 0000000..3e6eb10
+--- /dev/null
++++ b/src/crypto/rsa/nat_test.go
+@@ -0,0 +1,384 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package rsa
++
++import (
++	"bytes"
++	"math/big"
++	"math/bits"
++	"math/rand"
++	"reflect"
++	"testing"
++	"testing/quick"
++)
++
++// Generate generates an even nat. It's used by testing/quick to produce random
++// *nat values for quick.Check invocations.
++func (*nat) Generate(r *rand.Rand, size int) reflect.Value {
++	limbs := make([]uint, size)
++	for i := 0; i < size; i++ {
++		limbs[i] = uint(r.Uint64()) & ((1 << _W) - 2)
++	}
++	return reflect.ValueOf(&nat{limbs})
++}
++
++func testModAddCommutative(a *nat, b *nat) bool {
++	mLimbs := make([]uint, len(a.limbs))
++	for i := 0; i < len(mLimbs); i++ {
++		mLimbs[i] = _MASK
++	}
++	m := modulusFromNat(&nat{mLimbs})
++	aPlusB := a.clone()
++	aPlusB.modAdd(b, m)
++	bPlusA := b.clone()
++	bPlusA.modAdd(a, m)
++	return aPlusB.cmpEq(bPlusA) == 1
++}
++
++func TestModAddCommutative(t *testing.T) {
++	err := quick.Check(testModAddCommutative, &quick.Config{})
++	if err != nil {
++		t.Error(err)
++	}
++}
++
++func testModSubThenAddIdentity(a *nat, b *nat) bool {
++	mLimbs := make([]uint, len(a.limbs))
++	for i := 0; i < len(mLimbs); i++ {
++		mLimbs[i] = _MASK
++	}
++	m := modulusFromNat(&nat{mLimbs})
++	original := a.clone()
++	a.modSub(b, m)
++	a.modAdd(b, m)
++	return a.cmpEq(original) == 1
++}
++
++func TestModSubThenAddIdentity(t *testing.T) {
++	err := quick.Check(testModSubThenAddIdentity, &quick.Config{})
++	if err != nil {
++		t.Error(err)
++	}
++}
++
++func testMontgomeryRoundtrip(a *nat) bool {
++	one := &nat{make([]uint, len(a.limbs))}
++	one.limbs[0] = 1
++	aPlusOne := a.clone()
++	aPlusOne.add(1, one)
++	m := modulusFromNat(aPlusOne)
++	monty := a.clone()
++	monty.montgomeryRepresentation(m)
++	aAgain := monty.clone()
++	aAgain.montgomeryMul(monty, one, m)
++	return a.cmpEq(aAgain) == 1
++}
++
++func TestMontgomeryRoundtrip(t *testing.T) {
++	err := quick.Check(testMontgomeryRoundtrip, &quick.Config{})
++	if err != nil {
++		t.Error(err)
++	}
++}
++
++func TestFromBig(t *testing.T) {
++	expected := []byte{0x01, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
++	theBig := new(big.Int).SetBytes(expected)
++	actual := natFromBig(theBig).fillBytes(make([]byte, len(expected)))
++	if !bytes.Equal(actual, expected) {
++		t.Errorf("%+x != %+x", actual, expected)
++	}
++}
++
++func TestFillBytes(t *testing.T) {
++	xBytes := []byte{0xAA, 0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88}
++	x := natFromBytes(xBytes)
++	for l := 20; l >= len(xBytes); l-- {
++		buf := make([]byte, l)
++		rand.Read(buf)
++		actual := x.fillBytes(buf)
++		expected := make([]byte, l)
++		copy(expected[l-len(xBytes):], xBytes)
++		if !bytes.Equal(actual, expected) {
++			t.Errorf("%d: %+v != %+v", l, actual, expected)
++		}
++	}
++	for l := len(xBytes) - 1; l >= 0; l-- {
++		(func() {
++			defer func() {
++				if recover() == nil {
++					t.Errorf("%d: expected panic", l)
++				}
++			}()
++			x.fillBytes(make([]byte, l))
++		})()
++	}
++}
++
++func TestFromBytes(t *testing.T) {
++	f := func(xBytes []byte) bool {
++		if len(xBytes) == 0 {
++			return true
++		}
++		actual := natFromBytes(xBytes).fillBytes(make([]byte, len(xBytes)))
++		if !bytes.Equal(actual, xBytes) {
++			t.Errorf("%+x != %+x", actual, xBytes)
++			return false
++		}
++		return true
++	}
++
++	err := quick.Check(f, &quick.Config{})
++	if err != nil {
++		t.Error(err)
++	}
++
++	f([]byte{0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88})
++	f(bytes.Repeat([]byte{0xFF}, _W))
++}
++
++func TestShiftIn(t *testing.T) {
++	if bits.UintSize != 64 {
++		t.Skip("examples are only valid in 64 bit")
++	}
++	examples := []struct {
++		m, x, expected []byte
++		y              uint64
++	}{{
++		m:        []byte{13},
++		x:        []byte{0},
++		y:        0x7FFF_FFFF_FFFF_FFFF,
++		expected: []byte{7},
++	}, {
++		m:        []byte{13},
++		x:        []byte{7},
++		y:        0x7FFF_FFFF_FFFF_FFFF,
++		expected: []byte{11},
++	}, {
++		m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d},
++		x:        make([]byte, 9),
++		y:        0x7FFF_FFFF_FFFF_FFFF,
++		expected: []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
++	}, {
++		m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d},
++		x:        []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
++		y:        0,
++		expected: []byte{0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08},
++	}}
++
++	for i, tt := range examples {
++		m := modulusFromNat(natFromBytes(tt.m))
++		got := natFromBytes(tt.x).expandFor(m).shiftIn(uint(tt.y), m)
++		if got.cmpEq(natFromBytes(tt.expected).expandFor(m)) != 1 {
++			t.Errorf("%d: got %x, expected %x", i, got, tt.expected)
++		}
++	}
++}
++
++func TestModulusAndNatSizes(t *testing.T) {
++	// These are 126 bit (2 * _W on 64-bit architectures) values, serialized as
++	// 128 bits worth of bytes. If leading zeroes are stripped, they fit in two
++	// limbs, if they are not, they fit in three. This can be a problem because
++	// modulus strips leading zeroes and nat does not.
++	m := modulusFromNat(natFromBytes([]byte{
++		0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
++		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}))
++	x := natFromBytes([]byte{
++		0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
++		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe})
++	x.expandFor(m) // must not panic for shrinking
++}
++
++func TestExpand(t *testing.T) {
++	sliced := []uint{1, 2, 3, 4}
++	examples := []struct {
++		in  []uint
++		n   int
++		out []uint
++	}{{
++		[]uint{1, 2},
++		4,
++		[]uint{1, 2, 0, 0},
++	}, {
++		sliced[:2],
++		4,
++		[]uint{1, 2, 0, 0},
++	}, {
++		[]uint{1, 2},
++		2,
++		[]uint{1, 2},
++	}, {
++		[]uint{1, 2, 0},
++		2,
++		[]uint{1, 2},
++	}}
++
++	for i, tt := range examples {
++		got := (&nat{tt.in}).expand(tt.n)
++		if len(got.limbs) != len(tt.out) || got.cmpEq(&nat{tt.out}) != 1 {
++			t.Errorf("%d: got %x, expected %x", i, got, tt.out)
++		}
++	}
++}
++
++func TestMod(t *testing.T) {
++	m := modulusFromNat(natFromBytes([]byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d}))
++	x := natFromBytes([]byte{0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01})
++	out := new(nat)
++	out.mod(x, m)
++	expected := natFromBytes([]byte{0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09})
++	if out.cmpEq(expected) != 1 {
++		t.Errorf("%+v != %+v", out, expected)
++	}
++}
++
++func TestModSub(t *testing.T) {
++	m := modulusFromNat(&nat{[]uint{13}})
++	x := &nat{[]uint{6}}
++	y := &nat{[]uint{7}}
++	x.modSub(y, m)
++	expected := &nat{[]uint{12}}
++	if x.cmpEq(expected) != 1 {
++		t.Errorf("%+v != %+v", x, expected)
++	}
++	x.modSub(y, m)
++	expected = &nat{[]uint{5}}
++	if x.cmpEq(expected) != 1 {
++		t.Errorf("%+v != %+v", x, expected)
++	}
++}
++
++func TestModAdd(t *testing.T) {
++	m := modulusFromNat(&nat{[]uint{13}})
++	x := &nat{[]uint{6}}
++	y := &nat{[]uint{7}}
++	x.modAdd(y, m)
++	expected := &nat{[]uint{0}}
++	if x.cmpEq(expected) != 1 {
++		t.Errorf("%+v != %+v", x, expected)
++	}
++	x.modAdd(y, m)
++	expected = &nat{[]uint{7}}
++	if x.cmpEq(expected) != 1 {
++		t.Errorf("%+v != %+v", x, expected)
++	}
++}
++
++func TestExp(t *testing.T) {
++	m := modulusFromNat(&nat{[]uint{13}})
++	x := &nat{[]uint{3}}
++	out := &nat{[]uint{0}}
++	out.exp(x, []byte{12}, m)
++	expected := &nat{[]uint{1}}
++	if out.cmpEq(expected) != 1 {
++		t.Errorf("%+v != %+v", out, expected)
++	}
++}
++
++func makeBenchmarkModulus() *modulus {
++	m := make([]uint, 32)
++	for i := 0; i < 32; i++ {
++		m[i] = _MASK
++	}
++	return modulusFromNat(&nat{limbs: m})
++}
++
++func makeBenchmarkValue() *nat {
++	x := make([]uint, 32)
++	for i := 0; i < 32; i++ {
++		x[i] = _MASK - 1
++	}
++	return &nat{limbs: x}
++}
++
++func makeBenchmarkExponent() []byte {
++	e := make([]byte, 256)
++	for i := 0; i < 32; i++ {
++		e[i] = 0xFF
++	}
++	return e
++}
++
++func BenchmarkModAdd(b *testing.B) {
++	x := makeBenchmarkValue()
++	y := makeBenchmarkValue()
++	m := makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		x.modAdd(y, m)
++	}
++}
++
++func BenchmarkModSub(b *testing.B) {
++	x := makeBenchmarkValue()
++	y := makeBenchmarkValue()
++	m := makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		x.modSub(y, m)
++	}
++}
++
++func BenchmarkMontgomeryRepr(b *testing.B) {
++	x := makeBenchmarkValue()
++	m := makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		x.montgomeryRepresentation(m)
++	}
++}
++
++func BenchmarkMontgomeryMul(b *testing.B) {
++	x := makeBenchmarkValue()
++	y := makeBenchmarkValue()
++	out := makeBenchmarkValue()
++	m := makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		out.montgomeryMul(x, y, m)
++	}
++}
++
++func BenchmarkModMul(b *testing.B) {
++	x := makeBenchmarkValue()
++	y := makeBenchmarkValue()
++	m := makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		x.modMul(y, m)
++	}
++}
++
++func BenchmarkExpBig(b *testing.B) {
++	out := new(big.Int)
++	exponentBytes := makeBenchmarkExponent()
++	x := new(big.Int).SetBytes(exponentBytes)
++	e := new(big.Int).SetBytes(exponentBytes)
++	n := new(big.Int).SetBytes(exponentBytes)
++	one := new(big.Int).SetUint64(1)
++	n.Add(n, one)
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		out.Exp(x, e, n)
++	}
++}
++
++func BenchmarkExp(b *testing.B) {
++	x := makeBenchmarkValue()
++	e := makeBenchmarkExponent()
++	out := makeBenchmarkValue()
++	m := makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i := 0; i < b.N; i++ {
++		out.exp(x, e, m)
++	}
++}
+diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
+index a216be3..4312f34 100644
+--- a/src/crypto/rsa/pkcs1v15.go
++++ b/src/crypto/rsa/pkcs1v15.go
+@@ -9,7 +9,6 @@ import (
+ 	"crypto/subtle"
+ 	"errors"
+ 	"io"
+-	"math/big"
+ 
+ 	"crypto/internal/randutil"
+ )
+@@ -58,14 +57,11 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey, msg []byte) ([]byte, error)
+ 	em[len(em)-len(msg)-1] = 0
+ 	copy(mm, msg)
+ 
+-	m := new(big.Int).SetBytes(em)
+-	c := encrypt(new(big.Int), pub, m)
+-
+-	return c.FillBytes(em), nil
++	return encrypt(pub, em), nil
+ }
+ 
+ // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding scheme from PKCS#1 v1.5.
+-// If rand != nil, it uses RSA blinding to avoid timing side-channel attacks.
++// The rand parameter is legacy and ignored, and it can be as nil.
+ //
+ // Note that whether this function returns an error or not discloses secret
+ // information. If an attacker can cause this function to run repeatedly and
+@@ -76,7 +72,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) ([]byt
+ 	if err := checkPub(&priv.PublicKey); err != nil {
+ 		return nil, err
+ 	}
+-	valid, out, index, err := decryptPKCS1v15(rand, priv, ciphertext)
++	valid, out, index, err := decryptPKCS1v15(priv, ciphertext)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -87,7 +83,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) ([]byt
+ }
+ 
+ // DecryptPKCS1v15SessionKey decrypts a session key using RSA and the padding scheme from PKCS#1 v1.5.
+-// If rand != nil, it uses RSA blinding to avoid timing side-channel attacks.
++// The rand parameter is legacy and ignored, and it can be as nil.
+ // It returns an error if the ciphertext is the wrong length or if the
+ // ciphertext is greater than the public modulus. Otherwise, no error is
+ // returned. If the padding is valid, the resulting plaintext message is copied
+@@ -114,7 +110,7 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, priv *PrivateKey, ciphertext []by
+ 		return ErrDecryption
+ 	}
+ 
+-	valid, em, index, err := decryptPKCS1v15(rand, priv, ciphertext)
++	valid, em, index, err := decryptPKCS1v15(priv, ciphertext)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -130,26 +126,24 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, priv *PrivateKey, ciphertext []by
+ 	return nil
+ }
+ 
+-// decryptPKCS1v15 decrypts ciphertext using priv and blinds the operation if
+-// rand is not nil. It returns one or zero in valid that indicates whether the
+-// plaintext was correctly structured. In either case, the plaintext is
+-// returned in em so that it may be read independently of whether it was valid
+-// in order to maintain constant memory access patterns. If the plaintext was
+-// valid then index contains the index of the original message in em.
+-func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) (valid int, em []byte, index int, err error) {
++// decryptPKCS1v15 decrypts ciphertext using priv. It returns one or zero in
++// valid that indicates whether the plaintext was correctly structured.
++// In either case, the plaintext is returned in em so that it may be read
++// independently of whether it was valid in order to maintain constant memory
++// access patterns. If the plaintext was valid then index contains the index of
++// the original message in em, to allow constant time padding removal.
++func decryptPKCS1v15(priv *PrivateKey, ciphertext []byte) (valid int, em []byte, index int, err error) {
+ 	k := priv.Size()
+ 	if k < 11 {
+ 		err = ErrDecryption
+ 		return
+ 	}
+ 
+-	c := new(big.Int).SetBytes(ciphertext)
+-	m, err := decrypt(rand, priv, c)
++	em, err = decrypt(priv, ciphertext)
+ 	if err != nil {
+ 		return
+ 	}
+ 
+-	em = m.FillBytes(make([]byte, k))
+ 	firstByteIsZero := subtle.ConstantTimeByteEq(em[0], 0)
+ 	secondByteIsTwo := subtle.ConstantTimeByteEq(em[1], 2)
+ 
+@@ -221,8 +215,7 @@ var hashPrefixes = map[crypto.Hash][]byte{
+ // function. If hash is zero, hashed is signed directly. This isn't
+ // advisable except for interoperability.
+ //
+-// If rand is not nil then RSA blinding will be used to avoid timing
+-// side-channel attacks.
++// The rand parameter is legacy and ignored, and it can be as nil.
+ //
+ // This function is deterministic. Thus, if the set of possible
+ // messages is small, an attacker may be able to build a map from
+@@ -249,13 +242,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed []b
+ 	copy(em[k-tLen:k-hashLen], prefix)
+ 	copy(em[k-hashLen:k], hashed)
+ 
+-	m := new(big.Int).SetBytes(em)
+-	c, err := decryptAndCheck(rand, priv, m)
+-	if err != nil {
+-		return nil, err
+-	}
+-
+-	return c.FillBytes(em), nil
++	return decryptAndCheck(priv, em)
+ }
+ 
+ // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.
+@@ -275,9 +262,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte)
+ 		return ErrVerification
+ 	}
+ 
+-	c := new(big.Int).SetBytes(sig)
+-	m := encrypt(new(big.Int), pub, c)
+-	em := m.FillBytes(make([]byte, k))
++	em := encrypt(pub, sig)
+ 	// EM = 0x00 || 0x01 || PS || 0x00 || T
+ 
+ 	ok := subtle.ConstantTimeByteEq(em[0], 0)
+diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
+index 814522d..eaba4be 100644
+--- a/src/crypto/rsa/pss.go
++++ b/src/crypto/rsa/pss.go
+@@ -12,7 +12,6 @@ import (
+ 	"errors"
+ 	"hash"
+ 	"io"
+-	"math/big"
+ )
+ 
+ // Per RFC 8017, Section 9.1
+@@ -207,19 +206,27 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error {
+ // Note that hashed must be the result of hashing the input message using the
+ // given hash function. salt is a random sequence of bytes whose length will be
+ // later used to verify the signature.
+-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) ([]byte, error) {
+-	emBits := priv.N.BitLen() - 1
++func signPSSWithSalt(priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) ([]byte, error) {
++	emBits := bigBitLen(priv.N) - 1
+ 	em, err := emsaPSSEncode(hashed, emBits, salt, hash.New())
+ 	if err != nil {
+ 		return nil, err
+ 	}
+-	m := new(big.Int).SetBytes(em)
+-	c, err := decryptAndCheck(rand, priv, m)
+-	if err != nil {
+-		return nil, err
++
++	// RFC 8017: "Note that the octet length of EM will be one less than k if
++	// modBits - 1 is divisible by 8 and equal to k otherwise, where k is the
++	// length in octets of the RSA modulus n." 🙄
++	//
++	// This is extremely annoying, as all other encrypt and decrypt inputs are
++	// always the exact same size as the modulus. Since it only happens for
++	// weird modulus sizes, fix it by padding inefficiently.
++	if emLen, k := len(em), priv.Size(); emLen < k {
++		emNew := make([]byte, k)
++		copy(emNew[k-emLen:], em)
++		em = emNew
+ 	}
+-	s := make([]byte, priv.Size())
+-	return c.FillBytes(s), nil
++
++	return decryptAndCheck(priv, em)
+ }
+ 
+ const (
+@@ -269,7 +276,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte,
+ 	saltLength := opts.saltLength()
+ 	switch saltLength {
+ 	case PSSSaltLengthAuto:
+-		saltLength = (priv.N.BitLen()-1+7)/8 - 2 - hash.Size()
++		saltLength = (bigBitLen(priv.N)-1+7)/8 - 2 - hash.Size()
+ 	case PSSSaltLengthEqualsHash:
+ 		saltLength = hash.Size()
+ 	}
+@@ -278,7 +285,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte,
+ 	if _, err := io.ReadFull(rand, salt); err != nil {
+ 		return nil, err
+ 	}
+-	return signPSSWithSalt(rand, priv, hash, digest, salt)
++	return signPSSWithSalt(priv, hash, digest, salt)
+ }
+ 
+ // VerifyPSS verifies a PSS signature.
+@@ -291,13 +298,22 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []byte, opts
+ 	if len(sig) != pub.Size() {
+ 		return ErrVerification
+ 	}
+-	s := new(big.Int).SetBytes(sig)
+-	m := encrypt(new(big.Int), pub, s)
+-	emBits := pub.N.BitLen() - 1
++
++	emBits := bigBitLen(pub.N) - 1
+ 	emLen := (emBits + 7) / 8
+-	if m.BitLen() > emLen*8 {
+-		return ErrVerification
++	em := encrypt(pub, sig)
++
++	// Like in signPSSWithSalt, deal with mismatches between emLen and the size
++	// of the modulus. The spec would have us wire emLen into the encoding
++	// function, but we'd rather always encode to the size of the modulus and
++	// then strip leading zeroes if necessary. This only happens for weird
++	// modulus sizes anyway.
++	for len(em) > emLen && len(em) > 0 {
++		if em[0] != 0 {
++			return ErrVerification
++		}
++		em = em[1:]
+ 	}
+-	em := m.FillBytes(make([]byte, emLen))
++
+ 	return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.New())
+ }
+diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
+index c3a6d46..d018b43 100644
+--- a/src/crypto/rsa/pss_test.go
++++ b/src/crypto/rsa/pss_test.go
+@@ -233,7 +233,10 @@ func TestPSSSigning(t *testing.T) {
+ 	}
+ }
+ 
+-func TestSignWithPSSSaltLengthAuto(t *testing.T) {
++func TestPSS513(t *testing.T) {
++	// See Issue 42741, and separately, RFC 8017: "Note that the octet length of
++	// EM will be one less than k if modBits - 1 is divisible by 8 and equal to
++	// k otherwise, where k is the length in octets of the RSA modulus n."
+ 	key, err := GenerateKey(rand.Reader, 513)
+ 	if err != nil {
+ 		t.Fatal(err)
+@@ -246,8 +249,9 @@ func TestSignWithPSSSaltLengthAuto(t *testing.T) {
+ 	if err != nil {
+ 		t.Fatal(err)
+ 	}
+-	if len(signature) == 0 {
+-		t.Fatal("empty signature returned")
++	err = VerifyPSS(&key.PublicKey, crypto.SHA256, digest[:], signature, nil)
++	if err != nil {
++		t.Error(err)
+ 	}
+ }
+ 
+diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
+index 5a00ed2..29d9d31 100644
+--- a/src/crypto/rsa/rsa.go
++++ b/src/crypto/rsa/rsa.go
+@@ -19,13 +19,17 @@
+ // over the public key primitive, the PrivateKey type implements the
+ // Decrypter and Signer interfaces from the crypto package.
+ //
+-// The RSA operations in this package are not implemented using constant-time algorithms.
++// Operations in this package are implemented using constant-time algorithms,
++// except for [GenerateKey], [PrivateKey.Precompute], and [PrivateKey.Validate].
++// Every other operation only leaks the bit size of the involved values, which
++// all depend on the selected key size.
+ package rsa
+ 
+ import (
+ 	"crypto"
+ 	"crypto/rand"
+ 	"crypto/subtle"
++	"encoding/binary"
+ 	"errors"
+ 	"hash"
+ 	"io"
+@@ -35,7 +39,6 @@ import (
+ 	"crypto/internal/randutil"
+ )
+ 
+-var bigZero = big.NewInt(0)
+ var bigOne = big.NewInt(1)
+ 
+ // A PublicKey represents the public part of an RSA key.
+@@ -47,7 +50,7 @@ type PublicKey struct {
+ // Size returns the modulus size in bytes. Raw signatures and ciphertexts
+ // for or by this public key will have the same size.
+ func (pub *PublicKey) Size() int {
+-	return (pub.N.BitLen() + 7) / 8
++	return (bigBitLen(pub.N) + 7) / 8
+ }
+ 
+ // OAEPOptions is an interface for passing options to OAEP decryption using the
+@@ -351,10 +354,19 @@ func mgf1XOR(out []byte, hash hash.Hash, seed []byte) {
+ // too large for the size of the public key.
+ var ErrMessageTooLong = errors.New("crypto/rsa: message too long for RSA public key size")
+ 
+-func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int {
+-	e := big.NewInt(int64(pub.E))
+-	c.Exp(m, e, pub.N)
+-	return c
++func encrypt(pub *PublicKey, plaintext []byte) []byte {
++
++	N := modulusFromNat(natFromBig(pub.N))
++	m := natFromBytes(plaintext).expandFor(N)
++
++	e := make([]byte, 8)
++	binary.BigEndian.PutUint64(e, uint64(pub.E))
++	for len(e) > 1 && e[0] == 0 {
++		e = e[1:]
++	}
++
++	out := make([]byte, modulusSize(N))
++	return new(nat).exp(m, e, N).fillBytes(out)
+ }
+ 
+ // EncryptOAEP encrypts the given message with RSA-OAEP.
+@@ -404,12 +416,7 @@ func EncryptOAEP(hash hash.Hash, random io.Reader, pub *PublicKey, msg []byte, l
+ 	mgf1XOR(db, hash, seed)
+ 	mgf1XOR(seed, hash, db)
+ 
+-	m := new(big.Int)
+-	m.SetBytes(em)
+-	c := encrypt(new(big.Int), pub, m)
+-
+-	out := make([]byte, k)
+-	return c.FillBytes(out), nil
++	return encrypt(pub, em), nil
+ }
+ 
+ // ErrDecryption represents a failure to decrypt a message.
+@@ -451,98 +458,71 @@ func (priv *PrivateKey) Precompute() {
+ 	}
+ }
+ 
+-// decrypt performs an RSA decryption, resulting in a plaintext integer. If a
+-// random source is given, RSA blinding is used.
+-func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error) {
+-	// TODO(agl): can we get away with reusing blinds?
+-	if c.Cmp(priv.N) > 0 {
+-		err = ErrDecryption
+-		return
++// decrypt performs an RSA decryption of ciphertext into out.
++func decrypt(priv *PrivateKey, ciphertext []byte) ([]byte, error) {
++
++	N := modulusFromNat(natFromBig(priv.N))
++	c := natFromBytes(ciphertext).expandFor(N)
++	if c.cmpGeq(N.nat) == 1 {
++		return nil, ErrDecryption
+ 	}
+ 	if priv.N.Sign() == 0 {
+ 		return nil, ErrDecryption
+ 	}
+ 
+-	var ir *big.Int
+-	if random != nil {
+-		randutil.MaybeReadByte(random)
+-
+-		// Blinding enabled. Blinding involves multiplying c by r^e.
+-		// Then the decryption operation performs (m^e * r^e)^d mod n
+-		// which equals mr mod n. The factor of r can then be removed
+-		// by multiplying by the multiplicative inverse of r.
+-
+-		var r *big.Int
+-		ir = new(big.Int)
+-		for {
+-			r, err = rand.Int(random, priv.N)
+-			if err != nil {
+-				return
+-			}
+-			if r.Cmp(bigZero) == 0 {
+-				r = bigOne
+-			}
+-			ok := ir.ModInverse(r, priv.N)
+-			if ok != nil {
+-				break
+-			}
+-		}
+-		bigE := big.NewInt(int64(priv.E))
+-		rpowe := new(big.Int).Exp(r, bigE, priv.N) // N != 0
+-		cCopy := new(big.Int).Set(c)
+-		cCopy.Mul(cCopy, rpowe)
+-		cCopy.Mod(cCopy, priv.N)
+-		c = cCopy
+-	}
+-
++	// Note that because our private decryption exponents are stored as big.Int,
++	// we potentially leak the exact number of bits of these exponents. This
++	// isn't great, but should be fine.
+ 	if priv.Precomputed.Dp == nil {
+-		m = new(big.Int).Exp(c, priv.D, priv.N)
+-	} else {
+-		// We have the precalculated values needed for the CRT.
+-		m = new(big.Int).Exp(c, priv.Precomputed.Dp, priv.Primes[0])
+-		m2 := new(big.Int).Exp(c, priv.Precomputed.Dq, priv.Primes[1])
+-		m.Sub(m, m2)
+-		if m.Sign() < 0 {
+-			m.Add(m, priv.Primes[0])
+-		}
+-		m.Mul(m, priv.Precomputed.Qinv)
+-		m.Mod(m, priv.Primes[0])
+-		m.Mul(m, priv.Primes[1])
+-		m.Add(m, m2)
+-
+-		for i, values := range priv.Precomputed.CRTValues {
+-			prime := priv.Primes[2+i]
+-			m2.Exp(c, values.Exp, prime)
+-			m2.Sub(m2, m)
+-			m2.Mul(m2, values.Coeff)
+-			m2.Mod(m2, prime)
+-			if m2.Sign() < 0 {
+-				m2.Add(m2, prime)
+-			}
+-			m2.Mul(m2, values.R)
+-			m.Add(m, m2)
+-		}
+-	}
+-
+-	if ir != nil {
+-		// Unblind.
+-		m.Mul(m, ir)
+-		m.Mod(m, priv.N)
+-	}
+-
+-	return
++		out := make([]byte, modulusSize(N))
++		return new(nat).exp(c, priv.D.Bytes(), N).fillBytes(out), nil
++	}
++
++	t0 := new(nat)
++	P := modulusFromNat(natFromBig(priv.Primes[0]))
++	Q := modulusFromNat(natFromBig(priv.Primes[1]))
++	// m = c ^ Dp mod p
++	m := new(nat).exp(t0.mod(c, P), priv.Precomputed.Dp.Bytes(), P)
++	// m2 = c ^ Dq mod q
++	m2 := new(nat).exp(t0.mod(c, Q), priv.Precomputed.Dq.Bytes(), Q)
++	// m = m - m2 mod p
++	m.modSub(t0.mod(m2, P), P)
++	// m = m * Qinv mod p
++	m.modMul(natFromBig(priv.Precomputed.Qinv).expandFor(P), P)
++	// m = m * q mod N
++	m.expandFor(N).modMul(t0.mod(Q.nat, N), N)
++	// m = m + m2 mod N
++	m.modAdd(m2.expandFor(N), N)
++
++	for i, values := range priv.Precomputed.CRTValues {
++		p := modulusFromNat(natFromBig(priv.Primes[2+i]))
++		// m2 = c ^ Exp mod p
++		m2.exp(t0.mod(c, p), values.Exp.Bytes(), p)
++		// m2 = m2 - m mod p
++		m2.modSub(t0.mod(m, p), p)
++		// m2 = m2 * Coeff mod p
++		m2.modMul(natFromBig(values.Coeff).expandFor(p), p)
++		// m2 = m2 * R mod N
++		R := natFromBig(values.R).expandFor(N)
++		m2.expandFor(N).modMul(R, N)
++		// m = m + m2 mod N
++		m.modAdd(m2, N)
++	}
++
++	out := make([]byte, modulusSize(N))
++	return m.fillBytes(out), nil
+ }
+ 
+-func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error) {
+-	m, err = decrypt(random, priv, c)
++func decryptAndCheck(priv *PrivateKey, ciphertext []byte) (m []byte, err error) {
++	m, err = decrypt(priv, ciphertext)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+ 
+ 	// In order to defend against errors in the CRT computation, m^e is
+ 	// calculated, which should match the original ciphertext.
+-	check := encrypt(new(big.Int), &priv.PublicKey, m)
+-	if c.Cmp(check) != 0 {
++	check := encrypt(&priv.PublicKey, m)
++	if subtle.ConstantTimeCompare(ciphertext, check) != 1 {
+ 		return nil, errors.New("rsa: internal error")
+ 	}
+ 	return m, nil
+@@ -554,9 +534,7 @@ func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int
+ // Encryption and decryption of a given message must use the same hash function
+ // and sha256.New() is a reasonable choice.
+ //
+-// The random parameter, if not nil, is used to blind the private-key operation
+-// and avoid timing side-channel attacks. Blinding is purely internal to this
+-// function – the random data need not match that used when encrypting.
++// The random parameter is legacy and ignored, and it can be as nil.
+ //
+ // The label parameter must match the value given when encrypting. See
+ // EncryptOAEP for details.
+@@ -570,9 +548,7 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext
+ 		return nil, ErrDecryption
+ 	}
+ 
+-	c := new(big.Int).SetBytes(ciphertext)
+-
+-	m, err := decrypt(random, priv, c)
++	em, err := decrypt(priv, ciphertext)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -581,10 +557,6 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext
+ 	lHash := hash.Sum(nil)
+ 	hash.Reset()
+ 
+-	// We probably leak the number of leading zeros.
+-	// It's not clear that we can do anything about this.
+-	em := m.FillBytes(make([]byte, k))
+-
+ 	firstByteIsZero := subtle.ConstantTimeByteEq(em[0], 0)
+ 
+ 	seed := em[1 : hash.Size()+1]
+-- 
+2.25.1
+
-- 
2.25.1


