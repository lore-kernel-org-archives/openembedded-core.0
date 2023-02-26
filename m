Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0D2C64EC7
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 00:03:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.56589.1677369786725920458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 16:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JjO913YN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m14-20020a7bce0e000000b003e00c739ce4so1741846wmc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 16:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VkOH7QJ5xpfv7i+bjOerKEXcuSxgm0OqXwufcXHhYZo=;
        b=JjO913YNZdSFRS57EWV8AkFU0kSdfy3EosFPl3vBagrPhVsmz6BL25Jo3ai/ZrVuU+
         fQCh9tmlfbNGwdrv9sB3C1ssbdfTs7H/JARpz9TLnEDAtT0qdcyuI5bXo54X2PEMzamq
         StLGNZndyVXYfFXQfKi3sQ06BAQjrx/ZBoftM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkOH7QJ5xpfv7i+bjOerKEXcuSxgm0OqXwufcXHhYZo=;
        b=Puk4Ymy9HxqloHcrTDpvOSam+xYc82ukykFgXvbXe/K8uIoodqC4kHlQaVtpYdY4G/
         MWfzc16Pinsg/WqyX14aM1PhSwEca6ETM1FrrMoK8hqqIGr8NCqJFc37AEf543ee/j7U
         zMmQOWWjCraxshnWf/KU+ztJ414vg3E9bg4vBa6Ps9Xq2beBRmXs3jrP3qJjdt8MezSA
         MFxc7XuDtGquUbE8QfsSFSB8BgLL51qfZoBXxVkDuMG8aY5PkBLX0x4iV2se540n6VBD
         4Y9KIncONOzH/p6XnAuSGmuoqS5T76jngtIX0CU2dqfIypswtQFpVnnzCjEOf2YR1pbH
         kJeg==
X-Gm-Message-State: AO0yUKVmofE62Kb4UOaOFb43Xo7GV0wVvuE0QlKj9pNpwgrEt5u4F4RR
	YDZ5RiPCcJgM7rCAc0JOmlmt0Q==
