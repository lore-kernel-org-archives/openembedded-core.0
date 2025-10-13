Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D80BCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:04:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.6])
 by mx.groups.io with SMTP id smtpd.web11.43082.1760360651176776823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qpZnn3w/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qpZnn3w/;
 spf=pass (domain: arm.com, ip: 52.101.84.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Vd9+54GOEPVOLKPUdmggly+WuXcn9rJypSJDKdRBi6ksMhrAFoMUcpmjCq3jMSmRD06JqWgcj1q0QWZUvzpr+hH1S4vHNEFcoqHtYP1Aldjkb6P7eqNIDYD4Wx7A5HCs6H0LJ3qcwa8GrAW2HYVM/rJjD3PwzTu5CJXpww5EVhVtRA1hoAFdGgGjNcgKDJMjPioOa8rKHmdm5iilKDpk5Omh1ZNmTaerGgiZBYKQjgJk+CmVilWJ8EMfdiTetYsn2Hfgqk5IDvjInSVC6C0W4570D+ruKTwYv8pHWu8LarZtFi2YwmLNChqQhjFDzXaBM55ESAyYO02Zw93+0cYVsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bYrKN30stYBR8oVWCQGXwCZg5MM62YjZiczlTL9LzE=;
 b=pmIP8uR80GC9duX5y2RJe9TxB2Glz/KfWc27qAYA6p8wTMOwgN4g5KPKxdFZQCikmORF6eeh00eI3X1gYwLYqrrltxxQcPS+SPoVGfl4EyBwp4/1o/3v+Tzs8tKMpf99i0m17mxrriVcTnRWDvHUoPoNsp0um6NkLWCfv3uuNCwsADJN296erArpAywLqqdPAL2K0BLy2Rl5MTiziR86+IZ18gotrmA1Ock2tAydO83SMENl3M9l4XZ88gocc3TEFweRh44IKMrE778kvWFTBWhtJyDY1nD9LwQE3WvcVbhYErY3VEMGSi04ujynYLPFCW/Xf3M2mI5PFCEPA6otHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bYrKN30stYBR8oVWCQGXwCZg5MM62YjZiczlTL9LzE=;
 b=qpZnn3w/SDBvzV025c5g8sOHMq13MXUo6lY+Y3ZMxpk8JRhNt93iUySxBcQslaWL1gAaO2Ws9NOVZahaVqByyka56mi8DCrZ/5JXY/vRlrmSVxOzc6pMJIbTFFOAoiU8nn6v5mwcAO9eGzeTMwnBfZPvP/n8FfNRqGkcnmvdOYk=
Received: from AM0PR02CA0128.eurprd02.prod.outlook.com (2603:10a6:20b:28c::25)
 by AM8PR08MB6483.eurprd08.prod.outlook.com (2603:10a6:20b:315::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:04:08 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::35) by AM0PR02CA0128.outlook.office365.com
 (2603:10a6:20b:28c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Mon,
 13 Oct 2025 13:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Mon, 13 Oct 2025 13:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoKFzRgxu5tueZtFmzhyPwbPLxMcHrswgjrBNGFAPFBFYTcrspxn7b41vfoy282ucM0jOuaJtiAYOC1oxRWfakVCRtLeoPRE6vtPKvuE4OWlOlk0qCu4lSZeGsfTJZHqqpDVwFmhYNdGhqgbeFMvI+0ZuDvgd/V4d9XHDXIIc7pkkIC/mAShgpIYMJPQxLxcIjmNsevsBC0SfrXQTpyxnesplAdk6KrV/cLTNNLz9Z2Alvc6b/lAIr8YAAf8rXT8bpLCLSJBKjrJdTZ0eiUY2jNpmKquzi2RHSMYVlEQ7rxAxht8DuSord4fp6yb1mtVURqybRLAKJYUWLNkcVHe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bYrKN30stYBR8oVWCQGXwCZg5MM62YjZiczlTL9LzE=;
 b=gmeRy27kDX4hfXd5H2vrtA+Ww+9qqYpvWENoONRZVdfZc0LIouzujf987I0g/4qJE8fMLbauCuR2xfLKLRyE811OY4qwIl2spTm2/SdgFrtGaT/e/T0uIIL5geI+iF2Wucy9T9Zc6TUdPClV9mqNkwEyq/v1yBTGIuFtxyK4RUr2jO4LXEMQl9ShCyGrpGHwA7Og136XzrzUeay4sTgipV5y98cV7riMLv19wBVmqEMmfx+bN+XSy9Oylo8Rn/OsWQAdvXYThTAv+EE/WPAGGM5Di3+DqNGFXGs+tRPFNmqnFFoYLkxnnYvnm2aTCo5zEGq+3QoImdXJysHXtnYqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bYrKN30stYBR8oVWCQGXwCZg5MM62YjZiczlTL9LzE=;
 b=qpZnn3w/SDBvzV025c5g8sOHMq13MXUo6lY+Y3ZMxpk8JRhNt93iUySxBcQslaWL1gAaO2Ws9NOVZahaVqByyka56mi8DCrZ/5JXY/vRlrmSVxOzc6pMJIbTFFOAoiU8nn6v5mwcAO9eGzeTMwnBfZPvP/n8FfNRqGkcnmvdOYk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB10326.eurprd08.prod.outlook.com (2603:10a6:10:472::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:03:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:03:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcPBBCxUHyiaz86U2E0tOyvKSVnbTAC14A
Date: Mon, 13 Oct 2025 13:03:31 +0000
Message-ID: <F39582CD-E4B6-4524-A591-92C971883922@arm.com>
References: <20251013070846.505298-1-peter.marko@siemens.com>
In-Reply-To: <20251013070846.505298-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB10326:EE_|AM3PEPF0000A794:EE_|AM8PR08MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 765314ff-5891-4be9-e08c-08de0a58fde9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?vmr/tVSEKM64Vg6pnMjjAHaX2IGf5/H/yeksU4hTVOswbfG41+xpco+mhKC6?=
 =?us-ascii?Q?6g6DWPrlrzc+nHPZYFONPW2UJz3xmon0xYb3bD5ILk9hIE2iOxz4JLf3eLpY?=
 =?us-ascii?Q?EdOmP8wBuMnksbkpjOLkHottEr1gQYwLIT3nWWFxgVLxfmXYcvFCiafECsrz?=
 =?us-ascii?Q?V/AguHQabJ37lf38a2aZDoOCAoWcKpSIq2WxFpcOWCq49XbKg7Ht9SGrQN3p?=
 =?us-ascii?Q?eN/sCznmjzNGgl1ZQuKkyv1QliWdRweS8JEPpjRHaNn/qgrCbyAP+p3zxP3N?=
 =?us-ascii?Q?onAFdUCt0k0qx49aHnFjErt2DXXYEtzfWh3BWeBCfwdk13zQ7HR2vYAWYHCi?=
 =?us-ascii?Q?O/iUJ6d3s8MJepRHCGgisyS5ZLMHIgHt0b2S6o93t51HvyTG6HQ6SOHoa2nO?=
 =?us-ascii?Q?P60rqgCQeDcMYAtI/eobYpsjPS//w4dOTnfWVx/kdo82iHAqHxHiLG4ChACk?=
 =?us-ascii?Q?oV45GL+FbM2uTRmDqSVBn+fYbfKp0vWbtNYjzhYS2EaS4vBut/M9J3ReeSg4?=
 =?us-ascii?Q?TLhZqB/BzfslJ1f6guFLkBBxbDPGm0p1lHg0Kqkp+5Y+AxNFllIYUvq8XEwc?=
 =?us-ascii?Q?j0YubgY14G1vkXoA4mPtn/dnEJ3TENeOJsJu0Upb/BUHv/dHowMFMiWI5BKP?=
 =?us-ascii?Q?bV/5nSkx/fYJ/AZnhH/tBPRDrErQgw72SxCFOnM3Pa8CKLjmbOvGy/M31U4U?=
 =?us-ascii?Q?HQf4RmX5Ei7FtB+BGKYtHRdh4n6VkODOAJzat4bDrgJGmR2ZDXC1ncOxTnZ0?=
 =?us-ascii?Q?ivYhJ1ejxzpTFxJxG3jacy4a+1KmWZSk6Wt8bbNqVjYqFd2fbTtfmFqmrt8w?=
 =?us-ascii?Q?UltVixh1z0tG3uqZqwx8P+C96ts8D92RU/XcLt89OlHTdyO94CInUVElIAu2?=
 =?us-ascii?Q?D7bun8JloxxnLI5gu5TH8XJ278NcXN+z7QjovtFkzCkt8W+V5Oo9i76iNmsC?=
 =?us-ascii?Q?KqAbGb2DOg2pQbDddsB8YpxtFngKgOQok6yBsr/LXXsiI2P9cO26vAEF2FUX?=
 =?us-ascii?Q?36uVTMKwfscFI5YIznDwzHSTG5OrkyruTgNIgkLR7GJSIONHb4wJjtBZoJ+k?=
 =?us-ascii?Q?h7HPwAXb5PuCZR3EWKJUA+47+Q5sIhSJu5/plxxWhTiN6Gbd9Q1AwMFd2ZAe?=
 =?us-ascii?Q?14R3ncfWskPCZabL+TKLuZCwO5h4sHPXpdrFjkcyv60bQQ2NVOdmKp5E1fLi?=
 =?us-ascii?Q?iHujchn+a8TCQLiM1l6XQjiKgd2NZBwZzgHZIDI2fwA2JKjixH4hzMTWOXFG?=
 =?us-ascii?Q?42i1nFm1sh/pujF9ySxm/E1Uq2ZmAXOyBg5JO0MexAJfXPRf7XZozxgGpJ1t?=
 =?us-ascii?Q?FMuiIo05VVpq8x0/FJYGtSgweH7/fCdyQDJDCEYEQQKlzjkxuCLjW9dWU3Pk?=
 =?us-ascii?Q?Agunfo6aFB7OYVUI/YnNo1IdqMCt9jHdOhKGfEqnQWaF2vFZc+XryttAqou9?=
 =?us-ascii?Q?0KVDSzk74K/rjyvdDTEuITSk02+fGv0Cv758E/zGdQ8/Qht+6kfqa3LTQ9G9?=
 =?us-ascii?Q?1gAPboDPPH8fTlgcPr35U2i7zlnjMDsZj2Pm?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <165CDEF30FBB56478E38AE1FCE9B7F2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10326
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	37e61cc5-b0ff-4da6-6f6f-08de0a58e8d4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ykIbZUmQabXL3wnEPxca/Nr6YhvfrPnqJFfRA4xwSQutKcJ3Hubb698eisXl?=
 =?us-ascii?Q?6oyqQ8z3ub2yDAXfevnQQZtZiA3Z8jR4Xaq8MW4qGN2XLbXOPs62BNXu2Ox0?=
 =?us-ascii?Q?PyL7B9DNsBM3h5eF37wPefSO5k77NnGNXH6n7VaaceF9u99HL7PW4wxU45b5?=
 =?us-ascii?Q?zqZgnmVJsz/VlPyZu+E38PKafi6KmYZ7jl/6GemP2/CnFU2avH2g26972w49?=
 =?us-ascii?Q?dyoNUReoAspUMq8QqDbawETHmN6IYm+Zo1am0v4uqRJHW3ndUMcWUjwinWoT?=
 =?us-ascii?Q?7VPnt4gGNMt8H/WuluGmJ9NHbd8WKcZ8lrMJP3IAw1U2u+LCYKFdzcGkRiLn?=
 =?us-ascii?Q?u4uV9JDYdy7IvQlfiiC1XFq+m2vyxB0WVy2I/4g99H0eHIp/bMntDaf3YBrw?=
 =?us-ascii?Q?CpjJQREi4RNNB5rgiZZb1xVAbWDDRaTQGnoWZ/1jpMm84cj5Mv6jxg6a1/4i?=
 =?us-ascii?Q?+jmVOy7UZhZjzZLX45ID0kurIEM8OG34HreLRe0OtcqTmRZVIfaQ8naGQAKt?=
 =?us-ascii?Q?KXmdrrm4E7n5CHTMu9DHtj7FMiAuyW4AvrS2onol9RTM+ctQ0g2V1gSl5nf8?=
 =?us-ascii?Q?QKERVwPLWGyePHkusQqYF0HxRWkKKftCBWCV54ZMM+c8iFkdL6TtLIJMUDk+?=
 =?us-ascii?Q?2pU/L/PzIqDHf5JrzwEqhzPgaMYTeh7qJv6Q2G+pZeHmiMDJRO/7wajXcO/O?=
 =?us-ascii?Q?7CRMPq++ntz57Tc+syQgO7R3aY72Fc2uGNjTzelqaml88YpVoMgY04pka71V?=
 =?us-ascii?Q?7iLFptDIJw6vY18rkD3V7Kft4ljs/N02fh7qtFNNdPDyWbQrJLuuyKMXAyTt?=
 =?us-ascii?Q?LEK941OTPbjTaRdzuSh5ia02e6Vd0apEGVZ1wKPSHA4NDqB0/TI1Szbtd075?=
 =?us-ascii?Q?uWSE2LG+xUE+4MMjeoecWjkXknuw7lN1IeEpHYbfvqhn8t16jiExJNzybsWU?=
 =?us-ascii?Q?ak2Ouu1jGNqAcc7CQKDdkkyEMzoH9mZOne9bLWMcVUbUV/ePFvQzwmM80HMb?=
 =?us-ascii?Q?OmN0AZvSLI+pct5a4QXE7+9y3ourYQpprFh5nWDP6+kaFG74TcW17B7AMw47?=
 =?us-ascii?Q?71KGzx07PBM1ooXv+swVXSCcqIQIvN+IBhl2t4yQO/rgwpy/38IWjh3nOtEn?=
 =?us-ascii?Q?Vn5tSlfuexXHrKXJtjRg6keDUkjCW8hEcjEZ7fhSo6+ijCM973jJyrk4UcF4?=
 =?us-ascii?Q?n/uu3Tq8YgnR65mLqv3Fnb//lHXvgBeozKTaPLVAFm91QEMwrqlvcow2Optm?=
 =?us-ascii?Q?Bk1yTGnDmc/WYTsMbSiyLCUhpzYv4Ip3sb6a9mXZ1mELjT318jlRV2TRVr7y?=
 =?us-ascii?Q?mkqpYneO9anP6OPJODR/suZJ92rGroEryVb7Qk5Ar50bGF3IPFXAZjKnjG4H?=
 =?us-ascii?Q?JSys3e7gop/jGAdROsXIvYXzbxQJurYmrWHSCyTk6kio9gcaxUvMk2NnK90W?=
 =?us-ascii?Q?tB+TpSsWvU7liu6qNOv21XZPOivENwmEMybmXFhw5voe+amNlJBCvMJ/OcF2?=
 =?us-ascii?Q?IFhej9Q5SPimlo806thESYvsoqZrymbW0rzD+v+NhWjKn+4V1wDk9EirD4N/?=
 =?us-ascii?Q?FNlpLzq7NxzuIYRLb/g=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:04:06.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765314ff-5891-4be9-e08c-08de0a58fde9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224782

Thanks for the respin Peter.

I presume the soversion format change is expected?

  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.0.8.6 to=
 libsqlite3.so.3.50.4

Ross=

