Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CDAC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 20:45:15 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.3281.1654289108443754588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com
 header.s=pps11062020 header.b=NV4oVXrM;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=3153a541b2=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2534vk68002952;
	Fri, 3 Jun 2022 15:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=Mm9gEfwoh8+q4Xm7qXMBjHTmK3F7pwouyijo1yFApao=;
 b=NV4oVXrM4d0wzd3AAtqQK7OyFXkqu15mqE34+rLuSaANG/k8Atbis7oMFCHePBZfVuaU
 HiXdHwqmyPHadZtSnYAuCdwAemKmHaO5nB9xP/UO7seAPlgwmULBRSGXdPjX2j6tk2MT
 +tw8mn/i/SJ9As+KgD9R8v3Wcr/Rr3eO+g64DrXIcPisAO8B6eSGEf80Fe8SEHbpZ2zU
 fmo/qsc+ZxqDRiQV7yXO168h/A8SAM9M8tuJupDx0XRB7S4Tr4CJS1+PIxLbfRp2pMjk
 wviFv1haa4x3tbUqboiG/zs+0QCwj7D+tR6RtNhSXhXuSdmeTmRSb31ylf9SolubUUNX xg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3gbhj6awtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 15:45:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvmgYICC55vxA5dzmY88EJackh+16r8NM9Yh3uNipeUhp9V9zHMPR8jU9PiEVEL6Kj564qS8WahgrAVGIrC/YsxYMOs3/sUBDtJ0qyalVn2LoDYlM03r51qzGLjZ5JDWwKTtApa76n4qXrWn1Px6wM4puAHHPnWb6taQQalMAnZ/a/QxaRyebZ9GQb/mwavE8FCB9+sgsLW1zJwvax9XMb7bBVNl5FKj9D4i2+gjCnPRiIMkyDf7RddL/BmPw1g5S9xaf4ul+/Eo04ae0ecKxete3NnDOM6F+l9R4Dob/8H8pV2qFK5wFDEBu3A/2+6TFdQSA9sqwdcHrrWENBXHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm9gEfwoh8+q4Xm7qXMBjHTmK3F7pwouyijo1yFApao=;
 b=XrcZVi+xhEnNh3e4Yd0VzNY+J3GIluDl/tkP7Hf3pvKDNjwTJnwFP/+W9q9k4GoztwR2zjc+c4xf4/BHBCc4np7uFGo/3is00W65eP3xfaKh09XlthtaCBd0dc2sz/+mpiAd2UVYqYT5aEP3XGjLcrefZfvWhiWCsrUclm7yC8IkUWLPXRvy+Dup0B2AbQFU4UdY7p1ylskJfmxm60/4iyQpdWMaVgsVwN+CYpv0ZGq7jI94bk+fVAIt7S92jcoeTbP5+SyolhgDdV5CL/1wAfVc1zsXaS4vNB+cFAmB/jVL9QHWYzotQ0VtfNvhGp2lQDT5w1kRRMK9/VPKUeBLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm9gEfwoh8+q4Xm7qXMBjHTmK3F7pwouyijo1yFApao=;
 b=ouoA+GFKL4I3/aGyB6X6D1zPL+Ax5YJvGvCi96K6aFYqyBvrg34OUTNNgg+VnXGdsgD42WWBO5p9njacu/UYTudKqZOZALQUkpTGXJQbnDRPWqka3inMSkfR9AWDAfM+LCqvFF4JmbH+O6BZq+JBFM7gSDxIm+NcDZ9bjURZQhE=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BY5PR04MB6817.namprd04.prod.outlook.com (2603:10b6:a03:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 20:45:05 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a%5]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 20:45:04 +0000
Message-ID: <a1dc7d51-e3fd-c70a-6eda-683525dc8104@ni.com>
Date: Fri, 3 Jun 2022 15:45:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220603200317.385216-1-alex.stewart@ni.com>
 <CAMKF1srVLKrQ4m2u_yfDRi2vuXcHKVfjt3cvj9mbiu82_8J8JQ@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CAMKF1srVLKrQ4m2u_yfDRi2vuXcHKVfjt3cvj9mbiu82_8J8JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22322eaa-238f-433e-a50b-08da45a1eff2
