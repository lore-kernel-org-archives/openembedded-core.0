Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CDBC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 03:12:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11394.1705029137226633762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 19:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bXKBBOlb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17418cb69f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C1x4Oi011057
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 19:12:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=PPNuJlEox4dvDvp/poardYDJ70puDXxlPMmqAkeGwEM=; b=
	bXKBBOlbdq+eYPxC3nzSgYLWOCIw94a17ha4MsoSr1oPBTKn57EopUzcY4lEKq9X
	kC+mTyqL71RjgvaLCA8BuX5IBWImpIrZiRouwolaMf2YIEG6hqu/17cWlCUC+O+B
	vhA34mYD9UchNg8srHSGMpcoci6YPclSgCQf80Vnj2RGb2mLHGbd/nuA7SCQlQp3
	oXnAMKQCBpTAYlHquaKLumSfRiQNgaXPETUsHUA+d4bnwOuP8G25tBu1nExy6rPP
	igrL3BVsKJQOAvna9xVT0MiIEYJiQVHQlDx2RT8dbtj0pNApRbqojMFm8CwvxAXj
	atCuFSLjyWldWtEovczGbg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vj72rh8bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 19:12:16 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40C3CGBh032047;
	Thu, 11 Jan 2024 19:12:16 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vj72rh8bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:12:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZwM24WB5aCIoR4J4HA3WbwdkPXqvqhuZkG1p3iL489hibzx7Dz0m1VXWIgsHpx9vSn/02GHKfKQdOYtQe8rQY2XkxDF3pph1zs2ew6Grmo/NLuYeeTW/9kZeZ43pwqUixy6Wwh1Fka8sGXnCVq6xmWnfrywpRwEhl+hQX/SbQFU+kYmxJPMKtwrwAAEjl8p7CLS/fjsC6jHHGm4h72tpi5Sas2mXKYeIGPsK6UUOGO5UKTlFwMpn6IMaLYik68TZRSemjG3SOobi7u+drI1gldZlOGd8PgaUN+/dHluqpKtEbGR869kEZ8H9E/CMnJhrs+CkUNpNbGSk7CJXGRuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPNuJlEox4dvDvp/poardYDJ70puDXxlPMmqAkeGwEM=;
 b=lnZ+pOEnWyeAZpVuicq558Vmb/obIezMielPZUAgJzte2LrRAM4XXE1GP4/kZHaXkKoa7JaWM306U05Mag1ZCG7LtExHBykvSxUnbioNAHBnuz9oqPcM9s+XFQYS65X+B6BLiJ5S5qbxYicxh7W7w5v01RPZMyYDFCc1Rdh6js+fagOa/26nPIJ/zs3blWmm7Brt6yAboe+UvWw7Mg52L1/Qx8GDC9Ncv+ityPTpQRIuvse//mwEi1yZ0TcV4e1kJVjMHF2J+VXO2sJc1lE7OKPFpvRI35HobnxS1ptRuc7/y6WERtognd3sHfZ3PT0BZWM4eJeM4CP7zTY3mak90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 03:12:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 03:12:10 +0000
