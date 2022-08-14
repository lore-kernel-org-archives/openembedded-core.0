Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE7DC3F6B0
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 15:57:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6210.1660492644446965100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 08:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=EzryxwCB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5225295450=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27EFq95w030459
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=9A4qAxXbSRncqoMR8yQsgLRXbAvHrzIr0UIy+o+7aE4=;
 b=EzryxwCB5iXUeKzhWW5tTFANcHRu82buFqF4VbT4qNi2UVHe2KEJH3WicHaEL6b4B8H5
 sv5+Eey9UgmWYZ5JEy/eaNKYeG6wDfMKs3PaUEnNYYF17lIl2NLZZ+3oYFGo5ha90vOP
 0a2cOk46C+bN/OZ/w1OMeHbvopPAxY2kmwPR49EzUIeoFyMeBc8jhNOXsEVNDnW3hqRS
 fWz4GN2AjUFPOGs944mOGYeW1FEhaxS+QJYFysvN6RRUnaIQVV2rzZqKjAVqPpE53whB
 WjZoQ2vd5AUcLM6/Nn0faF6YROPOLbMjwjouOyo/azEwcn4+NCPapl+mhj8FVgDsLFqK UA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160s1ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:57:23 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27EFvMCf007429
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:57:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160s1kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Aug 2022 15:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6KLGWNR1K0JQknFZezllWQFrtET/BVz4/b++ZlI96RmA8QM1sgaNlVGJbBE/foEtYcKcREpJbVUs2oaMFM6ImKRQLCexB7uTbhpts3yvWGc39emBgGKbeo7woAVjvuCL2N0HdsUvwNFbQ7ndX0rN94Xuz8xjHOFeaCShC9jMHBPU9c/D/g8s2ZS2X3uQvgYZ4Eaxt7xtwsavkKVx+nfaGEzx3NVmhd3OS5636e5Q5P5hEobcIuGYUYq4gbX9Qi2JiHvrN02vZ4EuUpalwvjD6TyafwHUBag79Mcsa4ro3iPzG03ucIQNgZ/PSj4YIevuATREtw4mrcKBUw504+y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9A4qAxXbSRncqoMR8yQsgLRXbAvHrzIr0UIy+o+7aE4=;
 b=VqNxH4EssDulS032JRk9T+vUzocOc0xhDNnzwCJhqrjip4rsPM25u9telDq+o81vQxjjG0rEVgQtwpvbAjSj8IoIsyShJ7Guu7BjEBnxt6cV54WU0hv9bGaqR/eoRYR6xgvHlulSpin5oY6ElPvyClBajWNNSXZzWYyHtA6tkw7EBKglsTJonXEXuZIizyO31vAnsyqh4+mjErbrLmh2V73AjIYhW/R75kPxPnugVnmkRxgfWCesgJWw3RjyWA7BG5lYpSfpKI5hzslsCI4OBH1RoIimWa/dOrEkw5NLma2PblYWXQJreCvCWNoOf9SSeibqlo9qqMb6c0bbQ8xXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Sun, 14 Aug
 2022 15:57:18 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::d0c1:127f:313e:e8f9]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::d0c1:127f:313e:e8f9%3]) with mapi id 15.20.5525.011; Sun, 14 Aug 2022
 15:57:18 +0000
Message-ID: <5ab0399c-8d5f-1357-e954-8469803858c0@windriver.com>
Date: Sun, 14 Aug 2022 23:57:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] packagegroup-self-hosted: update for strace
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220814151802.9877-1-kai.kang@windriver.com>
 <CANNYZj9rK3fycg6S0yumZrM+L0wNbQgOA1h_2b0bMZehaou=Ww@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <CANNYZj9rK3fycg6S0yumZrM+L0wNbQgOA1h_2b0bMZehaou=Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd883b3-72d4-4c56-b61b-08da7e0daa2b