X-MS-TrafficTypeDiagnostic: BY5PR04MB6817:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR04MB681734F898D3F0C903601EBFFEA19@BY5PR04MB6817.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	htbotvy6elUZmN6hlOXWia1Khyis+UOnPF+fAMxOfso8lPL7RFaN4P2j3WXEW5jxzAlD5Lrs4ShkOOHJtgi52LmMBpUsXkiYVzqNobH97p1Iaw9Wft15i14ZictcAVQI4llwy0LESe23Eoc7NhNrjixRp3QPLRMqAXllWQea3JzUt6l0XUXBYcTl3Jcvnhn3EBvs/cu37tR+WweCizRZAdKVFm2xkiNuZZNyHrBfe/e8dWEjxlGykf6aPtpEdd9lzQNlE8dwLyDoWQnVlUHsaxEn+ET/cq6VoD91Cso2anKsq6kfPxg1jw7iBRMl6g4QERFe+EbbsTbTUHTPtlF5XJSgiub6nlMCcs+seBgDcDHhma5jY5+gpxXOaRZH+SFdGO/+nypqxHyKizi852q1NbXaNlHJ6ISu2MJOWE5NaN6wESQ/gX3kpdNuNPBRW3KLpS1/gGqRNyI/7qjPeABNPGvOcpz9Iax5EPuMvxu+vWy0tBxAg0sdRr72qEFkXEX8/AhioYw4eQzxGS6HaRraCp1p25TiU+fjPCr29I/b02p1vjnWqEn1f7nT9jJB17sDJT0OhjMeQFK3HMah3zskO8HxymzzH5a3VyoQdl2uhXGYNfC2hZ2g/VhT0siAslR6HGaYqRKYQ1dWtERssX80Yhh2YoCscinmwWLzYxzUrREy9iZIXS+H19ksc/owVxe2UVp3lK1Qb/OCQTYnVl4e+hplhHf5a0BBTYv6Mdl2QqJnZl7ugwoTG+Y5P7eIirvB6IZUfOD+CVlpAMKU6Dh92m0FjDsLfFfpPHNxYfKQKDOI44x9GInHjdLva3josSDN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(5660300002)(2616005)(53546011)(966005)(6512007)(508600001)(186003)(86362001)(36756003)(31696002)(6486002)(31686004)(36916002)(2906002)(8936002)(38100700002)(6916009)(83380400001)(26005)(6506007)(66946007)(44832011)(66476007)(4326008)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDV2OUpkbmNvZmdpVi9pNmpiTk5VejJSclJmaVp1c3VSdC9OdFFRTEVLaWVy?=
 =?utf-8?B?azVlUmlOdlZFeDlZaHAxT2VDL2JjU1dvdDFEM2NoY1Ura29zcWlnQ2pXR0J2?=
 =?utf-8?B?WnlrVFY5TU9HdjU3ZVVHb2hneG5sUnMvQ005LzgvRWx0R1RxcDhOMjVTcG42?=
 =?utf-8?B?M0F6dkhJNm0zQm9sbkplb2pMZDZqUyt3dXFjczdDU2d3ejRyeDM0OWNzbUJW?=
 =?utf-8?B?UGxaSVFtMU4rNGZzbENxZ2tNYzluazB0WU5XQkhMSXdhdnZ6NUR4SU5Qd0Fm?=
 =?utf-8?B?NUlNWFdOMTY4djAyZHNidThzcGJod3Y1NmFoZHJSVUZCQTYrUndqNHlKV1B4?=
 =?utf-8?B?RDNHR3JLY2pjelBoQmFoTE9pK0R2L0M2Z2NGYkx5dWR0NnNPb29qblN6bENu?=
 =?utf-8?B?NUlHZkN3aG5WTGJLRHVUelMzTWtMUHdrZXNGOE5BVktsQjNXeXZZc1VoTXM5?=
 =?utf-8?B?eG9idnhjd2ZiM3JEdFJWT1Z4RUxwQ0ZrMm1IbmZMeFVvM2ZjQjJ1alZjakUy?=
 =?utf-8?B?dzNrSjdSUmhtU2phUjUxdEUrYlc4TzNTQVYvNTYySTlxNC9IZzQycDNla3h6?=
 =?utf-8?B?RmVkTDhtbEJ6aUpITTU3ekY2b2dYczhQQmI1S1pYZUxtUG5hY1V3TWNtOXFl?=
 =?utf-8?B?UWw1STFobDBmUFJVWjUvN0QzU3RZa094allBR1MvK2xXblRocGJ0UEZLN01w?=
 =?utf-8?B?dGx3V2haTmpnTklSdkVISlA4K3YzdkpNaWwxUS9pd3BIcHRnenVxdEVjM0Y4?=
 =?utf-8?B?T0MzcHl2bTNPQkRrK0VRSUlrTmt5WEwvUFd2RHIwOG1WNWZrYjZDb3NRaWpU?=
 =?utf-8?B?VnliYmhvdUM5WDU5Rko3emFzei9tSkMzR0lBOEx5aUMwNll4UDk2bTRnY1Ra?=
 =?utf-8?B?TVRSYkIxcnd1QVhuL01tM1dQQWVENlZHdTNXWlNGVzNzSVNiRlFsRUlVekxy?=
 =?utf-8?B?aS9vWTd1VkEzd2tJWWllc2JxUWU1WEI3T0VlRmEwZFRWOWlvQzFnTGtJbjIr?=
 =?utf-8?B?NHg2WmxVMUNqMzZJVXJxSzhPOEYwMVQ3TG9JUGFTVHVTeFhvQm5tcHp3VU9X?=
 =?utf-8?B?L0RMTkVRUFlWREY2cFhtaHJ5NE1vSitmQW5oMlY2Sm1KVjV3TnN5YUhIUEwr?=
 =?utf-8?B?TlpmaXJ5SGk5M1dPY3B3VlVuVGtyUlVYZFFFMkg3M1VyTndHZTk3T1JTSXlI?=
 =?utf-8?B?Q0VWN01wSFBGd2NJeUxvRlNFaE5vTll4RlZnbkhQblVJQm9Ya256TWovLzFY?=
 =?utf-8?B?Z2h4SHo2aTNKTXhRZ3J3eDNnNWhocjB5SC9ZYUJYYWZ1NWlyWEc2WFdHZWU4?=
 =?utf-8?B?TEMzNGxFdVRwMEI1ZkIxMnRGZHQzSkdqVWtBeGFyQ3pYWkl1VC8yUVh1UmVR?=
 =?utf-8?B?VWJRekMralNBYVVLZUREYm5Kb2t0N0FjME4rQi9sMTZlVElXUTFJK3JFbXox?=
 =?utf-8?B?WWM1Y25WTXdyR1IzRHQ5RGxTc3BrSzA4aGVWd2EveldDOUVGbVowVkkwS3Bt?=
 =?utf-8?B?V2dZT0hBVTQ3azJaR2k3MFErOG9SNGMvalBMYklWdmhucFFnS2JoYUdMMVIx?=
 =?utf-8?B?RDE5cnRzRFJBMENwWmNjOGtPWktreXhyTW9QZ3NUdmVjTWRPMUNsck1vSGpK?=
 =?utf-8?B?NkRmU09vQk9Ic2p1ZTFnZDMrUGRlSXoremNKeUZ1WS9nZjlHMkhZZUtlNFJx?=
 =?utf-8?B?ZUhiNGt2M2hRMGpvM2hja2xydTVrWnM2anVYQzNiTGU2UmMva3VYS20yVVlN?=
 =?utf-8?B?N0hEd0JvbysrUUkvNnNEMXJhMXhsRnZtb3JuNHF1MTdVV2o4R2pHRUIvZUJw?=
 =?utf-8?B?TnZ3UnJzY3B0QU1BRENOY0tjT2hrQWtGREI0RU15NlBuSDVyZjBlVFQyVmxT?=
 =?utf-8?B?RnVnZWpGQkczRnNndTNuOGYwTDVUcFoydnZ5VlJwTzRSVzQzVXFITm1Nc1VM?=
 =?utf-8?B?ZUZPMU5uQis2RFFLNkd2UkZPck81MXA3ZVNOWVYvZ0J1NGR2NFJsa3dPWFhN?=
 =?utf-8?B?YlV3ZVY2WmxKaE9Zb2ZkRHdKemVDc1ZZSzJob1k5OGJnT3FzbWFNTUdud0w3?=
 =?utf-8?B?elpGWEZaRHpEU1hWcHpyS0krT2VxSjNySDdZUmdScDZjNW9kNW1jL3dpNEtu?=
 =?utf-8?B?NFNIREpGVGg0NU1wNFFYNkZHbnNQVGIza3lkd2NaRFFnQ3FkQW9kUmE2L25I?=
 =?utf-8?B?Nk1uR3VvNElTNzJwTFROK3h5WE1rWExPY2ZGZFFYNk5yUzkyUi9sTDdzN3BY?=
 =?utf-8?B?UnFyNlN1ZXVBTjRudDg4QytjcWJuQk0zNUlrS0p6eGcyeDBUZlFjeXVUOWlX?=
 =?utf-8?B?K1EwZ2tuNXNLc2t4MHFrNE9Sc3p5azZSTCs5OURDMG00MHl6KzdNQT09?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 22322eaa-238f-433e-a50b-08da45a1eff2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 20:45:04.5772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QYtLU4Edq2H3wwe/qvh1vzYU0Q23HErD32eT97AYx5D333dgXuVudHgctGovsyXroCZRRxzXRT5XSe9ntE0TuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6817
