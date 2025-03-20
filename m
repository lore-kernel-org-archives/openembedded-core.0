Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F28C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 15:50:39 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.web10.11170.1742485831773525777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 08:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZbEKpUVG;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZbEKpUVG;
 spf=pass (domain: arm.com, ip: 52.101.72.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SccuJFrAV4tIWeq5AeTvU5N0cTFWSw16/6CqXiH+46+tnY0WjB9d9xR1gqDtfntSFmXQh4FRsvI8iMYCMD74S89G0B4VsMmVe7Bp7CyWsVV6EVnzf9/obBsnzboYH8W7LM+xB9AVbK2z8yRFvA8eNnAoYsTOM5vXFyG2KKxH3h3jZAxtY8cKWsmtkGboX7jVOV43sMmSwGU5+silXMOVhMrAl8s4fX1DWY0gR6tlyIJq+2Nwc3XsA8cokh+y3NPhP4WyqKbQTSisEG9M4FWFgjq4xDZwW/1yTv6s24DDyWwbLFkmRHlXnjJyZ0eamPoH71LwkBe6sP0mccG7pRhgxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPKXBSwpwAGv+O69nGiurP2fWLohbg1PcCgQlkarlxM=;
 b=QRRiMa4VzvGdSfTc4So8O83G8X1SqNca7gx0oErnQQ4ivZ8Qh2ivHkDx58b4RxHMsK43iWrNCbHz6ufTQWohZdcDyMiqlbuFQlge5O5QgX4Q8EIKca5Ep131WoWVu/W7oG6PUWJ9n/RIhncXBqhy3V0EcIBrINzVhzBuvEJs0J1TCGTuUIWPhIcDUhpHLNFvEeEg5CnWBAg+BLXUzjcCrsEZb193IPkUV6Op6TmP/IxYhc6zQGgJygvE3i0/kZRZTiXcW6F7WaCBWz5PNXY9l87ht31ng7sYjfS9QgCjoQ75S3xcnNou9hZdFt6mCgGCD8CprMmIR8YKO6ob8tVX7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPKXBSwpwAGv+O69nGiurP2fWLohbg1PcCgQlkarlxM=;
 b=ZbEKpUVGdxH+rP1VK0fFViME38Jfp4XXs4TcgoOXc4LAKON1wa3Qccm07jpDXXVosdXVdIepj3rORvmtYgQqtUnlptFNv0VjUOpa1n47eu6CetnQ7kJ1qSfM8ky7v1sEKCxWCWMM1pTegZR1HLfCkfPbfErGDUXM+JcZfxce6qw=
Received: from DB8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:110::16)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 15:50:25 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::41) by DB8PR04CA0006.outlook.office365.com
 (2603:10a6:10:110::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 15:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 15:50:23 +0000
Received: ("Tessian outbound f3153901b1f1:v597"); Thu, 20 Mar 2025 15:50:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3e29ed2efaf76c7
X-TessianGatewayMetadata: Vo9Rv1vLvIlyHu19UwwVTpyL0mOE92P7xn9eYpGLKx53KKteSk7QVuMBfz/Ml5HZlpCYuCJFldGVyZu32c/NqCDaCjClmMHI2/iuGJeMTPOufhuvJgUTiBJ5eENffOySfc6fHqMftuG4ddkZZWoB76Vi1xbDgQ++4iV5odJtTNk=
X-CR-MTA-TID: 64aa7808
Received: from Ladf6b07b30fa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E321AE2B-CA89-42B7-922A-3FD658FE2B04.1;
	Thu, 20 Mar 2025 15:50:18 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ladf6b07b30fa.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Mar 2025 15:50:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XR7vayKZ9xKFy93WycEnyrYWjViOv6WoO6Ww6H7hqUYa8Cgi8A/p1pnq8tPOcaIEFjuN5XC+2kBIvC6oB3g0plGOepOOC0+BtSqjiFdUl1nkSZ1D7Wu1lY78aRmx2L9kPSvnPoMxYPCIyyxcbxmA5HcDNaCkEoXQdT34xzNAPWOFmkqjQbCo3e8GP1zvtIyWAYhKzGv7wtYzrFo4Qu5vALfuJczau7gri/Mg0KoD3BeFVex9WBgEMVN3Qq/WvkVc/KMJ/UlyZ2wz9ENbSZoZ5QCB6whC3QZNnBm4aiSl2i0WajpK9oBvkkOcZ1AsWhRsdYknnPDlkNMBV3f3XD6NUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPKXBSwpwAGv+O69nGiurP2fWLohbg1PcCgQlkarlxM=;
 b=PBwkVZk27A/EgezKkqdGS/FW/S4BOizzLIOSBzt0YFotVAa0V8sA9x2oWJgrMYwlUGa0o8ECVX9CenyjqsDVWKVObOLqUqdqLqsxualrZ8Qq4i6WLflCGn/IJ2nUMdycl+iSbJXIMtOnY5SQPNk1eLl2rb8+PlGdCC5v0rhzTjKeJpU1OC3foy80hvPFpxZHw8pfwWyFJgHXmSo0WDARWRy1KVFdr/6F5onnJjy9krQZXlrrvmE2ZZQnnlMjwSje1BYpcqBr01bz9XX+y+aJTeB0I+u0YW9TaJPuAW1ptyAnKo07wDmWn/gnpCsOnKiGxbEi4IjyquAPLqiCU/bSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPKXBSwpwAGv+O69nGiurP2fWLohbg1PcCgQlkarlxM=;
 b=ZbEKpUVGdxH+rP1VK0fFViME38Jfp4XXs4TcgoOXc4LAKON1wa3Qccm07jpDXXVosdXVdIepj3rORvmtYgQqtUnlptFNv0VjUOpa1n47eu6CetnQ7kJ1qSfM8ky7v1sEKCxWCWMM1pTegZR1HLfCkfPbfErGDUXM+JcZfxce6qw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8445.eurprd08.prod.outlook.com (2603:10a6:10:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 15:50:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 15:50:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 9/9] man-db: Fix musl build with NLS
Thread-Topic: [OE-core] [PATCH v4 9/9] man-db: Fix musl build with NLS
Thread-Index: AQHbmRgCzEiTab9BLUO9ujqW+/JsPrN8LU0A
Date: Thu, 20 Mar 2025 15:50:14 +0000
Message-ID: <1BD37D88-9387-4219-8363-AC25A7E2DF60@arm.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
 <20250319214213.2505249-9-raj.khem@gmail.com>
In-Reply-To: <20250319214213.2505249-9-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8445:EE_|DB1PEPF000509FE:EE_|DBAPR08MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: ff57f443-075f-462f-0a04-08dd67c6ed58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?hIAnWrB2dp1j8JrsfvdjNJtSAP/ewCZDPPqotvv6VKK1LDx+fgOf9uS8yHv9?=
 =?us-ascii?Q?u+xRugNsqZIe8zUKby6QqZJ6gkBeZFpdgXGLrWQ0fefvYEo/8/up92Nj9Cj/?=
 =?us-ascii?Q?5Dze0QijTGNiCmuHcxB6N4RAhN3GEpiks7HxwneRL5PORs0hFD24OnDlTaEv?=
 =?us-ascii?Q?mrAL/sCyK6Zcp5+rv1kaN0PRbSx/aphDB6QfmeBOR06GGcXxQEcwTEE3LyY3?=
 =?us-ascii?Q?eDIOcAt+XcC3ME9fkWAiruAsDyt5s8vAsQzl/BKEpKT/WeTRMaNonF9jk3iS?=
 =?us-ascii?Q?/GSqPV5xMc+nXd5W/0MJ2JIyST6pcd9EYqrfB2h3azsA7RLvCpxZlNWhXayT?=
 =?us-ascii?Q?TrzJyEiKWYD6zBU5e6hHu7lOM6b55p+BUerB+iUS9rQSoHKfbmHtM9xA4o+v?=
 =?us-ascii?Q?R/QRuuXyjr9EaNb+MorywOqAQ2lWy+kKflcBUpQWFvttfSfLzFol+l+W6V7C?=
 =?us-ascii?Q?rpe7TK3G+AwDmgkdQqjMkvzbk8OhC/9ihuqK8jWDsu+jqy4w2ShfN2mmmQ/c?=
 =?us-ascii?Q?iHBps+fmATDTR/q+2lxMxZtff1vapRwJ2AoKyzoT09WVxVPjfoDflmULnI2O?=
 =?us-ascii?Q?R4u2BHVRBPXyIAO9cbyw9PeKTAOTxGM0a4ka8EoUq5qPsYPqyWybq5FC1QD7?=
 =?us-ascii?Q?DdrFnqn03MJOBSIU+A76US0UgpPCBj2KgHnZBqgG18SLC60pLhONw2eupTUU?=
 =?us-ascii?Q?AyyIB+x7Vo8C1nQb78W70MnplzY+0Y4tVDiNz8tD3Bbal+NNXu36fTnX5fIS?=
 =?us-ascii?Q?qtI4yikvVYvh80JiRyA8wBLRDwEgYjsXT96zj2QJk6NTpz4k0Qs4BEzHvBnK?=
 =?us-ascii?Q?XQe8VR9tP0yUs9/rCwpY5RPmwVMHFbVOkpqNu7zIH2ZZZLB/1SqAjrPzMgza?=
 =?us-ascii?Q?hhzFrLwyKDXlb5A95xYwd8lQnViozCEbo3eDbZp45tdQ8YtBcdaAqI7DqcFe?=
 =?us-ascii?Q?72mNeHM+Bi7WV3xjq/L6m6DfZoFI3oha39wh7QFJY94YV5uHU790LxRuR7Pd?=
 =?us-ascii?Q?ZsZ2RU/Qli7X1ErHSI3n05o7FWpRXOVACk87c4IG0y9CWZNiufiEok64wYAJ?=
 =?us-ascii?Q?aLDEdrI9uZWAuAM0cwbzjWlDFafx4X0UdC77WZNmfa1s9G/vFvzk+X2YA+T+?=
 =?us-ascii?Q?rq6yCxkNfnfXWZRfs1m9QWT+E+2DY9lz9a3DQ9YgPIoz9NxDXvLcloLc7kGz?=
 =?us-ascii?Q?3cqYBYsNKGxTkOQzFqGyYAWlMogq28Yd8EjPnRbHf2dpeN4lyzd9Sa26z1IX?=
 =?us-ascii?Q?4P9/JN3RPDB38VPncO/ES6mbSkKcM7wPPRzeS3MVL/hNwiLXgCNu6g80dByL?=
 =?us-ascii?Q?vwmLHYsmZXZQ32QU/IQI3cFiTiVTpXtqT+45f7s9FqVTEUId1rrabwOiIZ/V?=
 =?us-ascii?Q?6Iik5Wj4Fsz9BwDsdzbAOK6qxFrGPevgm6jDVuXscgrS1+LwD5tHle/tKTGG?=
 =?us-ascii?Q?kAsaPED7zDtXkWOFN1EAv5C0AmbQfaww?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25592C43FE868C428D14AABC2F3882E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3a1e930f-3347-41f2-ed13-08dd67c6e7c7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uzAvhScoX7PXjzZzyY/9U3bnokc/G/0tnbWyng5MFfup56dmw0/7nS987fk5?=
 =?us-ascii?Q?nt5wh+gH2cKOTi39g6+PVJNfM9Bzqiz4cBcBHqyiWIHPIe6Lku0kJOvCXdhP?=
 =?us-ascii?Q?z/8BcWiTfDqMrfbCVxs/DUPDH4qjfKhYnU2R6EMFbG5GN9IghhcqW8/vM37f?=
 =?us-ascii?Q?lLAJ6zCCD5GMk9esp2AQw+djRPxElzNgNHGkB8Kpcz36DbEjbkFynW06OuzJ?=
 =?us-ascii?Q?Hj5wqjJkkpODCdHcpzs2zwoLd1hdV8A863X5OM1iBOd/+ByWpFjNgk6M1rr7?=
 =?us-ascii?Q?Zh92S1lytFuue8JVw0iAXZMaUUhuz3ew3BkYhhUWBgLh7UNC19rGld99+DVl?=
 =?us-ascii?Q?DWE8BDisXCKOyY4RjdAZN8b6zLpOTLlHrk6tBk9xiNNRiKu7Y3vcVsdWm5Ww?=
 =?us-ascii?Q?9v/ILNyiEemFg5KuCyJ0opWRGf2z/m3A/LXNvR40tuE2eBsBOYP1A0HwNCmP?=
 =?us-ascii?Q?K6RBtUOLbKmnvRH8a4feUQcDa9uVznU+w5lJ72s/kx7rUMSqiqFI+py8osrT?=
 =?us-ascii?Q?btZwriG1uqc/jJ30aVVmweJEUb8nno7eR1rhB/u3PYiIPCK7DLfHeLFYQVI3?=
 =?us-ascii?Q?JZbh9PZjHZXr+20j6NKTJdglPxS+gUVmHzDKg3UP7oviS2bKbJieNxQ64q0W?=
 =?us-ascii?Q?pKSfepojCxDlr+9wSbuO5EhEengRVLNPn6dtavyJxWmlDy04/tmSjCX+LsR9?=
 =?us-ascii?Q?MMyrj5cQK8jmTUn52afqXnHE5e+chaTPE9q3gGV50RoqNOMoeAyrYiiBRQNI?=
 =?us-ascii?Q?Jt3p2E06fd4yY79vzFBjZhpOO+Tc08KTkz0rNXLX9f2jkKHL1GXKMfSoANbx?=
 =?us-ascii?Q?q+pvuH8aclLaCpV5pTYumpK+7jji/KzD7aSAoAaOax60TmhQIAccTeAXl7Pq?=
 =?us-ascii?Q?H7sIvIkartqFPN745k/SsXpb1s0b+CbApCoDKvOIfh+x1e7duSDE9nsbr4Xh?=
 =?us-ascii?Q?ajCCeJVEvtXblwQKajYAf5W/iXO+ma2Wa4+BykfOLkb908xPl0HoCT/md3dC?=
 =?us-ascii?Q?CJPYbAnwPCejaRjb5sO4Ig5egja9AGGpcHMqfbvriqMjpp82FnHK6pRO+wcR?=
 =?us-ascii?Q?d2ZEKvsjRrl3ljd+adAIzwZifgGNVk0DoXkCw9XJal+lOYLqsLtaFMC+L/4X?=
 =?us-ascii?Q?/mdOdiEuShahg7kctZgCjeN3ECQNhEKdzyUsKVyERc4Q8dUP/rZjpoicc+Jh?=
 =?us-ascii?Q?0iEFbRcjt+fy+WeSaYa5LncwcBCo3HNZeeyv3BRgXW7kNQNY1PM55osK818b?=
 =?us-ascii?Q?LtYElAfPTioIgCj5jFwJKrSbkbSdz1AekTB2jOwm3PaVipRnvBv0eep8QS/c?=
 =?us-ascii?Q?ATGxjohsWxVlz3HJhGYMcjrkuQ+aHnathRwLXXbl4v8InYmLWtZsr4GtFN9b?=
 =?us-ascii?Q?kMCKgFR7wgAokOapcT6xd3M/Pl6ntGpxIh0AKPv4WCVLhmpyE9WzK247GSvB?=
 =?us-ascii?Q?sJYv7u8bELrhQwVFnMlccVCe2wHHHtZiU8nHm/bB/gM8wkxwcW8tpHjL1T8+?=
 =?us-ascii?Q?u2JeWZeCmCMXrAU=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:50:23.9633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff57f443-075f-462f-0a04-08dd67c6ed58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 15:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213410

On 19 Mar 2025, at 21:42, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
> Add missing dependency on zlib

In your rebasing/committing this got separated from the actual change which=
 is in the commit before.

Can you split the zlib change out from the musl change, and explain why the=
 build worked without zlib or what is improved with it?

Ross=

