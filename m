Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3F8EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 12:25:59 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.83])
 by mx.groups.io with SMTP id smtpd.web11.6354.1689078349751460435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 05:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=selector1 header.b=0i0rH8St;
 spf=none, err=SPF record not found (domain: suse.com, ip: 40.107.104.83, mailfrom: aplanas@suse.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7S85gLmGpy36K5VTuWKbBEOOp4lmIOMR8sXjMTa6DiNzRDgV9jRTQmq9TtFcmRgOfvw4ZRiwsHUlEELXK0BCMQDJuhAjKVbMtoMFIV4sj+JmLUkhJefe+E59SsRHGomiEtlnDl8wQUbdYfQFxTdYtyJwsHTXhsUeq1LspP7wFcWF/PXxfuoXRe35ixHSUf5YxWlF5qupp0VsbrubdpBw7SO3zam/AzWzsjfFR5lK/4UWGz781aIHZg7CDRGa4W4lITXsTcpqbvCBEfsTaVZiFEYkLMD/9npvk9M4gDfOGjXwiB31d9lRB3FlZJCFhATsj/8soJDMvP8sJr2+g3UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyYP+bmxVTsJfWFpMSnCatpp4guXwTtqkEr+LgPj/w4=;
 b=ShFfF8mYtMkjpxRDJ6UykErexz6VMfTMxuSBV7I7Wu174C9PBoPLEsRDrqEc09hyDP5FWLE5KgY6JC/S2cXhbFrUGYUU/of2nuoDtrS9iyzXE5Oe9cMKUOEsPBv4Gp3bo0eXaTKt5/HSVjS3gGWvZZOb0XaKRVFkl5GN5adSGwbC/Xvh7faAgbjWtmrk9jtBQCCEfA9dJB8qva7kBp+FcF1BCDZCxppZ5FZAFO+cPnGJmuG5wmfdEPOKSsSy2HYws8WA3MUAtp1UoOQT5a0btGgMLDAwE4o5KJKWSS2hxlXLmxaWIFcrkjl+SlCIAkFGYbOjvuK6zEn2RMaZAsszQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyYP+bmxVTsJfWFpMSnCatpp4guXwTtqkEr+LgPj/w4=;
 b=0i0rH8StaSmcKXpnWxeILz9WtDmjG0vKhsmiXuxHMTa48vjiPQ5N8cxdU6GVIdVM5VhKHRlxaEHJY3HdLiLGTVM9H6ALTVI9fOeLUEhE+v1ORGwMaIdnIvx666Q6pGkwSj20lEHCmTBQ561UfSJYbmOyxBVGjRvINHjbSgKQM2oSxKMOsZJEJ9Q1A7und7wyKEwJoDGe1glpXEaJwAF/z1ZthprgU5DKDyzcujIEQEZOvkkewG4Tkf0HpaTVAQclLpiE33Sl8bvJWQfStLPZQhsBw/7qhF2ek6u84yyWLY5L6P465l6Kw85dlglB1muKxgiZFWZAl4EKaDnKFDpyow==
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Tue, 11 Jul 2023 12:25:46 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::e9f4:d451:24dd:e433]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::e9f4:d451:24dd:e433%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 12:25:46 +0000
From: Alberto Planas Dominguez <aplanas@suse.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Merge process?
Thread-Topic: [OE-core] Merge process?
Thread-Index: AQHZs+kuRtWu9E1UFUKY7mEPFkz33a+0fDyAgAABTSo=
Date: Tue, 11 Jul 2023 12:25:46 +0000
Message-ID: 
 <DB7PR04MB46661EA7BA222A26C2BAFBEDC531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: 
 <DB7PR04MB4666B31ACC5187EEB96B8940C531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
 <2cf5874fbe01c796046db4698cab3ea823d39137.camel@linuxfoundation.org>
In-Reply-To: 
 <2cf5874fbe01c796046db4698cab3ea823d39137.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4666:EE_|PAXPR04MB8878:EE_
