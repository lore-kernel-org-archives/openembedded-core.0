Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99054C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:52:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1690.1643424735164308608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=b90nBXu9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9028ab387f=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20T2qEJ8014976
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=nrD6oqNrNp8O3pb+vKNSTDP2xaDICQXgiKyZ1eKd5K0=;
 b=b90nBXu9hxr9s1kqXSynRMp6YJJpJdcQdWVJMfTJyddYBhMtXPaUWOM/XLa1ieeIrkOV
 HVIHiGHyrh10feashv+pKc/S0XawZ8HVs1XCTVjVk05hI0pyY3JGH2dT4FoEMHonJlRH
 WCKCO8ysJ2wjoqIQoB+5S/QUKFyLk0K/abVx/U32Gd08HOhNVN+P3usZev2KteLYZcOt
 pY8GaHRgNOIMXhaqGkfCnLab76LIYcj3rMLsPc/i/Gm00VpUsNF1KUhINdD8lTpkSQbJ
 Ijc5DFGx8SRvga3n3qRdLWg3rXSeRoxpTTWaQB6cDCifGMYlV3H2eMcirgcKigIymNl+ bA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dvtsyr25m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 02:52:14 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20T2qDLi014970
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:52:13 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dvtsyr25k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jan 2022 02:52:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWC3mGsvaBSXZ0wXTsX5yFQYYUCoeNoPVnKL2EBbmaIBy1tPbeemsu8rCIhjbY86UKPXX2OyEV/uxMafgUeUFsunmLT5SB/tvypZLPm9wWQqrnHl/5tbktrvqFkgZiB+kKu//8fE+0OHGITDURHd1VmQLIeQWf2vwko5DCTdtA37lAJ6PGAAaL1vDve1vlHiTGTE21/XFtmQKouZQLtbaQJropBb7T0cbUVxzZcHAl5W8GsNn6An05d+4OoQRLAQ3lumM2ASG8pEkBIY+OUXVGc5vUpDLGKcPStXMuD+t3rUiNeawvlpPKd3FLTF/CHXPv3sA/Pr6VSXOTP27dZOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrD6oqNrNp8O3pb+vKNSTDP2xaDICQXgiKyZ1eKd5K0=;
 b=GO7VmF4ql7KNVO+U2gVyNZ7DFlzG0wEIUeUiR0v9FV2kwsqwQFLVPWx224u4KdpUHU4rJlk6TohWgL7vkuw0Eyhq6NuG5AsJsXSWNqNhnjP4CVZD5qekpSAiW8s6gP3xVFMCjIE4934pKXCnQL9+YgNCnp7sVJTWvqTxD6cyMSfcM9Wh3BgwSuM9dnNPYOgwerSdBsm5wc73NVDvdcfA4ySPJenVOyKOu64rNoT1upOHXUg6xAJP54/SCXcvra6iiBp7J0sicyUlOEJci3UKppna6rbADmsrdrDAwKE5FdkQxpuUzfZu3dYZwukiRIh2Vka03Esu2c/na/Rd5F/WAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BN6PR11MB1842.namprd11.prod.outlook.com (2603:10b6:404:101::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Sat, 29 Jan
 2022 02:52:09 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202%5]) with mapi id 15.20.4930.020; Sat, 29 Jan 2022
 02:52:09 +0000
