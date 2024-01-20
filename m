Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A82C47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 17:01:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27510.1705770113136114582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jan 2024 09:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Jou+2ivb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1749ad241b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40KGo29K004313
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 09:01:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=lHfteA6Fmyes6nYjmYq
	+di51+KPTfoD1Ljxqg7Jljd4=; b=Jou+2ivbazzSynQOKCQk2zBnWFQVTZK8/ZD
	KlU5RqDi4G/MbETaPSBNU1Q2bUCY3R83m+ja8qo8NG2wikOPYP0UTN4OnOk0aytx
	L1Mh0GyUHOR5Mxof7V+mQ5TPqwcDlQ+MlrZamE9bvtBRUBblPmXBgXY4ZxyRQBIa
	r0ZHGriG7DWV0Ewzqtpvdnas9jVV+ATb+mISApBVgpCVd9aHyKNje6wtny0d/eAF
	gsCkfKy7ZJ2sLkz00Xkmck9yCujEcevX+eXzqpMSv/DhD/3L0rtYqp/rv4f9GqLB
	rNvfw5Sd/fXCbNo/kwGrBcY3rudVzJXET1kf8LhLDRo2Tq8se3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4r8hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 09:01:52 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40KH1phM019595
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 09:01:51 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4r8hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jan 2024 09:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/uGR9eZnYfrZKStmwpfXTlaPxLaPZRYuR4yaXpubgVzjgADht8YJHjWrngHhMtP9HwGXTZ5vdcB56RLmtPN+I37tMXix1d/uXQI+kyPDxglBINHDZHHVrz5m2Tm4ZmexxINsQTVMdEPokZAinnKb7oKUAS80jdg97MnJRtdnae0Ej4h/l4PElwiW4YCjsB8RFklDQ5JsHNlaZeMZqJsl9hFhm2Ten5ZvFfWLY/HmJmalDNFCaJ27UIZ7TDdNGHP89MIrMVwa6XSZ3CcgeqToHslgsC6qoxXCehgRwLXkQk0sQ4A/JkXYtea2JGNopEX9yx4ZfPTAkA3U9pHCKyW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHfteA6Fmyes6nYjmYq+di51+KPTfoD1Ljxqg7Jljd4=;
 b=TtE/C9NjXEgg0S3xQAnL2U+7gt1K3x9PIIRHuebLm6RoDANDe5yXvkozcnfY8zV4Ct4v3Fn3yONOj0za5lodywG2BBKUw/N3mwcCLYV+0f2Y5riE/BOosbG4ARxxxjoA5/MZ4T3+/UTFnOLQScUuUkq7/bQ+rSuNnD0A1LMEYBI648zuRBk4b696g2IZFHPHcz8T7qA785uaNdTT8uolROrtPyWH68R5+9NVxAA5/5C7MwL/omvkhLXULoXf6BAQdH5MjLvU8UaNyZ7vj8LfCU0V9ITU3swJUSFLoICPk+n4rXYBhZBZPfnGTcKit5bZ7Ww1lLrUecFECo/6U3MpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Sat, 20 Jan
 2024 17:01:45 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7202.024; Sat, 20 Jan 2024
 17:01:44 +0000
Content-Type: multipart/alternative;
 boundary="------------j9T0xsByHeuQrzusCqfbMHg7"
