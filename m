Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAC4C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 10:43:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.25590.1654857806949883524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 03:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UBq0W639;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 i131-20020a1c3b89000000b0039c6fd897b4so453266wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=TNs9vBeX8Lg8zkvwGppz/AQ3S3+V5ysxxlQXz0nmHYU=;
        b=UBq0W639WAca8w9ejH9lMpdGeR66JaLWRRlKh15aPI1LCNIgCouWNf6DzuDhAOGJqT
         fLeEOEj0C0AoyeioubRNe+MPc3IPYKCmwnIHCVl5P717rCk81nOSI8wpTx3Stuw/d3kc
         m13zRF7xsK3BDfRh/Z2f4d+XyhpYkBhDbggCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=TNs9vBeX8Lg8zkvwGppz/AQ3S3+V5ysxxlQXz0nmHYU=;
        b=x3jrrcoeHINLI3qnFDdpgtRVCtfgnfFVDuIy+H6DbzWFh0q5+X8S+hANDxkhgzdMda
         kEQrOVA1/V+1KXUWPfVsp8OcLbVupe8qdHfya4q8Y3387jzh7gikWn80GAr3jzY6jmrr
         k9gBnc6ErhXBt4qXc9ePVpgpMvR5254171DGxb0FkTQineefas7o+hg1ga03SVY/FB0a
         vrElzJlyWLcHktvbCx0jm09k6rHltnmgLnqNd29HKdvRg8EtIug1A+QKhpej+pmJoSBG
         YaiyzwPKtka3Iyafv9XtJcO4FXNFxGt0IYGqn+znU3eVWOikW7eT502CiHqD2eXtY32o
         1zkg==
X-Gm-Message-State: AOAM531dzZbI3mxY6ppLVDFNcsxt9SE3TXxZVlH8+yJhBw5luzgkHzIr
	IahbEhJ/hPxjY2A7g6PK5rlsDA==
X-Google-Smtp-Source: 
 ABdhPJxqlbFz8j3X1CSUR8g1bgaIy2bsJcYSzHOD45HZlUYLFvk+97UK+a4dR1bXnVGO08tNMfIeuQ==
X-Received: by 2002:a05:600c:3ca8:b0:397:87e:d643 with SMTP id
 bg40-20020a05600c3ca800b00397087ed643mr8224258wmb.173.1654857805392;
        Fri, 10 Jun 2022 03:43:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9?
 ([2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9])
        by smtp.gmail.com with ESMTPSA id
 c10-20020a056000184a00b0021033caa332sm31085399wri.42.2022.06.10.03.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:43:24 -0700 (PDT)
Message-ID: 
 <eba8015849549cf06ed351ac4db5af382cd45e5a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] archiver: avoid race conditions when using
 multiconfig and sharing the same TMPDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Fri, 10 Jun 2022 11:43:23 +0100
In-Reply-To: <20220609163907.40205-1-jose.quaresma@foundries.io>
References: <20220609163907.40205-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 10:43:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166795

On Thu, 2022-06-09 at 17:39 +0100, Jose Quaresma wrote:
> The archiver doesn't support using multiconfig sharing the same TMPDIR.
> When in the multiconfig and using the same TMPDIR: the two machines can m=
ake
> the same copy at the same time to the same destination, which will not wo=
rk.
>=20
> This issiue can be replicated with meta-ti layer:
> > # use a multiconfig machine
> > MACHINE =3D "am64xx-evm"
> > # archive sources for target recipes in conf/local.conf
> > INHERIT +=3D "archiver"
> > COPYLEFT_RECIPE_TYPES =3D "target"
> > ARCHIVER_MODE[src] =3D "original"
> > ARCHIVER_MODE[diff] =3D "1"
> > # and run bitbake with:
> > bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_unpack_and_pa=
tch -f
>=20

I went digging. If I enable this as above (using master) and run

$ bitbake mc:k3r5:gcc-source-12.1.0 gcc-source-12.1.0 -c do_unpack_and_patc=
h -S none

then:

