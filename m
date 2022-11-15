Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BBEC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 18:21:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1917.1668536501720747685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 10:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=hqUI5B4N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83182f8b2a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AFBSGQK028102
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 10:21:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : from : to : references : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=adZgOspGYZ4Wp/RByUvXU9vmfCPk1VIa0smLbKguMmg=;
 b=hqUI5B4NQ2JcX5w8tDWGhL7I8+Wx5F0XDSJHQeE/1f8ZJatYKV1PdvhCuJJhkRZVXzjN
 TUiF8wElSg2YFyPkgwbraLwmxbZfBONtsOBPyoGUwtQZ8/0QJXUFfuvfKqu/BT7LwxAV
 ffdASwX1s2MO/WBgt2R5CWyT4wn+Gu7KUakDjlW46Ta5NUZUFIaVEK+hCTOUUkjekscC
 jIRUMHc0y3OBOhs/X1H5IyIU4m00usQQGHpHSmS8arN5U4iu3V0gXzoKKJ3LDeTFG82+
 xevKTePwNDCYYX1B9NygnbPAzxGbKHzJCsMb8LJVWflqgXmhZ2rzBDXZNiqxzCyxt845 vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt7n9ak64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 10:21:41 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFILeNo015019
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 10:21:40 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt7n9ak62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Nov 2022 10:21:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4g7Uuj+MqdcMpQTcXbTyE27N9OPW8F3FihUb0bnWdK9ogTUZjk7dvdCVEV4q85L+XCYKQH408RIRlONmLUiKZWbfyMOiABWjK6OgXIunBEt8N8J2IueBPafTMpJVSDLjiemfmjBo9wAY3TRmgk5npBNny+Lq6xjtP/MOsIoeAQiDpJ8LOJceqz9tSn+2TV8M/CDUf31TYEhJc8gNYto6WQ0scvhBcRFcNt46YW7KnxWXtNqgwmYnMSEiUfILS1gKtdoveH51IGJE8tpmtaUNJkk6doaYfLs17gk8P1Mt/PvK7itP6qHJ1O6Tyy7eGFq+n85Ysbf95GSjDB0CpbVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adZgOspGYZ4Wp/RByUvXU9vmfCPk1VIa0smLbKguMmg=;
 b=aNbIciGLNsKPQ+czLmoayaIaTPOWgdC6tuJzcW/z4CrZnjbVgetn09ch6+qj7RRgvYvteNWPjcODd2Y3lu9QkpTHGkb5Dlle/mCZHHAGKIHBrGS2dXM3VAzyHNtq8NPfhm2Rr9C8To1y00lWL0dUMDjYWOP6EJj6OwVrXnxtbh+o+arq3wrXD7XTxMKEiQpWaXAeA1xOUDOJs0lfuaiRvwpZjOYGD7RkR23/s0YIluyA0nYAKCMPee0U1LEecSIEYNYak8g2vDvWsQWi5wyIkNUBAOLInnE95N54ghFRz7XYhaN4gTQ6WuC5x101t6VpDYPd6ANr4JtFfLS0CFXnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 18:21:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 18:21:37 +0000
Message-ID: <2c017856-14ae-b64d-9ade-1a40d6d5c3bd@windriver.com>
Date: Tue, 15 Nov 2022 14:21:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][kirkstone][PATCH] sudo: fix CVE-2022-43995 potential
 heap overflow for passwords < 8 characters
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: xiangyu.chen@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20221114052721.21489-1-xiangyu.chen@eng.windriver.com>
 <1c2bdea8-c90a-cc38-93aa-e73343395714@windriver.com>
