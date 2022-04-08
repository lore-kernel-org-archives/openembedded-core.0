Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B295CC4708A
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4420.1649415703463719662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 04:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=IilD8uTg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10974aa226=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 238AeMcu019852
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Apr 2022 04:01:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4aJz9I+qr5u8OcIZ1cBMcDLoyrfKNqkJFOdlAnsiNc4=;
 b=IilD8uTgTdiZcCOgbpNpX0i6Gm/cHpvruw7I1XYi6Xlrwv1eNX7XtC9nd1bR7UnLbDTH
 xJifBxvzAnrOtWe5kUkUMIs3VUflzfmp9XvcZ7CfqvFXIU+ujp8d0Af/mHExwI5ABpZJ
 +f+zEGY/1g/y04YxUlDrT9UJqvCxQ6oJWRsPt2DuVVgnAznhDCfjfTm7hIXA3aS99o9S
 JtW4j7BoIX5ry6wIA5+aaxrLjKBiE8J+2XsiqoA4VexfOLdrcYHXRdCptf8Y4XxPvvov
 2qtNFaTyEU7YceRPRTtiJzqvX5ypEhUIjTv98Duc/z81sxqEbWpuzjuXVSrV3iF/VkNK 6w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6p0jcttk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 04:01:42 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 238B1g6i000947
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Apr 2022 04:01:42 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6p0jctth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Apr 2022 04:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZTsFbZuI/ALrJC4mS3YophM3lnWOL7qc5Q/GtZy0NPLoIVw2Gr9XrJljrtf3HqbDDJywiIFPJmEk4xDQG1u6P0lArukMPjksMJeisumpw8IeeRZQ/ysRFS3S80iGGg8mR1HRvLw+OHCSw+DEpESvduHtNFxDBiRl1DXV6CIfAIozPn5fEFPwbJZkJxB1vQ1mFZQyMtXxwkjfcOwSr5wX3G5oqah+4V9f6ZU4+zQ6x+LFGWIuZWGiNyKxYU+bZy6WUeiz5I0xw2C965nxAi4dga2RbeySZL5BoB1QF7rDQHhe6/yWIMpgghrkkPQAwQwM+WZqbv1c5JsSinkEqry3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aJz9I+qr5u8OcIZ1cBMcDLoyrfKNqkJFOdlAnsiNc4=;
 b=jy7qPfgeILuDYv4qenuBwYxZZkJoCd64cMUaU1HYoTvLRees0Ymvd0AzoKo9WsSFiMhBgXBfYZRtNiK2BDBZCjviO1eIRA4hCXycHFcLaKYmkQuGI2LZuoXiP2Uf5olYqUZCt8/V4hT1d00WoyfY9pGWMjKLKcWNeQTp8v4EG0oK2b5jCkNpvS5QlE2lSU0dkSwo4pAvVY72XYOddkR8COlD52ABL8XaR0VrkqEg/nDd0TiCZi1xB6F9JuYTb604aEZsLj7Aahfnr4gMEJIEmUX+S9zmrnPTlHS8p16VEAnWju0y3Fswi0aRZHRZ8zNULsOMjkM+HPdTEYICXr/nXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN6PR11MB1378.namprd11.prod.outlook.com (2603:10b6:404:4a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 11:01:37 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 11:01:37 +0000
Message-ID: <bf017503-5365-98c2-3546-96b4cc4313c4@windriver.com>
Date: Fri, 8 Apr 2022 19:01:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
 <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
 <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: HK2PR0302CA0015.apcprd03.prod.outlook.com
 (2603:1096:202::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48debc2c-9055-49dd-782d-08da194f26fc
X-MS-TrafficTypeDiagnostic: BN6PR11MB1378:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB13782EF47B41D51B6EE5D5F2F9E99@BN6PR11MB1378.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lx4qqc36nR6UuprHl3s5GxA3rRkqleKkrutAFkEbZHZlPSx5kTn82HMQV4eLmSHOQUok24Ypbe/6KcyFDOVjcxINfmpVDio4NBK+gS3olzgXwJaG44iqOWHfRykjawHdo/nr/HXF1OjZCvPS5JNRBf5gPbZJWqcnBDTsg7MRDsB+NkjTJ48iWD3lNk0LkPdsjbbnT+G2tXRo/J18otw7nENeG4Fip8KQMXxavRxRiPp0Wo0zls3dkL59HDUL7F64lti9fegReTvToSM31a7BAM7/V9J1S3ywb3CHHvCRLS5QUQ/7fx5lKaeRzHvpyi9BDOkdsfnPVRWP5QdqQZLpzpUWfq+V29A+gUmAQ9OmBxAk0uQoyPEvZ4T88PpYMhdiQvwwcPxJDO9K7hKyw4hkNpoYjzi6071VVead8viSyWuQLUjzOzR2c50SrJEWKbe5sjaHCq+Oz6uEn8VZ8Xcn7b0plCh7hg+LD9+wPV+pKaqSFQEYXtpYnG1SwFgFz9Uzo/Lb9oVJPkI4G4USOempEckq/h9+SSIuRbKGIDTgngr3HcyACV6xklOMDn+sblyzP0IRyozPWC+asvEbt83aSGuj8sP/7xM3JD6qTl79lWsHdV8dRDsDgOX9yu4LPWX2hb7TzGJZA56h2vujbgVoxsFFSjUYy7puxQP7eBFh1smZ2EQWa7421GD56eqDoaObC82/enAJaLKInLBjxLAHswa6xE/5eBYmWrggODY61Lvv7v0ehH0+Mc/Gmm/WnmhM+Sk3FCbhnQ3piLB6UkF39SgxLmDaaKuOwHt6Y6o+ynPk7IECyDVb6NoGmpFnf16SaXV4vWkhKUrlw2NmFrTTTISK2NaxN0kALKkOSGYWTBQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6666004)(966005)(6486002)(66476007)(66556008)(186003)(83380400001)(38350700002)(38100700002)(36756003)(2906002)(8936002)(52116002)(53546011)(6506007)(31686004)(44832011)(66946007)(5660300002)(2616005)(6916009)(31696002)(8676002)(4326008)(86362001)(26005)(316002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0RTMktCRHFGMFN5UjZZdDY0YjljbzRkK2RkcGpIeVpDUGpRYXlQczJpa2FG?=
 =?utf-8?B?TW1QSFlQbHRTaFFlQ2hXSGZ3MU9oRlRWSlIvV0N5MVljRGNkTC9yM1hicVZl?=
 =?utf-8?B?Z1lwMFY5V0I3WnJCNlhEWlFjdEZWMGEydlVVSnhGZHpVeW8zZmdicWY4OTMz?=
 =?utf-8?B?UUNVeTVmYTRlREVyRkFZR0dKNnFNbW1vMUhhNy9XZHlja2hVdTdaTk85cGNk?=
 =?utf-8?B?d2NrUzFaTlAwRzhkNWN5SVRXc1JJb0lpc29TVnh2U2VoN25LdTU0bmV2RnQ1?=
 =?utf-8?B?OVdmaDFBZUVkdHUvMlJDR3VCNjBHcVROdi9HTWJYUCtvdkFIUXdnYk5VdFZ4?=
 =?utf-8?B?L0VlVU1zQkFXZjl6c1d0SUVHbk96NFRObFVmd3h1UGhLaEZsVHVtbExqVlFH?=
 =?utf-8?B?OENyUHJHSE1WeWRFK04wdXdxN1dXN0piUC9IMzJCYk1Pa2RMMUllZ2J6NER5?=
 =?utf-8?B?clpFY2JXWUxNZEZjRWxRMCtjNDVPQUs3V2h2VlN3WHRiN29wUG9sNENjZU5Y?=
 =?utf-8?B?OWdTOVd6c3RLaGNhNEV5Q1JYLzVEazdieWpPYy9hT093aUkvUUlpcklmMmti?=
 =?utf-8?B?RG5kdE1Hb0NsNTA2Z3IrcE5NR2lRVU9wcVRvVjBtRW1WWHY0UkZwRC9YNVM0?=
 =?utf-8?B?RkEzN1RicHJEU1habEVvYkJiYUdXLzQ3cmU3SGp2dEJzeE1rSnJoS0VIeC9H?=
 =?utf-8?B?WmtLRkdSUVJFTHlTOXdXZWNmLzJPa1NUREgzVzAwL0FNYU9Gci9qVnZTRHBh?=
 =?utf-8?B?MzZEeHBXS3FiUTFuOCs2SUNnS0NZVWV2NHFjY0pGNFNGeVhmbFFWL3VHZmsw?=
 =?utf-8?B?eGVrR3FnOVBhTER5VWZWU3hpbFFnbFRhTDdTcitjTzdXY3RnbnViUnd1TkZr?=
 =?utf-8?B?dDhBNThpWG1sUjM3M1JGcTFnbVVTb0dBRkdSU0FqRzlVWUFCQUV5RlNJMzBM?=
 =?utf-8?B?UTUrRVdqQS93VTNnbkxqenFEaHpjbHpXdVF2RVlOVlVWaVNkc0RLL0crNmkr?=
 =?utf-8?B?enJEb1FaTFVtMFNPT3N2Z0p1N2tnZWNFUTQrNis0VkF2Qk43QTZ3Y3h3bmpK?=
 =?utf-8?B?cnppZXM0dmVCNVZYRU5uMGFhRjdQUnpwdkZicXROVlkrK09PWDVVMWQ0VkhH?=
 =?utf-8?B?V2VUa3JCbUVsNWc1TmZUMDdLcVJPak9sQ2JWYnp2MS9NSDVzRTIxR0lFL0xL?=
 =?utf-8?B?YmplalE4UG9QNWczcEl1VWdML0tHT0tBR2pjcTlTRFVlcjVwQS9BQnhsSTA1?=
 =?utf-8?B?aTFvSWE1S05OdXh2L2RmWFFlTzR4cGRWNWtMWkxwekFWUmhCMjJiRW82Y3Y4?=
 =?utf-8?B?Um5hMXA5R0RNRzNLNWZpT1FQSlRXeENpWXB3dmRlMi9ZQ2xjdytadzNsL0hm?=
 =?utf-8?B?OWM0ejV2WW4vRElXZ2h2ekdqOU1pZW5RRWpIYXVwcXR0WUY0Tk9BUGVrb0Rs?=
 =?utf-8?B?a2F6cjFjbThUbmlQY1lPc2h6dG1vWXJaV1N4Zmx2MG11Z1BkVE1pRTlTY245?=
 =?utf-8?B?eWlZNU01SnFucktOOXlkcVpxaWZsQk00OG9hM3ZXYjdQOXNMWE9mSnVOUm5w?=
 =?utf-8?B?WnkydW81OXZIcmV3UDlGcHhmUHVKeXhxWjlpY3hUMGhsOC84c01SbmlXdkZ4?=
 =?utf-8?B?c1pGYTVZY0l4RjMyM2lKWk8yRWpuU2k2a3RYYVRUTmtrVnlxSk56SHNoUjVU?=
 =?utf-8?B?NHBBSEdLeHk3bnYvNldMQW1RWVcydzcyZm1QcnRqdUQ2enB3NHI0dS9aQ1lP?=
 =?utf-8?B?emtibTdDdlNLQkJVYUFVZldZRkJRbmVOZXhyR3dyZ3h4U2w4MUJNc2hlTnNz?=
 =?utf-8?B?NWVYOU1tYTRvUVlzRGJsU3ZOVi9WZjNrR2Z2SGRtWEpLampYdHAxSUNSQUc4?=
 =?utf-8?B?WUdOMmFFM3FBQlNmVFhDVzdRUTdEM2dhRkRxTi9jM2haMHdxQUJBaTUyYTFZ?=
 =?utf-8?B?WGQya1RFbFU0K1N2NDlIMmFHNnFhL2daM2ZTL2lyMVBKalJaMzlEcWR3ZUl0?=
 =?utf-8?B?R3k3ZHFkMWd4T3hhQ0l3UnZZYTBRNEFmdFJrb0hwTVhrekgxbmhBRjhLWkFl?=
 =?utf-8?B?R3JydWFVSkcyclZKci9nbGpocmloRmRFUFZZb1A1c2JPS2VuWmJKY2VNc0dp?=
 =?utf-8?B?MWMwYkFKS2pGMjZiU1prL3ByZHE1Uk9zVlp0RTZ0R0ZCR2RPVTJnQzFTN3Ft?=
 =?utf-8?B?cm1ZcXBwQmlTNTdkVG40VW9lWEthaUd1aWlpWWs3WUJjT1N6bitEQUdNci9O?=
 =?utf-8?B?aHFlb2swa0pZSk1WUzNKSTdWaDFIN3QxQzg3cEFENEJpdnd1TWVzMjlRQkVl?=
 =?utf-8?B?RUMzNWVZSXdJMDgzNHBqZlFQZWNPOHJ6VTB3VEN3N2pudXV5Y3NWRkNMeURv?=
 =?utf-8?Q?jQHm7oQ5HdLzCWBI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48debc2c-9055-49dd-782d-08da194f26fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:01:37.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cq5ruMZYtV06IIU3vLz7mdgjT4aLBpu7wsk1Xk8omXbjk4Yy4kCpOE1YUcCafIuFjsajWtpqg+St14duHUtyNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1378
X-Proofpoint-ORIG-GUID: QNICmuFmFPnRA2csn5y5bXPXuFIwGoSS
X-Proofpoint-GUID: UKokYIoENO55reXst5lHm2vIiV42N9K0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_03,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204080056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 238AeMcu019852
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164159


On 4/8/22 18:51, Stefan Herbrechtsmeier wrote:
> Am 08.04.2022 um 11:23 schrieb Yi Zhao:
>>
>> On 4/8/22 16:34, Stefan Herbrechtsmeier wrote:
>>> Am 08.04.2022 um 10:15 schrieb Yi Zhao via lists.openembedded.org:
>>>> There is a bluetooth service startup failure:
>>>> bluetooth.service: Failed at step NAMESPACE spawning=20
>>>> /usr/libexec/bluetooth/bluetoothd: No such file or directory
>>>> bluetooth.service: Failed to set up mount namespacing:=20
>>>> /run/systemd/unit-root/var/lib/bluetooth: No such file or directory
>>>>
>>>> This is because the directory /var/lib/bluetooth has been listed in
>>>> ReadWritePaths=3D in the service unit file but does not exist. We=20
>>>> need to
>>>> create it before service startup.
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>> =C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>>>> =C2=A0 1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
>>>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> index 79d4645ca8..ee2cdbcc59 100644
>>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> @@ -102,6 +102,8 @@ do_install:append() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Patch python tools to use Python 3;=
 they should be source=20
>>>> compatible, but
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # still refer to Python 2 in the sheb=
ang
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e '1s,#!.*python.*,#!${bindir=
}/python3,'=20
>>>> ${D}${libdir}/bluez/test/*
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${localstatedir}/lib/bluetooth
>>>
>>> Please use systemd StateDirectory=3D [1]. Maybe it is reasonable to=20
>>> replace the ReadWritePaths=3D with StateDirectory=3D.
>>>
>>> [1]=20
>>> https://www.freedesktop.org/software/systemd/man/systemd.exec.html#Ru=
ntimeDirectory=3D=20
>>>
>>
>>
>> Thanks Stefank, but the ReadWritePaths=3D is set by bluez:
>>
>> https://github.com/bluez/bluez/commit/442d211b5f30f00d5ddd69b43385a03c=
1428ac45=20
>>
>
> And who creates the directory before the patch?

There is no need this directory before the patch. The service can=20
startup without this directory.


>
> The systemd solution to create a state directory is StateDirectory=3D=20
> (or tmpfiles.d for older versions of systemd). Systemd supports=20
> stateless system [1] and therefore every service must work with an=20
> empty /var/lib.


I'll try adding StateDirecotry to service unit file to=C2=A0 see if this =
can=20
solve the problem.=C2=A0 Thanks.


//Yi

>
> This patch hide a bug in bluez and the problem should be fixed in bluez.
>
> [1] https://0pointer.net/blog/projects/stateless.html

