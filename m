Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652EFC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:02:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4929.1783504952605197109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 03:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HMPyU/z+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c127ec4447cso54202266b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 03:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783504951; x=1784109751; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IqaTyjqNAOivwGF2X4qP9z4+eRUuHGl2ih2RB4UahVE=;
        b=HMPyU/z+/82leT9smiFuHAj/8uAGRvrUbu7q/xJYbsQXns6btWG3f54VOvJ8/valrZ
         fPaGv6xM7LE6SaRZeL00We3NbZ34yeMZ+9YIVGL3dpDrKcYEfSJq0l1mdoPFQi76DAsl
         YRF6DhLr8sVP1QEoVh/KoCTUyY03vVwQCCM6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504951; x=1784109751;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqaTyjqNAOivwGF2X4qP9z4+eRUuHGl2ih2RB4UahVE=;
        b=grnJVhO5AotSTVuI7RjJk7nFcpYUcMHkaROQ19XFGr/tPUwL5CjpDBLRkfLPA11ZKS
         CDmvOKKsLKw3+Op7B//uudJcQmLBkJmTxBFm0tcLqaBGacTQrJhTU7mSK5Upp+3b0t2G
         M419NuBIFdRe1WcBKdEt0OC58TgU6MGDfkBI0z8jCkXkBA8CJAPzFbjoShfH/fsQy/QQ
         w6aL6FTG74XT2wsFReRCxL7BPaP+ligAi5I06J7KpTDzIiNFVNWDFYIdQclnjcjGjBsD
         43mt3af2ElvuBaX2l4b2ljfI8+BJSN8apSw79sIRYXYvaHneeYzL11ugy1hyGEhd63+4
         F0iw==
X-Forwarded-Encrypted: i=1; AHgh+RrqwaYJIHbOQwPWFh+ghinxR/FunnnC+zgU1CZLJoAbpa7RjBoUNt/hNQ9uDSI0XxmWOMoWYCGsYucj2RCuMyMJCg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMO/jCYkm2MVU9h2O0LHgn/NqLUnON/tlzoV+X+re4KB0zNUJd
	d4K1nTIlODQYOMtIh2Rmre5uiR8fRh+POQ2Qt5LQe4R7VrI7UaP2x5mKGc6AdyHf3vg=
X-Gm-Gg: AfdE7cm9D9Z6x/LFWW+yS1f4FuIsavWf5EOXKzBh63ooo3dcTULqpaYQnBag3uaIM4W
	ZF1/ppa4sU0XZxsXGRu6UoRr+l8rE7dpQAIMYgr27ivFy41rr30pHobl0s8sCSw4Hv7MrrqPfWD
	eeyEFUED4jW7QCNHRNLUk+it9/hghDNaSqkLNjlfrwQiuNXoQzyqpqO2C8pMd9+qxXikAkalcp3
	xgXmJINxcetbLe5SfQhkpGAAAm/WiVySoxA7sRv9xAWCcRRG4doAGLzld5W4NlFQD1OjsVhiZxX
	b7YIdKNjuHISbvHnXkteoJLA3bbwYavkxSW9v9Vm0yGXLVCFCH2GhypQmCDXBTf0v+ZXeOtYAFe
	WlWTx3kHYC0AH978ipMsLQTmL2EFcuFbUYjEinYJMGQeRjdqauB0/esvU6qYY72LCyNvRV2t6t0
	+D4ol9CE7MPBR7cXplsCVLU4sFngHFyVGFZ2BzmZJzzo8WqWi8IKszIwYPumbbnBFJu8jNGUJKy
	Dpxmg==
X-Received: by 2002:a17:907:782:b0:c15:ce72:9352 with SMTP id a640c23a62f3a-c15ce729443mr85359166b.33.1783504950658;
        Wed, 08 Jul 2026 03:02:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b60a:b356:19ef:1131? ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm288727766b.5.2026.07.08.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:30 -0700 (PDT)
Message-ID: <7c6485b1f3bf19a0aaa5bfa9433d4b47d3a3c3c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: add
 PACKAGE_POSTPROCESS_FUNCS hook
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: emailaddress.ashish@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2026 11:02:29 +0100
In-Reply-To: <20260708095602.12427-1-emailaddress.ashish@gmail.com>
References: <20260708095602.12427-1-emailaddress.ashish@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 10:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240457

On Wed, 2026-07-08 at 15:26 +0530, Ashish Mishra via
lists.openembedded.org wrote:
> This patch hardcode the emit_pkgdata to run last and adds a new hook
> PACKAGE_POSTPROCESS_FUNCS to package.bbclass which
>=20
> PACKAGE_PREPROCESS_FUNCS comes in picture before the per-package file
> split,
> so at that point the final file lists are not yet available.
> There is no existing hook that fires after the split with the ability
> to still
> modify package scripts postinst
>=20
> One of use case driving this patch is SELinux context labeling
> There can be other user defined usage if the hook is available
>=20
> Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
> ---
> =C2=A0meta/classes-global/package.bbclass | 16 +++++++++++++---
> =C2=A01 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-
> global/package.bbclass
> index 30accaeaa9..c53b5c2d3d 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -460,6 +460,7 @@ def gen_packagevar(d, pkgvars=3D"PACKAGEVARS"):
> =C2=A0
> =C2=A0# Functions for setting up PKGD
> =C2=A0PACKAGE_PREPROCESS_FUNCS ?=3D ""
> +PACKAGE_POSTPROCESS_FUNCS ?=3D ""
> =C2=A0# Functions which split PKGD up into separate packages
> =C2=A0PACKAGESPLITFUNCS ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 package_do_split_locales \
> @@ -472,8 +473,7 @@ PACKAGEFUNCS +=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 package_do_shlibs \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 package_do_pkgconfig \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 read_shlibdeps \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 package_depchains \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 emit_pkgdata"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 package_depchains"
> =C2=A0
> =C2=A0python do_package () {
> =C2=A0=C2=A0=C2=A0=C2=A0 # Change the following version to cause sstate t=
o invalidate the
> package
> @@ -564,14 +564,24 @@ python do_package () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for file in files:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pkgfiles[pkg].append(walkroot + os.sep + file)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 #
> +=C2=A0=C2=A0=C2=A0 # We want emit_pkgdata to run last, after everything
> +=C2=A0=C2=A0=C2=A0 # This is becuase any layer which adds its custom fun=
ction
> +=C2=A0=C2=A0=C2=A0 # to PACKAGEFUNCS using +=3D=C2=A0 would get executed=
 after
> emit_pkgdata
> +=C2=A0=C2=A0=C2=A0 #
> =C2=A0=C2=A0=C2=A0=C2=A0 for f in (d.getVar('PACKAGEFUNCS') or '').split(=
):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func(f, d)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 for f in (d.getVar('PACKAGE_POSTPROCESS_FUNCS') or ''=
).split():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func(f, d)
> +
> +=C2=A0=C2=A0=C2=A0 bb.build.exec_func("emit_pkgdata", d)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)

Just put emit_pkgdata here and then you don't need
PACKAGE_POSTPROCESS_FUNCS at all, you can just append to PACAGEFUNCS?

Cheers,

Richard

