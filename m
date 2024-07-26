Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0D6C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:12:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.59323.1721995960536403987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GCJMejyN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GCJMejyN;
 spf=pass (domain: arm.com, ip: 40.107.20.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VCkyAULvQfz/nSyN5gtq23c4el3ru5K2RV8AY1tjMahASJVMEQCcDYrtKSq2VGgVfTxoHYKIbrtSSaXKwJtUEtSvBp0/vtYZj1i9XfhN/3UJZ1nYLCXMoHFh6mdEd+g5y5toV1kLO8ff2jH+j4Lv+lL0eojwpEDsFGT4lMJf6wtzIkymhwgaWUtm2YOV/uTfWe208J6sZ6MqJ0BgpCQhM+ExWulI4xaeDQIPvogwKz3uS4KlrYat1zCtYPQn1otS/BLhq3r7xu0UqANnX0pnwL23IJncjGzJ2ImoILmuCrZfrjoft+ss1Bf20Dw/WU1KbfIjYdGgxjLbObyAd7/1rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8BGQz2v4tiA2rcgBnNKvkDRlHJlfWaMyZX0zXDo2Hk=;
 b=iuLajm4ZpkyEe/W1Zcv1Xv3GbCVLfYllICK/04pDtzGEH+xffKnXn9dsITACCwtLYrlgX8MCD1wTXOyjB++KMf5p+WIkIB07gz6M5foTw7QNixLtyOwQE4iFaDZTWQBeTNPKdI53TamtLG+MVYoQ7rtiqY96n4fpUMbLrrqAveGORFFRGTrJkd4iRX0DEYS7cGsVPG70/uW8CoFhy+JBtUzzJ7erfXatDsPXMm6GVcsTvU+hn2gMRJGF0H0ctGbZjI+H9PFghpyOxu2NfC8m2lK91WpudbukMQML1Wj+eznm7amOO3hGpodMzLywNDwvopSRdF2OW25MaSJ6+pxnIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8BGQz2v4tiA2rcgBnNKvkDRlHJlfWaMyZX0zXDo2Hk=;
 b=GCJMejyNIqSYvzTUc3o7jtBYe9pkCNyT1GbexPBQSOMDp2+w5QtmKfW3+ak0lXqLhAuyIahjJaVz/XHlBv3pAygI52xtUA8g3TwniYdKlIJmQfehuZAkVluqKoj7p+K82fwa9ymBiBQ4wSsKEErRgIfIv+WmpQvpNO8Xsx6F33I=
Received: from DU2PR04CA0325.eurprd04.prod.outlook.com (2603:10a6:10:2b5::30)
 by DB5PR08MB10235.eurprd08.prod.outlook.com (2603:10a6:10:4a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 26 Jul
 2024 12:12:36 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::1b) by DU2PR04CA0325.outlook.office365.com
 (2603:10a6:10:2b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 12:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Fri, 26 Jul 2024 12:12:36 +0000
Received: ("Tessian outbound 0808e8e76ea3:v365"); Fri, 26 Jul 2024 12:12:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 954526103dd93342
X-CR-MTA-TID: 64aa7808
Received: from Lf97c28a9c644.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7A50B403-ED04-4148-BCA2-0633CB42C0E1.1;
	Fri, 26 Jul 2024 12:12:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf97c28a9c644.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jul 2024 12:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px0Z6/8SZV7ZEeWktwZM/SKkWU/LP9/K9/9xX9k2lBFUW2Y5jcMlKlonSOgUMlTTweLuZYwCZaBBveaz4EZncHDx3krENdNwuRTeqHY+ix00xSLjNbl8mYv4ExxHX7YmCk9roTHjSrv6z4n6DlwI6wgQUQFmIw9qBNxQ593LjUJCqdlxVU63+ASnXTmfHqoR5WAZTV48/7+N66VEMADsaknG2ZD//KJO9vnyztLpx+zplPd9wM4O8SQ35gt/FXHSNAIoSjZQ9iD7KBthSE1xZwLnARXmj9cYTxB3Ko89cWYmAedwemgdSFwrw12XHmvDHSiTtgzM2QmiAJ1s0GWtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8BGQz2v4tiA2rcgBnNKvkDRlHJlfWaMyZX0zXDo2Hk=;
 b=vuY53PvleYPMlq16X8W+wBm7vj30EZxZclgycfxDwS1gYE36b97rQUquXQVZf3RjgIbY6N+xO6Is2RGQg42lje4fb6/bf+Z758AS9ELdNLnbjpqjeY/mUbQ7tL2KId32IoofPfDdk4h91D2v3n6NkpD3zKwWLcZ4pt5qoNGDHkLnJPviOqOAo/NJ1795B9yA3DZJPAqfoCSdlms7COsyCrLFC1yq3TtbxqeWvF5NtFkomIgbjJVvKQ1HGk8bacieXfeFIUQAxNHZrSouAx0hi4bQGJpp+ScxfN6aYNsGDjY/fFsYVbvaWnaztvrZLbWgLDrgjV64KcwfS0G4/XSsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8BGQz2v4tiA2rcgBnNKvkDRlHJlfWaMyZX0zXDo2Hk=;
 b=GCJMejyNIqSYvzTUc3o7jtBYe9pkCNyT1GbexPBQSOMDp2+w5QtmKfW3+ak0lXqLhAuyIahjJaVz/XHlBv3pAygI52xtUA8g3TwniYdKlIJmQfehuZAkVluqKoj7p+K82fwa9ymBiBQ4wSsKEErRgIfIv+WmpQvpNO8Xsx6F33I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9709.eurprd08.prod.outlook.com (2603:10a6:102:2e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 12:12:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 12:12:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Samantha Jalabert
	<samantha.jalabert@syslinbit.com>
Subject: Re: [OE-core][PATCH v3 3/5] vex.bbclass: add a new class
Thread-Topic: [OE-core][PATCH v3 3/5] vex.bbclass: add a new class
Thread-Index: AQHa3d3XM35Et5GT30ehRdR2ZcIhfLII7ZSAgAAAy4A=
Date: Fri, 26 Jul 2024 12:12:26 +0000
Message-ID: <37438422-9E9A-41DB-86BB-988D46628ECF@arm.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-3-marta.rybczynska@syslinbit.com>
 <3F580A6C-E380-4B95-9224-1F1336444B31@arm.com>
In-Reply-To: <3F580A6C-E380-4B95-9224-1F1336444B31@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9709:EE_|DB3PEPF0000885A:EE_|DB5PR08MB10235:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a8619f-59f4-4e79-a04e-08dcad6c3c70
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?aHHEwp2Xoh2tL9tL6DQKTEMNDcnRU67z38Nkhef27rH1H4YRYaanCJ4/3y4/?=
 =?us-ascii?Q?jUhfeSsgFTPA4sDJaNaMIGdoZt8YKzaydBUDqaWJ7/EW/dQ/zLtqBnuXcqhw?=
 =?us-ascii?Q?k6sz3/YXiQz1xL4lNBGgSFdBgEMO85VpzG0x0Tcynf6j2SoEtbXuxaUgR9nP?=
 =?us-ascii?Q?7/GtfI1Q2TuPxzHGVuU8NXvZ4mM3fSyMzrJx+H3uB+1OTMlEIuU2ZKUIRgBT?=
 =?us-ascii?Q?HuOC0oVU4kBUUe8BH1dSZa0vAs4pEtROxYuYhuMbGlXnRgGG8dDHRpWjsC9D?=
 =?us-ascii?Q?96kIi4ghQP3bCcElb3UcGW/uwoLb59a+SGISJC0x/lVIb5LpSJbghl/mRrGL?=
 =?us-ascii?Q?cfHPSTB070PFTzsgiFd5QZui1Pvtl4csJWVDxVHrj7ikdKKNUY5rTGCWVG2Q?=
 =?us-ascii?Q?q3nHKkZLujsf+bEEtoxLqGtSculka/5k/VDaNGglB2osfbP6glw/Lj1cHFzU?=
 =?us-ascii?Q?oGNoWwDjgMpgQamaH6mrOJLZvEqon2k/nJTsOafMt4fLDAvNgXrt49CZaEK2?=
 =?us-ascii?Q?AyotarPT+R4M6R4h+aNjaEpfBgvLBA0N68CjlUbf45p+S7MsETx2zOWF19Oc?=
 =?us-ascii?Q?9pOSyhcAfa4Z8yNKxLX7gymad7y797SbY8MFj1tAcxjG8TqcaDvTjhGbWT7x?=
 =?us-ascii?Q?gexaGTtE4icjHiwE34kqmOxXsxp7NDbbXGFgmkpqZSKlT7kQGLLmP/sakUP8?=
 =?us-ascii?Q?L9Wx78Gf/PLMkKqHRByiLc7HFiFwyBKiDz5GbTdq3ln0sO+4fXegbiJ2YToy?=
 =?us-ascii?Q?gcU6PRORNTFP+NOy7n4RM8k0c3l2YXwPUvZoorQtzybFY/FHpnpdHgh32K5I?=
 =?us-ascii?Q?L3XsK0HPLMXitTqnqkLHsLbsP5VFK9dR5OPgZuNHGBqrPRMWoApMQqSMHjVE?=
 =?us-ascii?Q?5IzkFIvtBCge9KWR3daoM3hU0kUO0h8xP+63e6M25C363Jm027BJoHcVBnZS?=
 =?us-ascii?Q?2ChXHt6g8uyxiWxRTfdcJPoA+GMibAIZAMYVOcMe8p4NelENFtYjjsi4UkyQ?=
 =?us-ascii?Q?Op00NduQT5Xbk9iKCKdoQ5YUb1YNSDOXnMvydYRc91ZN4/KNmhpkQC14YZPc?=
 =?us-ascii?Q?nWzj4F+j917HdKPpAsOmCWtzBc1IBnsSv5b+AIa78JBsabzW5/B9JWk6I4AY?=
 =?us-ascii?Q?/inyAaOupfav5ao6NbfFk2uAYwgItFXKQTG1Q0ZkyIfoSVUQlORJVks55moF?=
 =?us-ascii?Q?KYrIZJdaVFeZuTgJ3OD/psFnDlbLSu+Ip2Gx1VJ8QDvsoNT/YmrzBmt+wYo6?=
 =?us-ascii?Q?Wk3by7nvM4A/LViNJrluTjxKW4RoWkOv68zaRscQNcaYRD1zMmDCSHsBsvyR?=
 =?us-ascii?Q?+aN2bpuhhF7vDs6GJEXy+UkfoPUhNDOC0gdszsdQ88zSlx1Or1Gh8baW+gM2?=
 =?us-ascii?Q?Jv6JglY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <106D60F1E1825541AC562692714FF97D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9709
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	047e173c-7ce4-4e1d-bed1-08dcad6c3680
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|35042699022|34020700016|36860700013|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?so682r5CIL60M0+EY+2YJGY5tpSbuhdCcq8CRJVDmTuOVi11MS3NgtPD/Ana?=
 =?us-ascii?Q?NuPYQBFqpD1wxCYpPZq/3aCxRE6vHpySuPsxVRJYUMdSNmOqQelc0y5Pfy9Z?=
 =?us-ascii?Q?JO8MO3LlT2U5MjfBth766zCfyVv0BB+942HlpZjFBY2hiaY03uJtzkInzTKK?=
 =?us-ascii?Q?GOm+SA0cShUrabzOyltzlej8CRbnn7K3fWVf8SGVzXq5IO/9oHylQNrEZE0g?=
 =?us-ascii?Q?ybzKhc7KVDsCDOX1tfg66OFVPq0IZHo3fn8hlRIPqGwc9V2uzRMAInLAxsYJ?=
 =?us-ascii?Q?8DhvtLU+dADLb+/Wk/0rxZyAHkz7dWuYVNXrNNkzurRGK05/Zv2576aU4BiG?=
 =?us-ascii?Q?++yiksPFojfDkqQ0qdYB9qSJvSdvsOcYtZH/OxHBQ7L403eaXTDuHVit3k1d?=
 =?us-ascii?Q?oKlWiAq0Iyi3hSOAaaTjZeO5vxgidqNpHQR655jkGMbEJe9yviVujcHw+qC3?=
 =?us-ascii?Q?/lc/8XBSK8Qqxq5Ya7c0XbWnMjJvkrqagol4VmzyrqemcvcNZ3VTkAbbctq+?=
 =?us-ascii?Q?r+GTcvhqPsgMkQwzju2MaItM98TucmKpzhUhjCGFQwh0ugSqzS6iFJ7GmOQJ?=
 =?us-ascii?Q?+NdEQP/h/1OV0gwE0ecR8G/nXlMGScyPNu+nfYNyNCFB7sHptjaJB4oM3Hs2?=
 =?us-ascii?Q?Y9eDAoFfWcoaJb8GvV+EtSuWcM00cu+t2sBynUZ7kpPp8ic8Ww5KUPHi/Vvl?=
 =?us-ascii?Q?3eUVEFNJuxSZe0p/Sbe4ErqXGlNborrZRqfHXH+c6O7sqqVq7ytGXyJbgXmv?=
 =?us-ascii?Q?B4UXVrDxU4XzSZdZIJyyQgeL/t50KRkVTpkcP5rPPcCbeUZ1UpcOyrusBnFO?=
 =?us-ascii?Q?RphcmusxEk1hlQlrRAOq3akmgr22S/MJECvdtNo7k4pZgw8Nc4Mb/ac12T/d?=
 =?us-ascii?Q?EVewx13Cr4G4R0Az1zxIuWEmirb7Gxs/sG/kY82slAurnGiAfHMnZBUE98Zl?=
 =?us-ascii?Q?01ypHtPcZ7KqB2SL2O7eDUa9dd1rf12Xgvx03yCopqdGRBPn5Cw8VU3aJCYk?=
 =?us-ascii?Q?AfXHarT9zLHbpf0tJh/IKadtgxfne5ItqmyJTKofsESFL5IlQd3NuXObrj50?=
 =?us-ascii?Q?+eu5Rco1BuNqnC5ehV6k0Oj4wMC/dAG83Z3O2wlz3g201BHUu9utjKFzh7g7?=
 =?us-ascii?Q?CNQ39lE4gvSGdb4j7Rx5evUOWnehzJwzzGXP3fx3YoiA5C2cjKHcqc1FUsWn?=
 =?us-ascii?Q?9U1DOO+lMB5hR16K9oeo7DHGl/bbiFYI8aoBU1JGWVyDI1X3//ORvyrtlJWy?=
 =?us-ascii?Q?GE2LMdYLq7L6iUbB6vVwsu4cGiYfuywbFQaFMe+5yPyyxzBIA6lAai5uxiDR?=
 =?us-ascii?Q?wzbP6SRoGmpdsMsHZC09qT7af4XRb1TxnS2trq4NK0h9JQL3u/2ZFKbNcRIK?=
 =?us-ascii?Q?T9P0X5C7iob+g7h3YfpKAcRbt0k3cF062bSvaxm2gk8zTNuyhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(35042699022)(34020700016)(36860700013)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:12:36.1855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a8619f-59f4-4e79-a04e-08dcad6c3c70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202531

Also we should add a selftest for this class, to verify that the output is =
as expected.

Ross

> On 26 Jul 2024, at 13:09, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> On 24 Jul 2024, at 16:25, Marta Rybczynska via lists.openembedded.org <ry=
bczynska=3Dgmail.com@lists.openembedded.org> wrote:
>> +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
>> +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
>> +CVE_CHECK_IGNORE ?=3D ""
>=20
> In the new classes, I think we should just drop the deprecated variables =
entirely.
>=20
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202530): https://lists.openembedded.org/g/openembedde=
d-core/message/202530
> Mute This Topic: https://lists.openembedded.org/mt/107525294/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


