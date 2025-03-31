Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E415DC36010
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 14:45:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web10.54268.1743432321741783589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 07:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UknFclbc;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UknFclbc;
 spf=pass (domain: arm.com, ip: 40.107.22.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vUQZVi6Z5OSBeuDKfYxsSMzS9AwwVNoSevq395yLDtMnAvxxP7qQ9qZpNWEIP3pBlgrnrZXYmWkTeEcStBUDXNcuKgL5EFRrx8IN1DZbifWyyyICoLBOlydQib3w30B1xeqB2DE88EUuEIOclHwkSkEFA5CxOrgKoGpzm5i3cLdSnX3z1/A67coYMDJLNLcvSy8NquIkP6Uo90dffoI7TL7SsbTdp/sL94scW4lg0PoG6FoNg0OZPDHzcG4+rfAGVDvlw71q0lDxW7xF88GAPflf293BRxQkTWCWF6gOqbmPBgm/GoGu1ozWdixSvz0ufDHrPSIHfvGVDcXEF/zT8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnV1RVceO39aL56/q61auGVzi6DvyMXXB750r0a+Ri4=;
 b=x+x8svGuV6O0M4MllFYA2JlFBZEE4koFwr9PV+K0nOvapNBtxVHstHc0pefHOq1puPAsi3fB278hNoHgTrZoGdB6SmC8JQf22ESUpH2T+8ucT4PrIC8jSrHI6Hr1wjNTDbj9jHvRCNeHJ61fAMt6ZVn9WQ/iRjGn/+JdZzABQxJkqncI887Qol7LSXq/j+TVbR5uQNat0flXzufDAP7HynN+RjeFA5lbtnj4UzqRU63+0ls+W9RD4Nvv4YB1tSyoc/ORPVkwYa3rR4M9kAt34GnSRbUkRv9EO0XsdekKg3dQGtvB9LNbJpSzBWyIXfe1HMCYAe9XoHRDc924y37EqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnV1RVceO39aL56/q61auGVzi6DvyMXXB750r0a+Ri4=;
 b=UknFclbcWqUW/M4nvs9sMQkUvcRzmYoCckok65bcg68KPekAtfSSXfAz+5HvkCilweNsibIHhO8zXdHkMP1fEc5mEFVK5zYvyZOl4GZWYke3xRRTEv5Go24DP77QJI/1PX6n3FqT4Gh/JnmJ9u9TBgw13m8U6Y++K5BNrYiY2HE=
Received: from PR1P264CA0032.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::19)
 by AS4PR08MB7502.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:45:18 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:102:19f:cafe::6c) by PR1P264CA0032.outlook.office365.com
 (2603:10a6:102:19f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 14:45:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 31 Mar 2025 14:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRHQChjwGhrg1DHFEVeAwwlfKA26BTTTOPkeBepglRU0zBKQ8Scx4QthztShcJvjhI0Ux/hi6tAG7CoLfncuDFs+dFalAoYr6tfNpc4MvRPuDH102rrfR2uCJvOdTwBLcg2sYsIYEn6EtwrnI9IN4sgM0F565Kipvy0nrLSAwSeALqG09qNoekFaACdpj1nV82GyS3VO+ulXugXVZPUmtPb6m9uqhwEOTX9+BwvINtrhRYKLfAXCrvSAe+RPpGObXas13liHLD2xug6XApsIuqhv+Lz2rGQtF4OX1UtRtxK+qijsKinjlwdok8a3Bu9Ac5d66nY1Uyc3BeBxEVV5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnV1RVceO39aL56/q61auGVzi6DvyMXXB750r0a+Ri4=;
 b=hzRqyfBxNzklQqaEunLcehS6vFK2m4XtBZKiQSUgxtQ7c8B4JcRhfvdUtXrZAxAtdri8CkdtLKpe8Fx5HAKfrtkHc6+K+n4yriHD310wtg/oSxAyVIQzNnOk+x0erIBap9qts2q77U7voxEyRLDEBkPJWKV5C+oHLeDO3CR/Huj7SgZusZczzt32ltYvRbUQdl4Mxul/SQ+vW90yitKC3YskYkGUhjuqhvKHAAIDooGzREOSC+FwvwPPwZ3jt+SV3yS5NQ2G8VOypL+5W+iK6zyrXEbk6F4ZbHOCvBDtuu1OuTIUmzWBXb+z5k+JCtORy3n60BQwuiP52g553kWKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnV1RVceO39aL56/q61auGVzi6DvyMXXB750r0a+Ri4=;
 b=UknFclbcWqUW/M4nvs9sMQkUvcRzmYoCckok65bcg68KPekAtfSSXfAz+5HvkCilweNsibIHhO8zXdHkMP1fEc5mEFVK5zYvyZOl4GZWYke3xRRTEv5Go24DP77QJI/1PX6n3FqT4Gh/JnmJ9u9TBgw13m8U6Y++K5BNrYiY2HE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB9984.eurprd08.prod.outlook.com (2603:10a6:800:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 14:44:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:44:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/4] toolchain-scripts: Export meson settings
 for SDK builds
Thread-Topic: [OE-core] [PATCH v3 1/4] toolchain-scripts: Export meson
 settings for SDK builds
Thread-Index: AQHboNXHF+6qzh/B7kedLOdjz3rcArONVSgA
Date: Mon, 31 Mar 2025 14:44:42 +0000
Message-ID: <DB618274-577E-40BB-A811-A96042B3FE73@arm.com>
References: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB9984:EE_|AMS0EPF000001B6:EE_|AS4PR08MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 238e82f4-4ce9-49ff-2289-08dd7062a669
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|38070700018|4013099003|8096899003|4053099003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?jRAtzqNCmwCL4Y0alXcQEBGSMrCGT9A2AEeNOl6Zc4v+q1w+AMwkfkOzczSD?=
 =?us-ascii?Q?f69Rn/CUMGPyI787zS/gFN3jKC2HBqjd5IpwDe7MszJBdIZtGEppGkw/JYlq?=
 =?us-ascii?Q?Tmi5m7xFD3PhzsLwghkeI6ggPrLLOpwFdrYmFFenc2z0Gb7XZiDKnf9Wq98E?=
 =?us-ascii?Q?y56fxhCiwDTQ7hoTm4gJt5L3FT9wIyoAHrtYyPeqkTq7PD1eU1NDrqajhiX8?=
 =?us-ascii?Q?VzT7J+zzv8wl8Qz+yiVzjefk+x6TLsWcp+geU1wPUgtkdgKROotvDCzIJW9T?=
 =?us-ascii?Q?qUgUt7KeH5HClbGCfpdMTMbzjlkzYVNlYuC4OLpwZWBOPsbPyPGrMieuc95A?=
 =?us-ascii?Q?rQ5sSdSUFCmf50B5+dA2uItu+RY0wgOxsPRO0nHHCxyNpXIOni2hZhwvge/e?=
 =?us-ascii?Q?67svr3FyamnP2W7ZvW3pepdo0153x6d3/qiOstEsCH8pFjBAV0yoV/yXHjh1?=
 =?us-ascii?Q?7cK2/KGyEClblUX/s/lLrpoAUhj2i+n/XQewn8a19dGg2l7Nel8yASs2O8PL?=
 =?us-ascii?Q?OL06VcQR8TAbe4WVcUEIxAy83njbfV+A+/Zb0njJ1GX6Dx3HKbiLA5cepfGV?=
 =?us-ascii?Q?mcmO7aJssJi+vCA1rxWIP7xNKlYK/d2d6Qn6dEHl5UU4mqZisEiQv2BR5hvc?=
 =?us-ascii?Q?+QPQ2QqPXCW/FEDecfx0o+tbgPMElwsVG1NcjPieNxVMQreOcuY59GoUxjzv?=
 =?us-ascii?Q?/ERJJso66bhbcV0rA0VdYIF6DUdOneSqF5kpGp1JZ29p6JY480k0SipvzF1X?=
 =?us-ascii?Q?g+hqDKD174Re+xRqIKumSosC7t/KY1DnOzo0xMA1+rrbhNdBh3TTSxR61lh2?=
 =?us-ascii?Q?pVv46nJ3wbDb9oH2eA7yViosHVMnAF9lAmKiBru28rmD6cE1aj31KA1Kf4dU?=
 =?us-ascii?Q?UKhFkwZ1+KnCvS4ZF9CIOBYcZq5J9Eu38Dqy0xROpsDhbcHOoSlWN/AlbaKV?=
 =?us-ascii?Q?u6kgeDpIr5fGelCn+VVNNLjFghdlTlkhEVq0eWLi/z2MquJe8BFceRxGrI59?=
 =?us-ascii?Q?7lgd7Nd2OPsBbC+73NvBdINKaY8s4Mb8jQ1B70G3IgT2PmozlZ1IVD2eObrL?=
 =?us-ascii?Q?tDnei+G/takJRdkT2dKPDN6ljsclu/tqour2PzJBu6f9+eR/ewOlRlR5uuep?=
 =?us-ascii?Q?K20bqKbo1eN08h3CgX3H1kX4N8uT1NLaQGMpLwkG1e62ZvFB3Wjzj50nrxqX?=
 =?us-ascii?Q?AEH4IefjG6ZrpBsrHdR4jHWVN/sGkTgOtz5L8h2oKA8xqzlEfPpYgMUVzNd5?=
 =?us-ascii?Q?/MYVsiGbOzwc7GF3h/DM3AbT5/BpCC+m7ZyRkx9gDH5BwSZBJUm+Bt7l2Y5N?=
 =?us-ascii?Q?fW+ksKNQOSIYH0CvRqC0RtZxGxeYNL97kIOAyU3P7wmmoCwNGPCAIfYID0K4?=
 =?us-ascii?Q?979a6OE+cHnG3L/6+dIU0aCczg2XHXgbRsz2toqwNQJdNX8Xjfnw2U7jNkOk?=
 =?us-ascii?Q?4BjkK7vqlSMnDe6s6wA7EqXZhJU0aQX/?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(38070700018)(4013099003)(8096899003)(4053099003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
Content-Type: multipart/mixed;
	boundary="_004_DB618274577E40BBA811A96042B3FE73armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9984
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ca5577ae-4c5f-48a4-54e1-08dd706292b6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|4022899009|14060799003|35042699022|1800799024|376014|8096899003|4013099003|4053099003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XVEmwXTOYUGwUce3sgAsWwm9mRw9lkh74JD1ZBpXntkD+6TgdnypgyKtFB3F?=
 =?us-ascii?Q?xlc7zWUm3k5uhwTkc7h9fNJOgIlSQcDPZ/nRxUkeyeHsL/sRdmCkToJ5RwYu?=
 =?us-ascii?Q?Prkygon2ojGqmZzQWLEpwVcr1hDu9LfBohkseAUDXF0p/3AWEGjeNIMO/+ub?=
 =?us-ascii?Q?D+IehxrY+X3z5Tl1Ek9LZeBLvKDyXwm7XtInuL8tshjmyCk7F8fCsD9efLeQ?=
 =?us-ascii?Q?vv+RLN70nMAnAt52lvjy3pyGf+TDkWllJ3AB1SCb/CyOkHykW+70/Es9yD3q?=
 =?us-ascii?Q?HQHRIVGKDnuPklY1MBUf8zeeklPshG6iyvHNxe1y4tKiQx4ZO4u0pQWVDdqq?=
 =?us-ascii?Q?5cIcuvQu4jF+9znITvwzv/lzJqsCWXi9hrp2AOfm7CYBmKA9kpjOWSCrjq7s?=
 =?us-ascii?Q?j2T1RP1K6HB7cdxjHgETWRPCZB+laB2+djpf9d5QyiqqQ6Yrfx09z/ScOVxO?=
 =?us-ascii?Q?ILzuNPyvm/182BI5A86jJaR7gvzi7pYFfjRY6773CVl5FUWszVioXvMHFnlo?=
 =?us-ascii?Q?m0joFgkt7pvg7x9aPuCfXtZTMCbCcOHTgArpAI676XIgzKbsR7l7iGWKTKu0?=
 =?us-ascii?Q?wqvsJSrUeEurOyUgIA01R0jfUpqxxqtaNsXKTuCmAx0UM9qg5YbQ9EWAoZGt?=
 =?us-ascii?Q?m1kKNMTlYqLhQWsHKrLbHP7B3tctX6kzyi0xBlUrYPJYuVnxh9zB1nDJJy46?=
 =?us-ascii?Q?/MM0yt0iXScNv7F4BzhvCvd7pC1Z7dUfJ1dY3UYxbjUndgze7CA9I4C2TwCm?=
 =?us-ascii?Q?vSIGbhJgBt+dHSWsAu4S/oRX9M3Lk8oLN4OMD5DVrk93XT6W2i/B6g3UY6Wo?=
 =?us-ascii?Q?IwjzeRqeATiSstd2BV1BauG6F7912qEdGJA0mQ9JlPHCdCBR1t7I4UvIK+8y?=
 =?us-ascii?Q?yclU47P/+ZxF6l7gfGhumGkYO++ocbP/n/qRmnCLb1yfcmPhNPT94sbKPYHg?=
 =?us-ascii?Q?7/NQ7NZ1E2PontQX0JZTM9NC398W3+j6Gjrt06yonQUx+xXjyeeeIc04MrPP?=
 =?us-ascii?Q?zu02Uh+OOYb50AUqHqHEat0ceQsLENmZlVEBtB4484TrCUSsLKTz8CGzKbc6?=
 =?us-ascii?Q?nlQT9W18IlSx48J7SoIZsbzxh1oPJaBc/9iG+3r/HEbT7Pw7SwSH1r9pqr9I?=
 =?us-ascii?Q?REA4PcRmV1JAePynllBMcCmwM2aT2ZQvkTPwPwamXVn+XDBclFuRewG4SKi7?=
 =?us-ascii?Q?oDrQBLmsjpNb63qMDVFoeQsvtQPG7SHIerSHuOMMpqnRcTVPsSAj2MFfs9my?=
 =?us-ascii?Q?xWl6nQuKjRgZcZJRVNii7rfdVygR8mKID0+Y1Bkhk2tM6GV/OBJBoGo0fKb1?=
 =?us-ascii?Q?01TYn92y8mw3zEOCl1fDHC5mg2Zsnmpn9nOR+vNejc2j7yiEXKbyqIdOQMuM?=
 =?us-ascii?Q?dhRf1BbtAYwMb+6+a8+cYkr013/gBh8n4TLm4kQxjKo3v3FN4iRst4Z9nW8s?=
 =?us-ascii?Q?+NKz+yLIe67P++TvUxhkg/zglQiCZyrpSHPPW32S42ZOtfBAwHcqDK0wsb95?=
 =?us-ascii?Q?veR0ARsEEfjRPpw=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(4022899009)(14060799003)(35042699022)(1800799024)(376014)(8096899003)(4013099003)(4053099003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:45:15.6398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 238e82f4-4ce9-49ff-2289-08dd7062a669
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 14:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213983

--_004_DB618274577E40BBA811A96042B3FE73armcom_
Content-Type: multipart/alternative;
	boundary="_000_DB618274577E40BBA811A96042B3FE73armcom_"

--_000_DB618274577E40BBA811A96042B3FE73armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I spent a little time glaring at the meson/sdk interaction previously befor=
e getting sidetracked, can you verify that the test case change I attached =
still passes?

Thanks,
Ross



> On 29 Mar 2025, at 18:08, Tom Hochstein via lists.openembedded.org <tom.h=
ochstein=3Doss.nxp.com@lists.openembedded.org> wrote:
>
> Create a new set of exports for the Meson `host_machine` cross settings.
> This allows the target cross file to be created correctly from
> meson.cross.template and aligns with meson.bbclass.
>
> Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
> inputs here, aligning nicely with the Meson naming. That turns out to be
> incorrect since the script is generated in a nativesdk build with
> HOST_OS and HOST_ARCH set for the "build machine", not the "host
> machine", using the Meson terminology. See
> https://mesonbuild.com/Cross-compilation.html.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
> meta/classes-recipe/toolchain-scripts.bbclass | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes=
-recipe/toolchain-scripts.bbclass
> index b59a295abc..e54685e965 100644
> --- a/meta/classes-recipe/toolchain-scripts.bbclass
> +++ b/meta/classes-recipe/toolchain-scripts.bbclass
> @@ -4,7 +4,7 @@
> # SPDX-License-Identifier: MIT
> #
>
> -inherit toolchain-scripts-base siteinfo kernel-arch
> +inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
>
> # We want to be able to change the value of MULTIMACH_TARGET_SYS, because=
 it
> # doesn't always match our expectations... but we default to the stock va=
lue
> @@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
> echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
> echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
> echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
> + echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TAR=
GET_OS', d)}"' >>$script
> + echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGE=
T_ARCH', d)}"' >>$script
> + echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
> + echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"=
' >>$script
>
> echo 'unset command_not_found_handle' >> $script
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213889): https://lists.openembedded.org/g/openembedde=
d-core/message/213889
> Mute This Topic: https://lists.openembedded.org/mt/111975257/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_DB618274577E40BBA811A96042B3FE73armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <A9C23F242EA5254EA7C3F29C82920B5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I spent a little time glaring at the meson/sdk int=
eraction previously before getting sidetracked, can you verify that the tes=
t case change I attached still passes?<br>
<br>
Thanks,<br>
Ross<br>
<br>
</div>
</span></font></div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
&gt; On 29 Mar 2025, at 18:08, Tom Hochstein via lists.openembedded.org &lt=
;tom.hochstein=3Doss.nxp.com@lists.openembedded.org&gt; wrote:<br>
&gt; <br>
&gt; Create a new set of exports for the Meson `host_machine` cross setting=
s.<br>
&gt; This allows the target cross file to be created correctly from<br>
&gt; meson.cross.template and aligns with meson.bbclass.<br>
&gt; <br>
&gt; Note, one might think that HOST_OS and HOST_ARCH would be appropriate =
as<br>
&gt; inputs here, aligning nicely with the Meson naming. That turns out to =
be<br>
&gt; incorrect since the script is generated in a nativesdk build with<br>
&gt; HOST_OS and HOST_ARCH set for the &quot;build machine&quot;, not the &=
quot;host<br>
&gt; machine&quot;, using the Meson terminology. See<br>
&gt; <a href=3D"https://mesonbuild.com/Cross-compilation.html">https://meso=
nbuild.com/Cross-compilation.html</a>.<br>
&gt; <br>
&gt; Signed-off-by: Tom Hochstein &lt;tom.hochstein@oss.nxp.com&gt;<br>
&gt; ---<br>
&gt; meta/classes-recipe/toolchain-scripts.bbclass | 6 +++++-<br>
&gt; 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/clas=
ses-recipe/toolchain-scripts.bbclass<br>
&gt; index b59a295abc..e54685e965 100644<br>
&gt; --- a/meta/classes-recipe/toolchain-scripts.bbclass<br>
&gt; +++ b/meta/classes-recipe/toolchain-scripts.bbclass<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt; # SPDX-License-Identifier: MIT<br>
&gt; #<br>
&gt; <br>
&gt; -inherit toolchain-scripts-base siteinfo kernel-arch<br>
&gt; +inherit toolchain-scripts-base siteinfo kernel-arch meson-routines<br=
>
&gt; <br>
&gt; # We want to be able to change the value of MULTIMACH_TARGET_SYS, beca=
use it<br>
&gt; # doesn't always match our expectations... but we default to the stock=
 value<br>
&gt; @@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {<br>
&gt; echo 'export OECORE_TARGET_OS=3D&quot;${TARGET_OS}&quot;' &gt;&gt;$scr=
ipt<br>
&gt; echo 'export OECORE_TARGET_BITS=3D&quot;${@siteinfo_with_prefix(d, 'bi=
t-')}&quot;' &gt;&gt;$script<br>
&gt; echo 'export OECORE_TARGET_ENDIAN=3D&quot;${@siteinfo_with_prefix(d, '=
endian-')}&quot;' &gt;&gt;$script<br>
&gt; + echo 'export OECORE_MESON_HOST_SYSTEM=3D&quot;${@meson_operating_sys=
tem('TARGET_OS', d)}&quot;' &gt;&gt;$script<br>
&gt; + echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D&quot;${@meson_cpu_famil=
y('TARGET_ARCH', d)}&quot;' &gt;&gt;$script<br>
&gt; + echo 'export OECORE_MESON_HOST_CPU=3D&quot;${TARGET_ARCH}&quot;' &gt=
;&gt;$script<br>
&gt; + echo 'export OECORE_MESON_HOST_ENDIAN=3D&quot;${@meson_endian('TARGE=
T', d)}&quot;' &gt;&gt;$script<br>
&gt; <br>
&gt; echo 'unset command_not_found_handle' &gt;&gt; $script<br>
&gt; <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#213889): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/213889">
https://lists.openembedded.org/g/openembedded-core/message/213889</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11197525=
7/6875888">
https://lists.openembedded.org/mt/111975257/6875888</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [ross.burton@a=
rm.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB618274577E40BBA811A96042B3FE73armcom_--

--_004_DB618274577E40BBA811A96042B3FE73armcom_
Content-Type: application/octet-stream;
	name="0001-oeqa-sdk-meson-improve-test-to-validate-host-build-t.patch"
Content-Description: 
 0001-oeqa-sdk-meson-improve-test-to-validate-host-build-t.patch
Content-Disposition: attachment;
	filename="0001-oeqa-sdk-meson-improve-test-to-validate-host-build-t.patch";
	size=2489; creation-date="Mon, 31 Mar 2025 14:44:42 GMT";
	modification-date="Mon, 31 Mar 2025 14:44:42 GMT"
Content-ID: <6F4F38EC32E7C741933F10EC1596CD69@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA2MTFkZTEzMzEyYmNmODVjOGFlMGZjNzI0NGY1MTJlODIzZTE1MGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KRGF0
ZTogRnJpLCAxNyBNYXkgMjAyNCAxNTo0NzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9lcWEv
c2RrL21lc29uOiBpbXByb3ZlIHRlc3QgdG8gdmFsaWRhdGUgaG9zdC9idWlsZCB0YXJnZXQKIGFz
c2lnbm1lbnRzCgpVc2UgJ21lc29uIGludHJvc3BlY3QnIHRvIGR1bXAgSlNPTiBkZXNjcmliaW5n
IHRoZSBidWlsZCBjb25maWd1cmF0aW9uCmFuZCB2YWxpZGF0ZSB0aGF0IHRoZSBidWlsZCBhbmQg
aG9zdCBhcmNoaXRlY3R1cmVzIGFyZSBjb3JyZWN0bHkgc2V0IGluCnRoZSBtZXNvbi5jcm9zcyBm
aWxlLgoKQWxzbyBpbnN0ZWFkIG9mIGNhbGxpbmcgbmluamEgZGlyZWN0bHksIGNhbGwgdGhlIHJl
bGV2YW50IG1lc29uIGNvbW1hbmRzLgoKU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3Mu
YnVydG9uQGFybS5jb20+Ci0tLQogbWV0YS9saWIvb2VxYS9zZGsvY2FzZXMvbWVzb24ucHkgfCAx
OCArKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvbGliL29lcWEvc2RrL2Nhc2VzL21lc29u
LnB5IGIvbWV0YS9saWIvb2VxYS9zZGsvY2FzZXMvbWVzb24ucHkKaW5kZXggMWVkZjc4NzIwYWMu
LjQwN2I5NGQyNDJhIDEwMDY0NAotLS0gYS9tZXRhL2xpYi9vZXFhL3Nkay9jYXNlcy9tZXNvbi5w
eQorKysgYi9tZXRhL2xpYi9vZXFhL3Nkay9jYXNlcy9tZXNvbi5weQpAQCAtNCw2ICs0LDcgQEAK
ICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAogIwogCitpbXBvcnQganNvbgogaW1wb3J0
IG9zCiBpbXBvcnQgc3VicHJvY2VzcwogaW1wb3J0IHRlbXBmaWxlCkBAIC0zOSwxMCArNDAsMTcg
QEAgY2xhc3MgTWVzb25UZXN0KE9FU0RLVGVzdENhc2UpOgogICAgICAgICAgICAgc2VsZi5hc3Nl
cnRUcnVlKG9zLnBhdGguaXNkaXIoZGlyc1sic291cmNlIl0pKQogICAgICAgICAgICAgb3MubWFr
ZWRpcnMoZGlyc1siYnVpbGQiXSkKIAotICAgICAgICAgICAgbG9nID0gc2VsZi5fcnVuKCJtZXNv
biAtLXdhcm5sZXZlbCAxIC1EZWdsPW5vIC1EZ2x4PW5vIC1EeDExPWZhbHNlIHtidWlsZH0ge3Nv
dXJjZX0iLmZvcm1hdCgqKmRpcnMpKQotICAgICAgICAgICAgIyBDaGVjayB0aGF0IE1lc29uIHRo
aW5rcyB3ZSdyZSBkb2luZyBhIGNyb3NzIGJ1aWxkIGFuZCBub3QgYSBuYXRpdmUKLSAgICAgICAg
ICAgIHNlbGYuYXNzZXJ0SW4oIkJ1aWxkIHR5cGU6IGNyb3NzIGJ1aWxkIiwgbG9nKQotICAgICAg
ICAgICAgc2VsZi5fcnVuKCJuaW5qYSAtQyB7YnVpbGR9IC12Ii5mb3JtYXQoKipkaXJzKSkKLSAg
ICAgICAgICAgIHNlbGYuX3J1bigiREVTVERJUj17aW5zdGFsbH0gbmluamEgLUMge2J1aWxkfSAt
diBpbnN0YWxsIi5mb3JtYXQoKipkaXJzKSkKKyAgICAgICAgICAgIGxvZyA9IHNlbGYuX3J1bigi
bWVzb24gc2V0dXAgLS13YXJubGV2ZWwgMSAtRGVnbD1ubyAtRGdseD1ubyAtRHgxMT1mYWxzZSB7
YnVpbGR9IHtzb3VyY2V9Ii5mb3JtYXQoKipkaXJzKSkKKworICAgICAgICAgICAgIyBDaGVjayB0
aGF0IHRoZSBob3N0IChnY2MpIGFuZCBidWlsZCAoY3Jvc3MtZ2NjKSBjb21waWxlcnMgYXJlIGRp
ZmZlcmVudAorICAgICAgICAgICAgZGF0YSA9IGpzb24ubG9hZHMoc2VsZi5fcnVuKCJtZXNvbiBp
bnRyb3NwZWN0IC0tY29tcGlsZXJzIHtidWlsZH0iLmZvcm1hdCgqKmRpcnMpKSkKKyAgICAgICAg
ICAgIHNlbGYuYXNzZXJ0Tm90RXF1YWwoZGF0YVsiYnVpbGQiXVsiYyJdWyJleGVsaXN0Il0sIGRh
dGFbImhvc3QiXVsiYyJdWyJleGVsaXN0Il0pCisgICAgICAgICAgICAjIENoZWNrIHRoYXQgdGhl
IHN5c3RlbSBhcmNoaXRlY3R1cmVzIHdlcmUgc2V0IGNvcnJlY3RseQorICAgICAgICAgICAgZGF0
YSA9IGpzb24ubG9hZHMoc2VsZi5fcnVuKCJtZXNvbiBpbnRyb3NwZWN0IC0tbWFjaGluZXMge2J1
aWxkfSIuZm9ybWF0KCoqZGlycykpKQorICAgICAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChkYXRh
WyJidWlsZCJdWyJjcHUiXSwgc2VsZi50ZFsiU0RLX0FSQ0giXSkKKyAgICAgICAgICAgIHNlbGYu
YXNzZXJ0RXF1YWwoZGF0YVsiaG9zdCJdWyJjcHUiXSwgc2VsZi50ZFsiSE9TVF9BUkNIIl0pCisK
KyAgICAgICAgICAgIHNlbGYuX3J1bigibWVzb24gY29tcGlsZSAtQyB7YnVpbGR9IC12Ii5mb3Jt
YXQoKipkaXJzKSkKKyAgICAgICAgICAgIHNlbGYuX3J1bigibWVzb24gaW5zdGFsbCAtQyB7YnVp
bGR9IC0tZGVzdGRpciB7aW5zdGFsbH0iLmZvcm1hdCgqKmRpcnMpKQogCiAgICAgICAgICAgICBz
ZWxmLmNoZWNrX2VsZihvcy5wYXRoLmpvaW4oZGlyc1siaW5zdGFsbCJdLCAidXNyIiwgImxvY2Fs
IiwgImxpYiIsICJsaWJlcG94eS5zbyIpKQotLSAKMi40My4wCgo=

--_004_DB618274577E40BBA811A96042B3FE73armcom_--