X-Google-Smtp-Source: AK7set/ieBs0m+jRsb2SR7x0+re8Ur7hI0I9HHM69YHPalQoBuqRjwO/N4gHLsKefNr3TSjfQNeorQ==
X-Received: by 2002:a05:600c:32af:b0:3ea:ea8a:a94a with SMTP id t47-20020a05600c32af00b003eaea8aa94amr6522649wmp.27.1677369784810;
        Sat, 25 Feb 2023 16:03:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed? ([2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b003e0238d9101sm4372742wmb.31.2023.02.25.16.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 16:03:04 -0800 (PST)
Message-ID: <0dcfae798b6abb998c7fee9b1ecd4dd9a2e24d6e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 4/6] oeqa/selftest/resulttool: add test for
 metadata filtering on regression
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Sun, 26 Feb 2023 00:03:03 +0000
In-Reply-To: <20230224164555.67634-5-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
	 <20230224164555.67634-5-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 00:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177722

On Fri, 2023-02-24 at 17:45 +0100, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Introduce new tests for the metadata-based filtering added for oeselftest
> results
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
>  .../oeqa/selftest/cases/resulttooltests.py    | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/o=
eqa/selftest/cases/resulttooltests.py
> index efdfd98af3c..75d406c122d 100644
> --- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
> +++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
> @@ -98,3 +98,140 @@ class ResultToolTests(OESelftestTestCase):
>          resultutils.append_resultsdata(results, ResultToolTests.target_r=
esults_data, configmap=3Dresultutils.flatten_map)
>          self.assertEqual(len(results[''].keys()), 5, msg=3D"Flattened re=
sults not correct %s" % str(results))
> =20
> +    def test_results_without_metadata_can_be_compared(self):
> +        base_configuration =3D {"TEST_TYPE": "oeselftest",
> +                              "TESTSERIES": "series1",
> +                              "IMAGE_BASENAME": "image",
> +                              "IMAGE_PKGTYPE": "ipk",
> +                              "DISTRO": "mydistro",
> +                              "MACHINE": "qemux86"}
> +        target_configuration =3D {"TEST_TYPE": "oeselftest",
> +                                "TESTSERIES": "series1",
> +                                "IMAGE_BASENAME": "image",
> +                                "IMAGE_PKGTYPE": "ipk",
> +                                "DISTRO": "mydistro",
> +                                "MACHINE": "qemux86"}
> +        self.assertTrue(regression.can_be_compared(base_configuration, t=
arget_configuration),
> +                        msg=3D"incorrect metadata filtering, tests witho=
ut metadata should be compared")
> +
> +    def test_target_result_with_missing_metadata_can_not_be_compared(sel=
f):
> +        base_configuration =3D {"TEST_TYPE": "oeselftest",
> +                              "TESTSERIES": "series1",
> +                              "IMAGE_BASENAME": "image",
> +                              "IMAGE_PKGTYPE": "ipk",
> +                              "DISTRO": "mydistro",
> +                              "MACHINE": "qemux86",
> +                              "OESELFTEST_METADATA": {"run_all_tests": T=
rue,
> +                                                      "run_tests": None,
> +                                                      "skips": None,
> +                                                      "machine": None,
> +                                                      "select_tags": ["t=
oolchain-user", "toolchain-system"],
> +                                                      "exclude_tags": No=
ne}}
> +        target_configuration =3D {"TEST_TYPE": "oeselftest",
> +                                "TESTSERIES": "series1",
> +                                "IMAGE_BASENAME": "image",
> +                                "IMAGE_PKGTYPE": "ipk",
> +                                "DISTRO": "mydistro",
> +                                "MACHINE": "qemux86"}
> +        self.assertFalse(regression.can_be_compared(base_configuration, =
target_configuration),
> +                         msg=3D"incorrect metadata filtering, tests shou=
ld not be compared")
> +
> +    def test_results_with_matching_metadata_can_be_compared(self):
> +        base_configuration =3D {"TEST_TYPE": "oeselftest",
> +                              "TESTSERIES": "series1",
> +                              "IMAGE_BASENAME": "image",
> +                              "IMAGE_PKGTYPE": "ipk",
> +                              "DISTRO": "mydistro",
> +                              "MACHINE": "qemux86",
> +                              "OESELFTEST_METADATA": {"run_all_tests": T=
rue,
> +                                                      "run_tests": None,
> +                                                      "skips": None,
> +                                                      "machine": None,
> +                                                      "select_tags": ["t=
oolchain-user", "toolchain-system"],
> +                                                      "exclude_tags": No=
ne}}
> +        target_configuration =3D {"TEST_TYPE": "oeselftest",
> +                                "TESTSERIES": "series1",
> +                                "IMAGE_BASENAME": "image",
> +                                "IMAGE_PKGTYPE": "ipk",
> +                                "DISTRO": "mydistro",
> +                                "MACHINE": "qemux86",
> +                                "OESELFTEST_METADATA": {"run_all_tests":=
 True,
> +                                                        "run_tests": Non=
e,
> +                                                        "skips": None,
> +                                                        "machine": None,
> +                                                        "select_tags": [=
"toolchain-user", "toolchain-system"],
> +                                                        "exclude_tags": =
None}}
> +        self.assertTrue(regression.can_be_compared(base_configuration, t=
arget_configuration),
> +                        msg=3D"incorrect metadata filtering, tests with =
matching metadata should be compared")
> +
> +    def test_results_with_mismatching_metadata_can_not_be_compared(self)=
:
> +        base_configuration =3D {"TEST_TYPE": "oeselftest",
> +                              "TESTSERIES": "series1",
> +                              "IMAGE_BASENAME": "image",
> +                              "IMAGE_PKGTYPE": "ipk",
> +                              "DISTRO": "mydistro",
> +                              "MACHINE": "qemux86",
> +                              "OESELFTEST_METADATA": {"run_all_tests": T=
rue,
> +                                                      "run_tests": None,
> +                                                      "skips": None,
> +                                                      "machine": None,
> +                                                      "select_tags": ["t=
oolchain-user", "toolchain-system"],
> +                                                      "exclude_tags": No=
ne}}
> +        target_configuration =3D {"TEST_TYPE": "oeselftest",
> +                                "TESTSERIES": "series1",
> +                                "IMAGE_BASENAME": "image",
> +                                "IMAGE_PKGTYPE": "ipk",
> +                                "DISTRO": "mydistro",
> +                                "MACHINE": "qemux86",
> +                                "OESELFTEST_METADATA": {"run_all_tests":=
 True,
> +                                                        "run_tests": Non=
e,
> +                                                        "skips": None,
> +                                                        "machine": None,
> +                                                        "select_tags": [=
"machine"],
> +                                                        "exclude_tags": =
None}}
> +        self.assertFalse(regression.can_be_compared(base_configuration, =
target_configuration),
> +                         msg=3D"incorrect metadata filtering, tests with=
 mismatching metadata should not be compared")
> +
> +    def test_metadata_matching_is_only_checked_for_relevant_test_type(se=
lf):
> +        base_configuration =3D {"TEST_TYPE": "runtime",
> +                              "TESTSERIES": "series1",
> +                              "IMAGE_BASENAME": "image",
> +                              "IMAGE_PKGTYPE": "ipk",
> +                              "DISTRO": "mydistro",
> +                              "MACHINE": "qemux86",
> +                              "OESELFTEST_METADATA": {"run_all_tests": T=
rue,
> +                                                      "run_tests": None,
> +                                                      "skips": None,
> +                                                      "machine": None,
> +                                                      "select_tags": ["t=
oolchain-user", "toolchain-system"],
> +                                                      "exclude_tags": No=
ne}}
> +        target_configuration =3D {"TEST_TYPE": "runtime",
> +                                "TESTSERIES": "series1",
> +                                "IMAGE_BASENAME": "image",
> +                                "IMAGE_PKGTYPE": "ipk",
> +                                "DISTRO": "mydistro",
> +                                "MACHINE": "qemux86",
> +                                "OESELFTEST_METADATA": {"run_all_tests":=
 True,
> +                                                        "run_tests": Non=
e,
> +                                                        "skips": None,
> +                                                        "machine": None,
> +                                                        "select_tags": [=
"machine"],
> +                                                        "exclude_tags": =
None}}
> +        self.assertTrue(regression.can_be_compared(base_configuration, t=
arget_configuration),
> +                         msg=3D"incorrect metadata filtering, %s tests s=
hould be compared" % base_configuration['TEST_TYPE'])
> +
> +    def test_machine_matches(self):
> +        base_configuration =3D {"TEST_TYPE": "runtime",
> +                              "MACHINE": "qemux86"}
> +        target_configuration =3D {"TEST_TYPE": "runtime",
> +                              "MACHINE": "qemux86"}
> +        self.assertTrue(regression.can_be_compared(base_configuration, t=
arget_configuration),
> +                        msg=3D"incorrect machine filtering, identical ma=
chine tests should be compared")
> +
> +    def test_machine_mismatches(self):
> +        base_configuration =3D {"TEST_TYPE": "runtime",
> +                              "MACHINE": "qemux86"}
> +        target_configuration =3D {"TEST_TYPE": "runtime",
> +                              "MACHINE": "qemux86_64"}
> +        self.assertFalse(regression.can_be_compared(base_configuration, =
target_configuration),
> +                        msg=3D"incorrect machine filtering, mismatching =
machine tests should not be compared")

I love the fact this has tests but they don't work:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4854

then with the obvious error fixed to add self.logger:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4858/step=
s/14/logs/stdio

Cheers,

Richard

