Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC5ACCFA05
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:53:35 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (JPN01-OS0-obe.outbound.protection.outlook.com [40.107.113.91])
 by mx.groups.io with SMTP id smtpd.web11.2324.1693965212319866601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=gKH4LYWw;
 spf=pass (domain: lineo.co.jp, ip: 40.107.113.91, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TueQ63KNSUPljwiamN9GptMWbuBpKpNLdrKlQga49NXoq4YMYkDTVE5TjTctWos3QNXBPda119433a4wNvmxAvayN4UQABVk/FojmPOL02v2Uj3YAOgjVwGvq7K05vUmYrq4yzX77rdo+Q17bBfyjWaoM+ptWq0q2mutnoVwTdq1tYt4M9zTEL0eQLl0mvr4UfgLKtOUiwiNDHTh/mXkvFIY+JV9w4qCNeXgWI7oUnsbTvXECl4b6St9laMNh4/huhuNWaB/YOwv+j/4Wkxjc+tF1K6XNIX26MZEGFpWGLX4jtM2Sorr3/ELCBmhFrBgl9iJlxN6tC+gyFJg9VPc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve2KNQS1g5AbrW7M3UIDnWUGDnNIr3TRmj9hmxmetxc=;
 b=ObwwvemHOICHdQBmaciV7u0c2RUlwBCpm8XXGRUDlycaI8VJRzEA4HXP5NpNcK2tPYes8NxE2E+a0Ji+G7LHvKA6sRnYKgYRIiMcTUb3cAiSQlx5axlRCL3QrT7YmOCAsHPcC7J0+5DLmlYmdH0KBslrpTKFNEPtiO35Go8VTR5JYO5QnnU8Z6Xh/sf7uVatR9eeTGZZaaxR5BYpWlYSUqnvvepcGcJNR1l/L/JdAKMlhgf+gXof5kmJAyyyTarSuV0NqJMyofZAkPiEbRSq6h21o5lizLOY+x0WfFpIif8guhNZWgyVZ+7NljXm2FbHMHAZ8m0C4/F8nx7/H6+BbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve2KNQS1g5AbrW7M3UIDnWUGDnNIr3TRmj9hmxmetxc=;
 b=gKH4LYWw5tO8EGF+/FFGCGnCvHXnRgqOPPI8evxvmFWE9KjOr4lNfvk72/6AZYUl9jRSpFOq0IY3dDfG/Q440bZfNj31VD1nRXC52zD97KM1XRmtHm/dPwrUitBvEUi50WI30IOmyPPk4llbxVGFMa2UXul9yMUom8RaVZYs83A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by TY3PR01MB10221.jpnprd01.prod.outlook.com (2603:1096:400:1da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 01:53:28 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 01:53:28 +0000
Message-ID: <5e19b8ff-358e-0b6b-2fd4-f7884ddd280a@lineo.co.jp>
Date: Wed, 6 Sep 2023 10:53:27 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] linux/generate-cve-exclusions: fix mishandling of
 boundary values
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230905072920.615-1-hayama@lineo.co.jp>
 <C799CA2F-53A9-47A7-812A-73DC55F64073@arm.com>
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <C799CA2F-53A9-47A7-812A-73DC55F64073@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OS7P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26b::9) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|TY3PR01MB10221:EE_
X-MS-Office365-Filtering-Correlation-Id: 510698ae-2cdd-40ab-160a-08dbae7c10c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4QZage3+1rL6muuM38zF9QJl3wTGm+vsZbmRKk6oXNn/LnHUAVq8t3C7v2v6amQysA7lWCxNkkmEMFrjUOv58oUdH1yqjc4uYs4K1DCMh2yAD7j0YumoP/wdoD82b7qD5EMu2elOZ5FFU7BULwjfEU91C6AgbgmGjAMo0dwPDxuBfAVNPj6KPMIKrMH0TwgAiiHnDsoCQe7rS3eWpq/aTqO6VNWBWUN7psLf5zpyRyhxEdByb7VxmSOpK8746diIGA10Rwh0MdIFqk1YURTf4t3RqSyTmRqgNvJNUpVvrR5ac8yLT+Ss6NF/jOMD4XrR9Pksj34xr4Af92/KNwEpAKye+lUqlc9zyXE8TlSPibJ2IKYWUETO7RcDeqCOf5rSOpVWEtMBf39C10a4lX/QIRyLZKlrw9Zushqo+PES3K0xNvfIXrmJXus9wo7aPYcP3Xlt03J089dIme+CilUSiTaSH289GBuE14Br+uUU+Ii0V2uIU63fQsZ7pPh5/tXpl+eaXn46ibvJL19wGCSDhQh3Hx2NrQB9UGSCUKw6vCMhPKn2zZTLsCbTuraaYfH39LwpYhqVsmZ815/pBkLkSVrB4On/Y71xKR0mLP33USXI5s5VXGjEzRYD8C6p5LWXKexXz3z7CTX22I9pPfDyPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(346002)(366004)(376002)(136003)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(6512007)(53546011)(478600001)(83380400001)(966005)(2616005)(26005)(2906002)(41300700001)(6916009)(66556008)(316002)(66476007)(66946007)(5660300002)(8936002)(8676002)(4326008)(31696002)(36756003)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K+s0B1fxF9fdx+2QZEXm5KDuZv3szIB376LtnqR/M238sTFbsAXTvzcQES/0?=
 =?us-ascii?Q?pc095Wri3VULgC5iKIFVBoICigHm3lG8QsjbLBp80hBQnC8pOhCHLJKawpkG?=
 =?us-ascii?Q?iGi3Pq5HMnRec8ft/FFtkAYoNq8PmEROv1K6VSI1VrneWUaLNr1bShvV/zsw?=
 =?us-ascii?Q?ADXENTD3/010WJfN2OAkHXGoj0OAukLVIJN3ucxzgnHMPbcG184IC67+4A3H?=
 =?us-ascii?Q?abEbQ8eA98xwH2ad4YF1uNqtj4u8s+bTaG5620EKRnjF/rwBJITZDcY6sb/c?=
 =?us-ascii?Q?AL+Maj89MAiRpVT8BkfDAHyX63wCweCaaZ6EwIZkIanI50pZguyrud5FlOFJ?=
 =?us-ascii?Q?m1yv5d65vwpJrRpm/1rXyPj7M8ebaz5GTj0Cpx8CkYpeTnG6ZxBwgLwzF9I6?=
 =?us-ascii?Q?1Fh5BO/PUlg9Uz1c62PtpdyQjxOwxYZIl3dkNcdGSp03KgN0fLxAKqDEWNns?=
 =?us-ascii?Q?0tmKHBcWB6h9/yI+yDtgN8e+s+TIRs37mNrvRfKUff7ij+7MendLOaGcqXPu?=
 =?us-ascii?Q?LMglGyq2gC0Sh2Lzscp+VSXjn0Zvanf1H7e7S9b0tY0mjjjqNABX4PREC15G?=
 =?us-ascii?Q?1ZthJ55E5y2bqdBg2CPjHvPUNFws2bZAmfBFhhX070wJxfw+WobTZzxOgocu?=
 =?us-ascii?Q?b3m8T+ft5nqKUnFKVyTm6FrF8o25E0RKPYBKmn7hzldVdraZ51ZY8Kwaof8p?=
 =?us-ascii?Q?MuLHUo+oQsZ5LFGdYKD6T2YSNhThV7tIAGPd4QTpcpiUCo7KqF8CLBsdbzXO?=
 =?us-ascii?Q?1uNJZKA+MmwjIfkg0Px66HMzpr335PJDFZd9SF7kYj1tNAtxkKK6cv68i1EQ?=
 =?us-ascii?Q?5nx16+1+2mbWSVwmQC09W6ycqXrIl6sTOTzMey8fLay1CE0aKXDTOFCMZKbI?=
 =?us-ascii?Q?R8QXbz+o1UZkHLbkCRQ66BGkvTrlQI6sfS/XPzBbL0ZkKFQUTkB/DkuC3zhO?=
 =?us-ascii?Q?+mYyy4X7NB5k7EoagsToF3sub0V93rZxErLh6LyJlkN6Y7L83bsJnCLngXyQ?=
 =?us-ascii?Q?8hkDvq4+fjheGcuOoD4kEXTru1tpwHIg3REeZ/3OhO5N1/ky1TbgG2YPQaSd?=
 =?us-ascii?Q?PxysFe4yN81bRfmlU2Ru6oaoOaw5TcKGpKQC7TnSif1toEEpx3gDNdU7IEqF?=
 =?us-ascii?Q?l18MhY3hH6Rx1dy8m9Y/maP9FAlq3PzKenPeEX04m9LCP86VIEEmhD/LRLyO?=
 =?us-ascii?Q?nhjGntghUetAcP/ltFq+HwsHCqd0s99x6RpMKkAH6IFuinB3SvWzwNg9P5zu?=
 =?us-ascii?Q?EROomMuJ5XzLjRTwMQ0PHL7Wm0XkoS/7SSFk8l+OwD/DUAWzVSqk745uzbtc?=
 =?us-ascii?Q?POoEr+bIOnXk7hh5pkfDF/NwLOqRi4zP+AGbszw8rXkCj/6sbsIqcU/pZ5xW?=
 =?us-ascii?Q?rjNbxl2RfaUJXsV9NPGk0hEuE8d+1v3rNS6qOPlXwIwlseko/zjpZfE6X363?=
 =?us-ascii?Q?S70XvYHAv0n+AjpSECj3gOm7NnfU9aHt1dZwAkvRFN7PRrJAsej3fLaeg6xW?=
 =?us-ascii?Q?qvOHQqHXzyQJIXFYX/GlaWJeQ/9ARQ9PB9nLDZTminncLxS7ywm4vRc7jwB4?=
 =?us-ascii?Q?DAm7Fso7GmW0o4M7ENdn/BspRju+GuB4UomKjv2m?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 510698ae-2cdd-40ab-160a-08dbae7c10c5
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:53:28.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwx0DvBVpuCVd2bwUGiwUMoF4OIKb+AlKZxA8pew13YORGphdJKJdzMRIl2Qcght0Eus+EVSdUzpN0fReI3/Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187267

