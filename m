Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92064C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 15:45:05 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.77])
 by mx.groups.io with SMTP id smtpd.web11.8422.1641311104220741746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 07:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=PbkYYWL6;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.77,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koKVf5I693WSemvpTnr3QT2LBeB7MpQgz6sGv9N51k4P1vc/IhdLpxD2u5jqM5NkNUm6Ax5sKUpEu4GOGdiIrDMabm4EW+mFKgRnniIP87p5V29IcH1i2Y063zsc8ByN1QWuTAGkcO6jjV/65hb7UqtoYHMzoe5mrOj7P+lD9WGRQmDKXAruO6b47rEU3Jkr11UuOficGNY41a7fHjJJckiOXJ8qN/qrWtvKnkEDj4WIdUahvAGqcD/0BZkorIiNxJCaBu2txnxZlrO1opGJXhs79mlpCWoNbkXn+pJVMNYAC3+CQ3QblnByrKTfIGnydWp7fnbMEoadJahVV7E68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wOKjEfJTY3zHd3+J9F7JnwaILPmyKs+qfXEPBgPIn8=;
 b=Gk91ILqGSRJc8ZZZYlobMBNdNSOe2XlwEOkeIGnTG1idy0okXx+liBk79jVHKp2cJw9jPigLWEOqxQdExIbab8p21QjxjSfR19o0QiPJjTP3B3gLVe/Ue41y/ys30ZdvnVzM/bL5+6JJBh6hH75odHczgnc0Ycp5RqY8LheYS4OI6v/zHMPrVJf1UzHl5jWNi00QN3KRDKCHc7U4DWjpI2MOxFioZoH76xZ3kRgHHTxZCueSUhVOQiPPFuuC6otBpKj+8yus+DU6xeT+bXzQB7nuaJOuyfdiVcXOe8oxNMvWdoAHZOEpZtWeQI6tyY8Pn704pnO/dNGdUoVeFd0Tng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wOKjEfJTY3zHd3+J9F7JnwaILPmyKs+qfXEPBgPIn8=;
 b=PbkYYWL6uX0kn6QzP2CitIjmPknqRWAK3vR0tED9jF4eAuDUupqj71CmfaQxczj4P3cDhtbKAFEtfBKTRhLNhb5DuvpJSMpT1C1hcmoN72uORkxgIoZpOO9tCcehAJmo+TxcT13IYPS1rn0uJvoz7j/C3Ynx/OhdP9ZsjteHBBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8511.eurprd04.prod.outlook.com (2603:10a6:102:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 15:45:00 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 15:45:00 +0000
Message-ID: <6197f2dd-4e78-3a52-5513-0d166187cb2e@theobroma-systems.com>
Date: Tue, 4 Jan 2022 16:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH 4/4] webkitgtk: Add reproducibility fix
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
 <20220104141625.1369719-4-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220104141625.1369719-4-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d6bcfd-fc29-4c08-14a4-08d9cf992a8b
