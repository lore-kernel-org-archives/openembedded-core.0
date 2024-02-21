Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E3CC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 08:00:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8414.1708502436157791713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 00:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=XxVvz2Jf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2781e5b91d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L78np9013830
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 08:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=h6pxrcDgiGD7tBKTogq
	9elBVkA31Hf7gyPmLAJumMp0=; b=XxVvz2JfAH5/jCIPKt56Ofci49JiO/wDt+W
	cR46xbATAmUzuBwPKk3hI6bFcdMQDtvT44O7G19K1+pR/22uIlXT0uWMvKD/M2Ua
	Tdf7NmCBKw0ONnyrV48uNkOKgRzUhOmc4wQoeVSLSUWK7VjVEEbtldWD/BHuXv1Q
	U6R1FZ2HctBvsMVcTY8YbIO+16aDxpwAau08ZfQ9tSoMKBqnEmgPsyScICmspZe6
	9asEtGfzSk7XhVcydI6UBjRQNPW0XgZwdntOmwrc+s9h0yV5CIvA4WIQIoPyevys
	sXrrFaleRtlMXV3rduLOYM7COeL4h0YrJuDQrZdRQXDttDE3dpw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd218gha0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 08:00:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41L80Y3v021738
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 08:00:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd218gh9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 08:00:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqsyynX+SWBiinm8Hw2drho+Y/CXjoBv36oqjrh8vqh3v8rgpXJ2axBB1ft6tYAUvRV3G2Cpl1XYybuu3+INqa6bnLItnI6S5RJkhVbPomYDJhIH3nqnc69Q2AqufUAh9HXVTmKx+Z0qyoLPmA38mG6jhcsmk/myxFzbEKS0ZKUrJ0VOLtwZt0JfnvygkJNAix4MyTXcCbOTDG1K3PBNiIUxRA5OEkVVLy3bnSjMZYzVtBA0AZjxZ7RSRbNacI1oLFoFGIi/yBhaSh6xf8mvw40Y5aYmd09HETG2YQVHQ94JVGzbXI9R/u1JhKVDPWL0uKNQxmEZt/FmlgZzJZwI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6pxrcDgiGD7tBKTogq9elBVkA31Hf7gyPmLAJumMp0=;
 b=EkaUKm9G62USbnedMJeHTg1zNBgk4mripSI2xdWRm6JQuA04Bx3xkJkEEXmf/oUzNEbXIZtSTKcoaJc9gBpgoEmnDkXlA8ycS+DOcqMlpvji7vXtF1rr+cYce99yog+c9LUqR0zKnwZ+ntomCqIbZDbcNmfXGENNhEWLaxPTpzqZhcoxgENBvnl9ZeYosXJ07uX7PUs+qqDll3HNHjgrrGTTcRj+/qT5HUpWzsMoGQRl08gouDTvaJKCVWRzsHPucSrJUdoz2pJLDsEWvBaD6A7AOVhSeM3GDINL4C8woUBvmd+JRV3bAHHEigNEW9tiBIaqYOD662DpNRb52vYg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 08:00:30 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 08:00:28 +0000
Content-Type: multipart/alternative;
 boundary="------------LJlHklXmpToj4NcrQFyxl7w8"
