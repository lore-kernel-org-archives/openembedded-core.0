Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E09C47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 10:46:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19733.1705747605562069481
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jan 2024 02:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YWgzDyhF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1749124405=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40KAU1j3021606
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 02:46:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=TFybxBg9fFnFGGNYZo7
	8UBe2rw4IKiteQoTpSfgDjgc=; b=YWgzDyhFJGGcyb+9GmNSrnA4R8IpmqqH4P1
	5j8qr4syuu/k8vwF/hpZmdg+2KltIMTwd5gxnexXdN2bvKciFCzvwhY/Pthin8SY
	MscK5iMmnWqB2XYd1KQehPf1wLnjoEEaqKz/lVOQ4mqDLe1qfH4lkKPzBYsHcPyN
	Bbeiww8o27XWOXBkTZ0G2KtwSrfB4fiyi/KnxaXcUtVQJebsvlAe0fBzFjVdenmz
	rhK/0RvE/s3rxGqijDBismPGatvET3R73FpkP3MEcZEC8OxGiOGt3DIp1NBct2IT
	0uORyZTg3yPNr7eOE8OI066f92UOoDresbHgjfCTsao6y0pVgYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4r2hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 02:46:44 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40KAkiel008621;
	Sat, 20 Jan 2024 02:46:44 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4r2hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jan 2024 02:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHRXjmV+x8CdK9CG6FSS1NQNeYgkZKsnprGXUCaNiAY1oTaCv7bixFK4noBuX1HIdRo0ZU275/IjKzjwGx9wizWv0tSXAFeOVXX1rpuvwjN3HMuXMheKhH5V5STxWn8v/8P3oWTPvQ8bQRj/OfNYiYBzqiv+StYcD2ZUYC4YCqxjPOO4e26Kx8FQi59kbnpOPFn7+In1Hzz4rpycvdfVExm1AwE/IlTGvzJMxTffbNceFfxaysXvoNRfCntAWNycQ8k7sKG/lX8Bu7ZEDLSP2xdK4G8s78rIS64MqqWIeUwjsa41keWnpvYzd0fEGygqr2P2QGxdaqz7T0N7iMQYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFybxBg9fFnFGGNYZo78UBe2rw4IKiteQoTpSfgDjgc=;
 b=hudWTQ+jJmXtQg8mBptFQ9TFKfpLoUE8TNu/pG9fIOM2WRwmiXAWO8Q2+UBgYDGsEGWZpYzTjDU5SCipfia5nxo6USRmqlrtQ4T/Gw/NEfmrFQdCF0L9CsSF+iADk0YAvg6LK/mt+sWWLdbV9k9LnSKOMmHrMXnYTtHlEDYdV0PUSHAD68YyHlQcASYD0Cm2e0/JywJbdJ3He4I+7C1qAK6fzpTJhFJVsMu4/gCQftYaO4YuoFOYagGSqqOW0rx/EOOiauJhwTLfkbCuUJ3jA9MeKPjzlHxtJkxTgc5QXincUquMGWS+mS1oaiVJooiqNovZhdGP8hsIbKGOaI70TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15)
 by MN2PR11MB4615.namprd11.prod.outlook.com (2603:10b6:208:263::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Sat, 20 Jan
 2024 10:46:38 +0000
Received: from MN0PR11MB6133.namprd11.prod.outlook.com
 ([fe80::5296:3a8:e6d0:4b9e]) by MN0PR11MB6133.namprd11.prod.outlook.com
 ([fe80::5296:3a8:e6d0:4b9e%6]) with mapi id 15.20.7202.028; Sat, 20 Jan 2024
 10:46:38 +0000
Content-Type: multipart/alternative;
 boundary="------------qHTrfdDIoEKCrS9d7B9x2q3l"
Message-ID: <b51418eb-50c7-49ba-ab64-e1451978cad6@windriver.com>
Date: Sat, 20 Jan 2024 16:16:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/5] rust: Fetch cargo from rust-snapshot
 dir.
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
 <17AC01A476481111.16230@lists.openembedded.org>
 <15cc528bef581b15f6010f22999640a6320509b2.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <15cc528bef581b15f6010f22999640a6320509b2.camel@linuxfoundation.org>
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To MN0PR11MB6133.namprd11.prod.outlook.com
 (2603:10b6:208:3cb::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6133:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3c5de1-951f-49fd-c3d8-08dc19a51398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s5UarDFfyR/g1TL4fIbjCHvO+swEdC6EAj1x6zxdnAlruc5lU4fyCiftm0ypM8SVMEOIc/nsccGJqSRWLlUaS9gPa3D/aqh47h3A7lu4SMrwfoTYIHDrA+/R5n8gneNM0D58MuRSdVEs9x9F4cGtIFtPiRtVi6DjUzXxpur43uVIQZuQPzMdBGIsTvfZ0ds1nR+ZFIRu1l2ZqT86foXefv5N2HX95xVNG7J1CL8fSrkQsv/EvTUAtC/Lx+dnrVkx1Q1/MCSSC1Jz8iBIW7WW+WHr59wv+b/jXCwswhJGjSjPoXT4a3qdAQsnFY0z1wKXS3Uif7vSvD7NQCub+DGOijq9Y0t087P83/22SK32YtbGdJ/Jj0YLzqEba+5BSUqi0yDM0mmCOzHawfd6S9Axl+kWOeLdsRC4YTVd5HSF24IVopFhVQSsxutPvqWsmTl2n9RWbze5EUclKoAAnvp5o5D9k/VoWM6xjhv9bf9pHllgTFxIzgO5Yo9TcJqWBrX0OM0weR5VYIvXTT9Pcc4GrokOtK8Df/rM5orpHgWJMvJ9Zy3hT2NSaWj9gMS+8v1DiAyJfYCefQvpOID+w7BXX69r++HDOEh7xBZxqGimybGExAo/hBqlrNS09CnWPYpnlXRvAAtEC1F9qFqpRM3n7gLwG7ts0voFrgzHY3+nXZM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6133.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(346002)(136003)(396003)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6512007)(38100700002)(2906002)(86362001)(36756003)(31696002)(41300700001)(166002)(66946007)(316002)(66476007)(478600001)(6506007)(66556008)(6666004)(33964004)(4326008)(6486002)(5660300002)(966005)(53546011)(8676002)(83380400001)(2616005)(8936002)(107886003)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHVpQjFIZzhnV0VGRkNjOW42SnpTSDhFZHlpNUhIWnlZZEhjVEJYekdoQjVP?=
 =?utf-8?B?V0U4OFo2WElobmFkcy9kVWZsVnlrclVBVTBtZTRlMVRFUmdUUVRvOU82NW5C?=
 =?utf-8?B?bDVKNEpwYlV6R2hTbGh1NGpjSlJXVVF5RjczUWoxNVhDcEVrRVdJMU42aG5m?=
 =?utf-8?B?THh3c1U0SzFiZVNXQ3JSOTk2cnJmVTlEQkducGV0WncySjdMT2NVTHF0bWZs?=
 =?utf-8?B?M1U3cFJxLzBxNGJ0TEpxTSs4QUt6dGhoeVg4MEVXRktDZmJYVWtMSjZDRk5W?=
 =?utf-8?B?WU5Jc1k0ZlZJa0ptU00xQlBZUHV4NENJdk1aMkdURXR3TzIxODBkakdqcFAy?=
 =?utf-8?B?Z2pORUJoSDFKRHJielhnUU5HUWg5WU9TbTBGeGUwcCtDSHpxNFJ6dXhKbXZv?=
 =?utf-8?B?N0MvMUpPakVNM0drcVcxWHJrTTJKU0pEMkFoR3h0T3A2cmZWUllXTk1uT3Jk?=
 =?utf-8?B?SXIzTlZzSlh1b1ptNGJvUS9MTmxzc1hnZU0xRUlvMGo4VytrSWZLQWpuK3Q4?=
 =?utf-8?B?WklnWmwrc2FLcTNzc2RiWk5zYXhIbFk0R3hyNnloTUNucHFZTU5aQWhMdXVW?=
 =?utf-8?B?RThRMHhZOGNzK0F1Qjc4M0p2UUxHUE1qSldwS3RWbmVpbno5MldtUDJ6WUhG?=
 =?utf-8?B?SmszQzVYby9FdWhjcTI4ZlBWSnRod0VoUHhPYnVLOVNuME85MU5pMG84UVJE?=
 =?utf-8?B?R3FkR0tudFlieTRPQzhjN1o4ajdKUE1DeE1NN2Y5dmltYlJrMmUzM2kyVWFN?=
 =?utf-8?B?VmwvOW96UHc5c2Y4VU1hKy9IZld0azZpRXJEUm10VExXalpxZU5lV2FtL25T?=
 =?utf-8?B?VlpxU1lQZW1oZnJrMXp0TDVicGIzazV4RHBaeEdtWVRUMncrVVUxM2hSUmt2?=
 =?utf-8?B?Vy9OVDkzVHNxc2dEV0ttSXpEN21wbmJ5Y3JzRzFGQjR2U0pXTlFlcllaWHNK?=
 =?utf-8?B?MDc3V21PbDR1em5iczhzL0I0OUVWWm50ZWFpeXJrM1BWZko4UzlaWWhoeHBt?=
 =?utf-8?B?TXphdmJrVzNNMWlQNHFtSkhKb003QWU3WUplUXl0ZHRVejdKQzdDMDl0VzNL?=
 =?utf-8?B?azVQVkhCQmlaMEdCUFROa3oyb215ZU5WM1kyZjIwTUVEVElpYmM3OUhPeWJ5?=
 =?utf-8?B?SEV1RmhFUjVtbVhRdmxndUNYeTB2a2dzWkhpbVp3ZElkdko4QVdUVDkwMHZm?=
 =?utf-8?B?SnkvVW1qcDQvTFdPYVpzaTlpZVl5RVFFYzRDMGgyam13K3Z2eVJnaTluYzZx?=
 =?utf-8?B?RjJidkFHMWJvZjBidy9UbW54NlBVRTdLa2ROa2Q1eDRqbFFUcUFaa3NkNkkw?=
 =?utf-8?B?cFdIY0Z0RkVHNjI2WjlnelJDZWk5VEpzY2Q4ZWw0Tm5PRkh3TGduRGpVZW9J?=
 =?utf-8?B?YkdERHduTFdpNjhBK3VNMC94S3JEdzM4dXQzZU5LdGNKd1N0TFRLL3lmTWNB?=
 =?utf-8?B?WXBNUTBEQ1dKV3FzeVN1cGVLV0c5cFR5WFE5cDZyaC8xaTRlWEFYKzBQdTVP?=
 =?utf-8?B?OTQ2VjRxTHFBb29peTdJODNFT1o2VHhFNjV6Y2FlRzBhQ2JMMW40VzFPcGNx?=
 =?utf-8?B?YlJTdzBUMkZUUytlWmhQRkwwMUx1bkNTL0pzTGhhZXVtWGpMWGZmdUNTQVNV?=
 =?utf-8?B?TjlWbDlSTjV3Q3J2MHUyWWo1SGFUMkV1KzNreTBlbHU1WllLVWFoVHI3THNh?=
 =?utf-8?B?emN5ODRvcUpOemlwVmZwSUtXVkt0aW9FUDRFVVhjWitkS2xVQmtKMHpDZDh4?=
 =?utf-8?B?cVBQamFmUlVZbWkrUzZzU2pYYks3QytLbzBNV1ZaekRYNk9XVm04UGkzdHE1?=
 =?utf-8?B?WklWc0xRTDVRK1lzRUJUR3YvM09xNjlqRmYwWi81ZDRpR1VjT252SGV5TXI3?=
 =?utf-8?B?bU1xUk1GSDRCOHJyekpYa2ZCK1VpN3A3UFMrWmJvU2pVY0tIZW9mSzdUVnJo?=
 =?utf-8?B?cVZrckJyKy9YRzhLdXhnWUM3WVJFb2NmVytrKzRKM1ZSeUNEZEFaZ2R6dFVq?=
 =?utf-8?B?ZEdLR1ZEV2M4SXhVbDNVZ2lweW51NW1EUmJvMlozcGdJR3BQR0xaeHVLV0ZO?=
 =?utf-8?B?Zk5KWjFlK290enlUVytuNVk3b1FBK2Z5Nm1OWXhCdWlyME9GeGhWVWk5YjBD?=
 =?utf-8?B?bkMzb1VZbi9Jc0NPYzIvZ3JDQnIvV0ttRFdVRE9pUWNzekIyVWtmVFRYMCtM?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3c5de1-951f-49fd-c3d8-08dc19a51398
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6133.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 10:46:38.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPw3ypai6Meo1LuO7AuFAIh5UPC3nWvIZZ9Dxg7zc3i6LpGMY8lZzfieaeLJFlpjtwSbrhjFtr6Ml2Rufy0wiGxeeD/3IMfUJkk1jW0uuew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
X-Proofpoint-ORIG-GUID: 1Xpq7iVmvdYV-vOr6tTjpGKQ3Sb2vE_M
X-Proofpoint-GUID: qtdU6QzV_EswuvLrRpNMvzle25JRbdsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-20_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401200088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 10:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194083

