Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E247C46467
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 16:46:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web10.16610.1669826781300376236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 08:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=K3gvRJ6G;
 spf=pass (domain: arm.com, ip: 40.107.22.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvSW/SAzZa3u9DT/bGMoSP6D6UeRS/2WMUNU4lVojLdS2MF+rv+AOc6sRGbnROOusLbmkUG8UEpASF8Cy1Z6aFnHzydSYG1T/7Wxpkdh0my/ctsCJLCVm5S0mSqKBFUr/60/IL+KLj/1fgJGxeXXqLtUBJqkcdD4TlgxGZDOzp3M7AQmQWqgwcHJDsTb9ml8wz8rfTJBsmtoZfOMaQMI2rtIu41dBpdBXYfy9T7cQvV4bTNrEPuWMCQTbVleQVVmIFG0s+2AS4ZGyP8Qxvdmpr0G7TVcteZmv/qzwesidjSiO/quh83IQpt0c58i75FeFKAO9+5v2SsUt7arPzYNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hczoQmP4hQ3uOnvFOhDe2SACFjtcOee2jmGqM8ikZ4=;
 b=SUSsfRs/nnduAi0c5iQ/AdzZRoizNbs8wAnqgRJ+QGrcW9Mh+McOILkUoVTPvuMBEibMVAhvMHC8lGusUvss2Ok4o8Wd4py0wMjNEWj8tSheUwar1UXXOUdbzNm+IS20jMoVMewBvTe0vGTIJeHP5r1YEjvZJ2g+5qIlYJkdieKOcFu1BeKKSN4Vyr70ES4P+pS6WdRugIGPR0hN4wYDCOKPRMXTN17fahFxy2g1FUVjnS41sz9rxgK1m9MgZLxzZdUYMOwJiOP/oMBuLl6JPojcAMq4SkSjtfHT9wyCQCycS5nU7BoJ/eJpc3v16nwDty+KO1cbLgyBoXV9qgTWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hczoQmP4hQ3uOnvFOhDe2SACFjtcOee2jmGqM8ikZ4=;
 b=K3gvRJ6GuUiEkglkMykDHRdo3bNv29LlsCsyWJ3nsOiDRGjRMl7sku0Qopx8HohJ3x7AxUm854DJjsunV7xiKJVTgpxPMGXn/Urnxr9LXR8vbjRXtpS2fB14JDR7cGkkQHQPInkQ6AezC166L8d5kxQcjNs9Bw72QLh/A/NIu5k=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB8966.eurprd08.prod.outlook.com (2603:10a6:102:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 16:46:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 16:46:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Lukasz Majewski <lukma@denx.de>, Alexander Kanavin
	<alex.kanavin@gmail.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [Openembedded-architecture] Y2038 proposal
Thread-Topic: [yocto] [OE-core] [Openembedded-architecture] Y2038 proposal
Thread-Index: AQHZBL3bmAlScoXxDUWhcSWAewlSwq5Xd+cAgAAMU4CAACjGgA==
Date: Wed, 30 Nov 2022 16:46:17 +0000
Message-ID: <D8DC7E4C-58C5-4102-A5B0-20D95FC0C3A9@arm.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
 <20221130143604.5a6659dc@wsk>
 <ad2adc6af5026edc201cd3ab3a7b1f129cfdbd57.camel@linuxfoundation.org>
In-Reply-To: 
 <ad2adc6af5026edc201cd3ab3a7b1f129cfdbd57.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|PAVPR08MB8966:EE_
x-ms-office365-filtering-correlation-id: 3ace9866-1acc-4322-c49b-08dad2f266f3
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Pp4fRksta4sAYzay8XaYviCySwSml/GWGZwBgWIAkkiVj7smAH+WpnCZANHRh/iqE+LU1rBnU6BknBtvVwwFF/Uzj5wMNWhVtoORPOE/2pBDq1ByRMFAtA1A1AL2SaNl81hA53b/FE+MD9syQ8xuw+k4Q+2gjUHm5F24rjW69VGFmiWnk9mgdOeVcMyp82DrmFKbVwFZhbYoGfMgrBAyqx1c2IrgSl8bXKnE/vTYRQFz1WOrouLLXACu8EkSfqTDft+J5wZRipdumllMoVr3w+n1BBeCbaersK5Ife40bwecoI9of1Ry69RGoWZNiuGDvv0upWbsGR9yAij27n/qztSZrvRPW3ueop+RCG1V+An7+ZFcr6D0+Z3RdQ0TaOrhrRB71WgdRbVRuDcXYaFZo5j+LQA/qFxnPSuvTwWKe9NPEZBicZMLgS5zS4zGvft2pA+kceqKdan0iBAsOopeSMUI3ckazGA43ARJ+Yx6fzecSSab3AInX+EkoPygS1CaNv7H2FbycJSzN+OW3r5wjBSLGAZ8XR00gb0APfvsUIdfSh5DZCfCvKpFtdtZc1S92CMChyX1hXt3VISWaxfeCHvNu85wAm1eGlcdwD5emGi/Dm2xd7n9+fo4IOm68/adypYdXJ7cB6yX4rUV8ujFZoiFBksdqgAbjZbvHokqPPeT2e9lrLxV5GnZqkABfE8aH7kXKpOLQO6dAAMHGAGR1Ah77qsHRO8gL7UicqdwaQw6vBCA4F05ZHJCswxNDGn5WwRol3rIPdo6k7lhhLVCPw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(4744005)(8936002)(122000001)(2906002)(38100700002)(6916009)(33656002)(86362001)(6486002)(41300700001)(36756003)(38070700005)(966005)(186003)(478600001)(66946007)(91956017)(76116006)(316002)(5660300002)(54906003)(66476007)(8676002)(2616005)(6506007)(6512007)(53546011)(66556008)(64756008)(26005)(71200400001)(4326008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?laR1UDDSPl2yWOfGjqxitKtmUdJ+MKqkfqmxUUkiN/LVAGDQUZnVV3LJk2yj?=
 =?us-ascii?Q?DRa614jWQiJz5CZ8AqRtqHyqRUzfLzjAC3QDXf7ouniuG9JvP9BstJDs7Dlv?=
 =?us-ascii?Q?MzFyAlIQkAt7U8UJ9OpfuuKOGheeThw3z4LwELVoFDEenHeQINAKd1NLoivx?=
 =?us-ascii?Q?j6Khp5awRntIw6g93b3fn41qlbuIDXUlZf1eEHs2D+r1mYQih7VsUVgQsTB2?=
 =?us-ascii?Q?pjkmbvSzJ9pzz1cqIIwsYCkKeyXG9H4Ir4sr4ZblaVCLDuIRGYBUNyU75ccB?=
 =?us-ascii?Q?7UcLG7lPlCZRvUrHrQ/0yGDMjmdbbXz0kFMXzeH2Lrz4CgyjRw2oHhvzydOE?=
 =?us-ascii?Q?rX1fxiObvxw4Q2JtrapxnII5T+iS3KvB0tEqUqbN4Czaw1EYjQcACfm88d3w?=
 =?us-ascii?Q?JVcozc5lMl7bP8sFZtZZE3wJNzQl6jSC/IrKDkuWON+sN5NMouZrONaxnKl6?=
 =?us-ascii?Q?PWGPwl6hfYiJNP4AN7Sc0Sz7uEtwpW7XxqTsjmbvsaI9w8T5qhu+PyutKMpx?=
 =?us-ascii?Q?qEf6NhXaPzfn4jWTERCG9EJ3ZsCgpDwIaB3CdIhpKnU3XFEh3jHPKStP/XIV?=
 =?us-ascii?Q?x7kLmqy+IXYmRvp9twaTf1Ryw0piY/3+xJG17JEiluSLvTr0kkU4RXYmKA+h?=
 =?us-ascii?Q?+rPLn8EQ/xgIeoa77s4uobq2ovHNC+Jr+iiZvn955yuwSs/IA2YWJUYBg6by?=
 =?us-ascii?Q?Bv59R2r/f4GUarNHusAByZmgSSvDgnSYht7T3KYioF4HK5tGVe6YDGGi6r56?=
 =?us-ascii?Q?fwFjv4SD/pm9b/XSdC37KM8vjmOGTtHpKyZGc0oNp+AFoZGoE1g9d6PbENvA?=
 =?us-ascii?Q?6+s9SWo8nuTJ3ZLqy6ILG+6NoSvrrh5VNYSXZEbVPgBznzI1/ZTyOmZ/0cJA?=
 =?us-ascii?Q?m8lbP9EBC+69lhc9tC3OLkERqxAgC2qMPtKZWMepSkEnXhxKfkIYpH34Lux/?=
 =?us-ascii?Q?TJ5dPaHHHogN9yAlKGpwsyAojXhDrROoRegBLobq3HAUlObkF2UXmnOgek1E?=
 =?us-ascii?Q?VLfTJvTP1I1Wzinzfk/4aHFnv5Vt7ZkTWivlEmLF9kSj0+0cUoPytn4WdU3s?=
 =?us-ascii?Q?XmD+cTwhbkwMgyAhnyawY+u4p895iHX7XP/WewdhJmSwIh1w1TxFWCi//1fr?=
 =?us-ascii?Q?PIU59uWnoYf6PTqCqsXUvK+7HwOdCalXMf1YnOdfPtr4ITnnU/+6SdL1UTah?=
 =?us-ascii?Q?seci+lI2zGSNMqFI32m4FmA1XpbV7By2mzHXWJZO70hUeddfmoK+dlfDSZ6b?=
 =?us-ascii?Q?LVXipYEgQPz6rFhs9kMDauLkRCrpPtxShE+8roCLEz7Rou9Ague34Qt2FgPd?=
 =?us-ascii?Q?Ck6wYb9HWMYJ4+zr2opF6n/czHxsxFEJnYJeU5br9Kbcxc/b+xokwAvkO6od?=
 =?us-ascii?Q?07kaTyv9/kgSOUR0NkNVBdiXB5eDNjzrI9zXswenIMYmvK4EYdPDUzIsUt7W?=
 =?us-ascii?Q?JsNLrQYgaqJfwYFaMASQ81y3K6pBe1TM8QP4ray9ClQRg7DRqyxB1YFUh0vD?=
 =?us-ascii?Q?i867Gv6ZakC3tboWuipd/c1r3RLPCH975EcGMe7ncLl3D6jWNGh3+ClnEt5C?=
 =?us-ascii?Q?X3Z5fSvVLw1fxFdp/Ikjw1/Md/Ai5Pn2ui69YFW7?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC302C29AB78F648A9D5E2F0B06D194B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ace9866-1acc-4322-c49b-08dad2f266f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 16:46:17.7048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2C+8jr5LZ2YTmxBi4Thv3EOsmMSFDSTrmDwlrRDXrS7FcA7gQO87UQHiXVvJqm0ZcGaEPjhipVhNuqP14/IVrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174025

On 30 Nov 2022, at 14:20, Richard Purdie via lists.yoctoproject.org <richar=
d.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
>>> * Could we optionally disable some of the glibc 32 bit function calls
>>> to ensure they're not being used?=20
>>=20
>> Could you be more specific here? Would you like to disable some
>> syscalls?
>=20
> I'm meaning disabling the 32 bit glibc time functions.

Some time ago I filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6=
803 as Debian has a nice sanity check where it warns if non-LFS glibc funct=
ions are used.  I imagine the same logic could be used to check for 32-bit =
time_t use.

Ross=

