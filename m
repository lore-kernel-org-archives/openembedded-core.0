Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A18CC25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 14:45:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.39720.1716129949899781108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 May 2024 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58695c2348=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44JEO9gt030682
	for <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 14:45:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y75rb8c9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 14:45:48 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44JEjmu6026838;
	Sun, 19 May 2024 14:45:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y75rb8c9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 May 2024 14:45:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUaEknY6Z+iP6OzIl32KoK+T9pcumeEGzhDl84GQOtvPhoNwtHh4DiS9MSBur1mREt3O95yHe8GcpuvT1OHCzGMsTEoGjfYA0bEGQOs2N1LinVWd5J65ifUDgk+G3sAVfd/jSdtwPbQynTOsxUMVt0I+MlsIei9HllT0isT/9nFXX/8WNM7/ucjz7i32Cxeolyc593bxUMUgbItXx/z4EJokF2FfHzHIn95Ce2SrcYuK/8XdhqefZOH1Qji7118FoainpiBDrfQRynjOCwGJT9QEPsC4VkmNKgd0a4h2Q7/84gi6b1b/cF8qyKFBVtpYN/H2ydyZEto7Rj33RZn3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YoVHN2CuR9K4pPmlJkW7TA4AvMJOLtlqr4yKX8cfQU=;
 b=EdgmTC1SQxclkjjNczKzd7vE73CeiMUIuy0EdsoOuB9jV8N0f3aQBZcLthyC6Rw8vi477UzhllxHSZK6oA0zxALf0P4RMG5fmPKCSemagkt/PH5FRrssp0DlM3eACMlWP3r7LOoruGgvOt5eOiAySwRMLF6q389OtmzEq9Qc2yYfnQBsy9bnehXQc0wTZtKCLPBENWJlakOhd1g1BgVoPmwaeoFwZwyoB1p0JLfNx9E88NCyo7ROMqnXbbyzYtviz9dza+diuzcCojTlIL5rdmymYfXyCmFPKG31jEz+K1wtTFGXCyT5Yq7AuICsbN/1X8DaEP5BWjN7GF03teXkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sun, 19 May
 2024 14:45:45 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7587.030; Sun, 19 May 2024
 14:45:45 +0000