Message-ID: <e06788dd-2104-40fc-923c-11c4bfbbac0d@windriver.com>
Date: Sat, 20 Jan 2024 12:01:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] rust: Enable rust oe-selftest.
Content-Language: en-CA
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
 <20240119150907.3840110-5-Yash.Shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240119150907.3840110-5-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 56810f3e-9078-4f8f-df7b-08dc19d97b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qE+1ENb3d959Vzj1qZRmAThb9ts85RNzbzGeFUBFHuUaqDZ2C4lKLVj16hTVz14U6+Jl4vpetZfeMppwfcKtHRwQ4RHP2IGTgV16PlXvNjTIfbOWcylRwvIbrnjEBM2UK0DN6Ep/hhOFuR5ghCQ9C8+1dlsfOzJdItajzf9NzoVugGFA0p/wGC8e9zUD+opkd4Anwd5hPwuon3yardxbN6FT1W3wtuYmBlWgALGN74FkUWMHch+b0X+++0AWdzwYVVrXg4KGQcGJ33v1evT9gkrYfLs4rchY8xK+lEJuFesT8Nlzp6xtKEXhV89OejW7J2XXG6+YKSjwNhIswa4DQpVaof24rpguXZT5IDIIa1Fn32y6KhwdKQSnN6ssJo7yNFLuoamD9kVb+MBQP2FoerNCQLSSWruQseT6H9fKqGqUt9GLFu19F0oUp0M5JTv1Hqk303fHIYoIgElnw1NFdup9eDeYMmTtTE+ypEIFpr8UysJwK/JmfPCb+DjLzD054BBd31+9cloZEgvxZCYHpQ5PqmInITog86cy56GiCYFhP02Exx7kpUeHEnAl9IEp9kPXGydJdnNJ776L565Zbhcgb9k9WwkAj1DcaHnQM/rdEvINcEnwW4NUtOoQWHGuB+QvuipAAtkFqkuMZ9dtPwHPtb/kLHMZFcP0tVMU5ICDm/I8VMsl++jm6UFK36zA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39850400004)(136003)(230273577357003)(230922051799003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(31686004)(6666004)(6512007)(6506007)(107886003)(33964004)(26005)(53546011)(2616005)(38100700002)(36756003)(86362001)(31696002)(8936002)(41300700001)(8676002)(4326008)(6486002)(2906002)(30864003)(83380400001)(5660300002)(316002)(478600001)(66556008)(6916009)(66476007)(66946007)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1NWTTdjQkNmMU85Q2lBQ1RoM0ZHMkkxVllVZkJGdlpaVGw4emVST3NPT3h4?=
 =?utf-8?B?b3F5OWJkYWhPeXBOSFZTNFJaSUp6dGxJakdzQjFQeVVkY3dtbHJZWEljVXNu?=
 =?utf-8?B?TE5lUFVnM0s4YngxZWRmMTRoQlNDaWtyUVhDeUN0Y0tSelhQdG1FN002dCty?=
 =?utf-8?B?M2RNRkswU1FvNDFFYmNoNWNzSHVsbGcwVzhwS0dia055cUM2OEx4V1ZpS1dC?=
 =?utf-8?B?eE4weVVlNitVSFNwMDltTjlpNldOMGtKcW40Q0dEMmkvVG95SDdBckpyTTUv?=
 =?utf-8?B?aU1QUlI4MWZQRjMwSDI4Z0VNVHdBU2R6eDBxRjJ2aE5iaExWb1B6OWlZMEZm?=
 =?utf-8?B?QXJrWGxlZU14aytRUkhwbGQzd3I2MkRKbmc2allkNHZMTDRmR1l2bkFTWExI?=
 =?utf-8?B?K1RNVStqLzlPdkFVRlorY0NFMHFDQThqQjJtd0NtUm1zaXBndFNRWHFnRTZi?=
 =?utf-8?B?WTgvMEM0bm1IZCt0MUpucDZqMzJQY2dvTXBMeWNlOTdnT0V0VnVHOUpuQVFx?=
 =?utf-8?B?MEhBK2czenJ6bGt4RTdOczZKQ3g0ODlRWDZ4d1k2T3hkeU1DbDRpUFpQb0VE?=
 =?utf-8?B?M054bmp6Um4yYzhlNnVyN1NHZHF3aHNEY3RoNTZqSVVMNE12RWtDdmEvd2Mr?=
 =?utf-8?B?N1ZOcnFxQ1hBM0pZMTU1RnRLbWJob1RoNzR0c0Znd0t4b05hdTFlZjdQaVZ1?=
 =?utf-8?B?TmpJTk9Fb3JKVlhhTzY2V0FVM3l4YjBVcC9FaU0rN05DVlV0cDFmc01xNWdm?=
 =?utf-8?B?T2dPbVdRMTVXWS8yVjZ2UUxoU3dDeVNTWUpiTUs2TEZQampzYXpSSk5yYUJa?=
 =?utf-8?B?ZXVKcWZNSk9PeXNkcHVOS0pyS0xOKzBWVmxrRkF6cVNOUnRnL0FVRExOcUVu?=
 =?utf-8?B?cmc2dHByQjNkMzFuaVlyZ0hQOGIzcVU0WFd4dGpnemFjRDdPWGx3Wmszc09I?=
 =?utf-8?B?Y0xQYlFCdUZ6b3l0cmROMGI5cWRvSzlnZDhuelZScTFGdHZBVUV0VzF3bXRq?=
 =?utf-8?B?a3VzZklkTHlGT0JPc25RZWN5aHhjekM1dGNxRHJsRTZ1MGlOQTJBV2xmOURR?=
 =?utf-8?B?NEJBL2lXTXpRR0RnVHZkOHVTazg1a08rbnZES3FiUEhEbmpiSTZZVmhOQitH?=
 =?utf-8?B?NG1TWFhKVnltTU1CcWJSYUhSQ043cU42MVVudHdFSGpubzNrSGdsSGJkVVR4?=
 =?utf-8?B?bWFYUEF2Z1RqL01uMTZGcjMwalpYeXY2NDNIYWJlNDhaOCtKOEs2bFFIbzdO?=
 =?utf-8?B?VWJSNno4dGpoVVllemM5TmxYSjI5UTdFM0t4RUNTU2hYL24rQTJWamt3N2NK?=
 =?utf-8?B?a2VTdjlOQUJvZmRVQjdiSlIyQmpucmh0cjFlUGhwL3NSRjNWOS9TZ3F3ZDUz?=
 =?utf-8?B?ejNJa2M3NmdBNEU1RXlyeU5kT2MxeXFnUzAzd0Y4TzIxOTVKVzNSZThnUkJk?=
 =?utf-8?B?SE1pVVVQOFE3c0t3L05tblQ0WU10eGxOZ0hKVWNyZDhrVUVLbEhhQWUzV2pI?=
 =?utf-8?B?bjNHVzlaVm1EZm9ORkU3QzlBWGp0VlZYeVNLNVpnaGZzT1V2MUh3RGdlNGV6?=
 =?utf-8?B?M09QcGxlZkovTnBZR3JJeG5mdlRVRGxpME5VVkJDZGJ4dTBnWkRJVXlsdk5w?=
 =?utf-8?B?b2RGK0pOMTY5RHovUFhNZ2FQL2VvT0FzNVpBVitPdFFjSXJBUko1MUp3QktN?=
 =?utf-8?B?NkpjejZBaXdQaWhieHNWR3g2aVdJUnFvR211NjFxVEp4WFljUUtvY1Fid2lQ?=
 =?utf-8?B?ZVJmNWNoaW9semZDL1k4UlZ2TitpRXZhWnNxRUdRRldxVWpFYnNVbGlRa0tV?=
 =?utf-8?B?TXlpWFZiZVFMQit0Vjh0WTBSZXZMS1pSVFJ5WkhLMjVFcmJxcHFJMll2eWx3?=
 =?utf-8?B?L2EwWEg3clpBV05ML2xKa0hiTXMwckJxQU82VjV2RXJ3TVMxeW9RQU5BZTZk?=
 =?utf-8?B?NEl2SFUwanhUTVBHSEt6RTdaK2M5OGhWcWNVYlB1TE5uWUlnZWxteng5M2lw?=
 =?utf-8?B?TWVJRG9WVU5FUzM2R3hjR3JNWEczN2NjYVlETzJnamNsc1FwOXBkSW9vMU5z?=
 =?utf-8?B?bWxsRkFlUEd5RGcxYlhya3RWSTBJcXBBVEZVRFArVE0rREFES0dBV3hZR25O?=
 =?utf-8?B?anhoaU9oYTNhdUI4Y1JhK2NHdTNSQzBUcjVCMlZkOTM5ZnBLTWowcFpZa2k2?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56810f3e-9078-4f8f-df7b-08dc19d97b03
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 17:01:44.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUBpBeQl8d2rPojTiytCPcIK0KXgrjP6Lif+z06xozib2lGsTL6Yerw53JKvAcGdc/yF1XEDgDhHL3jLEhpsx3epiHTA1nfzThRQSOMAACA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
X-Proofpoint-ORIG-GUID: GxNPm3Bc_6F0QA5V1JW_k1qjySUMaybz
X-Proofpoint-GUID: AB-X-3w-MhrvfiZdHD5JkldSBr1BlrB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-20_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401200139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 17:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194084

--------------j9T0xsByHeuQrzusCqfbMHg7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40KGo29K004313

I like that you have broken the original patch down into 5 patches that=20
are easier to
understand.

On 2024-01-19 10:09 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Tests which are failing from below modules are added to exclude list
> 	tests/run-make
> 	tests/rustdoc
> 	tests/mir-opt
> 	tests/ui-fulldeps
>
> * Redundent test cases whose parent dir is also present in  exclud list=
 are removed.
>
> * Newly addded tests are sorted and updated.
>
> * Overall exclude tests count in exclude list is now reduced to 114.
We need to resolve the mips32 problems that Richard pointed out.

Should we skip all the rust tests for mips32?


Please submit a v3 with the mips fix/avoidance and split this exclude=20
list commit down into 3 steps:

 =C2=A01. Sort the existing list of tests
 =C2=A02. Remove the test cases whose parent dir is also present in the=20
exclude list

 =C2=A03. Add the new tests that are to be excluded.

This may seem really pedantic but otherwise the changes are really hard=20
to review.

The way I think about this is that someone looking at the commit log=20
might be interested
in exactly which tests are in being added to the exclude list so that=20
should be clear from 3.
1. won't really be of interest so most people will skip over that
2. also won't be of interest to most people
but you need 1 and 2 to make 3 be apparent to people who want that info=20
quickly.

Thanks,

../Randy

>
> * The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++---------------=
-
>   meta/recipes-devtools/rust/rust-source.inc |   4 +
>   2 files changed, 43 insertions(+), 126 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> index 6dbc517006..7d0efb1b01 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -40,7 +40,7 @@ def parse_results(filename):
>   class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTes=
tCase):
>       def test_rust(self, *args, **kwargs):
>           # Disable Rust Oe-selftest
> -        self.skipTest("The Rust Oe-selftest is disabled.")
> +        #self.skipTest("The Rust Oe-selftest is disabled.")
>  =20
>           # build remote-test-server before image build
>           recipe =3D "rust" @@ -73,156 +73,90 @@ class=20
> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):=20
> 'src/librustdoc', 'src/rustdoc-json-types',=20
> 'src/tools/compiletest/src/common.rs', + 'src/tools/jsondoclint',=20
> 'src/tools/lint-docs', + 'src/tools/replace-version-placeholder',=20
> 'src/tools/rust-analyzer', 'src/tools/rustdoc-themes',=20
> 'src/tools/tidy', 'tests/assembly/asm/aarch64-outline-atomics.rs', +=20
> 'tests/codegen/abi-efiapi.rs', + 'tests/codegen/abi-efiapi.rs',=20
> 'tests/codegen/abi-main-signature-32bit-c-int.rs',=20
> 'tests/codegen/abi-repr-ext.rs', + 'tests/codegen/abi-sysv64.rs',=20
> 'tests/codegen/abi-x86-interrupt.rs', +=20
> 'tests/codegen/align-byval.rs', + 'tests/codegen/align-fn.rs', +=20
> 'tests/codegen/asm-powerpc-clobbers.rs', +=20
> 'tests/codegen/async-fn-debug-awaitee-field.rs', +=20
> 'tests/codegen/binary-search-index-no-bound-check.rs',=20
> 'tests/codegen/branch-protection.rs', +=20
> 'tests/codegen/call-metadata.rs', 'tests/codegen/catch-unwind.rs',=20
> 'tests/codegen/cf-protection.rs', + 'tests/codegen/debug-column.rs', +=20
> 'tests/codegen/debug-limited.rs', +=20
> 'tests/codegen/debuginfo-generic-closure-env-names.rs', +=20
> 'tests/codegen/drop.rs', +=20
> 'tests/codegen/dst-vtable-align-nonzero.rs', +=20
> 'tests/codegen/enable-lto-unit-splitting.rs',=20
> 'tests/codegen/enum-bounds-check-derived-idx.rs', +=20
> 'tests/codegen/enum/enum-u128.rs', +=20
> 'tests/codegen/fn-impl-trait-self.rs',=20
> 'tests/codegen/force-unwind-tables.rs', +=20
> 'tests/codegen/inherit_overflow.rs', +=20
> 'tests/codegen/inherit_overflow.rs', +=20
> 'tests/codegen/inline-function-args-debug-info.rs',=20
> 'tests/codegen/intrinsic-no-unnamed-attr.rs', +=20
> 'tests/codegen/intrinsics/mask.rs', +=20
> 'tests/codegen/intrinsics/transmute-niched.rs',=20
> 'tests/codegen/issues/issue-103840.rs',=20
> 'tests/codegen/issues/issue-47278.rs', +=20
> 'tests/codegen/issues/issue-73258.rs',=20
> 'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs', +=20
> 'tests/codegen/issues/issue-75546.rs', +=20
> 'tests/codegen/issues/issue-77812.rs', +=20
> 'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',=20
> 'tests/codegen/lifetime_start_end.rs', +=20
> 'tests/codegen/llvm-ident.rs',=20
> 'tests/codegen/local-generics-in-exe-internalized.rs', +=20
> 'tests/codegen/mainsubprogram.rs',=20
> 'tests/codegen/match-unoptimized.rs', +=20
> 'tests/codegen/move-operands.rs',=20
> 'tests/codegen/noalias-rwlockreadguard.rs',=20
> 'tests/codegen/non-terminate/nonempty-infinite-loop.rs',=20
> 'tests/codegen/noreturn-uninhabited.rs',=20
> 'tests/codegen/repr-transparent-aggregates-3.rs', +=20
> 'tests/codegen/repr/transparent-mips64.rs',=20
> 'tests/codegen/sse42-implies-crc32.rs',=20
> 'tests/codegen/thread-local.rs', 'tests/codegen/uninit-consts.rs', +=20
> 'tests/mir-opt/', 'tests/pretty/raw-str-nonexpr.rs', 'tests/run-make',=20
> - 'tests/run-make/cdylib-fewer-symbols/foo.rs', -=20
> 'tests/run-make/doctests-keep-binaries/t.rs', -=20
> 'tests/run-make-fulldeps', - 'tests/run-make/issue-22131/foo.rs', -=20
> 'tests/run-make/issue-36710/Makefile', - 'tests/run-make/issue-47551',=20
> - 'tests/run-make/pgo-branch-weights', - 'tests/run-make/pgo-gen', -=20
> 'tests/run-make/pgo-gen-lto', -=20
> 'tests/run-make/pgo-indirect-call-promotion', -=20
> 'tests/run-make/pgo-use', -=20
> 'tests/run-make/pointer-auth-link-with-c/Makefile', -=20
> 'tests/run-make/profile', - 'tests/run-make/static-pie', -=20
> 'tests/run-make/sysroot-crates-are-unstable', -=20
> 'tests/run-make/target-specs', 'tests/rustdoc', -=20
> 'tests/rustdoc/async-move-doctest.rs', -=20
> 'tests/rustdoc/async-trait.rs', - 'tests/rustdoc/auto-traits.rs', -=20
> 'tests/rustdoc/check-source-code-urls-to-def.rs', -=20
> 'tests/rustdoc/comment-in-doctest.rs', -=20
> 'tests/rustdoc/const-generics/const-generics-docs.rs', -=20
> 'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs', -=20
> 'tests/rustdoc/cross-crate-hidden-impl-parameter.rs', -=20
> 'tests/rustdoc/cross-crate-links.rs', -=20
> 'tests/rustdoc/cross-crate-primitive-doc.rs', -=20
> 'tests/rustdoc/doctest-manual-crate-name.rs', -=20
> 'tests/rustdoc/edition-doctest.rs', - 'tests/rustdoc/edition-flag.rs',=20
> - 'tests/rustdoc/elided-lifetime.rs', -=20
> 'tests/rustdoc/external-macro-src.rs', -=20
> 'tests/rustdoc/extern-html-root-url.rs', -=20
> 'tests/rustdoc/extern-impl-trait.rs', -=20
> 'tests/rustdoc/hide-unstable-trait.rs', -=20
> 'tests/rustdoc/inline_cross/add-docs.rs', -=20
> 'tests/rustdoc/inline_cross/default-trait-method.rs', -=20
> 'tests/rustdoc/inline_cross/dyn_trait.rs', -=20
> 'tests/rustdoc/inline_cross/impl_trait.rs', -=20
> 'tests/rustdoc/inline_cross/issue-24183.rs', -=20
> 'tests/rustdoc/inline_cross/macros.rs', -=20
> 'tests/rustdoc/inline_cross/trait-vis.rs', -=20
> 'tests/rustdoc/inline_cross/use_crate.rs', -=20
> 'tests/rustdoc/intra-doc-crate/self.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/basic.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/crate.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/hidden.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/macro.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/module.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/submodule-outer.rs', -=20
> 'tests/rustdoc/intra-doc/cross-crate/traits.rs', -=20
> 'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs', -=20
> 'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs', -=20
> 'tests/rustdoc/intra-doc/extern-crate.rs', -=20
> 'tests/rustdoc/intra-doc/extern-inherent-impl.rs', -=20
> 'tests/rustdoc/intra-doc/extern-reference-link.rs', -=20
> 'tests/rustdoc/intra-doc/issue-103463.rs', -=20
> 'tests/rustdoc/intra-doc/issue-104145.rs', -=20
> 'tests/rustdoc/intra-doc/issue-66159.rs', -=20
> 'tests/rustdoc/intra-doc/pub-use.rs', -=20
> 'tests/rustdoc/intra-doc/reexport-additional-docs.rs', -=20
> 'tests/rustdoc/issue-18199.rs', - 'tests/rustdoc/issue-23106.rs', -=20
> 'tests/rustdoc/issue-23744.rs', - 'tests/rustdoc/issue-25944.rs', -=20
> 'tests/rustdoc/issue-30252.rs', - 'tests/rustdoc/issue-38129.rs', -=20
> 'tests/rustdoc/issue-40936.rs', - 'tests/rustdoc/issue-43153.rs', -=20
> 'tests/rustdoc/issue-46727.rs', - 'tests/rustdoc/issue-48377.rs', -=20
> 'tests/rustdoc/issue-48414.rs', - 'tests/rustdoc/issue-53689.rs', -=20
> 'tests/rustdoc/issue-54478-demo-allocator.rs', -=20
> 'tests/rustdoc/issue-57180.rs', - 'tests/rustdoc/issue-61592.rs', -=20
> 'tests/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs', -=20
> 'tests/rustdoc/issue-75588.rs', - 'tests/rustdoc/issue-85454.rs', -=20
> 'tests/rustdoc/issue-86620.rs', - 'tests/rustdoc-json',=20
> 'tests/rustdoc-js-std', - 'tests/rustdoc/macro_pub_in_module.rs', -=20
> 'tests/rustdoc/masked.rs', - 'tests/rustdoc/normalize-assoc-item.rs',=20
> - 'tests/rustdoc/no-stack-overflow-25295.rs', -=20
> 'tests/rustdoc/primitive-reexport.rs', -=20
> 'tests/rustdoc/process-termination.rs', -=20
> 'tests/rustdoc/pub-extern-crate.rs', -=20
> 'tests/rustdoc/pub-use-extern-macros.rs', -=20
> 'tests/rustdoc/reexport-check.rs', -=20
> 'tests/rustdoc/reexport-dep-foreign-fn.rs', -=20
> 'tests/rustdoc/reexport-doc.rs', - 'tests/rustdoc/reexports-priv.rs',=20
> - 'tests/rustdoc/reexports.rs', -=20
> 'tests/rustdoc/rustc,-incoherent-impls.rs', -=20
> 'tests/rustdoc/test_option_check/bar.rs', -=20
> 'tests/rustdoc/test_option_check/test.rs', -=20
> 'tests/rustdoc/trait-alias-mention.rs', -=20
> 'tests/rustdoc/trait-visibility.rs', + 'tests/rustdoc-json',=20
> 'tests/rustdoc-ui/cfg-test.rs', 'tests/rustdoc-ui/check-cfg-test.rs',=20
> 'tests/rustdoc-ui/display-output.rs',=20
> 'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',=20
> 'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',=20
> 'tests/rustdoc-ui/doc-test-doctest-feature.rs', +=20
> 'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',=20
> 'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',=20
> 'tests/rustdoc-ui/doctest-output.rs', -=20
> 'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',=20
> 'tests/rustdoc-ui/failed-doctest-compile-fail.rs',=20
> 'tests/rustdoc-ui/issue-80992.rs', 'tests/rustdoc-ui/issue-91134.rs',=20
> + 'tests/rustdoc-ui/no-run-flag.rs',=20
> 'tests/rustdoc-ui/nocapture-fail.rs', 'tests/rustdoc-ui/nocapture.rs',=20
> - 'tests/rustdoc-ui/no-run-flag.rs',=20
> 'tests/rustdoc-ui/run-directory.rs',=20
> 'tests/rustdoc-ui/test-no_std.rs', 'tests/rustdoc-ui/test-type.rs', -=20
> 'tests/rustdoc/unit-return.rs', + 'tests/ui-fulldeps/',=20
> 'tests/ui/abi/stack-probes-lto.rs', 'tests/ui/abi/stack-probes.rs',=20
> 'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs', @@=20
> -233,31 +167,10 @@ class=20
> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):=20
> 'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',=20
> 'tests/ui/drop/dynamic-drop.rs', 'tests/ui/empty_global_asm.rs', -=20
> 'tests/ui-fulldeps/deriving-encodable-decodable-box.rs', -=20
> 'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs', -=20
> 'tests/ui-fulldeps/deriving-global.rs', -=20
> 'tests/ui-fulldeps/deriving-hygiene.rs', -=20
> 'tests/ui-fulldeps/dropck_tarena_sound_drop.rs', -=20
> 'tests/ui-fulldeps/empty-struct-braces-derive.rs', -=20
> 'tests/ui-fulldeps/internal-lints/bad_opt_access.rs', -=20
> 'tests/ui-fulldeps/internal-lints/bad_opt_access.stderr', -=20
> 'tests/ui-fulldeps/internal-lints/default_hash_types.rs', -=20
> 'tests/ui-fulldeps/internal-lints/diagnostics.rs', -=20
> 'tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs', -=20
> 'tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs', -=20
> 'tests/ui-fulldeps/internal-lints/query_stability.rs', -=20
> 'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs', -=20
> 'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs', -=20
> 'tests/ui-fulldeps/issue-14021.rs', -=20
> 'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs', -=20
> 'tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs', -=20
> 'tests/ui-fulldeps/lint-pass-macros.rs', -=20
> 'tests/ui-fulldeps/regions-mock-tcx.rs', -=20
> 'tests/ui-fulldeps/rustc_encodable_hygiene.rs', -=20
> 'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',=20
> 'tests/ui/functions-closures/fn-help-with-err.rs',=20
> 'tests/ui/linkage-attr/issue-10755.rs',=20
> 'tests/ui/macros/restricted-shadowing-legacy.rs', +=20
> 'tests/ui/numbers-arithmetic/u128.rs',=20
> 'tests/ui/process/nofile-limit.rs',=20
> 'tests/ui/process/process-panic-after-fork.rs',=20
> 'tests/ui/process/process-sigpipe.rs', diff --git=20
> a/meta/recipes-devtools/rust/rust-source.inc=20
> b/meta/recipes-devtools/rust/rust-source.inc index=20
> 83a0dbc15f..e02829e6b3 100644 ---=20
> a/meta/recipes-devtools/rust/rust-source.inc +++=20
> b/meta/recipes-devtools/rust/rust-source.inc @@ -10,6 +10,10 @@=20
> SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-s=
rc.tar.xz;n
>               file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;pat=
chdir=3D${RUSTSRC} \
>               file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.pa=
tch;patchdir=3D${RUSTSRC} \
>               file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-a=
s-relat.patch;patchdir=3D${RUSTSRC} \
> +            file://cargo-path.patch;patchdir=3D${RUSTSRC} \
> +            file://custom-target-cfg.patch;patchdir=3D${RUSTSRC} \
> +            file://rustc-bootstrap.patch;patchdir=3D${RUSTSRC} \
> +            file://target-build-value.patch;patchdir=3D${RUSTSRC} \
>   "
>   SRC_URI[rust.sha256sum] =3D "b98c09d968529212fb29eec7d6d3e9bdaa869810=
679b7fb86a1ca69469d75f5e"
>  =20


