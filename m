Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02739C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 17:35:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35818.1640280903061024995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 09:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MxvOdG5T;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79915cbc71=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BNGxn2Z017347
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 17:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=P0SgIU4ZRLHVvv1oVMGJvZolywprJcoAo6fRpQsbwh4=;
 b=MxvOdG5TrEVmhHnVhUBA5P/8NBoJ7dC4qPPMkt1W48vXqkaceyzpMmdNSNiUAYgCuMbg
 WGQkZZL1ov4hKFoK5Mh9DqwzuFk9VczMFpmHtUH2JX18jHrm4jfveTnQgSeIQa1LD2OI
 ZOLENR2hKyHmFZlJRrVc6Kz5ToExFpRpwPxXSeU6karD/Uqo1MS+tZnrl6zvLMVqsQTZ
 pJ2d6w+g32GkBg2335QmB4pg3Jr2Wh152xggArbwQ64s4f8gbZIHeGp10a8VtCkzf/mt
 dkGp6+pYCQAY/+/oTX4IiLuwPrKLmTltFvff9IIQ4VKC0+X4r00aWvehb8eMEk5u1Iks VA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d3uausat2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 17:35:01 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BNHZ1U1032678
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 17:35:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d3uausat1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Dec 2021 17:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRJpIPC2Apv/0NpVzUAqV7x8Yk7tnQ7AOrD1bsNbJq1Y4JXCPPQdR/+WKsYX4HxDKfclKcc7qLPc1EXauLIFj7JXZVVXr4EiP/xJDjW/qP+bmEQju1g0B7f0IPitUrSaUkQMSqPGtulxNNsdaq39+dVBeG2cfXJaqlgfaR22QN/SLZ2uhYTvyzP6km1gee9DHmUCS096sKcFGuWcAKhfgqJb0PcvXIfxWxHNcPLSH2Dm+5/lf5PGhL1+Wze0qO4SQeSPCfcg8GwtTajSs9j159BmfzkZuKRYmqOfkdDvkTex8R9bGp+lDUeNgtOw9kiR4NIWqDmZyJFnXshWOZtdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0SgIU4ZRLHVvv1oVMGJvZolywprJcoAo6fRpQsbwh4=;
 b=V72tIzxdT+E/8LkmwFWwuJYD8I3pMbIn3WCUje7KPRhFDS9owkw+8rPn7LV2Km0QrBzsZD7PGnvLpFrgHx7mPi22XO4L1m0h6MXlViyfPkJv5120sgO8a5J+aag1WqWZqGzFSziI7q9b7WZGshfdaQoC/x0UZ1eCE82Ob40ho35bYkX7B8HhxlcCiVg0waPnMHkqQzIqlDYIlUnOgi2OQGL84ScZpCw8zZt3BJy1iPUi0okfEziFx+6xcP6L5Fj8OeZXLVweWb3A3QIy7RHwYtOXQfCzBH3N7Awi8PF3vPiRtYHBuObttcU7GrG1kce78m+8pq4zE3P9DVssAX2riw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4331.namprd11.prod.outlook.com (2603:10b6:5:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 17:34:58 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2df5:9c7b:a045:37d8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2df5:9c7b:a045:37d8%4]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 17:34:58 +0000
Subject: Re: [OE-core] [hardknott][PATCH] AArch64 support for Arm's Neoverse
 N2 CPU
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com, rwmacleod@gmail.com, umesh.kalappa0@gmail.com,
        "Hao, Kexin" <Kexin.Hao@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20211221104136.191831-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <3ea5147d-fe4e-0da7-1349-6df2394cb26f@windriver.com>
