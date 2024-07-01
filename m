Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D225C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 08:26:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15134.1719822355425595695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 01:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=791234feba=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4615u215013362
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 01:25:55 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402hsg17xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 01:25:54 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4618PsFU029936;
	Mon, 1 Jul 2024 01:25:54 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402hsg17xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 01:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knmyqlxERhaV97wLR94rzU9m40KU5wN2EVjrl65xduCqkIR4zyNaZenAEvJTbnSzIPH4BuC+SYzEuh/Bj7N7Jth4q/3faT8W9Bmwu9br/TJF/cydVqhc9WgUGQ2Ob8TbVemLwdp2DJSCkupSGDY4QBx6LGNFCToq6lcCzg2dGnT3b9V/76CigErY8wdVrXukPjyZ9TkKkJHM17TVZ7rN6CmJhe5uXKIPvPO9Zbco5KcIMvDQ57PmFBrACM+ilio+YFqsvmFKYopXGemJTANQnzKU2Kbn2MXsGJMgF0YpMQbfie4CIBZ8Vbt4IqJ5M8Ag2zQvFrk1YAXF0nAo+S9QiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Qt9oBS3n8L5MFxwLZUDqFTscJvO5zF6c5SDeZi9DQ=;
 b=Vldb6fQuGEF2DPqBZ2vXGqz/EqU4us8ucyCOHzvUyB8BkBsQ5hpJETc9g8oFk5cESjpifyYoh6+NA1Fx+GOF7fcsn42Dc5QNXhkR5eP0/s4QhyGWX85sZyeVX/KGKpq5T+MNXiK2seKSA+2n67/sX3YTOm0ODninb/tmBlym2v16RQr7oZM8HPauwMFbOBFarBDMktyu/47h3QoqRrjpa3Z+hjPg77WfSsVKLfFgsov85E89T6S+PKf0MN0Wvj+BdnVXaa/brdncUiIw7nStCiox612m+p8MhDJUNg04TZwXYTq7EAUY/fDh/BoKg58UJgUvSeORkCFetmKGDt3W4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Mon, 1 Jul
 2024 08:25:50 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 08:25:50 +0000