--=20
# Randy MacLeod
# Wind River Linux

--------------j9T0xsByHeuQrzusCqfbMHg7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">I like that you have broken the
      original patch down into 5 patches that are easier to<br>
      understand.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-01-19 10:09 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wind=
river.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240119150907.3840110-5-Yash.Shi=
nde@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Yash Shinde <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yash.S=
hinde@windriver.com&gt;</a>

Tests which are failing from below modules are added to exclude list
	tests/run-make
	tests/rustdoc
	tests/mir-opt
	tests/ui-fulldeps

* Redundent test cases whose parent dir is also present in  exclud list are=
 removed.

* Newly addded tests are sorted and updated.

* Overall exclude tests count in exclude list is now reduced to 114.</pre>
    </blockquote>
    We need to resolve the mips32 problems that Richard pointed out.<br>
    <p>Should we skip all the rust tests for mips32?</p>
    <p><br>
    </p>
    Please submit a v3 with the mips fix/avoidance and split this
    exclude list commit down into 3 steps:<br>
    <br>
    &nbsp;1. Sort the existing list of tests<br>
    &nbsp;2. Remove the <span style=3D"white-space: pre-wrap">test cases wh=
ose parent dir is also present in the exclude list
</span>
    <p>&nbsp;3. Add the new tests that are to be excluded.</p>
    <p>This may seem really pedantic but otherwise the changes are
      really hard to review.</p>
    <p>The way I think about this is that someone looking at the commit
      log might be interested<br>
      in exactly which tests are in being added to the exclude list so
      that should be clear from 3.<br>
      1. won't really be of interest so most people will skip over that<br>
      2. also won't be of interest to most people <br>
      but you need 1 and 2 to make 3 be apparent to people who want that
      info quickly.</p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240119150907.3840110-5-Yash.Shi=