Date: Thu, 23 Dec 2021 12:34:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211221104136.191831-1-pgowda.cve@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DCB6970E807B0A91C38A5B0B"
Content-Language: en-CA
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7adbda7d-7b49-4684-a314-08d9c63a8a7b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4331:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB433132AF65F7897EBB117594F87E9@DM6PR11MB4331.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CDKtLOpVLZTT/SD0TwPpsfZgL4tpFjo2D1qX5qD5geMCC6g+UG6nL4WFzFKUE4+axj8ELl6Nkftpo9qxAjPtpjZA7Z2ql8zq1EywqlHT5A/+gGYAKogi1L3ZT3BUsJyA/OXFOtEgpnPGilZIAJFAw5aK2MpdswvmASbjkwmCWBSSbT1qMASpuxP+M4EsStPOIZAa+XWQH816m4IXdVdtL2OSybMb80RrAAXRT55xSybchAN7FnjYgeKdd93bpWsrxycc5siptZWqZlsvIHGJZVOr7gV1kRxnmJPeppqv0a1GWymu31f8h7AnWj/I+nTetzJcpESa1j4BdQEVWJ+KoFMTIx6D0ceYCTph0Fo3nPYwrtQXPOiovQYXCfYAxaXwvKErm6eji3KDYNE8HEjDNB6P78WemMS2dQs7RQZ/L2vZ+FhIOi0kshbRH2AJ2MpHFRhZshFYfX5pSwj0gQ7uJHiFgW1UuaFxeFlAkcq6eaZ2unr1eOblgaTJpHGzO4EVc0/mWbMighkjfSo2rqS27YzX8lTpdkaQnNJ2HacStG44KkHY841JrDQ5+87v354WudQ6TcX/pDPrqUrlpwCVnrv8nS6mbwg642X91y3q3HcE40ve8tmDA2wc8ya0p2B6WwDIQjv46OTa83EULDqhzxIK4Oq2qKeJYV84w4WBubFHOBSo+jfVe4xPsWjvQa3Zr6LeMjMI9VyUdB+kN1vLKXLTUXHsC4LCn1z5P9tE6L97V8xzhZJ0ibVgxfPbDlBEubaSmUZeoZBJfPqbMMil8paAC2VqoGlZ+fVzWWc8nNBWKjv6DQ9APyu7p+q0S42vx3FW/YXpwY//DnpP+KQ/IynmU3sUae0t84h24Yt98KrtlhK6plpLM/MiHAb2ZqxVP3sOq5OqSC9ChY/PmD2ssQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(53546011)(31686004)(54906003)(4001150100001)(33964004)(6512007)(38100700002)(5660300002)(26005)(316002)(52116002)(38350700002)(36756003)(4326008)(166002)(8676002)(966005)(2906002)(66946007)(8936002)(66556008)(186003)(6666004)(2616005)(30864003)(83380400001)(86362001)(66476007)(31696002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1U0Vk9uT29BbDlQQUZOeUw0YldsZ0pxbmJEalBBVFgxM3ZQUmhQR09nOXMx?=
 =?utf-8?B?ZDhRdkVxaFZqenBXM2JETGNnRUYrZXQ1dnNoWUxsVVlmZk5ZVStXbmU1ZG1q?=
 =?utf-8?B?NURoUk9EMEQwWllSSG9JTjU4L1dQNUQ5czJWc1hLbkcwKzZ0dFY1TVJjcmUr?=
 =?utf-8?B?Z1czZVpyUFU5V3dRMXFKY1NCYUZTTjFWUElFK1kzaWdaZjFyRSsrRU8za2lD?=
 =?utf-8?B?SmgvSlNidGJLcHJRK0ZYdWV0TzhrNE5wOWZuQ0hnRloxeFZScDJlMnZlMVZV?=
 =?utf-8?B?MTJUcWZvMmUrRm5NcXltQmZZNTVVSkphaUU3a0JVSHNJQUwxaEZDYW5zOFox?=
 =?utf-8?B?amNCZjE0L3U1MDIzNHExVUhhM2I5dkk1T3NZWTdpelpMY0pJRjBZazFvcG1F?=
 =?utf-8?B?VGNYQXd3STFsWFkzczI2dXEwdUlyZGtWbjdHZ3NhVncwT3ArcG5BZ09KQ3Vj?=
 =?utf-8?B?RDNNbEFmVngvbUJHUVMrMUszaEJJS3Jta2dyM1ZtUTZwdUpOeUxHTTFJcXVw?=
 =?utf-8?B?V1BXQlliMFp6VXJmZ3dTdE5qUFc3T2hqbUNxRW5US25YSFBKQ3A5U08vZWlj?=
 =?utf-8?B?SWZ6cGVuZ2pHSlUzQy8xYVMrMkh2UGxKQjFFYklGdWhoajVTSm13UFdrbmgv?=
 =?utf-8?B?VHgybDdDQzhYblI3c3FuL0JxYzVnVW1wN1BUV3JGbm1HSFVJdHlxQVltM25H?=
 =?utf-8?B?SWNYQTNCeCttQkpBZ0xFYVpIc0lnTkR6c1RvMHd2LzNrMWlNZmFqMVNMeHNs?=
 =?utf-8?B?T0tIWDBSNU5wdEJOV1NRamM2NkJadXZ5Uko2UEN1NXRtWGIyc2N4U3RkRGpH?=
 =?utf-8?B?cDEyaG9SQ1AwQ0hvSzhXRFRTR1ZBSjJQMUc0eEVqY0dCZGJ6aHVpVEorN09x?=
 =?utf-8?B?UTNqVmhLZkkwckppVldxVDlTTEswVUltU2MzWDRtQ2pISEhrRmVKQjAyajZl?=
 =?utf-8?B?TGxxWXNPNUMrMExjeXd4a2JJeU5oMFhndjRZZWdHamdJZlltRy91MHVGK05y?=
 =?utf-8?B?SzM1MEQzeGR0TFkrc0NTdXcvTHYzR1pnYkZjNXhId2FkOVluNmp5ODZTc0Nq?=
 =?utf-8?B?bFBEbjNBZ2RtRGZKVmJjWjQrNDV0QldndEhwOG5qV3FSTm9mb28wUXRiK3o5?=
 =?utf-8?B?bE81WklyOGNFMWVmTW9PTTZMOGRLaWJIRFdjVTdOdHNxQWVoSmlBTzN0MmQ3?=
 =?utf-8?B?WFQvUjNqNDJtbXdEd1VFeXRIZ0Qzc1VKcHI2NEtVbXlEaEs4a0NJamU3bDBE?=
 =?utf-8?B?amIybEtDQXZrZlYyS3RLdXpIdzR0d0pJcE9GYVBTRDRwWEdqaHFrY1ZTd0Q4?=
 =?utf-8?B?dVhncjVPV2NMQlNoS1UzL09QOTBkVTQ3Z2ZlbllUSW1RZHVMMHZhempMT3Mz?=
 =?utf-8?B?K0tadzFNRXR0Z0NaQ1dwWkpXRGFIWFdBdHNKOTNkK1FkR1RKT3JkWTdwYmVa?=
 =?utf-8?B?bnNRR3ZEeUJaZm81SCt6WUVLZ0hlUzUrZmtaWVBWaHU4RHF0KytDUnVMdkhY?=
 =?utf-8?B?N3Y0NXRMWi9pTzV0cXVMZWZJTVM4ams2LytLSkttWCtCRUZFcktXSWhoNGhW?=
 =?utf-8?B?SVM2ODYxZUJSYXVrUkNXNXVYRW1oY3RXU3o2QW9kZUF6TkFpdE9TT1FHaUtG?=
 =?utf-8?B?Z2N5RUpsSkZMVlRVSlh1MFgrTitsMmh4dThZVDgyVGFsejB5M0dIV0cxZWtU?=
 =?utf-8?B?MVlxTnMvTGozaUVZQXA3Qk42Z0pXbXkvV3FTcjdCcW1lTVJwa3ZreDYrbVNm?=
 =?utf-8?B?bm56WjFuciswTjB6ak5aYkl3TTM0djVOeHFyd01BVnVmSWQxTTUzQzVObFNG?=
 =?utf-8?B?TnEzdVBZMys3d2U3RjZQcmV4amh0dXNnU1J6VWp0OUhpaFBoeUNVYkhTMXV3?=
 =?utf-8?B?azhZa0liYmFCKzlsU2RoZGNhc1JLSUxuSGZ0eHdCRFFkemdNc05LZjNOZkt4?=
 =?utf-8?B?U21wYktTWVErejNRQnNGUXRNUVc1bWJhejAxWUw5V0E3cmVrRzMzNkpEVTQx?=
 =?utf-8?B?dzFqVWpDTHdSM2x4U2R6MTBhd1NiZkJSd3hjYlo5bzVNNHo0SDFyU3V2MnBx?=
 =?utf-8?B?Yy9tV05HODhCQThuU3BpMXRHWU84em5vOWVlUnNzUkpQQ2tLVThwdTFUQkIw?=
 =?utf-8?B?V3hua2swTWZ6dEIxS0pJK1BaU0hvVHNObmhSTmJzM09vU1p1NHJGWHpTWW80?=
 =?utf-8?B?RXNCSkpzeThFd0VoYmk3aHFhbHJoQjRUanAvNTh6ZURsbHJ0NTkyUXRXZng4?=
 =?utf-8?B?K2dTTzdXazdJd1VydzBTemhXSGtnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7adbda7d-7b49-4684-a314-08d9c63a8a7b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:34:58.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UxXdk5m1zC14XnEYnBLOx7zFXIoEb2u5HxFNfNl9/5Em+Zh6xfzrgbyXFrXUzOwQTaxszcfufiCBHLz7adXsa0J58iYeHDundT1bP75MT98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4331