Message-ID: <7e47a093-f395-4413-a069-4435942c84bb@windriver.com>
Date: Mon, 1 Jul 2024 16:25:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
To: Khem Raj <raj.khem@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
References: <20240627070339.2066255-1-mingli.yu@windriver.com>
 <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: d24daf37-9266-4a59-c0a6-08dc99a76a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THEvdXd0T1RLUGpGU0EyMENrWXZTSGl5SjJrWmdaUVdSbHppYTlXaUdrZjNH?=
 =?utf-8?B?TjFxSS9ZbzducmtXNXdiZHduMG1vWXF3QkNOWjhCb2NORXdaVlJWVGE4ZXpS?=
 =?utf-8?B?cFdGaGlYWkxkTDc5clFoWHY1WXU5M3NLUWt3MjlpSkFLeDhIQzA2dWE3YjFI?=
 =?utf-8?B?WUlGSVNseTJONnRyUGhvRGJvZHNIY21lbmdxUmd4RzMrR1B5YlhVejBZL3J0?=
 =?utf-8?B?bzJVRUxmcVVFSUQ5NlE1ODlybGdNUVNNL2c2MC9lWHJMN0VPTFZ5aHgwOHl2?=
 =?utf-8?B?ZVBQL3AzL3hwaWpUS0k3MUpWOTZrSzRzZjA3bG82VkdncnFMT1AyVW8zcnZZ?=
 =?utf-8?B?SlRmWHM3SVBvYWtXa1lxc2RWKy9zRDh3Tk9QRmJ2UWloeU5MbmVrMjQwWW1K?=
 =?utf-8?B?VGpkb3phUy9RY2U3c2pYZ0lYdnIwZVRTa3B5NTliNWtjdGUvV1gwVDhZWDA1?=
 =?utf-8?B?MkJXWndYSjRtN3N4anZVOElXaFg0K1Q1Y1lmc1d2aVVSeERKV3NuSzVYS3JO?=
 =?utf-8?B?aVJsWjM3aG1oVFlyYjNJZlgxTDVWaXBzb21uU3Q5MmxBUWo5NkZlb21JdGJ5?=
 =?utf-8?B?R2ZBY2pUTXhFVzJzb2daZVVBT1puYVRMaDdLWG1UWExyS2ZnZ0RlVmRhUGoy?=
 =?utf-8?B?WS82RzlSWmx2dVRkMlRlMENuYXlrQ1VEMUwxY1A4NUMxK2xBOGR1dzNnSTAx?=
 =?utf-8?B?dG5zWE54UVRKTG1hN3dTVU5KMllSeWN0QWk2K3k2bkV5NDl6UXZZbHpRK2tp?=
 =?utf-8?B?dW9KOU02VWxaZVp4VllYUVprZlQ1NDl4cDlESWt3MXJ1Z0lhOHFYcW9nR3Bp?=
 =?utf-8?B?Z1lYUTFLWWVNZFlsZmpsSmdVWHQxME9JcmZ0TmhkNkowQlN1WjJXa1VaUVNy?=
 =?utf-8?B?RFgvUktCaDArMkkyZ3lYZHovRW1ENnhKZDBxdUhOZzN5c1Q5aDMyRHR6VDdM?=
 =?utf-8?B?ZHR6MUprUnplV2lMYjdkRFRFOGRuTnArWDNNcEEyK3NYUjh0ZlgwNjN3Szgv?=
 =?utf-8?B?cVVTL0luTmtYbDd2UFJtVWFBL2RCWCtTSmFUSVNrTFNmSlpleVdSNGgzRUdW?=
 =?utf-8?B?LzRKVS9vR0o4S084OWI3eUVsN21aSXNLNjJpRFhLT2hhNExNVm1xZjZ3L2Ri?=
 =?utf-8?B?bkRBWDRLVmdrOGxrT2FZWmJWZExxcWQ1ZDdUVHpuUStqTzAveXpyRldVc1ZY?=
 =?utf-8?B?WnpFbkllaDZNeWptV05NNjNFS1NjNHNlRmxyOG9tQ1dRYkQ2dkd6Z3VoZEVO?=
 =?utf-8?B?NDFCNkpHR0F0eU1uUGFQWVovLzcvZzhKbzNKL1N2bnU0K3pJY3Voa1dnK1dn?=
 =?utf-8?B?cXI1YnlraFhzaER2SndDM0xTY3dIZFEwdkhHSGlndXNwY0pQM1d0ZVpjMkhL?=
 =?utf-8?B?M2RNYlpjMlpZa2prajlkYnZsbVk4MmlSbDl3d25JODkyU01EaDMvNXQxbmIv?=
 =?utf-8?B?elJkMGtISEpCU3hOL3gxdDN5Y3p2YlBybVB5M0U2MzNLcDFzNEdKOXBza1pF?=
 =?utf-8?B?VmdZS2ZYWEF4Wm1tSCtPa3hOZDZnaUF5NnVXaGF4b0RUWkJQVGhGTWRRNy94?=
 =?utf-8?B?bWp3UFcxNkdUWjhmRlp0bDdtb2pYSFNqWXRhNkxRbmdRZitrL1RRSlV0dSsx?=
 =?utf-8?B?b0ZGWXpHd0M0amZYMTl6d1N5dS90STYzcUp2QkUwK25HbVZFMlR2TWJrMEt5?=
 =?utf-8?B?ZU9IV2VSUXRWd0I0NTRldWY1UVhDcHlrNHh2T2NiMjJhdGxYenhma2puclpE?=
 =?utf-8?Q?FdZ14qyoRdjuHkWw+g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEFpNWYzSngyOEFEWE9iK2VPOWFHRE1iMEpSR0FyK1BnUWtwS085WHJnTkda?=
 =?utf-8?B?WlhLbjBLNzJRcUsyQ1cwT1M3UE9IRngyYjZ3cUFFSlBXdEY0SXhOSGx6S2xo?=
 =?utf-8?B?QmRoc21zLzFOc09VQjdRTW9YTThFNVh6OEo1Z1ZVWWtva1lDRCswQ1dvOUt0?=
 =?utf-8?B?TFlOdktuM1JUS1NHcVY4YjlBVEJOdnlVbkFzZnBtbGJoMS9WejV6ekR6MUJZ?=
 =?utf-8?B?SVF0eXFkeGg3S1FRbUJkMG9CcXRFM1lNdFRxVE1HTTBJVVh0Z0JXaFdSendY?=
 =?utf-8?B?T0o0Z3NQYjFHQUFNeDByY3Jvd252WDAwYmxzWFpwMys0aFovNU5yazN3N3M1?=
 =?utf-8?B?YzJHRjQ1ZXhtSUJCajRJTEhHZ3hhaVllMGp0eGVhd1BnZnhtQklsQ3d1endo?=
 =?utf-8?B?eUpqaStNSS8xMWpHTlY0eEZkcUlGcnFkWW0ra3hQak5DSVdTeVpEUjJWM3Bz?=
 =?utf-8?B?Y2V0RVJtQXg3MDVnSURwY09PQjlCNW05RVFkVnpoeEhrRlRVeXRUQTZTdThj?=
 =?utf-8?B?N3A5OWw1ckQ1TjRkZk4vRmFVQjdzVktPNm1rbjhyOFBJQ2pmOXpZMk1NeXFO?=
 =?utf-8?B?Q2ZxWXFIb201Zld4anNlbWZCeFMxSmJTRWkwUjRRUFg1bXo2NXRzRTVwSmpq?=
 =?utf-8?B?ZG4wTmwxNlA5aWJ4Y29vSlVQMkVQdlBrQk1wSmttZEhvMmVRVXVsRWlHRkhp?=
 =?utf-8?B?NGY5OUtJcm1KeDRtSWd6U0FOb0hONklobGZ1OFdJUmdWUDA2TVRGaVJIckQ4?=
 =?utf-8?B?aGFyYWdhRlc5NVF6ejM3MjNvU2dOdzBRN3ZzS1R5TGppMkVNN1J3VEZ5T2N5?=
 =?utf-8?B?Tm1IUnViTWNiUzl2VEswOXpGUkJ1MzV6RUdUTXRnMzh6amRIc2Fjb3NnbUJW?=
 =?utf-8?B?dWplaHdNR2FRbVQvY2xEOGFnSHZxZXJ6eWFoUmJtbU1rSzR4SUpaSGYyUm5j?=
 =?utf-8?B?WXRUQmFLNU9hTlVtdnhXclFKa3VtUDM0TjdYYnRaRW5FcVVheGhvbUNPc1Nu?=
 =?utf-8?B?MExuSitrNDIraW9BTEJLbnhsVk9mNTJkRFBwazhqcmp0WlBtTHV3YkVLdGlQ?=
 =?utf-8?B?UFIxZkRYVHZMR2hMbmhOTlJjaVVHWWtBS3dqanJqclMrODJoRDZ1UDJYS28r?=
 =?utf-8?B?SkVoazRtMGY3NjY5Rm1QdUg2VzRpd3FMKzZXaWk2N2tPZnE3cnozZHBRVHow?=
 =?utf-8?B?MzRWSHAva1Ruc3ZROWVuUVBleHQ1ZzZqK3RGbWNVSjRFNnhhTytaZDNlZW02?=
 =?utf-8?B?ZnA4dEx0NUh0MS9nYjNNR2dXQjkxQ21ISUdTR3R4TkJ5NXp4UTFyL1ZhWVdV?=
 =?utf-8?B?RmxOWVhMTFJFdDl2OVBRTGI2ZWUzUmVzcW02S21kbnBDY2tvUSt3ZTA5LzRs?=
 =?utf-8?B?Y1g0UTFUWlA0elMwMHR4S1VGbDVZd2YvT0hhS21BN2xJWWkxMitVcjBwUC9o?=
 =?utf-8?B?RUcySE03WUs4SmJKMkNiWVk0bnV0andMRmt3QkF3UTdGY0U0aTI2TjlHUTFi?=
 =?utf-8?B?Z0VjR0FrNjFvYkpEOHhRT2l3NXIxOUxYc3EwN0U2QnFuVEpqdnBmTGgzOE96?=
 =?utf-8?B?Y1psWStpRlJuNEVYN2ZRc29zMUhaemllR3pCYWNSR0hsaFFKajFhaDdOVEVh?=
 =?utf-8?B?NVVUc09oUHFITlNKS3JPNmpLdFBxeTk2LzdLVC94UXV3MFZaU2JuN2V2Mmhs?=
 =?utf-8?B?MERLK20zRkdwOWdxRUdWZ3RzK3NOa3dPNk96RGRZSnk1Z3Q5eG5RT3FKNmky?=
 =?utf-8?B?MG5GUUVXakhvY0ZxNmh2OGhpaWhuUlhOVnlXTkpqTUhucTc2TFZ4dXJDQ0E4?=
 =?utf-8?B?UUpCbXNmTnBrbzRKQ1ZGSVBiMmJWWEpKOU44UTZNRlhnSHEyK0ZkNys4ZkZq?=
 =?utf-8?B?QVdxanozaHc2NFFPUkUveDV0dm1LaXJEUTBMNnBXY0ZRcEZCVVprdEpxakNK?=
 =?utf-8?B?T0F6Uk1IU2YwaDVlUW1UcEN1cEt2TVlIWTZaamRBK0hVYzBHdnU3Vzd3TXhy?=
 =?utf-8?B?dzZFNnJKMTVveVp1YUdHYzdUTU9tOWk3eFB5REtXMXJvc0tqamlZcmVUbTFa?=
 =?utf-8?B?a0hQQUlxdDRtdmpsZkdPdm55L3F6djZxUjFTRlB2TXp5RXZQbW81VUpIUjBw?=
 =?utf-8?Q?r1CCqDpw5RjeGVTnhgDkf8ZmT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24daf37-9266-4a59-c0a6-08dc99a76a56
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 08:25:50.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzRiQ0XX7SL24TXxKEnuCjJabpGt3fJgUNc2VVKfMSooIGh54kqm07ZZOD6pfEghA7p7n0K4VCxrzP1+CtbtOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
X-Proofpoint-GUID: NJXMgaZTbm4pFVaJ9HTvee4qgxAUdWep
X-Proofpoint-ORIG-GUID: ZOE18wINZB39OQIibqS7_Q6xcr5ZcufH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4615u215013362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 08:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201281



