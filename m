Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A74C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 08:46:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6305.1721810812583066999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 01:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HmUqTqKZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266b1f1b21so48494845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721810811; x=1722415611; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0dighO9dQ1TYkYowsaDzTHfebBbTHmzPOP29HjA133g=;
        b=HmUqTqKZzQmBMuAmvlv2zQ2w7G7WRCNwcZp7o2Y/1AEt9ZL4Y8qYatS1DL41ehm9KE
         /2JqqYyV1Gknj9KI5BI0FjaoO06elEe30Ekr5XQYMOH+MFgF74Gn1I9/4dplfOsjnehr
         BBKz4mSsZnUUvGg4fUFTBOjWsB4swwZtpZwvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721810811; x=1722415611;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dighO9dQ1TYkYowsaDzTHfebBbTHmzPOP29HjA133g=;
        b=YT653rr2ZmRf09RN1QQhzEgdA0rL2dcw5bnK1WbbhUlrrVQeytZs/vt6EJA4pDj+j1
         Wjne3n9HmWFsRAalzxjXjwwwfkc7Zjfpoawt+uNMKqN3cw9sU6mzwB0eIt6fHW7OUYdL
         cBqfGQSWLk3Y2No04jYZLvqUtq3UzgMHqgqEo1zb+8gtgdU06qkS0acQQESRKOkI5G+x
         QfuIUzHbMeqCSgSbY0N/EB7WWxD4zfpXj+b0Xy+IA5tROiBM8cVV473ajPyzIK7NO1JO
         oNWESWBvl7fkv/cWYvCtRO4vgyVSTq9UaKnD5r1Y3m1BFgkX3/cqXRcsmIZDjNBiHmK5
         DEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWMYh6aPbgjmmNT/CSpMLy8Pb/AZCtaxz9T9PjGXxBmirghIRrGBTg8l4bIGhl7nB9tu0dvvyCp2YD5d/hBgj1hBCnb14iY8Ef3jDTF+1K2r4kWmjxsCm5D
X-Gm-Message-State: AOJu0Yxdv8fojxxnh+7um8PBkQpuNDYwZ8GtMMtwP7SQz9S0E3xHrtGT
	74aEA9H0ZOzNIn6p7DhbTC6B4fFj2KG0T373OvAaprH82WikmAF/E8g0GxMFYAY=
X-Google-Smtp-Source: AGHT+IGVWgNiDiZJRVY08BWcNiXES/M0FPi1yqG178jJC5mEAJ4swCq8jGi1Tszm7DcB6gWgLu99Tw==
X-Received: by 2002:a05:600c:b96:b0:426:525d:ce3d with SMTP id 5b1f17b1804b1-427dc567549mr69079635e9.33.1721810810924;
        Wed, 24 Jul 2024 01:46:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af? ([2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93594b6sm19557375e9.5.2024.07.24.01.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 01:46:50 -0700 (PDT)
Message-ID: <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dnagodra@cisco.com, "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Date: Wed, 24 Jul 2024 09:46:49 +0100
In-Reply-To: <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
	 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202430

On Wed, 2024-07-24 at 06:51 +0000, Dhairya Nagodra via lists.openembedded.o=
rg wrote:
>=20
>=20
> > -----Original Message-----
> > From: Marko, Peter <Peter.Marko@siemens.com>
> > Sent: Wednesday, July 24, 2024 12:04 PM
> > To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> > <dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
> > Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> > Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' t=
o
> > "Unpatched" status
> >=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> > lists.openembedded.org
> > Sent: Wednesday, July 24, 2024 6:45
> > To: openembedded-core@lists.openembedded.org
> > Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
> > Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
> > "Unpatched" status
> >=20
> > > - The 'upstream-wontfix' is to be used when the CVE is accepted by th=
e
> > > =C2=A0 upstream, but they are not planning to fix it.
> > > - If the version used in Yocto is vulnerable, it should not have
> > > =C2=A0 "Ignored" status. The package is still exploitable by the CVE.
> > > - Also, when the status is exported out of the SDK, it would be
> > > =C2=A0 incorrect to put it under Ignored catgory.
> >=20
> > The purpose of this entry is to remove meaningless CVEs from reports so=
 that
> > users don't spend countless hours over and over again on analyzing "ope=
n"
> > CVEs if they were already closed upstream.
>=20
> I understand the need to remove the meaningless CVEs from the report and =
prevention of re-analysing the CVEs.
> And for that exact reason we have the CVE_STATUS, the CVEs would be repor=
ted as vulnerable or "open" yes, but the previous analysis would also be pr=
esent in CVE_STATUS.
> This should give the context to the person and not requiring them to re-a=
nalyse the CVE.
>=20
> Also, I would re-iterate the point that when the status of CVEs is export=
ed out of the SDK, they would be falsely reported under 'Ignored' category.

This is far from straightforward unfortunately.

Some people are using these lists as "are there any issues we need to
worry about?".

In that context, if an upstream has assessed a CVE and decided nothing
need be done about it, our decision to "ignore" it is correct as there
is nothing to be done.

On the other hand, the CVE is open and unpatched, so listing it as
unmitigated is also correct in some senses. The problem is that there
is no planned way of moving forward with the CVE, so it will sit in a
list of other "unpatched" CVEs and this dilutes the value of the list
as you can't tell which ones are being rejected by upstream as wontfix
and which ones are real and need attention.

We knew that people would have different views and needs on how to
handle this, which is precisely why the mapping variables exist. You
can certainly configure this according to your needs and this may be a
case where you'd need to do that as there isn't going to be a 100%
right answer we can have.

Cheers,

Richard


