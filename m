Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8C0C43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 13:27:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35328.1782480464750397574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 06:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nOweJqeT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nOweJqeT;
 spf=pass (domain: arm.com, ip: 52.101.66.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GKMg66VK8aIk1TjbK9a4W/XfSWzZAdKEG5P8q3BvVlz+H6XSIzvNYFF3sMcbALElfp/Sr7xum+vTuZNaz21ag6XjbOa2mZ9z2hyvyRbs+3PZniJSwn3mG35zKfMkKQTcBZJNIqcMNSVvPExR+Ny0wPgax4yKMFwvafVuwcIP5x9rz1XmKCR4dRzleLITN/i6+7IfIakHJQ5O//jho+itHx75d8ISNxx+3yaYsOJObZoNjt/yXSXnUzkms82lzqv16dbIhEoOPzTAunp2gGSItNl8WuiIdcmBJMNMTdmi7iinEYr6jq1qpPtGLtN1rO7qUyHpd7jR5c7EX7X1+fbHcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIoxLYvZU5G9DmvCtA31Le+Zsk5tQQbt+WF5hiPX13E=;
 b=O4rOw37YM7Def4sKgZvDfe5pyhty0itgSxZ7tYda/7nQDIKWqKinoMtBcF9N2Iwu5cJGtPO1ETEe2t3+OrRoUXFLfJF4B5IOs0eRVx57/EASGsx2F9szxj0sy3KIZdpnMFZWMye8mCmKloupCcoCV4jVbdY97XUVsGFdnL87vmJCVAUBv9RAJSbkoduCeoBZAwPq5v7A2YNzYuoonmsVzfWsY1d131RFEnb33LU1ohG1tI2A/rEuJdz/XpGRtspw0xlstU3qD0BACMeqJfxGj51s854ROLrJCe3b8aw/Mo/rkQ/+RO+xpRYd0INJcmjG2wGH2v7wW1armV0W92YtoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=qti.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIoxLYvZU5G9DmvCtA31Le+Zsk5tQQbt+WF5hiPX13E=;
 b=nOweJqeTrQMEunDXHAPMLGT4ciIcvVtDzo2IUyzrF6SQyVNHOeHtq6vkXImWgSFNWtu4yIZQNDmIHUc5BwNKbxVSmbeDQ/r/BrrmTfIwzEu/klG93BVjFsg6ZTIcA7C1PGKigtJQg/ikxzM8YF+tOgtSrVL5n8/fSnQQSoD8KRI=
Received: from AS4PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::14)
 by FRZPR08MB10967.eurprd08.prod.outlook.com (2603:10a6:d10:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 13:27:39 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::3f) by AS4PR09CA0010.outlook.office365.com
 (2603:10a6:20b:5e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 13:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 13:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTIEtLZAMJXZsRifr5bRMrcDpaNXwBKfHAE2hAmG9ayulv8xxrMfHNEwKRDjKt47rY8hBFsXU7v3YwjRUt4BO8IcU8T7cBNfjp3TBbI0uNduHOiyW4KbjApErsxKAEgcTu1UopUVfhegniHbhSPtvJnLeSF9tiUndTwjhUKqIC0uATLPF/RmuH53Ei2NM2bTxsg9TH7ZxYBNPBqh010yPGTp17kQ6hoN7W5cyS3yTYOyidrPc8MkSIo/w4wJkDjjYqIZwsievLZAhZ3LJOEsElKf4vKwWdoTaPmrzibKweODNSIPdIghj9Gzl1Z1nswfNdWZQvuPGS6jiuB3il78bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIoxLYvZU5G9DmvCtA31Le+Zsk5tQQbt+WF5hiPX13E=;
 b=aYtMt4sjGpeX4jBHnU22rzcHUS+qOcZHFhdLV0SgHUM2HDwq6lZjF6K0Fvaht6trFTTbBhO4bNmUmCuvVdgh9LzBqNqhCTOSbZhdONE4tqqfmat9AyzzTo7HQ0FLmqMA/kx0DWn30dSqnQkFku9ef3kKhI11XwANG14icQ5CZXsdrWMdmOdXV4jg5uWIf0tPTan/iwX0W3Yon3Zi/agVH0mWdFyA1SBT0+kIPnXOdHfRLqb9mJsig8+Hvct+4vMbcDhi6+MbA1CiJdqHu/EqyaZAXhDEkSe92pyQFVwmhWI0ZnmYZ2QGNTfFxfikNzCbxbYYNOQxI4tdRF/BIIGBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIoxLYvZU5G9DmvCtA31Le+Zsk5tQQbt+WF5hiPX13E=;
 b=nOweJqeTrQMEunDXHAPMLGT4ciIcvVtDzo2IUyzrF6SQyVNHOeHtq6vkXImWgSFNWtu4yIZQNDmIHUc5BwNKbxVSmbeDQ/r/BrrmTfIwzEu/klG93BVjFsg6ZTIcA7C1PGKigtJQg/ikxzM8YF+tOgtSrVL5n8/fSnQQSoD8KRI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM9PR08MB6051.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 13:26:37 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 13:26:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vpuar@qti.qualcomm.com" <vpuar@qti.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] maintainers.inc: update ownership for
 linux-firmware
Thread-Topic: [OE-core] [PATCH] maintainers.inc: update ownership for
 linux-firmware
Thread-Index: AQHdAh+yfs03qwjHiEaEvfczzseVcrZQ2ocA
Date: Fri, 26 Jun 2026 13:26:36 +0000
Message-ID: <C4A5A88F-0774-47D1-8089-3AD68A9F7F8B@arm.com>
References: <20260622081710.3632461-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20260622081710.3632461-1-vpuar@qti.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM9PR08MB6051:EE_|AMS0EPF000001AA:EE_|FRZPR08MB10967:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7a7229-959f-4f58-253f-08ded386b165
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|38070700021|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 DUV69OQGh1X5EmvANmiATp+bzVz8CaawQTetq8M3q/qAH5u0bC3ZnWZ7LNc8UdiyjEh/edV9woebKsfp4I6g6TdDKlCpCkzY2LQVFo/YRzX1p5XsQL+zmUDkmsnNhzXgkOI8xKN4+DFM6dM/PRGQOlanLNkRjzvRAus2US9OAiOdJKvxiLDXiAXyf/+X/0NLuX8gMifUoeWzqX4yL1ETuFmi5s8g7mzQjBAnW4ca7HTv6Z4WNFvi4Wrn1YWfFa/LVR+sOqkMNrtQBWGxokHTGFfAXI7v/eqjJHmnU/iXRrE8e133uIwypS5Yb2Ls2Wwhqv3n2k1kVSv33JuKIYsvFo7ELpH5sA/nUbP7TnLTZCL6wz4YpIqkHm8tN38VBq/z0LJjMY8PSTyzKklt4qlqA0WXgvhI3vfTpZH3sCKJoZHllcr8C68CpZakv4CnYXG5bi8lRuwpDF7mDOmneW9UdmO66zB3EX7LcRAfkDfpI3Ynft6Y8eKwOWFcNk8yF3ccNmN6lFOJbhkQxcPXlP7+aYoCvnLydD2eTR+Gb5yoQ8f4jE7AeXmPkAKqrvf7OAopGmXjDx+uVd1OmHzkrKtXGBza/z22a+6r1Bn4A/aFIz69+fUkcC2b7BXBClLH+v2HHElAPOs3OoOIJU3vNt/J3//6EiUNQHTITolkxQtlFZXhADy9Y0eohbLeZaHLC+ZYsO0JR+lGZIF/AoDuYDx+2tiJ/LbxMpb7mTdSQ5fLiU8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8300990FA0AF97489EACE10012703B7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 pIyX6AzxREpBhcOpHSSkjzkY3WQl/9YMkd/SngFrQb/teujOM2F/k9r8koevEPOs/3FmFKAsxsmkinglZM6MX86iNN4w1fPNr7NRPFNkqi2+fFCF76kVBVMIAnHC8gEPDa1DtJ46XzrTxKO4MGOK6MUAK9XAnIGZw1OumvQvanrR7T0irwSP1s4HUjCE10p/Fmbd7mW+ybFOLDtuzJG3HQAyxU8nkJcHz2GaSVxMUOGmlSJdB1di5pkxr+kWY6nkWLtYpLtZNvWhcb60RbsfdZyguDXaET7FXYiiCbqfLOfEx4qn2g8BNJWPtMfenKHYkJKM9N5YES0rfgaR4T3HGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6051
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7b540381-21f4-470b-6446-08ded3868c6a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|23010399003|35042699022|82310400026|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	vxBrzmHSKLT9NItlu1MWdCjpGuM//cffKqQheQ4hhRKZFzVKZaMM6ae8ZFdqjkWLr8ODDsR890X5mXKU5w8CssFNi45As6lAQhuR4g8hqq6IiyIFlBidDwiaVEdmPmCAaa9zlgPJ1DG8APiqt6XXtFkKcS3y73cRRCtokv3KkTSTzP/Quht2VttBbWbgz5aKPh7Y1XvyLdiZU85daOS+So2BcdU6KpTD4rmbERF5Tgv53tRZBj82TgzLkDYTO0SV8VDuByAS9ybSewhU6BJ58xh3hlQ1C9gu3jlIeohHIRqPqIyjeo2A2irNjn23WH7RNOePcR/RTwQsHReUZhZ60Kx95Jo4ofdhTdaVa/ynbWzRBjTYMRIkeko8N9JgRNamBvXIJN/kpn++MWxQw+P+0UGYShtiG1raoE9oFSt0Z5BaKKcedTmvT2e53Z3cFKdDSwTYQinzzjipKh6zJiAkgfm5BvAFTDTa5CA89/KBuXYUZXmi/fwWXKdPMH0fD+9SohaBT7lX+RX67X0SBxIOtG63lu7k9SwvF9ytHoviiH6JAH1pp+5TYdkm3FMFz15K6bW4chGY3VJT/MkEVs2jUXg0z9RobPcBl3+Ru82ZvDFJ6rtL4or2RRXIqJ/zKGXoj0cqDLAXjIdHYxV7Dtgli0jST0cUg7h98WzLlv79Kh6XTJKvfy88X3ykmyo52m8uKCOhcBTy0gqIcBIN10j8oQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(23010399003)(35042699022)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QUfdjr+lPosqJYn8w3/lhexzFblwpaGwMwly9oVJSPf+tkyUJy4OPE3OIll36ZXXKKH1a/rSsuhaKwNLC80bFy9Zry2ff5IfvLOc+CiCojw/WEUp4qHAo+GVI/ECzKVID+Vqg9PnNcXZVuGeyR0IfxpOUHIA1W+VwCew/IQeDrfYSR4o3+h/ZPc8ENsLvCt3gJg1rphVf87+2GGQs5jXP1XlVg+cp3Xvi9d9yb/S9RFVyK7/9jpvBwSSkyoIFke/NV8B4t4VSTYxNGkXi4Lu8x5RxwcbqPniwu3SSkfn1xX3HoCs5QJLJejm16XNypoKtkADlWKR4QYZRBk0+EhZqxAH2ybAzmnIqNG/SceM2XGqdg/d7gtYN9HWK5QELOhWF+liGsehUwL2z2VNP3UjEa2pSZdlUMWh8DcdMeDQDMDnFGElSpY2lweUX3r1WrhZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 13:27:38.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7a7229-959f-4f58-253f-08ded386b165
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10967
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239631

PiBPbiAyMiBKdW4gMjAyNiwgYXQgMDk6MTcsIFZpdmVrIFB1YXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHZwdWFyPXF0aS5xdWFsY29tbS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBJIHByb3Bvc2UgdG8gdGFrZSBvd25lcnNoaXAgZm9yIGxpbnV4LWZpcm13
YXJlIHJlY2lwZS4NCg0KSW4gdGhpcyBjYXNlIHlvdSBtaWdodCB3YW50IHRvIGtub3cgdGhhdCBJ
4oCZdmUgaGFkIGEgc2lkZS1xdWVzdCBvZiByZXdyaXRpbmcgdGhlIGZpcm13YXJlIHBhY2thZ2lu
ZyBlbnRpcmVseToNCg0KLSB0aGUgZmlybXdhcmUgV0hFTkNFIGZpbGUgZ3JvdXBzIGZpcm13YXJl
IGludG8gbG9naWNhbCBncm91cHMNCi0ga2VybmVsIG1vZHVsZXMgZGVjbGFyZSBpbiB0aGUgRUxG
IHdoYXQgZmlybXdhcmUgdGhleSBsb2FkDQoNClNvIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0bzoN
Ci0gYWRkIHByb3ZpZGVzIHRvIHRoZSBmaXJtd2FyZSBwYWNrYWdlcw0KLSBhdXRvbWF0aWNhbGx5
IGdlbmVyYXRlIGRlcGVuZGVuY2llcyBmcm9tIGtlcm5lbCBtb2R1bGUgcGFja2FnZXMgdG8gZmly
bXdhcmUgcGFja2FnZXMNCi0gYXV0b21hdGljYWxseSBnZW5lcmF0ZSBmaXJtd2FyZSBwYWNrYWdp
bmcgZHJpdmVuIGJ5IFdIRU5DRSBpbnN0ZWFkIG9mIGhhdmluZyB0byBoYW5kLW1haW50YWluIHBh
Y2thZ2luZw0KDQpXSXRoIHRoZSBlbmQgcmVzdWx0IHRoYXQgaW5zdGFsbGluZyBhIGtlcm5lbCBt
b2R1bGUgcmVzdWx0cyBpbiB0aGUgcmlnaHQgZmlybXdhcmUgYmVpbmcgcHVsbGVkIGluLiAgTWFn
aWMhDQoNClRoaXMgaXMgdmVyeSBtdWNoIFdJUCBidXQgaWYgeW91IHdhbnQgdG8gaGVscCB0ZXN0
IGFuZCB3b3JrIG9uIGl0LCB0aGVuIHRoYXQgd291bGQgYmUgd2VsY29tZS4gIE15IHVnbHkgd29y
ay1pbi1wcm9ncmVzcyBicmFuY2ggY2FuIGJlIGZvdW5kIGluIG9wZW5lbWJlZGRlZC1jb3JlLWNv
bnRyaWIsIHJvc3Mvd2lwL2F1dG9maXJtd2FyZS4NCg0KUm9zcw==

