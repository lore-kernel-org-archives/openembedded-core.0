Return-Path: <dragos.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E62FC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 15:08:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4204.1660921684792506108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Xc0D99UU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52304e8b70=dragos.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JDSJKQ014788
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 15:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=EFYjW8SlNfUatNfVG9K+aGwGNYEx70KhSz6Cng+Xj50=;
 b=Xc0D99UUc2a7pNXz2oLM84DN1dOpSz/Sm9fEp0luiJsN3ojKzDKYtduyLOeP49vZP/aO
 9szVHY/6W9kTqKIgZHKAoeWKgK4jNkI9xEfJ54PW8m45Osmzh0PJBBdt+EzpdFMY2S36
 946VAx6TUEBUgIOqLGB/15LyO3yWb8DGZBK4ay8uCjxX2IAr3jpSEOKS7OQlu7BVMGk/
 5ywqH/NHi4k/qeux9WWg/Xu3z3puRawyLeuDpxUCdZatSVdQ1j90y9a5tU+IPHrvPxBk
 BPoXgEhxYWizm3rLamRk67WInSGP3llu+SQFX1zdJ9nOWifHsH2nO6WrTSAOrvzCPbj7 0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160wfns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 15:08:03 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27JF82X6032246
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 15:08:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160wfnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 15:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdVqXdtaD/6AZpXJftAf9y9Nn8Jml05svh8bsnmueDI7litBCCMUQNuwHGoV1FQenFQazmrlbyZGojDX99ZeRE3VA3z9bzBL3eGqV6jijQ6w6XqOpZjJd2VB7Nq9k60H5fcQvrF/j8T2JDxQ5sZaf1vAJqDhE3Bn1pebrSyYc12o7ZuZuYF4mQ8jEuLyeM3Ht8mF9XEWWVSE83rBgO15okg9DvGaCZzXyNvrxR1qlfGAD30AGBSTDg9SE9hfDhFqf9Q+clJ9JlMMgyghBQbwGCny6ahryPnz9dRLl9SYDIAZ5sjBnD47QsX5jhyOQ3q++4+NfyKwMfaTmw1Ix7ebDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFYjW8SlNfUatNfVG9K+aGwGNYEx70KhSz6Cng+Xj50=;
 b=AevDo5m+uIkh9bCHUTa3pRZb7XbP8Z9ccZgP5PM2dBkdsJNB8OYtIoIziWRO3tfwpYAGCAkFGCzDj+1Eu0LOUkbS7BmIifj3wL4vd4AA4YdYtsUBnzPwe/3yOGbsGY76cGcPbSPlUy7UJ2c6JUSjr/su461MDMLwYi+quHlKi05y73KiXjq5CMqBT1MHXqHjHOXYFvJk1pSNuXQCpxQU8zKjMN6ObejoHYmSQKTqGzUdk09pLHBIf3f7raBNy22lGxhT/fVKADE0sD3WPXaz0Hzx9KGzZVcAi0xqyMdMplKMBeaYhV/S3wKHWKgfNyk484FGbKU45e1ZU+o3deLDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 19 Aug
 2022 15:07:59 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::18c8:8786:808e:6e9a]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::18c8:8786:808e:6e9a%8]) with mapi id 15.20.5525.023; Fri, 19 Aug 2022
 15:07:59 +0000
Content-Type: multipart/alternative;
 boundary="------------Rezg19jgHoZS5tpMYpi3ocPa"
Message-ID: <b33d2d3d-0650-dea5-4f8c-9eebfb425d80@windriver.com>
Date: Fri, 19 Aug 2022 18:07:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
Content-Language: en-US
To: drew@moseleynet.net, Claudius Heine <ch@denx.de>,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
 <c018dc5e-f1d6-12cf-3e86-56978e63522f@windriver.com>
 <df0d6b90-d714-0f64-554a-25a9ce3ec427@gmail.com>
