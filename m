Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50298D5E145
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 07:28:53 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.92.48.73])
 by mx.groups.io with SMTP id smtpd.web11.7961.1731050924540488806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 23:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Jphz67q3;
 spf=pass (domain: outlook.com, ip: 40.92.48.73, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDUvPYEF5sUe3OSG+3vCYYKqMCVNx11Ejn6aUOhR+k4fZcRWAw5KYbpn5kwu2DFZTJJw/HdfR+SlC5PDkQoTebo0SnsJZo8C50aX4y+PMEVasEV0FTrxar87kf2c3oWzF3ELhDJNA8jK+B5Y8HDDULZJ3TQRg+2u/M5cgroYQKjFbb1DWfae8zVckoTb1JyCRCZPkamh0kNmjZr2vLM+5O/9vhgHUQ3+FUKoCfDcLIEZkAnCZMJhwHatNnGrLi1G42gastpSF8IzUw1pqMV7v5ReaK7N6Cnr/3dnIJnpQ2JzTn9AiXZs1fC7J3Y/h45Xn4Azgg2rmEUylVbxMfE7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITy+mi7loAldJ5PkcLrdqv9FLlc/TjO5B0t4eGd1ODQ=;
 b=aP0np4zyIaLA/2eb2oAAvrg1x4sVnp4+VLJEwjNWgVn40V6YoSDpSEJvk/suuX/Z9Nrovhy3rvjuwhcTRmZAZOBzM/jLNeHUlOslkD3MN0ok9wSEpZHbQTMWK/olTSksXky9vg6nl26QnDUw7Xa4LObkRl89lR3+mmbg7y57xUYmmG4n6JRI1bsb9gCpuYsR9in6ne5e082r+LJrZeN0QYPWY1BL4vh2n299dI032tgofLu5ABliNsc2PxklhYkENTvuEelAycXlvxv2EWwhpiSuVyAiKxtiKYLti77eoFf2bpTmUkbGf+8CUWXr6GiIr5QIjkIwfx/g68rivZ/1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITy+mi7loAldJ5PkcLrdqv9FLlc/TjO5B0t4eGd1ODQ=;
 b=Jphz67q3/qafKei0JUKlGqCmLNW7HlFU44taBpSWyqwoS2uIoVUlHKkBLobCj7uX8tMoy21VbTFd9jcPW5tRc0CUqJmgwD8ICZOhpaD3hzkqnFnE9W3/dGHpVqUPsLlqg9jSYTAuqIFmY+DaYCdF73BKuoP6/a8HBhmBhricG8r08/PyqqV1sAvj+Uq6a37GQtd8f1wquO/1fGU/ZgnQ5AsXbr+LANiHAuW0oruDG4jtV0xC8hui8mLDLQwYxt3yrno9zKGFlvNmvlJ4pAJU80/xkeTXuy48sL1Fu1gy3+FjSuvlEmvo3GLMFeU4lk5X3H0rM/wpDLVkojjQ+u+p5A==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by DUZPR07MB10062.eurprd07.prod.outlook.com (2603:10a6:10:4b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:28:40 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 07:28:40 +0000
Message-ID: <GV1PR07MB9120A235C10D5D3681746BD9A85D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Fri, 8 Nov 2024 08:28:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptols: do parallel builds
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241105215644.1884070-2-ross.burton@arm.com>
 <2650.1730917856955683740@lists.openembedded.org>
 <1E0CAD7C-8E6F-49AA-A7D9-42C9A645C1D4@arm.com>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <1E0CAD7C-8E6F-49AA-A7D9-42C9A645C1D4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <ba73bd65-d304-4068-9edb-be95aa8eaf15@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|DUZPR07MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: ae63916b-a8ac-48f8-0834-08dcffc6f6e1
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|15080799006|7092599003|8060799006|6090799003|19110799003|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D9vB3AoK5fcCN8d2anCFGE8elKCiprrWtfHntTEInpKZSBYCu/gXi8NtGTfk?=
 =?us-ascii?Q?u+aqw16RmR11Fovax2po4bzkBmz7y47dS+7Jm+jERQbDkFKSccHHZQAdeEX1?=
 =?us-ascii?Q?s/XLNlYoRzPtjRpSWDSLG/rVzE/cqVayX9PILEzbtTYqNWxwrm4K6waf4ev8?=
 =?us-ascii?Q?FALkYw+SBryuIRBeqxV4KSkSzDrnIvCJUWbVJGtxGIyg0ULmF67tumpu8e9D?=
 =?us-ascii?Q?D0WS0ZEu02PktMkakjxNhwzYoqyLKwa5obpACVMeulkF78AkFekf7iH8t5ym?=
 =?us-ascii?Q?x0wzv8XLZZdnNdaEhnk6o2M1kVaPxGrR3gdLJ3nEF/7BPUXj3npm+3nrnImn?=
 =?us-ascii?Q?dNhQn4E7JHi9a4QqEYge/JFTUJbO8v5i60Ou6A8yGmrL8LywkwgEzrrBtt1O?=
 =?us-ascii?Q?eL+JNo1ibMi8rWVmFrZykyRvVyhDiFUpAPpG6hvyF/gKhOqcE17TpYMoeBP5?=
 =?us-ascii?Q?onlqNWc3WgqnI3Jyba/H1fvIrRz+6vsJEOjhM/IzV9ZiOEfjbGtdVvMMMt6v?=
 =?us-ascii?Q?QjL0hW3vVYftpFuyREIvqEvNlmkLA8yuL2Iat8qVOzFJIALzjz6lOwgH6gEt?=
 =?us-ascii?Q?hAQtLDvXCBwq6JlAbiJYOIq7OzCnkRtGHWZ5MfYpm76EZMZ0jIZyj2mhhzql?=
 =?us-ascii?Q?uuDv0+D/fQapzp+X3tv4nJHmb/0CwXJPNLYzXUP/ZT2rEuxSCXGlXI3hxPkk?=
 =?us-ascii?Q?PCeltHJs1r4YpMpjv5jZUZN8hOqVdRd6W8umCEvWFtqjADf7QV3VZzXGNkIg?=
 =?us-ascii?Q?6gNZYBe4/Csa9hTRqUlfNNGHOStyZHU02DOY6KvR3TP/JJ1LXh2nWpnlqaZ+?=
 =?us-ascii?Q?6cBvghHr0m8AwHSZkspBREmkVCiFxaaopFTEslhSgJGjVhXzsiY5533HbsPd?=
 =?us-ascii?Q?lk3ClHGkt0m/6TBXpHzqNk/p3v+Uau/RWv1/WyWxnWO1FLxUctFNJ/sWPdGz?=
 =?us-ascii?Q?VmgP8lHO9wF0rd+QkVELK7HpTYNNEYD7o4FmhyeAQ6zcV99s/9pNumsbAYnK?=
 =?us-ascii?Q?HGVel+M5hmvBqodNw4Vc2OsGVCfrGa3VtfZQ2sUnrYJEFX7HCG/04I3tf+Uc?=
 =?us-ascii?Q?Nq2UKuYx?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3X2vpgvCkGVVuvgrd28MT2UCK1ebmNfg8Ik1WCkM4L+d5Pou16A6eVrIxkXM?=
 =?us-ascii?Q?qfqX6XdyeMVG6zXdaZvhsfTjbq5J9mfvW5Ry7MyRMxbM727vXdmRfoohMXsZ?=
 =?us-ascii?Q?RHcbWBB8IUzH6sisgF3SKQfbeQ57aqueYWPxKfniYHgxT1CfzUVG6MYqbu6n?=
 =?us-ascii?Q?zwgm6t3E8nkYBH/dGKj0WxYIBTHSEy4biSZaj+3ac++8k19svZjAk4kLeS+v?=
 =?us-ascii?Q?rkgtIItskxddogwUH/ovhaSsvJo4s++n0NuMqvME4JmIAn/m5aMSsWQZ5zWZ?=
 =?us-ascii?Q?HcvRhq5fZde3eSvLqyhgQI8ndA12Q2llJvY8rkwxQclmzn/svMsiD/0jafKa?=
 =?us-ascii?Q?+wyM0gbyfC0lT5UpwuEHNAUjeAWA0spjKlt7g8xV02ErCwuWAP0yR2yxAenJ?=
 =?us-ascii?Q?4Dm8BUn2xocV1V7nn4wYG9u43/evcmMRqDzhcb+Km70mV7eNw6Q4H0glmgoa?=
 =?us-ascii?Q?tCxsLxdixpOSYCF9uxdmA0ksXKOSl0Oz8utloFE4vbgTAlFpqikZIEWjhsQh?=
 =?us-ascii?Q?GRh/S8+VP66N6aX4zU3RxbFFRmB2f6p/NdkWyF/jhPwR6x6tRb61FQ3CGGFU?=
 =?us-ascii?Q?INZCpOwQSSFvaqc8ezXnwyDLUxYtiAiYmo2NzFwuNe1tWvtoJn8TBS/KvM4O?=
 =?us-ascii?Q?WTA6iNuAN+V27ddzhRLVKfi5jyFl+ggHrf0cSAflg2Wd5qTnoLKjgyYs+5l3?=
 =?us-ascii?Q?pA+7vH5jw2JABxD/XS+KjDqlbeOBerg+L0s0zxnBjvIsTOm3Re2VgTpAiHJD?=
 =?us-ascii?Q?1+qtrB/Txk/0A3y4d/kgXvB9Bez18uDWh6pild7NOA0XRfe1W5PyDmOCD19R?=
 =?us-ascii?Q?ybC+TQjAhuAkCCM7TrFDLiR+hs2eoJCRL9ejPb+rRMyBtazGK7tP6XubmCA3?=
 =?us-ascii?Q?gRNWjOwutgn49qP/fbmUFTgRKXYQWx2zlVSY5Q80+ClxRhRBgO4jtBgjQkDo?=
 =?us-ascii?Q?9//bRJfQUg9n0RjPKaHos1PUnaQ1hdDd1ScROvKNrkGlmob2Kav7N7m1EI8h?=
 =?us-ascii?Q?GyYaqvudPV1uw/nEczj8FrdCRh03X/QsBHVta4RtQrcN3nUZu3teKwrD5fpf?=
 =?us-ascii?Q?BuN6rrSSuKprm0ix2734dAWBGkNftzetARJ0PTRGMHb5essSKGES94foKjGB?=
 =?us-ascii?Q?gXu6r1gTA/ZDSaoXbSI5RtSIeqpUBMt4am67ISHF682tzXvhpZh5oQPbmHjp?=
 =?us-ascii?Q?PZb7dPVAYJFVaKA/X/RQyM1i9pxWQX6Kr2pwcXxa6dLpBQmQ+NUov9sQSOUj?=
 =?us-ascii?Q?eioVJU0CUfLylWMfHBSvlLjufaE4oQwUJ7k9lCyJ/8Kr+sAhQxmjCxIFLuJS?=
 =?us-ascii?Q?VEc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae63916b-a8ac-48f8-0834-08dcffc6f6e1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:28:39.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB10062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 07:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206856



On 07.11.24 22:40, Ross Burton wrote:
> On 6 Nov 2024, at 18:30, Konrad Weihmann via lists.openembedded.org <kwei=
hmann=3Doutlook.com@lists.openembedded.org> wrote:
>>
>> On Tue, Nov 5, 2024 at 01:56 PM, Ross Burton wrote:
>>
>> I find that patch incredibly risky, as there is no really opt-out.
>> As the main beneficiary is pandas (which is not in core), which not add =
it there as a patch?
>=20
> You can opt out by setting PARALLEL_MAKE to -j1.  Pandas is where I notic=
ed, but I expect it will make a difference for any package that builds exte=
nsions with setuptools.
>=20
>> Also other suggest that all that can be achieved with  --global-option=
=3D"build_ext" --global-option=3D"-j5"
>> set by PEP517_BUILD_OPTS, which would find the much better options here.
>>
>> Something like
>>
>> PARALLEL_PEP517_BUILD ?=3D " --global-option=3D"build_ext" --global-opti=
on=3D"-j<job count>""
>> PEP517_BUILD_OPTS:append =3D " ${PARALLEL_PEP517_BUILD}=E2=80=9D
>=20
> That=E2=80=99s possibly a neater solution, yes. I tried using global-opti=
on but couldn=E2=80=99t get it to work right.
>=20
> Ross
>=20

Here's a monkey patch to expose the missing option

diff --git a/setuptools/command/bdist_wheel.py b/setuptools/command/bdist_w=
heel.py
index 8cf91538f..b692a7aa3 100644
--- a/setuptools/command/bdist_wheel.py
+++ b/setuptools/command/bdist_wheel.py
@@ -234,6 +234,11 @@ class bdist_wheel(Command):
              "result of calling the PEP517 'prepare_metadata_for_build_whe=
el' "
              "method)",
          ),
+        (
+            "parallel=3D",
+            "j",
+            "number of parallel build jobs",
+        ),
      ]
 =20
      boolean_options =3D ["keep-temp", "skip-build", "relative", "universa=
l"]
@@ -259,6 +264,7 @@ class bdist_wheel(Command):
          self.build_number: str | None =3D None
          self.py_limited_api: str | Literal[False] =3D False
          self.plat_name_supplied =3D False
+        self.parallel =3D None
 =20
      def finalize_options(self) -> None:
          if not self.bdist_dir:
@@ -398,6 +404,7 @@ class bdist_wheel(Command):
 =20
          build_ext =3D self.reinitialize_command("build_ext")
          build_ext.inplace =3D False
+        build_ext.parallel =3D self.parallel
 =20
          if not self.skip_build:
              self.run_command("build")

feel free to propose that to upstream, as I think it's the better option in=
 the long run.

And yeah I have to agree for pandas it's like a day and night difference, o=
n 20+ cores it's
almost fun to compile it now :-)

Cheers
Konrad