X-MS-TrafficTypeDiagnostic: MW4PR11MB6762:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z5AMJaKxuAwI/Mw/TsLETye7zvtWuCybf+HUj0GhydYrUV18/qcfqGehybM1wpMKUYzY8Tx8pnNFe12nGD2n9w2RvZ7RmbIE/tPmy1IhJTvIzii24aphDxVJkB7SpQMX/82opYL3kMB1NEoW0HD15vQpZcf4nfvgqvXeFmkR+PStfB6mM1DSiuBCtVGbf6A3jslCcrlhSkz7/Rllovr9CwVL4saiy+fBuF6tWFNgqbXquVpIjtz+Phz1VYlhJxtiN5MyR/jGX2XOdD1Rs2ChZOqYsBkXkJD+tZpXMvJYlSMWFYOmWvLj4JcxhNyepqrY/594D4pFpF6jWBsJQfw9pQFk9b+qisSz/atvAzVdq7+l9DQ29YMvZSKanC/c2xnnCnp6cTp2uGbs9LZPxVSZb1K4Da4kmrrOCIraou4RzbwG8UerNdl6wVLp5tQkGiZ5cawxKhsgqfJJ+bZhfwQ0V5nqlfajBFNkUyvg8wzUED5oJ8/LxzT/F1C8i0H8QYvSYeqVQZwcZ4cb6pYolfEz6NMJLQWwm7er7M8XElCv8OqOqe8ukdPopAqW8CRzIE9nIbpWc7/AMaDtIlCIJaqHkp/y1m6BeyEhAnhdn7B6uJg2ec6EsUV1HFYAtIv4o9aMbxa5GeGtXkQzGiPV1LbhFmhQWcR6Bco3NzTFta1PHlFxfI+vJxe7oCVAdNEUbklUb/B1i5LEvTWQENU4H7v1ERN3h4AENwIeR657xdwq8lPo00jU/jdKIYnOnXEf/Bvfb7M2BwVt+RjM80nusqZszpQh+qf8Gc65QYPRZXn7boxZXWNJa/qfTE6VvGs25fMOF+qCOXNWJCM0gxao9bDom9vgmFrsfPvilOjRQtOeX5T3ArM38sitgDb2fGf+oVYDXwSWqYaXJxMDvEBPDWNJsg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39830400003)(136003)(376002)(366004)(346002)(396003)(83380400001)(31696002)(86362001)(316002)(38100700002)(66946007)(4326008)(66556008)(66476007)(6486002)(966005)(478600001)(8676002)(6916009)(6512007)(6506007)(36756003)(15650500001)(26005)(53546011)(2906002)(6666004)(41300700001)(8936002)(2616005)(31686004)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWR3cUdHSmhka1gzRGxicnpXMFQyMkI4bk9YOTBYaFc4S1Y0VGdCRDIvVVZE?=
 =?utf-8?B?SCtCclZaSk8wNm9heHU0ZitTT2pGUjUvMmhYZndicDFxM21odVJnQlZYa3Av?=
 =?utf-8?B?dFV4eDFVR3N5WWxURkFhalZMSUhxbTRNSWIzSUkzaWM4c0phRzhWYUZYT1pu?=
 =?utf-8?B?eHFSd3hFYVh0Q1RaOTk1U2x4UWlIQVp1d25ZTzMwZVFQcjBqVkhrWUY5ckM5?=
 =?utf-8?B?OUVxT1g0M3V5cDBsSmU0STVnTURmQ3NaQVJkc0RDRm9QYjFIclFYeERhV0Zy?=
 =?utf-8?B?dEU3RlovMHNNS2ZrYkc0OTI0MDl3SnIrR0lzSk1aeWFoanIzRDV1eVpYNEJX?=
 =?utf-8?B?Y2dUc0d0UGNvOU9GWmhpam5SczBJV0Rwa1ZJWlhyd1pHdTVsQ1IvQTJTRmFr?=
 =?utf-8?B?VzJ3cUlMM2NiUWJkTGE2dnJ0Mlg1ZFBuL0d6My83VjR4YlNTSUlaeWxmK1hH?=
 =?utf-8?B?NWhNV1ZGWXQyMmg2T0ZlZVpveHpRNExyM2lWTkwzUFJ6WVd0cjNzZ0JZRHNB?=
 =?utf-8?B?WG0zQlZjcDBxUjlPcFllZ1Jla29aTStWa2hLMmhuK2hCdkpQUkZYWjFQakNt?=
 =?utf-8?B?QU9VemFYck1zeFdqMjlITmQyd3hiOEdUSXArMkJ1am90cXRXSU9KT051RHZL?=
 =?utf-8?B?cTRxYVpFNS9Zb1pEOXhSdEFtRWxka0w3ZHlvQVVXeDFzQlNlVGxCVm1qQmZO?=
 =?utf-8?B?NjhaOFAvaUdZVXZnMkhrYWxySmg2QnhEY2xOb0hHZHFQMzhvMUt2akRSYnVl?=
 =?utf-8?B?OXJ2RFVXajJHWFhITzltQ2RDdXF0M3A5NGdMbDhCcGpxdHdROS9xQWgyYVAz?=
 =?utf-8?B?L2tqTEVxYnhjWFNHVTNqVFdjZFJMS01ZWG1ESzBIcGl2M1ZFZ3dPWi9MMXdK?=
 =?utf-8?B?OHVDeDVOSkJZcENNSWdsc25Ccnl6MTBndEtHYVoyL0hMU1RLQm9iR3IzTkho?=
 =?utf-8?B?Z29oeURkVEhLZUtzNkJmS081NlgzbEZzZXBBTFJCZXpjcTVZOW0wbXdCWnVQ?=
 =?utf-8?B?K3M4SElESzVqck9TV1dzZEd3RmhiQUF2RUJBeGh5ek1BbVpvcmhyWi9WVWV4?=
 =?utf-8?B?aGl3MnlYclcvbU5zSFoxTWhWL1B0VXpjWEhzU0hwaXZkajZHYnRFc2ZuZ1dF?=
 =?utf-8?B?U0JIS1pDVUsrSGE5VHpIdzlrNFR4M2dOTmtQSjFIMllWeG9BclNRZFVFTUFN?=
 =?utf-8?B?YjdMZngxZHk0SG9PZUpGc3lSc2FYdnh2V2VrQ2dVbGw4N1lHUlFUbmthc1gz?=
 =?utf-8?B?bldrVE9ES2JmNmMydWxoWHhRQmcxRWZIMTgwbGpMb1VJRGhrQ0hYTUpkSFp6?=
 =?utf-8?B?N1VzQXV3aGgrR21tSkR5N3p6OWRaR2pnYldEN2pjYmpkcjVPT2M2eWoxcnhU?=
 =?utf-8?B?VVRoUmxXK1pFVnV3ODdQODB4bFJZcjA2ZGQzRmhBL1NCQjVuN1NoVEZsRzhM?=
 =?utf-8?B?VEorQm8vUk92L0U4NnJpVXB4Q2QzckQyV2dycXB3RTlUYkt5NUxtT2toMDJp?=
 =?utf-8?B?YSs0MDNLQzlRQThCb2w2aHJ5VDdiQXZ4MlFvcDViWTRBRmltempiOWpHN2ZQ?=
 =?utf-8?B?WXU4dUQvcmd1aWRFTmlOUmhtSGJRQXBzMTJDNERlUGl1SXRSYmp3V0JlblRa?=
 =?utf-8?B?N0VmNW5Vb0NPeGhIRDJTeWJKcUY2bHRBa1AyNEZOSEhFd1lrMHN4aGhtendo?=
 =?utf-8?B?dkp2U3dSY1dpNDVqa3hyNytjU3hPWlhVZU96ak9PV2dEeUVrQ1VmS2JkZFFw?=
 =?utf-8?B?ZWJvQjZ3M1hPMUNsaDluT2RuZkVpZDI0dlZPdXpOWTd6NGNabk1iL1E0UkVz?=
 =?utf-8?B?UlNxQTNOTHhPTnFTc2s3YW1MWUFWdjhLaVIwN1kyS3E5enoxb1lDelR2akp5?=
 =?utf-8?B?dUtaZDliRUVSY01xM2NpamllMEpiU25LZXFiNlVYeFNrS1lUampvSmtWTjFZ?=
 =?utf-8?B?ODNPSi9WZEVGMXZ5Ti9lWi9FeVVPczc4d3cxQTJQZmgxaEM1djdXTHNKNEg2?=
 =?utf-8?B?NEpyMmlGNzZqMnF5TGZaMTNHYit3aWNmUi9iRG5jRWlPaGxFNjl6T3FkR3Uv?=
 =?utf-8?B?V20wRFFIU2p0SWc2ZXZibHI1aWR6TFJNdjYyRURUZUNnRnZQLy9sTHRJT0Zm?=
 =?utf-8?Q?80+Dj3Am6GLr2PVZDj0aVZU73?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdd883b3-72d4-4c56-b61b-08da7e0daa2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2022 15:57:18.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cn4ameWBZCRoA1ALzqzf+ZUS/psl4hxKGLF+dRWGGoWXTHe6GzCNDSw+ig+v8qVc4FZFfiM7RlXr4eiThPfVTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
