Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24901C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 08:57:28 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.102731.1683536240401298934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 01:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qTIQmXCn;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-96652cb7673so156116666b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683536239; x=1686128239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jghnDLGZfsOrPup+z+X9Y+MA3VH19I7G25VBvXoeKP8=;
        b=qTIQmXCnBqlaz2a7C7piSMA5+MD76vhPn5h8689/adVBQ51aMTwIJPmZ1niW06fWC4
         4GjoTh4GCwtHNSt6CuZntFz8ONbM6BsnAkOwVzaw2zTaM6Vxtl6y7qna17J0OL2ej8wL
         LWjrl+/s3QN5MDL81vCCuIJKB3wvRstbEwFUne6d06mWt4nwkRPq6PNYyYMvz3opjoJw
         chilPddlVMZtKacNnIpzWi+GJCCYkp/y6JJSRAdLiuOJ61ihPDGBCRLHrk3ohJP51Erb
         pZVjsZICzesiT2OUXSKwMYluQyNom026xdMP8y6GjNNFJB6d+slcrIQR+ulT8u7dksYk
         T4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536239; x=1686128239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jghnDLGZfsOrPup+z+X9Y+MA3VH19I7G25VBvXoeKP8=;
        b=TCywHy2PKgSkHGQ4cgPK5Mo5T5Rj25PWy2BR9CQVMplpCnk2eM2qulKni7dXHsVyTZ
         g0r6UcsPnHNrjwsPKYy/xXiXmGRY1wlh1jql4PvuLiiFuZ0Xtz2MQtexWIKvC4QF1bJd
         NM8V5ijT0QWWhOgk0+Iye2bOg0y1MEnKl+g2V8cYjHyJnugc4WjAitVVpVwcKjH7al2D
         mbqgfiTacDOPZjnrTmdbSmNogkCwqXrLLTVTf9+SaEx98U/w2GGHidsocry9yBGXsVh2
         J0aluEBUglUuyMyhUM6H0iJcRkAIGMN6cbwKaN5d4VololDeZB1EW5xcihUBqtz9N74A
         uD3Q==
X-Gm-Message-State: AC+VfDy3FPA0Xi/Laa+2eXNTAu3o/93tNIgmYqqVgK+/WJV4TIhB0ZdE
	isRMsonW6VfAAQ9RqzGktk4=
X-Google-Smtp-Source: ACHHUZ5NBpqAes0sEuQAgTqOG5pDx1jmyFpJtsn+OuuFIh49WXI5yXDWT89nCtSv2bwRLW71Q9giPA==
X-Received: by 2002:a17:907:720d:b0:966:a691:55ed with SMTP id dr13-20020a170907720d00b00966a69155edmr2288982ejc.70.1683536238632;
        Mon, 08 May 2023 01:57:18 -0700 (PDT)
Received: from [127.0.0.1] ([165.225.94.219])
        by smtp.gmail.com with ESMTPSA id a4-20020a1709063a4400b0094f58a85bc5sm4668604ejf.180.2023.05.08.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 01:57:18 -0700 (PDT)
Message-ID: <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional
 patched CVEs
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Valek, Andrej"
	 <andrej.valek@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 08 May 2023 10:57:17 +0200
In-Reply-To: <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
	 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
	 <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 08:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181018

