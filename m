Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408BAC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 03:20:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6870.1664248808162400336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=epYGRF7m;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626978c8fd=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28R34fEZ012165
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:20:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=z8cnqImApvr+9t4FJ5yEWKWSgxfvLouvkk4LYA+JoAg=;
 b=epYGRF7mqY5Un58HaOHR1Y75NC+B8VQzsdrbTMYIx/hFB0TEAvqYaLx2wQi24Rb689oU
 epxZEoEZheeuYMhKAuwDa6sr4NVQrCCOVNx/PoY5e8g+HmI5ixcK6xRQ0838pdvdMC8U
 9xHQ8pn0Sy1wS8AdRNnicC7nzuc8fqR8J97o2VqzGgGV+Lda6jDLByqdeClUDQqQiHAx
 FynFd4erx+gsocmS338d81jV13KBUIHD1xLA6j0vwgFag5krj4WnvtBe4FRDCJnky6MT
 sInhOqOtaAiNmohvOO/ybUEGX+8V3mzat3LmQeLJLbrGRhTMXrKfaTFxGBslfWqMH3xt xw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk9vmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:20:07 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R3GIeK005092
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:20:07 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk9vmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 20:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIymrVuUEs81hyQgN/EdF97O24huXxoZPiobjC/UjDkRwgYwjdL3PZkDGqNiOwE6wZxAFPMJpirM7zVf7NzE3lw697cuYaY6uWEPzhQacLnUq8whMS8QZxqWXf1z6v6FFyjGm6D8lo2zOEAI7UW2Dwm0WwlwTPf8Adoh2+tXeUzugU5xO7QWMlwT1C1QfBpSCmAHWCx/7gD1k1invygi7D8BEMNeHvAPrdaqMgv73QPXhtt+FwF0JrSU8p3Oz19wkYdKb+IEdqoopbSHxap3u39jPoVu1Df2Jk3ArFU4vaa4+GklgtI4DFrnlTHo5FCBF1QOkC+1cySn2lcMLt6W5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8cnqImApvr+9t4FJ5yEWKWSgxfvLouvkk4LYA+JoAg=;
 b=NQhWDFlypdwUyWMqng9e+h/+r8pmq1EFsdqfLl7X6wR37s4FzxpCm40jl7Qg9qgXHu3TyjTPL6wQSkCi6P0axO+qnnf9jujcTp6Ey9a6ce82zZ8/iwg94pC3/u2LSmhoGpr5UekOEHGWPeeQvEojtvJU0d2JsjyETSThDwEBZRbSDIXLYcIOxgmEJET3RgHLMlnnzNvtoOf0xC7iECSjGpDxhmvPeHTgddK2PoQb5JVKlgIkfFOD86MLOr+CdBd0o3fYaOMT63xcsxGHgqGScaXE1ECWy72AX45kpPVABMo+ohwzy5tqiadRSbv51lAvsYqhqELFyVMorNbjvb1OWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 03:20:03 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%10]) with mapi id 15.20.5654.025; Tue, 27 Sep
 2022 03:20:03 +0000