X-Proofpoint-ORIG-GUID: xiGSVVcHiYx2Jzez9dd2L6ntYCj8HJcX
X-Proofpoint-GUID: WGsG3vi53faU2Mp1IYFfl-eZolVhQYms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 17:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159991

--------------DCB6970E807B0A91C38A5B0B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1BNGxn2Z017347


CCing Khem for TC and Kexin since he's interested in Neoverse support.

On 2021-12-21 5:41 a.m., Pgowda wrote:
> The patch backports the AArch64 support for Arm's Neoverse N2 CPU
> Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcom=
mitdiff;h=3D9428e9267435a62f672e2ba42df46432c021a9cf]

Naveen, Anuj,

I see that this hasn't been merged yet and I have some questions.

First as expected, this is commit on the releases/gcc-10 branch:

$ git branch -a --contains 9428e9267435a62f672e2ba42df46432c021a9cf
* releases/gcc-10
 =C2=A0 remotes/origin/releases/gcc-10

and as mentioned before, it's contained by the 10.3.0 tag:

$ git tag --contains 9428e9267435a62f672e2ba42df46432c021a9cf
releases/gcc-10.3.0

which is still the latest version:

$ git tag -l | grep gcc-10
basepoints/gcc-10
releases/gcc-10.1.0
releases/gcc-10.2.0
releases/gcc-10.3.0

