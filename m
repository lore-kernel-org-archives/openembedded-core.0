Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B55C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 16:38:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.40926.1702485522265848691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 08:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKf9BzOq;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ca03103155so90613941fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702485520; x=1703090320; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd75J58bKtG3Nj5J9jEqvk96QaaGMgL6G4dMbslcBrI=;
        b=hKf9BzOqYzk9F+Pbf6cxhBiwTAexmuRCcHO9dEiCEiofLss7+aXlvKiUdj4MEKAyaP
         L473G1waxHtT/jC1VgXu9MpByJqz4qzPxfzJLqB6GuRtkwLnadPkYbkbAFrJH3DMs9ph
         2Ws8B+mUO/utvZjj0yNW3BI5jMumzzH/uAMvQhZIpNKU/QZhEzEfJXlHgMEofyzxfW84
         11BEaAcS7XMx7SAZFqhRQOOSuaF18yUxy4zloj+JyO8FUbJZ3nN21GHnb87xlVFhoNx+
         cmm+NsEg/AZQYcjL33qRO6V3wG9xuSe9DQ2tpOYRJyzqpjs+Nu+G+2VRMH24F+E8ac/f
         lP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485520; x=1703090320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd75J58bKtG3Nj5J9jEqvk96QaaGMgL6G4dMbslcBrI=;
        b=MZTuMKENNFA6bp/gkr3O5zgorvvATWMIaL63HePR6rLINM+ETtWQki6B0XUloFDMoy
         M7J/be2L9gqLayEgfdYVKF55K+0NDFfnP2RfnQGBUghI6EFfbGQaoMciB2BJSEE/cnTy
         5ZGynqmAYHJTtbS0epp4FvsTYHQb8dupE6DvFD+eS32pY6IfP3dpu5z9PK4e8mhJO2B8
         RtMQptcNlc292qBVWgJrd+7ml/FnEucecTGecsyvEcKmfS+pMMjxQfWWzrZY5LbIaD9U
         5njEqiT0frRQOEpPq3iH9ObwkM8WR3g9075o79DVLyVbJS1ANaIHC1F32DszWlYSt6Oz
         6j0Q==
X-Gm-Message-State: AOJu0Yy2VlPZ174NZZB8OsMrwQJVpLCHF2s4/1gWTEQyqc4vAFMyDb7m
	px7rsVYXPoBrNHGsimV3FK77gOZ+uYy5Dl8ETVI=
X-Google-Smtp-Source: AGHT+IGjkLQ+geV0b3GUyBqrkpMbVMvIN0uBSpCUll37n3xvqbqyPONQX2SrE9ul/+lYVDpvWTjkOGmxjnyQdU0QXt4=
X-Received: by 2002:a2e:958a:0:b0:2ca:9d5:ba8b with SMTP id
 w10-20020a2e958a000000b002ca09d5ba8bmr2690067ljh.24.1702485520051; Wed, 13
 Dec 2023 08:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20231213102129.618430-1-mingli.yu@windriver.com>
In-Reply-To: <20231213102129.618430-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Dec 2023 17:38:28 +0100
Message-ID: <CANNYZj-gPhJLyOiMrPib6QqqHiWpcakvb_bOxZXcbw5=-CeFGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest failure
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 16:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192306

Why isn't the ptest failure reported by the autobuilder? Shouldn't we
first fix the ptest so that the failure is reported correctly, if it
starts occurring again?

Alex

On Wed, 13 Dec 2023 at 11:21, Yu, Mingli <mingli.yu@eng.windriver.com> wrot=
e:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fix the below ptest failure:
>  self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton_c=
odestyle>
>  def test_skeleton_codestyle(self):
>  """
>  This test shouldn't run in proliferated repositories.
>  """
>  setup_cfg =3D configparser.ConfigParser()
>  setup_cfg.read("setup.cfg")
>  > if setup_cfg["metadata"]["name"] !=3D "skeleton":
>  tests/test_skeleton_codestyle.py:22:
>  self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =3D '=
metadata'
>  def _getitem_(self, key):
>  if key !=3D self.default_section and not self.has_section(key):
>  > raise KeyError(key)
>  E KeyError: 'metadata'
>
> After the patch:
>  # ./run-ptest
>  [snip]
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_bad_syntax
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_exception_as_regular_key
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_exception_with_choice
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_invalid_license_exception
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_invalid_license_exception_strict_false
>  PASS: tests/test_license_expression.py::LicensingValidateTest::test_vali=
dation_invalid_license_key
>  PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
>  PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_licens=
ing
>  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_i=
nfo
>  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_i=
nfo_vendored
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_duplicated_elements
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_empty_input
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_or_relationship
>  PASS: tests/test_license_expression.py::CombineExpressionTest::test_comb=
ine_expressions_with_regular
>  PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codesty=
le
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python/python3-license-expression/run-ptest                 | 2 +-
>  .../python/python3-license-expression_30.1.1.bb                 | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-license-expression/run-=
ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> index 5cec711696..3385d68939 100644
> --- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
> +++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>
> -pytest
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP=
/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'=
| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=
=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1=
.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> index 31fb88d6e5..5d3923d487 100644
> --- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> +++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> @@ -33,4 +33,5 @@ do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/src
>      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>      cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
> +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
>  }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192278): https://lists.openembedded.org/g/openembedde=
d-core/message/192278
> Mute This Topic: https://lists.openembedded.org/mt/103146950/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

