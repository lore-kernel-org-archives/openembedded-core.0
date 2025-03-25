Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36429C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 17:51:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.27])
 by mx.groups.io with SMTP id smtpd.web10.2211.1742925064959073237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 10:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DBDFTnp8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DBDFTnp8;
 spf=pass (domain: arm.com, ip: 52.101.67.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R5RpyO1svcWMEMHooGdGyuhJGhm/26+f6YSENY4WDhcjzyUvWS+WytCDB/IlmANQ3zgRPwxbgVCVvV/1ivnZNQa63ragFCNAcdOgLHaU0HHy0RE8f0L1rWWUn8mDCPzs8g2VFZ3Bn3HZkb0ZTjauzbdY55wB9WAS0kkPwZjziQqh3BoBukXhd5I3HsMik9X1Fn4N/9fW9KQHVpuh8iRV/mNqARPEBxZAM1Q5BwivVEBAWSLqSF9c396hxK+qC/8zDFuWUpPmSPAHvUrsOu1U3erT7s23AtrcmJE45v5Z6XiCP29A/v3FysUaICuwo4685L50Q6uDy7xld7RoMMEdJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzhbxGXY5wakUzdMMfrLAycuvGG3JeKrlUotfmBI4vk=;
 b=nR1jaYSlNRDwkt1ZYSNNBFLgipGCTNRYB1AAqUZtsoERYR+V0lCvPZqPK8moqXopp6+s+EuiqE7Ybf/KMKzi9zSJLuL+O3gvWjJTEFZUJZTdK+xuy6pMbi687pGaOj10XSdpuNu/yPcxMGnn/44x9itU29h95decSnY1Njm46V5/xSwhtQodMuyuF9Mg4jdCP3NnaNmEtWAweougqBSPUrqvMfp1uiP+j6VyiFmzrD54xYGxTIj+tI/uzAnx9xhh+GWhMGI1pJs5DicBFRvh9DFxQEYYsIbgLqXHtNRA5FxWG2O5ATmFCk3OAZTah0Mf6u1D28Erq1nOwO+t0ptjOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzhbxGXY5wakUzdMMfrLAycuvGG3JeKrlUotfmBI4vk=;
 b=DBDFTnp8XPfpA4kUZXYgXcqZIAmPPJzjkuRjYNfsL4hKRnzwxmQEnBazTJg/AaZxCkCGEem1A4T19ffle1+tDnZn1CpLeKULXt4bwIS2ycxNvICgM0yVxLM6pmrwyFGLgaZ4PWAprc9gTiOfaaq1ktJ8289yJ7qMt6w9ed1Frh8=
Received: from CWLP123CA0055.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::19)
 by GVXPR08MB10638.eurprd08.prod.outlook.com (2603:10a6:150:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:51:00 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:401:59:cafe::5f) by CWLP123CA0055.outlook.office365.com
 (2603:10a6:401:59::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 17:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 25 Mar 2025 17:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyOmAqhhPjXKmm9M+RiABumPYha7JMfCQnUc/cCsxSO4yLnXXan+TCV3AbclPgo+arTmuu6vr8lnwa/+RJU5XDmYYBuno6n2FW4ah+lk9O6Z5qJVr790R2vMZEnGAfCk1/3AAT6cgeOMHWVS2s+dbDRvRTcRQT7W4u6/faVJ+WQdfsDZUF7FdMmjOhsGprgeF0cAiVJnaa46I1UaTi9i+6c092RGlpyfWJzHsO/rL1VUew7sZj09eiWKh9hrYmBaU8vt5/KXOlcJvi231f1nN2w4ZZBmdzxHBzaTNem8cQxr9laujl214j+yIvAum0hegq2mhofYN9I306tmoOF2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzhbxGXY5wakUzdMMfrLAycuvGG3JeKrlUotfmBI4vk=;
 b=o9P60ASiLuL/KYsqpu18v5xi71whY3AJ3+ReUGd/OwIVRarXIOVX+6yFi7gUXJI46cHktjypWAff1zmx1/vwSMxDs5ZwXwv9sfALksma7uB22cHs+imoq4Ne/ZbGvzlsyuqpbjRKqLH8Kv66q+JRLaCSVCdsinLVCqN5g9icO5TyCnTLtnyH3eNGJVJeBx9QuD8zw3dSWwmyMMbKF57qf9Dyi/b35ctw1bi4QTD30xgLh0TQT3Nz6ao+DnJtC8j5IToIQGTKP0meBq0JnxOoaH8+Uj000PYqKNt5TfuyoDQs47rU+ENaM0XoBqeLIoB6GxwUps5U1qIbLAaWimC2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzhbxGXY5wakUzdMMfrLAycuvGG3JeKrlUotfmBI4vk=;
 b=DBDFTnp8XPfpA4kUZXYgXcqZIAmPPJzjkuRjYNfsL4hKRnzwxmQEnBazTJg/AaZxCkCGEem1A4T19ffle1+tDnZn1CpLeKULXt4bwIS2ycxNvICgM0yVxLM6pmrwyFGLgaZ4PWAprc9gTiOfaaq1ktJ8289yJ7qMt6w9ed1Frh8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5755.eurprd08.prod.outlook.com (2603:10a6:102:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:50:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 17:50:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V2] systemd: do not delete
 systemd-getty-generator
Thread-Topic: [OE-core][PATCH V2] systemd: do not delete
 systemd-getty-generator
Thread-Index: AQHbmJnT++ruDKH9gU6V3fZpLuhDR7OEK4cA
Date: Tue, 25 Mar 2025 17:50:27 +0000
Message-ID: <D766D201-766B-42FE-9474-9D09522C00D5@arm.com>
References: <20250319064016.1119702-1-Qi.Chen@windriver.com>
In-Reply-To: <20250319064016.1119702-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5755:EE_|AMS1EPF00000041:EE_|GVXPR08MB10638:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a65a135-85ac-45b5-172d-08dd6bc59a19
x-checkrecipientrouted: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bXMwQkZlaDBCZFptNW00SVVtWWxscTJHbUUyNWhBcnFFRjdScHE5R0NkcTc4?=
 =?utf-8?B?WGdEbk1XRmpxbEtGeHN3Q1gvMGphd2t1SUpPRTB4cmFSaWx1OTgyYmlPcG5J?=
 =?utf-8?B?UWhGVGZLcWQxbjRrQUxhaTF1KzdzT2RZN0dDdWp3NGpsQnc1bjZZdE9uaWVE?=
 =?utf-8?B?OVFBNld0b2lKMFArOUdvZTRTUTcxcmZWaS9oL2NpZGc3N0RWamttUlR4RWVs?=
 =?utf-8?B?SFVaWDIzK0lBc29FTDlZdy9DMjZqbkR3WjBMZHQrYmFzYktUcmJtL3k3UXVy?=
 =?utf-8?B?Tks1OThibFhoajZqY3VIb090RDVFb05HdXkweW9ISW1oRTdtcExTeG9pSmVw?=
 =?utf-8?B?WHlEUFNNcm93TTVscmRPcUJmUFFiaUc0RStiN3dRTUVCZlpjQm9lYmpZYmJ2?=
 =?utf-8?B?eU54R2JFK3o3ZTZ4QjQ4Q28wL09GRGZZZTNBV2FrQytkT0x4ODAzTExHMmda?=
 =?utf-8?B?ZktKeE9JTGtoQ2oxR0EwNjBMblF5bGRMOWZlQTdUUDRJOUFTTVVmQnkxNDRO?=
 =?utf-8?B?VmpFend5YzdqOGxiSXU3cXY3SllweVMxalVNNEYxNFYydmZPaXFra1FxcHJJ?=
 =?utf-8?B?UHRtd0M0azNUcVN2ZWVXdHJmWURPZlUyMmhEWjNtamxUZ25XZFhOd05RRmpW?=
 =?utf-8?B?WFNTM29lbThTVDZIK2daT3RoWTJoQ09XdU5KMkEycUVQeTZDKzczMWhOcFNZ?=
 =?utf-8?B?SkgzblYzS1hpR2N0MzZaMVphek9xYzdOa2lXNXJ5Zk5CVXNtRkxrT0hCeFE4?=
 =?utf-8?B?SksyYm5UNWptWWc2WEd1UlFuWmpLVUY4bFlCKzdJQm9Zdld0SGI3UTJpUzR0?=
 =?utf-8?B?TzNSdUhSNkhiQm1ISXpQVWo3UGpaaGZHVk5QcTZUT3FiYmM1dTJ5dXh6Ym5H?=
 =?utf-8?B?L1ZEdUhFTEpkUmluTkFOdnkwSnV0eURBWWdmM3ArL2NvMGRhNXdNZ0JpMGYy?=
 =?utf-8?B?U25EQ00wYStibzU4eTEzOTN5STk2Y25CVS81SVA5QmRTSlBwVWx6cWNneTUy?=
 =?utf-8?B?YnJRK2g5ektZZTA5WG94akRXUTEza3dCbVNha1BjNUk5Y3dhemN5TzVhNksy?=
 =?utf-8?B?REQzdll0WnNDOG1oeFN0cEdLb2k1SkczcGowT2VzcnZQejAzaGRXK3ZZZjdB?=
 =?utf-8?B?TWtsZ3ZXaXZCSlQxSGU2UUZnYUpwdkl1L0x1b29UVXBFMDVSeUdxT1hkckJW?=
 =?utf-8?B?OGhZeDlveGRzS0lGU0VZTkNxSVM2Q1Z2cXo5VEtUVUwrMGxCUGMrc3BGME0z?=
 =?utf-8?B?a3d3a2VLMHUveHU1ek80c0xSOEhYa2FXRkovdjZtbE5CSnJGNjEzM3EyZzhW?=
 =?utf-8?B?R0dFbWpvVXpXTWJTdzhWeWJaYlFPdlAzSnpxc1BmNXBmSnpaSjdMdVcrbk5r?=
 =?utf-8?B?U0VMeDR3aHdhOFZpSzFPVmp2N2V4Z1VFQ3FaalNuOFNENUVDeWdOSmhVKzc4?=
 =?utf-8?B?NkZ1Mm5VbUNCNjBQSzRSL3B3bE8yVWNkaHVKUXp4ME9xSTUzU3o4UkVlWkdR?=
 =?utf-8?B?Sk1TaVBJWllaYWNkQklDbzcvazFCZTdWSWs5aHJzMndzYlNhOGxxb0RMQk1R?=
 =?utf-8?B?V0dPK3NjcjNDNTh5aU9ZS1E0Q201VWVqWHFLQU45TFVXNlZvcGtmQTBmYnhy?=
 =?utf-8?B?TnVHcjVUVU4xbmRkVFlIVk92QUFwSU9Pb3llRDUxYk5zZHRjZGdSR1ZOaTJW?=
 =?utf-8?B?aHRZQWJEUU9ROFhoS01pNzFCMnFiZVFHQXhzT2JFQWNxUElLTGZnSVJiVStH?=
 =?utf-8?B?VUdjaFB3T0NiTW05c3RZR0Y0VjhYaXhkZFhOaVRudUtvbkY5UU9rSmJLblY0?=
 =?utf-8?B?QVgrK000Z254S1JKRGVGMXFza3NuY0xrRVBFeWtVZXQ0VkxLU2ZFZm9UUEtS?=
 =?utf-8?B?bHJMT2xsODZCZTF3RFdzeHY3M3dQOTRRSmptV01WVkhublpXSEw5RnJQN2Vr?=
 =?utf-8?Q?rF1DmdI0zMXY6k9oa8Th8d6Z0AspBkvm?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <58647395B2FF9F4DBC2BE49A5C8D1C31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5755
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d11e3e72-f5b7-4d4e-21df-08dd6bc586ed
NoDisclaimer: true
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bE95VjlUcUFMV1p0L0xteU5KMGVsM2twcHl3dU1tTzAwYUhQc0QyYlZLVC9D?=
 =?utf-8?B?dGVqaC9yVXN1M2E2MWpCN1dxSHJXLzUrc09TVmx1NHVuSGhrZjZFaTArOEZI?=
 =?utf-8?B?RDJEUzJaSUh5cTVQMFFrV1IrSUF5MVlzWURGR0dmVHZBUzlzeUZYbzJWcndP?=
 =?utf-8?B?U3pJU1NQK2pab2pkMXlyejhzbndvQUZqTWVoeVVXU0s2NCtyWnFxUTRnb3Qy?=
 =?utf-8?B?WHhBZk14OWJpeEkwZExOSnc5bVE1WVFlMVlKWmRrWnpVY1ZzYzNQTlJLQ0U1?=
 =?utf-8?B?d3NOQnR0WmRLM3pBOHBNZmJCSFY5d1I0dTA2SlQ0RSswbE9KNjI1emtEVERU?=
 =?utf-8?B?SDhadEgzN2dmUVVxV2NTb3NCYzhEUkVxRGMwTXJySSs1ZCtDZytvSW4rd1JU?=
 =?utf-8?B?ZzgxSmhxZ1FFeS8wbDdlVnZjUEYyU21rUjJIcmhBMlFORjMyRy9tc0ZYTmRM?=
 =?utf-8?B?WUFMc0crclc5V1hLRWQrbW8zS1NXeDRTdEg3Wm1LdUpmTWlXUU55WVJValQ4?=
 =?utf-8?B?eUNZZVNLVGtNWWVldUsrODZTdWZYN016R01YQVlMSTdRT1NEWk54TnNndFpL?=
 =?utf-8?B?bEt1SkZ4Q3FVQzFwcGpnUlp4a2U5ajRWWFJLVVVHeEc5RFE3Mmk4WWdrcG8w?=
 =?utf-8?B?Z0Q1VmxvTGFkcnREblZMMjBEbDIyNEI1SGxkb3huQlJqOVVWSEVtQU5IM1J4?=
 =?utf-8?B?MVROVDJNQXBRcUFOdlFaMXdCSVRxVmwwV0pBcXcrS2ZUcG5kcGlwYnFwUURQ?=
 =?utf-8?B?bVdCZWNNeE9JeTJ3amZVTzB2dURsdHNBRTc4R3VmWFF1RllmSEdrdTcyTEF5?=
 =?utf-8?B?SkV0eTJrWnhZQWpJYU9uRm9XL00rVkZuRmoyRFNvQ2F3cU51VDREa0hZbUpv?=
 =?utf-8?B?NllYYVdDbkhSdVhrQlozT3IzVWJ3cVFtWUJ1eUdNNWUzMmg1MUF5OEpwQ3Fw?=
 =?utf-8?B?eGFqYUFJQkNJb0l6SEJ0bFhLQjM3TUczcGVBb1FoTnplQXU3MVJzYlNkdVcx?=
 =?utf-8?B?dHJFWmJSbnVPRUlwMHhtdThFaEkzQ2R1azlGKzJ6ODRDRWQxNXJtdzIvYWMy?=
 =?utf-8?B?eE5UOElhWWhiclBCZ0UyaUZSZkxNeUNzWTRJL1ZqMGJCWTgyaXl0RHh4Y1Iz?=
 =?utf-8?B?YWozbGdJK2pQODFndGx3blNDNFNOQjdTcUczVnQxM3B5SlFvenJObWIzNHBy?=
 =?utf-8?B?V25PZVFadkhmTlZVOXFjODg2RC95R1QyQTRFbTg3bjRUZlFqZlBQNEprSVZi?=
 =?utf-8?B?T3Bpc0ZVSTFvRnFOWXRTK3g3Rzh5NmJ1ekNYS2pJdFQwd2RDeU9qN2ZoTy9o?=
 =?utf-8?B?S09YK0UraGRhZHIvdkFueEZ0Q2Ewd0Z1MFVlU25FSlZ5UXY1YmRTa1dOUUVh?=
 =?utf-8?B?YklwMWF4a2NNbE9nRE54Zlh5dTlETEV6NWRQN0hoMnlRQ3V5MEc0dG1DOEpt?=
 =?utf-8?B?WWgrNVI4cVhZY05icnpDS2ZwQ3ZlUjFFMXVlNjVRTDFKTVBJVFM0d0lDSlFB?=
 =?utf-8?B?cmF6TVZZVVIwWXVubldyVHlGcFU1Mk1jdjVBR0srQklaTmVqUTRwSE5md2Z1?=
 =?utf-8?B?bG8vbFcyemNZdUtOdC9WTUtIUTFYbC8zUkxjQzFhd3BIZDQ2d2xUblR4b0NS?=
 =?utf-8?B?MEVkbGNSYWUwQWx4bkRUVVByTmw5ZlVORjJvNHJPbk9XeTY4eWZMUG5VN0Ey?=
 =?utf-8?B?VVZYMHowTGN2bnpMZmZWd0tWY3FTVVg2aWxwRnpxenNGSnVWOVozZW5ZNW9B?=
 =?utf-8?B?ZkdTRndOaUdMUHBnRXVKa1FYN0xOYmRENVFtbmxhM2Zkc3lmRWJmeHV3QXVY?=
 =?utf-8?B?ekFlekZYMWFRRG9XcDIvOFUwSWJIRUdkTGVGVHNqRzJCbHhrUXl3MGllWU9O?=
 =?utf-8?B?cERlK0xCczdXVjEvTkZ2MnNTVUZmRFk4VjhaeFlDMGV3TDBCMHNUWStDVFdR?=
 =?utf-8?B?OTlvK3pEMVZjdFFuZ2Z4dCthYWloekx5OXVGQzNXZ2ZDc2dNOFNrMDFNbDAv?=
 =?utf-8?B?RithRENBejZ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:50:59.4230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a65a135-85ac-45b5-172d-08dd6bc59a19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 17:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213606

T24gMTkgTWFyIDIwMjUsIGF0IDA2OjQwLCBRaS5DaGVuQHdpbmRyaXZlci5jb20gd3JvdGU6DQo+
IFNvbWUgQlNQcyBkb24ndCBzZXQgU0VSSUFMX0NPTlNPTEVTLiBUaGV5IG5lZWQgc3lzdGVtZC1n
ZXR0eS1nZW5lcmF0b3JbMV0NCj4gYmUgdGhlcmUgdG8gd29yay4gVGhpcyBnZW5lcmF0b3IgaGFz
IGJlZW4gdGhlcmUgZm9yIGEgZmV3IHByZXZpb3VzDQo+IHJlbGVhc2VzLCB3ZSBkb24ndCBzZWUg
YW55IHByb2JsZW0gaXQgYnJpbmdzIHVwLiBTbyBsZXQncyBrZWVwIGl0Lg0KDQpUaGlzIGlzIGEg
d29uZGVyZnVsbHkgY29udm9sdXRlZCBhbmQgbm90LWJ5LWRlc2lnbiBzaXR1YXRpb24uICBMb29r
aW5nIGF0IGVnLCBzdHloZWFkLiAgVGhlIGdldHR5IGdlbmVyYXRvciBpc27igJl0IGVuYWJsZWQg
YnkgZGVmYXVsdDoNCg0KJCBiaXRiYWtlLWdldHZhciAtLXZhbHVlIC1yIHN5c3RlbWQgUEFDS0FH
RUNPTkZJR3xncmVwIGdldHR5IHx8IGVjaG8gbm90IGZvdW5kDQpub3QgZm91bmQNCg0KSW4gc3R5
aGVhZCBpZiB0aGUgZ2V0dHkgZ2VuZXJhdG9yIGlzbuKAmXQgZW5hYmxlZCB0aGVuIHdlIGRlbGV0
ZSB0aGUgc2VyaWFsLWdldHR5IHVuaXRzIHRoYXQgdGhlIGdlbmVyYXRvciB3b3VsZCBjcmVhdGUg
c3ltbGlua3MgdG8sIHNvIHRoZSBnZW5lcmF0b3IgY2Fu4oCZdCB3b3JrLg0KDQppZiAke0BiYi51
dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdzZXJpYWwtZ2V0dHktZ2VuZXJhdG9yJywg
J2ZhbHNlJywgJ3RydWUnLCBkKX07IHRoZW4NCiAgICAjIFByb3ZpZGVkIGJ5IGEgc2VwYXJhdGUg
cmVjaXBlDQogICAgcm0gJHtEfSR7c3lzdGVtZF9zeXN0ZW1fdW5pdGRpcn0vc2VyaWFsLWdldHR5
KiAtZg0KZmkNCg0KSWYgdGhlIGdlbmVyYXRvciBpcyBkaXNhYmxlZCB0aGVuIHN5c3RlbWQgZGVw
ZW5kcyBvbiB0aGUgc3lzdGVtZC1zZXJpYWxnZXR0eSByZWNpcGUgd2hpY2ggY3JlYXRlcyBleHBs
aWNpdCBsaW5rcyBmb3IgdGhlIGNvbnNvbGVzIGluIFNFUklBTF9DT05TT0xFUy4gIFRoaXMgcmVj
aXBlIGluIHN0eWhlYWQgYWxzbyBzaGlwcyBhIHNlcmlhbC1nZXR0eUAuc2VydmljZSB1bml0IHRl
bXBsYXRlLCBidXQgdGhlIHBhY2thZ2Ugc2hvdWxkIGJlIGVtcHR5IGlmIFNFUklBTF9DT05TT0xF
UyBpc27igJl0IHNldC4gIEhvd2V2ZXIsIHRoZSByZWNpcGUgaXRzZWxmIGhhcyBhIGRlZmF1bHQg
dmFsdWUgKFNFUklBTF9DT05TT0xFUyA/PSAiMTE1MjAwO3R0eVMw4oCdKSB3aGljaCBwcm92aWRl
cyBhIHZhbHVlIGlmIHRoZSBCU1AgZG9lc27igJl0IHNldCBpdCwgc28gdGhlIHVuaXQgZmlsZXMg
ZG8gZ2V0IGluc3RhbGxlZCBhZnRlciBhbGwuDQoNCkkgdGhpbmsgdGhhdCB5b3VyIHNldHVwIHBv
dGVudGlhbGx5IGRvZXNu4oCZdCBhY3R1YWxseSB1c2UgdGhlIGdldHR5IGdlbmVyYXRvciBhdCBh
bGwsIGJ1dCB0aGUgYmFkIGRlZmF1bHQgb2YgdHR5UzAgZnJvbSB0aGUgc3lzdGVtZC1zZXJpYWxn
ZXR0eSByZWNpcGUuICBUaGlzIG5vIGxvbmdlciBleGlzdHMgYXMgdGhlIHJlY2lwZSBkb2VzbuKA
mXQgc2V0IGl0cyBvd24gZGVmYXVsdCBhbnltb3JlIChhcywgSSBiZWxpZXZlLCBpcyBjb3JyZWN0
KS4NCg0KQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB5b3VyIGFjdHVhbCB1c2UgY2FzZT8gIEkgd291
bGRu4oCZdCBiZSBzdXJwcmlzZWQgaWYgaXTigJlzIGFjdHVhbGx5IGp1c3QgdXNpbmcgdHR5UzAg
ZnJvbSB0aGUgY29uZmlndXJhdGlvbiwgYW5kIHRoZSBCU1AgY291bGQganVzdCBzZXQgdGhhdC4N
Cg0KSW4gdGhlIG1lZGl1bSB0ZXJtIEkgcmVhbGx5IGRvIHdhbnQgdG8gcHJvcG9zZSBzd2l0Y2hp
bmcgZnJvbSBTRVJJQUxfQ09OU09MRVMgdG8gYXV0by1kZXRlY3Rpb24gYnkgZGVmYXVsdCwgYnV0
IHRoaXMgaW52b2x2ZXMgbWFraW5nIHRoZSBzYW1lIHRoaW5nIGlkZWEgb24gc3lzdmluaXQgd2hp
Y2ggaXMgbW9yZSBpbnZvbHZlZC4gIEkgX2FsbW9zdF8gaGF2ZSBpdCB3b3JraW5nLCBidXQgaXQg
ZGlkbuKAmXQgZ2V0IHdvcmtpbmcgaW4gdGltZSBmb3IgTTMuDQoNClJvc3M=

