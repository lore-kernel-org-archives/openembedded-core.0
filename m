Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEB5CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 09:58:10 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.13739.1758880686213738559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 02:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BV8DJnQ/;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-78febbe521cso14846676d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758880685; x=1759485485; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wxb/XkmnCcIs38wguWVR4WJocEISUJM1xSuPT33DC0=;
        b=BV8DJnQ/Lvrsyt4TCH6y5R9QVVJAt2Zo6SeeMU3TZ2EB3TH8HG72I5EEGa6kzO9mrD
         7NcrftIeXMPiscsOD5cdA5Rid9x/wacmG/fBk6oI/pwKI7UIHksNZ+bUSZLLdhZaMP8Q
         gzGiaj+sRH02/Fj3QSA0D3FEe7WnRRg4UwspAvdFlafUqbTQ7ICXVeyrXjY3v5lOX/Iy
         jUFzoqU9OXUEO4w79WoBVN98QbT57h/bPleC2BP8nmQiu3sQSPiZZxS1F/vq2z7rCmRf
         ii3VmmpjGvMXA/P9yq3QFn1Nx9SRcU4bFrS8y0JJtvtFmlJ29nSJLfmcbridSjjZRfrg
         j56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758880685; x=1759485485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Wxb/XkmnCcIs38wguWVR4WJocEISUJM1xSuPT33DC0=;
        b=LaVrqHnyT7V0G7AtnV8gcUNlw41RnpDnSq6CnG2uDjf/gKwmP2pU7dtN/Ku2moQnKU
         tEvkIuVuf6EGcDUnEYGllXpXbGoOxtrX2JFHVa2f+9ustLEAdM2YsVrn4jLFcRmLtXkr
         HlJi4ydhck5k0+t3lnKHposTP+SwGXH+Wq9vNBzbWomYsXfyJnLz4dBkuwkALs4ioe6n
         l1neaguAaiDD+1l7R/8gndshz+/jyEmsiFPO4hp4QS8twIzAWaRBTVgMIdrymySatt3P
         4+ndVdCGZRe+T8769+Ywan8Yjckd9x5g/VfRN3b2hN44v1abfANaw2H0ArrTAWwb+mH8
         2+ew==
X-Gm-Message-State: AOJu0YyFTuixbiLb3pQY70IXVbRyCus8xtaRW6SSqZwpWOc4418d96UP
	oM7K4LaLFsR7duD7XeYm03UtoZ9h7WyLnLaI/HXNAEMUD4RZryLWqWsBHj9sOaWserdCNWsmERJ
	SzkJ/3bsc8BYmnccpMFRqi5K2illZRWQ=
X-Gm-Gg: ASbGncsEk8UUqF98Ko7KjfJ3Pad/eaRt/kNRom08fxByR83TOtLNunL2tJ0YC2Z/ll7
	iQYuYY9Cqe1z1T61g+8+qZvioN8hGCH9G8tOTYP0l4lbCHyc+BQBVXKTgsQTyH7VeLmXUfoxNv+
	p2nPpRxCtU64KFrbh+D59HNBgVqWzhTWWnylwpPwEIrb1CLB9gCqhcwtdqHTZZtsr1Vp50loGKs
	dblhXSd+zv0zMeQYZwbPlSG38IOt+Sj178QeIZYLIz3V8rF/DoKuAtW1Z7iKiXx/j/WkEFXcsRg
	cZcL1rGDVUl51pEusVlhN+sjxe/xzqQRa7kEf2hrVp4N3j7tSVk=
X-Google-Smtp-Source: AGHT+IE7oOZdvDTBdNQ5p0t38hl+s7UOuUxX5dpfNyb3Hv0+tyvjkBoTWbtz6CxIgVtaGiGzLsQoq6iwuT2tCyx7SrU=
X-Received: by 2002:ad4:4eea:0:b0:78e:c5c7:1225 with SMTP id
 6a1803df08f44-7fc25df02afmr81730356d6.9.1758880685057; Fri, 26 Sep 2025
 02:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250926-builtin-fragments-tests-v1-1-28c32d45bc15@bootlin.com>
In-Reply-To: <20250926-builtin-fragments-tests-v1-1-28c32d45bc15@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 11:57:53 +0200
X-Gm-Features: AS18NWAurT6K5WCUzHnFPhwZLCBwcM93wWE7EwfUZJhg5CVR0lM1jiMT-9zk9_I
Message-ID: <CANNYZj9pMpU=47=u1zc0TtOgOVv37xciotA==ek2HHV5eqyzVw@mail.gmail.com>
Subject: Re: [PATCH] oeqa/bblayers.py: add tests for adding new built-in fragments
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224068

Thanks, lgtm.

Alex

On Fri, 26 Sept 2025 at 11:47, Antonin Godard
<antonin.godard@bootlin.com> wrote:
>
> Add discussed in [1], our best option for customizing built-in fragments
> is to pass them from a layer configuration. In short, the reason is that
> our statement must be parsed before the addfragments call is parsed.We
> also have to use the :append override as using += would override the
> original definition of OE_FRAGMENTS_BUILTIN (since it uses a ?=
> assignment).
>
> Provide a test case for customizing built-in fragments with
> meta-selftest.
>
> [1]: https://lore.kernel.org/yocto-docs/20250925-fragments-v1-0-c9f747361fb2@bootlin.com/T/#m9f7c9f110c084eba17e0f64d8b2ac7a88af3f38e
>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta-selftest/conf/layer.conf            |  2 ++
>  meta/lib/oeqa/selftest/cases/bblayers.py | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
> index ecc45ded8c..de7d6340ed 100644
> --- a/meta-selftest/conf/layer.conf
> +++ b/meta-selftest/conf/layer.conf
> @@ -12,3 +12,5 @@ BBFILE_PRIORITY_selftest = "5"
>  addpylib ${LAYERDIR}/lib oeqa
>
>  LAYERSERIES_COMPAT_selftest = "whinlatter"
> +
> +OE_FRAGMENTS_BUILTIN:append = " selftest-fragment:SELFTEST_BUILTIN_FRAGMENT_VARIABLE"
> diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
> index 8c05ec5d3d..d82c5aaf37 100644
> --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> @@ -272,6 +272,35 @@ class BitbakeConfigBuild(OESelftestTestCase):
>          self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
>          self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
>
> +    def test_enable_disable_builtin_fragments(self):
> +        """
> +        Tests that the meta-selftest properly adds a new built-in fragment from
> +        its layer.conf configuration file.
> +        The test sequence goes as follows:
> +        1. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is not set yet.
> +        2. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set after setting
> +           the fragment.
> +        3. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set after setting
> +           the fragment with another value that overrides the first one.
> +        4. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set to the previous
> +           value after removing the second assignment (from step 3).
> +        5. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is not set after
> +           removing the original assignment.
> +        """
> +        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), None)
> +
> +        runCmd('bitbake-config-build enable-fragment selftest-fragment/somevalue')
> +        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'somevalue')
> +
> +        runCmd('bitbake-config-build enable-fragment selftest-fragment/someothervalue')
> +        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'someothervalue')
> +
> +        runCmd('bitbake-config-build disable-fragment selftest-fragment/someothervalue')
> +        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'somevalue')
> +
> +        runCmd('bitbake-config-build disable-fragment selftest-fragment/somevalue')
> +        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), None)
> +
>      def test_show_fragment(self):
>          """
>          Test that bitbake-config-build show-fragment returns the expected
>
> ---
> base-commit: 07747aa7390e98bf2853154e5fd473e4984a1d3d
> change-id: 20250926-builtin-fragments-tests-e2d3672c1fff
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>

