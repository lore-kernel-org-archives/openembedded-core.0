Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE44DC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:13:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.20531.1747908795612945743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jiU+PGLC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jiU+PGLC;
 spf=pass (domain: arm.com, ip: 40.107.20.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P/iFh501gTbIqIxd66N6rGn4LBtkOK43oUhC5ry+zYGTZ4Mm4RSiUhum/53at+yzEPf7RPNfU4XQiEL/S4hDPHVLNPhug6FyBKJV0esOa67i3qVa/Merem6Q+QSxMas+j+X/uZrwS0/GFa3qcxk69OZKSjE6EHtCqMP/75F2V79l7xuQ2jVhAriWrASWkZcLjYYBpwGdsjTA25FQYWb7a2/J7+FQB9ItDa9VxVl2QAjiMGkkdvxAxc7du3N4QyHC2Z24OLfI09cQB6aMUEkcAmNtgo9qFFi7MrnPttYzBS5G6+clPrRWP7f+so+EuBTchsHp+FeHKsG3+AIiaiO53g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th7Y4TY2iw1o+fgYJd30LWPG1I8sAX7A5i7hXZ4euBk=;
 b=p5I0oSOkN948Q+VjmtGMeYxMs7LolgWR4GBMnHOeYJQ2ecVY0hN4plF3ZnptGKp+0p2Ww3E2g7h09DriA0sUvLLnzeSZ32BfCt3a8aypmeRcV/4IRCDeurPSTmWgYQXXT3fOxlwVhmOg6P3CzhL9t6LxgdwGiLr6HXNtykDDRExDKxuKzBKN+/GMqu5YB1iUU61nOyPmSCN+8MPJy35eqWwmrqcb8CvrQ+6q2UAoCH4S2CdkK668bD1r2O+kPf5tu44cZ2Bw9gn9YlPEm1mtPOHQ38LChuY6UkcxzjIe6YOFM135zhNW4sxuAlOpJTyyT0R43lKZq2pqQEjlh7rNcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th7Y4TY2iw1o+fgYJd30LWPG1I8sAX7A5i7hXZ4euBk=;
 b=jiU+PGLCwdyjHbLJBFBKqLG48jAm0CjdjzDwmS+OpdLSTgKh+sKGSmlZDSgLNDxL+NcRBAPBlL64lFXE2ah8GPvM944Yd6zG0DrmiYPDSJ3ioBzRtLpeVSc57mQQqBVSv53DGAXhPYFsiuVYEKbN0r5CJaX6VVUD779uGGMgtBA=
Received: from AS4P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::7)
 by AS8PR08MB6104.eurprd08.prod.outlook.com (2603:10a6:20b:299::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 22 May
 2025 10:13:12 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::c3) by AS4P191CA0007.outlook.office365.com
 (2603:10a6:20b:5d5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 22 May 2025 10:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 10:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv+Slr60Ml1wq+jngTfro3hdyyQ/MQgIm6/7sQ9At/ZOt8rUog0A+GZ0Q+tz2qrxLRZH91ZhoJxq5Mob3kurGqS38nGt4aesVS9rzhfHaqLhuBAcmJFsG0Zrn0AXH5Dxfvh0plR72/SMmQIeOymfKOmiz21klWB6ZPZE1vxE/YzqyCX1iW6B6/aJ7rQOzk1BHhA4GxUnmd0pFOzK3fbJhFfgMyrGfKQIfyMpcI8Tm9fPmQ66m+HEau9YT6G6oxrVpb0kWHcBbD9z0BCOAt9gBkYy3Fu7sjcFwjZasWV72XRzLkheuAYBrIYGyWIemY1MMJMIML+zarZef8Q8U6tthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th7Y4TY2iw1o+fgYJd30LWPG1I8sAX7A5i7hXZ4euBk=;
 b=aYPZVFax/rLFXVcBZB89Oz/Aro6dVgbA+GpK288pUUugzjqDhV9WJxkKUJHIG+xJ9ki2zqJXT3857WRdFrRLYbrmt8NKX0U6xXARoAUN8jpL9R5VmySme3JV1CtdwhPX8Y0H8vrnMsHFER9qNP9UW+vP10iezSnoa11IBupqsqBxjokfGxec1oMNJkNbua78h0wC669mEePlS5o6UIRrpWMWy3VBm676I3ZCsP2vo0qzn92LWvoOIvvsgW1GdzSgAGGKydReWqZQE5BIQ4FpbY+ne62Qvo6evRC/YNZjiuyZJftCPok2Y6URwr9OmGEHLiQo+Mrs/Gz1+Kcsyt29IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th7Y4TY2iw1o+fgYJd30LWPG1I8sAX7A5i7hXZ4euBk=;
 b=jiU+PGLCwdyjHbLJBFBKqLG48jAm0CjdjzDwmS+OpdLSTgKh+sKGSmlZDSgLNDxL+NcRBAPBlL64lFXE2ah8GPvM944Yd6zG0DrmiYPDSJ3ioBzRtLpeVSc57mQQqBVSv53DGAXhPYFsiuVYEKbN0r5CJaX6VVUD779uGGMgtBA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5465.eurprd08.prod.outlook.com (2603:10a6:10:118::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 10:12:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:12:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 27/28] systemd-boot: Use gcc on musl/arm
Thread-Topic: [OE-core] [PATCH v2 27/28] systemd-boot: Use gcc on musl/arm
Thread-Index: AQHbyhkcRmb5SiVTZkKCyxB/fsmiNrPeb9gA
Date: Thu, 22 May 2025 10:12:38 +0000
Message-ID: <BC4F1602-93E6-4BCA-BAC5-C1C9584ADBA6@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-27-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-27-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5465:EE_|AM1PEPF000252DC:EE_|AS8PR08MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea8801d-af12-4a63-b0e3-08dd99194140
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?q8o6/0+9CBWwGS+eg3hj9QxWQ4z4d7TMOXLIq6wY90dCg2gfJBMb5yHNWiTj?=
 =?us-ascii?Q?wc06i+InYslmJpbtw5JWRkGAPfxgoUbYdIkWtEkPmEtFElNycznew3DFUITK?=
 =?us-ascii?Q?mO7lkU8qSrXY/3GeBwynf9bjub28m9hEYrNNUyVKLq3GlaWx3zw+k48gWM9x?=
 =?us-ascii?Q?dkpQImDB8QW1/hiHPLKjDJPyCJ03GFqw70nn1E0thcsVP0cI0XA7KO2PTZca?=
 =?us-ascii?Q?wLTJ72dk7Pt3DPzOEgLnsDbtUWqk/xYOGydGZmKgjA5OHFgM4533pVO/tTeC?=
 =?us-ascii?Q?AstNNhWUTuGJL4S2Gp+Nt6VCf1mDcDiHPhzrGegp7XiToDZgxnt4Cr3btaxB?=
 =?us-ascii?Q?mra3U0gwdWSMUBLDmSA7IAOsFBhOAL+c6Uih++sNcc1bppDz5z8eytJ9+Bhx?=
 =?us-ascii?Q?D7QumIKl7zNSP0tQ3H0Fh3gTY8kHwZr4phYFZr4exM5rD9EHAI6s9sLOeZmx?=
 =?us-ascii?Q?7VzrFLM1nVkVrZbOqUSfQsZ3ys8j4uXf4hao1zkW7lGT/ctZYnRL1JMkUoHe?=
 =?us-ascii?Q?k2SEXKvDGg0yYrf06PvMGOW4A70r3N4dhj9Psl3VrNu2b2+LIfAELAKNK+Nc?=
 =?us-ascii?Q?e9LeK4cAHb+pf1lRiRXLuFOpG6lG4D1134VRIf1IlW8vWHf1rmlXpbGu7w0N?=
 =?us-ascii?Q?uNFthUddJ+fKnQohZyF9RVLE8tq53y6MzCtOABC8san1kA2IQC2OLSmlp3VI?=
 =?us-ascii?Q?qwymP4vx4RCHZJCeyRWvsyDmZC0TwXdcncrx/M1FRriALDLfZQ0HeMF3A5mk?=
 =?us-ascii?Q?3U7zX/BCPo2vxI73jNGCIn9OmWHu9IeaZXbG+RbDmMZqADnCXyGha672kVkb?=
 =?us-ascii?Q?GGmJOIZPlk/dhCDBQKVGoi42JsYsmAdZNkJgdgxOHawddl7gyH2fHpPII+1b?=
 =?us-ascii?Q?g/JK2JqUne2pnbwCKX6JGSG3B+/7nUv4Z9qmBGiO7wDVohMztdsXv5Wqx59u?=
 =?us-ascii?Q?CJJLzqnBRmdaR09tAe6t10QiJwWvvWdLDpOfEXBMJNOsigvvvQqaQoHunGny?=
 =?us-ascii?Q?xh5l04tRbvnYHB0Jf9QsNe40tDVysGzW4tnoquR3xTEBHwyR03H0RguQJ7X3?=
 =?us-ascii?Q?dzMcJm33Bxlo1TccMFfTqcO2+a9lGyVzpFZclYI8GN9Z2puREsNSWUMGIzDO?=
 =?us-ascii?Q?mX07MHUKM+611/uf/varM67O8XxwKgQB6MRHMNTNpmnmJuqxSp4igqEFXrkR?=
 =?us-ascii?Q?HU07jmcgOT1eiaAD2wcosbvH2Pgeptl0Cf66sSN3AFZnB0HAWoXYIDLxnRI8?=
 =?us-ascii?Q?ljMiud57++glksnibqWA7HPxUbcWw7terEm9IhrsLiS+0ZorOC+qDvPtNEMX?=
 =?us-ascii?Q?8HsuLowLzGZ1dYjso0g/3Jnf2Gkos/rQIhaaxLomiid+0cJkb1GyHv4bWIaX?=
 =?us-ascii?Q?mjNUYu1sXEdnUq127fMz8mM+oBNdpzvL/L87lnqdPD2izImxbklMfGsBlvaH?=
 =?us-ascii?Q?lbamkdk0sTJdRBSI2VObZ3NUSoPt2vcvh47mLMq0m5ap7XJTDRLA+Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CAEA69CA0025540B1000714A31BD0D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5465
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b2694c90-a897-4a9e-9c6a-08dd99192e3a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rhwvH9mfkSWTlNy4ro68P1WgreQldNDZHQL2D2CDDG+aa54cvyUULFjOGWr5?=
 =?us-ascii?Q?HxCyXP5R760hZ5YdF/fnPmDd+DcqDVVF9KJy4jaL9PwzxjLot+N2NFQA1oKN?=
 =?us-ascii?Q?FdTRp+kSNmtC2n8Ja6y5OX7Kx21i8BSNpd7Nhk9ONOZLMwHPpUVFNVJTprnV?=
 =?us-ascii?Q?kY8F91rpjYAUo7zSids6QItysI/NbIDLVT3JXxU0lt219UZsKbYREZzjKQdc?=
 =?us-ascii?Q?3ZwwywJLBzg9Cq6+q+JiA5k6tpq9sfYdbN3eNBW66bOZQV4+z3n1rmK2foFZ?=
 =?us-ascii?Q?fhfJ32kIQqTV4Kk8UEICxkSMHXs+vuGuRgGIfdStVLE6J5OPe3jzJFWYRi02?=
 =?us-ascii?Q?3mjGswt60/lSD6cdzh3D70OTrHNffIxMBZurBKKWJPRAcgOPRWMAs4V0ISRQ?=
 =?us-ascii?Q?Ut2zNx7GdhnZKdpy7VHQZhgFJQ5y2DNcSyXRItxqYcY0mqHE+YGHAWMsB+OB?=
 =?us-ascii?Q?XoyAvbi1n1puf+SErgT3dm3xv/cQnPzxmqXjcA6s1V7pRJOV8QNEULIqlTrD?=
 =?us-ascii?Q?GyJBHo579wssWHf4cthG2mmRQ3dJA+TPLgu8xyue8hGsBpoakQP39l910z5o?=
 =?us-ascii?Q?+edxsHyg15uuvV3GgGr5V+6Lbuj/8MWaVb08szGidOLvAAAzKVCtumIZeluc?=
 =?us-ascii?Q?CPLt+T8tonv17ZlccjIIwx1Jpb+28k2LE99FPWQaPyeRGT6u1EdSNfX5abSN?=
 =?us-ascii?Q?FzHZ2m2Q8hef1F9Q+94MBfu9FetCFyj/Q4Kie5edg1QtPhtv81EAydGfL8Pa?=
 =?us-ascii?Q?JRVn6Yz9Tzek/7XAfI7tfcZTXR/j7BNLDk5jELKJA6QJbSdSPD/twBLpB7hK?=
 =?us-ascii?Q?0oXumj7ha7tyaLcs6TtcmkZfkXfZEg30LLWpnTUUIFANIz7S6gwI16KDM6zG?=
 =?us-ascii?Q?rae+CLuATQag4ZhVGIks0kGU/bz2zU+sF/uymFaYUSMFZgUyFOEqer+jC1ru?=
 =?us-ascii?Q?MzfxzO8ra2K6hfjG9r9cYCPM9mVX6VVY5ln2DRmdkqBW5hgpRP9n0L2HOPD7?=
 =?us-ascii?Q?qEVBXPwG8XERN1ZvovyQuiR9cRVNjrpRKr56UwumzRHkEtDIIhdidZ6gBGQN?=
 =?us-ascii?Q?DpM5Z1asiOK59GbuUEQ03KNWgkSs+h59JnxCEOrqA8TCmHv6KHyQ50oDd+4w?=
 =?us-ascii?Q?UMLxNFsv5mu6wYry2OWS55ufGljLT5vKiXBj0ygm7cntYPYYC4V6xa5aOZBq?=
 =?us-ascii?Q?oRKPA+rlLvkTBRbnWixZfVE9/Bkk31X7gr5sBNW44Cu+xHS7cY6U3PcZzoXU?=
 =?us-ascii?Q?/J8hbhFbyr4p8EF+dWLxMgw7rjnkeh6/JYtLWKWgA3kmjoZFVqU8guPoxth0?=
 =?us-ascii?Q?MwkPBheus/WD++WC4Szx7iDILh2mZlrCZYZgLDbgR+cipYEFrK4hvb7bSAu9?=
 =?us-ascii?Q?pfbxqyJoqxhmLIQu0uhpWdiwWzSwYdr1wRCk4pJKc8802zQFa4PRWyF2mYMH?=
 =?us-ascii?Q?nJMXTTVWwKuLl48yTDj5fMbaaSNVnr/ti3VWwcX0oHdKk8IaM+H9TUVGG51v?=
 =?us-ascii?Q?zNhou8E7meG7jm0zI3DH0yJHOfQgbEdWqwCz?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:13:10.4075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea8801d-af12-4a63-b0e3-08dd99194140
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217080

On 21 May 2025, at 07:20, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> clang does not support -mgeneral-regs-only option for arm

> +# arm-poky-linux-musleabi-clang: error: unsupported option '-mgeneral-re=
gs-only' for target 'arm-poky-linux-musleabi'
> +TOOLCHAIN:libc-musl:arm =3D "gcc"

Why is this specific to musl, does the choice of libc really control whethe=
r this option exists in clang?

Ross