so why bother with these Neoverse patches rather than upgrade to 10.3.0?

With the YP autobuilder being upgraded, if Naveen can test the 10.3 upgra=
de

and re-submit, we'll be ready to feed the YP AB once it's running again.

../Randy




>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
>   .../gcc/0039-arm64-neoverse-n2-support.patch  | 60 ++++++++++++++++++=
+
>   2 files changed, 61 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-=
n2-support.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devt=
ools/gcc/gcc-10.2.inc
> index 5626bf20f0..89158258d7 100644
> --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> @@ -74,6 +74,7 @@ SRC_URI =3D "\
>              file://0002-CVE-2021-35465.patch \
>              file://0003-CVE-2021-35465.patch \
>              file://0004-CVE-2021-35465.patch \
> +           file://0039-arm64-neoverse-n2-support.patch \
>   "
>   SRC_URI[sha256sum] =3D "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d=
0ff146c855fe16c1d8c"
>  =20
> diff --git a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-suppo=
rt.patch b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.p=
atch
> new file mode 100644
> index 0000000000..b3e0f396bd
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patc=
h
> @@ -0,0 +1,60 @@
> +From 9428e9267435a62f672e2ba42df46432c021a9cf Mon Sep 17 00:00:00 2001
> +From: Alex Coplan <alex.coplan@arm.com>
> +Date: Tue, 29 Sep 2020 17:09:09 +0100
> +Subject: [PATCH] aarch64: Add support for Neoverse N2 CPU
> +
> +This patch backports the AArch64 support for Arm's Neoverse N2 CPU to
> +GCC 10.
> +
> +gcc/ChangeLog:
> +
> +	* config/aarch64/aarch64-cores.def: Add Neoverse N2.
> +	* config/aarch64/aarch64-tune.md: Regenerate.
> +	* doc/invoke.texi: Document AArch64 support for Neoverse N2.
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dco=
mmitdiff;h=3D9428e9267435a62f672e2ba42df46432c021a9cf]
> +
> +Signed-off-by: pgowda <pgowda.cve@gmail.com>
> +---
> + gcc/config/aarch64/aarch64-cores.def | 3 +++
> + gcc/config/aarch64/aarch64-tune.md   | 2 +-
> + gcc/doc/invoke.texi                  | 4 ++--
> + 3 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64=
/aarch64-cores.def
> +--- a/gcc/config/aarch64/aarch64-cores.def	2020-07-22 23:35:17.3203842=
89 -0700
> ++++ b/gcc/config/aarch64/aarch64-cores.def	2021-12-21 01:08:45.5184723=
42 -0800
> +@@ -135,6 +135,9 @@ AARCH64_CORE("zeus", zeus, cortexa57, 8_
> + /* Qualcomm ('Q') cores. */
> + AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL=
_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC0=
1, -1)
> +
> ++/* Armv8.5-A Architecture Processors.  */
> ++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_F=
OR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64=
_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AA=
RCH64_FL_MEMTAG, neoversen1, 0x41, 0xd49, -1)
> ++
> + /* ARMv8-A big.LITTLE implementations.  */
> +
> + AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53,=
 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG=