On 6/28/24 02:21, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> I am seeing two XPASSes which is ok but the test runs reports failure b=
ack

It is because the two cases defined as XFAIL_TESTS=20
https://git.savannah.nongnu.org/cgit/acl.git/tree/test/Makemodule.am#n1=20
and per
https://www.gnu.org/software/automake/manual/html_node/Generalities-about=
-Testing.html,=20

```
In case a test that is expected to fail ends up passing instead, many=20
testing environments will flag the result as a special kind of failure=20
called unexpected pass (or xpass).
```
Thanks,

>=20
> root@qemux86-64:/usr/lib/acl/ptest# ./run-ptest
> PASS: test/cp.test
> PASS: test/getfacl-lfs.test
> PASS: test/getfacl-noacl.test
> PASS: test/getfacl-recursive.test
> PASS: test/malformed-restore.test
> PASS: test/misc.test
> PASS: test/sbits-restore.test
> PASS: test/setfacl-X.test
> PASS: test/utf8-filenames.test
> PASS: test/root/getfacl.test
> PASS: test/root/permissions.test
> PASS: test/root/restore.test
> PASS: test/root/setfacl.test
> XPASS: test/nfs/nfsacl.test
> XPASS: test/nfs/nfs-dir.test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Testsuite summary for acl 2.3.2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> # TOTAL: 15
> # PASS:  13
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 2
> # ERROR: 0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> See ./test-suite.log
> Please report to acl-devel@nongnu.org
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> make: *** [Makefile:2064: test-suite.log] Error 1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     acl 2.3.2: ./test-suite.log
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> # TOTAL: 15
> # PASS:  13
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 2
> # ERROR: 0
>=20
> .. contents:: :depth: 2
>=20
> XPASS: test/nfs/nfsacl
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> [6] $ umask 022 -- ok
> [7] $ mkdir -p test/sub -- ok
> [8] $ echo blah > test/sub/blah -- ok
> [10] $ cp -rp test/sub test/sub2 -- ok
> [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [15] $ rm -rf test/sub2 -- ok
> [17] $ setfacl -m u:daemon:rwx test/sub -- ok
> [18] $ setfacl -dm u:daemon:rwx test/sub -- ok
> [19] $ getfattr -m- test/sub -- ok
> [25] $ cp -rp test/sub test/sub2 -- ok
> [26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [30] $ rm -rf test/sub2 -- ok
> [32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
> [33] $ cp -rp test/sub test/sub2 -- ok
> [34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [38] $ rm -rf test/sub2 -- ok
> [42] $ rm -rf test -- ok
> 17 commands (17 passed, 0 failed)
> XPASS test/nfs/nfsacl.test (exit status: 0)
>=20
> XPASS: test/nfs/nfs-dir
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> [10] $ umask 022 -- ok
> [11] $ mkdir /tmp/acl-ptest/test/test -- ok
> [12] $ echo blah > /tmp/acl-ptest/test/test/blah -- ok
> [16] $ su bin -- ok
> [17] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [22] $ su -- ok
> [23] $ chmod go-rwx /tmp/acl-ptest/test/test -- ok
> [24] $ setfacl -m u:bin:rx /tmp/acl-ptest/test/test -- ok
> [25] $ ls -dl /tmp/acl-ptest/test/test | awk '{print $1, $3, $4}' -- ok
> [27] $ getfacl --omit-header /tmp/acl-ptest/test/test 2> /dev/null -- o=
k
> [38] $ su bin -- ok
> [39] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [41] $ sleep 3 -- ok
> [42] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [44] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [49] $ su -- ok
> [50] $ rm -rf /tmp/acl-ptest/test/test -- ok
> 17 commands (17 passed, 0 failed)
> XPASS test/nfs/nfs-dir.test (exit status: 0)
>=20
> On Thu, Jun 27, 2024 at 12:04=E2=80=AFAM Yu, Mingli via lists.openembed=
ded.org
> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * The date such as "Jun 13" should take 2 columns, so the expected che=
ck
>> item "test/sub2" should the column 9.
>>   # ls test/sub2 -dl
>>   drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>>
>>    Corret the check item to fix the below failure in the test/nfsacl.t=
est.
>>    [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -=
- failed
>>    drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
>>    -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/bla=
h
>>
>> * Use the abosulte path otherwise we won't find the expected file blah.
>>
>> * The calls to getgrnam_r would always fail because the size of the
>> buffer was smaller than the minimum (170000) specified in the test
>> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match dir=
ectly
>> because getpwnam and getgrnam should never fail on ERANGE.
>>
>> This commit fixes the following failure in the test/nfs/nfs-dir.test t=
est:
>>
>> [16] $ su bin -- failed
>> su: user bin does not exist           !=3D ~
>>
>> * Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix belo=
w
>> test/nfs/nfsacl failure.
>>    [19] $ getfattr -m- test/sub -- failed\n'
>>         'Can\'t exec "getfattr": Nosuch file or directory at ./test/ru=
n line '
>>         369, <TEST_FILE> line 24. !=3D # file: test/sub\n'
>>         'getfattr: No such file or directory   !=3D system.posix_acl_a=
ccess\n'
>>         '~                                 !=3D system.posix_acl_defau=
lt\n'
>>         '~
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
>>   ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
>>   ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++=
++
>>   meta/recipes-support/attr/acl/run-ptest       |  2 +
>>   meta/recipes-support/attr/acl_2.3.2.bb        |  4 ++
>>   5 files changed, 170 insertions(+)
>>   create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-d=
ir.test-Use-the-abosulte-path.patch
>>   create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsac=
l.test-Correct-the-check-item.patch
>>   create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getp=
wnam-and-getgrnam.patch
>>
>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-=
Use-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs=
-nfs-dir.test-Use-the-abosulte-path.patch
>> new file mode 100644
>> index 0000000000..c48ee9f820
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the=
-abosulte-path.patch
>> @@ -0,0 +1,46 @@
>> +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Mon, 17 Jun 2024 11:22:21 +0800
>> +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
>> +
>> +Use the abosulte path otherwise we won't find the expected file blah.
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00001.html]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/nfs/nfs-dir.test | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
>> +index 33e5f5f..7216a6e 100644
>> +--- a/test/nfs/nfs-dir.test
>> ++++ b/test/nfs/nfs-dir.test
>> +@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the wo=
rking directory.
>> +       Make sure the file can be accessed before.
>> +
>> +       $ su bin
>> +-      $ cat test/blah
>> ++      $ cat %{EXPORT_PATH}/test/blah
>> +       > blah
>> +
>> +       Set up a situation that triggers the bug.
>> +@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the =
working directory.
>> +       fail with "Stale NFS file handle" or "Input/output error".
>> +
>> +       $ su bin
>> +-      $ cat test/blah
>> ++      $ cat %{EXPORT_PATH}/test/blah
>> +       > blah
>> +       $ sleep 3
>> +-      $ cat test/blah
>> ++      $ cat %{EXPORT_PATH}/test/blah
>> +       > blah
>> +-      $ cat test/blah
>> ++      $ cat %{EXPORT_PATH}/test/blah
>> +       > blah
>> +
>> +       Clean up.
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-C=
orrect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs=
-nfsacl.test-Correct-the-check-item.patch
>> new file mode 100644
>> index 0000000000..f990ca4a31
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-=
the-check-item.patch
>> @@ -0,0 +1,51 @@
>> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Mon, 17 Jun 2024 11:00:43 +0800
>> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
>> +
>> +The date such as "Jun 13" should take 2 columns, so the expected chec=
k
>> +item "test/sub2" should the column 9.
>> + # ls test/sub2 -dl
>> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00002.html]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/nfs/nfsacl.test | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
>> +index 4f37322..dfcc323 100644
>> +--- a/test/nfs/nfsacl.test
>> ++++ b/test/nfs/nfsacl.test
>> +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with AC=
L support.
>> +       $ echo blah > test/sub/blah
>> +
>> +       $ cp -rp test/sub test/sub2
>> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>> +       > drwxr-xr-x test/sub2
>> +       > -rw-r--r-- test/sub2/blah
>> +
>> +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with =
ACL support.
>> +       >
>> +
>> +       $ cp -rp test/sub test/sub2
>> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>> +       > drwxrwxr-x+ test/sub2
>> +       > -rw-r--r-- test/sub2/blah
>> +
>> +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with =
ACL support.
>> +
>> +       $ setfacl -m u:daemon:rw test/sub/blah
>> +       $ cp -rp test/sub test/sub2
>> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>> +       > drwxrwxr-x+ test/sub2
>> +       > -rw-rw-r--+ test/sub2/blah
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and=
-getgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-a=
nd-getgrnam.patch
>> new file mode 100644
>> index 0000000000..2fea254fec
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrn=
am.patch
>> @@ -0,0 +1,67 @@
>> +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@red=
hat.com>
>> +Date: Wed, 19 Jun 2024 11:11:30 +0800
>> +Subject: [PATCH] tests: fix getpwnam and getgrnam
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The calls to these functions would always fail because the size of th=
e buffer
>> +was smaller than the minimum (170000) specified in the test implement=
ations
>> +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because g=
etpwnam
>> +and getgrnam should never fail on ERANGE.
>> +
>> +This commit fixes the following failure in the test/root/restore.test=
 test:
>> +
>> +[21] $ chown bin passwd -- failed
>> +chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
>> +
>> +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe get=
pwnam_r
>> +and getgrnam_r")
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00000.html]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/test_group.c  | 2 +-
>> + test/test_passwd.c | 4 ++--
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/test/test_group.c b/test/test_group.c
>> +index 96dd612..42d6b07 100644
>> +--- a/test/test_group.c
>> ++++ b/test/test_group.c
>> +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
>> +       static struct group grp;
>> +       struct group *result;
>> +
>> +-      (void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
>> ++      (void) test_getgr_match(&grp, buf, sizeof buf, &result, match_=
name, name);
>> +       return result;
>> + }
>> +
>> +diff --git a/test/test_passwd.c b/test/test_passwd.c
>> +index 9428bf8..97f2673 100644
>> +--- a/test/test_passwd.c
>> ++++ b/test/test_passwd.c
>> +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *p=
wd, char *buf, size_t buflen,
>> +               *result =3D NULL;
>> +               return ERANGE;
>> +       }
>> +-      last_buflen =3D- 1;
>> ++      last_buflen =3D -1;
>> +
>> +       return test_getpw_match(pwd, buf, buflen, result, match_name, =
name);
>> + }
>> +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
>> +       static struct passwd pwd;
>> +       struct passwd *result;
>> +
>> +-      (void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
>> ++      (void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match=
_name, name);
>> +       return result;
>> + }
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-su=
pport/attr/acl/run-ptest
>> index 3af75c84fe..bc7947c3ad 100644
>> --- a/meta/recipes-support/attr/acl/run-ptest
>> +++ b/meta/recipes-support/attr/acl/run-ptest
>> @@ -6,8 +6,10 @@
>>
>>   mkdir -p /tmp/acl-ptest/test
>>   cp test/test.* /tmp/acl-ptest/test
>> +export EXPORT_PATH=3D"/tmp/acl-ptest/test"
>>
>>   set +e
>> +rm -rf test-suite.log
>>   make test-suite.log
>>   exitcode=3D$?
>>   if [ $exitcode -ne 0 -a -e test-suite.log ]; then
>> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-sup=
port/attr/acl_2.3.2.bb
>> index 6178473873..5ac085c322 100644
>> --- a/meta/recipes-support/attr/acl_2.3.2.bb
>> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
>> @@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz=
 \
>>              file://run-ptest \
>>              file://0001-tests-do-not-hardcode-the-build-path-into-a-h=
elper-l.patch \
>>              file://0001-test-patch-out-failing-bits.patch \
>> +           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.pa=
tch \
>> +           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.pa=
tch \
>> +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
>>              "
>>
>>   SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73d=
e5205bac0bf6058a2f7c"
>> @@ -65,6 +68,7 @@ do_install_ptest:append:libc-musl() {
>>   }
>>
>>   RDEPENDS:${PN}-ptest =3D "acl \
>> +                        attr \
>>                           bash \
>>                           coreutils \
>>                           perl \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#201188): https://lists.openembedded.org/g/openembe=
dded-core/message/201188
>> Mute This Topic: https://lists.openembedded.org/mt/106904866/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

