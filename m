Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB76C7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 21:09:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.30396.1677272943469987578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 13:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jeFXJ+UP;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id h16so2315029edz.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 13:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8HIwVVoZmh2cOrRpEfvIycnbG+70g6rV/Vp7xlKGjfg=;
        b=jeFXJ+UPJqbQS0IHLM/dLjSLefacq+KNXi2wM4Mf24fbxkVWc7lu/sFDfyukd35LaD
         ky/mxVWVmwv43IiOCKN2f6VbsmuBBgLlWEwic9g513cf1NgOmx3kAkneXvvW9kZtSsqv
         j0WagohYbmx7kigUBBcBERXaayFiGp2G+PtMXbYQmc7XwyGWOYwND52JR73ZKjuYMWs/
         D/lzDgrI0NoafE+2XHk5MGq/I4mgu++PAq6whqpPcNq8sHWyLCzj3LM045m30H1VdygY
         5UHfvKQHoyMkAvhO1Ucej3v5B677wdu6I1GPt5kls2AIB64ZqQYqIdRn0FGz2Qvsa7ND
         5tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HIwVVoZmh2cOrRpEfvIycnbG+70g6rV/Vp7xlKGjfg=;
        b=GI3wI6Juot/hPH15hfng3rTq9F+OODNFIMq8Xq2oZXDlT89+/Ylo7TKADoLse7so09
         Tc6KU2UMa7Y4zbBcsP95+Jk4lCFtAp2+ZOFtXmbDc01pktTVkK2CxGDcGOVlFLopcjhS
         wvWRR69cr0Gfj6MkGmvjtxgO3KIqM0NV41bk7AdZpd3i8kEzjU3VjuPFWtnkg5VvNMiu
         NZsRkEt6TH8aDlyo1Wiiy+Y9MXjY31YZZtVe6kYAYjzeK2oIndnEBdV7vbLaUdUYKvHM
         EtRx4iTnoPAq4z+4k/sys+7IKR3iTYPV9X02zRqkerkmDbUI6PWU7AjehIqJExoFj1h4
         yhGQ==
X-Gm-Message-State: AO0yUKViZ8dcQCw1oFfc1Vl5uFHZKpccfoZpnzwotNlEiRIB+mOfn6Ju
	kOdfWYGBeaYgiFeK/OG/Nun52qCIvmMoh+xcs8s=
X-Google-Smtp-Source: AK7set9NrvQ9PRKElT5Dm04YxJiRKWNMJYs6ib+3OyKXPLJHVv3caw2YfJb2VO9HiuGKl0ge0VBXLe3R7ND7Fq8Qzf4=
X-Received: by 2002:a17:906:76d0:b0:8de:e66a:d788 with SMTP id
 q16-20020a17090676d000b008dee66ad788mr7009974ejn.7.1677272941456; Fri, 24 Feb
 2023 13:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20230224192449.1649437-1-saul.wold@windriver.com>
In-Reply-To: <20230224192449.1649437-1-saul.wold@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 24 Feb 2023 15:08:49 -0600
Message-ID: <CAJdd5Ga16mf6Htc8YFfJyvZ3beyfGCOm8yr_UScHZ=sFr5VeGg@mail.gmail.com>
Subject: Re: [PATCH v2] create-spdx: Add check for variable contents along
 with quotes
To: Saul Wold <saul.wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 21:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177713

On Fri, Feb 24, 2023 at 1:25 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> This adds a check to ensure we that if a variable is
> empty it gets an empty string, this also adds quotes
> to indicate the variable contents.
>
>           "comment": "CUSTOM_SPECIAL="
> or
>           "comment": "CUSTOM_SPECIAL=variable contents"
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass          |  5 ++-
>  .../selftest/cases/spdx_custom_annotations.py | 42 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index 454dd7a7a07..da90bf8033a 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -524,7 +524,10 @@ python do_create_spdx() {
>
>      if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
>          for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
> -            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
> +            if d.getVar(var):
> +                recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var).replace('"', '\\"')))

Manually trying to escape quotes can be really hard; Is there a
particular reason it's necessary? If you're trying to read this back
programmatically, I'd expect:

 name, value = annotation.split(=, 1)

to work

> +            else:
> +                recipe.annotations.append(create_annotation(d, var + "="))
>
>      # Some CVEs may be patched during the build process without incrementing the version number,
>      # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
> diff --git a/meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py b/meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py
> new file mode 100644
> index 00000000000..a2bef998988
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py
> @@ -0,0 +1,42 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake
> +import json
> +
> +class SPDXCustomAnnotations(OESelftestTestCase):
> +
> +    # Build test recipes with custom-annotation
> +    def test_spdx_custom_annotations(self):
> +        self.write_config("INHERIT:append = ' create_spdx'")
> +
> +        result = bitbake('%s custom-annotation')
> +        print(f"Bitbake Result: {result}")
> +        try:
> +            mdir = self.get_dir_from_bb_var('DEPLOY_DIR_SPDX', self.buildtarget)
> +            with open(f"{mdir}/recpes/recipe-{pn}.spdx.json") as json_file:
> +                spdx_json = json.load(json_file)
> +                print(f'{spdx_json["packages"]["annotations"][0]["comment"]}')
> +                self.assertEqual(spdx_json["packages"]["annotations"][0]["comment"], "ANNOTE1=This is the first custom annotation")
> +                self.assertEqual(spdx_json["packages"]["annotations"][1]["comment"], "ANNOTE2=This is another custom annotation")
> +        except:
> +            print("json load failed")
> +
> +#class SPDXCustomeAnnotationTests(OESelftestTestCase):
> +#    def default_config(self):
> +#        return """
> +#INHERIT:append = " create-spdx"
> +#SPDX_CUSTOM_ANNOTATION_VARS:pn-core-image-minimal = "TEST_VAR"
> +#TEST_VAR:pn-core-image-minimal = "This is a test annotation"
> +#"""
> +#
> +#    def test_image_annotation(self):
> +#        self.write_config(self.default_config())
> +#
> +#        result = bitbake('core-image-minimal', ignore_status=True)
> +
> +
> +
> --
> 2.25.1
>

