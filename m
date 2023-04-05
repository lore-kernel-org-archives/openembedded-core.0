Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0359BC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 07:05:27 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.124441.1680678319920150436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 00:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGJ2lphzvAvgA4ZPcI+b9Iy/DK/i0s6iPwBUapH7FpH7zoHoCnQ9E3P/bd1O6++l1pMdWNJ6tMizH3SfWzYZLjqRPW+MgNdueaMOL4NPz8YBZSbVhB8EBlR6FPO3kogLexKFFj/rl0+dUxFnLULU5gb6wJa1EvAWho8YfFCUTGE5JYGNuLg/yP94+oKHMyfw9Vyu5fw5MBTZfHFmjO3NPn5gDiAZAg3xFsGtBT9SKjo1jUNIMVQv5y+QhKg1u8eBs8QRqWt2pgtwxzh6rLHeqNl7I7m9i1KIStMa0yeYnsIzYX0bILhlgh9l68N8+qQyLLj4AFxhdKfXmfsXYbIZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daYrEIElsAiN7TLMFfjehK/lnN6to3v13ELym8ZFJRk=;
 b=ckt78EFOl/qTijG2ovqQP1S2eFXxMLI1NeWHSnAB/GcNOxFnE74zTzwvQaQUu8LmPJg0i6TecCktptqKDb6WrQl3YuV5RVBjYvg5kPdvwX9s8btkGj1HenljPqPeIMtXv57HkeSQ+rLecaqhnWYfRTses/pMYE4Q6wv5rYWd9d1rBZ4LQz5HlUseg9P5CDgEvNuI1UsQoL8tsKuzkgOT9QL7UpVqDnWuIFXeoLM39Wu3Yg0VMMv6b7U2c44jGxQFgMiP5hgdnYLa3wPNmurl/hRR5FNRFarhUed7eE1+F9455YBvvocJ0AAFgCNgopwX/9hAdCOFRh640gPATj3VLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daYrEIElsAiN7TLMFfjehK/lnN6to3v13ELym8ZFJRk=;
 b=O6AXQhxLnWPPy8ZXFJ/zEy2DdPdvroyQWMfobWrCQOt26uSH66M0Ky4epKv/S4ivNu4B4Vb4/K5lk5iSIh4qDF3cNn3XXXCB2j7EHjXxiCuJ2qfxQj/aetIvNyq0hiS4H+aXiiqrKbQGTs4eko2NIrAiLu+hlYY3A6vqOLd6nHM=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce
 dependencies
Thread-Topic: [OE-core][PATCH v4 01/10] gobject-introspection: reduce
 dependencies
Thread-Index: AQHZY8a5n1BYMPkS6EGOCoicSWisQa8aCjeAgAC0VJ+AAZFU2Q==
Date: Wed, 5 Apr 2023 07:05:16 +0000
Message-ID: <DB4PR02MB1003028940467C6316D6AD229E2909@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
 <974f5837cdf9f57176e1af6d02c49a5b2cb03db1.camel@linuxfoundation.org>
 <DB4PR02MB10030EAC0D633CDD131D6642EE2939@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB10030EAC0D633CDD131D6642EE2939@DB4PR02MB10030.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DB9PR02MB9707:EE_