Subject: Re: [OE-core] [hardknott][PATCH] pigz: fix one failure of command
 "unpigz -l"
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <16CB0086EE7F5515.30699@lists.openembedded.org>
Message-ID: <f5ea8a6e-9c57-1024-9340-d42333a12599@windriver.com>
Date: Sat, 29 Jan 2022 10:52:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16CB0086EE7F5515.30699@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------D40E68D56B29DC35A5D96D9F"
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e9367f1-a952-486b-c99d-08d9e2d25764
X-MS-TrafficTypeDiagnostic: BN6PR11MB1842:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB18422A2E067C0708AD59D57082239@BN6PR11MB1842.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bHObo1j5olHFLMJCB2vRES+ebhqq9hLymP38Q6VjpXB6QGoHGk+WEvKtukaNPoVPwVDfHn8n5oN9N4vPwo2zZOsSZCnYKdmARKuRd9k6tLvciBUP/ySApJ6yIprOEr3rybiSRlZZhHuIaS5db/6q1e0O5unOTlbbDfOukqC/bsBgf1N4Eyekqyy+sLb0L9vuApxZSb9NZUPaofnrMBzaxvKi0AZheBe3M2y/jtAK6vlUIzaElczCFITci/nYelrWkFomFjH3a9X/wJsjTIdOCuAoXl9s9o7xK/gMuAEylF4up4c1QbI+r32hkvBy4x20vlx+Q+x8KhK8kGwx0k4u8uJfpsdp7i2mET8OCX+UV476fKWGX97ihMdH5DMz4S8Ww6S4bs9KueOD1askSPCk3gGYFleRncSws1RqtctyAP+jwQxfi2iJqIBALtbokF52BZjPctpsqfElcQttr4TvIhv9XfqUzJ+UawMIz//5vUlvYYXjacdvUIsKxHE+tUrei509h2rIqmWYJOB+E9QwjcrTftbte1JhPdnKgiGgjrZG1qivNFgHjaf8H1jXgINKYO+NJW5qG4JoOPm1gtENqSEo8qGzlBOy9AfDGiaZuiQSRKrgy10xuLV8oqypZOhlBFW5DS9BjJ1tQdUp44xuvjxjbkr2Uwp2hBIkZFEuVkKEj8dAZnP++hFJZlvgOJYqAnd/0R02eJ8EqDGk5h0UJ8ia6GldS4pKEFYKPxSHP1ZvnnNc7/bsj2UofH6M/J91Yj8M5y97ze+44tUHhIz4Uqzfx2mpoqTvSzRJxzEyFwvXjBHMRlQhp/P+/jvtU0tHV9T4Zf5gIasZ4pY0Xdne2MAfDI8J+xbWjvehP85esWmGCMlFj3WVuIZ0j776jsAb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(53546011)(966005)(38350700002)(52116002)(86362001)(6486002)(6666004)(166002)(31696002)(2616005)(38100700002)(6506007)(33964004)(36756003)(186003)(31686004)(44832011)(8936002)(26005)(66946007)(66556008)(66476007)(5660300002)(83380400001)(8676002)(6916009)(316002)(2906002)(6512007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUYxelM2cXVIZGZCSlZGN2RvNmVFT1RnN3EyMTE2WDBMNExsVHpoNG9RcFFG?=
 =?utf-8?B?S25oNld3ckNuOVFmajMxWkd0czBLTDV2eURyNWJLVURQSzBGZENjcVFTUFln?=
 =?utf-8?B?cVljbGgrU2V6emZycHFicWFJaHdvcXdpYkhKcUpndTFaTVQwRE10cytiZmUr?=
 =?utf-8?B?T1QxTGk0RGJjVE9xanczOUZsenB4MnpnSkFiUURZSUxPUVIzOFN0TGtDK0o4?=
 =?utf-8?B?OVlHK281aXVCUWpSTURjYTBZWU14WEJTdFMwWkZ4SGNVL29ocmhmNVdQOWxU?=
 =?utf-8?B?VThObjlOSHBtelJmUjRFN1QrT3FkQUlWODZ2RlU0VGcyaWlVRGlYamEzUm9R?=
 =?utf-8?B?RjJBWDcrdXpaTVozY1lVcmtmQmFGQ29Odnh2QWZXQWxQNHc0UTRCOXplR0N4?=
 =?utf-8?B?ZnduYmdMY0NMZTRZWHRwSngwSndiMW9RdEFJems2UGJmU091MXF6d1VEZXhX?=
 =?utf-8?B?cU1oRis0VHVJREplTkZ0Wk00Mm5ibEU0SHE2ZlpiSGQ2UktPMURwM3E0cHJv?=
 =?utf-8?B?N0xJV2xRZmhKNHROcCsrSllNNHJsRWdxSHo4OXBMSlJIenplUndYc0twQlB6?=
 =?utf-8?B?aXJGRndreVc1VWpLTWszM3VnYmNJRzcvV3E1bWhWRmNndlUwZk0vR1Q4S1Ro?=
 =?utf-8?B?ZUhsNzRNK2EwTGpLakozVmNNWWhrZmNTS3Q3UFM1NndkSEFySDY2OFVIUktJ?=
 =?utf-8?B?M24wSEt6bzRrdEsyTng0QXRMNytISlJtcnhray8yWnVibklSRStNODFXVGRh?=
 =?utf-8?B?UDU5d3hIWGdVZEovWHQ0RkJlMzM0Q2ZEQ3IyeXAzbzNycjFtVUNhWCt1N0I3?=
 =?utf-8?B?SFMxVlFzK2Z3ZHErZTExMW5DZy9wY1dIQnh5R2poOXRUS0FwMHUzbDRjRHVl?=
 =?utf-8?B?Z1ZFVy9wZms1M1NuWDJveGVrZ2d5emt3STdCY254S3lvSW00ZWhYQy90bUxz?=
 =?utf-8?B?SGlVSkVrQVZzekE4UTZJeUJLMVcyNThyN1dGZDMxeEFSdG1HZGsxNXYwMEh5?=
 =?utf-8?B?cm9EMFliS0hnQVZHdXgwcDE4WjhNMlBPZ1lQN2N0RTdkNUp2TWNDb1JUOXRm?=
 =?utf-8?B?V05Eak1wbmdEckF2VTlpUUNVZjVqalBQVVI4SER6dC9KbDNOZVVra205blBt?=
 =?utf-8?B?QzFZZXpmY0k5Z0FoTHZoUXpUMXI4YVZBSERkSnZUUkhlaFhDZVJxOGhDSVFD?=
 =?utf-8?B?ck43TTJBR3BFV0grR1dVT1UwMDg0U201UUpvaXN0RWM3R0JHZFE0ei96U0pw?=
 =?utf-8?B?MDFsb1hDMFV1TnBmKytlT2Q2VDVBdEFQR1YyWmNMMEs4VmF0dTcweVZuZXg3?=
 =?utf-8?B?N2dUQ1g0RW14WnJuTzhNZ0FZRnFPYU9Vb0VOTWVoNDIzZFhITTFtN1RTcUdT?=
 =?utf-8?B?NzlTZXBFcm9DSEVNVHdWcjUvNzdIOGErWm05YW5MWFFzRGlodmdpQmt2aFl0?=
 =?utf-8?B?aHlaQVlZZ3lXT1ArWnhxaE5VQTB2RzhJbTFnSjcvbzVZWmpLbEZHYnEwREM0?=
 =?utf-8?B?UlVKV1VON2FEZy9KYWp2RVNTRnVNR2d5L2VNYk53bHpNZGxhQ0RoenFUTms2?=
 =?utf-8?B?akI1SmN2Ymo4eTVKU0ttUXBtc2NVckh5MG5pOHlPMU9nTUxqZGp6UFlSZTM0?=
 =?utf-8?B?dHRVZGpZdkdKVHBZbkxVWkRrL3VFeDFSTlJqbFo0Vi9uaVRFaTZWa2RJaS9o?=
 =?utf-8?B?TnlJOGZQN1BXb015UVhHVUFIeWpMcVFkWjJKN0FHNW5YcHlRblQ1TWUzcXZv?=
 =?utf-8?B?c2M0ZlBlSit1SllLbFhjcHZqSEhkZStyT2oxQlJoVGYzMTdxS3NtYnFhNGhh?=
 =?utf-8?B?bGhMU2VoZlpwVTdaUndYZlpKVDVvSWJDZ1BmUTdFZFZ3SnFxSnRveUp4SmZQ?=
 =?utf-8?B?SjlTTlZQUnQwWUpmUzVuTndOTnBKRFQ5NzhqeGZ5L202MEtRTVdaZ3Y5MkJQ?=
 =?utf-8?B?a1psTnkyby9xVUhwSlBvTHVWVVlGeTdiV0VmVFNlNmg5OUtBUVVaRjNYb1Zp?=
 =?utf-8?B?dnpqZ3JUSmV1bmJnaFRKYnZtQlFwYnVKenhWeTFmY2ZRZmYrK01Hek9DQi9H?=
 =?utf-8?B?ZFhEbjdueUlhbWNQSmZ2ZTlyVkFzdDF5MlQwV01zcWI0Y3lHQ0lRWFE2bVg5?=
 =?utf-8?B?T24vUTFDbjJEYlg5YkNjdEVXNHBvejI3elpCamdSQ2pLOW9JaVR4YnBoc1Bm?=
 =?utf-8?B?MitCVSswTDI3YjVRM25ubmVnYnRuL0RxMHlVaExHVXZLNG1QZGhzQ0FaMFFk?=
 =?utf-8?B?K1p3V2k2d0xjaXhVNFBMUkt5SFRBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e9367f1-a952-486b-c99d-08d9e2d25764
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2022 02:52:08.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M//VHBf/5emEo9XoARjHWXrRWDbiSfL6iUxjMTjI6o+DwN98veUhJ0JoN2RW33X7f9akDJgxljHO28LntKNUQ3Hz4wS9ckxAZgBDTpfOszA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1842
X-Proofpoint-ORIG-GUID: DVzp7EmJcaggDF8SvebwF5kK80-vJ6YT
X-Proofpoint-GUID: BnqE-IBDRLJYRlUs-QiLRu-azk8g1H3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-29_01,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=921
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201290012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161095

