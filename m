Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899F2EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 06:24:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4396.1687242266743637113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 23:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=enXy+b+z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55353d0959=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35K6K5AE031345
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 06:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=dBMx1ihMFOdc/0UfTwEbANYSPu5iJBJ9Gs8rjXLOR5s=;
 b=enXy+b+zShiRs1ramDhqYcN1I/max+vNiqbefJa22pMIIshYpRHylpyquxJ/iRfM9Trr
 svFx4BCw7ZCa88y/7ifjm9bF+NtpQNcnFGyXGW3thp2a6xN7QTAvpHOJ1y/1yrulxehe
 svn6SV38Y7xuSB+YtQEr1NW9Js+JunEsiwpXaTOfy4JmMiqQJ/VWF3QQuDoZ469fr+9G
 JktCiUt7lGx33VMO6+dPDB1I5c2HhQcsLg9CjV3AODvcCYeF7CJO2z8U+T8XjefnNh/k
 b23KPsJVjdqmcMNGi9TozeTgmsiIL8WKtxbFCF+EafdG+D7NHpausMbO0ENe59C+JymA sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r93t8a7yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 06:24:25 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35K6Ni5b005058
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 06:24:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r93t8a7yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 06:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktrfRkWbSJo4CUDdydad3dC8CVF32cKhQU7I5LwbfUJV9YevB6HF3xMkHXrecWSUuOui86w4OYEz02jWorTGX9JKDqLJkwUwFhv0fZXS6IDcZJR9N0EuKcbiNH8hJ/yA58wn9ghZy+8gEAnh9nm9mtmwWdG+uZ7rOukp5geqIPWnbFNSYvueqDO7GxWWJE0M0K+KAzVoUP/vLVfnKEo/nrKdJX199NWpThj3KS7qtfAyBKdt3vj0QTimuiYqEoAO0jhB9uUda2HjjDsz97kItHKRWhe7+Yl4EkdzrJipiPXgKPadjbPUdxvYNGKL5I/uK8/0uviFn6MBvCHSEH4xNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBMx1ihMFOdc/0UfTwEbANYSPu5iJBJ9Gs8rjXLOR5s=;
 b=PAJo5gGT41iL2sqnW0INnnbe/o2MLfTVz9d+TTVZ+1igLDV0Ro9kweeE7EoxrfRcCir0lgxUgVvCuxLDY7wgLALrupFPMhiY3QWVutLpNuKEZYz8VCfj8mfa5FvBZyesuG+KUUp0ZPy71Kzj5285lB//QdGeMJS9Fu/2QsvC22BOOJ/QHvoHAiNhd2haU4Bk4kTLX0UFNnfGUsJebcKHdEJVaC4KISevw5gRLHJSPsHfk8d/N5af9ATx5YgKT5iOJ7ASAkByZQxGPM1b0TeAsqf5n57PmjQfLQGFvT6DebpNqkB5W90YRouTQabMxf9/YhrIK9Idq1QPEBDZDhcZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3419.namprd11.prod.outlook.com (2603:10b6:5:6f::32) by
 SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Tue, 20 Jun 2023 06:24:21 +0000