Cc: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <1c2bdea8-c90a-cc38-93aa-e73343395714@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9b4470-1e25-4842-6976-08dac7363bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mFbuw/q1DAlO9R+Y/wla0Wow7S3i+1hmgxkQLlhz6LsZfkJ6nLFbVdLi/0cK/oz+13GLjCAg6wDHsW1ThHEPVKN68iT/IwzXc+rybwqP2E0nUGXRr1+8wP2i6mmFtMbeFTUdmyQ/SvBGBndIZzFNJoDi81EoQFp65CqEq1Ez8UqISYN22osMSla+aQHMpQ37sqxhD4EAzoRpkBFiuh20bnWuUodmwG8VZ9LcpaKuymdedXGNjQhKiO6vUDWXgalMnTJW7OPtdcDwYC+5Scy2gPDXpyEygQ5UMogxcASMAIHMvANUbT3lWmo+s09AQudMgbwE00Y6BrY94c6B/wHmlxqyFh5rQuKQC95H7Wcr9d08BgQqVwH4ZBStx8lfMBbMY2y5DeID/hbVI7FG/EsU5E9c+gWgrpMndkown9TaLlCWYCOugCbpoc34kMj1aCgwK/dhktqWhc/MgRNF8ehk3alhgj0HBJnMkd1oAYtov5vwGkDnzefhHWlTTrVv26D37/BchG0c1jyQXBS9Q5s9SQep5e27xSvZkGDCu39sKjp6AStTTtufGQ3bjrJ8qQNi7lgQeIX1W+1gyW1RXV4Mpls5ZDuH6E0LjQVgXG59BiPzMdG+eRL2Ud4sPoQpQhGpxJbrc9i/voLmLPYfwZX93aE4rOjGnuz9h8xqwQrr1DrgWXzhWPcDEqVFRWFB/CqjrX2yMzXALL5T7i4wcS6MDzX07gTVc6H1DKRtJ8MdBZZRZPY4Ei8ExSQWrG6UiqrwAyuETHfkEwrm19goB9TELZqfM2a33Dvo8F4hz7tUtsI/m7uMO2J4nnp2DVIL6fXqzjDND5DbqKJM/aOK7KArlA0shYH2UZhuJiOq+skbiHw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(451199015)(31686004)(2906002)(4001150100001)(66899015)(66476007)(66556008)(66946007)(5660300002)(8936002)(8676002)(4326008)(41300700001)(36756003)(53546011)(478600001)(186003)(107886003)(6666004)(6506007)(6512007)(26005)(83380400001)(6486002)(966005)(2616005)(6916009)(316002)(38100700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnVDd0tLODJWakI3TVBDYmZJcXZibk9Qa1dYVzd6cURpSEVKQXRKbFRXUTVG?=
 =?utf-8?B?eU5hNHRCa3BXSGZyNXRKa3kwRlArbzMxTlJMWjV6M3hGUWxWMzZsRVZqYzFZ?=
 =?utf-8?B?OFp2dmF0ZUlMOVZnbjh3d2ducC93RjdOYWNqdW05dERJRnFmS0hzaTF3U0tY?=
 =?utf-8?B?TTZCaFh4aGpIOWNyY2FzTEg0WmhnandFN3V1bWlEamxxT0VBYVhkcnVRQ1pB?=
 =?utf-8?B?bWJLMnNiYTBOd3BhNkp1endGdWIyWENQNXZlMVNyWlJsZ2FpaG1IOVE0d1VV?=
 =?utf-8?B?ZFVxcG51Rlc5RkdSWlNkZWtSTzU4TmZGdk9qMnBYc0hsckJFSmZwS0pwVXhm?=
 =?utf-8?B?WDREdTN2eG1HUlk0ZzRsZm1USTd0UkhyTFJMRkFFakxCUzlyajY5V0VKTDhE?=
 =?utf-8?B?YW9FU1VtbGZmSlk3dHFRMk10NDlYcjBoL1J6VXY4YnpOekdWemMxYnRuTUVV?=
 =?utf-8?B?QnZoSUhVdDltWkFleW5yVXVZYzJUWFduMUFlUDVVRWNvZUEvNlpyWDlLYlNI?=
 =?utf-8?B?OVIvL3BBOFMyTDdydUwwcUdZdTRKWndJeEJERHRCMlhJd1AyNUliVm83c2py?=
 =?utf-8?B?ZStDZk9JTTlXRUpUQWh3RE5LOU1iWUl1ZDNSUGhSVXhieTRFaEZDQ2E1OXJy?=
 =?utf-8?B?UWZaRHVWM0MzTHExRlpaVGlVNkx4Z0RHMVpLQmVkdW1Ya3Z0Y0tpVG11TnRj?=
 =?utf-8?B?OFlLMm1WSXpmNktZTURudU9MN2JtNDVNVzJ4amJDdy9rNmg0cUNpWmdxalFV?=
 =?utf-8?B?QWRFV0dRL00wQXpobGdsZkFiMzJ0d2ExWlpLUXFkVnV0RWJ5MUliTXZpUlJu?=
 =?utf-8?B?UDN4dEtDQVB2aFBya0ozY29GSHlUVEVHOVdsTG5vV0xlZjlTUUJMU0VtUVkw?=
 =?utf-8?B?MTRvbkF4djdIMkVlM3c2Q3JQbG9Gc2RGMWY4WlpId0gzOGJySFlUREhva1BH?=
 =?utf-8?B?d0pkcmtoZkNhZDRJaElGY1h3Rmg0Q2wvNy9GSExyZFZtV0FUR2dIcWRLWnJs?=
 =?utf-8?B?QXNOazBNSFhTajdVNDlncXZTUGhqZDhFOCs3R29Kbzg5WHNnazZYTkJPQ1F5?=
 =?utf-8?B?Q1FyUU5rRmk5UURQbkg4YVN3U1FJYnUwOFBmNnF4cXFMMTcvamFoSW5zcjBu?=
 =?utf-8?B?UjFueFNPUGNubFozSVlXUm9lVzdOMTVrWi93d1k5TnNBMkdRcU90UC9pd21u?=
 =?utf-8?B?YURzOHhUaG1mUU5rci9UUlZOQkIwRGJBT1FFY01uRDJxN1dzRWtKczJWS2pm?=
 =?utf-8?B?MDVUNzhiaHlaYzNhaytsTTRPM3QyTkpJYVNQTkxVR3c0TXFHUWZ4a2k4U2Vt?=
 =?utf-8?B?TURyeDRXRGNZMjNOYWs2a3QxOGZQN1ZVbHZvY3ZCYlE0YkYyUlVnVVZ1elJm?=
 =?utf-8?B?a2hTWWhWR3JxUWhmOG9YcFJBTUIxRFV0aEc1cEJuYzdTaXhTU0hDeHNqbnl5?=
 =?utf-8?B?MWdDYXNIRGtPamk3M2NqcWh5Rjl3SU5CcUR4VXJqUmhIblVyQVQwQXF3MnFL?=
 =?utf-8?B?Vk9WcU4vUW85cnJGSnNZekJOU0U1dkJVTHZRdlBsK2xGOVA3VEwzNlgxQVI5?=
 =?utf-8?B?UHBoRms4RHBtSjJTQkRJMCtLVWkxR1hFVE1HaFM1bGVaV0VMOHJjZ1JuL2Jn?=
 =?utf-8?B?Tk1Lb0xaNEJhTTNYMFI0UTNTaTZoQWcrRTJsQ1E2R2RwWWdlUVdhNFh6WXF2?=
 =?utf-8?B?b3dxcDJuWHpXa3kwa3Z4c1cydmQyVWR4am1ETHU1NGRqUDlORm1CYUtROGRH?=
 =?utf-8?B?Y0ZtLyttTEJYWWhGMEdBVGZGU044NFFsU3lZN0FtSGRXUGFrMkF3b1pRa3Vx?=
 =?utf-8?B?aHFaanZMcE1GQnpjaWcxSGtidFVrOVNYcFhPSVlrM282d3UzTnh2NDNqdlZX?=
 =?utf-8?B?OTJxSDhwZ1UzajRlSTRYaUp5UmxmQTRxRjhvbkZMMUE2V3k1TjVDaTFQRk1j?=
 =?utf-8?B?S282a2hHNE1jMXdPTVFoOUNtZnFaUjhMTyt6TWZYdUJnYzlNV2lnWE00R21J?=
 =?utf-8?B?dmRERVNhNzNzTExZblJZVlU4WmhDSzhNU3FBSVpYTGVFMTJNeTE1VDZpb09J?=
 =?utf-8?B?emRMbXNiU1BzOGRmUzZJSlJUY05XakJQUWdocW9FOU5DZGVvZUJVeXRyT2Nl?=
 =?utf-8?B?MnMzUHpJSlRVTklQTmpvaWZNNGxnN0hJZ3VpYXcyMGVCblBMajdzb0RhcUUx?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9b4470-1e25-4842-6976-08dac7363bbd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 18:21:37.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMih6gO/ANpbtK9dUKIGWmebgsS63Kqta4LnJIF0w+j8Gqj5vt7T1cPDSGmdvhyG5qWTTIwOoHCfnhVVTgE+qX+QNICjymuKY/mZS3d/opw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
X-Proofpoint-ORIG-GUID: GA1PbJut1LFa2JQ9yg6JSi9RrFDMOmgD
X-Proofpoint-GUID: fo3RZzs5lU4RIn9E6KQMiQqbMeRQsTVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211150124
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AFBSGQK028102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 18:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173354

On 2022-11-15 14:08, Randy MacLeod wrote:
> Thanks Xiangyu but for kirkstone/langdale I think we should take the=20
> patch update:
> =C2=A0 sudo: upgrade 1.9.12 -> 1.9.12p1
> that was sent to the list for master since it includes this CVE fix=20
> and more bug fixes:
>
> $ git log --oneline SUDO_1_9_12..SUDO_1_9_12p1 | cut -c -99


Oops, I'm wrong. Please consider taking the patch backport for now.

This patch is for 1.9.10 and master is on 1.9.12 going to 1.9.12p1.

It may be sensible to update from 1.9.10 to 1.9.12p1 but I haven't looked
at that yet. It seems that the 'sudo-1.9' branch (1) is stable so=20
someone should
look into the list of changes made on that branch to see how disciplined=20
the sudo maintainers
have been.


../Randy

1)