--------------D40E68D56B29DC35A5D96D9F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Richard

Could you help to merge this also to hardknott branch? Thanks.

On 1/17/22 4:11 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer [1], "unpigz -l" failed with error:
> $ ./unpigz -l test.txt.gz
> compressed original reduced name
> 228799 209715200 99.9% test.txt
> unpigz: can't destroy locked resource (pigz.c:2622:mutex_destroy)
> unpigz: abort: internal threads error
>
> or
>
> $ ./unpigz -l test.txt.gz
> unpigz: skipping: test.txt.gz unrecognized format
> unpigz: can't destroy locked resource (pigz.c:2622:mutex_destroy)
> unpigz: abort: internal threads error
>
> [1] https://github.com/madler/pigz/issues/96
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   ...0001-Fix-bug-when-combining-l-with-d.patch | 50 +++++++++++++++++++
>   meta/recipes-extended/pigz/pigz_2.6.bb        |  3 +-
>   2 files changed, 52 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
>
> diff --git a/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
> new file mode 100644
> index 0000000000..9c301f2054
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
> @@ -0,0 +1,50 @@
> +From 65986f3d12d434b9bc428ceb6fcb1f6eeeb2c47d Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Mon, 17 Jan 2022 15:36:56 +0800
> +Subject: [PATCH] Fix bug when combining -l with -d.
> +
> +Though it makes no sense to do pigz -ld, that is implicit when
> +doing unpigz -l. This commit fixes a bug for that combination.
> +
> +Upstream-Status: Backport [https://github.com/madler/pigz/commit/326bba44aa102c707dd6ebcd2fc3f413b3119db0]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + pigz.c | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/pigz.c b/pigz.c
> +index f90157f..d648216 100644
> +--- a/pigz.c
> ++++ b/pigz.c
> +@@ -4007,6 +4007,13 @@ local void process(char *path) {
> +     }
> +     SET_BINARY_MODE(g.ind);
> +
> ++    // if requested, just list information about the input file
> ++    if (g.list && g.decode != 2) {
> ++        list_info();
> ++        load_end();
> ++        return;
> ++    }
> ++
> +     // if decoding or testing, try to read gzip header
> +     if (g.decode) {
> +         in_init();
> +@@ -4048,13 +4055,6 @@ local void process(char *path) {
> +         }
> +     }
> +
> +-    // if requested, just list information about input file
> +-    if (g.list) {
> +-        list_info();
> +-        load_end();
> +-        return;
> +-    }
> +-
> +     // create output file out, descriptor outd
> +     if (path == NULL || g.pipeout) {
> +         // write to stdout
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-extended/pigz/pigz_2.6.bb b/meta/recipes-extended/pigz/pigz_2.6.bb
> index 05be9b733f..5c0aab55a7 100644
> --- a/meta/recipes-extended/pigz/pigz_2.6.bb
> +++ b/meta/recipes-extended/pigz/pigz_2.6.bb
> @@ -8,7 +8,8 @@ SECTION = "console/utils"
>   LICENSE = "Zlib & Apache-2.0"
>   LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
>   
> -SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
> +SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz \
> +           file://0001-Fix-bug-when-combining-l-with-d.patch"
>   SRC_URI[sha256sum] = "2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d"
>   PROVIDES_class-native += "gzip-native"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160634): https://lists.openembedded.org/g/openembedded-core/message/160634
> Mute This Topic: https://lists.openembedded.org/mt/88480299/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------D40E68D56B29DC35A5D96D9F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi, Richard</p>
    <p>Could you help to merge this also to hardknott branch? Thanks.<br>
    </p>
    <div class="moz-cite-prefix">On 1/17/22 4:11 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16CB0086EE7F5515.30699@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refer [1], &quot;unpigz -l&quot; failed with error:
$ ./unpigz -l test.txt.gz
compressed original reduced name
228799 209715200 99.9% test.txt
unpigz: can't destroy locked resource (pigz.c:2622:mutex_destroy)
unpigz: abort: internal threads error

or

$ ./unpigz -l test.txt.gz
unpigz: skipping: test.txt.gz unrecognized format
unpigz: can't destroy locked resource (pigz.c:2622:mutex_destroy)
unpigz: abort: internal threads error

[1] <a class="moz-txt-link-freetext" href="https://github.com/madler/pigz/issues/96">https://github.com/madler/pigz/issues/96</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...0001-Fix-bug-when-combining-l-with-d.patch | 50 +++++++++++++++++++
 meta/recipes-extended/pigz/pigz_2.6.bb        |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch

diff --git a/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
new file mode 100644
index 0000000000..9c301f2054
--- /dev/null
+++ b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
@@ -0,0 +1,50 @@
+From 65986f3d12d434b9bc428ceb6fcb1f6eeeb2c47d Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Mon, 17 Jan 2022 15:36:56 +0800
+Subject: [PATCH] Fix bug when combining -l with -d.
+
+Though it makes no sense to do pigz -ld, that is implicit when
+doing unpigz -l. This commit fixes a bug for that combination.
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/madler/pigz/commit/326bba44aa102c707dd6ebcd2fc3f413b3119db0">https://github.com/madler/pigz/commit/326bba44aa102c707dd6ebcd2fc3f413b3119db0</a>]
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ pigz.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/pigz.c b/pigz.c
+index f90157f..d648216 100644
+--- a/pigz.c
++++ b/pigz.c
+@@ -4007,6 +4007,13 @@ local void process(char *path) {
+     }
+     SET_BINARY_MODE(g.ind);
+ 
++    // if requested, just list information about the input file
++    if (g.list &amp;&amp; g.decode != 2) {
++        list_info();
++        load_end();
++        return;
++    }
++
+     // if decoding or testing, try to read gzip header
+     if (g.decode) {
+         in_init();
+@@ -4048,13 +4055,6 @@ local void process(char *path) {
+         }
+     }
+ 
+-    // if requested, just list information about input file
+-    if (g.list) {
+-        list_info();
+-        load_end();
+-        return;
+-    }
+-
+     // create output file out, descriptor outd
+     if (path == NULL || g.pipeout) {
+         // write to stdout
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/pigz/pigz_2.6.bb b/meta/recipes-extended/pigz/pigz_2.6.bb
index 05be9b733f..5c0aab55a7 100644
--- a/meta/recipes-extended/pigz/pigz_2.6.bb
+++ b/meta/recipes-extended/pigz/pigz_2.6.bb
@@ -8,7 +8,8 @@ SECTION = &quot;console/utils&quot;
 LICENSE = &quot;Zlib &amp; Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21">&quot;file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21&quot;</a>
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://zlib.net/${BPN}/fossils/${BP}.tar.gz">&quot;http://zlib.net/${BPN}/fossils/${BP}.tar.gz&quot;</a>
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://zlib.net/${BPN}/fossils/${BP}.tar.gz\+file://0001-Fix-bug-when-combining-l-with-d.patch">&quot;http://zlib.net/${BPN}/fossils/${BP}.tar.gz \
+           file://0001-Fix-bug-when-combining-l-with-d.patch&quot;</a>
 SRC_URI[sha256sum] = &quot;2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d&quot;
 PROVIDES_class-native += &quot;gzip-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160634): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160634">https://lists.openembedded.org/g/openembedded-core/message/160634</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88480299/3616873">https://lists.openembedded.org/mt/88480299/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------D40E68D56B29DC35A5D96D9F--

