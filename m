Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04058C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 07:56:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4035.1641542187054100790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 23:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=cAYrWHPA;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8006e34bf1=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2077qBCf004689
	for <openembedded-core@lists.openembedded.org>;
 Thu, 6 Jan 2022 23:56:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZiGxC7V94YazzipHtiYb07YLa2/vRA+tRx4BpMEe2Ao=;
 b=cAYrWHPA4wD1YCQdIlrGPHoumrc6aI0otse24XRX7lEBb528MWMWUrnYsZQRMwcDsa+6
 gL+Ix8lo3v2BC0ShsSqM8vTm34P/9dPPuUunfoM+fzgYHWcOCvW55FmA0h7hadAdc6xh
 IY/+ZSB4PeVfMO/6lgfWKO+tNzg1Jkc2qkUQIfvigPHIejDhXurtEeyPfgIiAW+jLAxH
 yIY+VZdBA7p3qxIgsjU01ZwMPNRdklg0VETb36i0T7oQrFbGRUogVoviexC/45hywbbP
 u5cOHFFuH2IvZ/Ag/USJ/9HqrrBvzDJNJvP6eVkgg4n7X26WNPPcfpq0qQDwuPblVnrC nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagebf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 23:56:26 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2077uP9V014486
	for <openembedded-core@lists.openembedded.org>;
 Thu, 6 Jan 2022 23:56:26 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagebc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jan 2022 23:56:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnJ6gEkNRpW/6WG5hudxIf4F1f47SyBkNkpZ+UrVXIICCVixU2eGkoH0JBPEEHrJ/p6LcA0jAMLBgPJOCr4qqmclYz/PIpIjXrNfHyYcMC1aApPumNEnFPYeeTVziOB4Wv5Ff9Y32jY+3HRrByhcq35104C7kyF5xLpHxV+4yS85sR8eDzCJGfALXk+ATrrYp6uj0N6nrVZdfeX2xRKAFglOn0rnX7yHtreRaxfwts518N70jq+oIAPLZmzR9l2USMOPnSVuPhYqTN2LxUrvR/hCYrHkLHQNWenC40uMPBc+o3Ao8vTVnessWSIICTqK57tALmAJs9FHlPsax/4PWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiGxC7V94YazzipHtiYb07YLa2/vRA+tRx4BpMEe2Ao=;
 b=OOxoE8Bv3KDTiTXzObSIc4G77AjCDxa0fSCEZXsqXRv7Gkch6/KB2HXX6EjvU6LSv3Cup8a9JW/Pp4nBM9YLxcADuUSdWmOCIVV/1DAXPZI3RD+d/aXX84lcpDaMecnNvicI501JpUF8JuDpeA4DwLDHuSaf1OFlNtJwBOP63PKYmq379Bogi4nrfY5GOyHRy9ZxYvHN8+Ss1lb5iwsj8re+XkwpDraMUO16tH/bsK+QCohqJkKaQ6fz9BEr3Drdpwa85de0JXFlblptLiF/V9fvyvF6buh716cQtY8SyhDu+9cWFgBXlfDMKXtTYpVIgNN1rDIf2rIreVQkRui38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 07:56:24 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 07:56:24 +0000
Subject: Re: [OE-core] [hardknott][PATCH 1/4] xserver-xorg: fix CVE-2021-4008
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
References: <20211229013051.36342-1-kai.kang@windriver.com>
 <16C515AB4535CCA0.27787@lists.openembedded.org>
 <46ba307e-dfba-4074-607f-a9b52bdeca06@windriver.com>
 <b24158607b47366ba037eeb9a43865956ed9c6ed.camel@intel.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <52525a22-ae6e-1b12-a9a7-be4ea81e835a@windriver.com>