--------------qHTrfdDIoEKCrS9d7B9x2q3l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20-01-2024 14:19, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sat, 2024-01-20 at 08:42 +0000, Richard Purdie via
> lists.openembedded.org wrote:
>> On Fri, 2024-01-19 at 07:09 -0800, Shinde, Yash via
>> lists.openembedded.org wrote:
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>> Fixes: Exception: no cargo executable found at
>>>         `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
>>>
>>> Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.
>>>
>>> Patch sent to upstream-https://github.com/rust-lang/rust/pull/120125
>>>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>>   .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
>> The series failed on mips in testing:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/1196/steps/12/logs/stdio
>>
>> Sadly the error redirection is to a file and even in the failed build,
>> we do not have that file as far as I can see so it is hard to know what
>> went wrong.
> I was able to find the file:
>
> https://autobuilder.yocto.io/pub/failed-builds-data/summary.txt
>
> (buildbot-venv) [pokybuild@rocky9-ty-1 build-st-1051644]$ cp ./tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/summary.txt /srv/autobuilder/autobuilder.yocto.io/pub/failed-builds-data/
>
> ---- [ui] tests/ui/issues/issue-32805.rs stdout ----
>
> .
> .
> .
> .
>
> failures:
>      [ui] tests/ui/issues/issue-32805.rs
>      [ui] tests/ui/numbers-arithmetic/i128.rs
>      [ui] tests/ui/numbers-arithmetic/saturating-float-casts.rs
>      [ui] tests/ui/runtime/backtrace-debuginfo.rs
>
> test result: FAILED. 15246 passed; 4 failed; 291 ignored; 0 measured; 21 filtered out; finished in 693.24s
>
> Some tests failed in compiletest suite=ui mode=ui host=x86_64-unknown-linux-gnu target=mips-poky-linux-gnu
> Testing stage1 compiletest suite=run-pass-valgrind mode=run-pass-valgrind (x86_64-unknown-linux-gnu -> mips-poky-linux-gnu)
>
It is observed that "mips(32 bits)" target is pretty unstable with rust 
tests. Thus, we decided unanimously to skip mips(32 bits) target in the 
initial implementation of the rust oe-selftest. I did check the 
testsuite for the mips target and many more failures were found.

According to the rust doc, the mips target variants are classified into 
tier 3 targets( for which the Rust codebase has support for, but which 
the Rust project does not build or test automatically, so they may or 
may not work. 
<https://doc.rust-lang.org/nightly/rustc/platform-support.html#:~:text=Tier%203%20targets%20are%20those%20which%20the%20Rust%20codebase%20has%20support%20for%2C%20but%20which%20the%20Rust%20project%20does%20not%20build%20or%20test%20automatically%2C%20so%20they%20may%20or%20may%20not%20work.>), 
which might be the reason for failures.

https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3:~:text=mips%2Dunknown%2Dlinux%2Dgnu,kernel%204.4%2C%20glibc%202.23)


<https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3:~:text=mips%2Dunknown%2Dlinux%2Dgnu,kernel%204.4%2C%20glibc%202.23)>Regards,
Yash

>
> Cheers,
>
> Richard
--------------qHTrfdDIoEKCrS9d7B9x2q3l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-01-2024 14:19, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:15cc528bef581b15f6010f22999640a6320509b2.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Sat, 2024-01-20 at 08:42 +0000, Richard Purdie via
lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, 2024-01-19 at 07:09 -0800, Shinde, Yash via
lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Fixes: Exception: no cargo executable found at
       `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`

Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.

Patch sent to upstream- <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/120125">https://github.com/rust-lang/rust/pull/120125</a>

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The series failed on mips in testing:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/1196/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/1196/steps/12/logs/stdio</a>

Sadly the error redirection is to a file and even in the failed build,
we do not have that file as far as I can see so it is hard to know what
went wrong.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I was able to find the file:

<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/pub/failed-builds-data/summary.txt">https://autobuilder.yocto.io/pub/failed-builds-data/summary.txt</a>

(buildbot-venv) [pokybuild@rocky9-ty-1 build-st-1051644]$ cp ./tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/summary.txt /srv/autobuilder/autobuilder.yocto.io/pub/failed-builds-data/

---- [ui] tests/ui/issues/issue-32805.rs stdout ----

.
.
.
.

failures:
    [ui] tests/ui/issues/issue-32805.rs
    [ui] tests/ui/numbers-arithmetic/i128.rs
    [ui] tests/ui/numbers-arithmetic/saturating-float-casts.rs
    [ui] tests/ui/runtime/backtrace-debuginfo.rs

test result: FAILED. 15246 passed; 4 failed; 291 ignored; 0 measured; 21 filtered out; finished in 693.24s

Some tests failed in compiletest suite=ui mode=ui host=x86_64-unknown-linux-gnu target=mips-poky-linux-gnu
Testing stage1 compiletest suite=run-pass-valgrind mode=run-pass-valgrind (x86_64-unknown-linux-gnu -&gt; mips-poky-linux-gnu)

</pre>
    </blockquote>
    It is observed that &quot;mips(32 bits)&quot; target is pretty unstable with
    rust tests. Thus, we decided unanimously to skip mips(32 bits)
    target in the initial implementation of the rust oe-selftest. I did
    check the testsuite for the mips target and many more failures were
    found.<br>
    <br>
    According to the rust doc, the mips target variants are classified
    into tier 3 targets( <a href="https://doc.rust-lang.org/nightly/rustc/platform-support.html#:~:text=Tier%203%20targets%20are%20those%20which%20the%20Rust%20codebase%20has%20support%20for%2C%20but%20which%20the%20Rust%20project%20does%20not%20build%20or%20test%20automatically%2C%20so%20they%20may%20or%20may%20not%20work.">for
      which the Rust codebase has support for, but which the Rust
      project does not build or test automatically, so they may or may
      not work.</a>), which might be the reason for failures.<br>
    <br>
    <a href="https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3:~:text=mips%2Dunknown%2Dlinux%2Dgnu,kernel%204.4%2C%20glibc%202.23)">https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3:~:text=mips%2Dunknown%2Dlinux%2Dgnu,kernel%204.4%2C%20glibc%202.23)<br>
      <br>
      <br>
    </a>Regards,<br>
    Yash<br>
    <br>
    <blockquote type="cite" cite="mid:15cc528bef581b15f6010f22999640a6320509b2.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------qHTrfdDIoEKCrS9d7B9x2q3l--

