Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08136D7360D
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 19:02:04 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.138176.1732993323476211998
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 11:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcx7zQE9;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71d4d3738cdso1077117a34.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732993323; x=1733598123; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqdTT8fTokk5KNV1C60IMzVwbU7BHx3q940rMtW2tqw=;
        b=gcx7zQE9Zo3pbej4iccXwgowDMOUos71jKHS3fkNvY3y1aZnNkAumZ01ojxzTSbQFU
         ZJA2Yz6u8mQdQ0QaI3HceyHvJV0/RAXOVhGV0ufatFSB86s6KpKTayMZnuakPukrh4Qr
         wTMG1YvMhwZBsngtx25amcL/9pEcg9b/bnGtwsf78+gRKdtTuePdx7VaVd7w4JP7Lkxj
         vyJ5WzfzSfITS8ldgnyHGkpTd4qXJRW7FLIdMyZhnCJjdeJAOApO+ph+4sjk0fhqO6t8
         Tfqb3+PXNgCQKodCpd8PHx3EmQbBq2UVD0vSpr1lAu0/V/a7O943UQ/88fNAHhJA27/X
         lHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732993323; x=1733598123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqdTT8fTokk5KNV1C60IMzVwbU7BHx3q940rMtW2tqw=;
        b=VlT+2oPzUnN7GBljw6onbt0pLpmpTLOBh+LDyzrH+tAcja5/OyNMwq4SJSxlvekcU6
         YAy/W60D6yqhdtfI45RmvGInanWL/b91D2z8c6Rxy9l2T1eeIlZgS2c6gsacSOtUwv3Q
         AJ1gtrYtbjaAVqaSjpZxr1h8izgU333hC8Ip6EQ6/mNBAHvi8qy+H1L98eu7yCR0fayk
         EfTI0J75VQqR1m1LqizJ13YBTR/6QFEmzH9ZLzeKaNediJRwEQr1+yk9gk0SlOlUa3Dw
         tO69bPP+6KcSDdQF6pbiTOON+CliOkxXCO62Br/b3lBqMFNyLGoOkg11S/wdl3COCiq7
         GRwg==
X-Gm-Message-State: AOJu0YzeJdpCbKRlBoWsl/NooQo0WmPGCPK9v/YjhRYB7yGgqqkOPwHM
	dR55/YgZy+YJ9F9Za3MORChz7UdSyg5hSIROLMW0cwDFwNxO6j7C0ZwOUYIGS6OHMUvIJ64r6eW
	s3ICr8C3fu6yJT51c7QLgpek/ru4=
X-Gm-Gg: ASbGnctDX9UDkA28mU7emEpSsSOn8eXmufOBNztv9azyRwqGz5BdonhNEZ1xlW4pN+K
	K4taxQHXJjtPmgvnFVXST52Z/WcBhKqkUj3lFTFdqNB3Z5g==
X-Google-Smtp-Source: AGHT+IG1iLOIYNj7Ar0pKP3bvhDrbA3ScOoThxDpCn9KFCptRMxAx+Oztq0Iv5t3O3H6tXDYNO5flOIPRX/5fenByus=
X-Received: by 2002:a05:6830:6a92:b0:71d:4150:9e5e with SMTP id
 46e09a7af769-71d65c75589mr15103994a34.2.1732993321975; Sat, 30 Nov 2024
 11:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20241129182720.1487822-1-peter.marko@siemens.com>
In-Reply-To: <20241129182720.1487822-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Nov 2024 11:01:35 -0800
Message-ID: <CAMKF1srGZCRauQ4tGyzhFHKSvpNu_VeyVpUj78TWaMzEnGoXqA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python: backport patches to support openssl 3.4.0
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 19:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208047

I think this along with openssl 3.4 upgrade is causing
python3-m2crypto to break see

https://valkyrie.yoctoproject.org/#/builders/81/builds/180/steps/14/logs/st=
dio