x-ms-office365-filtering-correlation-id: eb41595f-d3f4-4e38-ef60-08db35a41be8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K0WBdO28K/Aq/RdngoAB6cPr5KREmfUznGh2Zebgf+9MgsmsATBiWmqBP/pFAgd56JkS/iEFbkKaLdP9ao7g4SY7sSBUxVnm5uy4g0j4+m0FFyUMJwuY5ZaTbsV3HOauh0yTBRaH4va2Q18yGoTkMeXkPC0QVxWSBoOF2g5l16cc8pJ73llhXXbarmkAGfH+UXeo4BTSLLxp561M2WJsHH1jPp82oI0QdKdLzqMXyMTPGh1hTwXir/4PT/mebD4PTJKmePUdk8kscCeh3FVzrwryMzRjNCGbwktQRKawe+BR0YUfF26ECSVCQ85jv2U6R2aPnQ6X7y3LUUrhIkBt77Y8VOfJ3u9QQ5cKk6joRYEm+0EhDA2U2i2/vmWN+gqk63fUHXsYF+p4cDwbA36EG1XtNCuBW8MglT9WJgGfHrJcMrbUmG0WdbWEMgV4ce6zYzxFzItAi+Ahbgyx5ED9BpTsigOmgoY67rnqUisLhNcVIvOQ7wS1BruGeodu8JxmoD5DHP22j1jvYoccyHyFboWTh5NjRbaNGOzU2ucEX31sjya/JaQyv7wO/freoLwuAlcEB7VkSSFZUusRqSvjg8UEfu9fyZxE2TvLGFDGmzY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199021)(26005)(478600001)(2906002)(186003)(9686003)(53546011)(6506007)(55016003)(71200400001)(33656002)(83380400001)(7696005)(966005)(122000001)(52536014)(38100700002)(86362001)(5660300002)(316002)(110136005)(41300700001)(38070700005)(8936002)(64756008)(76116006)(66476007)(91956017)(66446008)(66556008)(66946007)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?6eLz1IrwO3WFHNUAWiIN+P1lT8AwfPm90jWnHnMDlE+orO2iGHOfZrkrSw?=
 =?iso-8859-2?Q?m5wT2zLIlTQGmJNYZvkNYDhBZymA8VwVLUGhXRZhtS4eL0dKcRdnYre/ZR?=
 =?iso-8859-2?Q?O++FCTFa/z5iTtl42W4RCN5C+t9eAlacNFQpV8auJhq0dSAvvWq35viNIj?=
 =?iso-8859-2?Q?MsCVZwVuJgXUBOpPeCOkhtFlJUR1/z24FGa6fR5vXoxw3b4wMEPy5w+2N0?=
 =?iso-8859-2?Q?YUSvLC3v3lX2run+KDBdI7e2Ci0PiaVHyq9stC48phEDDKVQlJjC974k3k?=
 =?iso-8859-2?Q?3452y5wGNaQ/QquRzkOjWXtMqwPA7D12kAZ7Il7+WhdtV/lo2MfUFEwY02?=
 =?iso-8859-2?Q?2P01l1a5x2mVlc/P5sQOBlmTNHp/9HN2MtFe1dbzaZe6YqcQBGZyFxKNe3?=
 =?iso-8859-2?Q?rbcGCLSRxbvKulgB+E18rhfwjC5FvBiv2Cll0pTc43UfMS17eeiSW4Wkdj?=
 =?iso-8859-2?Q?5Rmq2p83vXYQnRTkUNjYPc9jLyYTJqhWbgD452DZWM1Ons+rIFibuOZo1I?=
 =?iso-8859-2?Q?vTC34JxZQI2LkKeUePbjx5K450XiFY1TsXprxb1b+DWZVcALA7sdLxqCsy?=
 =?iso-8859-2?Q?+QG9iFrGJdCgBkRH46JRbnoBAQUaFrO05qtroaxYYZDJ9UrwgXvq3Cdjlv?=
 =?iso-8859-2?Q?0OaezVE+6cjNh3xlnINNE2zran8cVVEbrXEMmbcT0o1mQt7v2UJ8KND3/P?=
 =?iso-8859-2?Q?sZtbQUlO0DEs7HBuKyfzGG0E++zZ+RH7U6l37SWnLutAzPoFyWSHxiqIBa?=
 =?iso-8859-2?Q?+AWBX5zu1HbAeOCFrtLg+wbuL2BkfFssskes204cLlql+MdrgrN9C9xJ2H?=
 =?iso-8859-2?Q?GrAvbNrwf1gJqFCQp5Dq0gISa6rhGe45Q8f214JnMvfz7pJstvMU0V/wOh?=
 =?iso-8859-2?Q?/R0rAkLvReW+dM0U2O4U9FSPniyEWMy2NXUNjABYkJ0uTNkvNItB52xST9?=
 =?iso-8859-2?Q?9SE6BS7D4aduHvdPVdLFFPu8oLcJd7V+T3HLgzx96FrMkzT5vQTj2gI77c?=
 =?iso-8859-2?Q?KKwbRqzod/WFR/RKbIdoN+14IH1nkuxGW5qFr3I0p6GsHjhXWyWxXNgnTE?=
 =?iso-8859-2?Q?WQ1uVzWymS0Abbs+wRqb6taaI0EiiRxFwEH0WP2MmOZHNMV/4WBqg6T0iL?=
 =?iso-8859-2?Q?K1Ml8vbFumXy3W+MuTdWg2pXk10mBV7qI5Oy0XIusrv5uXN8NGC24BDhk0?=
 =?iso-8859-2?Q?7UCBbX4XbyXEyeBmHFV5VW7hItjUfGiRhltU4WJt8b9Ata8Qw9lA5oYiqS?=
 =?iso-8859-2?Q?bHZPy8+ewo6vwz66PgwqGHdxJIuBu7Irs0xFVb+xYeTBAijZKF1Ef9L42r?=
 =?iso-8859-2?Q?6hriqbsAW8Mx4HEvWn2K4YGrzpaPyoHtccZFfaiepHZENyrYosfid4y//z?=
 =?iso-8859-2?Q?XwRO16jdJFKU5mlKy+3iJiIzSg5sODwYvT0X6gBNSYAIWYOeJPS22EYusw?=
 =?iso-8859-2?Q?sfplauEP1gGjIW0cYyR1ngSCZ1aTvXToWMMSonme2dnwq70PYrAnpZ14xD?=
 =?iso-8859-2?Q?Kfbf9pXjRjwS0deqhggC8Y3zkrtULbFwptUFdcQ/F0IbxmFbf9/MD6by+r?=
 =?iso-8859-2?Q?psA9rY52DB7bwgKpAG94XADJjA4aw+3ZGsbaLQ2MXK0dT+ysc3bE9Drk1L?=
 =?iso-8859-2?Q?b5b7soz0r/Zdo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb41595f-d3f4-4e38-ef60-08db35a41be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 07:05:16.1691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbd16YJjs4XrA66SVtQYchG+x/Q8Zm9c/dpkEKzXh8PsYhX2RE9LqaqonfSNbvrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9707
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 07:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179724

