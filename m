Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D76EC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 12:58:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web11.40275.1658235482121353045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 05:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=F2oGZhtB;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.85,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJIATPhgLWx9pX/wIJmJxFbPbPa1/EC/GdNEkKPV+pYlxDNOxmu7gboyl+IlIVY6ljueIj3w+ENN6TvloVR/vly6CHLsF4XZOMHDFHvPkN3MKV4PLEPAB/meSeTNMhuK8Rzebg7o52pEwvIwsOFXyIwR0LdD7YJCVQ03oQO/GWusX8DwPzQP+MrdDtr14pVQZkss9GU6iJBy+YmVK4OwhJeEFTOmdYqDr6AGHnK03EHdYuSpZDr7MYZG4zGzFKUSgPMxpFb0Mdg+6JyPhvbZ7NxVUr+iAnudyYu+8VgW0qhMd5B87x1VwlViWYVRiE/DVy2Zq6EER8DeJzdeSi4C5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWT4qdefgmKiJq8wOwMMm3Z8W47m2VXFMM8GRfMFDH8=;
 b=TyRsF61Qqp/1w3MImY2FBfU0zPcuCTwUZ08016SUEf2g2LGfsTx9E5rU1gZlCJZdIuCgCUG7+371iUzfd1QZiGZC+Ro4JXeou7ALxk8jXRaXqvkMkmrx4uUT4QvC7FukOzwVic8mXC2d1iatdZiYHTsYVkC9PLYJgw06QLC1ygXGq7uyzlOlU8z0s0gVwA8jdAJeSt3IIVU5wEq5RTZPeT0FjbaipWA6v+n8M8cRlTjoWVe6wIj8rOH6Ecxy8eMBQ6C55YfCj5uxWemrmWR33NZ6KOka5pmHOHCq+kt6Cg297v+yTwqiJRsT+/t6iC6lPVZq8RiyfGFNUDfc4HTpPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWT4qdefgmKiJq8wOwMMm3Z8W47m2VXFMM8GRfMFDH8=;
 b=F2oGZhtBMujPVFeZgsaBV46022OkgWGLOkodbKnJjjASjp75JcZmB19qn1ZBBObgEiq/vxgVTaJUUD5uxKlEgWliZd1C5rIERK/f99KfyHy1rCTXpIVJDMZAfkaq/C9jU/BQO7DASqcja2C8yGfHWuho6FustEphtm5z1uenfb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB3PR0402MB3706.eurprd04.prod.outlook.com (2603:10a6:8:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 12:57:58 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%8]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 12:57:58 +0000