Message-ID: <257b3e66-2cdd-b5cf-7a4b-532e32f9ff3a@windriver.com>
Date: Fri, 12 Jan 2024 11:12:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] kernel-devsrc: copy source files under tools/
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240112024357.2656128-1-Qi.Chen@windriver.com>
 <CADkTA4P7NZGEpe4t=PdG3e0558xr9+QcuM8wsv9wQM6SN6rOzg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4P7NZGEpe4t=PdG3e0558xr9+QcuM8wsv9wQM6SN6rOzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 62593b48-5a84-41ac-4214-08dc131c4431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5nGWCc49Cxmly4m7xQJJ3640oUR8FAyHIZju7qOOWyzFVrrJtM5nQ+iOuhL1V9nNUePMo8xz9nwnxFphmW9FRxBNP0IEKBm74Irk4x6pTSoyvprF2+aKZoM+DGCLkP5sqVeHEAsYSgJDzcWSAI04ZnKj/KMGuR+mdX3PGdP5jHPOYlKD9D0wsCSV2f/gxpvyCXw+FaVu8DsF31O4jtxYkhHqqe2fqwZ+IOZgymUNI4z7xSwzAUYVsD6RN6rFhW+uINdWBCmS5B5N4/Ho9ksj1frCqjrN1Eyd4Rio/QgdtEwGg075SRvZGNb3Xovycc5UbExE6YswwsxwRWNSYocsatzSHQ1TX7dgTrRm0bHUbKl/dZbosUiUw+OaiYa8sN1Ta1m0vuSU82qgbt/v/MIr4JuXPhEKKQBQwCi3ujJs0b1l3tzL0vdle3js9joYxjq7+JDCBDaJZNIo1CGqPVQmukodg4QIvzsV3mGkZdfQWt6B29xMwcwmViw9b4g9oiF83DHajd+Kl8Dmy44k/v6bbn+nFOihhaFWxyxLMsshUAO2KHmw2rki4K/y2+XyDtBWf82tbdl+4DtFoxy03C8ScbcvHDsJhW55eZJuePqOARyey4oRslATJ0xnuztwmL9JziaD9H4l34N+BY+EhuWBsp4BHRjn09cwL5E4lllfgV+/F+UOCU0V7nDPROEmdZdH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(36756003)(31696002)(66899024)(86362001)(31686004)(26005)(83380400001)(53546011)(2616005)(6506007)(6512007)(966005)(6486002)(5660300002)(6916009)(478600001)(66476007)(66556008)(316002)(66946007)(8936002)(8676002)(4326008)(2906002)(41300700001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WExSbEt5ZkFMSVJrQjcwMlByMmtYVmY4RUczQnBlbzhVZHluRG5MMnFjOEU0?=
 =?utf-8?B?S3haaUNLb1dYSUx3NVBNOVgxQmJUSk9rM0MycTNnWDBYVnNqcUg4K2tzck1q?=
 =?utf-8?B?VGhGVldXcXNGVG14UGhVSWc4SDJGOUJvbm9SbnFFV245b1NMNTQrbTE0ZjJo?=
 =?utf-8?B?SDk0T2p0MXJoVXhwN0FqTm90VkhhbDlGdm03NUJFUGNZNnhBUFZHV0FFdEpr?=
 =?utf-8?B?Tlh3Ukcyb2JCRFhiRHRuYnVMbERIME5hSmY4Y0huazJsbzYwZlcxOGhrWXYy?=
 =?utf-8?B?ZlpibWpkMG5kWENGRkR2NkpaRGs3c3NVSXZHeFdaUnBvbjhqUTdwS3hWSVcx?=
 =?utf-8?B?Y3d3Tm1TRE10NUZiZ1lmOURUWXRNMTBUVkRCcGRoTW1VVy82MkRSSitHbjZt?=
 =?utf-8?B?OVRMVTNYYVIwK3JLdkVDUUYzQWZJendNU2crYy9xdHl4VXJocVBpbXdyc2JT?=
 =?utf-8?B?N1ErMktNM2hLUUdXNDlpWXcyTlowNkFNeTlzL29qb3MyV2F0dVJmQk1Ldzhh?=
 =?utf-8?B?R2lTWjdOVUpPc1A2alFvU3hHeVpabFUvMWFBQk8yeHViRjc2YXdKMWtSQkhk?=
 =?utf-8?B?WkFLV0Jnay92TkNLRlBzN0JGMFFhM2lvVkk5QldyUzZJS2VxUVV2OWNpMmk0?=
 =?utf-8?B?cFFuTGlFQXdvdkM0TzU5RjczMHpudWhZZ2ZjL0t4M2NMWTM3b1hFWTNlcjFn?=
 =?utf-8?B?RGs5R2hQdm9OZVlvRlVXNEgyMTh0SGhVRkxld3ZXd2pjRWZtWHhlR20rTzVX?=
 =?utf-8?B?R2prbzg3UmFZYXg3eWhaVEpPSzBQa0NFZ0RBYzlZYUJhTTBiSG1NVE8rczBn?=
 =?utf-8?B?ZEp6dUcyQnpqaUsrbGh0SWFtVElJMGN4OG9zdWpMcWJORWlLSkxFaWd0clFV?=
 =?utf-8?B?UGtZWmRXK2VIaTNDSmhmOHIrQ2RlMGFCSGd3S0dXOGFyMVlRVHpPb3p2MUM2?=
 =?utf-8?B?N2RxcFZEVXdZbjFnYVdoL3ZPNklZYjk2Y3RBQ3VmZ05saVlpYzgraDF0YS9S?=
 =?utf-8?B?ZzU5L1M5RXhwWHRnbGNmZU0rUXdGU0xvTU9OQ3dlbmI5OE93SmVyS2szbWxj?=
 =?utf-8?B?ejJiNkdGZGgrWVhWcmpweElRYXhQUlRFWE9kK01UNWdSSGwrekk4Wk9wM05N?=
 =?utf-8?B?Sm13N3crZXhNbGt3OXd0WGZsQlFiVkNIQTNrWGdlZ0wxaWc0eWcvZFlZb2dH?=
 =?utf-8?B?NWZBbGpld2FSbUR2NGxwcmNrZ1FadlJZYXRTeERkNGN3ZUhOei9VZUdRT001?=
 =?utf-8?B?VTgyT2lUQUVXd3ltWndSWmtFdWdod29pSjROZlNVekRULy9qSFhMMFdjQlF6?=
 =?utf-8?B?aTAxMDN1ckxBM3VRRTR2eTRYalZmWGJkUlBWOWpKTVo5Z2J2aWhoM2htL2NG?=
 =?utf-8?B?RzlsaEdEYUJINFNmS3lXKytRS1lJNFRXR3dOT3ZNRVEwd0hPRTZzQTFhdk1v?=
 =?utf-8?B?Y3JTaEhXYU02cE51QzZKL2txd0lYc1JpYlk0bUFibkUzMCsxS1BuSzZ1TDBW?=
 =?utf-8?B?K3J3LzNGNlpCSzlkNmJnL3ZFMDNYVE5HMU5iR3N2ZkdzekNQYnYvRU1Xdm5l?=
 =?utf-8?B?UkdJMWxVa1hydmUwRHhlWDk2VklSOW1UTm5FejdBd0Z2M1p2UzNmQW9uSnhr?=
 =?utf-8?B?ajRUc2tvQk5SS2dxYkREejU0NWZxUDFTQnl1U2JhRWhSejlSbytDclIzb05z?=
 =?utf-8?B?bUt5alU1SXVWOWM5d0lreDFMWkNNVjJLWUZEZlJIRThhZkRHWkNleWQxd2da?=
 =?utf-8?B?ajNCalFCMm8ra1JJcDMzUWpqNHZITXU1TlZmVlRMOHlta1hYQzVmR1ZUZlRT?=
 =?utf-8?B?OGgyOTlXb1J3TVd1c2FFUkE1WUtxeGwvQ3g2WTBwblBhMWNPdzhtZ2Y2b2Zo?=
 =?utf-8?B?WGJyU2F2dlp1bUdQRnF5TjE1a0RBYXhMeXhBcExJZzdsVzNvUmRIMFVqaWps?=
 =?utf-8?B?dENoZFVpS3I1NkFZTHNRdkNWbzRVYjBzdGcwQVFPOXM5OGJPZFRIaGtRRjBj?=
 =?utf-8?B?REhHUVFhUGp5UzJQTVhFQ01hK2N4VlNaY0xFbVp6OW1Zb2dndFQxby8zNWpw?=
 =?utf-8?B?bnpzZnZsZnc0VjV1cnIwL2VIWjU2UC9NYys4R3JRaVVRalZzMDQ5NEJFNVBr?=
 =?utf-8?Q?IgJvy+jV6rifripV0ms8p2gbN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62593b48-5a84-41ac-4214-08dc131c4431
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 03:12:10.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK8of/Q+uFzlSKm22qw4SX3Xblq8ayu5zuce8bVKeXGlMvhUEQYfnobsxtqWmImexukz9B/eigACoiNt9qfyUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
X-Proofpoint-ORIG-GUID: 17n_oatNV28LLch4qBAyjivbcpobSPye
X-Proofpoint-GUID: lOX0ugGxvkJLKYydQ3YGSCWRTmjS8bgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40C1x4Oi011057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 03:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193566

On 1/12/24 10:50, Bruce Ashfield wrote:
> On Thu, Jan 11, 2024 at 9:44=E2=80=AFPM Chen Qi via lists.openembedded.=
org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The source files under tools/ also need to be copied because in
>> some case, they'll be needed. For example, in case that the
>> CONFIG_DEBUG_INFO_BTF is enabled, we'll get the following error
>> without this patch when doing 'make prepare'.
>>
>>    No rule to make target '/.../tools/bpf/resolve_btfids/main.o',
>>    needed by '/.../tools/bpf/resolve_btfids/resolve_btfids-in.o'. Stop.
>>
> Tools has been excluded on purpose, as it is relatively large
> (and complex) compared to the rest of the curated files.
>
> Figure out just what you need for bpf, and copy only those
> files.
>
> Bruce

I can do that. However, I want to raise my concern here first. Does the=20
30M really matter, compared to the potential errors that would possibly=20
give users bad impression?

Before enabling CONFIG_DEBUG_INFO_BTF, things were working pretty well=20
for us. In fact, I was a little surprised that adding extra configs=20
would result in failure of 'make prepare'.

Not sure if CONFIG_DEBUG_INFO_BTF is the last one. I guess it's probably=20
not.

Again, if users are using kernel-devsrc for compiling things, do they=20
really care about the 30M size?

Regards,

Qi


>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes=
-kernel/linux/kernel-devsrc.bb
>> index ce5777fbe9..c2aeb8e216 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -62,6 +62,7 @@ do_install() {
>>          cd ${S}
>>          cp --parents $(find  -type f -name "Makefile*" -o -name "Kcon=
fig*") $kerneldir/build
>>          cp --parents $(find  -type f -name "Build" -o -name "Build.in=
clude") $kerneldir/build
>> +       cp --parents $(find tools/  -type f -name "*.c" -o -name "*.h"=
) $kerneldir/build
>>       )
>>
>>       # then drop all but the needed Makefiles/Kconfig files
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#193563): https://lists.openembedded.org/g/openembe=
dded-core/message/193563
>> Mute This Topic: https://lists.openembedded.org/mt/103676210/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