On Fri, Nov 29, 2024 at 10:28=E2=80=AFAM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> https://github.com/python/cpython/pull/127331
> https://github.com/python/cpython/pull/127361
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 +++++++++++++++++
>  ...01-ssl-Raise-OSError-for-ERR_LIB_SYS.patch |   51 +
>  .../recipes-devtools/python/python3_3.13.0.bb |    2 +
>  3 files changed, 1505 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Generate-da=
ta-for-OpenSSL-3.4-and-add-it-to-multissl.patch
>  create mode 100644 meta/recipes-devtools/python/python3/0001-ssl-Raise-O=
SError-for-ERR_LIB_SYS.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-=
OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/pyt=
hon3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
> new file mode 100644
> index 0000000000..d8ad803d50
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL=
-3.4-and-add-it-to-multissl.patch
> @@ -0,0 +1,1452 @@
> +From db5c5763f3e3172f1dd011355b41469770dafc0f Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Thu, 28 Nov 2024 13:29:27 +0100
> +Subject: [PATCH] gh-127330: Update for OpenSSL 3.4 & document+improve th=
e
> + update process (GH-127331)
> +
> +- Add `git describe` output to headers generated by `make_ssl_data.py`
> +
> +  This info is more important than the date when the file was generated.
> +  It does mean that the tool now requires a Git checkout of OpenSSL,
> +  not for example a release tarball.
> +
> +- Regenerate the older file to add the info.
> +  To the other older file, add a note about manual edits.
> +
> +- Add notes on how to add a new OpenSSL version
> +
> +- Add 3.4 error messages and multissl tests
> +
> +Upstream-Status: Submitted [https://github.com/python/cpython/commit/db5=
c5763f3e3172f1dd011355b41469770dafc0f]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + Modules/_ssl.c                             |   2 +-
> + Modules/_ssl_data_111.h                    |   4 +-
> + Modules/_ssl_data_300.h                    |   5 +-
> + Modules/{_ssl_data_31.h =3D> _ssl_data_34.h} | 674 ++++++++++++++++++++=
-
> + Tools/c-analyzer/cpython/_parser.py        |   4 +-
> + Tools/ssl/make_ssl_data.py                 |  34 +-
> + Tools/ssl/multissltests.py                 |   1 +
> + 7 files changed, 714 insertions(+), 10 deletions(-)
> + rename Modules/{_ssl_data_31.h =3D> _ssl_data_34.h} (92%)
> +
> +diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> +index b6b5ebf094c..e5b8bf21002 100644
> +--- a/Modules/_ssl.c
> ++++ b/Modules/_ssl.c
> +@@ -122,7 +122,7 @@ static void _PySSLFixErrno(void) {
> +
> + /* Include generated data (error codes) */
> + #if (OPENSSL_VERSION_NUMBER >=3D 0x30100000L)
> +-#include "_ssl_data_31.h"
> ++#include "_ssl_data_34.h"
> + #elif (OPENSSL_VERSION_NUMBER >=3D 0x30000000L)
> + #include "_ssl_data_300.h"
> + #elif (OPENSSL_VERSION_NUMBER >=3D 0x10101000L)
> +diff --git a/Modules/_ssl_data_111.h b/Modules/_ssl_data_111.h
> +index 093c786e6a2..061fac2bd58 100644
> +--- a/Modules/_ssl_data_111.h
> ++++ b/Modules/_ssl_data_111.h
> +@@ -1,4 +1,6 @@
> +-/* File generated by Tools/ssl/make_ssl_data.py *//* Generated on 2023-=
06-01T02:58:04.081473 */
> ++/* File generated by Tools/ssl/make_ssl_data.py */
> ++/* Generated on 2024-11-27T12:48:46.194048+00:00 */
> ++/* Generated from Git commit OpenSSL_1_1_1w-0-ge04bd3433f */
> + static struct py_ssl_library_code library_codes[] =3D {
> + #ifdef ERR_LIB_ASN1
> +     {"ASN1", ERR_LIB_ASN1},
> +diff --git a/Modules/_ssl_data_300.h b/Modules/_ssl_data_300.h
> +index dc66731f6b6..b687ce43c77 100644
> +--- a/Modules/_ssl_data_300.h
> ++++ b/Modules/_ssl_data_300.h
> +@@ -1,4 +1,7 @@
> +-/* File generated by Tools/ssl/make_ssl_data.py *//* Generated on 2023-=
06-01T03:03:52.163218 */
> ++/* File generated by Tools/ssl/make_ssl_data.py */
> ++/* Generated on 2023-06-01T03:03:52.163218 */
> ++/* Manually edited to add definitions from 1.1.1 (GH-105174) */
> ++
> + static struct py_ssl_library_code library_codes[] =3D {
> + #ifdef ERR_LIB_ASN1
> +     {"ASN1", ERR_LIB_ASN1},
> +diff --git a/Modules/_ssl_data_31.h b/Modules/_ssl_data_34.h
> +similarity index 92%
> +rename from Modules/_ssl_data_31.h
> +rename to Modules/_ssl_data_34.h
> +index c589c501f4e..d4af3e1c1fa 100644
> +--- a/Modules/_ssl_data_31.h
> ++++ b/Modules/_ssl_data_34.h
> +@@ -1,4 +1,6 @@
> +-/* File generated by Tools/ssl/make_ssl_data.py *//* Generated on 2023-=
06-01T03:04:00.275280 */
> ++/* File generated by Tools/ssl/make_ssl_data.py */
> ++/* Generated on 2024-11-27T12:35:52.276767+00:00 */
> ++/* Generated from Git commit openssl-3.4.0-0-g98acb6b028 */
> + static struct py_ssl_library_code library_codes[] =3D {
> + #ifdef ERR_LIB_ASN1
> +     {"ASN1", ERR_LIB_ASN1},
> +@@ -300,6 +302,11 @@ static struct py_ssl_error_code error_codes[] =3D {
> +   #else
> +     {"FIRST_NUM_TOO_LARGE", 13, 122},
> +   #endif
> ++  #ifdef ASN1_R_GENERALIZEDTIME_IS_TOO_SHORT
> ++    {"GENERALIZEDTIME_IS_TOO_SHORT", ERR_LIB_ASN1, ASN1_R_GENERALIZEDTI=
ME_IS_TOO_SHORT},
> ++  #else
> ++    {"GENERALIZEDTIME_IS_TOO_SHORT", 13, 232},
> ++  #endif
> +   #ifdef ASN1_R_HEADER_TOO_LONG
> +     {"HEADER_TOO_LONG", ERR_LIB_ASN1, ASN1_R_HEADER_TOO_LONG},
> +   #else
> +@@ -730,6 +737,11 @@ static struct py_ssl_error_code error_codes[] =3D {
> +   #else
> +     {"UNSUPPORTED_TYPE", 13, 196},
> +   #endif
> ++  #ifdef ASN1_R_UTCTIME_IS_TOO_SHORT
> ++    {"UTCTIME_IS_TOO_SHORT", ERR_LIB_ASN1, ASN1_R_UTCTIME_IS_TOO_SHORT}=
,
> ++  #else
> ++    {"UTCTIME_IS_TOO_SHORT", 13, 233},
> ++  #endif
> +   #ifdef ASN1_R_WRONG_INTEGER_TYPE
> +     {"WRONG_INTEGER_TYPE", ERR_LIB_ASN1, ASN1_R_WRONG_INTEGER_TYPE},
> +   #else
> +@@ -845,6 +857,11 @@ static struct py_ssl_error_code error_codes[] =3D {
> +   #else
> +     {"LISTEN_V6_ONLY", 32, 136},
> +   #endif
> ++  #ifdef BIO_R_LOCAL_ADDR_NOT_AVAILABLE
> ++    {"LOCAL_ADDR_NOT_AVAILABLE", ERR_LIB_BIO, BIO_R_LOCAL_ADDR_NOT_AVAI=
LABLE},
> ++  #else
> ++    {"LOCAL_ADDR_NOT_AVAILABLE", 32, 111},
> ++  #endif
> +   #ifdef BIO_R_LOOKUP_RETURNED_NOTHING
> +     {"LOOKUP_RETURNED_NOTHING", ERR_LIB_BIO, BIO_R_LOOKUP_RETURNED_NOTH=
ING},
> +   #else
> +@@ -860,6 +877,11 @@ static struct py_ssl_error_code error_codes[] =3D {
> +   #else
> +     {"NBIO_CONNECT_ERROR", 32, 110},
> +   #endif
> ++  #ifdef BIO_R_NON_FATAL
> ++    {"NON_FATAL", ERR_LIB_BIO, BIO_R_NON_FATAL},
> ++  #else
> ++    {"NON_FATAL", 32, 112},
> ++  #endif
> +   #ifdef BIO_R_NO_ACCEPT_ADDR_OR_SERVICE_SPECIFIED
> +     {"NO_ACCEPT_ADDR_OR_SERVICE_SPECIFIED", ERR_LIB_BIO, BIO_R_NO_ACCEP=
T_ADDR_OR_SERVICE_SPECIFIED},
> +   #else
> +@@ -880,6 +902,26 @@ static struct py_ssl_error_code error_codes[] =3D {
> +   #else
> +     {"NO_SUCH_FILE", 32, 128},
> +   #endif
> ++  #ifdef BIO_R_PEER_ADDR_NOT_AVAILABLE
> ++    {"PEER_ADDR_NOT_AVAILABLE", ERR_LIB_BIO, BIO_R_PEER_ADDR_NOT_AVAILA=
BLE},
> ++  #else
> ++    {"PEER_ADDR_NOT_AVAILABLE", 32, 114},
> ++  #endif
> ++  #ifdef BIO_R_PORT_MISMATCH
> ++    {"PORT_MISMATCH", ERR_LIB_BIO, BIO_R_PORT_MISMATCH},
> ++  #else
> ++    {"PORT_MISMATCH", 32, 150},
> ++  #endif
> ++  #ifdef BIO_R_TFO_DISABLED
> ++    {"TFO_DISABLED", ERR_LIB_BIO, BIO_R_TFO_DISABLED},
> ++  #else
> ++    {"TFO_DISABLED", 32, 106},
> ++  #endif
> ++  #ifdef BIO_R_TFO_NO_KERNEL_SUPPORT
> ++    {"TFO_NO_KERNEL_SUPPORT", ERR_LIB_BIO, BIO_R_TFO_NO_KERNEL_SUPPORT}=
,
> ++  #else
> ++    {"TFO_NO_KERNEL_SUPPORT", 32, 108},
> ++  #endif
> +   #ifdef BIO_R_TRANSFER_ERROR
> +     {"TRANSFER_ERROR", ERR_LIB_BIO, BIO_R_TRANSFER_ERROR},
> +   #else
> +@@ -920,6 +962,11 @@ static struct py_ssl_error_code error_codes[] =3D {
> +   #else
> +     {"UNABLE_TO_REUSEADDR", 32, 139},
> +   #endif
> ++  #ifdef BIO_R_UNABLE_TO_TFO
> ++    {"UNABLE_TO_TFO", ERR_LIB_BIO, BIO_R_UNABLE_TO_TFO},
> ++  #else
> ++    {"UNABLE_TO_TFO", 32, 109},
> ++  #endif
> +   #ifdef BIO_R_UNAVAILABLE_IP_FAMILY
> +     {"UNAVAILABLE_IP_FAMILY", ERR_LIB_BIO, BIO_R_UNAVAILABLE_IP_FAMILY}=
,
> +   #else
> +@@ -1230,6 +1277,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"ERROR_VALIDATING_SIGNATURE", 58, 171},
> +   #endif
> ++  #ifdef CMP_R_EXPECTED_POLLREQ
> ++    {"EXPECTED_POLLREQ", ERR_LIB_CMP, CMP_R_EXPECTED_POLLREQ},
> ++  #else
> ++    {"EXPECTED_POLLREQ", 58, 104},
> ++  #endif
> +   #ifdef CMP_R_FAILED_BUILDING_OWN_CHAIN
> +     {"FAILED_BUILDING_OWN_CHAIN", ERR_LIB_CMP, CMP_R_FAILED_BUILDING_OW=
N_CHAIN},
> +   #else
> +@@ -1250,16 +1302,51 @@ static struct py_ssl_error_code error_codes[] =
=3D {
> +   #else
> +     {"FAIL_INFO_OUT_OF_RANGE", 58, 129},
> +   #endif
> ++  #ifdef CMP_R_GENERATE_CERTREQTEMPLATE
> ++    {"GENERATE_CERTREQTEMPLATE", ERR_LIB_CMP, CMP_R_GENERATE_CERTREQTEM=
PLATE},
> ++  #else
> ++    {"GENERATE_CERTREQTEMPLATE", 58, 197},
> ++  #endif
> ++  #ifdef CMP_R_GENERATE_CRLSTATUS
> ++    {"GENERATE_CRLSTATUS", ERR_LIB_CMP, CMP_R_GENERATE_CRLSTATUS},
> ++  #else
> ++    {"GENERATE_CRLSTATUS", 58, 198},
> ++  #endif
> ++  #ifdef CMP_R_GETTING_GENP
> ++    {"GETTING_GENP", ERR_LIB_CMP, CMP_R_GETTING_GENP},
> ++  #else
> ++    {"GETTING_GENP", 58, 192},
> ++  #endif
> ++  #ifdef CMP_R_GET_ITAV
> ++    {"GET_ITAV", ERR_LIB_CMP, CMP_R_GET_ITAV},
> ++  #else
> ++    {"GET_ITAV", 58, 199},
> ++  #endif
> +   #ifdef CMP_R_INVALID_ARGS
> +     {"INVALID_ARGS", ERR_LIB_CMP, CMP_R_INVALID_ARGS},
> +   #else
> +     {"INVALID_ARGS", 58, 100},
> +   #endif
> ++  #ifdef CMP_R_INVALID_GENP
> ++    {"INVALID_GENP", ERR_LIB_CMP, CMP_R_INVALID_GENP},
> ++  #else
> ++    {"INVALID_GENP", 58, 193},
> ++  #endif
> ++  #ifdef CMP_R_INVALID_KEYSPEC
> ++    {"INVALID_KEYSPEC", ERR_LIB_CMP, CMP_R_INVALID_KEYSPEC},
> ++  #else
> ++    {"INVALID_KEYSPEC", 58, 202},
> ++  #endif
> +   #ifdef CMP_R_INVALID_OPTION
> +     {"INVALID_OPTION", ERR_LIB_CMP, CMP_R_INVALID_OPTION},
> +   #else
> +     {"INVALID_OPTION", 58, 174},
> +   #endif
> ++  #ifdef CMP_R_INVALID_ROOTCAKEYUPDATE
> ++    {"INVALID_ROOTCAKEYUPDATE", ERR_LIB_CMP, CMP_R_INVALID_ROOTCAKEYUPD=
ATE},
> ++  #else
> ++    {"INVALID_ROOTCAKEYUPDATE", 58, 195},
> ++  #endif
> +   #ifdef CMP_R_MISSING_CERTID
> +     {"MISSING_CERTID", ERR_LIB_CMP, CMP_R_MISSING_CERTID},
> +   #else
> +@@ -1425,6 +1512,21 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TRANSFER_ERROR", 58, 159},
> +   #endif
> ++  #ifdef CMP_R_UNCLEAN_CTX
> ++    {"UNCLEAN_CTX", ERR_LIB_CMP, CMP_R_UNCLEAN_CTX},
> ++  #else
> ++    {"UNCLEAN_CTX", 58, 191},
> ++  #endif
> ++  #ifdef CMP_R_UNEXPECTED_CERTPROFILE
> ++    {"UNEXPECTED_CERTPROFILE", ERR_LIB_CMP, CMP_R_UNEXPECTED_CERTPROFIL=
E},
> ++  #else
> ++    {"UNEXPECTED_CERTPROFILE", 58, 196},
> ++  #endif
> ++  #ifdef CMP_R_UNEXPECTED_CRLSTATUSLIST
> ++    {"UNEXPECTED_CRLSTATUSLIST", ERR_LIB_CMP, CMP_R_UNEXPECTED_CRLSTATU=
SLIST},
> ++  #else
> ++    {"UNEXPECTED_CRLSTATUSLIST", 58, 201},
> ++  #endif
> +   #ifdef CMP_R_UNEXPECTED_PKIBODY
> +     {"UNEXPECTED_PKIBODY", ERR_LIB_CMP, CMP_R_UNEXPECTED_PKIBODY},
> +   #else
> +@@ -1435,11 +1537,21 @@ static struct py_ssl_error_code error_codes[] =
=3D {
> +   #else
> +     {"UNEXPECTED_PKISTATUS", 58, 185},
> +   #endif
> ++  #ifdef CMP_R_UNEXPECTED_POLLREQ
> ++    {"UNEXPECTED_POLLREQ", ERR_LIB_CMP, CMP_R_UNEXPECTED_POLLREQ},
> ++  #else
> ++    {"UNEXPECTED_POLLREQ", 58, 105},
> ++  #endif
> +   #ifdef CMP_R_UNEXPECTED_PVNO
> +     {"UNEXPECTED_PVNO", ERR_LIB_CMP, CMP_R_UNEXPECTED_PVNO},
> +   #else
> +     {"UNEXPECTED_PVNO", 58, 153},
> +   #endif
> ++  #ifdef CMP_R_UNEXPECTED_SENDER
> ++    {"UNEXPECTED_SENDER", ERR_LIB_CMP, CMP_R_UNEXPECTED_SENDER},
> ++  #else
> ++    {"UNEXPECTED_SENDER", 58, 106},
> ++  #endif
> +   #ifdef CMP_R_UNKNOWN_ALGORITHM_ID
> +     {"UNKNOWN_ALGORITHM_ID", ERR_LIB_CMP, CMP_R_UNKNOWN_ALGORITHM_ID},
> +   #else
> +@@ -1450,6 +1562,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNKNOWN_CERT_TYPE", 58, 135},
> +   #endif
> ++  #ifdef CMP_R_UNKNOWN_CRL_ISSUER
> ++    {"UNKNOWN_CRL_ISSUER", ERR_LIB_CMP, CMP_R_UNKNOWN_CRL_ISSUER},
> ++  #else
> ++    {"UNKNOWN_CRL_ISSUER", 58, 200},
> ++  #endif
> +   #ifdef CMP_R_UNKNOWN_PKISTATUS
> +     {"UNKNOWN_PKISTATUS", ERR_LIB_CMP, CMP_R_UNKNOWN_PKISTATUS},
> +   #else
> +@@ -1465,6 +1582,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_KEY_TYPE", 58, 137},
> +   #endif
> ++  #ifdef CMP_R_UNSUPPORTED_PKIBODY
> ++    {"UNSUPPORTED_PKIBODY", ERR_LIB_CMP, CMP_R_UNSUPPORTED_PKIBODY},
> ++  #else
> ++    {"UNSUPPORTED_PKIBODY", 58, 101},
> ++  #endif
> +   #ifdef CMP_R_UNSUPPORTED_PROTECTION_ALG_DHBASEDMAC
> +     {"UNSUPPORTED_PROTECTION_ALG_DHBASEDMAC", ERR_LIB_CMP, CMP_R_UNSUPP=
ORTED_PROTECTION_ALG_DHBASEDMAC},
> +   #else
> +@@ -1825,6 +1947,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"NO_SIGNERS", 46, 135},
> +   #endif
> ++  #ifdef CMS_R_OPERATION_UNSUPPORTED
> ++    {"OPERATION_UNSUPPORTED", ERR_LIB_CMS, CMS_R_OPERATION_UNSUPPORTED}=
,
> ++  #else
> ++    {"OPERATION_UNSUPPORTED", 46, 182},
> ++  #endif
> +   #ifdef CMS_R_PEER_KEY_ERROR
> +     {"PEER_KEY_ERROR", ERR_LIB_CMS, CMS_R_PEER_KEY_ERROR},
> +   #else
> +@@ -1960,6 +2087,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_RECIPIENT_TYPE", 46, 154},
> +   #endif
> ++  #ifdef CMS_R_UNSUPPORTED_SIGNATURE_ALGORITHM
> ++    {"UNSUPPORTED_SIGNATURE_ALGORITHM", ERR_LIB_CMS, CMS_R_UNSUPPORTED_=
SIGNATURE_ALGORITHM},
> ++  #else
> ++    {"UNSUPPORTED_SIGNATURE_ALGORITHM", 46, 195},
> ++  #endif
> +   #ifdef CMS_R_UNSUPPORTED_TYPE
> +     {"UNSUPPORTED_TYPE", ERR_LIB_CMS, CMS_R_UNSUPPORTED_TYPE},
> +   #else
> +@@ -1985,6 +2117,31 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"WRAP_ERROR", 46, 159},
> +   #endif
> ++  #ifdef COMP_R_BROTLI_DECODE_ERROR
> ++    {"BROTLI_DECODE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_DECODE_ERROR},
> ++  #else
> ++    {"BROTLI_DECODE_ERROR", 41, 102},
> ++  #endif
> ++  #ifdef COMP_R_BROTLI_DEFLATE_ERROR
> ++    {"BROTLI_DEFLATE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_DEFLATE_ERROR}=
,
> ++  #else
> ++    {"BROTLI_DEFLATE_ERROR", 41, 103},
> ++  #endif
> ++  #ifdef COMP_R_BROTLI_ENCODE_ERROR
> ++    {"BROTLI_ENCODE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_ENCODE_ERROR},
> ++  #else
> ++    {"BROTLI_ENCODE_ERROR", 41, 106},
> ++  #endif
> ++  #ifdef COMP_R_BROTLI_INFLATE_ERROR
> ++    {"BROTLI_INFLATE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_INFLATE_ERROR}=
,
> ++  #else
> ++    {"BROTLI_INFLATE_ERROR", 41, 104},
> ++  #endif
> ++  #ifdef COMP_R_BROTLI_NOT_SUPPORTED
> ++    {"BROTLI_NOT_SUPPORTED", ERR_LIB_COMP, COMP_R_BROTLI_NOT_SUPPORTED}=
,
> ++  #else
> ++    {"BROTLI_NOT_SUPPORTED", 41, 105},
> ++  #endif
> +   #ifdef COMP_R_ZLIB_DEFLATE_ERROR
> +     {"ZLIB_DEFLATE_ERROR", ERR_LIB_COMP, COMP_R_ZLIB_DEFLATE_ERROR},
> +   #else
> +@@ -2000,6 +2157,26 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"ZLIB_NOT_SUPPORTED", 41, 101},
> +   #endif
> ++  #ifdef COMP_R_ZSTD_COMPRESS_ERROR
> ++    {"ZSTD_COMPRESS_ERROR", ERR_LIB_COMP, COMP_R_ZSTD_COMPRESS_ERROR},
> ++  #else
> ++    {"ZSTD_COMPRESS_ERROR", 41, 107},
> ++  #endif
> ++  #ifdef COMP_R_ZSTD_DECODE_ERROR
> ++    {"ZSTD_DECODE_ERROR", ERR_LIB_COMP, COMP_R_ZSTD_DECODE_ERROR},
> ++  #else
> ++    {"ZSTD_DECODE_ERROR", 41, 108},
> ++  #endif
> ++  #ifdef COMP_R_ZSTD_DECOMPRESS_ERROR
> ++    {"ZSTD_DECOMPRESS_ERROR", ERR_LIB_COMP, COMP_R_ZSTD_DECOMPRESS_ERRO=
R},
> ++  #else
> ++    {"ZSTD_DECOMPRESS_ERROR", 41, 109},
> ++  #endif
> ++  #ifdef COMP_R_ZSTD_NOT_SUPPORTED
> ++    {"ZSTD_NOT_SUPPORTED", ERR_LIB_COMP, COMP_R_ZSTD_NOT_SUPPORTED},
> ++  #else
> ++    {"ZSTD_NOT_SUPPORTED", 41, 110},
> ++  #endif
> +   #ifdef CONF_R_ERROR_LOADING_DSO
> +     {"ERROR_LOADING_DSO", ERR_LIB_CONF, CONF_R_ERROR_LOADING_DSO},
> +   #else
> +@@ -2085,6 +2262,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"RECURSIVE_DIRECTORY_INCLUDE", 14, 111},
> +   #endif
> ++  #ifdef CONF_R_RECURSIVE_SECTION_REFERENCE
> ++    {"RECURSIVE_SECTION_REFERENCE", ERR_LIB_CONF, CONF_R_RECURSIVE_SECT=
ION_REFERENCE},
> ++  #else
> ++    {"RECURSIVE_SECTION_REFERENCE", 14, 126},
> ++  #endif
> +   #ifdef CONF_R_RELATIVE_PATH
> +     {"RELATIVE_PATH", ERR_LIB_CONF, CONF_R_RELATIVE_PATH},
> +   #else
> +@@ -2370,6 +2552,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TOO_MANY_BYTES", 15, 113},
> +   #endif
> ++  #ifdef CRYPTO_R_TOO_MANY_NAMES
> ++    {"TOO_MANY_NAMES", ERR_LIB_CRYPTO, CRYPTO_R_TOO_MANY_NAMES},
> ++  #else
> ++    {"TOO_MANY_NAMES", 15, 132},
> ++  #endif
> +   #ifdef CRYPTO_R_TOO_MANY_RECORDS
> +     {"TOO_MANY_RECORDS", ERR_LIB_CRYPTO, CRYPTO_R_TOO_MANY_RECORDS},
> +   #else
> +@@ -2560,6 +2747,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_SECRET", 5, 128},
> +   #endif
> ++  #ifdef DH_R_INVALID_SIZE
> ++    {"INVALID_SIZE", ERR_LIB_DH, DH_R_INVALID_SIZE},
> ++  #else
> ++    {"INVALID_SIZE", 5, 129},
> ++  #endif
> +   #ifdef DH_R_KDF_PARAMETER_ERROR
> +     {"KDF_PARAMETER_ERROR", ERR_LIB_DH, DH_R_KDF_PARAMETER_ERROR},
> +   #else
> +@@ -2610,6 +2802,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"PEER_KEY_ERROR", 5, 111},
> +   #endif
> ++  #ifdef DH_R_Q_TOO_LARGE
> ++    {"Q_TOO_LARGE", ERR_LIB_DH, DH_R_Q_TOO_LARGE},
> ++  #else
> ++    {"Q_TOO_LARGE", 5, 130},
> ++  #endif
> +   #ifdef DH_R_SHARED_INFO_ERROR
> +     {"SHARED_INFO_ERROR", ERR_LIB_DH, DH_R_SHARED_INFO_ERROR},
> +   #else
> +@@ -3545,6 +3742,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"GENERATE_ERROR", 6, 214},
> +   #endif
> ++  #ifdef EVP_R_GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED
> ++    {"GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED", ERR_LIB_EVP, EVP_R_GE=
TTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED},
> ++  #else
> ++    {"GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED", 6, 229},
> ++  #endif
> +   #ifdef EVP_R_GET_RAW_KEY_FAILED
> +     {"GET_RAW_KEY_FAILED", ERR_LIB_EVP, EVP_R_GET_RAW_KEY_FAILED},
> +   #else
> +@@ -3745,6 +3947,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE", 6, 150},
> +   #endif
> ++  #ifdef EVP_R_OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE
> ++    {"OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE", ERR_LIB_EVP, EV=
P_R_OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE},
> ++  #else
> ++    {"OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE", 6, 226},
> ++  #endif
> +   #ifdef EVP_R_OUTPUT_WOULD_OVERFLOW
> +     {"OUTPUT_WOULD_OVERFLOW", ERR_LIB_EVP, EVP_R_OUTPUT_WOULD_OVERFLOW}=
,
> +   #else
> +@@ -3795,6 +4002,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"SET_DEFAULT_PROPERTY_FAILURE", 6, 209},
> +   #endif
> ++  #ifdef EVP_R_SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE
> ++    {"SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE", ERR_LIB_EVP, EVP_R_SIG=
NATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE},
> ++  #else
> ++    {"SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE", 6, 228},
> ++  #endif
> +   #ifdef EVP_R_TOO_MANY_RECORDS
> +     {"TOO_MANY_RECORDS", ERR_LIB_EVP, EVP_R_TOO_MANY_RECORDS},
> +   #else
> +@@ -3825,6 +4037,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNABLE_TO_SET_CALLBACKS", 6, 217},
> +   #endif
> ++  #ifdef EVP_R_UNKNOWN_BITS
> ++    {"UNKNOWN_BITS", ERR_LIB_EVP, EVP_R_UNKNOWN_BITS},
> ++  #else
> ++    {"UNKNOWN_BITS", 6, 166},
> ++  #endif
> +   #ifdef EVP_R_UNKNOWN_CIPHER
> +     {"UNKNOWN_CIPHER", ERR_LIB_EVP, EVP_R_UNKNOWN_CIPHER},
> +   #else
> +@@ -3840,6 +4057,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNKNOWN_KEY_TYPE", 6, 207},
> +   #endif
> ++  #ifdef EVP_R_UNKNOWN_MAX_SIZE
> ++    {"UNKNOWN_MAX_SIZE", ERR_LIB_EVP, EVP_R_UNKNOWN_MAX_SIZE},
> ++  #else
> ++    {"UNKNOWN_MAX_SIZE", 6, 167},
> ++  #endif
> +   #ifdef EVP_R_UNKNOWN_OPTION
> +     {"UNKNOWN_OPTION", ERR_LIB_EVP, EVP_R_UNKNOWN_OPTION},
> +   #else
> +@@ -3850,6 +4072,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNKNOWN_PBE_ALGORITHM", 6, 121},
> +   #endif
> ++  #ifdef EVP_R_UNKNOWN_SECURITY_BITS
> ++    {"UNKNOWN_SECURITY_BITS", ERR_LIB_EVP, EVP_R_UNKNOWN_SECURITY_BITS}=
,
> ++  #else
> ++    {"UNKNOWN_SECURITY_BITS", 6, 168},
> ++  #endif
> +   #ifdef EVP_R_UNSUPPORTED_ALGORITHM
> +     {"UNSUPPORTED_ALGORITHM", ERR_LIB_EVP, EVP_R_UNSUPPORTED_ALGORITHM}=
,
> +   #else
> +@@ -4040,6 +4267,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"RESPONSE_PARSE_ERROR", 61, 104},
> +   #endif
> ++  #ifdef HTTP_R_RESPONSE_TOO_MANY_HDRLINES
> ++    {"RESPONSE_TOO_MANY_HDRLINES", ERR_LIB_HTTP, HTTP_R_RESPONSE_TOO_MA=
NY_HDRLINES},
> ++  #else
> ++    {"RESPONSE_TOO_MANY_HDRLINES", 61, 130},
> ++  #endif
> +   #ifdef HTTP_R_RETRY_TIMEOUT
> +     {"RETRY_TIMEOUT", ERR_LIB_HTTP, HTTP_R_RETRY_TIMEOUT},
> +   #else
> +@@ -4530,6 +4762,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_PUBLIC_KEY_TYPE", 9, 110},
> +   #endif
> ++  #ifdef PKCS12_R_CALLBACK_FAILED
> ++    {"CALLBACK_FAILED", ERR_LIB_PKCS12, PKCS12_R_CALLBACK_FAILED},
> ++  #else
> ++    {"CALLBACK_FAILED", 35, 115},
> ++  #endif
> +   #ifdef PKCS12_R_CANT_PACK_STRUCTURE
> +     {"CANT_PACK_STRUCTURE", ERR_LIB_PKCS12, PKCS12_R_CANT_PACK_STRUCTUR=
E},
> +   #else
> +@@ -4920,6 +5157,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"CIPHER_OPERATION_FAILED", 57, 102},
> +   #endif
> ++  #ifdef PROV_R_COFACTOR_REQUIRED
> ++    {"COFACTOR_REQUIRED", ERR_LIB_PROV, PROV_R_COFACTOR_REQUIRED},
> ++  #else
> ++    {"COFACTOR_REQUIRED", 57, 236},
> ++  #endif
> +   #ifdef PROV_R_DERIVATION_FUNCTION_INIT_FAILED
> +     {"DERIVATION_FUNCTION_INIT_FAILED", ERR_LIB_PROV, PROV_R_DERIVATION=
_FUNCTION_INIT_FAILED},
> +   #else
> +@@ -4935,6 +5177,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"EMS_NOT_ENABLED", 57, 233},
> +   #endif
> ++  #ifdef PROV_R_ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS
> ++    {"ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS", ERR_LIB_PROV, PROV_R_ENT=
ROPY_SOURCE_FAILED_CONTINUOUS_TESTS},
> ++  #else
> ++    {"ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS", 57, 244},
> ++  #endif
> +   #ifdef PROV_R_ENTROPY_SOURCE_STRENGTH_TOO_WEAK
> +     {"ENTROPY_SOURCE_STRENGTH_TOO_WEAK", ERR_LIB_PROV, PROV_R_ENTROPY_S=
OURCE_STRENGTH_TOO_WEAK},
> +   #else
> +@@ -4990,6 +5237,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"FAILED_TO_SIGN", 57, 175},
> +   #endif
> ++  #ifdef PROV_R_FINAL_CALL_OUT_OF_ORDER
> ++    {"FINAL_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_FINAL_CALL_OUT_OF_=
ORDER},
> ++  #else
> ++    {"FINAL_CALL_OUT_OF_ORDER", 57, 237},
> ++  #endif
> +   #ifdef PROV_R_FIPS_MODULE_CONDITIONAL_ERROR
> +     {"FIPS_MODULE_CONDITIONAL_ERROR", ERR_LIB_PROV, PROV_R_FIPS_MODULE_=
CONDITIONAL_ERROR},
> +   #else
> +@@ -5020,6 +5272,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INDICATOR_INTEGRITY_FAILURE", 57, 210},
> +   #endif
> ++  #ifdef PROV_R_INIT_CALL_OUT_OF_ORDER
> ++    {"INIT_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_INIT_CALL_OUT_OF_OR=
DER},
> ++  #else
> ++    {"INIT_CALL_OUT_OF_ORDER", 57, 238},
> ++  #endif
> +   #ifdef PROV_R_INSUFFICIENT_DRBG_STRENGTH
> +     {"INSUFFICIENT_DRBG_STRENGTH", ERR_LIB_PROV, PROV_R_INSUFFICIENT_DR=
BG_STRENGTH},
> +   #else
> +@@ -5030,6 +5287,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_AAD", 57, 108},
> +   #endif
> ++  #ifdef PROV_R_INVALID_AEAD
> ++    {"INVALID_AEAD", ERR_LIB_PROV, PROV_R_INVALID_AEAD},
> ++  #else
> ++    {"INVALID_AEAD", 57, 231},
> ++  #endif
> +   #ifdef PROV_R_INVALID_CONFIG_DATA
> +     {"INVALID_CONFIG_DATA", ERR_LIB_PROV, PROV_R_INVALID_CONFIG_DATA},
> +   #else
> +@@ -5070,6 +5332,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_DIGEST_SIZE", 57, 218},
> +   #endif
> ++  #ifdef PROV_R_INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION
> ++    {"INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION", ERR_LIB_PROV, PR=
OV_R_INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION},
> ++  #else
> ++    {"INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION", 57, 243},
> ++  #endif
> +   #ifdef PROV_R_INVALID_INPUT_LENGTH
> +     {"INVALID_INPUT_LENGTH", ERR_LIB_PROV, PROV_R_INVALID_INPUT_LENGTH}=
,
> +   #else
> +@@ -5085,6 +5352,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_IV_LENGTH", 57, 109},
> +   #endif
> ++  #ifdef PROV_R_INVALID_KDF
> ++    {"INVALID_KDF", ERR_LIB_PROV, PROV_R_INVALID_KDF},
> ++  #else
> ++    {"INVALID_KDF", 57, 232},
> ++  #endif
> +   #ifdef PROV_R_INVALID_KEY
> +     {"INVALID_KEY", ERR_LIB_PROV, PROV_R_INVALID_KEY},
> +   #else
> +@@ -5100,6 +5372,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_MAC", 57, 151},
> +   #endif
> ++  #ifdef PROV_R_INVALID_MEMORY_SIZE
> ++    {"INVALID_MEMORY_SIZE", ERR_LIB_PROV, PROV_R_INVALID_MEMORY_SIZE},
> ++  #else
> ++    {"INVALID_MEMORY_SIZE", 57, 235},
> ++  #endif
> +   #ifdef PROV_R_INVALID_MGF1_MD
> +     {"INVALID_MGF1_MD", ERR_LIB_PROV, PROV_R_INVALID_MGF1_MD},
> +   #else
> +@@ -5120,6 +5397,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_PADDING_MODE", 57, 168},
> +   #endif
> ++  #ifdef PROV_R_INVALID_PREHASHED_DIGEST_LENGTH
> ++    {"INVALID_PREHASHED_DIGEST_LENGTH", ERR_LIB_PROV, PROV_R_INVALID_PR=
EHASHED_DIGEST_LENGTH},
> ++  #else
> ++    {"INVALID_PREHASHED_DIGEST_LENGTH", 57, 241},
> ++  #endif
> +   #ifdef PROV_R_INVALID_PUBINFO
> +     {"INVALID_PUBINFO", ERR_LIB_PROV, PROV_R_INVALID_PUBINFO},
> +   #else
> +@@ -5155,6 +5437,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_TAG_LENGTH", 57, 118},
> +   #endif
> ++  #ifdef PROV_R_INVALID_THREAD_POOL_SIZE
> ++    {"INVALID_THREAD_POOL_SIZE", ERR_LIB_PROV, PROV_R_INVALID_THREAD_PO=
OL_SIZE},
> ++  #else
> ++    {"INVALID_THREAD_POOL_SIZE", 57, 234},
> ++  #endif
> +   #ifdef PROV_R_INVALID_UKM_LENGTH
> +     {"INVALID_UKM_LENGTH", ERR_LIB_PROV, PROV_R_INVALID_UKM_LENGTH},
> +   #else
> +@@ -5300,6 +5587,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"NOT_XOF_OR_INVALID_LENGTH", 57, 113},
> +   #endif
> ++  #ifdef PROV_R_NO_INSTANCE_ALLOWED
> ++    {"NO_INSTANCE_ALLOWED", ERR_LIB_PROV, PROV_R_NO_INSTANCE_ALLOWED},
> ++  #else
> ++    {"NO_INSTANCE_ALLOWED", 57, 242},
> ++  #endif
> +   #ifdef PROV_R_NO_KEY_SET
> +     {"NO_KEY_SET", ERR_LIB_PROV, PROV_R_NO_KEY_SET},
> +   #else
> +@@ -5310,6 +5602,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"NO_PARAMETERS_SET", 57, 177},
> +   #endif
> ++  #ifdef PROV_R_ONESHOT_CALL_OUT_OF_ORDER
> ++    {"ONESHOT_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_ONESHOT_CALL_OUT=
_OF_ORDER},
> ++  #else
> ++    {"ONESHOT_CALL_OUT_OF_ORDER", 57, 239},
> ++  #endif
> +   #ifdef PROV_R_OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE
> +     {"OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE", ERR_LIB_PROV, PROV_R_O=
PERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE},
> +   #else
> +@@ -5460,6 +5757,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_NUMBER_OF_ROUNDS", 57, 152},
> +   #endif
> ++  #ifdef PROV_R_UPDATE_CALL_OUT_OF_ORDER
> ++    {"UPDATE_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_UPDATE_CALL_OUT_O=
F_ORDER},
> ++  #else
> ++    {"UPDATE_CALL_OUT_OF_ORDER", 57, 240},
> ++  #endif
> +   #ifdef PROV_R_URI_AUTHORITY_UNSUPPORTED
> +     {"URI_AUTHORITY_UNSUPPORTED", ERR_LIB_PROV, PROV_R_URI_AUTHORITY_UN=
SUPPORTED},
> +   #else
> +@@ -5595,6 +5897,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INTERNAL_ERROR", 36, 113},
> +   #endif
> ++  #ifdef RAND_R_INVALID_PROPERTY_QUERY
> ++    {"INVALID_PROPERTY_QUERY", ERR_LIB_RAND, RAND_R_INVALID_PROPERTY_QU=
ERY},
> ++  #else
> ++    {"INVALID_PROPERTY_QUERY", 36, 137},
> ++  #endif
> +   #ifdef RAND_R_IN_ERROR_STATE
> +     {"IN_ERROR_STATE", ERR_LIB_RAND, RAND_R_IN_ERROR_STATE},
> +   #else
> +@@ -6210,6 +6517,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"AT_LEAST_TLS_1_2_NEEDED_IN_SUITEB_MODE", 20, 158},
> +   #endif
> ++  #ifdef SSL_R_BAD_CERTIFICATE
> ++    {"BAD_CERTIFICATE", ERR_LIB_SSL, SSL_R_BAD_CERTIFICATE},
> ++  #else
> ++    {"BAD_CERTIFICATE", 20, 348},
> ++  #endif
> +   #ifdef SSL_R_BAD_CHANGE_CIPHER_SPEC
> +     {"BAD_CHANGE_CIPHER_SPEC", ERR_LIB_SSL, SSL_R_BAD_CHANGE_CIPHER_SPE=
C},
> +   #else
> +@@ -6220,6 +6532,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"BAD_CIPHER", 20, 186},
> +   #endif
> ++  #ifdef SSL_R_BAD_COMPRESSION_ALGORITHM
> ++    {"BAD_COMPRESSION_ALGORITHM", ERR_LIB_SSL, SSL_R_BAD_COMPRESSION_AL=
GORITHM},
> ++  #else
> ++    {"BAD_COMPRESSION_ALGORITHM", 20, 326},
> ++  #endif
> +   #ifdef SSL_R_BAD_DATA
> +     {"BAD_DATA", ERR_LIB_SSL, SSL_R_BAD_DATA},
> +   #else
> +@@ -6495,6 +6812,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"CONNECTION_TYPE_NOT_SET", 20, 144},
> +   #endif
> ++  #ifdef SSL_R_CONN_USE_ONLY
> ++    {"CONN_USE_ONLY", ERR_LIB_SSL, SSL_R_CONN_USE_ONLY},
> ++  #else
> ++    {"CONN_USE_ONLY", 20, 356},
> ++  #endif
> +   #ifdef SSL_R_CONTEXT_NOT_DANE_ENABLED
> +     {"CONTEXT_NOT_DANE_ENABLED", ERR_LIB_SSL, SSL_R_CONTEXT_NOT_DANE_EN=
ABLED},
> +   #else
> +@@ -6635,6 +6957,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"EE_KEY_TOO_SMALL", 20, 399},
> +   #endif
> ++  #ifdef SSL_R_EMPTY_RAW_PUBLIC_KEY
> ++    {"EMPTY_RAW_PUBLIC_KEY", ERR_LIB_SSL, SSL_R_EMPTY_RAW_PUBLIC_KEY},
> ++  #else
> ++    {"EMPTY_RAW_PUBLIC_KEY", 20, 349},
> ++  #endif
> +   #ifdef SSL_R_EMPTY_SRTP_PROTECTION_PROFILE_LIST
> +     {"EMPTY_SRTP_PROTECTION_PROFILE_LIST", ERR_LIB_SSL, SSL_R_EMPTY_SRT=
P_PROTECTION_PROFILE_LIST},
> +   #else
> +@@ -6650,6 +6977,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"ERROR_IN_RECEIVED_CIPHER_LIST", 20, 151},
> +   #endif
> ++  #ifdef SSL_R_ERROR_IN_SYSTEM_DEFAULT_CONFIG
> ++    {"ERROR_IN_SYSTEM_DEFAULT_CONFIG", ERR_LIB_SSL, SSL_R_ERROR_IN_SYST=
EM_DEFAULT_CONFIG},
> ++  #else
> ++    {"ERROR_IN_SYSTEM_DEFAULT_CONFIG", 20, 419},
> ++  #endif
> +   #ifdef SSL_R_ERROR_SETTING_TLSA_BASE_DOMAIN
> +     {"ERROR_SETTING_TLSA_BASE_DOMAIN", ERR_LIB_SSL, SSL_R_ERROR_SETTING=
_TLSA_BASE_DOMAIN},
> +   #else
> +@@ -6680,11 +7012,26 @@ static struct py_ssl_error_code error_codes[] =
=3D {
> +   #else
> +     {"EXT_LENGTH_MISMATCH", 20, 163},
> +   #endif
> ++  #ifdef SSL_R_FAILED_TO_GET_PARAMETER
> ++    {"FAILED_TO_GET_PARAMETER", ERR_LIB_SSL, SSL_R_FAILED_TO_GET_PARAME=
TER},
> ++  #else
> ++    {"FAILED_TO_GET_PARAMETER", 20, 316},
> ++  #endif
> +   #ifdef SSL_R_FAILED_TO_INIT_ASYNC
> +     {"FAILED_TO_INIT_ASYNC", ERR_LIB_SSL, SSL_R_FAILED_TO_INIT_ASYNC},
> +   #else
> +     {"FAILED_TO_INIT_ASYNC", 20, 405},
> +   #endif
> ++  #ifdef SSL_R_FEATURE_NEGOTIATION_NOT_COMPLETE
> ++    {"FEATURE_NEGOTIATION_NOT_COMPLETE", ERR_LIB_SSL, SSL_R_FEATURE_NEG=
OTIATION_NOT_COMPLETE},
> ++  #else
> ++    {"FEATURE_NEGOTIATION_NOT_COMPLETE", 20, 417},
> ++  #endif
> ++  #ifdef SSL_R_FEATURE_NOT_RENEGOTIABLE
> ++    {"FEATURE_NOT_RENEGOTIABLE", ERR_LIB_SSL, SSL_R_FEATURE_NOT_RENEGOT=
IABLE},
> ++  #else
> ++    {"FEATURE_NOT_RENEGOTIABLE", 20, 413},
> ++  #endif
> +   #ifdef SSL_R_FRAGMENTED_CLIENT_HELLO
> +     {"FRAGMENTED_CLIENT_HELLO", ERR_LIB_SSL, SSL_R_FRAGMENTED_CLIENT_HE=
LLO},
> +   #else
> +@@ -6805,6 +7152,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"INVALID_NULL_CMD_NAME", 20, 385},
> +   #endif
> ++  #ifdef SSL_R_INVALID_RAW_PUBLIC_KEY
> ++    {"INVALID_RAW_PUBLIC_KEY", ERR_LIB_SSL, SSL_R_INVALID_RAW_PUBLIC_KE=
Y},
> ++  #else
> ++    {"INVALID_RAW_PUBLIC_KEY", 20, 350},
> ++  #endif
> ++  #ifdef SSL_R_INVALID_RECORD
> ++    {"INVALID_RECORD", ERR_LIB_SSL, SSL_R_INVALID_RECORD},
> ++  #else
> ++    {"INVALID_RECORD", 20, 317},
> ++  #endif
> +   #ifdef SSL_R_INVALID_SEQUENCE_NUMBER
> +     {"INVALID_SEQUENCE_NUMBER", ERR_LIB_SSL, SSL_R_INVALID_SEQUENCE_NUM=
BER},
> +   #else
> +@@ -6865,6 +7222,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"LIBRARY_HAS_NO_CIPHERS", 20, 161},
> +   #endif
> ++  #ifdef SSL_R_MAXIMUM_ENCRYPTED_PKTS_REACHED
> ++    {"MAXIMUM_ENCRYPTED_PKTS_REACHED", ERR_LIB_SSL, SSL_R_MAXIMUM_ENCRY=
PTED_PKTS_REACHED},
> ++  #else
> ++    {"MAXIMUM_ENCRYPTED_PKTS_REACHED", 20, 395},
> ++  #endif
> +   #ifdef SSL_R_MISSING_DSA_SIGNING_CERT
> +     {"MISSING_DSA_SIGNING_CERT", ERR_LIB_SSL, SSL_R_MISSING_DSA_SIGNING=
_CERT},
> +   #else
> +@@ -6925,6 +7287,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"MISSING_SUPPORTED_GROUPS_EXTENSION", 20, 209},
> +   #endif
> ++  #ifdef SSL_R_MISSING_SUPPORTED_VERSIONS_EXTENSION
> ++    {"MISSING_SUPPORTED_VERSIONS_EXTENSION", ERR_LIB_SSL, SSL_R_MISSING=
_SUPPORTED_VERSIONS_EXTENSION},
> ++  #else
> ++    {"MISSING_SUPPORTED_VERSIONS_EXTENSION", 20, 420},
> ++  #endif
> +   #ifdef SSL_R_MISSING_TMP_DH_KEY
> +     {"MISSING_TMP_DH_KEY", ERR_LIB_SSL, SSL_R_MISSING_TMP_DH_KEY},
> +   #else
> +@@ -7065,6 +7432,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"NO_SRTP_PROFILES", 20, 359},
> +   #endif
> ++  #ifdef SSL_R_NO_STREAM
> ++    {"NO_STREAM", ERR_LIB_SSL, SSL_R_NO_STREAM},
> ++  #else
> ++    {"NO_STREAM", 20, 355},
> ++  #endif
> +   #ifdef SSL_R_NO_SUITABLE_DIGEST_ALGORITHM
> +     {"NO_SUITABLE_DIGEST_ALGORITHM", ERR_LIB_SSL, SSL_R_NO_SUITABLE_DIG=
EST_ALGORITHM},
> +   #else
> +@@ -7080,6 +7452,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"NO_SUITABLE_KEY_SHARE", 20, 101},
> +   #endif
> ++  #ifdef SSL_R_NO_SUITABLE_RECORD_LAYER
> ++    {"NO_SUITABLE_RECORD_LAYER", ERR_LIB_SSL, SSL_R_NO_SUITABLE_RECORD_=
LAYER},
> ++  #else
> ++    {"NO_SUITABLE_RECORD_LAYER", 20, 322},
> ++  #endif
> +   #ifdef SSL_R_NO_SUITABLE_SIGNATURE_ALGORITHM
> +     {"NO_SUITABLE_SIGNATURE_ALGORITHM", ERR_LIB_SSL, SSL_R_NO_SUITABLE_=
SIGNATURE_ALGORITHM},
> +   #else
> +@@ -7160,6 +7537,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"PIPELINE_FAILURE", 20, 406},
> +   #endif
> ++  #ifdef SSL_R_POLL_REQUEST_NOT_SUPPORTED
> ++    {"POLL_REQUEST_NOT_SUPPORTED", ERR_LIB_SSL, SSL_R_POLL_REQUEST_NOT_=
SUPPORTED},
> ++  #else
> ++    {"POLL_REQUEST_NOT_SUPPORTED", 20, 418},
> ++  #endif
> +   #ifdef SSL_R_POST_HANDSHAKE_AUTH_ENCODING_ERR
> +     {"POST_HANDSHAKE_AUTH_ENCODING_ERR", ERR_LIB_SSL, SSL_R_POST_HANDSH=
AKE_AUTH_ENCODING_ERR},
> +   #else
> +@@ -7190,6 +7572,21 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"PSK_NO_SERVER_CB", 20, 225},
> +   #endif
> ++  #ifdef SSL_R_QUIC_HANDSHAKE_LAYER_ERROR
> ++    {"QUIC_HANDSHAKE_LAYER_ERROR", ERR_LIB_SSL, SSL_R_QUIC_HANDSHAKE_LA=
YER_ERROR},
> ++  #else
> ++    {"QUIC_HANDSHAKE_LAYER_ERROR", 20, 393},
> ++  #endif
> ++  #ifdef SSL_R_QUIC_NETWORK_ERROR
> ++    {"QUIC_NETWORK_ERROR", ERR_LIB_SSL, SSL_R_QUIC_NETWORK_ERROR},
> ++  #else
> ++    {"QUIC_NETWORK_ERROR", 20, 387},
> ++  #endif
> ++  #ifdef SSL_R_QUIC_PROTOCOL_ERROR
> ++    {"QUIC_PROTOCOL_ERROR", ERR_LIB_SSL, SSL_R_QUIC_PROTOCOL_ERROR},
> ++  #else
> ++    {"QUIC_PROTOCOL_ERROR", 20, 382},
> ++  #endif
> +   #ifdef SSL_R_READ_BIO_NOT_SET
> +     {"READ_BIO_NOT_SET", ERR_LIB_SSL, SSL_R_READ_BIO_NOT_SET},
> +   #else
> +@@ -7200,6 +7597,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"READ_TIMEOUT_EXPIRED", 20, 312},
> +   #endif
> ++  #ifdef SSL_R_RECORDS_NOT_RELEASED
> ++    {"RECORDS_NOT_RELEASED", ERR_LIB_SSL, SSL_R_RECORDS_NOT_RELEASED},
> ++  #else
> ++    {"RECORDS_NOT_RELEASED", 20, 321},
> ++  #endif
> ++  #ifdef SSL_R_RECORD_LAYER_FAILURE
> ++    {"RECORD_LAYER_FAILURE", ERR_LIB_SSL, SSL_R_RECORD_LAYER_FAILURE},
> ++  #else
> ++    {"RECORD_LAYER_FAILURE", 20, 313},
> ++  #endif
> +   #ifdef SSL_R_RECORD_LENGTH_MISMATCH
> +     {"RECORD_LENGTH_MISMATCH", ERR_LIB_SSL, SSL_R_RECORD_LENGTH_MISMATC=
H},
> +   #else
> +@@ -7210,6 +7617,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"RECORD_TOO_SMALL", 20, 298},
> +   #endif
> ++  #ifdef SSL_R_REMOTE_PEER_ADDRESS_NOT_SET
> ++    {"REMOTE_PEER_ADDRESS_NOT_SET", ERR_LIB_SSL, SSL_R_REMOTE_PEER_ADDR=
ESS_NOT_SET},
> ++  #else
> ++    {"REMOTE_PEER_ADDRESS_NOT_SET", 20, 346},
> ++  #endif
> +   #ifdef SSL_R_RENEGOTIATE_EXT_TOO_LONG
> +     {"RENEGOTIATE_EXT_TOO_LONG", ERR_LIB_SSL, SSL_R_RENEGOTIATE_EXT_TOO=
_LONG},
> +   #else
> +@@ -7255,6 +7667,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"SCT_VERIFICATION_FAILED", 20, 208},
> +   #endif
> ++  #ifdef SSL_R_SEQUENCE_CTR_WRAPPED
> ++    {"SEQUENCE_CTR_WRAPPED", ERR_LIB_SSL, SSL_R_SEQUENCE_CTR_WRAPPED},
> ++  #else
> ++    {"SEQUENCE_CTR_WRAPPED", 20, 327},
> ++  #endif
> +   #ifdef SSL_R_SERVERHELLO_TLSEXT
> +     {"SERVERHELLO_TLSEXT", ERR_LIB_SSL, SSL_R_SERVERHELLO_TLSEXT},
> +   #else
> +@@ -7325,6 +7742,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"SSLV3_ALERT_BAD_CERTIFICATE", 20, 1042},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_BAD_CERTIFICATE
> ++    {"SSLV3_ALERT_BAD_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_BAD_=
CERTIFICATE},
> ++  #else
> ++    {"SSLV3_ALERT_BAD_CERTIFICATE", 20, 1042},
> ++  #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_BAD_RECORD_MAC
> ++    {"SSLV3_ALERT_BAD_RECORD_MAC", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_BAD_R=
ECORD_MAC},
> ++  #else
> ++    {"SSLV3_ALERT_BAD_RECORD_MAC", 20, 1020},
> ++  #endif
> +   #ifdef SSL_R_SSLV3_ALERT_BAD_RECORD_MAC
> +     {"SSLV3_ALERT_BAD_RECORD_MAC", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_BAD_R=
ECORD_MAC},
> +   #else
> +@@ -7335,11 +7762,26 @@ static struct py_ssl_error_code error_codes[] =
=3D {
> +   #else
> +     {"SSLV3_ALERT_CERTIFICATE_EXPIRED", 20, 1045},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_EXPIRED
> ++    {"SSLV3_ALERT_CERTIFICATE_EXPIRED", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_=
CERTIFICATE_EXPIRED},
> ++  #else
> ++    {"SSLV3_ALERT_CERTIFICATE_EXPIRED", 20, 1045},
> ++  #endif
> +   #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED
> +     {"SSLV3_ALERT_CERTIFICATE_REVOKED", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_=
CERTIFICATE_REVOKED},
> +   #else
> +     {"SSLV3_ALERT_CERTIFICATE_REVOKED", 20, 1044},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED
> ++    {"SSLV3_ALERT_CERTIFICATE_REVOKED", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_=
CERTIFICATE_REVOKED},
> ++  #else
> ++    {"SSLV3_ALERT_CERTIFICATE_REVOKED", 20, 1044},
> ++  #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN
> ++    {"SSLV3_ALERT_CERTIFICATE_UNKNOWN", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_=
CERTIFICATE_UNKNOWN},
> ++  #else
> ++    {"SSLV3_ALERT_CERTIFICATE_UNKNOWN", 20, 1046},
> ++  #endif
> +   #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN
> +     {"SSLV3_ALERT_CERTIFICATE_UNKNOWN", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_=
CERTIFICATE_UNKNOWN},
> +   #else
> +@@ -7350,6 +7792,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"SSLV3_ALERT_DECOMPRESSION_FAILURE", 20, 1030},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_DECOMPRESSION_FAILURE
> ++    {"SSLV3_ALERT_DECOMPRESSION_FAILURE", ERR_LIB_SSL, SSL_R_SSLV3_ALER=
T_DECOMPRESSION_FAILURE},
> ++  #else
> ++    {"SSLV3_ALERT_DECOMPRESSION_FAILURE", 20, 1030},
> ++  #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE
> ++    {"SSLV3_ALERT_HANDSHAKE_FAILURE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_HA=
NDSHAKE_FAILURE},
> ++  #else
> ++    {"SSLV3_ALERT_HANDSHAKE_FAILURE", 20, 1040},
> ++  #endif
> +   #ifdef SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE
> +     {"SSLV3_ALERT_HANDSHAKE_FAILURE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_HA=
NDSHAKE_FAILURE},
> +   #else
> +@@ -7360,11 +7812,26 @@ static struct py_ssl_error_code error_codes[] =
=3D {
> +   #else
> +     {"SSLV3_ALERT_ILLEGAL_PARAMETER", 20, 1047},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_ILLEGAL_PARAMETER
> ++    {"SSLV3_ALERT_ILLEGAL_PARAMETER", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_IL=
LEGAL_PARAMETER},
> ++  #else
> ++    {"SSLV3_ALERT_ILLEGAL_PARAMETER", 20, 1047},
> ++  #endif
> +   #ifdef SSL_R_SSLV3_ALERT_NO_CERTIFICATE
> +     {"SSLV3_ALERT_NO_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_NO_CE=
RTIFICATE},
> +   #else
> +     {"SSLV3_ALERT_NO_CERTIFICATE", 20, 1041},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_NO_CERTIFICATE
> ++    {"SSLV3_ALERT_NO_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_NO_CE=
RTIFICATE},
> ++  #else
> ++    {"SSLV3_ALERT_NO_CERTIFICATE", 20, 1041},
> ++  #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE
> ++    {"SSLV3_ALERT_UNEXPECTED_MESSAGE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_U=
NEXPECTED_MESSAGE},
> ++  #else
> ++    {"SSLV3_ALERT_UNEXPECTED_MESSAGE", 20, 1010},
> ++  #endif
> +   #ifdef SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE
> +     {"SSLV3_ALERT_UNEXPECTED_MESSAGE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_U=
NEXPECTED_MESSAGE},
> +   #else
> +@@ -7375,6 +7842,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"SSLV3_ALERT_UNSUPPORTED_CERTIFICATE", 20, 1043},
> +   #endif
> ++  #ifdef SSL_R_SSLV3_ALERT_UNSUPPORTED_CERTIFICATE
> ++    {"SSLV3_ALERT_UNSUPPORTED_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_AL=
ERT_UNSUPPORTED_CERTIFICATE},
> ++  #else
> ++    {"SSLV3_ALERT_UNSUPPORTED_CERTIFICATE", 20, 1043},
> ++  #endif
> +   #ifdef SSL_R_SSL_COMMAND_SECTION_EMPTY
> +     {"SSL_COMMAND_SECTION_EMPTY", ERR_LIB_SSL, SSL_R_SSL_COMMAND_SECTIO=
N_EMPTY},
> +   #else
> +@@ -7450,6 +7922,36 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"STILL_IN_INIT", 20, 121},
> +   #endif
> ++  #ifdef SSL_R_STREAM_COUNT_LIMITED
> ++    {"STREAM_COUNT_LIMITED", ERR_LIB_SSL, SSL_R_STREAM_COUNT_LIMITED},
> ++  #else
> ++    {"STREAM_COUNT_LIMITED", 20, 411},
> ++  #endif
> ++  #ifdef SSL_R_STREAM_FINISHED
> ++    {"STREAM_FINISHED", ERR_LIB_SSL, SSL_R_STREAM_FINISHED},
> ++  #else
> ++    {"STREAM_FINISHED", 20, 365},
> ++  #endif
> ++  #ifdef SSL_R_STREAM_RECV_ONLY
> ++    {"STREAM_RECV_ONLY", ERR_LIB_SSL, SSL_R_STREAM_RECV_ONLY},
> ++  #else
> ++    {"STREAM_RECV_ONLY", 20, 366},
> ++  #endif
> ++  #ifdef SSL_R_STREAM_RESET
> ++    {"STREAM_RESET", ERR_LIB_SSL, SSL_R_STREAM_RESET},
> ++  #else
> ++    {"STREAM_RESET", 20, 375},
> ++  #endif
> ++  #ifdef SSL_R_STREAM_SEND_ONLY
> ++    {"STREAM_SEND_ONLY", ERR_LIB_SSL, SSL_R_STREAM_SEND_ONLY},
> ++  #else
> ++    {"STREAM_SEND_ONLY", 20, 379},
> ++  #endif
> ++  #ifdef SSL_R_TLSV13_ALERT_CERTIFICATE_REQUIRED
> ++    {"TLSV13_ALERT_CERTIFICATE_REQUIRED", ERR_LIB_SSL, SSL_R_TLSV13_ALE=
RT_CERTIFICATE_REQUIRED},
> ++  #else
> ++    {"TLSV13_ALERT_CERTIFICATE_REQUIRED", 20, 1116},
> ++  #endif
> +   #ifdef SSL_R_TLSV13_ALERT_CERTIFICATE_REQUIRED
> +     {"TLSV13_ALERT_CERTIFICATE_REQUIRED", ERR_LIB_SSL, SSL_R_TLSV13_ALE=
RT_CERTIFICATE_REQUIRED},
> +   #else
> +@@ -7460,6 +7962,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV13_ALERT_MISSING_EXTENSION", 20, 1109},
> +   #endif
> ++  #ifdef SSL_R_TLSV13_ALERT_MISSING_EXTENSION
> ++    {"TLSV13_ALERT_MISSING_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV13_ALERT_=
MISSING_EXTENSION},
> ++  #else
> ++    {"TLSV13_ALERT_MISSING_EXTENSION", 20, 1109},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_ACCESS_DENIED
> ++    {"TLSV1_ALERT_ACCESS_DENIED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_ACCESS=
_DENIED},
> ++  #else
> ++    {"TLSV1_ALERT_ACCESS_DENIED", 20, 1049},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_ACCESS_DENIED
> +     {"TLSV1_ALERT_ACCESS_DENIED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_ACCESS=
_DENIED},
> +   #else
> +@@ -7470,6 +7982,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_DECODE_ERROR
> ++    {"TLSV1_ALERT_DECODE_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECODE_=
ERROR},
> ++  #else
> ++    {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
> ++    {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DE=
CRYPTION_FAILED},
> ++  #else
> ++    {"TLSV1_ALERT_DECRYPTION_FAILED", 20, 1021},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
> +     {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DE=
CRYPTION_FAILED},
> +   #else
> +@@ -7480,6 +8002,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_DECRYPT_ERROR
> ++    {"TLSV1_ALERT_DECRYPT_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYP=
T_ERROR},
> ++  #else
> ++    {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
> ++    {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_E=
XPORT_RESTRICTION},
> ++  #else
> ++    {"TLSV1_ALERT_EXPORT_RESTRICTION", 20, 1060},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
> +     {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_E=
XPORT_RESTRICTION},
> +   #else
> +@@ -7490,6 +8022,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK
> ++    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", ERR_LIB_SSL, SSL_R_TLSV1_ALE=
RT_INAPPROPRIATE_FALLBACK},
> ++  #else
> ++    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
> ++    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALER=
T_INSUFFICIENT_SECURITY},
> ++  #else
> ++    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", 20, 1071},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
> +     {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALER=
T_INSUFFICIENT_SECURITY},
> +   #else
> +@@ -7500,6 +8042,26 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_INTERNAL_ERROR
> ++    {"TLSV1_ALERT_INTERNAL_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INTER=
NAL_ERROR},
> ++  #else
> ++    {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL
> ++    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", ERR_LIB_SSL, SSL_R_TLSV1_AL=
ERT_NO_APPLICATION_PROTOCOL},
> ++  #else
> ++    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", 20, 1120},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL
> ++    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", ERR_LIB_SSL, SSL_R_TLSV1_AL=
ERT_NO_APPLICATION_PROTOCOL},
> ++  #else
> ++    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", 20, 1120},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_NO_RENEGOTIATION
> ++    {"TLSV1_ALERT_NO_RENEGOTIATION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_=
RENEGOTIATION},
> ++  #else
> ++    {"TLSV1_ALERT_NO_RENEGOTIATION", 20, 1100},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_NO_RENEGOTIATION
> +     {"TLSV1_ALERT_NO_RENEGOTIATION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_=
RENEGOTIATION},
> +   #else
> +@@ -7510,21 +8072,56 @@ static struct py_ssl_error_code error_codes[] =
=3D {
> +   #else
> +     {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_PROTOCOL_VERSION
> ++    {"TLSV1_ALERT_PROTOCOL_VERSION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_PRO=
TOCOL_VERSION},
> ++  #else
> ++    {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
> +     {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECO=
RD_OVERFLOW},
> +   #else
> +     {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
> ++    {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECO=
RD_OVERFLOW},
> ++  #else
> ++    {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
> ++    {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_C=
A},
> ++  #else
> ++    {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
> +     {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_C=
A},
> +   #else
> +     {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY
> ++    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT=
_UNKNOWN_PSK_IDENTITY},
> ++  #else
> ++    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", 20, 1115},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY
> ++    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT=
_UNKNOWN_PSK_IDENTITY},
> ++  #else
> ++    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", 20, 1115},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_ALERT_USER_CANCELLED
> +     {"TLSV1_ALERT_USER_CANCELLED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_USER_=
CANCELLED},
> +   #else
> +     {"TLSV1_ALERT_USER_CANCELLED", 20, 1090},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_ALERT_USER_CANCELLED
> ++    {"TLSV1_ALERT_USER_CANCELLED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_USER_=
CANCELLED},
> ++  #else
> ++    {"TLSV1_ALERT_USER_CANCELLED", 20, 1090},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE
> ++    {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_C=
ERTIFICATE_HASH_VALUE},
> ++  #else
> ++    {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", 20, 1114},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE
> +     {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_C=
ERTIFICATE_HASH_VALUE},
> +   #else
> +@@ -7535,6 +8132,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE
> ++    {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", ERR_LIB_SSL, SSL_R_TLSV1_=
BAD_CERTIFICATE_STATUS_RESPONSE},
> ++  #else
> ++    {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
> ++    {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFI=
CATE_UNOBTAINABLE},
> ++  #else
> ++    {"TLSV1_CERTIFICATE_UNOBTAINABLE", 20, 1111},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
> +     {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFI=
CATE_UNOBTAINABLE},
> +   #else
> +@@ -7545,6 +8152,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
> +   #endif
> ++  #ifdef SSL_R_TLSV1_UNRECOGNIZED_NAME
> ++    {"TLSV1_UNRECOGNIZED_NAME", ERR_LIB_SSL, SSL_R_TLSV1_UNRECOGNIZED_N=
AME},
> ++  #else
> ++    {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
> ++  #endif
> ++  #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
> ++    {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTE=
D_EXTENSION},
> ++  #else
> ++    {"TLSV1_UNSUPPORTED_EXTENSION", 20, 1110},
> ++  #endif
> +   #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
> +     {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTE=
D_EXTENSION},
> +   #else
> +@@ -7665,6 +8282,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNKNOWN_KEY_EXCHANGE_TYPE", 20, 250},
> +   #endif
> ++  #ifdef SSL_R_UNKNOWN_MANDATORY_PARAMETER
> ++    {"UNKNOWN_MANDATORY_PARAMETER", ERR_LIB_SSL, SSL_R_UNKNOWN_MANDATOR=
Y_PARAMETER},
> ++  #else
> ++    {"UNKNOWN_MANDATORY_PARAMETER", 20, 323},
> ++  #endif
> +   #ifdef SSL_R_UNKNOWN_PKEY_TYPE
> +     {"UNKNOWN_PKEY_TYPE", ERR_LIB_SSL, SSL_R_UNKNOWN_PKEY_TYPE},
> +   #else
> +@@ -7700,6 +8322,21 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_COMPRESSION_ALGORITHM", 20, 257},
> +   #endif
> ++  #ifdef SSL_R_UNSUPPORTED_CONFIG_VALUE
> ++    {"UNSUPPORTED_CONFIG_VALUE", ERR_LIB_SSL, SSL_R_UNSUPPORTED_CONFIG_=
VALUE},
> ++  #else
> ++    {"UNSUPPORTED_CONFIG_VALUE", 20, 414},
> ++  #endif
> ++  #ifdef SSL_R_UNSUPPORTED_CONFIG_VALUE_CLASS
> ++    {"UNSUPPORTED_CONFIG_VALUE_CLASS", ERR_LIB_SSL, SSL_R_UNSUPPORTED_C=
ONFIG_VALUE_CLASS},
> ++  #else
> ++    {"UNSUPPORTED_CONFIG_VALUE_CLASS", 20, 415},
> ++  #endif
> ++  #ifdef SSL_R_UNSUPPORTED_CONFIG_VALUE_OP
> ++    {"UNSUPPORTED_CONFIG_VALUE_OP", ERR_LIB_SSL, SSL_R_UNSUPPORTED_CONF=
IG_VALUE_OP},
> ++  #else
> ++    {"UNSUPPORTED_CONFIG_VALUE_OP", 20, 416},
> ++  #endif
> +   #ifdef SSL_R_UNSUPPORTED_ELLIPTIC_CURVE
> +     {"UNSUPPORTED_ELLIPTIC_CURVE", ERR_LIB_SSL, SSL_R_UNSUPPORTED_ELLIP=
TIC_CURVE},
> +   #else
> +@@ -7720,6 +8357,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_STATUS_TYPE", 20, 329},
> +   #endif
> ++  #ifdef SSL_R_UNSUPPORTED_WRITE_FLAG
> ++    {"UNSUPPORTED_WRITE_FLAG", ERR_LIB_SSL, SSL_R_UNSUPPORTED_WRITE_FLA=
G},
> ++  #else
> ++    {"UNSUPPORTED_WRITE_FLAG", 20, 412},
> ++  #endif
> +   #ifdef SSL_R_USE_SRTP_NOT_NEGOTIATED
> +     {"USE_SRTP_NOT_NEGOTIATED", ERR_LIB_SSL, SSL_R_USE_SRTP_NOT_NEGOTIA=
TED},
> +   #else
> +@@ -7750,6 +8392,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"WRONG_CURVE", 20, 378},
> +   #endif
> ++  #ifdef SSL_R_WRONG_RPK_TYPE
> ++    {"WRONG_RPK_TYPE", ERR_LIB_SSL, SSL_R_WRONG_RPK_TYPE},
> ++  #else
> ++    {"WRONG_RPK_TYPE", 20, 351},
> ++  #endif
> +   #ifdef SSL_R_WRONG_SIGNATURE_LENGTH
> +     {"WRONG_SIGNATURE_LENGTH", ERR_LIB_SSL, SSL_R_WRONG_SIGNATURE_LENGT=
H},
> +   #else
> +@@ -8055,6 +8702,16 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"BAD_OBJECT", 34, 119},
> +   #endif
> ++  #ifdef X509V3_R_BAD_OPTION
> ++    {"BAD_OPTION", ERR_LIB_X509V3, X509V3_R_BAD_OPTION},
> ++  #else
> ++    {"BAD_OPTION", 34, 170},
> ++  #endif
> ++  #ifdef X509V3_R_BAD_VALUE
> ++    {"BAD_VALUE", ERR_LIB_X509V3, X509V3_R_BAD_VALUE},
> ++  #else
> ++    {"BAD_VALUE", 34, 171},
> ++  #endif
> +   #ifdef X509V3_R_BN_DEC2BN_ERROR
> +     {"BN_DEC2BN_ERROR", ERR_LIB_X509V3, X509V3_R_BN_DEC2BN_ERROR},
> +   #else
> +@@ -8370,6 +9027,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNKNOWN_OPTION", 34, 120},
> +   #endif
> ++  #ifdef X509V3_R_UNKNOWN_VALUE
> ++    {"UNKNOWN_VALUE", ERR_LIB_X509V3, X509V3_R_UNKNOWN_VALUE},
> ++  #else
> ++    {"UNKNOWN_VALUE", 34, 172},
> ++  #endif
> +   #ifdef X509V3_R_UNSUPPORTED_OPTION
> +     {"UNSUPPORTED_OPTION", ERR_LIB_X509V3, X509V3_R_UNSUPPORTED_OPTION}=
,
> +   #else
> +@@ -8430,6 +9092,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"CRL_VERIFY_FAILURE", 11, 131},
> +   #endif
> ++  #ifdef X509_R_DUPLICATE_ATTRIBUTE
> ++    {"DUPLICATE_ATTRIBUTE", ERR_LIB_X509, X509_R_DUPLICATE_ATTRIBUTE},
> ++  #else
> ++    {"DUPLICATE_ATTRIBUTE", 11, 140},
> ++  #endif
> +   #ifdef X509_R_ERROR_GETTING_MD_BY_NID
> +     {"ERROR_GETTING_MD_BY_NID", ERR_LIB_X509, X509_R_ERROR_GETTING_MD_B=
Y_NID},
> +   #else
> +@@ -8590,6 +9257,11 @@ static struct py_ssl_error_code error_codes[] =3D=
 {
> +   #else
> +     {"UNSUPPORTED_ALGORITHM", 11, 111},
> +   #endif
> ++  #ifdef X509_R_UNSUPPORTED_VERSION
> ++    {"UNSUPPORTED_VERSION", ERR_LIB_X509, X509_R_UNSUPPORTED_VERSION},
> ++  #else
> ++    {"UNSUPPORTED_VERSION", 11, 145},
> ++  #endif
> +   #ifdef X509_R_WRONG_LOOKUP_TYPE
> +     {"WRONG_LOOKUP_TYPE", ERR_LIB_X509, X509_R_WRONG_LOOKUP_TYPE},
> +   #else
> +diff --git a/Tools/c-analyzer/cpython/_parser.py b/Tools/c-analyzer/cpyt=
hon/_parser.py
> +index 21be53e7884..a08b32fa45d 100644
> +--- a/Tools/c-analyzer/cpython/_parser.py
> ++++ b/Tools/c-analyzer/cpython/_parser.py
> +@@ -70,9 +70,7 @@ Python/thread_pthread.h
> + Python/thread_pthread_stubs.h
> +
> + # only huge constants (safe but parsing is slow)
> +-Modules/_ssl_data_31.h
> +-Modules/_ssl_data_300.h
> +-Modules/_ssl_data_111.h
> ++Modules/_ssl_data_*.h
> + Modules/cjkcodecs/mappings_*.h
> + Modules/unicodedata_db.h
> + Modules/unicodename_db.h
> +diff --git a/Tools/ssl/make_ssl_data.py b/Tools/ssl/make_ssl_data.py
> +index 9860871..0cd05c7 100755
> +--- a/Tools/ssl/make_ssl_data.py
> ++++ b/Tools/ssl/make_ssl_data.py
> +@@ -5,9 +5,28 @@ This script should be called *manually* when we want to=
 upgrade SSLError
> + `library` and `reason` mnemonics to a more recent OpenSSL version.
> +
> + It takes two arguments:
> +-- the path to the OpenSSL source tree (e.g. git checkout)
> ++- the path to the OpenSSL git checkout
> + - the path to the header file to be generated Modules/_ssl_data_{versio=
n}.h
> + - error codes are version specific
> ++
> ++The OpenSSL git checkout should be at a specific tag, using commands li=
ke:
> ++    git tag --list 'openssl-*'
> ++    git switch --detach openssl-3.4.0
> ++
> ++
> ++After generating the definitions, compare the result with newest pre-ex=
isting file.
> ++You can use a command like:
> ++
> ++    git diff --no-index Modules/_ssl_data_31.h Modules/_ssl_data_34.h
> ++
> ++- If the new version *only* adds new definitions, remove the pre-existi=
ng file
> ++  and adjust the #include in _ssl.c to point to the new version.
> ++- If the new version removes or renumbers some definitions, keep both f=
iles and
> ++  add a new #include in _ssl.c.
> ++
> ++A newly supported OpenSSL version should also be added to:
> ++- Tools/ssl/multissltests.py
> ++- .github/workflows/build.yml
> + """
> +
> + import argparse
> +@@ -16,6 +35,7 @@ import operator
> + import os
> + import re
> + import sys
> ++import subprocess
> +
> +
> + parser =3D argparse.ArgumentParser(
> +@@ -118,9 +138,17 @@ def main():
> +     # sort by libname, numeric error code
> +     args.reasons =3D sorted(reasons, key=3Doperator.itemgetter(0, 3))
> +
> ++    git_describe =3D subprocess.run(
> ++        ['git', 'describe', '--long', '--dirty'],
> ++        cwd=3Dargs.srcdir,
> ++        capture_output=3DTrue,
> ++        encoding=3D'utf-8',
> ++        check=3DTrue,
> ++        )
> +     lines =3D [
> +-        "/* File generated by Tools/ssl/make_ssl_data.py */"
> +-        f"/* Generated on {datetime.datetime.utcnow().isoformat()} */"
> ++        "/* File generated by Tools/ssl/make_ssl_data.py */",
> ++        f"/* Generated on {datetime.datetime.now(datetime.UTC).isoforma=
t()} */",
> ++        f"/* Generated from Git commit {git_describe.stdout.strip()} */=
",
> +     ]
> +     lines.extend(gen_library_codes(args))
> +     lines.append("")
> +diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
> +index eae0e0c..fb06f63 100755
> +--- a/Tools/ssl/multissltests.py
> ++++ b/Tools/ssl/multissltests.py
> +@@ -51,6 +51,7 @@ OPENSSL_RECENT_VERSIONS =3D [
> +     "3.1.7",
> +     "3.2.3",
> +     "3.3.2",
> ++    "3.4.0",
> + ]
> +
> + LIBRESSL_OLD_VERSIONS =3D [
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-=
for-ERR_LIB_SYS.patch b/meta/recipes-devtools/python/python3/0001-ssl-Raise=
-OSError-for-ERR_LIB_SYS.patch
> new file mode 100644
> index 0000000000..18e0f208c7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR=
_LIB_SYS.patch
> @@ -0,0 +1,51 @@
> +From 11e0523eb363b7def4bc64d24a04e88d8670a691 Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Thu, 28 Nov 2024 13:32:30 +0100
> +Subject: [PATCH] ssl: Raise OSError for ERR_LIB_SYS
> +
> +From the ERR_raise manpage:
> +
> +    ERR_LIB_SYS
> +
> +        This "library code" indicates that a system error is
> +        being reported.  In this case, the reason code given
> +        to `ERR_raise()` and `ERR_raise_data()` *must* be
> +        `errno(3)`.
> +
> +Upstream-Status: Submitted [https://github.com/python/cpython/pull/12736=
1]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + Modules/_ssl.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> +index e5b8bf21002..a243ba4b9bc 100644
> +--- a/Modules/_ssl.c
> ++++ b/Modules/_ssl.c
> +@@ -667,6 +667,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *fi=
lename, int lineno)
> +                         ERR_GET_REASON(e) =3D=3D SSL_R_CERTIFICATE_VERI=
FY_FAILED) {
> +                     type =3D state->PySSLCertVerificationErrorObject;
> +                 }
> ++                if (ERR_GET_LIB(e) =3D=3D ERR_LIB_SYS) {
> ++                    // A system error is being reported; reason is set =
to errno
> ++                    errno =3D ERR_GET_REASON(e);
> ++                    return PyErr_SetFromErrno(PyExc_OSError);
> ++                }
> +                 p =3D PY_SSL_ERROR_SYSCALL;
> +             }
> +             break;
> +@@ -692,6 +697,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *fi=
lename, int lineno)
> +                 errstr =3D "EOF occurred in violation of protocol";
> +             }
> + #endif
> ++            if (ERR_GET_LIB(e) =3D=3D ERR_LIB_SYS) {
> ++                // A system error is being reported; reason is set to e=
rrno
> ++                errno =3D ERR_GET_REASON(e);
> ++                return PyErr_SetFromErrno(PyExc_OSError);
> ++            }
> +             break;
> +         }
> +         default:
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipe=
s-devtools/python/python3_3.13.0.bb
> index a393b5e4a0..b3170879b9 100644
> --- a/meta/recipes-devtools/python/python3_3.13.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.0.bb
> @@ -31,6 +31,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://0001-test_active_children-skip-problematic-test.patch =
\
>             file://0001-test_readline-skip-limited-history-test.patch \
>             file://fix-armv5.patch \
> +           file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multi=
ssl.patch \
> +           file://0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch \
>             "
>
>  SRC_URI:append:class-native =3D " \
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208030): https://lists.openembedded.org/g/openembedde=
d-core/message/208030
> Mute This Topic: https://lists.openembedded.org/mt/109838102/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

