Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2668C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 17:01:32 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web10.80035.1705942888134165776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 09:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3yhJvHe6;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3yhJvHe6;
 spf=pass (domain: arm.com, ip: 40.107.8.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C5b9r4018xAHmQHGqQ7zO66AIiFmxmC+XG4CCzZ+qaQOqnu/g9/YH/wg25f3qgcFBpgg4Tl5TCrsrPCux00pi9iUZ+yOoAo+ze8J/ThzGz23FNyFazDd8YD3gqj5gmXfCddCCro0U0aZ1wdBFSXB4JIjBN+gpBqwRJg+KCHpMRqsDT7uhpg+V+JRNEjpHZDiaEyL6Nz0w0/sR6cR84YLGYveuCguYE78f9BXY14ZdhwDGm1vR8HgctNTn/PUaeMUCtaEXy4juMfWXNZrqDEK+EfiTVlZ5E/s8INseoJz4LpBjnsOEbR+INxxkUyM0K0fogbmovm7qOAgzXfPEjs89w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GTe/dtzkCHvbtFSOZ5TN/Sn/W1z4ZInX0n5cTVVgZQ=;
 b=kJhgdpiLh/d9XCRLN26jditcSxukRRflM3ZEPw+NAi6a8hzrrqBAfDRANq04cTduKNlF1mP0WfAYiYHhi0kNCAPEccErjXjMAx8wnFl2RFK2A4al6OT0FvRotUiVRH2lF8iDxHJsyKL37JvBAFfF4+swyqngP36Qelh1bWN+E5URmEVWmfWpaRsuBRZBoI0J/b0SvZ65dEcCJjlAxA3VnW7zMJZQYazKxxQaseMXxa5J2NeElLlHiCTw7uBGxYxyMXqplqYqA+vK3IvmYk9yTb1AA7CWbEi7r9pz/K671nTaAVXEMGnpxNUvA1a2OEzOVIqsp6i7AR3pf7kUQ2rzhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GTe/dtzkCHvbtFSOZ5TN/Sn/W1z4ZInX0n5cTVVgZQ=;
 b=3yhJvHe6XSOiDLTVM4uBPn8/lMo/Hbo8N3/TCbbt8V71tWRt+CWTglDzPaqI9u1EkL8sXoWhR44y2Ign0Vajgc7WSyIJZjC+48XWQPULdLnZ194PeMYSaewErRDgpMrGMx52iH6XEGLNuhwpAV6XPEelXn7oD3MSvEKnBNXjR/4=
Received: from DUZPR01CA0143.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::8) by DU0PR08MB7392.eurprd08.prod.outlook.com
 (2603:10a6:10:353::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 17:01:23 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::2) by DUZPR01CA0143.outlook.office365.com
 (2603:10a6:10:4bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 17:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 17:01:22 +0000
Received: ("Tessian outbound a064b9944658:v228"); Mon, 22 Jan 2024 17:01:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbe1d4900c073ba0
X-CR-MTA-TID: 64aa7808
Received: from ab01f21e5f62.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81036D92-1D8F-4CE4-B704-058DA01E5DEA.1;
	Mon, 22 Jan 2024 17:01:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab01f21e5f62.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 17:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ubo0N8638nb+NDWbG1dY2DjAkumn01SxqXIg5WnhpTpLXA1q2bPiY8gH9kHJoxnaMllyklfmxUCOcY6Jh5PKMy9YBi9frv3hLfOEa4HrD6jQ9pxhZOhCEDCk5blEOeFBIblHyXKzPLJhoqZsOP+mhBNH1u7nZEYmbftVjujU8Yv5aBBBXJoEm25Z7t9P6pI4teEzV5Ji+7VgOPYgGEGw08rsDPgKeecZIds2RrERrz413Ls3insX9pKRZnPjzWc/m9yCCnY/5uLhDEIwHbp5nYqdfn2CX7bA08dFYaHJVTCGn+ZU67wVPshxDDSXizd021FZBHsGwEv1fYqJmL0r4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GTe/dtzkCHvbtFSOZ5TN/Sn/W1z4ZInX0n5cTVVgZQ=;
 b=VVQILWz3djO/MNHB6tdxaSBdG6tP7xBsZXS7a8xuxbQu9ODcnabra3Fp5oqWu0I6YyzaSqc2bla3SPGIko6xJirw59vEjiOlHSqhgIx5pXyx+dyOy7d0DxEVRHel8liEK/2y2Z0AskpeRZnV704Xgl6watxdcIr3fut9R0VYR7XKZd8X9Pl+T3Fr0G4aN979zWk/FmfT/tIIR4ACuHRUGYUh9sxKMGzWbpTWXaPPcshWVwZXrurNkxBbs+kYuntbn7qocTr3nfHe/i7a29wTLaQdG7GovkPe77UfGQUTxR9RGD/tAIVzIQG7VPS4tipSDI0aHFel4OfbbcCn6nl6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GTe/dtzkCHvbtFSOZ5TN/Sn/W1z4ZInX0n5cTVVgZQ=;
 b=3yhJvHe6XSOiDLTVM4uBPn8/lMo/Hbo8N3/TCbbt8V71tWRt+CWTglDzPaqI9u1EkL8sXoWhR44y2Ign0Vajgc7WSyIJZjC+48XWQPULdLnZ194PeMYSaewErRDgpMrGMx52iH6XEGLNuhwpAV6XPEelXn7oD3MSvEKnBNXjR/4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9978.eurprd08.prod.outlook.com (2603:10a6:20b:631::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 17:01:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 17:01:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 21 Jan
 2024 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 21 Jan
 2024 01:00:01 AM HST
Thread-Index: AQHaTFuggAlyx2rD9UOuVvqk81OqbLDmEHMA
Date: Mon, 22 Jan 2024 17:01:14 +0000
Message-ID: <BEE2C717-6B2D-41C2-81D6-D8761D2C6E3A@arm.com>
References: <20240121111840.BFB881069A4@builder.sakoman.com>
In-Reply-To: <20240121111840.BFB881069A4@builder.sakoman.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9978:EE_|DU6PEPF0000B61B:EE_|DU0PR08MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cdd76ec-07a2-4c47-4dc0-08dc1b6bc332
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 09H91RaAhe2HoD57deP1PhdCfxev1+B4jjF7iO/cSwKmGmKEQTkKm+ioKsRjw9lGm2rGfCLIr9L1qBgk/YsMlxsRGy+G8Oc9dxLalpHypVbefpJZLrU5vB+zgKjBmQZs5s0w0I86ipizHCotUKAeWYWvNBkzkf3lVKx6Uiz++Yglnaiga/fvPov6Tq8rWsaHUaowK3TOxrIjmFh/Bg1E/u+jENpOEh52x2/hxhlm56KE1n5OnwCoZf/Cr9jp/RxNM6FwefczOOpxMPt4ymKs0su3D8g97+xUPvj1/DIaZtoLss8xdj3ClYfIhw/gt2CgTdkIC1Ukbp+Y475t5mnyQUzgZzf9hcUxpctHyX7Y6Y0LnY7SEysgwd6XIcUMy7Myv1Ia5G6F/KKcgexQ75jRQO6XNMe3nU3BAdfmkDgdpAuWtUYsOzUJ3c5+1LvlmM4SCP3ZH9+fNJWrjat4ZQftUZo139BfvbWiHxXDBQn116GP37AfBXXYpRFQ5s6cSPKmXVZ3cJf01UADJyE5W+l6FzeOQi06Kwf1oxzPPi1PsN3IVE7EhvaEHCA7GjEsDdsMGpbPTAMQrdUa6elCepp89OePpYy7oOWWI9ZllLvwFCWMBfNalzgpk5RT8Pqx2Dte
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(91956017)(53546011)(6506007)(6512007)(71200400001)(478600001)(966005)(6486002)(76116006)(66556008)(66946007)(86362001)(64756008)(6916009)(66476007)(316002)(54906003)(66446008)(2616005)(4326008)(8936002)(8676002)(5660300002)(38100700002)(122000001)(36756003)(2906002)(38070700009)(33656002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <326E3DD76FF7F946A835C4F7C09045AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9978
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb23f45b-5dbe-4f9a-f136-08dc1b6bbe58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VpBHVny0KVooBMw2nKkYVMNpBu0Ws3WOdNe/VsleTwR5bt3cNYRp0U1MrFbmNABeVWUqcwoyNqqVBvqQyoGfo3roonQZG70fslJZXvpY7nRoRGQlMf8nlO4eSX1mm1ryPcrE1Z4pgbvVd0wKSI1u/9ev8FpWSnGj1mWl6IFlneiifnGBOkXIqbYVV5SZYov+r1pHyWpsOYJvfIHFf01fUUgyC2HMWRYCEx4uxeFyZIQ7CTJ1oj25/HGMESotgijptxRl5MssDd3c5ca6L1G8uvQhLaZZpK2nH2U7MjmGYNmuMkDodQ7ETN1CHW7SM8GdykOEzu6yOEQuz0WTn4zdZchU+pkcHKtEuE3RW77LlDPuTy+GWscjAdPWdIK0hIg+X+jpXXt3wtr4oQahV5jOYWpwSyaK+OdL9ALEo/lrkF/XjgL/94eIdkrKG7yHb1/rsnyEuaGtqGIhMLtVnCryEHDWDTnZskO4agrLdEvdBa6bIs9g+EcMSK39aA3+/2vgpc7hGIpt2Sxtl89wTJxjzAEHPMdEAR1EVkrBixRxhIOUZrJjS2WAjTihuXKX9Ri9tW7lz7nTLcYjsJMimqN6GQXmqkE5ycyRC7MaIZEpBYYsimcXs5ahCZv0NTLWddCjJhICxegeH6FYvE/BX8TYY+k7G9WQdrw/1z2DR99mSuPqCxKpendjVXXZEcZDgnavegEdpgf4s4gPawLZRzUsPbprTygDYhDrJcy9X45ftQg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(41300700001)(36756003)(33656002)(86362001)(82740400003)(47076005)(36860700001)(107886003)(2616005)(53546011)(26005)(336012)(81166007)(6512007)(6506007)(70586007)(2906002)(478600001)(8676002)(966005)(54906003)(356005)(316002)(6486002)(70206006)(4326008)(5660300002)(8936002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 17:01:22.9916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdd76ec-07a2-4c47-4dc0-08dc1b6bc332
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194187

QW5kIHRoZSByZXN0IG9mIHRoZSBDVkVzOg0KDQpPbiAyMSBKYW4gMjAyNCwgYXQgMTE6MTgsIFN0
ZXZlIFNha29tYW4gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHN0ZXZlPXNha29tYW4uY29t
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPiBDVkUtMjAyMy0yNTU4NCAoQ1ZTUzM6
IDcuMSBISUdIKTogYmludXRpbHM6YmludXRpbHMtY3Jvc3MtdGVzdHN1aXRlOmJpbnV0aWxzLWNy
b3NzLXg4Nl82NDpiaW51dGlscy1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcv
dnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTI1NTg0ICoNCg0KUGFydCBvZiAyLjQwLCBDUEUg
Zml4IHNlbnQgdG8gTklTVC4NCg0KPiBDVkUtMjAyMy00MjM2MyAoQ1ZTUzM6IDUuNSBNRURJVU0p
OiBidXN5Ym94IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5J
ZD1DVkUtMjAyMy00MjM2MyAqDQo+IENWRS0yMDIzLTQyMzY0IChDVlNTMzogNS41IE1FRElVTSk6
IGJ1c3lib3ggaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklk
PUNWRS0yMDIzLTQyMzY0ICoNCj4gQ1ZFLTIwMjMtNDIzNjUgKENWU1MzOiA1LjUgTUVESVVNKTog
YnVzeWJveCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9
Q1ZFLTIwMjMtNDIzNjUgKg0KPiBDVkUtMjAyMy00MjM2NiAoQ1ZTUzM6IDUuNSBNRURJVU0pOiBi
dXN5Ym94IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAyMy00MjM2NiAqDQoNCkZvdXIgbWVtb3J5IHVzYWdlIGJ1Z3MgaW4gYXdrLCBhbGwgdW5m
aXhlZCB1cHN0cmVhbSBjdXJyZW50bHkuDQoNCj4gQ1ZFLTIwMjMtNDg3OTUgKENWU1MzOiA1Ljkg
TUVESVVNKTogbGlic3NoMjpsaWJzc2gyLW5hdGl2ZTpvcGVuc3NoIGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy00ODc5NSAqDQoNCkZpeGVk
IHVwc3RyZWFtIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJzc2gyL2xpYnNzaDIvY29tbWl0L2Qz
NGQ5MjU4Yjg0MjBiMTllYzNmOTdiNGNjNWJmN2FhN2Q5OGUzNWEsIG5lZWRzIGEgYmFja3BvcnQu
DQoNCj4gQ1ZFLTIwMjMtNTEzODQgKENWU1MzOiA1LjUgTUVESVVNKTogb3BlbnNzaCBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNTEzODQg
Kg0KPiBDVkUtMjAyMy01MTM4NSAoQ1ZTUzM6IDYuNSBNRURJVU0pOiBvcGVuc3NoIGh0dHBzOi8v
d2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy01MTM4NSAq
DQoNClRoZXNlIGFyZSBwYXJ0IG9mIG9wZW5zc2ggOS42LCB3aGljaCBUaW0gc2VudCBhIHBhdGNo
IGZvciBhbHJlYWR5Lg0KDQo+IENWRS0yMDIzLTUxNzY3IChDVlNTMzogNy4wIEhJR0gpOiBvcGVu
c3NoIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUt
MjAyMy01MTc2NyAqDQoNClRoaXMgaXMgYSBSb3dIYW1tZXIgYXR0YWNrIGFnYWluc3QgT3BlblNT
SCwgYnV0IGh0dHBzOi8vYnVnemlsbGEubWluZHJvdC5vcmcvc2hvd19idWcuY2dpP2lkPTM2NTYg
ZGlzY3Vzc2VzIGl0IGZ1cnRoZXIgYW5kIGl04oCZcyBpbmNyZWRpYmx5IGRpZmZpY3VsdCB0byBl
eHBsb2l0IGluIHRoZSByZWFsIHdvcmxkIHdpdGggYW4gdW5tb2RpZmllZCBvcGVuc3NoLg0KDQpS
b3Nz