X-MS-TrafficTypeDiagnostic: PAXPR04MB8511:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB851179499879801786401398C24A9@PAXPR04MB8511.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W2alzS+ZdGOZZzKbtZ2buzlZgPuCcCBS3F/q8cz9H/gMmaTsE1JU8XA5mcEQDdv/fxBZMUuYv8Uq/5ue5xsLITFFdtKe5D8d5EppPdR1+k3ANHBVyjwEdsn8bey1441TW4th/jnDqWRM4bOehdQr6ZfwocvJDsOb+zMuYf1K11UF2CiSideEpZo6yv+mFHG2cAMFFlPtr5EReOXRgcYgvbMpSSUoBS+Xlpl28Iqc8cu5rL+sgHEqrzdgPan0jdr3Hoz6FaRl8iQJvPmbb/OwxkrFbAuvlkbno38VrPZzWZWQU4WPF1ZnOSRzp1HpIVl+y+XcMBufhYr5Aa+5eifxDB7OyjpPmmpZbBDUTQr79/LXFcydtprqjOll+KxVtxzVI+7quYxxzmkSIUiuIbcLHrUpt6Yopvzj19q0DN/iUgYBfpT/CiKPXNCWlURv/UF3J2sc5PacvPmHrZ3EpsWk6fzhnf0N/pZOhIujiaAcyL3RoM0R58hcLJH2yY0J2dP9IdxU5KTlzJvsOgyiymM7g+tsx/ebTVXq6rHlRob/vEoeVOtEPoeyVOjOaGzjMFT/FBfHGe9ArgXqMJcWnekYSY+IrI+xGOcLPzbI4VSRKWosKLwi76+5isyfQ//uO9JQ44QIy3R4uAEPggxNjGtQVF3rEbbJU4+DUdg1V94vZXLgj04OVn+OKqu0+OqKc5VzpIGhX3j2t0bUj1R9jh+rVLd33a41mHyIPZ5NqSYKOCjveaAZb4Th+ifm8IzOJ0Zl2A2MZNl0jEC8VYQ8VM4b2hpeFMI7vrwsZseRpauUQTzEVwRvOIocH/oGhHLvnSaw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(6486002)(38100700002)(8936002)(966005)(53546011)(66556008)(44832011)(31686004)(4744005)(508600001)(6506007)(83380400001)(186003)(6512007)(6666004)(2906002)(5660300002)(66476007)(316002)(66946007)(31696002)(86362001)(8676002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3NEeTRVR3lrSCtJQlFWbTRWMjd0ODRtVTRhQmhCNElQZFJyWkdoZ2daY2lh?=
 =?utf-8?B?ZTFVQUZJTzF2UEtHcWdlZFZsbG04MmFjVmU1U1hRSmhuOVY2bGtKR3lQK3gx?=
 =?utf-8?B?eTJsU2lxZlhlTUFwNWdJc1dZZWhSRGJKSWhJQzVqdGk1UXVVWng2V0gvY1p2?=
 =?utf-8?B?R2pFUWpOTmxZRDFvNWRYRjZHazZWMTRoWkhZaXpBaGtGZW44MzFhaGRLbTNK?=
 =?utf-8?B?aS8rV0ZKbDlnN1FKcFNtQkpFMjAzdlUzbWNsdE5pa3pEeUpITExZc09wZzd5?=
 =?utf-8?B?UExPdmZYdUV0amxSZEM4UE9DQjhzL1dkZXdDa0ZkeTRzUnB3L0xqWnp4cjVE?=
 =?utf-8?B?TmIxTlNxbXNkcXY3dUh3U0JVUTlNNko5dGVOWGJhdGROOHBzVzhJakgyWUls?=
 =?utf-8?B?Z1cvUXJ0S2hLbXIyemREMHNQVHpJa21kaEJvcTZUTU5DV3JsU1h2VUpvNTFF?=
 =?utf-8?B?YWFpdWRWRzJHVTRsT3BPSDIxaUtRME1UY3dkMEhlMGVYMldNQmZFUmZKTGty?=
 =?utf-8?B?VXJQUWEzOXk2K0QrcHRQUmIrT2hpdVMyaHN1VGlRY1JFSmZ0SmVYTzNNSzFD?=
 =?utf-8?B?SHVHRDNjc3FRNmQzd3ZhVXdMUk4xU09teVo2eEc0MGl6SlBueG5WWHhqdHoy?=
 =?utf-8?B?NGtYRVlRV3dRanRWZ1J6U0w3dTM0dWJKTGpvSHNzQW1jMzE0eE5seS9ZNUcy?=
 =?utf-8?B?NTBmemRCeldpMTZTclFucTNGZklyc2hXVUQ2YW1RdXU4N2xnUnNRT2JzeWRL?=
 =?utf-8?B?TUl1Q3NJNjdCOU0yZnVOa2o1bmdsYm9lZ3AvVTZKREc1bk5xanZqa3A0WlR1?=
 =?utf-8?B?OEdmeEdWb0pJNGh0dkNtb3kzQlU2cUpWdW52eHNWbmV4QUlHbGMwRXRVU2s2?=
 =?utf-8?B?MDZQN1RXZjl2cERaS1FqK3VPZDZuNTJyeC9icWNCR1FjSjBLbGFHMVpDNVFZ?=
 =?utf-8?B?a0x1dDRqTXJMa0JZN3BEUHlYa2EyMzl5VmpCc1B4V2UydmNWaHUwaG9UU1NO?=
 =?utf-8?B?Z1VJRVpsdGtUZmZRaVE2ZEVCVVEzZHcvVWtSSmJDZE1aZS9yUmZiMFFWQm1k?=
 =?utf-8?B?Q2UvSkFsY2p1aGxJR3NYL3B1OTJ0dSsxUWIxRWszQ096WXJWUHNqSmhoRTJQ?=
 =?utf-8?B?NzIzOUhzRlowSnBFQm5RTUJiT1JDQ0lBQ2dRZ0hoalkyWWxJZUQrTGxMS1lu?=
 =?utf-8?B?T29hV250aTZtcklrREZjNXByeEZjV25qU2JFcUZsNnNZZDRzbGl0K3M3T2R3?=
 =?utf-8?B?OUNISmVzb2laQWEyK1JhakFmUitla1F1TVEvd3dsS0ppcnpFakdOYVBFVTZO?=
 =?utf-8?B?eEZxTGpqQWU2U0dJS1hBYW10ditjT2RhQ20vdE9OdE1VY1h5c2hMZUx5Qytk?=
 =?utf-8?B?NkJSS1FyT2dkWlFDQzd1emRKVmRvZkZlY0w5MVBlbG5xYXpaRzhIOFdzOE9u?=
 =?utf-8?B?UFBwangzTnhCN1l0a3NTTmxjUmJpM3hGbDNsUUlaVEY3UzZzcFFscU9tNDZq?=
 =?utf-8?B?aWRjU1dPM0MvWlBCZEx4MEdoZk5qblhJVlZCcGVkc0VSVTljSThwUXdCQjdK?=
 =?utf-8?B?eVU5bnNnZHJyQ3NINFZVZjdCaWFnQUlJTnV4MzZNNTdIOGJEK1Mrd2JtR1hw?=
 =?utf-8?B?U1U2dlRqTWkwRm83ZndtRmhLTUp1b1VtTzFBcnVpdlhqVGViMTN2T0tSNkRM?=
 =?utf-8?B?cE1PZWJjRXBIWFNPS1ZIUXNsR3QwNGtzTUs2dytLUms0V0plMmFTR2NNeWZi?=
 =?utf-8?B?WVlrTTBBTFQ3SU9Ba0V0L1ZYQjQwMjlGWU13bG9QRGdpb1g3MG8wUHBwVW1k?=
 =?utf-8?B?NzVNd2tuKzZOOU5kMW1uNkNkU2djeVErSGJLY0p6WmRvMlZpanFyMGszWitw?=
 =?utf-8?B?M0dTc08vUkRiakNvWCtwUUdnWXB6dTRCMHRsVUNTT3RXdmlVL1BjWWs5YjJM?=
 =?utf-8?B?bXQ1bk01OHM1a29LOHJCQVZZNmtZL0tUQ0lFenEzeWdRZWVMK0pvR0J5MlFB?=
 =?utf-8?B?c2xQTGE4eW9QQ1MvejVXNnF6MDRkRGpVbnV5YmoxMTFXK2cyV212QlVYN01L?=
 =?utf-8?B?QWh3bmNEQ3FJWjBTbEtFNHl4a3BnR2tkTjg0NDVYM3F6MDU1Z3ltc2M1ajRO?=
 =?utf-8?B?QWQrYkFhZU93d0ZVaTJYRWdxYkdiWWtGMUYwQUtEbURjLysvNUZ0dTRpZmE1?=
 =?utf-8?B?dDdXM0Rxa0NuS0w2Z3RIRTMvRlE1RWZ3NzFMMkV0RVp0Z0M2M25iam1kU2FP?=
 =?utf-8?B?aVNzWk1NM0lpNmJDMWxUaVRsWWYwOFc4eGsyWjRGVzBneDhWbEtTcDREUm80?=
 =?utf-8?B?QmJ5YWhsZE15VER4cVFsUC82ejNyQ0dzUjJoRXJXR0k4RE1zV1FSemNxblJJ?=
 =?utf-8?Q?BJgkKsn9BVUggxN0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87d6bcfd-fc29-4c08-14a4-08d9cf992a8b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:45:00.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 81j6MAYEHx2xMMLzuNYP+9tiquagXyXkT2WAIbOx/Z3P8TG9oGbSO9/UBLGjuVFSS60B68jD6Or+8S7pRbcaub1BkWKwFT5QXfgs8HdZHD6JhC8S3nkQ1UVZrBRGB1so
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 15:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160167

Hi Richard,

On 1/4/22 15:16, Richard Purdie wrote:
> When the date rolled from one year to another this highlighted a reproducibility
> issue. This could be better fixed by using SOURCE_DATE_EPOCH from the environment
> but I'm not sure how you do that in ruby. Help from someone with that knowledge
> to submit that upstream very welcome.
> 

Small side note, it seems like "copyright years" aren't actually any 
useful, see https://hynek.me/til/copyright-years/ and 
https://www.linuxfoundation.org/blog/copyright-notices-in-open-source-software-projects/.

I guess we can just notify the project to stop using the date entirely 
in the copyright to avoid those issues and hope they'll just agree :)

Cheers,
Quentin

