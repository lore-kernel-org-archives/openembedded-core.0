Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A9EC433EF
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 08:49:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.13184.1653727784710934837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 01:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aYu6NM8R;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2147453f37=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24S8lJYV003426
	for <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 08:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=R7RMDA3jMG5RkakFpGUgLFJYaBvWOev2r/xYeZLEBmQ=;
 b=aYu6NM8Rp+hb809i0Lam8xYPOO734BbIrUsyKqS/8c41kFHCQUcrEhwHc2kFCnWZ488U
 ZeqC91BgClLKN3MFkipu1xR+Nwry3rA0d2dxf8oF0WJ5HhsMi4ibzzq355phgwILK2On
 3HLKaG491YkY8IpnEMSPBNj8j1Ws0SV8le1tpoTXafGbT/yY/JQpPT01Cy57Ja4ZV54h
 TSP3KoySSg5F4c+UZXCAIftLSOsM/YwmgVcO5v7QYcZQca+YmX0vM7T6EYbvQnbUooC7
 d5B5THVJ80J+COXawApukP9eAGZ+/vmyxwleqsUziakLcGoHCWpAWn2SsnPWFm/XOXVe IQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbc1783gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 08:49:43 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24S8ngE5007526
	for <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 08:49:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbc1783gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 May 2022 08:49:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkPkiDp5kDKTTGTsn0bTnUMsPOjX6RvqxLOuueq4JbTTKj6gCKU5Jrp+YEsO7gRmKso6WU25LhS6y3p6askfWyDwWpmWUHfdZTvCT1RFaTnmelq6MGa9/QpSu+9ZuMgg2XCb1xfYiTNoQZ9tj/yNEKfS1IsB/a8r8u6k7z9Umnsa4IQjoA5dxvrWv+tZjAM1QQKGxgb50S05mERw14IMFZ1Vx4FcbGubGSgJkE0LP3zHdWAU6d+6zJBAC5/0iVg9TZxx8zDYZwf+dTYjsF0qdKO97hgEeF4B7LvdRMn8XpA3kbIhPUzliefn6ZmW4B6Xpzwt0cCdlHw0adKwJ5UAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7RMDA3jMG5RkakFpGUgLFJYaBvWOev2r/xYeZLEBmQ=;
 b=cVYz84lt90Fd/FM5FcAI9Auil+yoFXIINkLjWAzFtriJGiIX+d/AIiKaZf2eYO/SHQe3KjOU8RZ1puhzWOAYyg1Gb9ahvr9HzDVzekiARcUHohhxRIlRazxzy2u/ZWdg0x0ouuXV7g3BkjEnLe4w8G5n7L+u4/kGHyT9pUFncw/d9O65RbXNoSlaW+2V79eLRCL04o6gFH9TaYAV9xyICgxgKHhgZrmbH6LT7KVn+LGNVDVPQL1rWg4ef+MbMGuOPe6nn7zw8bwugqDnNxHGv3K9UewcO7o31/hG2gQIQ8cKZ6DwWIMcVLzn0zjMjVclDcZ1XpBZp69RDvZMz9kQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sat, 28 May
 2022 08:49:40 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::ad48:f148:3b57:dc66]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::ad48:f148:3b57:dc66%6]) with mapi id 15.20.5293.013; Sat, 28 May 2022
 08:49:39 +0000
Message-ID: <3f1e7876-6d86-b5e2-4d66-a2601a1b4692@windriver.com>
Date: Sat, 28 May 2022 16:49:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/1] systemd: Set RebootWatchdogSec to 60s as
 watchdog
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1653635182.git.liezhi.yang@windriver.com>
 <c05b2737acb3c1b1d91085eb38c183214f478c62.1653635182.git.liezhi.yang@windriver.com>
 <CANNYZj80M4gomd8Hh2nad1QGT8tX3pGb9sBVPP2Ds8GNPZzokg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <CANNYZj80M4gomd8Hh2nad1QGT8tX3pGb9sBVPP2Ds8GNPZzokg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0162.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::14) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32fce140-b0b9-4323-d67e-08da40870032
