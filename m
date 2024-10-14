Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5D3CF2576
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:34:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.51863.1728902044898298905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UolJ1Lrc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4311bb9d4beso25756405e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728902043; x=1729506843; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofFGCoeNx8N/ccxDEKz7As2HQN9sm5IPJgCTsLt1clQ=;
        b=UolJ1Lrc7tDaS/3/btyDx+0NYj2J3RX/VtHS74tsTrucyOrvtvVLoLe9l1oKv36KC0
         dVsFUIh3hoJ8A/Ulrw1WBF4jFT/QCKeH+yhcDoeIYSgmE5i+jSjEMKfRKNU8c/A67m+0
         opcnVauq14yhOfet0LATqrXtRVLO2BdD04EcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902043; x=1729506843;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofFGCoeNx8N/ccxDEKz7As2HQN9sm5IPJgCTsLt1clQ=;
        b=wW2gKU0rY4A/x/jjmBeo7DnO4r1zhJPBQ8T9rFeDsYa5QJeIWTZCH+NCpY6C5jEv4f
         KCQ4iX65FoYdba8535De0qHLJXFWDMpSVMYuLFRRsAEgy4JwuIMsi3OgWXXepUovz+xT
         Rf16CKihmj1toe1u19hGVP2XkM/HOOQTvmeDarY6Qicxw79/c2PAu7cP85NoeCN7xbce
         KaoAlWWQJ40uqws3IdOYs/xnIk+Oy7u9Uv1x6Pcv8wee2eb5Wr9WopVEP9AGGRIifQBu
         5AE1KcQSzv72BVG9K7SwmUGV2cb7rtW8DIPv/zdAhhZG+5N/j0D25sAAO6svCpLuwLol
         kRfw==
X-Forwarded-Encrypted: i=1; AJvYcCXmDCMTq0JO105U/kup8lpoaTT5lDbHKlMatYzK1aCnjH2BB6Hlo4yCEbSjIymwgMp2oXsRIKPPqFvUffo9FrwQhw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjoKpS+pfT/ZF7qHclLlSfhwaeDMxCo6e+3BIPuoAE11QvBIGO
	vyU8TLv913GenHFe9qgZhjNToDRse6K/TyeIdi4QCUKXRJ2HeLX2AmhgbsazhFU=
X-Google-Smtp-Source: AGHT+IGtOjXdAxsfpbDx60h4Y3r8a+S4dlPm3Gj0Hz1CKU6cEhV/VUG1PX6iDz1uQ1v2DXw1uowFXg==
X-Received: by 2002:a05:600c:4f07:b0:42c:bf94:f9a6 with SMTP id 5b1f17b1804b1-431256099f2mr69137335e9.26.1728902042981;
        Mon, 14 Oct 2024 03:34:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311830612csm116933885e9.25.2024.10.14.03.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:34:02 -0700 (PDT)
Message-ID: <b39c48040837f4648c227e46db2f12ab1fd09216.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, katariina.lounento@vaisala.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2024 11:34:01 +0100
In-Reply-To: <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
References: <20241008063325.62462-1-katariina.lounento@vaisala.com>
	 <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205742

On Mon, 2024-10-14 at 12:21 +0200, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi Katariina,
>=20
> On 10/8/24 8:33 AM, Katariina Lounento via lists.openembedded.org wrote:
> > [You don't often get email from katariina.lounento=3Dvaisala.com@lists.=
openembedded.org. Learn why this is important at https://aka.ms/LearnAboutS=
enderIdentification=C2=A0]
> >=20
> > From: Katariina Lounento <katariina.lounento@vaisala.com>
> >=20
> > The list of valid statuses (`upstream_status_literal_valid_status`) was
> > missing "Inactive-Upstream", which caused patchtest to fail the test
> > test_patch.TestPatch.test_upstream_status_presence_format for patches
> > containing lines like:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 +Upstream-Status: Inactive-Upstream [lastrelea=
se: 2013 lastcommit: 2013]
> >=20
> > with the error:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 FAIL: test Upstream-Status presence: Upstream-=
Status is in incorrect format (test_patch.TestPatch.test_upstream_status_pr=
esence_format)
> >=20
> > "Inactive-Upstream" is documented in the Yocto Project and OpenEmbedded
> > Contributor Guide [1]:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 Inactive-Upstream [lastcommit: when (and/or) l=
astrelease: when]
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The upstream is no lon=
ger available. This typically means a
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defunct project where =
no activity has happened for a long time =E2=80=94
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 measured in years. To =
make that judgement, it is recommended to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 look at not only when =
the last release happened, but also when
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the last commit happen=
ed, and whether newly made bug reports and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 merge requests since t=
hat time receive no reaction. It is also
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recommended to add to =
the patch description any relevant links
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 where the inactivity c=
an be clearly seen.
> >=20
>=20
> I'm wondering if we simply shouldn't remove this status?

We (as a project) have had this discussion before. There are indeed two
sides to this and I can see them both.

> I believe even if the project is inactive, we should still aim at=20
> submitting patches in the event the project starts again, or maybe it's=
=20
> just that nobody has sent a patch for years and the SW works good enough=
=20
> for all people involved.

Some of the inactive software has no place to actually visibly share
patches. The other advantage to having a separate state is that it more
easily allows people to focus on the areas where we can make a
difference. It also gives us a big hint about which software poses a
different set of risks if there is no active maintenance being done on
it.

Overall, I think having the state does have some benefits. I do agree
we should submit where we possibly can though.

Cheers,

Richard




