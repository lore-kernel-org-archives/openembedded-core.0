Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C67C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 03:19:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.18783.1642994376337073570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 19:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MeKRYgRp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8023526888=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20O38YMw025973
	for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 19:19:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=o5qsVGwhR4E6xV32CCi++/KXXz9/vD7wxUmQAY4xrCs=;
 b=MeKRYgRp4t3hnC0FQTeJYlnlY2fbZ2H3dJEi2zreINXp+skimyd0t198KMlJ3gy59CEh
 vnyDeTD1GjtMSeIEYzgSEk4z4ObiA+jYP+Uo47CD0Rl2vfMwIctaVsxrx4cbJ2ZbEFHD
 QpYwC5E2ZAyyH0DXtlX/nOGWBTwM0+jjL7qelhcDRxiGuHFi9zfZpXZ1/B0QcNAC4gSz
 R4pE1gjnX72TxIxOspRwkXAP6uPJMja6B2MX35IMGFXnxec901W8pzzmwW7OR7pe4/rl
 s0sV1+WFdulXM/q0s3PyfCkA+FWzG6XHpov8voWcg33p4g8EHNPC9JhEtWa94kxiyWmN mQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3drjaprrmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 19:19:35 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20O3JZrn014302
	for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 19:19:35 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3drjaprrme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jan 2022 19:19:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyvOaoWmSMNKDi3VzQGZNV2hfyCa1RFIHq44sMRduE+t/pu3z1t0O6Gz0SfBugilf4pTV2dZ4AT7wQCTBF8gBH5taVSjQ8UNF0pR7I8HEEzriUl4RO2aca44lkLFK8/WEa1a8cC0JuxDRBwVS6XYcpbCAmPEQyGxoz6WsMfIVyOJ4fdwhwTeq/efp1vbmq8w2MCZIEWeK2ti83Zj83AktJvqXT1NV8VcWcSxV9NJgafQ46BFuQZn45gHGlUrN6DGa7bvFDN6qR2LpOZnn+rfwqoiHUfEbv79c2kIA8klPOp3mQbQnsaUc52RjK1qKpVJxckggxgyTkQrlJZaf4tEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5qsVGwhR4E6xV32CCi++/KXXz9/vD7wxUmQAY4xrCs=;
 b=CbAcKWHIq/cXObgzHYn5P2KiROMYQWTGkEhlGUFenMLTNnGntE+HrWET5aFaPdmgyU2kaGxjnOPjLcefJTylKMQ6b74Y+Ini1d9jC9du/MlZuJzhJj4+vS4ELbIMRpxAMIt6oebpsWIHck7UD94GpfZhlhLfLLlnvv0Ng8/fXvYGRWN3CMgJolZrbx99TXnnBuZucmljbAusz0N4gWYMSfIws3xYyXhMNnR6ShRQ5i8IBAN8quWKsxgT50w68oX6o6sACNOI7k0rbiF16ut4mdceAfVFaRqJE7tMncCUK1DT4wQ3u4Cg4C7oAViEZg8Pe2BWL45WFa/CGLDiSW4Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 03:19:32 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 03:19:32 +0000
Subject: Re: [OE-core] [PATCH] nghttp2: fix for multilib support
From: Changqing Li <changqing.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20220113034439.19018-1-changqing.li@windriver.com>
 <ba495e2870d62f9445d0c5f43da51cc2aba41527.camel@linuxfoundation.org>
 <16CB03E199171BFE.7166@lists.openembedded.org>
