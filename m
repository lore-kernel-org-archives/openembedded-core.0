Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA3DC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:53:28 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.172034.1673888001952052845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e/8LI2VK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id g10so20438504wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZWp5nxOfdmWkLdbKbk3hgTKN+KkCRisA6PJjxArhgNA=;
        b=e/8LI2VKNaoRkNwW7vf428efuRmkGapCM0ZQE+IwnuOA/bagarY/0fLRKUxN5UH+hM
         YoF5vCJMBgBNh5dgeT/GgmSo2V4ciVv82ATP1O8hoeT+dRw7OoCZWZKOjcdUxp6+J2Yj
         ymyastda2A2zGrixc5HRfxqqeuHOXx3GHE/PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWp5nxOfdmWkLdbKbk3hgTKN+KkCRisA6PJjxArhgNA=;
        b=B0/YBixhLg2MRah5lTHIVju0qfCeoFjBfOHlQFhUtC3q2rW2MGw74uoaDE2PsuWZ3I
         3/56ds+i1+PEKwYJymEGXotNzELCHTTgvuFTTpY1OkJfnGt+TxTqoRvw2uguubux8ERI
         7CTOW9Ffmh2n5UEhZp4VhIn5G9fWmzH5ht//Dat0tSOvjmql/eSK9pPqjtp7PublId3N
         He5JRlIHiiPPBQNQJXdQTMdnWg0bgq/g188L/tapBsBjLIEhZB0ryT6oL2G7wG/qp0zz
         ALMn7UpN9b6szbWly6JIDSQx/rcrhtVqaY8eDY2zrYjhWgUt89KQj8a4r3PtHh3IE68e
         EAFw==
X-Gm-Message-State: AFqh2kqR48XZap0FE9mhpoQnotMO5ODcs9T20prfdq2aIsA2pg+Fh2pE
	NOCvrDerY7mFA3y3jf8eD3ZLcA==
X-Google-Smtp-Source: AMrXdXs4TbjevFL0gBBH4D7R6kUbni/ld9E+L0mJLPkXRUOrLQisxVMWHueWFd+9ERFEE+ywFf1ktA==
X-Received: by 2002:a05:600c:1d10:b0:3d9:ef75:ea6e with SMTP id l16-20020a05600c1d1000b003d9ef75ea6emr8844984wms.38.1673888000171;
        Mon, 16 Jan 2023 08:53:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b003db040f0d5esm486953wmq.33.2023.01.16.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:53:19 -0800 (PST)
Message-ID: <673f679a090098d5edaed475d2696e0a7690594e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][V2] kernel_dep_check.bbclass: help track
 kernel depend
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jebr@google.com, openembedded-core@lists.openembedded.org
Cc: brandonkim@google.com, edtanous@google.com, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Mon, 16 Jan 2023 16:53:19 +0000
In-Reply-To: <20221228214732.758882-1-jebr@google.com>
References: <20221228214732.758882-1-jebr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176006

