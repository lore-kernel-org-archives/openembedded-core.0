Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.417.1611586720946000036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=O5tbYqI3;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1611586722;
  x=1643122722;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Np20ABIJAS/9EKt9GnlnwjMg7zUP9Y71rTpTgr8sbk8=;
  b=O5tbYqI3Hr+32mWkLPu2lVag3FjLPjKw+aDLwmwu0675Pn9hlPZvz5x1
   IFNJ/1kDmsk9nMxKs3jBBE2anOB5LMCtD//9Wm+jgNM/P09W20yuQckVE
   I/M3qy32ZsVwi25wLYwF8Jbg0yehuUBbLZhwhy0Qy6CEp1LQcJT2oa2iI
   ksNzrHXCxT9EfuwOjDl9IBhVT3ugrc1w+lI+PIeIK7mKSLjSacdjgsnvk
   dcx2X3AoeBQ2jKQVZsje8BBCUkQa2RzzvJP8liG+qeTH8W98t5THaFnyo
   4hnBJyhmGubw17smkxSS7pgg6nQiHmayjbYOL1ND33bpjWDhMgZuy4nyF
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Dorinda
	<dorindabassey@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Thread-Topic: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user isn't
 building in PSEUDO_IGNORE_PATHS
Thread-Index: AQHW8lj5YW6fs5m0GEWELSAP0GWpG6o4AYQAgABtg7A=
Date: Mon, 25 Jan 2021 14:58:21 +0000
Message-ID: <763a6b20912146228385c2125395bc68@XBOX03.axis.com>
References: <20210124135559.21894-1-dorindabassey@gmail.com>
 <20210124135559.21894-5-dorindabassey@gmail.com>
 <20210125092140.qzuwucbfplk6mzma@qschulz>
In-Reply-To: <20210125092140.qzuwucbfplk6mzma@qschulz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Quentin Schulz
> Sent: den 25 januari 2021 10:22
> To: Dorinda <dorindabassey@gmail.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user isn't
> building in PSEUDO_IGNORE_PATHS
>=20
> Hi Dorinda,
>=20
> On Sun, Jan 24, 2021 at 02:55:59PM +0100, Dorinda wrote:
> > added a check to ensure that a user isn't building in
> PSEUDO_IGNORE_PATHS
> >
>=20
> Missing [YOCTO #14179] tag I think :)
>=20
> > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> > ---
> >  meta/classes/sanity.bbclass | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 2040b48595..78c0343f0d 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
> >      if (tmpdirmode & stat.S_ISUID):
> >          status.addresult("TMPDIR is setuid, please don't build in a se=
tuid directory")
> >
> > +    # Check that user isn't building in PSEUDO_IGNORE_PATHS
> > +    pseudoignorepaths =3D d.getVar('PSEUDO_IGNORE_PATHS', expand=3DTru=
e).split(",")
> > +    workdir =3D d.getVar('WORKDIR', expand=3DTrue)
> > +    for i in pseudoignorepaths:
> > +        if workdir.startswith(i):

PSEUDO_IGNORE_PATHS may contain empty paths (i.e., from multiple=20
consecutive commas, or a trailing commas). Pseudo will ignore these=20
paths, so this code should ignore them too:

        if i and workdir.startswith(i):

> > +            status.addresult("you are building in a path under PSEUDO_=
IGNORE_PATHS, please remove this" + str(i) + "directory in \nParsed WORKDIR=
: " + str(workdir) + "\n")
>=20
> Capital Y for the beginning of the sentence?
>=20
> Missing space before and after str(i).
>=20
> I'm not familiar with this part of the code, so forgive me if this is
> wrong but... is your sentence finished?
>=20
> You are building in a path under PSEUDO_IGNORE_PATHS, please remove this =
<dir> directory in
> Parsed WORKDIR: <workdir>
>=20
> That is to me not very telling about what I should do to fix this issue.
>=20
> I honestly might be missing a lot of context on the issue so wouldn't be
> surprised if the issue is with me not understanding the sentence more
> than the sentence being "unfinished".

No, I don't think you are wrong. I do not understand it either.

> Thanks,
> Quentin

//Peter

