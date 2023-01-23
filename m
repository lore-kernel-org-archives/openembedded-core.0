Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80120C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 12:40:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web10.40906.1674477631401549157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 04:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=L6zW4Sgc;
 spf=pass (domain: arm.com, ip: 40.107.20.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SReMmL+UI507BotwZ+6khCuvzJWuSNTgE4ta/gFeAyo=;
 b=L6zW4SgcOEzPRzBMxHOMA2u5VC8O1e4tXOHPGSkWxNFdcSVDECWmBviW3wfYhj1vGkpBV/qAMh2wTuxZ0J78TfnIX2AwyX68HHlEiE8hIata54BKFtJ3ZGaPEdmClpHJy4Gaor6hIydnlAb+27i5Gw4M0MzpncgZE17Q3uKcZpM=
Received: from AS9PR06CA0680.eurprd06.prod.outlook.com (2603:10a6:20b:49c::24)
 by AS2PR08MB10179.eurprd08.prod.outlook.com (2603:10a6:20b:62e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:40:18 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::ba) by AS9PR06CA0680.outlook.office365.com
 (2603:10a6:20b:49c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:40:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:40:17 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Mon, 23 Jan 2023 12:40:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70e84d9c357186c5
X-CR-MTA-TID: 64aa7808
Received: from 316b5e587302.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3AA50B52-FA04-4F41-9B27-F437F966E227.1;
	Mon, 23 Jan 2023 12:40:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 316b5e587302.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Jan 2023 12:40:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfJemM+deFPqC2P/DGQDdRdyVvdMtNfrFRPHpzJQPJRbzc8aJVh4mD7nKb0kK3cHd3566IwM5NWguc1ZNTtIJvsIiO6578uvFhSL7fQzktGzcGKw7Om5vUuLsaUuejbt6/OYC58nJHkxbkjJDiimrV4wfv9GoI8yrNZfNXCq+moZxDXJ031YQjXP4q1PeFEVP0O9rymv4fkFmJQdjX8FQQrEP/2kC+YMfHEhaT6O5xAKrbCOORw3Jo0SVuzADUtRh5i4CJqpJlB3f4zUFWfp6XalTHk1CYe4gB8t23Gnnd7t5eHeDgyAIjgQHK+1+XeNKYTLR3EU/EpI6qRRBC/Hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SReMmL+UI507BotwZ+6khCuvzJWuSNTgE4ta/gFeAyo=;
 b=WwrDKtWbL0ka5CKDiHePl0jnjKoEu1rZL5FpZLMT2nS9SOZSmLGH4KSwSdYHGWml89AxlQbqwNTHbDr5QJS9qy4Kvv6DEpPLJexKjySlCLL6UzD6fvVNq4Tvl/nPDBFFWZDejOXjK8Sg96vp7w1/KBTtIlmsdaEzu2MgwOjLDF2NOzHaKS+RFoGElrQxq6sWztkbDEcRwBHOHYg1EIv6mjz+eZW6saP3FVGgU9ROBzKrf/92DTqb9m89AfVDgkmCbBpc7uty5IeM3GmCgtnfnpffJyRJ3hYxeqbsSjllVem6/OqDvC5+GbkUD6t9378mZIHvzmeYFM13qP+L6INKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SReMmL+UI507BotwZ+6khCuvzJWuSNTgE4ta/gFeAyo=;
 b=L6zW4SgcOEzPRzBMxHOMA2u5VC8O1e4tXOHPGSkWxNFdcSVDECWmBviW3wfYhj1vGkpBV/qAMh2wTuxZ0J78TfnIX2AwyX68HHlEiE8hIata54BKFtJ3ZGaPEdmClpHJy4Gaor6hIydnlAb+27i5Gw4M0MzpncgZE17Q3uKcZpM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:40:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:40:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 22 Jan 2023
 02:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 22 Jan 2023
 02:00:01 AM HST
Thread-Index: AQHZLlm7q63XVIZ6802lIPUPSnx4ra6r8uQA
Date: Mon, 23 Jan 2023 12:40:07 +0000
Message-ID: <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
In-Reply-To: <20230122120427.D9CF696035B@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5525:EE_|AM7EUR03FT053:EE_|AS2PR08MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4fa28b-9df4-4054-c039-08dafd3efbc4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6VwgazE6t/xph2pqoYUM5+n9SEKRQ32ePUFy3sRm+i898JeYJ5xN4h97GkFFdCu1eRJ4JxT1xqujt1xkfMYZxGKXDRqXzB3TQklIoAAGixEg8wdaYmodIsTKhf2jrViNOV9EloE6241LKYGsghBqXlqxNHntg1rF40zht+qhFM7TqDav3WHok1QADEjH5R16OYOHzaghVvfc60JYAt5Hm3Op20dJi7DTaIhy8jkQvdU6/smSZ4SLV94aLgOFJDy/yIeCnsTYIBPNPdk1x6RtCdpZnehInd1kuEoH+AXBYw0IOuCJN1ejyZv0ObPKu/etrr0TqkrXuqzHcY0p6T4HIxTfYS2D9dQyLM49RZhXVEWQOGLcIG8pEz0QvrFrIN08bsBE+ci9R0LSg1bHK9qXjrgnp/2GRN10hyQALh9J+4S3+fjYPaMmwpk9VYZZmKbrjxgUOHIMLgwmTYqIOgdHRhGuQ7oxozYPrcvdiFJkx3uiSbr+wx7s1/VXpZf2TVBBUnIanXSmS3G0IAPIsdELIuBnRxoYIfK81WFeitQnTUCLG69FC8GB5Eq5jkeMeuxXN3TXsD288zKr7tAKSDf/occP0abJPU3LxPqDbxKnjFSIQkiVcR6FhtSBYqbf/seaqCJ9tRbX2oviECoW54LnE+HLcPXq9nsGnaTD5wZPELqSFcQvSLMOGjOI45468dJ+RwjsDwgpcaczyWkdVudNmhSin9kuvaKYIxfXWWzoy+8pmOfMlz/SMa1x9yRc9bVa
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(122000001)(91956017)(33656002)(38100700002)(36756003)(86362001)(38070700005)(5660300002)(8936002)(2906002)(66556008)(76116006)(66946007)(4326008)(66446008)(64756008)(8676002)(6916009)(66476007)(41300700001)(2616005)(83380400001)(71200400001)(54906003)(6486002)(966005)(186003)(6512007)(6506007)(26005)(478600001)(316002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC7BA0191CAAAA4B833E3407E456000A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b70ce29-f3e1-4cfa-ca85-08dafd3ef5ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	avicctPF42/1eKLvt6Z+DwxNxD4XPYOVPJOpmANQt8b4P4dLAoZXHIv2Vz9awBD3icdTi3oH1TgCWvkNXPbMqg7B7lgAc67pbHulTWX3UwYo0OimvyAkQnu3Z/FlvL4Y5psh29Q6yeoISnUFL+XB9NSEgHFeqv/41KmcRDdkt0SMJnDLw6rBJDvQyX9xmxmoSxDZHjLi+8EUcJtisAijukB8Rp/wdlQ8TbQs46Ac645UOxyJeuJfaXozsavpLZUkuzvH0cxSQZSbuiiOSOPDWcjKmQ2E7BXKgeXWZ4lWM8jgohiTgb28QcsBecoYT+rn6KuMp2bDt8n/FTrmax2GW1Rune2rx3IhGX5W5qZz4ZiotD8Q0CfzCy0vzRnF4jcCtuLZLWPEIVo9L+SDjJkyPsIHw0cGj0hcQMT7XmyNQ6vO4WcuHRjOgiZMzH1GJSoBPMdeJhYOk7OOodUtS7wlnHBszXrwnHyMPThAuRJKol8UHeTpv1s0by/+dW+cAIJ6c26I3RtK+ybHBwdm1Ys+2pH2qp/ljsbasKJLka2TIS+brf/PBjLhFlwTvvOMTEyQpkAgMAPYRImStxunh3iOr/tckbH3I0zQcyxPMgrBo0DelI3B2banaZPzxtktbUVz3B7nlRM+jg4zdUitGMq4zVNtIXEvfKQYUdrM9iJtm1Nkj9aR/1f3i5XbaJnvWqIq8qEehoV67fwbQ7vJZDUr0QEl2VRJjqolsOHrEEFGx00=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(107886003)(6486002)(966005)(40460700003)(86362001)(33656002)(356005)(81166007)(83380400001)(336012)(478600001)(6506007)(5660300002)(26005)(6512007)(53546011)(2616005)(186003)(40480700001)(54906003)(316002)(6862004)(8676002)(70206006)(70586007)(8936002)(41300700001)(4326008)(82740400003)(47076005)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:40:17.9652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4fa28b-9df4-4054-c039-08dafd3efbc4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 12:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176301

T24gMjIgSmFuIDIwMjMsIGF0IDEyOjA0LCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gQ1ZFLTIwMjItMzU1MCAoQ1ZTUzM6IDguOCBISUdIKTogeHNlcnZlci14b3JnIGh0dHBz
Oi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0zNTUw
ICoNCj4gQ1ZFLTIwMjItMzU1MSAoQ1ZTUzM6IDYuNSBNRURJVU0pOiB4c2VydmVyLXhvcmcgaHR0
cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTM1
NTEgKg0KDQpUaGVzZSBhcmUgZml4ZWQgaW4geHNlcnZlci1vcmcgMjEuMS42LCBJ4oCZdmUgbWFp
bGVkIHRvIGdldCB0aGUgQ1BFIHVwZGF0ZWQuDQoNCj4gQ1ZFLTIwMjItMzk5NiAoQ1ZTUzM6IDcu
NSBISUdIKTogb3BlbnNzbDpvcGVuc3NsLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yv
dmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMzk5NiAqDQoNCk1vbnRhdmlzdGEgc2Vu
dCBhIHBhdGNoIGZvciBraXJrc3RvbmUsIEnigJl2ZSBhc2tlZCB0aGF0IHRoZXkgcG9zdCBpdCBm
b3IgbWFzdGVyL2xhbmdkYWxlIHRvby4NCg0KPiBDVkUtMjAyMi00MDU1IChDVlNTMzogNy40IEhJ
R0gpOiB4ZGctdXRpbHMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIyLTQwNTUgKg0KDQp4ZGctZW1haWwgaXMgYSBtZXNzLiAgV2F0Y2hpbmcg
dGhlIHRpY2tldC4NCg0KPiBDVkUtMjAyMi00NjAzIChDVlNTMzogOC44IEhJR0gpOiBwcHAgaHR0
cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTQ2
MDMgKg0KDQpEdWJpb3VzIENWRSwgYnV0IHBhdGNoIGluY29taW5nLg0KDQo+IENWRS0yMDIyLTQ2
NDU2IChDVlNTMzogNi4xIE1FRElVTSk6IG5hc206bmFzbS1uYXRpdmUgaHR0cHM6Ly93ZWIubnZk
Lm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTQ2NDU2ICoNCg0KU3Rp
bGwgb3BlbiB1cHN0cmVhbS4NCg0KPiBDVkUtMjAyMi00NjQ1NyAoQ1ZTUzM6IDUuNSBNRURJVU0p
OiBuYXNtOm5hc20tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAyMi00NjQ1NyAqDQoNCkZpeGVkIGluIDIuMTYuMDEsIG1haWxlZCB0
byBnZXQgdGhlIENQRSB1cGRhdGVkLg0KDQpSb3Nz