_LITTLE (0xd07, 0xd03), -1)
> +diff --git a/gcc/config/aarch64/aarch64-tune.md b/gcc/config/aarch64/a=
arch64-tune.md
> +--- a/gcc/config/aarch64/aarch64-tune.md	2020-07-22 23:35:54.684795913=
 -0700
> ++++ b/gcc/config/aarch64/aarch64-tune.md	2021-12-21 01:09:56.829252050=
 -0800
> +@@ -1,5 +1,5 @@
> + ;; -*- buffer-read-only: t -*-
> + ;; Generated automatically by gentune.sh from aarch64-cores.def
> + (define_attr "tune"
> +-	"cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunder=
x,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,=
thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vul=
can,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cort=
exa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeo=
ntx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thu=
nderx3t110,zeus,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73co=
rtexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
> ++	"cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunder=
x,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,=
thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vul=
can,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cort=
exa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeo=
ntx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thu=
nderx3t110,zeus,neoversen2,saphira,cortexa57cortexa53,cortexa72cortexa53,=
cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa=
55"
> + 	(const (symbol_ref "((enum attr_tune) aarch64_tune)")))
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +--- a/gcc/doc/invoke.texi	2021-12-21 00:50:18.345426447 -0800
> ++++ b/gcc/doc/invoke.texi	2021-12-21 01:11:18.547853686 -0800
> +@@ -17010,8 +17010,8 @@ performance of the code.  Permissible va
> + @samp{cortex-a57}, @samp{cortex-a72}, @samp{cortex-a73}, @samp{cortex=
-a75},
> + @samp{cortex-a76}, @samp{cortex-a76ae}, @samp{cortex-a77},
> + @samp{cortex-a65}, @samp{cortex-a65ae}, @samp{cortex-a34},
> +-@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
> +-@samp{neoverse-e1},@samp{neoverse-n1},@samp{qdf24xx}, @samp{saphira},
> ++@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor}, @samp{neov=
erse-e1},
> ++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{qdf24xx}, @samp{saphira=
},
> + @samp{phecda}, @samp{xgene1}, @samp{vulcan}, @samp{octeontx},
> + @samp{octeontx81},  @samp{octeontx83},
> + @samp{octeontx2}, @samp{octeontx2t98}, @samp{octeontx2t96}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159910): https://lists.openembedded.org/g/openembed=
ded-core/message/159910
> Mute This Topic: https://lists.openembedded.org/mt/87874883/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


