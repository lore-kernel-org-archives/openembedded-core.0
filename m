Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACC9EB64DD
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 01:30:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11173.1689557442050165213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 18:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=gzCm3RkH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6562b8c1f1=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36H1P2up017190
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 18:30:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=XWO0EEDRW1YzlSxCE/uFOk6xxULlCPIGUqAnDiCUB4s=; b=
	gzCm3RkHA6YOgV8S1vqYNDJOXQmEf4WMV5NSGhOmw3g3jJmjyGT0YsKYY4TEdK8U
	q33hhbVHTe+xJjgVBbHtHg/x99kmAmBzGz9S3etbZbjQ0ekTajxNO+5WddpMr2q5
	aYPrbRbawTXZ2MHO4oy9h0gVCrhBUoAZvFSuxYmEN8cypmiHkXj5fkPqlrtm3gxE
	AY9FQEKnT4beFB0hybbOy+lmjBFRc+ns4mWyFd/31ATgiUfbZZrrP76brSkXQHbK
	mNeapXiit/5QOcDJ9h3Io2RQjbh6eNug+qghf5pK/Hj+3bH2+Rv9z6XUIZ+iOD+q
	mxJltQ/F0H7S3jyEtqAhmg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rutyes0rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 18:30:41 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36H1U55w024664
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 18:30:41 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rutyes0rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jul 2023 18:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSk2zE3poFr8IYUI74V/MwZvK4D18yGqa37zrEmJ4s2BJ5dmz5V+FwH9ouH9tJjWRxWHdbQ0dmgKQ0JlDr//oAM4bD7WuN2FcolS2DY/w3PbEfT4Y7mJ1ooRsipPAsm6NIS8ptVhCJRk+btDT5ws1mC5AUPFGUu1qx6bmtqVMdoNofjjeGoyPEaVT6nb+Asq2ZJyszpC/cNB830WFCmeyGkDbNghY6XWpQsW31+ynbTUxQ0YgvFdHDqAluy/BOU1rph/RrkM6ZE51aZE/PSKBJEJPlYtcZwInVDtD3Dj7g7nD3mOUW28X5G6VJ7AKLoI4u/w78Epy+iaW3AqNP7BYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWO0EEDRW1YzlSxCE/uFOk6xxULlCPIGUqAnDiCUB4s=;
 b=bj0Wa+C61rb4v/KvT31Jh08RCRwDi8aoGTmGToJ+DXQv4J4F/vW26izQhGskdNOXMhLv4rCmFL2IHB6wK5kGU+/SdNhmlIoZvE6munwYgPpGia/LAOIwisWtT1BEvnxoXP7cyBv3lrvVGWhzbzYNPVxYM7fGAPSY91pCs1wt8fRsKEWk+u58IZjAt+cNzEN5F8xMTTR7jEOYzemwqviRQkGcw1P6w+M02Oz7Lr7MhaQOrac1uj3oja72hLXVAu1V3bSU3VuNr2PSKR4BqBt/x8wLlelD0eWb8Kmhu15g4rztn0zaSNIbP4TIhAZTpeZMjP5eL6lSlyzbhlu+EMBQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Mon, 17 Jul
 2023 01:30:36 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::75b9:9bc9:f27f:1eca]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::75b9:9bc9:f27f:1eca%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 01:30:35 +0000
