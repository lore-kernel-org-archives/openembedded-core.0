Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F213C6FA8F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:54:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5895.1692932057901635552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=XQlR0zyP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=760133c827=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37P2eXUE020819
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:54:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=RtoHgXXpEWNszGTjUxQcZg8ZgcgYElUUOeFsjhD5MOw=; b=
	XQlR0zyPTkxcS//j6ZP8Hhk0TwuLkeLdEfbt6GzknmsXQ23n8/4qx+YLJF5pfqfI
	NTQuHimYePl07d1CaIuEOjX9oH5HjJTuIcz6uRIILssrAfn6c+bPMLOgwHu4Yzhx
	d/WVwwbD/jFd1R5upR/UMhqN0O862divR8OXAzatd7EEQr8bmh5CZ9RHXX8ct45Q
	4YOO0vpqwt3Y8d+AXyoG1rtYhIln5pHRbkhY4FwysIqR+H/qEM+NuI0EIzsaXERz
	cprPBY+ogJbb0fHubygvTaJy3zx1SCgYcF3AO/SGbzZdOXxggPr6wEyB3OznX5BE
	tS6wplE8PS3LKZeLpC8b+g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e2q71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:54:17 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37P2sH0I015004;
	Thu, 24 Aug 2023 19:54:17 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e2q6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 19:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzVdKyYrzuApZ0KFa3LuBjkwNWHvA5THhz9tWPVZXS1+4xH6eEEsHwGy2PtrfUKx0aa78tBeT9NA1jIQMKMAJurOZHFsg/qemRkiBSTPaWftg1oETpYknf2AVapBdE0O27S0Sv0yWOEmW4X+u+afH6mL8Oh+3NQjOzHoBA/dWgvuy6KCfhu5Wmuhnu2MozO+nE4sH7wsn4hQZBrP4HxkEn1iPN6MGnneJbesjMZsB3CfqPmiSPK4BGryBFqtvbeT20Fydi+VTeZ6ocPuNT8KPcPlwe2D5QZv7kRz3zE2XVcosTd5aRflqBo/p5ZU2FPyGCbVYBotCC6fZT6wQbgpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtoHgXXpEWNszGTjUxQcZg8ZgcgYElUUOeFsjhD5MOw=;
 b=ZmvJfSZMhikKR3Yf4Jw5xtZWBbnvVxjXNdEnQn5e/yL03S+M/2EUS5/iQBv0cRRShGcccladSB7/G0nqspdbwj9tLAh0XzMfNwZUfGuUbm0r9pql9eJw7rwfOhbfCPanYxZCLVq+iCrpEEKBgoAEJWlMKZ9oKUsyFch3QMs0mRirayC7sTchSbUK1eDGoaxOZl5dmFj/0+Ttbp0C+Szj3pJeRue6QFoavb+SJ9r+70G++r25yLtVUgDbG65uxBU1VY8J/3niFanYXpzdwixeqWmGv3ZpfAAXJwedbcTrhE0jetJGJhoUuYjlwtWFmmFA7aTun+LL8XG9E9t17+y9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.29; Fri, 25 Aug 2023 02:54:12 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 02:54:12 +0000
