Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56BCC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 01:21:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5344.1667784099529889611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 17:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qdNNHkQ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83104f160c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A71E2wg029755
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Nov 2022 17:21:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MRlP0lkanwlWmVvWxAhDzch+JpHY+2ocpMLUO98i1+w=;
 b=qdNNHkQ5O5PnehsdPC15k6x9DAzBL5mH/plvNeXfB6g5gtDlVd3dag3PW0JnPIen4E0z
 rzoYmI16vtiljzawLSUgXY2Z8CL86QWuqYbp2fDq5kSHytme1a3QcQIvahVKihjTz8en
 jnk+/Gg2kzC1Cs/Oxu0tIhb9VivnLD4waPR4nzCTWkunYdp4vz1Ax66wuu11WPjzmazU
 fAS4yKbrbepmo6Ef5Eb51BsN4/7NRfp8TH7AKJTpd1bEP4ZeHElZF03EDscchuXZ7/fC
 W8PYGxNn7RFAMyeSQEzuokkrmSvWOz6GfilFUhd1mGk9/6g5qbtE7SqcHZM4NPmakUBp gQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knqbkgyy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 17:21:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEEq2skBJ8fpKYIoCMw10wk32kbOnCRSbqE3hLV3LRRWbvJY+J1P6OvxIUdRpMo2PLd1FsDC9G00x7t0Ej/5brQAlhgWvmFqr2P7ltDGMHdrIZ+LXQdMYV8P09QI70rqOuf+PCIahCrlZSDaO6aHkNse2Ux3LkVvBw7m1CO/fVAvRRAh8fJfpdsSr7CgAaqEP7/wMx0r0HVr/9275Ay+tEB2GwIVsX397Vs8su2FmeH/Ynfk9ldKQ75thK1sNzB0a4UexM3MLk23PKBhpEJCVBauLx8858W0Se98/8oVTvjCwtwOaye2ZeaWR/dAHiMSspf5P/ud/1VvqMNmz+eBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRlP0lkanwlWmVvWxAhDzch+JpHY+2ocpMLUO98i1+w=;
 b=mr6oITzp2+vgZIWnGwdfxTotPPrlDp2aDs4R7crtKrFLcbfijmo+uEg8M9iW1gowDUjectzJr7nJDq1Xrs/k1UuL8IKGwgal32CBJaRC1B/ijF3h8A5ISz7H7oqGV5jnmFJ4XeVoO2akGof44x2sQX7XAVmIN6V+omN7eHtlpw2tnIlPEuPoIRIAWhZoBTbg6ebLlfwjbVxdWSYorUDULvNbBod0X5amXTkMn4JIJHWiUs2v/O3icE8k44o+CfROna6eCtMmCZpf4ptOiTkYWk78jFS/36dFcUBsm2Ahgd6Urd0v+7jCmUGqMlsrZe2bVTIZJPdbCFhS5qN3N8l09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 01:21:34 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5791.022; Mon, 7 Nov 2022
 01:21:34 +0000
