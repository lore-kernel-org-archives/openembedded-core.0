Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4EEC48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 08:15:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web10.10372.1707552943305046857
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 00:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=fmNxWjM5;
 spf=pass (domain: axis.com, ip: 40.107.22.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npJQi3fxLf5nNo6B372m9Art2z79hHUeqOxMMZCQX5EoBh5pGRhhMaFy1l7fGnBIAK9zAfGPmjeBW+XHX6sq4aTP6lLtYQbsk7P+tYJdlyvvnIrkIJnq5XsRyR4Yr6fz5Wp49N63raUNylEZBUvUI/kTo47lJZ2U4muF8oZva5Hh6zlMWYzTomwlrmYyGUnoPI8PVk31RTAn9UgIsEeocOZ7mVLtMtwtkPiHqUXFlPype6WlQEaW0Vx7pCOawmVaohiyeY80/w36gPccHjsOcU/vGKU9eQGhWnaq1c9d6dxPvGVaCcWMix31KYKDbeg0Vqy8HUCOGcEIHJpwxY8p5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0w8C41Zup48qjxosHGCg2iqQnxazWQfR5Wl3SjLR8I=;
 b=CJOxk3dmAi5UQUALcstkMkUNBZ2dipI9Lvh8rPrE43o075xQyEHIw4VAPXXC+LjMkIR+jCmj+fwIfLwtH+1aksCanpD41NCy+uA3jA/Q8F/glZleTp9mNTuT69/08X5XMEUYxNq81En2OUoRX5zKG3IislVaEYZE9KEPh+rgH3jfo84mW5JwyGSXd+knzBCyPQSn1L/5dO7HGTMM13fI8fUf/jm/mFccCYVCROpK42sFTbLhVJrszu+I4Lwk8ZOtKunZc+NjO+ycyGRiFj92hAp58HCBasn1Zo/bHWrEqYiYc9KKQfyXzEgur/hnAM0UG3QspWE0ZaFwuQLIQc9PrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0w8C41Zup48qjxosHGCg2iqQnxazWQfR5Wl3SjLR8I=;
 b=fmNxWjM5iHT7cBPeApQFXby/BTT8CUaB4nhYp9m0GKHWmwTVOj5oXjPW9KR8+RfOzOE9qygZcaDVEH1C5p7sOF0C3fE906UZ3TWI5g/cuF570aJvn0UVUjgeQVIbvL13HeTBbxDtSnLEtfAR/1G8Kk/qfBGlouHODJdMSA7CGho=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8211.eurprd02.prod.outlook.com (2603:10a6:20b:4ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Sat, 10 Feb
 2024 08:15:39 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Sat, 10 Feb 2024
 08:15:39 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] insane: Clarify runtime/ warning
Thread-Topic: [OE-core] [PATCH] insane: Clarify runtime/ warning
Thread-Index: AQHaW/UyZ/s/tau4QkikwnuYwApkt7EDOYgw
Date: Sat, 10 Feb 2024 08:15:39 +0000
Message-ID: 
 <DB5PR02MB10213689863D2FF03C569073BEF4A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240210074550.3489077-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240210074550.3489077-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8211:EE_
x-ms-office365-filtering-correlation-id: bc950c42-5805-498d-5bcb-08dc2a1077b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KRnX4Mw+IsldFlyqNtUpfHqBqEZn+hjtfi94rywjxqc49S8uNh4VSnEYtkiNR7rVDamAubiYFgt41c0JXy+WaIFyYFsHy4jFGQJ8RXwS6FOo0P3Mtsp7EuYcqI1r5zDXv5xiztCJ9JcM+Qq8LblgJZD6lNFFcz/Ku7Nfljsidgcl9gDRDpdzdQGY8mn41XYWeTwRz/LUytgp1iLhJKhXyuTVsy9VDphuOEolU57W8EXQ4yGzEwvHvDBzUOMiJHPc/JtpepVtIpzqfjn/liZTvMVoCElmTNBTAgQCZ+rO0OE70uTNKVptcqdog3ZLEfY//g0abYaVWmbVJCDUfd7rSPWTwv5ZEaV/19vEkrudtR7viYPsx4hRVMRIQfa4PWEnwFrlwv6MZ38ZU53q/8wlvuncs1DJGATxFrwBQFjxOPXAzftsu+ID1sxfCchwPKRL+pJzAcdHBqgNs1XA5utg8xLrsSMaizX0K2rJXVPYLZVpKbfZ1yc1UxO1m11eYo322jYSuWLmJ7rlwPfmtG8WZ0ZCjrnpWftnhnIj+MArSwlydsfcD7ib10oJRH6ciAvWpzX1eUgEh1PixbZgqSBv4Lz5fZqFTkEyCI11T9qfSV1/8LzpnoADpYPhxi/FI4ie
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(71200400001)(26005)(41300700001)(55016003)(2906002)(76116006)(66946007)(66556008)(66476007)(66446008)(5660300002)(8676002)(44832011)(8936002)(64756008)(52536014)(478600001)(110136005)(38070700009)(83380400001)(316002)(9686003)(7696005)(53546011)(6506007)(86362001)(122000001)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?D+xKbblAZ2GgBS/nKpsQ5Ik5KO87XTtBFmmUPILwU64ufJ+Oiu8nyHR06UoW?=
 =?us-ascii?Q?LTDgZLBU1msynwJvgUpZC/ShBOKA2OaALLPpT9JKDPynExmduN7H3qOGjrPD?=
 =?us-ascii?Q?CkEPzlCDZIcKuOgfn3XMyVj/zjo7KPVnUw3obDHAwxke93y/Jds8Y09J71cC?=
 =?us-ascii?Q?JzxmBX/80R/l65mdK6rVeoedH3BXuRRSz1rOcW1JAfr/xHileD6iaePQIwjo?=
 =?us-ascii?Q?vo7zB7qp83/j3+iyxlTwA7bD/Wm982qXbHSArisGI5XJ1f9oG7uGkEBPnttT?=
 =?us-ascii?Q?/9N+G2y8nO1Nm+PVrUCsg+lRH9m/G75zrVowfkuc3SN5E1WLA1JHA3xCGj4R?=
 =?us-ascii?Q?PUbmNOnj9uftVO3Uck97m1ajBJ6pIAy2ubd1W0Nin+MlKUzQ4b0HgTsKr6dX?=
 =?us-ascii?Q?fDw4X1QmJaLLWQaH8R/kMJ8T3YRRRvdB1YRyOTovJlGi+00ntT4bs1pWnZSa?=
 =?us-ascii?Q?C8iw+1M+S+8kaULTpXCLYKi+zc8JMLT4BoRpYgSaEXq0hi5ltAvVd3zpA9/I?=
 =?us-ascii?Q?XTjXZjLvRpANFFq1pDEUTxKGBo/yPOgZzGPtDe5sYZ5FqmvmFkyoaZ4Ss+Bs?=
 =?us-ascii?Q?2a1GMOn0H81Xs5syn+qXtciAWsDxrcK9Xonlqs/Z4uVqded3Pv/WNr2uY+ub?=
 =?us-ascii?Q?tjj6WxL4fSuiSa+0WI6oPQpGTyyXhoyd9jjtmLW3qgiwwt1XuaJvMGCgLoEb?=
 =?us-ascii?Q?r+m1UL2CWliQj3im3JsYOZNPtUr7GE/oF61bBlH9aoB3aHttLWgLXnVAi4gM?=
 =?us-ascii?Q?A3xWrzx32MiKx7tiXtYkvRvfCp3EH5o8LHJjOGSdiLo40QBUqi7Lo1LZ1JPQ?=
 =?us-ascii?Q?jDtrJhyo3SdLFtBbdrG9mHTAm9tLSchoZfn2iGxSX5Y75klLouF/mPzf7dbt?=
 =?us-ascii?Q?FiY4etHWFYpVAYHPM2DZ3E/HkgAqwo44zn/odiKLkCthWs/x7IxBZqHUmEdb?=
 =?us-ascii?Q?WOQZyHZ4uY9IUlpWgf8K9TiqwMq7ezhmsMJ6hdK/+g0D/edtIb6b3uUF9LN3?=
 =?us-ascii?Q?rELsidrTvM0/rSf5i8eYG3CqsOozXJ0VzdmzQDUvJ/2yc6dOinm1E9UW6wvu?=
 =?us-ascii?Q?96J3zpjRg33Wtws/HrZLZwYclKxKOA62y9CzGvhpOwD5mRpuE0wv6suIkN15?=
 =?us-ascii?Q?PRozFQqbiYQO6EnE8rET+1Kmgmw8F5xJxgcFIa9U+SIyHMthNH2gdKa/R/Mu?=
 =?us-ascii?Q?jvAiv/PenKeENVhpedM5fBRgGZTbt6hHu+vrM00/a+1zVC5rl4MGV7T2R37/?=
 =?us-ascii?Q?oMbDB77eWyrcYrA/MlgBQt7RXrRq6AXqW3Yx6DkcwcHR5DQVsRd1bOC19ecA?=
 =?us-ascii?Q?+nnGQngKLF4vCt4cliZK1kc6Uq0oL24lHvHtKcgJJV/3cFdOnnYne/9ZqqXy?=
 =?us-ascii?Q?R7by/1E1t3VRQAzIayuawZPO0pqGIYWpDp5BbQNDplCcSVn60uPP2zpgjxtJ?=
 =?us-ascii?Q?0CoztExJHL2dGBfbBcNgs5+JCIwOOcjvL5FLs64TQuAe22VKpKdyllSH9ZHn?=
 =?us-ascii?Q?tKxEpIv2or/bB5/CQEZ1emboUDgUKJruDIS/sS+4Of0uqKT+7siuV/BeqXYe?=
 =?us-ascii?Q?SejyRP6uTHsGb3s58cc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc950c42-5805-498d-5bcb-08dc2a1077b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2024 08:15:39.5798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSVYpncr1/mMhekGzAheF7izXqSuPKx9bJdE0oiQWYs82Rvk9mSEj9XpuiEm5eWy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 08:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195256

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 10 februari 2024 08:46
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] insane: Clarify runtime/ warning
>=20
> We should be pointing people at VIRTUAL-RUNTIME, not virtual so tweak
> the warning. Try and make it clear the difference between the build
> dependencies and the runtime ones.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 828f618cda1..fa950652921 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1611,7 +1611,7 @@ python () {
>      for k in ['RDEPENDS', 'RPROVIDES']:
>          for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
>              if var.startswith("virtual/"):
> -                bb.warn("%s is set to %s, the substring 'virtual/' holds=
 no meaning in this context. It is suggested to use the 'virtual-' instead.=
" % (k, var))
> +                bb.warn("%s is set to %s but the substring 'virtual/' ho=
lds no meaning in this context. It only works for build time dependencies, =
not runtime ones. It is suggested to use the 'VIRTUAL- RUNTIME_' instead." =
% (k, var))

I suggest changing "the 'VIRTUAL-RUNTIME_'" to "a 'VIRTUAL-RUNTIME_' variab=
le":

                bb.warn("%s is set to %s but the substring 'virtual/' holds=
 no meaning in this context. It only works for build time dependencies, not=
 runtime ones. It is suggested to use a 'VIRTUAL-RUNTIME_' variable instead=
." % (k, var))

>=20
>      issues =3D []
>      if (d.getVar('PACKAGES') or "").split():
> --
> 2.40.1

//Peter


