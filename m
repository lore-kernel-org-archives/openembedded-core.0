Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B74C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 07:25:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.6611.1707463528334546495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 23:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=QQeFhyNK;
 spf=pass (domain: navimatix.de, ip: 40.107.21.123, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTFfNpgrBrXkMNyrhkabkg/mL2ZVoyO9UySzpJjP0G7tPMf+utemlWeZEGV8yxTwgYAj3OAVmNIBTtd1k+t4OJmG5WJSIMCwXJz7ksYYybjlzocKj54E8t7POrCH9Wxvk6pfOAtUyRA1TgCiEjR8kNkJ1RcEI54q8qbWKISsO8twNiLy4lZ0FoqNeVaJb18fu+45ogisRkNy9NgjII6pL2Kpg00VO9CtZV+NOR/NqfZFW9fmT28VMU8LtF9cjW18nGBbj3YRGEE9Gy8Aq3syXpOMdquQRZgAZix/DSXP6AwmBGd0imaab+tBKzRaQbZuqCcEpIazjs6ERYVKGsrl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jk1k0+kcNDguAmHNwScSZS4snDaadV7qvk+1tMph4w=;
 b=ODx4EpwvXyhNr91wm5Z7BUDglhWUgRWo6KzT7MsoICyCvL582PRQT/NrVjgl53hwcpZGBdPlXmwOBbdqClQhRV2wx8f335g2gUa4RnYbCcX36K5l904W7ZYB1EymFCvt2Sukldb43HzqPhBr3eVmcV2LSNFSz0DDCxXP5G7PNoJSm/Pu8Ju749Ec5xQiYLwafZ7x92rK4rUL2xuxs8dMIeHOaz3nr5m/EelY2p/DwuhRAeWtAbcGSxw0k2+beoaeJYbXtzxQaaESeOvfoa+E15WsB6pd6MKqTqJbRYdVja35IGVocJ0afUj23hSl0xrw5l+BcBImwy2bXG78jCaA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jk1k0+kcNDguAmHNwScSZS4snDaadV7qvk+1tMph4w=;
 b=QQeFhyNKianqStGbOVTnxbWAOHPJ5z4L8HRSdT7u+gK3bb/EsoPvO2ZieE89jD3Int/WNaIS+ZIUMtN7+/RLqHFyYKBaEjkCX3WFVYSKkhOIt4vEusGfciqupql9yMajhX6ixxQapAokAQzu78Z16TF5GBelZVB8WIN0r2ZWud0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32) by DB9PR01MB7227.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:21d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.26; Fri, 9 Feb
 2024 07:25:23 +0000
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00]) by AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00%4]) with mapi id 15.20.7249.039; Fri, 9 Feb 2024
 07:25:23 +0000