X-Proofpoint-ORIG-GUID: gccgagLihKRKO4HNmU7osh6Xr6QIiM-A
X-Proofpoint-GUID: gccgagLihKRKO4HNmU7osh6Xr6QIiM-A
Subject: Re: Re: [OE-core] [PATCH] opkg: upgrade to version 0.6.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_07,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 mlxscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206030081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-00010702.pphosted.com id 2534vk68002952
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 20:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166525

Here are the release notes from 0.5.0 -> 0.6.0.

http://downloads.yoctoproject.org/releases/opkg/opkg-0.6.0.release-notes

```
Release Notes for opkg-0.6.0
=3D=3D=3D=3D

### Changed
- When using package signature verification, the signature file is now=20
only downloaded when (a) it is not present in the local cache or (b) the=20
package file must be downloaded again. This makes signature verification=20
more reliable in cases where the connection to the package feed is=20
unreliable, or stored on a removable device that is not always connected.
- Package `pre-depends` are now recorded in the opkg `status` file.
- Package `pre-depends` are now considered when removing packages. Opkg=20
will now (correctly) fail, when the user asks to remove a package which=20
is a pre-depends of another installed package.
- libsolv will now return a solver error if the user asks to install a=20
package which does not exist in the feeds.
- The `opkg search` command now prints a newline character at the end of=20
its output when the search path cannot be found - which looks a little=20
nicer when using opkg interactively.
```