Message-ID: <02b7972a-e2ea-812f-ba78-6e165737c3f8@windriver.com>
Date: Tue, 27 Sep 2022 11:19:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] lttng-tools: Disable on qemuriscv32
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, jonathan.rajotte-julien@efficios.com
References: <20220926080807.1625573-1-zhe.he@windriver.com>
 <0ccee561-6f18-d5f5-1b54-7c75368057ed@gmail.com>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <0ccee561-6f18-d5f5-1b54-7c75368057ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 019e6224-56a5-4a18-4c28-08daa0372b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nTIQuFJGC7NR7nWSpGD70LIDhdc+0N9/L0qw4KntbhsWNyw4l0qftciOMJoVuMaRjzbYp3DuwM6rHCgI//AMdVhEnGSCIWkYnDrsf6UdPAzS6I55IfaULAV4DkDJo+fRmXDGh4koN8kMqMnQTqGRAMfq8pXxL5OmT9lzVdfm8AXl4Q9+tha6DAKYEhwEAXyZaquJ0OgsgJGopvOTUaVSka6OMA9Jw7UXdiF8YxNpPPaGTYgsSMgvRR9tmIIirNj/km7iSN3ttbOK9/K2vWvJgkuckwmz6OsDvk/vNWdnJbg0usZEnyuW0sKvZxuLtMazX9osSO+XscexblpvCq/bf0FkNq2m86gkIufUl5YHMb6GpxXSsEkbKE/ZJWOXBXJvrwkg3skZ1FCiVgmuQqnupYojZleHrAsi1nxP2QD2DBieXl3p8c4Gui3WqHv86F3qlPTTuuqBsgBgk9MayR+pOrVAcCbGmzErt3hdHhzVFb7xQvt72BVjSSvrM6MpUFPfHivgEcKEOCVcUlp1RC6anTb4+WpJpR7Qplk8T1+GMq5luL+9lFaUSrDgBq4MFHkpbNHOP900xOrNWIRlHAFHYRLbuiXpaueCjJy4C4hZj8xxWolzULlRnQ+P6PXoBll0ucP0RaqsRFxnJv+iJXC8DvNJeFXfjIDuI4yXTAoenZ4v4+KOmHqX4rxJaTuYOj33Odm1BzeGE25LPLW7qTfyvOcEA6aFq0r17XUXzqXbRGC0O4ZZ9Ek1IWy8h8c09DxUN9ZKPY+w6q2gEoeriimOaqNbSjg7tDswjn6VfrqcCJfDQ6C427jdg5FCBUQNnCVMkBjEIUC+KSNdCJX+SSNvvt2IstkjqWJNOYK4BHca33Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199015)(31686004)(86362001)(31696002)(66476007)(66556008)(8936002)(36756003)(5660300002)(2906002)(41300700001)(66946007)(4326008)(8676002)(316002)(966005)(6486002)(83380400001)(38100700002)(186003)(2616005)(6512007)(26005)(53546011)(6506007)(6666004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1hvcGdhWUk5VDY2YmVoTFBhMk1wbGxVd1oyempnMHZaeFNHeTJDd01SS1JE?=
 =?utf-8?B?QWk5cW1ZM090bFZwcXk4alRqVzdPUkRlcVZiRUhpVTlsdER4WUYvN1lnTFQ0?=
 =?utf-8?B?WlFFRitENE1MOE1pdmVUNmNidjJMaFFkeVV2WkUxMUNSTERGRmFtNVhDQkRR?=
 =?utf-8?B?azNwVTV1eTIyRlIvaGNpbCtZUW4ydjQ5RWV0elpGdGpMVnFHZjhIdHk2Uld5?=
 =?utf-8?B?WFhOTExjejlkWU1aczExbUNNTW9nQlRxMVFiUzRqUzRxZUI0TlNwQjRKYktz?=
 =?utf-8?B?aWo1L1JURGNyNVRKNFErVnZ1MHhia0dUWEpZd3poYkNUYm8zbWZPWXNzWi9J?=
 =?utf-8?B?ZVhURjgweGwyc25YMlA1VTFCT20wbjJrUTRBME9ERE5pd21GTUdWZjFJTjBJ?=
 =?utf-8?B?R1VWMmlxd25rUXFDUmNPRjMvME9hZXRadSs4Zms3ZmZ2WlJEUHpjMVRFWkt6?=
 =?utf-8?B?WGtHQ0FQY1JFRzNjM002b3JRNUtuTWR4Q1JaWnRmaHo1cUhCNDdQcWJiUUJu?=
 =?utf-8?B?OEppY3NCeFViWDlQM25tUHUzclczUmV1aWloSytXY0F6enE1Mi9PWmpLbHN1?=
 =?utf-8?B?T3VQRU1JK0N5eFJrd0FGeHJURVgwWFh0OTZTdlJCd0kvOEM1WDNkeTlRQ0o2?=
 =?utf-8?B?N01CT1JQUnIzdWF5WW5Hb1BiTnp5bU96OXJ2ckJFZ0VvT2tJQ0xDcE1nelky?=
 =?utf-8?B?Ukp1b2ZZV0pwNVdoQmZKUjFlb0NBbnE1WHI3OWtWaE1qYWJENW5iQ0w0TGVO?=
 =?utf-8?B?QnZ4L0pwcFdyOXRCVUJkWTMyb0I0TUJIRkNyS3lGS1cyMnJMYUlKSUx1aXNJ?=
 =?utf-8?B?Nm01WDZNWUdLWEFFRk84VU0zRURYcnlnUDZpdjU5bHRBUTQ3eWVSMGJVRmdP?=
 =?utf-8?B?ZEg0N040YlRaa2NZNGtuOXFLTmEvdlRmaE9pRjBxY0hUcVVCSFltdG5TUmg4?=
 =?utf-8?B?N1drTUl5Q2xXV3BTRVFvNHgvTWdFZ0ovRndSUUNDU0krM21Ib0Uva2ZsY2Zh?=
 =?utf-8?B?cHd0d3BvREVtbUpXT2Z1dE56VVc4RlBCM3pGOTl2M2lzSW1aNmVHcmZtMndX?=
 =?utf-8?B?S3FJSkJhODRwRWU3MVpQVHprT095dGhOTjZPdnpwa3p6VkR6NCtWaDhTMmNm?=
 =?utf-8?B?RXFzNkFZUlY3WVgwMXVyemFvaWZYOGtNY3BWM2NSb01CVjFJd2ZqVmFVdVQr?=
 =?utf-8?B?d3ZZL1cvM0YwVHdBdWtqUVdhcUtZOGJzYTFFRWhULyswUGdoejl5d0locjdl?=
 =?utf-8?B?NWJXVXNPT1pXUGJpaHIyYTMrUGlFc1dXNzFoNVBvTmdHUXZOTU9LOU1LdEkx?=
 =?utf-8?B?anV5a1BLa3BMeFJsWFdLWmU5ZzNpb2xZR0Q4ZW1Ra2lhaTkxUHpJNnJ6MnVr?=
 =?utf-8?B?M1pTNlRDNWxYaVZQU3BlNXdLU1J1Q0hkVmpGYzNBU2ZkcmFqazVweHM2U2NP?=
 =?utf-8?B?UjZmaGFneDBZVWErRS9UZVVwZWdLMTNoZVdCeXlGbkUxK011eWdGUTlndTg3?=
 =?utf-8?B?UEh1bTFrb1d6YjJSWnlQOFBiblROWXJyK01ERTRVRktmYTNzblF5RkRnSjdG?=
 =?utf-8?B?VXdBSUExc1ZmMEZXQW5pM2RudjlVK2VJVllyTjNzVTBCMnR3aXNzNFlVVUN6?=
 =?utf-8?B?S2lIS1lzeGV6VGxZSlhsb240WmsxL2hKa0RVM0RYUEFyK1c4aXhyclFpS1JN?=
 =?utf-8?B?V2FhdStQZ3lzZUhUNVFnSXNmbW9rV0JaeFRERzZSOXNoSG5HR0JOWHlZSGhw?=
 =?utf-8?B?aWVaclJVLzBTKzdBRTdKblB1UndHemZpY3pyNHMrZU40RGZDNTBuRkVuclJj?=
 =?utf-8?B?QWpvZmoxYVk5bW5GY0wzbXNVYTU2TjlCQnpBeGJNL05ZMGZyTjFEbjhDa2Ey?=
 =?utf-8?B?Uk1JSEZ1YldCMHhGcU44dUxaWUxIOHJKN21aeVhvd01sQldEdGREZkN0VGZO?=
 =?utf-8?B?UEtXM1lTQVlhU3h5TVF1anlEcXpUNWpoYmxRVDFxRE5HOGhVTGtpcGhQLzA5?=
 =?utf-8?B?dm5majhweFNuWFIzWXpuVmovWlVkWjA2RE1PbFlRTXU3Q1pVWVBCNkFyZXZk?=
 =?utf-8?B?eXNKQUNYekRCZWVDWklYTGN6cUJWRWlqM0hBejFsaTFvQkVGSjZCUm1JQTRm?=
 =?utf-8?Q?toruxpDZuchvHnH35jObO3CMH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 019e6224-56a5-4a18-4c28-08daa0372b0e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 03:20:03.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QMRNhHa8vqSwe79cDhkoiXxAsvNy4Rz7m5DapUJ6LiAU8SdtZj+yMzflVbFPr9XDHr5QXul2Lcijw2TRmG4vZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
