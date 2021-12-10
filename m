Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C44C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:16:34 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.70])
 by mx.groups.io with SMTP id smtpd.web08.7675.1639145792352179046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=H2PU8fN5;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.70,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnbx+cXQ36o9SXGT9EbrgTWCWATTKnP7EVWEspVVAZKdz88A1xHIHnLT4lq20zpuilUvrsZG6UkKQ1K9q193moo6Uw7diTEw2ubMXbqGuLvTNXtxUuWSeaeevUuv03NAScIy4Jy2qx6Q0J8kAd4D4EbgIUm7jfCqsJLCw5LJbPLE+iUzS374XfCj2k/GKaVK/12nsRLinSRoS0mDSVEH2dEtjx8YK0t8HsvyfGme1+tZ7fjxoIVMpY1ILdwR6m23GhwzyHGBsf+FH1pTZzoVFegehY4K50jKLODqSFDcIL7nRU79Ves0aPPsUJWfa8Beb2z9qMlKVWToGs2OgqgY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLeLte4JBSUriZ2fX1LGOVwxF1n0gSP5kTlR/BOvK4Q=;
 b=WHb1Uxp8xHz55sg/dfFQxWfgMkZ45QTEqhYDZ/PgcUj5EKUdPk4XjAtDKjgZOiVuF3PDQZxdJmJgrKSStpr+6Ln/Y2A60JR7DasZX6gl7gO1ha94DpIhFBO0bj7UFw9iF6CGPkkNDVoHKsjxW8+hqdbfGTRtRhFy9e6nIGFLSrNk27yiz06R+GGPc8aN2NnxS1OhfJv3ZFCp9FKk1sgAijccZ4NuzQgxod42nYP3gcimb/zild+6XFJH8Y35C2OSqRvi25TD6XNx7Yjd4z829wa00SkfM/f43j5cddDC8/Dvc5h2plorumgy8OfeBk8qnmEr4RI6MDMBC92DUib0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLeLte4JBSUriZ2fX1LGOVwxF1n0gSP5kTlR/BOvK4Q=;
 b=H2PU8fN50q+izaJAYcgHIglC29QIjy9bmtp8uDlm9sHuLqBoDkAe0SxJjBlCoyqeHkGGiLZxX10NvxsRFWY2nPQvfCXIFhZUq5T1n2QiVXFS+xUM2JUvgqsIEqsIkHbEa91/KR8RASh5ccr9nbiXjtKtH7mwjoq9PRSeMo7+i4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3682.eurprd04.prod.outlook.com
 (2603:10a6:208:9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 10 Dec
 2021 14:16:28 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 14:16:28 +0000
Date: Fri, 10 Dec 2021 15:16:26 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Max Krummenacher <max.oss.09@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [oe][OE-core][Patch 1/2] lib/oe/patch.py: apply patches from
 src_uri specified directories
Message-ID: <20211210141626.oxqfysajqb4v6syd@fedora>
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
 <20211210130458.39716-2-max.krummenacher@toradex.com>
 <AM9PR09MB4642CCF54F9D741CB4A00772A8719@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CADkTA4NKr0WjukbqH4FQoze8-L5Jn3F9QekfV-hOcL1wU-VZOg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4NKr0WjukbqH4FQoze8-L5Jn3F9QekfV-hOcL1wU-VZOg@mail.gmail.com>
X-ClientProxiedBy: AM5PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:206:1::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:206:1::20) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25 via Frontend
 Transport; Fri, 10 Dec 2021 14:16:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 589d3913-722f-47ef-aa87-08d9bbe7a7cd
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3682:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB36828BE747C9DD11DB8346CDC2719@AM0PR0402MB3682.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vXnJmugIF0Voss9I7HpFhXMmYOkjsierFhvhd1S26TnoQol0n2Ulov+XHqV1jp1dlHlefeEaZN5q06ZgrRvhKZvu9BUD6omKkbAsvsg2EE67PnZy7TT4cKHG2vVfAPcLCsfmCV9X1Aq2nmEMQDt7LRM5J9tjMzYEWPcW1dBwFQSrMMxrmm0mTH7JgqiXHA8cxXVEmdBAmNhaY9wR13lv4jSV1VOseqRe8Vv+4UEG25Z9kG6FC4Rg906sYlfy+p55v2MoRu6/sBjw2UKIBl2FbmpUQoyt9gwOFz+emEbcnHL8k+Ovzur5bMfYc9Gl802sLi2Uyotc123Vvo8+y8Z1v0+mVgJwUfz4OZHzRiCvm2ZK+4RiD6qHO0WUkhGNPaM7n2rWMY82rdXE/wP3aZFK2SQC6uTQDamwpI0oxs41kzNco290xwN4QVtigTJ5HaOCRrkqcLrLiL2mkWDu30Js4Uwxji591Y9x+Ox6OoMRZwTx/SbSU6sIaCnJFEqsSnsG7A5HvMENMChu30AXfMuSOq9dtEEEIw/+SIeNcaobaoFZNUbQ5hKtTIS/JrJpLI1mlrCLZk/SyqfwQ22Tjj/UeUVb2G6CI5DodGiPZrYQbOGr6yTZw24Ahw7fM6f0nPB/NsaXLaW9A5QlaQ/ofiiZXxRhapRyWwMHcRLkbe88qmqnC4wUCF72ewcqWkpdCbV0usIvjiahCm1KawNbEIp5Iwydo0jKgB0FqV36q5iBvUNaY0ZdAKJ8d5XQwJLXBK42NRsBAzjnLQRZSHGdEQsgIDbw5beckFHcVZ5yo4qkW5U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(8676002)(1076003)(508600001)(966005)(956004)(45080400002)(53546011)(33716001)(186003)(83380400001)(44832011)(9576002)(66556008)(2906002)(52116002)(6496006)(316002)(6916009)(66476007)(66946007)(8936002)(86362001)(9686003)(38100700002)(38350700002)(55016003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RcPXh+I8PaPO0uldrvap3HG0RsVBKM4OXan/1KLa7yhwe7EdYKkNjb8T8Dqa?=
 =?us-ascii?Q?/6htD10XxC+rCrtzZ0qBkNigZUGsEA9Tx1zcPjG7M7ZSTllAEOhu052YDaNe?=
 =?us-ascii?Q?DAz1bAC106OD9Hid3smd5OGsIEHRo8v//VSWG0QMDWTELn4W4astc6aO7ic3?=
 =?us-ascii?Q?Ao1/e7u57RUwkoavpvSGIUZurN5xMz0iuBux3cgDthilfQzNBMORd/JsGeOQ?=
 =?us-ascii?Q?cqQrlwNPKozoaLRppMR2NAE1+tagK6Yhp6JHbIQZGVKq1of1hZltwWZofcIj?=
 =?us-ascii?Q?E2NtbAqLkpHg9WT4oEierCgSQ+ZxZ1OKEW1D4wvgqzoXurjgfZrz9sdr8cbM?=
 =?us-ascii?Q?Xh3x9oJYMSVwSKCEk9TxsSCv1cKjbbDml/pGJjRLWppf4TGjasrsC/xpC5tk?=
 =?us-ascii?Q?n+jnaHzYUUB9M5Gbfd6olJBfbZGWuGB2+2Ny2OWh7a1ijBMYl9bhmB6j0vjB?=
 =?us-ascii?Q?5AUA45kWZk7WAKq8fsVlUK/k7CHHUdxS/VE7haS5815T/PddAc4NRQkTF2cd?=
 =?us-ascii?Q?X6OlmVvKgqD+W9eRbkh3Es3pVk5uLUDftHiDO2hy6ns+r6bDjuFr8P8eOus0?=
 =?us-ascii?Q?z48Z5tt+lUdWLbN9jkQ18ciKytmK14zJFR3+H1LERHxki4GDg7zyZfBBL6OF?=
 =?us-ascii?Q?KjcG1HtoNMlOFdQysIgrtKos+drxsjCLh8NPASf/ZpRYMa0Nrm2cVRwVpSY8?=
 =?us-ascii?Q?kFkz16KlFuhmvxlEaanbNievO4ZrIBPEDhTcNGOcCS99gdzg8XRpOGbwj8SN?=
 =?us-ascii?Q?0rrgdPmKv66LuWq6AhFQLy2K98lJhRrInNRksSmMvVAY8QOCpgYELpwfADH8?=
 =?us-ascii?Q?/eaP3dVyJyNtKSGlG2vmonvP+OPZa+xpy080/fcuaOgamcjJoJbT3TMOmuE2?=
 =?us-ascii?Q?rm4nhsDbpsICx8MeWYOmorleYMvx0MkFF9/6hUXxE2pu+Kc4eTMQyuHPHQdB?=
 =?us-ascii?Q?HXthTLJtQvJNfVnWka9j9AVoe2IVAHP7Xc0oDYMMdygs5PWReGEtDOM/vbV3?=
 =?us-ascii?Q?4bf1N8iaDcBpiRG7TVFRc1sgbmg0WuKnY3yPSGnEjXWmYBqrfI0rDrLfUv6j?=
 =?us-ascii?Q?G6yeObT94rVupO3HTTG5+Be1cqxEszwsQHZb5e1s3njFxXoz8E40JFowd4jx?=
 =?us-ascii?Q?AIIRa/NbJ5SFlOjc1iR/vIUFTQPrElCjQrzmf4+yBKEg78ogYyGVXIvEs93a?=
 =?us-ascii?Q?TTtCZu8kWzvtnKG15P1yD/Kh5mGV5Yl119NlTwqbsv18W2VG4zIbXm9IJoYT?=
 =?us-ascii?Q?dY/cnffBMGVo/nm+b5b8eBRwpahhDS/oXVSEL9+8iijggEI5pXBph57aVwsj?=
 =?us-ascii?Q?zNR4bCUkjmE4AupnUZOPPmA0vgtFwX8e1xMVueM99V/xxqNaeZPBetAfaXkj?=
 =?us-ascii?Q?01lsXMv7SnNFzePJvu4gMtw67Ayx+qmPc/peP5dYO7KWg9+XC1e9/bIMV8pk?=
 =?us-ascii?Q?jvOuxB/iIphBdahSwlofHbOcKOf0Wh+dMXH3bI0gPMssADuQ0x52UZP+vuRH?=
 =?us-ascii?Q?WfdGs7xYEI1o87XQ8cCqNT9zWdnSmf1l9YzP301ujF0KOWVl3z2DQLjRFmzX?=
 =?us-ascii?Q?kxCk2ngS4SZzduO4w4Bmn+fICJf/Y2oZnM8CKwUocHd2ava/5cShfPl744Ku?=
 =?us-ascii?Q?Z0pCIx3oA6MuJuhAjMt4PeHpWKhZBBzsz/o5HDYml6UyIMj2PTC50UnA/kmV?=
 =?us-ascii?Q?uXSIuptqRDKDfOMLOdXuxig9a9tWvlVMDnWYrXdkgkoEom+rUNpZ+SfgR5JA?=
 =?us-ascii?Q?EXsuu8lxYA=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 589d3913-722f-47ef-aa87-08d9bbe7a7cd
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:16:28.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QnujCxzsvzwtOqr9GURAaR/R5Pqwts1eVDh5Zi+OOPzX63sj8lNXDX0eXCOSUdIjHV02IRI7aucjEcarXgYEtCzoCgDy0Xf9QdKWOBEurwGOYCpq8GrU7uZQquUHmW2s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:16:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159527

On Fri, Dec 10, 2021 at 09:01:18AM -0500, Bruce Ashfield wrote:
> On Fri, Dec 10, 2021 at 8:29 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
> >
> >
> >
> > On 10.12.21 14:04, Max Krummenacher wrote:
> > > The current developer manual specifies that patches that are
> > > part of a directory which is given in SRC_URI are applied by
> > > the do_patch task. However that is not implemented in the
> > > current code.
> > >
> > > Implement part of it with two differences:
> > > - The implementation requires the parameter "apply=yes" and
> > >    adds all files as patches, not only files ending in .patch
> > >    and .diff.
> > >    This keeps recipes which depend on the current implementation
> > >    working.
> > > - The possibility to exclude a file in that directory from being
> > >    applied by a follow up entry with "apply=no" is dropped.
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > ---
> > >   meta/lib/oe/patch.py | 98 ++++++++++++++++++++++++++------------------
> > >   1 file changed, 59 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > > index 950fe723dc..0d2afab2f9 100644
> > > --- a/meta/lib/oe/patch.py
> > > +++ b/meta/lib/oe/patch.py
> > > @@ -794,68 +794,88 @@ class UserResolver(Resolver):
> > >               raise
> > >           os.chdir(olddir)
> > >
> > > -
> > > -def patch_path(url, fetch, workdir, expand=True):
> > > -    """Return the local path of a patch, or return nothing if this isn't a patch"""
> > > -
> > > -    local = fetch.localpath(url)
> > > -    if os.path.isdir(local):
> > > -        return
> > > +def is_patch(local, workdir, apply_all, expand):
> > >       base, ext = os.path.splitext(os.path.basename(local))
> > >       if ext in ('.gz', '.bz2', '.xz', '.Z'):
> > >           if expand:
> > >               local = os.path.join(workdir, base)
> > >           ext = os.path.splitext(base)[1]
> > >
> > > -    urldata = fetch.ud[url]
> > > +    if ext in (".diff", ".patch") or apply_all:
> > > +        return True
> > > +    return False
> > > +
> > > +def patch_path(local, urldata, fetch, workdir, expand=True):
> > > +    """Return a list of local paths of patches or return an empty list if there are no patches"""
> > > +    patches = []
> > > +
> > > +    apply_all = False
> > >       if "apply" in urldata.parm:
> > >           apply = oe.types.boolean(urldata.parm["apply"])
> > >           if not apply:
> > > -            return
> > > -    elif ext not in (".diff", ".patch"):
> > > -        return
> > > +            return patches
> > > +        else:
> > > +            apply_all = True
> > > +
> > > +    if os.path.isdir(local) and apply_all:
> > > +        for f in sorted(os.listdir(local)):
> >
> > This assumes that patches can be ordered (in here alphabetically) -
> > which isn't the case for most of the projects I worked with - I think it
> > was also a reason why one has to specify the order and inclusion in SRC_URI.
> 
> This was immediately my concern as well when I read the 0/N for the series.
> 
> I'd be more inclined to remove the documentation, rather than trying
> to deal with sorting and sequencing issues. Since it hasn't been
> working until now, there wouldn't be any users to annoy with dropped
> functionality.
> 
> (That being said, we could make the argument that anyone attempting to
> just point at a directory full of patches knows enough that they need
> to have them named in a way to keep them sorted and applied in order).
> 

First, I'd very much welcome a patch for the documentation since I
assume if this gets merged it does not get backported, so currently
maintained but not master branches would have the old behavior,
warranting a fix in the documentation.

I would assume that this can break kernel-yocto and the KERNEL_FEATURES
with optional patching if .scc and .patch files are in the same
directory which is added to SRC_URI with apply=True.

On a slightly different topic, I personally think that including directories
in SRC_URI should be discouraged because overriding a directory from a
bbappend is completely replacing it and not doing a mergeof both
directories.

i.e.

some-dir/a
some-dir/b
some-dir/c

bbappend/some-dir/b

The result is the only file fetched by the recipe is b from the
bbappend. So it makes it much harder to override only one file from
within a directory which is included in SRC_URI.

Cheers,
Quentin

> Cheers,
> 
> Bruce
> 
> 
> >
> > > +            sublocal = local + '/' + f
> >
> > Wouldn't be a sorted glob be more suitable here?
> >
> > > +            # Also search in subdirs
> > > +            if os.path.isdir(sublocal):
> > > +                patches = patches + patch_path(sublocal, urldata, fetch, workdir, expand)
> > > +            else:
> > > +                if is_patch(sublocal, workdir, apply_all, expand):
> > > +                    patches.append(sublocal)
> > > +    else:
> > > +        if is_patch(local, workdir, apply_all, expand):
> > > +            patches.append(local)
> > >
> > > -    return local
> > > +    return patches
> > >
> > >   def src_patches(d, all=False, expand=True):
> > > +    """Return a list of local paths from SRC_URI. With all=False all patches targeting do_patch, with all=True all other local paths"""
> > >       workdir = d.getVar('WORKDIR')
> > >       fetch = bb.fetch2.Fetch([], d)
> > >       patches = []
> > >       sources = []
> > > -    for url in fetch.urls:
> > > -        local = patch_path(url, fetch, workdir, expand)
> > > -        if not local:
> > > -            if all:
> > > -                local = fetch.localpath(url)
> > > -                sources.append(local)
> > > -            continue
> > >
> > > +    for url in fetch.urls:
> > > +        local = fetch.localpath(url)
> > >           urldata = fetch.ud[url]
> > > -        parm = urldata.parm
> > > -        patchname = parm.get('pname') or os.path.basename(local)
> > > +        locals = []
> > > +        locals = locals + patch_path(local, urldata, fetch, workdir, expand)
> > >
> > > -        apply, reason = should_apply(parm, d)
> > > -        if not apply:
> > > -            if reason:
> > > -                bb.note("Patch %s %s" % (patchname, reason))
> > > +        if not locals:
> > > +            if all:
> > > +                sources.append(local)
> > >               continue
> > > -
> > > -        patchparm = {'patchname': patchname}
> > > -        if "striplevel" in parm:
> > > -            striplevel = parm["striplevel"]
> > > -        elif "pnum" in parm:
> > > -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> > > -            striplevel = parm["pnum"]
> > >           else:
> > > -            striplevel = '1'
> > > -        patchparm['striplevel'] = striplevel
> > > +            for patch in locals:
> > > +                parm = urldata.parm
> > > +                patchname = parm.get('pname') or os.path.basename(patch)
> > > +
> > > +                apply, reason = should_apply(parm, d)
> > > +                if not apply:
> > > +                    if reason:
> > > +                        bb.note("Patch %s %s" % (patchname, reason))
> > > +                    continue
> > > +
> > > +                patchparm = {'patchname': patchname}
> > > +                if "striplevel" in parm:
> > > +                    striplevel = parm["striplevel"]
> > > +                elif "pnum" in parm:
> > > +                    #bb.warn("Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> > > +                    striplevel = parm["pnum"]
> > > +                else:
> > > +                    striplevel = '1'
> > > +                patchparm['striplevel'] = striplevel
> > >
> > > -        patchdir = parm.get('patchdir')
> > > -        if patchdir:
> > > -            patchparm['patchdir'] = patchdir
> > > +                patchdir = parm.get('patchdir')
> > > +                if patchdir:
> > > +                    patchparm['patchdir'] = patchdir
> > >
> > > -        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
> > > -        patches.append(localurl)
> > > +                localurl = bb.fetch.encodeurl(('file', '', patch, '', '', patchparm))
> > > +                patches.append(localurl)
> > >
> > >       if all:
> > >           return sources
> > >
> > >
> > >
> > >
> > >
> >
> > 
> >
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159522): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_159522&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=X60O6Qnokj0DyoS8ZB3VcYfT4vD3HbyQCdfUDE8LsXY7Bct-woOv9I4WNMtNTrdK&s=22Rj9T2H_RxxHXYOcLmONzO9ywnmrSq0Z2_ED40wL4k&e= 
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_87635233_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=X60O6Qnokj0DyoS8ZB3VcYfT4vD3HbyQCdfUDE8LsXY7Bct-woOv9I4WNMtNTrdK&s=VjlEmd1KMBU7WBGP0UoE1Pq3EEEUMHTd0Tm349XATcI&e= 
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=X60O6Qnokj0DyoS8ZB3VcYfT4vD3HbyQCdfUDE8LsXY7Bct-woOv9I4WNMtNTrdK&s=vL7bnRc7bvHFyVCAj_sB4Gafs1RczwSyyizYEfAcX18&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