From: Dragos-Marian Panait <dragos.panait@windriver.com>
In-Reply-To: <df0d6b90-d714-0f64-554a-25a9ce3ec427@gmail.com>
X-ClientProxiedBy: VI1PR07CA0263.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::30) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10b92318-c9d3-49ad-d737-08da81f49a93
X-MS-TrafficTypeDiagnostic: BL1PR11MB6052:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bGSneAj1wExgBigx2GElUWQk1m+kNwtVR/f4T11lss9VKzZKhrVMmsDWeJfnIBad9e/5vpSKGTkhMwaansD/ES53CRsK9oEtlLr9TtiSUGmYQFMzb2ExQ1zRf0Bxvdiu6/IU29IzIzNAV5DK0pphhqxvaUmVikGyFxbPMu9hFiZlJZwUdoCNZvWulChz2m45RqkcX/YfhkRgG5R0rJQTq0CXr7x5DxUa4HjvsY+BQuuT4kz6CpwJoLjhSY9+3qViZDWtk+ENVS1FElCNPp/doRxrc/baY/DOJt04VRTqMcXeXgg71zctSoz2HfFYGcCm5DDex6BlHOhi8+OteNFO70CrnAwuIi4vsKBgh5qKMEks39tEWrHco4TtFDIzObO56JxGqjrqnhwY0ZaI1T6cBgpQCOPue4JHmKYq9i3bbzcfgSoj095eCofS98+LPY6lzKOab/ryHvXWul9h/l01+W5AJ6vBrEcK4fCuD5warMa66XykytrWp5d0XwkVOKzIz04oh4TiJCsypW5U6OEKee6gEgnnMS7kIwGpfooWU+Azq+jxNJL4H6NLX+MyoI66Dj7SSEo8sNLfvtoybVygZJRFqH2DXVebSZGbrr76SIXHNTFonTMWq0KoJsmnKjuV0g+ZGZV6vIwJkX8Sq8cDsIKl6N8Mup6UIymy5VGb04/kdm+4x/p0Mz3rb1MHxdkdbzCiuYB0pbpiU8M4xPkzpe0WI5KZ2fk/MO0DvDBq/wDlUGrqk8JW00r4Wfgah7iHgHg2p9MXk6GPCpXGRk2a/V/9/e1k1/g2jgOZ3UWO+KpTEH5wlRJJcMy3BKRolPVHJvNz5Q7Kgrd/FIz1uvx6kw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(186003)(2616005)(31686004)(36756003)(5660300002)(2906002)(8936002)(86362001)(66476007)(8676002)(4326008)(66946007)(38100700002)(33964004)(66556008)(6486002)(166002)(53546011)(52116002)(31696002)(6512007)(26005)(316002)(38350700002)(6666004)(83380400001)(6506007)(41300700001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b25FMFlJd3RZK1VwWmxaVnNNZ1pPTU5aQmd4bUZWZ0IydWZ0cHVGUlNaWlF6?=
 =?utf-8?B?Y3hDR1ZlelZLZnNUelgvVUpiVFRFbURSeWlHaGphZkFQZDk3Y1lwWlNXOTQr?=
 =?utf-8?B?aWVobVZCcndDKzJCNEdzS003aVpuaGZJM2Y1eHZmMG00RDJSOTQ2bGlJR1V2?=
 =?utf-8?B?V1JzUzg5ZEdVWFVwaDc2dWg4cGMvRUo5L21HaVZLWkhGQ1lhMHp0WjdCdDFQ?=
 =?utf-8?B?WU5xK0w4eVg5S3d6SjFQVXJMdjVLYkxjSDB5ZjU2NUowTU5jdWsrbTM3dUpG?=
 =?utf-8?B?TVVFcUFIL1oxSkxmL0ordzgxeEdRdTRmRjYyWGtHQ3g5NmwyKysvZnZLR1ps?=
 =?utf-8?B?aFYxSm84R0ZMdWVrd0FKMXdFaVhRRm9CWnVKcTRFL0Y1dzg2QmI3MjVCcVdl?=
 =?utf-8?B?SkNkL2g1TDBTVjcwS2pyV1JhdUwwUTdRY3JVMHQ1RDZyOFgxSzB2bURwaWc4?=
 =?utf-8?B?VWhlWTVkb25OWXI0SWFhejlwbTdtbkgzZytTanZQUWlKQXJ0czVXZGFaZC9Q?=
 =?utf-8?B?TWYyaHpFdkVzRGpxbmNRN2RTQVlER21YQXVIZm5IdllZVGwxSXluLzVVOGVz?=
 =?utf-8?B?Rllhdk5nazFFRmhXYWlzZGYwL0VKM3dGQmRmZ1JyZzZSK2VDV0ZJdEFXeUhR?=
 =?utf-8?B?UVhDVEV0QnhLY1h4QjUvMWw2QTBEeUM3R3psWjFnUHJTRkZwd1VKVGNCVlhq?=
 =?utf-8?B?MkZtVDlQL1NzZkI5NkE0d1lBWWFXczExN1FTRjlDanM3Y1BBUUhzcWVYamxi?=
 =?utf-8?B?ODNpanB1NzB0ajlDQXZ2WXpSeWhDZ291L0ErQjJwSkdTbnN4VmFhbGczSXpN?=
 =?utf-8?B?cDRJMlRnZHpidGRxUEd0RldUdFdnWDYxSXBjZFp5aUc5S2hzeGxBQWU4MUlP?=
 =?utf-8?B?VlVsYjNjTHFmRFMwekxmcmtmbGkzM1kwVkEyWmtpQ1F0RWxkeXNzcHlUOFI0?=
 =?utf-8?B?TU9ZUG1QMUNsSFVtSUFHLzlvejZmdGVoQm1vRTFUQzQ4Uk0raFljUnRRR1lY?=
 =?utf-8?B?WThWUWVuTWIwcUVIR2tlT0hzNzRXY2JES2tZL1JKTUJUYVpocU5JUWVKLzhI?=
 =?utf-8?B?RkI3SU9jWkRBZzZmTStOcjRoMGl3WkxSYkVZYUE5NTJ6Z1NXZUJvd0YrTXMr?=
 =?utf-8?B?TlB1SCtnbm4rbjRxL1A4c0NBMWJmYUNjeVYybFRyYVFyMVRUWURPSTFDZnJW?=
 =?utf-8?B?TlczTDIzYkozZklyTUtUMkFGRlpMeXVlcGhqT1BwQzA1Tjd1S0dqRmFlM0tR?=
 =?utf-8?B?MnljNUtsK0JROXRteGtLWmI4MVJiVUxIL2NwMUxVWGdqUUtkUmdXTUJFMWVs?=
 =?utf-8?B?WnhzNTdLVWc1b0M4RTBVbG5JSU9TSEJ4U2VXekU5T2FlSXVIL3Brc2pRM2NG?=
 =?utf-8?B?Z242Z0NTQnU2cGw4NDVlWGxuNVp5WnhNbmxZVDFJZXRweGh5S2VMRUlWVnBH?=
 =?utf-8?B?bFBxSkIxeTh5L0JzMHo0YmZMMHJhcnRDNzVQZ1Bjb3BoclV0NVg1dFp4OVVD?=
 =?utf-8?B?VTRIdk5Hc3hidm13Q3Zjc01BZjdaM2dFaGxVQklwOFV3SXlWRlpvRkhEQ1Iy?=
 =?utf-8?B?VGZRdzNoSzRCOTVJcDN5bzJIdzdUd2E4aWt0dWRIRk5DNU0wRWcrcW5sRzFW?=
 =?utf-8?B?L05WYW9hNG1GN0ZlQzA4NHBKRDQ1bGFRL2hwRGpUVEgrcmdPSGVKU0VQZFhP?=
 =?utf-8?B?cjFDdWlTL0dFRnVwSmFGNG01azZkdWEwRXp3bk10VjZ5Q21ZUnJWZmRDSk55?=
 =?utf-8?B?VTBoRERxSk95azZGMm5IaVFDVzBxbjZuN2hoZ1JlVStQZWlWUm05WUVCdzg4?=
 =?utf-8?B?aWNYTFVXd3FYekVRQXhwYkxpQ3RNSStRb0haNnE5dHZLcGYrM0w0TFg0UTZo?=
 =?utf-8?B?c2lnUUllSS82T29NWFNTTWRDUEN0cXIxVTVIQzJGSHJ2SG1ocTliM2tEL29V?=
 =?utf-8?B?R0wreTRpT1Rrd0gvYnBab2VjaklsaHdzd3R3MWZxOVVFRDRTMDluelE5eWtW?=
 =?utf-8?B?aGFMY01rbGNjbUVyR2lCVE9YVFlOc29raHRXMU5KamE3ZXRrcnpGempZcW92?=
 =?utf-8?B?MWNhMmV0TzZlc0VsM3cwWUFyWW1LOHIrT1BVSGp0ZDhpVTJMekxWazVLSmJl?=
 =?utf-8?B?WDA4SEtoZ2VLRlhhcHprZk9DR0lWY3VLQzhPTHkyU2pKaC9seUMzVGdlNTVY?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10b92318-c9d3-49ad-d737-08da81f49a93
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 15:07:59.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /s5gpnKAiV+xNm1kbD95RnjcIpurYYQTQ9Cid9fARnn1SoZ7UX+HlUNm7eN23t46YcHa2DopGAt+9O+FJ5yJ2SpLGRJPPstvGRkG1xndhqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
X-Proofpoint-ORIG-GUID: 4Ic-xaMoQ0c4qW4RIMw5mMdn_7npgiQR
X-Proofpoint-GUID: IQJQFmfmo15-pf3Z5gWf-yrW4EOorDiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 15:08:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169633

--------------Rezg19jgHoZS5tpMYpi3ocPa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27JDSJKQ014788


On 19.08.2022 17:34, Drew Moseley wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On 8/19/22 8:50 AM, Dragos-Marian Panait wrote:
>>
>> Hi Claudius,
>>
>> On 19.08.2022 12:36, Claudius Heine wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> Hi Dew.
>>>
>>> On 2022-08-15 20:25, drew.moseley@gmail.com wrote:
>>>> From: Drew Moseley <drew@moseleynet.net>
>>>>
>>>> The previous change to remove the dependency on systemd-udev-settle
>>>> caused boot delays at least on qemu. It seems that change required
>>>> a hwrng device but that's not necessarily available on all platforms.
>>>>
>>>> This changes the "Requires" to a "WantedBy" as modeled after the
>>>> version of this file on Ubuntu 20.04.
>>>>
>>>> Signed-off-by: Drew Moseley <drew@moseleynet.net>
>>>> ---
>>>> meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
>>>> =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git=20
>>>> a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service=20
>>>> b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>>>> index 0f50890dcb..b013d95932 100644
>>>> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>>>> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>>>> @@ -3,8 +3,6 @@ Description=3DHardware RNG Entropy Gatherer Daemon
>>>> =C2=A0 DefaultDependencies=3Dno
>>>> =C2=A0 After=3Dsystemd-udev-settle.service
>>>> =C2=A0 Before=3Dsysinit.target=20
>>>> <https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!b=
MQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnB=
eDKIdmEXOhOUu8G5A$>=20
>>>> shutdown.target=20
>>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!=
bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLn=
BeDKIdmEXOhfig0Hzw$>=20
>>>>
>>>> -Requires=3Ddev-hwrng.device
>>>> -After=3Ddev-hwrng.device
>>>> =C2=A0 Conflicts=3Dshutdown.target=20
>>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!=
bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLn=
BeDKIdmEXOhfig0Hzw$>=20
>>>>
>>>>
>>>> =C2=A0 [Service]
>>>> @@ -32,3 +30,4 @@ SystemCallFilter=3D@system-service
>>>>
>>>> =C2=A0 [Install]
>>>> =C2=A0 WantedBy=3Dsysinit.target=20
>>>> <https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!b=
MQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnB=
eDKIdmEXOhOUu8G5A$>=20
>>>>
>>>> +WantedBy=3Ddev-hwrng.device
>>>
>>> This looses the order. Have you tried just replacing `Requires` with
>>> `Wants`. So something like this:
>>>
>>>
>>> ```
>>>
>>> Before=3Dsysinit.target=20
>>> <https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bM=
Q5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBe=
DKIdmEXOhOUu8G5A$>=20
>>> shutdown.target=20
>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!b=
MQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnB=
eDKIdmEXOhfig0Hzw$>=20
>>>
>>> Wants=3Ddev-hwrng.device
>>> After=3Ddev-hwrng.device
>>> Conflicts=3Dshutdown.target=20
>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!b=
MQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnB=
eDKIdmEXOhfig0Hzw$>=20
>>>
>>>
>>> ```
>>>
>>> If that still would cause the long waiting time on qemu?
>>>
>>> I haven't investigated the qemu issue, but maybe qemu just doesn't
>>> provide a hardware random source? If it doesn't provide a hardware
>>> random source, then installing rng-tools on there might also not=20
>>> make sense.
>>> Alternatively maybe just adding a start timeout might solve it?
>>> regards,
>>> Claudius
>>
>>
>> I've tested the patch on a NUC7, results are the same as with qemu:
>> - increased boot time
>> - timeout for rng-tools.service
>> [ TIME ] Timed out waiting for device /dev/hwrng.
>> [DEPEND] Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer Dae=
mon.
>>
>> Regards,
>> Dragos
>>
>
> Interesting. I guess this patch should definitely be ignored and the=20
> patch from Khem that removes both the dev-hwrng and=20
> systemd-udev-settle depencies is the right approach. That means that=20
> the original problem that adding systemd-udev-settle was meant to=20
> solve, is no longer solved but it seems that the proposed solutions=20
> here have adverse effects elsewhere.
>
> Simply removing the systemd-udev-settle dependency fixes the issue=20
> that my customer has that caused me to start investigating here.
>
> Drew
>
> --=20
> mailto:drew@moseleynet.net
Sorry for the confusion, I did not test any additional patches/changes=20
that have been suggested in this email thread.
My test was performed on current Yocto master sources. No additional=20
patches.
I just wanted to inform that the boot delay is also observed on real hw,=20
not just qemu.
Again, sorry for the confusion.

Dragos
--------------Rezg19jgHoZS5tpMYpi3ocPa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27JDSJKQ014788

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 19.08.2022 17:34, Drew Moseley
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:df0d6b90-d714-0f64-554a-25a9ce3=
ec427@gmail.com">
     =20
      <div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FF=
EB9C"><b><span style=3D"font-size:10.0pt;color:#9C6500"></span></b><span =
style=3D"font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <p><br>
        </p>
        <div class=3D"moz-cite-prefix">On 8/19/22 8:50 AM, Dragos-Marian
          Panait wrote:<br>
        </div>
        <blockquote type=3D"cite" cite=3D"mid:c018dc5e-f1d6-12cf-3e86-569=
78e63522f@windriver.com">
          <p>Hi Claudius,</p>
          <div class=3D"moz-cite-prefix">On 19.08.2022 12:36, Claudius
            Heine wrote:<br>
          </div>
          <blockquote type=3D"cite" cite=3D"mid:6d48f3e4-28c9-848d-9b14-c=
b5f1950c4ca@denx.de">[Please
            note: This e-mail is from an EXTERNAL e-mail address]
            <br>
            <br>
            Hi Dew. <br>
            <br>
            On 2022-08-15 20:25, <a class=3D"moz-txt-link-abbreviated
              moz-txt-link-freetext" href=3D"mailto:drew.moseley@gmail.co=