Message-ID: <3e26d31e-b8bd-4549-8c04-540dd36c2f69@windriver.com>
Date: Wed, 21 Feb 2024 13:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Oe-selftest error log on console when it fails.
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Joshua Watt <JPEWhacker@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240213130404.3285564-1-Yash.Shinde@windriver.com>
 <0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6422d0-bdc7-4082-3285-08dc32b32b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uGIR6uPvgKj/f287Mrej/tLVaCnVc5S7gKFVKVdCvXMG6xLIiLgoop6Oycq+gmkx00NwrT8PDoIJaVYjf5n/mQQjHeh/axStPTWSAf85LZUzdo8tietLloiY9Lu4wGvxJzdoQivIlVykl2E7mrVt22pb7RSPX2IsbliGeP3puN33mGqcM3BoGJv1135rKqsvjykFpeT1TVaxzGAv4yUpnM7nV/mz3SjnD0mXQCOIC7OJObAiuP4jhWAJiumNzPGXZu8LZkIsIX4B4sOD9p86nFiDoHSQG0PRP3gaO6WaMK8Xcvr+hkENdBZzhEYNdotUx7T3BqO/BawFvDvTDpqkin5HPUwjHEvCts8QH+TYTNKFVK+P5bv97Y6Tfe1xYSlSQ8/CwPlTa8S8XkCYE0yxAeyE42nyn4Fad2mx5pjzR7+SToC6eamaL6XLOlT8zU/tGmbtTRqS+0GO7jwpXFCoC75+thlyyyGMfpWdNmBFsoSXEFujbhqB7ZkSMtioEoictf7yMwbVp4YnP5uy5b/dNTnsXIwKrtRzFmXFKO03lsw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXFoSHNWNTZUNUE3SUlLenFIS1FkTFg4bUF6MG01aS9vbEdTMWhiZDE3aUtk?=
 =?utf-8?B?Qm92YXB1UWt3dTFhZDltaXJUbHFlUWdGYllVdTBNSmpLZEd0bmJoNVpBSzVx?=
 =?utf-8?B?V01PczM2YUU0QXRScnJHQlFyeVJmYWdaVGw4NXBUN1JuUngyVDNtdjhnQUUx?=
 =?utf-8?B?Q25wY1lDNjM3N2liM1o1OW95S0srUGpUcEFOempBWHFlV1IzZXNaQWVWdkFR?=
 =?utf-8?B?MG5mOXd2R1dRVEhpSzVGeWRldzBLZldUMHpKUUw0L0tTWTF5dGZucmpqMjBX?=
 =?utf-8?B?djViME80SHRxUkVkTDF6S1I1d2R6aC85RkdiakJ5RWtGTGRLSXhMc0ljMitm?=
 =?utf-8?B?bTE0c0dsMzZVOHRMb3dnQ2J4dlhaVjJWUkl4VnlQTFkwcVZHd2RDQWI3cGE5?=
 =?utf-8?B?UkZ2d01CVXJMYnVHV3Q0RGRraWJrWDNLQVVWcXpyMnFOQ2s4Qjhad2FrOHNs?=
 =?utf-8?B?TFg2MmE0Z1RhTklTd3dGT29PUXFWcUY0bis1RCswTVJiNkZ4Nk1VOWR4OHFS?=
 =?utf-8?B?dW1KdkxYekkyTHpRdkJKeDBuaHZPeS94dnVYL1F0L3RHZGdHV3RBRXdZQm53?=
 =?utf-8?B?U2tLNnMrUDVtd2cvS20vWG9OMmt1ODUxeWNRVkFYMTRBUUdtMFkxVEQvUERG?=
 =?utf-8?B?NFVIQjByalpKZlhCL0dDdHVFOHNwaWluQ1JFcDlHNmVzVG9iM0NYWEZzcm5X?=
 =?utf-8?B?RVpxWHd4QXhzVWwxbDdNMUpOZzd2MmFZN054Y1RLbGVIK1R5eGNuZmpidWdj?=
 =?utf-8?B?Mm5DTElxQks5TVZEdHV4TXBvaDdpSnpZeFp6WENrelR4bUFwcHh1cWtnUFdF?=
 =?utf-8?B?VkZNQXdCRnZVSHNiZUcyUWdvTUE2bSswUXB1MFJUdTAwaDhGSXp2WEJ1cHNm?=
 =?utf-8?B?YzQwZXNQSVVZckJZck0yVG9GQ0ZZL1YwYkpYcnkyclRZR1hVcGU3VmczeWZn?=
 =?utf-8?B?eE9lNjFqTVlKcFM2cWlKRzBFZERtTEZQYWJ6T1ZNM1grTG9XeExSWW9rbytR?=
 =?utf-8?B?MStXK3RaRmppUkErL1phQmV2dWZiaXpDbWlWdjkvVHJoNEwxaE5DTFFXbDVz?=
 =?utf-8?B?SGlrYlk0ci9uQmZYTTE4dm1HaXh4VkhtbWpCZFB2SE9ER2Y2TlJZZ0RKQzdm?=
 =?utf-8?B?WFhtUTE1bWM4UTJmazNtMUFEaXZmMXc4K0E3d1dwOVVQZFVjeXlSaFlJOEgy?=
 =?utf-8?B?ZGE5OTRtUS9maElObGh4bEpKMk5DYktYMGd0c2Y4UzRYRVhaaENiaWN4ajBF?=
 =?utf-8?B?RERRY1J3RjRpenA0RmQybUUvT3FvSHYwLzNCTjVPdmpRaTYyR3RBMlF5bEdH?=
 =?utf-8?B?ampieWtvWUFJdVhDSks3QUk2WmljOGliN1FudGJRVW5iS3BVRlRvVS8wdm9q?=
 =?utf-8?B?RkF5TnFRYUJNdFZ4RzFJVEk2OWlVV0xyR2M5NEZhVEdJMFlJQWlhdjVnRjk4?=
 =?utf-8?B?bEdRcVZubVZxMVVPQ1VrWEwxbC9sZUNrbEo2K25xcVg5dk5aaDBpSFlsTHZ0?=
 =?utf-8?B?YXUxNEVTNTVUYkd5TEQ4RTlXZ0xLaGEvdU9yUzVuSGx0a2RrbTQwU3ZyeXQx?=
 =?utf-8?B?TG5xdE9uN3NkL1pwNlA1YzRsVFMzQXk3a2RlUUZKSDVaTkRTbkt4Qjk4bHIy?=
 =?utf-8?B?NnE1eTEzWWp2cHlwOW5oYm42cGM5MUFCbjNoM1drc3U3RkkrbHpmbUJrTm9i?=
 =?utf-8?B?YmhFR0JKZ29FRTd0bXhFRHFtT000YnVVS3lBcGFpYXVyaEtqRWkyMUZRRDdM?=
 =?utf-8?B?b2pndWVzMlgybHJkYy8yRXpLWG5aYkRJY25mWmJ5cW55L1dWdEphbHVkckIr?=
 =?utf-8?B?aFEzdTMydDdkS3JSUUh1TkV1QVpNeWUwTzhVUEVZTytwV1RUNHpWZ3BtdFd2?=
 =?utf-8?B?a0gzSDlHeS9SU29CRy9oaDB0d21PcFBIOGN6aEw4MWJkNzU5d25TQVhxYk5X?=
 =?utf-8?B?UzY2aG1NR2EyR0QzUXN0b0JHS3Z1blZDZ3VnbURwK294NVkzcDIrOFczRVRI?=
 =?utf-8?B?aWJvTlVmZmg5N1paVmsvOEU0U3g0eExJaUZ6dllIeXZrbzkyeTd4b1JvUHU5?=
 =?utf-8?B?QWxVblhHZmlSKzQrcy9DcHVGc2dYdVdoZVFtSCsxNHJ0c1BOdkh4emxRU3Jz?=
 =?utf-8?B?ZjVEdkRFb1NFKzZIbkZHQitkVWptZGUxUjRSM0hzU0NyZDh0azgvT0o2ZnA4?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6422d0-bdc7-4082-3285-08dc32b32b40
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 08:00:28.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k34NG0+8ubhT2doIPBsaOdhJIe1fCbevdcrPn+JY5iDOZ8S4DaGMTk5gxLcQxQrsP1/n7ibn7uaIJMKfO00+gKIRgHIvyfiwuaApcKDSoPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
X-Proofpoint-GUID: 1ZCG2WN5NyammWrW4BFNb7iiXrK4YmSH
X-Proofpoint-ORIG-GUID: Nwie0GdnuEqPrV7_r1hMghxyYMkl97J5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 08:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195963