Message-ID: <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
Date: Mon, 7 Nov 2022 09:21:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <172352CEDDCB35BE.6436@lists.openembedded.org>
In-Reply-To: <172352CEDDCB35BE.6436@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0146.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH8PR11MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: a03d30a4-78e3-4537-80ff-08dac05e68ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9qvfrfFi2RvekssJkyQ0SOrg/Ln5tFoTQraN2kMTjM11ggoxJQs6OScqlVAMlgLSPedyl6ePnT6l8f3sG8AG5qhY2GHDdeoL52ljaoEZlesZfzNFHYnGzfJb1vKkhKUj6nY/zdE5MMkqNOup0qJ2W+F6JkPKIdxBKKyfcB8Utf46MI0SptHBoXHDca/BYPFLIQle1gXekyMH9FheVAtg0OmixAALw3jZ1j1FsTFpQ54mHfsOXIwZJJGIi0rojz1l41Bt1qC3dAA7Re8WqNh6acPHeGagbBcIVQAp6uFxQo4ZCqACEcdLE8+5yCILv7CIFse5Vnr74rTluw4Xlu1IsXLoZ/ONlnskyPM8LoIOjDZRsjXHVuCcKDHWnIqPaJQ47ODIYvwBM3EyTIEfdkZYM3so/R97LOpmG8LLfCr/yP6MLGrvj0nKhv58Z4jYRgQGGcSGz7wtuPTrUeIWPvV66W2fhN/WdCejdO6RJX5QWBGbZZNxEXZbPY+6Xhfss56THjzjjFwPN6VVB5mbw0Gz4IrII34N89ZWCT9Tt8kEkKoRtB4AItfsZ55LsIXZaOSTap4gCwekizSsB+wOVpmeatFhAdh+lwYNWhP7KPc1KTgFNWnf55K7cak4lQ8AkL85eJSynXrb3OdctUOF3377tNt8KqwmrB8LAoqLXJztQVgkRvdanSoqU4xFYd38QaPZIeNTSbA2XCHndDNNxz8w9hJTTgWJYC0sRP92oEF9wxFNY7trkvf2xHFMWniaNcmiGeoHGVZY1XJ1LJIwlT++Pb9bW9u+yWW5YP3nRI54ih89XpP5x013NakOtiwVi1g488lkd0gNl1PL25MQf0vyECCUpisBEt9VAexc2LAEtQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(39840400004)(136003)(451199015)(66899015)(36756003)(41300700001)(2906002)(6666004)(6506007)(38100700002)(5660300002)(8936002)(6486002)(8676002)(66556008)(966005)(66476007)(66946007)(44832011)(316002)(6916009)(2616005)(31696002)(86362001)(31686004)(53546011)(26005)(83380400001)(186003)(478600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEJlY21RWkNqR0dFc3BaZWZ3SEZSQ2ZNdHhhVHp6bE42M2w4M1FCdXFLc3Jw?=
 =?utf-8?B?L3VsRmdlNDBYeHdTK2c2NkFrQk1XZVFEK1RiYk5iZE85a2pRK3E5OGRCOUVV?=
 =?utf-8?B?Tlg2RFRXL2FhWk80cnVEMStKVmVOOW44Q3ozNng1Y0hsSW9KWjIrTU1RK2hj?=
 =?utf-8?B?RUF4OS9aT2REZXd1RmR4VGJtNE5OZGZYRXVGZDlpWERTM2FkNW9Xa1h0QjNo?=
 =?utf-8?B?MnVsdGlQVDhYUTJHZUJCaUtneXNXMnQxMlVPRWxRUHIyOFZucUJ3NUx3dVFH?=
 =?utf-8?B?RERGamJ6U1JXOHF3eTBGZ0pEdlp6eVk1MjB3YUZWdWZFdHV6d3RweEpNWGJa?=
 =?utf-8?B?bDRCbWlNSG1idHRpRkF4U3RFSm1hdFhiZDNJbkNMMUdMcG9ZUzdUUGsxODJZ?=
 =?utf-8?B?TDc4OEZTdGJVcnc5ZjFqRWlmRGJhOVlwWmltTDhmb0JuSEVHekxpRFgrYW5k?=
 =?utf-8?B?a1dvcHE3amt0TVJ5RmZ3cUdrVk5PeHk0RWl2TkhsZjh3eUIxS2UwdHZNOW5m?=
 =?utf-8?B?MXFPOE9FR1NKREdmQlNRRDJ4UDc2T05HUFl3ZEdSZWFXRUN2dGZaR05jcDBE?=
 =?utf-8?B?Z01PelBqNlBYb2x3cnZIcXdtdVpTOWlyRzlpNjlrVXNnU0JzbnhwSUxHTHlQ?=
 =?utf-8?B?TnB2eTNyNG9rRVNrbkVjeno0TzFicEs5dWo1NFowYTU0b3J3QWFiQ3FGNGVy?=
 =?utf-8?B?UkdORnAvQWN4MkE1RUJpWWh2bzdPUGJFZmsva1pnbEhyOUxyMWUzUCt6M3Ns?=
 =?utf-8?B?NnloRENXclVCQkJmT1pOM1lrbHYxMENlZ0ZsbXdzRkR2WWxoSFZZbWNveXF5?=
 =?utf-8?B?TStqRjlYSkZhNFdnc0ErUVRycFZOdDhScE1ZTm0yNTMwbWF6TzFiUnBlODhx?=
 =?utf-8?B?eHpSNHdldThabWp6V0JJdDRtMlBsR1lsSlZvV2R0emV3TWRWWEdOcmVGSm1O?=
 =?utf-8?B?Y1RxNFl1ajFyTUU1eVdpZWhEM2tjNTFSVlhIeDlMZ2Uwbi9IMEh5Qjd4MExT?=
 =?utf-8?B?Z2I5ZTRpWHhOam9uOWpuYmd4NEFVYk53RHBVL2oxbDlGdWNvcGx1TERYbmhJ?=
 =?utf-8?B?bWJhS3N3bS9aNERLK2hPNzRlRDJINlkzUVIxODlDRi81bHNHZ2R0WmZVQnNp?=
 =?utf-8?B?QUZlN1ovZkY5bHNScUUyV2dVWGhUbXdGaTFCelNTMmRDL0U0UGNUd2o3MUJU?=
 =?utf-8?B?cGl1MENqbWp3L25CdXdZVnV2Vmh6TkRKTEhCRzNZbjIwc0s3aGF2UzlOczBL?=
 =?utf-8?B?ZVNyb3JWdzV6b2V4b2lpTUtFajZ5ZkNnRWpaVHlNRGVNc1V6YWZjQ3NnWnh3?=
 =?utf-8?B?alZOUFcvRk5jWDJnVms3S2hnTVZtOEt2RGVkYnFtMmNoU0UvcDAwMmZJZUp5?=
 =?utf-8?B?ek1FRnc5c2RCN01majFoSkY5bUNadU9UMEtYaHdKUUpYUSsyMHkwWllXT0hy?=
 =?utf-8?B?aFRsbEI1MHRhRndZdW5hMUtSS3dWZ29WR2xqY2lFZlUvSzJNbUtSOWtEQmJZ?=
 =?utf-8?B?NVQyUWpVVzlsbllZR1FYc0tBVHJmUUc4dVBBN0d1VDNjSVQyV0tpRzhOVWxL?=
 =?utf-8?B?REVQS0ZYUmJnY2JaaGhMUkkzSVNHQWxIekZkeStvZUE4REZSWUg1ZlBLSTBi?=
 =?utf-8?B?VnlsbkphWmxOMXhBaGFkakN4R0wvOFVud0l5RFBRUkN5N09CaGFaTnY5Y2l2?=
 =?utf-8?B?TWlEWHVNWk5uaGtyR0xGTFJseU9YNjBJbXFJazdIenlJZzM1VDJGT0hVS3hq?=
 =?utf-8?B?YWF5LzVDZlNVcHl2alZUL0twdm1kdjViTnlVWkFmVVArMVJhSjVZbGRZZWZP?=
 =?utf-8?B?SnRqejU3UWczRVVRQ2dXaHR3QXRldFNNNjNnWmZsRXd0VU9ENnBEVmRlZnFo?=
 =?utf-8?B?WGRWMDRKTklxWHE3cGFycEEyUFlDSEpEYWl2MitYTUxFNnlKVExyU05ITVBS?=
 =?utf-8?B?Ry9EaVQ0UDl5enZPRmhWOWV3R3h5aXNMdTcwWjZuL2tJMG1VY1N6TDBsWXhE?=
 =?utf-8?B?V3U1VndvaXlYSlJBWEJmMWhjelk2aERuMk54N2RtUjhkR0ZFVGRyY3ZPSWxN?=
 =?utf-8?B?UDFWdGRyM3NoeFZsZGJidC83Vjdzb1F5NVFwYlFlR2pvSEJ5R1F3SHZZc0RR?=
 =?utf-8?B?MmE2WHJXWllQQjcwelpLbm5LV3RkQnFhS1pvQkJVZ0NGbGlOQytpYk56VWx5?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03d30a4-78e3-4537-80ff-08dac05e68ac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 01:21:34.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPDFBMfGO5zu98SEP7VuS4MUnlrcJG16wzimvSpxgvvyXo840+T9CKOuzpWQQMuvx8UAaysO43kZrKbsBTIfx2AIu1E68OugnyS6paLB6Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
X-Proofpoint-GUID: I74ph8Zz4Cht7iLZX8Et7tbiwXIZ93-0
X-Proofpoint-ORIG-GUID: I74ph8Zz4Cht7iLZX8Et7tbiwXIZ93-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=937
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 01:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172819


On 11/1/22 09:48, Xiangyu Chen wrote:
> With the default jitter options aarch64 CPU-based devices typically experience continuous
> high CPU utilisation for several minutes after rngd starts.
>
> Accoring to the rng-tools issue #150[1] and comments[2],in order to address this,
> the following configuration changes have been made, those configurations
> also can be found on Alpine Linux[3]:
>
> - reduce the number of threads used to 1 in total, rather than 1 per core.
> - reduce the buffer size from 16535 to 4133 which reduces the time taken
>    to fill the buffer (and so reduces the duration of CPU load).
>
> [1] https://github.com/nhorman/rng-tools/issues/150
> [2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-953079212
> [3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-arm
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
> Changes in V2:
>    *put the aarch64 specific default file in meta/recipes-support/rng-tools/rng-tools/aarch64

Friendly ping. Is there any more concern on this?


Thanks,

Xiangyu

> ---
>   .../rng-tools/rng-tools/aarch64/default               | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta/recipes-support/rng-tools/rng-tools/aarch64/default
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/aarch64/default b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
> new file mode 100644
> index 0000000000..5a2fbcc9ef
> --- /dev/null
> +++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
> @@ -0,0 +1,11 @@
> +# With the default jitter options Arm CPU-based devices typically experience
> +# continuous high CPU utilisation for several minutes after rngd starts.
> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
> +# https://github.com/nhorman/rng-tools/issues/150
> +# In order to address this the following configuration changes have been made:
> +#
> +#   - reduce the number of threads used to 1 in total, rather than 1 per core.
> +#   - reduce the buffer size from 16535 to 4133 which reduces the time taken
> +#     to fill the buffer (and so reduces the duration of CPU load).
> +#
> +EXTRA_ARGS="-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refill_thresh:4133 -O jitter:thread_count:1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172349): https://lists.openembedded.org/g/openembedded-core/message/172349
> Mute This Topic: https://lists.openembedded.org/mt/94701000/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [xiangyu.chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

