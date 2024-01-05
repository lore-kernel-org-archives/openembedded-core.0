Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795B9C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 13:59:46 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.23889.1704463184479941403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 05:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CXN0FzBk;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.51, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so1749752e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 05:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463182; x=1705067982; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0B0bZZs1DpqJTKgzfYJaBuF5fv2drV6Lh0uhqlNLyI=;
        b=CXN0FzBkN1et8v3gSd0EL/Cr1zBtIBWBHmd+97VXwi0TVLImX9R5hFjUTJPw9wdyDf
         FNrasr781NnlixB7tK1nN6Zmno4KRh7+OBql32PECPCBC5H9A2vrJpWx6/gQkO9m/BsP
         7dCYVzfqb01gIYGnhoXWaInlsSRAnDHZEoNE8YLbfTecn1i064fpWOceFGPSaq4mZPBg
         oA1eForPQm6gdS9LUVKxx9axOFzPYxfxw6ggC1mjQ4DbsLAmeNFDAz7sPhlnyJ3gBYcd
         URPVSOhvmnP4mushfUTQXp4/CojbsOMVU16vjFxigw9ywqcZP1GXWDPykuxssT72JkO6
         PYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463182; x=1705067982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0B0bZZs1DpqJTKgzfYJaBuF5fv2drV6Lh0uhqlNLyI=;
        b=uzsS57aXCy6YBTcmDSyWxZzwD/MgnETAd0/OV3x0rV5TqEI2cZbRo2K35VI0tLlRCy
         2hdxXWb0Bobbu7ButYCwNCrUNb5g0cEWwjpk8hseJ75mrUv+HKOe4SIjZsQDY6/L3PUc
         uj5MMFIsaHAOopzlZavqd3QnbPaszCupVnhRQqfXhT8C3adInCqRaju/ydB3TKRWJv0Y
         IHndj7FLW4hkWu695URRDYf14afkihi0AImWXqXsvuFzCszA6Z/JqFE42juWfo6XxZ1A
         1W61aS+hZTD7G4qsj2+xJ+RAMZ97y+frlrJqeKJ6EvY4/M8+Hek7ulBzv7YsIOE1ppCJ
         v1/Q==
X-Gm-Message-State: AOJu0YxoPIFk92EGr4FKCOzXcgBrjQnPHMdIPqBxUlhgyAWrY9dbr5mj
	QHdxsTztWfXIhEBeMzmz71ILBqow/NOVeBFkiiF9HEYDSARU+w==
X-Google-Smtp-Source: AGHT+IFcBv8DfMbvEkP/WYXoYkwKm8KRe8TjASyMDNNoY81lQgWjsfgcAU/o3E8yhtqxLoXPwaI4oqQpfq6OzM7wtw8=
X-Received: by 2002:a05:6512:2821:b0:50e:b3ed:f509 with SMTP id
 cf33-20020a056512282100b0050eb3edf509mr323812lfb.243.1704463180293; Fri, 05
 Jan 2024 05:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20240105073314.1537646-1-vanusuri@mvista.com>
In-Reply-To: <20240105073314.1537646-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 5 Jan 2024 03:59:28 -1000
Message-ID: <CAOSpxdZvxkzYKKhppb7Cce=VyO4sJNEVy4OM6E8C9EdovJ-Brg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] go: Backport fix for CVE-2023-45287
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 13:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193359

V2 also has issues, as flagged by patchtest and my local testing:

Applying: go: Backport fix for CVE-2023-45287
error: corrupt patch at line 2273
error: could not build fake ancestor
Patch failed at 0001 go: Backport fix for CVE-2023-45287

Steve

