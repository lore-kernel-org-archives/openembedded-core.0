Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D68C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 18:26:11 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.18987.1675448770861401884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 10:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=ypdM+moh;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=139827a8e5=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313Gi6Ft019251;
	Fri, 3 Feb 2023 12:26:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : from
 : subject : to : cc : content-type : content-transfer-encoding :
 mime-version; s=PPS11062020;
 bh=DaT2WMCKB0iMFOSvLcfV6CXpygMQWZDBEqDnK7b+x5s=;
 b=ypdM+mohPHUbbA4tQ5NouYQ+F/tTK78XTans0+qqjjh9i8lm/ZQIROUV+4JrCWOtQyLh
 7fDN2pVagQon3OaXfxZZ7tFAUX5tR5fYr6nduvj40qa14fVtGCHlg4MtXaXKhF5wc/o4
 HFSm81B2m1y1fDI7eexbN6SM+eksm6Jbl5GAa5bg5uVdkUFiegIaP3mfmJ32b/50d9uc
 L3OQQDdqcQ70UTR2vFFwqG+mculMjl0cFge8rHUFOX1gkjOrJSST9XheSsGeNZ34Gr++
 1uZwRSq8qEMBXycYvCXxCqngeivhlmQIcj9xroyvKkpezROa5dAGD+WUAjsr/THLOeQB Rw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3nfp68kgn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 12:26:09 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO1d+g45t6S1ndxKNy4a8rWQngDo7FQLTP6z1SYINFk97u5umnXbMjt8TySV7s9VL90GpoWFxtlyuxYLBodsAF/O1nuaG5TE6GpZ62Kgqf6uO3E6SXxExlvqfGYq4QhGoERsKEj4cq+LdOKRl8g2rFbTLNSjmDrZjfw9ciNbM7yLoUd4KZuF3q/RAHlWpMESvuhydBm652k29wV1yF5uxbOVs7jh4II+0bqgdf54giemLMmBN9EQhIRe2X0v4sIyowIDNMPocDXkPg/zlKS4GE81tFSLhD/r2QIndZxLedlMEcQZvcnYfOHuCgDsCd1eZ11rnsNmEWtXHZXlNvuiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaT2WMCKB0iMFOSvLcfV6CXpygMQWZDBEqDnK7b+x5s=;
 b=V7XEGT8xFUFgEhZ5vMxP25gPKQn/ThXj9WGsDLj4+WKRqh0tQ5XXmI4A/iuAWjE+nUzrKmdGq7IXPoM3QGVzwbu7O7xL7LlXKqiOzvlAYUagvNuhp8Wg4vWRopQYJj0O4sZMYPyZkp4QGv9lR18a6Jj68gERhP+w8E9XONT7d+xcWNYArvUc0LtJwczEcki2fZewQpumVzh+ikCATUePgH3/x53Dz3s31UeIGqpXeTWmpMmS0oY6t0YTVmHwXWptVKsiF2gSg/O8EqmY3eUhALu3zMgFW+8Mp1MD08MKYjgxeDpsVpt3hMHAqWhjS9BQhDo4lQF03UBvAal46xfZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaT2WMCKB0iMFOSvLcfV6CXpygMQWZDBEqDnK7b+x5s=;
 b=q5fVOFrTARX+/n6yEQxjVfCwGN1W88tRqAkIn55irP4d1cFjCp5coH52c3liDnODXs+rngDHgwmJceLFyvjPuHz/79aoK0RjvyYZZ/QWHphyR44F617xBUJTaerN2X53+FsnD0v896U4Lv5x4T16T8v27ZQJo5ExDYzqi2CJrfI=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SJ0PR04MB8341.namprd04.prod.outlook.com (2603:10b6:a03:3d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 18:26:07 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 18:26:07 +0000
Message-ID: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
Date: Fri, 3 Feb 2023 12:26:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Subject: SPDX 3 and OE-core CycloneDX support
Organization: National Instruments Corp.
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:805:de::26) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|SJ0PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b303a8-6f5c-4965-04be-08db06141d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gSryIR/LZEFovGD2EbBb8AjUDqP8huga1hbTUKljY6aM3J+F+sxaX5jVrOANgOBO5QOst/EdthzCOr7nusC0SaRBV93c27XS3ffvx1lBOiiEftnFJSLXyrogsHpcTT2g60znim3gMujXPe8hnlYA43Ovgl+ENNCDIqBttmCzgdJvAJMTMsTklfSbfk3wcx5ecojn7FRjxqMyKcLg95M/PKp1RpxrdOEtf+phklOUpSD/RfQoI6/TKOUiBvJMPly+znnkiQgbl3L6z2SHTecFxQgv7x/iG1ejg5XsXx5KdOGv7LN6p7GcWwKGZ6ozOS6NTW4heLE4YefDNxreF8u6tHCsGott10MK9sE4a5RLQsMmymXbqS23JDMOPPQyO/CukMUMO1PLiJfOFNKljLGLJugcbEmI2rTY9/Nk6U+JVt5DvlPcy6MwH6sowb81ryEafMaM4YP2ObcwYxlY2ld80bKvmPFKFfvhtJl6hUq0kMXlwu/ToOUvXdnqTOF6wCi/k+47YDeDZcjxGhapqqweA1MXuV9LqrSQAYKYhISdlxjnGIHwKwqxjIuZL0xsMFnUKEHWig1Zn1JNH8R2V8O8bLWKcArkPaSn3/zmgHoZ56GM2gnRz+skcLfGM8kExfiw/7C1H9ZwZ2vUUya0GTxw00tZBVsTT3IvUbqUH2wwOE/wlD2yct1lyildvfUzP2awexsCOmW1Ql8eWuGHjNcIj17agrOH/SIAGoK6OC5w1bCk+R5MgpuY2p36u7bZ7nliURY/Mei0h3Pny4wsaApXEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199018)(41300700001)(6506007)(36756003)(2616005)(478600001)(6486002)(31686004)(26005)(966005)(6512007)(186003)(38100700002)(4326008)(86362001)(8676002)(6916009)(31696002)(36916002)(66946007)(66556008)(66476007)(5660300002)(2906002)(8936002)(83380400001)(44832011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1pURXFWRTlaN1hsSXJRWTVoVU96Tll6STR0VVdTb0ZIeHZnUXVXWDFEMjNP?=
 =?utf-8?B?V2Y5eTR6VW1rOEU3dDNFd0VsQ2g0UllaTnlKMzlDa0YxeVJybFBwOGZWOEx2?=
 =?utf-8?B?REEyc2xMN0YyeXhEYlp5UVhhWFBkbGpKSXdyS3RSaXdSbnFSWnZtTEhxUmJ3?=
 =?utf-8?B?WGJMeGhNOS9GVmZXYy9pSmZCRnR4NnNuaU94NFovamUvTG5oYUNmcjNKaUlL?=
 =?utf-8?B?VlFTcWE5WmxRVXBrSzdXTDNrbVltRmlURVRQZTQyVnAxV1hQZmdvVkhZYlMr?=
 =?utf-8?B?ZDNuVFNJWnpJVWFtelFReGpiOEZGSUVpWFU0U2pUMmV1TWpWQ21ob3RqNlR1?=
 =?utf-8?B?aEdHaVljdVN4RnBSM1VIaTdLbXJ0SEQ0TjdseDU1eW9Rd2xJdU16VExyblkr?=
 =?utf-8?B?SnNmcFM4WS9OWWUxN1NGMWlnTlBDQ0dKL0hkaEFEZ3UzZjY5bGRQdWFmYWRK?=
 =?utf-8?B?RUxYZjlvcUY2Z2RHSUdjUGlENFVUYkVjMFdqd29hcXhBT0VzcG5qd0svL2lr?=
 =?utf-8?B?NmdFYVk5a2dEbXFqZVRvNkM3QmEzbnlzVC9GT1RvR1ZxeUdVLzU3OUlPSEln?=
 =?utf-8?B?ZS9IVmIwbXQ3bitwek1iT21EZU1lSGExcXhRSmVxREpIYSs5TWJmNFAzUFhV?=
 =?utf-8?B?NkRGazJVTjlxdThIZ0lVVEJ1SjhPbGowYWVMaElIVW5NODNFQmNjZEVrMXFE?=
 =?utf-8?B?NldBMStNeklrZWRIejdwdmxTTmxyZGpXM2JjV1d1OEk4QUlaOThobHpIckVJ?=
 =?utf-8?B?THlsYUljTWJOVk9veTNka25Wc3F3RlBROEYzQzZUb1pqbER4WEwrd1NrcGhR?=
 =?utf-8?B?YXFHa1hIVVB6UmZ1Y3p4UjQzWnZFbmxPb2tYRXNxcGE1VktYSHE3dW5FQm4x?=
 =?utf-8?B?bE9Gd2p5bUFyRWhRODl0V1lLejJxVHNVcTRsekFvUGFCWUIrR1pqZW1VOW5j?=
 =?utf-8?B?S3E1dlpPSVZYay9qdVJmR1N2MEpKcmU3dnVTMGJEenNzNTZudUR2SDl0cjBo?=
 =?utf-8?B?QnE2L0gxODhMYVUvSHcrTWxDL1RnRzZjVW9SOFA3TmQzUnE3cDFFYW5aUmtE?=
 =?utf-8?B?a2xTV3VLY1dSby8wMk4wak1NelR1blNucTFGSUtpUDM2VWpBOEVUcSt5QU5Q?=
 =?utf-8?B?ZHNxdUJINXVTMVJ5REFEajZCcW5HMjNQT053QjZnV09UK3NxbW9mYWxKNHkv?=
 =?utf-8?B?Y0RJKzVMWXh3QlQ1WFhkWDBRY0szeXNnS1hOT290aEhzZUV3TWRyNDZxWXF3?=
 =?utf-8?B?aitsbEZ0MjdhN2ZBRjVpdzhWaU91V0hoK2VxaUtyZFh2Q0lRSHVlTVIva0FT?=
 =?utf-8?B?TXFLdHYvNjJoRzNDVlVyRGJqc20reWR5eUNHbXVHNHd2Q0o2MHpYOXB0SGh3?=
 =?utf-8?B?Qno4bjdOVVFDTjJmdklkUUQrazBzWG9RWGg4T0R5blpEZ2NXdXFwWDA1NmFh?=
 =?utf-8?B?bVV2bGtxUWZGalM4ZXlsR1dmRjFJdytiaDZqYi9iNlB6VlU2RittMEZyajhM?=
 =?utf-8?B?RTZGUlZ6dktRUTFiYUhyZk1wd3pvbmFJdFF0dGdmRGNvcTBtbzhzVzZNVitB?=
 =?utf-8?B?Ty9kQzhMVGpoUVU1OXoyNEVTUGRacm5VMTJKRDgyVS9KMDlCNlczVERxbVNn?=
 =?utf-8?B?RkNMeG4zcUF0TGhkMDlWdFIzN0k0VlM3Y3FuQnBldERZckZYeEZKYkVGQ3M0?=
 =?utf-8?B?WDZWM05IVlhXelVkMGgraTJLZk5iZXJ5SXJMZlZwNThjZTgrSWUza1ZTQ3Qw?=
 =?utf-8?B?dkJDU045cllhYlR1ZHhob01aaTRBenhiK2tPamhwakVVN0NmQzBCa3BWc2Jn?=
 =?utf-8?B?L2UrY0psQjcrTDdpcE1NQUdlTHNxcDBNcjBGSW9jUDhsT1VmcldNUXBKTkk2?=
 =?utf-8?B?YThlN2pSN1R2dFgxdmJqQkM1bUhJdWVrRHVWK2dhTnVHbGxJNitYSGRTMnlH?=
 =?utf-8?B?djl5bjJUVmtXZFBYMXBWRjcxQ25lOTU4bkJWdTNPdU5rbWNsTjRISkNSYSsx?=
 =?utf-8?B?MkliWG9FQjJvVXVQSFFQaW9Hb2gzdFNpYllmQnkvSTlqWHpzMjczWVRoNzIz?=
 =?utf-8?B?T1NjU21LdVlVNXcyZUI1ZXlHcGpqK0h0Q2FrVzlUdkd5QXBYRVhQMndNNmht?=
 =?utf-8?Q?N3py03lyM9FwfRqPSN1vNIbL4?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b303a8-6f5c-4965-04be-08db06141d9f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 18:26:07.0692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+V0T7GcbNak/3J1nkICoihvzXtG1WPw+3JZFaESRhEBx+RtWb3CFmP6i59lzjRmB6/0++qy2H17nrPzfbyxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8341
X-Proofpoint-GUID: 69tOOsU13sosMa0Z_Ceoa5o5fxL8z6GX
X-Proofpoint-ORIG-GUID: 69tOOsU13sosMa0Z_Ceoa5o5fxL8z6GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_17,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302030169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 18:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176750

Hey Josh,

I have been roadmapping SBOM generation for NI's yocto distro and have a 
few open questions about the future of SPDX and the create-spdx bbclass. 
Since your name seems to be attached to both of those, I figure you 
might have the best insight here.

Also posting to the OE-core ML so that this discussion can help other 
members.


1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rewrite 
of the spec, with more support for modern SBOM discussion topics like 
VEX and more comprehensive vulnerability tracking. And it also seems to 
me that the timeline for its release is very behind schedule [1], but 
still in active development. Can you give a SWAG for how close that new 
spec is to completion? Are we months away or years?

2. If/when SPDX 3 support is released, is it to be assumed that the SPDX 
facilities in OE core are going to be upgraded to handle it?

3. The rest of my org is interested in CycloneDX as our common SBOM 
format. Have there been any discussions about supporting CDX SBOMs in 
OE-core? Any blockers there; or is it something that my org could author 
and upstream if we decide to go that route?


[1] https://github.com/spdx/spdx-spec/milestone/3


Appreciate the input,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