Message-ID: <e6094c91-bb8d-3ebc-551a-17d0cc804748@windriver.com>
Date: Fri, 25 Aug 2023 10:53:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] init-manager-systemd.inc: update
 KERNEL_FEATURES
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230824090714.2911613-1-kai.kang@windriver.com>
 <308ab36b-5095-4584-a3ba-89e583b4a4f6@gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <308ab36b-5095-4584-a3ba-89e583b4a4f6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYXPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:403:a::17) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 42404e8c-5a27-4485-5592-08dba5168f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UZSH/a3REUGHAz/dfskscAJgajPv8dQfITsIgccUDMOZxk7JwwTl4OeCLjs3FwZPbT4TqFMeLH8+/fwIRu6Y1w6+q/Z70X8ybT6xYjKwOEHnMVmREfML2uWV1ellB66pvKnJ1hRpSI2o1H8zeFI/nEIi/UV4sm6kMx2vVLX5bAxBLfySNLuPQS9f95o5RrxSSohJA5PyNufIUiSkerhHwiprp8qJqc12T6wAO8f+hEiMdLpbi2J/rMmDa+8MX7h5h+JmoWbheavDSHWpLAxlcGbno9uI2naDKEINugkFOqyS5UF+lvJW0eC4lhbSThvSb4dUU4kQopmHW8dHsSxCl+sRkR8+UtU+13iGItXNypQeG/sAYkx+ZFI1+w0NByeGpZz5jgVKOssVpdti1BRb8SZC2OjVpihbPdwivotK07oRt5/7lhJQDx+LcpRH/81WnHp9eRdDkHTOC++uV4JGogXgmDFCfxKFMpfjoXeHX/yPt2G1W/ehlwOcWpHe+tOx3ppDlSv7rjftTZ/hSAPkTZO9ZJwt0Bec2sfyPYR2Iiuymc41FQF1ZRILnW3wSYy7XB5HDlBFdr08Tr6XpqkhtgcKxmOjkVx8sEFhfR2bM21i+73KHs47fewqESe85Ykt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39850400004)(366004)(396003)(136003)(451199024)(1800799009)(186009)(38100700002)(66899024)(8676002)(8936002)(31696002)(41300700001)(53546011)(6486002)(6506007)(316002)(6666004)(36756003)(66476007)(66556008)(110136005)(66946007)(86362001)(6512007)(26005)(478600001)(83380400001)(15650500001)(31686004)(966005)(2906002)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wmxla2N6TVZhazlkc0pZYzhjclBDM2RsdE83SlVKTmNpVWJmSk5nbFZtN3pW?=
 =?utf-8?B?bUo2QlVsTi9ySVcyNHM0RDhsRHMwdjlFdTdyWHVXbXhwKzlJUEkxUWVjdjVR?=
 =?utf-8?B?Y2ZTRmdZNkpKU0ovQmNyMTNBZTRZb3VnWnNtNGtMeTh1eWw3RlFwWTUveURh?=
 =?utf-8?B?NWJyOG85TTUwQmYwbFMybkVBdlpTbUg2cm1TNVFGRXdaRlNNY1BGRkZGM091?=
 =?utf-8?B?QWJoWDBNQXNlMTZYdTNMS2cyWk1hUnovREFKQVcveGJsOFhhVjJHWkp4UGxC?=
 =?utf-8?B?eHlZdjRWUmZDTDlCb3BIZm5zc2NNSTRTZmFNa1NOUEVnbmF5RjRKQ0V4OVIv?=
 =?utf-8?B?aTVXN2d2OEJSSENEVXRXbGltczBXSUpWQXNYNG5iUnFodmhvWGFmVm5HWjJR?=
 =?utf-8?B?bjdYaU5lSko1dXFhV2VBelRjK3RUWGZJTUlQT2JESWVOaWVCc2ovZFllSHVP?=
 =?utf-8?B?YTVuZVIwT0gzSkV1RmdqdjFDay92UzBRcHdJU2RlOVgyV012N1NxTjE3UEE1?=
 =?utf-8?B?dGJnajZHb2Y4NXJWYnd6RlU3eWE4b0haeE9KYWhYTDFPQTNieTFTY2kxaXdC?=
 =?utf-8?B?bVRVRndLR2ZrT0NhN2d0QTU4QW56bkFWaE5lT0UwSnNuRW9vWjVXN2lUK2hL?=
 =?utf-8?B?aXJzSU9odHFxWFplRXlKZHVpWlFXdW14U1ZQU012MmhQT2FQd2w2ZDFFYjZm?=
 =?utf-8?B?QjdBV1QxZFY4SWlrM2RQdFdFcTlhbXM5RDJ6WGtnTmVpelBWekczVG9oVlNF?=
 =?utf-8?B?OEVUbjM4d0V4S0pJUXVZTWhhRDk4ZTJVQXB3bldJQjY5Tyt5QTNscUh1OWlp?=
 =?utf-8?B?UU5Nb1lRRlo1V0NHaG9PNGVlQldnZUpVbmw3WFZJQUhWRDExcy9SaHYyRXhm?=
 =?utf-8?B?OUVtNy8yRFNlbUFnN2lpVm5lZFkxcTVEcnk3T3RYcjZISlNtMDhsOHhNSnNZ?=
 =?utf-8?B?akZqOGk2dklMS25yUGpsU0lwOW5Ua3RSSW9PZVFqN3E3Vi9rS2FFa0ZnOTBH?=
 =?utf-8?B?cnBSTGRucllqVnIrc2s5L244KytPeWhIMDRYeXl1VFQyQVE4UWNsOURGcE1s?=
 =?utf-8?B?WVJaVnd6bjRkWnZDbFhJMWxnaStpY3dYWnUrUWNZVXVYcU9jSHFQNzEybVpY?=
 =?utf-8?B?Z1Z0NXdYcTFTRGVPbUVSdlkxWnZMMzhwdkVEaHhkZ1NQbGQvV3duN25HWkEr?=
 =?utf-8?B?bVgwcTh5bFk2WUZUclB6bElkUEpTQkcrLzlvSkxJckhuVTVxRUszV2Q3WTlm?=
 =?utf-8?B?MHdpdGpHa1lyMjcyZ2psZ0xCZFNTWTI5YjhjRHlMUVZpelc4RGVXcE1tZGlW?=
 =?utf-8?B?UVhNQlhCemNQREo2ZERUd3h0UHpxT1hqVHNOVEczZGNEMmlCU0x6QTFhWFlq?=
 =?utf-8?B?UW4xREVBNUo5dVhPS0tOWm5ja0p5dzlQWWZ2cDU2dVNUaWwrNm4xbmhZRmQr?=
 =?utf-8?B?VUh0SG9YcGZpQytzQkhTREU2ampFMTl4ZzBZUG5MUG1JaHF1YTN2TTFFdndk?=
 =?utf-8?B?VmtqSmIycEJPTWsyNjRlZ3VIMmV5UGlPZ1BzVjdxRk5BRTVHcFdQK0pFR0VL?=
 =?utf-8?B?YVYrY0cyNUNGQ1g5N1RLdFFRUVlScWJSamZ5OTZCdXhlT0RnZW03SjhvS3ZW?=
 =?utf-8?B?dExhZ1BlWk1ncFR4VnJQUWx5QzlyS1VqME81dWNudnJncFlzMkg4SElZYWJF?=
 =?utf-8?B?eUZsbHc0N2RURWJjcHdqeG5YOXpjOGhGbDVxNTdkTmQxY21lS0FHOG10MGM5?=
 =?utf-8?B?V2wvQWlGSFdPbGlCMnNXc1lyZXkxSk9SWEF5VlpwUy9FZkpIeEp4V3VBWkF4?=
 =?utf-8?B?cGVNVGZUZ1FGSjkwZWUzNVJtU3BYSE84ZzVURUhwU1JkQVhTajVaU1lIT2Rl?=
 =?utf-8?B?b3FDT3BIL2ZtVmNiTnJVNG5wNTNTNGxOdXpMR3ZsVTRRTHZTelN1SzZONUZM?=
 =?utf-8?B?SnFpNVkrY0VVNnhqSTFJVmdtbnEyWVlwSXBIRDJSbDZCdWdmMUN3UnhSS1E1?=
 =?utf-8?B?Z1pNWC9ESlBrQ2Ewc1pTdTFXSFg1TFVJTWhYQWlydHljRVlJWWNGdXVPampt?=
 =?utf-8?B?Q1JoNnpCUDRVS2cxTHMwY2xsNmxXd05UNlp5Sm03V2R0TEt6eTNyVmgwMHcz?=
 =?utf-8?Q?4hEEp+Fam2wh9BY1S+t/keQUh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42404e8c-5a27-4485-5592-08dba5168f7c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 02:54:12.0393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjAuI1I9tqer9ije3F4swq76zVHk/RBVO7uV9DMPL63l+EVQCBFZEc7iJWowXGtu9JYwqRbZrchllSIqqIMHhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-Proofpoint-GUID: rNRB4quC1DgFgkPjSG3AL_HSUoryyIm9