Message-ID: <f3d9789f-90c8-6b19-da5c-25332b6d9afc@windriver.com>
Date: Mon, 17 Jul 2023 09:30:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [mickledore][PATCH] libx11: fix CVE-2023-3138
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230714150551.3431226-1-kai.kang@windriver.com>
 <CAOSpxdbV17_3xhjNenniRfibF6r6Crx_+R8=+bebDeXNPcBKyQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxdbV17_3xhjNenniRfibF6r6Crx_+R8=+bebDeXNPcBKyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: a384d9fc-7a42-49db-a139-08db86656ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cTktiqFjfEXZtNlUVQFLzCuYZAOnXwnSBEkx257FLDJcYVDbegsXGpn7qo+MvvNt5QU5hWtAv/2+B209bsHEWdVCWbol07xIrQ9WwCCL5/TtMUWPk6LDPfv8/QRaHmdpgIpP1FQlyT2epW6d/SVsBHP7LSqK+BjA2QzcQUbA96xNw0DUobrTAL8oiGNWRX3pLqK0bdEYBUVs60F0CYdm4kKVEHKMPjwNUiQHV03Llxw4lXKEQ5F0Fq8aXQ10deAtO+H2HXCKtJWW58fFel8T1dIZmzooSAGoLJFlrdsZXcqihHGtjXWfW4q94FmaDSXRd3g0zN2q/dlsNIPfOn6K+MeMMd5GFHEUltWyci7LIwjkKRyMkQowZgS1MsmIVroxZNUm1PBm3xcJsx66Sofur0LNPkNDl08WVpDBuYRNIX72cPIFA4092pc8IZhYG9x2GKEYh1FYkcoAWEKPoeSKlQZfXLT55vQfHi4NMPk1PZxJK+Jc6lWddRkE5JX0+ADyHoSaueh6d4rpgoI/7M0ooLEx0+OAcp7CR9zaI2NL4d8ckkTi8pUNu88aWAPgVRmze4nRz8Di14WkNKb3KQm1+FqccDNzcxwpk0Gw6+JJclyR2PyYS1e0HQFAZ9mcCOQfVUDdYRSoCCLsZDTOIJ0BPSKad4n/BH8k9zteXWXYqic=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39840400004)(136003)(451199021)(8936002)(8676002)(5660300002)(66556008)(66476007)(4326008)(66946007)(31686004)(66899021)(110136005)(478600001)(2906002)(41300700001)(316002)(6666004)(966005)(6512007)(6486002)(6506007)(26005)(186003)(36756003)(2616005)(83380400001)(53546011)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXg5eDY3RHQwQkxkMlhWcTgwOHoycjBKaFVUc2VmYUtoUkRiNXEvMTNRT1VC?=
 =?utf-8?B?ZkV4SndzR2NLa1JpUWo1WEtnR1EvTzBjanY1OXhLK05zRk9jdkZMYy9MT05H?=
 =?utf-8?B?ZVF5UUdkeDZUQkRrOU4vWlNFeHB6UWNBN3NpWGpuNFZTSnFlZnR0YW5WakY1?=
 =?utf-8?B?TnNEcGZNQ2xIWkF5c2dEdWZYaXVlTGRmbitOV3E3OE9oWmgrSkhRc1YyeER5?=
 =?utf-8?B?MWdrME82ZlJ4azRqa0JRaW9jQ3ZpK3RJUFl5TEw5WUMxUnRVVHczaDBlWHRB?=
 =?utf-8?B?Nm0wRFpuQlI3anZvTStjeWRwQmtOcnNOZ2UvdERoWkhGSTQ1enFtWUh5Vk16?=
 =?utf-8?B?UnJXSEd4Ty9DYWJaanF6Rml1Zm1WRThLamRhRitleDd0R0R3bWdpcDZJS0M3?=
 =?utf-8?B?UEZKclpDMWJBL1BBR2RXVE4rYmQ0T1A3VXlucmdxeUgxMzJ3WUx0Ty80cmd6?=
 =?utf-8?B?NUxZK2NKYXVSanJ6RXdEc2hhS2tLSGExeHRmY2pmNHlJNXpGelJ1bDYyWlpB?=
 =?utf-8?B?UzQyaS9DdytjOW5iamt1THM1VU9la0RJZjIwSlQ0SVhFQ0lqWnNJZFByYkZQ?=
 =?utf-8?B?eXNQaW1nU0EzOTZORXR1SERzeGUzVWIwSmRodGIxQjdiSXMvK2dtdlBrQ3RF?=
 =?utf-8?B?S2xKSHZNZmlmUDZkeXg3ajEra25yekZmMG1QK1FrM3c2ZlJZbHRPbWI2ZElo?=
 =?utf-8?B?ektBRXVwTnlGY3ZwblJuYUJTT2VSdUViRDdJRStWM1BXbTY4WXN5b1QzNEMy?=
 =?utf-8?B?cCtxbHZUQ1hhSUhMd1k3NUVCOHc5N1dIOUc4ZmJ2VnVJY0QrVHpuVTIvamdP?=
 =?utf-8?B?bXlyandleElpY0MvTjFrNFN2R29LVExkcmU3Rk81cWFiQWtidWlSTXFmbTNz?=
 =?utf-8?B?R3JhQlJUc2oreGZ5eURCWkJaNmx5eWlFcXVOM2RHMkhkTkdDckRGMWl2TUVw?=
 =?utf-8?B?OXpZMis0TE5vWkkzU0xrdDdKQzJ1dzZxdzlWMHo5ZnMyaFJXdTh6ZnZpOUxx?=
 =?utf-8?B?UjVYR2JGZlI0RktkaHllVUZPbVVMQkxieXlEejRGdWwzWEZyRWExOXBRKzRK?=
 =?utf-8?B?RHErRDh6SUJ5WUpiRjVrT1g5S05GMVdtSEo1dGhqc2QwME5TRWxmcTBZVzRj?=
 =?utf-8?B?cWJSQ2wxRVBPSGdkL1lRWmg5cUtEWnROWHlJWGl1eDQvZnFocEJwd3psVnJR?=
 =?utf-8?B?eUMyM056THYrUHVkR0d4N3NxRDJSb01MN1BNU2FoMk5iUjZoUkh4K0lUL0N0?=
 =?utf-8?B?ZTErNEI5Wm9uM0hCM0JuNWVnbDJFTlhvR1ZOMjQ3OHFhMDdXdFozeGJ4emha?=
 =?utf-8?B?Qy8zckF3TXBGSU9HSVIwcHQxdElIaTNJU0tScEpvaXN6UWFlcGVUd2NYcEdm?=
 =?utf-8?B?c2lPYU1OaWF2MG1DUWk4T2dLWThGOUROSGJITXh4MEpnNjl6MTBkQXZPY2JF?=
 =?utf-8?B?bU4wcVdBZmdmYjFXd29EeFkrRTBwbk03NzRJa05xai9zc3UvTFpuQmtvTEow?=
 =?utf-8?B?OENpVTUyMG9XamhBMy85endqMDFnTzFlc0puYU5zVC8xK0ZKajFGS2xnbUQ5?=
 =?utf-8?B?R2FFbFk0QnVXT2tJY21HOTFBZkZTUkJEdjJzSEpTbExCbjZQQ0FDL3FwTWpS?=
 =?utf-8?B?b1JwZGllcW43bFhGaVdHcGpHMXo3K1VMejhIR0o0c1JxMmYvVHBKM3dzU1M0?=
 =?utf-8?B?VUQrVFcwNGwzQ0tLa2EyQWM4QURNUEhidlhDQTl0Z1NHQklEYzVjcXY4ektj?=
 =?utf-8?B?ekg3SXgvblcybnBCVWFCQ0daRDFrQXlBU1FMdmVncXFRMXpMcmF4WC9lU3Ur?=
 =?utf-8?B?QzF3RlArVjBIQkNhckh5bURKclNpZjVyQmJEamFwRFA1YVRHaWtVbGRSVkJJ?=
 =?utf-8?B?c09BeUJlZ3pEVkFCNFVrUmlXV3d0aWZKdEFrZnZSSktHamZnYXZjcXNpdUd6?=
 =?utf-8?B?M2dVSlg3RUF4ZUJwNnR5MEFtaFpkenVYc2ZuMUo5T21CZ1h5WVRnNTV2LzRH?=
 =?utf-8?B?RGRXWjFvQnhVM0pSdCt3dy9VaHlTUjhWNitLbE9uak9WaVdVU2psMGpxaXhI?=
 =?utf-8?B?WjR5T2M2TlVVRncyZjFXVno1bkxCSTlTaFJRa3NSY213N3RsN1BIR2JOQ3Zv?=
 =?utf-8?Q?1sJNbZdlnj83/I9+b45RITMaQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a384d9fc-7a42-49db-a139-08db86656ab3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 01:30:35.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9phdUEvrYTQiV0vz6BZsvskIXr+JFNG2xCzR5xJ0XtmvDpQclqiF/BNHYWT0pu6LvhaMBCq4bqv84qaJjNQx7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-Proofpoint-ORIG-GUID: QGkHygbqCf9Sh3m3Ej8KbN5dMFLz-Jdz