x-ms-office365-filtering-correlation-id: 1df45a96-98dd-4772-077e-08db8209f3f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9SBIF7InoYLD95lqfmvvj4w4Sm1z7RF/63hXoEWpekrNwPXWHTUlhs4W9GolhStwUi0aOiZXTkBj+3w8z4fhKNCij4PROIqvtKCAiQfcZO0lLScmgbVZxAZqjb4kgk6Wn3yE8fQEt6hq1brJlbgOi3EInHPM5Wb2POK5rMHBzv4tVwLbYuZEX6n4R7PgLuJCxXhHG5Md2iZaS++626eVxniPzfORBAqQLai/8gimhN7yPtUr15bTXVYdUldgdaKGAcPDhslwf2SqYLS4yllko+0Q8TpCAaKTv8A2kXklKKz5R3Rv19dtWUyYhO43z165UVBFief7KJ22rAH0snx4UxYPFqqUv6TKv+OQaFsRpL771kAq+IgAXWvNcHlVthdiuUNwFNIq7opB3llfHij+lAtnUjAeLoiJ5TSALSkXLnd++lsHJXNbzkL0/LijjBbOsGtZXWQyxHTWMOq6EB5RSGtUGICuJaAC7NWINntR75ntjoZLEZq8CiE3Clr9RKkBnzH7Qi4oltU6vAo9cZLRpanhpN6kNm/wh93mqWYov7QaaKYFlMl3VoqybzjNoeFQ/NuZbY7EDp9EKyTXyYbTKhbo2MGJNbFQyVhZnYf52Bdvd+BXyrDFouxBdseGuLDU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4666.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(26005)(9686003)(6506007)(71200400001)(186003)(478600001)(76116006)(66476007)(66556008)(66946007)(64756008)(316002)(110136005)(66446008)(38100700002)(91956017)(7696005)(86362001)(122000001)(8936002)(5660300002)(8676002)(52536014)(38070700005)(41300700001)(2906002)(55016003)(558084003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?y8c4HxldePoyUluONlRdZgPgzD9N9H6L99NGPwRx+cTsa4LG5ekmhxm1Ee?=
 =?iso-8859-1?Q?emTMhJtxt5nyIN/L7u/v0BjZjwKLETj4o6kTmA77wBDZTgD11vFsq7B6ep?=
 =?iso-8859-1?Q?pL/hRXigoGMw1NKFGT55Q19CnwzEB3huLuPOin/MLrwEZb6pRx4Evzxy8P?=
 =?iso-8859-1?Q?Ix0TxZvCJ8lt1BUq4ebLOhDUfco4CovA/Mo9WPCQfg4j8OzdQE1y2bF9WH?=
 =?iso-8859-1?Q?IMp39lZBW/cU/68BMPgGyy/CAJbmg+eq7GkeLmgvrHARYKJXhAT8tetNLD?=
 =?iso-8859-1?Q?LSeTOr59+tOSKP6LqJCyzzw5hyr4ifQO+ksOlfuMfqQ4N3KMStBjR7yNK7?=
 =?iso-8859-1?Q?jLqJeiu+1ynAV8UbJa2T+VJuwJDUanaoNrB9XpA59djSsKF+QTWGnSA6F9?=
 =?iso-8859-1?Q?oNGiAfs/pG97R5czx9cAVH9vNK0+6MFiqHjNI3HFZaiVdp+QEIUJ6QaU2Q?=
 =?iso-8859-1?Q?/q/T6jgEm8yeiu2e3Kv63qbbeCT4QDrRu4z7tuw+YIEVcjaK/W3tZBShdb?=
 =?iso-8859-1?Q?w6C9Uyy0ny2Wt7dYmhbZ5q87mwVESoGJV4ZJ//BYl8ZP3DHZqi38iewE/7?=
 =?iso-8859-1?Q?sh+MylDKNYnZxqG517/60TIH6A1iUdkDBI1gcwRMsOF7UZDxXV2OoKtcOy?=
 =?iso-8859-1?Q?twdZZJX70qBFwrVe69Jk4X26KQsrQvxsByWvWEEpusMDwE9iWotyj9a/ls?=
 =?iso-8859-1?Q?xHiYRws803xrEIlZQGovdit4QUJX/CSCINu3mUtETi8qhnD4RnwWY+1So0?=
 =?iso-8859-1?Q?pH21bh2Xy48o8JZuX2CRgpxesK4R4j7Z9KO5ZkGdJhm3Qqb5M/5MGTwMJA?=
 =?iso-8859-1?Q?aGRMbBATHnrwT3ICijZxbu69hUM32R/JWqvqb5X0NafNP8zbzL2P4PRjm8?=
 =?iso-8859-1?Q?XMstwKJ5siEJckdIovf4RVFfjUoKinEtJQ3fbD39h8gtTQwArFXDz8SWTg?=
 =?iso-8859-1?Q?tZoQh/necasgY85JFgmj07fd1JFseZQGJlFcW0RuirmFqGntmjRmiF12Y+?=
 =?iso-8859-1?Q?fKThAmYF+SAr+V4JEvanZu2AxqgX/2dyTdv1Nbv9DvTn8Fnqixu3nkpwII?=
 =?iso-8859-1?Q?aNvDwyXmCOoOWR5dUN1mrZ+RhQiUtBxxwlXOdd4VoN/6DFcjV03V0R6vDj?=
 =?iso-8859-1?Q?LX8xmYyahRRtVlcT7/hp7mTN6IYMlMuk5T0JaKM94XvlbDg54oetgBT8rV?=
 =?iso-8859-1?Q?yfc0oWrh9WtqWlwqmHEPD6PRAWH8xnvMsRGgM4MpK76cHz6XoJu8UNNw51?=
 =?iso-8859-1?Q?6xiO+Q6Z405nLMi8NW0PnSTEVPnQIdppkvdnugEUuRtgUVPftrs4kai/vC?=
 =?iso-8859-1?Q?LGMLzxPpBHoo+fCoof88lysTcuWDMTY7T0XX6Y+rx4tH5GHuV0lFnq65Zc?=
 =?iso-8859-1?Q?mO9HY3cbh13mZDHfcN+cxQA65TrjHAWTm84gp0t1ofJAIXsrhIqYlDmsyV?=
 =?iso-8859-1?Q?VBsU4Om1+60P6bz7tkwex+2JVv0Z2W8f0fYPU1w7PiJC1anDS/PS2FuGZQ?=
 =?iso-8859-1?Q?+Z2vdwrKvER1tjapj/wr4061gJ3wNRo07t4oXMDu6n/pjO0IvCo+pUrcqH?=
 =?iso-8859-1?Q?IAdZR7YZjlR4vVSJs/1d+oceRInpfU96dEsXyoQRA+QGExqo/VnImQTn7Q?=
 =?iso-8859-1?Q?z418hq1aVNit8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df45a96-98dd-4772-077e-08db8209f3f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 12:25:46.1919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: da9Br2vCi4capcbocbSwaMWsXAyJ9LNSwPeyx9hyqma4267fE7+q4DnmhmbmJ8Z+WfwyQomkl4ZX6tvxGkYdyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 12:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184133

From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
=0A=
> I thought the second patch was merged and in master:=0A=
=0A=
Ouch ... indeed. Seeing the first one in mickledore but not the second one =
confused me.=0A=
=0A=
Thanks!=0A=