--------------DCB6970E807B0A91C38A5B0B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">CCing Khem for TC and Kexin since he's
      interested in Neoverse support.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2021-12-21 5:41 a.m., Pgowda wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211221104136.191831-1-pgowda.cve@gmail.com">
      <pre class="moz-quote-pre" wrap="">The patch backports the AArch64 support for Arm's Neoverse N2 CPU
Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf">https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf</a>]</pre>
    </blockquote>
    <p>Naveen, Anuj,<br>
    </p>
    <p>I see that this hasn't been merged yet and I have some questions.</p>
    <p>First as expected, this is commit on the releases/gcc-10 branch:</p>
    <p>$ git branch -a --contains
      9428e9267435a62f672e2ba42df46432c021a9cf
<br>
      * releases/gcc-10
<br>
      &nbsp; remotes/origin/releases/gcc-10 <br>
    </p>
    <p>and as mentioned before, it's contained by the 10.3.0 tag:<br>
    </p>
    <p>$ git tag --contains 9428e9267435a62f672e2ba42df46432c021a9cf
<br>
      releases/gcc-10.3.0 <br>
    </p>
    <p>which is still the latest version:<br>
    </p>
    <p>$ git tag -l | grep gcc-10
<br>
      basepoints/gcc-10
<br>
      releases/gcc-10.1.0
<br>
      releases/gcc-10.2.0
<br>
      releases/gcc-10.3.0 <br>
    </p>
    <p>so why bother with these Neoverse patches rather than upgrade to
      10.3.0?</p>
    <p>With the YP autobuilder being upgraded, if Naveen can test the
      10.3 upgrade</p>
    <p>and re-submit, we'll be ready to feed the YP AB once it's running
      again.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20211221104136.191831-1-pgowda.cve@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: pgowda <a class="moz-txt-link-rfc2396E" href="mailto:pgowda.cve@gmail.com">&lt;pgowda.cve@gmail.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
 .../gcc/0039-arm64-neoverse-n2-support.patch  | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 5626bf20f0..89158258d7 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -74,6 +74,7 @@ SRC_URI = &quot;\
            <a class="moz-txt-link-freetext" href="file://0002-CVE-2021-35465.patch">file://0002-CVE-2021-35465.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0003-CVE-2021-35465.patch">file://0003-CVE-2021-35465.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-CVE-2021-35465.patch">file://0004-CVE-2021-35465.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0039-arm64-neoverse-n2-support.patch">file://0039-arm64-neoverse-n2-support.patch</a> \
 &quot;
 SRC_URI[sha256sum] = &quot;b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c&quot;
 
