Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1984EC83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:29:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.66])
 by mx.groups.io with SMTP id smtpd.web11.49632.1693837741710216642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bymFWG4e;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bymFWG4e;
 spf=pass (domain: arm.com, ip: 40.107.22.66, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liXd59MZS7fGAGRuBeIA0HkPdZC1ZJfPN7hKpLCVXnQ=;
 b=bymFWG4eCUkVwvLu8xtJrwUDNj9m+f+Vb1ACwzY1YHeivYJphACGrYNJ6rsOo8aSyk6Sq4XF2JmeCavrcTKm00UYJa5AruaD7P4Q0Ik+STEv5kE4llpaWkoyVBJN0wcP6U9zzhen7CVUnyZNb4XqX6MrRi9wPbt2xTHW+MWhj/s=
Received: from AM5PR1001CA0058.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::35) by AS8PR08MB9338.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 14:28:58 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::8a) by AM5PR1001CA0058.outlook.office365.com
 (2603:10a6:206:15::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 14:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.18 via Frontend Transport; Mon, 4 Sep 2023 14:28:58 +0000
Received: ("Tessian outbound b5a0f4347031:v175"); Mon, 04 Sep 2023 14:28:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20044183c2718ab7
X-CR-MTA-TID: 64aa7808
Received: from 96f1482c2543.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AFB89C3A-9519-4A97-8070-340FC28A8CEC.1;
	Mon, 04 Sep 2023 14:28:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96f1482c2543.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Sep 2023 14:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7xxBSgA5UAw7cR8lmCiN/RLYIftpnY40d1Zbf01HbKzW5axQIAWdbVm8D8eF3T2XPgBvwnwbXNYKnEd2hWRKpr+lOueDJIniGlg9SZdynOk8h2NG2UiGjBnSg1PQw0Sc1JFz3BabUaU4kOl/UjFmAkWU/U7igRJil8pWdDAFmbS1YzRUpfbuFt+7LfDd3pj4Noo51AenAgBGyHEek3prDQ1roEDQ3+AYb90DBDfTV843AL1o4ts0M7rUGnDfNI56yWEaht0yTiVI+mmUMeX3UnktajOPpZD1aDIkoe78Ix/WhEtdUOry8+TjicD7d7szBoMvlAmEeUSHuawVJ+u5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liXd59MZS7fGAGRuBeIA0HkPdZC1ZJfPN7hKpLCVXnQ=;
 b=cAZoXccDSpfvwKR3Jd1jwVGXFuD9JdgEqsp/3nd4SPwsRTepzDR1KC3SvfwbcwFJCgnavTMcY4x36UPoTCfemuTB44QNhI+KymvEHsqPNcd2A1WZzcD9QanaAcZwXw38GMiHVAiWFC6PQf+ZfGmrBaVKynDCpKIhVtm8mW6rkQslceuq1Kw/Lw7NDQkW3gCIXL+O6VGYNNA3TO8ALht+C2DC+7d/kOdlQcGE9Nhx91mtaXjJ8Lauj5VCLs3Lo0IpEkElrN8mQ6k5uY2MD4CRKqQ105kbgfZ4K14dUGkbbSWwIU/Bm6hFsm+r95QdpyX/DzwTVs6rlO4TTVbr835/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liXd59MZS7fGAGRuBeIA0HkPdZC1ZJfPN7hKpLCVXnQ=;
 b=bymFWG4eCUkVwvLu8xtJrwUDNj9m+f+Vb1ACwzY1YHeivYJphACGrYNJ6rsOo8aSyk6Sq4XF2JmeCavrcTKm00UYJa5AruaD7P4Q0Ik+STEv5kE4llpaWkoyVBJN0wcP6U9zzhen7CVUnyZNb4XqX6MrRi9wPbt2xTHW+MWhj/s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5402.eurprd08.prod.outlook.com (2603:10a6:10:11b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 14:28:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:28:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ppjadhav456@gmail.com" <ppjadhav456@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "poonam.jadhav@kpit.com"
	<poonam.jadhav@kpit.com>, "ranjitsinh.rathod@kpit.com"
	<ranjitsinh.rathod@kpit.com>
Subject: Re: [OE-core][master][PATCH] pixman: Remove 'PD' from 'LICENSE'
Thread-Topic: [OE-core][master][PATCH] pixman: Remove 'PD' from 'LICENSE'
Thread-Index: AQHZ3znr+ubTj8jBz0OwdGOvGQNxhLAKubwA
Date: Mon, 4 Sep 2023 14:28:49 +0000
Message-ID: <827A2F40-F0E7-4353-92BE-07F70BD7E93C@arm.com>
References: <20230904141216.111840-1-ppjadhav456@gmail.com>
In-Reply-To: <20230904141216.111840-1-ppjadhav456@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5402:EE_|AM7EUR03FT015:EE_|AS8PR08MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a06ce0-ccd0-4e7d-431e-08dbad534692
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wET5MHfMQnCpMJif/5Ub4oAUKfGrRH/QgIIdcHHAht9/XR2oKsD2aa3JPl70amf8EgykCoYP6gHHIMPgzdB6wA7NM8+rpqFZAx9W1fgwstA85TZ6wr1EafX+obOiW6/F/PbaVclQUULclKztqgUVpXAk6HYqvL1yhUBoEMxGOAFwbTEjkV10E4/69IA7hi51EZS3m2IMTH9aIUMDwkCoVv0mm12J3Tdne9FSRL6kyk5BGInhzhfaGy1c6697Z/OI7C/Fv2GtM9JJjANTo+ksOW6zHLhQE0E0xV1A8sdLaVaMrxLKdncjigBh5odizm4uXnYI2Wzq/znu96sJDpqN9/yhZACvwZFZY6DLD6rMYVVpoM9vuul2Cf5bGLIpSCNNkfvg8AXipDQUF5XxY4Rhfn996sjDYBUS6N1aRHO5YYaYYICsXcsWb8WXS0BmroKJQpKX/0UrVqmK9GDYENWlHP87CnNSlp4YqJG2DqzlBB8Bqpn8ceXNFwd5DAgrR4QHF91P1o7Ce18UnUgfMOBlCfZzTdqk9ExlkZ0n87YpaXoZnlFW1BptxlrsSJKrRvs+cp+WzJI8307QJ8S0fBJJABMYNzhZL//yieCrwLc8TWohpHY0wUQzO/Ihih4xc7rTgoXlB2Ge437700DNxMOjGUmTOxL0imncouaJ+cbueaQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(186009)(1800799009)(451199024)(122000001)(71200400001)(478600001)(966005)(91956017)(66476007)(66556008)(76116006)(66946007)(66446008)(26005)(2616005)(54906003)(64756008)(6506007)(6486002)(6512007)(4744005)(2906002)(8676002)(4326008)(8936002)(53546011)(6916009)(316002)(5660300002)(86362001)(36756003)(38070700005)(33656002)(38100700002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <57633A7817383148B01258017B112E23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5402
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0455eb9a-b160-4ae2-e7a3-08dbad5341b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HqYV8XTVDgDPJn8DPt8VpAstsow7aOO53iGrXj/sW3WYhR6ekD4htU+SA6mQdRheGYZq2Yo0SqYj7IiIXy3qsz2ojg4VFcjMCPDO0Ay7qTdyIdh3ivpp4RvArkpMR5FeSK+PNP8fGNLazzCPikUnuzHdSFW3Uw3IgolyUPxhwAJkNwuMuiiwVB8z62X0dF45TX/mun/pRXEp7oCYHrat1YJCkp9nTopLSPzRbPfBkZJK3C2GjDfm+5Sq5tTXpAjanJzHYFO8ESinYwg+CVOEnvMGXAy0fOU7phNvtoi4cRBn0H43GCnn640uXjtkF6UFE/pR+lifb7SYNU6GKB2Zwzch8U5H7SQHDxKVHT5KCZULXmlXnrIQfRnLce3WowfN6f99W3A9wv6th2bxlJC29FtmjnbE1WselqrcmpE9zRtVlfdnpCLB+Hcrnh3dAyv/nKzMM7Yl1p+K6q6q9c6rdVkpcdu9dnlT2qgZ9L74ZtxqCatTg7ucokQ/PHq7AmfxIPvUxsC24QfMxFQMfSBu0/BFaO6lHV1EixmoCeD+yaenGSNTlwNT5j1RkplO3ioQ7oU1NaJoioCWStYgQkXN/ciqb3LY1CpIdXZ8ZccsjwiwxnDllgVgYnOnOPVCsbiLsB1qJc2V71syedNAzd5CkwEmOP+OprsdUNZlra8W/vHEx9xe74Rfvkvh5OkMRdduvG2gnScEY5YbjaOjVoz8CNYoaVzFa/V4A8v4h7pVAiR1DI2rQ1SGmmQjg8Pn3gvu0cimq1ejOa65bCmrTfYz/g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(41300700001)(356005)(478600001)(82740400003)(81166007)(86362001)(33656002)(966005)(2616005)(336012)(26005)(107886003)(6512007)(47076005)(6506007)(53546011)(6486002)(36860700001)(40480700001)(70586007)(70206006)(36756003)(54906003)(2906002)(316002)(4744005)(8676002)(6862004)(5660300002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 14:28:58.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a06ce0-ccd0-4e7d-431e-08dbad534692
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187188

T24gNCBTZXAgMjAyMywgYXQgMTU6MTIsIFBvb25hbSBKYWRoYXYgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHBwamFkaGF2NDU2PWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IEZyb206IFBvb25hbSBKYWRoYXYgPHBvb25hbS5qYWRoYXZAa3BpdC5jb20+
DQo+IA0KPiBSZW1vdmUgJ1BEJyBmcm9tICdMSUNFTlNFJyBmb3IgcGl4bWFuIHJlY2lwZSBhcyBp
dCBpcyBub3QgcGFydCBvZiBwYWNrYWdlLg0KPiANCj4gUEQgbGljZW5zZSBjb21lcyBhcyBhIHBh
cnQgb2YgdGhlIGdlbmVyaWMgZG9fcG9wdWxhdGVfbGljZW5zZSB0YXNrDQo+IGFuZCBub3QgYXMg
YSBwYXJ0IG9mIHRoZSBhY3R1YWwgcGFja2FnZS4gSXQgaXMgbm93aGVyZSBpbiB0aGUgc291cmNl
DQo+IGNvZGUgcGl4bWFuIC0gUGl4bWFuOiBUaGUgcGl4ZWwtbWFuaXB1bGF0aW9uIGxpYnJhcnkg
Zm9yIFggYW5kIGNhaXJvLg0KPiAobWlycm9yZWQgZnJvbSBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvcGl4bWFuL3BpeG1hbikNCj4gKGNnaXQuZnJlZWRlc2t0b3Aub3JnKQ0KDQpXaGF0
IGRvIHlvdSBtZWFuIGRvX3BvcHVsYXRlX2xpY2Vuc2UgdGFzaz8gIEnigJltIGNvbmZ1c2VkIGFz
IHRvIHdoYXQgeW914oCZcmUgdHJ5aW5nIHRvIHNheSBoZXJlLg0KDQpQRCBpbiB0aGUgTElDRU5T
RSBmaWVsZCBtZWFucyDigJxwdWJsaWMgZG9tYWlu4oCdLCBhbmQgd2hpbHN0IHRoZXJl4oCZcyBh
IGJpZ2dlciBkaXNjdXNzaW9uIGFib3V0IHdoYXQg4oCccHVibGljIGRvbWFpbuKAnSBhY3R1YWxs
eSBtZWFucyBpbiB0aGUgcmVhbCB3b3JsZCwgdGhlcmUgaXMgbm8gZG91YnQgdGhhdCBwaXhtYW4g
ZG9lcyBpbiBmYWN0IGNvbnRhaW4gcHVibGljIGRvbWFpbiBjb2RlOg0KDQpodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvcGl4bWFuL3BpeG1hbi8tL2Jsb2IvbWFzdGVyL3Rlc3QvdXRpbHMv
dXRpbHMuYz9yZWZfdHlwZT1oZWFkcyNMNDkNCg0KSSBzYXkgdGhpcyBwYXRjaCBpcyByZWplY3Rl
ZC4NCg0KUm9zcw==

