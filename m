Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A99EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 18:27:45 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.3526.1689186461996354702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 11:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QCu/6HWM;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f954d7309fso1419163e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689186460; x=1691778460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTSEnNmJ/jUzEp8GzeekQpZ0G9xF6hRnhoB+iJB15WM=;
        b=QCu/6HWM+GIp5t3q3/g9clWD5emi4umX+qQDS9d6g+GcHbv9IFfZFtQbRG32hs9+dY
         tpqkDUhF9dCI22/jHpVvgAxgvE3WU6SMeaYBFDyXeDtvP5m9PwxM3MS8YgKU3sUXMTjL
         mPTNW7O2g0ajHsejMXfrpOBTIqryaPUUJbVhLA4IRxmtfitGS0QJOIowkcBvcjx/RINK
         oKDLlYA0uoeVAMHl4dtcX0q76XzlQtQEmevQS1LN8pGEmtVITuSHKoeXLeExIFiPfmNR
         DAAq2jtdpeulLh2PWgTZKIYY65qIe4e991wx36C9VM1HDNDCKvQ3H13+WdGl84zcPIrd
         BWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186460; x=1691778460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTSEnNmJ/jUzEp8GzeekQpZ0G9xF6hRnhoB+iJB15WM=;
        b=MbK82709kiFYBSs6AZlml/h82wbE2lFNdqnXYx3wp7lK3sq86262TwxzT2zU4ORfwK
         0g6T6S13NFLfVCIRkIVWE9qp6zKF6mwqqPeAH9ecfxX1xCzLGA1G1p6yRdxEIJEw0zNo
         TaMsufwYu9zhvRTOoIyDKl40VlSofT1ioZLQ1nM7ju3ClJwnKQRQq3lUBj9PAfTm28wq
         b8xf3UcaOyS1yKSw8g1AvaQ1KQviUoL0bV62izmiXCnc8TsOhorK64GNfqx79r3FQYe7
         TW/VRhxw5XktFbhokQSfXnNyj3ti4/rRNQ3xT6hG5eG3fJkgxdgmtI0uPXS10xoJUHMS
         XYkw==
X-Gm-Message-State: ABy/qLYXJv0zwPMHOOujIO9phe7mSccEsVxm31OuDTT0MDPxHsIYvXpH
	U7eRu5XBawl3ifXdqCr541vih/kkHv/zt/mmr8o=
X-Google-Smtp-Source: APBJJlHokCWaGud0dQhREBPtmEsgcZh6SzUfFcULqUxOprqCSO+AOKd+9KC3n7g/XWPn82EkPhMWDsOU5CNy/cE9qsM=
X-Received: by 2002:a05:6512:1093:b0:4f8:6ac4:1aa9 with SMTP id
 j19-20020a056512109300b004f86ac41aa9mr1220149lfg.21.1689186459802; Wed, 12
 Jul 2023 11:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230711172545.738677-1-tgamblin@baylibre.com>
In-Reply-To: <20230711172545.738677-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jul 2023 20:27:28 +0200
Message-ID: <CANNYZj-7ZzO65GN+_X+peMDFp31Q1M9Tx8OEfj0p0PS4VB5Ecg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: parallelize ptests, add test_cppext dependencies
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 18:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184213

I would suggest just one more tweak here: insert
|| echo "FAIL: python3"
after python3 but before sed. That way it'll catch failures that sed
does not (that silent regressing did just happen with
zipapp/cgitb/cppext).

Alex

On Tue, 11 Jul 2023 at 19:25, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> This is based on a previous patch from Alex Kanavin (thanks Alex),
> but it retains our use of sed to parse the test output into a usable
> form. The intent was to use the test module's --junit-xml feature and
> parse the resulting log instead of using sed, but various errors were
> encountered when testing this method, so that will need further
> investigation before we can consider adopting it. Two missing ptest
> dependencies on python3-cgitb and python3-zipapp were already merged
> in a previous patch, so only gcc, g++, and binutils were left to add
> as ptest RDEPENDS.
>
> ptest output and runtime with this change:
>
> =3D=3D Tests result: SUCCESS =3D=3D
>
> 405 tests OK.
>
> 29 tests skipped:
>     test_asdl_parser test_check_c_globals test_clinic test_curses
>     test_devpoll test_gdb test_idle test_ioctl test_kqueue
>     test_launcher test_msilib test_ossaudiodev test_readline
>     test_smtpnet test_socketserver test_startfile test_tcl test_tix
>     test_tk test_ttk_guionly test_ttk_textonly test_turtle
>     test_urllib2net test_urllibnet test_winconsoleio test_winreg
>     test_winsound test_xmlrpc_net test_zipfile64
>
> Total duration: 5 min 3 sec
>
> [YOCTO #13298]
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb   | 1 +
>  meta/recipes-devtools/python/python3/run-ptest | 2 +-
>  meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
> index ddc56c8f9f..74cf933b72 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -26,6 +26,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools=
 =3D "1524288"
>  # ptests need more memory than standard to avoid the OOM killer
>  QB_MEM =3D "-m 1024"
>  QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
> +QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
>  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 4096"
>
>  TEST_SUITES =3D "ping ssh parselogs ptest"
> diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipe=
s-devtools/python/python3/run-ptest
> index 05396e91ab..ee1130284b 100644
> --- a/meta/recipes-devtools/python/python3/run-ptest
> +++ b/meta/recipes-devtools/python/python3/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>
> -SETUPTOOLS_USE_DISTUTILS=3Dnonlocal python3 -m test -v | sed -u -e '/\.\=
.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\=
. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's=
/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> +SETUPTOOLS_USE_DISTUTILS=3Dnonlocal python3 -m test -v -j 4 | sed -u -e =
'/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/=
\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' =
-e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipe=
s-devtools/python/python3_3.11.4.bb
> index 86ecc4e297..2d7b1bac2c 100644
> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
> @@ -426,7 +426,7 @@ FILES:${PN}-man =3D "${datadir}/man"
>  # See https://bugs.python.org/issue18748 and https://bugs.python.org/iss=
ue37395
>  RDEPENDS:libpython3:append:libc-glibc =3D " libgcc"
>  RDEPENDS:${PN}-ctypes:append:libc-glibc =3D " ${MLPREFIX}ldconfig"
> -RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgit=
b ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed"
> +RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgit=
b ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-fr-fr locale-ba=
se-en-us locale-base-tr-tr locale-base-de-de"
>  RDEPENDS:${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk',=
 '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
>  RDEPENDS:${PN}-idle +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk', '$=
{PN}-tkinter ${MLPREFIX}tcl', '', d)}"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184149): https://lists.openembedded.org/g/openembedde=
d-core/message/184149
> Mute This Topic: https://lists.openembedded.org/mt/100083497/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