nde@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++----------------
 meta/recipes-devtools/rust/rust-source.inc |   4 +
 2 files changed, 43 insertions(+), 126 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py
index 6dbc517006..7d0efb1b01 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,7 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase=
):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
+        #self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
=20
         # build remote-test-server before image build
         recipe =3D &quot;rust<a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:@@-73,156+73,90@@classRustSelfTestSystemEmulated(OESelftestTestCase,OE=
PTestResultTestCase):'src/librustdoc','src/rustdoc-json-types','src/tools/c=
ompiletest/src/common.rs',+'src/tools/jsondoclint','src/tools/lint-docs',+'=
src/tools/replace-version-placeholder','src/tools/rust-analyzer','src/tools=
/rustdoc-themes','src/tools/tidy','tests/assembly/asm/aarch64-outline-atomi=
cs.rs',+'tests/codegen/abi-efiapi.rs',+'tests/codegen/abi-efiapi.rs','tests=
/codegen/abi-main-signature-32bit-c-int.rs','tests/codegen/abi-repr-ext.rs'=
,+'tests/codegen/abi-sysv64.rs','tests/codegen/abi-x86-interrupt.rs',+'test=
s/codegen/align-byval.rs',+'tests/codegen/align-fn.rs',+'tests/codegen/asm-=
powerpc-clobbers.rs',+'tests/codegen/async-fn-debug-awaitee-field.rs',+'tes=
ts/codegen/binary-search-index-no-bound-check.rs','tests/codegen/branch-pro=
tection.rs',+'tests/codegen/call-metadata.rs','tests/codegen/catch-unwind.r=
s','tests/codegen/cf-protection.rs',+'tests/codegen/debug-column.rs',+'test=
s/codegen/debug-limited.rs',+'tests/codegen/debuginfo-generic-closure-env-n=
ames.rs',+'tests/codegen/drop.rs',+'tests/codegen/dst-vtable-align-nonzero.=
rs',+'tests/codegen/enable-lto-unit-splitting.rs','tests/codegen/enum-bound=
s-check-derived-idx.rs',+'tests/codegen/enum/enum-u128.rs',+'tests/codegen/=
fn-impl-trait-self.rs','tests/codegen/force-unwind-tables.rs',+'tests/codeg=
en/inherit_overflow.rs',+'tests/codegen/inherit_overflow.rs',+'tests/codege=
n/inline-function-args-debug-info.rs','tests/codegen/intrinsic-no-unnamed-a=
ttr.rs',+'tests/codegen/intrinsics/mask.rs',+'tests/codegen/intrinsics/tran=
smute-niched.rs','tests/codegen/issues/issue-103840.rs','tests/codegen/issu=
es/issue-47278.rs',+'tests/codegen/issues/issue-73258.rs','tests/codegen/is=
sues/issue-73827-bounds-check-index-in-subexpr.rs',+'tests/codegen/issues/i=
ssue-75546.rs',+'tests/codegen/issues/issue-77812.rs',+'tests/codegen/issue=
s/issue-98156-const-arg-temp-lifetime.rs','tests/codegen/lifetime_start_end=
.rs',+'tests/codegen/llvm-ident.rs','tests/codegen/local-generics-in-exe-in=
ternalized.rs',+'tests/codegen/mainsubprogram.rs','tests/codegen/match-unop=
timized.rs',+'tests/codegen/move-operands.rs','tests/codegen/noalias-rwlock=
readguard.rs','tests/codegen/non-terminate/nonempty-infinite-loop.rs','test=
s/codegen/noreturn-uninhabited.rs','tests/codegen/repr-transparent-aggregat=
es-3.rs',+'tests/codegen/repr/transparent-mips64.rs','tests/codegen/sse42-i=
mplies-crc32.rs','tests/codegen/thread-local.rs','tests/codegen/uninit-cons=
ts.rs',+'tests/mir-opt/','tests/pretty/raw-str-nonexpr.rs','tests/run-make'=
,-'tests/run-make/cdylib-fewer-symbols/foo.rs',-'tests/run-make/doctests-ke=
ep-binaries/t.rs',-'tests/run-make-fulldeps',-'tests/run-make/issue-22131/f=
oo.rs',-'tests/run-make/issue-36710/Makefile',-'tests/run-make/issue-47551'=
,-'tests/run-make/pgo-branch-weights',-'tests/run-make/pgo-gen',-'tests/run=
-make/pgo-gen-lto',-'tests/run-make/pgo-indirect-call-promotion',-'tests/ru=
n-make/pgo-use',-'tests/run-make/pointer-auth-link-with-c/Makefile',-'tests=
/run-make/profile',-'tests/run-make/static-pie',-'tests/run-make/sysroot-cr=
ates-are-unstable',-'tests/run-make/target-specs','tests/rustdoc',-'tests/r=
ustdoc/async-move-doctest.rs',-'tests/rustdoc/async-trait.rs',-'tests/rustd=
oc/auto-traits.rs',-'tests/rustdoc/check-source-code-urls-to-def.rs',-'test=
s/rustdoc/comment-in-doctest.rs',-'tests/rustdoc/const-generics/const-gener=
ics-docs.rs',-'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',-'tes=
ts/rustdoc/cross-crate-hidden-impl-parameter.rs',-'tests/rustdoc/cross-crat=
e-links.rs',-'tests/rustdoc/cross-crate-primitive-doc.rs',-'tests/rustdoc/d=
octest-manual-crate-name.rs',-'tests/rustdoc/edition-doctest.rs',-'tests/ru=
stdoc/edition-flag.rs',-'tests/rustdoc/elided-lifetime.rs',-'tests/rustdoc/=
external-macro-src.rs',-'tests/rustdoc/extern-html-root-url.rs',-'tests/rus=
tdoc/extern-impl-trait.rs',-'tests/rustdoc/hide-unstable-trait.rs',-'tests/=
rustdoc/inline_cross/add-docs.rs',-'tests/rustdoc/inline_cross/default-trai=
t-method.rs',-'tests/rustdoc/inline_cross/dyn_trait.rs',-'tests/rustdoc/inl=
ine_cross/impl_trait.rs',-'tests/rustdoc/inline_cross/issue-24183.rs',-'tes=
ts/rustdoc/inline_cross/macros.rs',-'tests/rustdoc/inline_cross/trait-vis.r=
s',-'tests/rustdoc/inline_cross/use_crate.rs',-'tests/rustdoc/intra-doc-cra=
te/self.rs',-'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',-'test=
s/rustdoc/intra-doc/cross-crate/basic.rs',-'tests/rustdoc/intra-doc/cross-c=
rate/crate.rs',-'tests/rustdoc/intra-doc/cross-crate/hidden.rs',-'tests/rus=
tdoc/intra-doc/cross-crate/macro.rs',-'tests/rustdoc/intra-doc/cross-crate/=
module.rs',-'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',-'test=
s/rustdoc/intra-doc/cross-crate/submodule-outer.rs',-'tests/rustdoc/intra-d=
oc/cross-crate/traits.rs',-'tests/rustdoc/intra-doc/extern-builtin-type-imp=
l.rs',-'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',-'tests/=
rustdoc/intra-doc/extern-crate.rs',-'tests/rustdoc/intra-doc/extern-inheren=
t-impl.rs',-'tests/rustdoc/intra-doc/extern-reference-link.rs',-'tests/rust=
doc/intra-doc/issue-103463.rs',-'tests/rustdoc/intra-doc/issue-104145.rs',-=
'tests/rustdoc/intra-doc/issue-66159.rs',-'tests/rustdoc/intra-doc/pub-use.=
rs',-'tests/rustdoc/intra-doc/reexport-additional-docs.rs',-'tests/rustdoc/=
issue-18199.rs',-'tests/rustdoc/issue-23106.rs',-'tests/rustdoc/issue-23744=
.rs',-'tests/rustdoc/issue-25944.rs',-'tests/rustdoc/issue-30252.rs',-'test=
s/rustdoc/issue-38129.rs',-'tests/rustdoc/issue-40936.rs',-'tests/rustdoc/i=
ssue-43153.rs',-'tests/rustdoc/issue-46727.rs',-'tests/rustdoc/issue-48377.=
rs',-'tests/rustdoc/issue-48414.rs',-'tests/rustdoc/issue-53689.rs',-'tests=
/rustdoc/issue-54478-demo-allocator.rs',-'tests/rustdoc/issue-57180.rs',-'t=
ests/rustdoc/issue-61592.rs',-'tests/rustdoc/issue-73061-cross-crate-opaque=
-assoc-type.rs',-'tests/rustdoc/issue-75588.rs',-'tests/rustdoc/issue-85454=
.rs',-'tests/rustdoc/issue-86620.rs',-'tests/rustdoc-json','tests/rustdoc-j=
s-std',-'tests/rustdoc/macro_pub_in_module.rs',-'tests/rustdoc/masked.rs',-=
'tests/rustdoc/normalize-assoc-item.rs',-'tests/rustdoc/no-stack-overflow-2=
5295.rs',-'tests/rustdoc/primitive-reexport.rs',-'tests/rustdoc/process-ter=
mination.rs',-'tests/rustdoc/pub-extern-crate.rs',-'tests/rustdoc/pub-use-e=
xtern-macros.rs',-'tests/rustdoc/reexport-check.rs',-'tests/rustdoc/reexpor=
t-dep-foreign-fn.rs',-'tests/rustdoc/reexport-doc.rs',-'tests/rustdoc/reexp=
orts-priv.rs',-'tests/rustdoc/reexports.rs',-'tests/rustdoc/rustc,-incohere=
nt-impls.rs',-'tests/rustdoc/test_option_check/bar.rs',-'tests/rustdoc/test=
_option_check/test.rs',-'tests/rustdoc/trait-alias-mention.rs',-'tests/rust=
doc/trait-visibility.rs',+'tests/rustdoc-json','tests/rustdoc-ui/cfg-test.r=
s','tests/rustdoc-ui/check-cfg-test.rs','tests/rustdoc-ui/display-output.rs=
','tests/rustdoc-ui/doc-comment-multi-line-attr.rs','tests/rustdoc-ui/doc-c=
omment-multi-line-cfg-attr.rs','tests/rustdoc-ui/doc-test-doctest-feature.r=
s',+'tests/rustdoc-ui/doc-test-rustdoc-feature.rs','tests/rustdoc-ui/doctes=
t-multiline-crate-attribute.rs','tests/rustdoc-ui/doctest-output.rs',-'test=
s/rustdoc-ui/doc-test-rustdoc-feature.rs','tests/rustdoc-ui/failed-doctest-=
compile-fail.rs','tests/rustdoc-ui/issue-80992.rs','tests/rustdoc-ui/issue-=
91134.rs',+'tests/rustdoc-ui/no-run-flag.rs','tests/rustdoc-ui/nocapture-fa=
il.rs','tests/rustdoc-ui/nocapture.rs',-'tests/rustdoc-ui/no-run-flag.rs','=
tests/rustdoc-ui/run-directory.rs','tests/rustdoc-ui/test-no_std.rs','tests=
/rustdoc-ui/test-type.rs',-'tests/rustdoc/unit-return.rs',+'tests/ui-fullde=
ps/','tests/ui/abi/stack-probes-lto.rs','tests/ui/abi/stack-probes.rs','tes=
ts/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',@@-233,31+167,=
10@@classRustSelfTestSystemEmulated(OESelftestTestCase,OEPTestResultTestCas=
e):'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs','test=
s/ui/drop/dynamic-drop.rs','tests/ui/empty_global_asm.rs',-'tests/ui-fullde=
ps/deriving-encodable-decodable-box.rs',-'tests/ui-fulldeps/deriving-encoda=
ble-decodable-cell-refcell.rs',-'tests/ui-fulldeps/deriving-global.rs',-'te=
sts/ui-fulldeps/deriving-hygiene.rs',-'tests/ui-fulldeps/dropck_tarena_soun=
d_drop.rs',-'tests/ui-fulldeps/empty-struct-braces-derive.rs',-'tests/ui-fu=
lldeps/internal-lints/bad_opt_access.rs',-'tests/ui-fulldeps/internal-lints=
/bad_opt_access.stderr',-'tests/ui-fulldeps/internal-lints/default_hash_typ=
es.rs',-'tests/ui-fulldeps/internal-lints/diagnostics.rs',-'tests/ui-fullde=
ps/internal-lints/lint_pass_impl_without_macro.rs',-'tests/ui-fulldeps/inte=
rnal-lints/qualified_ty_ty_ctxt.rs',-'tests/ui-fulldeps/internal-lints/quer=
y_stability.rs',-'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',=
-'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',-'tests/ui-fulldeps/=
issue-14021.rs',-'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',-'te=
sts/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',-'tests/ui-fulldeps=
/lint-pass-macros.rs',-'tests/ui-fulldeps/regions-mock-tcx.rs',-'tests/ui-f=
ulldeps/rustc_encodable_hygiene.rs',-'tests/ui-fulldeps/session-diagnostic/=
enforce_slug_naming.rs','tests/ui/functions-closures/fn-help-with-err.rs','=
tests/ui/linkage-attr/issue-10755.rs','tests/ui/macros/restricted-shadowing=
-legacy.rs',+'tests/ui/numbers-arithmetic/u128.rs','tests/ui/process/nofile=
-limit.rs','tests/ui/process/process-panic-after-fork.rs','tests/ui/process=
/process-sigpipe.rs',diff--gita/meta/recipes-devtools/rust/rust-source.incb=
/meta/recipes-devtools/rust/rust-source.incindex83a0dbc15f..e02829e6b310064=
4---a/meta/recipes-devtools/rust/rust-source.inc+++b/meta/recipes-devtools/=
rust/rust-source.inc@@-10,6+10,10@@SRC_URI+=3D">&quot;
@@ -73,156 +73,90 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, O=
EPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
                             'src/tools/tidy',
                             'tests/assembly/asm/aarch64-outline-atomics.rs=
