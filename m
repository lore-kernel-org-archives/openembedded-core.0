Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60DFC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 08:27:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web10.143163.1698136028131038306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 01:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Ql4NADme;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.74, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CscHlcqn7QstoL8r40kmCyUBPrr3dEXgG+qdObRB1l0G5+e1PDAHYkzsjPtJtAE0I6SVMe67OIG6sjuzz1HJNvIVJI3VqNnUqD5DbSjPtDQjm+K7o3v9wmRiyPY6ppjex48xQl/DIvNYFqsuykLaAYAfTD6B/kb+keZUSVZkqisZLho22LmKdsEPlS/za0wc10B/1zWKADzCNYxfBLr24IMiw3cgI1KRV4DLGD9aEpcwqtziqDah7DLB5Lcl3jgvXPc/bwf5xq2E6z6U3lyLyppu1SPT200S1NJIrb44auWl63Yg7BAaGc/Ln9VmgYPHxbZnAEO15hmmkUd9pBNU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onGTEY/GJQTu0UgO91M3Ny0lI3iQVX1t3whsj9/YSlk=;
 b=BpTQjjHhSPt9TIe0Wo0xDuCSK6SI1oz8/qoOwI8DIky6eutCfuwjjHvpY5UAGS3HNd+FuW56y06W9FLCqILrt5X+IYEeTolsxVrLP9zj9G+yT3rRCfdpjfbvgQYHiUgbg5ZJiSK3LtuN8Jq5IEaOdieVwUz1ZZRSQg9npj7VnZTh9aAMLjqGe/2tJGLMNabnmqwVzrFthEP7uxZKdx8mUzHwSZj6PIrvLAfg9G4J+UZtv20w5hcbSVztIQ7F6h/1rn7/c/q5ouf9UQo/gSExFZqE+tmVd51PUkGmpm9amcUL2OhcBptvkZS/jfkOGKo5GmvKBtEA02jjxJwGuI7Cug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onGTEY/GJQTu0UgO91M3Ny0lI3iQVX1t3whsj9/YSlk=;
 b=Ql4NADmeFTSuY7kPgp8H5f2scRZGhPgrbUxvBmP2MfMQBSASxNwFmsZnv3JHJ+eemqRsNB09PQpw2JBxwdi//dYklZWDKe4fwVZZPw4vaI+bdn51Zskwsh6G1tNQS+HvNf1kiZm0roGrJSNCkAs+PEOb1vb6zyxQaUBvL81+qUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10681.eurprd08.prod.outlook.com (2603:10a6:800:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Tue, 24 Oct
 2023 08:27:04 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 08:27:03 +0000
Message-ID: <f75fad6e-82fe-4909-9d35-ef30c169097d@weidmueller.com>
Date: Tue, 24 Oct 2023 10:27:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
 <1762baab-06d2-4fc4-9cd0-307b76f0d79e@gmail.com>
 <f71c3205-330f-452a-94ce-d6994f7d8bed@weidmueller.com>
 <cc468049-a90b-44a7-9fb5-3592f6846109@gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <cc468049-a90b-44a7-9fb5-3592f6846109@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10681:EE_