X-Proofpoint-GUID: HmmYOhZMHjcnfSrsk1-rT5FM7Q6e2p8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_01,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307170012
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36H1P2up017190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184424

On 7/15/23 00:13, Steve Sakoman wrote:
> This is being handled with a stable branch version bump which is in
> the current test queue: "libx11: upgrade 1.8.5 -> 1.8.6"

OK. Thanks.

Kai

>
> Steve
>
> On Fri, Jul 14, 2023 at 5:05=E2=80=AFAM Kai Kang <kai.kang@eng.windrive=
r.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> CVE: CVE-2023-3138
>>
>> Backport patch to fix CVE-2023-3138 for libx11.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../xorg-lib/libx11/CVE-2023-3138.patch       | 113 ++++++++++++++++=
++
>>   .../recipes-graphics/xorg-lib/libx11_1.8.5.bb |   4 +-
>>   2 files changed, 116 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-31=
38.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch=
 b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
>> new file mode 100644
>> index 0000000000..0d9397dd95
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
>> @@ -0,0 +1,113 @@
>> +From 304a654a0d57bf0f00d8998185f0360332cfa36c Mon Sep 17 00:00:00 200=
1
>> +From: Alan Coopersmith <alan.coopersmith@oracle.com>
>> +Date: Sat, 10 Jun 2023 16:30:07 -0700
>> +Subject: [PATCH] InitExt.c: Add bounds checks for extension request, =
event, &
>> + error codes
>> +
>> +Fixes CVE-2023-3138: X servers could return values from XQueryExtensi=
on
>> +that would cause Xlib to write entries out-of-bounds of the arrays to
>> +store them, though this would only overwrite other parts of the Displ=
ay
>> +struct, not outside the bounds allocated for that structure.
>> +
>> +Reported-by: Gregory James DUCK <gjduck@gmail.com>
>> +Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
>> +
>> +CVE: CVE-2023-3138
>> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/li=
bx11/-/commit/304a654]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + src/InitExt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 42 insertions(+)
>> +
>> +diff --git a/src/InitExt.c b/src/InitExt.c
>> +index 4de46f15..afc00a6b 100644
>> +--- a/src/InitExt.c
>> ++++ b/src/InitExt.c
>> +@@ -33,6 +33,18 @@ from The Open Group.
>> + #include <X11/Xos.h>
>> + #include <stdio.h>
>> +
>> ++/* The X11 protocol spec reserves events 64 through 127 for extensio=
ns */
>> ++#ifndef LastExtensionEvent
>> ++#define LastExtensionEvent 127
>> ++#endif
>> ++
>> ++/* The X11 protocol spec reserves requests 128 through 255 for exten=
sions */
>> ++#ifndef LastExtensionRequest
>> ++#define FirstExtensionRequest 128
>> ++#define LastExtensionRequest 255
>> ++#endif
>> ++
>> ++
>> + /*
>> +  * This routine is used to link a extension in so it will be called
>> +  * at appropriate times.
>> +@@ -242,6 +254,12 @@ WireToEventType XESetWireToEvent(
>> +       WireToEventType proc)   /* routine to call when converting eve=
nt */
>> + {
>> +       register WireToEventType oldproc;
>> ++      if (event_number < 0 ||
>> ++          event_number > LastExtensionEvent) {
>> ++          fprintf(stderr, "Xlib: ignoring invalid extension event %d=
\n",
>> ++                  event_number);
>> ++          return (WireToEventType)_XUnknownWireEvent;
>> ++      }
>> +       if (proc =3D=3D NULL) proc =3D (WireToEventType)_XUnknownWireE=
vent;
>> +       LockDisplay (dpy);
>> +       oldproc =3D dpy->event_vec[event_number];
>> +@@ -263,6 +281,12 @@ WireToEventCookieType XESetWireToEventCookie(
>> +     )
>> + {
>> +       WireToEventCookieType oldproc;
>> ++      if (extension < FirstExtensionRequest ||
>> ++          extension > LastExtensionRequest) {
>> ++          fprintf(stderr, "Xlib: ignoring invalid extension opcode %=
d\n",
>> ++                  extension);
>> ++          return (WireToEventCookieType)_XUnknownWireEventCookie;
>> ++      }
>> +       if (proc =3D=3D NULL) proc =3D (WireToEventCookieType)_XUnknow=
nWireEventCookie;
>> +       LockDisplay (dpy);
>> +       oldproc =3D dpy->generic_event_vec[extension & 0x7F];
>> +@@ -284,6 +308,12 @@ CopyEventCookieType XESetCopyEventCookie(
>> +     )
>> + {
>> +       CopyEventCookieType oldproc;
>> ++      if (extension < FirstExtensionRequest ||
>> ++          extension > LastExtensionRequest) {
>> ++          fprintf(stderr, "Xlib: ignoring invalid extension opcode %=
d\n",
>> ++                  extension);
>> ++          return (CopyEventCookieType)_XUnknownCopyEventCookie;
>> ++      }
>> +       if (proc =3D=3D NULL) proc =3D (CopyEventCookieType)_XUnknownC=
opyEventCookie;
>> +       LockDisplay (dpy);
>> +       oldproc =3D dpy->generic_event_copy_vec[extension & 0x7F];
>> +@@ -305,6 +335,12 @@ EventToWireType XESetEventToWire(
>> +       EventToWireType proc)   /* routine to call when converting eve=
nt */
>> + {
>> +       register EventToWireType oldproc;
>> ++      if (event_number < 0 ||
>> ++          event_number > LastExtensionEvent) {
>> ++          fprintf(stderr, "Xlib: ignoring invalid extension event %d=
\n",
>> ++                  event_number);
>> ++          return (EventToWireType)_XUnknownNativeEvent;
>> ++      }
>> +       if (proc =3D=3D NULL) proc =3D (EventToWireType) _XUnknownNati=
veEvent;
>> +       LockDisplay (dpy);
>> +       oldproc =3D dpy->wire_vec[event_number];
>> +@@ -325,6 +361,12 @@ WireToErrorType XESetWireToError(
>> +       WireToErrorType proc)   /* routine to call when converting err=
or */
>> + {
>> +       register WireToErrorType oldproc =3D NULL;
>> ++      if (error_number < 0 ||
>> ++          error_number > LastExtensionError) {
>> ++         fprintf(stderr, "Xlib: ignoring invalid extension error %d\=
n",
>> ++                  error_number);
>> ++         return (WireToErrorType)_XDefaultWireError;
>> ++      }
>> +       if (proc =3D=3D NULL) proc =3D (WireToErrorType)_XDefaultWireE=
rror;
>> +       LockDisplay (dpy);
>> +       if (!dpy->error_vec) {
>> +--
>> +GitLab
>> +
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb b/meta/rec=
ipes-graphics/xorg-lib/libx11_1.8.5.bb
>> index cf2e29471a..028a757d39 100644
>> --- a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
>> @@ -22,7 +22,9 @@ PE =3D "1"
>>
>>   XORG_PN =3D "libX11"
>>
>> -SRC_URI +=3D "file://disable_tests.patch"
>> +SRC_URI +=3D "file://disable_tests.patch \
>> +            file://CVE-2023-3138.patch \
>> +            "
>>
>>   SRC_URI[sha256sum] =3D "e362c6f03c793171becd1ce2078c64789504c7d7ff48=
ee40a76ff76b59f6b561"
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184270): https://lists.openembedded.org/g/openembe=
dded-core/message/184270
>> Mute This Topic: https://lists.openembedded.org/mt/100142997/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