Message-ID: <1714f7c2-b7b0-4fe4-8232-247f1df55a8f@windriver.com>
Date: Sun, 19 May 2024 20:15:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, randy.macleod@windriver.com,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Steve Sakoman <steve@sakoman.com>, alex.kiernan@gmail.com,
        openembedded-core@lists.openembedded.org
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org>
 <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com>
 <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
 <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com>
 <17CFF314D55865EC.16299@lists.openembedded.org>
 <CANNYZj-SeRHU-JWCQ8wrVt2LCObB4aDmmz4icxSoYrBv=3KyVg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj-SeRHU-JWCQ8wrVt2LCObB4aDmmz4icxSoYrBv=3KyVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 1124b45a-fcf6-4908-01fa-08dc78125d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bzlCbG1wUHNWdTZwVFZwZGpzM2VuUkxTRCs3T1FaSjlwYkVkR0UyUEhKSGx6?=
 =?utf-8?B?Qm9OUTB0Y2xoZHBNY25GeGZEemh2Sk12dFhmN2xQd0ZLWFdVTll2cWwzcnhi?=
 =?utf-8?B?bzF3VkM5eVZzREJ1anovYkk0NmhZSFJ1cGxDQzlqdE5ld3RFaVNWZ2NjU21Z?=
 =?utf-8?B?RGg4Z09TRWM3M1BWLzI0NjQzLzdXdW1BdHhFRFhmNWlaSXN1OG9YSWR6dUdD?=
 =?utf-8?B?MDBUVFNkaXlMclJKTzdnd3VTUGdMRE0ramMwZ0RpekJKZURLVFFjcDVUNEJu?=
 =?utf-8?B?bTRBOXlYQ1lOZWFRVjYvSFlmMEdzNGJjWmJQTEFxNGdVYTNOOHhBZjQyTnlU?=
 =?utf-8?B?T3pkWGZiR1NxTFQ0UGEwQ0xWYkFabEZiTmt5MTJBUFZjMHNjSWdvZkhXRGdu?=
 =?utf-8?B?RFFJSmNsaGxRdmdqMUM5dUZQcWF3bzN0L05weTR6VFdBU2pmTjV3TE0wZUtK?=
 =?utf-8?B?RzBpcTIwYUd4QkhqbTc0cmNYcFlQSWhhN1dodG1mUjVHWE9VWHZHV0srYVVx?=
 =?utf-8?B?TkNmb2w2Z1lkUUNuL1R4SWIyOW5kTXh4dXFGT1EzdVY1a1NCQXN1aUlRT1A5?=
 =?utf-8?B?Q0JRUkVwRjRSNk5UQi8yTjBwZFdHZE5abGNQeWUyeG11QnAycGI5VHcxd3BE?=
 =?utf-8?B?SGxKdDBVNWtOdk96cmtWRVlKYnBXNWd0VStDd2Y4RmdYRE05TG9zZ25sWkZY?=
 =?utf-8?B?SVpvYWc3dVlweFU1RndKQy8vd3FSOUFIN1VzRlVFUTVmbDI4cW9pL3E3QmNa?=
 =?utf-8?B?VkRiS3hRdlpKTmtiU1E5YnRXUEthaTFXZUhRZ09wUUdHNkp3RTJGbmtIVEtm?=
 =?utf-8?B?K1dCQmFmS3hPWVdLaXpRTUZhcElNMFVqZjZLT2FaeXJZT1Q3Ykt3YjJkeGwy?=
 =?utf-8?B?NnV5R3U1SlA0NHJDM0laMkNQZ3F3NHpzck9xdVZoKy9YblgvcGovWjMxQ0Rp?=
 =?utf-8?B?OXdXK2FpRy9Wb3JJUUdLTzQ4QTVGQWtvb3ltUEdLSTVNVW1OdHNXK3E1aWg5?=
 =?utf-8?B?M1VybDI2cktLanBjWGNwcnFHYjZYTTlkL1QveVIzOGdMZkh3UmpPMG9vYy9O?=
 =?utf-8?B?WFczRGpBdFM5TjZXeXUySHR5NFFJbGhzeXBxKy9aSVlKTUIrV2k4L3A0NEJB?=
 =?utf-8?B?SzN5SmlVRkU5eWJxV3lyU3dUejdjWXg2ZW0vOFJMVWg4WDI0aWw1ZVdkdmRK?=
 =?utf-8?B?eDFLSzhRYzhtaFlUcm82YVhCN2c4L2pWZEdPNzVOSXFhUVpTemh5Um9zV1F1?=
 =?utf-8?B?QjJYTHJzSHovYWZLOHRYS1J0YlhNcmVBTXZndFlxdUFtU2hzQUZUNW1HTysv?=
 =?utf-8?B?b2ozZkJTdnRRbE1hRks4Y3FqVTJXWUszQXhOWXVtejJlakNKcjViTDNUekZo?=
 =?utf-8?B?emdNOVR1a2NmMFRNTUtGbEtWVkEzOFRmSnVLZHQycE03dFNYZUZ6empCckJT?=
 =?utf-8?B?NGdIb29YZDg1WndyNXAvQUJaVWRpUWVvdFMzcmx2ZmMrMGtGNS8vVGw2VnJp?=
 =?utf-8?B?dzg5aWtMaXcvSTFwVWJnMk1EbEFacXJHb3BFTTZRdW44WjMwbWMzTHBzcmlh?=
 =?utf-8?B?b3lDVlQwRmVDQ2RjS1QyamlhYVVEWjFBbU9VUW1HdXFDZlJvTk5ZV1p4WGJ2?=
 =?utf-8?Q?0bHxa1DlvmTX8bVEDh2LWlyKgNLYEuHNXbCYGsIJQmSU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0I4anJ0d1l6TC8ySXhPTDlDeUlrZUpnYk9WYlVxWFo4NFJTRmsyMkhFc2xj?=
 =?utf-8?B?eUZOS0hpWXFIaGFOZTNpRlJ3RFZKOWdqdGQxMmpFdVNzWDVscHZDL29sY2Vy?=
 =?utf-8?B?OElabU5hUm9vWW5EakphNnVQcDFucnhFZHYwVEFxQ2ErK2tOVnRHRTBsS3hv?=
 =?utf-8?B?YXFtc0VKS3VhOGhTU3pPaG9xZ0NZbkYyblVMcXBSRnAwZzZaK0RPUHlZM3Iz?=
 =?utf-8?B?ZFJ2ZmFOTTBuWEdEeUFzVUFVbkJNNGc4ajgxbjdSSkhjWjhTcGs4V1hXY3kw?=
 =?utf-8?B?c2xHRXk2Tm9RdU1GYThYMHdERXA0a013TXFuRDd5VEJoQ1B1Y3ZrOCtqRjBH?=
 =?utf-8?B?aVdRTzZkcXFnU3g2cTFUNHBYdjRjUUNFcXBodUtYbUVnekN5RXFQcmM2RzJV?=
 =?utf-8?B?ekI5L2xpL1NiN1g4VzhCd2w1TEVpalQ3ekZ1TnF1VDVyWEw4eDRqbjBZblBT?=
 =?utf-8?B?cUEyQXVpTDVzVllVUHlnMEdVSnVVd0pEUno1Und5eE9sQUtwTmo0eThQb3Bs?=
 =?utf-8?B?NUhQdTZJM1cxZlYvMXhGOTJEYWw3QS80MWNram5VZ1FzSDFBTXhXOWxRL0po?=
 =?utf-8?B?b3pENjRCMGFwS0t2UWxGZkYvM3NaT1BFZ3lNRHpFZ2VUN2FaNDRuNXJmcndu?=
 =?utf-8?B?QW8xNkU4ZDZSU2VRWmk4aklZQ29LSm5GU1hyUDBzanVyTU84aDV4b3dOZE4x?=
 =?utf-8?B?bzF6KzRpUi9jS2JvZTdPdWVSTzNqSGJHeXpDOXJVRTdsQ1JjclJEM2ZlQUd4?=
 =?utf-8?B?L3pqa3h4MmMxdmFaUnljK29mN3piL2cxdnRqUm9wU2E3dmowNDJXWW1wZHU4?=
 =?utf-8?B?OE9ZZWZFTzVGYWg0VFRmQjQwSjdSMldBK0JOeCtvbGlkQklvSmNpRjZiamh3?=
 =?utf-8?B?RzRsWDJCRkxodWtJQjhTRisvQWlxTDVPMnBySzRpeGRVSWNJOFNlZTc5eGN0?=
 =?utf-8?B?TzhKZytrOW9tR1ppNk0vZS9oM2xoQnRPdzBZVXdGajNSYjFISkF6eUlQaCtQ?=
 =?utf-8?B?RWtoU0xPVll5VklFRm4rOHY1a2xWWEFyZ3c5clI4NHdYMU1NRm8wRElOWnJX?=
 =?utf-8?B?T2p1Q3ZGZmJuVEs4RlRvd25YKy9ZUjNITHREaksrc2NYZjZ1ZThxbUpnbGhZ?=
 =?utf-8?B?SU9sRkVZRWpEanFYL3dXTjlwMU5IdzJaZVE3STlJVVp5akhWUm4rckF4ajM1?=
 =?utf-8?B?UXljazNqZ0xUSEpqakdvamI2eEhtQXBUZ3kyM3BaMFZpbmVPdjE5SDB6R2Fv?=
 =?utf-8?B?VmtPZjJaR1hHYXRmY3l1dm1EaXZQL3NQRnQzVDNQWkNMOVkrR1FLQlpTNVFh?=
 =?utf-8?B?NWVUdWhhT2pmYTQ2UTVsTUhVZ2U1MWxUYXRrL1pDMWYvb0R4UElYangrZ3Vm?=
 =?utf-8?B?MExYWmZpcGJmV251NWVnWkxnQ1RqZmh6VmszaTNLZTlzTnBTbW84SjBBczZj?=
 =?utf-8?B?NmUxTEV4V2pHbXMzVUxvSHhZMVEzM05uL1VMbjVTRyt4ZFVuZDVRK0ZENEFM?=
 =?utf-8?B?UUgyMmY3T2dhYlh0OTZPbXhwbUxrM1lGZlVCVmsvZ1JVWFc4aDAxb29SRVZa?=
 =?utf-8?B?dnRMcSs2emtWOUkyb1d6M1RrOHVUWlY3a3QzWXJYUUx5cDV6amxzVFlzdHRL?=
 =?utf-8?B?MGNRMC9PVnZHYXA4UXFGZGc2aTBqZXZHUzJnN0FMS3RXTmU4Y0FGOTNVVlc0?=
 =?utf-8?B?bnR6ZFd5ejF3TEhYMFJsVzJ4dlRaTm8xOEJlTFE3VHpnLzd2MEtzTzFiNzhl?=
 =?utf-8?B?TnN0NU5wcmVCR2FlWU5tS0grUURSTWxTZnlUc28yOHhVei9LQUNXNzR3T25S?=
 =?utf-8?B?VjV5b1pHcXFQbkR6ZWZSU0hmZFFaQ2hWb1o4WFUvT1BxVjZaWU9yWkw2Vmp5?=
 =?utf-8?B?dWhDTGdoYjdQM1ZEdWp2ZE8xcVhFVWVYTDBzdWlUQnp2dVdoV1Qzdy9iTW93?=
 =?utf-8?B?c3o5NmQzUEd4Q2cyQjdCUWN1VUhsMnNmeXBVSzZhRldCbzNENWJLMUNQZWYz?=
 =?utf-8?B?N2NrRG5weDNpaU9wUUoyaTJ0S3N3SWtZUGs3djBBZjhJQlhxdWs5Z29zS3ZF?=
 =?utf-8?B?b0RZWXdKTzV5TDNDMzd1THdBRWJSVVRhMHk0b0dMY3FPZEpscnBNT24rVGRT?=
 =?utf-8?B?elpYRlJBckxYNEFkMVZyS2lqRHIxUGFmZnBBWDVTTDRvVlREL2d2WXRyOEl0?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1124b45a-fcf6-4908-01fa-08dc78125d3f
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 14:45:45.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6c+Miq7mW6rjwsNIc0GYlVGt1Hw68OoslVFtEmoJt8WArZTkOeJCoQ/+u27whd7/QqQ/QZfMx5UJbu+FydSYfxhoBdnWsnJwOzdoXR0xZh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-Proofpoint-ORIG-GUID: UG5XSXtRQKir2_oB6sAcpaYr8Ik43mZ2
X-Proofpoint-GUID: cuRuyzTviAJtJXGlLfXNN7v0tueMemjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-19_06,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405190128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 14:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199552


On 16-05-2024 16:59, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 16 May 2024 at 13:00, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> I'll send the ab patches that break the test suite later today; the
>> request is to take them, and unbreak the test suite.
>>
>> Then you can rebase your upgrade work on top of that. And address the
>> usability points I made.
> The patchset is now sent. Please fix the testsuite, and send that as
> soon as possible.
>
> Alex
Hi Alex,

I applied your patchset for AB failures locally and checked the rust 
testsuite, but I didn't see any failures there. I applied all the 4 
patches from the following patch series:
https://lists.openembedded.org/g/openembedded-core/message/199464

Is there any other patchset apart from this, that also needs to be 
applied or am I missing something?
I also saw the failure logs sent by Alexandre Belloni but cannot 
reproduce those as well. 
(https://lists.openembedded.org/g/openembedded-core/message/199540).

Can you share the log file or the failures here? (Log file is present at 
"build-st/tmp/work/cortexa57-poky-linux/rust/1.75.0/results-log.txt")


Regards,
Yash

