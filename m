Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D73C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 10:59:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.25747.1654858773298664840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 03:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dUrp2Dnk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so949956wms.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=2p9meBoNPpoeI7oepb3/+k9b37eiUIstlLdRJmAxI2g=;
        b=dUrp2DnkBZkczjx5CHXoaiBJNozwBMirxV09QIzV1VEX2+d5EDjljauNBUtGPpW9Va
         oB0C6EreI98RHK7Dun5yFlx6WzOgTC3eAITNyVdclXZb4mm1mUvoxaEVtURnYUvZch9f
         +EQ1e+HFqq+mbLAAoGAmWwqRIqscs9wrUnEwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=2p9meBoNPpoeI7oepb3/+k9b37eiUIstlLdRJmAxI2g=;
        b=Fy0td6GnQM++B2RRQTRJK58Eyz5T1BreP7Gx5P2DvNSRe3zSeOU6Prd65mZHJ/PMGZ
         zTN5OhP1hNMu9XlHQnk9PJHlNp0tUfkKBTwoz2NgvVl2Zf3fAMTj95U39IXWf0APz6XS
         Y0dA0DO88mNjTxjnwTq8B4pN7pHv5rKaG5HQThkiD6Y6YJBWsSYlpMpAXk9rQjO0R2pn
         C2FuuB5OoDshz9IDvpLz/htfUzlsip354+33u05xCoOA2DAw1CTPo9hr02xOBqeNCdoj
         b1v09hpOVly0xqQzWC7QxkGtIV63puQJFpYF0Hf9ldyNNO7xs/DytxLhuRdcEB/jsTAl
         YchQ==
X-Gm-Message-State: AOAM531M7B42azq8D23l26SrvNZdVgcjK2eNq4ZoDA/0RwPITET6XXf7
	1i8t1rpKhUT2A19BdA3Qfzc4iw==
X-Google-Smtp-Source: 
 ABdhPJwnJsx0/vIieF7ZctLIpzq+1OPUfic/dQlEVFIkhg7yrUHf4CpLLQwt+iF6XaRacfPxPK8cMg==
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id
 r14-20020a05600c35ce00b0039c7dc2aec0mr2341857wmq.33.1654858771693;
        Fri, 10 Jun 2022 03:59:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9?
 ([2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9])
        by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c255000b0039c4b518df4sm3149224wma.5.2022.06.10.03.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:59:31 -0700 (PDT)
Message-ID: 
 <ff7d6f65925a51e4e79288311ad6ef65fa1de0b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] archiver: avoid race conditions when using
 multiconfig and sharing the same TMPDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Fri, 10 Jun 2022 11:59:30 +0100
In-Reply-To: <16F73C6878DDFD9F.12817@lists.openembedded.org>
References: <20220609163907.40205-1-jose.quaresma@foundries.io>
	 <16F73C6878DDFD9F.12817@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 10:59:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166797

On Fri, 2022-06-10 at 11:43 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2022-06-09 at 17:39 +0100, Jose Quaresma wrote:
> > The archiver doesn't support using multiconfig sharing the same TMPDIR.
> > When in the multiconfig and using the same TMPDIR: the two machines can=
 make