Hi Richard,

Thanks for merging the vte patch. I'd like to confirm that the build succee=
ded on my side yesterday so that should be all prerequisites needed for the=
 "gobject-introspection: reduce dependencies" which has not been merged yet=
. I've seen that patch was already in master-next but was removed from ther=
e. So I just want to make sure it is still somewhere in the queue, not bein=
g forgotten.

Thanks,
Petr

________________________________________
From: Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>
Sent: Tuesday, April 4, 2023 9:07 AM
To: Richard Purdie; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce depend=
encies

Yes, that's the problem.

I realized `bitbake -k world` cannot succeed for the x32 architecture so I =
didn't know how to test it. Now I see I should have executed `bitbake core-=
image-minimal core-image-sato -k`. I will send the patch once this command =
passes on my side.

Best Regards,
Petr

________________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Monday, April 3, 2023 10:14 PM
To: Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce depend=
encies

On Fri, 2023-03-31 at 13:46 +0200, Petr Kubiz=F2=E1k wrote:
> When GI_DATA_ENABLED is 'False' (e.g. because
> 'gobject-introspection-data' is not in DISTRO_FEATURES),
> gobject-introspection, gobject-introspection-native and qemu-native
> should not be added to DEPENDS. This is to reduce dependency chain
> when g-i is disabled.
>
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/cla=
sses-recipe/gobject-introspection.bbclass
> index 0c7b7d200a..98edb93761 100644
> --- a/meta/classes-recipe/gobject-introspection.bbclass
> +++ b/meta/classes-recipe/gobject-introspection.bbclass
> @@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['', '${G=
IRMESONBUILD}'][d.getVar('G
>
>  # Generating introspection data depends on a combination of native and t=
arget
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS:append:class-target =3D " gobject-introspection gobject-introspe=
ction-native qemu-native"
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'gobject-introspection gobject-introspection-native qemu-native',=
 '', d)}"
>
>  # Even though introspection is disabled on -native, gobject-introspectio=
n package is still
>  # needed for m4 macros.
> @@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk =3D " gobject-introspe=
ction-native"
>  export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
>
>  do_configure:prepend:class-target () {
> -    # introspection.m4 pre-packaged with upstream tarballs does not yet
> -    # have our fixes
> -    mkdir -p ${S}/m4
> -    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}"=
 =3D "1" ] ; then
> +        # introspection.m4 pre-packaged with upstream tarballs does not =
yet
> +        # have our fixes
> +        mkdir -p ${S}/m4
> +        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S=
}/m4
> +    fi
>  }

Automated testing picked up this issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/6802

which looks like a missing glib2.0-native dependency for vte?

Cheers,

Richard

