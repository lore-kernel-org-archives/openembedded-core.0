Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CD9E9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 19:48:49 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20896.1771357723438326380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 11:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FxGD2zNH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.66, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hs/AhxG8N1YN0oyA7nTMJ1zNEmUrdHsbTnlGPBVtz6JPVbZxAFJvz3Y1KFUh0nA8Wgj9HTk7bjMtSxOe1mQxkQWae/tlDb10qwlfUgLIhpl4rNYGBkg/Ly6Km7/QvsaqxjallVKYdBt4ieMRgTRDDCooKMwfPDsKWpGE9hjDO82g9TGlVl9t+1CnYhOmOrVHZDhkM8wv5bELYTB47mK6vpfptutb4XPZbptouz5rbW057bAVDSNA9T9RQ2DLN+Foz5wRn9UDxNjEKGzqLjlu0/r/9RERLv88MHtTu8IHCye0t/actULHDx3DiiQ/Fj96BNxWv3/ZrW+4U11by0TltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNG+OMC4zpiPt4mPJ4oF6qzL8b4UIawQx1p1LIyQDqo=;
 b=I1XIyS2h9N8LxLoO5Nrw3DjHeeCugKiy6ia5YOLmlAwv7jnd8hQO5EqoK7pznrmMBTBP97wxnQTfSGopEYz4iTrt/trnLsQKhQUmNzVgVYrFcEzrN2OSKgpKYksv0PFL+19KlA61Szu3B6EhPCU7qOGOC7Tv2fYbPBWEzUYPQ5iDBqiRM8V7jm767avMmxD7+AX/Pj+IFXfHmrL3ZTWBTeHsyZhhJNFYgYCAURUBITyhQPdCzVjBabZCX+jlaporIHnLYaUv4DpGYo9TGBUrVsDqXdor9KVdiOXPboWmyAIebYi8CUEaiRxG5wRpY+u4cpDLrJCHdCNo63IOAJPACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNG+OMC4zpiPt4mPJ4oF6qzL8b4UIawQx1p1LIyQDqo=;
 b=FxGD2zNHgdq7lT3vbTq4x8jUsfmJng2q1ABBe6j/KGIp6TAT/k0Ewqu9NwRhUOlcXoUOyDLBSVKzE2E6sck6ktwxZHku4daErkvqXacmaJ9V9n9gOlHCbfwalgH3nHWlODNe1g0VW4kgAz3VA6tvoO4cg6dw+6qhUTOrDa0+jO8=
Received: from DM6PR03CA0064.namprd03.prod.outlook.com (2603:10b6:5:100::41)
 by BN0PR10MB4872.namprd10.prod.outlook.com (2603:10b6:408:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 19:48:41 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::a0) by DM6PR03CA0064.outlook.office365.com
 (2603:10b6:5:100::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend
 Transport; Tue, 17 Feb 2026 19:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 19:48:40 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 13:48:40 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 13:48:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 13:48:39 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HJmdLB3393438;
	Tue, 17 Feb 2026 13:48:39 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2026 13:48:39 -0600
Message-ID: <DGHHWMH13HPU.3RE8CUYMSM3T4@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCH] reproducible: fix git SOURCE_DATE_EPOCH
 randomness
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260213004252.3371379-2-rs@ti.com>
 <DGELD1TRQ45N.3TZRX9CWB25E1@bootlin.com>