Hi,

On 2023/09/05 20:14, Ross Burton wrote:
> On 5 Sep 2023, at 08:29, Yuta Hayama <hayama@lineo.co.jp> wrote:
>>
>> affected_versions in kernel_cves.json does not mean "first affected vers=
ion
>> to last affected version" but actually "first affected version to fixed
>> version". Therefore, the variable names, conditional expressions, and
>> CVE_STATUS descriptions should be fixed.
>=20
> I=E2=80=99m happy to believe you on this, but do you have a source?

Unfortunately, I have not found any official explanation for this. All I kn=
ow
is what I wrote in the following message. And that is what I have been able=
 to
confirm empirically.

https://lists.openembedded.org/g/openembedded-core/message/186994


I looked again to see if there is any information on this in the Linux Kern=
el
CVEs official, but it seems that at best there is only a hint in the README=
.md
in the git repository.

https://github.com/nluedtke/linux_kernel_cves/blob/master/README.md

>## Overview of Process
>
>The process for generating these documents is focused on being as
>automated as possible. Below is the general outline of steps.
>
>  1) Take list of all kernel CVEs
>  2) If the issue is marked as Vendor specific, ignore it.
>  3) Get the Breaking/Fixing Commits. This is retrieved from the
>  internal cache first, if not present it pulls from Ubuntu, Debian,
>  etc to try and fill that information in.
>  4) Using those commit ids, get the first tags in the mainline that
>  they appear.
>  5) Using that version timeline, for each stream that would be
>  vulnerable perform steps 6 through 8.
>  6) Find the commit who has the commit message that matches the commit
>  message from the mainline. This is the fixing commit in that stream.
>  7) Record the commit id and get the earliest tag in the stream which
>  has that commit.
>  8) Output information to stream document.
>  9) Update JSONs.

In 4), it says to look for the tag where the breaking/fixing commits first
appears, so we can assume that this is looking for the fixed version, not t=
he
last affected version. Well, it doesn't say which field in the json that wo=
uld
be...

In addition, there seems to be a key "last_affected_version" in
kernel_cves.json. I have no idea how this is obtained, but it seems to
literally represent the "last affected version", unlike the second value of
"affected_versions".


Regards,

Yuta Hayama

