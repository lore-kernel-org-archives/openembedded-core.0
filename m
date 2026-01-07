Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E89D0D170
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 20:14:28 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15768.1767816862844686432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 12:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuwE9Knu;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64669a2ecb5so1576082d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767816862; x=1768421662; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCmDCRnLlP/AHCRvJY4VUK/3Ml3vF0Z/eNMxvokpcdw=;
        b=SuwE9Knu/fyC6uTEgGh5DQ1GsTQGaSt1lLUXnrkFewvqUol281sGYcfUkVriaj0N0C
         eprKJrste3+JVL3zwnJ9hjYRbjrNqSELKZ2pYlCXVbFckdFwuJTwe/WwqxIjWD49L6TQ
         sW/b+1cFdCgKgcF7h9ngu+A11MrRVFISEuCuVYmnccVGFbvs0y0ieWawDpmpvsX8OGVF
         0s5lzIcxdqBKzxOMTaIC2f2x0/H/eHEvPQ1mIWiudJdJwjZWVx6f62JG349SjJRZ8165
         v4rjZOliaMxak9vVoXRQdANCpaBYZzZfUoIl4xmwnpV8P4nldhjlnnKqiC4bHKmqaynj
         A0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767816862; x=1768421662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCmDCRnLlP/AHCRvJY4VUK/3Ml3vF0Z/eNMxvokpcdw=;
        b=sd/YydJYyJSdskprnCCvYzKN2fTvO7Phdax2MsQ48umBQdeOm43thxznSlYAIf2nj6
         VplRbgl4bmkgdgVO2FiyUd8q8QXwG0rvukfFgpP4diFR8ZY2v6Yz8wCbhtvocEYMMUf0
         L04GP6f+F5NQuF7lJw2YK15wgKKiFsAknelyKav0oTvT3srwNNqZT5YVkBrNq9cMDdx9
         a5NCV2i11YLjq3wR3H9A0t1aRB2P4nY4vqVtH5FsycWP200MzjEspRnFxxRxrMP7y13R
         BNAgc2Fjj1lghLLVmW70wXBaDz9cikTT5q4qJmNQHKK10AshUQiJ79zIOdwkURwA4+85
         menQ==
X-Gm-Message-State: AOJu0YyzbuF8TvfPeBiqv1cOLQnMCa9UzStDYYxwAAcSt/Z7f2Z7Zd0S
	LdNGJEjWmWvgEnmTjRdIJ1lLuiARY7KhpJYK/GqQpUcx6gCXmp3LQ0SnZ362K8TCPRgEc9voBvu
	r+ZCA6c2QwZcblZM+cuxUkga9T145eeQ=
X-Gm-Gg: AY/fxX6GbMvVVplOfAX8eU7faOntQTlqbJwEt/axQmHHz/QHEbgEOZKKHyroJMuV1P6
	cjGClH5R67jb1dVkvsgzRXeogMA4aZ5vxl9NrIhnXlf25/k3zfuOTHWHtMjCqG/pB14oz+u1cKi
	QkTap9HVl8wCuivm4+ZcTp9Ty7MEyIwTkJV11YP/xJFojAL+NCYJv8lmrOYssLyAXqLy1AS8sax
	chhqsWGXucyZac2owO2msg/n14ghbRnrcK9egxv/qvWdxZlhb/Ua+GhlVu3d7uANOjiW4wHBEu7
	u4JQ5/hStA==
X-Google-Smtp-Source: AGHT+IF3t1tVp1YlTV/81VUdF7/4vGu/okEKv6mrf/9pqrvFHXLIn3d6C8sBOdgSjPF9JIUswNUBh6TVE8Ds9Xk8gj0=
X-Received: by 2002:a05:690e:12c1:b0:644:7175:813d with SMTP id
 956f58d0204a3-6470d2af9f3mr5578662d50.21.1767816861899; Wed, 07 Jan 2026
 12:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20260107180951.140895-1-stondo@gmail.com> <20260107180951.140895-2-stondo@gmail.com>