In-Reply-To: <DGELD1TRQ45N.3TZRX9CWB25E1@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|BN0PR10MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f1285e-9dd2-4501-e488-08de6e5d8d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFViSUZENUt6M2NkNHNnVnJCakl6NVRiKzByZUVHU2xkb3lOcUI3RHNTY2Rr?=
 =?utf-8?B?Z3dnMDBsUUplY3N0TGV0SGk3N0JRZzcrNkRLbUdEQ1BpWFRiM05TUzlOMHRh?=
 =?utf-8?B?d2VnUGk1bTljaGwrN3NRekJDSkNoK05ZZGdBMVY3OTBGYVhBZWE0WitLYkpo?=
 =?utf-8?B?OTI5WTRvbUtaKzZuU3JKN1gyNnZpcmp4Um1pUUh1a0J4NGo5U2ltV2pUdXFQ?=
 =?utf-8?B?RmszOG5aL3ppVG5YeC9xY3dEMW5EZ25sUjEvTU5FUUZsYTFLR1laVllaaU9w?=
 =?utf-8?B?S0Mwd2NGOTQ4UERMclFwTm8zN255M3NMVnZLNHdGWHNxZTh2dVk5L1h5R2Jx?=
 =?utf-8?B?cWJtMFV6OEJEalZIS2lMV0g2RHNjZDBOMklLRDBFdXNSOWFjZG8xNTdTY3Az?=
 =?utf-8?B?NXdlUEgxVnJUQ1lmRWtjMzZ2M3B2aG1YUS9SQjU2SWxFelY2T2poY2RkQ0ZC?=
 =?utf-8?B?RlYvTFRVZjJHSkZocHFXZ0Y0L1l0czJ0OFRtTlZFS0tmaGo3UUdyTEdOS3lI?=
 =?utf-8?B?TkNEa3kxQ0VyS1NnMTdTbE5nYWh6SGV2NXhrQllhQTNJRDY2Q29OeE85b1Ja?=
 =?utf-8?B?T01idnVRQjVnYTBpbTh0eDVnKzlXTjJDRC9MMnNRWG1aN2RiWnVrZUUrM0VT?=
 =?utf-8?B?RE53RlZXajExUGtWK202dnpCSHRoMW5vWDdmN0wyZEtidEJjbjJ2M2lwTEZH?=
 =?utf-8?B?NkRKRng5ZTdEQllTNmh1Sy9nOHI0d1Q2SEZFWnEvdU1IR1d0NUFhOVNCZGRv?=
 =?utf-8?B?WlBUU3pHUXdBTzQyQkphNi9XK1p2VkpYanBGUWpYTmY1K1RrUTBPWHI5eHdY?=
 =?utf-8?B?a3JMdnhPVWZIY0RSVDdWdWFISWtJOTRpMkdkNzZkRjRRTmVMdHRSdmRoK0xx?=
 =?utf-8?B?T1FkZGQzMXYybGVZN0NkdjEyUW1kSExwejNMdGFlajJRZ2o4VlVDZXlxdkc2?=
 =?utf-8?B?cHFPbktVVFZKdDBSRFdWVHFaNG5UZ1dVRmtBUlBFVndnTEZ2d1RFKzh6SnJq?=
 =?utf-8?B?N3UyOW0rRUtCb0kwMWduanphWDZmb09tSjhycVZwUmpkVVZDbG5qY1Z5V2NM?=
 =?utf-8?B?MGdoWjJxWnMrZjV5bU1aOVJNME5kVW5xNytHV2tTVUZXU1Y5c2xseXl0MGI0?=
 =?utf-8?B?ZTZiQUUzYmsvS0FOR1VkcldWTlRuVFVtK2VSNFlEZ2lQRlVYUitsWkRkSjdF?=
 =?utf-8?B?OXhGZ1M4b0ZYYmg1Smgwc1FKY3ZqVk1Xd1RTdXg1QTZmRmY1OWM0NEl3S051?=
 =?utf-8?B?VUw1cmdyNzYzc1VtMTNQa01OUEVvV2x6b1ZGdVZlM0JzNElEU0I0YVhnejMy?=
 =?utf-8?B?MGd5SUcyU2pHM291cm9qTzBYN3E1Rms3b2xibTJHd2ZIeG11UGR6akZvczNZ?=
 =?utf-8?B?elhjK2plaXA0Q3JUN3VFMXRhVmtVUDJDbmMzRDlpcWJwRjVpazA5TWhzUk8x?=
 =?utf-8?B?WEN2eUVXNTNGaUpkd0trZFJUWmk2YzZWVlFSNEd6NFJxRk0xQ1dodnZhRkc5?=
 =?utf-8?B?UFRSSFVFWXBFSXh3czBQSDVjZHJvb1YrV1YvektvVzRPdi9kR2xqT0JWY2tJ?=
 =?utf-8?B?MjFxV2pFQWk3NTB4NGFIc3V6aGlMSjlUTWp3TEZKak9icWgrYndmdE9uTTJs?=
 =?utf-8?B?bGFtYnJvY0ZRRllKTVZ1MXNqd1lqNld3bHVyYlFCdThnYTZDclRBQk00eml4?=
 =?utf-8?B?WHJ3QytibFNkU3pYNEx3V2IyS254bDdYUDRGemNVclFYY2Ezc0JCV0pkeXVo?=
 =?utf-8?B?YTZPVHZubDd2TzFmU2lQeTFXM25nQ1ptamJ4M2FtV0Z5N2RpU1hPaWtINHBQ?=
 =?utf-8?B?TmVpbU9OZlRjcFhUWHNkbHc3bDZlZkhrVU8yQ3hPQVdIdm5JcTl5UmU1azkw?=
 =?utf-8?B?QXNBT1hZcVVsbWZxME82WVlFdGZQUnVrMzJvNkFNNTlvcUV5ZTRhcWQ4Rkk3?=
 =?utf-8?B?OTdEeGgvZVlnbk9XSldHZ3dsUHJ5aDZ4NEVwVHBXZnRzMytsbmpRZG1mR01G?=
 =?utf-8?B?bStjV3dBdVNVdFdWenMyb2hyelhpbmxMWUNzMVhUbTdHOCt1Vk45VDBtZ3JG?=
 =?utf-8?B?aS9IbkovZ0Q4SENBL2wreXpKQUNjaG40dVpINjQwekI3ekI0Nnk1SXE4d1lC?=
 =?utf-8?B?SStvK0FmeVFCQjRIU1FGbGR0a3J4a1FwdER4QzVZWTZ0cHVkNWR0YlN5dExG?=
 =?utf-8?B?VVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WcgxEY25ES2e5badCCekYtyU+rJyvU8mR9cPumlm5Vk1WHprqVvh4YARGSbIgvE81oEEdpeSUzvemkF/APvrIoYv7Y0tiSIkqwrMA33LlQDFXmr0Y0KCXVDhWqJwMgDy+LiGPXjV7fC0S+6U1I+HUrlUJO5grAG5efybDc3hn7f7x4i1Lzb0DanN4Pdo2MJ4TLNSVySKgl+K8IDKz1weWPyw+lDR+M/8dxzDxZoVoFWKTQEmNOAv3s/AhIxl77zdktw5gg+toXh5xuoljckEN63MRbokHBJhIOcKZgtrqDwIWtHw+31UqDCRSQUEJJPfkVHJ2Pkt+n4k6cu32BwAaHYpfTijtaAtJxg3MN2DgubR7X7eY/cbA3b8Dp8Jt0gCIUAar/6+KsHyS/F0qu900UE8D8cL15+mTlZqfB4A3q2pmQ58Ej6o1tWfCkbE5Jtk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 19:48:40.8800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f1285e-9dd2-4501-e488-08de6e5d8d00
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 19:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231272

