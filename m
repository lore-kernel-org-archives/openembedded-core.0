Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70080D729E7
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 15:05:35 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.117495.1732892729505504632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 07:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JEEczEZg;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fc2b84bc60so1195734a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 07:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732892729; x=1733497529; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4UoKcCJFQnlu/suMOg+m6FiNRhPIxIgtevLS8cwncyI=;
        b=JEEczEZgy4EN+Hhf6gHdQTgN1qxDHlzSdzHLqR4cc3o4ubso02MQXPCz3jBOBZ1t+i
         GuxqwH6XGsA7rrvxUsLppyzbmJ/CuZ5rk/9a/pciGbJRIWaNq8U3TLTdKz54dYP3oGON
         4th9jMdCp1QfgIgU2Wx/15tfVCBV+PN2XevYNCWD4v/wZ295gcET2V3s1+39pra+XVR5
         6P42jEBNR/Sdxr+IKqcN0m2RLiIHfKf6IKHPQ2wQuBFavX8m5zwxuQILQ5ZEA9WHz0J7
         daWQ0ClDu0Lj1K8SUbJ4BxPB3cfpbZgaNm3Q4Of4khnv1genvUM8ZUF5YKmDMbfv9ON3
         8nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732892729; x=1733497529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UoKcCJFQnlu/suMOg+m6FiNRhPIxIgtevLS8cwncyI=;
        b=dywuXzGHX+Lij3OesOPks9rinRgjnCV8kmVQdUzDHyxEGzCz68e9+im/Vj9xxHU2dK
         /AeqAQKqm+gVqwZ3M/T4Jue3ybFDnGfNKB2EpC+o6kawjefw7VMXemqGWodClzZUvcRi
         n7RyLX/kE+S9/gVMkpvTJ2ArhimoTHIwUsZecQ2AlZxnqRCjbF6H4geyNV0SCtRJGtqF
         nylSMq1CUd3BGwNrQaBzx8fr9Yi1rQDZGSqXKPkJtaKm789Cf5kYauIdx/e7Ck+vV7nV
         qsnbzTCrz/QQTr1ihdqKYkkPEWreaWIGFMAZark4Uma4hjJxRHEZ1HfaOSRPrw2F5bl8
         QAjQ==
X-Gm-Message-State: AOJu0Yx7bBLlsoGpGXXfC4HPmfhEZl+rvvQw7Crm6wz2EdUo8/1UicL1
	3Gi6WSRAFj2RzYJEhyVo2sY2HGcv1P8BWoLtGzX76gR90ygtisznm9J2bxcnAkiNhTnqsWr13jJ
	OyNdo1WNnTfXdACrKkVBRYjoUGDM=
X-Gm-Gg: ASbGncuMH27GD+M94pBbfh2UEupL4MhQPph8487ZgPySHc+1QWM4Zr+ky78Z0LI5Pnp
	7Cbw1fri1QT/n+ssGaSwIr1KitIyRr2V87A==
X-Google-Smtp-Source: AGHT+IGVekBtpTXsPUDQJp8NBbs2xg6Sfc8aENNjPonSv6iUTFPpeTwN3MOkWCqNAWwv+e1HRhBpfJtEFDQ5x3SNoVI=
X-Received: by 2002:a17:90b:1e0f:b0:2ea:8e42:c40 with SMTP id
 98e67ed59e1d1-2ee097dce17mr13238741a91.31.1732892728440; Fri, 29 Nov 2024
 07:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20241127125945.3211089-1-colinmca242@gmail.com>
 <CAApg2=QjL7XBPbBU0tP7T_hO2OVTudzDf3u+2zJh9GVS3gXKoQ@mail.gmail.com> <CAAyLwgTtg4ykNN9sY91P-CfX2=BeXiXevHu_TyzFaT5=SUbt8w@mail.gmail.com>
In-Reply-To: <CAAyLwgTtg4ykNN9sY91P-CfX2=BeXiXevHu_TyzFaT5=SUbt8w@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 29 Nov 2024 16:05:17 +0100
Message-ID: <CAApg2=Q_vk6XNB2T_OLWLZ_hXgPMDuFR=7jdmBeRbNvsTAHjrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
To: Colin <colinmca242@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008348ef06280e87a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 15:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208023

--0000000000008348ef06280e87a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 3:02=E2=80=AFPM Colin <colinmca242@gmail.com> wrote=
:

