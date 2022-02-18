Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C21FC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 19:41:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1846.1645213315196299121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 11:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GUdent2C;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9048396e76=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21IJQ8Z9013765;
	Fri, 18 Feb 2022 19:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=yDgTYdBqj/b6YNHpclWaOLy33bztp7yj/8ZUQZvLEMs=;
 b=GUdent2CMpYFxe34DxDvehMZy1J/JeQ7jriugrm3epu9Xls8J9/L5p/msbVrugrjtpdW
 I1LmpeQUBXxDITQu8VnNjOKK4l/XnPYxli2gRPNDtUA4/cQgjDEnenkpU7gZBxZmdTW3
 32ZhW2q3zbDtwl65lDZftS0KXSDSB+WcvZS3nNm+OWdcRUkclsjVlizjGtiynzXtJGKt
 rzDjwRsGbZ0k0H7T1RBPo75cyuv0nKMTkwzP4vfH5yleNto0AijiAsmkbMIZc/kkKrOq
 HkYvj8QqttpBuqJhSmSUJl7nOhVXx/ObIBvW6Dcxf+78GeEUtbYmW+nHJiNFiNIt7xlE VA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eagjjg1sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Feb 2022 19:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2oJYm6mYlzlYeDxk8eFD45zrcQsmjnARKn20krS8C3b597GNlxUZvjMPlKlOrEqhD14Jc2E/FhNPO7JzPmtB5x2gjNb1Z5DsclS7a5zo+QXgTRMXmqJ69Hdo/sUBfXB7C6IetMOIuL0IYUzwGWQaqWnO9yF9abbreMGYWZMtTf+ORz++1/ihDVizSDP6ahzbsg3eC7zWgiZ8XvO6PJCdcD0Wufl7u43aWeiT8Gl0LWPLnel5DKcfhVFLjF1KBHFGbM+VYRVgQX+5bJb025/6uU2rR6UBHK4d2e98bDbPVoLHuyBGcyKXQZPNCcLKM9Mss5VkHfito454D4QAMO+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDgTYdBqj/b6YNHpclWaOLy33bztp7yj/8ZUQZvLEMs=;
 b=govqREU8TRlqhIeKHGki4Q8LoHbuJ/TmOr95o2iZHcJq5EGOoRV0mFzN/ouNyGL7VRlmhPy7k6hMXQ7DtEe13HT07atItpmJRH3jcP/mfxp3Odoy1yMw9ZUh4Y++ryLhPqry+sS3AaLdOaQzJUyM0si4kkKBxjdBtFXXNCI9an8HkklEwBM3IcGtK/yEIMA1c1ybDh0/4snsbaaEfD0P7xxd3OsBbf1rz95IcmR5nFoAnBWPMUKRxMh+JXF6Or7zJmws3/ttqkN8RNbqwH6bBY4RU23WO0rydFW5MPN9mVi5HOWjG3y2SttvjnQ8DcvMT76OJ/6ua1jkzca14kzZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1566.namprd11.prod.outlook.com (2603:10b6:301:10::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Fri, 18 Feb
 2022 19:41:52 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 19:41:52 +0000
Message-ID: <c2098bee-157e-4f23-d0bf-26fc4b5bb37d@windriver.com>
Date: Fri, 18 Feb 2022 11:41:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
        openembedded-architecture@lists.openembedded.org
From: Saul Wold <Saul.Wold@windriver.com>
Subject: Proposal: INCOMPATIBLE_LICENSE_EXCEPTION
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:300:6c::29) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d9e983-6e31-4bea-3ebc-08d9f316b646
X-MS-TrafficTypeDiagnostic: MWHPR11MB1566:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB156624CABC8D28FB83AF4404EE379@MWHPR11MB1566.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iy7jEE2NXcIsQ0p474WcIhBSx/7CkkI/vORTl/y0ZvEPo4HJ9ZKqgSHCKEELSOnmWQouhcoIdQ6Wt2cpcMJaxwMRwc/3sELItwuflzEkMAbjsd3Q4Wbi9t1HvhRcluBH3Ga3FV1qfHiBHHx2kMriM4SHWvltnv7xs1ahnN1hUs1i0LYFhY2Ib30SnvS+xqbBh7UlgJQkxIE5n/mIpe+9iFSTO/VUoLAYRRmDnrxbLgjIGXYBouEW5SayL84BmgmzmdNNeSx2EOfiAMzfWRWZSvkn26eYBQ0k/F2vQm4ekLivGzEw2/3jQzAxVs2Lrp7KZW8Jph25FPVyAgwUH3PtpxSjFfudBtdee+qhflCMFjE60rzUHGUEYcKub/hAW4Vx94bh2iJLqOB/f4ngbNEzi1H9aASS9qJrF32hQ9pAd9QfJmQbhdvoCTErbX05Ro3B504veRqOKfGUScUkV7wDE0ccZ9Z/dD6P41DFVvN4O501M+Li6HyB9Jbfqv8HcYWEy13v9VWvCFi4ql8RFOtjMIIFQzq51Qdg+xUwdGAeup2z+/nu3p+Lwl+J9Ge3F76KD3KOErC79wbUtn+/W0rnX32EkTgl2dxcU1gr10l5JQpNUaypOV8KXJZ/tTaJ8Wu92t9EQSSzJLLhBnYjENSGCVyr56oztn+B5ST1Kodb5DDEb5/+U7oNzokV2QlHn+8+qUb+IdfZla1o7AfXkwhbWIC4ZaAVMMHf/85Yd/TVnvXtD15dUQAJSYLm7lQMGnUD7P2VqJWZ7sgHu6VFUk0Ymw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(508600001)(186003)(6486002)(86362001)(52116002)(26005)(110136005)(8936002)(6506007)(31696002)(5660300002)(2616005)(66946007)(66556008)(31686004)(38350700002)(38100700002)(66476007)(8676002)(450100002)(36756003)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEx5Q25ZcW9SZUZMb0pPNDhOakpNTDBFYVVsblRFTDExUUlqK0Jrd0daTkcv?=
 =?utf-8?B?SHUzRDFoMTA4dlV2N3hObStNc1hJZU5UY3NlNDRGSC9mTzErTjVUc3d4NUp2?=
 =?utf-8?B?Y1ZjMWYyR0MzSmJ6RWl0NjZyOUswR0lDbmNSaENGeVQzUFhHWFI4YnVFUmpY?=
 =?utf-8?B?VzZQNjZOVi9IQjcvMDFERVFpMXNQbU0xQ0Y4blZZeUJoMk1hb2JXTWhHTFNa?=
 =?utf-8?B?L04rbi9oRlkwak91aVcyQ2hjME1RcklmeE53dWlDWTRJQTRCWi96UmZJaUh0?=
 =?utf-8?B?TzRLSUxmYzRoL3A5eDA4YWdkWjRWZ0xUNW9IY0l1UTB1ZU5VeEhSdmpQeTQ2?=
 =?utf-8?B?Y0VOR1ZKQzF4MnI2Y3FyN2hwMXpjbTZpb2Vmck1QSFlCb0U5YVhMT21wNEtY?=
 =?utf-8?B?NmlXVXZNUm9aMitxUkQ3R0s5NThmam96d1Y3c0JqZm1XVTg5ZTV1T2JjUjJq?=
 =?utf-8?B?RmtjSTZMK2FpSDMvTjJvd0dFRVBENEVYdEVTUDJpWkY5TGNDTEdYSlR6amxq?=
 =?utf-8?B?bCthZzRaYm5YMG9PR285Y0pQem1uVjNCV1BnYzNHa0szUERQVE9nVDdaTVJE?=
 =?utf-8?B?ZmZXYy9OanA4dTcvSUFFZXYwTTRqTGVXTUh1RzhzQ0RMTU93NlJGU2U4U2Zq?=
 =?utf-8?B?aGZVbXFGVS9yK001OEhFSFgwN0M5V09sbkZLVHdvU3hFSmQ2SW5pNEo5dkQ4?=
 =?utf-8?B?ampOdTY2OWYrMEFFMzJHMDc1N05LeUt4cmkxK2RsRUowTG1sSXAxK3IyNFUw?=
 =?utf-8?B?UTN0QmFPSXdzalNOQUFkYkxxUmxvb3BSekpVUlN6dnYxN1A3dk5udFQ2emtn?=
 =?utf-8?B?MVd1WmpwbmxPRXd4VzZKU3VBWWQwTllxMENjSkovbXh1dXBrYk04dmEySmdP?=
 =?utf-8?B?QzFIVFl5KytwR1pqUTVjVEwrZ0lKK24xa1B4WlE1eDltYUtIN0JNUW1RRkhs?=
 =?utf-8?B?OWxIaHNvSlRaTU5PNFUxVjBGR052cHRnemRJaDVBNFMydzl1WEY1YmQyY3U2?=
 =?utf-8?B?cXBGNk5SS3lidk15YUR2RVc1czVlQ1JscDZNd2Y1bmFmYXhaTnBHZTlEdlg2?=
 =?utf-8?B?aVlzR3V0MzN3azY2NGFFbDg4VnozbmJKdTlvaWpiKzZkVmM0KzlhdkJhZW03?=
 =?utf-8?B?S2NTdnFNaTlnVG85d2hUelFCbEtQZEhqbGdGN1crc3VTdzVkdUlJeElZVE9K?=
 =?utf-8?B?QlFJN2pqTEFzbHNwa3lCRmt6eldXVEh1YXY3VzFTMkFSa3gzRUtqRXJiQXVR?=
 =?utf-8?B?bG5LWkhVOTBkOUJ5dUtQWTJxeXZpdHBJbG9wdlI5b0c0RHViNkdGVlJxTi9x?=
 =?utf-8?B?WTRFOHhwOGkwMStLWE10dWRQWUZxNy9MdzY2Sm5Mb0lHZXE4Sk9idTJGcHcv?=
 =?utf-8?B?TDZTSnZlU0FQWm1BT0ViS0c2blhYN0VleDZsaHJJWDFUWjBac2cyK2pNcG1P?=
 =?utf-8?B?K1A3ZlB3Qm5YRlhLdlBTTGkwL2I4aXJxS25MaXdlTXdoOTVIMzIvazVOR2Rl?=
 =?utf-8?B?aklyUXJVZysyeGFwYVVhdk9GMytpUTBVSDRmeWJBRkZmcktSVVRFTlhqc0Jj?=
 =?utf-8?B?aUZGSmZRYno3ZEg3ZGlib2oweVc1REVBYktnVDZYdjNGN2VFajF2S241Q29n?=
 =?utf-8?B?Mk9hVWR2d2VhYXkwSXZtTlZvaFA3bWJDN3Z6OWN4d1JNUDN2RHRSaDlKd2ZD?=
 =?utf-8?B?R2Y4cWpPc1Z0UTY5VjQvdW5uSG5YNUxYekYwc0tCS3lheEYvNXdQSWx5Y3d0?=
 =?utf-8?B?bzFBem9Ob1ZMR1NjUU9xM0h2ejBzN1B1TldrdER6R1FyMU1vcGVITWFWcDB3?=
 =?utf-8?B?MGVkK3FrWk1icExRdUw4bWtkdkZzVzNWcFYzdFprYngzUWVaRnQ4RWJKM2pB?=
 =?utf-8?B?SjZvVWxHTGJ2b1hsL2tDRVZzbVV5SEN3VVJzQ1ZNVUVTc0RlWGtOK0pjTG9h?=
 =?utf-8?B?KzVSaHRadWZrQm1nT1BWWVFTNjJvbzFBc1BoVG40dU5FOW9BOHpmRGx6SkZ2?=
 =?utf-8?B?S05ub2RGMDI3NjhuSGQzVG12akk5ejNNUjRBcitKQjhTOWZLdWtrWDR4b2ZO?=
 =?utf-8?B?Y0YxM1JWSG8zc281a3J3dkpXNlZCem10VU5aUEJHUlBZTUFJeG03RlZSM0U2?=
 =?utf-8?B?aUZJM2NUMUxtQkNORFI4L25VcTVPMUZheFFLN3FXZXZOUkNhUlRZdkpkZ0Zt?=
 =?utf-8?Q?Z1HrxBaizH/I4aNBsuWJjkc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2d9e983-6e31-4bea-3ebc-08d9f316b646
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 19:41:52.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 73tULdhpqttdcuLgoOgNRMSSXLO+yNOBu1/HGi2OTW7HVeXpzrrMQgPmm7MrahIqy0VFNUs4SqP4PcLsm3fs6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1566
X-Proofpoint-ORIG-GUID: 2Nji85qmA-IPjUqgx0ccblVPzGCKXGx-
X-Proofpoint-GUID: 2Nji85qmA-IPjUqgx0ccblVPzGCKXGx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_08,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 19:41:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161951