On Sat Feb 14, 2026 at 3:53 AM CST, Mathieu Dubois-Briand wrote:
> On Fri Feb 13, 2026 at 1:42 AM CET, Randolph Sapp via lists.openembedded.=
org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Anything that defines multiple git sources should have the largest value
>> taken when calculating the SOURCE_DATE_EPOCH for a package.
>>
>> The previous iteration actually introduced some degree of randomness, as
>> it would stop on the first git repository reported by os.walk, which
>> does not assure any specific ordering by default.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>
> Hi Randolph,
>
> Thanks for trying to fix this. However, it looks like this is causing
> another intermittent issue.
>
> We got the following error on the autobuilder:
>
> ERROR: libjitterentropy-3.6.3-r0 do_unpack: Error executing a python func=
tion in exec_func_python() autogenerated:
> ...
> File: '/srv/pokybuild/yocto-worker/qemux86-world/build/layers/openembedde=
d-core/meta/lib/oe/reproducible.py', lineno: 107, function: get_source_date=
_epoch_from_git
>      0103:            bb.debug(1, "%s does not have a valid HEAD: %s" % (=
gitpath, p.stdout.decode('utf-8')))
>      0104:            continue
>      0105:
>      0106:        bb.debug(1, "git repository: %s" % gitpath)
>  *** 0107:        p =3D subprocess.run(['git', '-c', 'log.showSignature=
=3Dfalse', '--git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
>      0108:                           check=3DTrue, stdout=3Dsubprocess.PI=
PE)
>      0109:        sources_dates.append(int(p.stdout.decode('utf-8')))
>      0110:
>      0111:    if sources_dates:
> File: '/usr/lib64/python3.13/subprocess.py', lineno: 577, function: run
>      0573:            # We don't call process.wait() as .__exit__ does th=
at for us.
>      0574:            raise
>      0575:        retcode =3D process.poll()
>      0576:        if check and retcode:
>  *** 0577:            raise CalledProcessError(retcode, process.args,
>      0578:                                     output=3Dstdout, stderr=3D=
stderr)
>      0579:    return CompletedProcess(process.args, retcode, stdout, stde=
rr)
>      0580:
>      0581:
> Exception: subprocess.CalledProcessError: Command '['git', '-c', 'log.sho=
wSignature=3Dfalse', '--git-dir', '/srv/pokybuild/yocto-worker/qemux86-worl=
d/build/build/tmp/work/x86-64-v3-poky-linux/libjitterentropy/3.6.3/sources/=
libjitterentropy-3.6.3/tests/raw-entropy/recording_userspace/jitterentropy/=
tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-entropy/recor=
ding_userspace/jitterentropy/tests/raw-entropy/recording_userspace/jitteren=
tropy/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-entropy=
/recording_userspace/jitterentropy/tests/raw-entropy/recording_userspace/ji=
tterentropy/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-e=
ntropy/recording_userspace/jitterentropy/tests/raw-entropy/recording_usersp=
ace/jitterentropy/tests/raw-entropy/recording_userspace/jitterentropy/tests=
/raw-entropy/recording_userspace/jitterentropy/tests/raw-entropy/recording_=
userspace/jitterentropy/tests/raw-entropy/recording_userspace/jitterentropy=
/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-entropy/reco=
rding_userspace/jitterentropy/tests/raw-entropy/recording_userspace/jittere=
ntropy/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-entrop=
y/recording_userspace/jitterentropy/tests/raw-entropy/recording_userspace/j=
itterentropy/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-=
entropy/recording_userspace/jitterentropy/tests/raw-entropy/recording_users=
pace/jitterentropy/tests/raw-entropy/recording_userspace/jitterentropy/test=
s/raw-entropy/recording_userspace/jitterentropy/tests/raw-entropy/recording=
_userspace/jitterentropy/tests/raw-entropy/recording_userspace/jitterentrop=
y/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-entropy/rec=
ording_userspace/jitterentropy/tests/raw-entropy/recording_userspace/jitter=
entropy/tests/raw-entropy/recording_userspace/jitterentropy/tests/raw-entro=
py/recording_userspace/jitterentropy/tests/raw-entropy/recording_userspace/=
jitterentropy/tests/raw-entropy/recording_userspace/jitterentropy/.git/', '=
log', '-1', '--pretty=3D%ct']' returned non-zero exit status 128.
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3177
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3231
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3194
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3345
>
> I only saw it on libjitterentropy so far. I quickly tried to reproduce
> locally, without any success. Yet I confirm dropping this patch solve
> the issue.
>
> Can you have a look?
>
> Thanks,
> Mathieu

Oh, a recursive symbolic link. Fun. I thought glob didn't traverse links by
default. Guess I was thinking about Pathlib's version. I'll go back to a
modified os.walk version since that supports more python versions and has a=
n
explicit 'followlinks' parameter.

- Randolph