X-Proofpoint-ORIG-GUID: g2KtKEM5MPTw18yEoijOlrqVgQFOjoq7
X-Proofpoint-GUID: GXA-r_WVR8SvitHYkKkIJ-T_qLzCbZnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_11,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208140070
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27EFq95w030459
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169327

On 8/14/22 23:39, Alexander Kanavin wrote:
> Some information or links about how it is incompatible would be
> appreciated. Can it be made compatible instead?

Based on previous commit

commit 6749e29082043e4e71849e80e058fa45988c62a5
Author: Mingli Yu <mingli.yu@windriver.com>
Date:=C2=A0=C2=A0 Tue Jul 5 15:03:18 2022 +0800

 =C2=A0=C2=A0=C2=A0 strace: set COMPATIBLE_HOST for riscv32

 =C2=A0=C2=A0=C2=A0 Disable the build on riscv32 as it's not supported on=
 riscv32 [1].

 =C2=A0=C2=A0=C2=A0 [1]=20
https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096=
db215da

 =C2=A0=C2=A0=C2=A0 (From OE-Core rev: 5276a9a845d0277936e9321ada296818f7=
bfd84b)

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>


Regards,
Kai

>
> Alex
>
> On Sun, 14 Aug 2022 at 17:18, kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> strace has been set imcompatible with riscv32, so update in
>> packagegroup-self-hosted.bb accordingly.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 ++++=
-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.=
bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> index 772b86b39a..a1b0ee2883 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> @@ -98,11 +98,14 @@ RDEPENDS:packagegroup-self-hosted-sdk:append:libc-=
glibc =3D "\
>>       glibc-utils \
>>       rpcsvc-proto \
>>       "
>> +
>> +STRACE =3D "strace"
>> +STRACE:riscv32 =3D ""
>>   RDEPENDS:packagegroup-self-hosted-debug =3D " \
>>       gdb \
>>       gdbserver \
>>       rsync \
>> -    strace \
>> +    ${STRACE} \
>>       tcf-agent"
>>
>>
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169324): https://lists.openembedded.org/g/openembe=
dded-core/message/169324
>> Mute This Topic: https://lists.openembedded.org/mt/93017686/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