$ bitbake-diffsigs tmp/stamps/work-shared/gcc-12.1.0-r0.do_unpack_and_patch=
.sigdata.*
NOTE: Starting bitbake server...
Task dependencies changed from:
['ABIEXTENSION', 'ARCHIVER_MODE[diff-exclude]', 'ARCHIVER_MODE[diff]', 'ARC=
HIVER_MODE[src]', 'ARCHIVER_OUTDIR', 'ARCHIVER_TOPDIR', 'ARCHIVER_WORKDIR',=
 'B', 'BASEURI', 'EXTENDPE', 'GNU_MIRROR', 'HOST_ARCH', 'HOST_OS', 'HOST_SY=
S', 'HOST_VENDOR', 'INSANE_SKIP', 'LIBCEXTENSION', 'PATCHTOOL', 'PE', 'PF',=
 'PN', 'PR', 'PV', 'RECIPE_SYSROOT_NATIVE', 'S', 'SDE_DIR', 'SDE_FILE', 'SO=
URCEDIR', 'SRC_URI', 'SRC_URI[sha256sum]', 'STAGING_DIR_NATIVE', 'T', 'TARG=
ET_ARCH', 'TARGET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TUNE_ARCH', 'UNPACK_=
DIR', 'base_do_unpack', 'base_do_unpack[cleandirs]', 'create_diff_gz', 'cre=
ate_source_date_epoch_stamp', 'do_patch', 'do_qa_patch', 'do_qa_unpack', 'd=
o_unpack', 'do_unpack[cleandirs]', 'is_work_shared', 'patch_do_patch', 'src=
_patches', 'unpack_check_src_uri']
to:
['ABIEXTENSION', 'ABIEXTENSION_32', 'ABIEXTENSION_64', 'ARCHIVER_MODE[diff-=
exclude]', 'ARCHIVER_MODE[diff]', 'ARCHIVER_MODE[src]', 'ARCHIVER_OUTDIR', =
'ARCHIVER_TOPDIR', 'ARCHIVER_WORKDIR', 'ARMPKGSFX_ENDIAN_64', 'B', 'BASEURI=
', 'EXTENDPE', 'GNU_MIRROR', 'HOST_ARCH', 'HOST_OS', 'HOST_SYS', 'HOST_VEND=
OR', 'INSANE_SKIP', 'LIBCEXTENSION', 'PATCHTOOL', 'PE', 'PF', 'PN', 'PR', '=
PV', 'RECIPE_SYSROOT_NATIVE', 'S', 'SDE_DIR', 'SDE_FILE', 'SOURCEDIR', 'SRC=
_URI', 'SRC_URI[sha256sum]', 'STAGING_DIR_NATIVE', 'T', 'TARGET_ARCH', 'TAR=
GET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TUNE_ARCH', 'TUNE_ARCH_32', 'TUNE_=
ARCH_64', 'UNPACK_DIR', 'base_do_unpack', 'base_do_unpack[cleandirs]', 'cre=
ate_diff_gz', 'create_source_date_epoch_stamp', 'do_patch', 'do_qa_patch', =
'do_qa_unpack', 'do_unpack', 'do_unpack[cleandirs]', 'is_work_shared', 'pat=
ch_do_patch', 'src_patches', 'unpack_check_src_uri']
basehash changed from 005580a7a5a1ab1ff554d0a9e47c2ad4ba932f3fe185d8d349b06=
c83e5e58b6c to d7b2e696005a578d5958ef4e73f1fc83e22612a3ae4294fb0540b0fadcb6=
c50f
List of dependencies for variable ABIEXTENSION changed from 'set()' to '{'A=
BIEXTENSION_64', 'ABIEXTENSION_32'}'
List of dependencies for variable TUNE_ARCH changed from 'set()' to '{'TUNE=
_ARCH_32', 'TUNE_ARCH_64'}'
Dependency on variable ABIEXTENSION_32 was added
Dependency on variable ABIEXTENSION_64 was added
Dependency on variable ARMPKGSFX_ENDIAN_64 was added
Dependency on variable TUNE_ARCH_32 was added
Dependency on variable TUNE_ARCH_64 was added
Variable ABIEXTENSION value changed:
@@ -1 +1,2 @@
-eabi
+${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${=
ABIEXTENSION_32}', d)}
+TUNE_FEATURES{aarch64} =3D Set
Variable TUNE_ARCH value changed:
@@ -1,2 +1,2 @@
-${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}
-TUNE_FEATURES{bigendian} =3D Unset
+${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUN=
E_ARCH_32}', d)}
+TUNE_FEATURES{aarch64} =3D Set

this tells us the real issue. The task is changing due to toolchain
issues. These stamps should be the same and aren't and this is the real
issue that needs fixing.

Cheers,

Richard