Date: Fri, 7 Jan 2022 15:56:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b24158607b47366ba037eeb9a43865956ed9c6ed.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c62400b-2c33-4e8d-2944-08d9d1b332d6
X-MS-TrafficTypeDiagnostic: CO1PR11MB4851:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48513FC16A9CE4C1BFEC423D954D9@CO1PR11MB4851.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z7gJa+FK/ssXimgn08Fjw4Pl9WVTkH4rKHqK0KfLIZHvSaUkwSPVKJRU4yslZs6VfnwtGJZS7ZF4SItzWSIeFb76VmE5HSQOUYkzdCd9QzBlTFEU0UGZYmj4w/zaFanahATbyJY2eCa0jglN7O6nYDTLr+3HU+171kVsXpyJSbudxDTWaULvwsocxvODNwHQtybPbR1VgNgoRxRdK8SkQNzvCjQ+Qxeaiw/4ibK7cD9L4liNa58yJIVSUYhyMX1u4r2JagaQWEzL/AHDFD2KRsktmbVwxEu2q1soWWLH7PbkSPEGSKTo9a2Snv4M7eRYA0V9WthYZYqFAQA+ncE7IPaRZv+kr8um++KVXG5CD8xg4D8oNPwEGh/+qu95Qrqq3lcRGnuv6VDpOsag9zG2DLXG17hI8kqlONm5HdUuF1u7dVYCTWUn9uCYxT3achLr8PRHLpAm1HVhNtNvibGC5dM8MzTIXT1GySk/mqBQXUWXeynz3fx5TNy/y2sc8t0f6bEZDlpmudD8ZJrP5eH7TMPUnkrkNIXIFvbmcFuVw1+ZrJzWV5dNdY63+jWbNhecx9tijBsLe8AxjtumYgnLWXdQC7z0hBqWzjYfw3MYlgbKBP17qAQr9DhTLrNjIItkF/QGiOW3/FhyGIOYg0gKkXeYow5vd6ybasWRiZPALo5v+xzS4GVLInP5YpR8QtpuD5rrrplNR6kwmyDxsrCWeUQ7hPudKtb5rlgCezOTQCANVVpTdq+38byDjVviTttSGRuRQzOZp0h26cL31OY8h3JLt+dsccmpHPSspE6s6a4iKvw3nF6uvoG3ZXQp3Csp7u7nEWYgC0rJ1QsVwCGFHOFZOFgoEVdPWxKoJmy4LEcjawSgv/rTv0r0XTHtfkSycaGHNdD3gn+bbBZpvejMGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(966005)(107886003)(6666004)(53546011)(508600001)(186003)(31686004)(83380400001)(110136005)(2906002)(31696002)(38350700002)(38100700002)(36756003)(6486002)(2616005)(5660300002)(26005)(8676002)(66556008)(66946007)(8936002)(66476007)(86362001)(6512007)(6506007)(316002)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjZZN20yNys4dk5uMlY4Q3hiMjV0MHF5Qk5jM2REQUxnTTdpN0U2bFFzMG9L?=
 =?utf-8?B?Tmd3QWxrMjhCdHlDSUFaK3dBeTU3TDJIN3ptRDBRcEUwMnhqUnlDVldsV2tz?=
 =?utf-8?B?N203Z3RiSmNHakY4Q1JWZU80MzRwK0dWdDBSYzZmRHJ2Q0dZUzFEb2dqZkdx?=
 =?utf-8?B?TnZaUW9taXNOY0thUGdJZWp4eDdlUnY2RXZEaHkrd2tlNUpmRXkrQzRFNEQy?=
 =?utf-8?B?TXFKOXhHeE5rREEzT0VsbGdOaFJKcDF6OFBLTG1TUFBMQjIwQk1xOVNmb29K?=
 =?utf-8?B?cDd4d3UzYTFlMXlpOHZjQ3J5eGVZUDhQYVZ3dWwweGtEbmVmVTFSbHMyMXMy?=
 =?utf-8?B?c2ZSRFVpek1rVDYvemN2Tm03VzQ0cTJHYUIwbzdxazNtQmpaUlUzK0lFZHZl?=
 =?utf-8?B?NFZxWVZnWWlDMXpxZ3hUNVJoRWpPeXFIMWZHamppMEFxcDFNWXRyOW5GVDRQ?=
 =?utf-8?B?MG55cWFXdjJTTEZjUndYeVR1RFRJTTQ4Rm9FRjBjVFd1bWRER0tTaUwxQzVS?=
 =?utf-8?B?VUt4eU90YnJJQ1p2NzRHL2YwRCt2SGpJQnpkOG9pR2EzV0FMRW5DbW1kY3Zv?=
 =?utf-8?B?Z2dnWjJmeFM1a0JyZWpWS2FDbm5qcHZWMU5UcWhRRGJJdDZZSlNrRm1ScW9z?=
 =?utf-8?B?VW5YY08wNm9Qb1ZqK3pscUxVVTFHbWhsa2NPcURSUUtWb1k5czRCTWJIS0Rh?=
 =?utf-8?B?eU9LL0Y5YjNDbU11d0VxODFVYWdvSGhEelNudWF5bUx1b2lvR2tET0RZTVVn?=
 =?utf-8?B?SER4MVZxZ2RuWjlmTEtoUFczUVVKdkRWL2N5dXB2aFV0RzdVVW9Vd1pRTTh0?=
 =?utf-8?B?Vnp0cWdkUWw0eFF3RzhrV0JYa1AwTk1WUkZXYTBvRXgzTTVNaWJlTXV5cE9T?=
 =?utf-8?B?bzArQ2ZKUGUvTEM0L1A4Skd1T2k4OUJDQUNqa3UyekhaNVBZNFVsK0tnekxN?=
 =?utf-8?B?NXN2MDZmamhmTWhSZmNndXJRNVlmb0pxNkNDNVJyMVJZeURqdVgvL29Kbkxa?=
 =?utf-8?B?Q2JKcXNXQ1VZOFB1YW1JaFdJL3Z3R0N5b3VUNmd3RUNieGNjS2M2VE1kSFJB?=
 =?utf-8?B?TVlvNkZHVVBEdEVUZzRGR25JVS9jdkwzSEZFdjU1ZzFPUVIxRlMvcDU1WjVv?=
 =?utf-8?B?b2tscENzaEJIdGs0Mnh2Rkc5M1dMUmc3ckNBVUh4bVNvU0Rmem5Ob25teXhM?=
 =?utf-8?B?ZjFLTnNhOFhZb3BOb00vRlpUY25hK3NpVFZyR0g4d3c5WXdjMW8zNVZQS2tT?=
 =?utf-8?B?ZGRpdEN4Skt3MkpUUGgzdVFDS1JkMy92SS9RU3hnNjhvcFJjL0V2YTdyMU1B?=
 =?utf-8?B?Yzk4YmQrVVhWbm1pbWVVSkFFaUF5bkFmeSt3SHhNdlJ0Wk44a2thdzE5d1RJ?=
 =?utf-8?B?U05NUEp1OGludmZ4Z08zd0RGYmZkMUNtV294YUkyVTN1NkNWejhLWi9lZWVl?=
 =?utf-8?B?K1VsQ2JzSWh2SU5LcXZ0R0dodit1bi85V3RqZGRIMmxLYjNiL2xYRFJ2bzd0?=
 =?utf-8?B?Z0FQNlpXSjRmRXQzeXdjOGhXT3IvRDhUZ3pDQUJYOXVsU3Y4cGNYR1dkNmZB?=
 =?utf-8?B?K1lxbkxWN1Q2K0lGOXdTUVo4TzVOTzdVUHhxZlZnMW1zWnB1STdvenI2L2Iz?=
 =?utf-8?B?YjV6Mk1MUmVJdHBmbTZzRmR6eW1RdUczTFd1NS9rQzFlMjVMR0MzcXVYMjJk?=
 =?utf-8?B?bjQwOUlpWEFLakducFlXdFZYR2x3d21HK292MGVPV3FMVmZ3RWs4V1MvR1ZK?=
 =?utf-8?B?b0dpaEVha2RIazNNaHhOV2xvUWlhOVlwT0hIUWxkbE9kQ2hiUUdSN3UwS0VD?=
 =?utf-8?B?cGJJS1lxaGtzN3FxNmRLYkZkWi9kcnkwbWEwTkx2ak5HeTB5OWw4bStueU9M?=
 =?utf-8?B?aTBBTVc2QzhSY3RFSEhPZzk1UUJtdGkyVVEyTm9kM2xxcmFDYlBnblUxeFkr?=
 =?utf-8?B?dXFmQlI0MnZWNzhROExpUUpkaWxKNktpUU5YV1FKVjFCVm1BV2FGZUlHdmVQ?=
 =?utf-8?B?NSt2WUZtTDRibjZiTE5TcFZvWDNPT3R6eGN4TVFIRTRscXd6K3ErRVNlTVB4?=
 =?utf-8?B?MzhMRXZ6WDdpZ2Rzb005c1BXS3dTTlVQc0k1VDJjRlQ3OTg5eUFITTgweHZL?=
 =?utf-8?B?NlFuS1JLbDM0bml3SVpXcTlVZTRWL3B3VEUzT24yVnpvSE5LK3BQczBBK0U2?=
 =?utf-8?Q?nD+JT09SJ9+jafSgnOLXVNA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c62400b-2c33-4e8d-2944-08d9d1b332d6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 07:56:24.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L4tYW+Y0QjCYJLnwEUGqNKzqmVSLBx95+lPLG/p6UOp3Ya3rElsBXLzNujnffMi17ghCsd3BZNZrMJTOzfUhzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-Proofpoint-ORIG-GUID: EszSGL30CFsHLAkRIiNnh9C0qbK_f_RH
