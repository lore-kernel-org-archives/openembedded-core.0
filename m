Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B58BC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 15:03:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web10.43024.1708355025397150192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 07:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=R9fPsS6t;
 spf=pass (domain: axis.com, ip: 40.107.21.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOIAxrz3q7woPle4BVfWSsqI8geUivaFDYzg6UGSWfqHKB816lVmOVS3XhETG4bngiHx7QPtXw/F2iHrBV2NHa98kyqLhEqoz/mYFHZH69kWJBDH+7aJ5rjm/6ol8wQaBilcPrtArh0Rd6U4xtQIjmRWpByLVnrrKThmdJloEHQv6f5SUTWyrNe+k3OjggWDgeibV36tTtUTmsD2SUGSRh4cMtRMhYCsFug3PWFh0oTdAEcdRUhB41LapuZFgzMyExBLvPpukS9Rc/jbFTE9YKZ4p69TDl9nahYZ9Iza40vpq5S+Axaf8BFxAKMedjdKePFQ3gdZ8mdAOS1MkgTfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bDmr+fGnLF9/Q87XZvvSxxrkBisxuOgNditMpQ5tMQ=;
 b=a1FwD//KWndeLQFkRK4SPu1xD5PmBrPpdgiUQwErN66OscXH6kporj5IiT6Wt9fUQEbdqS5JfT7Qf5TPA2UqNL7geZwepr7qPqP55T8SVurdU14hBQ6NaqL2wgXReZWzTDJfQrzwXxN3859pvaCmlNNDqUaHeHYsmIrDj86BW2xj1YwE2T2Q8Ts33GTN30LXp6gzGyv3d6XEkGTgn1psdnJ4dzyCZgXoMNQG3xB0zXfbGy3/+Ckn+xXRSxzyrdRrBw4m9eRKtTLZjW6qIkufxBxQJFAZwDr7UPbOFZjPplFLtwY6HWaZi0XaELFFtVnA1+ffBdZnt7NJcXbf3pzD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bDmr+fGnLF9/Q87XZvvSxxrkBisxuOgNditMpQ5tMQ=;
 b=R9fPsS6tIEk4p+zuZ05X4YtOPuhsQSrYRocqJzjwF99J+2ZnrpSUijDhECULTBkJeONpEGHfKEEPCsY+ycr2KJL7R3uwfAHpM4uT5G51hwINZpP6yGfIkDq6maMXiKJGuPZFJQgCHKrmGffarfFR/gknMNVa2eRGVFWUynUBOso=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB10424.eurprd02.prod.outlook.com (2603:10a6:10:477::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 15:03:41 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7292.033; Mon, 19 Feb 2024
 15:03:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Topic: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Index: AQHaYzMFq9VSypEwWU+mRpu29dbg4bERwU5w
Date: Mon, 19 Feb 2024 15:03:41 +0000
Message-ID: 
 <DB5PR02MB1021300C36FE2C917BD54C69DEF512@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240219012832.3090768-1-pkj@axis.com>
 <20240219012832.3090768-5-pkj@axis.com>
 <58D334B2-076D-4140-B948-7AE0A52931F3@arm.com>
In-Reply-To: <58D334B2-076D-4140-B948-7AE0A52931F3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB10424:EE_
x-ms-office365-filtering-correlation-id: f6f6bbd9-78bc-48ba-0ddd-08dc315bf5e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +E7QJbakREr5gm4qLplYNBMf/Y1m7+kgYCdvIC6CXmIArjzis9zkdpuMVVOiFH8WqNKrdpqRmKT5ofCMy7gj7T341A74YqrGn8xmKAWuB5UDUScSztlhHe2A979QTPc9ZpnaFy2dNd+h1+Z/OyjMoML5rKjJpl8+PkYT+F7HI/fsNzkGe3ZqMQv1ZyjnhwrC/sjt8V7FjBYsD/RQwl+RU3mjb7O7GsJakAZ0ZZujO9CKt+KaFaFY5KuQnJEyBsa+LxuSH78inq0DYW7vi/1iQv6EZDmRKj0m6F2VvrZBCF6/3vGM4lMFEoICueOBSKq4HrdJm8EhPr/DZE0X9dAE/khjjGitwyuQNDMKu4rNo5wZ7Jg4C2cF2IVAYRJhsECGGvyTEE7LglIRGsGMJvZJKTBAoXzjA0R1zZh0iDmy5oXTQS39zGVAgMDS8tHXkTK9IZqf2hIptkgSlQ601TjPRZUfunJSE4OGjiQALhfnNJYE5PB3BmsqcvezOfEeF/G79xB6dDNKAuZOIqC5UOVeTH/idUYQoWCAwNXaNf1yzn6eikptmYKYnx6y2UUxvU5noG4L5LcHymuIWYZ0ErnDwDLhPh2R0eRLHv8YmiWKOLe3HoujsGVQ3mPdIaEiX9xd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?twL2Y42F4n6PdoTPylrbzJVV44dK771C3lBmw3R5HjbuMyNvme8uxlOLOlXR?=
 =?us-ascii?Q?H00IwhqwYR71zkWcKqpo7Z6C4MJR0NjEwk4LL4ceGYCChr1g6akeU0JCrGve?=
 =?us-ascii?Q?3OekTEVdx9VbXwL70HJB+EV72PJIPSn0t7GRhdHrHmgmhvgvcCOO7CNvFPfu?=
 =?us-ascii?Q?3WDiIp0fRXvzxj3eQdvz0dZWfroGJehlfMJoclRKL1Vwb77SnbfmpC93Wl7d?=
 =?us-ascii?Q?x+tOr+jqDaehDjWJSn6V/K57NdfJEB3dWwHk+/Q6ubl8TFIzGFAx3U4oj8TZ?=
 =?us-ascii?Q?SJh+q/o6vrd8MYvc0xvrj3N6QPg/H1sjG7wqcV9AeKRn73nkY6d/kVj9lZLM?=
 =?us-ascii?Q?btwf7xuaDz+HVp2Z2MGKl7vBBaX8Lq41cRD/crNdWcWFKHgtS9nMql6dMe21?=
 =?us-ascii?Q?sdBKq8bdTnFb99vyAtQJb9ecuIojBukDfUcFlE6AeWIkMlkkCKvk+L3zac72?=
 =?us-ascii?Q?LZ2cOyXRV4Zt7051cXE8ACO16eIUhIUQDoHo1gy0E954xVvzo1CFEDjLOq7S?=
 =?us-ascii?Q?hruR5JtJ+3Dua0H7lg6ejhx2EaEruXF7I27/7zNckXqfeZwjY9rS1scgm4Dz?=
 =?us-ascii?Q?hwv2h2u6ureXFMvzSzl8WB4oR2ewjwHTUte4rmFYcVtYxDd+vDbLP1iYux15?=
 =?us-ascii?Q?pI7xvAl/T97LeE7AtuDL/Y2TV/TC2DJn/Z2L5BCVej9Zt848+iWDpyRenuAh?=
 =?us-ascii?Q?69yXlTpETMtV4k1iBgoPadE9vRDUTyO98yJgGgucjzNefoqBWVXFQYc/Wo0A?=
 =?us-ascii?Q?MF4mrnIpqk5PJ8y2ZWRHW/w9FlDqklIly/n5aQWnXJn2yEg9HCImD/0nSEcu?=
 =?us-ascii?Q?6L+KSbQ7oLEF7rRnhYxdsN+Q1Bc/IKNvxwUlCPYbaJd7KdbvTwyIMqs+Kanb?=
 =?us-ascii?Q?6tp5h64S8JV1KPI4isLVbc9NULrk9Br+npAqZfRlzmhb0gATvlJMuK0pqsQd?=
 =?us-ascii?Q?VRQqvi0ysVO0VZIKNM1jonPeYqN39enphK0LYls4dGq40XGNR4VlwX9Z2GwG?=
 =?us-ascii?Q?Hbp7DNUU89r0oDKO5YhxpZSFW/Llcyqg9+Q0+ZbGzeU/a3nf/sCFzCDQtf8s?=
 =?us-ascii?Q?qrVRJySEcjhoCjmWtQE+CH60afEzlixB0X8u1GgslepKXJCGM0MXCVI7thpu?=
 =?us-ascii?Q?Mo6+PZHkFbBsa0T4taeG+h3HF7jQJ/AtoxZE1CteS12hsQdonCqs3GINa9LF?=
 =?us-ascii?Q?kR12KPlCmQoSGL6Pj/KYb8QoH+BJGu2PmCIXa/VkSnGeGGqyecaNItRfRi2Z?=
 =?us-ascii?Q?7UfEmezNNBTg9AwkrEsbWSBnxaTMJV6sDAq2WUw+gJ+vhCIKKXc5M14wqftm?=
 =?us-ascii?Q?kOUmdWEp9HYj08ZkciSRuQTqA3G7CSJkWeRmoKlInK4D87k+ImD/W2DmezHU?=
 =?us-ascii?Q?/O2BEHAzOLsyr3aTgNa3pW6BqpWhv7EJs53hkUWEm61mzjnIOTc29EnqCxuw?=
 =?us-ascii?Q?J5/Gp2galJaMV6tOH1zoeMENeoXoxuF11Y332MI/IiL9dGaWXZztHuHeP4f8?=
 =?us-ascii?Q?nSuPEGBOaARAr6PpoJKe7z0TG08ltCXV6F0lnRNxDJO4cRRpkaKXLwff9Wr6?=
 =?us-ascii?Q?GYHbbBkhfMlHFYyUAPM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f6bbd9-78bc-48ba-0ddd-08dc315bf5e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 15:03:41.6184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6TAJEMuJmkh2fhFaxd3zSB2FmifVtIhnFqQGiV07QDzAObhr47R421ttmWKbZ+Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB10424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 15:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195880



> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: den 19 februari 2024 13:56
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store
> the filenames for the patches
>=20
> On 19 Feb 2024, at 01:28, Peter Kjellerstedt via lists.openembedded.org
> <peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
> > +    @staticmethod
> > +    def addNote(repo, ref, key, value=3DNone):
> > +        note =3D key + (": %s" % value if value else "")
> > +        notes_ref =3D GitApplyTree.notes_ref
> > +        runcmd(["git", "config", "notes.rewriteMode", "ignore"], repo)
> > +        runcmd(["git", "config", "notes.displayRef", notes_ref, notes_=
ref], repo)
> > +        runcmd(["git", "config", "notes.rewriteRef", notes_ref, notes_=
ref], repo)
> > +        runcmd(["git", "notes", "--ref", notes_ref, "append", "-m", no=
te, ref], repo)
>=20
> It feels like the config calls could be done once when setting up the
> repository somehow?

While I do agree that would be better, the reason I did it like this is bec=
ause=20
there is nothing in this class that is related to setting up the repositori=
es=20
that are used while calling this function. Thus it felt wrong to rely on th=
at=20
the repository has been configured correctly beforehand for the function to=
=20
work as intended.

> > +                        # This loop, which is used to remove any line =
that
> > +                        # starts with "%% original patch", is kept for=
 backwards
> > +                        # compatibility. If/when that compatibility is=
 dropped,
> > +                        # it can be replaced with code to just read th=
e first
> > +                        # line of the patch file to get the SHA-1, and=
 the code
> > +                        # below that writes the modified patch file ca=
n be
> > +                        # replaced with a simple file move.
>=20
> This is all that is needed for the new code to work correctly with an old
> worktree, right?

Well, it relies on the fallback (i.e., the exception clause) in GitApplyTre=
e.getNotes()=20
that reads from the commit message in case a Git note cannot be found. Do y=
ou want me=20
to extend the comment so that it includes that refence as well?

>=20
> Ross

//Peter


