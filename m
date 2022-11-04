Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE768C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 16:20:12 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.61])
 by mx.groups.io with SMTP id smtpd.web08.91.1667578808140191983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 09:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zhSlYDJK;
 spf=pass (domain: arm.com, ip: 40.107.2.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XQwW7+8kg4WOX/OoQWIr4fvde/rfInI+YVnKPcTgGeKWCX+WKj8dGzR9fzMK0V5foLSg/sxpasfrYfwviQFdN30xs8stuGu2uvOyuDbMD8pu0+Y7TVxHrvZkiDxphYbhuP/1ICOxusTJX/me3zDgPmypChGfr2jNuWK7F61ganJOkUqT8RJl9SYRgiQ4g1hWtLlQ5bG+PA/khCcInVb0WJb/9S5XWidaQorNinrZ1osMqCi7ZjF5FhFvWWgPqq7UYt2jGrppzE4O2ybizFA0LPUrH4o2EBfR4SRumCgc4M7EtBijJVJHSlUUPWhhgM7oAtZx2V2a2/gCcMStQNJUSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pO//KgS3Ow5/K2mHP4jO/5CcY6m+bv8wjtYAIXjd10=;
 b=hrsMUONqpaS7NPb1+VDJhUKkUPAYIS6Ob5BxFP1dtQuZ+Oq5EdZTK3Ep99ZQ7pLeSNX/yw2pbQfDNC74n890j2iJVI3Qv1nprjWfpMXSHewcuPsNj7ZROsPAg2wUqwU4iRLf9V3CShsap+MFIawp5VC0id8B2zLldoKMrWTeGDQMvsYa26aRK9xoL9eZlWLC9Dc9knIuQHAemaAoQJipcjuLG0wbZOIMcbNfclwouTggplZ5yIluS4nri4uRYJOlN54bwk2/N2i0EAbISwhcNQgRQ9YgGCshsntO+X0kJJe6CGeV5w4DSKOr88I7RKXqZaA8Q/obI40jJuNNXHgykg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pO//KgS3Ow5/K2mHP4jO/5CcY6m+bv8wjtYAIXjd10=;
 b=zhSlYDJKl3kVxWRkoFlcOY2tVDcy9XajN6ZQykEZYb7c+OHd2YFlSB8A2QkZyKwUPpCDnTXE+/u21rDhyCyp4WI0+EEyqIm2nD/sZBIh31xTytTSf8vDlu2bwpK9H10E9EDsmFFM7RpbfdpY7h80TQU8aCnfwNQHn6F/Q4R7ZC4=
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by AS1PR08MB7585.eurprd08.prod.outlook.com
 (2603:10a6:20b:471::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 16:20:04 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::d5) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 16:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 16:20:04 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Fri, 04 Nov 2022 16:20:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a99c04842539ea6
X-CR-MTA-TID: 64aa7808
Received: from f17f2ce7576b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2FC26180-365D-4E61-9A95-4472D55E12F5.1;
	Fri, 04 Nov 2022 16:19:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f17f2ce7576b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Nov 2022 16:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxL0W5vKOqV7X43tLC3Wbh5/P9NcOcGD1ZHCQ824VT1FB4fKyshCwIdC7pi45O/vP9r2DiGZQeYWLajX0YouauiCKmQ/LqXpVUVF6+4OkWkTS63AUl4ryvVpoRDUoQF27O008bQsEYBs6UZNpArMVu9foN1MbOCM9RTgbFz9reWhQ6X2gXsR5w8iHgY5+urhIQ2PZt+0yMuDLuLms1MqaJjNBC5bujxKr89p38IDg1cpqgckrqBY4euEC9ZB08S8d7Nrhgir+AyO8WSlJs1pK4xhDskyqeCr2RRKFvN9xi6Hs3t/9Ev4Q3oGvy5amHzKWQPzehCnvbSpgbgXexfKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pO//KgS3Ow5/K2mHP4jO/5CcY6m+bv8wjtYAIXjd10=;
 b=RNxcUDKMZD/5D4muX0Y6GgRHsn4zL7kEuZGeMOaFAFzZ3aDTkwZx75ECZgOaX1FRRIWZPGu69+z8tmuSrhSR8I6D/tjjtLhDBkSHDSWz7hjqybsFm7NlQiUau7yMbNjDf/MbZJISP4NS+xCRqstFZn1kwuAuoJIq87Ofgv/hEru6wHopRzUHYm3CgQbUa13hQNPM07xBAROpo/9LFsxeG3DuiLBadF0kdnsOZMBjP57C7wyDFgvXM74o+yJmXrvEWeozai3rO6njnjJ94XaOZcfc4eoQYNeUHPx4NZuwZhJsj3uEBq51H/gi61ynQJAUpIQzHE23wA2NjtbGxDYgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pO//KgS3Ow5/K2mHP4jO/5CcY6m+bv8wjtYAIXjd10=;
 b=zhSlYDJKl3kVxWRkoFlcOY2tVDcy9XajN6ZQykEZYb7c+OHd2YFlSB8A2QkZyKwUPpCDnTXE+/u21rDhyCyp4WI0+EEyqIm2nD/sZBIh31xTytTSf8vDlu2bwpK9H10E9EDsmFFM7RpbfdpY7h80TQU8aCnfwNQHn6F/Q4R7ZC4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7424.eurprd08.prod.outlook.com (2603:10a6:10:36f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 16:19:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5813.008; Fri, 4 Nov 2022
 16:19:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "cp0613@linux.alibaba.com" <cp0613@linux.alibaba.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Thread-Topic: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Thread-Index: AQHY7/GErWj+qGuBUkub8wYtgs28da4u2ZgAgAAZA4A=
Date: Fri, 4 Nov 2022 16:19:54 +0000
Message-ID: <C79EF1D3-8140-4CC1-9692-8E6F42A84258@arm.com>
References: <cover.1667525891.git.cp0613@linux.alibaba.com>
 <F334F7CB-A181-4439-A050-47F8043125D8@arm.com>
In-Reply-To: <F334F7CB-A181-4439-A050-47F8043125D8@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7424:EE_|DBAEUR03FT036:EE_|AS1PR08MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 7870e84b-592f-4b95-fa08-08dabe806ea4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 h9lpH1CqFpFLYWT72+EQiSnInMnIdRdl2AvffP6kFeLdVgIEqhbidISL8rlqREq5an+u2NGCOuOyp/NCUMOLHaCQo01XomZAJ/d3CeH5Nt3siAcl6nc2IezG+Eq1fqkfJmCXTpOclygovqST6I5ezSHtVaNs8FbW8P09I7p1YLvTUrgTC9xqBcMBpwcnA/ftYqzhn2sMsCV4xjVbbGbcRX2du2z3pVF0kTCJ4jlrc1sNQXP7XPGgBedAS1uu1sHW1t6ISqkQRKMQHnmGib8bYMvqsJQn0wn5yl3Gsy+aDJ6E9+GYeDtPpF8iE/RLkhiJTeONydQFSpT12Q6x8lRs/LyR4ew8uxz2emo5Bu1d26CnaS7drttU82BGhmLpixCoAiaDAITHfHa0VEbDitGb4eqim2UGbeaxtLGmQ8Pw7qtATaihZXXCVCdtQfaexeehNl7uH/+d9/OI++tyDodyu0nsxRFnkBkq47SLslnZ8SQjVcb5M/xhqJADFqYIbB0N/InMgxkzghe21tCL+Jkl7l0kvLmnhAYWFExe6sdrD7e8ph0Qye651Xo9zc3+S+pwBrizF8XVlh7i6kGIPmgpj+g/KFFDy6IJwuGio16dfU/HbUVCxQxwqK9ZamNB+69lBEWThZ8XoYRU1dSIyB9L+PGsIRJ/wULNaCMM0RS0B8BBlejDKaPjWsA+6/cYcTjpu0GRv/SN2lmcm+cScWE2kwu04GUhqDm/5R2QFwvwIdKk7BylKIwL7ftt01j16lO3bEBrbqKaYzWgUG3HXur89bvL6ELMJ3xkgpB1ATKnkXQKvGU3G6EPOFP4hlAFOXwB
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(4744005)(41300700001)(66946007)(66446008)(66556008)(76116006)(316002)(6512007)(66476007)(64756008)(5660300002)(8676002)(4326008)(2906002)(8936002)(6506007)(26005)(71200400001)(478600001)(91956017)(6486002)(6916009)(2616005)(33656002)(186003)(36756003)(122000001)(86362001)(38100700002)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <123D06F238342C4DA4850D0C567F05A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7424
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	517fb40c-f4c1-4541-bcfd-08dabe8068b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GlIWnJPiamYLf6Nn6u2hBpZyi/Mm6nqCpkvJyC0RuREabmtOYfyI1kAECE8SPMnyPl5I480XWUDDHThmkB0rF6aBB+nMlZ+vb0NAESdM5xkER69OWPejW8cX5LGGtzo7nLwbDNoFwVSY99JFYioI3DHJ8lrs9DYsJkYxTCrWk/u02RFEEkCOIAv2IJlHhP++qryVLrE5DLzQu5UiVhYc0p/siOFxgQrAJmjAtjWoJjK5Mx8/+hh1d+MLrWfN23iziKaWk0DYGgiAAUytI+TneOSvU4ksVUIncxaCjHdE5nbzxwfn5IRvXpLAPc1LHzyW9++UhI4Ve1D/qP52k5nYLoMr/9WwJ89hWBsbLdBog4EmX9lG5j/uqT2PC4kOGo6OX/0CKPA5CrJ7Sa4BxtFmt0nXv+xqHWUxueyiyDDAGCBoJJ2Xto1JiR6ZB+07Sni5rMIRblsvWQHEC8eI22DLHYQ5jKUG9JzwB9ZdKC1YZ7JmMX40ieNclkmweOgUAuEsRDwi8Ef2TIsMm7RJ1W1QWSa37KrlNRcfX1PnbU2doql2A08Jy5Y1/+I4FE3EtdHbgBzuTpsQ0AOvS/0gtKfcJfIayIaG9LqZ+7NKjBhWl5LY67m2L3VoLPqLH5Dj2WqqWXhAvy+sultGn2EF3e+K73tRby1tG5yhTYpwCddcV+U7zh8iPoINU7ytO9HF8AnIOeoECRaDTJT1qOBleKN6mbruCwTThBbgOQQ0o7Ik93S3eCHF/RWE/weoDD6OtGqLHm08cOm99eUd2v2CPRM1nXyehvcZCwK5GC96pLTtGFA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(356005)(82310400005)(81166007)(86362001)(33656002)(40480700001)(41300700001)(40460700003)(6512007)(36756003)(70586007)(8676002)(4326008)(70206006)(336012)(4744005)(186003)(36860700001)(2616005)(8936002)(6862004)(6486002)(6506007)(478600001)(26005)(316002)(5660300002)(82740400003)(47076005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:20:04.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7870e84b-592f-4b95-fa08-08dabe806ea4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172722

K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLyR7U30vTElDRU5TRTttZDU9OTQxZWU5Y2QxNjA5
MzgyZjk0NjM1MjcxMmEzMTliNGLigJ0NCg0KUmVsYXRpdmUgcGF0aHMgYXJlIHJlbGF0aXZlIHRv
IFMsIHNvIHRoaXMgY2FuIGJlIGp1c3QgZmlsZTovL0xJQ0VOU0UuDQoNCisjIHRoZXJlIGlzIG5v
IHZhbGlkIGZpbGUgaW4gcHlwaSwgc28gZG93bmxvYWQgZnJvbSBnaXRodWINCitTUkNfVVJJID0g
Imh0dHA6Ly9jb2RlbG9hZC5naXRodWIuY29tL2dvb2dsZS9icm90bGkvdGFyLmd6L3Yke1BWfTtk
b3dubG9hZGZpbGVuYW1lPWJyb3RsaS0ke1BWfS50YXIuZ3rigJ0NCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZjllOGQ4MWQwNDA1YmE2NmQxODE1MjlhZjQyYTMzNTRmODM4YzkzOTA5NWZmOTk5MzBk
YTZhYTljZGY2ZmU0NiINCg0KVGhhdCBsb29rcyBsaWtlIGEgZHluYW1pY2FsbHkgZ2VuZXJhdGVk
IGdpdCBhcmNoaXZlLCB3aGljaCBtZWFucyB0aGUgY2hlY2tzdW0gd2lsbCBjaGFuZ2Ugb3ZlciB0
aW1lLg0KDQpJZiB0aGVyZSBpcyBubyBzdGF0aWMgdGFyYmFsbCwgdXNlIHRoZSBnaXQ6IGZldGNo
ZXIuDQoNClJvc3M=