X-Proofpoint-GUID: kOiEElrPL2CQ5qlf71svKGcgWYN5VXdH
X-Proofpoint-ORIG-GUID: 6rhoAAK0jIWMuWOFLEnJ3h7rAKLPuBRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=787 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28R34fEZ012165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 03:20:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171083



On 9/26/22 23:58, Khem Raj wrote:
> On 9/26/22 1:08 AM, He Zhe wrote:
>> lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supporte=
d on
>> riscv32. This has been confirmed by lttng-tools upstream.
>> https://github.com/lttng/lttng-tools/pull/162
>>
>> It's also turned off for riscv32 in meta-riscv.
>> https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>> =C2=A0 meta/recipes-kernel/lttng/lttng-platforms.inc | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/reci=
pes-kernel/lttng/lttng-platforms.inc
>> index 933c65d85d..98b13b194c 100644
>> --- a/meta/recipes-kernel/lttng/lttng-platforms.inc
>> +++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
>> @@ -15,3 +15,7 @@ LTTNGUST:arc =3D ""
>> =C2=A0 =C2=A0 COMPATIBLE_HOST:arc:pn-lttng-ust =3D "null"
>> =C2=A0 +# Whether the platform supports lttng-tools
>> +# lttng-tools requires SYS_ppoll and SYS_pselect6 which are not suppo=
rted on riscv32.
>> +# It's also turned off for riscv32 in meta-riscv. See https://github.=
com/riscv/meta-riscv/blob/master/conf/layer.conf
>> +COMPATIBLE_HOST:qemuriscv32:pn-lttng-tools =3D "null"
>>
>
> Its perhaps better to disable it rv32 wide not just form qemu.

OK, I'll send an update for that.

Thanks,
Zhe

>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171052): https://lists.openembedded.org/g/openembe=
dded-core/message/171052
>> Mute This Topic: https://lists.openembedded.org/mt/93922533/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