On Wed, 2022-12-28 at 13:47 -0800, John Broadbent via
lists.openembedded.org wrote:
> From: John Edward Broadbent <jebr@google.com>
>=20
> This recipe can be used to identify kernel dependencies, and
> immediately throw build errors if those dependencies are not met.
>=20
> Signed-off-by: John Edward Broadbent <jebr@google.com>
> ---
>  meta/classes-recipe/kernel_dep_check.bbclass | 81 ++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 meta/classes-recipe/kernel_dep_check.bbclass
>=20
> diff --git a/meta/classes-recipe/kernel_dep_check.bbclass b/meta/classes-=
recipe/kernel_dep_check.bbclass
> new file mode 100644
> index 0000000000..25bef1533c
> --- /dev/null
> +++ b/meta/classes-recipe/kernel_dep_check.bbclass
> @@ -0,0 +1,81 @@
> +# This class is meant to help in tracking recipe's dependencies
> +# on certain Linux Kernel's compile time options, by making them
> +# explicit.
> +#
> +# Usage.
> +# 1. Inherit this class.
> +# 2. If the Linux Kernel MUST have certain compile time options
> +#       enabled, add them to KERNEL_OPTIONS_REQUIRED variable.
> +#       Multiple options can be added, separated by whitespace.
> +#       If the kernel built with the image does not have these
> +#       options enabled, the build will fail.
> +# 3. If some options are simply recommended, but not mandatory,
> +#       they can be added to KERNEL_OPTIONS_RECOMMENDED variable.
> +#       If the kernel built with the image does not have these
> +#       options enabled, warning will be produced, but the build
> +#       will succeed.
> +# 4. If some options has alternatives, i.e. if only one of the
> +#       options has to be enabled to pass the check, separate
> +#       the alternatives with '|' with no spaces, like so:
> +#           DECOMPRESS_GZIP|DECOMPRESS_BZIP2
> +
> +
> +KERNEL_OPTIONS_REQUIRED ??=3D ""
> +KERNEL_OPTIONS_RECOMMENDED ??=3D ""
> +
> +def report_opt_warn(pn, opt):
> +    if len(opt_alt_list) > 1:
> +        bb.warn("%s recommends one of the following Linux Kernel"
> +                " options to be enabled: %s"
> +                % (pn, ",".join(opt_alt_list)))
> +    else:
> +        bb.warn("%s recommends Linux Kernel option %s to be enabled"
> +                % (pn, opt_alt_list[0]))
> +
> +
> +def report_opt_fatal(pn, opt_alt_list):
> +    if len(opt_alt_list) > 1:
> +        bb.fatal("%s requires one of the following Linux Kernel"
> +                " options to be enabled: %s"
> +                % (pn, ",".join(opt_alt_list)))
> +    else:
> +        bb.fatal("%s requires Linux Kernel option %s to be enabled"
> +                % (pn, opt_alt_list[0]))
> +
> +
> +def check_kernel_option(pn, opt_expr, opt_map, report_f):
> +    alt_list =3D opt_expr.split("|")
> +    alt_list_full =3D []
> +    for opt in alt_list:
> +        if not opt.startswith("CONFIG_"):
> +            alt_list_full.append("CONFIG_" + opt)
> +        else:
> +            alt_list_full.append(opt)
> +
> +    if not any(opt_map.get(o) =3D=3D "y" for o in alt_list_full):
> +        report_f(pn, alt_list_full)
> +
> +
> +python do_package:qa:append () {
> +    kconfig_path =3D os.path.join(d.getVar("STAGING_KERNEL_BUILDDIR"), "=
.config")
> +
> +    kconfig_map =3D dict()
> +    with open(kconfig_path, "r") as kconfig:
> +        for line in kconfig:
> +            if not line.startswith("CONFIG"):
> +                continue
> +
> +            cfg_chunks =3D line.strip().split("=3D")
> +            kconfig_map[cfg_chunks[0]] =3D cfg_chunks[1]
> +
> +    pn =3D d.getVar("PN")
> +    for opt in d.getVar("KERNEL_OPTIONS_REQUIRED", "").split():
> +        check_kernel_option(pn, opt, kconfig_map, report_opt_fatal)
> +
> +    for opt in d.getVar("KERNEL_OPTIONS_RECOMMENDED", "").split():
> +        check_kernel_option(pn, opt, kconfig_map, report_opt_warn)
> +}
> +
> +# do_shared_workdir moves kernel's .config to STAGING_KERNEL_BUILDDIR,
> +# so it must complete before we can run the qa checks above.
> +do_package:qa[depends] =3D "virtual/kernel:do_shared_workdir"

Thanks for updating the patch.=C2=A0I am a little curious on the
background/context for this code, not sure if there are any details you
can share?

I did talk with our kernel developers about this and there is a worry
that in doing this, we'd start duplicating functionality that we
already have in the kernel tools and kernel cache work that linux-yocto
supports. Did you look at the support there and is that something you
could use instead?

Worst case this can be used within your own layers, in core we'd
probably want to try and standardise around on set of kernel tooling.

Cheers,

Richard