m" moz-do-not-send=3D"true">
              drew.moseley@gmail.com</a> wrote: <br>
            <blockquote type=3D"cite">From: Drew Moseley <a class=3D"moz-=
txt-link-rfc2396E" href=3D"mailto:drew@moseleynet.net" moz-do-not-send=3D=
"true">
                &lt;drew@moseleynet.net&gt;</a> <br>
              <br>
              The previous change to remove the dependency on
              systemd-udev-settle <br>
              caused boot delays at least on qemu. It seems that change
              required <br>
              a hwrng device but that's not necessarily available on all
              platforms. <br>
              <br>
              This changes the &quot;Requires&quot; to a &quot;WantedBy&q=
uot; as modeled
              after the <br>
              version of this file on Ubuntu 20.04. <br>
              <br>
              Signed-off-by: Drew Moseley <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:drew@moseleynet.net" moz-do-not-send=3D"true">
                &lt;drew@moseleynet.net&gt;</a> <br>
              --- <br>
              &nbsp;
              meta/recipes-support/rng-tools/rng-tools/rng-tools.service
              | 3 +-- <br>
              &nbsp; 1 file changed, 1 insertion(+), 2 deletions(-) <br>
              <br>
              diff --git
              a/meta/recipes-support/rng-tools/rng-tools/rng-tools.servic=