In-Reply-To: <20260107180951.140895-2-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 7 Jan 2026 13:14:11 -0700
X-Gm-Features: AQt7F2pMHqQFt1CCgHXM6d6eb14aNgnc39TzJfKw8OzsQ-ahTHAoijV9K1qXWq4
Message-ID: <CAJdd5GboMA67qCKc6g=eOaCJPiCcXEt2S9Gh1tVfqBjbuVe=yA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] spdx30_tasks: Add PURL generation for
 package identification
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 20:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229031

I do plan on implementing this once the PURL spec PR is merged. I
already have a proof of concept:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Djpew/purls&id=3D538c3=
1488e7300a4ad3320e861324a4858a6f148

The "extra" repository URLs that it generates are done terribly ATM
and it needs a few other things to be cleaned up. However, it will
also correctly allow end users to add multiple purls (so they can have
their own PURLs in addition to the Yocto ones).

On Wed, Jan 7, 2026 at 11:10=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add automatic Package URL (PURL) generation according to the Yocto PURL
> specification to enable package identification in vulnerability databases
> and improve NTIA SBOM compliance.
>
> Field added:
> - software_packageUrl: Auto-generates Package URLs per Yocto PURL spec
>   Format: pkg:yocto/<LAYERNAME>/<BPN>@<PV>
>   See: https://github.com/package-url/purl-spec/pull/372
>
> PURL Implementation:
> - Type: yocto (official PURL type for Yocto recipes, per PR #372)
> - Namespace: Layer name from FILE_LAYERNAME variable
> - Name: BPN (base package name with prefixes/suffixes removed)
> - Version: PV (package version from recipe)
> - Normalization: Lowercase per PURL spec
>
> New BitBake variable:
> - SPDX_PACKAGE_URL: Override auto-generated PURL
>
> The Yocto PURL type specification (purl-spec PR #372) has been approved
> by the PURL maintainers and is ready for implementation. This follows
> the agreed format from JPEWdev (Joshua Watt) and petermarko.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index f731a709e3..86430c7008 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -474,6 +474,36 @@ def create_spdx(d):
>          if val:
>              setattr(obj, name, val)
>
> +    def generate_purl(d, package=3DNone):
> +        """
> +        Generate Package URL (purl) for a package according to Yocto PUR=
L spec.
> +        Format: pkg:yocto/<LAYERNAME>/<BPN>@<PV>
> +
> +        See: https://github.com/package-url/purl-spec/pull/372
> +        """
> +        bpn =3D d.getVar("BPN")
> +        pv =3D d.getVar("PV")
> +
> +        # Get layer name using FILE_LAYERNAME
> +        # This is the correct variable that contains the layer name from=
 BBFILE_COLLECTIONS
> +        # (BBFILE_COLLECTIONS itself is not available outside of layer.c=
onf)
> +        layer =3D d.getVar("FILE_LAYERNAME")
> +
> +        if not layer:
> +            layer =3D "core"  # Default to core if layer detection fails
> +
> +        # For sub-packages, use BPN (base package name)
> +        # Per spec: BPN has prefixes/suffixes removed
> +        name =3D bpn
> +
> +        # Normalize name per PURL spec (lowercase only)
> +        # Note: Underscores are not allowed in recipe names
> +        name =3D name.lower()
> +
> +        purl =3D f"pkg:yocto/{layer}/{name}@{pv}"
> +
> +        return purl
> +
>      license_data =3D oe.spdx_common.load_spdx_license_data(d)
>
>      deploydir =3D Path(d.getVar("SPDXDEPLOY"))
> @@ -646,6 +676,10 @@ def create_spdx(d):
>                      "software_packageUrl",
>                      package=3Dpackage
>                  )
> +            else:
> +                # Auto-generate PURL if not manually specified
> +                auto_purl =3D generate_purl(d, package)
> +                spdx_package.software_packageUrl =3D auto_purl
>
>              pkg_objset.new_scoped_relationship(
>                  [oe.sbom30.get_element_link_id(build)],
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229021): https://lists.openembedded.org/g/openembedde=
d-core/message/229021
> Mute This Topic: https://lists.openembedded.org/mt/117138938/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