X-MS-TrafficTypeDiagnostic: CO6PR11MB5636:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5636DAE5A05AF2C54F363B2CFFDB9@CO6PR11MB5636.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V2EJ3u7uHWL63Zb9+xkKkHSepaizX5MEBj2K+pOiawH98w1TB17lcUjlZ4HbbeijjJPEXlquj55qT+Vj+dY8vPrT8ega5rAjjWWcCA0xKoRoRJgqO1kN+SfK/SSNvmNnmaV3iSkNWYOWjfDX2etFZ/v0dAm19XTGc3gPhvc8QNLvHfRpuSsnkNWkkPr8Hup+6cSyxe+LUBUoBeGugZXWybBy3DpFLA8t9NSrxx1r733yY/GKxLXClvOrzRHHnixmFlXeZ5YK13PpyJ3LDpi/6n896rIoXkxBoVNE4jValQwfJLkUxFhSzWPmfX+Y4OM2kBfMWbR0C2Dt6HkE+NkJTdeso0AOlMsh8H5gLmSy7NDwfv9JT8NGFlh3phiXd+V8D9Bj1XWvHywKn4FIIc+nuUJlzSDl1uLH51bsI0FdnowlMsfSOyNjH3xVwZRLcxYH2wwI7XgkSWj4EUrPpHRm39AM5cJEWUrAGL3ns04j7sqN9nDx/BEWe3LU61eTSr56yMdMeQFIuekvIyFpjirOyudYZNhjNU0YsmfYksnLKQDgLek6taV+ONTkQkGQIy/z67rj8FRjA7BIzuOMsbSsSLr21WC6gmGzU24U8gr7L8Cw6B1R3BQ7UhABIoRsE/nwlOZ01gCwxwvIe6PCCDNoIKPx9jCWQb2GH4Znn/yyG9XRIPWG22JIkGMv13CiJgfZDXxZLVKmIFsNBQWav2UlRneEWZA1HhZTjBp8aApN5D4CvHZP4BRj1xIAxKDEpCPddlyPKCj35zRs96znkEXOJwDVdif3GrG3EWKbV9uCAi68EuTntNWWEJae3i/hkX5nPovs6t/QGKok55yZYUZ5QMO86/W9T35qk+1MpRHeudCgIdvDm1qCEFS3l4IJsIq3hcUWBSjkS4VBE++8LOEkvm5mj1Qr3reb0F9N8P6gjOI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6486002)(36756003)(8936002)(2906002)(4326008)(38350700002)(38100700002)(316002)(186003)(83380400001)(6666004)(508600001)(31696002)(86362001)(966005)(52116002)(53546011)(6506007)(6916009)(8676002)(2616005)(26005)(5660300002)(6512007)(31686004)(9126006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTYxV1RWTVRoVmVzL2h2bm1oR2duZzVjT2JaRDNFVVE3N2pua2xLek9XS1Zx?=
 =?utf-8?B?TnlhQnkxUW5vQmU3SVhtbUR1TVYwdDdLb3pXYW1hRkplTGJ4OUJHUGF6d1oy?=
 =?utf-8?B?dkQ1aGU5cXd0Y0NSMlVOUnFVMjNjQ0R2RnRXTHRJaFVib2duRzVFRStvOFAv?=
 =?utf-8?B?RFZRVU1ETTFaRkZqekswcmtZdTVlc1FPWTVKSkNHeFdLa2J6VjhBZ0hlZmhS?=
 =?utf-8?B?QlMrRUFOc0MxSlJhMjlTdjMrc1dwdS9DdzIreFNtSzFZMnI4c21xaWRzUlpG?=
 =?utf-8?B?ZTRqRDlJdTF0ZDJMSFZ4cTh6UDdMcld2cU1HQjNrVDZ6cHJKcEVuWDNNRzFC?=
 =?utf-8?B?L1kxeURFdml5dzllV0VJRllMMFFpWUFPSEp1eUdjVmlCMXhsVEhQWkdIMk1h?=
 =?utf-8?B?OGdrcVlQVDZiOGM1ZWhoRVdSbDBTeHpzaTIxbHltVVNJL2d5ZzRlVW0yalgw?=
 =?utf-8?B?YWdQcFlxc1hmYlMxSjl5NldQR1cvQThaek9ibk9iZFE4dzFWTG1HckUvSTh6?=
 =?utf-8?B?dGlsWjU4cTZ1WEtqUE5HM0NMOU9MY3BHUHhsanFCTTVRRHZXWmpBRlpyRlpo?=
 =?utf-8?B?ajdqQlJLK3JhNE9NR2xzdGlSZlErSEhLR0dJbzQ0cG5RQzJvTDVXOGF2TVFI?=
 =?utf-8?B?L3ovSWZtWWxIbGVtVEtvd3dWQ1lzOENWcndTMk9KRWxOZU9MN0tiMnVKci8y?=
 =?utf-8?B?UmhnY2s4eGR2a1F1Q2dzRk4ybk9XdklXbDB4SW94eFdWZzFodE8rQ0lwdGQx?=
 =?utf-8?B?emZiZmY2USsyZmFUZjN5NjlYY1BsNHE4OWZwK3ZSZExoRTVUcFJWV1EwM1po?=
 =?utf-8?B?S09DTWpTQUM0NGg5Y24yU2htSzExOHh3MElMSG9zcTVqZGhoSEsyK2YwY2xC?=
 =?utf-8?B?Y2pEYXppR0lSb0JOQm12bXR3emN1V1RiamhkWlcxTU5GQStISFZvUjRQWlRX?=
 =?utf-8?B?aXFaUXNqRHBDT1FidzlGNXdXYUJLTFRvQVdYckdKZEtuOE1MbnVMVWo3R1Vk?=
 =?utf-8?B?RlFrdXZvU2toRWJnTFVXRzhQU0t3ckN2c1RGVWxkNi8vSEZBVjNJRDZJaG9H?=
 =?utf-8?B?a3JiMFhaVjA5YmtCTnUvMjJ3ZTJXbXFVKzk3dTM2SzRHZlJlQUlMVXIxOW5t?=
 =?utf-8?B?cVRHMXp4bHgxVWpOZDg0bzdjS3VqZjhUS2M4WEI3cWgvcGxXTG5ERUVLUk91?=
 =?utf-8?B?Nlo2YWl6N211cnk0VUhOUkdlNHBYVDUvWU8vb1ZYWWEwalBIWFp5MWRtdjVy?=
 =?utf-8?B?M201c3pDVW9uU3RoVnR1NzN2TjhrZmtEdUVScFdhY0V6M2dkaEErOUl1NHlI?=
 =?utf-8?B?TFFOQS8yMEVoNHdIZkR0UU1Zb2UzNTZPTXFkUXFEaG1kU0Nidk5DNml4WmFI?=
 =?utf-8?B?a0dGOVhpMHNUNGVzZDBwdGlPdUtuQkNCdVRhYXFORGQwOWRhRXpDc1Z3SW5C?=
 =?utf-8?B?TFQrSm5BQ1BqQ3dKWUlpeWc0Tytwam1zM1NrODBkZVVCZy9sWmhlNXgvNS9K?=
 =?utf-8?B?dWpwbGxvWHE3MldrMHJOeUR0L3ZtQUtmWE1Pcy92UFZGdkM5Nm9YNWgzOSs0?=
 =?utf-8?B?eW5HYVIrQU1jYWJ4VHJUcElvUnRzTlI2SmJkTk44TjNOaUs3d2FYWkVVdVV2?=
 =?utf-8?B?VmJBT2lpNGxPT1hqMjlvZVV6ajR6VjgvTkVwT3B0Q0xCblRLZTljMndsNVYw?=
 =?utf-8?B?dDZBV0I4OWdYQ2hYWXFscG5jeHdNQmVPVjd0L1p3ZFJZYWlWZW0xaXdCWXVX?=
 =?utf-8?B?blRKVzkzYkpVUmwvbWhoRXlmZWkxSTNCUHRkVks1S3pMODlOd1JCQXlSVUdG?=
 =?utf-8?B?dUNxZ29MZGRMTjJ3akJ5d2pJWmRXRERsNW9XUS9xaE5vRUhaZ1hPZCtETmpT?=
 =?utf-8?B?SU12d0M2Z3ZIVjhLN0NXSFpIWFMyKzRxWFNGajRKVUR6ZGFIWGRVdW5iejQx?=
 =?utf-8?B?bHJQenJGRFFOSWdZRUI1Q29PTDBtbnliaXh4YVFYUGp1Z0xlM2lKMkJScE5t?=
 =?utf-8?B?bHEzcXM3djJlQjdFcEIwMENaN014TDFiT3N6VmVDM2pDTjFXUFdtS1hmMkVB?=
 =?utf-8?B?UGo2dFRhUGpsdnRtOXBJRWhVWmUwbG13dTUrbnJXUUZWNGJpUlduMUlZSk9k?=
 =?utf-8?B?YmxSS3NBVURWa0hFVHUrWEU3NVhWL1dQRWk0S3ZzdENoNndLOFkzNDg5a1Vn?=
 =?utf-8?B?SXdFdDVsblhnbXhNRUpiR0RhdzBSUzM5NVVreHFuOUtaQTFSL0w3NnJOUnAv?=
 =?utf-8?B?MTljUUNKWjNXMVN1V1Y4MnJTQ3FPZytLaHd6dWI0UkdIeXBSSDIydmxZaVR5?=
 =?utf-8?B?V0Nia0VCQUF1akdWK0pTVmVtMW1wLzdreUo2RHFDckJjb3RsZ2dMdjhwRUtZ?=
 =?utf-8?Q?LHh6UryLIxDyuw6Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32fce140-b0b9-4323-d67e-08da40870032
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2022 08:49:39.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 I9BYH/xAG0Iv4XjG+0xPRPpH+QJitVrPQ3qJXNgP99MQkYa+HrKdzRNkNcUYVekhK2szHgVBNpxOK/GGgza9tDJdQbIk09dShLRybqSsrYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-Proofpoint-GUID: clJ0lm_IezM4DkQKjutYuyPlmi0P_Ecp
X-Proofpoint-ORIG-GUID: BfgnEdzRz2ez5wrtmFOl_3cM02kISTX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-28_03,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=881 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2205280049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 08:49:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166222

Hi Alexander,

On 5/28/22 03:12, Alexander Kanavin wrote:
> Where is the default of 10 minutes set? Should it be fixed there?
> Patching things with sed after the fact is not necessarily a good
> idea.

It's set in src/core/main.c, line 2451:

arg_reboot_watchdog = 10 * USEC_PER_MINUTE;

The ${sysconfdir}/systemd/system.conf is used for configing it, so I didn't
modify src/core/main.c, and even if we modify src/core/main.c, we still need
config the value depend on the boards, for example, rpi4 (max: 15 seconds),
nxp-imx8 (max: 128 seconds), other boards may have a higher or lower value
than 60.

// Robert

> 
> Alex
> 
> On Fri, 27 May 2022 at 09:07, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> The systemd-shutdown sets watchdog timeout to 10m (600 seconds) which is too
>> large, and caused errors when reboot on boars such as rpi4:
>>
>> systemd-shutdown[1]: Failed to set timeout to 10min: Invalid argument
>>
>> The watchog's default value is 60s, so set RebootWatchdogSec to 60s to fix the
>> errors. And <machin.conf> can set WATCHDOG_TIMEOUT when needed, for example,
>> the max timeout of rpi4 is 15 seconds.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_250.5.bb        | 8 ++++++++
>>   meta/recipes-extended/watchdog/watchdog-config.bb | 7 +++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
>> index 006b2f86eab..6fac27ee56d 100644
>> --- a/meta/recipes-core/systemd/systemd_250.5.bb
>> +++ b/meta/recipes-core/systemd/systemd_250.5.bb
>> @@ -238,6 +238,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>>                     -Dnologin-path=${base_sbindir}/nologin \
>>                     -Dumount-path=${base_bindir}/umount"
>>
>> +# The 60 seconds is watchdog's default vaule.
>> +WATCHDOG_TIMEOUT ??= "60"
>> +
>>   do_install() {
>>          meson_do_install
>>          install -d ${D}/${base_sbindir}
>> @@ -337,6 +340,11 @@ do_install() {
>>
>>          # add a profile fragment to disable systemd pager with busybox less
>>          install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
>> +
>> +    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
>> +        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
>> +            ${D}/${sysconfdir}/systemd/system.conf
>> +    fi
>>   }
>>
>>   python populate_packages:prepend (){
>> diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
>> index a28d28033bc..f1389521284 100644
>> --- a/meta/recipes-extended/watchdog/watchdog-config.bb
>> +++ b/meta/recipes-extended/watchdog/watchdog-config.bb
>> @@ -13,8 +13,15 @@ SRC_URI = " \
>>       file://watchdog.conf \
>>   "
>>
>> +# The default value is 60 seconds when null.
>> +WATCHDOG_TIMEOUT ??= ""
>> +
>>   do_install() {
>>       install -Dm 0644 ${WORKDIR}/watchdog.default ${D}${sysconfdir}/default/watchdog
>>       install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.conf
>> +
>> +    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
>> +        echo "watchdog-timeout = ${WATCHDOG_TIMEOUT}" >> ${D}/etc/watchdog.conf
>> +    fi
>>   }
>>
>> --
>> 2.35.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166202): https://lists.openembedded.org/g/openembedded-core/message/166202
>> Mute This Topic: https://lists.openembedded.org/mt/91371988/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

