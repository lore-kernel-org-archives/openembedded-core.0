Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B15C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:49:30 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.80])
 by mx.groups.io with SMTP id smtpd.web10.9549.1715258965083207677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mShd1uYu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mShd1uYu;
 spf=pass (domain: arm.com, ip: 40.107.105.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SnM7UnlsxVF4GNCglCf36B75TZm736BdiXGtDUBgBorScX8stUySRlKeXMBD9eOESUH8ujXoxzKhiQVtVVBSqgSR2anrp8Ucr0xICkZ9NmRDgFhIug0IdUDs1C3K8hEjBqut0pfrBZr7VeRc/IqDpsHjBRab5U0LK1AzI6061toAeVfyNdV7/Au+HDmlOMD7+/Ks3QTjHjESJeWFoozg2DqPaQxlRuRsJl4S3T4eQhvtmx3l2TBSspbxMPxXeiS2m0W4bk4HmdkCWWMDBELk2131K98tEe0tE52eebm4MipEUjnR5kKiKRHHbBVEVh6PcDaj+ZcazsqpgpMRsbSe7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTvD/sL6dcWoVV1GTnP4E43IeA45rqYcKz+PYunvrxs=;
 b=HHjsGSKJw74T26uRmx+ZSy58W4Gy9pkWqPt5lPEtHrXEbeEBprzLYkcfVDiM4EAVOGTSaE1JbuBPXjpEDaueGKx98kjr6LhoqudM7si7WCKTEdqSIzpfW28i+jfIyTA6y1Xhu7+HLXJsTYA56w1e2eCTnyeTZkhDwX/WYIcWQMxcVGK5qWbE77DhGmZSoZXdAkpDiRiS0QIuhu8wTJS6iO6+/KbBfLCsnq0BkdlAlGzm4qRipcjEhroIpWNy05OlF88FKXe52KEMbSd3nqSm2zqWs1h91KXGPWnYfEHNG/OhaiMiVNpE9G4cYq9t6/ey7yHs/HzMSCEhMiRYFTGWzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTvD/sL6dcWoVV1GTnP4E43IeA45rqYcKz+PYunvrxs=;
 b=mShd1uYuqPXertqCfumohHPbaQft46nf5M0irmUjfk2fdMuSYrMIPldqmzur6BVIKLe7JeUdhqZWdJgpzJ0o7khs/8tKYjnPVYO80KgaEb+gqIU5AcXXOSm2blH7MRr0xVCqCTEfrt8pXXVXZpFD4IBe8QMXuffux8wrxjpKJT0=
Received: from DU2P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::17)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 12:49:21 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::36) by DU2P251CA0013.outlook.office365.com
 (2603:10a6:10:230::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47 via Frontend
 Transport; Thu, 9 May 2024 12:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18 via
 Frontend Transport; Thu, 9 May 2024 12:49:21 +0000
Received: ("Tessian outbound e46bb127ed3d:v315"); Thu, 09 May 2024 12:49:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 508ac6ef97717605
X-CR-MTA-TID: 64aa7808
Received: from 922e8b14592a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81BF9E90-15D5-49A6-BC70-E427075332DC.1;
	Thu, 09 May 2024 12:49:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 922e8b14592a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 May 2024 12:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5kJFpI3/pOb4xqt9nA8TVSbsVk8vOgVuq4qgrDGN7YgS4U8QzOp4W15rwFq2OIGoJHmmAxmwIqozK1+onINySDp7tBMi4pX6/pt3aUun7OkrvZCrziV6O+H6ha5vCz6GPQPqzemW9uaEpm0/uwvcL78ge8EpCKl+v0s8CtYsH1VY+xig3P9uX9uoWHLaUh06oM2zsdbYrtaAddAF2J6Vch43M+Et4gsZiwi1WNruzb3BV/8SlxsetBJSBcGPh4cwHZvOYlfRN9XRo3ZGUiD5EtFschw6pQ3MJBbB3kO1Z9DJK+ZU1uBf3MPqt6GSv5aCqQ3RDZw8eDSc5qIFDeMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTvD/sL6dcWoVV1GTnP4E43IeA45rqYcKz+PYunvrxs=;
 b=efUf0jeXKPyxQjuwanm/2oLkjoh5o/P0kYgd+xu2UMAmph07CH1HR492GyEcGi53PJe9Q4XXTUiEV9+wZMpLAtqnmbtKANSWhoouUL2CwfxQechMFpYw4+qHy+Lxp/YV9ttqPvzFMQksp5DVcTBtufGobUNLKtXytsDorHauBYUOqpNnJXbF8t9LkUEN9c3J46nT66GDfUDbNsszB623coHRJd6txSi3J9axO9xlBudO2Z7buStKqps0ZGK8p6rpAvS2XuZsDacnmCdGiKKMuEGWhYG3Vgtg/tzEJA68CJQl31Ih56iujPPRyZQB5kzoy8hNVXDEEMd2n+b7/03flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTvD/sL6dcWoVV1GTnP4E43IeA45rqYcKz+PYunvrxs=;
 b=mShd1uYuqPXertqCfumohHPbaQft46nf5M0irmUjfk2fdMuSYrMIPldqmzur6BVIKLe7JeUdhqZWdJgpzJ0o7khs/8tKYjnPVYO80KgaEb+gqIU5AcXXOSm2blH7MRr0xVCqCTEfrt8pXXVXZpFD4IBe8QMXuffux8wrxjpKJT0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10859.eurprd08.prod.outlook.com (2603:10a6:102:3d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 12:49:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.041; Thu, 9 May 2024
 12:49:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "anuj.mittal@intel.com" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] enchant2: upgrade 2.6.9 -> 2.7.2
Thread-Topic: [OE-core] [PATCH 1/6] enchant2: upgrade 2.6.9 -> 2.7.2
Thread-Index: AQHaoCWidQqZ4HY2I0Oe999wuy1s2bGO3jyA
Date: Thu, 9 May 2024 12:49:11 +0000
Message-ID: <CF5B778B-6A2E-458E-BC04-57541C0695E3@arm.com>
References: <20240507022308.13637-1-anuj.mittal@intel.com>
In-Reply-To: <20240507022308.13637-1-anuj.mittal@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10859:EE_|DU6PEPF00009526:EE_|VE1PR08MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: e99915de-0599-45e6-8cae-08dc70267281
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?n4sstdYUGRGyEgCYbYffd4l0jhULVKAUWbPLZl9ELseQfqF88cNHxBySxsrz?=
 =?us-ascii?Q?il5vsmgbTbKUyxKiVagRim2sK8aCUMocxZhedAf3iaQC9nuvPOHx+Zy/R/dc?=
 =?us-ascii?Q?Ja+Q32Jryw9CpffuyToBYdy759YSKezvcxWigp38ZMBpGOnrNnXqmW134Iej?=
 =?us-ascii?Q?kJ3BPywHtV7Zal5RMtJ7O2c3Eo4REcGiRbsa4L8045rKV4W/iZQGVy1P8wK1?=
 =?us-ascii?Q?RGR3O85CYE9V3eiRH6tDF0gfFSwqb8rnckt99MQYfz1LNOA6+uC6jX4ReVcU?=
 =?us-ascii?Q?v4pFzPlFVz4VlPBV15KpQBuIS9vEZm/9xbZK2S41nlLKKB1vBTo70g3JWuX4?=
 =?us-ascii?Q?lQesgkL3+CruV3R6K82gkJ1F5nsXxYHwoU1Tukhqma9M7XXiq55V4M4RcL4g?=
 =?us-ascii?Q?1iNdh13fn8d1lXyJEm1CF8f7e+jXLMYfUE+/xSg16ovBeJ2wHby8tmbGVEmb?=
 =?us-ascii?Q?2xSxTnc7uQVs5n84G8HEiziHdyUcEy/bDBG4bXDWptRnBR+qObmDHMS0idQt?=
 =?us-ascii?Q?l4FQ0BEISQOTpijZH+ukA2Vl3VIsYlJNbO9nYnFMDcOQgRlISvDPye/klfD8?=
 =?us-ascii?Q?nN8ep3G0GRAdXJYDjuwf3k9vlBKyJU59b1eL0lm0zg6zyJGLMweztiKFDvgv?=
 =?us-ascii?Q?4Q3rAq6h3UXwe4o0B0sVKKVyZWdE2CD1ZIZUYiRtGLfgCItJ/NYF2SrRv5xK?=
 =?us-ascii?Q?/9u3A8U6Nh2vM/OsurzdDZ7K9Tl1vieDREOhwWQYzRysQNWY4DsaCqF7FeCz?=
 =?us-ascii?Q?CGuhdGsFyW6IfZq6UxIpC+PmcMgLPO/q4zbF2I8ELV67/aQdf/GMjp6NxaeM?=
 =?us-ascii?Q?46WV5FrIWyYHmEWdkkw3qya+p+x0CHptOJGvc8SPn4hsFfFOGjKIXi5rpZOV?=
 =?us-ascii?Q?W//VYo5JML8vmEfRjBCY/oH7z8zyBcs1bypK/duBhACdg7gdBH0+IW4kf7PS?=
 =?us-ascii?Q?/Ptv4kZkYqRf+wwM/ISOlIEx8Gta7QbbHD0JcU9t0r3nOXyD8DkGxdGjOlBe?=
 =?us-ascii?Q?gjio9/W+OCPUWOBE7qHDpoAO3dBKpQEVZ+yat5J59XIYjjYRPbcxaqH0SK8S?=
 =?us-ascii?Q?hmJBxlAdpKYWfZiC6VptfJE15nOL8Yc4uPnL97rW3jmxf8vtHfShDN4FzQJO?=
 =?us-ascii?Q?ns5qEOIcjHIIrPX0Jzc5VqpF/3uF8StLpCaGPyXEmuQ+v5PMw3EsPSUW4/tW?=
 =?us-ascii?Q?SpXxmMVc+5ZyROd/sj4OXi12rMABHJEA1X99B0arFJZhuc37EVz45tM3tELN?=
 =?us-ascii?Q?cmH2OVrcOoJOneX34SuR2Ksa9tWWBHjB8P1ZvKeepbFrVl/hVc12qpggDU8L?=
 =?us-ascii?Q?3Qc=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67D159332B6F094092B1FFD45478D4CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10859
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3e395135-59fb-43af-c025-08dc70266d0c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|35042699013|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p66KmI8iKOX9d6vsWnCl6seJjht2Gjaz4KCzfsFFLOOBxsvFMctJr7rQfho6?=
 =?us-ascii?Q?xTVysoSw4djn4hhliyKNrWXV0N8pJpL2XxAjCOD9u8/95o1zOsifvPDoWogI?=
 =?us-ascii?Q?Zeao2DB87kzMrACBWTPaBsDqyRep184bn8lfkHY0Af5T9EeLWXuZYjR/AwgP?=
 =?us-ascii?Q?ZNcXe4A+j3Hh8Lf2JmDUU0v+eBDlFlJU25ygKoiZFJ05px3kLuXbyFXN/gMR?=
 =?us-ascii?Q?mfhmaql+HT26XHvpPU7hZgoJ5QALfJZ9vH3Ats+t4CobdkvZE6SqgPdMo/FA?=
 =?us-ascii?Q?s3PwinGg92UciMPd8tbgzA3VO3nHy/P7WkW4nsVp2VfJKo2/4c1QsaWE8Bte?=
 =?us-ascii?Q?ZEnYP+AyxTJyTzrFkqnxcq+OcMOYEj4Gilszb6+IV28vxkS2C2EIEZKybnCB?=
 =?us-ascii?Q?Lj5WM/9DcnqSgpEjkg9qJfcb1+Wt6xGWFCIh3c3xs0YTyxz+155nAh3TIJbz?=
 =?us-ascii?Q?Q6yVoGQpYGwxM4jeVCdtNTX0vyGFvy/8FL7CydIPHGUNmIkjXFRk1kcPwejP?=
 =?us-ascii?Q?YPCdA0IApPT/0RaD1oXuFk1DspdBc0tvixwxFapCG5+wiTqtguw6OnnoGkJB?=
 =?us-ascii?Q?D7wEQqufRapwAlEZ00LgmwSe6rAe+5DXq1SfULyVXSKtvavMWbz4NMyZuhFi?=
 =?us-ascii?Q?IaFq3gk13ynHWIBuYB4/m+LAgGXrPloYqyGRriTPglDxLin7pUPZTluRC7V4?=
 =?us-ascii?Q?VOj0URwv+1IJLHWSrDpcteLcOxB6KX4ZezvUMJpgUizIwa1K/O8QpbipJK53?=
 =?us-ascii?Q?oDRfZwH18ecfhR0Y21muBCVMCbJNh72tp+BHaPsKh8SV5ixd2h8MWHVY/bvK?=
 =?us-ascii?Q?vCr0gd4Hn/TLuAqv9NIIbgpFDGnL0eVcBGl0MCNfrBwyKvoiWhhq1unbRXsZ?=
 =?us-ascii?Q?k5ej2JmcegHcskAR1N9xqKMXyJgbUm5XJWLgBT1BOVgumHs3G1JKKFPq4k9G?=
 =?us-ascii?Q?cNKEb03z9FH5BZGxIdxs/fb/VE2qcJ8kwDeuXS9kBcXbBPgZuHpXKXW1ZXSf?=
 =?us-ascii?Q?Z6Dh6EwaATdt91P3aUrBeoaVc9TukAbfF0Zs7/icqT4QQ7vyYtbdOweG3Idh?=
 =?us-ascii?Q?4OVAoXXkEylSWl8bgAGu3lUjP4u4y4AqF2zfRT/8EMqg5mBieCrhAdtS+VCt?=
 =?us-ascii?Q?+P7Q2gm200xhor7dBPkGZNsG9WTgef+xQKF/ocIhvuVmoc7IG9z3gEuCYyoZ?=
 =?us-ascii?Q?jQoX1/FxqcZeKFjLsbjbyNvXA+IuoEDcq+2DB4JO6/rf8lfQAFMIDMuRYFrB?=
 =?us-ascii?Q?WnleKrGr67v9EdaJN2hL1nD0RjBeSLCdliJquB1o1Yv9d+kXGOOduVH9kcNT?=
 =?us-ascii?Q?ecvlaoJ+LPYxrv7ko1u7O+VL9CpLKwUsQ79XtRqO+/Ajjg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 12:49:21.1772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99915de-0599-45e6-8cae-08dc70267281
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199174

Can you respin this to 2.7.3, so we get the vala/gcc14 fix?

Thanks,
Ross

> On 7 May 2024, at 03:23, Anuj Mittal via lists.openembedded.org <anuj.mit=
tal=3Dintel.com@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
> .../enchant/{enchant2_2.6.9.bb =3D> enchant2_2.7.2.bb}            | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-support/enchant/{enchant2_2.6.9.bb =3D> enchant2_2.7.=
2.bb} (91%)
>=20
> diff --git a/meta/recipes-support/enchant/enchant2_2.6.9.bb b/meta/recipe=
s-support/enchant/enchant2_2.7.2.bb
> similarity index 91%
> rename from meta/recipes-support/enchant/enchant2_2.6.9.bb
> rename to meta/recipes-support/enchant/enchant2_2.7.2.bb
> index aaf3525ad8c..08998dd48fe 100644
> --- a/meta/recipes-support/enchant/enchant2_2.6.9.bb
> +++ b/meta/recipes-support/enchant/enchant2_2.7.2.bb
> @@ -12,7 +12,7 @@ DEPENDS =3D "glib-2.0 groff-native"
> inherit autotools pkgconfig github-releases
>=20
> SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D "d9a5a10dc9b38a43b3a0fa22c76ed6ebb7e09eb535aff629=
54afcdbd40efff6b"
> +SRC_URI[sha256sum] =3D "7cc3400a6657974a740b6e3c2568e2935c70e5302f07fadb=
2095366b75ecad6f"
>=20
> GITHUB_BASE_URI =3D "https://github.com/AbiWord/enchant/releases"
>=20
> --=20
> 2.45.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199058): https://lists.openembedded.org/g/openembedde=
d-core/message/199058
> Mute This Topic: https://lists.openembedded.org/mt/105953362/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


