Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3727FC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 16:09:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web11.26359.1710518985520478060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 09:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4u9vjv5G;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4u9vjv5G;
 spf=pass (domain: arm.com, ip: 40.107.8.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jue2e2xNIDqbGza7Mo+m9LjuEQtqNjMjys/DC8WWbGiR63wLSvOYnIvmtQjE7qlseYm6lqnue1fnP7Kc9cZEDdplQDzoS0Z0eXkcstc623kQymoaUt4rprc9FPaRHTTXioyNRgYuROlQw55RbpLT811trifalLNmfwIYF+X5yhhxL/9QHc4lSxjmOUDdogQfp7zeXAW8lxp1vYYnzeCqWFbgpjX/zElCuBCiAGKXL3sUTX511QidLDegcVS7YPogOkdQfg+O0L9sxFF8cmmLKA+LfFlFinhrIg7ny31dwgSOsxtP7veLSc8irRl7wrOOohvEqOV+0CMUYKlHP9oL0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M40SAEjyt1sSc2h9HVSBH7ZuB4+hComGonB+mm6UMCA=;
 b=Kk1oVoKFLMNesEFO6ARO12wTk5QUfzEwDvq4U8qpAyM6ACrCQ5inJCq2j1fdx6N3vFHJZ17XGbnCwHPhym+SRZJLo1ZGL1VVNcOymJKilvNLeAVfgP+/UjOXcv9G8kmFsZSnO1mYgOrTAx2rOR6WmeSRbHFAgjcx+e9PhXGj35YKZheSf5hfBBAtj4wockwsVG25CikUOl1mD0zWJBgSyo2oAg/1lzh5oIFFckfjeqjvQyl5rNBbd2+nzcSvAAMzRkCyPnxEWDwB5fCdDze6PVrO3aBfVuWbdvJkm07Cib17vLsAUqPzuEla0H8fIeyAvMU0CM6Ru8CKkir1dASdcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M40SAEjyt1sSc2h9HVSBH7ZuB4+hComGonB+mm6UMCA=;
 b=4u9vjv5Gq074eDh24oGWXlsO714EM76sO7MDnQ3QyOeUgrT2rsCi3OVZz0tsyg12n4cxgk87zJbSvDLLUh4bSs1QZy13gS9O34e/CArrJoKFq12zewkKWQ91PK+VCCaERWa1JsCgNbuISAxk+upTx+iSAxeCkbUDzy4L0D20RP0=
Received: from DUZPR01CA0246.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::12) by DBBPR08MB6313.eurprd08.prod.outlook.com
 (2603:10a6:10:202::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Fri, 15 Mar
 2024 16:09:41 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::25) by DUZPR01CA0246.outlook.office365.com
 (2603:10a6:10:4b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Fri, 15 Mar 2024 16:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 16:09:41 +0000
Received: ("Tessian outbound 456a16a4297b:v276"); Fri, 15 Mar 2024 16:09:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 998ba7421d7782ee
X-CR-MTA-TID: 64aa7808
Received: from 4e0485faab70.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F8DE7054-B2BA-4F35-8926-5A3FFA68A2D1.1;
	Fri, 15 Mar 2024 16:09:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e0485faab70.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 15 Mar 2024 16:09:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHXIFJ60xpEhrAfqtA3JFR0mNSC9KP+5RtMfLgagnKFnpudcaXw1BUUUXMaAN8wWLYv0Cb27rZihcZJBXB/ZofwYZISvNX9PqPV0Y5yKt7VRSdOsV0KpSkaWouxEn6Qdo6roNxAPe5K6CC5oYRDAo7PaQz2FZ1u2qR+jr9xNMLFV2QSunZ70DbqLuMrl4KGpSmTyo+zhfpeA97V5foMMnnFdk1sWEPbMbhcf+HA6SMIOOw7MqiE4z8jrR0HRlIT2SUcLj7CeIq33fFmZGYo7r5wj6fo5zl4C9MBXdFRe1Rq/VtRsDKl0Gds2D8ffw625WNR/diOoYRVCNfdQwrsWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M40SAEjyt1sSc2h9HVSBH7ZuB4+hComGonB+mm6UMCA=;
 b=W5uB1qeALvDak8BBTf4cry61tsaaW8Vippnl8fdIFwOuIo3TRAVGna06HDFsmBOcGR5z4TG5zC4OCaGyUkwZE7d9/Tts2AkVpy0ChxV+7NgKqSpwk1dupZLUfEwBmzXOUW9qbv52SpmdbHLEYt0kCCepgvot+1arG9mIqaAipjURHzsDOJgdECBs0B7SNMudOSddSQARwo7QAbs54JjZsBSFey5NXG6yHAM9lkPY8ijTUjVBhVciAHT+NK34HYCRtW7i4vpmRn5af5rwfrdoNp65o4v0tF+YmYmkTcDDvm+2MgiOmJpb/Lvc082UOzR0yCmaVJXIdyY7YmHmMol2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M40SAEjyt1sSc2h9HVSBH7ZuB4+hComGonB+mm6UMCA=;
 b=4u9vjv5Gq074eDh24oGWXlsO714EM76sO7MDnQ3QyOeUgrT2rsCi3OVZz0tsyg12n4cxgk87zJbSvDLLUh4bSs1QZy13gS9O34e/CArrJoKFq12zewkKWQ91PK+VCCaERWa1JsCgNbuISAxk+upTx+iSAxeCkbUDzy4L0D20RP0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7699.eurprd08.prod.outlook.com (2603:10a6:10:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Fri, 15 Mar
 2024 16:09:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 16:09:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emil.kronborg@protonmail.com" <emil.kronborg@protonmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssh: enable sshd.service by default
Thread-Topic: [OE-core] [PATCH] openssh: enable sshd.service by default
Thread-Index: AQHacMtRHzImoTqot0eo3+xo4ZzfF7E5BLCA
Date: Fri, 15 Mar 2024 16:09:31 +0000
Message-ID: <856288DD-FACC-45EA-8248-C2FD0EC724C6@arm.com>
References: <20240307200830.221403-1-emil.kronborg@protonmail.com>
In-Reply-To: <20240307200830.221403-1-emil.kronborg@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7699:EE_|DB1PEPF000509EC:EE_|DBBPR08MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dbc8788-0e93-4ff5-9f65-08dc450a525e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u5hZYLMnuW4QD637KVQW/zXqo6zAsG8Sw91SDAVwEiKZSnznRa70NtUdYJquOjXpGJz8L3CnM61V4+KCOiThZ+zj9zxk6irqCIAcIqOjL8Ht1TnsrEvY1AIbHNy1csBYSaYLfmeo6IQum0jL/EQiI4Q+Zdh7ZX99WptMpMn+MuHr0iLrCz3yd8b2LDET7dNBt05HBnpmAE21pw0t4N+0JWw5UQjp1m79JQ7WquOHO/axikFQtauNTewN1Rm92cWj9DO4Z9dwIf27l97B6lCCl9GCR7Cq1/fqae7rQBl0MKjTajBPwNYuAbI55pIxVG5ARWOlqoJ3YL80MCazjtnFamkcTCbyX7jUPK4hVrlSdk7inEjz82NKy/jyqBoDcdx7ErEcoAvDr9iPoxZ6cP31nsmwXHXugko8lWTKYd03sTs7KQLOy9y6OSgOWTVgfuDFrNy28sgJxh80r52bcboTLJuGzXu8sHdPHy7y2itZeox/UF6eucoOvqlhTwYUNsI1G525FqVWg0aE9MNHTCiyc04xUe8S+EZLa3rGOOmZkvJJHz9DvKNbVrTgSOdmkBVS9bGDlwDWAtZIhfbjSIzOkOug9TJOz8rbkzZGBYGXcPyUg2BlNHLdyus+2tov6PrvErMcfa7Jp5JTgqtw7sZ3udxaoO2TQVJfJ+zYn1DGpJHvRdIGTqb5bLlXfBIDU73IvJwp1QU3nMgyR1PpOtxCtQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF6E3A44DF2FB64EB0016E9DBA3E2375@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7699
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	63227ca0-c60b-4676-7dc1-08dc450a4ccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	poVj21Svqu3qy6XLVr55d9dhjBAJdvqoSQIYSKffyGERzY/bMYJstNN4m2T+nvqf7zo1o6XH8MA0YRr7OtiUCj8KACIFj1R6qoBLUAMcImPYlvygjd82FBlRYgyOYS4ZKVil/geHWk/+xdzELg+SmlAaeTXu/HecPpAdlTlZd2eTtKyZlMhHGGcdB8R+kuHvJIInQNVZoyf3Z85KbfBWZPV/XcWVIIEgMh4OR+QvW8MiF3lWOE0BVVtzYfyuQBrgxyjbGcB7DmNAN1RE6F0MeUhskLfsYDnq7/8jy0u0SKbAFM0YdZnuxgudQTNnhijbwI/wmCMBuUYA67f0scgv//OB/DSPLos4EH6PXLk/Nngnnn0FIXuCN7uwC6neT45p7hky0zzHHGJAsvuQIEamESa6BOyYcItHhZsOM1V3Q3hKvMmapIeFdKEQf6+mfe4+sfRLqbzWW1aFy1mfC6vOLM8ae8R8gP4j87kU2p6GiKRYXsLy/hdI9zeu0LSaCqbOrVBo5wS7vNdZ4GMoz5VYAnO5dHND10KcOqgDrG7zL6MDt+LylRirNRW4z8TBgm+KsLWDfc+kuCbLmvDhRdwwsYS5qOzhX7fpJ7lPHqa5f5yrwZ8H95EkvOa8gkgZG0JHk+aNPSmExPsrSM/4efkGnlgkMhKUqN3MnLvCEW6+KVBssYq1HhnHjW1C7ciCOL5wVjXa6rY7ZKPV8haXsWYtnVjB0iUXZ94KiNyW2ChJumZflVCBmXUDU6ZqKWFnCZV7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 16:09:41.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbc8788-0e93-4ff5-9f65-08dc450a525e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 16:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197144

T24gNyBNYXIgMjAyNCwgYXQgMjA6MDgsIEVtaWwgS3JvbmJvcmcgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGVtaWwua3JvbmJvcmc9cHJvdG9ubWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBTb2NrZXQgYWN0aXZhdGlvbiBpcyBwcm9uZSB0byBEb1MgKGRl
bmlhbCBvZiBzZXJ2aWNlKSBiZWNhdXNlIHRvbyBtYW55DQo+IGNvbm5lY3Rpb25zIHdpbGwgcGVy
bWFuZW50bHkgZGVhY3RpdmF0ZSBzc2hkLnNvY2tldCBbMV0uIEFsc28sIHNpbmNlDQo+IHNvY2tl
dCB1bml0cyBkbyBub3QgYWxsb3cgc2V0dGluZyBSZXN0YXJ0LCBhY2NlcHRpbmcgbmV3IGNvbm5l
Y3Rpb25zIGNhbg0KPiBmYWlsIGR1ZSB0bywgZm9yIGV4YW1wbGUsIE9PTSAob3V0IG9mIG1lbW9y
eSkgWzJdLiBUaGVyZWZvcmUsIGl0IHNlZW1zDQo+IG1vcmUgc2Vuc2libGUgdG8gdXNlIHNzaGQu
c2VydmljZSBieSBkZWZhdWx0IGFuZCBsZXQgc3NoZC5zb2NrZXQgYmUgYW4NCj4gb3B0aW9uYWwg
Y2hvaWNlLg0KDQpDb3VudGVyLWFyZ3VtZW50OiB0aGlzIGlzIHdoeSBpdOKAmXMgYSBQQUNLQUdF
Q09ORklHLCBhbmQgc29ja2V0IGFjdGl2YXRpb24gaGFzIHRoZSBhZHZhbnRhZ2UgdGhhdCBpdCBt
YWtlcyBib290cyBmYXN0ZXIuICBJZiBEb1MgaXMgYSBjb25jZXJuLCB0aGVuIHRoZSBkaXN0cm8g
Y2FuIHN3aXRjaCB0cml2aWFsbHkgdG8gc2VydmljZSBhY3RpdmF0ZWQuDQoNClJvc3M=

