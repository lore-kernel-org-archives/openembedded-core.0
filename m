Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4F1C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 16:24:32 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.739.1710260664483411046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 09:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QU2apm8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso4116083276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710260663; x=1710865463; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dEhdXkGxKrAZDaGWF1bCHvCl2AYu1HgcqY4FpacmFQ=;
        b=QU2apm8VYSbf4aQhGpbwVAYwHMPt7KZuNHxmLrsEhfhmMZoEI/oYczIdRv9IOwxnN9
         ccE4/XRimNUARjW208e9hYVSTrFi/d1XJsJEjE15R6XMnpYC2A5Z1oY2yYRMfzKSUS9J
         PtNWxkgd2D+96VRPeCRAbGQSo97BdgLanHH2vtBOyDJo6y7A5rsFClU70ENcrCjl+VMt
         QT/9wDqFDLqyiSfdZLg4bMmY5pz2Zo7JRSHBEbYu+5B6eEKJEzciTsljjFbRNSNqKXru
         /5K7yWoMbBnOV5AFid361XqIMABcMz+ZsvTSseDyi+2i3qN2cBpmZDyfpfJ3X51TrqQA
         PJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710260663; x=1710865463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dEhdXkGxKrAZDaGWF1bCHvCl2AYu1HgcqY4FpacmFQ=;
        b=l3m0MPdpmLaWEIF6rQMuCRRd01fHdWv7SyCjqkE4sRGy/c/nyjgwrSwdsxmo5H/9oR
         kZunOGiRlmXuCfPrqrbq2o1PbwSCL1SjdB8cvcsiOPQASLyQ8o4BxqSg7+5XyO+Th1pA
         gQ1E8v5L6bX6fjKZWLNElSju+d2aP1e3kZYGn1Sw9soUcHeJ3agzvtxWDwfFFAmyEOlP
         67WhwdEtmOdKmhXNiZQVcu74xN/TdHDXFTJJBtoXsIyQ5XsNBCIK+i19nPb6wpFJTIuk
         HFwFhwlTKIqM91k97TcHO5WZHfkS3pKD4tvE6tuKDHUYrDhVnvH2i1sBBdlj+DIZaBP3
         OEkA==
X-Gm-Message-State: AOJu0YzlpdcHE/hCuKMzss/FZG+W4KpN1CDimTvJDCOpAXiRM0NZkb0s
	FAOwjjk1fE++LufLE0Uy49vEtfnrY8EMDyEsjp5f5YnZvi5XqckHkElrXcMRvn6WozkpxjAe2Ug
	NPVIibX8R6dnAzSftUaJ4TEFaGUYI95I1YPTqjSYgCKktCnN43E4ZZw==
X-Google-Smtp-Source: AGHT+IF8RWJjAqTKdHFM/7JSfQqD5V2nkQzlAjhN4INp3d2R/T5uGsAMGs2hz1WaWwcHltPbgULE+6d1zfIKVmv64K0=
X-Received: by 2002:a05:6902:1347:b0:dc7:4cff:9165 with SMTP id
 g7-20020a056902134700b00dc74cff9165mr7369992ybu.59.1710260663572; Tue, 12 Mar
 2024 09:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240311083954.418271-1-chee.yang.lee@intel.com> <20240311083954.418271-2-chee.yang.lee@intel.com>
In-Reply-To: <20240311083954.418271-2-chee.yang.lee@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 12 Mar 2024 06:24:12 -1000
Message-ID: <CAOSpxdbG-wDHzQF_md03xApy2Vp_5Q+tax5TUVAkqp9q3B7e4A@mail.gmail.com>
Subject: Re: [OE-core] [nanbield][PATCH 2/7] openssl: upgrade to 3.1.5
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196997

I'm getting ptest failures with this patch, both on qemux86-64-pteset
and qemuarm64-ptest.

Links to logs below:

https://autobuilder.yocto.io/pub/non-release/20240311-30/testresults/qemux8=
6-64-ptest/core-image-ptest-openssl/log.do_testimage.831625.20240311232818
https://autobuilder.yocto.io/pub/non-release/20240311-30/testresults/qemuar=
m64-ptest/core-image-ptest-openssl/log.do_testimage.152067.20240312011738

Steve

On Sun, Mar 10, 2024 at 10:40=E2=80=AFPM Lee Chee Yang <chee.yang.lee@intel=
.com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Changes between 3.1.4 and 3.1.5 [30 Jan 2024]
>  * A file in PKCS12 format can contain certificates and keys and may
> come from
>    an untrusted source. The PKCS12 specification allows certain fields
> to be
>    NULL, but OpenSSL did not correctly check for this case. A fix has
> been
>    applied to prevent a NULL pointer dereference that results in OpenSSL
>    crashing. If an application processes PKCS12 files from an untrusted
> source
>    using the OpenSSL APIs then that application will be vulnerable to
> this
>    issue prior to this fix.
>
>    OpenSSL APIs that were vulnerable to this are: PKCS12_parse(),
>    PKCS12_unpack_p7data(), PKCS12_unpack_p7encdata(),
> PKCS12_unpack_authsafes()
>    and PKCS12_newpass().
>
>    We have also fixed a similar issue in SMIME_write_PKCS7(). However
> since this
>    function is related to writing data we do not consider it security
>    significant.
>
>    ([CVE-2024-0727])
> https://www.openssl.org/news/cl31.txt
>
> drop fix_random_labels.patch as fixed in
> https://github.com/openssl/openssl/commit/99630a1b08fd6464d95052dee4a3500=
afeb95867
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../openssl/openssl/fix_random_labels.patch   | 22 -------------------
>  .../{openssl_3.1.4.bb =3D> openssl_3.1.5.bb}    |  3 +--
>  2 files changed, 1 insertion(+), 24 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_=
labels.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.1.4.bb =3D> openssl_=
3.1.5.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.=
patch b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
> deleted file mode 100644
> index 78dcd81685..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -The perl script adds random suffixes to the local function names to ensu=
re
> -it doesn't clash with other parts of openssl. Set the random number seed
> -to something predictable so the assembler files are generated consistent=
ly
> -and our own reproducible builds tests pass.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Index: openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-3.1.0.orig/crypto/modes/asm/aes-gcm-avx512.pl
> -+++ openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
> -@@ -191,6 +191,9 @@ my $CTX_OFFSET_HTable    =3D (16 * 6);
> - # ;;; Helper functions
> - # ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
> -
> -+# Ensure the local labels are reproduicble
> -+srand(10000);
> -+
> - # ; Generates "random" local labels
> - sub random_string() {
> -   my @chars  =3D ('a' .. 'z', 'A' .. 'Z', '0' .. '9', '_');
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.1.5.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_3.1.4.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.1.5.bb
> index 0fe4e76808..9c1d4e31be 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>             file://run-ptest \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -           file://fix_random_labels.patch \
>             file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
>             "
>
> @@ -19,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84c=
aa600fea1731eee3"
> +SRC_URI[sha256sum] =3D "6ae015467dabf0469b139ada93319327be24b98251ffaece=
da0221848dc09262"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative man=
pages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196921): https://lists.openembedded.org/g/openembedde=
d-core/message/196921
> Mute This Topic: https://lists.openembedded.org/mt/104859411/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