$ cd .../sudo.git

$git branch -a
 =C2=A0 main
 =C2=A0 master
* sudo-1.9
 =C2=A0 remotes/origin/HEAD -> origin/master
 =C2=A0 remotes/origin/audit-server-tls-support
 =C2=A0 remotes/origin/main
 =C2=A0 remotes/origin/master
 =C2=A0 remotes/origin/sudo-1.7
 =C2=A0 remotes/origin/sudo-1.8
 =C2=A0 remotes/origin/sudo-1.9
 =C2=A0 remotes/origin/sudoers-iolog-tls
 =C2=A0 remotes/origin/tls-config-default-values

$ git branch -a --contains SUDO_1_9_10
* sudo-1.9
 =C2=A0 remotes/origin/sudo-1.9

$ git branch -a --contains SUDO_1_9_12p1
* sudo-1.9
 =C2=A0 remotes/origin/sudo-1.9

> 7a103879a Merge sudo 1.9.12p1 from tip.
> 3df1e9a07 sudo 1.9.12p1
> 7ba318470 Include time.h for struct timespec used by sudo_iolog.h.
> b2c8e1b1b Display sudo_mode in hex in debug log. This makes it easier=20
> to match against the MODE_ de
> 7ec1ee0e5 bsdauth_verify: do not write to prompt, it is now const
> d242261dd Store raw sudoers lines in the debug log. Also add a=20
> "sudoerslex" prefix to the token deb
> 966731311 The line numbers in sudoers_trace_print() were off by one.=20
> The line counter is incremente
> 4da22b101 Make the second arg to the sudo auth verify function const.=20
> This may be either a plaintex
>
> bd209b9f1 Fix CVE-2022-43995, potential heap overflow for passwords <=20
> 8 characters. Starting with s
>
> c78e78dc5 Move debugging info from hostname_matches() to host_matches().
> 6a3fb3fd7 Add debugging to sudo_set_grlist() and sudo_set_gidlist().
> 366217571 configure: better test for -fstack-clash-protection The gcc=20
> front-end may accept -fstack-
> 6a2075b67 Check that compiler accepts -fstack-clash-protection and=20
> -fcf-protection. Previously, we
> 794449419 Fix compilation error on Linux/mips.
> 3d2b84ed2 Added tag SUDO_1_9_12 for changeset b53d725f7c88
>
> ../Randy
>
> On 2022-11-14 01:27, Xiangyu Chen via lists.openembedded.org wrote:
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>> ---
>> =C2=A0 ...95-potential-heap-overflow-for-passw.patch | 57 ++++++++++++=
+++++++
>> =C2=A0 meta/recipes-extended/sudo/sudo_1.9.10.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>> =C2=A0 2 files changed, 58 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-hea=
p-overflow-for-passw.patch
>>
>> diff --git=20
>> a/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-h=
eap-overflow-for-passw.patch=20
>> b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-h=
eap-overflow-for-passw.patch=20
>>
>> new file mode 100644
>> index 0000000000..be52af27e1
>> --- /dev/null
>> +++=20
>> b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-h=
eap-overflow-for-passw.patch
>> @@ -0,0 +1,57 @@
>> +From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 200=
1
>> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
>> +Date: Fri, 28 Oct 2022 07:29:55 -0600
>> +Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for=20
>> passwords < 8
>> + characters. Starting with sudo 1.8.0 the plaintext password buffer i=
s
>> + dynamically sized so it is not safe to assume that it is at least 9=20
>> bytes in
>> + size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuz=
z.
>> +
>> +Upstream-Status: Backport from
>> +[https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27=
ae3329c677d48050]=20
>>
>> +
>> +Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>> +---
>> + plugins/sudoers/auth/passwd.c | 11 +++++------
>> + 1 file changed, 5 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/plugins/sudoers/auth/passwd.c=20
>> b/plugins/sudoers/auth/passwd.c
>> +index b2046eca2..0416861e9 100644
>> +--- a/plugins/sudoers/auth/passwd.c
>> ++++ b/plugins/sudoers/auth/passwd.c
>> +@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth=
)
>> + int
>> + sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth,=20
>> struct sudo_conv_callback *callback)
>> + {
>> +-=C2=A0=C2=A0=C2=A0 char sav, *epass;
>> ++=C2=A0=C2=A0=C2=A0 char des_pass[9], *epass;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 char *pw_epasswd =3D auth->data;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 size_t pw_len;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 int matched =3D 0;
>> +@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char=20
>> *pass, sudo_auth *auth, struct sudo_c
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Truncate to 8 chars if standard DES =
since not all crypt()'s=20
>> do this.
>> +-=C2=A0=C2=A0=C2=A0=C2=A0 * If this turns out not to be safe we will =
have to use OS=20
>> #ifdef's (sigh).
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +-=C2=A0=C2=A0=C2=A0 sav =3D pass[8];
>> +=C2=A0=C2=A0=C2=A0=C2=A0 pw_len =3D strlen(pw_epasswd);
>> +-=C2=A0=C2=A0=C2=A0 if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epassw=
d, pw_len))
>> +-=C2=A0=C2=A0=C2=A0 pass[8] =3D '\0';
>> ++=C2=A0=C2=A0=C2=A0 if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epassw=
d, pw_len)) {
>> ++=C2=A0=C2=A0=C2=A0 strlcpy(des_pass, pass, sizeof(des_pass));
>> ++=C2=A0=C2=A0=C2=A0 pass =3D des_pass;
>> ++=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Normal UN*X password check.
>> +@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass,=20
>> sudo_auth *auth, struct sudo_c
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * only compare the first DESLEN charac=
ters in that case.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0 epass =3D (char *) crypt(pass, pw_epasswd);
>> +-=C2=A0=C2=A0=C2=A0 pass[8] =3D sav;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (epass !=3D NULL) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (HAS_AGEINFO(pw_epasswd, pw_len) && strle=
n(epass) =3D=3D DESLEN)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 matched =3D !strncmp=
(pw_epasswd, epass, DESLEN);
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb=20
>> b/meta/recipes-extended/sudo/sudo_1.9.10.bb
>> index aa0d814ed7..e1f603a125 100644
>> --- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
>> +++ b/meta/recipes-extended/sudo/sudo_1.9.10.bb
>> @@ -4,6 +4,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.g=
z \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ${@bb.utils.contains('DISTRO_FEATURES', 'pam',=20
>> '${PAM_SRC_URI}', '', d)} \
>> file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
>> file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch=
 \
>> +=20
>> file://0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch=
 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 =C2=A0 PAM_SRC_URI =3D "file://sudo.pam"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#173225):=20
>> https://lists.openembedded.org/g/openembedded-core/message/173225
>> Mute This Topic: https://lists.openembedded.org/mt/95013602/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
# Randy MacLeod
# Wind River Linux