Message-ID: <067cd3b2-fa69-4353-ac86-7b112fc97b6b@navimatix.de>
Date: Fri, 9 Feb 2024 08:25:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
Content-Language: en-US, de-DE
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: matthias.schiffer@ew.tq-group.com,
 openembedded-core@lists.openembedded.org, oss@ew.tq-group.com
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
 <104bcdd2-27f1-40fb-9ad0-0fd506af3041@navimatix.de>
 <20240208231633e8d8b5ad@mail.local>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20240208231633e8d8b5ad@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0443.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::16) To AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR01MB4627:EE_|DB9PR01MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 811543ab-254d-4506-666a-08dc29404749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A6hnuAFSg6I3W5JbBh39C5GXiEgCrolNlSUybEgyzCLgh9zfaD2ATLKJgmiRgt8PaTeiH/+TsDvPLqSK+fHdjiVSFX7uhuBV7cok1/9gdIKCfALqsdLK1+1W2zlEzTbh9Ri9Ij4WJqKE7o5odKWcpS83dT9o0sLDyUFvj4+68uhQHhnZ6Ne66Qt/XqFClZ7otzCKNLMxEhF2q2p6iepx0gqHVbTUfZFhXvpAd3sXtpw9vHAdj42UyjIMrXlSRxsAqN62xnhw5GGFPw2y9vEk7fHxcTjYqErMCaUJSie2HbHIvLqQIaeQ79m5Mrgc00dy0D83ejLwhfL+eeaANgFcMAFDn323yl6H7IbNJgWgDvuGpJdarJjdNQM/VhK5+5+KHzGPoEKO3fUGu9u2etfdYvJpN8EnrRJEQm/TqlQrGHZLflHUBI7ZMxY085xdnDioP2A+ql/vpfnansb8qvSJeJ++Mo2NmrLObXTT4z+D5fOtlCApwPZdwbB0nulMulsBwdEf/wnOzwD02+A/bMBXKGIgjiwGOI15XzENlpR7MT2NGiqyrzSRA7xgd38Z1Rl3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB4627.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(346002)(136003)(366004)(396003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(31696002)(38100700002)(31686004)(41300700001)(2906002)(6512007)(316002)(66899024)(478600001)(6486002)(53546011)(26005)(66574015)(83380400001)(6506007)(2616005)(36756003)(8676002)(4326008)(8936002)(6916009)(5660300002)(66946007)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XIoTuDGajr5QgnBXxCICjvBI/6uyuPJ3R7ZeKm2d8Q2Zux5TGdrJTU1V9GiB?=
 =?us-ascii?Q?GaF16PKuxLjKrHbqoQUwXkugv4+nrHYslSuEgyYqwKjZhDizuTfnUBZmkK97?=
 =?us-ascii?Q?HIWRt3cZ+W+1nSwPVRqEbTj9+dO7fp3QTxbAWpyIhNBOaKLXtjU+P8tXkIxq?=
 =?us-ascii?Q?wVEouFijdAVfMHYzOerYsTaIdd6ced393NIkJhEK4INHT/rbeUv2W7mrP7mN?=
 =?us-ascii?Q?tM/orrFKul7/QGhqeM8pxsrewAINHO31eUn3Rj2HxU7riv+R2ddI46udG9wU?=
 =?us-ascii?Q?1JA23Emzte1gOlrRPlhWGb9/E6SS4G9tUkN2QGxctao7VvPB/Z25fSbaCEvb?=
 =?us-ascii?Q?jY0JC/aNXKofjWCeRf0TXSvqy+yBUwqJ2J9BKtawOq6LG+i3+kf2zcxvtl4+?=
 =?us-ascii?Q?xG5NBmfktpZ9lKdTu+tAoGCHSjSU1Bpsa44K8yQ0Axt1xoBw2Xz/eyMuuwxN?=
 =?us-ascii?Q?ao8URN1acRprlxB2XSlXhZr8kZR0ORn/qQedVBnfNRvmg2QiAitnMD+S3KNd?=
 =?us-ascii?Q?faOxNaTllcl6aHsXM9P80pC4u4ujh52rHElEfne+B2sVJ1pQnpNVC5EtfClI?=
 =?us-ascii?Q?9aO/y7qNjGEclEVUSlJ30DBVA0IhjAX/xxzfaRiC2vCx6CYd9gBq0X07frQW?=
 =?us-ascii?Q?eZsEdix/ARQqt32I82hlbq3S7d+aX9DWviAFDjSOua3j3TN5d8z2Dz8sti2s?=
 =?us-ascii?Q?7Tnxa5iJuiLbBD/4Xh/oAYVE25tM8TL2VNyJBNauUjeQ8Mm7seW+63nsVT9T?=
 =?us-ascii?Q?5/FaYQvz8gEgUU5mc0+54ZUfIxjNOlAyoV11BRCHJEE07bhh/5jTnWrKraus?=
 =?us-ascii?Q?GRd2VS4uzexYQ0WB4cw5YQsOYX8s8Pq81Xpq3Nq94o7R7SZ5WkctwJATvY0k?=
 =?us-ascii?Q?rjrFvEcxxkXCLr63Qzi9bbZJNPGFwBUs/VWAgrJ7PHhvB5qN1vGAj0Su/aub?=
 =?us-ascii?Q?Sb+9Pjn0Lr75eJyOYLE8n1pK4oGgjELXsDLlJBGBA/i4F9TjaLDfX783fscU?=
 =?us-ascii?Q?Aq2NmYNhqNWlsbkk+v8xWGze9brGSoaMtXadveQwhTZdV3jru8Edcd8rFnaS?=
 =?us-ascii?Q?NYWjdSmc/hzuy/tWocw78WYIZyyS9FCfSpg60Jp+cF9KDpPyHjw9CW9+SS05?=
 =?us-ascii?Q?qbLyMGFt7m8rbM/NVtS7ihontBFmdKlVWgP9lv+qWrR1+W9O42kgQRbXcH1D?=
 =?us-ascii?Q?ybbmNP8LnkVIbQ+2FCa/tZ31ai8hq2DdBRalVN6v9fEnXRRDw7ZTajy1vpWC?=
 =?us-ascii?Q?fZj4IDqSrT/pM8PRZODe9Y83E3FNt9BbEi1f1XeyNnPFFh5swWi1oeVHiNBb?=
 =?us-ascii?Q?MZqmvkvb0E0uUhLLTSmOqHqcocbQzVODs9mcokDS5FwWgqFslr2U5Z1vKMzA?=
 =?us-ascii?Q?sKpGiBN9VUuIiDpyRtDrkIiOXkZvl4SMaSC7W0peJFvls5jXKpK3H1GcTTyW?=
 =?us-ascii?Q?OqnIinOTuGz3fUXQDi3LAuTSkuWzrSQGu1C5GM24rxIDnHGfAg6osdXUxUYq?=
 =?us-ascii?Q?rYPsbzIwRX2kL9eIjJYCMHoi2a0dWR2zSkgknmYYy63aslU29kc3YO+8iDNq?=
 =?us-ascii?Q?jVgYVweGN2YpGbAF29V+2osczS/Vcl73brIEax4uNFAS7AmL8tSmxDNepBFA?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 811543ab-254d-4506-666a-08dc29404749
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB4627.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 07:25:23.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vhapchCDnrQwLWAT4FeIaOFdmUjoNu9SQoLuqEbNCIP3nI7HkZJ4REPDa6rQn+oPsWwtRW/K1G4zktXaamwWBCZ7v1uxEo2WTtBNqbhuQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 07:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195190

On 09.02.24 00:16, Alexandre Belloni wrote:
> On 08/02/2024 14:54:49+0100, J=C3=B6rg Sommer via lists.openembedded.org =
wrote:
>> On 07.02.24 11:25, Matthias Schiffer via lists.openembedded.org wrote:
>>> Deploy the kernel configuration with the built images, so it is easy to
>>> check its contents, or rebuild the same configuration outside of the
>>> Yocto build system.
>>
>> Isn't the kernel already in the -dev package included?
>>
>> From a security point of view I wouldn't welcome the inclusion in the
>> main package, because the config should not be deployed by default. The
>> config contains many information about the available code in the kernel,
>> which an attacker can only guess otherwise.
>=20
> However, as per the GPL, you will have to provide the kernel
> configuration to the recipients of the product upon request which can be
> any attacker.

But that's upon request. That raises the bar for an attacker and doesn't
delivers all information for free.


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


