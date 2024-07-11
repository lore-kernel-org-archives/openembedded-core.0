Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA824C41513
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 07:57:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6956.1720684621387970070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 00:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7922740ab3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B5DVwg020873
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:57:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x4pvv-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMywKccQ7MYo5obxrdPOk/6Hqe2D1rc/Q2ubw1jpzmH/u5OqMnf7gOIXSKxE8MHgUzdtmN9as92Gddd9UPW00Vv7XnyGqun9wVoBtui9NHcarIiKP07pP1yN9xFXY5eeIcIw6u7lcJKzXKN3isb+xhGBMOVjeRGJiW2Jsrm8q2SwcH35xTTL1JwEV7j6BbiWyK4t+5w1NEkUq8H0fW1mY53zU0pbNoIfiti1O78wrWhLtD2PfN9k94TrwQH/Gfj+XbyHNQe9AZMVPnMuIM+agoXSAgalLcEZQDVmKLwi//8yUX+aAs26QGYultskQergGPaACGeb8BKIq7AqVlbtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfSGYSkr3hP4kDamvXT0TLdYWjcDBDZgJgxqFp0TVVg=;
 b=SiNzvpBT1U1AxCXHM9uIWvmihYaYn+kMIYFeIn/ki2LP0P9MW1DkOuTMCXGYkALFSjAFqaM1qjoBDrG77vFjFpp0iyI+ppObH6xRYWPFLlCJw+frXUObqVyX8twB0QcEq4KWh4MHXnEIMTK+23krP+VLOU49InQXoODRAgiNqVAwldWzm1oDSCs4W/R9CuueS8CzwDqrt+MPiVA9FS+k3pAkR0cxdTf/7ZnvqrtNILKQUONeVrd4SanWLUmPuGJqJc9FhAgc5DmkGesDkYWferZjH2XkkoabMGmP31EA2U5spBzCTXHmX6yw5T1RroaX058ucR9Zi1Q41ep3mLXfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:56:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 07:56:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 1/5] systemd: upgrade from 255.6 to 256
Date: Thu, 11 Jul 2024 00:56:33 -0700
Message-Id: <20240711075637.3023203-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 086813c0-cff1-4940-bd13-08dca17f0541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDVXUEtwYkgvdmZQL0Z6NTZEVS9FZ0lUVGxuYmFIb1BzQ1pUK1AwZlpwdDVn?=
 =?utf-8?B?WDZzVGFIOHo5Y0Vnd0kwc3NOcldwaHAxd1lpTTgxYm95TXVCUjRvQXQybGNM?=
 =?utf-8?B?cVJRMy9zb1ZQTnRNYUI3YmFwZk1Cdk95YlJrVjlzTzg5emt2QkFhaHdZbWI2?=
 =?utf-8?B?NnZWQ2E0L0tyTkoyekpPZmZzSWc5dkpmYXFtdnpGUUVyMGpKZFVvRXNrcURB?=
 =?utf-8?B?VGxGWWM5elk1clR0K2VSdHgyRHd3OG9rQi8wRCtHL21mQmw5akFXZko4WXFX?=
 =?utf-8?B?a1pBY1orT0J0OHJyTVFYVEZmOFdyQ0FTOXBBemJQMUx6TkhLNnZheWJhMFU2?=
 =?utf-8?B?WUpwNkg4VUN6SXluazZnUkJtM09QbGRqNFZIU3k3b0xWMmNSTXNNTEdkbXhy?=
 =?utf-8?B?YTg0NVozT3V3Njl1aGd0dndRbFFMbVcyMmwveWVmbVBtNXJsMHBwZEhya1Ix?=
 =?utf-8?B?Mnl4TEV4bXk3OUhnSXNRUDRJOWpEVitFZS8vd1ZiYUl4MnFJN0duZ2c4RE5l?=
 =?utf-8?B?d3Y1bHBVdFFST3k0aVVhL1NTMk0wV0w2S3lYODZ1bnROTlBjb2pSZlJYUG81?=
 =?utf-8?B?ZUdkTS80SXdDVjN3T1QrR1kzNFRQTkJCeVV0Y1E4NnAwNlRRelNQem9SbHFr?=
 =?utf-8?B?NmJZRk9PWkdxWThaQ0lQU09wUFF2cXZpVlZzN3JCNklDQlBRL0UvRHFLeXV0?=
 =?utf-8?B?VjIyMUV6RGk0WllWazdwSlg1WkZUYm13NFVWd1JwcFBJa0lWZUxmZkowSk05?=
 =?utf-8?B?Q20zRzlnVGxtOHluTUcxaDQ0NFZoZU9lSXFvMzVkeXBleUhQdW5VaGV1dlZB?=
 =?utf-8?B?ZmpoM3NOdHdRWW84ZEN4TlRvK21lL1NLeFBmQnowSkdHdi9GYWM3N3VVY0tZ?=
 =?utf-8?B?YzhBNG9PampHOUdZY0lLZzhTYmY4RXFkdk4wRHNnZis4R3piRUVKdkI0a2RH?=
 =?utf-8?B?ZUtRcWpQREpRL3lzc3lybmthUWsrVFRsZmFTaWJEbU9BMFQ3R2o3YWxVaWhN?=
 =?utf-8?B?ektYZW8vUWZTbEY4VnBKUG5uZFhWUGtwS01vNnU2K09NaW1GZFM2Ukk5bnZJ?=
 =?utf-8?B?dXBTUGN4M1ZOQlk1WlFOeHdNQVI2cE1kVTdtdzFHUkRRSVp6eFY3OVlic1VC?=
 =?utf-8?B?NCsvdHFSRzdHRlVKbzFDRXNoOVlMWDFvVUFHTHJ0M21odW9MRTR3eXpCSGZ4?=
 =?utf-8?B?RmVzZUxzY09RbHIweHJLaE9QMFFjWFFONmpvSjVSNXhxM0c3QTRydkc0VmxB?=
 =?utf-8?B?aWZrRFkyZDQyek1DLy9RWHJsNWNpT2o2OUh0bW1RL2crWDBMTlUydERQcEp2?=
 =?utf-8?B?bmIrN0tIUnQyWmhaVHBxbkkzMkI2WXpBOXYvaElKRWtMZkNuRm5oY1FCTmxz?=
 =?utf-8?B?Uk1YYUxkOWhkeHBaNU9FV1ZjSkF2T0xLVHhhZ3IwVXNqM2lSclBDZzhRdG9F?=
 =?utf-8?B?VUJFbHM4QSt0MHMxeWJoZ3NxK2JVRm1uT2ZGOXZKSXZuVGVOT0hUYUZvSHhr?=
 =?utf-8?B?MjBhbDFNYTBxRjNta1JhRXl0azI0eFZzMld3YnBaQzhibStrM2FTc2VwcDFz?=
 =?utf-8?B?NWhkYm14UDFROGhuR1lxZTVVWjQydXk3OG4yUzhjN3VMK1NFNG1QUUxvMm9P?=
 =?utf-8?B?eXNIWnJTN1ZBOGhPcXg3UnNzamt2OG9FL3BmVTJwRWh0ci9LUVpsL2N0ekk2?=
 =?utf-8?B?ZVBFL2t0UEtaTVNSV2lPMEpGZFVPNkVnd0tqa0RYRkozUDhwM21WZ2ZQRmJQ?=
 =?utf-8?B?bHlidGhOdHJndGVoblNKWVowQzJSa2dHdjByMkcwRkNrV3A5cmszbkYzaisr?=
 =?utf-8?Q?oYJRAWkB16HQjoUTxj4NC+zc70kGgB8rwxQIA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3U0ZjFCS2VNWEZ0bis1UmJmYVd0OG9EOEE2WFllTmI3OVZRZDI0UlZBY1g3?=
 =?utf-8?B?akNONmRvTG5SVWdzajdXZ0Z5M09oY0J1cTEybU9NRVFWZk9xWVFVTmVMMWpT?=
 =?utf-8?B?bWlWd0ExeUNtV0EyNnJKa01DMDlkdnQvampiVDhJTENZN1JmT1d2SmJiR2N4?=
 =?utf-8?B?ck1xbnI3dUlBcm82QThkS1Q1UmpySFlCZEdTZlpRY29QSjAxWWxCTGNtQXJH?=
 =?utf-8?B?NjhoNW0zYitLZ1MvNXFZL0hjd3ZpZ0ZVa0FBWUxoTVJCMlFNRXpNaXIwbEp3?=
 =?utf-8?B?a2s1WWsyNjRkd21RZ2t2Ym5KRThWaUtLOW45WG5Fc09jM21zSytYS0h1bU9a?=
 =?utf-8?B?Kzd5cU5BS1JYbHBla20vVENwUENsVnNMVDBKVmJ6SlhDYkM0d01EVUVSR3p4?=
 =?utf-8?B?ZXZIMzhoUkZYRUVEK0ZRTXhHQkdyWEFmOUllK2hlV09HL216VWVYWHpNdGxK?=
 =?utf-8?B?dXg0dDZ4VFFkenF5SDNOUHpkcE5lZ3QvaVdSWjZvL2UvZlBCUkl2L3l2Rkdl?=
 =?utf-8?B?dXlRem5qdS9Melc1cU9mRVBZblQ2aVpFbm5VTGhNTURRbTBlNjZ4b1VRMTRC?=
 =?utf-8?B?dndCS0c0K1JKdHFjZ2xDYkxtd0VSbFlaR2M3Zi9nMVY3ZlVqNTNVY1dhSU42?=
 =?utf-8?B?YzZUaGxpYjFsMklEamZFU1N0bnlwWitzQ2FaYnFyK3lUbTVKSWcrU0F3WU1Z?=
 =?utf-8?B?cjcrc09VYjlDQ0o5R3JHUGMxOXhvZXg2YkdpVk5PRklyQ2twUVdmVlJqU0pW?=
 =?utf-8?B?Z2t6ZG1kYXJiM3FGZHpPMVMrVEVYd3phQlNpTW5OUDZwd2xFNVJteTQzY28x?=
 =?utf-8?B?UkZCSzl3Q0RNb3ZJd0l2Z0dnZGNkcEZ0d3ZRRTdOYXNORlZXdWpNM3l2Qnkr?=
 =?utf-8?B?UlRBdjFlU3BWLys5L3AzZnhEMkJsWmZEQ0xObDlRNFhPZVdyenFocmNpKy9C?=
 =?utf-8?B?VW83UWZYR2dGYXd4SVUzMUVGbEJ1bVY0akdONllvdExzcFAyK0xJV0dJMGJK?=
 =?utf-8?B?dDYreUpiKytDOE5ZNTEvcWR0MlVSOHgyWnhLcEFPY1FVVnBOY1J1Ulg5dlp6?=
 =?utf-8?B?ZGQ3TVZxWmdITVJpd0lvNVpaYWNWMlY4ZXkvMDJtN2VLVDZxWlJJWlhGOTRa?=
 =?utf-8?B?a3grQnZMNUdpUzNEMlRBbUsySUQ4cEpEaS9Mdmx3QXJydnpMNWlTTzdZYzRs?=
 =?utf-8?B?V2t2eTREWWsrbWRiVWhaWi85UEFVMWVrUjJjVGdRZ29pWmdIKzFMT1hlQjA0?=
 =?utf-8?B?NmV4NVh6QzVoUkpSUW9zL0pvQlNqbjQ2djVnM2VzdHhhd1lHN1lBRksvQVVr?=
 =?utf-8?B?V0pSL3JCTWdjUDRhdG9tL0labXFIekNlbWVmTUIwbDU5WVA3aTFqcStrcjdV?=
 =?utf-8?B?SXo0eTdwTVNiSHh3ejdNQTBocnVRVGpUWUkxOFdWT0MvNGhna2FFcFFTK2VP?=
 =?utf-8?B?cm9YUUQ0TG8rYlQxWXRKWXFua1FSRVpnVER1WFZYbTNlanRobi8wcHhWQk9o?=
 =?utf-8?B?WmdXZE5RTkJYR0ZwR2VpUDNpYUMzdllONSsyczEybHByeTlqNHV1YjlyeFVr?=
 =?utf-8?B?MVVnMVFGbWsvKzNxRHlidm55Z2ZkdzBPWUJXelp1SUthMXhQbFZ1NFFzTnVz?=
 =?utf-8?B?dkNXeFFQRVFLMmpTV0s1dDZ1emVuNTBZMzc3L1RUSHhvK3ZmY0lqcEJkYWFn?=
 =?utf-8?B?T0MzWHhmRm1GV3liRnNqR1kxeXlRNnJBTmovWlNMTjVnSFd5cjI3dDM2d2Zo?=
 =?utf-8?B?ejBDa08wMFloYzZJMlZUaFowVGc0akdITnFSTnZuLytweWRqQXg3c0RTbXc3?=
 =?utf-8?B?L2tWaWtzUENVNjhBcUxGR0hKMUlWdzJ4RXdETERBRG1TUkJGRFdHMzU5bUx5?=
 =?utf-8?B?ZzM3aU9XVmkvU0x1aGNGayt5RUFJQUVMRGhTU003U2UreXZXU2czNjNiRUE0?=
 =?utf-8?B?dmp4V1I3SmxLV2NPTkRHNDNNMDlSdGhXaEszMmVSL3pFMm9DWDNOKysxNjhJ?=
 =?utf-8?B?Q29DWmlxdjhQNUpOcENFT0prZFlVT3ozcE5LZmNGZVRNbG5kMXNRY29LK3Jw?=
 =?utf-8?B?NHo1TWM0L3lnRGFiWFVxMWgzZU1hQXpMbGhGVHRGSFZ6elA5dTRZSWVhYmNL?=
 =?utf-8?B?Tk1tMng4Q29sYUdNZjhKdGJ4b0I2cFRLK1VoZGZlZFlYenVXaEY1Z3E3TzZZ?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086813c0-cff1-4940-bd13-08dca17f0541
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:56:50.3545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWiwQZpg0jl2P2EZD9qqgjK7uoSopKC2hpsjjEf4wEXhYX4emVwQ1Mx7+x79V88GP8Qyx+8QksOmLLmg+WV84Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-Proofpoint-ORIG-GUID: VUMmPNKS_9eVq8gv0Z3cHnYpOGQtYNmF
X-Proofpoint-GUID: VUMmPNKS_9eVq8gv0Z3cHnYpOGQtYNmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46B5DVwg020873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201767

From: Chen Qi <Qi.Chen@windriver.com>

The 'cgroupv2' PACKAGECONFIG is dropped as systemd now only supports
cgroupv2.

The 'kmod' PACKAGECONFIG is now added 'libkmod' as a runtime dependency.
This is because systemd 256 uses dlopen to make use of libkmod, and there=
's
no way for our library detection codes to know this and add such dependen=
cy
automatically. So we add it explicitly.

mime is now inherited because ${datadir}/mime/packages/io.systemd.xml
is a mime type file.

For musl specific patches, most are refreshed. One old patch is dropped,
and four new ones are added.
Newly added:
  build-path.c: avoid boot time segfault for musl
  adjust header inclusion order to avoid redeclaration
  undef stdin for references using stdin as a struct member
  include signal.h to avoid the 'undeclared' error