> Hi,
>
>
> I would like to use the vector string to do some analysis
> and prioritization of CVEs and have
> found that the vector string is better than using the CVSS score. I would
> argue that in
> embedded contexts, the environment that a device is used in will result i=
n
> a different scoring
> of the vector. The most easy example is a standalone device that does not
> have any network
> connections will likely prioritize physical over network attacks, which I
> believe is opposite to
> how the CVSS score is determined.
>
> I would like for the vector string to be included in the outputs so it is
> also cached. Post-build
> tooling could use the NIST API to pull down the vector string, but I woul=
d
> like to avoid hitting
> the API for what I imagine are the same reasons caching is already done
> for cve-check.
>
> As others have noted in this thread, the NIST API has been rather
> unreliable lately. I agree
> that the fetch is likely what is failing the build, since I had to bump
> the database filename to
> refresh the contents with the correct vector string. I didn't
> test_image_json locally, but I did
> run builds that included fetching the nvd database and everything seemed
> to have been
> working.
>
>
Hello,
I'm not totally convinced by the fact that having the vector will avoid you
getting the complete entry.
What is the database if what is needed for the analysis. CVSS scores are a
little an exception here.
If we want to change the database format, I think it might make sense to
add ALL the vector strings
and not only the last one. That makes way more sense for interpretation
purposes and allows you
compare entries that have multiple vectors.

That being said, NVD entries often have multiple vectors - one from the
vendor issuing the CVE,
one from the NVD and so on. They often differ quite a bit, and those days
there might be other
assignments too. For such an analysis I would rather use the raw CVE
database instead.

Please note that we keep NVD for now because of the CPEs. Product names in
the CVE database
are not always set correctly (also, the vector is not always set). For all
more complete analysis I
use CVE that is available as a simple repository at
https://github.com/CVEProject/cvelistV5

Kind regards,
Marta

--0000000000008348ef06280e87a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Nov 29, 2024 at 3:02=E2=80=AFPM Colin=
 &lt;<a href=3D"mailto:colinmca242@gmail.com">colinmca242@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><div>Hi,</div><div><p style=3D"margin:0px;font-stretch:normal=
;font-size:11px;line-height:normal;font-family:Menlo;font-size-adjust:none;=
font-kerning:auto;font-variant-alternates:normal;font-variant-ligatures:nor=
mal;font-variant-numeric:normal;font-variant-east-asian:normal;font-feature=
-settings:normal;color:rgb(0,0,0)"><br></p></div><div>I would like to use t=
he=C2=A0vector string to do some analysis and=C2=A0prioritization of CVEs a=
nd have</div><div>found that the vector string is better than using the CVS=
S score. I would argue that in</div><div>embedded contexts, the environment=
 that a device is used in will result in a different scoring</div><div>of t=
he vector. The most easy example is a standalone device that does not have =
any network</div><div>connections will likely=C2=A0prioritize physical over=
 network attacks, which I believe is opposite to</div><div>how the CVSS sco=
re is determined.</div><div><br></div><div><div>I would like for the vector=
 string to be included in the outputs so it is also cached. Post-build</div=
><div>tooling could use the NIST API to pull down the vector string, but I =
would like to avoid hitting</div><div>the API for what=C2=A0I=C2=A0imagine =
are the same reasons caching is already done for cve-check.</div></div><div=
><br></div><div>As others have noted in this thread, the NIST API has been =
rather unreliable lately. I agree</div><div>that the fetch is likely what i=
s failing the build, since I had to bump the database filename to</div><div=
>refresh the=C2=A0contents with the=C2=A0correct vector string. I didn&#39;=
t test_image_json locally, but I did</div><div>run builds that included fet=
ching the nvd database and everything seemed to have been</div><div>working=
.</div></div><br></div></blockquote><div><br></div><div><div>Hello,</div><d=
iv>I&#39;m not totally convinced by the fact that having the vector will av=
oid you getting the complete entry.</div><div>What is the database if what =
is needed for the analysis. CVSS scores are a little an exception here.</di=
v><div>If we want to change the database format, I think it might make sens=
e to add ALL the vector strings</div><div>and not only the last one. That m=
akes way more sense for interpretation purposes and allows you</div><div>co=
mpare entries that have multiple vectors.</div><div><br></div><div>That bei=
ng said, NVD entries often have multiple vectors - one from the vendor issu=
ing the CVE,</div><div>one from the NVD and so on. They often differ quite =
a bit, and those days there might be other</div><div>assignments too. For s=
uch an analysis I would rather use the raw CVE database instead.</div><div>=
<br></div><div>Please note that we keep NVD for now because of the CPEs. Pr=
oduct names in the CVE database</div><div>are not always set correctly (als=
o, the vector is not always set). For all more complete analysis I</div><di=
v>use CVE that is available as a simple repository at <a href=3D"https://gi=
thub.com/CVEProject/cvelistV5">https://github.com/CVEProject/cvelistV5</a><=
/div><div><br></div><div>Kind regards,</div><div>Marta</div>=C2=A0</div></d=
iv></div>

--0000000000008348ef06280e87a3--