diff --git a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
new file mode 100644
index 0000000000..b3e0f396bd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
@@ -0,0 +1,60 @@
+From 9428e9267435a62f672e2ba42df46432c021a9cf Mon Sep 17 00:00:00 2001
+From: Alex Coplan <a class="moz-txt-link-rfc2396E" href="mailto:alex.coplan@arm.com">&lt;alex.coplan@arm.com&gt;</a>
+Date: Tue, 29 Sep 2020 17:09:09 +0100
+Subject: [PATCH] aarch64: Add support for Neoverse N2 CPU
+
+This patch backports the AArch64 support for Arm's Neoverse N2 CPU to
+GCC 10.
+
+gcc/ChangeLog:
+
+	* config/aarch64/aarch64-cores.def: Add Neoverse N2.
+	* config/aarch64/aarch64-tune.md: Regenerate.
+	* doc/invoke.texi: Document AArch64 support for Neoverse N2.
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf">https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf</a>]
+
+Signed-off-by: pgowda <a class="moz-txt-link-rfc2396E" href="mailto:pgowda.cve@gmail.com">&lt;pgowda.cve@gmail.com&gt;</a>
+---
+ gcc/config/aarch64/aarch64-cores.def | 3 +++
+ gcc/config/aarch64/aarch64-tune.md   | 2 +-
+ gcc/doc/invoke.texi                  | 4 ++--
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
+--- a/gcc/config/aarch64/aarch64-cores.def	2020-07-22 23:35:17.320384289 -0700
++++ b/gcc/config/aarch64/aarch64-cores.def	2021-12-21 01:08:45.518472342 -0800
+@@ -135,6 +135,9 @@ AARCH64_CORE(&quot;zeus&quot;, zeus, cortexa57, 8_
+ /* Qualcomm ('Q') cores. */
+ AARCH64_CORE(&quot;saphira&quot;,     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -1)
+ 
++/* Armv8.5-A Architecture Processors.  */
++AARCH64_CORE(&quot;neoverse-n2&quot;, neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen1, 0x41, 0xd49, -1)
++
+ /* ARMv8-A big.LITTLE implementations.  */
+ 
+ AARCH64_CORE(&quot;cortex-a57.cortex-a53&quot;,  cortexa57cortexa53, cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
+diff --git a/gcc/config/aarch64/aarch64-tune.md b/gcc/config/aarch64/aarch64-tune.md
+--- a/gcc/config/aarch64/aarch64-tune.md	2020-07-22 23:35:54.684795913 -0700
++++ b/gcc/config/aarch64/aarch64-tune.md	2021-12-21 01:09:56.829252050 -0800
+@@ -1,5 +1,5 @@
+ ;; -*- buffer-read-only: t -*-
+ ;; Generated automatically by gentune.sh from aarch64-cores.def
+ (define_attr &quot;tune&quot;
+-	&quot;cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunderx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55&quot;
++	&quot;cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunderx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,neoversen2,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55&quot;
+ 	(const (symbol_ref &quot;((enum attr_tune) aarch64_tune)&quot;)))
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-21 00:50:18.345426447 -0800
++++ b/gcc/doc/invoke.texi	2021-12-21 01:11:18.547853686 -0800
+@@ -17010,8 +17010,8 @@ performance of the code.  Permissible va
+ @samp{cortex-a57}, @samp{cortex-a72}, @samp{cortex-a73}, @samp{cortex-a75},
+ @samp{cortex-a76}, @samp{cortex-a76ae}, @samp{cortex-a77},
+ @samp{cortex-a65}, @samp{cortex-a65ae}, @samp{cortex-a34},
+-@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
+-@samp{neoverse-e1},@samp{neoverse-n1},@samp{qdf24xx}, @samp{saphira},
++@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor}, @samp{neoverse-e1},
++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{qdf24xx}, @samp{saphira},
+ @samp{phecda}, @samp{xgene1}, @samp{vulcan}, @samp{octeontx},
+ @samp{octeontx81},  @samp{octeontx83},
+ @samp{octeontx2}, @samp{octeontx2t98}, @samp{octeontx2t96}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#159910): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/159910">https://lists.openembedded.org/g/openembedded-core/message/159910</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/87874883/3616765">https://lists.openembedded.org/mt/87874883/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------DCB6970E807B0A91C38A5B0B--