On Thu, Jan 4, 2024 at 9:33=E2=80=AFPM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport
> [https://github.com/golang/go/commit/9baafabac9a84813a336f068862207d2bb06=
d255
> &
> https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f=
2f3
> &
> https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6=
807
> &
> https://github.com/golang/go/commit/8a81fdf165facdcefa06531de5af98a4db343=
035]
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |    4 +
>  .../go/go-1.14/CVE-2023-45287-pre1.patch      |  393 ++++
>  .../go/go-1.14/CVE-2023-45287-pre2.patch      |  401 ++++
>  .../go/go-1.14/CVE-2023-45287-pre3.patch      |   86 +
>  .../go/go-1.14/CVE-2023-45287.patch           | 1697 +++++++++++++++++
>  5 files changed, 2581 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.=
patch
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.=
patch
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.=
patch
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
> index b827a3606d..42a9ac8435 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -83,6 +83,10 @@ SRC_URI +=3D "\
>      file://CVE-2023-39318.patch \
>      file://CVE-2023-39319.patch \
>      file://CVE-2023-39326.patch \
> +    file://CVE-2023-45287-pre1.patch \
> +    file://CVE-2023-45287-pre2.patch \
> +    file://CVE-2023-45287-pre3.patch \
> +    file://CVE-2023-45287.patch \
>  "
>
>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
> new file mode 100644
> index 0000000000..4d65180253
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
> @@ -0,0 +1,393 @@
> +From 9baafabac9a84813a336f068862207d2bb06d255 Mon Sep 17 00:00:00 2001
> +From: Filippo Valsorda <filippo@golang.org>
> +Date: Wed, 1 Apr 2020 17:25:40 -0400
> +Subject: [PATCH] crypto/rsa: refactor RSA-PSS signing and verification
> +
> +Cleaned up for readability and consistency.
> +
> +There is one tiny behavioral change: when PSSSaltLengthEqualsHash is
> +used and both hash and opts.Hash were set, hash.Size() was used for the
> +salt length instead of opts.Hash.Size(). That's clearly wrong because
> +opts.Hash is documented to override hash.
> +
> +Change-Id: I3e25dad933961eac827c6d2e3bbfe45fc5a6fb0e
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/226937
> +Run-TryBot: Filippo Valsorda <filippo@golang.org>
> +TryBot-Result: Gobot Gobot <gobot@golang.org>
> +Reviewed-by: Katie Hockman <katie@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/9baafabac=
9a84813a336f068862207d2bb06d255]
> +CVE: CVE-2023-45287 #Dependency Patch1
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/crypto/rsa/pss.go | 173 ++++++++++++++++++++++--------------------
> + src/crypto/rsa/rsa.go |   9 ++-
> + 2 files changed, 96 insertions(+), 86 deletions(-)
> +
> +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> +index 3ff0c2f4d0076..f9844d87329a8 100644
> +--- a/src/crypto/rsa/pss.go
> ++++ b/src/crypto/rsa/pss.go
> +@@ -4,9 +4,7 @@
> +
> + package rsa
> +
> +-// This file implements the PSS signature scheme [1].
> +-//
> +-// [1] https://www.emc.com/collateral/white-papers/h11300-pkcs-1v2-2-rs=
a-cryptography-standard-wp.pdf
> ++// This file implements the RSASSA-PSS signature scheme according to RF=
C 8017.
> +
> + import (
> +       "bytes"
> +@@ -17,8 +15,22 @@ import (
> +       "math/big"
> + )
> +
> ++// Per RFC 8017, Section 9.1
> ++//
> ++//     EM =3D MGF1 xor DB || H( 8*0x00 || mHash || salt ) || 0xbc
> ++//
> ++// where
> ++//
> ++//     DB =3D PS || 0x01 || salt
> ++//
> ++// and PS can be empty so
> ++//
> ++//     emLen =3D dbLen + hLen + 1 =3D psLen + sLen + hLen + 2
> ++//
> ++
> + func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Has=
h) ([]byte, error) {
> +-      // See [1], section 9.1.1
> ++      // See RFC 8017, Section 9.1.1.
> ++
> +       hLen :=3D hash.Size()
> +       sLen :=3D len(salt)
> +       emLen :=3D (emBits + 7) / 8
> +@@ -30,7 +42,7 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []by=
te, hash hash.Hash) ([]byt
> +       // 2.  Let mHash =3D Hash(M), an octet string of length hLen.
> +
> +       if len(mHash) !=3D hLen {
> +-              return nil, errors.New("crypto/rsa: input must be hashed =
message")
> ++              return nil, errors.New("crypto/rsa: input must be hashed =
with given hash")
> +       }
> +
> +       // 3.  If emLen < hLen + sLen + 2, output "encoding error" and st=
op.
> +@@ -40,8 +52,9 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []by=
te, hash hash.Hash) ([]byt
> +       }
> +
> +       em :=3D make([]byte, emLen)
> +-      db :=3D em[:emLen-sLen-hLen-2+1+sLen]
> +-      h :=3D em[emLen-sLen-hLen-2+1+sLen : emLen-1]
> ++      psLen :=3D emLen - sLen - hLen - 2
> ++      db :=3D em[:psLen+1+sLen]
> ++      h :=3D em[psLen+1+sLen : emLen-1]
> +
> +       // 4.  Generate a random octet string salt of length sLen; if sLe=
n =3D 0,
> +       //     then salt is the empty string.
> +@@ -69,8 +82,8 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []by=
te, hash hash.Hash) ([]byt
> +       // 8.  Let DB =3D PS || 0x01 || salt; DB is an octet string of le=
ngth
> +       //     emLen - hLen - 1.
> +
> +-      db[emLen-sLen-hLen-2] =3D 0x01
> +-      copy(db[emLen-sLen-hLen-1:], salt)
> ++      db[psLen] =3D 0x01
> ++      copy(db[psLen+1:], salt)
> +
> +       // 9.  Let dbMask =3D MGF(H, emLen - hLen - 1).
> +       //
> +@@ -81,47 +94,57 @@ func emsaPSSEncode(mHash []byte, emBits int, salt []=
byte, hash hash.Hash) ([]byt
> +       // 11. Set the leftmost 8 * emLen - emBits bits of the leftmost o=
ctet in
> +       //     maskedDB to zero.
> +
> +-      db[0] &=3D (0xFF >> uint(8*emLen-emBits))
> ++      db[0] &=3D 0xff >> (8*emLen - emBits)
> +
> +       // 12. Let EM =3D maskedDB || H || 0xbc.
> +-      em[emLen-1] =3D 0xBC
> ++      em[emLen-1] =3D 0xbc
> +
> +       // 13. Output EM.
> +       return em, nil
> + }
> +
> + func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) =
error {
> ++      // See RFC 8017, Section 9.1.2.
> ++
> ++      hLen :=3D hash.Size()
> ++      if sLen =3D=3D PSSSaltLengthEqualsHash {
> ++              sLen =3D hLen
> ++      }
> ++      emLen :=3D (emBits + 7) / 8
> ++      if emLen !=3D len(em) {
> ++              return errors.New("rsa: internal error: inconsistent leng=
th")
> ++      }
> ++
> +       // 1.  If the length of M is greater than the input limitation fo=
r the
> +       //     hash function (2^61 - 1 octets for SHA-1), output "inconsi=
stent"
> +       //     and stop.
> +       //
> +       // 2.  Let mHash =3D Hash(M), an octet string of length hLen.
> +-      hLen :=3D hash.Size()
> +       if hLen !=3D len(mHash) {
> +               return ErrVerification
> +       }
> +
> +       // 3.  If emLen < hLen + sLen + 2, output "inconsistent" and stop=
.
> +-      emLen :=3D (emBits + 7) / 8
> +       if emLen < hLen+sLen+2 {
> +               return ErrVerification
> +       }
> +
> +       // 4.  If the rightmost octet of EM does not have hexadecimal val=
ue
> +       //     0xbc, output "inconsistent" and stop.
> +-      if em[len(em)-1] !=3D 0xBC {
> ++      if em[emLen-1] !=3D 0xbc {
> +               return ErrVerification
> +       }
> +
> +       // 5.  Let maskedDB be the leftmost emLen - hLen - 1 octets of EM=
, and
> +       //     let H be the next hLen octets.
> +       db :=3D em[:emLen-hLen-1]
> +-      h :=3D em[emLen-hLen-1 : len(em)-1]
> ++      h :=3D em[emLen-hLen-1 : emLen-1]
> +
> +       // 6.  If the leftmost 8 * emLen - emBits bits of the leftmost oc=
tet in
> +       //     maskedDB are not all equal to zero, output "inconsistent" =
and
> +       //     stop.
> +-      if em[0]&(0xFF<<uint(8-(8*emLen-emBits))) !=3D 0 {
> ++      var bitMask byte =3D 0xff >> (8*emLen - emBits)
> ++      if em[0] & ^bitMask !=3D 0 {
> +               return ErrVerification
> +       }
> +
> +@@ -132,37 +155,30 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen =
int, hash hash.Hash) error {
> +
> +       // 9.  Set the leftmost 8 * emLen - emBits bits of the leftmost o=
ctet in DB
> +       //     to zero.
> +-      db[0] &=3D (0xFF >> uint(8*emLen-emBits))
> ++      db[0] &=3D bitMask
> +
> ++      // If we don't know the salt length, look for the 0x01 delimiter.
> +       if sLen =3D=3D PSSSaltLengthAuto {
> +-      FindSaltLength:
> +-              for sLen =3D emLen - (hLen + 2); sLen >=3D 0; sLen-- {
> +-                      switch db[emLen-hLen-sLen-2] {
> +-                      case 1:
> +-                              break FindSaltLength
> +-                      case 0:
> +-                              continue
> +-                      default:
> +-                              return ErrVerification
> +-                      }
> +-              }
> +-              if sLen < 0 {
> ++              psLen :=3D bytes.IndexByte(db, 0x01)
> ++              if psLen < 0 {
> +                       return ErrVerification
> +               }
> +-      } else {
> +-              // 10. If the emLen - hLen - sLen - 2 leftmost octets of =
DB are not zero
> +-              //     or if the octet at position emLen - hLen - sLen - =
1 (the leftmost
> +-              //     position is "position 1") does not have hexadecima=
l value 0x01,
> +-              //     output "inconsistent" and stop.
> +-              for _, e :=3D range db[:emLen-hLen-sLen-2] {
> +-                      if e !=3D 0x00 {
> +-                              return ErrVerification
> +-                      }
> +-              }
> +-              if db[emLen-hLen-sLen-2] !=3D 0x01 {
> ++              sLen =3D len(db) - psLen - 1
> ++      }
> ++
> ++      // 10. If the emLen - hLen - sLen - 2 leftmost octets of DB are n=
ot zero
> ++      //     or if the octet at position emLen - hLen - sLen - 1 (the l=
eftmost
> ++      //     position is "position 1") does not have hexadecimal value =
0x01,
> ++      //     output "inconsistent" and stop.
> ++      psLen :=3D emLen - hLen - sLen - 2
> ++      for _, e :=3D range db[:psLen] {
> ++              if e !=3D 0x00 {
> +                       return ErrVerification
> +               }
> +       }
> ++      if db[psLen] !=3D 0x01 {
> ++              return ErrVerification
> ++      }
> +
> +       // 11.  Let salt be the last sLen octets of DB.
> +       salt :=3D db[len(db)-sLen:]
> +@@ -181,19 +197,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen =
int, hash hash.Hash) error {
> +       h0 :=3D hash.Sum(nil)
> +
> +       // 14. If H =3D H', output "consistent." Otherwise, output "incon=
sistent."
> +-      if !bytes.Equal(h0, h) {
> ++      if !bytes.Equal(h0, h) { // TODO: constant time?
> +               return ErrVerification
> +       }
> +       return nil
> + }
> +
> +-// signPSSWithSalt calculates the signature of hashed using PSS [1] wit=
h specified salt.
> ++// signPSSWithSalt calculates the signature of hashed using PSS with sp=
ecified salt.
> + // Note that hashed must be the result of hashing the input message usi=
ng the
> + // given hash function. salt is a random sequence of bytes whose length=
 will be
> + // later used to verify the signature.
> + func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash=
, hashed, salt []byte) (s []byte, err error) {
> +-      nBits :=3D priv.N.BitLen()
> +-      em, err :=3D emsaPSSEncode(hashed, nBits-1, salt, hash.New())
> ++      emBits :=3D priv.N.BitLen() - 1
> ++      em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
> +       if err !=3D nil {
> +               return
> +       }
> +@@ -202,7 +218,7 @@ func signPSSWithSalt(rand io.Reader, priv *PrivateKe=
y, hash crypto.Hash, hashed,
> +       if err !=3D nil {
> +               return
> +       }
> +-      s =3D make([]byte, (nBits+7)/8)
> ++      s =3D make([]byte, priv.Size())
> +       copyWithLeftPad(s, c.Bytes())
> +       return
> + }
> +@@ -223,16 +239,15 @@ type PSSOptions struct {
> +       // PSSSaltLength constants.
> +       SaltLength int
> +
> +-      // Hash, if not zero, overrides the hash function passed to SignP=
SS.
> +-      // This is the only way to specify the hash function when using t=
he
> +-      // crypto.Signer interface.
> ++      // Hash is the hash function used to generate the message digest.=
 If not
> ++      // zero, it overrides the hash function passed to SignPSS. It's r=
equired
> ++      // when using PrivateKey.Sign.
> +       Hash crypto.Hash
> + }
> +
> +-// HashFunc returns pssOpts.Hash so that PSSOptions implements
> +-// crypto.SignerOpts.
> +-func (pssOpts *PSSOptions) HashFunc() crypto.Hash {
> +-      return pssOpts.Hash
> ++// HashFunc returns opts.Hash so that PSSOptions implements crypto.Sign=
erOpts.
> ++func (opts *PSSOptions) HashFunc() crypto.Hash {
> ++      return opts.Hash
> + }
> +
> + func (opts *PSSOptions) saltLength() int {
> +@@ -242,56 +257,50 @@ func (opts *PSSOptions) saltLength() int {
> +       return opts.SaltLength
> + }
> +
> +-// SignPSS calculates the signature of hashed using RSASSA-PSS [1].
> +-// Note that hashed must be the result of hashing the input message usi=
ng the
> +-// given hash function. The opts argument may be nil, in which case sen=
sible
> +-// defaults are used.
> +-func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed=
 []byte, opts *PSSOptions) ([]byte, error) {
> ++// SignPSS calculates the signature of digest using PSS.
> ++//
> ++// digest must be the result of hashing the input message using the giv=
en hash
> ++// function. The opts argument may be nil, in which case sensible defau=
lts are
> ++// used. If opts.Hash is set, it overrides hash.
> ++func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest=
 []byte, opts *PSSOptions) ([]byte, error) {
> ++      if opts !=3D nil && opts.Hash !=3D 0 {
> ++              hash =3D opts.Hash
> ++      }
> ++
> +       saltLength :=3D opts.saltLength()
> +       switch saltLength {
> +       case PSSSaltLengthAuto:
> +-              saltLength =3D (priv.N.BitLen()+7)/8 - 2 - hash.Size()
> ++              saltLength =3D priv.Size() - 2 - hash.Size()
> +       case PSSSaltLengthEqualsHash:
> +               saltLength =3D hash.Size()
> +       }
> +
> +-      if opts !=3D nil && opts.Hash !=3D 0 {
> +-              hash =3D opts.Hash
> +-      }
> +-
> +       salt :=3D make([]byte, saltLength)
> +       if _, err :=3D io.ReadFull(rand, salt); err !=3D nil {
> +               return nil, err
> +       }
> +-      return signPSSWithSalt(rand, priv, hash, hashed, salt)
> ++      return signPSSWithSalt(rand, priv, hash, digest, salt)
> + }
> +
> + // VerifyPSS verifies a PSS signature.
> +-// hashed is the result of hashing the input message using the given ha=
sh
> +-// function and sig is the signature. A valid signature is indicated by
> +-// returning a nil error. The opts argument may be nil, in which case s=
ensible
> +-// defaults are used.
> +-func VerifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []b=
yte, opts *PSSOptions) error {
> +-      return verifyPSS(pub, hash, hashed, sig, opts.saltLength())
> +-}
> +-
> +-// verifyPSS verifies a PSS signature with the given salt length.
> +-func verifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []b=
yte, saltLen int) error {
> +-      nBits :=3D pub.N.BitLen()
> +-      if len(sig) !=3D (nBits+7)/8 {
> ++//
> ++// A valid signature is indicated by returning a nil error. digest must=
 be the
> ++// result of hashing the input message using the given hash function. T=
he opts
> ++// argument may be nil, in which case sensible defaults are used. opts.=
Hash is
> ++// ignored.
> ++func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []b=
yte, opts *PSSOptions) error {
> ++      if len(sig) !=3D pub.Size() {
> +               return ErrVerification
> +       }
> +       s :=3D new(big.Int).SetBytes(sig)
> +       m :=3D encrypt(new(big.Int), pub, s)
> +-      emBits :=3D nBits - 1
> ++      emBits :=3D pub.N.BitLen() - 1
> +       emLen :=3D (emBits + 7) / 8
> +-      if emLen < len(m.Bytes()) {
> ++      emBytes :=3D m.Bytes()
> ++      if emLen < len(emBytes) {
> +               return ErrVerification
> +       }
> +       em :=3D make([]byte, emLen)
> +-      copyWithLeftPad(em, m.Bytes())
> +-      if saltLen =3D=3D PSSSaltLengthEqualsHash {
> +-              saltLen =3D hash.Size()
> +-      }
> +-      return emsaPSSVerify(hashed, em, emBits, saltLen, hash.New())
> ++      copyWithLeftPad(em, emBytes)
> ++      return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.=
New())
> + }
> +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
> +index 5a42990640164..b4bfa13defbdf 100644
> +--- a/src/crypto/rsa/rsa.go
> ++++ b/src/crypto/rsa/rsa.go
> +@@ -2,7 +2,7 @@
> + // Use of this source code is governed by a BSD-style
> + // license that can be found in the LICENSE file.
> +
> +-// Package rsa implements RSA encryption as specified in PKCS#1.
> ++// Package rsa implements RSA encryption as specified in PKCS#1 and RFC=
 8017.
> + //
> + // RSA is a single, fundamental operation that is used in this package =
to
> + // implement either public-key encryption or public-key signatures.
> +@@ -10,13 +10,13 @@
> + // The original specification for encryption and signatures with RSA is=
 PKCS#1
> + // and the terms "RSA encryption" and "RSA signatures" by default refer=
 to
> + // PKCS#1 version 1.5. However, that specification has flaws and new de=
signs
> +-// should use version two, usually called by just OAEP and PSS, where
> ++// should use version 2, usually called by just OAEP and PSS, where
> + // possible.
> + //
> + // Two sets of interfaces are included in this package. When a more abs=
tract
> + // interface isn't necessary, there are functions for encrypting/decryp=
ting
> + // with v1.5/OAEP and signing/verifying with v1.5/PSS. If one needs to =
abstract
> +-// over the public-key primitive, the PrivateKey struct implements the
> ++// over the public key primitive, the PrivateKey type implements the
> + // Decrypter and Signer interfaces from the crypto package.
> + //
> + // The RSA operations in this package are not implemented using constan=
t-time algorithms.
> +@@ -111,7 +111,8 @@ func (priv *PrivateKey) Public() crypto.PublicKey {
> +
> + // Sign signs digest with priv, reading randomness from rand. If opts i=
s a
> + // *PSSOptions then the PSS algorithm will be used, otherwise PKCS#1 v1=
.5 will
> +-// be used.
> ++// be used. digest must be the result of hashing the input message usin=
g
> ++// opts.HashFunc().
> + //
> + // This method implements crypto.Signer, which is an interface to suppo=
rt keys
> + // where the private part is kept in, for example, a hardware module. C=
ommon
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
> new file mode 100644
> index 0000000000..1327b44545
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
> @@ -0,0 +1,401 @@
> +From c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3 Mon Sep 17 00:00:00 2001
> +From: Filippo Valsorda <filippo@golang.org>
> +Date: Mon, 27 Apr 2020 21:52:38 -0400
> +Subject: [PATCH] math/big: add (*Int).FillBytes
> +
> +Replaced almost every use of Bytes with FillBytes.
> +
> +Note that the approved proposal was for
> +
> +    func (*Int) FillBytes(buf []byte)
> +
> +while this implements
> +
> +    func (*Int) FillBytes(buf []byte) []byte
> +
> +because the latter was far nicer to use in all callsites.
> +
> +Fixes #35833
> +
> +Change-Id: Ia912df123e5d79b763845312ea3d9a8051343c0a
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/230397
> +Reviewed-by: Robert Griesemer <gri@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/c9d5f60ea=
a4450ccf1ce878d55b4c6a12843f2f3]
> +CVE: CVE-2023-45287 #Dependency Patch2
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/crypto/elliptic/elliptic.go | 13 ++++----
> + src/crypto/rsa/pkcs1v15.go      | 20 +++---------
> + src/crypto/rsa/pss.go           | 17 +++++------
> + src/crypto/rsa/rsa.go           | 32 +++----------------
> + src/crypto/tls/key_schedule.go  |  7 ++---
> + src/crypto/x509/sec1.go         |  7 ++---
> + src/math/big/int.go             | 15 +++++++++
> + src/math/big/int_test.go        | 54 +++++++++++++++++++++++++++++++++
> + src/math/big/nat.go             | 15 ++++++---
> + 9 files changed, 106 insertions(+), 74 deletions(-)
> +
> +diff --git a/src/crypto/elliptic/elliptic.go b/src/crypto/elliptic/ellip=
tic.go
> +index e2f71cdb63bab..bd5168c5fd842 100644
> +--- a/src/crypto/elliptic/elliptic.go
> ++++ b/src/crypto/elliptic/elliptic.go
> +@@ -277,7 +277,7 @@ var mask =3D []byte{0xff, 0x1, 0x3, 0x7, 0xf, 0x1f, =
0x3f, 0x7f}
> + func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.I=
nt, err error) {
> +       N :=3D curve.Params().N
> +       bitSize :=3D N.BitLen()
> +-      byteLen :=3D (bitSize + 7) >> 3
> ++      byteLen :=3D (bitSize + 7) / 8
> +       priv =3D make([]byte, byteLen)
> +
> +       for x =3D=3D nil {
> +@@ -304,15 +304,14 @@ func GenerateKey(curve Curve, rand io.Reader) (pri=
v []byte, x, y *big.Int, err e
> +
> + // Marshal converts a point into the uncompressed form specified in sec=
tion 4.3.6 of ANSI X9.62.
> + func Marshal(curve Curve, x, y *big.Int) []byte {
> +-      byteLen :=3D (curve.Params().BitSize + 7) >> 3
> ++      byteLen :=3D (curve.Params().BitSize + 7) / 8
> +
> +       ret :=3D make([]byte, 1+2*byteLen)
> +       ret[0] =3D 4 // uncompressed point
> +
> +-      xBytes :=3D x.Bytes()
> +-      copy(ret[1+byteLen-len(xBytes):], xBytes)
> +-      yBytes :=3D y.Bytes()
> +-      copy(ret[1+2*byteLen-len(yBytes):], yBytes)
> ++      x.FillBytes(ret[1 : 1+byteLen])
> ++      y.FillBytes(ret[1+byteLen : 1+2*byteLen])
> ++
> +       return ret
> + }
> +
> +@@ -320,7 +319,7 @@ func Marshal(curve Curve, x, y *big.Int) []byte {
> + // It is an error if the point is not in uncompressed form or is not on=
 the curve.
> + // On error, x =3D nil.
> + func Unmarshal(curve Curve, data []byte) (x, y *big.Int) {
> +-      byteLen :=3D (curve.Params().BitSize + 7) >> 3
> ++      byteLen :=3D (curve.Params().BitSize + 7) / 8
> +       if len(data) !=3D 1+2*byteLen {
> +               return
> +       }
> +diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
> +index 499242ffc5b57..3208119ae1ff4 100644
> +--- a/src/crypto/rsa/pkcs1v15.go
> ++++ b/src/crypto/rsa/pkcs1v15.go
> +@@ -61,8 +61,7 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey, m=
sg []byte) ([]byte, error)
> +       m :=3D new(big.Int).SetBytes(em)
> +       c :=3D encrypt(new(big.Int), pub, m)
> +
> +-      copyWithLeftPad(em, c.Bytes())
> +-      return em, nil
> ++      return c.FillBytes(em), nil
> + }
> +
> + // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding schem=
e from PKCS#1 v1.5.
> +@@ -150,7 +149,7 @@ func decryptPKCS1v15(rand io.Reader, priv *PrivateKe=
y, ciphertext []byte) (valid
> +               return
> +       }
> +
> +-      em =3D leftPad(m.Bytes(), k)
> ++      em =3D m.FillBytes(make([]byte, k))
> +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> +       secondByteIsTwo :=3D subtle.ConstantTimeByteEq(em[1], 2)
> +
> +@@ -256,8 +255,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKey, =
hash crypto.Hash, hashed []b
> +               return nil, err
> +       }
> +
> +-      copyWithLeftPad(em, c.Bytes())
> +-      return em, nil
> ++      return c.FillBytes(em), nil
> + }
> +
> + // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.
> +@@ -286,7 +284,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash=
, hashed []byte, sig []byte)
> +
> +       c :=3D new(big.Int).SetBytes(sig)
> +       m :=3D encrypt(new(big.Int), pub, c)
> +-      em :=3D leftPad(m.Bytes(), k)
> ++      em :=3D m.FillBytes(make([]byte, k))
> +       // EM =3D 0x00 || 0x01 || PS || 0x00 || T
> +
> +       ok :=3D subtle.ConstantTimeByteEq(em[0], 0)
> +@@ -323,13 +321,3 @@ func pkcs1v15HashInfo(hash crypto.Hash, inLen int) =
(hashLen int, prefix []byte,
> +       }
> +       return
> + }
> +-
> +-// copyWithLeftPad copies src to the end of dest, padding with zero byt=
es as
> +-// needed.
> +-func copyWithLeftPad(dest, src []byte) {
> +-      numPaddingBytes :=3D len(dest) - len(src)
> +-      for i :=3D 0; i < numPaddingBytes; i++ {
> +-              dest[i] =3D 0
> +-      }
> +-      copy(dest[numPaddingBytes:], src)
> +-}
> +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> +index f9844d87329a8..b2adbedb28fa8 100644
> +--- a/src/crypto/rsa/pss.go
> ++++ b/src/crypto/rsa/pss.go
> +@@ -207,20 +207,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen =
int, hash hash.Hash) error {
> + // Note that hashed must be the result of hashing the input message usi=
ng the
> + // given hash function. salt is a random sequence of bytes whose length=
 will be
> + // later used to verify the signature.
> +-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash=
, hashed, salt []byte) (s []byte, err error) {
> ++func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash=
, hashed, salt []byte) ([]byte, error) {
> +       emBits :=3D priv.N.BitLen() - 1
> +       em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
> +       if err !=3D nil {
> +-              return
> ++              return nil, err
> +       }
> +       m :=3D new(big.Int).SetBytes(em)
> +       c, err :=3D decryptAndCheck(rand, priv, m)
> +       if err !=3D nil {
> +-              return
> ++              return nil, err
> +       }
> +-      s =3D make([]byte, priv.Size())
> +-      copyWithLeftPad(s, c.Bytes())
> +-      return
> ++      s :=3D make([]byte, priv.Size())
> ++      return c.FillBytes(s), nil
> + }
> +
> + const (
> +@@ -296,11 +295,9 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash, di=
gest []byte, sig []byte, opts
> +       m :=3D encrypt(new(big.Int), pub, s)
> +       emBits :=3D pub.N.BitLen() - 1
> +       emLen :=3D (emBits + 7) / 8
> +-      emBytes :=3D m.Bytes()
> +-      if emLen < len(emBytes) {
> ++      if m.BitLen() > emLen*8 {
> +               return ErrVerification
> +       }
> +-      em :=3D make([]byte, emLen)
> +-      copyWithLeftPad(em, emBytes)
> ++      em :=3D m.FillBytes(make([]byte, emLen))
> +       return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.=
New())
> + }
> +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
> +index b4bfa13defbdf..28eb5926c1a54 100644
> +--- a/src/crypto/rsa/rsa.go
> ++++ b/src/crypto/rsa/rsa.go
> +@@ -416,16 +416,9 @@ func EncryptOAEP(hash hash.Hash, random io.Reader, =
pub *PublicKey, msg []byte, l
> +       m :=3D new(big.Int)
> +       m.SetBytes(em)
> +       c :=3D encrypt(new(big.Int), pub, m)
> +-      out :=3D c.Bytes()
> +
> +-      if len(out) < k {
> +-              // If the output is too small, we need to left-pad with z=
eros.
> +-              t :=3D make([]byte, k)
> +-              copy(t[k-len(out):], out)
> +-              out =3D t
> +-      }
> +-
> +-      return out, nil
> ++      out :=3D make([]byte, k)
> ++      return c.FillBytes(out), nil
> + }
> +
> + // ErrDecryption represents a failure to decrypt a message.
> +@@ -597,12 +590,9 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, =
priv *PrivateKey, ciphertext
> +       lHash :=3D hash.Sum(nil)
> +       hash.Reset()
> +
> +-      // Converting the plaintext number to bytes will strip any
> +-      // leading zeros so we may have to left pad. We do this unconditi=
onally
> +-      // to avoid leaking timing information. (Although we still probab=
ly
> +-      // leak the number of leading zeros. It's not clear that we can d=
o
> +-      // anything about this.)
> +-      em :=3D leftPad(m.Bytes(), k)
> ++      // We probably leak the number of leading zeros.
> ++      // It's not clear that we can do anything about this.
> ++      em :=3D m.FillBytes(make([]byte, k))
> +
> +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> +
> +@@ -643,15 +633,3 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, =
priv *PrivateKey, ciphertext
> +
> +       return rest[index+1:], nil
> + }
> +-
> +-// leftPad returns a new slice of length size. The contents of input ar=
e right
> +-// aligned in the new slice.
> +-func leftPad(input []byte, size int) (out []byte) {
> +-      n :=3D len(input)
> +-      if n > size {
> +-              n =3D size
> +-      }
> +-      out =3D make([]byte, size)
> +-      copy(out[len(out)-n:], input)
> +-      return
> +-}
> +diff --git a/src/crypto/tls/key_schedule.go b/src/crypto/tls/key_schedul=
e.go
> +index 2aab323202f7d..314016979afb8 100644
> +--- a/src/crypto/tls/key_schedule.go
> ++++ b/src/crypto/tls/key_schedule.go
> +@@ -173,11 +173,8 @@ func (p *nistParameters) SharedKey(peerPublicKey []=
byte) []byte {
> +       }
> +
> +       xShared, _ :=3D curve.ScalarMult(x, y, p.privateKey)
> +-      sharedKey :=3D make([]byte, (curve.Params().BitSize+7)>>3)
> +-      xBytes :=3D xShared.Bytes()
> +-      copy(sharedKey[len(sharedKey)-len(xBytes):], xBytes)
> +-
> +-      return sharedKey
> ++      sharedKey :=3D make([]byte, (curve.Params().BitSize+7)/8)
> ++      return xShared.FillBytes(sharedKey)
> + }
> +
> + type x25519Parameters struct {
> +diff --git a/src/crypto/x509/sec1.go b/src/crypto/x509/sec1.go
> +index 0bfb90cd5464a..52c108ff1d624 100644
> +--- a/src/crypto/x509/sec1.go
> ++++ b/src/crypto/x509/sec1.go
> +@@ -52,13 +52,10 @@ func MarshalECPrivateKey(key *ecdsa.PrivateKey) ([]b=
yte, error) {
> + // marshalECPrivateKey marshals an EC private key into ASN.1, DER forma=
t and
> + // sets the curve ID to the given OID, or omits it if OID is nil.
> + func marshalECPrivateKeyWithOID(key *ecdsa.PrivateKey, oid asn1.ObjectI=
dentifier) ([]byte, error) {
> +-      privateKeyBytes :=3D key.D.Bytes()
> +-      paddedPrivateKey :=3D make([]byte, (key.Curve.Params().N.BitLen()=
+7)/8)
> +-      copy(paddedPrivateKey[len(paddedPrivateKey)-len(privateKeyBytes):=
], privateKeyBytes)
> +-
> ++      privateKey :=3D make([]byte, (key.Curve.Params().N.BitLen()+7)/8)
> +       return asn1.Marshal(ecPrivateKey{
> +               Version:       1,
> +-              PrivateKey:    paddedPrivateKey,
> ++              PrivateKey:    key.D.FillBytes(privateKey),
> +               NamedCurveOID: oid,
> +               PublicKey:     asn1.BitString{Bytes: elliptic.Marshal(key=
.Curve, key.X, key.Y)},
> +       })
> +diff --git a/src/math/big/int.go b/src/math/big/int.go
> +index 8816cf5266cc4..65f32487b58c0 100644
> +--- a/src/math/big/int.go
> ++++ b/src/math/big/int.go
> +@@ -447,11 +447,26 @@ func (z *Int) SetBytes(buf []byte) *Int {
> + }
> +
> + // Bytes returns the absolute value of x as a big-endian byte slice.
> ++//
> ++// To use a fixed length slice, or a preallocated one, use FillBytes.
> + func (x *Int) Bytes() []byte {
> +       buf :=3D make([]byte, len(x.abs)*_S)
> +       return buf[x.abs.bytes(buf):]
> + }
> +
> ++// FillBytes sets buf to the absolute value of x, storing it as a zero-=
extended
> ++// big-endian byte slice, and returns buf.
> ++//
> ++// If the absolute value of x doesn't fit in buf, FillBytes will panic.
> ++func (x *Int) FillBytes(buf []byte) []byte {
> ++      // Clear whole buffer. (This gets optimized into a memclr.)
> ++      for i :=3D range buf {
> ++              buf[i] =3D 0
> ++      }
> ++      x.abs.bytes(buf)
> ++      return buf
> ++}
> ++
> + // BitLen returns the length of the absolute value of x in bits.
> + // The bit length of 0 is 0.
> + func (x *Int) BitLen() int {
> +diff --git a/src/math/big/int_test.go b/src/math/big/int_test.go
> +index e3a1587b3f0ad..3c8557323a032 100644
> +--- a/src/math/big/int_test.go
> ++++ b/src/math/big/int_test.go
> +@@ -1840,3 +1840,57 @@ func BenchmarkDiv(b *testing.B) {
> +               })
> +       }
> + }
> ++
> ++func TestFillBytes(t *testing.T) {
> ++      checkResult :=3D func(t *testing.T, buf []byte, want *Int) {
> ++              t.Helper()
> ++              got :=3D new(Int).SetBytes(buf)
> ++              if got.CmpAbs(want) !=3D 0 {
> ++                      t.Errorf("got 0x%x, want 0x%x: %x", got, want, bu=
f)
> ++              }
> ++      }
> ++      panics :=3D func(f func()) (panic bool) {
> ++              defer func() { panic =3D recover() !=3D nil }()
> ++              f()
> ++              return
> ++      }
> ++
> ++      for _, n :=3D range []string{
> ++              "0",
> ++              "1000",
> ++              "0xffffffff",
> ++              "-0xffffffff",
> ++              "0xffffffffffffffff",
> ++              "0x10000000000000000",
> ++              "0xabababababababababababababababababababababababababa",
> ++              "0xffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff",
> ++      } {
> ++              t.Run(n, func(t *testing.T) {
> ++                      t.Logf(n)
> ++                      x, ok :=3D new(Int).SetString(n, 0)
> ++                      if !ok {
> ++                              panic("invalid test entry")
> ++                      }
> ++
> ++                      // Perfectly sized buffer.
> ++                      byteLen :=3D (x.BitLen() + 7) / 8
> ++                      buf :=3D make([]byte, byteLen)
> ++                      checkResult(t, x.FillBytes(buf), x)
> ++
> ++                      // Way larger, checking all bytes get zeroed.
> ++                      buf =3D make([]byte, 100)
> ++                      for i :=3D range buf {
> ++                              buf[i] =3D 0xff
> ++                      }
> ++                      checkResult(t, x.FillBytes(buf), x)
> ++
> ++                      // Too small.
> ++                      if byteLen > 0 {
> ++                              buf =3D make([]byte, byteLen-1)
> ++                              if !panics(func() { x.FillBytes(buf) }) {
> ++                                      t.Errorf("expected panic for smal=
l buffer and value %x", x)
> ++                              }
> ++                      }
> ++              })
> ++      }
> ++}
> +diff --git a/src/math/big/nat.go b/src/math/big/nat.go
> +index c31ec5156b81d..6a3989bf9d82b 100644
> +--- a/src/math/big/nat.go
> ++++ b/src/math/big/nat.go
> +@@ -1476,19 +1476,26 @@ func (z nat) expNNMontgomery(x, y, m nat) nat {
> + }
> +
> + // bytes writes the value of z into buf using big-endian encoding.
> +-// len(buf) must be >=3D len(z)*_S. The value of z is encoded in the
> +-// slice buf[i:]. The number i of unused bytes at the beginning of
> +-// buf is returned as result.
> ++// The value of z is encoded in the slice buf[i:]. If the value of z
> ++// cannot be represented in buf, bytes panics. The number i of unused
> ++// bytes at the beginning of buf is returned as result.
> + func (z nat) bytes(buf []byte) (i int) {
> +       i =3D len(buf)
> +       for _, d :=3D range z {
> +               for j :=3D 0; j < _S; j++ {
> +                       i--
> +-                      buf[i] =3D byte(d)
> ++                      if i >=3D 0 {
> ++                              buf[i] =3D byte(d)
> ++                      } else if byte(d) !=3D 0 {
> ++                              panic("math/big: buffer too small to fit =
value")
> ++                      }
> +                       d >>=3D 8
> +               }
> +       }
> +
> ++      if i < 0 {
> ++              i =3D 0
> ++      }
> +       for i < len(buf) && buf[i] =3D=3D 0 {
> +               i++
> +       }
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
> new file mode 100644
> index 0000000000..ae9fcc170c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
> @@ -0,0 +1,86 @@
> +From 8f676144ad7b7c91adb0c6e1ec89aaa6283c6807 Mon Sep 17 00:00:00 2001
> +From: Himanshu Kishna Srivastava <28himanshu@gmail.com>
> +Date: Tue, 16 Mar 2021 22:37:46 +0530
> +Subject: [PATCH] crypto/rsa: fix salt length calculation with
> + PSSSaltLengthAuto
> +
> +When PSSSaltLength is set, the maximum salt length must equal:
> +
> +    (modulus_key_size - 1 + 7)/8 - hash_length - 2
> +and for example, with a 4096 bit modulus key, and a SHA-1 hash,
> +it should be:
> +
> +     (4096 -1 + 7)/8 - 20 - 2 =3D 490
> +Previously we'd encounter this error:
> +
> +     crypto/rsa: key size too small for PSS signature
> +
> +Fixes #42741
> +
> +Change-Id: I18bb82c41c511d564b3f4c443f4b3a38ab010ac5
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/302230
> +Reviewed-by: Emmanuel Odeke <emmanuel@orijtech.com>
> +Reviewed-by: Filippo Valsorda <filippo@golang.org>
> +Trust: Emmanuel Odeke <emmanuel@orijtech.com>
> +Run-TryBot: Emmanuel Odeke <emmanuel@orijtech.com>
> +TryBot-Result: Go Bot <gobot@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/8f676144a=
d7b7c91adb0c6e1ec89aaa6283c6807]
> +CVE: CVE-2023-45287 #Dependency Patch3
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/crypto/rsa/pss.go      |  2 +-
> + src/crypto/rsa/pss_test.go | 20 +++++++++++++++++++-
> + 2 files changed, 20 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> +index b2adbedb28fa8..814522de8181f 100644
> +--- a/src/crypto/rsa/pss.go
> ++++ b/src/crypto/rsa/pss.go
> +@@ -269,7 +269,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash =
crypto.Hash, digest []byte,
> +       saltLength :=3D opts.saltLength()
> +       switch saltLength {
> +       case PSSSaltLengthAuto:
> +-              saltLength =3D priv.Size() - 2 - hash.Size()
> ++              saltLength =3D (priv.N.BitLen()-1+7)/8 - 2 - hash.Size()
> +       case PSSSaltLengthEqualsHash:
> +               saltLength =3D hash.Size()
> +       }
> +diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
> +index dfa8d8bb5ad02..c3a6d468497cd 100644
> +--- a/src/crypto/rsa/pss_test.go
> ++++ b/src/crypto/rsa/pss_test.go
> +@@ -12,7 +12,7 @@ import (
> +       _ "crypto/md5"
> +       "crypto/rand"
> +       "crypto/sha1"
> +-      _ "crypto/sha256"
> ++      "crypto/sha256"
> +       "encoding/hex"
> +       "math/big"
> +       "os"
> +@@ -233,6 +233,24 @@ func TestPSSSigning(t *testing.T) {
> +       }
> + }
> +
> ++func TestSignWithPSSSaltLengthAuto(t *testing.T) {
> ++      key, err :=3D GenerateKey(rand.Reader, 513)
> ++      if err !=3D nil {
> ++              t.Fatal(err)
> ++      }
> ++      digest :=3D sha256.Sum256([]byte("message"))
> ++      signature, err :=3D key.Sign(rand.Reader, digest[:], &PSSOptions{
> ++              SaltLength: PSSSaltLengthAuto,
> ++              Hash:       crypto.SHA256,
> ++      })
> ++      if err !=3D nil {
> ++              t.Fatal(err)
> ++      }
> ++      if len(signature) =3D=3D 0 {
> ++              t.Fatal("empty signature returned")
> ++      }
> ++}
> ++
> + func bigFromHex(hex string) *big.Int {
> +       n, ok :=3D new(big.Int).SetString(hex, 16)
> +       if !ok {
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
> new file mode 100644
> index 0000000000..a62c1258f8
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
> @@ -0,0 +1,1697 @@
> +From 8a81fdf165facdcefa06531de5af98a4db343035 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?L=3DC3=3DBAc=3DC3=3DA1s=3D20Meier?=3D <cronokirby@gmai=
l.com>
> +Date: Tue, 8 Jun 2021 21:36:06 +0200
> +Subject: [PATCH] crypto/rsa: replace big.Int for encryption and decrypti=
on
> +
> +Infamously, big.Int does not provide constant-time arithmetic, making
> +its use in cryptographic code quite tricky. RSA uses big.Int
> +pervasively, in its public API, for key generation, precomputation, and
> +for encryption and decryption. This is a known problem. One mitigation,
> +blinding, is already in place during decryption. This helps mitigate the
> +very leaky exponentiation operation. Because big.Int is fundamentally
> +not constant-time, it's unfortunately difficult to guarantee that
> +mitigations like these are completely effective.
> +
> +This patch removes the use of big.Int for encryption and decryption,
> +replacing it with an internal nat type instead. Signing and verification
> +are also affected, because they depend on encryption and decryption.
> +
> +Overall, this patch degrades performance by 55% for private key
> +operations, and 4-5x for (much faster) public key operations.
> +(Signatures do both, so the slowdown is worse than decryption.)
> +
> +name                    old time/op  new time/op    delta
> +DecryptPKCS1v15/2048-8  1.50ms =C2=B1 0%    2.34ms =C2=B1 0%    +56.44% =
 (p=3D0.000 n=3D8+10)
> +DecryptPKCS1v15/3072-8  4.40ms =C2=B1 0%    6.79ms =C2=B1 0%    +54.33% =
 (p=3D0.000 n=3D10+9)
> +DecryptPKCS1v15/4096-8  9.31ms =C2=B1 0%   15.14ms =C2=B1 0%    +62.60% =
 (p=3D0.000 n=3D10+10)
> +EncryptPKCS1v15/2048-8  8.16=C2=B5s =C2=B1 0%  355.58=C2=B5s =C2=B1 0%  =
+4258.90%  (p=3D0.000 n=3D10+9)
> +DecryptOAEP/2048-8      1.50ms =C2=B1 0%    2.34ms =C2=B1 0%    +55.68% =
 (p=3D0.000 n=3D10+9)
> +EncryptOAEP/2048-8      8.51=C2=B5s =C2=B1 0%  355.95=C2=B5s =C2=B1 0%  =
+4082.75%  (p=3D0.000 n=3D10+9)
> +SignPKCS1v15/2048-8     1.51ms =C2=B1 0%    2.69ms =C2=B1 0%    +77.94% =
 (p=3D0.000 n=3D10+10)
> +VerifyPKCS1v15/2048-8   7.25=C2=B5s =C2=B1 0%  354.34=C2=B5s =C2=B1 0%  =
+4789.52%  (p=3D0.000 n=3D9+9)
> +SignPSS/2048-8          1.51ms =C2=B1 0%    2.70ms =C2=B1 0%    +78.80% =
 (p=3D0.000 n=3D9+10)
> +VerifyPSS/2048-8        8.27=C2=B5s =C2=B1 1%  355.65=C2=B5s =C2=B1 0%  =
+4199.39%  (p=3D0.000 n=3D10+10)
> +
> +Keep in mind that this is without any assembly at all, and that further
> +improvements are likely possible. I think having a review of the logic
> +and the cryptography would be a good idea at this stage, before we
> +complicate the code too much through optimization.
> +
> +The bulk of the work is in nat.go. This introduces two new types: nat,
> +representing natural numbers, and modulus, representing moduli used in
> +modular arithmetic.
> +
> +A nat has an "announced size", which may be larger than its "true size",
> +the number of bits needed to represent this number. Operations on a nat
> +will only ever leak its announced size, never its true size, or other
> +information about its value. The size of a nat is always clear based on
> +how its value is set. For example, x.mod(y, m) will make the announced
> +size of x match that of m, since x is reduced modulo m.
> +
> +Operations assume that the announced size of the operands match what's
> +expected (with a few exceptions). For example, x.modAdd(y, m) assumes
> +that x and y have the same announced size as m, and that they're reduced
> +modulo m.
> +
> +Nats are represented over unsatured bits.UintSize - 1 bit limbs. This
> +means that we can't reuse the assembly routines for big.Int, which use
> +saturated bits.UintSize limbs. The advantage of unsaturated limbs is
> +that it makes Montgomery multiplication faster, by needing fewer
> +registers in a hot loop. This makes exponentiation faster, which
> +consists of many Montgomery multiplications.
> +
> +Moduli use nat internally. Unlike nat, the true size of a modulus always
> +matches its announced size. When creating a modulus, any zero padding is
> +removed. Moduli will also precompute constants when created, which is
> +another reason why having a separate type is desirable.
> +
> +Updates #20654
> +
> +Co-authored-by: Filippo Valsorda <filippo@golang.org>
> +Change-Id: I73b61f87d58ab912e80a9644e255d552cbadcced
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/326012
> +Run-TryBot: Filippo Valsorda <filippo@golang.org>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Reviewed-by: Roland Shoemaker <roland@golang.org>
> +Reviewed-by: Joedian Reid <joedian@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/8a81fdf16=
5facdcefa06531de5af98a4db343035]
> +CVE: CVE-2023-45287
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/crypto/rsa/example_test.go |  21 +-
> + src/crypto/rsa/nat.go          | 626 +++++++++++++++++++++++++++++++++
> + src/crypto/rsa/nat_test.go     | 384 ++++++++++++++++++++
> + src/crypto/rsa/pkcs1v15.go     |  47 +--
> + src/crypto/rsa/pss.go          |  50 ++-
> + src/crypto/rsa/pss_test.go     |  10 +-
> + src/crypto/rsa/rsa.go          | 174 ++++-----
> + 7 files changed, 1143 insertions(+), 169 deletions(-)
> + create mode 100644 src/crypto/rsa/nat.go
> + create mode 100644 src/crypto/rsa/nat_test.go
> +
> +diff --git a/src/crypto/rsa/example_test.go b/src/crypto/rsa/example_tes=
t.go
> +index 1435b70..1963609 100644
> +--- a/src/crypto/rsa/example_test.go
> ++++ b/src/crypto/rsa/example_test.go
> +@@ -12,7 +12,6 @@ import (
> +       "crypto/sha256"
> +       "encoding/hex"
> +       "fmt"
> +-      "io"
> +       "os"
> + )
> +
> +@@ -36,21 +35,17 @@ import (
> + // a buffer that contains a random key. Thus, if the RSA result isn't
> + // well-formed, the implementation uses a random key in constant time.
> + func ExampleDecryptPKCS1v15SessionKey() {
> +-      // crypto/rand.Reader is a good source of entropy for blinding th=
e RSA
> +-      // operation.
> +-      rng :=3D rand.Reader
> +-
> +       // The hybrid scheme should use at least a 16-byte symmetric key.=
 Here
> +       // we read the random key that will be used if the RSA decryption=
 isn't
> +       // well-formed.
> +       key :=3D make([]byte, 32)
> +-      if _, err :=3D io.ReadFull(rng, key); err !=3D nil {
> ++      if _, err :=3D rand.Read(key); err !=3D nil {
> +               panic("RNG failure")
> +       }
> +
> +       rsaCiphertext, _ :=3D hex.DecodeString("aabbccddeeff")
> +
> +-      if err :=3D DecryptPKCS1v15SessionKey(rng, rsaPrivateKey, rsaCiph=
ertext, key); err !=3D nil {
> ++      if err :=3D DecryptPKCS1v15SessionKey(nil, rsaPrivateKey, rsaCiph=
ertext, key); err !=3D nil {
> +               // Any errors that result will be =E2=80=9Cpublic=E2=80=
=9D =E2=80=93 meaning that they
> +               // can be determined without any secret information. (For
> +               // instance, if the length of key is impossible given the=
 RSA
> +@@ -86,10 +81,6 @@ func ExampleDecryptPKCS1v15SessionKey() {
> + }
> +
> + func ExampleSignPKCS1v15() {
> +-      // crypto/rand.Reader is a good source of entropy for blinding th=
e RSA
> +-      // operation.
> +-      rng :=3D rand.Reader
> +-
> +       message :=3D []byte("message to be signed")
> +
> +       // Only small messages can be signed directly; thus the hash of a
> +@@ -99,7 +90,7 @@ func ExampleSignPKCS1v15() {
> +       // of writing (2016).
> +       hashed :=3D sha256.Sum256(message)
> +
> +-      signature, err :=3D SignPKCS1v15(rng, rsaPrivateKey, crypto.SHA25=
6, hashed[:])
> ++      signature, err :=3D SignPKCS1v15(nil, rsaPrivateKey, crypto.SHA25=
6, hashed[:])
> +       if err !=3D nil {
> +               fmt.Fprintf(os.Stderr, "Error from signing: %s\n", err)
> +               return
> +@@ -151,11 +142,7 @@ func ExampleDecryptOAEP() {
> +       ciphertext, _ :=3D hex.DecodeString("4d1ee10e8f286390258c51a5e808=
02844c3e6358ad6690b7285218a7c7ed7fc3a4c7b950fbd04d4b0239cc060dcc7065ca6f84c=
1756deb71ca5685cadbb82be025e16449b905c568a19c088a1abfad54bf7ecc67a7df39943e=
c511091a34c0f2348d04e058fcff4d55644de3cd1d580791d4524b92f3e91695582e6e340a1=
c50b6c6d78e80b4e42c5b4d45e479b492de42bbd39cc642ebb80226bb5200020d501b24a37b=
cc2ec7f34e596b4fd6b063de4858dbf5a4e3dd18e262eda0ec2d19dbd8e890d672b63d36876=
8360b20c0b6b8592a438fa275e5fa7f60bef0dd39673fd3989cc54d2cb80c08fcd19dacbc26=
5ee1c6014616b0e04ea0328c2a04e73460")
> +       label :=3D []byte("orders")
> +
> +-      // crypto/rand.Reader is a good source of entropy for blinding th=
e RSA
> +-      // operation.
> +-      rng :=3D rand.Reader
> +-
> +-      plaintext, err :=3D DecryptOAEP(sha256.New(), rng, test2048Key, c=
iphertext, label)
> ++      plaintext, err :=3D DecryptOAEP(sha256.New(), nil, test2048Key, c=
iphertext, label)
> +       if err !=3D nil {
> +               fmt.Fprintf(os.Stderr, "Error from decryption: %s\n", err=
)
> +               return
> +diff --git a/src/crypto/rsa/nat.go b/src/crypto/rsa/nat.go
> +new file mode 100644
> +index 0000000..da521c2
> +--- /dev/null
> ++++ b/src/crypto/rsa/nat.go
> +@@ -0,0 +1,626 @@
> ++// Copyright 2021 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package rsa
> ++
> ++import (
> ++      "math/big"
> ++      "math/bits"
> ++)
> ++
> ++const (
> ++      // _W is the number of bits we use for our limbs.
> ++      _W =3D bits.UintSize - 1
> ++      // _MASK selects _W bits from a full machine word.
> ++      _MASK =3D (1 << _W) - 1
> ++)
> ++
> ++// choice represents a constant-time boolean. The value of choice is al=
ways
> ++// either 1 or 0. We use an int instead of bool in order to make decisi=
ons in
> ++// constant time by turning it into a mask.
> ++type choice uint
> ++
> ++func not(c choice) choice { return 1 ^ c }
> ++
> ++const yes =3D choice(1)
> ++const no =3D choice(0)
> ++
> ++// ctSelect returns x if on =3D=3D 1, and y if on =3D=3D 0. The executi=
on time of this
> ++// function does not depend on its inputs. If on is any value besides 1=
 or 0,
> ++// the result is undefined.
> ++func ctSelect(on choice, x, y uint) uint {
> ++      // When on =3D=3D 1, mask is 0b111..., otherwise mask is 0b000...
> ++      mask :=3D -uint(on)
> ++      // When mask is all zeros, we just have y, otherwise, y cancels w=
ith itself.
> ++      return y ^ (mask & (y ^ x))
> ++}
> ++
> ++// ctEq returns 1 if x =3D=3D y, and 0 otherwise. The execution time of=
 this
> ++// function does not depend on its inputs.
> ++func ctEq(x, y uint) choice {
> ++      // If x !=3D y, then either x - y or y - x will generate a carry.
> ++      _, c1 :=3D bits.Sub(x, y, 0)
> ++      _, c2 :=3D bits.Sub(y, x, 0)
> ++      return not(choice(c1 | c2))
> ++}
> ++
> ++// ctGeq returns 1 if x >=3D y, and 0 otherwise. The execution time of =
this
> ++// function does not depend on its inputs.
> ++func ctGeq(x, y uint) choice {
> ++      // If x < y, then x - y generates a carry.
> ++      _, carry :=3D bits.Sub(x, y, 0)
> ++      return not(choice(carry))
> ++}
> ++
> ++// nat represents an arbitrary natural number
> ++//
> ++// Each nat has an announced length, which is the number of limbs it ha=
s stored.
> ++// Operations on this number are allowed to leak this length, but will =
not leak
> ++// any information about the values contained in those limbs.
> ++type nat struct {
> ++      // limbs is a little-endian representation in base 2^W with
> ++      // W =3D bits.UintSize - 1. The top bit is always unset between o=
perations.
> ++      //
> ++      // The top bit is left unset to optimize Montgomery multiplicatio=
n, in the
> ++      // inner loop of exponentiation. Using fully saturated limbs woul=
d leave us
> ++      // working with 129-bit numbers on 64-bit platforms, wasting a lo=
t of space,
> ++      // and thus time.
> ++      limbs []uint
> ++}
> ++
> ++// expand expands x to n limbs, leaving its value unchanged.
> ++func (x *nat) expand(n int) *nat {
> ++      for len(x.limbs) > n {
> ++              if x.limbs[len(x.limbs)-1] !=3D 0 {
> ++                      panic("rsa: internal error: shrinking nat")
> ++              }
> ++              x.limbs =3D x.limbs[:len(x.limbs)-1]
> ++      }
> ++      if cap(x.limbs) < n {
> ++              newLimbs :=3D make([]uint, n)
> ++              copy(newLimbs, x.limbs)
> ++              x.limbs =3D newLimbs
> ++              return x
> ++      }
> ++      extraLimbs :=3D x.limbs[len(x.limbs):n]
> ++      for i :=3D range extraLimbs {
> ++              extraLimbs[i] =3D 0
> ++      }
> ++      x.limbs =3D x.limbs[:n]
> ++      return x
> ++}
> ++
> ++// reset returns a zero nat of n limbs, reusing x's storage if n <=3D c=
ap(x.limbs).
> ++func (x *nat) reset(n int) *nat {
> ++      if cap(x.limbs) < n {
> ++              x.limbs =3D make([]uint, n)
> ++              return x
> ++      }
> ++      for i :=3D range x.limbs {
> ++              x.limbs[i] =3D 0
> ++      }
> ++      x.limbs =3D x.limbs[:n]
> ++      return x
> ++}
> ++
> ++// clone returns a new nat, with the same value and announced length as=
 x.
> ++func (x *nat) clone() *nat {
> ++      out :=3D &nat{make([]uint, len(x.limbs))}
> ++      copy(out.limbs, x.limbs)
> ++      return out
> ++}
> ++
> ++// natFromBig creates a new natural number from a big.Int.
> ++//
> ++// The announced length of the resulting nat is based on the actual bit=
 size of
> ++// the input, ignoring leading zeroes.
> ++func natFromBig(x *big.Int) *nat {
> ++      xLimbs :=3D x.Bits()
> ++      bitSize :=3D bigBitLen(x)
> ++      requiredLimbs :=3D (bitSize + _W - 1) / _W
> ++
> ++      out :=3D &nat{make([]uint, requiredLimbs)}
> ++      outI :=3D 0
> ++      shift :=3D 0
> ++      for i :=3D range xLimbs {
> ++              xi :=3D uint(xLimbs[i])
> ++              out.limbs[outI] |=3D (xi << shift) & _MASK
> ++              outI++
> ++              if outI =3D=3D requiredLimbs {
> ++                      return out
> ++              }
> ++              out.limbs[outI] =3D xi >> (_W - shift)
> ++              shift++ // this assumes bits.UintSize - _W =3D 1
> ++              if shift =3D=3D _W {
> ++                      shift =3D 0
> ++                      outI++
> ++              }
> ++      }
> ++      return out
> ++}
> ++
> ++// fillBytes sets bytes to x as a zero-extended big-endian byte slice.
> ++//
> ++// If bytes is not long enough to contain the number or at least len(x.=
limbs)-1
> ++// limbs, or has zero length, fillBytes will panic.
> ++func (x *nat) fillBytes(bytes []byte) []byte {
> ++      if len(bytes) =3D=3D 0 {
> ++              panic("nat: fillBytes invoked with too small buffer")
> ++      }
> ++      for i :=3D range bytes {
> ++              bytes[i] =3D 0
> ++      }
> ++      shift :=3D 0
> ++      outI :=3D len(bytes) - 1
> ++      for i, limb :=3D range x.limbs {
> ++              remainingBits :=3D _W
> ++              for remainingBits >=3D 8 {
> ++                      bytes[outI] |=3D byte(limb) << shift
> ++                      consumed :=3D 8 - shift
> ++                      limb >>=3D consumed
> ++                      remainingBits -=3D consumed
> ++                      shift =3D 0
> ++                      outI--
> ++                      if outI < 0 {
> ++                              if limb !=3D 0 || i < len(x.limbs)-1 {
> ++                                      panic("nat: fillBytes invoked wit=
h too small buffer")
> ++                              }
> ++                              return bytes
> ++                      }
> ++              }
> ++              bytes[outI] =3D byte(limb)
> ++              shift =3D remainingBits
> ++      }
> ++      return bytes
> ++}
> ++
> ++// natFromBytes converts a slice of big-endian bytes into a nat.
> ++//
> ++// The announced length of the output depends on the length of bytes. U=
nlike
> ++// big.Int, creating a nat will not remove leading zeros.
> ++func natFromBytes(bytes []byte) *nat {
> ++      bitSize :=3D len(bytes) * 8
> ++      requiredLimbs :=3D (bitSize + _W - 1) / _W
> ++
> ++      out :=3D &nat{make([]uint, requiredLimbs)}
> ++      outI :=3D 0
> ++      shift :=3D 0
> ++      for i :=3D len(bytes) - 1; i >=3D 0; i-- {
> ++              bi :=3D bytes[i]
> ++              out.limbs[outI] |=3D uint(bi) << shift
> ++              shift +=3D 8
> ++              if shift >=3D _W {
> ++                      shift -=3D _W
> ++                      out.limbs[outI] &=3D _MASK
> ++                      outI++
> ++                      if shift > 0 {
> ++                              out.limbs[outI] =3D uint(bi) >> (8 - shif=
t)
> ++                      }
> ++              }
> ++      }
> ++      return out
> ++}
> ++
> ++// cmpEq returns 1 if x =3D=3D y, and 0 otherwise.
> ++//
> ++// Both operands must have the same announced length.
> ++func (x *nat) cmpEq(y *nat) choice {
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(x.limbs)
> ++      xLimbs :=3D x.limbs[:size]
> ++      yLimbs :=3D y.limbs[:size]
> ++
> ++      equal :=3D yes
> ++      for i :=3D 0; i < size; i++ {
> ++              equal &=3D ctEq(xLimbs[i], yLimbs[i])
> ++      }
> ++      return equal
> ++}
> ++
> ++// cmpGeq returns 1 if x >=3D y, and 0 otherwise.
> ++//
> ++// Both operands must have the same announced length.
> ++func (x *nat) cmpGeq(y *nat) choice {
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(x.limbs)
> ++      xLimbs :=3D x.limbs[:size]
> ++      yLimbs :=3D y.limbs[:size]
> ++
> ++      var c uint
> ++      for i :=3D 0; i < size; i++ {
> ++              c =3D (xLimbs[i] - yLimbs[i] - c) >> _W
> ++      }
> ++      // If there was a carry, then subtracting y underflowed, so
> ++      // x is not greater than or equal to y.
> ++      return not(choice(c))
> ++}
> ++
> ++// assign sets x <- y if on =3D=3D 1, and does nothing otherwise.
> ++//
> ++// Both operands must have the same announced length.
> ++func (x *nat) assign(on choice, y *nat) *nat {
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(x.limbs)
> ++      xLimbs :=3D x.limbs[:size]
> ++      yLimbs :=3D y.limbs[:size]
> ++
> ++      for i :=3D 0; i < size; i++ {
> ++              xLimbs[i] =3D ctSelect(on, yLimbs[i], xLimbs[i])
> ++      }
> ++      return x
> ++}
> ++
> ++// add computes x +=3D y if on =3D=3D 1, and does nothing otherwise. It=
 returns the
> ++// carry of the addition regardless of on.
> ++//
> ++// Both operands must have the same announced length.
> ++func (x *nat) add(on choice, y *nat) (c uint) {
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(x.limbs)
> ++      xLimbs :=3D x.limbs[:size]
> ++      yLimbs :=3D y.limbs[:size]
> ++
> ++      for i :=3D 0; i < size; i++ {
> ++              res :=3D xLimbs[i] + yLimbs[i] + c
> ++              xLimbs[i] =3D ctSelect(on, res&_MASK, xLimbs[i])
> ++              c =3D res >> _W
> ++      }
> ++      return
> ++}
> ++
> ++// sub computes x -=3D y if on =3D=3D 1, and does nothing otherwise. It=
 returns the
> ++// borrow of the subtraction regardless of on.
> ++//
> ++// Both operands must have the same announced length.
> ++func (x *nat) sub(on choice, y *nat) (c uint) {
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(x.limbs)
> ++      xLimbs :=3D x.limbs[:size]
> ++      yLimbs :=3D y.limbs[:size]
> ++
> ++      for i :=3D 0; i < size; i++ {
> ++              res :=3D xLimbs[i] - yLimbs[i] - c
> ++              xLimbs[i] =3D ctSelect(on, res&_MASK, xLimbs[i])
> ++              c =3D res >> _W
> ++      }
> ++      return
> ++}
> ++
> ++// modulus is used for modular arithmetic, precomputing relevant consta=
nts.
> ++//
> ++// Moduli are assumed to be odd numbers. Moduli can also leak the exact
> ++// number of bits needed to store their value, and are stored without p=
adding.
> ++//
> ++// Their actual value is still kept secret.
> ++type modulus struct {
> ++      // The underlying natural number for this modulus.
> ++      //
> ++      // This will be stored without any padding, and shouldn't alias w=
ith any
> ++      // other natural number being used.
> ++      nat     *nat
> ++      leading int  // number of leading zeros in the modulus
> ++      m0inv   uint // -nat.limbs[0]=E2=81=BB=C2=B9 mod _W
> ++}
> ++
> ++// minusInverseModW computes -x=E2=81=BB=C2=B9 mod _W with x odd.
> ++//
> ++// This operation is used to precompute a constant involved in Montgome=
ry
> ++// multiplication.
> ++func minusInverseModW(x uint) uint {
> ++      // Every iteration of this loop doubles the least-significant bit=
s of
> ++      // correct inverse in y. The first three bits are already correct=
 (1=E2=81=BB=C2=B9 =3D 1,
> ++      // 3=E2=81=BB=C2=B9 =3D 3, 5=E2=81=BB=C2=B9 =3D 5, and 7=E2=81=BB=
=C2=B9 =3D 7 mod 8), so doubling five times is enough
> ++      // for 61 bits (and wastes only one iteration for 31 bits).
> ++      //
> ++      // See https://crypto.stackexchange.com/a/47496.
> ++      y :=3D x
> ++      for i :=3D 0; i < 5; i++ {
> ++              y =3D y * (2 - x*y)
> ++      }
> ++      return (1 << _W) - (y & _MASK)
> ++}
> ++
> ++// modulusFromNat creates a new modulus from a nat.
> ++//
> ++// The nat should be odd, nonzero, and the number of significant bits i=
n the
> ++// number should be leakable. The nat shouldn't be reused.
> ++func modulusFromNat(nat *nat) *modulus {
> ++      m :=3D &modulus{}
> ++      m.nat =3D nat
> ++      size :=3D len(m.nat.limbs)
> ++      for m.nat.limbs[size-1] =3D=3D 0 {
> ++              size--
> ++      }
> ++      m.nat.limbs =3D m.nat.limbs[:size]
> ++      m.leading =3D _W - bitLen(m.nat.limbs[size-1])
> ++      m.m0inv =3D minusInverseModW(m.nat.limbs[0])
> ++      return m
> ++}
> ++
> ++// bitLen is a version of bits.Len that only leaks the bit length of n,=
 but not
> ++// its value. bits.Len and bits.LeadingZeros use a lookup table for the
> ++// low-order bits on some architectures.
> ++func bitLen(n uint) int {
> ++      var len int
> ++      // We assume, here and elsewhere, that comparison to zero is cons=
tant time
> ++      // with respect to different non-zero values.
> ++      for n !=3D 0 {
> ++              len++
> ++              n >>=3D 1
> ++      }
> ++      return len
> ++}
> ++
> ++// bigBitLen is a version of big.Int.BitLen that only leaks the bit len=
gth of x,
> ++// but not its value. big.Int.BitLen uses bits.Len.
> ++func bigBitLen(x *big.Int) int {
> ++      xLimbs :=3D x.Bits()
> ++      fullLimbs :=3D len(xLimbs) - 1
> ++      topLimb :=3D uint(xLimbs[len(xLimbs)-1])
> ++      return fullLimbs*bits.UintSize + bitLen(topLimb)
> ++}
> ++
> ++// modulusSize returns the size of m in bytes.
> ++func modulusSize(m *modulus) int {
> ++      bits :=3D len(m.nat.limbs)*_W - int(m.leading)
> ++      return (bits + 7) / 8
> ++}
> ++
> ++// shiftIn calculates x =3D x << _W + y mod m.
> ++//
> ++// This assumes that x is already reduced mod m, and that y < 2^_W.
> ++func (x *nat) shiftIn(y uint, m *modulus) *nat {
> ++      d :=3D new(nat).resetFor(m)
> ++
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(m.nat.limbs)
> ++      xLimbs :=3D x.limbs[:size]
> ++      dLimbs :=3D d.limbs[:size]
> ++      mLimbs :=3D m.nat.limbs[:size]
> ++
> ++      // Each iteration of this loop computes x =3D 2x + b mod m, where=
 b is a bit
> ++      // from y. Effectively, it left-shifts x and adds y one bit at a =
time,
> ++      // reducing it every time.
> ++      //
> ++      // To do the reduction, each iteration computes both 2x + b and 2=
x + b - m.
> ++      // The next iteration (and finally the return line) will use eith=
er result
> ++      // based on whether the subtraction underflowed.
> ++      needSubtraction :=3D no
> ++      for i :=3D _W - 1; i >=3D 0; i-- {
> ++              carry :=3D (y >> i) & 1
> ++              var borrow uint
> ++              for i :=3D 0; i < size; i++ {
> ++                      l :=3D ctSelect(needSubtraction, dLimbs[i], xLimb=
s[i])
> ++
> ++                      res :=3D l<<1 + carry
> ++                      xLimbs[i] =3D res & _MASK
> ++                      carry =3D res >> _W
> ++
> ++                      res =3D xLimbs[i] - mLimbs[i] - borrow
> ++                      dLimbs[i] =3D res & _MASK
> ++                      borrow =3D res >> _W
> ++              }
> ++              // See modAdd for how carry (aka overflow), borrow (aka u=
nderflow), and
> ++              // needSubtraction relate.
> ++              needSubtraction =3D ctEq(carry, borrow)
> ++      }
> ++      return x.assign(needSubtraction, d)
> ++}
> ++
> ++// mod calculates out =3D x mod m.
> ++//
> ++// This works regardless how large the value of x is.
> ++//
> ++// The output will be resized to the size of m and overwritten.
> ++func (out *nat) mod(x *nat, m *modulus) *nat {
> ++      out.resetFor(m)
> ++      // Working our way from the most significant to the least signifi=
cant limb,
> ++      // we can insert each limb at the least significant position, shi=
fting all
> ++      // previous limbs left by _W. This way each limb will get shifted=
 by the
> ++      // correct number of bits. We can insert at least N - 1 limbs wit=
hout
> ++      // overflowing m. After that, we need to reduce every time we shi=
ft.
> ++      i :=3D len(x.limbs) - 1
> ++      // For the first N - 1 limbs we can skip the actual shifting and =
position
> ++      // them at the shifted position, which starts at min(N - 2, i).
> ++      start :=3D len(m.nat.limbs) - 2
> ++      if i < start {
> ++              start =3D i
> ++      }
> ++      for j :=3D start; j >=3D 0; j-- {
> ++              out.limbs[j] =3D x.limbs[i]
> ++              i--
> ++      }
> ++      // We shift in the remaining limbs, reducing modulo m each time.
> ++      for i >=3D 0 {
> ++              out.shiftIn(x.limbs[i], m)
> ++              i--
> ++      }
> ++      return out
> ++}
> ++
> ++// expandFor ensures out has the right size to work with operations mod=
ulo m.
> ++//
> ++// This assumes that out has as many or fewer limbs than m, or that the=
 extra
> ++// limbs are all zero (which may happen when decoding a value that has =
leading
> ++// zeroes in its bytes representation that spill over the limb threshol=
d).
> ++func (out *nat) expandFor(m *modulus) *nat {
> ++      return out.expand(len(m.nat.limbs))
> ++}
> ++
> ++// resetFor ensures out has the right size to work with operations modu=
lo m.
> ++//
> ++// out is zeroed and may start at any size.
> ++func (out *nat) resetFor(m *modulus) *nat {
> ++      return out.reset(len(m.nat.limbs))
> ++}
> ++
> ++// modSub computes x =3D x - y mod m.
> ++//
> ++// The length of both operands must be the same as the modulus. Both op=
erands
> ++// must already be reduced modulo m.
> ++func (x *nat) modSub(y *nat, m *modulus) *nat {
> ++      underflow :=3D x.sub(yes, y)
> ++      // If the subtraction underflowed, add m.
> ++      x.add(choice(underflow), m.nat)
> ++      return x
> ++}
> ++
> ++// modAdd computes x =3D x + y mod m.
> ++//
> ++// The length of both operands must be the same as the modulus. Both op=
erands
> ++// must already be reduced modulo m.
> ++func (x *nat) modAdd(y *nat, m *modulus) *nat {
> ++      overflow :=3D x.add(yes, y)
> ++      underflow :=3D not(x.cmpGeq(m.nat)) // x < m
> ++
> ++      // Three cases are possible:
> ++      //
> ++      //   - overflow =3D 0, underflow =3D 0
> ++      //
> ++      // In this case, addition fits in our limbs, but we can still sub=
tract away
> ++      // m without an underflow, so we need to perform the subtraction =
to reduce
> ++      // our result.
> ++      //
> ++      //   - overflow =3D 0, underflow =3D 1
> ++      //
> ++      // The addition fits in our limbs, but we can't subtract m withou=
t
> ++      // underflowing. The result is already reduced.
> ++      //
> ++      //   - overflow =3D 1, underflow =3D 1
> ++      //
> ++      // The addition does not fit in our limbs, and the subtraction's =
borrow
> ++      // would cancel out with the addition's carry. We need to subtrac=
t m to
> ++      // reduce our result.
> ++      //
> ++      // The overflow =3D 1, underflow =3D 0 case is not possible, beca=
use y is at
> ++      // most m - 1, and if adding m - 1 overflows, then subtracting m =
must
> ++      // necessarily underflow.
> ++      needSubtraction :=3D ctEq(overflow, uint(underflow))
> ++
> ++      x.sub(needSubtraction, m.nat)
> ++      return x
> ++}
> ++
> ++// montgomeryRepresentation calculates x =3D x * R mod m, with R =3D 2^=
(_W * n) and
> ++// n =3D len(m.nat.limbs).
> ++//
> ++// Faster Montgomery multiplication replaces standard modular multiplic=
ation for
> ++// numbers in this representation.
> ++//
> ++// This assumes that x is already reduced mod m.
> ++func (x *nat) montgomeryRepresentation(m *modulus) *nat {
> ++      for i :=3D 0; i < len(m.nat.limbs); i++ {
> ++              x.shiftIn(0, m) // x =3D x * 2^_W mod m
> ++      }
> ++      return x
> ++}
> ++
> ++// montgomeryMul calculates d =3D a * b / R mod m, with R =3D 2^(_W * n=
) and
> ++// n =3D len(m.nat.limbs), using the Montgomery Multiplication techniqu=
e.
> ++//
> ++// All inputs should be the same length, not aliasing d, and already
> ++// reduced modulo m. d will be resized to the size of m and overwritten=
.
> ++func (d *nat) montgomeryMul(a *nat, b *nat, m *modulus) *nat {
> ++      // See https://bearssl.org/bigint.html#montgomery-reduction-and-m=
ultiplication
> ++      // for a description of the algorithm.
> ++
> ++      // Eliminate bounds checks in the loop.
> ++      size :=3D len(m.nat.limbs)
> ++      aLimbs :=3D a.limbs[:size]
> ++      bLimbs :=3D b.limbs[:size]
> ++      dLimbs :=3D d.resetFor(m).limbs[:size]
> ++      mLimbs :=3D m.nat.limbs[:size]
> ++
> ++      var overflow uint
> ++      for i :=3D 0; i < size; i++ {
> ++              f :=3D ((dLimbs[0] + aLimbs[i]*bLimbs[0]) * m.m0inv) & _M=
ASK
> ++              carry :=3D uint(0)
> ++              for j :=3D 0; j < size; j++ {
> ++                      // z =3D d[j] + a[i] * b[j] + f * m[j] + carry <=
=3D 2^(2W+1) - 2^(W+1) + 2^W
> ++                      hi, lo :=3D bits.Mul(aLimbs[i], bLimbs[j])
> ++                      z_lo, c :=3D bits.Add(dLimbs[j], lo, 0)
> ++                      z_hi, _ :=3D bits.Add(0, hi, c)
> ++                      hi, lo =3D bits.Mul(f, mLimbs[j])
> ++                      z_lo, c =3D bits.Add(z_lo, lo, 0)
> ++                      z_hi, _ =3D bits.Add(z_hi, hi, c)
> ++                      z_lo, c =3D bits.Add(z_lo, carry, 0)
> ++                      z_hi, _ =3D bits.Add(z_hi, 0, c)
> ++                      if j > 0 {
> ++                              dLimbs[j-1] =3D z_lo & _MASK
> ++                      }
> ++                      carry =3D z_hi<<1 | z_lo>>_W // carry <=3D 2^(W+1=
) - 2
> ++              }
> ++              z :=3D overflow + carry // z <=3D 2^(W+1) - 1
> ++              dLimbs[size-1] =3D z & _MASK
> ++              overflow =3D z >> _W // overflow <=3D 1
> ++      }
> ++      // See modAdd for how overflow, underflow, and needSubtraction re=
late.
> ++      underflow :=3D not(d.cmpGeq(m.nat)) // d < m
> ++      needSubtraction :=3D ctEq(overflow, uint(underflow))
> ++      d.sub(needSubtraction, m.nat)
> ++
> ++      return d
> ++}
> ++
> ++// modMul calculates x *=3D y mod m.
> ++//
> ++// x and y must already be reduced modulo m, they must share its announ=
ced
> ++// length, and they may not alias.
> ++func (x *nat) modMul(y *nat, m *modulus) *nat {
> ++      // A Montgomery multiplication by a value out of the Montgomery d=
omain
> ++      // takes the result out of Montgomery representation.
> ++      xR :=3D x.clone().montgomeryRepresentation(m) // xR =3D x * R mod=
 m
> ++      return x.montgomeryMul(xR, y, m)            // x =3D xR * y / R m=
od m
> ++}
> ++
> ++// exp calculates out =3D x^e mod m.
> ++//
> ++// The exponent e is represented in big-endian order. The output will b=
e resized
> ++// to the size of m and overwritten. x must already be reduced modulo m=
.
> ++func (out *nat) exp(x *nat, e []byte, m *modulus) *nat {
> ++      // We use a 4 bit window. For our RSA workload, 4 bit windows are=
 faster
> ++      // than 2 bit windows, but use an extra 12 nats worth of scratch =
space.
> ++      // Using bit sizes that don't divide 8 are more complex to implem=
ent.
> ++      table :=3D make([]*nat, (1<<4)-1) // table[i] =3D x ^ (i+1)
> ++      table[0] =3D x.clone().montgomeryRepresentation(m)
> ++      for i :=3D 1; i < len(table); i++ {
> ++              table[i] =3D new(nat).expandFor(m)
> ++              table[i].montgomeryMul(table[i-1], table[0], m)
> ++      }
> ++
> ++      out.resetFor(m)
> ++      out.limbs[0] =3D 1
> ++      out.montgomeryRepresentation(m)
> ++      t0 :=3D new(nat).expandFor(m)
> ++      t1 :=3D new(nat).expandFor(m)
> ++      for _, b :=3D range e {
> ++              for _, j :=3D range []int{4, 0} {
> ++                      // Square four times.
> ++                      t1.montgomeryMul(out, out, m)
> ++                      out.montgomeryMul(t1, t1, m)
> ++                      t1.montgomeryMul(out, out, m)
> ++                      out.montgomeryMul(t1, t1, m)
> ++
> ++                      // Select x^k in constant time from the table.
> ++                      k :=3D uint((b >> j) & 0b1111)
> ++                      for i :=3D range table {
> ++                              t0.assign(ctEq(k, uint(i+1)), table[i])
> ++                      }
> ++
> ++                      // Multiply by x^k, discarding the result if k =
=3D 0.
> ++                      t1.montgomeryMul(out, t0, m)
> ++                      out.assign(not(ctEq(k, 0)), t1)
> ++              }
> ++      }
> ++
> ++      // By Montgomery multiplying with 1 not in Montgomery representat=
ion, we
> ++      // convert out back from Montgomery representation, because it wo=
rks out to
> ++      // dividing by R.
> ++      t0.assign(yes, out)
> ++      t1.resetFor(m)
> ++      t1.limbs[0] =3D 1
> ++      out.montgomeryMul(t0, t1, m)
> ++
> ++      return out
> ++}
> +diff --git a/src/crypto/rsa/nat_test.go b/src/crypto/rsa/nat_test.go
> +new file mode 100644
> +index 0000000..3e6eb10
> +--- /dev/null
> ++++ b/src/crypto/rsa/nat_test.go
> +@@ -0,0 +1,384 @@
> ++// Copyright 2021 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package rsa
> ++
> ++import (
> ++      "bytes"
> ++      "math/big"
> ++      "math/bits"
> ++      "math/rand"
> ++      "reflect"
> ++      "testing"
> ++      "testing/quick"
> ++)
> ++
> ++// Generate generates an even nat. It's used by testing/quick to produc=
e random
> ++// *nat values for quick.Check invocations.
> ++func (*nat) Generate(r *rand.Rand, size int) reflect.Value {
> ++      limbs :=3D make([]uint, size)
> ++      for i :=3D 0; i < size; i++ {
> ++              limbs[i] =3D uint(r.Uint64()) & ((1 << _W) - 2)
> ++      }
> ++      return reflect.ValueOf(&nat{limbs})
> ++}
> ++
> ++func testModAddCommutative(a *nat, b *nat) bool {
> ++      mLimbs :=3D make([]uint, len(a.limbs))
> ++      for i :=3D 0; i < len(mLimbs); i++ {
> ++              mLimbs[i] =3D _MASK
> ++      }
> ++      m :=3D modulusFromNat(&nat{mLimbs})
> ++      aPlusB :=3D a.clone()
> ++      aPlusB.modAdd(b, m)
> ++      bPlusA :=3D b.clone()
> ++      bPlusA.modAdd(a, m)
> ++      return aPlusB.cmpEq(bPlusA) =3D=3D 1
> ++}
> ++
> ++func TestModAddCommutative(t *testing.T) {
> ++      err :=3D quick.Check(testModAddCommutative, &quick.Config{})
> ++      if err !=3D nil {
> ++              t.Error(err)
> ++      }
> ++}
> ++
> ++func testModSubThenAddIdentity(a *nat, b *nat) bool {
> ++      mLimbs :=3D make([]uint, len(a.limbs))
> ++      for i :=3D 0; i < len(mLimbs); i++ {
> ++              mLimbs[i] =3D _MASK
> ++      }
> ++      m :=3D modulusFromNat(&nat{mLimbs})
> ++      original :=3D a.clone()
> ++      a.modSub(b, m)
> ++      a.modAdd(b, m)
> ++      return a.cmpEq(original) =3D=3D 1
> ++}
> ++
> ++func TestModSubThenAddIdentity(t *testing.T) {
> ++      err :=3D quick.Check(testModSubThenAddIdentity, &quick.Config{})
> ++      if err !=3D nil {
> ++              t.Error(err)
> ++      }
> ++}
> ++
> ++func testMontgomeryRoundtrip(a *nat) bool {
> ++      one :=3D &nat{make([]uint, len(a.limbs))}
> ++      one.limbs[0] =3D 1
> ++      aPlusOne :=3D a.clone()
> ++      aPlusOne.add(1, one)
> ++      m :=3D modulusFromNat(aPlusOne)
> ++      monty :=3D a.clone()
> ++      monty.montgomeryRepresentation(m)
> ++      aAgain :=3D monty.clone()
> ++      aAgain.montgomeryMul(monty, one, m)
> ++      return a.cmpEq(aAgain) =3D=3D 1
> ++}
> ++
> ++func TestMontgomeryRoundtrip(t *testing.T) {
> ++      err :=3D quick.Check(testMontgomeryRoundtrip, &quick.Config{})
> ++      if err !=3D nil {
> ++              t.Error(err)
> ++      }
> ++}
> ++
> ++func TestFromBig(t *testing.T) {
> ++      expected :=3D []byte{0x01, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x=
ff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
> ++      theBig :=3D new(big.Int).SetBytes(expected)
> ++      actual :=3D natFromBig(theBig).fillBytes(make([]byte, len(expecte=
d)))
> ++      if !bytes.Equal(actual, expected) {
> ++              t.Errorf("%+x !=3D %+x", actual, expected)
> ++      }
> ++}
> ++
> ++func TestFillBytes(t *testing.T) {
> ++      xBytes :=3D []byte{0xAA, 0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77=
, 0x88}
> ++      x :=3D natFromBytes(xBytes)
> ++      for l :=3D 20; l >=3D len(xBytes); l-- {
> ++              buf :=3D make([]byte, l)
> ++              rand.Read(buf)
> ++              actual :=3D x.fillBytes(buf)
> ++              expected :=3D make([]byte, l)
> ++              copy(expected[l-len(xBytes):], xBytes)
> ++              if !bytes.Equal(actual, expected) {
> ++                      t.Errorf("%d: %+v !=3D %+v", l, actual, expected)
> ++              }
> ++      }
> ++      for l :=3D len(xBytes) - 1; l >=3D 0; l-- {
> ++              (func() {
> ++                      defer func() {
> ++                              if recover() =3D=3D nil {
> ++                                      t.Errorf("%d: expected panic", l)
> ++                              }
> ++                      }()
> ++                      x.fillBytes(make([]byte, l))
> ++              })()
> ++      }
> ++}
> ++
> ++func TestFromBytes(t *testing.T) {
> ++      f :=3D func(xBytes []byte) bool {
> ++              if len(xBytes) =3D=3D 0 {
> ++                      return true
> ++              }
> ++              actual :=3D natFromBytes(xBytes).fillBytes(make([]byte, l=
en(xBytes)))
> ++              if !bytes.Equal(actual, xBytes) {
> ++                      t.Errorf("%+x !=3D %+x", actual, xBytes)
> ++                      return false
> ++              }
> ++              return true
> ++      }
> ++
> ++      err :=3D quick.Check(f, &quick.Config{})
> ++      if err !=3D nil {
> ++              t.Error(err)
> ++      }
> ++
> ++      f([]byte{0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88})
> ++      f(bytes.Repeat([]byte{0xFF}, _W))
> ++}
> ++
> ++func TestShiftIn(t *testing.T) {
> ++      if bits.UintSize !=3D 64 {
> ++              t.Skip("examples are only valid in 64 bit")
> ++      }
> ++      examples :=3D []struct {
> ++              m, x, expected []byte
> ++              y              uint64
> ++      }{{
> ++              m:        []byte{13},
> ++              x:        []byte{0},
> ++              y:        0x7FFF_FFFF_FFFF_FFFF,
> ++              expected: []byte{7},
> ++      }, {
> ++              m:        []byte{13},
> ++              x:        []byte{7},
> ++              y:        0x7FFF_FFFF_FFFF_FFFF,
> ++              expected: []byte{11},
> ++      }, {
> ++              m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00=
, 0x00, 0x0d},
> ++              x:        make([]byte, 9),
> ++              y:        0x7FFF_FFFF_FFFF_FFFF,
> ++              expected: []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff=
, 0xff, 0xff},
> ++      }, {
> ++              m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00=
, 0x00, 0x0d},
> ++              x:        []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff=
, 0xff, 0xff},
> ++              y:        0,
> ++              expected: []byte{0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
, 0x00, 0x08},
> ++      }}
> ++
> ++      for i, tt :=3D range examples {
> ++              m :=3D modulusFromNat(natFromBytes(tt.m))
> ++              got :=3D natFromBytes(tt.x).expandFor(m).shiftIn(uint(tt.=
y), m)
> ++              if got.cmpEq(natFromBytes(tt.expected).expandFor(m)) !=3D=
 1 {
> ++                      t.Errorf("%d: got %x, expected %x", i, got, tt.ex=
pected)
> ++              }
> ++      }
> ++}
> ++
> ++func TestModulusAndNatSizes(t *testing.T) {
> ++      // These are 126 bit (2 * _W on 64-bit architectures) values, ser=
ialized as
> ++      // 128 bits worth of bytes. If leading zeroes are stripped, they =
fit in two
> ++      // limbs, if they are not, they fit in three. This can be a probl=
em because
> ++      // modulus strips leading zeroes and nat does not.
> ++      m :=3D modulusFromNat(natFromBytes([]byte{
> ++              0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> ++              0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}))
> ++      x :=3D natFromBytes([]byte{
> ++              0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> ++              0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe})
> ++      x.expandFor(m) // must not panic for shrinking
> ++}
> ++
> ++func TestExpand(t *testing.T) {
> ++      sliced :=3D []uint{1, 2, 3, 4}
> ++      examples :=3D []struct {
> ++              in  []uint
> ++              n   int
> ++              out []uint
> ++      }{{
> ++              []uint{1, 2},
> ++              4,
> ++              []uint{1, 2, 0, 0},
> ++      }, {
> ++              sliced[:2],
> ++              4,
> ++              []uint{1, 2, 0, 0},
> ++      }, {
> ++              []uint{1, 2},
> ++              2,
> ++              []uint{1, 2},
> ++      }, {
> ++              []uint{1, 2, 0},
> ++              2,
> ++              []uint{1, 2},
> ++      }}
> ++
> ++      for i, tt :=3D range examples {
> ++              got :=3D (&nat{tt.in}).expand(tt.n)
> ++              if len(got.limbs) !=3D len(tt.out) || got.cmpEq(&nat{tt.o=
ut}) !=3D 1 {
> ++                      t.Errorf("%d: got %x, expected %x", i, got, tt.ou=
t)
> ++              }
> ++      }
> ++}
> ++
> ++func TestMod(t *testing.T) {
> ++      m :=3D modulusFromNat(natFromBytes([]byte{0x06, 0x80, 0x00, 0x00,=
 0x00, 0x00, 0x00, 0x00, 0x0d}))
> ++      x :=3D natFromBytes([]byte{0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01})
> ++      out :=3D new(nat)
> ++      out.mod(x, m)
> ++      expected :=3D natFromBytes([]byte{0x04, 0x00, 0x00, 0x00, 0x00, 0=
x00, 0x00, 0x00, 0x09})
> ++      if out.cmpEq(expected) !=3D 1 {
> ++              t.Errorf("%+v !=3D %+v", out, expected)
> ++      }
> ++}
> ++
> ++func TestModSub(t *testing.T) {
> ++      m :=3D modulusFromNat(&nat{[]uint{13}})
> ++      x :=3D &nat{[]uint{6}}
> ++      y :=3D &nat{[]uint{7}}
> ++      x.modSub(y, m)
> ++      expected :=3D &nat{[]uint{12}}
> ++      if x.cmpEq(expected) !=3D 1 {
> ++              t.Errorf("%+v !=3D %+v", x, expected)
> ++      }
> ++      x.modSub(y, m)
> ++      expected =3D &nat{[]uint{5}}
> ++      if x.cmpEq(expected) !=3D 1 {
> ++              t.Errorf("%+v !=3D %+v", x, expected)
> ++      }
> ++}
> ++
> ++func TestModAdd(t *testing.T) {
> ++      m :=3D modulusFromNat(&nat{[]uint{13}})
> ++      x :=3D &nat{[]uint{6}}
> ++      y :=3D &nat{[]uint{7}}
> ++      x.modAdd(y, m)
> ++      expected :=3D &nat{[]uint{0}}
> ++      if x.cmpEq(expected) !=3D 1 {
> ++              t.Errorf("%+v !=3D %+v", x, expected)
> ++      }
> ++      x.modAdd(y, m)
> ++      expected =3D &nat{[]uint{7}}
> ++      if x.cmpEq(expected) !=3D 1 {
> ++              t.Errorf("%+v !=3D %+v", x, expected)
> ++      }
> ++}
> ++
> ++func TestExp(t *testing.T) {
> ++      m :=3D modulusFromNat(&nat{[]uint{13}})
> ++      x :=3D &nat{[]uint{3}}
> ++      out :=3D &nat{[]uint{0}}
> ++      out.exp(x, []byte{12}, m)
> ++      expected :=3D &nat{[]uint{1}}
> ++      if out.cmpEq(expected) !=3D 1 {
> ++              t.Errorf("%+v !=3D %+v", out, expected)
> ++      }
> ++}
> ++
> ++func makeBenchmarkModulus() *modulus {
> ++      m :=3D make([]uint, 32)
> ++      for i :=3D 0; i < 32; i++ {
> ++              m[i] =3D _MASK
> ++      }
> ++      return modulusFromNat(&nat{limbs: m})
> ++}
> ++
> ++func makeBenchmarkValue() *nat {
> ++      x :=3D make([]uint, 32)
> ++      for i :=3D 0; i < 32; i++ {
> ++              x[i] =3D _MASK - 1
> ++      }
> ++      return &nat{limbs: x}
> ++}
> ++
> ++func makeBenchmarkExponent() []byte {
> ++      e :=3D make([]byte, 256)
> ++      for i :=3D 0; i < 32; i++ {
> ++              e[i] =3D 0xFF
> ++      }
> ++      return e
> ++}
> ++
> ++func BenchmarkModAdd(b *testing.B) {
> ++      x :=3D makeBenchmarkValue()
> ++      y :=3D makeBenchmarkValue()
> ++      m :=3D makeBenchmarkModulus()
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              x.modAdd(y, m)
> ++      }
> ++}
> ++
> ++func BenchmarkModSub(b *testing.B) {
> ++      x :=3D makeBenchmarkValue()
> ++      y :=3D makeBenchmarkValue()
> ++      m :=3D makeBenchmarkModulus()
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              x.modSub(y, m)
> ++      }
> ++}
> ++
> ++func BenchmarkMontgomeryRepr(b *testing.B) {
> ++      x :=3D makeBenchmarkValue()
> ++      m :=3D makeBenchmarkModulus()
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              x.montgomeryRepresentation(m)
> ++      }
> ++}
> ++
> ++func BenchmarkMontgomeryMul(b *testing.B) {
> ++      x :=3D makeBenchmarkValue()
> ++      y :=3D makeBenchmarkValue()
> ++      out :=3D makeBenchmarkValue()
> ++      m :=3D makeBenchmarkModulus()
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              out.montgomeryMul(x, y, m)
> ++      }
> ++}
> ++
> ++func BenchmarkModMul(b *testing.B) {
> ++      x :=3D makeBenchmarkValue()
> ++      y :=3D makeBenchmarkValue()
> ++      m :=3D makeBenchmarkModulus()
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              x.modMul(y, m)
> ++      }
> ++}
> ++
> ++func BenchmarkExpBig(b *testing.B) {
> ++      out :=3D new(big.Int)
> ++      exponentBytes :=3D makeBenchmarkExponent()
> ++      x :=3D new(big.Int).SetBytes(exponentBytes)
> ++      e :=3D new(big.Int).SetBytes(exponentBytes)
> ++      n :=3D new(big.Int).SetBytes(exponentBytes)
> ++      one :=3D new(big.Int).SetUint64(1)
> ++      n.Add(n, one)
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              out.Exp(x, e, n)
> ++      }
> ++}
> ++
> ++func BenchmarkExp(b *testing.B) {
> ++      x :=3D makeBenchmarkValue()
> ++      e :=3D makeBenchmarkExponent()
> ++      out :=3D makeBenchmarkValue()
> ++      m :=3D makeBenchmarkModulus()
> ++
> ++      b.ResetTimer()
> ++      for i :=3D 0; i < b.N; i++ {
> ++              out.exp(x, e, m)
> ++      }
> ++}
> +diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
> +index a216be3..4312f34 100644
> +--- a/src/crypto/rsa/pkcs1v15.go
> ++++ b/src/crypto/rsa/pkcs1v15.go
> +@@ -9,7 +9,6 @@ import (
> +       "crypto/subtle"
> +       "errors"
> +       "io"
> +-      "math/big"
> +
> +       "crypto/internal/randutil"
> + )
> +@@ -58,14 +57,11 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey,=
 msg []byte) ([]byte, error)
> +       em[len(em)-len(msg)-1] =3D 0
> +       copy(mm, msg)
> +
> +-      m :=3D new(big.Int).SetBytes(em)
> +-      c :=3D encrypt(new(big.Int), pub, m)
> +-
> +-      return c.FillBytes(em), nil
> ++      return encrypt(pub, em), nil
> + }
> +
> + // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding schem=
e from PKCS#1 v1.5.
> +-// If rand !=3D nil, it uses RSA blinding to avoid timing side-channel =
attacks.
> ++// The rand parameter is legacy and ignored, and it can be as nil.
> + //
> + // Note that whether this function returns an error or not discloses se=
cret
> + // information. If an attacker can cause this function to run repeatedl=
y and
> +@@ -76,7 +72,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey,=
 ciphertext []byte) ([]byt
> +       if err :=3D checkPub(&priv.PublicKey); err !=3D nil {
> +               return nil, err
> +       }
> +-      valid, out, index, err :=3D decryptPKCS1v15(rand, priv, ciphertex=
t)
> ++      valid, out, index, err :=3D decryptPKCS1v15(priv, ciphertext)
> +       if err !=3D nil {
> +               return nil, err
> +       }
> +@@ -87,7 +83,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey,=
 ciphertext []byte) ([]byt
> + }
> +
> + // DecryptPKCS1v15SessionKey decrypts a session key using RSA and the p=
adding scheme from PKCS#1 v1.5.
> +-// If rand !=3D nil, it uses RSA blinding to avoid timing side-channel =
attacks.
> ++// The rand parameter is legacy and ignored, and it can be as nil.
> + // It returns an error if the ciphertext is the wrong length or if the
> + // ciphertext is greater than the public modulus. Otherwise, no error i=
s
> + // returned. If the padding is valid, the resulting plaintext message i=
s copied
> +@@ -114,7 +110,7 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, priv =
*PrivateKey, ciphertext []by
> +               return ErrDecryption
> +       }
> +
> +-      valid, em, index, err :=3D decryptPKCS1v15(rand, priv, ciphertext=
)
> ++      valid, em, index, err :=3D decryptPKCS1v15(priv, ciphertext)
> +       if err !=3D nil {
> +               return err
> +       }
> +@@ -130,26 +126,24 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, pri=
v *PrivateKey, ciphertext []by
> +       return nil
> + }
> +
> +-// decryptPKCS1v15 decrypts ciphertext using priv and blinds the operat=
ion if
> +-// rand is not nil. It returns one or zero in valid that indicates whet=
her the
> +-// plaintext was correctly structured. In either case, the plaintext is
> +-// returned in em so that it may be read independently of whether it wa=
s valid
> +-// in order to maintain constant memory access patterns. If the plainte=
xt was
> +-// valid then index contains the index of the original message in em.
> +-func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byt=
e) (valid int, em []byte, index int, err error) {
> ++// decryptPKCS1v15 decrypts ciphertext using priv. It returns one or ze=
ro in
> ++// valid that indicates whether the plaintext was correctly structured.
> ++// In either case, the plaintext is returned in em so that it may be re=
ad
> ++// independently of whether it was valid in order to maintain constant =
memory
> ++// access patterns. If the plaintext was valid then index contains the =
index of
> ++// the original message in em, to allow constant time padding removal.
> ++func decryptPKCS1v15(priv *PrivateKey, ciphertext []byte) (valid int, e=
m []byte, index int, err error) {
> +       k :=3D priv.Size()
> +       if k < 11 {
> +               err =3D ErrDecryption
> +               return
> +       }
> +
> +-      c :=3D new(big.Int).SetBytes(ciphertext)
> +-      m, err :=3D decrypt(rand, priv, c)
> ++      em, err =3D decrypt(priv, ciphertext)
> +       if err !=3D nil {
> +               return
> +       }
> +
> +-      em =3D m.FillBytes(make([]byte, k))
> +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> +       secondByteIsTwo :=3D subtle.ConstantTimeByteEq(em[1], 2)
> +
> +@@ -221,8 +215,7 @@ var hashPrefixes =3D map[crypto.Hash][]byte{
> + // function. If hash is zero, hashed is signed directly. This isn't
> + // advisable except for interoperability.
> + //
> +-// If rand is not nil then RSA blinding will be used to avoid timing
> +-// side-channel attacks.
> ++// The rand parameter is legacy and ignored, and it can be as nil.
> + //
> + // This function is deterministic. Thus, if the set of possible
> + // messages is small, an attacker may be able to build a map from
> +@@ -249,13 +242,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKey,=
 hash crypto.Hash, hashed []b
> +       copy(em[k-tLen:k-hashLen], prefix)
> +       copy(em[k-hashLen:k], hashed)
> +
> +-      m :=3D new(big.Int).SetBytes(em)
> +-      c, err :=3D decryptAndCheck(rand, priv, m)
> +-      if err !=3D nil {
> +-              return nil, err
> +-      }
> +-
> +-      return c.FillBytes(em), nil
> ++      return decryptAndCheck(priv, em)
> + }
> +
> + // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.
> +@@ -275,9 +262,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash=
, hashed []byte, sig []byte)
> +               return ErrVerification
> +       }
> +
> +-      c :=3D new(big.Int).SetBytes(sig)
> +-      m :=3D encrypt(new(big.Int), pub, c)
> +-      em :=3D m.FillBytes(make([]byte, k))
> ++      em :=3D encrypt(pub, sig)
> +       // EM =3D 0x00 || 0x01 || PS || 0x00 || T
> +
> +       ok :=3D subtle.ConstantTimeByteEq(em[0], 0)
> +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> +index 814522d..eaba4be 100644
> +--- a/src/crypto/rsa/pss.go
> ++++ b/src/crypto/rsa/pss.go
> +@@ -12,7 +12,6 @@ import (
> +       "errors"
> +       "hash"
> +       "io"
> +-      "math/big"
> + )
> +
> + // Per RFC 8017, Section 9.1
> +@@ -207,19 +206,27 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen =
int, hash hash.Hash) error {
> + // Note that hashed must be the result of hashing the input message usi=
ng the
> + // given hash function. salt is a random sequence of bytes whose length=
 will be
> + // later used to verify the signature.
> +-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash=
, hashed, salt []byte) ([]byte, error) {
> +-      emBits :=3D priv.N.BitLen() - 1
> ++func signPSSWithSalt(priv *PrivateKey, hash crypto.Hash, hashed, salt [=
]byte) ([]byte, error) {
> ++      emBits :=3D bigBitLen(priv.N) - 1
> +       em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
> +       if err !=3D nil {
> +               return nil, err
> +       }
> +-      m :=3D new(big.Int).SetBytes(em)
> +-      c, err :=3D decryptAndCheck(rand, priv, m)
> +-      if err !=3D nil {
> +-              return nil, err
> ++
> ++      // RFC 8017: "Note that the octet length of EM will be one less t=
han k if
> ++      // modBits - 1 is divisible by 8 and equal to k otherwise, where =
k is the
> ++      // length in octets of the RSA modulus n." =F0=9F=99=84
> ++      //
> ++      // This is extremely annoying, as all other encrypt and decrypt i=
nputs are
> ++      // always the exact same size as the modulus. Since it only happe=
ns for
> ++      // weird modulus sizes, fix it by padding inefficiently.
> ++      if emLen, k :=3D len(em), priv.Size(); emLen < k {
> ++              emNew :=3D make([]byte, k)
> ++              copy(emNew[k-emLen:], em)
> ++              em =3D emNew
> +       }
> +-      s :=3D make([]byte, priv.Size())
> +-      return c.FillBytes(s), nil
> ++
> ++      return decryptAndCheck(priv, em)
> + }
> +
> + const (
> +@@ -269,7 +276,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash =
crypto.Hash, digest []byte,
> +       saltLength :=3D opts.saltLength()
> +       switch saltLength {
> +       case PSSSaltLengthAuto:
> +-              saltLength =3D (priv.N.BitLen()-1+7)/8 - 2 - hash.Size()
> ++              saltLength =3D (bigBitLen(priv.N)-1+7)/8 - 2 - hash.Size(=
)
> +       case PSSSaltLengthEqualsHash:
> +               saltLength =3D hash.Size()
> +       }
> +@@ -278,7 +285,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash =
crypto.Hash, digest []byte,
> +       if _, err :=3D io.ReadFull(rand, salt); err !=3D nil {
> +               return nil, err
> +       }
> +-      return signPSSWithSalt(rand, priv, hash, digest, salt)
> ++      return signPSSWithSalt(priv, hash, digest, salt)
> + }
> +
> + // VerifyPSS verifies a PSS signature.
> +@@ -291,13 +298,22 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash, d=
igest []byte, sig []byte, opts
> +       if len(sig) !=3D pub.Size() {
> +               return ErrVerification
> +       }
> +-      s :=3D new(big.Int).SetBytes(sig)
> +-      m :=3D encrypt(new(big.Int), pub, s)
> +-      emBits :=3D pub.N.BitLen() - 1
> ++
> ++      emBits :=3D bigBitLen(pub.N) - 1
> +       emLen :=3D (emBits + 7) / 8
> +-      if m.BitLen() > emLen*8 {
> +-              return ErrVerification
> ++      em :=3D encrypt(pub, sig)
> ++
> ++      // Like in signPSSWithSalt, deal with mismatches between emLen an=
d the size
> ++      // of the modulus. The spec would have us wire emLen into the enc=
oding
> ++      // function, but we'd rather always encode to the size of the mod=
ulus and
> ++      // then strip leading zeroes if necessary. This only happens for =
weird
> ++      // modulus sizes anyway.
> ++      for len(em) > emLen && len(em) > 0 {
> ++              if em[0] !=3D 0 {
> ++                      return ErrVerification
> ++              }
> ++              em =3D em[1:]
> +       }
> +-      em :=3D m.FillBytes(make([]byte, emLen))
> ++
> +       return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.=
New())
> + }
> +diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
> +index c3a6d46..d018b43 100644
> +--- a/src/crypto/rsa/pss_test.go
> ++++ b/src/crypto/rsa/pss_test.go
> +@@ -233,7 +233,10 @@ func TestPSSSigning(t *testing.T) {
> +       }
> + }
> +
> +-func TestSignWithPSSSaltLengthAuto(t *testing.T) {
> ++func TestPSS513(t *testing.T) {
> ++      // See Issue 42741, and separately, RFC 8017: "Note that the octe=
t length of
> ++      // EM will be one less than k if modBits - 1 is divisible by 8 an=
d equal to
> ++      // k otherwise, where k is the length in octets of the RSA modulu=
s n."
> +       key, err :=3D GenerateKey(rand.Reader, 513)
> +       if err !=3D nil {
> +               t.Fatal(err)
> +@@ -246,8 +249,9 @@ func TestSignWithPSSSaltLengthAuto(t *testing.T) {
> +       if err !=3D nil {
> +               t.Fatal(err)
> +       }
> +-      if len(signature) =3D=3D 0 {
> +-              t.Fatal("empty signature returned")
> ++      err =3D VerifyPSS(&key.PublicKey, crypto.SHA256, digest[:], signa=
ture, nil)
> ++      if err !=3D nil {
> ++              t.Error(err)
> +       }
> + }
> +
> +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
> +index 5a00ed2..29d9d31 100644
> +--- a/src/crypto/rsa/rsa.go
> ++++ b/src/crypto/rsa/rsa.go
> +@@ -19,13 +19,17 @@
> + // over the public key primitive, the PrivateKey type implements the
> + // Decrypter and Signer interfaces from the crypto package.
> + //
> +-// The RSA operations in this package are not implemented using constan=
t-time algorithms.
> ++// Operations in this package are implemented using constant-time algor=
ithms,
> ++// except for [GenerateKey], [PrivateKey.Precompute], and [PrivateKey.V=
alidate].
> ++// Every other operation only leaks the bit size of the involved values=
, which
> ++// all depend on the selected key size.
> + package rsa
> +
> + import (
> +       "crypto"
> +       "crypto/rand"
> +       "crypto/subtle"
> ++      "encoding/binary"
> +       "errors"
> +       "hash"
> +       "io"
> +@@ -35,7 +39,6 @@ import (
> +       "crypto/internal/randutil"
> + )
> +
> +-var bigZero =3D big.NewInt(0)
> + var bigOne =3D big.NewInt(1)
> +
> + // A PublicKey represents the public part of an RSA key.
> +@@ -47,7 +50,7 @@ type PublicKey struct {
> + // Size returns the modulus size in bytes. Raw signatures and ciphertex=
ts
> + // for or by this public key will have the same size.
> + func (pub *PublicKey) Size() int {
> +-      return (pub.N.BitLen() + 7) / 8
> ++      return (bigBitLen(pub.N) + 7) / 8
> + }
> +
> + // OAEPOptions is an interface for passing options to OAEP decryption u=
sing the
> +@@ -351,10 +354,19 @@ func mgf1XOR(out []byte, hash hash.Hash, seed []by=
te) {
> + // too large for the size of the public key.
> + var ErrMessageTooLong =3D errors.New("crypto/rsa: message too long for =
RSA public key size")
> +
> +-func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int {
> +-      e :=3D big.NewInt(int64(pub.E))
> +-      c.Exp(m, e, pub.N)
> +-      return c
> ++func encrypt(pub *PublicKey, plaintext []byte) []byte {
> ++
> ++      N :=3D modulusFromNat(natFromBig(pub.N))
> ++      m :=3D natFromBytes(plaintext).expandFor(N)
> ++
> ++      e :=3D make([]byte, 8)
> ++      binary.BigEndian.PutUint64(e, uint64(pub.E))
> ++      for len(e) > 1 && e[0] =3D=3D 0 {
> ++              e =3D e[1:]
> ++      }
> ++
> ++      out :=3D make([]byte, modulusSize(N))
> ++      return new(nat).exp(m, e, N).fillBytes(out)
> + }
> +
> + // EncryptOAEP encrypts the given message with RSA-OAEP.
> +@@ -404,12 +416,7 @@ func EncryptOAEP(hash hash.Hash, random io.Reader, =
pub *PublicKey, msg []byte, l
> +       mgf1XOR(db, hash, seed)
> +       mgf1XOR(seed, hash, db)
> +
> +-      m :=3D new(big.Int)
> +-      m.SetBytes(em)
> +-      c :=3D encrypt(new(big.Int), pub, m)
> +-
> +-      out :=3D make([]byte, k)
> +-      return c.FillBytes(out), nil
> ++      return encrypt(pub, em), nil
> + }
> +
> + // ErrDecryption represents a failure to decrypt a message.
> +@@ -451,98 +458,71 @@ func (priv *PrivateKey) Precompute() {
> +       }
> + }
> +
> +-// decrypt performs an RSA decryption, resulting in a plaintext integer=
. If a
> +-// random source is given, RSA blinding is used.
> +-func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.In=
t, err error) {
> +-      // TODO(agl): can we get away with reusing blinds?
> +-      if c.Cmp(priv.N) > 0 {
> +-              err =3D ErrDecryption
> +-              return
> ++// decrypt performs an RSA decryption of ciphertext into out.
> ++func decrypt(priv *PrivateKey, ciphertext []byte) ([]byte, error) {
> ++
> ++      N :=3D modulusFromNat(natFromBig(priv.N))
> ++      c :=3D natFromBytes(ciphertext).expandFor(N)
> ++      if c.cmpGeq(N.nat) =3D=3D 1 {
> ++              return nil, ErrDecryption
> +       }
> +       if priv.N.Sign() =3D=3D 0 {
> +               return nil, ErrDecryption
> +       }
> +
> +-      var ir *big.Int
> +-      if random !=3D nil {
> +-              randutil.MaybeReadByte(random)
> +-
> +-              // Blinding enabled. Blinding involves multiplying c by r=
^e.
> +-              // Then the decryption operation performs (m^e * r^e)^d m=
od n
> +-              // which equals mr mod n. The factor of r can then be rem=
oved
> +-              // by multiplying by the multiplicative inverse of r.
> +-
> +-              var r *big.Int
> +-              ir =3D new(big.Int)
> +-              for {
> +-                      r, err =3D rand.Int(random, priv.N)
> +-                      if err !=3D nil {
> +-                              return
> +-                      }
> +-                      if r.Cmp(bigZero) =3D=3D 0 {
> +-                              r =3D bigOne
> +-                      }
> +-                      ok :=3D ir.ModInverse(r, priv.N)
> +-                      if ok !=3D nil {
> +-                              break
> +-                      }
> +-              }
> +-              bigE :=3D big.NewInt(int64(priv.E))
> +-              rpowe :=3D new(big.Int).Exp(r, bigE, priv.N) // N !=3D 0
> +-              cCopy :=3D new(big.Int).Set(c)
> +-              cCopy.Mul(cCopy, rpowe)
> +-              cCopy.Mod(cCopy, priv.N)
> +-              c =3D cCopy
> +-      }
> +-
> ++      // Note that because our private decryption exponents are stored =
as big.Int,
> ++      // we potentially leak the exact number of bits of these exponent=
s. This
> ++      // isn't great, but should be fine.
> +       if priv.Precomputed.Dp =3D=3D nil {
> +-              m =3D new(big.Int).Exp(c, priv.D, priv.N)
> +-      } else {
> +-              // We have the precalculated values needed for the CRT.
> +-              m =3D new(big.Int).Exp(c, priv.Precomputed.Dp, priv.Prime=
s[0])
> +-              m2 :=3D new(big.Int).Exp(c, priv.Precomputed.Dq, priv.Pri=
mes[1])
> +-              m.Sub(m, m2)
> +-              if m.Sign() < 0 {
> +-                      m.Add(m, priv.Primes[0])
> +-              }
> +-              m.Mul(m, priv.Precomputed.Qinv)
> +-              m.Mod(m, priv.Primes[0])
> +-              m.Mul(m, priv.Primes[1])
> +-              m.Add(m, m2)
> +-
> +-              for i, values :=3D range priv.Precomputed.CRTValues {
> +-                      prime :=3D priv.Primes[2+i]
> +-                      m2.Exp(c, values.Exp, prime)
> +-                      m2.Sub(m2, m)
> +-                      m2.Mul(m2, values.Coeff)
> +-                      m2.Mod(m2, prime)
> +-                      if m2.Sign() < 0 {
> +-                              m2.Add(m2, prime)
> +-                      }
> +-                      m2.Mul(m2, values.R)
> +-                      m.Add(m, m2)
> +-              }
> +-      }
> +-
> +-      if ir !=3D nil {
> +-              // Unblind.
> +-              m.Mul(m, ir)
> +-              m.Mod(m, priv.N)
> +-      }
> +-
> +-      return
> ++              out :=3D make([]byte, modulusSize(N))
> ++              return new(nat).exp(c, priv.D.Bytes(), N).fillBytes(out),=
 nil
> ++      }
> ++
> ++      t0 :=3D new(nat)
> ++      P :=3D modulusFromNat(natFromBig(priv.Primes[0]))
> ++      Q :=3D modulusFromNat(natFromBig(priv.Primes[1]))
> ++      // m =3D c ^ Dp mod p
> ++      m :=3D new(nat).exp(t0.mod(c, P), priv.Precomputed.Dp.Bytes(), P)
> ++      // m2 =3D c ^ Dq mod q
> ++      m2 :=3D new(nat).exp(t0.mod(c, Q), priv.Precomputed.Dq.Bytes(), Q=
)
> ++      // m =3D m - m2 mod p
> ++      m.modSub(t0.mod(m2, P), P)
> ++      // m =3D m * Qinv mod p
> ++      m.modMul(natFromBig(priv.Precomputed.Qinv).expandFor(P), P)
> ++      // m =3D m * q mod N
> ++      m.expandFor(N).modMul(t0.mod(Q.nat, N), N)
> ++      // m =3D m + m2 mod N
> ++      m.modAdd(m2.expandFor(N), N)
> ++
> ++      for i, values :=3D range priv.Precomputed.CRTValues {
> ++              p :=3D modulusFromNat(natFromBig(priv.Primes[2+i]))
> ++              // m2 =3D c ^ Exp mod p
> ++              m2.exp(t0.mod(c, p), values.Exp.Bytes(), p)
> ++              // m2 =3D m2 - m mod p
> ++              m2.modSub(t0.mod(m, p), p)
> ++              // m2 =3D m2 * Coeff mod p
> ++              m2.modMul(natFromBig(values.Coeff).expandFor(p), p)
> ++              // m2 =3D m2 * R mod N
> ++              R :=3D natFromBig(values.R).expandFor(N)
> ++              m2.expandFor(N).modMul(R, N)
> ++              // m =3D m + m2 mod N
> ++              m.modAdd(m2, N)
> ++      }
> ++
> ++      out :=3D make([]byte, modulusSize(N))
> ++      return m.fillBytes(out), nil
> + }
> +
> +-func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m=
 *big.Int, err error) {
> +-      m, err =3D decrypt(random, priv, c)
> ++func decryptAndCheck(priv *PrivateKey, ciphertext []byte) (m []byte, er=
r error) {
> ++      m, err =3D decrypt(priv, ciphertext)
> +       if err !=3D nil {
> +               return nil, err
> +       }
> +
> +       // In order to defend against errors in the CRT computation, m^e =
is
> +       // calculated, which should match the original ciphertext.
> +-      check :=3D encrypt(new(big.Int), &priv.PublicKey, m)
> +-      if c.Cmp(check) !=3D 0 {
> ++      check :=3D encrypt(&priv.PublicKey, m)
> ++      if subtle.ConstantTimeCompare(ciphertext, check) !=3D 1 {
> +               return nil, errors.New("rsa: internal error")
> +       }
> +       return m, nil
> +@@ -554,9 +534,7 @@ func decryptAndCheck(random io.Reader, priv *Private=
Key, c *big.Int) (m *big.Int
> + // Encryption and decryption of a given message must use the same hash =
function
> + // and sha256.New() is a reasonable choice.
> + //
> +-// The random parameter, if not nil, is used to blind the private-key o=
peration
> +-// and avoid timing side-channel attacks. Blinding is purely internal t=
o this
> +-// function =E2=80=93 the random data need not match that used when enc=
rypting.
> ++// The random parameter is legacy and ignored, and it can be as nil.
> + //
> + // The label parameter must match the value given when encrypting. See
> + // EncryptOAEP for details.
> +@@ -570,9 +548,7 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, p=
riv *PrivateKey, ciphertext
> +               return nil, ErrDecryption
> +       }
> +
> +-      c :=3D new(big.Int).SetBytes(ciphertext)
> +-
> +-      m, err :=3D decrypt(random, priv, c)
> ++      em, err :=3D decrypt(priv, ciphertext)
> +       if err !=3D nil {
> +               return nil, err
> +       }
> +@@ -581,10 +557,6 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, =
priv *PrivateKey, ciphertext
> +       lHash :=3D hash.Sum(nil)
> +       hash.Reset()
> +
> +-      // We probably leak the number of leading zeros.
> +-      // It's not clear that we can do anything about this.
> +-      em :=3D m.FillBytes(make([]byte, k))
> +-
> +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> +
> +       seed :=3D em[1 : hash.Size()+1]
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193344): https://lists.openembedded.org/g/openembedde=
d-core/message/193344
> Mute This Topic: https://lists.openembedded.org/mt/103539124/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

