Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C518CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:36:06 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.17591.1702542956320025459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R54222x7;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c9f84533beso89776281fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702542954; x=1703147754; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8AXnhonR8OM33m2ujex0z42dWiQ3ESjxoalt7avH3I=;
        b=R54222x7c3saSOhPCmeyW+KEx8yT+rYHSthNl7Ajgq5VtzqVDZmMSiVovGHwmw5agA
         cHWgjPEIZ5punKbHBWU7ZQJ7NiG2lmCcRC/OQhdHD5I8sHmrwvxoX/eayp3XQ4YtNGGc
         ZoiRncDf/4PRUuZz3YXBs0eABxANaVZgc5Dt8GyWko3TOgJJEqs6wGushKGyLuvC6v+e
         +GkpVK9fkLcImV62+vm5gD0tTCvH1xIqmbJn7rw9jIOHs3oKtuHv0gzGQrEbteWEGCOK
         Ep6w+jfXslhTsjxs2XWrnK6w78zYvrqj+uHddCi+p3WQ+dgP2MvL7RsvGlNnROpWkCJR
         qf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702542954; x=1703147754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8AXnhonR8OM33m2ujex0z42dWiQ3ESjxoalt7avH3I=;
        b=wBTiNw1qrad2u7Qg9w6cFmSQgF7XM1fo4N9WJNW3RchRf1mliWRiJ8l4k44R9z2lae
         Ox28Y7cVRHVtZB+Hr25BpQyrbHg6XY77WK5b46aPTUQixFhhXJgTCgw9mur55nEKbw/w
         j57TyJc3wc7LGCyYylFM/WA2s4e95HVfG/ebCxeasG+8kNrE3UJji0HQSZ92eQqU0WnF
         oly8vw8VQf6t18jiwuRQ4tU6bn+FpRBCcqJ3iIvvWQAbKOUyEg9xR7h0OwNjpqxTOsqM
         2dnzKqziEq1r7zsCHA8tV0qoDPgyj0LdA5g0pYM+X7Yg78/hfGtL2OPkjsr+owoUk6ur
         FUmA==
X-Gm-Message-State: AOJu0Ywa6Fh8+MX3t5gHRdUBVx4RorEzdlfqugjD/NtNCM+d+orCrF4P
	UTYsAX6yFnZJTRY1Zla+Su+4fj143/1KXBOrrQI=
X-Google-Smtp-Source: AGHT+IH5iyg9CggjJpEUofHKkRMFcohhv7PeHeAgcUMJPZTRrBvzhT+9HTdEH/hFhqLq00hp7fG7DSqTynI37igPkKA=
X-Received: by 2002:a2e:7c0d:0:b0:2cc:451d:83cc with SMTP id
 x13-20020a2e7c0d000000b002cc451d83ccmr171876ljc.81.1702542953947; Thu, 14 Dec
 2023 00:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20231213102129.618430-1-mingli.yu@windriver.com>
 <CANNYZj-gPhJLyOiMrPib6QqqHiWpcakvb_bOxZXcbw5=-CeFGQ@mail.gmail.com>
 <CANNYZj_dMRQe9LfO3fnbRsgxBP5r24deRvTNoj-_U=mAK3bHqw@mail.gmail.com> <CO1PR11MB5009E6328640784502A94DDEF18CA@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5009E6328640784502A94DDEF18CA@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 09:35:42 +0100
Message-ID: <CANNYZj8Up+UhiQo96T5OMxp+seYj6d8VyAGeF4vCCTj7mt764g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest failure
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 08:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192338

This doesn't answer the question I asked: does the pytest command
return a zero exit code when some of the tests fail? If so, that is
incorrect behaviour.

It's expected that we can catch the overall failiure from the exit
code even if there's no output that can point to specific test cases
failing (because upstreams change the output without telling us, sed
processing in run-ptest quietly regress etc).

Alex