e
b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
              <br>
              index 0f50890dcb..b013d95932 100644 <br>
              ---
              a/meta/recipes-support/rng-tools/rng-tools/rng-tools.servic=
e
              <br>
              +++
              b/meta/recipes-support/rng-tools/rng-tools/rng-tools.servic=
e
              <br>
              @@ -3,8 +3,6 @@ Description=3DHardware RNG Entropy Gatherer
              Daemon <br>
              &nbsp; DefaultDependencies=3Dno <br>
              &nbsp; After=3Dsystemd-udev-settle.service <br>
              &nbsp; Before=3D<a href=3D"https://urldefense.com/v3/__http=
://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcA=
KrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$" moz-do-not-send=3D=
"true">sysinit.target</a>
              <a href=3D"https://urldefense.com/v3/__http://shutdown.targ=
et__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIF=
ZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$" moz-do-not-send=3D"true">
                shutdown.target</a> <br>
              -Requires=3Ddev-hwrng.device <br>
              -After=3Ddev-hwrng.device <br>
              &nbsp; Conflicts=3D<a href=3D"https://urldefense.com/v3/__h=
ttp://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3=
CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$" moz-do-not-sen=
d=3D"true">shutdown.target</a>
              <br>
              <br>
              &nbsp; [Service] <br>
              @@ -32,3 +30,4 @@ SystemCallFilter=3D@system-service <br>
              <br>
              &nbsp; [Install] <br>
              &nbsp; WantedBy=3D<a href=3D"https://urldefense.com/v3/__ht=
