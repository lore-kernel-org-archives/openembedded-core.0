Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9456EC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 09:16:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.27470.1683623805342516320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 02:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Mm4+y7ZM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f42711865eso12220715e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683623804; x=1686215804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jreMB1RtqyCBfZhrLKjzTkiWt8UGtb61KzUgyxoNlKA=;
        b=Mm4+y7ZM2UNiyiU37Z8s24L5jg9SSzwlwc7dVCMzk7wEPw7vehRJ2s4RKQ0Cra+kN5
         LvNObRHqEp7YSeLB34Vjm7GpgrpfkaqOghkE7jqRKKBqG/9CttGG1IX6q0pbxX8VT32K
         YVlwTWFQVo2RaV6d9YUw+BvHDDlT0UCGfEsNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623804; x=1686215804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jreMB1RtqyCBfZhrLKjzTkiWt8UGtb61KzUgyxoNlKA=;
        b=AcqlwiHqeUUC8mrgWZ6em0tjxRqHK691zIZsivovOehyckc9v2VDPiCa48ULR36IuD
         Q9O2kevuI1MFROfanM3J57Tsts2LvAvdCjgqOFY7Owk0wYe1wpZNOfLdYgBs4HyjmNXl
         FZN5ZFv8FENpHsCVwqreQu8qcJBTv4O2jKaj5bVewP4cfkHxgGngvAOCYhsFhgtd23+a
         3aSTxr7GVjGCMNSxjebMj/lTARbwnYoLKBFAATQtjCMqXnwVaAe9LDR9Z1LaWu6hOtMo
         2tnZ5swUgGqzeah7/3Hmjuoxc3Uy1r4jFHSimdtCoI9UY1t4mED3UcQjOm7INZRj5x1B
         hswg==
X-Gm-Message-State: AC+VfDwESP0c1/+8LHRHtTaabUpH+pRJ+Wi96pZKTWgMowGO+3AO3tEA
	e0twV39xf7haZlfXaSJJ7MoJvg==
X-Google-Smtp-Source: ACHHUZ4xG0gmU6M/LH8burixBpSKJDgkOE96bb0RVxpcct37HctPW5TKweJpsJQJvQTonLvZHaZeFw==
X-Received: by 2002:a1c:7507:0:b0:3f1:9acf:8682 with SMTP id o7-20020a1c7507000000b003f19acf8682mr8325836wmc.17.1683623803710;
        Tue, 09 May 2023 02:16:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3fe4:180c:477:99f? ([2001:8b0:aba:5f3c:3fe4:180c:477:99f])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c021000b003f198dfbbfcsm19195371wmi.19.2023.05.09.02.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:16:43 -0700 (PDT)
Message-ID: <44ad00167f03b420a0c29df1996062a36ca56a38.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>, "adrian.freihofer@gmail.com"
	 <adrian.freihofer@gmail.com>
Cc: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 May 2023 10:16:42 +0100
In-Reply-To: <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
	 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
	 <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
	 <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
	 <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181037

On Tue, 2023-05-09 at 09:02 +0000, Ross Burton wrote:
> On 8 May 2023, at 09:57, Adrian Freihofer via lists.openembedded.org <adr=
ian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
> > The patch from Andrej tries to solves a real issue: The CVE checker
> > distinguishes between two types of patches. Ignored (=3D not applicable=
)
> > and patched. Patching is only supported by adding a real patch file to
> > the SRC_URI. However, there are other ways a patch can be implemented.
> > For example, a recipe that uses the git fetcher would update the git
> > hash to a commit that contains a fix instead of applying a patch file
> > to the recipe.
> >=20
> > But I fully agree that the comment (originally suggested by me when
> > Andrej and I were discussing the solution) is bad. Maybe it should read
> > as follows:
> >=20
> > Normally, a CVE is treated as patched when a patch with the name of the
> > CVE is applied. CVE_CHECK_PATCHED allows to extend the list of patched
> > CVEs without adding a patch file to SRC_URI.
> >=20
> > Regarding the SBOM: It is important for customers that the CVEs of a
> > product with SBOM can be correctly identified as repaired or as
> > ignored. However, I'm not sure if the SBOM part is properly addressed
> > by the patch. The create-spdx.bbclass uses the function
> > oe.cve_check.get_patched_cves(d) which should probably handle the new
> > variable as well. We will check that and come up with a V2.
>=20
> So I=E2=80=99d suggest we deprecate CVE_CHECK_IGNORE and add a new, more
> flexible, variable instead.
>=20
> How about a CVE_STATUS, which doesn=E2=80=99t have a direct value but has
> flags for each CVE:
>=20
> # We moved to a git SHA that incorporates the fix
> CVE_STATUS[CVE-1234=E2=80=930001] =3D =E2=80=9CPatched=E2=80=9D
>=20
> # We disabled frobnicate
> CVE_STATUS[CVE-1234-0002] =3D =E2=80=9CPatched=E2=80=9D
>=20
> # This is Windows-specific
> CVE_STATUS[CVE-1234-0003=E2=80=9D =3D =E2=80=9CNot Applicable=E2=80=9D
>=20
> I=E2=80=99m not sure of the exact list of values the flags should accept
> beyond =E2=80=9Cpatched=E2=80=9D and =E2=80=9Cnot applicable=E2=80=9D. Th=
ere probably does need to be
> a =E2=80=9Creviewed and don=E2=80=99t consider this a problem=E2=80=9D wh=
ich feels like
> =E2=80=98ignored=E2=80=99 but I=E2=80=99m not a fan of that precise word.
>=20
> Is there any defined language that we can simply adopt?

The question is probably what actions might someone want to take? We
might want to separate out "N/A - configuration disabled" from "N/A -
OS mismatch" and "CPE incorrect" for example?

The reason being that someone would then know to look at things more
closely if they were changing configuration, or building windows
binaries?

Given we already put fairly robust reasoning in comments already,
should we capture that in a variable too?

CVS_STATUS_REASONING[[CVE-1234-0003] =3D "issue only applies on windows"

Cheers,

Richard (thinking out loud)