',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.=
rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs=
',
+                            'tests/codegen/binary-search-index-no-bound-ch=
eck.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-n=
ames.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
                             'tests/codegen/enum-bounds-check-derived-idx.r=
s',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info=
.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs'=
,
                             'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-check=
-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-te=
mp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-internali=
zed.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
                             'tests/codegen/non-terminate/nonempty-infinite=
-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.r=
s',
+                            'tests/codegen/repr/transparent-mips64.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
-                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
-                            'tests/run-make/doctests-keep-binaries/t.rs',
-                            'tests/run-make-fulldeps',
-                            'tests/run-make/issue-22131/foo.rs',
-                            'tests/run-make/issue-36710/Makefile',
-                            'tests/run-make/issue-47551',
-                            'tests/run-make/pgo-branch-weights',
-                            'tests/run-make/pgo-gen',
-                            'tests/run-make/pgo-gen-lto',
-                            'tests/run-make/pgo-indirect-call-promotion',
-                            'tests/run-make/pgo-use',
-                            'tests/run-make/pointer-auth-link-with-c/Makef=
ile',
-                            'tests/run-make/profile',
-                            'tests/run-make/static-pie',
-                            'tests/run-make/sysroot-crates-are-unstable',
-                            'tests/run-make/target-specs',
                             'tests/rustdoc',