Dropped:
  src/basic/missing.h: check for missing strndupa
  (drop reason: systemd does not use strndupa any more)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...all-dependency-links-at-install-tim.patch} |  21 +-
 ...mplment-systemd-sysv-install-for-OE.patch} |   7 +-
 ...agate-sysroot-for-cross-compilation.patch} |  10 +-
 ...missing.h-check-for-missing-strndupa.patch | 696 ------------------
 ...-missing_type.h-add-comparison_fn_t.patch} |  15 +-
 ...-parse_printf_format-implementation.patch} |  25 +-
 ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  22 +-
 ...07-add-missing-FTW_-macros-for-musl.patch} |   9 +-
 ...8-Use-uintmax_t-for-handling-rlim_t.patch} |  23 +-
 ..._SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |   9 +-
 ...atible-basename-for-non-glibc-syste.patch} |  10 +-
 ...ffering-when-writing-to-oom_score_a.patch} |  11 +-
 ...ompliant-strerror_r-from-GNU-specif.patch} |   9 +-
 ...efinition-of-prctl_mm_map-structure.patch} |  13 +-
 ...not-disable-buffer-in-writing-files.patch} | 151 ++--
 ...tch =3D> 0015-Handle-__cpu_mask-usage.patch} |   9 +-
 ...atch =3D> 0016-Handle-missing-gshadow.patch} |  50 +-
 ....h-Define-MIPS-ABI-defines-for-musl.patch} |   7 +-
 ...ss-correct-parameters-to-getdents64.patch} |  11 +-
 ...tch =3D> 0019-Adjust-for-musl-headers.patch} | 165 ++---
 ...rerror-is-assumed-to-be-GNU-specifi.patch} |  13 +-
 ...til-Make-STRERROR-portable-for-musl.patch} |   9 +-
 ...ke-malloc_trim-conditional-on-glibc.patch} |  13 +-
 ...ared-Do-not-use-malloc_info-on-musl.patch} |  11 +-
 ...4-avoid-missing-LOCK_EX-declaration.patch} |  24 +-
 ...gnal.h-to-avoid-the-undeclared-error.patch |  27 +
 ...references-using-stdin-as-a-struct-m.patch |  48 ++
 ...clusion-order-to-avoid-redeclaration.patch |  76 ++
 ....c-avoid-boot-time-segfault-for-musl.patch |  31 +
 .../{systemd_255.6.bb =3D> systemd_256.bb}      |  62 +-
 31 files changed, 564 insertions(+), 1027 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0002-binfmt-Don-t-install-depe=
