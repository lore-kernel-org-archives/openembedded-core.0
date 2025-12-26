Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1819AE8FDA8
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 10:46:57 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151029.1766746007939876557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Dec 2025 02:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DFwIjukQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37cef3ccb82so52037641fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 02:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766746006; x=1767350806; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQhZoePpZSKWXYHmYqY5rghzhXZy28jnFZWRfEjlPCc=;
        b=DFwIjukQoj8mYAgkSbU0gzbRPjYD3PS+CbsccdA8DlOUc6RUVadnkOk55xo1Ma8x8G
         2bOgPBGhSRIdGZg0WzJRORz53hnBkmLvyWrUpWucVn6HnLzhKlxDaLtkYj6nXEDgDcNn
         ErkosCdJl/p9axUm4ajTW/1pLLz7zSms9zdDlecwxe5Pfpfw4i/beN28vAmFK4KAXxQq
         nEkcgYW3Hxx+rKBhUVFz9DfFiSuH+ocvK9FkPtkT97ZWqKPuT13lAk3UJROawpBH3g6n
         KisgpuJa4sQ43Uhjr2lrcLml/iudGhaUiw+4afqb0Xs+rVraCtleoup92XRRzhInF8bW
         tkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766746006; x=1767350806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQhZoePpZSKWXYHmYqY5rghzhXZy28jnFZWRfEjlPCc=;
        b=SUXoFzW1JRBVfqxi6oEXW/wNTT+kbj7/FJUJen5SLVtsuLhOSgoNXuIaF4XYH591wF
         qLiJ/OGZVdV+OtdrgLHFRwRmGeB3U4j4uPpx525snfwas1Iqn+PoA71I+3ZkX6DTg4Ov
         hIKs2C6TfS+f3gS6idIfqTC/JI3BJ34yq9esOSzEG7/P/kEHFjh/uINVLBirE9iYWpdZ
         IfoAWP9AqQNLnMJa3AlWc0cHLvsTtV6lJQdu17U4WNuYwNsMiPhuYddOttnlwxxDbgFd
         BsrnZJOTSMckJnwjYClPPQHJNosGDQ46wKIb1wKJIetvUhpktIbQX1pMWAP6N8f/tsFU
         pXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0X1wva1CkoIml9nGTcw7t3HNHM9Z/nZhNH0Rj1p1yUrpGiDVv2xFOOIwhDVasGNmKHcs50y40/fpgjR2JnTJq8w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1g0hO6mXD9J7dFlf7TIMZgribsrZanoHDXeUjIRkR3RrVcTnp
	4iGilD2PRufJjlQF4aXdCJ3snJ7vsGYhHHIRP6yAxlQsqC9WBymgRxUBL9U/wI03CM/NEZjH2N/
	80NTqHR0/QiNj6eWAGBSTNOOGVifjZO8=
X-Gm-Gg: AY/fxX7+a9df1A6eatkYSJh4mbIcf16IN+doK4DQqr4Ejxe70Ow6b4FMpCPgNOI8YMF
	9+Pv0/8ihGjLRA5jcF7CQL6FpYSiX1sxRFFMBeCZYfAIW9gVzvLjKrkaywC4PzbZU4ybtFKLgfc
	k3cb0EOOKZQXIQybg0UaWB/fQCqkxklKYLe0poSRKGD3fM3MbN/a1e3xgi2rjhCl85eKIzqQEPw
	8DWemTnaSBVbtQnHlzx96JNss1+HU3iF5macO9X4EXAuwHtcDP1Bs8vMM7xKkwBh9sSpCZHOw==
X-Google-Smtp-Source: AGHT+IEjgboxUKdtR5mHvxtJwV+6lnHG5PonWQW6H2G678qtZ9mI7RLz/jGsFFKpbtj56nVAUoY/1nc5v21gJO2HHVg=
X-Received: by 2002:a2e:a99a:0:b0:37f:c5ca:72f0 with SMTP id
 38308e7fff4ca-381215e74bbmr64548881fa.8.1766746004942; Fri, 26 Dec 2025
 02:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
 <20251219120109.1967755-2-koen.kooi@oss.qualcomm.com> <CAMKF1spSmrcUcrtFrUZ4qU+9dQvMZu49cKW3BPp11Cv7-iHV5Q@mail.gmail.com>
In-Reply-To: <CAMKF1spSmrcUcrtFrUZ4qU+9dQvMZu49cKW3BPp11Cv7-iHV5Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Dec 2025 11:46:33 +0100
X-Gm-Features: AQt7F2oQlN70UmLsC9B3SiSjSGkB76vYzdYn59AyNoSCrkXzVexNqZpKbG9rFmo
Message-ID: <CA+chaQefJX0cHeW8GMUNKjpAA+Q0aQNnps9LZrp_7s1Pb-JSiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/4] python3-pyzstd: import 0.17.0 from meta-python
To: raj.khem@gmail.com
Cc: koen.kooi@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 10:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228548