X-Proofpoint-GUID: OtbVN0WvtdfYKjJyubK3Mfq2H6X78xi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_03,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070057
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2077qBCf004689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 07:56:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160250

On 1/7/22 3:51 PM, Mittal, Anuj wrote:
> On Fri, 2022-01-07 at 10:56 +0800, kai wrote:
>> On 12/29/21 9:30 AM, kai wrote:
>>  =20
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Backport patch to fix CVE-2021-4008 for xserver-xorg.
>>>
>>> CVE: CVE-2021-4008
>> Ping.
>> Kai
>>  =20
> This is in this week's pull request and should get merged soon.

Thanks.

Kai

>
> Thanks,
>
> Anuj
>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>  =C2=A0.../xserver-xorg/CVE-2021-4008.patch          | 59
>>> +++++++++++++++++++
>>>  =C2=A0.../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
>>>  =C2=A02 files changed, 60 insertions(+)
>>>  =C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-
>>> xorg/CVE-2021-4008.patch
>>>
>>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-
>>> 2021-4008.patch b/meta/recipes-graphics/xorg-xserver/xserver-
>>> xorg/CVE-2021-4008.patch
>>> new file mode 100644
>>> index 0000000000..3277be0185
>>> --- /dev/null
>>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-
>>> 4008.patch
>>> @@ -0,0 +1,59 @@
>>> +Backport patch to fix CVE-2021-4008.
>>> +
>>> +CVE: CVE-2021-4008
>>> +Upstream-Status: Backport
>>> [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ebce7e2]
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +
>>> +From ebce7e2d80e7c80e1dda60f2f0bc886f1106ba60 Mon Sep 17 00:00:00
>>> 2001
>>> +From: Povilas Kanapickas <povilas@radix.lt>
>>> +Date: Tue, 14 Dec 2021 15:00:03 +0200
>>> +Subject: [PATCH] render: Fix out of bounds access in
>>> + SProcRenderCompositeGlyphs()
>>> +
>>> +ZDI-CAN-14192, CVE-2021-4008
>>> +
>>> +This vulnerability was discovered and the fix was suggested by:
>>> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
>>> +
>>> +Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
>>> +---
>>> + render/render.c | 9 +++++++++
>>> + 1 file changed, 9 insertions(+)
>>> +
>>> +diff --git a/render/render.c b/render/render.c
>>> +index c376090ca..456f156d4 100644
>>> +--- a/render/render.c
>>> ++++ b/render/render.c
>>> +@@ -2309,6 +2309,9 @@ SProcRenderCompositeGlyphs(ClientPtr client)
>>> +
>>> +         i =3D elt->len;
>>> +         if (i =3D=3D 0xff) {
>>> ++            if (buffer + 4 > end) {
>>> ++                return BadLength;
>>> ++            }
>>> +             swapl((int *) buffer);
>>> +             buffer +=3D 4;
>>> +         }
>>> +@@ -2319,12 +2322,18 @@ SProcRenderCompositeGlyphs(ClientPtr
>>> client)
>>> +                 buffer +=3D i;
>>> +                 break;
>>> +             case 2:
>>> ++                if (buffer + i * 2 > end) {
>>> ++                    return BadLength;
>>> ++                }
>>> +                 while (i--) {
>>> +                     swaps((short *) buffer);
>>> +                     buffer +=3D 2;
>>> +                 }
>>> +                 break;
>>> +             case 4:
>>> ++                if (buffer + i * 4 > end) {
>>> ++                    return BadLength;
>>> ++                }
>>> +                 while (i--) {
>>> +                     swapl((int *) buffer);
>>> +                     buffer +=3D 4;
>>> +--
>>> +GitLab
>>> +
>>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-
>>> xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-
>>> xorg_1.20.10.bb
>>> index e0551fa999..9a7aa1ed9a 100644
>>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
>>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
>>> @@ -9,6 +9,7 @@ SRC_URI +=3D
>>> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.p
>>> at
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0file://0001-Fix-segfault-on-probing-a-non-PCI-platform-
>>> device-on.patch \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0file://CVE-2021-3472.patch \
>>>             =20
>>> file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
>>> +           file://CVE-2021-4008.patch \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0"
>>>  =C2=A0SRC_URI[sha256sum] =3D
>>> "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
>>>  =20
>>>  =20
>>>  =20
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160247):
>> https://lists.openembedded.org/g/openembedded-core/message/160247
>> Mute This Topic: https://lists.openembedded.org/mt/88254273/3616702
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
>> anuj.mittal@intel.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