X-Proofpoint-ORIG-GUID: rxXGwlCu4a274Hj7vbIC4qTgis-k4LJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_01,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308250021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37P2eXUE020819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186688

On 8/25/23 00:22, Khem Raj wrote:
> On 8/24/23 2:07 AM, Kai Kang wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Append cfg/systemd.scc to init-manager-systemd.inc which enables kerne=
l
>> config CONFIG_FHANDLE. The config is required by systemd >=3D 209 [1]:
>>
>> =C2=A0=C2=A0 you have to enable CONFIG_FHANDLE in your kernel to use s=
ystemd >=3D=20
>> 209
>> =C2=A0=C2=A0 successfully, otherwise udev won't find any devices.
>>
>> [1]:=20
>> https://lists.freedesktop.org/archives/systemd-devel/2014-February/017=
362.html
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> =C2=A0 meta/conf/distro/include/init-manager-systemd.inc | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/distro/include/init-manager-systemd.inc=20
>> b/meta/conf/distro/include/init-manager-systemd.inc
>> index 595d1f2644..8f45a87b50 100644
>> --- a/meta/conf/distro/include/init-manager-systemd.inc
>> +++ b/meta/conf/distro/include/init-manager-systemd.inc
>> @@ -5,3 +5,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
>> =C2=A0 VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
>> =C2=A0 VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
>> =C2=A0 VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
>> +KERNEL_FEATURES:append =3D " cfg/systemd.scc"
>>
>
> Can this be always enabled ? udev is used with sysvinit too.