Message-ID: <7a8d8d4c-675e-febb-2439-25079eb7e7e4@windriver.com>
Date: Mon, 24 Jan 2022 11:19:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16CB03E199171BFE.7166@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------4DECB17A6A717DBE339FA442"
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c998f9f6-d85c-4fbb-3cfc-08d9dee856af
X-MS-TrafficTypeDiagnostic: MW3PR11MB4524:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45249A55756FA153D339133B825E9@MW3PR11MB4524.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iLSVZz/sF2I1Q6wf8Xjjfa8YRxjFUdAGvnbuLMXWhcXrhUwxNjdYpAwkmDBpYvidEg0V5jZbmFvOpFcM9wSN6bI7HQ6+xJ+1rN3p88AB7BwBD4kPDRr5JmO/ehPeiTFSJzsO/6oXG3I2NjNbJkIUQSrWJgrJ23HELFq+S1muOl4j0J0pC7aBe2MmHO9GEIrxzh6CoqKxRZHaBOdDQqn2YPLu8CrhnTzRWZ3zEU054PLMDUG3V+QYMrY9HnyhMNC5l6DQj5QLArbPZ88ubLaIUrBfdS1FKIy03rjzeCRz+bm5Ueaa9dHsZ0bvACU+A/hyuyMy4MmeXXLSsbdamzAWGO7Sy+hwjIZn3gj27VZLp8lOg5EDskSX+G2CaV7Afh2Nh/2H8AtWfeK8E79q3Oga5dZ3wAX2HxMzxqCJT/F8f+IiA1vA6YH3JwRJmhjWTBCUW0CRzcrAqoKjSiznvfD6AMLyPguB3R0Wo4nIzhHyPdFz6/6EnnInZzFSwTcO8Iaz5zNVW/yBm4l5FzVIWfV0QmRgRlKP7gVktD7WNRKSAYtoTpctqWm2m37vH4IYAAaxSXYA+7GB0hK7VSjONUpImN3NtPwsNjc2PnDAq0amteNKlQbz+N8zMl7//y/ScgbVJqjlAcTZVsxCG7hHxqGCXSdlWCTaOiuPeGjYUPTdRLpVKycHYcvN7xKnM7E/6CH6tr6OdIKyCajRbTqZka8zFGuPj3u0C5UK3Pp3vLrwZrUcNLKwtwVGU48CHHAyKoVljsWZPZ0rRqtELuO8LQm/iSP1u/9nAeBiCS+Y22/8XGLbxinFvOvLHWEQPWAY2Ygckuo5pKKc0/6WfMyVuuaIUOm/chZrJSbJjqGYa833PzHn7K/Tk65o8VNL8WwFemOg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(8676002)(31696002)(6666004)(52116002)(6512007)(66556008)(38350700002)(966005)(2616005)(66946007)(66476007)(186003)(53546011)(38100700002)(5660300002)(26005)(2906002)(36756003)(33964004)(86362001)(6486002)(316002)(6506007)(508600001)(31686004)(44832011)(83380400001)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0d3SzRLL3FMYVZnYnhaM1VpWlltejJNU2dQV2F5ZExrdTd6UW1Va2k5UEZU?=
 =?utf-8?B?aytTRTR2b1N2ZGJ6V0lHYWpLVmVPSDE2NGRHdTZ5VVU4dktQVmRtMFNRcGN0?=
 =?utf-8?B?M0sxRGhPM0lub25vR3RKUHJ2NkxYTzBjUnYySnNDWFpFT1N5YjdFUnNEVGlQ?=
 =?utf-8?B?N3paV1dmMzdHcTBrN1FsSHRHaXZYMDdzWWN2OWlJbXF6QUhwMkgvUHFQRVdZ?=
 =?utf-8?B?MHZhVURYYm43QzZvdUJvM2pNdUNaWEo4VkM4blk1eDVGbWxHc2NjcGdwVHFv?=
 =?utf-8?B?NitxUVREV2ROWjdZQjYraWdsdXJvNG1RR1RyQ2tUb254bE5QUHppbkxCYWsx?=
 =?utf-8?B?c1ByblVickJ4MWpGMC9vNFlSMFc1QkwzU2c2b3dZbklUTHduckRUZ0dlRG5m?=
 =?utf-8?B?REZDcFBrRCtJdlZySEpHUXRJeElCWlMvWDdJZG5zSXB4NDJ6TE5aZ3IvU2VN?=
 =?utf-8?B?TEtVUFZxR1ZOMUtmWGp0Uzk3c0o3OXFna3NPQVVxUlNCTjU2THd0QzVNYmV2?=
 =?utf-8?B?KzlJRmhMektCVXVTZG56bXBCZEtmSEhDUDJ5aWQ0RmprengvOFFmSkFqRnB3?=
 =?utf-8?B?ajAwTDdFYjhsaW9TZEpyWWxZVGhUY0dvVktnQWMzQnMrdzI0a3lGSGFSSDd4?=
 =?utf-8?B?VVpYaytZRnk2dGVoUXdlYUlaUG96NW5MUk0yd2hoWU5JMlFIREt6bWFkNE85?=
 =?utf-8?B?TjJyWmFVNnliczZWMGcySmtCd21qck1JdUtvbjlSRWJJRThvWkFPNUZKMVJh?=
 =?utf-8?B?MjFqQXJNRFNyMmloMVJyNUpQNmVrNXZTQ1VaOXhyMkc2bFk1TFgyN1JpNjB3?=
 =?utf-8?B?QlV0OXd4Vnc4d1Q3ZzkzSXpMZzhBM0N4UFA3WmJrTU1nRXJZR2twS3J1N1p5?=
 =?utf-8?B?SHp3cGd3TmR5cm8xYklzMXVmWXI0K0l1QWcrdHJDSEFSMGtMTVo4WjlTckxG?=
 =?utf-8?B?RHNLaHpsVU55dm9yMjNNdTZxTWNPbFpsNTdWN0ttamlPOEN2Q2MrdjZqU0VC?=
 =?utf-8?B?dzh4STN5aWFLU0FMU0J1b2ZCK2RXcHkrcVFIZ2tVN2psQUF0eE9tNG42SFRI?=
 =?utf-8?B?WnF0bm1IWEs2eFE0UU53ZnBWUXkzUGdaajNZQ1VNZ3JRMDliZnJhNlI0VG9R?=
 =?utf-8?B?ZjVxcjNvSzJOSFRFUmdSdnlhVFFCOVdxQ0tucTJyRCtXRXF4b2JGMk5oam40?=
 =?utf-8?B?Q3RvbGJqVjZoaVlMWVNUQWlOWHNyYW1RNnhEWmVrRWQxVVByS3lBajRnRjh1?=
 =?utf-8?B?TDhOU1psOGdocHF4K3BYTC84b3dOeCtzcGdjS0lnK0VWUTJjbTFyTjJZb2Zt?=
 =?utf-8?B?OU82MmpZRFVMZWRleVhRRGRJVWpHQjdIeDdZOWpML0p0TXhtMFBNbEk2QnFR?=
 =?utf-8?B?cy9XcWxqcTRhL1k3bk1uK3lZV3Q2VW9KNzF4SWNSY3FqODNVcEJuTTYrOEE5?=
 =?utf-8?B?SGFQS3c0UHJZNTVHZElPYU5WM0pOZU5CdlNRaC93R3M2Y2d5Z1VPYTFocnBm?=
 =?utf-8?B?UmdkdGlsOENMSGdCSUM0S04rNUdtWFdOS2dxL2JXNWtBOGpOVjQzbzNwOHd3?=
 =?utf-8?B?NU4zUlM1TTZpSWV2UUh1Q2VwVUdpQ0JWN0dBZ2dwazdZdXdUTnNNMU8zU2pH?=
 =?utf-8?B?bTIvR3BhekFUc2dZRWR5LytDanhoaWwzbEFiZUhJOFR1QmZVYkZqOFk3ZFpr?=
 =?utf-8?B?SjZXNDErVysyVmJqcmFXNnYzQnNhTVhSTlhnSVFvbDRCTTVOWFRXTDRhYkky?=
 =?utf-8?B?YnZNNVlYZHY3d2JXM0U0S25FeUlMckNYajk3RVBNSWdKL0g5WnFVQ0RZa3lC?=
 =?utf-8?B?NnIveDVVRHNKeVM5ZkdlUlM2cVYzQ2JIeDd5L2FXeW51SGVvejVzNFVNNGs3?=
 =?utf-8?B?SnZXMGdnZmVVSDBaYnN4dWkwRWhHRDlodTV6Z1oxK2ZlSVl6SkFEZkcwb0Z2?=
 =?utf-8?B?R1Rsc2lBK0M1MkRZMkNQU0RFL1FlT0h2SGY0S2JQeUk2YUFFdkJQaklaeFlO?=
 =?utf-8?B?TFRSWEpIbnZoQWdKV0JsckVZOG9HLzVxNDBJb2FqdFJ5TkRvSEtZai9nRFZa?=
 =?utf-8?B?MzZlRVFwZGdOYUtVeE9yYWEvS0VoQUdnUDlRSlA1UmRtLzJkNWg5eHhDSTd1?=
 =?utf-8?B?em9lZEM3dlhxL202OEFJdlEyUU5NdjVROThBcGtRQjJLbjRkVHVtaGtPWm5X?=
 =?utf-8?B?Z3VjZkZWanhOOEw4eVd5RWNkSWd2VVlzOTZHZllQaDZhd0UyRFBHZkh5Zkpa?=
 =?utf-8?B?cUZxV3ZIZmw4VVVxYnFJK3NQOXJ3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c998f9f6-d85c-4fbb-3cfc-08d9dee856af
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 03:19:32.0239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yWDcV8h/fewHFQoN2mb/PXhP18kR5GqVvwjAttfqhC8jREtDUU2Nt+aWY1ph3VdZ27De0aYzdO3IfM8DCCIJtVjJz+lPrR/3ZSvcSEavNRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-Proofpoint-GUID: ODK41H5wffbWUtLlTWhzUdbAhGNF7cIi
X-Proofpoint-ORIG-GUID: -aH6X1zJAMfRJECbFmcl_T-wg_dsWqSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_01,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=713 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 03:19:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160869