oe-core imported 0.17.0 version which fails to build with lto while
meta-oe had 0.19.0 which doesn't fail

it wasn't detected before, because of the overlayed version in
meta-oe, removed by Khem now:
https://git.openembedded.org/meta-openembedded/commit/?id=3Ddbc5ef5e12e49c1=
4546be301421a7ea9cb998699

oe-core is missing these pyzstd changes from meta-oe:

https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-d=
evtools/python?id=3Dabce3f440f46687a85cd04a40b61a5c38eb2bdcb
python3-pyzstd: upgrade 0.17.0 -> 0.18.0
https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-d=
evtools/python?id=3D332072205f3ea5dcefe72cc2fe89b2fdbf7ee330
python3-backports-zstd: Add recipe
https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-d=
evtools/python?id=3D0b5f2ba62c32ab23bda52e54df2d144fc270cf50
python3-pyzstd: Add ptest dependency on backports.zstd
https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-d=
evtools/python?id=3Dd8e7190fd3de3807599ec8fafbd23b8bf68100a1
python3-pyzstd: Remove setup.py tweak for lto/clang

Koen: will you please take care of them?

Cheers,

On Tue, Dec 23, 2025 at 4:39=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Koen
>
> It's now applied to oe-core, we need it removed from meta-python, would y=
ou mind cooking a patch for it ?
>
> On Fri, Dec 19, 2025 at 4:01=E2=80=AFAM Koen Kooi via lists.openembedded.=
org <koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> From the upstream website:
>>         Pyzstd module provides classes and functions for compressing and
>>         decompressing data, using Facebook's Zstandard (or zstd as short=
 name)
>>         algorithm.
>>
>> This recipe is being moved over for systemd 258.x, the 'ukify' tool
>> depends on this.
>>
>> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>> ---
>> Changes since v3:
>>  * Added SUMMARY
>> Changes since v2:
>>  * No changes
>> Changes since v1:
>>  * Adjusted pyzstd patch to not specify an upper limit to the setuptools
>>    version, as suggested by Alexander Kanavin.
>>
>>  ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++++++++++++
>>  .../python/python3-pyzstd_0.17.0.bb           | 20 ++++++++++++++
>>  2 files changed, 47 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Rem=
ove-setuptools-version-limit-of-74.patch
>>  create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.b=
b
>>
>> diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-set=
uptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-py=
zstd/0001-Remove-setuptools-version-limit-of-74.patch
>> new file mode 100644
>> index 0000000000..f2910322ff
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools=
-version-limit-of-74.patch
>> @@ -0,0 +1,27 @@
>> +From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Wed, 9 Apr 2025 14:38:31 -0700
>> +Subject: [PATCH] Remove setuptools version limit of '74'
>> +
>> +Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
>> +support beyond that which is needed for python 3.9 on windows. We
>> +do not have this problem on Linux
>> +
>> +Upstream-Status: Inappropriate [OE-specific]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + pyproject.toml | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/pyproject.toml b/pyproject.toml
>> +index dd885e4..5d4d511 100644
>> +--- a/pyproject.toml
>> ++++ b/pyproject.toml
>> +@@ -1,6 +1,6 @@
>> + [build-system]
>> + # setuptools 64+ support --build-option
>> + # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9=
 under Windows
>> +-requires =3D ["setuptools>=3D64,<74"]
>> ++requires =3D ["setuptools>=3D64"]
>> + backend-path =3D ["build_script"]
>> + build-backend =3D "pyzstd_pep517"
>> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/met=
a/recipes-devtools/python/python3-pyzstd_0.17.0.bb
>> new file mode 100644
>> index 0000000000..af7069b6ed
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
>> @@ -0,0 +1,20 @@
>> +DESCRIPTION =3D "Pyzstd module provides classes and functions for compr=
essing and \
>> +decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as shor=
t name) algorithm."
>> +SUMMARY =3D "Python bindings to Zstandard (zstd) compression library"
>> +HOMEPAGE =3D "https://github.com/animalize/pyzstd"
>> +SECTION =3D "devel/python"
>> +
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef97=
4b9e"
>> +
>> +PYPI_PACKAGE =3D "pyzstd"
>> +
>> +SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
>> +SRC_URI[sha256sum] =3D "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da2=
1b81764fa208c1db6"
>> +
>> +inherit pypi python_setuptools_build_meta ptest-python-pytest
>> +
>> +# clang-16 with -flto segfaults on arm, therefore ignore flto for now
>> +do_configure:append:arm:toolchain-clang() {
>> +    sed -i -e "s|'-flto'|''|" ${S}/setup.py
>> +}
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228472): https://lists.openembedded.org/g/openembedde=
d-core/message/228472
> Mute This Topic: https://lists.openembedded.org/mt/116858017/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

