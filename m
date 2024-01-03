Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B989C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 09:15:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14022.1704273304093686697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 01:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=n9Cm+lrt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17322eae69=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4036v7nX016023
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jan 2024 09:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=OgwNDqgy2dAr56pOy3lZQDVKHDCTzuOBgNfaL4VaLYg=; b=
	n9Cm+lrtHtrTYIUT4mlSJJP6rwF3jB5Ad4IX3BsTjoKkuP/mTTOohVjLUIWh20HS
	b1+bGIiZPqNY/0875tME7fzRccTAwbuMOty0DBCeXFw9A8QiQTcmHFXGDD8v2Pef
	QiL5eWc9lTwW8+I13l2EawqcGFcy/bJAk4O5xxPQ1Bgkt7hwLWqnZaEYnxKsGaz/
	VEX01XF+p7hK1aUP/G8B8IYVN4xwxGdyRDs2vIrAJutZUIPF0U8mwqrmMe1zT5KI
	4w9/pwvizKV5ahkVNBka6zC0Se6VeEBObTp8x95YrBiQP8nCeTo0GOGvlNodzU8v
	hzlzdBx8rSa8byABK/tC0w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa6643wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 09:15:03 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4039F25f010167;
	Wed, 3 Jan 2024 09:15:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa6643wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 09:15:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGjH2fIY9vMsTDZcPTEAcCCTnC0sYKi5pMCQRk4+Oow936Uy9LvhavQ5HgSSUmPN56bMsH6ZRCKA6HooURCROYBSBiT4UDimyDBl5Af0gjbFwIx9vntLrm6EsF3NQ25YyZzaHiXXSkGaIYYfQFK3HiA5G+sJANJzewoJJfgvZwqOeAH7lXxrSPLDC+AOD9MZZdhQZYMNUsTKSK7T9/jcG/bPSiyVCoQ0uF8zKsF4wKUrD2xuR6HaMLjVRkHNi8AxBWMOajCqdOdmTKz3Qg5SAuYHvmColJvJ23iYEbF/4lJCjSc2PiJkfeVieWL4dhltuc6qCmswKvSSE25F8hxv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgwNDqgy2dAr56pOy3lZQDVKHDCTzuOBgNfaL4VaLYg=;
 b=KfObQcRx3LAofpaCMjOtISCxuqJCD3R8k7sFIVAvZ5L4uMK2q4hXLHpN5BPw10W69FLkZqk89Yy0c1iV/gMaceGPbnpX7YonwopDmEf4CVQPn7c5SPqLj3vzC0EhZpSzMr0/P6vFiEQ2EDbfhen0e5e7J/9TqRUvgm/iV66hLBoDmBzFssCGfjrOLxkkJM971OzoANr6J32H2vj8GaeTA+jxdFHRn5Cs66tTQwhP3QuY7xhIg02fPilgjbv76bGdiXAecoJ/bIJDqkyo+AOTfeRNqB6+FU7PubokB4FzExYwUeckYRZEQJ+xdkehXJfmE5Vqqy0wMcJBL+uga8tzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.13; Wed, 3 Jan 2024 09:14:55 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::8ba4:4bbd:ce09:b53c]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::8ba4:4bbd:ce09:b53c%4]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 09:14:55 +0000