-                            'tests/rustdoc/async-move-doctest.rs',
-                            'tests/rustdoc/async-trait.rs',
-                            'tests/rustdoc/auto-traits.rs',
-                            'tests/rustdoc/check-source-code-urls-to-def.r=
s',
-                            'tests/rustdoc/comment-in-doctest.rs',
-                            'tests/rustdoc/const-generics/const-generics-d=
ocs.rs',
-                            'tests/rustdoc/cross-crate-hidden-assoc-trait-=
items.rs',
-                            'tests/rustdoc/cross-crate-hidden-impl-paramet=
er.rs',
-                            'tests/rustdoc/cross-crate-links.rs',
-                            'tests/rustdoc/cross-crate-primitive-doc.rs',
-                            'tests/rustdoc/doctest-manual-crate-name.rs',
-                            'tests/rustdoc/edition-doctest.rs',
-                            'tests/rustdoc/edition-flag.rs',
-                            'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
-                            'tests/rustdoc/extern-html-root-url.rs',
-                            'tests/rustdoc/extern-impl-trait.rs',
-                            'tests/rustdoc/hide-unstable-trait.rs',
-                            'tests/rustdoc/inline_cross/add-docs.rs',
-                            'tests/rustdoc/inline_cross/default-trait-meth=
od.rs',
-                            'tests/rustdoc/inline_cross/dyn_trait.rs',
-                            'tests/rustdoc/inline_cross/impl_trait.rs',
-                            'tests/rustdoc/inline_cross/issue-24183.rs',
-                            'tests/rustdoc/inline_cross/macros.rs',
-                            'tests/rustdoc/inline_cross/trait-vis.rs',
-                            'tests/rustdoc/inline_cross/use_crate.rs',
-                            'tests/rustdoc/intra-doc-crate/self.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/additiona=
l_doc.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/basic.rs'=
,
-                            'tests/rustdoc/intra-doc/cross-crate/crate.rs'=
,
-                            'tests/rustdoc/intra-doc/cross-crate/hidden.rs=
',
-                            'tests/rustdoc/intra-doc/cross-crate/macro.rs'=
,
-                            'tests/rustdoc/intra-doc/cross-crate/module.rs=
',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule=
-inner.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule=
-outer.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/traits.rs=
',
-                            'tests/rustdoc/intra-doc/extern-builtin-type-i=
mpl.rs',
-                            'tests/rustdoc/intra-doc/extern-crate-only-use=
d-in-link.rs',
-                            'tests/rustdoc/intra-doc/extern-crate.rs',
-                            'tests/rustdoc/intra-doc/extern-inherent-impl.=
rs',
-                            'tests/rustdoc/intra-doc/extern-reference-link=
.rs',
-                            'tests/rustdoc/intra-doc/issue-103463.rs',
-                            'tests/rustdoc/intra-doc/issue-104145.rs',
-                            'tests/rustdoc/intra-doc/issue-66159.rs',
-                            'tests/rustdoc/intra-doc/pub-use.rs',
-                            'tests/rustdoc/intra-doc/reexport-additional-d=
ocs.rs',
-                            'tests/rustdoc/issue-18199.rs',
-                            'tests/rustdoc/issue-23106.rs',
-                            'tests/rustdoc/issue-23744.rs',
-                            'tests/rustdoc/issue-25944.rs',
-                            'tests/rustdoc/issue-30252.rs',
-                            'tests/rustdoc/issue-38129.rs',
-                            'tests/rustdoc/issue-40936.rs',
-                            'tests/rustdoc/issue-43153.rs',
-                            'tests/rustdoc/issue-46727.rs',
-                            'tests/rustdoc/issue-48377.rs',
-                            'tests/rustdoc/issue-48414.rs',
-                            'tests/rustdoc/issue-53689.rs',
-                            'tests/rustdoc/issue-54478-demo-allocator.rs',
-                            'tests/rustdoc/issue-57180.rs',
-                            'tests/rustdoc/issue-61592.rs',
-                            'tests/rustdoc/issue-73061-cross-crate-opaque-=
assoc-type.rs',
-                            'tests/rustdoc/issue-75588.rs',
-                            'tests/rustdoc/issue-85454.rs',
-                            'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
-                            'tests/rustdoc/macro_pub_in_module.rs',
-                            'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
-                            'tests/rustdoc/no-stack-overflow-25295.rs',
-                            'tests/rustdoc/primitive-reexport.rs',
-                            'tests/rustdoc/process-termination.rs',
-                            'tests/rustdoc/pub-extern-crate.rs',
-                            'tests/rustdoc/pub-use-extern-macros.rs',
-                            'tests/rustdoc/reexport-check.rs',
-                            'tests/rustdoc/reexport-dep-foreign-fn.rs',
-                            'tests/rustdoc/reexport-doc.rs',
-                            'tests/rustdoc/reexports-priv.rs',
-                            'tests/rustdoc/reexports.rs',
-                            'tests/rustdoc/rustc,-incoherent-impls.rs',
-                            'tests/rustdoc/test_option_check/bar.rs',
-                            'tests/rustdoc/test_option_check/test.rs',
-                            'tests/rustdoc/trait-alias-mention.rs',
-                            'tests/rustdoc/trait-visibility.rs',
+                            'tests/rustdoc-json',
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-attr.=
rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-cfg-a=
ttr.rs',
                             'tests/rustdoc-ui/doc-test-doctest-feature.rs'=