ndency-links-at-install-tim.patch =3D> 0001-binfmt-Don-t-install-dependen=
cy-links-at-install-tim.patch} (85%)
 rename meta/recipes-core/systemd/systemd/{0008-implment-systemd-sysv-ins=
tall-for-OE.patch =3D> 0002-implment-systemd-sysv-install-for-OE.patch} (=
91%)
 rename meta/recipes-core/systemd/systemd/{0023-meson-bpf-propagate-sysro=
ot-for-cross-compilation.patch =3D> 0003-meson-bpf-propagate-sysroot-for-=
cross-compilation.patch} (78%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-src-basic-miss=
ing.h-check-for-missing-strndupa.patch
 rename meta/recipes-core/systemd/systemd/{0001-missing_type.h-add-compar=
ison_fn_t.patch =3D> 0004-missing_type.h-add-comparison_fn_t.patch} (87%)
 rename meta/recipes-core/systemd/systemd/{0002-add-fallback-parse_printf=
_format-implementation.patch =3D> 0005-add-fallback-parse_printf_format-i=
mplementation.patch} (96%)
 rename meta/recipes-core/systemd/systemd/{0004-don-t-fail-if-GLOB_BRACE-=
and-GLOB_ALTDIRFUNC-is-not-.patch =3D> 0006-don-t-fail-if-GLOB_BRACE-and-=
GLOB_ALTDIRFUNC-is-not-.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0005-add-missing-FTW_-macros-f=
or-musl.patch =3D> 0007-add-missing-FTW_-macros-for-musl.patch} (85%)
 rename meta/recipes-core/systemd/systemd/{0006-Use-uintmax_t-for-handlin=
g-rlim_t.patch =3D> 0008-Use-uintmax_t-for-handling-rlim_t.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0007-don-t-pass-AT_SYMLINK_NOF=
OLLOW-flag-to-faccessat.patch =3D> 0009-don-t-pass-AT_SYMLINK_NOFOLLOW-fl=
ag-to-faccessat.patch} (96%)
 rename meta/recipes-core/systemd/systemd/{0008-Define-glibc-compatible-b=
asename-for-non-glibc-syste.patch =3D> 0010-Define-glibc-compatible-basen=
ame-for-non-glibc-syste.patch} (82%)
 rename meta/recipes-core/systemd/systemd/{0009-Do-not-disable-buffering-=
when-writing-to-oom_score_a.patch =3D> 0011-Do-not-disable-buffering-when=
-writing-to-oom_score_a.patch} (82%)
 rename meta/recipes-core/systemd/systemd/{0010-distinguish-XSI-compliant=
-strerror_r-from-GNU-specif.patch =3D> 0012-distinguish-XSI-compliant-str=
error_r-from-GNU-specif.patch} (92%)
 rename meta/recipes-core/systemd/systemd/{0011-avoid-redefinition-of-prc=
tl_mm_map-structure.patch =3D> 0013-avoid-redefinition-of-prctl_mm_map-st=
ructure.patch} (71%)
 rename meta/recipes-core/systemd/systemd/{0012-do-not-disable-buffer-in-=
writing-files.patch =3D> 0014-do-not-disable-buffer-in-writing-files.patc=
h} (84%)
 rename meta/recipes-core/systemd/systemd/{0013-Handle-__cpu_mask-usage.p=
atch =3D> 0015-Handle-__cpu_mask-usage.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0014-Handle-missing-gshadow.pa=
tch =3D> 0016-Handle-missing-gshadow.patch} (80%)
 rename meta/recipes-core/systemd/systemd/{0015-missing_syscall.h-Define-=
MIPS-ABI-defines-for-musl.patch =3D> 0017-missing_syscall.h-Define-MIPS-A=
BI-defines-for-musl.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0016-pass-correct-parameters-t=
o-getdents64.patch =3D> 0018-pass-correct-parameters-to-getdents64.patch}=
 (88%)
 rename meta/recipes-core/systemd/systemd/{0017-Adjust-for-musl-headers.p=
atch =3D> 0019-Adjust-for-musl-headers.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0018-test-bus-error-strerror-i=
s-assumed-to-be-GNU-specifi.patch =3D> 0020-test-bus-error-strerror-is-as=
sumed-to-be-GNU-specifi.patch} (87%)
 rename meta/recipes-core/systemd/systemd/{0019-errno-util-Make-STRERROR-=
portable-for-musl.patch =3D> 0021-errno-util-Make-STRERROR-portable-for-m=
usl.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0020-sd-event-Make-malloc_trim=
-conditional-on-glibc.patch =3D> 0022-sd-event-Make-malloc_trim-condition=
al-on-glibc.patch} (76%)
 rename meta/recipes-core/systemd/systemd/{0021-shared-Do-not-use-malloc_=
info-on-musl.patch =3D> 0023-shared-Do-not-use-malloc_info-on-musl.patch}=
 (86%)
 rename meta/recipes-core/systemd/systemd/{0022-avoid-missing-LOCK_EX-dec=
laration.patch =3D> 0024-avoid-missing-LOCK_EX-declaration.patch} (62%)
 create mode 100644 meta/recipes-core/systemd/systemd/0025-include-signal=
.h-to-avoid-the-undeclared-error.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-undef-stdin-fo=
r-references-using-stdin-as-a-struct-m.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0027-adjust-header-=
inclusion-order-to-avoid-redeclaration.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0028-build-path.c-a=
void-boot-time-segfault-for-musl.patch
 rename meta/recipes-core/systemd/{systemd_255.6.bb =3D> systemd_256.bb} =
(95%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index 8bda47dd38..6906ff969b 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
=20
-SRCREV =3D "5810c25792d4268282dd3892af1a253b690423c9"
-SRCBRANCH =3D "v255-stable"
+SRCREV =3D "5c79cdec10a547a866764a66e1e14898112a00cd"
+SRCBRANCH =3D "main"
 SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd=
/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
similarity index 85%
rename from meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-d=
ependency-links-at-install-tim.patch
rename to meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dep=
endency-links-at-install-tim.patch
index 4c73c924ef..4ffcb2ed46 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From 661a34c3de30d4ff4a2a62c9a0573c6ce55424e4 Mon Sep 17 00:00:00 2001
+From ca94c86736ca7917e6c50d09d6c6ba56ba139709 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH] binfmt: Don't install dependency links at install time =
for
- the binfmt services
+Subject: [PATCH 01/27] binfmt: Don't install dependency links at install=
 time
+ for the binfmt services
=20
 use [Install] blocks so that they get created when the service is enable=
d
 like a traditional service.
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index e7bfb7f838..1d5ec4b178 100644
+index b231341a1f..b613a188a4 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -154,7 +154,6 @@ units =3D [
+@@ -156,7 +156,6 @@ units =3D [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index e7bfb7f838..1d5ec4b178 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -251,7 +250,6 @@ units =3D [
+@@ -258,7 +257,6 @@ units =3D [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
@@ -45,7 +45,7 @@ index e7bfb7f838..1d5ec4b178 100644
          {
            'file' : 'systemd-bless-boot.service.in',
 diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs=
-binfmt_misc.automount
-index 5d212015a5..6c2900ca77 100644
+index 7ec21e76c9..fee4d1345f 100644
 --- a/units/proc-sys-fs-binfmt_misc.automount
 +++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -22,3 +22,6 @@ Before=3Dshutdown.target
@@ -56,11 +56,11 @@ index 5d212015a5..6c2900ca77 100644
 +[Install]
 +WantedBy=3Dsysinit.target
 diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.serv=
ice.in
-index 6861c76674..531e9fbd90 100644
+index 318bf8efc2..6ef684861d 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=3Dhttps://docs.kernel.org/admin-guide/bi=
nfmt-misc.html
- Documentation=3Dhttps://www.freedesktop.org/wiki/Software/systemd/APIFi=
leSystems
+ Documentation=3Dhttps://systemd.io/API_FILE_SYSTEMS
  DefaultDependencies=3Dno
  Conflicts=3Dshutdown.target
 +Wants=3Dproc-sys-fs-binfmt_misc.automount
@@ -74,3 +74,6 @@ index 6861c76674..531e9fbd90 100644
 +
 +[Install]
 +WantedBy=3Dsysinit.target
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv=
-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0002-implment-s=
ystemd-sysv-install-for-OE.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-=
install-for-OE.patch
rename to meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-in=
stall-for-OE.patch
index 8b833ce073..36cc5678c0 100644
--- a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-instal=
l-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-instal=
l-for-OE.patch
@@ -1,7 +1,7 @@
-From 5f89867f2b15f9bd411564d04e660cdeedd370ca Mon Sep 17 00:00:00 2001
+From 40ae40de3db990a7e56694f24fc625b1b71a98f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH] implment systemd-sysv-install for OE
+Subject: [PATCH 02/27] implment systemd-sysv-install for OE
=20
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -38,3 +38,6 @@ index cb58d8243b..000bdf6165 100755
          ;;
      *)
          usage ;;
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0023-meson-bpf-propagate-s=
ysroot-for-cross-compilation.patch b/meta/recipes-core/systemd/systemd/00=
03-meson-bpf-propagate-sysroot-for-cross-compilation.patch
similarity index 78%
rename from meta/recipes-core/systemd/systemd/0023-meson-bpf-propagate-sy=
sroot-for-cross-compilation.patch
rename to meta/recipes-core/systemd/systemd/0003-meson-bpf-propagate-sysr=
oot-for-cross-compilation.patch
index 5be4a27b36..08b70bf66d 100644
--- a/meta/recipes-core/systemd/systemd/0023-meson-bpf-propagate-sysroot-=
for-cross-compilation.patch
+++ b/meta/recipes-core/systemd/systemd/0003-meson-bpf-propagate-sysroot-=
for-cross-compilation.patch
@@ -1,7 +1,7 @@
-From 7463b382bcaf26aacc60b73f98f0262aa41db3ee Mon Sep 17 00:00:00 2001
+From bbceb4b339231124a0b004531b4b6838539432e6 Mon Sep 17 00:00:00 2001
 From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
 Date: Thu, 20 Jun 2024 12:32:18 +0200
-Subject: [PATCH] meson: bpf: propagate 'sysroot' for cross compilation
+Subject: [PATCH 03/27] meson: bpf: propagate 'sysroot' for cross compila=
tion
=20
 During cross-compilation of systemd, the compiler used to build the bpf'=
s needs
 to be pointed at the correct include searchpath. Which can be done by pa=
ssing
@@ -15,10 +15,10 @@ Signed-off-by: Johannes Schneider <johannes.schneider=
@leica-geosystems.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/meson.build b/meson.build
-index 187e7b216d..15df058ab6 100644
+index ea4e12aa1c..52723bef09 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1691,6 +1691,7 @@ if conf.get('BPF_FRAMEWORK') =3D=3D 1
+@@ -1739,6 +1739,7 @@ if conf.get('BPF_FRAMEWORK') =3D=3D 1
                  '-ffile-prefix-map=3D',
                  '-fdebug-prefix-map=3D',
                  '-fmacro-prefix-map=3D',
@@ -27,5 +27,5 @@ index 187e7b216d..15df058ab6 100644
 =20
          foreach opt : c_args
 --=20
-2.34.1
+2.45.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-c=
heck-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-=
src-basic-missing.h-check-for-missing-strndupa.patch
deleted file mode 100644
index f09f2114d3..0000000000
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
+++ /dev/null
@@ -1,696 +0,0 @@
-From 843c6c94bf6a29eaceeefafa420cd86a32e844d2 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH] src/basic/missing.h: check for missing strndupa
-
-include missing.h  for definition of strndupa
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Rebased for v242]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-[rebased for systemd 244]
-[Rebased for v247]
-Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-[Rebased for v254]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Rebased for v255.1]
----
- meson.build                                |  1 +
- src/backlight/backlight.c                  |  1 +
- src/basic/cgroup-util.c                    |  1 +
- src/basic/env-util.c                       |  1 +
- src/basic/log.c                            |  1 +
- src/basic/missing_stdlib.h                 | 12 ++++++++++++
- src/basic/mkdir.c                          |  1 +
- src/basic/mountpoint-util.c                |  1 +
- src/basic/parse-util.c                     |  1 +
- src/basic/path-lookup.c                    |  1 +
- src/basic/percent-util.c                   |  1 +
- src/basic/proc-cmdline.c                   |  1 +
- src/basic/procfs-util.c                    |  1 +
- src/basic/time-util.c                      |  1 +
- src/boot/bless-boot.c                      |  1 +
- src/core/dbus-cgroup.c                     |  1 +
- src/core/dbus-execute.c                    |  1 +
- src/core/dbus-util.c                       |  1 +
- src/core/execute.c                         |  1 +
- src/core/kmod-setup.c                      |  1 +
- src/core/service.c                         |  1 +
- src/coredump/coredump-vacuum.c             |  1 +
- src/fstab-generator/fstab-generator.c      |  1 +
- src/journal-remote/journal-remote-main.c   |  1 +
- src/journal/journalctl.c                   |  1 +
- src/libsystemd/sd-bus/bus-message.c        |  1 +
- src/libsystemd/sd-bus/bus-objects.c        |  1 +
- src/libsystemd/sd-bus/bus-socket.c         |  1 +
- src/libsystemd/sd-bus/sd-bus.c             |  1 +
- src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
- src/libsystemd/sd-journal/sd-journal.c     |  1 +
- src/login/pam_systemd.c                    |  1 +
- src/network/generator/network-generator.c  |  1 +
- src/nspawn/nspawn-settings.c               |  1 +
- src/nss-mymachines/nss-mymachines.c        |  1 +
- src/portable/portable.c                    |  1 +
- src/resolve/resolvectl.c                   |  1 +
- src/shared/bus-get-properties.c            |  1 +
- src/shared/bus-unit-procs.c                |  1 +
- src/shared/bus-unit-util.c                 |  1 +
- src/shared/bus-util.c                      |  1 +
- src/shared/dns-domain.c                    |  1 +
- src/shared/journal-importer.c              |  1 +
- src/shared/logs-show.c                     |  1 +
- src/shared/pager.c                         |  1 +
- src/socket-proxy/socket-proxyd.c           |  1 +
- src/test/test-hexdecoct.c                  |  1 +
- src/udev/udev-builtin-net_id.c             |  1 +
- src/udev/udev-builtin-path_id.c            |  1 +
- src/udev/udev-event.c                      |  1 +
- src/udev/udev-rules.c                      |  1 +
- 51 files changed, 62 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index c4694a9ddc..d376b76afa 100644
---- a/meson.build
-+++ b/meson.build
-@@ -569,6 +569,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
- endforeach
-=20
- foreach ident : [
-+        ['strndupa' ,         '''#include <string.h>'''],
-         ['memfd_create',      '''#include <sys/mman.h>'''],
-         ['gettid',            '''#include <sys/types.h>
-                                  #include <unistd.h>'''],
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index b2032adaa5..ee9201826d 100644
---- a/src/backlight/backlight.c
-+++ b/src/backlight/backlight.c
-@@ -20,6 +20,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "terminal-util.h"
-+#include "missing_stdlib.h"
-=20
- #define PCI_CLASS_GRAPHICS_CARD 0x30000
-=20
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 18b16ecc0e..d2be79622f 100644
---- a/src/basic/cgroup-util.c
-+++ b/src/basic/cgroup-util.c
-@@ -38,6 +38,7 @@
- #include "unit-name.h"
- #include "user-util.h"
- #include "xattr-util.h"
-+#include "missing_stdlib.h"
-=20
- static int cg_enumerate_items(const char *controller, const char *path,=
 FILE **ret, const char *item) {
-         _cleanup_free_ char *fs =3D NULL;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index a97651d7af..09fa601250 100644
---- a/src/basic/env-util.c
-+++ b/src/basic/env-util.c
-@@ -19,6 +19,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- /* We follow bash for the character set. Different shells have differen=
t rules. */
- #define VALID_BASH_ENV_NAME_CHARS               \
-diff --git a/src/basic/log.c b/src/basic/log.c
-index 7a443005f6..eed69a48ee 100644
---- a/src/basic/log.c
-+++ b/src/basic/log.c
-@@ -40,6 +40,7 @@
- #include "terminal-util.h"
- #include "time-util.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- #define SNDBUF_SIZE (8*1024*1024)
- #define IOVEC_MAX 256U
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 8c76f93eb2..9068bfb4f0 100644
---- a/src/basic/missing_stdlib.h
-+++ b/src/basic/missing_stdlib.h
-@@ -11,3 +11,15 @@
- #    error "neither secure_getenv nor __secure_getenv are available"
- #  endif
- #endif
-+
-+/* string.h */
-+#if ! HAVE_STRNDUPA
-+#define strndupa(s, n) \
-+  ({ \
-+    const char *__old =3D (s); \
-+    size_t __len =3D strnlen(__old, (n)); \
-+    char *__new =3D (char *)alloca(__len + 1); \
-+    __new[__len] =3D '\0'; \
-+    (char *)memcpy(__new, __old, __len); \
-+  })
-+#endif
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index c770e5ed32..1fd8816cd0 100644
---- a/src/basic/mkdir.c
-+++ b/src/basic/mkdir.c
-@@ -16,6 +16,7 @@
- #include "stat-util.h"
- #include "stdio-util.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- int mkdirat_safe_internal(
-                 int dir_fd,
-diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index bf67f7e01a..409f8d8a73 100644
---- a/src/basic/mountpoint-util.c
-+++ b/src/basic/mountpoint-util.c
-@@ -18,6 +18,7 @@
- #include "missing_stat.h"
- #include "missing_syscall.h"
- #include "mkdir.h"
-+#include "missing_stdlib.h"
- #include "mountpoint-util.h"
- #include "nulstr-util.h"
- #include "parse-util.h"
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 0430e33e40..f3728de026 100644
---- a/src/basic/parse-util.c
-+++ b/src/basic/parse-util.c
-@@ -18,6 +18,7 @@
- #include "stat-util.h"
- #include "string-util.h"
- #include "strv.h"
-+#include "missing_stdlib.h"
-=20
- int parse_boolean(const char *v) {
-         if (!v)
-diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index 4e3d59fc56..726e240df0 100644
---- a/src/basic/path-lookup.c
-+++ b/src/basic/path-lookup.c
-@@ -16,6 +16,7 @@
- #include "strv.h"
- #include "tmpfile-util.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- int xdg_user_runtime_dir(char **ret, const char *suffix) {
-         const char *e;
-diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
-index cab9d0eaea..5f6ca258e9 100644
---- a/src/basic/percent-util.c
-+++ b/src/basic/percent-util.c
-@@ -3,6 +3,7 @@
- #include "percent-util.h"
- #include "string-util.h"
- #include "parse-util.h"
-+#include "missing_stdlib.h"
-=20
- static int parse_parts_value_whole(const char *p, const char *symbol) {
-         const char *pc, *n;
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 522d8de1f4..7c129dc0fc 100644
---- a/src/basic/proc-cmdline.c
-+++ b/src/basic/proc-cmdline.c
-@@ -16,6 +16,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "virt.h"
-+#include "missing_stdlib.h"
-=20
- int proc_cmdline_filter_pid1_args(char **argv, char ***ret) {
-         enum {
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index d7cfcd9105..6cb0ddf575 100644
---- a/src/basic/procfs-util.c
-+++ b/src/basic/procfs-util.c
-@@ -12,6 +12,7 @@
- #include "procfs-util.h"
- #include "stdio-util.h"
- #include "string-util.h"
-+#include "missing_stdlib.h"
-=20
- int procfs_get_pid_max(uint64_t *ret) {
-         _cleanup_free_ char *value =3D NULL;
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index f9014dc560..1d7840a5b5 100644
---- a/src/basic/time-util.c
-+++ b/src/basic/time-util.c
-@@ -27,6 +27,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "time-util.h"
-+#include "missing_stdlib.h"
-=20
- static clockid_t map_clock_id(clockid_t c) {
-=20
-diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 12dfdf76fa..e66332519a 100644
---- a/src/boot/bless-boot.c
-+++ b/src/boot/bless-boot.c
-@@ -22,6 +22,7 @@
- #include "terminal-util.h"
- #include "verbs.h"
- #include "virt.h"
-+#include "missing_stdlib.h"
-=20
- static char **arg_path =3D NULL;
-=20
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 8a9570fd21..ac4202e5ce 100644
---- a/src/core/dbus-cgroup.c
-+++ b/src/core/dbus-cgroup.c
-@@ -25,6 +25,7 @@
- #include "parse-util.h"
- #include "path-util.h"
- #include "percent-util.h"
-+#include "missing_stdlib.h"
- #include "socket-util.h"
-=20
- BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", CGroupTasksMax=
, cgroup_tasks_max_resolve);
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 2d05ba7e1d..61a7de0037 100644
---- a/src/core/dbus-execute.c
-+++ b/src/core/dbus-execute.c
-@@ -42,6 +42,7 @@
- #include "unit-printf.h"
- #include "user-util.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output,=
 ExecOutput);
- static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input=
, ExecInput);
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index 7bb026af48..a86128e40c 100644
---- a/src/core/dbus-util.c
-+++ b/src/core/dbus-util.c
-@@ -10,6 +10,7 @@
- #include "unit-printf.h"
- #include "user-util.h"
- #include "unit.h"
-+#include "missing_stdlib.h"
-=20
- int bus_property_get_triggered_unit(
-                 sd_bus *bus,
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 8dbdfcf369..531bec4c92 100644
---- a/src/core/execute.c
-+++ b/src/core/execute.c
-@@ -72,6 +72,7 @@
- #include "unit-serialize.h"
- #include "user-util.h"
- #include "utmp-wtmp.h"
-+#include "missing_stdlib.h"
-=20
- static bool is_terminal_input(ExecInput i) {
-         return IN_SET(i,
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index b8e3f7aadd..8ce8ca68d8 100644
---- a/src/core/kmod-setup.c
-+++ b/src/core/kmod-setup.c
-@@ -13,6 +13,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "virt.h"
-+#include "missing_stdlib.h"
-=20
- #if HAVE_KMOD
- #include "module-util.h"
-diff --git a/src/core/service.c b/src/core/service.c
-index 42fffbbd67..80a8d05a19 100644
---- a/src/core/service.c
-+++ b/src/core/service.c
-@@ -45,6 +45,7 @@
- #include "unit-name.h"
- #include "unit.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__=
)
-=20
-diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacu=
um.c
-index 7e0c98cb7d..978a7f5874 100644
---- a/src/coredump/coredump-vacuum.c
-+++ b/src/coredump/coredump-vacuum.c
-@@ -17,6 +17,7 @@
- #include "string-util.h"
- #include "time-util.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)        =
   /* 1 MiB */
- #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)=
   /* 4 GiB */
-diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator=
/fstab-generator.c
-index 016f3baa7f..b1def81313 100644
---- a/src/fstab-generator/fstab-generator.c
-+++ b/src/fstab-generator/fstab-generator.c
-@@ -37,6 +37,7 @@
- #include "unit-name.h"
- #include "virt.h"
- #include "volatile-util.h"
-+#include "missing_stdlib.h"
-=20
- typedef enum MountPointFlags {
-         MOUNT_NOAUTO    =3D 1 << 0,
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remo=
te/journal-remote-main.c
-index 2d380bc7a7..d3f5612728 100644
---- a/src/journal-remote/journal-remote-main.c
-+++ b/src/journal-remote/journal-remote-main.c
-@@ -27,6 +27,7 @@
- #include "stat-util.h"
- #include "string-table.h"
- #include "strv.h"
-+#include "missing_stdlib.h"
-=20
- #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
- #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 87e2f28841..58275f41f1 100644
---- a/src/journal/journalctl.c
-+++ b/src/journal/journalctl.c
-@@ -77,6 +77,7 @@
- #include "unit-name.h"
- #include "user-util.h"
- #include "varlink.h"
-+#include "missing_stdlib.h"
-=20
- #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
- #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages process=
ed */
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus=
/bus-message.c
-index ab8b06896d..43f9131205 100644
---- a/src/libsystemd/sd-bus/bus-message.c
-+++ b/src/libsystemd/sd-bus/bus-message.c
-@@ -19,6 +19,7 @@
- #include "strv.h"
- #include "time-util.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- static int message_append_basic(sd_bus_message *m, char type, const voi=
d *p, const void **stored);
- static int message_parse_fields(sd_bus_message *m);
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus=
/bus-objects.c
-index c25c40ff37..57a5da704f 100644
---- a/src/libsystemd/sd-bus/bus-objects.c
-+++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -11,6 +11,7 @@
- #include "missing_capability.h"
- #include "string-util.h"
- #include "strv.h"
-+#include "missing_stdlib.h"
-=20
- static int node_vtable_get_userdata(
-                 sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/=
bus-socket.c
-index 5ade8e99aa..7553cf319d 100644
---- a/src/libsystemd/sd-bus/bus-socket.c
-+++ b/src/libsystemd/sd-bus/bus-socket.c
-@@ -29,6 +29,7 @@
- #include "string-util.h"
- #include "user-util.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- #define SNDBUF_SIZE (8*1024*1024)
-=20
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-b=
us.c
-index 8befc97460..6ee4d4f595 100644
---- a/src/libsystemd/sd-bus/sd-bus.c
-+++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -46,6 +46,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- #define log_debug_bus_message(m)                                       =
  \
-         do {                                                           =
  \
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd=
/sd-bus/test-bus-benchmark.c
-index d988588de0..458df8df9a 100644
---- a/src/libsystemd/sd-bus/test-bus-benchmark.c
-+++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
-@@ -14,6 +14,7 @@
- #include "string-util.h"
- #include "tests.h"
- #include "time-util.h"
-+#include "missing_stdlib.h"
-=20
- #define MAX_SIZE (2*1024*1024)
-=20
-diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-=
journal/sd-journal.c
-index 7a1dd2569f..d187baad47 100644
---- a/src/libsystemd/sd-journal/sd-journal.c
-+++ b/src/libsystemd/sd-journal/sd-journal.c
-@@ -44,6 +44,7 @@
- #include "strv.h"
- #include "syslog-util.h"
- #include "uid-alloc-range.h"
-+#include "missing_stdlib.h"
-=20
- #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
-=20
-diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index bf45974ca5..2cb7e930c0 100644
---- a/src/login/pam_systemd.c
-+++ b/src/login/pam_systemd.c
-@@ -35,6 +35,7 @@
- #include "login-util.h"
- #include "macro.h"
- #include "missing_syscall.h"
-+#include "missing_stdlib.h"
- #include "pam-util.h"
- #include "parse-util.h"
- #include "path-util.h"
-diff --git a/src/network/generator/network-generator.c b/src/network/gen=
erator/network-generator.c
-index 48527a2c73..9777fe0561 100644
---- a/src/network/generator/network-generator.c
-+++ b/src/network/generator/network-generator.c
-@@ -14,6 +14,7 @@
- #include "string-table.h"
- #include "string-util.h"
- #include "strv.h"
-+#include "missing_stdlib.h"
-=20
- /*
-   # .network
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 161b1c1c70..ba1c459f78 100644
---- a/src/nspawn/nspawn-settings.c
-+++ b/src/nspawn/nspawn-settings.c
-@@ -16,6 +16,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- Settings *settings_new(void) {
-         Settings *s;
-diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/ns=
s-mymachines.c
-index c64e79bdff..eda26b0b9a 100644
---- a/src/nss-mymachines/nss-mymachines.c
-+++ b/src/nss-mymachines/nss-mymachines.c
-@@ -21,6 +21,7 @@
- #include "nss-util.h"
- #include "signal-util.h"
- #include "string-util.h"
-+#include "missing_stdlib.h"
-=20
- static void setup_logging_once(void) {
-         static pthread_once_t once =3D PTHREAD_ONCE_INIT;
-diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 3b2a37912f..835a3fdeaa 100644
---- a/src/portable/portable.c
-+++ b/src/portable/portable.c
-@@ -42,6 +42,7 @@
- #include "strv.h"
- #include "tmpfile-util.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- /* Markers used in the first line of our 20-portable.conf unit file dro=
p-in to determine, that a) the unit file was
-  * dropped there by the portable service logic and b) for which image i=
t was dropped there. */
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index afa537f160..32ccee4ae5 100644
---- a/src/resolve/resolvectl.c
-+++ b/src/resolve/resolvectl.c
-@@ -48,6 +48,7 @@
- #include "varlink.h"
- #include "verb-log-control.h"
- #include "verbs.h"
-+#include "missing_stdlib.h"
-=20
- static int arg_family =3D AF_UNSPEC;
- static int arg_ifindex =3D 0;
-diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-proper=
ties.c
-index 53e5d6b99f..851ecd5644 100644
---- a/src/shared/bus-get-properties.c
-+++ b/src/shared/bus-get-properties.c
-@@ -4,6 +4,7 @@
- #include "rlimit-util.h"
- #include "stdio-util.h"
- #include "string-util.h"
-+#include "missing_stdlib.h"
-=20
- int bus_property_get_bool(
-                 sd_bus *bus,
-diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index 8b462b5627..183ce1c18e 100644
---- a/src/shared/bus-unit-procs.c
-+++ b/src/shared/bus-unit-procs.c
-@@ -11,6 +11,7 @@
- #include "sort-util.h"
- #include "string-util.h"
- #include "terminal-util.h"
-+#include "missing_stdlib.h"
-=20
- struct CGroupInfo {
-         char *cgroup_path;
-diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 50de98941f..d47beccb0b 100644
---- a/src/shared/bus-unit-util.c
-+++ b/src/shared/bus-unit-util.c
-@@ -50,6 +50,7 @@
- #include "unit-def.h"
- #include "user-util.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
-         assert(message);
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 4123152d93..74f148c8b4 100644
---- a/src/shared/bus-util.c
-+++ b/src/shared/bus-util.c
-@@ -24,6 +24,7 @@
- #include "path-util.h"
- #include "socket-util.h"
- #include "stdio-util.h"
-+#include "missing_stdlib.h"
-=20
- static int name_owner_change_callback(sd_bus_message *m, void *userdata=
, sd_bus_error *ret_error) {
-         sd_event *e =3D ASSERT_PTR(userdata);
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index b41c9b06ca..e69050a507 100644
---- a/src/shared/dns-domain.c
-+++ b/src/shared/dns-domain.c
-@@ -18,6 +18,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "utf8.h"
-+#include "missing_stdlib.h"
-=20
- int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLab=
elFlags flags) {
-         const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer=
.c
-index 83e9834bbf..74eaae6f5e 100644
---- a/src/shared/journal-importer.c
-+++ b/src/shared/journal-importer.c
-@@ -16,6 +16,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "unaligned.h"
-+#include "missing_stdlib.h"
-=20
- enum {
-         IMPORTER_STATE_LINE =3D 0,    /* waiting to read, or reading li=
ne */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index 0a31be382f..92d629e7e0 100644
---- a/src/shared/logs-show.c
-+++ b/src/shared/logs-show.c
-@@ -41,6 +41,7 @@
- #include "time-util.h"
- #include "utf8.h"
- #include "web-util.h"
-+#include "missing_stdlib.h"
-=20
- /* up to three lines (each up to 100 characters) or 300 characters, whi=
chever is less */
- #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 19deefab56..6b6d0af1a0 100644
---- a/src/shared/pager.c
-+++ b/src/shared/pager.c
-@@ -25,6 +25,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "terminal-util.h"
-+#include "missing_stdlib.h"
-=20
- static pid_t pager_pid =3D 0;
-=20
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-=
proxyd.c
-index 287fd6c181..8f8d5493da 100644
---- a/src/socket-proxy/socket-proxyd.c
-+++ b/src/socket-proxy/socket-proxyd.c
-@@ -27,6 +27,7 @@
- #include "set.h"
- #include "socket-util.h"
- #include "string-util.h"
-+#include "missing_stdlib.h"
-=20
- #define BUFFER_SIZE (256 * 1024)
-=20
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index f884008660..987e180697 100644
---- a/src/test/test-hexdecoct.c
-+++ b/src/test/test-hexdecoct.c
-@@ -7,6 +7,7 @@
- #include "macro.h"
- #include "random-util.h"
- #include "string-util.h"
-+#include "missing_stdlib.h"
- #include "tests.h"
-=20
- TEST(hexchar) {
-diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
-index 91b40088f4..f528a46b8e 100644
---- a/src/udev/udev-builtin-net_id.c
-+++ b/src/udev/udev-builtin-net_id.c
-@@ -39,6 +39,7 @@
- #include "strv.h"
- #include "strxcpyx.h"
- #include "udev-builtin.h"
-+#include "missing_stdlib.h"
-=20
- #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)
- #define ONBOARD_16BIT_INDEX_MAX ((1U << 16) - 1)
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-pat=
h_id.c
-index 467c9a6ad3..f74dae60af 100644
---- a/src/udev/udev-builtin-path_id.c
-+++ b/src/udev/udev-builtin-path_id.c
-@@ -24,6 +24,7 @@
- #include "sysexits.h"
- #include "udev-builtin.h"
- #include "udev-util.h"
-+#include "missing_stdlib.h"
-=20
- _printf_(2,3)
- static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index ed22c8b679..19ebe20237 100644
---- a/src/udev/udev-event.c
-+++ b/src/udev/udev-event.c
-@@ -16,6 +16,7 @@
- #include "udev-util.h"
- #include "udev-watch.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
-=20
- UdevEvent *udev_event_new(sd_device *dev, usec_t exec_delay_usec, sd_ne=
tlink *rtnl, int log_level) {
-         UdevEvent *event;
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index c242549654..e5b8df5c2d 100644
---- a/src/udev/udev-rules.c
-+++ b/src/udev/udev-rules.c
-@@ -41,6 +41,7 @@
- #include "udev-util.h"
- #include "user-util.h"
- #include "virt.h"
-+#include "missing_stdlib.h"
-=20
- #define RULES_DIRS ((const char* const*) CONF_PATHS_STRV("udev/rules.d"=
))
-=20
diff --git a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-co=
mparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0004-missing_type=
.h-add-comparison_fn_t.patch
similarity index 87%
rename from meta/recipes-core/systemd/systemd/0001-missing_type.h-add-com=
parison_fn_t.patch
rename to meta/recipes-core/systemd/systemd/0004-missing_type.h-add-compa=
rison_fn_t.patch
index 49871d16a8..f4456f3c15 100644
--- a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-compariso=
n_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0004-missing_type.h-add-compariso=
n_fn_t.patch
@@ -1,7 +1,7 @@
-From d4b0bb9c7651017985fdd75469f37c34ce2f2c50 Mon Sep 17 00:00:00 2001
+From 34b7e1ed3b9a896db6fad435fd141c385c7337d1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH] missing_type.h: add comparison_fn_t
+Subject: [PATCH 04/27] missing_type.h: add comparison_fn_t
=20
 Make it work with musl where comparison_fn_t and is not provided.
=20
@@ -21,12 +21,12 @@ Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel=
.com>
  3 files changed, 6 insertions(+)
=20
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index f6233090a9..6c0456349d 100644
+index 1d17705c35..fc33b76ec1 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -10,3 +10,7 @@
  #if !HAVE_CHAR16_T
- #define char16_t uint16_t
+ #  define char16_t uint16_t
  #endif
 +
 +#ifndef __GLIBC__
@@ -45,10 +45,10 @@ index 9c818bd747..ef10c8be2c 100644
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exp=
orts a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __c=
ompar_d_fn_t. Let's hence do that
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-jou=
rnal/catalog.c
-index ae91534198..7f67eea38b 100644
+index a0b673f65f..29dd2fee16 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
-@@ -28,6 +28,7 @@
+@@ -29,6 +29,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "tmpfile-util.h"
@@ -56,3 +56,6 @@ index ae91534198..7f67eea38b 100644
 =20
  const char * const catalog_file_dirs[] =3D {
          "/usr/local/lib/systemd/catalog/",
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0005=
-add-fallback-parse_printf_format-implementation.patch
similarity index 96%
rename from meta/recipes-core/systemd/systemd/0002-add-fallback-parse_pri=
ntf_format-implementation.patch
rename to meta/recipes-core/systemd/systemd/0005-add-fallback-parse_print=
f_format-implementation.patch
index 593d6261e1..b0865b32af 100644
--- a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_fo=
rmat-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-fallback-parse_printf_fo=
rmat-implementation.patch
@@ -1,7 +1,7 @@
-From 776913624aaf696a3b2920b8d7506b3aae042bf1 Mon Sep 17 00:00:00 2001
+From 4a4005583e2debe491850229aa5ae2a97770532d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH] add fallback parse_printf_format implementation
+Subject: [PATCH 05/27] add fallback parse_printf_format implementation
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -22,22 +22,22 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  create mode 100644 src/basic/parse-printf-format.h
=20
 diff --git a/meson.build b/meson.build
-index 187e7b216d..c4694a9ddc 100644
+index 52723bef09..e20bf3af8a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -727,6 +727,7 @@ endif
- foreach header : ['crypt.h',
+@@ -753,6 +753,7 @@ foreach header : ['crypt.h',
                    'linux/memfd.h',
+                   'linux/time_types.h',
                    'linux/vm_sockets.h',
 +                  'printf.h',
                    'sys/auxv.h',
+                   'sys/sdt.h',
                    'threads.h',
-                   'valgrind/memcheck.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 111253e3a5..bdaa2fc5e4 100644
+index 9a214575a5..b49b6ade56 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -183,6 +183,11 @@ endforeach
+@@ -189,6 +189,11 @@ endforeach
 =20
  basic_sources +=3D generated_gperf_headers
 =20
@@ -392,7 +392,7 @@ index 0000000000..47be7522d7
 +
 +#endif /* HAVE_PRINTF_H */
 diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index 4e93ac90c9..f9deb6f662 100644
+index 0a2239d022..43a765dacd 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,12 +1,12 @@
@@ -408,9 +408,9 @@ index 4e93ac90c9..f9deb6f662 100644
 +#include "parse-printf-format.h"
 =20
  _printf_(3, 4)
- static inline char *snprintf_ok(char *buf, size_t len, const char *form=
at, ...) {
+ static inline char* snprintf_ok(char *buf, size_t len, const char *form=
at, ...) {
 diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
-index be23b2fe75..69a2eb6404 100644
+index 7d02b57d7b..75e8e08add 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -429,3 +429,6 @@ index be23b2fe75..69a2eb6404 100644
 =20
  #define SNDBUF_SIZE (8*1024*1024)
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd=
/0006-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRA=
CE-and-GLOB_ALTDIRFUNC-is-not-.patch
rename to meta/recipes-core/systemd/systemd/0006-don-t-fail-if-GLOB_BRACE=
-and-GLOB_ALTDIRFUNC-is-not-.patch
index 15d25e9f19..e7a0abcf9a 100644
--- a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0006-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,7 +1,8 @@
-From 2903e42c7cd727a2374d21b78950308de792ebe8 Mon Sep 17 00:00:00 2001
+From ed836c3478e1193e99e37d50db96d124796a3322 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not def=
ined
+Subject: [PATCH 06/27] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is n=
ot
+ defined
=20
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -63,11 +64,11 @@ index 802ca8c655..23818a67c6 100644
                  return -ENOENT;
          if (k =3D=3D GLOB_NOSPACE)
 diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index 9b3e73cce0..3790ba3be5 100644
+index 49d71f15c7..0a49ebcc17 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
 @@ -34,6 +34,12 @@ TEST(glob_first) {
-         assert_se(first =3D=3D NULL);
+         ASSERT_NULL(first);
  }
 =20
 +/* Don't fail if the standard library
@@ -114,7 +115,7 @@ index 9b3e73cce0..3790ba3be5 100644
 =20
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 6a1c7725a1..138b3ac561 100644
+index 807925f199..b4f86fc611 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -73,6 +73,12 @@
@@ -130,7 +131,7 @@ index 6a1c7725a1..138b3ac561 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -2426,7 +2432,9 @@ finish:
+@@ -2570,7 +2576,9 @@ finish:
 =20
  static int glob_item(Context *c, Item *i, action_t action) {
          _cleanup_globfree_ glob_t g =3D {
@@ -138,9 +139,9 @@ index 6a1c7725a1..138b3ac561 100644
                  .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
 +#endif
          };
-         int r =3D 0, k;
+         int r;
 =20
-@@ -2453,7 +2461,9 @@ static int glob_item_recursively(
+@@ -2598,7 +2606,9 @@ static int glob_item_recursively(
                  fdaction_t action) {
 =20
          _cleanup_globfree_ glob_t g =3D {
@@ -148,5 +149,8 @@ index 6a1c7725a1..138b3ac561 100644
                  .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
 +#endif
          };
-         int r =3D 0, k;
+         int r;
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macr=
os-for-musl.patch b/meta/recipes-core/systemd/systemd/0007-add-missing-FT=
W_-macros-for-musl.patch
similarity index 85%
rename from meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macro=
s-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0007-add-missing-FTW_-macros-=
for-musl.patch
index deb0e83b6d..474a7d38d8 100644
--- a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-=
musl.patch
+++ b/meta/recipes-core/systemd/systemd/0007-add-missing-FTW_-macros-for-=
musl.patch
@@ -1,7 +1,7 @@
-From dcd9639657e4122b7665b01a067219f990ee3ace Mon Sep 17 00:00:00 2001
+From 8320725f1a9088623da8753c7077473b98a63107 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH] add missing FTW_ macros for musl
+Subject: [PATCH 07/27] add missing FTW_ macros for musl
=20
 This is to avoid build failures like below for musl.
=20
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 5 insertions(+)
=20
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index 6c0456349d..73a5b90e3c 100644
+index fc33b76ec1..34a36d83f0 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -14,3 +14,7 @@
@@ -39,3 +39,6 @@ index 8684d064ec..70fc2b5376 100644
 =20
  static char **list_nftw =3D NULL;
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-han=
dling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0008-Use-uintmax_t=
-for-handling-rlim_t.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-hand=
ling-rlim_t.patch
rename to meta/recipes-core/systemd/systemd/0008-Use-uintmax_t-for-handli=
ng-rlim_t.patch
index f02675604d..c8598ed2ea 100644
--- a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-r=
lim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Use-uintmax_t-for-handling-r=
lim_t.patch
@@ -1,7 +1,7 @@
-From c58933386caa8e45b5e814ec4ff210b18ab401da Mon Sep 17 00:00:00 2001
+From 41abe1a4136babfe5df63e9561dcf29d3c8fe6e9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH] Use uintmax_t for handling rlim_t
+Subject: [PATCH 08/27] Use uintmax_t for handling rlim_t
=20
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -27,10 +27,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 9 insertions(+), 15 deletions(-)
=20
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index 8719df3e29..9becc96066 100644
+index ba7cff6a8b..2736abb07b 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
+@@ -42,13 +42,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
  #  error Unknown timex member size
  #endif
 =20
@@ -46,10 +46,10 @@ index 8719df3e29..9becc96066 100644
  #if SIZEOF_DEV_T =3D=3D 8
  #  define DEV_FMT "%" PRIu64
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index c1f0b2b974..61c5412582 100644
+index a9f7b87f28..059c67731d 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimi=
t *rlim) {
+@@ -47,7 +47,7 @@ int setrlimit_closest(int resource, const struct rlimi=
t *rlim) {
              fixed.rlim_max =3D=3D highest.rlim_max)
                  return 0;
 =20
@@ -58,7 +58,7 @@ index c1f0b2b974..61c5412582 100644
 =20
          return RET_NERRNO(setrlimit(resource, &fixed));
  }
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **=
ret) {
+@@ -310,13 +310,13 @@ int rlimit_format(const struct rlimit *rl, char **=
ret) {
          if (rl->rlim_cur >=3D RLIM_INFINITY && rl->rlim_max >=3D RLIM_I=
NFINITY)
                  r =3D free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >=3D RLIM_INFINITY)
@@ -76,7 +76,7 @@ index c1f0b2b974..61c5412582 100644
          if (r < 0)
                  return -ENOMEM;
 =20
-@@ -422,7 +422,7 @@ int rlimit_nofile_safe(void) {
+@@ -425,7 +425,7 @@ int rlimit_nofile_safe(void) {
          rl.rlim_max =3D MIN(rl.rlim_max, (rlim_t) read_nr_open());
          rl.rlim_cur =3D MIN((rlim_t) FD_SETSIZE, rl.rlim_max);
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
@@ -86,10 +86,10 @@ index c1f0b2b974..61c5412582 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 531bec4c92..602a95f674 100644
+index 513e95e09d..0e269617f8 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -1041,9 +1041,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
+@@ -1067,9 +1067,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
          for (unsigned i =3D 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -101,3 +101,6 @@ index 531bec4c92..602a95f674 100644
                  }
 =20
          if (c->ioprio_set) {
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK=
_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/000=
9-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
similarity index 96%
rename from meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_=
NOFOLLOW-flag-to-faccessat.patch
rename to meta/recipes-core/systemd/systemd/0009-don-t-pass-AT_SYMLINK_NO=
FOLLOW-flag-to-faccessat.patch
index 1d4ce33712..851dcbd553 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0009-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 5bf8235bc5c802908aa5d95740350927d87e953a Mon Sep 17 00:00:00 2001
+From 8af5d1e3c0dc7e71f7a4aee0f539a5d772d47354 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH 09/27] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat(=
)
=20
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -31,7 +31,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  2 files changed, 23 insertions(+), 4 deletions(-)
=20
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 6a1e2e76d1..c3f7235e09 100644
+index 3e2db95304..d5747416b0 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
 @@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2=
]);
@@ -94,3 +94,6 @@ index a4e2dae245..67aa8ea1f2 100644
                                                  continue;
                                  }
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatib=
le-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd=
/0010-Define-glibc-compatible-basename-for-non-glibc-syste.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0008-Define-glibc-compatibl=
e-basename-for-non-glibc-syste.patch
rename to meta/recipes-core/systemd/systemd/0010-Define-glibc-compatible-=
basename-for-non-glibc-syste.patch
index 1ab23553f9..162650725d 100644
--- a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
@@ -1,7 +1,8 @@
-From d98f6bd4d8acdc4c1a5bff4c699f5004a6ebccce Mon Sep 17 00:00:00 2001
+From ea8e85d92f67a7af8577a4ce7c67c7aaee65d10c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH] Define glibc compatible basename() for non-glibc system=
s
+Subject: [PATCH 10/27] Define glibc compatible basename() for non-glibc
+ systems
=20
 Fixes builds with musl, even though systemd is adamant about
 using non-posix basename implementation, we have a way out
@@ -14,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/src/basic/string-util.h b/src/basic/string-util.h
-index b6d8be3083..0a29036c4c 100644
+index ff5efbcf55..d1a6bb0e76 100644
 --- a/src/basic/string-util.h
 +++ b/src/basic/string-util.h
 @@ -26,6 +26,10 @@
@@ -28,3 +29,6 @@ index b6d8be3083..0a29036c4c 100644
  static inline char* strstr_ptr(const char *haystack, const char *needle=
) {
          if (!haystack || !needle)
                  return NULL;
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd=
/0011-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0009-Do-not-disable-bufferi=
ng-when-writing-to-oom_score_a.patch
rename to meta/recipes-core/systemd/systemd/0011-Do-not-disable-buffering=
-when-writing-to-oom_score_a.patch
index 98ab397eff..60cec6dc7e 100644
--- a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0011-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From f3943f58f3c8a9d20dcada56eb5ca5f673a49b3d Mon Sep 17 00:00:00 2001
+From 7c8634c441401b034cd4bcf4b916a7042076fca8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH 11/27] Do not disable buffering when writing to oom_scor=
e_adj
=20
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -24,10 +24,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 4492e7ded2..b61a2aba74 100644
+index c9d968dee0..7d6d3ce7db 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1716,7 +1716,7 @@ int set_oom_score_adjust(int value) {
+@@ -1816,7 +1816,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
 =20
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -36,3 +36,6 @@ index 4492e7ded2..b61a2aba74 100644
  }
 =20
  int get_oom_score_adjust(int *ret) {
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd=
/0012-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
similarity index 92%
rename from meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compli=
ant-strerror_r-from-GNU-specif.patch
rename to meta/recipes-core/systemd/systemd/0012-distinguish-XSI-complian=
t-strerror_r-from-GNU-specif.patch
index e1ffe4ddb5..aa3c45cb5f 100644
--- a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0012-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From 5305c5f18236a9d7f2e633ea6ad317e09e8f29d5 Mon Sep 17 00:00:00 2001
+From 4a2df0bba1741914617ca1271e2bc68a5d9e5dac Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH 12/27] distinguish XSI-compliant strerror_r from GNU-spe=
cifi
  strerror_r
=20
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -55,7 +55,7 @@ index f415797700..a5c6e9a3bd 100644
 =20
  static bool map_ok(const sd_bus_error_map *map) {
 diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
-index 69a2eb6404..1561859650 100644
+index 75e8e08add..41e5c7c2b8 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -361,7 +361,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
@@ -71,3 +71,6 @@ index 69a2eb6404..1561859650 100644
                  if (errno =3D=3D 0) {
                          char error[STRLEN("ERRNO=3D") + DECIMAL_STR_MAX=
(int) + 1];
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of=
-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0013-av=
oid-redefinition-of-prctl_mm_map-structure.patch
similarity index 71%
rename from meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-=
prctl_mm_map-structure.patch
rename to meta/recipes-core/systemd/systemd/0013-avoid-redefinition-of-pr=
ctl_mm_map-structure.patch
index 3075f9d003..c48bd58383 100644
--- a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_=
mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0013-avoid-redefinition-of-prctl_=
mm_map-structure.patch
@@ -1,7 +1,7 @@
-From c866c8652f06af4cd0b9bd7eedc606449f432b95 Mon Sep 17 00:00:00 2001
+From 846b8f16cf07d9187261e06701a75eb208caa707 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH 13/27] avoid redefinition of prctl_mm_map structure
=20
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -14,7 +14,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
-index 7d9e395c92..88c2d7dfac 100644
+index 2c9f9f6c50..65a984b564 100644
 --- a/src/basic/missing_prctl.h
 +++ b/src/basic/missing_prctl.h
 @@ -1,7 +1,9 @@
@@ -25,5 +25,8 @@ index 7d9e395c92..88c2d7dfac 100644
  #include <linux/prctl.h>
 +#endif
 =20
- /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
- #ifndef PR_CAP_AMBIENT
+ #include "macro.h"
+=20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer=
-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0014-do-not-d=
isable-buffer-in-writing-files.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-=
in-writing-files.patch
rename to meta/recipes-core/systemd/systemd/0014-do-not-disable-buffer-in=
-writing-files.patch
index 0fec84724d..e624c2d71e 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-wri=
ting-files.patch
+++ b/meta/recipes-core/systemd/systemd/0014-do-not-disable-buffer-in-wri=
ting-files.patch
@@ -1,7 +1,7 @@
-From 8464b845e6df1be303e09274c13e653072701671 Mon Sep 17 00:00:00 2001
+From 88694101bcac461c39049962ce97ce579cc07e13 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH] do not disable buffer in writing files
+Subject: [PATCH 14/27] do not disable buffer in writing files
=20
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -35,7 +35,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/nspawn/nspawn-cgroup.c           |  2 +-
  src/nspawn/nspawn.c                  |  6 +++---
  src/shared/binfmt-util.c             |  2 +-
- src/shared/cgroup-setup.c            |  4 ++--
+ src/shared/cgroup-setup.c            |  6 +++---
  src/shared/coredump-util.c           |  4 ++--
  src/shared/hibernate-util.c          |  4 ++--
  src/shared/smack-util.c              |  2 +-
@@ -44,22 +44,22 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/storagetm/storagetm.c            | 24 ++++++++++++------------
  src/udev/udev-rules.c                |  1 -
  src/vconsole/vconsole-setup.c        |  2 +-
- 22 files changed, 50 insertions(+), 51 deletions(-)
+ 22 files changed, 51 insertions(+), 52 deletions(-)
=20
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index d2be79622f..e65fecb68d 100644
+index 553ee6075a..a3704baf6a 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -417,7 +417,7 @@ int cg_kill_kernel_sigkill(const char *path) {
+@@ -457,7 +457,7 @@ int cg_kill_kernel_sigkill(const char *path) {
          if (r < 0)
                  return r;
 =20
 -        r =3D write_string_file(killfile, "1", WRITE_STRING_FILE_DISABL=
E_BUFFER);
 +        r =3D write_string_file(killfile, "1", 0);
          if (r < 0)
-                 return r;
+                 return log_debug_errno(r, "Failed to write to cgroup.ki=
ll for cgroup '%s': %m", path);
 =20
-@@ -843,7 +843,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
+@@ -885,7 +885,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
 =20
          sc =3D strstrip(contents);
          if (isempty(sc)) {
@@ -68,7 +68,7 @@ index d2be79622f..e65fecb68d 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -861,7 +861,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
+@@ -903,7 +903,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
 =20
          sc =3D strstrip(contents);
          if (streq(sc, "0")) {
@@ -77,7 +77,7 @@ index d2be79622f..e65fecb68d 100644
                  if (r < 0)
                          return r;
 =20
-@@ -888,7 +888,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
+@@ -930,7 +930,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
          if (r < 0)
                  return r;
 =20
@@ -86,7 +86,7 @@ index d2be79622f..e65fecb68d 100644
          if (r < 0)
                  return r;
 =20
-@@ -898,7 +898,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
+@@ -940,7 +940,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
          if (r < 0)
                  return r;
 =20
@@ -95,7 +95,7 @@ index d2be79622f..e65fecb68d 100644
          if (r < 0)
                  return r;
 =20
-@@ -1814,7 +1814,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
+@@ -1833,7 +1833,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
          if (r < 0)
                  return r;
 =20
@@ -105,29 +105,29 @@ index d2be79622f..e65fecb68d 100644
 =20
  int cg_get_attribute(const char *controller, const char *path, const ch=
ar *attribute, char **ret) {
 diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index 2101f617ad..63817bae17 100644
+index 5b4e43f921..42a84ded55 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
+@@ -325,12 +325,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
                  freeze();
 =20
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
 -        r =3D write_string_file(path, uid_map, WRITE_STRING_FILE_DISABL=
E_BUFFER);
 +        r =3D write_string_file(path, uid_map, 0);
          if (r < 0)
-                 return log_error_errno(r, "Failed to write UID map: %m"=
);
+                 return log_debug_errno(r, "Failed to write UID map: %m"=
);
 =20
          xsprintf(path, "/proc/" PID_FMT "/gid_map", pid);
 -        r =3D write_string_file(path, gid_map, WRITE_STRING_FILE_DISABL=
E_BUFFER);
 +        r =3D write_string_file(path, gid_map, 0);
          if (r < 0)
-                 return log_error_errno(r, "Failed to write GID map: %m"=
);
+                 return log_debug_errno(r, "Failed to write GID map: %m"=
);
 =20
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 6cb0ddf575..247cf9e1d1 100644
+index d7cfcd9105..58fb5918a3 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -63,13 +63,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl=
. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since=
 PID 0 is not a valid PID */
@@ -144,7 +144,7 @@ index 6cb0ddf575..247cf9e1d1 100644
                  uint64_t threads_max;
 =20
 diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index b66a6622ae..8d1c93008a 100644
+index 9a1933f579..7d6fc65ee1 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
 @@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *val=
ue) {
@@ -188,23 +188,23 @@ index d21f3f79ff..258607cc7e 100644
                          log_warning_errno(r, "Failed to flush binfmt_mi=
sc rules, ignoring: %m");
                  else
 diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 61ac4df1a6..ea18970196 100644
+index 34fd2a250c..cb1a6d01eb 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4578,7 +4578,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
-                         u->freezer_state =3D FREEZER_THAWING;
-         }
+@@ -5173,7 +5173,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
+                        freezer_state_to_string(u->freezer_state),
+                        freezer_state_to_string(next));
 =20
--        r =3D write_string_file(path, one_zero(action =3D=3D FREEZER_FR=
EEZE), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file(path, one_zero(action =3D=3D FREEZER_FR=
EEZE), 0);
+-        r =3D write_string_file(path, one_zero(target =3D=3D FREEZER_FR=
OZEN), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file(path, one_zero(target =3D=3D FREEZER_FR=
OZEN), 0);
          if (r < 0)
                  return r;
 =20
 diff --git a/src/core/main.c b/src/core/main.c
-index 1c0030a75f..7108a87d46 100644
+index 4b8a315d86..051a31ba84 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
+@@ -1789,7 +1789,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
          if (getpid_cached() !=3D 1)
                  return;
 =20
@@ -240,23 +240,24 @@ index 7ea902b6f9..1aef2988d0 100644
                  log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"127.0.0.1 -CIPSO\": %m");
  #endif
 diff --git a/src/home/homework.c b/src/home/homework.c
-index 066483e342..5f92dd7064 100644
+index 482db23dbc..ed6b8d271f 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
-@@ -278,7 +278,7 @@ static void drop_caches_now(void) {
-          * for details. We write "2" into /proc/sys/vm/drop_caches to e=
nsure dentries/inodes are flushed, but
+@@ -302,8 +302,8 @@ static void drop_caches_now(void) {
+         /* Drop file system caches now. See https://docs.kernel.org/adm=
in-guide/sysctl/vm.html
+          * for details. We write "3" into /proc/sys/vm/drop_caches to e=
nsure dentries/inodes are flushed, but
           * not more. */
++        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", 0);
 =20
--        r =3D write_string_file("/proc/sys/vm/drop_caches", "2\n", WRIT=
E_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/vm/drop_caches", "2\n", 0);
+-        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", WRIT=
E_STRING_FILE_DISABLE_BUFFER);
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: =
%m");
          else
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-de=
vice/sd-device.c
-index 01e66b4658..f3ea82ca1b 100644
+index d8d151835c..268cb65ec7 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
+@@ -2499,7 +2499,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
 =20
@@ -266,10 +267,10 @@ index 01e66b4658..f3ea82ca1b 100644
                  /* On failure, clear cache entry, as we do not know how=
 it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
 diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index a5002437c6..b12e6cd9c9 100644
+index 4f28b4a225..c93c2c33b5 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_req=
uested, uid_t uid_shift) {
+@@ -93,7 +93,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_reque=
sted, uid_t uid_shift) {
          fn =3D strjoina(tree, cgroup, "/cgroup.procs");
 =20
          sprintf(pid_string, PID_FMT, pid);
@@ -279,10 +280,10 @@ index a5002437c6..b12e6cd9c9 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 0600f3e014..ea369c32b2 100644
+index 5842d3ba8f..44ff9d946c 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2690,7 +2690,7 @@ static int reset_audit_loginuid(void) {
+@@ -2741,7 +2741,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
 =20
@@ -291,7 +292,7 @@ index 0600f3e014..ea369c32b2 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This =
probably means that your kernel is too\n"
-@@ -4143,7 +4143,7 @@ static int setup_uid_map(
+@@ -4450,7 +4450,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -300,7 +301,7 @@ index 0600f3e014..ea369c32b2 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m"=
);
 =20
-@@ -4153,7 +4153,7 @@ static int setup_uid_map(
+@@ -4460,7 +4460,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -323,10 +324,10 @@ index a26175474b..1413a9c72c 100644
                  return log_warning_errno(r, "Failed to unregister binfm=
t_misc entries: %m");
 =20
 diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 934a16eaf3..c921ced861 100644
+index 093b6d0d22..89d0ac612b 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
+@@ -364,7 +364,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
 =20
          xsprintf(c, PID_FMT "\n", pid);
 =20
@@ -335,7 +336,16 @@ index 934a16eaf3..c921ced861 100644
          if (r =3D=3D -EOPNOTSUPP && cg_is_threaded(path) > 0)
                  /* When the threaded mode is used, we cannot read/write=
 the file. Let's return recognizable error. */
                  return -EUCLEAN;
-@@ -966,7 +966,7 @@ int cg_enable_everywhere(
+@@ -395,7 +395,7 @@ int cg_fd_attach(int fd, pid_t pid) {
+=20
+         xsprintf(c, PID_FMT "\n", pid);
+=20
+-        return write_string_file_at(fd, "cgroup.procs", c, WRITE_STRING=
_FILE_DISABLE_BUFFER);
++        return write_string_file_at(fd, "cgroup.procs", c, 0);
+ }
+=20
+ int cg_attach_fallback(const char *controller, const char *path, pid_t =
pid) {
+@@ -974,7 +974,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "=
Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
 =20
@@ -367,10 +377,10 @@ index 805503f366..01a7ccb291 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignor=
ing: %m");
  }
 diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
-index c3991cfa4c..7d522d8d1f 100644
+index 7c21157580..06ab74b04c 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
-@@ -501,7 +501,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
+@@ -495,7 +495,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
 =20
          /* We write the offset first since it's safer. Note that this f=
ile is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriti=
ng it with 0. */
@@ -379,7 +389,7 @@ index c3991cfa4c..7d522d8d1f 100644
          if (r =3D=3D -ENOENT) {
                  if (offset !=3D 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSU=
PP),
-@@ -517,7 +517,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
+@@ -511,7 +511,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
                  log_debug("Wrote resume_offset=3D%s for device '%s' to =
/sys/power/resume_offset.",
                            offset_str, device);
 =20
@@ -402,10 +412,10 @@ index 1f88e724d0..feb18b320a 100644
                  return r;
 =20
 diff --git a/src/shared/watchdog.c b/src/shared/watchdog.c
-index 99ccefb227..e4975018ab 100644
+index 810c5b5206..be0d127ff3 100644
 --- a/src/shared/watchdog.c
 +++ b/src/shared/watchdog.c
-@@ -93,7 +93,7 @@ static int set_pretimeout_governor(const char *governo=
r) {
+@@ -93,7 +93,7 @@ static int watchdog_set_pretimeout_governor(const char=
 *governor) {
 =20
          r =3D write_string_file(sys_fn,
                                governor,
@@ -415,10 +425,10 @@ index 99ccefb227..e4975018ab 100644
                  return log_error_errno(r, "Failed to set watchdog preti=
meout_governor to '%s': %m", governor);
 =20
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 21062b24e0..262dd71d72 100644
+index 0402bb07f3..a6cbb45340 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -137,7 +137,7 @@ static int write_state(int fd, char * const *states)=
 {
+@@ -139,7 +139,7 @@ static int write_state(int fd, char * const *states)=
 {
                  if (k < 0)
                          return RET_GATHER(r, k);
 =20
@@ -427,17 +437,17 @@ index 21062b24e0..262dd71d72 100644
                  if (k >=3D 0) {
                          log_debug("Using sleep state '%s'.", *state);
                          return 0;
-@@ -155,7 +155,7 @@ static int write_mode(char * const *modes) {
-         STRV_FOREACH(mode, modes) {
-                 int k;
+@@ -157,7 +157,7 @@ static int write_mode(const char *path, char * const=
 *modes) {
+         assert(path);
 =20
--                k =3D write_string_file("/sys/power/disk", *mode, WRITE=
_STRING_FILE_DISABLE_BUFFER);
-+                k =3D write_string_file("/sys/power/disk", *mode, 0);
-                 if (k >=3D 0) {
-                         log_debug("Using sleep disk mode '%s'.", *mode)=
;
+         STRV_FOREACH(mode, modes) {
+-                r =3D write_string_file(path, *mode, WRITE_STRING_FILE_=
DISABLE_BUFFER);
++                r =3D write_string_file(path, *mode, 0);
+                 if (r >=3D 0) {
+                         log_debug("Using sleep mode '%s' for %s.", *mod=
e, path);
                          return 0;
 diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
-index 16d4fb07d4..aca7506463 100644
+index 1bb8eec316..cf9b4c4a21 100644
 --- a/src/storagetm/storagetm.c
 +++ b/src/storagetm/storagetm.c
 @@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
@@ -533,22 +543,22 @@ index 16d4fb07d4..aca7506463 100644
                  return log_error_errno(r, "Failed to set IP address on =
NVME port %" PRIu16 ": %m", portnr);
 =20
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index e5b8df5c2d..63ca15628c 100644
+index 581bbaf345..cdf648a2d1 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2711,7 +2711,6 @@ static int udev_rule_apply_token_to_event(
-                 log_event_debug(dev, token, "ATTR '%s' writing '%s'", b=
uf, value);
-                 r =3D write_string_file(buf, value,
-                                       WRITE_STRING_FILE_VERIFY_ON_FAILU=
RE |
--                                      WRITE_STRING_FILE_DISABLE_BUFFER =
|
-                                       WRITE_STRING_FILE_AVOID_NEWLINE |
-                                       WRITE_STRING_FILE_VERIFY_IGNORE_N=
EWLINE);
-                 if (r < 0)
+@@ -2706,7 +2706,6 @@ static int udev_rule_apply_token_to_event(
+                         log_event_debug(dev, token, "Writing ATTR{'%s'}=
=3D\"%s\".", buf, value);
+                         r =3D write_string_file(buf, value,
+                                               WRITE_STRING_FILE_VERIFY_=
ON_FAILURE |
+-                                              WRITE_STRING_FILE_DISABLE=
_BUFFER |
+                                               WRITE_STRING_FILE_AVOID_N=
EWLINE |
+                                               WRITE_STRING_FILE_VERIFY_=
IGNORE_NEWLINE);
+                         if (r < 0)
 diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup=
.c
-index 4d82c65f0a..3a3d861b83 100644
+index ba742dda69..6f20e81615 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -261,7 +261,7 @@ static int toggle_utf8_vc(const char *name, int fd, =
bool utf8) {
+@@ -277,7 +277,7 @@ static int toggle_utf8_vc(const char *name, int fd, =
bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
 =20
@@ -557,3 +567,6 @@ index 4d82c65f0a..3a3d861b83 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 f=
lag: %m", enable_disable(utf8));
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usa=
ge.patch b/meta/recipes-core/systemd/systemd/0015-Handle-__cpu_mask-usage=
.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usag=
e.patch
rename to meta/recipes-core/systemd/systemd/0015-Handle-__cpu_mask-usage.=
patch
index 6d7e002d61..86003db4de 100644
--- a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0015-Handle-__cpu_mask-usage.patc=
h
@@ -1,7 +1,7 @@
-From f6b69f28657c09b1181552d85e52ced0e01182e3 Mon Sep 17 00:00:00 2001
+From c1cbec8571855b8480d56dcad2ab81aea0782bd4 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH] Handle __cpu_mask usage
+Subject: [PATCH 15/27] Handle __cpu_mask usage
=20
 Fixes errors:
=20
@@ -24,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
-index 3c63a58826..4c2d4347fc 100644
+index 618fe1b0a3..46c92077b0 100644
 --- a/src/shared/cpu-set-util.h
 +++ b/src/shared/cpu-set-util.h
 @@ -6,6 +6,8 @@
@@ -55,3 +55,6 @@ index ea0c58770e..b65c0bd370 100644
 =20
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshado=
w.patch b/meta/recipes-core/systemd/systemd/0016-Handle-missing-gshadow.p=
atch
similarity index 80%
rename from meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow=
.patch
rename to meta/recipes-core/systemd/systemd/0016-Handle-missing-gshadow.p=
atch
index 40b60399aa..6c7b233f95 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From 5442d8ddb285d33b459aefc76962640afd131280 Mon Sep 17 00:00:00 2001
+From 8b540d8240bbc3f917de9ca8d3b62f28c3424d91 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH] Handle missing gshadow
+Subject: [PATCH 16/27] Handle missing gshadow
=20
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -17,10 +17,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft=
.com>
  3 files changed, 30 insertions(+), 1 deletion(-)
=20
 diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 414a49331b..1a4e1b628c 100644
+index ffb5721466..4d01815c8c 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
-@@ -329,8 +329,10 @@ int nss_group_to_group_record(
+@@ -286,8 +286,10 @@ int nss_group_to_group_record(
          if (isempty(grp->gr_name))
                  return -EINVAL;
 =20
@@ -31,7 +31,7 @@ index 414a49331b..1a4e1b628c 100644
 =20
          g =3D group_record_new();
          if (!g)
-@@ -346,6 +348,7 @@ int nss_group_to_group_record(
+@@ -303,6 +305,7 @@ int nss_group_to_group_record(
 =20
          g->gid =3D grp->gr_gid;
 =20
@@ -39,7 +39,7 @@ index 414a49331b..1a4e1b628c 100644
          if (sgrp) {
                  if (looks_like_hashed_password(utf8_only(sgrp->sg_passw=
d))) {
                          g->hashed_password =3D strv_new(sgrp->sg_passwd=
);
-@@ -361,6 +364,7 @@ int nss_group_to_group_record(
+@@ -318,6 +321,7 @@ int nss_group_to_group_record(
                  if (r < 0)
                          return r;
          }
@@ -47,7 +47,7 @@ index 414a49331b..1a4e1b628c 100644
 =20
          r =3D json_build(&g->json, JSON_BUILD_OBJECT(
                                         JSON_BUILD_PAIR("groupName", JSO=
N_BUILD_STRING(g->group_name)),
-@@ -387,6 +391,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
+@@ -344,6 +348,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
          assert(ret_sgrp);
          assert(ret_buffer);
 =20
@@ -55,7 +55,7 @@ index 414a49331b..1a4e1b628c 100644
          for (;;) {
                  _cleanup_free_ char *buf =3D NULL;
                  struct sgrp sgrp, *result;
-@@ -415,6 +420,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
+@@ -372,6 +377,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
                  buflen *=3D 2;
                  buf =3D mfree(buf);
          }
@@ -65,25 +65,25 @@ index 414a49331b..1a4e1b628c 100644
  }
 =20
  int nss_group_record_by_name(
-@@ -426,7 +434,9 @@ int nss_group_record_by_name(
-         struct group grp, *result;
+@@ -382,7 +390,9 @@ int nss_group_record_by_name(
+         _cleanup_free_ char *sbuf =3D NULL;
+         _cleanup_free_ struct group *result =3D NULL;
          bool incomplete =3D false;
-         size_t buflen =3D 4096;
 +#if ENABLE_GSHADOW
          struct sgrp sgrp, *sresult =3D NULL;
 +#endif
          int r;
 =20
          assert(name);
-@@ -455,6 +465,7 @@ int nss_group_record_by_name(
-                 buf =3D mfree(buf);
-         }
+@@ -391,6 +401,7 @@ int nss_group_record_by_name(
+         if (r < 0)
+                 return r;
 =20
 +#if ENABLE_GSHADOW
          if (with_shadow) {
                  r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
                  if (r < 0) {
-@@ -466,6 +477,9 @@ int nss_group_record_by_name(
+@@ -402,6 +413,9 @@ int nss_group_record_by_name(
                  incomplete =3D true;
 =20
          r =3D nss_group_to_group_record(result, sresult, ret);
@@ -93,25 +93,24 @@ index 414a49331b..1a4e1b628c 100644
          if (r < 0)
                  return r;
 =20
-@@ -483,7 +497,9 @@ int nss_group_record_by_gid(
-         struct group grp, *result;
+@@ -418,13 +432,16 @@ int nss_group_record_by_gid(
+         _cleanup_free_ char *sbuf =3D NULL;
+         _cleanup_free_ struct group *result =3D NULL;
          bool incomplete =3D false;
-         size_t buflen =3D 4096;
 +#if ENABLE_GSHADOW
          struct sgrp sgrp, *sresult =3D NULL;
 +#endif
          int r;
 =20
-         for (;;) {
-@@ -509,6 +525,7 @@ int nss_group_record_by_gid(
-                 buf =3D mfree(buf);
-         }
+         r =3D getgrgid_malloc(gid, &result);
+         if (r < 0)
+                 return r;
 =20
 +#if ENABLE_GSHADOW
          if (with_shadow) {
                  r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
                  if (r < 0) {
-@@ -520,6 +537,9 @@ int nss_group_record_by_gid(
+@@ -436,6 +453,9 @@ int nss_group_record_by_gid(
                  incomplete =3D true;
 =20
          r =3D nss_group_to_group_record(result, sresult, ret);
@@ -138,7 +137,7 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
 =20
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index f60d48ace4..e878199a28 100644
+index 75dece3442..5628e1410f 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
 @@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
@@ -168,3 +167,6 @@ index f60d48ace4..e878199a28 100644
                          if (r < 0)
                                  return r;
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Def=
ine-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0=
017-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Defi=
ne-MIPS-ABI-defines-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define=
-MIPS-ABI-defines-for-musl.patch
index 51f0b048fa..04b2fb712f 100644
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
@@ -1,7 +1,7 @@
-From 863dd6f502d53a4a2644e031eee2e8dfa3fd05aa Mon Sep 17 00:00:00 2001
+From 45bb63a1727097683acad23f270968026671ec6a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
-Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
+Subject: [PATCH 17/27] missing_syscall.h: Define MIPS ABI defines for mu=
sl
=20
 musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
 unlike glibc where these are provided by libc headers, therefore define
@@ -44,3 +44,6 @@ index 67aa8ea1f2..8d9824495e 100644
 =20
  typedef struct BaseFilesystem {
          const char *dir;      /* directory or symlink to create */
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0016-pass-correct-paramete=
rs-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0018-pass-corr=
ect-parameters-to-getdents64.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0016-pass-correct-parameter=
s-to-getdents64.patch
rename to meta/recipes-core/systemd/systemd/0018-pass-correct-parameters-=
to-getdents64.patch
index 66b8f66806..b4b6be0e75 100644
--- a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-g=
etdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0018-pass-correct-parameters-to-g=
etdents64.patch
@@ -1,7 +1,7 @@
-From 01de9e5a6e4ad2f361d3eb4d9839c7afd91cc677 Mon Sep 17 00:00:00 2001
+From 78a59a540d425e677d5652d9b72d7b175e36f4dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH] pass correct parameters to getdents64
+Subject: [PATCH 18/27] pass correct parameters to getdents64
=20
 Fixes
 ../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types =
passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct =
dirent *' [-Werror,-Wincompatible-pointer-types]
@@ -20,10 +20,10 @@ Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel=
.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index 5e98b7a5d8..aef065047b 100644
+index 776733148b..d37419658c 100644
 --- a/src/basic/recurse-dir.c
 +++ b/src/basic/recurse-dir.c
-@@ -55,7 +55,7 @@ int readdir_all(int dir_fd,
+@@ -56,7 +56,7 @@ int readdir_all(int dir_fd,
                  bs =3D MIN(MALLOC_SIZEOF_SAFE(de) - offsetof(DirectoryE=
ntries, buffer), (size_t) SSIZE_MAX);
                  assert(bs > de->buffer_size);
 =20
@@ -32,3 +32,6 @@ index 5e98b7a5d8..aef065047b 100644
                  if (n < 0)
                          return -errno;
                  if (n =3D=3D 0)
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-heade=
rs.patch b/meta/recipes-core/systemd/systemd/0019-Adjust-for-musl-headers=
.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-header=
s.patch
rename to meta/recipes-core/systemd/systemd/0019-Adjust-for-musl-headers.=
patch
index f86b8c889c..44eebe16b3 100644
--- a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0019-Adjust-for-musl-headers.patc=
h
@@ -1,7 +1,7 @@
-From a45cf93772ac5055665cc55454509747b9c68ad2 Mon Sep 17 00:00:00 2001
+From 585e04673da62a8bf50e00fd6c1ae9ffc66c3b2f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
-Subject: [PATCH] Adjust for musl headers
+Subject: [PATCH 19/27] Adjust for musl headers
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -14,7 +14,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/network/netdev/bareudp.c                  | 2 +-
  src/network/netdev/batadv.c                   | 2 +-
  src/network/netdev/bond.c                     | 2 +-
- src/network/netdev/bridge.c                   | 2 +-
+ src/network/netdev/bridge.c                   | 3 ++-
  src/network/netdev/dummy.c                    | 2 +-
  src/network/netdev/geneve.c                   | 2 +-
  src/network/netdev/ifb.c                      | 2 +-
@@ -34,7 +34,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/network/netdev/vxlan.c                    | 2 +-
  src/network/netdev/wireguard.c                | 2 +-
  src/network/netdev/xfrm.c                     | 2 +-
- src/network/networkd-bridge-mdb.c             | 4 ++--
  src/network/networkd-dhcp-common.c            | 3 ++-
  src/network/networkd-dhcp-prefix-delegation.c | 3 ++-
  src/network/networkd-dhcp-server.c            | 2 +-
@@ -42,16 +41,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/network/networkd-ipv6ll.c                 | 2 +-
  src/network/networkd-link.c                   | 2 +-
  src/network/networkd-ndisc.c                  | 2 +-
- src/network/networkd-route.c                  | 8 ++++----
  src/network/networkd-setlink.c                | 2 +-
  src/network/networkd-sysctl.c                 | 2 +-
  src/shared/linux/ethtool.h                    | 3 ++-
  src/shared/netif-util.c                       | 2 +-
  src/udev/udev-builtin-net_id.c                | 2 +-
- 38 files changed, 45 insertions(+), 42 deletions(-)
+ 36 files changed, 40 insertions(+), 36 deletions(-)
=20
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-n=
etwork/sd-dhcp6-client.c
-index c20367dfc9..b8d4cd8c2a 100644
+index 3e992d7cad..c7e1ff4dbf 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,7 @@
@@ -90,7 +88,7 @@ index 26da0231d4..2e8002af8c 100644
  #include "batadv.h"
  #include "fileio.h"
 diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 4d75a0d6bf..985b3197e0 100644
+index 52a7f126b6..74ca0812db 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,7 +1,7 @@
@@ -103,18 +101,19 @@ index 4d75a0d6bf..985b3197e0 100644
  #include "alloc-util.h"
  #include "bond.h"
 diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index 3e394edadf..f12f667687 100644
+index d426c0c501..14432adb95 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
-@@ -2,7 +2,7 @@
+@@ -2,7 +2,8 @@
 =20
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
- #include <netinet/in.h>
 -#include <linux/if_arp.h>
++#include <netinet/in.h>
 +//#include <linux/if_arp.h>
  #include <linux/if_bridge.h>
+ #include <netinet/in.h>
 =20
- #include "bridge.h"
 diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
 index 00df1d2787..77b506b422 100644
 --- a/src/network/netdev/dummy.c
@@ -128,18 +127,18 @@ index 00df1d2787..77b506b422 100644
  #include "dummy.h"
 =20
 diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
-index bc655ec7ff..a77e8e17e4 100644
+index 22c2b00e1b..1d762c4911 100644
 --- a/src/network/netdev/geneve.c
 +++ b/src/network/netdev/geneve.c
 @@ -2,7 +2,7 @@
 =20
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
- #include <netinet/in.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
+ #include <netinet/in.h>
 =20
  #include "alloc-util.h"
- #include "conf-parser.h"
 diff --git a/src/network/netdev/ifb.c b/src/network/netdev/ifb.c
 index d7ff44cb9e..e037629ae4 100644
 --- a/src/network/netdev/ifb.c
@@ -166,11 +165,11 @@ index d5fe299b7b..c9c8002eac 100644
 =20
  #include "ipoib.h"
 diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
-index 05d5d010f6..d440f49537 100644
+index 51ae64341d..46460efabd 100644
 --- a/src/network/netdev/ipvlan.c
 +++ b/src/network/netdev/ipvlan.c
-@@ -2,7 +2,7 @@
-=20
+@@ -3,7 +3,7 @@
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
  #include <netinet/in.h>
 -#include <linux/if_arp.h>
@@ -179,7 +178,7 @@ index 05d5d010f6..d440f49537 100644
  #include "conf-parser.h"
  #include "ipvlan.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 17d6acefb6..679d0984f9 100644
+index 4b9f19cc95..6c4951a7e6 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -192,11 +191,11 @@ index 17d6acefb6..679d0984f9 100644
  #include <linux/if_macsec.h>
  #include <linux/genetlink.h>
 diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
-index 203807e3a5..8ab09a387e 100644
+index 21933d3970..a4ace19dc6 100644
 --- a/src/network/netdev/macvlan.c
 +++ b/src/network/netdev/macvlan.c
-@@ -2,7 +2,7 @@
-=20
+@@ -3,7 +3,7 @@
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
  #include <netinet/in.h>
 -#include <linux/if_arp.h>
@@ -205,11 +204,11 @@ index 203807e3a5..8ab09a387e 100644
  #include "conf-parser.h"
  #include "macvlan.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 57127a861a..7f787d0b9f 100644
+index 2b411425ba..fe00200135 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
-@@ -2,7 +2,7 @@
-=20
+@@ -3,7 +3,7 @@
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
  #include <netinet/in.h>
 -#include <linux/if_arp.h>
@@ -267,40 +266,41 @@ index 380547ee1e..137c1adf8a 100644
  #include "vcan.h"
 =20
 diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
-index e0f5b4ebb1..8a424ed03d 100644
+index 78555286d1..e7eff072e4 100644
 --- a/src/network/netdev/veth.c
 +++ b/src/network/netdev/veth.c
 @@ -3,7 +3,7 @@
- #include <errno.h>
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
- #include <netinet/in.h>
+ #include <errno.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
  #include <linux/veth.h>
+ #include <netinet/in.h>
 =20
- #include "netlink-util.h"
 diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
-index 2390206993..efec630e30 100644
+index 60e49a5b8a..266fd58813 100644
 --- a/src/network/netdev/vlan.c
 +++ b/src/network/netdev/vlan.c
-@@ -2,7 +2,7 @@
-=20
- #include <errno.h>
+@@ -3,7 +3,7 @@
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
+ #include <errno.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
  #include <linux/if_vlan.h>
 =20
  #include "parse-util.h"
 diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
-index b75ec2bcc6..6aeeea640b 100644
+index 24079a7203..33ff17ea82 100644
 --- a/src/network/netdev/vrf.c
 +++ b/src/network/netdev/vrf.c
-@@ -2,7 +2,7 @@
+@@ -2,8 +2,8 @@
 =20
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
- #include <netinet/in.h>
 -#include <linux/if_arp.h>
+ #include <netinet/in.h>
 +//#include <linux/if_arp.h>
 =20
  #include "vrf.h"
@@ -319,11 +319,11 @@ index c0343f45b6..f9e718f40b 100644
  #include "vxcan.h"
 =20
 diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
-index b11fdbbd0d..a971a917f0 100644
+index 37f65967a6..bdd8848a02 100644
 --- a/src/network/netdev/vxlan.c
 +++ b/src/network/netdev/vxlan.c
-@@ -2,7 +2,7 @@
-=20
+@@ -3,7 +3,7 @@
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
  #include <netinet/in.h>
 -#include <linux/if_arp.h>
@@ -332,18 +332,18 @@ index b11fdbbd0d..a971a917f0 100644
  #include "conf-parser.h"
  #include "alloc-util.h"
 diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
-index 4c7d837c41..6df6dfb816 100644
+index fed1be8d11..94b659fd23 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
-@@ -6,7 +6,7 @@
- #include <sys/ioctl.h>
+@@ -5,7 +5,7 @@
+=20
+ /* Make sure the net/if.h header is included before any linux/ one */
  #include <net/if.h>
- #include <netinet/in.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
  #include <linux/ipv6_route.h>
-=20
- #include "sd-resolve.h"
+ #include <netinet/in.h>
+ #include <sys/ioctl.h>
 diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
 index 905bfc0bdf..39e34dbb3b 100644
 --- a/src/network/netdev/xfrm.c
@@ -356,29 +356,8 @@ index 905bfc0bdf..39e34dbb3b 100644
 =20
  #include "missing_network.h"
  #include "xfrm.h"
-diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-br=
idge-mdb.c
-index bd1a9745dc..949d3da029 100644
---- a/src/network/networkd-bridge-mdb.c
-+++ b/src/network/networkd-bridge-mdb.c
-@@ -1,7 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <net/if.h>
--#include <linux/if_bridge.h>
-=20
- #include "netlink-util.h"
- #include "networkd-bridge-mdb.h"
-@@ -11,6 +9,8 @@
- #include "networkd-queue.h"
- #include "string-util.h"
- #include "vlan-util.h"
-+#include <net/if.h>
-+#include <linux/if_bridge.h>
-=20
- #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
-=20
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-d=
hcp-common.c
-index 080b15387c..efe8283957 100644
+index 9f0268d934..8cd605ab4a 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -392,7 +371,7 @@ index 080b15387c..efe8283957 100644
  #include "bus-error.h"
  #include "bus-locator.h"
 diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network=
/networkd-dhcp-prefix-delegation.c
-index af2fe9efcd..511565700f 100644
+index 2e660b7763..b8dd6240a0 100644
 --- a/src/network/networkd-dhcp-prefix-delegation.c
 +++ b/src/network/networkd-dhcp-prefix-delegation.c
 @@ -1,6 +1,5 @@
@@ -412,7 +391,7 @@ index af2fe9efcd..511565700f 100644
          assert(link);
 =20
 diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-d=
hcp-server.c
-index 607fe0053c..9ce4005874 100644
+index c35102af74..3be469ae16 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,7 +1,7 @@
@@ -425,7 +404,7 @@ index 607fe0053c..9ce4005874 100644
 =20
  #include "sd-dhcp-server.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 49c452da7c..98aad1f3cd 100644
+index 4dd6044b18..15a598f9db 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -451,10 +430,10 @@ index 32229a3fc7..662a345d6e 100644
  #include "in-addr-util.h"
  #include "networkd-address.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 4ef1be4bad..e5aa53604d 100644
+index 6b0f09926a..81f44f6e6a 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
-@@ -3,7 +3,7 @@
+@@ -4,7 +4,7 @@
  #include <net/if.h>
  #include <netinet/in.h>
  #include <linux/if.h>
@@ -464,7 +443,7 @@ index 4ef1be4bad..e5aa53604d 100644
  #include <linux/netdevice.h>
  #include <sys/socket.h>
 diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index 840ccb158d..9f2e85e32f 100644
+index 7cafe1f6a3..07c293c9a6 100644
 --- a/src/network/networkd-ndisc.c
 +++ b/src/network/networkd-ndisc.c
 @@ -6,7 +6,7 @@
@@ -476,33 +455,8 @@ index 840ccb158d..9f2e85e32f 100644
 =20
  #include "sd-ndisc.h"
 =20
-diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index eb502ae2cf..5b25ee4523 100644
---- a/src/network/networkd-route.c
-+++ b/src/network/networkd-route.c
-@@ -1,9 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/icmpv6.h>
--#include <linux/ipv6_route.h>
--#include <linux/nexthop.h>
--
- #include "alloc-util.h"
- #include "event-util.h"
- #include "netlink-util.h"
-@@ -21,6 +17,10 @@
- #include "vrf.h"
- #include "wireguard.h"
-=20
-+#include <linux/icmpv6.h>
-+#include <linux/ipv6_route.h>
-+#include <linux/nexthop.h>
-+
- int route_new(Route **ret) {
-         _cleanup_(route_freep) Route *route =3D NULL;
-=20
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setli=
nk.c
-index 011ea1fe6e..59dfe733eb 100644
+index 058bc00ba1..bb0a430a0b 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -515,7 +469,7 @@ index 011ea1fe6e..59dfe733eb 100644
 =20
  #include "missing_network.h"
 diff --git a/src/network/networkd-sysctl.c b/src/network/networkd-sysctl=
.c
-index 2b226b2e2a..f12a474e2f 100644
+index 68c23e0eb7..e177c49d9b 100644
 --- a/src/network/networkd-sysctl.c
 +++ b/src/network/networkd-sysctl.c
 @@ -2,7 +2,7 @@
@@ -525,8 +479,8 @@ index 2b226b2e2a..f12a474e2f 100644
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
 =20
+ #include "af-list.h"
  #include "missing_network.h"
- #include "networkd-link.h"
 diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
 index 3d1da515c0..3fca9a4faf 100644
 --- a/src/shared/linux/ethtool.h
@@ -542,7 +496,7 @@ index 3d1da515c0..3fca9a4faf 100644
  #include <limits.h> /* for INT_MAX */
 =20
 diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
-index f56c5646c1..5af28ff119 100644
+index 8adc2c89c8..1977e28d7f 100644
 --- a/src/shared/netif-util.c
 +++ b/src/shared/netif-util.c
 @@ -1,7 +1,7 @@
@@ -555,10 +509,10 @@ index f56c5646c1..5af28ff119 100644
  #include "arphrd-util.h"
  #include "device-util.h"
 diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
-index f528a46b8e..830318cda5 100644
+index 384a1f31cb..c94bb70afb 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
-@@ -18,7 +18,7 @@
+@@ -19,7 +19,7 @@
  #include <stdarg.h>
  #include <unistd.h>
  #include <linux/if.h>
@@ -567,3 +521,6 @@ index f528a46b8e..830318cda5 100644
  #include <linux/netdevice.h>
  #include <linux/pci_regs.h>
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerr=
or-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd=
/0020-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
similarity index 87%
rename from meta/recipes-core/systemd/systemd/0018-test-bus-error-strerro=
r-is-assumed-to-be-GNU-specifi.patch
rename to meta/recipes-core/systemd/systemd/0020-test-bus-error-strerror-=
is-assumed-to-be-GNU-specifi.patch
index 67388e6807..b3fbfee08d 100644
--- a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0020-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
@@ -1,8 +1,8 @@
-From 20dfb0b5e7113c2e7f82c01488b419dffe8714ab Mon Sep 17 00:00:00 2001
+From e01f0c444423eb65d176713735ff8cefb3068f3d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
-Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specifi=
c
- version mark it so
+Subject: [PATCH 20/27] test-bus-error: strerror() is assumed to be GNU
+ specific version mark it so
=20
 Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
=20
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-bus/test-bus-error.c b/src/libsystemd/sd-=
bus/test-bus-error.c
-index a55f3f9856..4123bf3da0 100644
+index 91045c06c2..a06b9bac0c 100644
 --- a/src/libsystemd/sd-bus/test-bus-error.c
 +++ b/src/libsystemd/sd-bus/test-bus-error.c
 @@ -99,7 +99,9 @@ TEST(error) {
@@ -27,7 +27,7 @@ index a55f3f9856..4123bf3da0 100644
          assert_se(sd_bus_error_get_errno(&error) =3D=3D EBUSY);
          assert_se(sd_bus_error_is_set(&error));
 diff --git a/src/test/test-errno-util.c b/src/test/test-errno-util.c
-index 376d532281..967cfd4d67 100644
+index ab463bd1b3..e2ebcaaf33 100644
 --- a/src/test/test-errno-util.c
 +++ b/src/test/test-errno-util.c
 @@ -4,7 +4,7 @@
@@ -47,3 +47,6 @@ index 376d532281..967cfd4d67 100644
 =20
  TEST(PROTECT_ERRNO) {
          errno =3D 12;
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0021-errn=
o-util-Make-STRERROR-portable-for-musl.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERR=
OR-portable-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0021-errno-util-Make-STRERROR=
-portable-for-musl.patch
index 36d468959a..6e899d0905 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-por=
table-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-errno-util-Make-STRERROR-por=
table-for-musl.patch
@@ -1,7 +1,7 @@
-From 32371040c2aa649e23c3b0f2c5ee27995a16526a Mon Sep 17 00:00:00 2001
+From d2f632dd6a8cca0fbdd6568ce84004335c004f58 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH] errno-util: Make STRERROR portable for musl
+Subject: [PATCH 21/27] errno-util: Make STRERROR portable for musl
=20
 Sadly, systemd has decided to use yet another GNU extention in a macro
 lets make this such that we can use XSI compliant strerror_r() for
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 2 deletions(-)
=20
 diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
-index 27804e6382..274c1c6ef1 100644
+index 48b76e4bf7..6e7653e2d9 100644
 --- a/src/basic/errno-util.h
 +++ b/src/basic/errno-util.h
 @@ -15,8 +15,16 @@
@@ -37,3 +37,6 @@ index 27804e6382..274c1c6ef1 100644
  /* A helper to print an error message or message for functions that ret=
urn 0 on EOF.
   * Note that we can't use ({ =E2=80=A6 }) to define a temporary variabl=
e, so errnum is
   * evaluated twice. */
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_=
trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0022-=
sd-event-Make-malloc_trim-conditional-on-glibc.patch
similarity index 76%
rename from meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_t=
rim-conditional-on-glibc.patch
rename to meta/recipes-core/systemd/systemd/0022-sd-event-Make-malloc_tri=
m-conditional-on-glibc.patch
index f860b5f542..ed7e3ea586 100644
--- a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0022-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
@@ -1,7 +1,7 @@
-From 751fb8c9a05115f5329cfa25e69afe7657124c20 Mon Sep 17 00:00:00 2001
+From 4a3ed5aaaf108d3a07f24997698906e801ba2412 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
-Subject: [PATCH] sd-event: Make malloc_trim() conditional on glibc
+Subject: [PATCH 22/27] sd-event: Make malloc_trim() conditional on glibc
=20
 musl does not have this API
=20
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
-index b6899df192..0c03287004 100644
+index a1305ef014..b8a73da2a3 100644
 --- a/src/libsystemd/sd-event/sd-event.c
 +++ b/src/libsystemd/sd-event/sd-event.c
-@@ -1874,7 +1874,7 @@ _public_ int sd_event_add_exit(
+@@ -1877,7 +1877,7 @@ _public_ int sd_event_add_exit(
  }
 =20
  _public_ int sd_event_trim_memory(void) {
@@ -24,7 +24,7 @@ index b6899df192..0c03287004 100644
 =20
          /* A default implementation of a memory pressure callback. Simp=
ly releases our own allocation caches
           * and glibc's. This is automatically used when people call sd_=
event_add_memory_pressure() with a
-@@ -1888,7 +1888,9 @@ _public_ int sd_event_trim_memory(void) {
+@@ -1891,7 +1891,9 @@ _public_ int sd_event_trim_memory(void) {
 =20
          usec_t before_timestamp =3D now(CLOCK_MONOTONIC);
          hashmap_trim_pools();
@@ -34,3 +34,6 @@ index b6899df192..0c03287004 100644
          usec_t after_timestamp =3D now(CLOCK_MONOTONIC);
 =20
          if (r > 0)
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-mal=
loc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0023-shared-Do=
-not-use-malloc_info-on-musl.patch
similarity index 86%
rename from meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-mall=
oc_info-on-musl.patch
rename to meta/recipes-core/systemd/systemd/0023-shared-Do-not-use-malloc=
_info-on-musl.patch
index ece9873bbc..b8583c7af7 100644
--- a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_inf=
o-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0023-shared-Do-not-use-malloc_inf=
o-on-musl.patch
@@ -1,7 +1,7 @@
-From 4fe2a8b1aab7297beac50f6ce46f3df4169de218 Mon Sep 17 00:00:00 2001
+From d3880d167d8dfafbb8ee62f7737a869f9525f303 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
-Subject: [PATCH] shared: Do not use malloc_info on musl
+Subject: [PATCH 23/27] shared: Do not use malloc_info on musl
=20
 Upstream-Status: Inappropriate [musl-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
=20
 diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 74f148c8b4..2d862a123d 100644
+index 30f9602b1e..5308f168db 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
-@@ -611,15 +611,16 @@ static int method_dump_memory_state_by_fd(sd_bus_m=
essage *message, void *userdat
+@@ -755,15 +755,16 @@ static int method_dump_memory_state_by_fd(sd_bus_m=
essage *message, void *userdat
          _cleanup_close_ int fd =3D -EBADF;
          size_t dump_size;
          FILE *f;
@@ -52,3 +52,6 @@ index 8e70e365dd..9e782caec9 100644
                  (void) memstream_dump(LOG_INFO, &m);
                  break;
          }
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX=
-declaration.patch b/meta/recipes-core/systemd/systemd/0024-avoid-missing=
-LOCK_EX-declaration.patch
similarity index 62%
rename from meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-=
declaration.patch
rename to meta/recipes-core/systemd/systemd/0024-avoid-missing-LOCK_EX-de=
claration.patch
index f517392e58..6804c7c62e 100644
--- a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declar=
ation.patch
+++ b/meta/recipes-core/systemd/systemd/0024-avoid-missing-LOCK_EX-declar=
ation.patch
@@ -1,7 +1,7 @@
-From 97d3ed7834bd86615ba4acdbef984c677b7e7791 Mon Sep 17 00:00:00 2001
+From ca2a736627f8ee8dd9dbbf5b3149d4c8493833ff Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
-Subject: [PATCH] avoid missing LOCK_EX declaration
+Subject: [PATCH 24/27] avoid missing LOCK_EX declaration
=20
 This only happens on MUSL. Include sys/file.h to avoid compilation
 error about missing LOCK_EX declaration.
@@ -10,12 +10,25 @@ Upstream-Status: Inappropriate [musl specific]
=20
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
+ src/basic/fd-util.h    | 1 +
  src/core/exec-invoke.c | 1 +
  src/shared/dev-setup.h | 1 +
- 2 files changed, 2 insertions(+)
+ 3 files changed, 3 insertions(+)
=20
+diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
+index af17481dd8..fa20bfa30f 100644
+--- a/src/basic/fd-util.h
++++ b/src/basic/fd-util.h
+@@ -6,6 +6,7 @@
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <sys/socket.h>
++#include <sys/file.h>
+=20
+ #include "macro.h"
+ #include "missing_fcntl.h"
 diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index fe14ceeb31..521e7b87ff 100644
+index ee8db04e76..2aff654f0f 100644
 --- a/src/core/exec-invoke.c
 +++ b/src/core/exec-invoke.c
 @@ -4,6 +4,7 @@
@@ -38,3 +51,6 @@ index 5339bc4e5e..0697495f23 100644
 =20
  int lock_dev_console(void);
 =20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0025-include-signal.h-to-a=
void-the-undeclared-error.patch b/meta/recipes-core/systemd/systemd/0025-=
include-signal.h-to-avoid-the-undeclared-error.patch
new file mode 100644
index 0000000000..5cfb112d67
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-include-signal.h-to-avoid-th=
e-undeclared-error.patch
@@ -0,0 +1,27 @@
+From ecf124ab2e488a71741fe443ff4863f7ed172968 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 2 Jul 2024 22:18:47 -0700
+Subject: [PATCH 25/27] include signal.h to avoid the 'undeclared' error
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/pidref.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/pidref.h b/src/basic/pidref.h
+index 9920ebb9b3..2fdd4ff50f 100644
+--- a/src/basic/pidref.h
++++ b/src/basic/pidref.h
+@@ -1,6 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ #pragma once
+=20
++#include <signal.h>
+ #include "macro.h"
+=20
+ /* An embeddable structure carrying a reference to a process. Supposed =
to be used when tracking processes continuously. */
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0026-undef-stdin-for-refer=
ences-using-stdin-as-a-struct-m.patch b/meta/recipes-core/systemd/systemd=
/0026-undef-stdin-for-references-using-stdin-as-a-struct-m.patch
new file mode 100644
index 0000000000..ca1a525a0a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0026-undef-stdin-for-references-u=
sing-stdin-as-a-struct-m.patch
@@ -0,0 +1,48 @@
+From 787606c6ff822fb3fe41ba951ee289bbf6d4def3 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 2 Jul 2024 22:44:31 -0700
+Subject: [PATCH 26/27] undef stdin for references using stdin as a struc=
t
+ member
+
+In musl stdio.h, we have:
+include/stdio.h:#define stdin  (stdin)
+
+This causes error when a struct member is also named stdin. undef it.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/shared/edit-util.c         | 2 ++
+ src/systemctl/systemctl-edit.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
+index cfb2828f4e..1794a7b269 100644
+--- a/src/shared/edit-util.c
++++ b/src/shared/edit-util.c
+@@ -3,6 +3,8 @@
+ #include <errno.h>
+ #include <stdio.h>
+=20
++#undef stdin
++
+ #include "alloc-util.h"
+ #include "copy.h"
+ #include "edit-util.h"
+diff --git a/src/systemctl/systemctl-edit.c b/src/systemctl/systemctl-ed=
it.c
+index 15398f8364..e7d53ca9a1 100644
+--- a/src/systemctl/systemctl-edit.c
++++ b/src/systemctl/systemctl-edit.c
+@@ -13,6 +13,8 @@
+ #include "systemctl.h"
+ #include "terminal-util.h"
+=20
++#undef stdin
++
+ int verb_cat(int argc, char *argv[], void *userdata) {
+         _cleanup_hashmap_free_ Hashmap *cached_id_map =3D NULL, *cached=
_name_map =3D NULL;
+         _cleanup_(lookup_paths_done) LookupPaths lp =3D {};
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0027-adjust-header-inclusi=
on-order-to-avoid-redeclaration.patch b/meta/recipes-core/systemd/systemd=
/0027-adjust-header-inclusion-order-to-avoid-redeclaration.patch
new file mode 100644
index 0000000000..1be075d606
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0027-adjust-header-inclusion-orde=
r-to-avoid-redeclaration.patch
@@ -0,0 +1,76 @@
+From cf94d43572770007f95b832f477aa5a03624a1e5 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 2 Jul 2024 23:23:57 -0700
+Subject: [PATCH 27/27] adjust header inclusion order to avoid redeclarat=
ion
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/network/netdev/wireguard.c    | 2 +-
+ src/network/networkd-bridge-mdb.c | 3 ++-
+ src/network/networkd-route.c      | 6 +++---
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
+index 94b659fd23..a78ad5762d 100644
+--- a/src/network/netdev/wireguard.c
++++ b/src/network/netdev/wireguard.c
+@@ -5,9 +5,9 @@
+=20
+ /* Make sure the net/if.h header is included before any linux/ one */
+ #include <net/if.h>
++#include <netinet/in.h>
+ //#include <linux/if_arp.h>
+ #include <linux/ipv6_route.h>
+-#include <netinet/in.h>
+ #include <sys/ioctl.h>
+=20
+ #include "sd-resolve.h"
+diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-br=
idge-mdb.c
+index 7ff4a18846..fe1a9cf888 100644
+--- a/src/network/networkd-bridge-mdb.c
++++ b/src/network/networkd-bridge-mdb.c
+@@ -2,7 +2,6 @@
+=20
+ /* Make sure the net/if.h header is included before any linux/ one */
+ #include <net/if.h>
+-#include <linux/if_bridge.h>
+=20
+ #include "netlink-util.h"
+ #include "networkd-bridge-mdb.h"
+@@ -13,6 +12,8 @@
+ #include "string-util.h"
+ #include "vlan-util.h"
+=20
++#include <linux/if_bridge.h>
++
+ #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
+=20
+ /* remove MDB entry. */
+diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
+index d596fd81e6..0dc0d2a7a3 100644
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -1,8 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+=20
+-#include <linux/ipv6_route.h>
+-#include <linux/nexthop.h>
+-
+ #include "alloc-util.h"
+ #include "event-util.h"
+ #include "netlink-util.h"
+@@ -20,6 +17,9 @@
+ #include "vrf.h"
+ #include "wireguard.h"
+=20
++#include <linux/ipv6_route.h>
++#include <linux/nexthop.h>
++
+ static Route* route_detach_impl(Route *route) {
+         assert(route);
+         assert(!!route->network + !!route->manager + !!route->wireguard=
 <=3D 1);
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd/0028-build-path.c-avoid-bo=
ot-time-segfault-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-=
build-path.c-avoid-boot-time-segfault-for-musl.patch
new file mode 100644
index 0000000000..501728cbc8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0028-build-path.c-avoid-boot-time=
-segfault-for-musl.patch
@@ -0,0 +1,31 @@
+From 0e4379088b1cf607b605b785f6f23943ebeb6584 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 3 Jul 2024 07:18:42 -0700
+Subject: [PATCH 28/28] build-path.c: avoid boot time segfault for musl
+
+This function, at runtime, should return -ENOEXEC. For musl, it
+somehow segfaults. I think it's related to getauxval, but it's
+really does not matter, just return -ENOEXEC.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/build-path.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/build-path.c b/src/basic/build-path.c
+index b5972658df..4ef551034e 100644
+--- a/src/basic/build-path.c
++++ b/src/basic/build-path.c
+@@ -151,6 +151,7 @@ int get_build_exec_dir(char **ret) {
+          */
+=20
+         static int runpath_cached =3D -ERRNO_MAX-1;
++        return -ENOEXEC;
+         if (runpath_cached =3D=3D -ERRNO_MAX-1) {
+                 const char *runpath =3D NULL;
+=20
+--=20
+2.45.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-co=
re/systemd/systemd_256.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd_255.6.bb
rename to meta/recipes-core/systemd/systemd_256.bb
index 0376412f61..9bd59ef39f 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_256.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "intltool-native gperf-native libcap util-lin=
ux python3-jinja2-native"
=20
 SECTION =3D "base/shell"
=20
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es qemu systemd gettext bash-completion manpages features_check
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es qemu systemd gettext bash-completion manpages features_check mime
=20
 # unmerged-usr support is deprecated upstream, taints the system and wil=
l be
 # removed in the near future. Fail the build if it is not enabled.
@@ -26,36 +26,39 @@ SRC_URI +=3D " \
            file://init \
            file://99-default.preset \
            file://systemd-pager.sh \
-           file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
-           file://0008-implment-systemd-sysv-install-for-OE.patch \
-           file://0023-meson-bpf-propagate-sysroot-for-cross-compilation=
.patch \
+           file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
+           file://0002-implment-systemd-sysv-install-for-OE.patch \
+           file://0003-meson-bpf-propagate-sysroot-for-cross-compilation=
.patch \
            "
=20
 # patches needed by musl
 SRC_URI:append:libc-musl =3D " ${SRC_URI_MUSL}"
 SRC_URI_MUSL =3D "\
-               file://0001-missing_type.h-add-comparison_fn_t.patch \
-               file://0002-add-fallback-parse_printf_format-implementati=
on.patch \
-               file://0003-src-basic-missing.h-check-for-missing-strndup=
a.patch \
-               file://0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
-               file://0005-add-missing-FTW_-macros-for-musl.patch \
-               file://0006-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facces=
sat.patch \
-               file://0008-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
-               file://0009-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
-               file://0010-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
-               file://0011-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
-               file://0012-do-not-disable-buffer-in-writing-files.patch =
\
-               file://0013-Handle-__cpu_mask-usage.patch \
-               file://0014-Handle-missing-gshadow.patch \
-               file://0015-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
-               file://0016-pass-correct-parameters-to-getdents64.patch \
-               file://0017-Adjust-for-musl-headers.patch \
-               file://0018-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
-               file://0019-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
-               file://0020-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
-               file://0021-shared-Do-not-use-malloc_info-on-musl.patch \
-               file://0022-avoid-missing-LOCK_EX-declaration.patch \
+               file://0004-missing_type.h-add-comparison_fn_t.patch \
+               file://0005-add-fallback-parse_printf_format-implementati=
on.patch \
+               file://0006-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
+               file://0007-add-missing-FTW_-macros-for-musl.patch \
+               file://0008-Use-uintmax_t-for-handling-rlim_t.patch \
+               file://0009-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facces=
sat.patch \
+               file://0010-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
+               file://0011-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
+               file://0012-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
+               file://0013-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
+               file://0014-do-not-disable-buffer-in-writing-files.patch =
\
+               file://0015-Handle-__cpu_mask-usage.patch \
+               file://0016-Handle-missing-gshadow.patch \
+               file://0017-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
+               file://0018-pass-correct-parameters-to-getdents64.patch \
+               file://0019-Adjust-for-musl-headers.patch \
+               file://0020-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
+               file://0021-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
+               file://0022-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
+               file://0023-shared-Do-not-use-malloc_info-on-musl.patch \
+               file://0024-avoid-missing-LOCK_EX-declaration.patch \
+               file://0025-include-signal.h-to-avoid-the-undeclared-erro=
r.patch \
+               file://0026-undef-stdin-for-references-using-stdin-as-a-s=
truct-m.patch \
+               file://0027-adjust-header-inclusion-order-to-avoid-redecl=
aration.patch \
+               file://0028-build-path.c-avoid-boot-time-segfault-for-mus=
l.patch \
                "
=20
 PAM_PLUGINS =3D " \
@@ -73,7 +76,6 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-s=
hared', d)} \
     backlight \
     binfmt \
-    cgroupv2 \
     gshadow \
     hibernate \
     hostnamed \
@@ -135,7 +137,6 @@ PACKAGECONFIG[backlight] =3D "-Dbacklight=3Dtrue,-Dba=
cklight=3Dfalse"
 PACKAGECONFIG[binfmt] =3D "-Dbinfmt=3Dtrue,-Dbinfmt=3Dfalse"
 PACKAGECONFIG[bpf-framework] =3D "-Dbpf-framework=3Dtrue,-Dbpf-framework=
=3Dfalse,clang-native bpftool-native libbpf,libbpf"
 PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Dtrue,-Dbzip2=3Dfalse,bzip2"
-PACKAGECONFIG[cgroupv2] =3D "-Ddefault-hierarchy=3Dunified,-Ddefault-hie=
rarchy=3Dhybrid"
 PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredump=3Dfalse"
 PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetup=3D=
false,cryptsetup,,cryptsetup"
 PACKAGECONFIG[cryptsetup-plugins] =3D "-Dlibcryptsetup-plugins=3Dtrue,-D=
libcryptsetup-plugins=3Dfalse,cryptsetup,,cryptsetup"
@@ -166,7 +167,7 @@ PACKAGECONFIG[importd] =3D "-Dimportd=3Dtrue,-Dimport=
d=3Dfalse,glib-2.0"
 PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Dtrue,-Dlibiptc=3Dfalse,iptables"
 PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Dtrue,-Dlibcurl=3Dfalse,cu=
rl"
-PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,kmod"
+PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,kmod,libkmod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldcon=
fig"
 PACKAGECONFIG[libidn] =3D "-Dlibidn=3Dtrue,-Dlibidn=3Dfalse,libidn,,libi=
dn"
 PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Dtrue,-Dlibidn2=3Dfalse,libidn2,,=
libidn2"
@@ -677,6 +678,8 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${sysconfdir}/init.d/README \
                 ${sysconfdir}/resolv-conf.systemd \
                 ${sysconfdir}/X11/xinit/xinitrc.d/* \
+                ${sysconfdir}/ssh/ssh_config.d/20-systemd-ssh-proxy.conf=
 \
+                ${sysconfdir}/ssh/sshd_config.d/20-systemd-userdb.conf \
                 ${rootlibexecdir}/systemd/* \
                 ${rootlibdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
@@ -717,6 +720,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.portable1.con=
f \
                 ${datadir}/dbus-1/system.d/org.freedesktop.oom1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.home1.conf \
+                ${datadir}/mime/packages/io.systemd.xml \
                "
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
--=20
2.25.1


