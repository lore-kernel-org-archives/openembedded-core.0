Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38E2F44871
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:52:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157024.1775829155815311421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=keI4gqTH;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=keI4gqTH;
 spf=pass (domain: arm.com, ip: 52.101.72.13, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=n7bsheRV6dQ5GXnK9sIYbN1PCr2iQiVSSk1OwYq85cWnZsODZMASZ6kMb1SfQ50JwIcUNrlDuuIkvz/602Hp1cFQRobMmhyKvdUytiFbAsc8T6QojMBdECnUO6acDpmCmLwYv5mQwK+Wv+D7bkL7/sex54p8vX6GoD4nkMukw1V+eL1n9Igbmm3Gr+x++YIn2K/VVYAg0C1F69qIrwSpiK7utAJEY5bxXwcr7xzNlJhOGr1yU+MuDJr5J5AsqQTWuupaRlkakyXFTMmVtycTq/Kkcmlwtspq0w1KfKaC/EP6zSYrHrYBCXldNBFy8ILeVvhY1cFWors0SBUfpN0eIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csL+FomRdy6CEu9SNwVigFPZZA9JecjuI9PoRzr2tcs=;
 b=SUbxxuFODOpMojPlVeOyWqU/La3KzzjBJ6qpE3tTQr1SpxXPBAf7wAhdf/RFBNVfHJWiMwPYk4+fOd3rKNIp+XffHZBz1n5tfxVYDE3644xwOjFefOMjok/iZix4sRdmwmbneR4oYWLNkLfX4DYEN11PIQlHFejshl+3NM8w7L+fy8F1oCxM8EOilWUMI82YVf+gejvBCyBQAxSh2NG+JAB62MD8eEMVeneaCrzRxDViBpagEJuphOE/WFGww61OZV5qxhSO/+ttYa46nzJdxtBQthf4iMQNEGboxMxn0/mj9rQH7b24rLBBmpZkralwo7/QJ0jfvrnXowIpIJ94HA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csL+FomRdy6CEu9SNwVigFPZZA9JecjuI9PoRzr2tcs=;
 b=keI4gqTHuLxIBRfhC3yFekCaunPQM+XJj2+2sL55CFb+/Tzft5oolThYxCwWOd3CiTOP5pLn4JrRSSXKCeC5EGQC0ruwHDG/u9hwlr3+McgBLh4UJGi2Z2L0QnHDZeXRzURwazalLhT6L9KnodMI0vd/G9mqs/ZDWqztZBNChcU=
Received: from AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20)
 by DB4PR08MB9262.eurprd08.prod.outlook.com (2603:10a6:10:3f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 13:52:27 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::2a) by AM0PR02CA0153.outlook.office365.com
 (2603:10a6:20b:28d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 13:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 10 Apr 2026 13:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqkOlTwKbvVmUtoN2i680DWoq0oQhrVjtikzFpyAnABAkrarCK2GKu6jIb5rqVbfaJmv/OcPrXuC5EyLvkXctnKN0TOoARXAc9a7uUM+ZsPR3txCYQ5Cs70avx4b5mZWXhEnCqwPwUqwE4n34g9poAb1+TeCI4fRQ9Q+0zbXPv1Ip7mKoHJ1o6zeVDA9KAl/aaEfF4XEYIJ4/a5kvhgpxGTneA28voUvW94kMAKZqsSLPmGsN8FBNxaYeO2Le65Yu0N9MyXd6rnXt3j/sOILjfe5oOLN+6Nsm0fYI+ThiKot9WujrdS25pGo15kM3LRwwTfX2IUJPmOYog3Zrwpp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csL+FomRdy6CEu9SNwVigFPZZA9JecjuI9PoRzr2tcs=;
 b=cUzF+KmpmtAtsFJ8eKKrlZmAdAmJPEMeFwEGYksQG1sNIHQasjKJvM1m3GTF4EsW7EpdURKNJY0ihxkIVtNy7mgAuAkc2orq1bkjOZS520sfXGuX9luM3xrHRhMGqu2kQJShFV3pV/shUUrZkccF878HExccWyqDmOsMeEvBSlXLYLjRuoh8QsHyNYFyRPl3k3JhDJqiTvruoNPZmUes58+Oxi9mz+JKJo/wl4u1yW2VGaqVpaqGziPEGGhwL1d4j7kgg2379V35eA5ChG9v7jc0XXtrLFqd7ucErzxpqIavF/pckjML7nnZJJKSLNWQbTxr8m7/fZzg/4eNb9aInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csL+FomRdy6CEu9SNwVigFPZZA9JecjuI9PoRzr2tcs=;
 b=keI4gqTHuLxIBRfhC3yFekCaunPQM+XJj2+2sL55CFb+/Tzft5oolThYxCwWOd3CiTOP5pLn4JrRSSXKCeC5EGQC0ruwHDG/u9hwlr3+McgBLh4UJGi2Z2L0QnHDZeXRzURwazalLhT6L9KnodMI0vd/G9mqs/ZDWqztZBNChcU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10943.eurprd08.prod.outlook.com (2603:10a6:800:254::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 13:51:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Fri, 10 Apr 2026
 13:51:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: cve-check vs sbom-cve-check, redux
Thread-Topic: cve-check vs sbom-cve-check, redux
Thread-Index: AQHcyPEcHfk74ge+GEKe4KvI0SFZ1g==
Date: Fri, 10 Apr 2026 13:51:20 +0000
Message-ID: <EFA287EA-FB51-4610-8DD9-A0BB8541808B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10943:EE_|AMS1EPF0000008D:EE_|DB4PR08MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 090fb04a-6515-4bd6-d836-08de9708667d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|56012099003|38070700021|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 SSGGL6vDdgirvkD25mYVdjAxZUQvKy1YuBp8hFQIigptxqfU0kG4cjChARwyq/PHlPMeDj9NgZQ34V4WqZpWYpzDZfG9d/zEEPjWRnzxs3lYwRChDxGA51egQw3paCTIx9yrzE8a4HXLG9lqUJL/SEjpYSmvuzFvjfSF8atXq103duQmwV3doN7aX/07sLpu9pFtAmnCXm0r+704kHIHC6MIO82fN7uOgp1NfovhrN1SN9xJ0ni2DLek6lIuKUInJP4L5htvEkLw5sNjIUPg43taUfEFCHXgZqTDS/pVvyfu/dUI8ZHbxF9cduO+uZxiiW6mocbzcrJSfevPhAUm3T1t6to9d54qpUfOSeGiCyGDE8JdAiqpvASAJB/t7pvpXL4YHVyt1KZ+7mpa0DBvqIeFy+9MnluumF7CVHkSu86JTXBDc7kBty4i4uNP63nvFdM+2dBHKxNr1HksRfP0UQE9uJ2AGgzjwrrmJst+Ah7Q6GvHPUmEPmJ+GjdPeZepvqiQHZelqvVoJui3yhJ8OLYLwEwg/HjwmPc7HgWSuDcYaZ3FMrSJAz8MK39rhBTViDtGKhb+SlL8q13yCBjyNq1BnQVG4Ux693spCgZkmOA3Z5nnGsyiemkqJb/Ley5GiDL1BH6D3QJl5349+r2B4/dXpls3ribFJO0Cgdhh1xP6LC4jYgR9kJye0Gbqos28S20b7tHI6KiS05PVBLXYhAkqKUdeGYlcsJqbM+yuxuU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(56012099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D18A3E4013C9048A8B43D1A8D7ADE99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 oq1yQ8810YPFiaVPdD/r1br6NyTAmE/3HAmMr/h5YqBebZWw07JYZRaNRQ80HwLQR8QpCCQuWHaIZVUzqYO+TU8DjfGuVtg3szEzVeSw1bd2XSurugzFEigm3XFBlhiCvLNp10AnkuLqUJlnJbfsCxg+tlTJFIeoN/0vjalIrxX6T+4BQ+0kys1T6Erprl04UU29WbCo7mtxhcXamBSvJIPsapFLrKXXgtgiESoFyF1lM8yZBtye8dRHUDl+ZLLvNHkB8q6nGxBi0Lo5F0Jw92bcL58fmQ9PVCKxgaFqxKVFxWHrwVaKg8fokeEFPnClrMb+1khhiOVAZxa/CwVCaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10943
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6db65bee-c60a-4bd8-92b4-08de97083efc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|82310400026|35042699022|376014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GJytZ4T8z98q6rSCVmdhcfqa/S9NKHSCGu/WfoOW4I8iwkgVgKqK7FUla16eKwysvsgF/xSp9+xuOnGXmVGJZ1VjJCLij2VlFfakWlXO6Wgagh3boAFguwoGRou/4PB7otUZnKf1fdC+oSiIBqsRjLNbs0+GUqtYgzYxlN7J1bvG4vqI4gxukLl6HitSejtBsORgijNEEC/Qx5V8YGY2SWGTV3JG1cC6JpjIavDC3sH6OaFwu++GV5GsQ3xUGu7LXcNG48OXTKh/wock3oc04LiJ1LHBAbm9rhuVeF7HBnrk1G0KRiQsmwqJWPAABnEkpp1vFk3vt1bJEod5aVfyZgltQRzNiEMqqfWQ6Pu0VvDUs748kxwd8SiUW4+GiqcE4elY0hkTcVr7RkWNpf6mok+CFkMlygLxi4HzLooIm8bEk8DV23BJfBHyzeE+PMSbtX2Qd3e5ieZthYlBl0u7dFPmfnDMwW2P2fTE2nDAVcmsYG7M7h5dDI/M3zrcjomsy2CZTUPh8xmUxSNBn3xT1ViR2X1hHgG1wN0GzaZ30XAfqqXTuEJBB2897yWh0179qV3GgGinSCzeD04WUKDt1q8DBsBn19guVXgD/6Y4Ibw5pnlIHazagfeCdJgusNDvYg34DDDY2exfJauixaowAKoI9b1sGTcgRo1CFVcT+oyOuwayb0R4Jq6QwvDGwR71Rl5OodJ/aXoYzQd8B5iXEQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(82310400026)(35042699022)(376014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	py0wpjYwps9dpAPDq1iTMsu9Adaqi2PvKvgH0bxZAd3RfOfLuBili8oyZ4cWsz+GU3Mbo8QKp+df0E0VVMjfJBYw5v7bwIIIPM3+nf0ruyeHhCO3bRHxRhjSWZ+sm7Pm9ELF19kGiNwqNuHEH+DRzLCGd9ecVi1El+2oC+NGzy4qNmwmeiuQEkzkj6DN5yLTgdR8XQ5aj0uU3+uZJRdeNdpXC4ykeFD9r9z0JxNjue/PfAiOLiU51slb8ybQm7g8erxBPOvspI8ggm+dktSXfGtqM1ENrglBGZhngjmBota9xnhh60+gGMyDBx3VH3/qLfeizRtgODScLLTsRuu8lNytGQ+AYiDUOLIZtZ3+gsAHVDnhR1jkSvyMQz4O92M4pMHILWO4hfJiPjVDRh+JaF2yv1YNYG0zgyXlgsNmeqntq0Zk1bEHlMvmHzqZQW9a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:52:26.7873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 090fb04a-6515-4bd6-d836-08de9708667d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235033

SGksDQoNCnNib20tY3ZlLWNoZWNrIGlzIG5vdyBpbnRlZ3JhdGVkIGludG8gb2UtY29yZSBhbmQg
YXMgcGFydCBvZiB0aGUgbWlncmF0aW9uIEkgcG9ydGVkIHRoZSBkYXNoYm9hcmQgbWV0cmljc1sx
XSBnZW5lcmF0aW9uIHRvIHVzZSBzYm9tLWN2ZS1jaGVjay4gTHVja2lseSBpdCBoYXMgYW4gb3B0
aW9uIHRvIGdlbmVyYXRlIG91dHB1dCBpbiB0aGUgc3R5bGUgb2YgY3ZlLWNoZWNr4oCZcyBiZXNw
b2tlIEpTT04sIHdoaWNoIG1hZGUgbWlncmF0aW9uIHJlbGF0aXZlbHkgZWFzeS4NCg0KQSBsaXR0
bGUgYml0IG9mIGpxIHByb2Nlc3NpbmcgYW5kIHNvbWUgbW9yZSB0d2Vha2luZyB0byB0aGUgaW50
ZWdyYXRpb24gbGF0ZXIgYW5kIEkgd2FzIGFibGUgdG8gY29tcGFyZSB0aGUgb3V0cHV0IG9mIGN2
ZS1jaGVjayBhbmQgc2JvbS1jdmUtY2hlY2suICBTb21lIG9ic2VydmF0aW9uczoNCg0KLSBUaGVy
ZSBhcmUgbGVzcyBuYXRpdmUgcGFja2FnZXMgc2Nhbm5lZCBpbiB0aGUgc2JvbS1jdmUtY2hlY2sg
cmVwb3J0LiBUaGlzIGlzIOKAnGludGVyZXN0aW5n4oCdIGFzIGJvdGggc2hvdWxkIGJlIHdvcmtp
bmcgb24gdGhlIHNhbWUgcmVjaXBlIGxpc3QgKHRoZSB3b3JsZCB0YXJnZXQpIGJ1dCBjdmUtY2hl
Y2sgd2lsbCByZXBvcnQgcGF0Y2gtbmF0aXZlIGFuZCBwYXRjaCwgd2hlcmVhcyBzYm9tLWN2ZS1j
aGVjayAoYWN0dWFsbHksIHRoZSB3b3JsZCBTUERYKSByZXBvcnRzIGp1c3QgcGF0Y2guICBJIHNo
YWxsIGZpbGUgYSBidWcgYWJvdXQgdGhpcyBidXQgZG9u4oCZdCBjb25zaWRlciBpdCBhIGJpZyBw
cm9ibGVtIGFzIGV2ZXJ5IG5hdGl2ZSByZWNpcGUgdGhhdCB3YXMgbWlzc2luZyBhbHNvIGhhcyB0
YXJnZXQgdmFyaWF0aW9ucyB0aGF0IHJlcG9ydCB0aGUgc2FtZSBDVkVzLg0KDQotIFRoZSBrZXJu
ZWwgQ1ZFIGxpc3QgaXMgbWFzc2l2ZWx5IGRpZmZlcmVudC4gUGFydGx5LCBzYm9tLWN2ZS1jaGVj
ayByZXBvcnRzIGEgbG90IG1vcmUgaXNzdWVzIGFzIGl0IGxvYWRzIGlzc3VlcyBmcm9tIGN2ZWxp
c3R2NSB1bmxpa2UgY3ZlLWNoZWNrLiBIb3dldmVyIHRoZXJlIGFyZSBzb21lIGlzc3VlcyB3aGlj
aCBkb27igJl0IGdldCByZXBvcnRlZCBjb3JyZWN0bHkgZHVlIHRvIGEgYnVnIGluIHRoZSB2ZXJz
aW9uIGhhbmRsaW5nIGluIHNib20tY3ZlLWNoZWNrIHdoaWNoIEJlbmphbWluIGlzIHdvcmtpbmcu
DQoNCi0gU29tZSBDVkVzIGFyZSBub3QgcmVwb3J0ZWQgZHVlIHRvIGFuIGVzY2FwaW5nIGJ1ZyBp
biB0aGUgU1BEWCAoc3BlY2lmaWNhbGx5IHRoaXMgaGl0cyByZWNpcGVzIHRoYXQgaGF2ZSBDUEVz
IGxpa2UgImd0aysiIG9yICJ3ZWJraXRndGsr4oCdLiBJIHdhcyB3cml0aW5nIGFib3V0IGhvdyB0
aGlzIHNob3VsZG7igJl0IGJlIGRpZmZpY3VsdCB0byBmaXggYnV0IEJlbmphbWluIGp1c3Qgc2Vu
dCBwYXRjaGVzIHRvIGZpeCB0aGlzLg0KDQotIHNib20tY3ZlLWNoZWNrIGNhbm5vdCBzY2FuIGEg
c2luZ2xlIHJlY2lwZS4gIGN2ZS1jaGVjayBjb3VsZCwgYnV0IHRoZSB1c2UtY2FzZSBmb3IgdGhp
cyBpcyBtYXJnaW5hbC4gIFRoZSB1c2UtY2FzZXMgdGhhdCBzYm9tLWN2ZS1jaGVjayBleGNlbHMg
YXQgYXJlOg0KMSkgV2hhdCBpc3N1ZXMgZG9lcyBteSBpbWFnZSBoYXZlIChieSBsb29raW5nIGF0
IHRoZSB0YXJnZXQgcmVjaXBlcyBpbiB0aGUgaW1hZ2UgU1BEWCkNCjIpIFdoYXQgaXNzdWVzIGFy
ZSB0aGVyZSBpbiBnZW5lcmFsIChieSBsb29raW5nIGF0IHRoZSB3b3JsZCBTUERYLCBpbmNsdWRp
bmcgbmF0aXZlIGFuZCB0YXJnZXQpDQoNCi0gU2Nhbm5pbmcgaXMgc2xvd2VyIHdpdGggc2JvbS1j
dmUtY2hlY2sgY29tcGFyZWQgdG8gY3ZlLWNoZWNrLiAgSXTigJlzIGFsc28gZG9pbmcgYSBsb3Qg
bW9yZSB3b3JrIGJ5IGhhdmluZyBtdWx0aXBsZSBkYXRhIHNvdXJjZXMgYW5kIGRvaW5nIGJldHRl
ciBhbmFseXNpcy4gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8gcHJvZmlsZSB0aGUgdG9vbCB0
byBzZWUgaWYgdGhlcmUgYXJlIGFueSBwbGFjZXMgd2hlcmUgcGVyZm9ybWFuY2UgY2FuIGJlIGlt
cHJvdmVkLiAgQXMgd2l0aCBzYm9tLWN2ZS1jaGVjayBzY2FubmluZyBpcyBkb25lIG9uIGltYWdl
cyBvciBzcGVjaWZpYyByZWNpcGVzIGluc3RlYWQgb2Ygb24gZXZlcnkgcmVjaXBlLCBzbyB0aGlz
IHBlcmZvcm1hbmNlIGhpdCBpc27igJl0IGFzIG5vdGljZWFibGUuDQoNCk9uIHRoZSB3aG9sZSBJ
4oCZbSBzdGlsbCBhYnNvbHV0ZWx5IGhhcHB5IHRvIHJlbW92ZSBjdmUtY2hlY2sgZm9yIHRoZSBu
ZXh0IHJlbGVhc2UuDQoNCkZpbmFsbHksIG1hbnkgdGhhbmtzIHRvIEJlbmphbWluIFJvYmluIGF0
IEJvb3RsaW4gd2hvIHdyb3RlIHRoZSB0b29sIGFuZCBpbnRlZ3JhdGlvbiBjbGFzc2VzLCBhbmQg
aGFzIGJlZW4gaW5jcmVkaWJseSByZXNwb25zaXZlIHdpdGggcXVlc3Rpb25zIGFuZCBpc3N1ZXMu
DQoNCkNoZWVycywNClJvc3MNCg0KDQpbMV0gaHR0cHM6Ly9kYXNoYm9hcmQueW9jdG9wcm9qZWN0
Lm9yZy8gaWYgeW914oCZdmUgbm90IHNlZW4gaXQ=