,
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs'=
,
                             'tests/rustdoc-ui/doctest-multiline-crate-attr=
ibute.rs',
                             'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs'=
,
                             'tests/rustdoc-ui/failed-doctest-compile-fail.=
rs',
                             'tests/rustdoc-ui/issue-80992.rs',
                             'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/nocapture-fail.rs',
                             'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/run-directory.rs',
                             'tests/rustdoc-ui/test-no_std.rs',
                             'tests/rustdoc-ui/test-type.rs',
-                            'tests/rustdoc/unit-return.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
                             'tests/ui/array-slice-vec/subslice-patterns-co=
nst-eval-match.rs',
@@ -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and=
-split-debuginfo.rs',
                             'tests/ui/drop/dynamic-drop.rs',
                             'tests/ui/empty_global_asm.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodabl=
e-box.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodabl=
e-cell-refcell.rs',
-                            'tests/ui-fulldeps/deriving-global.rs',
-                            'tests/ui-fulldeps/deriving-hygiene.rs',
-                            'tests/ui-fulldeps/dropck_tarena_sound_drop.rs=
',
-                            'tests/ui-fulldeps/empty-struct-braces-derive.=
rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_acce=
ss.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_acce=
ss.stderr',
-                            'tests/ui-fulldeps/internal-lints/default_hash=
_types.rs',
-                            'tests/ui-fulldeps/internal-lints/diagnostics.=
rs',
-                            'tests/ui-fulldeps/internal-lints/lint_pass_im=
pl_without_macro.rs',
-                            'tests/ui-fulldeps/internal-lints/qualified_ty=
_ty_ctxt.rs',
-                            'tests/ui-fulldeps/internal-lints/query_stabil=
ity.rs',
-                            'tests/ui-fulldeps/internal-lints/rustc_pass_b=
y_value.rs',
-                            'tests/ui-fulldeps/internal-lints/ty_tykind_us=
age.rs',
-                            'tests/ui-fulldeps/issue-14021.rs',
-                            'tests/ui-fulldeps/lint-group-denied-lint-allo=
wed.rs',
-                            'tests/ui-fulldeps/lint-group-forbid-always-tr=
umps-cli.rs',
-                            'tests/ui-fulldeps/lint-pass-macros.rs',
-                            'tests/ui-fulldeps/regions-mock-tcx.rs',
-                            'tests/ui-fulldeps/rustc_encodable_hygiene.rs'=
,
-                            'tests/ui-fulldeps/session-diagnostic/enforce_=
slug_naming.rs',
                             'tests/ui/functions-closures/fn-help-with-err.=
rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.r=
s',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs'=
,
                             'tests/ui/process/process-sigpipe.rs',
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI +=3D &quot;</a>https://static.rust-lang.org/dist=
/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=
=3D${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;p=
atchdir=3D${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-rel=
at.patch;patchdir=3D${RUSTSRC} \
+            file://cargo-path.patch;patchdir=3D${RUSTSRC} \
+            file://custom-target-cfg.patch;patchdir=3D${RUSTSRC} \
+            file://rustc-bootstrap.patch;patchdir=3D${RUSTSRC} \
+            file://target-build-value.patch;patchdir=3D${RUSTSRC} \
 &quot;
 SRC_URI[rust.sha256sum] =3D &quot;b98c09d968529212fb29eec7d6d3e9bdaa869810=
679b7fb86a1ca69469d75f5e&quot;
=20
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------j9T0xsByHeuQrzusCqfbMHg7--