--------------4DECB17A6A717DBE339FA442
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20O38YMw025973


On 1/17/22 5:12 PM, Changqing Li wrote:
>
> On 1/13/22 11:26 PM, Richard Purdie wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> On Thu, 2022-01-13 at 11:44 +0800, Changqing Li wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> correct the package name
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-support/nghttp2/nghttp2_1.46.0.bb | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb=20
>>> b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
>>> index 972ff2d60a..a5f0be856f 100644
>>> --- a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
>>> +++ b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
>>> @@ -19,7 +19,7 @@ PACKAGECONFIG[manpages] =3D ""
>>> =C2=A0 # first place
>>> =C2=A0 EXTRA_OECMAKE =3D "-DENABLE_EXAMPLES=3DOFF -DENABLE_APP=3DOFF=20
>>> -DENABLE_HPACK_TOOLS=3DOFF"
>>>
>>> -PACKAGES =3D+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
>>> +PACKAGES =3D+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
>>>
>>> =C2=A0 RDEPENDS:${PN} =3D "${PN}-client (>=3D ${PV}) ${PN}-proxy (>=3D=
 ${PV})=20
>>> ${PN}-server (>=3D ${PV})"
>>> =C2=A0 RDEPENDS:${PN}:class-native =3D ""
>>> @@ -27,7 +27,7 @@ RDEPENDS:${PN}-proxy =3D "openssl python3-core=20
>>> python3-io python3-shell"
>>>
>>> =C2=A0 ALLOW_EMPTY:${PN} =3D "1"
>>> =C2=A0 FILES:${PN} =3D ""
>>> -FILES:lib${PN} =3D "${libdir}/*${SOLIBS}"
>>> +FILES:${MLPREFIX}lib${BPN} =3D "${libdir}/*${SOLIBS}"
>>> =C2=A0 FILES:${PN}-client =3D "${bindir}/h2load ${bindir}/nghttp"
>>> =C2=A0 FILES:${PN}-proxy =3D "${bindir}/nghttpx=20
>>> ${datadir}/${BPN}/fetch-ocsp-response"
>>> =C2=A0 FILES:${PN}-server =3D "${bindir}/nghttpd"
>> This doesn't look correct, particularly using with MLPREFIX in one=20
>> location and
>> not in the other...
>
> PACKAGES =3D+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
>
> the first package lib${PN}=C2=A0 is not correct. when enable multilib,
> for lib64, ${PN} is nghttp2,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lib${P=
N}=3Dlibnghttp2,
> for lib32, ${PN} is lib32-nghttp2, lib${PN}=3Dliblib32-nghttp2,
> but I think it should be lib32-libnghttp2. so change it to lib${BPN}.
>
> for PACKAGES, it will be extend by classextended.py
> #=C2=A0=C2=A0 prepend /yocto/poky/meta/recipes-support/nghttp2/nghttp2_=
1.46.0.bb:22
> #=C2=A0=C2=A0=C2=A0=C2=A0 "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-ser=
ver"
> #=C2=A0=C2=A0 rename (to) classextend.py:127 [rename_packages]
> #=C2=A0=C2=A0=C2=A0=C2=A0 "PACKAGES_NONML"
> #=C2=A0=C2=A0 set classextend.py:128 [rename_packages]
> #=C2=A0=C2=A0=C2=A0=C2=A0 "${@oe.classextend.get_packages(d)}"
> # pre-expansion value:
> #=C2=A0=C2=A0 "${@oe.classextend.get_packages(d)}"
> PACKAGES=3D"lib32-libnghttp2 lib32-nghttp2-client lib32-nghttp2-proxy=20
> lib32-nghttp2-server lib32-nghttp2-src lib32-nghttp2-dbg=20
> lib32-nghttp2-staticdev lib32-nghttp2-dev lib32-nghttp2-doc=20
> lib32-nghttp2-locale lib32-nghttp2"
>
> for FILES, other packages start with ${PN} aleady extened with=20
> lib32-,=C2=A0 so don't need MLPREFIX. but lib${BPN} need to add it manu=
ally.