tp://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CU=
cAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$" moz-do-not-send=3D=
"true">sysinit.target</a>
              <br>
              +WantedBy=3Ddev-hwrng.device <br>
            </blockquote>
            <br>
            This looses the order. Have you tried just replacing
            `Requires` with <br>
            `Wants`. So something like this: <br>
            <br>
            <br>
            ``` <br>
            <br>
            Before=3D<a href=3D"https://urldefense.com/v3/__http://sysini=
t.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2=
HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$" moz-do-not-send=3D"true">sy=
sinit.target</a>
            <a href=3D"https://urldefense.com/v3/__http://shutdown.target=
__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZG=
kwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$" moz-do-not-send=3D"true">
              shutdown.target</a> <br>
            Wants=3Ddev-hwrng.device <br>
            After=3Ddev-hwrng.device <br>
            Conflicts=3D<a href=3D"https://urldefense.com/v3/__http://shu=
tdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyE=
DpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$" moz-do-not-send=3D"true=
">shutdown.target</a>
            <br>
            <br>
            ``` <br>
            <br>
            If that still would cause the long waiting time on qemu? <br>
            <br>
            I haven't investigated the qemu issue, but maybe qemu just
            doesn't <br>
            provide a hardware random source? If it doesn't provide a
            hardware <br>
            random source, then installing rng-tools on there might also
            not make sense. <br>
            Alternatively maybe just adding a start timeout might solve
            it? <br>
            regards, <br>
            Claudius <br>
          </blockquote>
          <p><br>
          </p>
          I've tested the patch on a NUC7, results are the same as with
          qemu:<br>
          - increased boot time<br>
          - timeout for rng-tools.service<br>
          <font size=3D"2" face=3D"Helvetica, Arial, sans-serif">[ TIME ]
            Timed out waiting for device /dev/hwrng.
          </font><br>
          <font size=3D"2" face=3D"Helvetica, Arial, sans-serif">[DEPEND]
            Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer Dae=