Message-ID: <b8c721d7-f49a-9c74-bbad-6ec0c3d36545@windriver.com>
Date: Wed, 3 Jan 2024 17:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240102083755.316126-1-Qi.Chen@windriver.com>
 <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com>
 <06339c1f-9523-71f0-a6da-0b627ae1d480@windriver.com>
 <CANNYZj8URXrhQm3i=xZb+R0n8tZg3C5tzd1jRD-DBEzygX06rA@mail.gmail.com>
 <7861b680-41c6-9a1e-808a-91a75afcf58f@windriver.com>
 <CANNYZj-eG=fjCcsuMS5LycEmQWk3NZ4s-Q1iWuAJd1Ahd0UjCQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-eG=fjCcsuMS5LycEmQWk3NZ4s-Q1iWuAJd1Ahd0UjCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: bfeaabe0-3acb-4928-1daf-08dc0c3c7311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FZkCptB1K0P0Z+KPlsDZEcT/vdLso/WJl1atZa8v0BP5uMy57Q7ucgJF4t1CeRzSsf8WBMk5uani96+0W0CbQgW8pK0e7QjuUjn6yZ7AaGuQY2HEZjVq+jlVtZR+x+xuml9PVkf4bSdetNX7GMhImCbzucI4yQ/0/uFbIkZqGAuME8fsyz2Vv+YpFV8CAuzeGd1RORhL0rAHJBoMEehqiH2lJma2jFKDkTcZIEpiAoj9v6rKd/FTpvoGOofJXVcO7QgCeqA9e/CpgqNjpAJflUzRb5Kk6uI8Hv0kKtkK/jMa+g6LpeQNwrP3kwyjf9RFt+un3GgReyzoBb+FfgONRh9vRaMuw/vZEiIs6uEZpb5+eg5E+Q+UdFJp+ldoBLgcPGYzOPbadfOHVW5bhIrfjsdkDz4VrFwk2kOoRpq9pyyJEXaoBV1O3zAshnL5iFDZ2v5NBznbgj+jHbcYuvZjZP5LZX36XGK9er0aEhbAs30dNLggzAXp30MU+O9kmvYzMh6cbB3/x+KPXdQB7DJ6H1C/FF+7g+XYoF+hZhD5/GHVhHOleloMPS1AUwSsg2b6qXZgH/W085BAdszmp7QcbsnTmeAiKxlAa6ZiGMulpu4cR8+qmWpkTSWE0o08KqrfaeQkY8IcvSIGrdCUr3R6tA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(6506007)(6512007)(53546011)(6666004)(2616005)(5660300002)(4326008)(41300700001)(2906002)(6486002)(478600001)(966005)(316002)(8676002)(8936002)(6916009)(66476007)(66556008)(66946007)(86362001)(31696002)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MG45ZEZzcXhpalpBaDV3NW5RT3lmVlpuUkNoYUxEMmpqRjF6ZGhDaUdFT1N2?=
 =?utf-8?B?NG5OdzZtRDl0SFFnMkUyaDFxRlA2TmdJNkVGZ09WSlBVU29uTDEreUNrMllN?=
 =?utf-8?B?UTArUndQdVZhNCtiSzhIRFR6dXJobGh5L2Q5TTI4OXVsSjA1MWdBN1RNZXFC?=
 =?utf-8?B?U3VxQjZ5ZE5hTnpDWERYcFBlU2xRVXdtWjdnUE5tUkhKMFlvYzM1a1pxVUY0?=
 =?utf-8?B?RCtzdjhMSW1GTmFScEY3UHBkQWhqRldtVFpNV21Yd0RvL3RCYzA1c2poSy9m?=
 =?utf-8?B?bldvcFQxMkFPMFdKekg1TE1iTWpocWNTYmlLM0JVUkRvaFMrMTdDZXlKVmo0?=
 =?utf-8?B?YWNLRHgrSVgzZStBZy81MjBpOEtTQ2dVQS9JZXVkQ1B1M0JXVzBUbGdhOVJr?=
 =?utf-8?B?OXlsUlVKMHFFSUdtbXAvTEFJeENBM2dGejk3UGY0LzJFMUc2S1pVeFlINlp3?=
 =?utf-8?B?ZVRRUVVBWmV4enFGNmY2M1FmbGREL2V2Q0hTNkYrS3hweUhGS3hDOHNtUHFD?=
 =?utf-8?B?ejVQZWVKZVVQOGwzd01ISU9scTZObitzeUtNdXFRbVdpeTl2MHhsZ3ZTdm5U?=
 =?utf-8?B?VFhDM0puVERqejdhQU9ocnVEQnZzNDRiNmpIUmQ3TkNxbDRJVWhFZDJUc1ov?=
 =?utf-8?B?cEU5VkF2OUZ0Z09iOE05VnUrOVNCa3JLZklIT2JIY2lDZVg4OU5pOHJjN3FI?=
 =?utf-8?B?SUZvMXNhMk4rdXBtNDYxOWR4dlZKeFdhSk8vQ2VGVDNNNTVwTklhMm52RU55?=
 =?utf-8?B?L1pmRjh2VFF0ZTJRM0pobitibkhjeThrb2NReHN3elVpYm1ENXJ3d3c0SlBW?=
 =?utf-8?B?dWhaUi9EYklQQ25UWGp4Yy9ocXptdWpkV0RHbHh6ZVBXZVIyVlp6azZzWEE3?=
 =?utf-8?B?VFpZN0I4TTRxR2RwZzlWQzk5bm4yTzY0a0VITnYyRzBqNmVISVVGdmRzVmps?=
 =?utf-8?B?M2xJK3Z1QThQYkZnMExScmZxVmhPRFdDWWxRQ3dZMk9iTTlVZ2lTRmtjN3pz?=
 =?utf-8?B?SU5HbFdpSkxXNGI2eTZ2djVIMlVIMFhCSmdvVlQvMnk4V0J5Njl3VWJIQUxn?=
 =?utf-8?B?dXZVa002VDUrQjdXVk9GdDE0OCtNWXFoS2t5SVM4UlY4VjN2V014RzF5bkds?=
 =?utf-8?B?aWdsYUEvbU9MM25WWFhPQUFGZ2NUVmpwanpseHM4eWU3MU9uVGpQYzBFWi9u?=
 =?utf-8?B?Tzdhcjd3VzN3czNxaDIwZTR0U0JoeHBkQkhUWkJzSTFBWDJLemppdXo0RytO?=
 =?utf-8?B?bVZKenYrZTUvanBOK1hjT3NsaFoveDdtdU1hd1Q5U2dIVFBZN1JoYm1CV2pI?=
 =?utf-8?B?S1Q0R2tzUytLODU4dEdhREMzRzhwSmxDTE1Wdk0wQW0vL1B3TG4rTjQzcEkx?=
 =?utf-8?B?S0prSzBDZUQrTkxublYrZ3ExWDJMYmZ1VjNKeEhWbzI5Z1lMOGthSEYrVHNn?=
 =?utf-8?B?YjlpbnVDRmo4WTZUVThPSkRERVZSbnQ4REhZMFdkNEVBbWRkUEJScWkzaWJH?=
 =?utf-8?B?SFpmZlRLUEJ2MUkxaUhxUmYydVlXKzdLY3hNMVorUVhVd3MzdjhmWm94amFL?=
 =?utf-8?B?cS9PMGNqakJzN0NaZlV3bnR5ZkRUL2FwTHdLcFd2djlaZHFCNWRHQ0o3aU14?=
 =?utf-8?B?WVVXN05rWm5tWTZNSTRmS2k3Q3FNL1o4MnAyYmpqNUo3QUJZaHU0MGQ4YUxQ?=
 =?utf-8?B?ejFjVFZxYUR4QmxXMjBid2s0Vm5La1h5Q010cW8wS1RLMG0rQUFRMkZzWk11?=
 =?utf-8?B?VFNONS8rNTRLYlZ3aUcveEp1NVkyUWRRaXNjN0VvQlpDbG9BUGdzZmg4T2tx?=
 =?utf-8?B?MTNNdVZlUk9BdW92MStFQzlQZVpaNldJMjZsSFlOZk45K3ptYithQ25vbHVZ?=
 =?utf-8?B?WCtmNXhSRGJ1bU8xblVYQ1NYV1J3VkJjclBVQlNNb1REMzRTWnFUS1BOVHoy?=
 =?utf-8?B?U2JHc3RUU1Q5c2daMkczeG0vaXY2Rnd5MmlRbnpnazJtRFFQVHJFVGgxeWg5?=
 =?utf-8?B?clhUdllyWkxDUUpCUFdTWUlKbGloOGJsM0tleFNxc0F4cCtwdnozd0QwS3No?=
 =?utf-8?B?UzU1Wm1jdDJyRk4yS3QxeDNYQmpIMTFLTmNzOFg3Y1JyR0VYWWZEQllxNUdy?=
 =?utf-8?Q?56p1XCOrLvkkwB7n2CI6AN42R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeaabe0-3acb-4928-1daf-08dc0c3c7311
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 09:14:55.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qv3Kl7Thsje7E4tfhVN49Jo+Q8oKKZJ5Bdg8a5ZfPjmgpFQRqL948uFKG5/Gnp5F2j9V3XAEga9FL7Xa5CBvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
X-Proofpoint-GUID: 75oTdAOWVeC8zofw18nc1KlHxuZzTFwq
X-Proofpoint-ORIG-GUID: vSLvnNoHNSXrgmlWv1qwyGHD3FZkTTjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4036v7nX016023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 09:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193278

