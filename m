Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F11AC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:20:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web12.20704.1666624810339440374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bbvq4V0p;
 spf=pass (domain: arm.com, ip: 40.107.21.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AiCDLPCovXJ4MbWdVlZBd2mgrn4kPSHiWs3kA5JRhW5jyWmxQ680T9n84s4M3zQ37ByQsicPhV3CY+NDmRnhx3Y45L47jtUXaUE96ZXU6b8/1cBics8EqiD+S1bwjwPdPIHFJSI3Wg964R4Wly+fvuSQYNITnTWGAfzBtJ4Jf9c3dNlrjRmq0n62QGPn8dRSSXsPnEPwxH8cQ2BQOyK1q3YRwCtCBb9MP3N5evRFuWmf47XcPKZfw0BosZCfqeGm5185UAodaWTbYEk9RbnZF/XuOYuF1fMxx0Pf0XWOa8jO0kNWCAhbu3ObJNsU+dX09EytuHHsdqOk0IFJnaVVLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pIpCQA7x+q+xUITzLejLNlBJu2HxK6FsRxFFNjGLWU=;
 b=gF9rSXc3Ekf6dOSGofMW96XpSYQIa5k07qsfULgFOBMsgOOpJqYxBIB20DLJjR518QAO6VISAMKHRNvyNQN8lMsMExMHxDUytoyRnvusk8imQ5mwKWGSk/fQ8wbCCLQLv6x09Rl78l5ysGbWvsJilH9J7qRzSgR91moqB8fJdSnTN8iDNtRzFjNAXuISJfzbqsd2aYL8+/wObaIqFfpAf4p3dIhKc9V9xbkBeQoN7+6+oFH+NCtuYNpmJOVSosslV+prBHH7NPZbvIFsh5Q0tlpxaq/Cy81S1rwwLUDAY9jWVfD11yq/8mD7yQs8FQI+SAZC5KXcLzthcWcG+pzw3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pIpCQA7x+q+xUITzLejLNlBJu2HxK6FsRxFFNjGLWU=;
 b=bbvq4V0p5+g67VIVtP1OrBBws2s0qncozdhzLwyZqcBiwT3CWI1IZXzO3Kdm4BAld1RrKhqeIDL+U4/TX0rTTleO/MmcEuzm7tE3jP9YpJoHwcgcb3llReijFJyf210OLnDipZtv55IjcedgW0i5Ma5SFaFY4Mx1DN3s7SZ/klc=
Received: from DUZPR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::10) by AS8PR08MB6712.eurprd08.prod.outlook.com
 (2603:10a6:20b:393::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 15:20:07 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::21) by DUZPR01CA0054.outlook.office365.com
 (2603:10a6:10:469::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Mon, 24 Oct 2022 15:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.19 via Frontend Transport; Mon, 24 Oct 2022 15:20:06 +0000
Received: ("Tessian outbound 6c699027a257:v130"); Mon, 24 Oct 2022 15:20:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed57062af9f46e4f
X-CR-MTA-TID: 64aa7808
Received: from f1492be30d84.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A20E0A51-E55A-4891-9572-33CA9F798110.1;
	Mon, 24 Oct 2022 15:20:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1492be30d84.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 24 Oct 2022 15:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ88YU2fmBFZ1FjauBtlQr+iNJulpFRflbEgBdZNFOwn/0wnHr3PDbfllMY/5et7bcnodCmMiz2ff2ONbAZuqPnmvuLPzKaRWGR1UcHNy6/Yl/X6yYJuIYBMkQ/ZVfiV3dyRTBWiU5zltaHOXPVjWRlOQUfS2jAqYJ4PWYXSBsjYnlD2rgD9h6I0WaQSELW6P3r+Og1ifmVJw7ggIJtzDGGMgFu2TVTB+Nh6/BELKCdpSfWLj6k8JgKQn57YfyUwN5LN8S2oe4zjG1e8mMd7O+oF2uKxBfJuqqLpzlhgF3QKgsimxTosqL9G6bbh66OVx22BxKmYrdaj+/d8DXZN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pIpCQA7x+q+xUITzLejLNlBJu2HxK6FsRxFFNjGLWU=;
 b=PRDLz5fqtvxoIt8DdKTAtrEKZo3L1BYktFSL8N0xqoenjiFFDyAoV9AgPjIIhh/5N/J9RS9jcUlnTgsaq3PdcAA03T3ZNtvDnvS+fBWysmWwGQnBbMcLt+V619IcA4Yy7zKczrHMs+98+4YfQDRGQjspk+Y0fCkkIdBH8BOA0v57OCvSe7+AX4PHAWxttEFghlRWdAifbBBI6S50aKuUR6Subrrs2AbXZFAjWnQd5yWfQZReiCZjk+5pb4Z1Uw0iOkacvDzAOvr54HsnXkaIFNOnTLtXW+tofHwzCcy9zPqFddvtDfIiDD5pUYHbWV/SNIiTTL+HqPSZ7xCpL3VA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pIpCQA7x+q+xUITzLejLNlBJu2HxK6FsRxFFNjGLWU=;
 b=bbvq4V0p5+g67VIVtP1OrBBws2s0qncozdhzLwyZqcBiwT3CWI1IZXzO3Kdm4BAld1RrKhqeIDL+U4/TX0rTTleO/MmcEuzm7tE3jP9YpJoHwcgcb3llReijFJyf210OLnDipZtv55IjcedgW0i5Ma5SFaFY4Mx1DN3s7SZ/klc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10303.eurprd08.prod.outlook.com (2603:10a6:10:491::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 15:19:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 15:19:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] kernel-yocto: improve fatal error messages
 of symbol_why.py
Thread-Topic: [OE-core] [PATCH v2] kernel-yocto: improve fatal error messages
 of symbol_why.py
Thread-Index: AQHY55x0CtQEa6qqkEWP8S5B2C8vSq4dqO2A
Date: Mon, 24 Oct 2022 15:19:58 +0000
Message-ID: <A56DD420-A07E-4586-B2C0-4C132C969410@arm.com>
References: <20221024113215.2116725-1-jose.quaresma@foundries.io>
In-Reply-To: <20221024113215.2116725-1-jose.quaresma@foundries.io>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10303:EE_|DBAEUR03FT037:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf94a3e-59f0-40ce-0c8e-08dab5d33b9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pU5nwSc7FaL6lhrKMpBqbJ8xjbJFVDFGkMYcuZGaKs3su0G/lxZgjeoGChtN7MCi83ebkysW/uxu4VGhOYEuGvhDlzLD2X9DYu74KAR6LKu/TIbzBjylT+5tVM+P47EBi/uElAEa58RuUEgc1/feIyax1gslLI1KA49KKm8ej7GGFlvcjtfF8oE4Wch+P6DfMCnzkE3Kcxd5+dbKrdLlJeEwPnnJZpX2nclNjLjauBftXlwu1MhWKCgJcqo0upN6CI1kUzCAj+HqEGHuRq6qzDjJ0xsP1UHNPc+10gC61QquSMuEs0qDK5YGjzLYGeunxd4VtziWkhPuXi6Fz3VQi7gLnjokcs/IxLlLsWylIqCRZYSXxwijz/0CmGnr52etD6UePcqNk6sN/zcCyu7DXIjl740a21D9rt0QwQBkXmfC94a2ImQJSat+DfIQXX23C7VoSTuf+R6kWEA60ED5QUCGVGn3MLTzmybNLvIpj3A8ZU7K4H+DWkSOJtXT3ykU3+hfZbTLy6xuO+P0MwOZjvqsQHXpeVlSueykCFMzw//vbikU/HvzX32fKDsPDTdOTYA98pB13RZuMFvz4b08iXUgLCBONxsDq3Js7pWxlvDRFKv4Y/OG4dfa9nnNV6n9qkpW1ajQdOR4KJdjbvdPK+5UfZUEnhmkNyHkoxT6RYkLr3Xgk9KVfc8dtLnwJ/nHTCFnSJsG+jXw5Va568pR9kl7faAL6YIyqVnqHrwum8sloiz5cPztgFWJS/viaDIUYpXyGmzRnf8/CAqCjzMtYpna8oNIy06Wod7XBuOCNno=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(33656002)(64756008)(4744005)(5660300002)(66556008)(36756003)(15650500001)(6916009)(2906002)(26005)(4326008)(66446008)(66476007)(8676002)(41300700001)(86362001)(6506007)(38070700005)(316002)(8936002)(66946007)(91956017)(76116006)(6512007)(53546011)(186003)(83380400001)(2616005)(71200400001)(122000001)(38100700002)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E43B7E1EA9A0548BDEECD64EBEC14A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10303
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	866dd176-6633-450e-f380-08dab5d336d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QPoLJiPWKGtWj0lS5tGPqV3YJai5lTJJKk5f55xV6Nj1CcWw0B3KK+yvbL/p38rmp3nfkF1wKRXLAymo4s1UOFUNNLuYKkcZALnps8bzH971w9Z4TUf2ltwEXTOkI4/7nzsqnbAfUG56lS/WAPO1Xd1oIBYT5WUZ/XrQz0CDRQNGks4Lf0f0Ogw7aWz+QBIQgvPRlEn/hqqAJgm6s02p0GyKKKKXxqKHvH2y+yWbulUWCg5x3L0x11zi/0Ss1xTXsT1/AkhWZUHAn48SpCwoH/S5AF62dCb0R+V58UHvz9SsCSGjPV1J32rTgx6ynHia/99LCz0/3s1TqT+2QvATQ+XC+2bNV0m4tb9+BPeLkBoiw5fPT/UZqg5ZOFe/+MjArm7FeXdLRs8rmmXbFjbPQyDKAwjY9Aq1YZ5Tku9nrZ4fbSDxN+mVWnEmK1G4Zc0EO9e16a/sJFAcMG4TjgU1lBdhfGM/EZSJVQZZKFvpFeq7UShQERDwn5PNITum9rkxxSAbVc7ZNlGC21HvUffZUCdb4HII+p69zwg4blJzW5tvxjJAJWO8q8Gx/bp4NpKYazXIGQm19Va+baRcCmjyWoLZ5DNiDJMhcp/ors07bGwqDE5VZDpYPzPRaapWjApQXdnMfqMRTMRVsjAS5upykBhx4GbQYhMqyNjbrfDzYz3Ex7O/inJkLGTXWSTMFL8iW27ITHXMRu9dTu1l2uNAUxkkwvsPVzASGFF0W4X4gTJ0M5rxuuH2mNzE8JZjWhZ+RPFlJtx5vFxtjPSQKDt2jA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(6486002)(47076005)(83380400001)(33656002)(86362001)(356005)(81166007)(5660300002)(36860700001)(4326008)(82310400005)(82740400003)(41300700001)(8936002)(6506007)(8676002)(26005)(4744005)(336012)(6862004)(70586007)(316002)(478600001)(40480700001)(6512007)(70206006)(2616005)(186003)(40460700003)(15650500001)(53546011)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 15:20:06.9024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf94a3e-59f0-40ce-0c8e-08dab5d33b9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172107

T24gMjQgT2N0IDIwMjIsIGF0IDEyOjMyLCBKb3NlIFF1YXJlc21hIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxxdWFyZXNtYS5qb3NlPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEltcHJvdmUgdGhlIGZhdGFsIGVycm9yIG1lc3NhZ2Ugb2YgdGhlIHlv
Y3RvLWtlcm5lbC10b29scyBzeW1ib2xfd2h5LnB5DQo+IGFuZCBzaG93cyB0aGUgY29tbWFuZCB0
aGF0IGdlbmVyYXRlIHRoZSBlcnJvciBhcyBpdCBjYW4gaGVscCB1bmRlcnN0YW5kDQo+IHRoZSBy
b290IGNhdXNlIG9mIHRoZSBlcnJvci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVz
bWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPg0KDQokIGdpdCBhbSAtcyB2Ml8yMDIyMTAy
NF9xdWFyZXNtYV9qb3NlX2tlcm5lbF95b2N0b19pbXByb3ZlX2ZhdGFsX2Vycm9yX21lc3NhZ2Vz
X29mX3N5bWJvbF93aHlfcHkubWJ4DQpBcHBseWluZzoga2VybmVsLXlvY3RvOiBpbXByb3ZlIGZh
dGFsIGVycm9yIG1lc3NhZ2VzIG9mIHN5bWJvbF93aHkucHkNCmVycm9yOiBtZXRhL2NsYXNzZXMv
a2VybmVsLXlvY3RvLmJiY2xhc3M6IGRvZXMgbm90IGV4aXN0IGluIGluZGV4DQoNCkNhbiB5b3Ug
cmViYXNlIHRoaXMgdG8gY3VycmVudCBtYXN0ZXI/IFRoYXQgZmlsZSBoYXNu4oCZdCBleGlzdGVk
IHNpbmNlIEF1Z3VzdC4NCg0KUm9zcw0KDQo=