On Fri, 2023-05-05 at 12:59 +0100, Richard Purdie wrote:
> > On Fri, 2023-05-05 at 11:36 +0000, Valek, Andrej wrote:
> > > > On Fri, 2023-05-05 at 12:30 +0100, Richard Purdie wrote:
> > > > > > On Fri, 2023-05-05 at 13:18 +0200, Andrej Valek via
> > > > > > lists.openembedded.org wrote:
> > > > > > > > CVE_CHECK_PATCHED - should contains an additional CVEs
> > > > > > > > which
> > > > > > > > have
> > > > > > > > been
> > > > > > > > fixed and shouldn't be mark as vulnerable nor ignored.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > > > > > ---
> > > > > > > > =C2=A0meta/classes/cve-check.bbclass | 8 ++++++++
> > > > > > > > =C2=A01 file changed, 8 insertions(+)
> > > > > > > >=20
> > > > > > > > diff --git a/meta/classes/cve-check.bbclass
> > > > > > > > b/meta/classes/cve-
> > > > > > > > check.bbclass
> > > > > > > > index bd9e7e7445c..957ea0130dc 100644
> > > > > > > > --- a/meta/classes/cve-check.bbclass
> > > > > > > > +++ b/meta/classes/cve-check.bbclass
> > > > > > > > @@ -78,6 +78,11 @@ CVE_CHECK_SKIP_RECIPE ?=3D ""
> > > > > > > > =C2=A0#
> > > > > > > > =C2=A0CVE_CHECK_IGNORE ?=3D ""
> > > > > > > > =C2=A0
> > > > > > > > +# Usually a CVE gets treated as patched when a patch
> > > > > > > > with the
> > > > > > > > name
> > > > > > > > of the CVE
> > > > > > > > +# gets applied. Basically this variable should not be
> > > > > > > > used.
> > > > > > > > But if
> > > > > > > > there are
> > > > > > > > +# other reasons to mark a CVE as patched it can be
> > > > > > > > added to
> > > > > > > > this
> > > > > > > > list.
> > > > > > > > +CVE_CHECK_PATCHED ?=3D ""
> > > > > >=20
> > > > > > We're not adding variables which are documented as
> > > > > > "Basically
> > > > > > this
> > > > > > variable should not be used.". If you shouldn't need/use
> > > > > > it, we
> > > > > > don't
> > > > > > need it.
> > > > Ok, maybe I should change the description a little bit. Do you
> > > > have
> > > > some other preference?
> > > > > >=20
> > > > > > Can't you just use the ignore variable for the same end
> > > > > > result?
> > > > Nope. If I use a ignore list, the output in the SBOM will be
> > > > set to
> > > > "ignored", which is wrong, because it has been fixed. And
> > > > that's
> > > > the
> > > > reason.
> > > >=20
> >=20
> > I suspect "ignored" is a bad way to describe things. Ignore might
> > mean
> > the issue doesn't apply, has been fixed in some way or we really
> > are
> > ignoring it. What does the SBOM spec say about different field
> > values?
> > Should we be providing more reasoning than just adding to an ignore
> > list?
> >=20
> > I'm a bit worried we're not solving the real problem here by adding
> > a
> > new variable we tell people not to use.

The patch from Andrej tries to solves a real issue: The CVE checker
distinguishes between two types of patches. Ignored (=3D not applicable)
and patched. Patching is only supported by adding a real patch file to
the SRC_URI. However, there are other ways a patch can be implemented.
For example, a recipe that uses the git fetcher would update the git
hash to a commit that contains a fix instead of applying a patch file
to the recipe.

But I fully agree that the comment (originally suggested by me when
Andrej and I were discussing the solution) is bad. Maybe it should read
as follows:

Normally, a CVE is treated as patched when a patch with the name of the
CVE is applied. CVE_CHECK_PATCHED allows to extend the list of patched
CVEs without adding a patch file to SRC_URI.

Regarding the SBOM: It is important for customers that the CVEs of a
product with SBOM can be correctly identified as repaired or as
ignored. However, I'm not sure if the SBOM part is properly addressed
by the patch. The create-spdx.bbclass uses the function
oe.cve_check.get_patched_cves(d) which should probably handle the new
variable as well. We will check that and come up with a V2.

Thank you and regards,
Adrian


> >=20
> > Cheers,
> >=20
> > Richard
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180915):=20
> > https://lists.openembedded.org/g/openembedded-core/message/180915
> > Mute This Topic: https://lists.openembedded.org/mt/98703185/4454582
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub
> > =C2=A0[adrian.freihofer@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