On 1/3/24 16:28, Alexander Kanavin wrote:
> On Wed, 3 Jan 2024 at 08:45, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> On 1/3/24 15:21, Alexander Kanavin via lists.openembedded.org wrote:
>>
>> This works as expected. What made you think it=E2=80=99s broken and ne=
eds changing?
>>
>> The 404 ERROR that 'devtool check-ugprade-status' prints out to me unc=
onditionally, which is all upper case to catch people's notice and can't =
be avoided by any option.
> The version check detects if the tarball is in a versioned directory,
> and if so, it goes one level up, and tries to list all subdirectories
> from there, attempting to find a newer tarball. So the real issue is,
> why is it trying to go into a non-existent 'sha512' directory? There's
> a sha512.sum file in here:
> https://sourceware.org/ftp/debugedit/
> but it's a file.
>
> If this patch is applied, on the other hand, it would only check the
> names of those versioned directories, and not the actual tarballs.
> Which could produce bogus results if for example 5.0/ directory would
> contain 5.0.0, 5.0.1, etc tarballs.
Sounds reasonable.
>
> It would also help to suppress the noisy output from wget altogether
> by default, but last time I looked into it, it turned into invasive
> changes at the heart of bitbake logging, so I abandoned the attempt.
>
> Alex

Thanks for the info.

Regards,

Qi


