Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1115C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 20:58:42 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web12.13181.1639169921757971605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 12:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=tFe0LE7X;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=7978fb230a=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BAKVS5Q028620
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 14:58:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=PPS11062020; bh=qWHvKpnj1KjsKfG8QbPSuDMIeYmodWiNETYznmKhzL8=;
 b=tFe0LE7XJ8UMsVGLsi+p3Et8wf5UZJqS5tMqL8FwG8hyfUTNEK0ypxu3W/3C63CkCOUG
 d1CO3ICPrrFAIOwz3R5KwGerN31lVM/4RXYejJwTeBUM0mx2XtbKYue98YOBsmkSTHtZ
 w56K3FKd05hesH9oBkoods0RX22oHVhQgGfONZMju/QLKtU28bQz9FpGMD/ckGh90o9l
 3j/23tiez9pEcb+4Hn5WYF5YSqieWm44tiD7kaOFp7eqSdNxiDT0MKmnlfFQKNF/b0yQ
 qHrCYM/ms2mOKCcRXuaDgymfz7kea9B7mTToYKpC+D21JNJMpTB7JAs1F5tODqH2QkbI Pg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3cve0q815q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 14:58:40 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2sCdBi7ekx5sXWFbjs7lVL8sCYewu2066f5gJZeNKFlBrQMNVHqPAm7Z7VVngjPdVUzrvFRMRSIQIAoyUAEKrqh1ljDWqTU3E0+t8zFl8DAbHt2i59FkqN3ApXixkMxKTDwWFLWc+isd9IcZdT8PgXuSRVqraz8FM0h1Frq7bTBAQZ7NjCMpAvYCl7giBt6TOqheXu1W29LgfKjx3jk/iO/Vc2fzIG1ZYdiLWQjLqqhduM4FvkwG47F5TsL+kb5xhyUBJ7D6Ers3QuZMnzMrogNvc/R7ANzuP8CDuXaVjTZNE7PZLlo5AKc3e/FeAOisiV5jqJSALyT2em0/8epRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWHvKpnj1KjsKfG8QbPSuDMIeYmodWiNETYznmKhzL8=;
 b=i1Qa3Eq5Bd3miko+2PbQ7y8zoXSQtUiSXFFkdnXJ7QldOPxCktR9LqGIZYUDgy/PdM4h0D9cypPxEgCCFBWYD6FS05RC4e2bhRsHoIBV2jI1BcCroPpIEy8+R0Ex7Xny069XeILFTyY79FAwtnxuA7057KkFCnox+NqEotLJWTWoKyKPZY6VL84h5CDg0NFA/9u+Uy8LJfFv8/0ImECDzI/gXSwMXwlxNGwBzJ9erMYSPeHMozNQKPrKxVzl6pqIlPHn0scfNM8UXB1BVJVU1f4TejbdLIFeFjChhdHuP4y43ScPM4SSlPvgvfxjIs2TGSFOdHPvir9RPD+eaYjCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWHvKpnj1KjsKfG8QbPSuDMIeYmodWiNETYznmKhzL8=;
 b=GF5iFxcBBarbGE41Bed3ALiXNbntr6FzkNgEJGCsP25cWvG6+Ov681U7W43KR5bXI9ikV33zyO+CSYuW0URx8AlAwcH4gC7QryN4bXHPuMKSm8hRxN8JLkAs2pEdks9ftVGn1pb7b5HhWvFMkiRO7SKzs34JBb6ACG6xyTfsGWA=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN4PR0401MB3584.namprd04.prod.outlook.com (2603:10b6:803:47::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 20:58:38 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67%4]) with mapi id 15.20.4755.021; Fri, 10 Dec 2021
 20:58:38 +0000
