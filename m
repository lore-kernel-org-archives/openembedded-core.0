Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A826E81A24
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:56:23 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19936.1771250177481779184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UaWZOpWn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UaWZOpWn;
 spf=pass (domain: arm.com, ip: 40.107.162.29, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o1gCQkVTj6qRM15bV6d5Ft9SSLrZYb1H2DulUGLYHKTLlS0zBkJbHhFEh13GCyTm+fTX7qKVbqf5sUJmwuZjxpwMzLMF6Ow0L1EINg3llWXqDWEbkECoCLGaGSPX63CtCgYSQ4rdJLomLPKnlgKpRM6GMvaQo0bq8/ZLVVy0CbUlX0RQiVF/DGVgUMI6ker4ElrkVJNuFJVnYDD/lsLwHrLCJ6z4tCj4iSMQrOs65o3KlgqUTqnYWQgxht+HFXne5nihTJ/fxrRA1Gw3GsBNm9EQHfUnUlPYzjQZhEieR+LTwcr5OmT9Y3AUWY6wYZxiIpLzdFxi+UNKLizqbOIHsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loNhahFFRuGenLM5AtTDr6C0zzHMdcsfBiQZt3u9Hp4=;
 b=MAFk+Qu1Y9TH0V4iQKEE2vk4HDhP/Z5Vkck2GFekgBauTCn+rTWMgDOKCKhGSI3kpoueGvFkN5yXvAwFCqJFP+c9HJ2p+aiTNbB9mCPL4jkUuo5KoRBKDZECRJgg1ZcLcIOLbUVnbc44pbqbdTsFCcq2387v45vz3CoBdRHhLpa7maC7obi+g0tqpbdVohqKslNSuy4f+VJPzCrPhY1hqi0eIInHevvPA0nsun1MvBy2Y6k/Ql/edlmAJhDnJQwNq8DNIHyLbEC7G9VmS3wsfDI3vwmZjxMZDRcHHbOIT3vo1wQU9nFStRlZIRKx1DicV1Wsoj5CQy8W1Q8VxE/JhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cisco.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loNhahFFRuGenLM5AtTDr6C0zzHMdcsfBiQZt3u9Hp4=;
 b=UaWZOpWn532Ec8d+yA32+q/p5SBarSkxX5QYA/IkPcUeNFG4T+W3vZehMCutwW7iUE1eHD4cqgPVWp1or04TWUVrtsWv+k+Iqzo1sYRWt7zz3ZeaKFmxW2YhrLxYGy/uiFRJUvMmpE1gN1TtaDurqoj/IabQ5Tuy2C/AGPbuGzc=
Received: from DU2PR04CA0160.eurprd04.prod.outlook.com (2603:10a6:10:2b0::15)
 by PR3PR08MB5724.eurprd08.prod.outlook.com (2603:10a6:102:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 13:56:12 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::ec) by DU2PR04CA0160.outlook.office365.com
 (2603:10a6:10:2b0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 13:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Mon, 16 Feb 2026 13:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRs/ewJPl75NPI0FdTD50wyDAzPfWG/MRK4LhN56urW/P7SD45ceNDLK8jrKQYx+ySJ0kra8FVPT2zLre7JCNpvAmAcEWkBSnsPZeMaBYNp0+RAIybhWly4GN+CPhIzM2htnna0mZjCCWxuRat4LCRvlFoY4wsBFKg0gY+BYHrQKdv612gOJEw7qCe43cdNjVK5Md/+81U6b4LlXDVox95jv25l/Gx9u6fk/ruwQTB4U7s1+VTbTeNPF7Dyn1UQfXM+ofkwITQWFnNug0OrEuRTIrcfo04HVAeJJ5IRn7edPuQuBXBn/YnnX9aJv9ZByOBk9Me1BsEd0F5LujrUJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loNhahFFRuGenLM5AtTDr6C0zzHMdcsfBiQZt3u9Hp4=;
 b=V3Pv+T41Vp4IQj7QnVCjhiRK6ndtdnyt0FvaoFiPFGg6XKBjvRjaq1g3qqFC6XFkGcYrrUs7z7q9Z4jk3X/l7bnza+xUaLntHtox4XWQDhYRiND4ZTuoIsy83ITwK/G4hm6b0Kr7zX6pQhKGTFoEM1B2bTzu6zLyswgkvjCJuRY1qo3Qrpuyp+eHpyImY2HS7wE/KJ/LmGBMOsrfWWXYiz+u1bctRck9GFlHMVgm9o2p/3Zndwqq7w4mggF2+03t7DiYdxUzdbwFOyfrWK6+ry0j1+kPx1bGVV8Y0eIfzhjDHBOrgfbcfbTqdBGJIRBHlZjmSeQiaPQxZqgE6vhEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loNhahFFRuGenLM5AtTDr6C0zzHMdcsfBiQZt3u9Hp4=;
 b=UaWZOpWn532Ec8d+yA32+q/p5SBarSkxX5QYA/IkPcUeNFG4T+W3vZehMCutwW7iUE1eHD4cqgPVWp1or04TWUVrtsWv+k+Iqzo1sYRWt7zz3ZeaKFmxW2YhrLxYGy/uiFRJUvMmpE1gN1TtaDurqoj/IabQ5Tuy2C/AGPbuGzc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9902.eurprd08.prod.outlook.com (2603:10a6:10:476::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 13:55:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9611.012; Mon, 16 Feb 2026
 13:55:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "deeratho@cisco.com" <deeratho@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [openembedded-core] [master] [PATCH] cmake-native:
 disable libidn2 for native build
Thread-Topic: [OE-core] [openembedded-core] [master] [PATCH] cmake-native:
 disable libidn2 for native build
Thread-Index: AQHcm90G+LgU8BwxwkiUTSa2bpiIt7WFX/IA
Date: Mon, 16 Feb 2026 13:55:09 +0000
Message-ID: <D158E9C9-E6C0-4FD3-939F-E941A85A4FDB@arm.com>
References: <20260212050352.4090817-1-deeratho@cisco.com>
In-Reply-To: <20260212050352.4090817-1-deeratho@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9902:EE_|DU2PEPF0001E9C0:EE_|PR3PR08MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e490ce-da5c-4804-e2f2-08de6d632526
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?bOPohQL13CgTLJFbsAsAyka0mKOEtUyZmocMDTYJO3kn38gmmKKZwWQi5J3C?=
 =?us-ascii?Q?rOTpI7y3lMLo46XcoAcBy+eGG2S/rrbqkqE4akgJoTkSZrbBip+VTWutAJFj?=
 =?us-ascii?Q?nOpeWUaaJIui94bFfYtuSntOqOF/egtGZqCE+S774a7v8Z7VDOA5Nf+feohi?=
 =?us-ascii?Q?jXf5lzSm8ceEilbBsjyDbVpNO7Cbj2zbx3akmOQ8wv+RJ8DjzAAtk1e2jPmg?=
 =?us-ascii?Q?NY2cER6jB47nwEs+cB6FEOlZe4KT9F2zTcWsY2m23CDROb3Pn5QUPIkLoVrB?=
 =?us-ascii?Q?rAaZ+Dc8nFRLP9Y03yvZOKOZ08eyX2QLMYhGgOUuuX91GmWe2miEt7BuZ2V4?=
 =?us-ascii?Q?O+V2ctb4CSsbNUGokFdAhnwVE/Ev4r7jSOHLRjj+HxfMs+VMPAxRJ+GGMpTg?=
 =?us-ascii?Q?AXh3Ub30c4vmlrmbtpGQm1yEt527Z9Lc/KzbtPGFiyy9r1MMZ6HEEP391rNm?=
 =?us-ascii?Q?kpdsITNxkU61Yx7ygyYeYGJV3DA3cK0xuA+5o9Q/W7MCXtSU6Kluli3j3GqD?=
 =?us-ascii?Q?JrT+H7vSrf5fGSlTzzf6edg3GeqUfgJgpL9a8kp8L/RGcoA1Lds40jnUtxnb?=
 =?us-ascii?Q?0vfSncp1YvQPx/knMPnGmImQ+4TPnDkKVy75K2BQFgkcqHInMVOWybICsPVx?=
 =?us-ascii?Q?AxMe0BUgB4d+aOVFh7zsinE7h5UlhbxPH7sz/ruyZCrqCa2Xse1vSAnwMrYY?=
 =?us-ascii?Q?5K0V6JMYW6xx4Dk2bgtG3AtbXev9WrDjN3VqDhHz0x7lEYXAiWexl1+jhY3A?=
 =?us-ascii?Q?zL9eq4DZonGszwMZMGnGPEU+N7vzACkqW0GCFSwB13XAkM2dX38pC0bXWtdL?=
 =?us-ascii?Q?QrcOL1i9xmfDex0Cyv0jRkvWUQQJ7k54YLFHeTiiMYEyjtIZ9MRrOPi72inb?=
 =?us-ascii?Q?4TexG7ZIp74tldFy4nJjt/4EGqMN8YaGnU8t7maMTXkfK8qDw+IyL1pdd9SM?=
 =?us-ascii?Q?/b/MM7Li072KRrpasTEykvHsBLPS1rVSDyJ3Vo7hZXrMrkMX3MBxQMN4TSkQ?=
 =?us-ascii?Q?BI9VbgYs1DiNQ43rQ6o0ZMYV4rD9a7jDL4BuTTcU3X+QW8MQBoDALnpxr7vp?=
 =?us-ascii?Q?NlI93sYa99nws3/XsYWM8uZNLVR4EaXEFNGwNVawkC/yAmRf8lepdXTb4aPi?=
 =?us-ascii?Q?tj9liZMNHloFytsaF21ipfPw69XcapI5msG6jPNp21VavDrrYpMenDJWtYTE?=
 =?us-ascii?Q?gwAf6+Zofxn/YrzQZ4weD7409QuVioqjJqi1eM9aZl29xbwRAvMwolCJXE21?=
 =?us-ascii?Q?5XcyUd6e1QPnilByOhFqZbOmq12cgVtZDzAE4kENigkTi8lUpdu6FtZU7fkx?=
 =?us-ascii?Q?ixuzvjDIRzWoiUM4K416kRpNDAwDu2/bo0XiiEX/xMVlCymeIUIe3ZcPQlhT?=
 =?us-ascii?Q?6GsgEmS3NL2aLtZMc5Ar8U37OEnAzSl2iP/1PqQO4BgB+DQ+78OObiMvWmbt?=
 =?us-ascii?Q?Nib124onWmtPVQAgQCXy3wNg4wSDKwxHJTUQDafRogwnuHQbPyUUqS6EsCxd?=
 =?us-ascii?Q?k2/THx3HmjrK9Wf9acGDYpPvjPtKhUFMqKOJaiWD23K2n/RyomtgfC617pZ8?=
 =?us-ascii?Q?SgMPo+ki410M4cf85LkWM8tMhXQh/uornYNA274zhtiomxs9iSdHOmmJUHjE?=
 =?us-ascii?Q?BrrpNFGVkwtmRuWwD4PT8Fs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29FEF6843E3DAC459A0AFABE6719CDA5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9902
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de07a61a-2cd0-4b38-8c39-08de6d62ff67
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b4sqQIcAW4bfp2PPJSgRIitTmuYDJago76WyCajcF6AgUyoCwcnbJTKYwH64?=
 =?us-ascii?Q?PPoj9wTLC/Ex3zXg/dHfwZp1KdxCAzDHKZSeFBuErAEErCLhlEEMjlaYWT4/?=
 =?us-ascii?Q?MQmnUiGXcVfrcjpVlKT3Y8rKLg5mF6L4vuWYVC5GoeYHDF0Yq5nJHhHOgcNB?=
 =?us-ascii?Q?WKPoQ9l7hkOaf1Wd/dAeE8M0FZSAjxQTeFjfSI1A+bxMqdr5f2DrGFB9LscV?=
 =?us-ascii?Q?3yyVIvrzYD79BHvVqVuYnsUvbB5KJPe8wj0gmigPqMByj1q7MtklcyHOKQoH?=
 =?us-ascii?Q?EWyEy+nOzZ0UHxMde6Swcav9HTXlWiHTKweVYanSK6N+eiIlgHXHKtKnRYC6?=
 =?us-ascii?Q?35d2SJC6P3wMgAyjRdc3ubjqOp9VVocFj/LHAbsUgkZ0ydKqVJLFdyvIxI5F?=
 =?us-ascii?Q?SNU1gjPr4RGBo7sYRdWfYpmdyC9oO9VZ8CSOXAylQexgOOl9/mZk4adnr5nS?=
 =?us-ascii?Q?YuQ1L4gzyLtoUJ0ehK0kSR4D7VHWoqxxZnr/zVK5r0RBLTysfKDv9S2SEUd6?=
 =?us-ascii?Q?tBHLLgspgTAKXtaIAoXMdylvpFX67cj8uiMTcgVsGayFK0jqafzrw7WrenZM?=
 =?us-ascii?Q?JMcFtgO2wB6XH0UVi/TF9GyDjc+OAgbH4DUF/rhxGehyAbPlZMYT5AOW0iHn?=
 =?us-ascii?Q?y4uUOhsQ6VqT4ctKUbZ1HsfrGcvrSjyJiGJAUNWBV2iTvcWTuhLkCdv1CQ7D?=
 =?us-ascii?Q?Jzx/hgHNFMrq6vSTsb34a8gJp3Y81IBFETyB3F5bc4g7Yqq/F9BYFFFkdl5l?=
 =?us-ascii?Q?2XF93drmmTJWGqZ04YtDhtz6q/ilhYKMcwM6oY2D+s1m79kupszfy1STQiLo?=
 =?us-ascii?Q?C2808klwzvxqB2Mk6zLDuWTMi3vkh24tTDvE3TBhPzk3Mhr5mx1JHAm0usrA?=
 =?us-ascii?Q?FKsltPV0opxPMlO5imqSkmI5pVvHWYe2ZJXQyFhoa+fz/C5xLVQuNVgFBUqz?=
 =?us-ascii?Q?8j0vIap2N9GZH3S05CifkIlgeEEGKhQsa5/Ccb8HcZd3yXSBQkvGJzwqTWQX?=
 =?us-ascii?Q?8ohwU2xI/9qxJQbInExUULML4mYHPd27Oghmm8DJEVPxaS1DjuX+gfjUugYG?=
 =?us-ascii?Q?2ZE7q1IadXO833sDTiR7uLP7fuk3fQ67MSyMsSazjdVcoyXjxXsiavnupIA8?=
 =?us-ascii?Q?fv81UwC67mRIvhKxmiivfRNYWvsrKi+z4rNHsVFy8+/NKXxJ2TlG3nNv/fPv?=
 =?us-ascii?Q?pXAWjnRwANFP++zl7evEIxgUPTRnu8tP9aL+/40pPvXAHdr4Jxy6K/1NoH9T?=
 =?us-ascii?Q?d2WR2PpccNgOF9CLO57nvSi0MPpfgn9ZOvM9Ou0d+U1WQeZv2Rk7iHwgK+Y9?=
 =?us-ascii?Q?594UT6xIgAz408nQpBFp4JBpx2J/yWxr0ACPMpnWoygngvQbYieWEqSsJJSc?=
 =?us-ascii?Q?NtGOGZrraJ78NxvsI/s9e2I8NmQkqtlXIeQTZISgbYIKIojz3JBm3U+CGfh/?=
 =?us-ascii?Q?a8p4De47gUqr7TFtJQeJcEHx3ENru1HclKxRngdbkwGR1R6cvTv5HK3G+Kvg?=
 =?us-ascii?Q?jlZ4AZ94H71JQ9RMAVDx5b36Nt4s0cF1sqAl67Por0748qicmG7zmQ+Sw80H?=
 =?us-ascii?Q?+EIUw4qKttDbVX6mt0LF71BIw4Ei3mx7emeUlgnNE6vo+IqDHhp1ajiVg2KN?=
 =?us-ascii?Q?3BLW/OTGbp9M60EYNCtkJJbd62mXqQN+oNDZhuCI4pZq+WCjR9eF+3334c31?=
 =?us-ascii?Q?O2Lkqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3oNb0L9/U78AGfztuXpT0lzS15tqOHyt8VScit95EhizkzP5wwHJQRh3adPac7dODi0dzMLVNqdGwOjfCa8XLVLsZQrKVO6sMhDsD7zgUtyuG050a1PDxOsJfz/uYpkzq+p5h6bxOJuEQFTPUocB+czFQ1lp+RGug5nmaSXNZjbbZoKhFdh2G67CCWnQXArDC8TX8Vc27gNIp2/3b0Ffwrt3ByDxqDLfWpwXGVz0F3x+ajqw+F5f3TYj0aLl1EMhy9ZLRqkF6nQw12IKp1kn48WjlfYBeC6aY7c9KVmZ45iS94bhzQWCXL8UTSNfltkb0ghc4mLB/2uZnpy8csTVgKmduN08FDrNLlaemQEZcbGAxgiDv7CIlrZPcXEZvKWq7i5KxPyWKiyJqVJ6YXZBKgFzpOV/2kMptRHGxX5Abb5W7/IXBi6pXsbQM61zLEju
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 13:56:12.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e490ce-da5c-4804-e2f2-08de6d632526
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231210

On 12 Feb 2026, at 05:03, Deepak Rathore via lists.openembedded.org <deerat=
ho=3Dcisco.com@lists.openembedded.org> wrote:
> CMake's bundled curl forces USE_LIBIDN2 to ON, which makes the build incl=
ude
> <idn2.h>. The native sysroot does not provide that header, so the build f=
ails
> and we end up with a native dependency loop. Allow the option to be overr=
idden
> and default it to OFF when it is not preset.

If this is the case then how does cmake-native build without this change?

Ross=