mon.
          </font><br>
          <p>Regards,<br>
            Dragos<br>
          </p>
        </blockquote>
        <p><br>
        </p>
        <p>Interesting. I guess this patch should definitely be ignored
          and the patch from Khem that removes both the dev-hwrng and
          systemd-udev-settle depencies is the right approach. That
          means that the original problem that adding
          systemd-udev-settle was meant to solve, is no longer solved
          but it seems that the proposed solutions here have adverse
          effects elsewhere.</p>
        <p>Simply removing the systemd-udev-settle dependency fixes the
          issue that my customer has that caused me to start
          investigating here.</p>
        <p>Drew<br>
        </p>
        <pre class=3D"moz-signature" cols=3D"72">--=20
<a class=3D"moz-txt-link-freetext" href=3D"mailto:drew@moseleynet.net" mo=
z-do-not-send=3D"true">mailto:drew@moseleynet.net</a>
</pre>
      </div>
    </blockquote>
    Sorry for the confusion, I did not test any additional
    patches/changes that have been suggested in this email thread.<br>
    My test was performed on current Yocto master sources. No additional
    patches.<br>
    I just wanted to inform that the boot delay is also observed on real
    hw, not just qemu.<br>
    Again, sorry for the confusion.<br>
    <br>
    Dragos<br>
  </body>
</html>

--------------Rezg19jgHoZS5tpMYpi3ocPa--