Message-ID: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
Date: Fri, 10 Dec 2021 14:58:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] The state of DKMS in the Yocto community
Organization: National Instruments Corp.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:806:28::35) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
Received: from [192.168.1.3] (65.36.69.14) by
 SA9PR13CA0180.namprd13.prod.outlook.com (2603:10b6:806:28::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 20:58:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8af808c5-80f7-4134-a39e-08d9bc1fd697
X-MS-TrafficTypeDiagnostic: SN4PR0401MB3584:EE_
X-Microsoft-Antispam-PRVS: 
	<SN4PR0401MB3584C84E50312CCC60F4CA71FE719@SN4PR0401MB3584.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NBDQa2MDtM3rpWbK20iuS7Y5tLjbh7X8m7aw8o/mifJga3GOp3vgQoFho4YuGx13sob2/MqpC72bwfcdPbdTG1X+8Sdss/O75DZNX3Pvuzvle82V/ayOGY9EiGzU9yLSg86608W0qIOFMB9pWaFO3zHXfjH6IuEGydis6gxzf0VSLCx8ChXhJ80gItmsufnFlCU4gZ8ynaPNrEWXeo5cTvKnQA3NQMwGedjNoDSvQRGJbyTELjiIprCIjA2uhvXGcJzB+C800aYM61tAW2uMjFOqFs4KTptxkijp86WwXzRnNxhYUW2OF/WX1ETqjoFUKr/6sXQn/NXVcgXy5GdfRU5mcR/aVTCkBrbftnZ78DyaA04j12UP/XXo606Upv4G9Txan7wV5bvr0fyZk6I4ObIG+501iUJV8qW0K1hIHmdNFn0g3l7rVo97GoF5e/IOSYZiSdyik2LkXPCwQGK2C8NdTH/rUxvqd2P3WxU5bkOxCh/tYwM7ZoC7jLZ3/jUSd7zFj/FNgwuQPKsLVQQcdRkvmJg8/vv7n5P3Xw6Zn9tsXHOLC7jjyBfljS/lw63td8/2v2y/sXuIRVlh0nWlKLlPUzHm5g6gKuOFa8pIf01n0K2KmE5GvgFEdpUpL6EPuvBYZEKX2TeB5cXFcSOnA192YN3D08l8d0odKRvveQLc+fumdi6+pjCWv6g/ZyQ0MKxGW/pFXA0JaVuZiGolL33qOhvMJlnOJ9tPEBvo07WN4A59IurOFE/TryerDNTpZV32uPsUmzWlK1iDcKadkFf1IzOWM28rH63gJmmd3jRUxZXMHKHTvbJxVZw8LyVr9SHVG3ZzhpHQX4x6GHOHaDyyqc1Fea5cPdM+Ri/sKxU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(2906002)(186003)(26005)(38350700002)(6916009)(83380400001)(6486002)(2616005)(8936002)(44832011)(508600001)(66476007)(66556008)(38100700002)(5660300002)(36756003)(316002)(966005)(8676002)(31686004)(36916002)(31696002)(956004)(16576012)(52116002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnNZL0JNWTl6VmxnOU1MQStHZE8wVHlsYmhrRjc4L2NyMG9GbzM4ZTI0eFkw?=
 =?utf-8?B?aDRxbXE5UWNQL2VGS3FsYTh1MUdnditxeDVWWHU5NmMvUnA0SU9SUlovbmpE?=
 =?utf-8?B?dGltZUY4aUdaVUczcE1QSERrLzlZeG9hWmVWSEtqRkdoY1MybGRwQ1hqSlJu?=
 =?utf-8?B?eVgxT0pIK1pXUnpsVGhJM2pETTNxd09JR2dlMVNZdjh4alhCanBsb1ZXRW1Q?=
 =?utf-8?B?RXB3TExrN3l0bHhrVDIyQ1d1K25MVE92N2tTRUZaNUw1WGo3Wk9GMThGVzlq?=
 =?utf-8?B?SzRnZzNhd2J0RkpFSUs2VXVCNzBpQXRMV0ZFOVd5eElKL2lKZXpEQm1aZ0o0?=
 =?utf-8?B?djNlaE9lSnQ4dWhwdHR4bDVMYVRHTXJwOG5vN3IxVjRWQVJHWllVWDMzZko0?=
 =?utf-8?B?emZEM0xaa2Z2UHp1MkVWZnljbyttZnkvYXJ3TFdrVGpyT0NQWSt5K1VmWjZs?=
 =?utf-8?B?Nm1aOTZ4dUpnM1FjV0txZFBrWi9GcXl5ODNTdHJNL2t5OWxPYWZsSzlkWEpW?=
 =?utf-8?B?WFBSL2lTME5oVDluZE1xQktPY0VZTEVLWG5LOXMxQ1R1YUo3UTRJS3hKd1l0?=
 =?utf-8?B?RFlXZ2RoMWdBVk9hcVNiNEk1b3FKTFUxN0RmbzdMNzkvWGlQL0dqcFlHcXd4?=
 =?utf-8?B?b2pUVFM3RUtWZVBrdzdCdVM5WkNWTkNLeDdpcUtLNkNneWpSYnAxSDRNNUs1?=
 =?utf-8?B?c0xhNm5GVHc5YmhKQmxSdHpSbkxZamFPY3JXZjhxZi8xVkFQQ24xSC93eDJL?=
 =?utf-8?B?cHVYZWRqZklNTUIvN0gxQ255RXM2aHJOZXBlSGI2UVpudmVaUWp3cHIrSHRm?=
 =?utf-8?B?ZUV0bm9YNC85VU1PZzhFVGNTSTZPNXlRK29kZFlBVk0vM2V0cUpRZGVtL1Vs?=
 =?utf-8?B?ZFBnVmdabVpxOFl4MU1GT2VCcnNIR2NBc0xyUGJteWsyc1QrS2R4N2FNNXc2?=
 =?utf-8?B?UTJRZjhFdDI5Q29XTEx6MEtwYzhsRVFwQXlDM2JuUTFlZUx6ZmgwUnFHVzZO?=
 =?utf-8?B?dE1objBNeXA2ZXB6UllCZDhvdjVIUjhoMGpkS3lhWFhFVlRtaUZRL3dwbHJZ?=
 =?utf-8?B?ZEhRNGZmT1dVYnpaTyt2ZmpkWElMK25jNGFNZ0ZFVnRuU3YzdWtvLytOZHBF?=
 =?utf-8?B?ZlMzMmc4WFBJbHRJK3ZVWTc2aXZkRDE4enZPdHQ1N1JKa0lEb2NaQ0Q1REVY?=
 =?utf-8?B?SFVZRXgzbjZsVXpZbW5ESlkwcE9xZ0FHYm82aG1lUHFCeHZUb2YvOFF5WVAz?=
 =?utf-8?B?TEg3enZpNUJ3K1l0MW0vbmFSQ3FCQXU0SDZ5TnRVWkVSMExVQlZQVzluZ1BE?=
 =?utf-8?B?NTZaUlhUM2VxRzF5SUZrTXF2a0thMEtKbXljdUVhYlZTaDQ2VXJkYXpWTmg3?=
 =?utf-8?B?RVFRNjk4eW1WbHlNLzFXNkovU0NuYmd6akxjQVBCbzlSZlVGVzZ6LzlFcWlm?=
 =?utf-8?B?WGtMbzl6QXNMOFJJVjltbjFpa2pYNWhyZ2JrOGp6b2xDVkZIdFNPQndGWGU4?=
 =?utf-8?B?L2xBMUEvN1FmalJzRTNaZy9ZV1cwSFJ0Wlh4WmNJWElYZGJKeHBIdXZNUGdU?=
 =?utf-8?B?d2pXUmpJNFVTNlJYRmM0cGVDL2VCYlVwREhCZk45eTNyOVU4Q0w4cFB3bXB5?=
 =?utf-8?B?Q2FaR1VNQWJBSVJMUEZJR1FCZy9xa1hEbnU5d3ZtZ3BNd09tUlMrMjhyYmhp?=
 =?utf-8?B?NytQYzFpTzA3bGV2MzFGNWduem5FK2N1K1JrbzR6eTdlSWhMMUlZNTVDWDUr?=
 =?utf-8?B?bjlwT1krdklVTFpFTW5UZGQzZ1lsbmNVYWRtRWZDS2xSblN1T2l2emxYRXMz?=
 =?utf-8?B?WlZOenpoYUZVbm5VbDVZNFpYditQVTZ5dVQ2aU1wVllFT2tLRXdCZ2U1REZW?=
 =?utf-8?B?S0Vvd0c2Qkx1WGtycUh4eE13RmU3OGlXSU0wNGcrVFJ3MGIyL1JvN2dnK3Ir?=
 =?utf-8?B?ZllZOS83QkxSa1hweFpLR0g4anh6SmtoWlRORGdReG8xeFZITDdtSHd5Q1Nn?=
 =?utf-8?B?SFVLNXBmV2NQSWFNelNzSVJHQlNiakk2bTRUNkF3SGV4a0gvQkdEMGNSV1h3?=
 =?utf-8?B?M1FHdFlkeWpCQnZ1MmMrSUxSTnlqODc3L1Qyc1N3VnNJK1l6R05GYlFSTTZw?=
 =?utf-8?B?cmJJUkh0cGh3TGdiajZ3eElER1RKYkZQd29KNmJIOENTdi9JbVJZbWpjVE10?=
 =?utf-8?Q?7TNCpXV2rHzD7Clv/9W8nvE=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8af808c5-80f7-4134-a39e-08d9bc1fd697
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 20:58:38.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JTzTzkocugYT54IlMGbbHYgIiFjqQOWtrqK7wfovzlqrtncmu5gPpEl1GzVUlaksO/P18DrGIfy4wyg66QXHIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3584
X-Proofpoint-GUID: LUSgTxqWaOuSe3s9LpgTBeVrtAL7-VDu
X-Proofpoint-ORIG-GUID: LUSgTxqWaOuSe3s9LpgTBeVrtAL7-VDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_08,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 malwarescore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=655 mlxscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112100114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 20:58:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159558

Hey List,

I'm trying to work out the mysterious state of DKMS in OE-Core.

Our (NI) OE distributions rely heavily on DKMS to (un)install our 
ecosystem of kernel drivers at runtime across our product lines. To 
facilitate that, we authored a dkms_2.4.0.bb recipe [1] back in 2017, 
which we have carried out-of-stream since.

We tried to upstream it, and the patched rev'ed a couple of times [2]; 
but it seems to have never made it into a yocto release.

Though some other recipes mention DKMS passingly, I don't see anywhere 
that OE-Core officially supports it. Nor does my googling reveal anyone 
else who uses DKMS. I find that a little hard to believe, though I 
understand that it's probably relatively rare in the embedded space.


@all
So does anyone else on the list use DKMS in their yocto distribution? 
Are you maintaining a DKMS recipe out-of-stream as well?


@maintainers
If NI upgraded our DKMS recipe to a more recent version than 2.4.0 and 
submitted it again to OE-Core, would you accept it? If not, we will move 
it to our own meta layer and accept that we are unique in this regard.


[1] 
https://github.com/ni/openembedded-core/commit/5789a27b68d95f3840bb8c4cb0d7b28d538c9a50

[2] https://lists.openembedded.org/g/openembedded-core/message/100680

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