X-MS-Office365-Filtering-Correlation-Id: df384520-05ed-4b5f-e7f5-08dbd46b0072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JHmHgHCzuMDnuIf6hhFZFVbW6O72Iq7BwuMcAQcKz/mCBtqSuE/jzwHEEt2LCF8UkoapB2XQbhh/peSl/AWCKTswU3xeA2BIoxodkqcEVeN//Pb5S2V90T+LATFc3qgb76LgZeUopb/BFFi/bkfXISSCl3OwRTX8RrTAz94GL6Ged53XvcxDov7gQRW6Y+AAhjJvOAG/TL5N/BNG15+wTZZA3zQcOpjX4QZChvrzFCNo3qRJkx7tkU+uyZr4IunZZGQwBuDGiQH1ta769R7OfiMd4FiuGfZEShbi6tliSLyBzOgH4q6MuXDHjshg1HMj7AASZvysZ4BOMGgVN6krh+ueeJbNEhrOZ2ZYotuCjmNWmY+hKcx4trYUDTrF7eHbpiHi0SzQzFCNY/YzmW5Km4dBaQ0qTteHIS9JNG181iI1s4yFECYLnjf94BdL3y+lNHbRRfXchZLO5F2BAMCyS1KCHGWP8NkL69ehkFTf1DaW150hlBCyuicC5DynTrEt2OicakyqHvhINuKllIeRo+aGfF1qTLIVGlo91JmHKnQbWbgTplBD84sX/RVpBouWJUICMXM5EnYsZqy5ZQ+BBCTJ8EVINgV10TjkWc10a7qQfwTkyu7sz9s7KB0WCyE2e3shbsAQGpEJ6dN/kHkhng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(84970400001)(31686004)(6506007)(478600001)(6486002)(6512007)(2906002)(966005)(53546011)(26005)(36756003)(38100700002)(31696002)(107886003)(41300700001)(86362001)(83380400001)(8676002)(2616005)(54906003)(66556008)(4326008)(316002)(8936002)(66946007)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hZd7rBO0afiRPMIuujfiWCfM9DLGTL+oNNgbOROGo1UJVQhzeW90bRgAir2s?=
 =?us-ascii?Q?5MToWxTBS0zBg65v7gdiB3cSPB0gq4z2kyBJPXuek+7/U+SCLfiHFja87eHD?=
 =?us-ascii?Q?ShL9H9gAaabNFezEChflBH3Ps/qBmG4XcUjh/YjEi4llbK+uYwu1tIa9xeDI?=
 =?us-ascii?Q?YZwN1ZQOYoxsqEfVl2CwKkPdHIkCQByKkUcVptu/xiTMXZY823VfWrzKxkqr?=
 =?us-ascii?Q?2z+1yV9ADISnX7E7PmEfFieDw1va8j2TI26lYolM3PsXKdGbegC26QaR6bKM?=
 =?us-ascii?Q?r+uGYZDPsdKROQMsa1TTTwFhl6MUXJflqxeIcAIWEqvAKMduX/8OnUn7vj3K?=
 =?us-ascii?Q?GtNBGr3SrOAXsNQ+hH9bhTbzelg3X1Zoi4DDL2P4LXeVlJC+MqpGH8d1G75j?=
 =?us-ascii?Q?WSoNW/8XQtn17POiYUqUOfFva+aCAbNbfDr/hNrLjU605kj3ynLpAexbPEYo?=
 =?us-ascii?Q?helBrUs5LIirS35XmXvIH2qnP2EOjGjqoA1OCHI9d5SyYWMK+pl9qwfGYAby?=
 =?us-ascii?Q?ymaZOfbVxm4SHtZfnYXKVC0l0439zl9chjoAhEWstuiTBcSqiJWfq6G1tI10?=
 =?us-ascii?Q?HdOhYaHrKhbKnEwSsudEUwNdyhsGUKieO84dTASmt1Bwf2VTGddgDHj7wOot?=
 =?us-ascii?Q?rdhGMt8et1Sk1roMClc/lBilWKxEotIbmPN9IeOWV6/1LQ9k51D+L1JWxj1y?=
 =?us-ascii?Q?V9QOvhH+y/1YTpWvOKs8J05ETKyaIUVwak9U2V7wLBsDoQp7JMrbOqC26QQJ?=
 =?us-ascii?Q?Zg6tn6jdJ+1KcLPy/1uEmAuTP4/l2C/HLm0F9DPujgMxq8FYG9k0MTWHNRHy?=
 =?us-ascii?Q?HeokdJXctRf/fyL/UobAFoxQRvz8oZAKQ45Xw0BIKG2PXWHCbCcOLiahcjE8?=
 =?us-ascii?Q?WMugwvfuD/c7/aukMlaCTo8morHwua8jhw/kolCfZsrPm3MMDdBfUyQiJeag?=
 =?us-ascii?Q?gEwz2KM89jrgtN2umverAZgcC32pI4JOI83SYJxAZSC1dhgTbR00b7umt5KI?=
 =?us-ascii?Q?lawpYQAX3fI6RvY2brRRqaTA8TsszKu8KIPXyYWnmZVy7AU8Z1SgwcWl90+6?=
 =?us-ascii?Q?YPu1fyktcA1s/WOVGb74spU1bnP2x95S/SFvI6mnpbVzYgKG0zVlhG7mUOQU?=
 =?us-ascii?Q?i32eLzCoKMPVW4bP7r83esUxBi+W3fflzOyVethh4TG69FdsK0oIId3Mg7wl?=
 =?us-ascii?Q?Vy+wlyB7QhCE3AqSF+g7jqLS52J15rHLfs4VMVml8Id3qFUJ65jrGIMUNn+P?=
 =?us-ascii?Q?puOyhc9u5Q0CIhaKSn9D/aSleHHhi9XJw1KVDqsNXd3zqEttqn1j/H/7/ilV?=
 =?us-ascii?Q?TdQUTzfQEytIj4c6ThStxVuCWvihPqtCHvZcDeuyqILDbcvbf3i7D3Cvl3fH?=
 =?us-ascii?Q?/QLtc77/f0CcWHjdbVGefKmSwq8rbkJoYeJ+BOqDUULUZXzivqNrsTBJyrUI?=
 =?us-ascii?Q?UBl6gqGaTxr2MAIFZwyRMzyJOTCtAyrW9jIMmFjOeNNmkjvn4njDvnaHBs0G?=
 =?us-ascii?Q?JGNusse9TIvA4gL7KmMhZ6MCjoTtKTlGclKVL+m+xPlHQZiFyU9anPeT+r5t?=
 =?us-ascii?Q?bAgN+bGFGkcydGxL3q1wLP7ZuVG8E7ViEMUWADugDDkXW8J5gjM5kSsz2Wuk?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df384520-05ed-4b5f-e7f5-08dbd46b0072
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 08:27:03.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JI4vAZMO9ybPNJ1SUJcRNODFXtKN0UEoBo3HRgKyOh2wHR0Gi3Wp50ej81fgofhsFN3ttASz98m7yR6ppuX2pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 08:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189640

