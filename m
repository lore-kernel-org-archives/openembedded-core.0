Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA24C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 13:04:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web10.18744.1678712693051865061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 06:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=K2DBlvkf;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWET7XRDZSOX/T4+hWRvueP9nYayh8hWOvlIFf2bSvo=;
 b=K2DBlvkf9gkt+2gJne/W5aNc1fIly/snUWjTUa7ltBe9e5WHNPQBw6OOFcjvyODUZW501+UzZxNVpvbxLr+H2veBCBY+jZJFbJ70EfTnRmgWSaQFon0kaEDuG1BSQO4t3sj+19LmXQJj0B3FXOYNvilg1RfDK2t/GGwJf5zcgE0=
Received: from FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::13)
 by PAVPR08MB9433.eurprd08.prod.outlook.com (2603:10a6:102:319::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:04:46 +0000
Received: from VI1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::18) by FR0P281CA0124.outlook.office365.com
 (2603:10a6:d10:97::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 13:04:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT018.mail.protection.outlook.com (100.127.144.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 13:04:41 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135"); Mon, 13 Mar 2023 13:04:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52e4118e8de37f9d
X-CR-MTA-TID: 64aa7808
Received: from c7aaa3cf9fd4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EEFE11B8-FC87-486E-BF5B-1901CFFF993E.1;
	Mon, 13 Mar 2023 13:04:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7aaa3cf9fd4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Mar 2023 13:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UixJuuYyjRdjowiPsjFlkVkWwDgc7Bdl7kCG1BYbp5mal8DvRS14KSMWERWMPjGOM8cyxeYE+e4h9075KMAm4ABRHm+o9t3CGu+ZAdQak2HtETgvztlKncfENGVai1ysjegse3BsAISWAX1GyLW79XO1ygugQilmQv7Lnm1Kf6sybXN6pTxQ/i1pXqujzEuMv0HGwSPENaMhPx0oyA9g58ozNwq8gAYMG04iTQ63wnFehKHv1MFELr7awxCq7VBiW0o1XprNW5E2dqVVGeGJ10wcE2unqNXZ1JpY191RJ/5zyDRSevn7SLidxM+VuqvdRuOKy3RX3Xx1VCIPeg9f4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWET7XRDZSOX/T4+hWRvueP9nYayh8hWOvlIFf2bSvo=;
 b=JcrjKJdCSL0PPR89YVmrSCFwf5gHUEgZw3J+deDxQEjB7YcxryuLD7IWne7wUJMMx37Q7H/4L5WBDAw2O5NorYpsLRkMkx1fuZhSM7YaBtpBMhpoLZywJl8SuwtyoqvQ6eNQ8f5I3I2ORB8d1YigC4dbQUJ9U9zWYYCBmcNQxIh/yjIW07xk8x6uD5T+Pg6pDqAAins6jjAUQv8q62TWjzfP82FCMbayiRvz+kwknJPgRpQrETzfAJqAxHkUp4UikW/rvAMM4r+FlXGhxsjb64v7jVSkfxTDhKppLadQs1Su7cZkyaoEt5y91QLAHLBqhj40ytB+eZsJ2DUhWj4iHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWET7XRDZSOX/T4+hWRvueP9nYayh8hWOvlIFf2bSvo=;
 b=K2DBlvkf9gkt+2gJne/W5aNc1fIly/snUWjTUa7ltBe9e5WHNPQBw6OOFcjvyODUZW501+UzZxNVpvbxLr+H2veBCBY+jZJFbJ70EfTnRmgWSaQFon0kaEDuG1BSQO4t3sj+19LmXQJj0B3FXOYNvilg1RfDK2t/GGwJf5zcgE0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10097.eurprd08.prod.outlook.com (2603:10a6:20b:63f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:04:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:04:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 12 Mar
 2023 02:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 12 Mar
 2023 02:00:01 AM HST
Thread-Index: AQHZVNq0CdTxbgDfq0+wKbKBnWZgTa74ru2A
Date: Mon, 13 Mar 2023 13:04:28 +0000
Message-ID: <B6811D50-79FA-4A3D-8144-D01C938F84CD@arm.com>
References: <20230312120333.C8B419603CF@nuc.router0800d9.com>
In-Reply-To: <20230312120333.C8B419603CF@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10097:EE_|VI1EUR03FT018:EE_|PAVPR08MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c120d66-fdb1-47ca-b364-08db23c38232
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WARISVopbne5zEy21qgS+TM0vL7ovV7TlVVfJczsx1DFNr3sJlbDEarWDOw7O3fPhV0l4+YLApvk1Hvpxe3ekDMmJ3SUeri1KJrPu1TPyrAVRJM0C7hOG6eiJzqdP2p5TeEWXwNuoxl8vuqrtlJg5szGr9+4/QpCK6fmgRMJItVy8DmQTQqczjLzvCXBDVXOR76SU7yMYehq3jUdfHFP7FU7NBMvItbM1nKl9mbGTfV07DefqkhwVS7MTIObMshFogCbynp5DWbbgUaq1g6/h8v8A1hKM5YNplTpwVc58HsNxpbm+QYgwcphFGeXj2nGsJpEdsux2Jz56ygL7uEcMuWPskLrwG31MlU7kyFffhQRuTNq9rElYAn/OtxxKeaCRN5Op8MbLWupMp5h7KpY1XZ5s0lCvNEgUn4Af5s3vxuAlw+OKl+EiCP3JaYaRc7VBJSj9NWAp9/sJKXd5syenI3FQpZKOHPeiqUGlYHnC4FlqjjLAgwFY80KQHq8XGzQ4V3TccdvDaoapYW6szKbD3zW+15zZmrkpg43MVZuHJVxkKOMxeSNIArpBms126cXpWOLipUDgsJ5GNsGP4NFbDiFLggsCVovTFGihrmDMIxGHZh4OqG3qiZFpYyRE0hwEcrctLvAOihzNS3VmGKxQQrOEP+2x0h5ruKd1cgXkCrIPs6djhHFXV6yq6nnqRoX0kibemegu1D3ITGzZ99Pgg2NXpM52aia9FaBWnuNTcg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(5660300002)(36756003)(83380400001)(186003)(478600001)(26005)(71200400001)(966005)(6486002)(6506007)(6512007)(2616005)(53546011)(38070700005)(91956017)(4326008)(6916009)(33656002)(66946007)(76116006)(8676002)(64756008)(66556008)(66476007)(66446008)(8936002)(41300700001)(86362001)(54906003)(316002)(38100700002)(122000001)(15650500001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B463F848AE7CD944BA50E74DDCE79AF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10097
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d2bc67f5-34cc-4df2-9e1a-08db23c37a6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Xryx5FmZDtgZfJbIB+kC+pfIQXfhMcyw/+hXQWaAufrOSO8pZnZTiZSfICEUD8F9DJYD5V96qTFUx0MykAC/myw7F4L3rp39nPxnmE2mRYuF16P+KPZ4c6Pl3bnkZqsz4xiHrYHGegNzC9eM4S2jZVr/oFuvkXjP5iJGdiV3yf/BU6TJrU2/f+TAqUB8bEM7jkMj1bqfQpVQMuzLoT1dw3InraFPETE7rjL3lYtOlhO+hf67RM6oVT6yr4xQHG1bkBPbR2lXdEnZhvhy1GBGepL9ExpRPR3zoRsbwGlxKfPfHlCY+axDrBPQ6mXC3+lIPWrIqtTUrw9zUS6eUW0LNbLZDiJ44qf/S5aynLahcdNXcSyRcn0zQrVOvqx9MJMykMqV+PL/8saHIti+xD+mZJSWHJO/0oQYBayXHqLSQFuMAOql/WHy0PJHPIJh0SMJ+3V1KBRmXsdWw0WKNS0k8wbbsdajsfHwwjEUxdsPKpuVGxZIv9KA4P8fqTFdLRxtZenFaU3cd11yMdWJB9tKSMdr6AQ4SJZT+Pq4cDl1emEUV06zY5NQnWGFbrKBdGi/YwrQkgvYncPV6WejgJIrekw4znDoayaUOAr4cZpaw3P8xnOrp6HMHLcTpjCkdYYcPDqvUQ7diRHD7kEc1KFntDcfzdhBatqD9J1T7K43CSak9i11C45FXUpNzERZOmb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(478600001)(40460700003)(83380400001)(47076005)(82310400005)(81166007)(2906002)(82740400003)(86362001)(15650500001)(8936002)(33656002)(6862004)(5660300002)(356005)(36756003)(4326008)(8676002)(70586007)(70206006)(36860700001)(54906003)(41300700001)(316002)(40480700001)(26005)(107886003)(186003)(2616005)(6512007)(6506007)(336012)(53546011)(6486002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:04:41.1919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c120d66-fdb1-47ca-b364-08db23c38232
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 13:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178449

T24gMTIgTWFyIDIwMjMsIGF0IDEyOjAzLCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gRnVsbCBsaXN0OiAgRm91bmQgNyB1bnBhdGNoZWQgQ1ZFcw0KPiBDVkUtMjAwNS0xNzk2
IChDVlNTMzogTi9BKTogbmN1cnNlczpuY3Vyc2VzLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlz
dC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMDUtMTc5NiAqDQoNCk5vdCBhIG5j
dXJzZXMgYnVnLCBJ4oCZdmUgYXNrZWQgTklTVCB0byB1cGRhdGUgdGhlIENQRS4NCg0KPiBDVkUt
MjAyMi0zMjE5IChDVlNTMzogNS41IE1FRElVTSk6IGdudXBnOmdudXBnLW5hdGl2ZSBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMzIxOSAq
DQo+IENWRS0yMDIyLTQwNTUgKENWU1MzOiA3LjQgSElHSCk6IHhkZy11dGlscyBodHRwczovL3dl
Yi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItNDA1NSAqDQo+
IENWRS0yMDIyLTQ2NDU2IChDVlNTMzogNi4xIE1FRElVTSk6IG5hc206bmFzbS1uYXRpdmUgaHR0
cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTQ2
NDU2ICoNCg0KVGhlc2UgYXJlIHN0aWxsIG9wZW4gdXBzdHJlYW0uDQoNCj4gQ1ZFLTIwMjMtMTEy
NyAoQ1ZTUzM6IDcuOCBISUdIKTogdmltIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1
bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy0xMTI3ICoNCj4gQ1ZFLTIwMjMtMTE3MCAoQ1ZTUzM6
IDcuOCBISUdIKTogdmltIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyMy0xMTcwICoNCj4gQ1ZFLTIwMjMtMTE3NSAoQ1ZTUzM6IDcuMyBISUdI
KTogdmltIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAyMy0xMTc1ICoNCg0KUGF0Y2ggaW5jb21pbmcgZm9yIHRoZSBwb2ludCB1cGRhdGUuDQoN
ClJvc3M=