--------------LJlHklXmpToj4NcrQFyxl7w8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41L78np9013830


On 13-02-2024 23:42, Randy MacLeod wrote:
> On 2024-02-13 8:04 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> The rust oe-selftest output error log doesn't show any information on =
console when it fails.
>> The following changes emit stderr logs in terminal along with re-direc=
ting stdout and stderr to "summary.txt" file.
>>
>> Changes made::
>> - cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --=
target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
>> + cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --=
target %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddir, testarg=
s, targetsys)
>>
>>> summary.txt:                  Redirects the standard output (stdout) =
of the command to a file 'summary.txt'
>> 2> >(tee summary.txt >&2):      Redirects stderr & stdout to summary.t=
xt & writes stderr on terminal
>>
>> The overall effect is that both stdout and stderr are captured in the =
summary.txt file, while stderr still being displayed in the terminal.
>>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/self=
test/cases/rust.py
>> index 164ad11ecd..07f1b5706c 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -213,7 +213,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>>               cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-target=
s;" % rustlibpath
>>               # Trigger testing.
>>               cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";"=
 % qemu.ip
>> -            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py=
 test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsy=
s)
>> +            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py=
 test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);" % (buildd=
ir, testargs, targetsys)
>>               runCmd(cmd)
>>               end_time =3D time.time()
>>  =20
>
> Hi Yash,
>
> We talked about this change and decided that it's just too odd a shell=20
> pipeline to merge!
>
> Also, it depends on the bash shell as you can tell by pasting:
>
> =C2=A0=C2=A0 #!/bin/sh
> =C2=A0=C2=A0 python3 src/bootstrap/bootstrap.py test %s --target %s=C2=A0=
 >=20