ping

>
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160638): https://lists.openembedded.org/g/openembed=
ded-core/message/160638
> Mute This Topic: https://lists.openembedded.org/mt/88390547/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------4DECB17A6A717DBE339FA442
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/17/22 5:12 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16CB03E199171BFE.7166@lists.openembedded.org">
      <br>
      On 1/13/22 11:26 PM, Richard Purdie wrote:
      <br>
      <blockquote type="cite">[Please note: This e-mail is from an
        EXTERNAL e-mail address]
        <br>
        <br>
        On Thu, 2022-01-13 at 11:44 +0800, Changqing Li wrote:
        <br>
        <blockquote type="cite">From: Changqing Li
          <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
          <br>
          <br>
          correct the package name
          <br>
          <br>
          Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; meta/recipes-support/nghttp2/nghttp2_1.46.0.bb | 4 ++--
          <br>
          &nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)
          <br>
          <br>
          diff --git a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
          b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
          <br>
          index 972ff2d60a..a5f0be856f 100644
          <br>
          --- a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
          <br>
          +++ b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
          <br>
          @@ -19,7 +19,7 @@ PACKAGECONFIG[manpages] = &quot;&quot;
          <br>
          &nbsp; # first place
          <br>
          &nbsp; EXTRA_OECMAKE = &quot;-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF
          -DENABLE_HPACK_TOOLS=OFF&quot;
          <br>
          <br>
          -PACKAGES =+ &quot;lib${PN} ${PN}-client ${PN}-proxy ${PN}-server&quot;
          <br>
          +PACKAGES =+ &quot;lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server&quot;
          <br>
          <br>
          &nbsp; RDEPENDS:${PN} = &quot;${PN}-client (&gt;= ${PV}) ${PN}-proxy
          (&gt;= ${PV}) ${PN}-server (&gt;= ${PV})&quot;
          <br>
          &nbsp; RDEPENDS:${PN}:class-native = &quot;&quot;
          <br>
          @@ -27,7 +27,7 @@ RDEPENDS:${PN}-proxy = &quot;openssl python3-core
          python3-io python3-shell&quot;
          <br>
          <br>
          &nbsp; ALLOW_EMPTY:${PN} = &quot;1&quot;
          <br>
          &nbsp; FILES:${PN} = &quot;&quot;
          <br>
          -FILES:lib${PN} = &quot;${libdir}/*${SOLIBS}&quot;
          <br>
          +FILES:${MLPREFIX}lib${BPN} = &quot;${libdir}/*${SOLIBS}&quot;
          <br>
          &nbsp; FILES:${PN}-client = &quot;${bindir}/h2load ${bindir}/nghttp&quot;
          <br>
          &nbsp; FILES:${PN}-proxy = &quot;${bindir}/nghttpx
          ${datadir}/${BPN}/fetch-ocsp-response&quot;
          <br>
          &nbsp; FILES:${PN}-server = &quot;${bindir}/nghttpd&quot;
          <br>
        </blockquote>
        This doesn't look correct, particularly using with MLPREFIX in
        one location and
        <br>
        not in the other...
        <br>
      </blockquote>
      <br>
      PACKAGES =+ &quot;lib${PN} ${PN}-client ${PN}-proxy ${PN}-server&quot;
      <br>
      <br>
      the first package lib${PN}&nbsp; is not correct. when enable multilib,
      <br>
      for lib64, ${PN} is nghttp2,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lib${PN}=libnghttp2,
      <br>
      for lib32, ${PN} is lib32-nghttp2, lib${PN}=liblib32-nghttp2,
      <br>
      but I think it should be lib32-libnghttp2. so change it to
      lib${BPN}.
      <br>
      <br>
      for PACKAGES, it will be extend by classextended.py
      <br>
      #&nbsp;&nbsp; prepend
      /yocto/poky/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb:22
      <br>
      #&nbsp;&nbsp;&nbsp;&nbsp; &quot;lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server&quot;
      <br>
      #&nbsp;&nbsp; rename (to) classextend.py:127 [rename_packages]
      <br>
      #&nbsp;&nbsp;&nbsp;&nbsp; &quot;PACKAGES_NONML&quot;
      <br>
      #&nbsp;&nbsp; set classextend.py:128 [rename_packages]
      <br>
      #&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.classextend.get_packages(d)}">&quot;${@oe.classextend.get_packages(d)}&quot;</a>
      <br>
      # pre-expansion value:
      <br>
      #&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.classextend.get_packages(d)}">&quot;${@oe.classextend.get_packages(d)}&quot;</a>
      <br>
      PACKAGES=&quot;lib32-libnghttp2 lib32-nghttp2-client
      lib32-nghttp2-proxy lib32-nghttp2-server lib32-nghttp2-src
      lib32-nghttp2-dbg lib32-nghttp2-staticdev lib32-nghttp2-dev
      lib32-nghttp2-doc lib32-nghttp2-locale lib32-nghttp2&quot;
      <br>
      <br>
      for FILES, other packages start with ${PN} aleady extened with
      lib32-,&nbsp; so don't need MLPREFIX. but lib${BPN} need to add it
      manually.
      <br>
    </blockquote>
    <p>ping <br>
    </p>
    <blockquote type="cite" cite="mid:16CB03E199171BFE.7166@lists.openembedded.org">
      <br>
      <blockquote type="cite">
        <br>
        Cheers,
        <br>
        <br>
        Richard
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160638): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160638">https://lists.openembedded.org/g/openembedded-core/message/160638</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88390547/3616873">https://lists.openembedded.org/mt/88390547/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------4DECB17A6A717DBE339FA442--