Message-ID: <7de31512-a9f1-4682-15a5-06b53da83458@theobroma-systems.com>
Date: Tue, 19 Jul 2022 14:57:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] Forced password change in first login
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <15208757-c36e-5adf-1b74-8d030b53b9a9@theobroma-systems.com>
 <22536.1658180887983506156@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <22536.1658180887983506156@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0045.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::33)
 To PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ffc5dad-79fd-41e7-b996-08da69864dbb
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3706:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tDXqcIAq9zWF+7Q4JhNsj6f5TkVjiuNubltIPdNGwR1GpiCd93tSzcjB60W8zaI0jEmRjd8u4ECPPW3Iai/Uq+MHLOh1FzS6vtAnBW49MKb7k147rF2AgR/DGSYn6aF1Xddcf5y7JSzlMxbG8mp8yvZdiaVAL8ASHKuXYfBbsZopgMb92JURaAgnOtiJQLSvTN6nU9cXcfhFFAIh++CX8nQb3ThhkgHl5SlnfI78Aq+wTRCHQRc8xTwVz4nAJaLxJYwvmBLxrMHQ8pL+oBra27WtlbeWpolG9THeErDN5uz08DA6/fEUYF7pFvzM8uJWgiE1SyJT340a72j422pCPD5/7LlsHmACRai4aHJkSnxr2qD71gQ7D/mY4LW7pHOZq11Xri0fuWaMOu1Or3Xx5SXt8sAusN4/Y+8sacgQQ/bhBVOGbgEmbQGzPgFJMHfCKJcbgPW+/yS9gEr2/u9khSi77Z4kzJSVIX2ix/9YvelZLjlEQQHsihqvIj8wHAkdplVMu1VuUrXSpn2WPZqpOpUJMs1qrnzIT86LreJcN1Hk6za4cGjow/NwmaAhbOV3V/8ly9jyo/gafYf/T1QA4ddoonWDEHXepHJgUv2TKy1HMzlwEVtLvAPBtF+uxGOpoeThr3N6lwAdHFR+1XVKg4x+ryxK5+ikmYjlyvTQ/GEUVrbS3neuLsjliZUDRHxeqg6OGZo1ZbMckM0G2Re37zkFqR7y6GbWtwTiNNAWadGUIYN1VAT7lCPsnTDn3f2VyPAM5ii7qZvkJFH7tnLtGlVqI+NGV6/Z6PgISDJ8kbDErzYOpRk4cgdQdn9qHaPa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(136003)(376002)(39850400004)(66946007)(316002)(66556008)(38100700002)(31686004)(8676002)(66476007)(36756003)(2906002)(41300700001)(26005)(83380400001)(6512007)(4744005)(2616005)(5660300002)(44832011)(31696002)(6486002)(478600001)(8936002)(6506007)(53546011)(86362001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AbRldIAsL06Xxtyk10y2rAF4lzjF2Dqi9XwPGP1gK23XqWm8C7rb4nUEYP0r?=
 =?us-ascii?Q?ZDfu2zP/IQWXHe/KbEJBtWUMpicZlykCLZeyFdNFJXJ0hEbWx0x8FbPBE1nI?=
 =?us-ascii?Q?/jlw9rj4mBy6Kq8jumtiAUUHMBH4IQG7rAUZHkqRo3vYyPLt/dRy4ZYV1vNT?=
 =?us-ascii?Q?LUFLiv8zOxpkteLCMWiiJa10pc/KFBnasTJ5h774BfaG2z/6tSwgnJcGrQDr?=
 =?us-ascii?Q?F+IGlBGJhfut9dKy5jDfA5+7QTlhYhUh35ets1eEuoi454VUGjED87m5F1wL?=
 =?us-ascii?Q?6JIHynxJoFM65mZJE4jLPvTXvtXMrFzoSY46jrUasRC08o/XC7ehgzfJjH40?=
 =?us-ascii?Q?mlCcElaS/ZnJucEFv6JO0t3kXL37GM7AO5VKFaeTDnm8aGwbRhtyg30CfwB5?=
 =?us-ascii?Q?jjapDma/eUS3+WahYAfUMkhBUIP855rmRrVeMyoMy9uNu9a3Vy4reQPQUbXF?=
 =?us-ascii?Q?mLj8VD+iIX7qpOuW5RhpCOB9V0qsXV/x2GgbEsFjiiC2yrHNd+xw7mRb8svI?=
 =?us-ascii?Q?B+Uc35wO9LRKZFiQybnFooVg7SlnAMaxWchf5SOUmLfa8hQGnUqWk7W9c8pM?=
 =?us-ascii?Q?IJlH9bjJclZ04Z10yo70cWbnKVGUaIzwgypTWTFMLWPIdPcqrf4Gx6UbKZUh?=
 =?us-ascii?Q?45L8NXSYslHrzw13S879XRC4NwEefBA8GiVyZYgp0d9BkyprXUpZ1U1oao5J?=
 =?us-ascii?Q?l6n0IQfPdPhd5HSWAF96cFaw8LYMco8a7mnc0y3hew8MVWZEKcZ89p5dbEVx?=
 =?us-ascii?Q?MlifWmZfud+d7oZPCkzYgwLLfLyV5waFQGWmpKRZLqovkE/XU/RQ1cQPlm1H?=
 =?us-ascii?Q?umFBUVNuW5hZj4L6HkdQ+7qdQGyzlThjvxZHTdyInxNcDPDIANwkFq6lt8PW?=
 =?us-ascii?Q?SJfxIoWaiOFgteJadgp8g0hsPzUqyiJXionJRdRYGBtbCwpuYotWEk62lPNr?=
 =?us-ascii?Q?r+a7vEpB0mmYy/0/roMts401iw9gWbmCihAN40QiTo+x6mwnhZLYdGMPuQMD?=
 =?us-ascii?Q?a2YB3pjUA3RJBzG9QjIYznu5SbAdsZqQ3VtR/B9VD7OZ3vfUmXz9tPjWx4G1?=
 =?us-ascii?Q?lNxlGpAa9R/jHxYREzQb7i3q1Mxh8xm+pl+nuNrPyz2CZDSWq8DCP5IZ8NpO?=
 =?us-ascii?Q?rSx76UuKK89U+de0rcXwdDh1tqhFYJyNNUUQ8phmYDSWkLoFaL/0u4Hq4bX4?=
 =?us-ascii?Q?QE3Dx3QvkyY8rU1YHNnM94pdWZjqFbQt6pAN4hfFsAhtmRZP2eawbyaQwHct?=
 =?us-ascii?Q?u3RzHBpPCeXurpQfVl/EXPSZQKHpgYuNvLX9wHZ3luE8ee3foEYFXb0ZHbiz?=
 =?us-ascii?Q?kPt5KCn5H4b9/pnrf2t+CxRYhmxiaQNQMFgR8O6+vx0qC+bosIf0YwvoWKSk?=
 =?us-ascii?Q?dNqou7id7Z7vc/SKa4AWWeDSnybHQyR2ucJPo2ar/o6YVkvONfSSRUR8qnQz?=
 =?us-ascii?Q?m5cR3uA6CSpZ5t9mu4fVOx+A3fn53pfWrPxh9vSNQgKt0kRzD/5KRmGAV9up?=
 =?us-ascii?Q?iOYJeU17Ra+mjZZJsi5VnSU89wpaTcyvEIy+RHteCrOF8GQ9koSt0i4NP63e?=
 =?us-ascii?Q?BL95VJljAPgvHHyLZFw1Zf9U6ZEymskRZP5Rz8Kg5oZ3P0cGkn0vHQroVqgU?=
 =?us-ascii?Q?3+zhpomaPP5I3KfoU/M1HDw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ffc5dad-79fd-41e7-b996-08da69864dbb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 12:57:57.9684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vEfWksSDNqNt+9ervk0jMrA6Wrm3zRAb0m/wzAskVF4w2ILBUYtFWcLO7xezWpiOl8p6Zy9bMy4uhIQU0ugffNwgWN9lL99//rr+GdsdeMwA95y9rf6xwUUjKw+lljEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3706
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 12:58:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168280

Hi Livius,

On 7/18/22 23:48, Livius wrote:
> In Yocto Honister if i use sha256crypt for my password hash my finished L=
inux image can not like it, and at first boot it forces to me to change it.=
 If i use=C2=A0sha512crypt for my hash everything is ok at Linux first boot=
.
>=20

Just tested on top of honister branch (fd00d74f47 yocto-bsps: update to=20
v5.10.113) with the same process/diff as given in yesterday's mail. I=20
couldn't reproduce what you experienced.

Is there some minimal reproducer you could give us so that we can make=20
sure this is fixed? I don't want to fix the docs if the issue is=20
actually in the code elsewhere :)

Cheers,
Quentin