> summary.txt 2> >(tee summary.txt >&2);
>
> into https://www.shellcheck.net/ . You'll see the following log and err=
or:
>
> $ shellcheck myscript
>
> Line 2:
> python3 src/bootstrap/bootstrap.py test %s --target %s =C2=A0> summary.=
txt=20
> 2> >(tee summary.txt >&2);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^-- SC2094=20
> <https://www.shellcheck.net/wiki/SC2094> (info): Make sure not to read=20
> and write the same file in the same pipeline.
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^-- SC3001 <http=
s://www.shellcheck.net/wiki/SC3001> (warning): In POSIX=20
> sh, process substitution is undefined.
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0^-- SC2094 <https://www.shellcheck.net/wiki/SC2094> (in=
fo): Make sure not=20
> to read and write the same file in the same pipeline.
>
>
> The YP goal / requirement is to avoid bash dependencies since user may=20
> be using dash or some other shell for /bin/sh.
>
>
> I think that the command is being run locally (not on target), and we=20
> are already in a python context so
> it seems that we would have a simpler solution if we handle the IO=20
> redirection from python.
>
> Perhaps Richard or Joshua can recommend some code that you can=20
> reference when making this change.
>
> Did you have time to look at the log file handling in runCmd()
>
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils=
/commands.py#n168
>
> Please do some analysis and reply here every day or so as=C2=A0 you lea=
rn=20
> things or have questions.
>
>
The runCmd() returns the 'Result' object containing information about=20
the command execution. It has the following attributes:
 =C2=A0=C2=A0 result.command =3D command
 =C2=A0=C2=A0 result.status =3D cmd.status
 =C2=A0=C2=A0 result.output =3D cmd.output
 =C2=A0=C2=A0 result.error =3D cmd.error
 =C2=A0=C2=A0 result.pid =3D cmd.process.pid
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/c=
ommands.py#n198=20
<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/=
commands.py#n198>

