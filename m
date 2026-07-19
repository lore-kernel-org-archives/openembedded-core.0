Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B58C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 12:45:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4552.1784465127430495627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 05:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y4mZUGBd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49558ce01afso3578195e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784465125; x=1785069925; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsJYHz53x01SGTQ2mk9Ay69bdZPFW1KsJ8mtmIlh/RE=;
        b=Y4mZUGBd7nbVeRN2wdWz4NS0zsFCsOfwsS0lNobk3kUjBuQFfs9pvIbmAMVbScFdWj
         eoFwYlPtyJajCmAAts5gMiRKjvPL79VSHgLaTusePCIdxeH6e0Mk4XsAPUnr2ghWHeFL
         P+pCIASlM8gZHZF853ExlUgSGt0BSAxHKDOso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465125; x=1785069925;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsJYHz53x01SGTQ2mk9Ay69bdZPFW1KsJ8mtmIlh/RE=;
        b=g5Bx0MidY+iPMU5lwM7Qo0MLR1A+gm/+2rw2Va2M77lc34rURsRrFlnk5O3rWeaHPl
         lvkZlN6k4LU63zIVSOxZ3K6YEOrPNK71WLlGvbIGjchRNutzkxBK04010740+if/ZaJj
         fb8+XmxXiOubX6ma2J7/TUlfNkPy3aFTm3iDQ1XrHG1kt4qfZ+XLbWDfuE8FRQMy9OSe
         dbtviXyEyEwrUrsN0+8Xq50S0jNxa/VqMi+qBAKyumYUvrwkxBomAOJW82JIk4x70GZZ
         1CfDTEJLNBOsE1Y8c796uw3yAQmJBIoZtubqOChRLvWkvJX+FkVBpkl7R3GEtAf/lZ2e
         2qYg==
X-Forwarded-Encrypted: i=1; AHgh+RpVsnjTtdBrDMJrzpdamGmJVyh6Gx5dx91qAUwrJ5BvyayxzIX1sgDBq6zX0kyncbHbftym9PB6totBU2PSeugz3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCCumUTFnVsQAF6k8+94NKjcBCfwBl//RABIFnh4e1PK8oAM+g
	S+VdnfIAeEs0Tf+4WVt894AHKkGyS8Q/60CymmWQ7HQrkBI7LYcA1zMQ4f+W0j10lBI=
X-Gm-Gg: AfdE7clb+o5Mr2sGaNNbXyFjl2rXO2w6890an10/EAHegc3wI+runxPGXKwqYEaKI4c
	tfWORbrKM/fjrZwQq8NqXqsC8TKt6agcA+DNHvHjq1AXnNDDFHIApSvPICch6psKAM+vFk27gad
	pxxNUNP4jni9aLmOfbFV8rU3H1xihuQey7BAj2Bkf2oNBUx2OGMq15ah8270xzBix97kfZKGPqF
	NqzQb7n00YplaZQzYqepR+eVPn1nNW4yaYDzbId59Sys3sCzhVuKEuznyA9KPaoCD8pOyf3FX8C
	Idye3kRAVD/qWo0vrbGlLr0v12KosAzHJYDgLpYRj9cHbU4fGebyZpmWs2v7ZFWpDgrZABrVZCa
	T1lgRqoZb4XJ32ttYtYU1l4aSjmbVWhW/0b474Mmtk/eKSNO28U39SVcjGnQzRtWdsp5x7CwaeX
	cnYZSMq4OBpUpfwHoBin7qQjWm0czJWwNloMZdmHUEu41q3CQ/mLa9BT+00gkXcJMU
