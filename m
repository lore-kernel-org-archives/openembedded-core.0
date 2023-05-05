Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE53C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:59:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.25141.1683287970922233015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=MI+9RtU+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f19a80a330so11374055e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683287969; x=1685879969;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY+XB9W1WQfBRqWqySo6po5qpkmYXEzDAS1sfX0OBhI=;
        b=MI+9RtU+TBWaJYdgUpZWUAVjsjVVNaXUmUzvvicYjRwGK3GfqjwP5+2Weq3JBmx4xV
         f8QV4lrjL8suv/9SQML/IBoHq5VbDDmprJNcMS3U6FxD3pk38tEg1LNFtR+YMGMm34b2
         MAdfiAc+i07mQz92K8PbrGE156e6CfOJrjp9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683287969; x=1685879969;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yY+XB9W1WQfBRqWqySo6po5qpkmYXEzDAS1sfX0OBhI=;
        b=PnYwUuNEQl5xGqrzJ5haxC/49AkKc+bJfVl53vM405O5U+EKZsHHuul0TKSmkG/CMD
         i2VQOHuitOE8klj+//DxNdQ/lsrrYqvASoa5VEOc8v1zhChpIVNF+NCJlRjhzANq6wAh
         +M+jx9jYGfPxMSa6nhQP3Mkwhf1nNsGnmTOP5l0p6M9ETDFMG3naQFylEp8qaV4JsOpm
         TXdP08GvymJ+54NRhscWyid8Voon9wgK12V4054H1CJwPqaeQZ5pn0Dk6IZH4F0kbEgl
         SO8aHmua3hbw7SMUBD8OrpjFvQL9LB6laQSJ9v+inkENIhfxHa1B3Tu+/NPE+8hRJLQn
         +osA==
X-Gm-Message-State: AC+VfDysNYYAaXXp7OB56E80Hji41O98eEo0G1HOAL9PAFsgHKLV7tU9
	7Y8q1sVUG9Ib6zGyS8G4MuWI/w==
X-Google-Smtp-Source: ACHHUZ5dz/7G+1EhdV0aqGGoeEnGZ1FAs0HJ4Ep9tjd1d/PFN2IP5YsR3XVLWjNoUADnGHo5jsf8Kw==
X-Received: by 2002:a7b:cc87:0:b0:3f1:830a:a345 with SMTP id p7-20020a7bcc87000000b003f1830aa345mr918499wma.11.1683287969332;
        Fri, 05 May 2023 04:59:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id y12-20020adffa4c000000b00306281cfa59sm2221757wrr.47.2023.05.05.04.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:59:28 -0700 (PDT)
Message-ID: <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 05 May 2023 12:59:28 +0100
In-Reply-To: <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
	 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180915

On Fri, 2023-05-05 at 11:36 +0000, Valek, Andrej wrote:
> On Fri, 2023-05-05 at 12:30 +0100, Richard Purdie wrote:
> > On Fri, 2023-05-05 at 13:18 +0200, Andrej Valek via
> > lists.openembedded.org wrote:
> > > CVE_CHECK_PATCHED - should contains an additional CVEs which have
> > > been
> > > fixed and shouldn't be mark as vulnerable nor ignored.
> > >=20
> > > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > ---
> > > =C2=A0meta/classes/cve-check.bbclass | 8 ++++++++
> > > =C2=A01 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
> > > check.bbclass
> > > index bd9e7e7445c..957ea0130dc 100644
> > > --- a/meta/classes/cve-check.bbclass
> > > +++ b/meta/classes/cve-check.bbclass
> > > @@ -78,6 +78,11 @@ CVE_CHECK_SKIP_RECIPE ?=3D ""
> > > =C2=A0#
> > > =C2=A0CVE_CHECK_IGNORE ?=3D ""
> > > =C2=A0
> > > +# Usually a CVE gets treated as patched when a patch with the name
> > > of the CVE
> > > +# gets applied. Basically this variable should not be used. But if
> > > there are
> > > +# other reasons to mark a CVE as patched it can be added to this
> > > list.
> > > +CVE_CHECK_PATCHED ?=3D ""
> >=20
> > We're not adding variables which are documented as "Basically this
> > variable should not be used.". If you shouldn't need/use it, we don't
> > need it.
> Ok, maybe I should change the description a little bit. Do you have
> some other preference?
> >=20
> > Can't you just use the ignore variable for the same end result?
> Nope. If I use a ignore list, the output in the SBOM will be set to
> "ignored", which is wrong, because it has been fixed. And that's the
> reason.
>=20

I suspect "ignored" is a bad way to describe things. Ignore might mean
the issue doesn't apply, has been fixed in some way or we really are
ignoring it. What does the SBOM spec say about different field values?
Should we be providing more reasoning than just adding to an ignore
list?

I'm a bit worried we're not solving the real problem here by adding a
new variable we tell people not to use.

Cheers,

Richard



