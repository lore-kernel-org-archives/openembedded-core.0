Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409FBEE20AF
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 15:08:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13899.1770390516401390318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 07:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zx5GU823;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zx5GU823;
 spf=pass (domain: arm.com, ip: 40.107.159.31, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bRuBIeMmwXLKHZFz9aUj/TULuZmAWNJCtX34LsSx/W8LQDP0lN/sIoZQ1bFoZQn2nvv729954JZWr7uDraYfEFWq5Tlbjcuxy8aSUaVyXwtqztDSBGAn1peXz3U0PhN358fhaFchUnAJ9zJE3TQM+oYHeCfWPspUQ4P5qzgtBCR2OIuRg4sbqY6EGB1I3Fx9/ItBu5nVmLK1ZX7GJaqiDqnO5UaT6m6+KiqfQ2Zul7IbJ09u1XBDtp2HHqSdge4ESpoKrSijlyMEdC1exKpQmiDPGSdIGMWs+J2gz/qDSkDDUcQh8lx2f/FIqGpFIhfLNjfBebnfJbAHaFVnJ60T8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB8F+QlW0q9WqajEX/4LetnnL1P1P+jEwhxIEwlcKVg=;
 b=ghvxCY9LwXmsD6C19OBXfNUdUX69J6bVickQe4hUoepiMxnNKgnQGXQGuEdR7pZtcRThBKUpg71794FmWmenPs8JfIc0qWebPQoXKCVrGbMs4CrYmjhfb+qoxwYWkXV9hU44J3TstD5x/83ZbFf09ObH2kSZ6JosifW1zxmxunJttcsX0cUu3i8/K1Y3ldTCjLPeCXLpmEH7uoDzPWoyeMkCRE2/I37hscW3+KXxnNh0CeRh4GHXjv9rLTnwXNq8sVybnvIOxoV040xRYVVlb3axfWPb9x3H1cwQ/oGyuTO/CQoPh9jVs+zgGsQfkdrYB5URSlYDjB27dOZQYEM+0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB8F+QlW0q9WqajEX/4LetnnL1P1P+jEwhxIEwlcKVg=;
 b=Zx5GU823/ZbnX58Xh7FXfXQ5sJXOBHsbRSt0BztLyhoWABy8eTz4DOLLsYVwzYnq2oxVPVrxNn1ryfGyV6b7oLellcSuZ8oqyWMeDNn32uVILxe/zus5nN55FZicjcdBhcX5tc1rE7Rv4YtFCPXoSkN6+st3i7SFxTOuJMwozFE=
Received: from DB7PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:10:36::32)
 by PAXPR08MB7671.eurprd08.prod.outlook.com (2603:10a6:102:245::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 15:08:29 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::1a) by DB7PR05CA0019.outlook.office365.com
 (2603:10a6:10:36::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 15:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 15:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmKW+kGI89OZpEpCz3a2TUkZjj8k3qXUoYxKyM9BYAuf3jbEQowvojvgZ+Iz5R8Yh+C9Ca7OepEmd3LWyxRbf4Fs5Gp8+MBrh1OgU/LKzgS8z/zWAfdctRphNPxV1dBvqv2iPFH7nEmeLptcaMTxLZmS+57wlFzPbCPWoaUYF3cA82nlJeIVjTY1kMEZ/VEHBgl7tUrQjMJkmyjULJapFfQjdq4wITk5wTGnHvKCDlaCg0SiV5uVZCOTtH5guc73Cb/OpMzlwkKAGunQ2ElnI0W6zdaSXzAvOHo3AhNzG4EKva6iFbETtdw2jLSeUEA+UXf6U7OKHWZMAd6I1hnzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB8F+QlW0q9WqajEX/4LetnnL1P1P+jEwhxIEwlcKVg=;
 b=y6+SctoSNhHTlqNZ3RTkauWkX+oyEvx1oUpdAOVBvQm4sxqCgI2VjfswgPtkQ8PjGs15NgvnZ8S3JoYsMZ4Z7+9s571/03WM/s1MDiJm8HyRdYnNUpEucBO+IAX3nVeatKk9oxS2df4VDKy2f/J9J56ChiMh5vucZYvwr1pYVXAwOzVgf2VigKEKc9gEQArwTSBfOAsd/huyWhGPM7rMQg3GDx9ygxkwo1kOxu0frlLAZztxKcvtno2mbTO4MpS8Zt4b89Ba27HCG7jGCMtF+qP4pCtXxC4UWzGFialFD/8T8tyoI2IWuDOObjiLWosCZvgaqcbwFjFCnjW7A/FL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB8F+QlW0q9WqajEX/4LetnnL1P1P+jEwhxIEwlcKVg=;
 b=Zx5GU823/ZbnX58Xh7FXfXQ5sJXOBHsbRSt0BztLyhoWABy8eTz4DOLLsYVwzYnq2oxVPVrxNn1ryfGyV6b7oLellcSuZ8oqyWMeDNn32uVILxe/zus5nN55FZicjcdBhcX5tc1rE7Rv4YtFCPXoSkN6+st3i7SFxTOuJMwozFE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8389.eurprd08.prod.outlook.com (2603:10a6:150:c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 15:07:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 15:07:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2] vte: fix build failed for ppc64
Thread-Topic: [OE-core] [PATCH v2] vte: fix build failed for ppc64
Thread-Index: AQHcdIPH/Z3PoTOS9U+pmcDpFXLNdbV2C4UA
Date: Fri, 6 Feb 2026 15:07:25 +0000
Message-ID: <A1C75F2E-EB7E-431D-B4D0-9570DC3A4B19@arm.com>
References: <20251224031644.535650-1-hongxu.jia@windriver.com>
In-Reply-To: <20251224031644.535650-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8389:EE_|DU2PEPF00028D01:EE_|PAXPR08MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 045cadc0-3248-47a9-a72d-08de659195b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?LyHCXmZF2wJbHBVw9k0g7tGnO9GLil64bsFxH8N49NMumTglCuWWpP1TDtnB?=
 =?us-ascii?Q?ZouMMGLLFPXQpWFMD7/cUy2sZEHpukIh9PoJkfJDIi8Ap5u6OMFd3L7hBwZo?=
 =?us-ascii?Q?xGVFoDiwiZqzbUj5i7SiTK1tEVb1+Puj/3ZufdJRwnud2fhYUbrZh3AGtxQs?=
 =?us-ascii?Q?dnoDvUODEpGtDtnwDY2kqApDlhc2mEr1jdrH5BTJlbrU+OEeSoKcKGvfVWHR?=
 =?us-ascii?Q?X3eCxSjrvRYLhO3IZlt6goO7W8rsXnLSNA2sq55GYVp/IN6HS84y84d7pbWl?=
 =?us-ascii?Q?ykZdUCuIdKZayxm1jQIhg9nReTAOs2img92xipMNWb7pNd08wt1FmArt1YNP?=
 =?us-ascii?Q?S1P41vJv/uKES2woiY1kkpyRz0xHFSscMp521aa6FjLo6joPuMG856hhJNVc?=
 =?us-ascii?Q?DcUnM/1tlPqNrX0miwXKmlHD7vxeRuPOXcifZ/80Ue1l81ZW1qyd/ZLyGjd6?=
 =?us-ascii?Q?q0vNqvd7hPgy6sBOPOmkoyLOpko4VKQ0zQjNkTRj+ZWElpWlGPNbPx73Nz1m?=
 =?us-ascii?Q?/TBHufRIoAQG9Wdp9ajO0ru1KCMXBTrZQ084rHXwDTwoqWNf/xfy6be1GWjw?=
 =?us-ascii?Q?DzNsAZVHp9PBVdInfSy4TvCpH+OAsAMx2lDvutMWagJjgoxhze/gYiTZmsSU?=
 =?us-ascii?Q?OHOcLTr8IulvSdt8PANq6o8W8/oa1r0S6ZYJL+ZAnWqQwA2hfOjTrXkTpjsw?=
 =?us-ascii?Q?VE5Se7bX2ufasjHlSb5x1PjH29OxFurGfN8S2/ym/8y5tFAWCpignidg9keL?=
 =?us-ascii?Q?zD1XfOUwUm/q0JmltJ8NjWTCA3Kncs+tx7uLTW2eHZTE7KrqYI/yA6PRM9MJ?=
 =?us-ascii?Q?qbd4ImTtUt59Y2tO21xijg1sSZP/q3m17vjx7IEBgW9PPsHYXL/QwfHy8Nhf?=
 =?us-ascii?Q?gMmEN6EEhObjX2/WklLQMYH1ba2/1IA53iC0Q7oDA86kc0hQk4ekhK9jc1P8?=
 =?us-ascii?Q?4qMBFdOWnUt10aAQBLY0Yvqg8I4EWaSVuVVDdX9hQL/92J4zZO+3mQZ+csSW?=
 =?us-ascii?Q?Eu8brbIwQau92tz0NHYJnNonywH5cIZwt6Yyns0pE3dVo7O1uSOwj2rShWYt?=
 =?us-ascii?Q?CgMD1/FlxuIXMAFviZkkZ0WhYhn2lQTQF1+DdO3Ceb8eTtOn4Fzf7f+dW9jA?=
 =?us-ascii?Q?RoGPsCUjeUyjleccYAkvJDXRZeyw1zCTekBYUUixg33c6ozeHREDXCMvNhju?=
 =?us-ascii?Q?lf/qMsGE0pAZmI/TyTPEimtnHCcvyx6IIi5aGO2sZ3N13Hxn834q2Vf5M9Bl?=
 =?us-ascii?Q?uZwq6QpGVTiARB+IOptNWGwrAbnVu7na7AIg5kr+5+KM0wYBGM7/68idHSCW?=
 =?us-ascii?Q?Sshf8LGCLNRxw5L+bPA5biV/9dLeVAm9NgBKphUnaxi3LPaeewCXX7jURanz?=
 =?us-ascii?Q?ru5IVnpoF3OUoC//wtG6xMKETEqEiwXiLSLpvcqW3aamsdWAt/rpovrVtJyL?=
 =?us-ascii?Q?SAh735/FoF9LExuVxNpuWpTDm2l3SU+CgRvUqGZg4IBAfS8QkFhp+x/H1BXK?=
 =?us-ascii?Q?+yqeIhCbMKrgbfxq4z6AH+StLgQdlJB82vllshWjuvXM346UhBpHzqDD22fB?=
 =?us-ascii?Q?jUm2eqQYbLxiqE0psovOt3S+jv4jvo7oJOvl+pSpVHBu/HVHBV3MhJhZENbf?=
 =?us-ascii?Q?ihc0w4JnEw/fq5F3d6WkRvI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <679E398FEBE4BF4CA9D739BAE1EEE3B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8389
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d6efbfba-7521-44fc-6299-08de65916fef
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?960to7mOzVXgkFovwM41aTtj7T/MwiJktHeMEivbmaaqi+9iHn6O8J6xhnhh?=
 =?us-ascii?Q?ZrOUUcEfSk4mm3rSflHA6fJxVnBMYFaZaVt/1YfdcdNEvA2mjOu5fLq+suVP?=
 =?us-ascii?Q?EgMSv5x1aNXKJ9YBBqN3JcdPKRJ72Hhjjt8Ez6qf8NICOIf+mftE3GI15bMD?=
 =?us-ascii?Q?vg9Ezxu86onz+qXzIgAPKoB1FVU4j6+XRBLmC5sy0Zfouw14Go+K+vAT3hsR?=
 =?us-ascii?Q?KX3zARu06BhBRW0O8c7dd5BVj0XnGDeZyRes+6IAjCWkWVzDWOUP4EniBSqY?=
 =?us-ascii?Q?+VOMinNAgHLH62sGI3PCOGFe2v0IxiOlYpx6ayCb/sAahEkRVQqOq2dQsxNU?=
 =?us-ascii?Q?OQt1QhnQDMCfXIQucpBLi6RSCXsuoDVsN+AHJzxsKoAlhFYSIG8iXFY0jNwD?=
 =?us-ascii?Q?fpNfWN5d6wdfemyv5wFdRRuOSbweMR4E+k1L7pObmhXtLhxeuZGUzkEddh25?=
 =?us-ascii?Q?Owy9jMOpUtyGTUItFd9XzYG7d1vqw2Xc6L6yr6RIbkMu9zL6IZhoByyh0mw9?=
 =?us-ascii?Q?FiP3UIzfd22k/nTMUd5y+EdZ4S9UsQ+ePy46bDkO7pziOjQn793BhgQuUJx+?=
 =?us-ascii?Q?r3IPFw+JPbjvw2WJ0KJmBBIJcC9GYUoFRl7yQcdaB0kIft13UT3degR6+ISM?=
 =?us-ascii?Q?53UIPBB1YhNp5QGXGZb1QW0bm9dRX2ilEzk0eDzvGanB0G/KH4QQiGQbxmga?=
 =?us-ascii?Q?Q+jni9YVpLY6Mtv1XF/FNjLNsq4QgHk+ntXNzXMAyyljx7OAK0F62zAB/v/S?=
 =?us-ascii?Q?g+EThL0RSaDp+FPSeukGXKfy4cyG6hggJvnAHdkCVXHnEFeUeNszkA3KVj7S?=
 =?us-ascii?Q?fQB7+1NSa/DYZbWTbaPJq1EnakrWtkElOHdmp4CrB6mH32QMf7nxOa7vSCdt?=
 =?us-ascii?Q?xXTlQ+x/zn/6ACvpnYyuq7TFd2V9mVRLFPWhjjKAWWyyozXPKPhFI1POWwPO?=
 =?us-ascii?Q?rhc4qOc52vxK18L+byLWjGM7qrQ1AUs+09HFVKHLv3FWUXmoN90jwHcW5bt9?=
 =?us-ascii?Q?JB54R8Yxzwr0AURokV/U5KkPcbbOnrbHpXqX0WyLKSAKo01p62Geeo2y/srP?=
 =?us-ascii?Q?tHTeih+llT+MMfp6ExZPmC+6Xrq5hK05J0DOvG7HaSNRWlC9WM1RAvIhC6HF?=
 =?us-ascii?Q?LVFX18niCDnE6MUXV3nvzrltPQ6lkp7AobsAMcu4Ch5UgiDJ7h0JOD/QXLKE?=
 =?us-ascii?Q?zyLayIY2zTDWGmaj+sud8+XPyXdqz5tW/kfgzFkYhF9b0k07fRC99mpf1V/L?=
 =?us-ascii?Q?DbmnR5t4r2P1dQ8A7U86SjEWKdgEbJlOG7zjKiJIJMtVQp4nhdXgR3ndMXOY?=
 =?us-ascii?Q?TZqRBQGIneiLIqeGAjYXM3YNFnF2WhMTkBBU7w+HWw2V2t4e4QyCJIiqz/DM?=
 =?us-ascii?Q?5e5/DHGWoRI0zyMsocCvg6/bisILSP4r5wtka2mygKkn6MxaYQvfMI8aIJWJ?=
 =?us-ascii?Q?Gs48bL77ea3GXlmF5Nsat91NHmTC5M8PV7S8kvcViUSR0OI4dN97MyiOVCq+?=
 =?us-ascii?Q?73tQVfbhY8biVpieBUreQf+DR3g2+7jIIVXkWi/7sB/h7F2Unq250bFUt6Pw?=
 =?us-ascii?Q?UZDVbqiZef1R9E+tmxNbkT3sViPgRBwFPHHq8v+Ju0mk87TLMHvPyZwPu7ZN?=
 =?us-ascii?Q?nmK7eiy5lsGfRzDBnEytdCrO9lntzi77Eazce6wk2j3n5FlHnf3gvC0upFT+?=
 =?us-ascii?Q?+F2nLA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	F8dxyLNXhuWiXWAJy9K5JS2A6fb0uNBZKFGTkilY5GgFSFXBAZVWY+Szf6Fvd8nBNgJVQ+kkyWu+EftS8ly+kblmTloLlqVw8hTLVkAp0NAXDzmzz9WDNSxC49loaVeq3OSPjb2msS9BhZiVFlHubpFRd1zk3SLR5jRRkdzOdO+MwMp9IzXBpL5zmGGzn1anPiaoQuxnvJI0F3cfUnHtjDP0fUIYqMcUIAG6h8Pf2XfkCyJe4xEydIAP4c1Emmty7LamGtrEyve7hyplgfKMnp7uGklZM7+zUCg2mbWpIZSsahHn26VenAYWAL60OEhe+kiUJS/3ZSo9iHbfYpRYG5HJWVa4RoB3dyEPMHayLIi8SEOrsvJh6nHtNiC59kESlZl0s/xJPyzNCMuZiQSdME6/ps+hqPqOZxa8iNX2AJYBKW36agu0DDPBgmxTSYxU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 15:08:28.8572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 045cadc0-3248-47a9-a72d-08de659195b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7671
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 15:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230626



> On 24 Dec 2025, at 03:16, hongxu via lists.openembedded.org <hongxu.jia=
=3Dwindriver.com@lists.openembedded.org> wrote:
> +The source file subprojects/simdutf/simdutf.cpp is generated by python3
> +script singleheader/amalgamate.py and the definition of write_v_u16_11bi=
ts_to_utf8
> +and ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires op=
tion
> +--with-utf16 and --with-latin1
> +
> +Add option --with-utf16 and --with-latin1 by default.
> +
> +[1] https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693=
a14682a5f669a5
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/=
2926]

Upstream have closed this ticket, pointing at a fix in the simdutf reposito=
ry instead. Is that possible to backport instead?

Ross