On 24.10.2023 09:12, Vyacheslav Yurkov wrote:
> Hey Lukas
>=20
> On 24.10.2023 08:33, Lukas Funke wrote:
>>>
>>> - I placed the correct URL into SRC_URI, but do_go_vendor still=20
>>> failed with following stacktrace:
>>>
>>> File:=20
>>> '/home/uvv/projects/yocto-lorch-mapro/openembedded-core/meta/classes/go=
-vendor.bbclass', lineno: 86, function: do_go_vendor
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0082:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # path =3D github.com/foo/bar
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0083:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # version =3D v1.2.3
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0084:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0085:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 p =3D destsuffix[len(default_destsuffix)+1:]
>>> =C2=A0=C2=A0*** 0086:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path, v=
ersion =3D p.split('@')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0087:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0088:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 subdir =3D fetcher.ud[url].parm.get('go_subdir')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0089:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 subdir =3D "" if not subdir else subdir
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0090:
>>> Exception: ValueError: not enough values to unpack (expected 2, got 1)
>>>
>>> The reason is that my go.mod name does not have a version component.=20
>>> If I understood the convention https://go.dev/ref/mod#introduction,=20
>>> it's not a required component, so this should be taken into account.
>>
>> This error could happen if your dependencies don't have a version.=20
>> I've never seen this in my experiments. Maybe check your go.mod file=20
>> for the missing version info.=20
>=20
> I debugged it a bit and see that the error is actually caused by my URL=20
> modification. The URL that works for me looks like
> SRC_URI =3D git://git@${GO_IMPORT}.git;...
>=20
> The parsing expects the version after "@", which is not right anymore.

The problem here is to distiguish between the actual project SRC_URI and=20
it's dependencies. This is currently done by comparing the SRC_URI entry=20
to the GO_IMPORT variable. If they match then it's not a dependency. But=20
you are correct: this can be solved in a more general manner. Good=20
catch. I'll try to fix it in the next version.

>=20
> Slava