Folks,

As a follow-on to yesterday's email and replies, I would like to make 
the following proposal for dealing with the changes to 
INCOMPATIBLE_LICENSE and associated variables.

Current Usage:

INCOMPATIBLE_LICENSE is a list of licenses that are considered 
incompatible with a distro's requirements. This is used to compare 
against packages built by a given recipe.

A set of exception variables based on the license name (currently 
WHITELIST_<license>) that contains a list of recipes that will be 
checked against the current recipe (PN) being evaluated.  If it's in 
that list then all packages in that recipe will be built and included 
and the rest of the evaluation will be skipped.

Otherwise, the packages (PKGS) from the recipe will be evaluated to see 
if any have a package specific license (LICENSE:<pkgname>). If a package 
has a license other than the INCOMPATIBLE_LICENSE the recipe will be 
built and any packages with the INCOMPATIBLE_LICENSE will be excluded 
from being packaged in package.bbclass via LICENSE_EXCLUSION-<pkgname> 
internal variable.

The exception is predominately used for GPLv3 related packages, based on 
the emails replies overnight.


Proposal:

Keep the existing INCOMPATIBLE_LICENSE variable with the same behavior. 
The values in INCOMPATIBLE_LICENSE should be SDPX normalized license 
strings.

As Richard has already suggested an alternative variable that is more 
meaningful: INCOMPATIBLE_LICENSE_EXCEPTION with an a <pkg>:<spdx_lic> 
value. Rename the LICENSE_EXCLUSION-<pkg> variable to make it clear that 
it is an internal variable. The usage of the _EXCEPTION variable should 
contain pkg names not recipe name. ** This would be an important change **

Clean up code as appropriate to ensure the exceptions are handled once 
and identified during parsing.

I will start working on the implementation, Monday is a holiday in the 
US, so this should give sometime for this to be reviewed for Tuesday.


-- 
Sau!