X-Received: by 2002:a05:600c:4689:b0:495:4b56:f127 with SMTP id 5b1f17b1804b1-4954b56f1d0mr107265275e9.25.1784465125508;
        Sun, 19 Jul 2026 05:45:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f295:f98:ef6a:b332? ([2001:8b0:aba:5f3c:f295:f98:ef6a:b332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e850dsm216527175e9.9.2026.07.19.05.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:45:24 -0700 (PDT)
Message-ID: <5264b6f4e9fd67af614651187d0a1c96b8158993.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 00/25] Rework LICENSE to be SPDX License
 Expressions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, JPEWhacker@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Sun, 19 Jul 2026 13:45:21 +0100
In-Reply-To: <DK0ZPVXMPKPY.2MGH4LE6B96SB@bootlin.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
	 <20260715164739.364323-1-JPEWhacker@gmail.com>
	 <DK0ZPVXMPKPY.2MGH4LE6B96SB@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 12:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241283

On Fri, 2026-07-17 at 18:34 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Wed Jul 15, 2026 at 6:44 PM CEST, Joshua Watt via lists.openembedded.o=
rg wrote:
> > Reworks the way that the LICENSE variable is used so that it uses valid
> > SPDX License Expressions instead of the custom expressions that were
> > used previously (which are based on Python syntax). This includes
> > support for the SPDX "WITH" operator which allows a license exception t=
o
> > be attached to a license identifier.
> >=20
> > The old licenses expressions are still allowed, and will still be
> > correctly parsed, however a warning will be issued that indicates the
> > new license string that should be used.
> >=20
> > Most layers should be able to use the newly-revised
> > scripts/contrib/convert-spdx-licenses.py script to do the majority of
> > the conversion work, although some manual work may still be required if
> > conditional or complex LICENSE expressions are encountered.
> >=20
> > SPDX License Expressions require that all licenses listed are either a
> > known identifier (e.g. "GPL-2.0-or-later") or start with the prefix
> > "LicenseRef-" which indicates a custom license. When converting from ol=
d
> > expressions to new one this will need to be followed (the suggested new
> > license in the warning and the conversion script will automatically add
> > this prefix for any unrecognized license identifiers). This will most
> > commonly be the case for NO_GENERIC_LICENSE files; for a good example o=
f
> > what needs to be done here see the changes to the linux-firmware recipe=
.
> > When adding new LicenseRef- licenses to a recipe, the actual license
> > name should be prefixed with the name of the recipe (e.g.
> > "LicenseRef-myrecipe-mylicense") to prevent conflicts when merging
> > multiple license documents together (e.g. in an image).
> >=20
> > SPDX also introduces the "WITH" operator to add an exception to a
> > license instead of using a bespoke identifier to combine the two, as wa=
s
> > done with the legacy license expressions. Because of this, the logic fo=
r
> > dealing with the INCOMPATIBLE_LICENSE family of variables has changed
> > slightly. The main difference is that INCOMPATIBLE_LICENSE will now
> > match the LHS of a "WITH" expression (where as previously this was
> > "ignored" since it was a bespoke license ID). In order to allow a
> > license that would normally be rejected, but can be allowed with an
> > exception, specifically allowed exceptions can be added to the
> > INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS here
> > means "exceptions to INCOMPATIBLE_LICENSES", not specifically SPDX
> > License Exceptions). If an SPDX exception is present here, any license
> > that has that exception will be allowed, even if it would normally matc=
h
> > INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for
> > those with the GCC exception, use:
> >=20
> > =C2=A0=C2=A0=C2=A0 INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0*"
> > =C2=A0=C2=A0=C2=A0 INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "GCC-exception-3=
.1" # This new line is required
> >=20
> >=20
> > Additionally, "PD" ("Public Domain") is not allowed as a generic licens=
e
> > identifier. Aside from "PD" not being a valid SPDX License Identifier,
> > most "Public Domain" licenses do have some sort of text associated with
> > them (see the HPND family of SPDX Licenses, or use the (SPDX License
> > Match Website)[1] ). In addition, the meaning of "Public Domain" can va=
ry
> > by jurisdiction, so the actual text with a LicenseRef- or a SPDX Licens=
e
> > Identifier needs to be used instead.
> >=20
> > Finally, "CLOSED" is also no longer allowed as a license expression
> > (since it is not a valid SPDX License Identifier). Instead use a
> > LicenseRef- to point to a file that contains the actual license text
> > (usually something like "Copyright <name>, all rights reserved")
> >=20
> > [1]: https://tools.spdx.org/app/check_license/
> >=20
> > V2: Fix errors found while testing
> >=20
> > Joshua Watt (25):
> > =C2=A0 scripts/pull-spdx-licenses.py: Add exceptions
> > =C2=A0 Add SPDX License Exceptions
> > =C2=A0 Add SPDX license library
> > =C2=A0 Parse LICENSE as SPDX Expression
> > =C2=A0 linux-firmware: Convert to SPDX license strings
> > =C2=A0 meta-selftest: Add NO_GENERIC_LICENSE
> > =C2=A0 convert-spdx-licenses: Convert to valid SPDX expressions
> > =C2=A0 gcc-common.inc: Remove LICENSE
> > =C2=A0 gcc: Update license
> > =C2=A0 xz: Replace deprecated SPDX identifier
> > =C2=A0 autoconf-archive: Replace deprecated SPDX identifier
> > =C2=A0 gnu-config: Replace deprecated SPDX identifier
> > =C2=A0 libglvnd: Replace deprecated SPDX identifier
> > =C2=A0 flac: Replace deprecated SPDX identifier
> > =C2=A0 libgit2: Replace deprecated SPDX identifier
> > =C2=A0 Fix up licenses
> > =C2=A0 lib: oe: license: Rework package licenses matching
> > =C2=A0 classes/go-mod-update-modules: Switch to SPDX license
> > =C2=A0 license: Remove tidy_licenses()
> > =C2=A0 meta-selftest: Change license on test recipes
> > =C2=A0 Convert licenses to SPDX expressions
> > =C2=A0 meta-selftest: libxpm: Fix license
> > =C2=A0 lib: oe: sbom30: Handle None in Relationship
> > =C2=A0 oeqa: selftest: bbtest: Fix license exception
> > =C2=A0 scripts/contrib: Add reuse-get-license.py
> >=20
>=20
> Hi Joshua,
>=20
> Thanks for the v2. It looks like now we have
> layerappend.LayerAppendTests.test_layer_appends failing:
>=20
> 2026-07-17 13:41:58,606 - oe-selftest - INFO - layerappend.LayerAppendTes=
ts.test_layer_appends (subunit.RemotedTestCase)
> 2026-07-17 13:41:58,613 - oe-selftest - INFO -=C2=A0 ... FAIL
> ...
> ERROR: layerappendtest-1.0-r0 do_package_qa: Error executing a python fun=
ction in exec_func_python() autogenerated:

I have a patch in master-next for this issue which I'll send out.

Cheers,

Richard