On Thu, 14 Dec 2023 at 04:35, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
>
> Hi Alex,
>
> The single command is enough to indicate the build failure such as:
>  root@qemux86-64:/usr/lib64/python3-license-expression/ptest# ./run-ptest
> [snip]
> PASS: tests/test_license_expression.py::CombineExpressionTest::test_combi=
ne_expressions_with_empty_input
> PASS: tests/test_license_expression.py::CombineExpressionTest::test_combi=
ne_expressions_with_or_relationship
> PASS: tests/test_license_expression.py::CombineExpressionTest::test_combi=
ne_expressions_with_regular
> FAIL: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyl=
e
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D FAILURES =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ______________________ BaseTests.test_skeleton_codestyle ________________=
_______
>
> self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton_co=
destyle>
>
>     def test_skeleton_codestyle(self):
>         """
>         This test shouldn't run in proliferated repositories.
>         """
>         setup_cfg =3D configparser.ConfigParser()
>         setup_cfg.read("setup.cfg")
> >       if setup_cfg["metadata"]["name"] !=3D "skeleton":
>
> tests/test_skeleton_codestyle.py:22:
> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _=
 _ _ _
>
> self =3D <configparser.ConfigParser object at 0x7f04c0473610>, key =3D 'm=
etadata'
>
>     def __getitem__(self, key):
>         if key !=3D self.default_section and not self.has_section(key):
> >           raise KeyError(key)
> E           KeyError: 'metadata'
>
> ../../python3.11/configparser.py:979: KeyError
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D short test summary info =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> FAIL tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
1 failed, 174 passed in 7.08s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Thanks,
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Thursday, December 14, 2023 00:39
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest =
failure
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> I see that run-ptest consists of a single pytest command; does that
> command return a zero exit code even it fails?
>
> Alex
>
> On Wed, 13 Dec 2023 at 17:38, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >
> > Why isn't the ptest failure reported by the autobuilder? Shouldn't we
> > first fix the ptest so that the failure is reported correctly, if it
> > starts occurring again?
> >
> > Alex
> >
> > On Wed, 13 Dec 2023 at 11:21, Yu, Mingli <mingli.yu@eng.windriver.com> =
wrote:
> > >
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > >
> > > Fix the below ptest failure:
> > >  self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skelet=
on_codestyle>
> > >  def test_skeleton_codestyle(self):
> > >  """
> > >  This test shouldn't run in proliferated repositories.
> > >  """
> > >  setup_cfg =3D configparser.ConfigParser()
> > >  setup_cfg.read("setup.cfg")
> > >  > if setup_cfg["metadata"]["name"] !=3D "skeleton":
> > >  tests/test_skeleton_codestyle.py:22:
> > >  self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =
=3D 'metadata'
> > >  def _getitem_(self, key):
> > >  if key !=3D self.default_section and not self.has_section(key):
> > >  > raise KeyError(key)
> > >  E KeyError: 'metadata'
> > >
> > > After the patch:
> > >  # ./run-ptest
> > >  [snip]
> > >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_bad_syntax
> > >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_exception_as_regular_key
> > >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_exception_with_choice
> > >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_invalid_license_exception
> > >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_invalid_license_exception_strict_false
> > >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_invalid_license_key
> > >  PASS: tests/test_license_expression.py::UtilTest::test_build_licensi=
ng
> > >  PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_li=
censing
> > >  PASS: tests/test_license_expression.py::UtilTest::test_get_license_k=
ey_info
> > >  PASS: tests/test_license_expression.py::UtilTest::test_get_license_k=
ey_info_vendored
> > >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_duplicated_elements
> > >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_empty_input
> > >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_or_relationship
> > >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_regular
> > >  PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_cod=
estyle
> > >
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >  .../python/python3-license-expression/run-ptest                 | 2 =
+-
> > >  .../python/python3-license-expression_30.1.1.bb                 | 1 =
+
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3-license-expression/=
run-ptest b/meta/recipes-devtools/python/python3-license-expression/run-pte=
st
> > > index 5cec711696..3385d68939 100644
> > > --- a/meta/recipes-devtools/python/python3-license-expression/run-pte=
st
> > > +++ b/meta/recipes-devtools/python/python3-license-expression/run-pte=
st
> > > @@ -1,3 +1,3 @@
> > >  #!/bin/sh
> > >
> > > -pytest
> > > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\=
]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/=
SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" ||=
 $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{prin=
t}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $N=
F=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > > diff --git a/meta/recipes-devtools/python/python3-license-expression_=
30.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.=
bb
> > > index 31fb88d6e5..5d3923d487 100644
> > > --- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.=
bb
> > > +++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.=
bb
> > > @@ -33,4 +33,5 @@ do_install_ptest() {
> > >      install -d ${D}${PTEST_PATH}/src
> > >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > >      cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
> > > +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
> > >  }
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#192278): https://lists.openembedded.org/g/openemb=
edded-core/message/192278
> > > Mute This Topic: https://lists.openembedded.org/mt/103146950/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