I tried to capture the return object value (stderr i.e result.error) and=20
print it to the terminal, but that didn't work as expected.
Even I tried to print some debug statements in rust.py file and it also=20
didn't show up in the terminal or in the summary.txt file.
I assume there's something in oe-selftest framework that doesn't print=20
statements directly.

Also, I see there's a "output_log=20
<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/=
commands.py#n198:~:text=3D%3D0%2C-,output_log%3DNone,-%2C%20**options>"=20
parameter in the runCmd function parameters, which I understand is used=20
to redirect stdout of the
command being executed. Currently, I am checking with different values=20
by referring to other oe-selftests and their corresponding behavior with =
it.

I am checking with some functions and procedures from unittest and=20
subprocess.Popen frameworks to get the error logs:

https://docs.python.org/3/library/unittest.html
https://docs.python.org/3/library/subprocess.html#subprocess.Popen

Regards,
Yash

> Thanks,
>
> ../Randy
>
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------LJlHklXmpToj4NcrQFyxl7w8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-02-2024 23:42, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com">
      
      <div class="moz-cite-prefix">On 2024-02-13 8:04 a.m., <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:Yash.Shinde@windriver.com" moz-do-not-send="true">Yash.Shinde@windriver.com</a>
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20240213130404.3285564-1-Yash.Shinde@windriver.com">
        <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com" moz-do-not-send="true">&lt;Yash.Shinde@windriver.com&gt;</a>

The rust oe-selftest output error log doesn't show any information on console when it fails.
The following changes emit stderr logs in terminal along with re-directing stdout and stderr to &quot;summary.txt&quot; file.

Changes made::
- cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s &gt; summary.txt 2&gt;&amp;1;&quot; % (builddir, testargs, targetsys)
+ cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  &gt; summary.txt 2&gt; &gt;(tee summary.txt &gt;&amp;2);&quot; % (builddir, testargs, targetsys)

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">summary.txt:                  Redirects the standard output (stdout) of the command to a file 'summary.txt'
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">2&gt; &gt;(tee summary.txt &gt;&amp;2):      Redirects stderr &amp; stdout to summary.txt &amp; writes stderr on terminal

The overall effect is that both stdout and stderr are captured in the summary.txt file, while stderr still being displayed in the terminal.

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com" moz-do-not-send="true">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 164ad11ecd..07f1b5706c 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -213,7 +213,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + &quot; export RUST_TARGET_PATH=%s/rust-targets;&quot; % rustlibpath
             # Trigger testing.
             cmd = cmd + &quot; export TEST_DEVICE_ADDR=\&quot;%s:12345\&quot;;&quot; % qemu.ip
-            cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s &gt; summary.txt 2&gt;&amp;1;&quot; % (builddir, testargs, targetsys)
+            cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  &gt; summary.txt 2&gt; &gt;(tee summary.txt &gt;&amp;2);&quot; % (builddir, testargs, targetsys)
             runCmd(cmd)
             end_time = time.time()
 