I don't expect these changes to directly impact the normal OE build=20
workflows. But they do resolve some corner-cases that yocto community=20
members have brought up in the previous 6 months.

On 6/3/22 15:30, Khem Raj wrote:
> What major changes does this change bring
>
> On Fri, Jun 3, 2022 at 1:04 PM Alex Stewart <alex.stewart@ni.com> wrote=
:
>
>     Signed-off-by: Alex Stewart <alex.stewart@ni.com>
>     ---
>     =C2=A0meta/recipes-devtools/opkg/{opkg_0.5.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyG=
RaxSW$>
>     =3D> opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk51=
9KcS6$>}
>     | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>     =C2=A0rename meta/recipes-devtools/opkg/{opkg_0.5.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyG=
RaxSW$>
>     =3D> opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk51=
9KcS6$>}
>     (96%)
>
>     diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyG=
RaxSW$>
>     b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk51=
9KcS6$>
>     similarity index 96%
>     rename from meta/recipes-devtools/opkg/opkg_0.5.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyG=
RaxSW$>
>     rename to meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk51=
9KcS6$>
>     index
>     e91d7250bc9f7fde73395335f008108578515b77..7b351e81231df48b2c493542a=
00d95911606248f
>     100644
>     --- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyG=
RaxSW$>
>     +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7=
LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk51=
9KcS6$>
>     @@ -18,7 +18,7 @@ SRC_URI =3D
>     "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar=
.gz
>     <https://urldefense.com/v3/__http://downloads.yoctoproject.org/rele=
ases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!t7LQ5T=
n2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkxvKubI=
z$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \
>     =C2=A0"
>
>     -SRC_URI[sha256sum] =3D
>     "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
>     +SRC_URI[sha256sum] =3D
>     "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
>
>     =C2=A0# This needs to be before ptest inherit, otherwise all ptest
>     files end packaged
>     =C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because def=
ault
>     --=20
>     2.36.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#166522):
>     https://lists.openembedded.org/g/openembedded-core/message/166522
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/166522__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRR=
FZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk4U_MoD4$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/91528903/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9152=
8903/1997914__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rw=
rB6gpBuMnECUpqAP96zc8Kg8tRrk0VgFDB8$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcn=
DNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk4RxujTf$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