Received: from DM6PR11MB3419.namprd11.prod.outlook.com
 ([fe80::aceb:7d6f:aac3:d6b4]) by DM6PR11MB3419.namprd11.prod.outlook.com
 ([fe80::aceb:7d6f:aac3:d6b4%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:24:21 +0000
Message-ID: <b2fa8593-9a47-bc80-0f2f-0e203696ddd9@windriver.com>
Date: Tue, 20 Jun 2023 11:54:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe-core][kirkstone][PATCH V2 5/6] webkitgtk: fix CVE-2023-23517
 CVE-2023-23518
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, hari.gpillai@windriver.com
References: <20230609140908.3465521-1-yogita.urade@windriver.com>
 <20230609140908.3465521-5-yogita.urade@windriver.com>
 <CAOSpxdatayHuoCS-qJVo=B43gYs9afYAa2mtkpOnuW5i9TY5Vw@mail.gmail.com>
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <CAOSpxdatayHuoCS-qJVo=B43gYs9afYAa2mtkpOnuW5i9TY5Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DM6PR11MB3419.namprd11.prod.outlook.com
 (2603:10b6:5:6f::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3419:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: b856d13a-a2f4-47f5-849f-08db7156fbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BoAoUcvK1YAOxeLPlnTfgu6AqT6Gnvu9N57iQQWkYA6HK6mLLrpq5ncLxw0gvhrzlbnf23k5MQBL3w+YTyt3KJpTXMAAaylCdVKfQU8gGxDLwIlLkf3pTHeT7/jEI/rXl9FOT80FpJeziWImF/41pPXknsdPdrNyo7oiNPP2AwVNsZ39apaEq0TaheD3wlbpD/dWGa5rHMryYGlFqy34UUruqtpKHIXuUS4wd2oqz1Gkq9xBy3ne5VNgoxtYaI0UaVYEXHHnoLP84ESbXL5jSPDRp53oZ4qgWUb4arEeLv6azQJlpqf/nPVQ/8+IGzEtslbemAQrfbNmZpZ9sdpYKelyYFNg7+dBzEjpBcRNeFn0Op+E/OFNbYD4aW+U7sr0YfJlzK0XXqBEuidu5PZ5JERaVrw3aY/rzzs1rO8/hEcc07EZvuHwsDL7W55vmIzWh8yZvQe5HWtrDMXELLhpOASwR5zxIdUD/CMHGe1c9PKCFRMqiPwX+t4kxiIGQn6aMxu8jZ/vjkkw80Pel+yy3WneU1CIRiClY/iYjoJHp5ZjWBK4YGZ//v913e5BW+Ox6MsbwQdIRhWUxSOvgu0mrA5shdkxVVG9vS9UWwXYUplDJEBO3vlV5kZ0onp/VqzKEtxR1P5T/6X1utsRm2lLEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(451199021)(31686004)(66899021)(36756003)(5660300002)(8936002)(8676002)(41300700001)(66556008)(6916009)(66476007)(4326008)(38100700002)(31696002)(316002)(86362001)(66946007)(6486002)(107886003)(966005)(26005)(6506007)(6512007)(53546011)(186003)(2906002)(478600001)(2616005)(83380400001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OENKTUhvT0dMUWNaUndtc3h1dkN3ZmtIWkhVUnhlZ2YyVUUzZUZGNlVvcU5R?=
 =?utf-8?B?YVl0NmN0b0o5VDJmNXVneFZaODZMTFhBS3V6ZUw0OXNhRTVnTHUwRUJhZWR4?=
 =?utf-8?B?MDNDaE53bVlRbTdjUzNMWlZKWTY4MG40bG5kNWl6K3VQNFpXb1RHOFc4VndX?=
 =?utf-8?B?OGJsb283QkpyblQrLzJSOFd0TGFHbUhURGwxTUJiK2JtNVBTZU9rWFQxd25q?=
 =?utf-8?B?ZDJZZHpMaGZnRS83NFU5V3VSZVc4aHlKWlBSK1hmVGFuMlVkbXRFUThqajBV?=
 =?utf-8?B?MkdYQlltZDh0Y1V4bm0yOGo4UDFVRUNmL0UxZ3Y4elJxKzBOL3ozaDF2a2Ro?=
 =?utf-8?B?b0FXRTM3Q1BpQnNlMXJ6WHR0Y0Q3TlBaWnFTU1VTQ2NTakZEQWdiSjBUWngr?=
 =?utf-8?B?K2tTdHAvQURsWUlpdDN0Vm1teUVQMkJSeUI3VHptY1QvbTUyWURFQUxhQjQz?=
 =?utf-8?B?d1NjeXZuL2hyQjNIZU9lbkI0OTg0S1YwNDdNMWlCSU85b1ZyOVlkOG9oOHhy?=
 =?utf-8?B?V2RpT2JqM2N2bDZCVTlvQzM4N3VZTXIyOU5oWHdSMnM5VlJYdkxzZGlwRDNZ?=
 =?utf-8?B?aWo3TFIweTJMQzhEL094U3Rka1REWW5kcm1KSm94c3FJU25GaElPQTdGUTht?=
 =?utf-8?B?TW9iVzVtWVE2VDIzaGZYUGt0MDRabittLzU0NDA3Mk42TGdPY084YzhqSDUv?=
 =?utf-8?B?K0kyR2VCNUhJdXRRRlZaMCtVZ3QrL1Bxd3BCV1NjN3dHamU4dmMzenEvMTRs?=
 =?utf-8?B?d3hYRHN1RmRiUm9CYUJKbTNIUE82MXNzMVZpNzJtSmMxWmVUQ1NWTWEyMis5?=
 =?utf-8?B?OGF2K3hyM2c1a0xPTDBRalVzK1JTR0lBR1Nnb0VKZ29NQ3RRbGtsdm1oQXV3?=
 =?utf-8?B?T01wR3M0Zm9WUCs0ZjNTaTg1ZVFYelJwWUwrbUNzUGc1cjM2QVVSNlRHVGNZ?=
 =?utf-8?B?UDFKeUtrK2FoVzhEcVkzM2VYckc2bWJXamFTZ29GWHFTYTlYNDNUeWlBVVh5?=
 =?utf-8?B?WU9DY2RxVmxCVDF2QlFJZTQxVDM2V2lKcWg0aUxwZUlVZmd2Q0VGVDZESGxG?=
 =?utf-8?B?cWVJMjNWWnVYTW9oSnZYcVMvdm1TQmI0TmNKakFIRFlEdnBBRTZoQjM5NzJk?=
 =?utf-8?B?NWhKc0dRd0h5L2U2WUFYdFIzZHRoRzBGVUMvaHp6U0J5T1cwM3BqeHlYZDBy?=
 =?utf-8?B?SEIycTczRC9LQnMvUVo4SWd2VWh4UHpHeWZJcFFKaU9VVnZ2aHJ5ZFJJMVB2?=
 =?utf-8?B?Z0xTek5sRnl0OGlDdXQ0dnZVdm1IVHpOK0Z4NVpQK082YnczV1JzcGc5dkNo?=
 =?utf-8?B?VDRibmkzTUNtd1I4QThQTU9NTFhKZGZzdFYrbkJCVUwzTThleXRlUk1ienpI?=
 =?utf-8?B?by8zS2xydDBIWllBdjFLSjlvK01YZ2ZnM3RjdmhIMEE3QjEyc2FtV2N2M1Qz?=
 =?utf-8?B?aXpReE5EdUpualUzMEtUa3NmanJ0SXNsMnhPcjFWcWVuSnpxMTg2NDZ4UE81?=
 =?utf-8?B?cDc1YUFkdjgyc2JWc3U0V1JXYVNRSDk2aUdaR2RhMm9qa2dZdnBDeFFjVjZt?=
 =?utf-8?B?VW5NRHRueDh0RkdyME5KRTZrUnN0SGVkLzNndUE1QzlDSHA3S1hPZ3dPakU3?=
 =?utf-8?B?aG4wWDcvQy9NTW5QOGRzMXhZbVp4VWhtQ0JYMThldWd6OE0xeHgzZlk3Z3Bn?=
 =?utf-8?B?M1VkYktOc25lcFZyVG9sSnJTQm11STU5V1o5YUcxOUxyWmxzKys1VjNuY05E?=
 =?utf-8?B?N3poL2g4R1RqQStHOThKaTB0b0ZldEVmcUhlQldYUzFiWTVpK2FtbGN2TzJJ?=
 =?utf-8?B?Tk9xM3RYaTdyWW5zdTdscnRIZzJXSk0vek9oQkZ0SHpOSG9VZ2xQc0Zoa2la?=
 =?utf-8?B?MHJjV0YxTzRES29YNUl4VGlXNjNWSlpja3l2V3ZZVUJpNU84RytEdVQ4akk3?=
 =?utf-8?B?TS9LOGZtRXRTKy9ZTW1SbkM3WlhkNFZXOW9OTlJNRCtKcHNqT1JMYWpPUTgr?=
 =?utf-8?B?M0NNNkM5dXp4M2Y4SEQ3QTMxZTU5cWI1VkdNVHR2dzRQOEZMZTFKVlJEUEx2?=
 =?utf-8?B?aS84dXF0b3lidjRVOXNMNHRQd3Z5TjRDb3pFUFljeitIdlc5eUQ0Y05ncHQ4?=
 =?utf-8?B?WDlzYW1QaE90RmlteHhLaThiM0FDQ0FGcDNlTldIZWkzSWtoUmJnK3M3djZh?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b856d13a-a2f4-47f5-849f-08db7156fbb0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3419.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 06:24:20.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixk8Dk909BKnOPtL87L1YR6bpT2D8OXl9oGgov3QHo587dBSxVkwOU6yCIM/BPb+zjWITWaGy2mX31Zsd7EYER2sBd0Esb6FGDzCgfSqHxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-Proofpoint-GUID: Ftg-bvpzZwrfor5qNbZcwtZtdgLoiNsD
X-Proofpoint-ORIG-GUID: RqM-jpqkDDfydazrCv7kR2jAWGOBMfrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_03,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35K6K5AE031345
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 06:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183130


On 19-06-2023 19:33, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I wasn't able to take this patch because it too failed during do_patch
> at build time.  Please submit a v2 with this corrected.
>
> I was able to take the other patches in this series though, so you
> only need to submit v2 for the two that I wasn't able to take.
>
> Steve

Thanks Steve!

I'll submit V2 for these two patches.

Regards,
Yogita
>
> On Fri, Jun 9, 2023 at 4:09=E2=80=AFAM Urade, Yogita via
> lists.openembedded.org
> <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>> The issue was addressed with improved memory handling.
>> This issue is fixed in macOS Ventura 13.2, macOS Monterey
>> 12.6.3, tvOS 16.3, Safari 16.3, watchOS 9.3, iOS 16.3 and
>> iPadOS 16.3, macOS Big Sur 11.7.3. Processing maliciously
>> crafted web content may lead to arbitrary code execution.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-23517
>> https://support.apple.com/en-us/HT213638
>> https://bugs.webkit.org/show_bug.cgi?id=3D248268
>> https://github.com/WebKit/WebKit/pull/6756
>>
>> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
>> ---
>>   .../CVE-2023-23517-CVE-2023-23518.patch       | 131 ++++++++++++++++=
++
>>   meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
>>   2 files changed, 132 insertions(+)
>>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517=
-CVE-2023-23518.patch
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-202=
3-23518.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-202=
3-23518.patch
>> new file mode 100644
>> index 0000000000..721f045e0d
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518=
.patch
>> @@ -0,0 +1,131 @@
>> +From f44648f07471b6c34f61993baa8997f7519a18a1 Mon Sep 17 00:00:00 200=
1
>> +From: Youenn Fablet <youennf@gmail.com>
>> +Date: Mon, 28 Nov 2022 00:43:35 -0800
>> +Subject: [PATCH] Type getter is not needed for internal ReadableStrea=
m sources
>> + https://bugs.webkit.org/show_bug.cgi?id=3D248268 rdar://102338913
>> +
>> +Reviewed by Eric Carlson.
>> +
>> +Make ReadableStreamSource method privates.
>> +In ReadableStream, use @getters instead of private getters to allow g=
etting private values from prototype.
>> +Covered by added test.
>> +
>> +* LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt: Added.
>> +* LayoutTests/http/wpt/fetch/fetch-stream-source.html: Added.
>> +* Source/WebCore/Modules/streams/ReadableStream.js:
>> +(initializeReadableStream):
>> +* Source/WebCore/Modules/streams/ReadableStreamSource.idl:
>> +* Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h:
>> +(WebCore::IDLOperationReturningPromise::call):
>> +
>> +Canonical link: https://commits.webkit.org/257063@main
>> +
>> +CVE: CVE-2023-23517 CVE-2023-23518
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/WebKit/WebKit/commit/f44648f07471b6c34f61993baa89=
97f7519a18a1]
>> +
>> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
>> +---
>> + .../fetch/fetch-stream-source-expected.txt    |  3 +++
>> + .../http/wpt/fetch/fetch-stream-source.html   | 24 +++++++++++++++++=
++
>> + .../WebCore/Modules/streams/ReadableStream.js |  4 ++--
>> + .../Modules/streams/ReadableStreamSource.idl  |  8 +++----
>> + .../js/JSDOMOperationReturningPromise.h       |  4 +++-
>> + 5 files changed, 36 insertions(+), 7 deletions(-)
>> + create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source-ex=
pected.txt
>> + create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source.ht=
ml
>> +
>> +diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.=
txt b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
>> +new file mode 100644
>> +index 000000000000..856ea8180ca2
>> +--- /dev/null
>> ++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
>> +@@ -0,0 +1,3 @@
>> ++
>> ++PASS Only JS streams should check type
>> ++
>> +diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source.html b/La=
youtTests/http/wpt/fetch/fetch-stream-source.html
>> +new file mode 100644
>> +index 000000000000..fbebfa5e524f
>> +--- /dev/null
>> ++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source.html
>> +@@ -0,0 +1,24 @@
>> ++<!doctype html>
>> ++<html>
>> ++  <head>
>> ++    <meta charset=3D"utf-8">
>> ++    <title>Fetch and source</title>
>> ++    <script src=3D"/resources/testharness.js"></script>
>> ++    <script src=3D"/resources/testharnessreport.js"></script>
>> ++  </head>
>> ++  <body>
>> ++    <script>
>> ++promise_test(async () =3D> {
>> ++    let counter =3D 0;
>> ++    Object.prototype.__defineGetter__("type", function() {
>> ++        counter++;
>> ++    });
>> ++
>> ++    const response =3D await fetch('/');
>> ++    const fetchReadableStream =3D response.body;
>> ++    const [r1, r2] =3D fetchReadableStream.tee();
>> ++    assert_equals(counter, 0);
>> ++}, "Only JS streams should check type");
>> ++    </script>
>> ++  </body>
>> ++</html>
>> +diff --git a/Source/WebCore/Modules/streams/ReadableStream.js b/Sourc=
e/WebCore/Modules/streams/ReadableStream.js
>> +index ddef56ecd460..7f0def325d84 100644
>> +--- a/Source/WebCore/Modules/streams/ReadableStream.js
>> ++++ b/Source/WebCore/Modules/streams/ReadableStream.js
>> +@@ -48,10 +48,10 @@ function initializeReadableStream(underlyingSourc=
e, strategy)
>> +
>> +     // FIXME: We should introduce https://streams.spec.whatwg.org/#c=
reate-readable-stream.
>> +     // For now, we emulate this with underlyingSource with private p=
roperties.
>> +-    if (@getByIdDirectPrivate(underlyingSource, "pull") !=3D=3D @und=
efined) {
>> ++    if (underlyingSource.@pull !=3D=3D @undefined) {
>> +         const size =3D @getByIdDirectPrivate(strategy, "size");
>> +         const highWaterMark =3D @getByIdDirectPrivate(strategy, "hig=
hWaterMark");
>> +-        @setupReadableStreamDefaultController(this, underlyingSource=
, size, highWaterMark !=3D=3D @undefined ? highWaterMark : 1, @getByIdDir=
ectPrivate(underlyingSource, "start"), @getByIdDirectPrivate(underlyingSo=
urce, "pull"), @getByIdDirectPrivate(underlyingSource, "cancel"));
>> ++        @setupReadableStreamDefaultController(this, underlyingSource=
, size, highWaterMark !=3D=3D @undefined ? highWaterMark : 1, underlyingS=
ource.@start, underlyingSource.@pull, underlyingSource.@cancel);
>> +         return this;
>> +     }
>> +
>> +diff --git a/Source/WebCore/Modules/streams/ReadableStreamSource.idl =
b/Source/WebCore/Modules/streams/ReadableStreamSource.idl
>> +index cce9ea37ce80..ae7f1403b8ac 100644
>> +--- a/Source/WebCore/Modules/streams/ReadableStreamSource.idl
>> ++++ b/Source/WebCore/Modules/streams/ReadableStreamSource.idl
>> +@@ -30,10 +30,10 @@
>> +     LegacyNoInterfaceObject,
>> +     SkipVTableValidation
>> + ] interface ReadableStreamSource {
>> +-    [Custom] Promise<undefined> start(ReadableStreamDefaultControlle=
r controller);
>> +-    [Custom] Promise<undefined> pull(ReadableStreamDefaultController=
 controller);
>> +-    undefined cancel(any reason);
>> ++    [Custom, PrivateIdentifier] Promise<undefined> start(ReadableStr=
eamDefaultController controller);
>> ++    [Custom, PrivateIdentifier] Promise<undefined> pull(ReadableStre=
amDefaultController controller);
>> ++    [PrivateIdentifier] undefined cancel(any reason);
>> +
>> +     // Place holder to keep the controller linked to the source.
>> +-    [CachedAttribute, CustomGetter] readonly attribute any controlle=
r;
>> ++    [CachedAttribute, CustomGetter, PrivateIdentifier] readonly attr=
ibute any controller;
>> + };
>> +diff --git a/Source/WebCore/bindings/js/JSDOMOperationReturningPromis=
e.h b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
>> +index c4d1513ad5c4..1dda9d3834f7 100644
>> +--- a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
>> ++++ b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
>> +@@ -43,8 +43,10 @@ public:
>> +             if constexpr (shouldThrow !=3D CastedThisErrorBehavior::=
Assert) {
>> +                 if (UNLIKELY(!thisObject))
>> +                     return rejectPromiseWithThisTypeError(promise.ge=
t(), JSClass::info()->className, operationName);
>> +-            } else
>> ++            } else {
>> ++                UNUSED_PARAM(operationName);
>> +                 ASSERT(thisObject);
>> ++            }
>> +
>> +             ASSERT_GC_OBJECT_INHERITS(thisObject, JSClass::info());
>> +
>> +--
>> +2.40.0
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recip=
es-sato/webkit/webkitgtk_2.36.8.bb
>> index cf1b8b2cc0..69663c1cb7 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
>> @@ -21,6 +21,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP=
}.tar.xz \
>>              file://CVE-2022-46699.patch \
>>              file://CVE-2022-42867.patch \
>>              file://CVE-2022-42856.patch \
>> +           file://CVE-2023-23517-CVE-2023-23518.patch \
>>              "
>>   SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d=
2136edbab2c133d00437"
>>
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182555): https://lists.openembedded.org/g/openembe=
dded-core/message/182555
>> Mute This Topic: https://lists.openembedded.org/mt/99429027/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