</pre>
      </blockquote>
      <p>Hi Yash,&nbsp;</p>
      <p>We talked about this change and decided that it's just too odd
        a shell pipeline to merge!</p>
      <p>Also, it depends on the bash shell as you can tell by pasting:<br>
      </p>
      <p>&nbsp;&nbsp; #!/bin/sh<br>
        &nbsp;&nbsp; python3 src/bootstrap/bootstrap.py test %s --target %s&nbsp; &gt;
        summary.txt 2&gt; &gt;(tee summary.txt &gt;&amp;2);</p>
      <p>into <a class="moz-txt-link-freetext" href="https://www.shellcheck.net/" moz-do-not-send="true">https://www.shellcheck.net/</a>
        . You'll see the following log and error:<br>
      </p>
      <p>$ shellcheck myscript<br>
        &nbsp;<br>
        <a class="linelink" moz-do-not-send="true">Line 2:</a><br>
        <span class="sourceline">python3 src/bootstrap/bootstrap.py test
          %s --target %s &nbsp;&gt; summary.txt 2&gt; &gt;(tee summary.txt
          &gt;&amp;2);</span><br>
        <span class="info pointer"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^--
          </span><a href="https://www.shellcheck.net/wiki/SC2094" target="_blank" class="wikilink" moz-do-not-send="true">SC2094</a>
          (info): <span>Make sure not to read and write the same file
            in the same pipeline.</span></span><br>
        <span class="warning pointer"><span>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^--
          </span><a href="https://www.shellcheck.net/wiki/SC3001" target="_blank" class="wikilink" moz-do-not-send="true">SC3001</a>
          (warning): <span>In POSIX sh, process substitution is
            undefined.</span></span><br>
        <span class="info pointer"><span>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^--
          </span><a href="https://www.shellcheck.net/wiki/SC2094" target="_blank" class="wikilink" moz-do-not-send="true">SC2094</a>
          (info): <span>Make sure not to read and write the same file
            in the same pipeline.</span></span><br>
      </p>
      <p><br>
      </p>
      <p>The YP goal / requirement is to avoid bash dependencies since
        user may be using dash or some other shell for /bin/sh.<br>
      </p>
      <p><br>
      </p>
      <p>I think that the command is being run locally (not on target),
        and we are already in a python context so<br>
        it seems that we would have a simpler solution if we handle the
        IO redirection from python.<br>
      </p>
      Perhaps Richard or Joshua can recommend some code that you can
      reference when making this change.<br>
      <p>Did you have time to look at the log file handling in runCmd()<br>
      </p>
      <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n168" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n168</a></p>
      <p>Please do some analysis and reply here every day or so as&nbsp; you
        learn things or have questions.</p>
      <p><br>
      </p>
    </blockquote>
    The runCmd() returns the 'Result' object containing information
    about the command execution. It has the following attributes:<br>
    &nbsp;&nbsp; result.command = command<br>
    &nbsp;&nbsp; result.status = cmd.status<br>
    &nbsp;&nbsp; result.output = cmd.output<br>
    &nbsp;&nbsp; result.error = cmd.error<br>
    &nbsp;&nbsp; result.pid = cmd.process.pid<br>
    <a href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n198"><span style=""><span style="">https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n19</span>8</span></a><br>
    &nbsp;<br>
    I tried to capture the return object value (stderr i.e result.error)
    and print it to the terminal, but that didn't work as expected.<br>
    Even I tried to print some debug statements in rust.py file and it
    also didn't show up in the terminal or in the summary.txt file.<br>
    I assume there's something in oe-selftest framework that doesn't
    print statements directly.<br>
    &nbsp;<br>
    Also, I see there's a &quot;<a href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n198:~:text=%3D0%2C-,output_log%3DNone,-%2C%20**options">output_log</a>&quot;
    parameter in the runCmd function parameters, which I understand is
    used to redirect stdout of the<br>
    command being executed. Currently, I am checking with different
    values by referring to other oe-selftests and their corresponding
    behavior with it.<br>
    <br>
    I am checking with some functions and procedures from unittest and
    subprocess.Popen frameworks to get the error logs:<br>
    <br>
    <a href="https://docs.python.org/3/library/unittest.html" class="moz-txt-link-freetext">https://docs.python.org/3/library/unittest.html</a><br>
    <a href="https://docs.python.org/3/library/subprocess.html#subprocess.Popen" class="moz-txt-link-freetext">https://docs.python.org/3/library/subprocess.html#subprocess.Popen</a><br>
    <br>
    Regards,<br>
    Yash<br>
    <br>
    <blockquote type="cite" cite="mid:0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com">
      <p> </p>
      <p>Thanks,<br>
      </p>
      <p>../Randy</p>
      <p><br>
      </p>
      <br>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------LJlHklXmpToj4NcrQFyxl7w8--

