Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59837108E1F2
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:28:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8764.1773919701278263207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mdM/TUAB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mdM/TUAB;
 spf=pass (domain: arm.com, ip: 52.101.66.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gvyRYo0nAyxGdOOToUQ3Bi+/dZxF1wjHxt7ZiO49enJgVLhBpg7RzlHaCPi7aLTHh+sNtTyI1Z+OLdCKYmyTncsw2TX9GEH+fIgfDqJ63ezzZkzLRUx2VaLpyPlLikxjl9Qg1gvPrUFYNyv6Y2+e+4/ProbedpizLXLRCVbDDZUI5uz+CAt2os0k9yRZXCsv7YK7U+PGLLkZikSqBOjuWH/oL8USRjlJ3wwZg3qpv3igDsJEwf5Wf5n51IfxquSkgGdL2ErsjivNfcpGQhOe6vexrGvhNzzxmrZ5wuJlGdOffTPHV6mbAV2o68vvh0QvzpRK7bX6EBjoDPYfteJ/3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAFcXABR9x8KnGt4PWUqTM/s90WAUyZvMPi68jarwrY=;
 b=Ye8Im7ov01uqpIw/jlOXvNjWjMvLaPsLoEw40j+VAxsq3mVcbl0hZud+z1O+R+BioUTqyn2zXZyDDrY9i2ejXFLsRsxtXZ7eoxMqUugnnSr2F9sIYiDWfpbxGoUOMDeoSrgSfUaw0t5LwI5FZzQMRh9o9foEESWdwQ+jbfMNYh/Aw4YSoS1GLSXDCiZyLtv1rfIAPvvpw0qFGYBn+k3CF3wyRd+s6NjpzapCr+TTc/WF7xE/yVGUw/6mtt09GUJ1mvaK4XxNp2O/bCkrkccYIkIT/VqPAPJ26+o+0vDkZeCHnmSi5MgwhMHtApUQaS8f4rojzxYBWQWVljGdy1ftNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAFcXABR9x8KnGt4PWUqTM/s90WAUyZvMPi68jarwrY=;
 b=mdM/TUAB2kZE46VkNU8F6oYQwqO2R3smzhHxee6tCe99+Bdhc68xh91OQMWs4i4cJXn+l38vRpntmz8ZBq8WuyaU7isEl2GDDM4XBjgoVThN9kH0NS6ORzpWt37lsQN2bEK/4fh56dIO1Q13FattScwTVqSrMphRhwqkrMeWG/s=
Received: from DUZPR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::19) by PA4PR08MB6095.eurprd08.prod.outlook.com
 (2603:10a6:102:ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:28:14 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::33) by DUZPR01CA0041.outlook.office365.com
 (2603:10a6:10:468::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 11:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via
 Frontend Transport; Thu, 19 Mar 2026 11:28:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAhz1aTzKm2v/rC53QKnAhdb7eFmwl115FAKmrhCfm5WFKC3NZpKEChh/OBntmU8W11WkImttdrpdtlVifHYOeneWYiA5SmpTFSW46N51HpfHi/Z/1nrTzXdybXztUkZf0X9Do6RqSkwMk4EDlMtYzmj49waWoGNaK9VeZEK7VCEDDuS7oqk0U36mv+JZWkSdswoDhIMVJHAyf74/4+3k1Bw6rXilI1sunI22Wb862iiMG/6f43LUB01Qringw2r/7FnLnXdl+xsxEPVYUWj8mDN2NiqoOQTqxzI4T1anlrnVLBRnWCYi2nguc6t6uvPlNwW4p+7ZQL7autbAK62zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAFcXABR9x8KnGt4PWUqTM/s90WAUyZvMPi68jarwrY=;
 b=iK1Mz1liOKtd6wYpR7pR7CpDzpP4Fjh0kpUK+cXCql0UoQmvH3XrLWILkf9q+8xC4tAqIq7ERGKJVTclM1/WYFnVt4EEMUHuOsWJKzBgdS6aO0535nRWSpI13/QBP2MyIrBar7p1bz2gsDISu7X7UQlZ227jcX7JB2DT1ElGvtpUK8lk455wLXnWvdEHgh4h4LaTzsmJQ/DnEpICQN3deOa39UhRszpFepJmEPvLUPRLHW0Z2/dGiuBwLIBlpMnZP+/b1ado5xeT8vnZPq5mAOBn4l9Hy7CRAY9BFjK8UCOAiE5DWcTU5kOyyCwefdzBNfptbdeKcWbc+eYVx6POMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAFcXABR9x8KnGt4PWUqTM/s90WAUyZvMPi68jarwrY=;
 b=mdM/TUAB2kZE46VkNU8F6oYQwqO2R3smzhHxee6tCe99+Bdhc68xh91OQMWs4i4cJXn+l38vRpntmz8ZBq8WuyaU7isEl2GDDM4XBjgoVThN9kH0NS6ORzpWt37lsQN2bEK/4fh56dIO1Q13FattScwTVqSrMphRhwqkrMeWG/s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8008.eurprd08.prod.outlook.com (2603:10a6:10:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:27:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:27:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Thread-Topic: [OE-core] [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Thread-Index: AQHcr5PDAu7Skifi4EWWz/1P5IfuxLW1x3AA
Date: Thu, 19 Mar 2026 11:27:08 +0000
Message-ID: <B61675D2-0CCC-4F1A-95F8-C99E90F5D397@arm.com>
References: <20260309070953.2372929-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20260309070953.2372929-1-jiaying.song.cn@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8008:EE_|DU6PEPF0000A7E0:EE_|PA4PR08MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 61069d96-f92e-43e0-40e1-08de85aa9b65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 sd4Em2QKvSo88n1ag/5m3QxyB5FQs/prig3CWrB1BLrAe+QCsFo/R5VsxdFvs+JG+pKx9NFMp5iwJNgVhsn7Eed3nExE/vSDa+AP1njUv/ABtYNirRbFLsnU/MVS222PEoqBrs7TP5WPycIfI0JIqw/fSTcf1w6+GOzEG1e8mRHm+hEglSA8jzSHUfQUQLB7VvAOQrnzceU+Wnuuk0WS5FTPMjkNKS8A/XUTWnXqVOdZLkc79x04FeHdW8nSpGpGFlYvR4c+GTMzXp/fzEzQ9FwAyX4ZOZALtDeRRvCMDzcvNVc5POImgqW8CCZVNUyuz3ihVREkpxctDOXpEBgkwy31Cs8wFJbvdQAIu3QeQocrcz6vks4Km0bU6QAVoRNkQZUG9EU82fHfCmx72nVQA68DyayK8YQ24/bRX4iutvYg9vzsmnYxbqXxvgb4wovXIbE7rKw+xg/M3Nzkw1OZNzK35NRPqakS/WoNcQ7ajUH6U7bAuFJiuoVnak855o/6T51mzqzcDXtVlE3fhgpNnh8zCZBALHaFi4YV27HShil4DsRR9fLbTiBF2hVF+yCjXBfMxdaklrTf/BONOkJhFGMYslMcqTehYS15E5D0Oxen847xcEtz0AXYCeY4DwafQuprMURKn7fGW0hlurtRiY5KaNGfaDLOtC85uTDRi8OEDujNJ45ACT924F8PQsTx01WZBNuOJT6g1Xd+2PdHtqXat4JoZ0YjUynxbQ3FTV1ZDHGmnrTKFr7KPgnLZByo0/6ay6xeKOR/YfftgsAC24tIk+0KXbNPsQ42vM9IJms=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01356A5BF03FCB4AA76BB26EF9BD9C7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 lb7fBQNHIlV2qIiZBlt/201wArxhSTWbHIbVr1x/c3sX1v8nMy63odraM9IvflwodnVzZRw57TyoFD2Gmjt/pdqda0aHyXdtZ9BrxYbC9EVe72yadm1LzMZ/JsUSJNOIcYO7kMuZz6McVhbT9C8rgwfLHxR+tm/VTql38FmZObQxUMmfcOtLSi3qVFZCKUxA/Q3+C/fCwhhJ+xHxpyI9g9a593Y4dr4SJIIhXndR2gq6KcnNcrr/Qe+Sw7cXY3SsqJpNn5wH8w6IEfmwWzlCbNK/mrJ6ZSOSaDy0VtRjRgjIxO8uREyB3diwM8xIx2QL2O7W45qka5x+h2fimMUsaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8008
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0752abfe-f62c-4215-2924-08de85aa74c4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|376014|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LottJWRCvCdqtGgSfdOcT70JvroDV/vqAsc9hxn1Cn6RAEoB3j2PYzqySYCzko+W33JPfUxpKye1Atv9teuXmeFLvr78e2u3d9YEritAmtv/MaBRyUprvK1cDltOSaDSzzKdmpsblMzvxO64NbKYpP/LoZYiQZyFsu+4dVsFch+6PIBd23ay+x6dZzsGOk0KoSsR2xx+VWkoHbiJ+XxSS2uM9Qd57AyUoEUYDS2ODkfDcLoqghE9O8MvpVHajwKDsHC9s1QMdsOn4+obFeG1CuqnHxI73rhcHZTqzupfHS+ssKl/HNuglhn8rqWfxwvtZ/L6ylEgq3+0CDelRmUYFCZqP4Usf1KruGbNhQOtJpfolfbce2DcLY1GT9V4B19yGDKvu66OO7lOCnQ3retSHzCQgPN88hEB+tKm7typ38oHed6jhd/qR9FkdhrTgp51MG7jrvmGYZp84IXnragtcKMn+wouUzFi1DZyZyHrtiNIsReTDQmZ0UtBWJRdC5m4llFQEhkcTnaECdSM8DpLpRgUPsjK+0kg/vtwX2b5Q3lf24KnbMWoJiQuOFKw+hXiUFfzZJnhmLxxuUzoUrpsM6yGSaH0Z2X+j4FS8WYYmBZRRa8URF1jbhslXfTl7nAuBtcI/A8h1to14mDSg2BRs9Gmbsgx5RU4L3PFMA0fA/gt/QrSTKSmjSi5ZnRPsyC8wAEwkzBBsPncf4qvGti6hjdP5j8z60K6ND/PsN0Ktw9u8VtDhSLV4lUwaRqGYsf9tw4Ri6VZTii2D03aaGxd2A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(376014)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IUQflsDTkwcUFEhG0AYeUkfPOWDDUxXKYstmcrSI5T2598bkxAXqrKjaUwZS+4YMAKXePrzfofIMGOaIxvwKEusgI3etN1eKbPGpeEC/D4eGp9KgNZ9llw6SlDOv79c5bKKb3UJ4R+jClYMqcRVnmLPFkf+VZwFc3p+S3SOfOl7eOFmdUsV1E9/1yocbsbF8s1/VU8Vulky462fQ9JCSbZ75OfK/zL9J0WfBkSzV4ycrah0oCg+sHwYMZlcLs26NVbAVQrFIqnIBE/0GYibjg7xsIwxwUipum52QN0jCuHwmMpNhEOjVda/ozzaFbyxOHaeAVNJy9fYEcEXK+wYNAHigTw6MY8SiIeS/mWW9VUQRczzCymL4ia/F8Xe0Ny24gPgD9kXduCnaFo00DnEohWzGsscglKJA+wxMRIFt+B1PoZxtPs4Zcw4U5UkNS/lu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:28:13.0675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61069d96-f92e-43e0-40e1-08de85aa9b65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233520

T24gOSBNYXIgMjAyNiwgYXQgMDc6MDksIFNvbmcsIEppYXlpbmcgKENOKSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8SmlheWluZy5Tb25nLkNOPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IC0gQWRkIHB5dGhvbjMtbWlzYyB0byBSREVQRU5EUyAocHJv
dmlkZXMgY29tcHJlc3Npb24uenN0ZCBtb2R1bGUpDQoNCkkganVzdCBzZW50IGEgcGF0Y2ggdG8g
YWRkIGNvbXByZXNzaW9uLnpzdGQgdG8gdGhlIHB5dGhvbjMtY29tcHJlc3Npb24gcGFja2FnZSwg
d2hlcmUgaXQgc2hvdWxkIGhhdmUgYmVlbiBpbiB0aGUgZmlyc3QgcGxhY2UuICBDYW4geW91IHJl
YmFzZSB0aGlzIHVwZ3JhZGUgb24gdG9wIG9mIHRoYXQgcGxlYXNlIHNvIHlvdSBkb27igJl0IG5l
ZWQgdG8gZGVwZW5kIG9uIC1taXNjPw0KDQpUaGFua3MsDQpSb3NzDQoNCg==

