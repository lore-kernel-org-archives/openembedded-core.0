Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A20DC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:01:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.25285.1639486899299925411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZr51bSG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so16237116wme.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=e+VhBhIurXvxkmlf9g0PtF5Dx5xRGhHvMHPE68I02GM=;
        b=OZr51bSG5X7pGvmUVF43spsQ3itZrJV7SxqyOtZHWeKjOid5dJjrHucZ3IlKj3zBAu
         jjb4SfLZaRvn2/3KBjrX9lZTw4IoXVNwiQ6lZw9QCHSTQabA3ByrnMPId0vlgQdDgfZp
         YWn7qIhn8kqxG90XFB0eyyC021kKbrqZyUKL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e+VhBhIurXvxkmlf9g0PtF5Dx5xRGhHvMHPE68I02GM=;
        b=lm5auJVZY/Z/fmOC29vuJ46YeURpHLtvilXnpsvQPBrj3QE3swp+SQ4WSJP2e16DRF
         9vcH+DJX+RSnjgmUdQxTabykHV7zWKU892E2QK7FUUiAoPKFEScQ6zPX2iyyHsVeNLj5
         eMcYZTAnIkCrM16kyfGRbBGvLIAWwTlMLl1GLouLctkLiSeslYXVETFBllyp9c0KkQrL
         6kxELirJmzBgjlxVURkWP/qnZBFTnQg3v/k+JctcPRKWlhXwSkzz+tdzYmeJLEqPYkHT
         oIba2Q3dSNAxWoscwPy8Efdb3Djvu8Fdh1oO6Nzq2FnupmCagLfuGvhwS959S6XHMxO2
         qCPQ==
X-Gm-Message-State: AOAM533Ard2EY4HJl1nGqrKqm9vJxQEu6pWrUIMz39GbeTg1Az8E2RC2
	4C+UkxQvEhKn5lNjsqF8wVdDdw==
X-Google-Smtp-Source: 
 ABdhPJzcRkD4kYFm6UALFV/ltk/Vh8jK5C18AxUxVTFIbjC4iezPFgHNIIZgQvFpzHPsuSK8LAKq+Q==
X-Received: by 2002:a05:600c:3787:: with SMTP id
 o7mr933423wmr.110.1639486896857;
        Tue, 14 Dec 2021 05:01:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62?
 ([2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62])
        by smtp.gmail.com with ESMTPSA id
 p8sm13530722wrx.25.2021.12.14.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:01:36 -0800 (PST)
Message-ID: 
 <81f66ff3524b0c4e82b3ed2974dbb7e5664817b5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH v2 3/3] selftest: recipetool: Add test for
 handle_license_vars function
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Tue, 14 Dec 2021 13:01:33 +0000
In-Reply-To: 
 <20211213150546.22196-3-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20211213150546.22196-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20211213150546.22196-3-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 13:01:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159689

On Mon, 2021-12-13 at 16:05 +0100, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
> (no changes since v1)
> 
>  meta/lib/oeqa/selftest/cases/recipetool.py | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> index 1c73b2c5e0..5330d73cbf 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -592,6 +592,68 @@ class RecipetoolTests(RecipetoolBase):
>              with open(srcfile, 'w') as fh:
>                  fh.writelines(plugincontent)
>  
> +    def test_recipetool_handle_license_vars(self):
> +        from create import handle_license_vars
> +        from unittest.mock import Mock
> +
> +        commonlicdir = get_bb_var('COMMON_LICENSE_DIR')
> +
> +        d = bb.tinfoil.TinfoilDataStoreConnector
> +        d.getVar = Mock(return_value=commonlicdir)
> +
> +        srctree = tempfile.mkdtemp(prefix='recipetoolqa')
> +        self.track_for_cleanup(srctree)
> +
> +        # Multiple licenses
> +        licenses = ['MIT', 'ISC', 'BSD-3-Clause', 'Apache-2.0']
> +        for licence in licenses:
> +            shutil.copy(os.path.join(commonlicdir, licence), os.path.join(srctree, 'LICENSE.' + licence))
> +        # Duplicate license
> +        shutil.copy(os.path.join(commonlicdir, 'MIT'), os.path.join(srctree, 'LICENSE'))
> +
> +        extravalues = {
> +            # Duplicate and missing licenses
> +            'LICENSE': 'Zlib & BSD-2-Clause & Zlib',
> +            'LIC_FILES_CHKSUM': [
> +                'file://README.md;md5=0123456789abcdef0123456789abcd'
> +            ]
> +        }
> +        lines_before = []
> +        handled = []
> +        licvalues = handle_license_vars(srctree, lines_before, handled, extravalues, d)
> +        expected_lines_before = [
> +            '# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is',
> +            '# your responsibility to verify that the values are complete and correct.',
> +            '# NOTE: Original package / source metadata indicates license is: BSD-2-Clause & Zlib',
> +            '#',
> +            '# NOTE: multiple licenses have been detected; they have been separated with &',
> +            '# in the LICENSE value for now since it is a reasonable assumption that all',
> +            '# of the licenses apply. If instead there is a choice between the multiple',
> +            '# licenses then you should change the value to separate the licenses with |',
> +            '# instead of &. If there is any doubt, check the accompanying documentation',
> +            '# to determine which situation is applicable.',
> +            'LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT & Zlib"',
> +            'LIC_FILES_CHKSUM = "file://LICENSE;md5=0835ade698e0bcf8506ecda2f7b4f302 \\\n'
> +            '                    file://LICENSE.MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \\\n'
> +            '                    file://LICENSE.ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d \\\n'
> +            '                    file://LICENSE.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \\\n'
> +            '                    file://LICENSE.BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \\\n'
> +            '                    file://README.md;md5=0123456789abcdef0123456789abcd"',
> +            ''
> +        ]
> +        self.assertEqual(lines_before, expected_lines_before)
> +        expected_licvalues = [
> +            ('MIT', 'LICENSE', '0835ade698e0bcf8506ecda2f7b4f302'),
> +            ('MIT', 'LICENSE.MIT', '0835ade698e0bcf8506ecda2f7b4f302'),
> +            ('ISC', 'LICENSE.ISC', 'f3b90e78ea0cffb20bf5cca7947a896d'),
> +            ('Apache-2.0', 'LICENSE.Apache-2.0', '89aea4e17d99a7cacdbeed46a0096b10'),
> +            ('BSD-3-Clause', 'LICENSE.BSD-3-Clause', '550794465ba0ec5312d6919e203a55f9')
> +        ]
> +        self.assertEqual(handled, [('license', expected_licvalues)])
> +        self.assertEqual(extravalues, {})
> +        self.assertEqual(licvalues, expected_licvalues)
> +
> +
>      def test_recipetool_split_pkg_licenses(self):
>          from create import split_pkg_licenses
>          licvalues = [
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159642): https://lists.openembedded.org/g/openembedded-core/message/159642
> Mute This Topic: https://lists.openembedded.org/mt/87699203/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [richard.purdie@linuxfoundation.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

The test failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2956/steps/14/logs/stdio

Cheers,

Richard



