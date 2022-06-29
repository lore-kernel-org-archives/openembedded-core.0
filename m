Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33BFC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 14:23:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.12044.1656512598614413185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZwtC0ld4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id o16so22764995wra.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=KGbCML1t+4Lbs46AEY/0bZY0y61HyXwPEhfdseTNwD8=;
        b=ZwtC0ld4HnvCx4wT62MGnGwnxCPxXDZAOBSkgrCaEaUIOIdgk1hT49oEOfSIf/tNBS
         I11vLu7CrBuXdRm8dLzeA1gb9I9fePDiTk/BVXpDjfdnR9M4CsjrTg/d0bKQOBVxaTkV
         E05xyYOBlBa8KVl7g/xR7vHcB0PJYmM2pgQnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=KGbCML1t+4Lbs46AEY/0bZY0y61HyXwPEhfdseTNwD8=;
        b=BRSOoI/BwLVUlWIldkm+jwV+B6sQqEXmkz7vx2wAPCPWhCEW7OMwls7RPsNIQdSqRI
         ZC5Cae1fRaqFc1Po5vQ76TM/Dz4tYEI1QOrD6T2TfzdOInpVUI70HFwR6vXA/fj2IE+8
         tk7CrvAm8wGUT4yrocGgmv/3R4LE9Luie1Dx5PWZgsLF8+mcSlSjODlLpHQBjEeiX7nY
         PoRknuDhpGRfIX4XLBlWPS5M+SX5vwzVRF+NmiYONaoVtFN5ph6KNTIoDx13grCN8Hfu
         Pk9Iw3kEtF8nQT5tPLp35HlY555GP59CciooimvxywvE+pqcJhwxeMi6TRvaQRWARcbk
         cwRA==
X-Gm-Message-State: AJIora8gion6vMCnsby8ousqNJ0skNbpOsc7vCXs/8gTLFk+tanZrccz
	KEyt6ySETdKMiqu0Wd6jEHZ0fg==
X-Google-Smtp-Source: 
 AGRyM1v9qSS9W25nVzOS5fxkI0UANRDHVrHnJR9Qnya16JgQ/eFSfEoX5Yk81VeKAJVycSoOCdqeDw==
X-Received: by 2002:adf:f84b:0:b0:21b:8e43:b8ba with SMTP id
 d11-20020adff84b000000b0021b8e43b8bamr3345516wrq.155.1656512596764;
        Wed, 29 Jun 2022 07:23:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7688:b75a:a909:895d?
 ([2001:8b0:aba:5f3c:7688:b75a:a909:895d])
        by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b0039c63f4bce0sm3569981wms.12.2022.06.29.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 07:23:15 -0700 (PDT)
Message-ID: 
 <d0ea870012451b209c23dd76627aceee97530ef1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Add sstate-cache dependency to
 GCCVERSION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Jan Brzezanski <jan.brzezanski@gmail.com>
Date: Wed, 29 Jun 2022 15:23:14 +0100
In-Reply-To: <20220629130830.48974-1-tomasz.dziendzielski@gmail.com>
References: <20220629130830.48974-1-tomasz.dziendzielski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 14:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167378

On Wed, 2022-06-29 at 15:08 +0200, Tomasz Dziendzielski wrote:
> If we have the build with different gcc versions in the same workspace
> it might happen that nativesdk recipe will not detect the change of gcc
> and the package will be taken from sstate-cache. This will lead to
> do_package_qa failure due to binaries requiring symbols that are not
> present in the older libstdc++.
>=20
> Example error:
> > ERROR: nativesdk-mgen-1.0-r0 do_package_qa: QA Issue:
> > /opt/poky/3.2.3/sysroots/x86_64-pokysdk-linux/usr/lib/libssh2pp.so.0.1
> > contained in package nativesdk-mgen requires
> > libstdc++.so.6(GLIBCXX_3.4.11)(64bit), but no providers found in
> > RDEPENDS_nativesdk-mgen? [file-rdeps]
>=20
> Add vardeps dependency to GCCVERSION to make sure the package is rebuild
> with correct gcc version.
>=20
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> ---
>  meta/classes/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index cc02de5f77..da2dc05bba 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -148,6 +148,7 @@ do_fetch[dirs] =3D "${DL_DIR}"
>  do_fetch[file-checksums] =3D "${@bb.fetch.get_checksum_file_list(d)}"
>  do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
>  do_fetch[vardeps] +=3D "SRCREV"
> +do_fetch[vardeps] +=3D "GCCVERSION"
>  do_fetch[network] =3D "1"
>  python base_do_fetch() {
>=20


We're definitely not doing that, it is incorrect on many different
levels (e.g. fetching is not dependent on the target compiler version
just for starters). You also just made all native recipes rebuild for
the target GCC version too, which again, is just wrong.

Building with a different target gcc version should mean all the sstate
checksums change. I'm guessing what has happened in your case is that a
TMPDIR as reused after changing gcc version but something didn't
rebuild, probably as ${S} =3D=3D ${B} and hence ${B} couldn't be cleaned.
We should really track down where the corruption came in and improve
the build output isolation of wherever that came from.

Worse is that your "fix" above probably won't even solve the problem as
if you repeat your build workflow where this broke originally, I'd
strongly suspect it will still break with that change above too.

Cheers,

Richard