> > the same copy at the same time to the same destination, which will not =
work.
> >=20
> > This issiue can be replicated with meta-ti layer:
> > > # use a multiconfig machine
> > > MACHINE =3D "am64xx-evm"
> > > # archive sources for target recipes in conf/local.conf
> > > INHERIT +=3D "archiver"
> > > COPYLEFT_RECIPE_TYPES =3D "target"
> > > ARCHIVER_MODE[src] =3D "original"
> > > ARCHIVER_MODE[diff] =3D "1"
> > > # and run bitbake with:
> > > bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_unpack_and_=
patch -f
> >=20
>=20
> I went digging. If I enable this as above (using master) and run
>=20
> $ bitbake mc:k3r5:gcc-source-12.1.0 gcc-source-12.1.0 -c do_unpack_and_pa=
tch -S none
>=20
> then:
>=20
> $ bitbake-diffsigs tmp/stamps/work-shared/gcc-12.1.0-r0.do_unpack_and_pat=
ch.sigdata.*
> NOTE: Starting bitbake server...
> Task dependencies changed from:
> ['ABIEXTENSION', 'ARCHIVER_MODE[diff-exclude]', 'ARCHIVER_MODE[diff]', 'A=
RCHIVER_MODE[src]', 'ARCHIVER_OUTDIR', 'ARCHIVER_TOPDIR', 'ARCHIVER_WORKDIR=
', 'B', 'BASEURI', 'EXTENDPE', 'GNU_MIRROR', 'HOST_ARCH', 'HOST_OS', 'HOST_=
SYS', 'HOST_VENDOR', 'INSANE_SKIP', 'LIBCEXTENSION', 'PATCHTOOL', 'PE', 'PF=
', 'PN', 'PR', 'PV', 'RECIPE_SYSROOT_NATIVE', 'S', 'SDE_DIR', 'SDE_FILE', '=
SOURCEDIR', 'SRC_URI', 'SRC_URI[sha256sum]', 'STAGING_DIR_NATIVE', 'T', 'TA=
RGET_ARCH', 'TARGET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TUNE_ARCH', 'UNPAC=
K_DIR', 'base_do_unpack', 'base_do_unpack[cleandirs]', 'create_diff_gz', 'c=
reate_source_date_epoch_stamp', 'do_patch', 'do_qa_patch', 'do_qa_unpack', =
'do_unpack', 'do_unpack[cleandirs]', 'is_work_shared', 'patch_do_patch', 's=
rc_patches', 'unpack_check_src_uri']
> to:
> ['ABIEXTENSION', 'ABIEXTENSION_32', 'ABIEXTENSION_64', 'ARCHIVER_MODE[dif=
f-exclude]', 'ARCHIVER_MODE[diff]', 'ARCHIVER_MODE[src]', 'ARCHIVER_OUTDIR'=
, 'ARCHIVER_TOPDIR', 'ARCHIVER_WORKDIR', 'ARMPKGSFX_ENDIAN_64', 'B', 'BASEU=
RI', 'EXTENDPE', 'GNU_MIRROR', 'HOST_ARCH', 'HOST_OS', 'HOST_SYS', 'HOST_VE=
NDOR', 'INSANE_SKIP', 'LIBCEXTENSION', 'PATCHTOOL', 'PE', 'PF', 'PN', 'PR',=
 'PV', 'RECIPE_SYSROOT_NATIVE', 'S', 'SDE_DIR', 'SDE_FILE', 'SOURCEDIR', 'S=
RC_URI', 'SRC_URI[sha256sum]', 'STAGING_DIR_NATIVE', 'T', 'TARGET_ARCH', 'T=
ARGET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TUNE_ARCH', 'TUNE_ARCH_32', 'TUN=
E_ARCH_64', 'UNPACK_DIR', 'base_do_unpack', 'base_do_unpack[cleandirs]', 'c=
reate_diff_gz', 'create_source_date_epoch_stamp', 'do_patch', 'do_qa_patch'=
, 'do_qa_unpack', 'do_unpack', 'do_unpack[cleandirs]', 'is_work_shared', 'p=
atch_do_patch', 'src_patches', 'unpack_check_src_uri']
> basehash changed from 005580a7a5a1ab1ff554d0a9e47c2ad4ba932f3fe185d8d349b=
06c83e5e58b6c to d7b2e696005a578d5958ef4e73f1fc83e22612a3ae4294fb0540b0fadc=
b6c50f
> List of dependencies for variable ABIEXTENSION changed from 'set()' to '{=
'ABIEXTENSION_64', 'ABIEXTENSION_32'}'
> List of dependencies for variable TUNE_ARCH changed from 'set()' to '{'TU=
NE_ARCH_32', 'TUNE_ARCH_64'}'
> Dependency on variable ABIEXTENSION_32 was added
> Dependency on variable ABIEXTENSION_64 was added
> Dependency on variable ARMPKGSFX_ENDIAN_64 was added
> Dependency on variable TUNE_ARCH_32 was added
> Dependency on variable TUNE_ARCH_64 was added
> Variable ABIEXTENSION value changed:
> @@ -1 +1,2 @@
> -eabi
> +${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '=
${ABIEXTENSION_32}', d)}
> +TUNE_FEATURES{aarch64} =3D Set
> Variable TUNE_ARCH value changed:
> @@ -1,2 +1,2 @@
> -${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}
> -TUNE_FEATURES{bigendian} =3D Unset
> +${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${T=
UNE_ARCH_32}', d)}
> +TUNE_FEATURES{aarch64} =3D Set
>=20
> this tells us the real issue. The task is changing due to toolchain
> issues. These stamps should be the same and aren't and this is the real
> issue that needs fixing.

To further follow up, there are two issues:

a) the task uses ${B} which for gcc includes HOST_SYS and TARGET_SYS.
We can just set that in the gcc-source recipe to B =3D
"${WORKDIR}/build".

b) the archiver uses:=C2=A0
ARCHIVER_OUTDIR =3D ${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/
which includes TARGET_SYS and between the two different MACHINE values,
this changes  from 'arm-poky-linux-gnueabi' to 'aarch64-poky-linux'.
This leads to the task running twice, once for each multiconfig.

The first is easily solved as I mentioned. The question in the second
case is whether the task should run twice and where the output should
go since it is common to both builds. I do wonder if the archiver
shouldn't set:

ARCHIVER_OUTPUT:pn-gcc-source =3D "${ARCHIVER_TOPDIR}/allarch/${PF}"

Cheers,

Richard