Just found it had been enabled by default

https://git.yoctoproject.org/yocto-kernel-cache/commit/ktypes/standard/st=
andard.scc?id=3D3a55d8b019770d78598c3121a6f3479383ef77f2

commit 3a55d8b019770d78598c3121a6f3479383ef77f2
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:=C2=A0=C2=A0 Fri Feb 14 13:36:54 2014 -0500

 =C2=A0=C2=A0=C2=A0 meta: enable CONFIG_FHANDLE for standard and preempt-=
rt kernels

 =C2=A0=C2=A0=C2=A0 CONFIG_FHANDLE is now a requirement for systemd suppo=
rt:

http://cgit.freedesktop.org/systemd/systemd/commit/README?id=3Dc2cb7cbbd5=
26e572b1caa1d7f70be68195b513a9

 =C2=A0=C2=A0=C2=A0 So we add it into our default standard and preempt-rt=
 kernel types, the
 =C2=A0=C2=A0=C2=A0 overhead is small and having this always configured a=
llows init system
 =C2=A0=C2=A0=C2=A0 switching, without a kernel rebuild.

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriv=
er.com>

diff --git a/ktypes/standard/standard.scc b/ktypes/standard/standard.scc
index 31ebd22f..08563da6 100644
--- a/ktypes/standard/standard.scc
+++ b/ktypes/standard/standard.scc
@@ -91,4 +91,6 @@ include cfg/net/ip_nf.scc
 =C2=A0include cfg/net/ip6_nf.scc
 =C2=A0include cfg/net/bridge.scc

+include cfg/systemd.scc
+
 =C2=A0include features/rfkill/rfkill.scc

Plz ignore it and sorry for inconvenience.

Regards,
Kai

>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#186650):=20
>> https://lists.openembedded.org/g/openembedded-core/message/186650
>> Mute This Topic: https://lists.openembedded.org/mt/100932054/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


