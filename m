Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7321C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 14:54:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web10.48837.1669388087807839619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 06:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wKeDIA6S;
 spf=pass (domain: arm.com, ip: 40.107.20.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grJ5HTAQQsrlck/Y6jiFm+522Eby5IzSH3unX/VlicA=;
 b=wKeDIA6S3sXWoW8WAWnOOHcRuoxSU5ApHz/pP23kRhE172Wn+32bB1rjy0KyW+l/hZksKHJhGsdTLXFZVFv3HfkbwEyCgtfxRRc3eTxxoy/Aq+J/qvfOsVjLCtaF55rtsugdSKyG02Wp/iS+UbKJq5tvpagMtUsxUUCk+2qd+3I=
Received: from AS8PR04CA0195.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::20)
 by DU0PR08MB8205.eurprd08.prod.outlook.com (2603:10a6:10:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 14:54:42 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::3c) by AS8PR04CA0195.outlook.office365.com
 (2603:10a6:20b:2f3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Fri, 25 Nov 2022 14:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.18 via Frontend Transport; Fri, 25 Nov 2022 14:54:42 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Fri, 25 Nov 2022 14:54:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3f05c70b4025b7e
X-CR-MTA-TID: 64aa7808
Received: from a6ce69bb7b60.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EF770744-C854-4BCC-BBEA-60E692059200.1;
	Fri, 25 Nov 2022 14:54:34 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6ce69bb7b60.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 25 Nov 2022 14:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nstrugB1wXz0ZotxDUpQDOovekjqUIsdbqgx56lG22+nPM/pcIh3HZ2y21j94eqhq7Ttg73Hcz55pRUMqdrjt2os/3u2aD7/GgyPE/bA7OzfL12AyMiWlGq9XruuSJVhPFgsVAyyhPUHKCJsRs4n4UCTgTc2QpaQE4ATj+tJJrrzkXHe340U9r9rZu9FlcoYanBz3pJ8jQV5DCQz7kusymjlkyDYjYYM6iNi+5Yo83N50ynDKH7Kuf8EiAVEPGMB7AYIlRw60hg3pETUbW3jD9Rgi7RGanZEKrUX4t3KyvsMRwcYSRbZITXeLTKDjdh1vQ5xuK0f3TYiSMFkXWPZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grJ5HTAQQsrlck/Y6jiFm+522Eby5IzSH3unX/VlicA=;
 b=UBYcMrYlvHakMhOdg3N08AmK7XUg952PLgJRWGg08WpuBfK9hvgeZWk0HUbj8iQr6dp+Tk0t04l1qJvoTVL9OrSEvfaJM5pU9MwE90/kPz4I0RbJwO/WZJbsd5B5ZGqAcPdc28MwSPC91BEcYtyPVO99qM20JofQRN8JcZaYW60NRfaWloKgY1Y0Wr3f3iAzErgPbuOKm2kidd1iGjDNZe4vK+Gb+CPgHhSSDoU1VIfEL/+xzfWrUJ5KxIMfcnGHoiUAF2r0qQOrL0+2yvvv6xpc89VApasGgnvZ5qRW6PnD5f+JKiSGmXPW3JJvGZTfyBR6+zKOMgQrFvooNV7t+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grJ5HTAQQsrlck/Y6jiFm+522Eby5IzSH3unX/VlicA=;
 b=wKeDIA6S3sXWoW8WAWnOOHcRuoxSU5ApHz/pP23kRhE172Wn+32bB1rjy0KyW+l/hZksKHJhGsdTLXFZVFv3HfkbwEyCgtfxRRc3eTxxoy/Aq+J/qvfOsVjLCtaF55rtsugdSKyG02Wp/iS+UbKJq5tvpagMtUsxUUCk+2qd+3I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8147.eurprd08.prod.outlook.com (2603:10a6:150:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 14:54:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.005; Fri, 25 Nov 2022
 14:54:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Zheng.Qiu@windriver.com" <Zheng.Qiu@windriver.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>,
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: Re: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Topic: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Index: AQHY/ojuPvgBbRqfVkChYjW+kVm6ta5PvoeA
Date: Fri, 25 Nov 2022 14:54:32 +0000
Message-ID: <33BDDCA9-7B36-48B1-AC53-E2E15B04CD77@arm.com>
References: <20221122153757.2287659-1-zheng.qiu@windriver.com>
In-Reply-To: <20221122153757.2287659-1-zheng.qiu@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8147:EE_|AM7EUR03FT042:EE_|DU0PR08MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 997f0e80-49a0-4984-ef5a-08dacef4fc21
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 su9Ibw34X6MffWNB/dnVzHDxEQ2v/yrURITJukpl9vPtDAiAeCSDmd/qP96nzMpQMPkxZTOJYN9Q4R7iw/Lk+Hhp1Gn28hA9q3r8OqaP8RE7WuiI1xHrBkzHBkiWvFwor0Elby78ixdv4OQ0i/73gMIeBZ6qDDOPbpQP+H4jbz2UfE2Y/cxUopV2LA6IQpiIv6Q5Uy/lppx32fcr/frB0/KXa69WvpKkg5osEL6jPmVVyPpoOCps4nEs/qeo642rSrqVpInzhjDNNWqGNhRQDe7+H+4pfCI00RQHdxaMQXMqNVZJ+N8nXvAT4gshYDv3gxvFpRzQ77DOMo6XWV2iNm5rDKbaW4Zyar/yKlfMVq4oKuFeFU5lrs1fQviTgovxg/tbN4gU3dOoPsCrYuqd9wiHRY6iAHLI2MmDylKkqX/iDtPHjr9/XjAEZmMwg7iOmD0YcF0Z10GiElW87yVbTtW59tAnlFxkhhdbHs+O99ASBSbrerLH13s8LNbBwmxHWlXvu1Z8jH6ar1YOwxHy+1R39hZyzd9eAuzxSdmtHC2SMMFLbVpi/+wW6T2kgjWJGrkjjJe+n0T/VnRUJF5Al0ferYwEWZQRIO+F/AGS4tCYatrx28mKnti3NeeHFJhcJCKpjpCaZ9gl1srealzIhpWxdyLmAmzlOvVpHhXOpoJOJJCLMyJ9NUSdWWeGqEHX5F52Ep4OnauKWGsZSJgnim5/uBzS5nzif4Eoly4+ej8oISgEV62srhd30ZfTzv8fRZPhn870/AEGxNk7+VjNI3mI0NsZ1GT5lJWlZOA8u1Q=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199015)(2906002)(66899015)(15650500001)(66946007)(76116006)(91956017)(33656002)(41300700001)(36756003)(83380400001)(64756008)(66476007)(66446008)(66556008)(54906003)(6916009)(316002)(8676002)(4326008)(8936002)(5660300002)(86362001)(478600001)(71200400001)(26005)(6506007)(6512007)(53546011)(38070700005)(38100700002)(186003)(2616005)(122000001)(6486002)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86523EEDA20F0C40B01304ED578B2366@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cefb1eeb-91d6-4b50-2108-08dacef4f607
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uj06Nd/GBH4/bwzvJnjML0PTFVKiiRWFUksm8e9GpcCR4bCkr24doynFhH3fAszgkz7ToIOTSGOB1kgz5+YcwjlE59rQlfssGcrD3I7jP/UJMWGytWSjVljqjpZrR268M2hjnU+mSiNnEtuW2hP/wyqkmHF9xj81YTCC06AGhfd88/w431/9eFGWLTUrwECyfW1gmPNuiZ+SY/GsOhOoOVDzUgYVy4D7op4kUwqGvsOVz7f5TDclUyc3crXNYX1GoxnLKzsDZQAe+yMHJ1ZbifS/64T7munwooj0Na8Y0DZypEMJvFf0TLqPhw1/8QF37hpVcsWRV+ZehCRDqA4vrwSZD0MLJzvfxUm53KyZ/Tfq1TsMi1zK7tbqmOA1D97lTZ3B77+G5Cyq3Y2/f02oDumwgiQZjzOQ/m7NdSZAbYQ4149WnZxhw+uWYvBIYUGY36rLY5Y/ObkLg5JgyDaYt9w9tc74ix9t/xX3uKY/cyJu1b5B7pluWENC9Ls+bbbv8CMMXL41GCMXZn+kpQ9D89ITDyLomOAJWt9thrOGRPiXo26sQ/nk5H61CxDzyYEXIjrhLzEI1jWP5YIr0U5WjGhNh/seI6WnQFLAsvdYOry+77TAzyHZgDjvGyCb60nfYd7nUfAhZGYUXzFmfrVTWpZrJBy/SGl5oHk5ujok7l7vrnKnqtT27Js1bBuXb/7RkM0sVe4j1gNNvrvxtDkJ25IqQL1DMHlWDuZc1eiPtHCOAoFX6qDr9nesw98glHzgUSwvtVOO+W4nOAjE4eKrtw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(36860700001)(2906002)(83380400001)(41300700001)(47076005)(15650500001)(2616005)(186003)(6862004)(8936002)(336012)(5660300002)(86362001)(33656002)(40480700001)(82310400005)(40460700003)(82740400003)(26005)(54906003)(316002)(6506007)(53546011)(6512007)(478600001)(6486002)(966005)(66899015)(107886003)(81166007)(356005)(70206006)(8676002)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 14:54:42.2989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997f0e80-49a0-4984-ef5a-08dacef4fc21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 14:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173768

bWFzdGVyIGhhcyBsaWJ0aWZmIDQuNC4wIHNvIHRoaXMgZG9lc27igJl0IGFwcGx5LiAgSXMgdGhl
IENWRSBzdGlsbCB2YWxpZCBpbiB0aGF0IHJlbGVhc2UsIG9yIGhhcyBpdCBiZWVuIGZpeGVkPw0K
DQpSb3NzDQoNCj4gT24gMjIgTm92IDIwMjIsIGF0IDE1OjM3LCBRaXUsIFpoZW5nIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxaaGVuZy5RaXU9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgcGF0Y2ggY29udGFpbnMgYSBmaXggZm9yIENW
RS0yMDIyLTM5NzANCj4gDQo+IFJlZmVyZW5jZToNCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVs
bi9kZXRhaWwvQ1ZFLTIwMjItMzk3MA0KPiBodHRwczovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFu
Lm9yZy90cmFja2VyL0NWRS0yMDIyLTM5NzANCj4gDQo+IFBhdGNoIGdlbmVyYXRlZCBmcm9tIDoN
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2xpYnRpZmYvbGlidGlmZi8tL2NvbW1pdC8yMjc1MDA4OTdk
ZmIwN2ZiN2QyN2Y3YWE1NzAwNTBlNjI2MTdlM2JlDQo+IA0KPiBVcHN0cmVhbS1TdGF0dXM6IEFj
Y2VwdGVkDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBRaXUgPHpoZW5nLnFpdUB3aW5kcml2
ZXIuY29tPg0KPiAtLS0NCj4gLi4uL2xpYnRpZmYvdGlmZi9DVkUtMjAyMi0zOTcwLnBhdGNoICAg
ICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKw0KPiBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9saWJ0aWZmL3RpZmZfNC4zLjAuYmIgfCAgMSArDQo+IDIgZmlsZXMgY2hhbmdlZCwgMzkgaW5z
ZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
bGlidGlmZi90aWZmL0NWRS0yMDIyLTM5NzAucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL3RpZmYvQ1ZFLTIwMjItMzk3MC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvdGlmZi9DVkUtMjAyMi0zOTcwLnBhdGNoDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmU4ZjE0MzkzM2ENCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL3Rp
ZmYvQ1ZFLTIwMjItMzk3MC5wYXRjaA0KPiBAQCAtMCwwICsxLDM4IEBADQo+ICtGcm9tIDIyNzUw
MDg5N2RmYjA3ZmI3ZDI3ZjdhYTU3MDA1MGU2MjYxN2UzYmUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxDQo+ICtGcm9tOiBFdmVuIFJvdWF1bHQgPGV2ZW4ucm91YXVsdEBzcGF0aWFseXMuY29tPg0K
PiArRGF0ZTogVHVlLCA4IE5vdiAyMDIyIDE1OjE2OjU4ICswMTAwDQo+ICtTdWJqZWN0OiBbUEFU
Q0hdIFRJRkZSZWFkUkdCQVRpbGVFeHQoKTogZml4ICh1bnNpZ25lZCkgaW50ZWdlciBvdmVyZmxv
dyBvbg0KPiArIHN0cmlwcy90aWxlcyA+IDIgR0INCj4gKw0KPiArRml4ZXMgaHR0cHM6Ly9idWdz
LmNocm9taXVtLm9yZy9wL29zcy1mdXp6L2lzc3Vlcy9kZXRhaWw/aWQ9NTMxMzcNCj4gKy0tLQ0K
PiArIGxpYnRpZmYvdGlmX2dldGltYWdlLmMgfCA4ICsrKystLS0tDQo+ICsgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBh
L2xpYnRpZmYvdGlmX2dldGltYWdlLmMgYi9saWJ0aWZmL3RpZl9nZXRpbWFnZS5jDQo+ICtpbmRl
eCBhNGQwYzFkNi4uNjBiOTRkOGUgMTAwNjQ0DQo+ICstLS0gYS9saWJ0aWZmL3RpZl9nZXRpbWFn
ZS5jDQo+ICsrKysgYi9saWJ0aWZmL3RpZl9nZXRpbWFnZS5jDQo+ICtAQCAtMzAxNiwxNSArMzAx
NiwxNSBAQCBUSUZGUmVhZFJHQkFUaWxlRXh0KFRJRkYqIHRpZiwgdWludDMyX3QgY29sLCB1aW50
MzJfdCByb3csIHVpbnQzMl90ICogcmFzdGVyLCBpbg0KPiArICAgICAgICAgcmV0dXJuKCBvayAp
Ow0KPiArIA0KPiArICAgICBmb3IoIGlfcm93ID0gMDsgaV9yb3cgPCByZWFkX3lzaXplOyBpX3Jv
dysrICkgew0KPiArLSAgICAgICAgbWVtbW92ZSggcmFzdGVyICsgKHRpbGVfeXNpemUgLSBpX3Jv
dyAtIDEpICogdGlsZV94c2l6ZSwNCj4gKy0gICAgICAgICAgICAgICAgIHJhc3RlciArIChyZWFk
X3lzaXplIC0gaV9yb3cgLSAxKSAqIHJlYWRfeHNpemUsDQo+ICsrICAgICAgICBtZW1tb3ZlKCBy
YXN0ZXIgKyAoc2l6ZV90KSh0aWxlX3lzaXplIC0gaV9yb3cgLSAxKSAqIHRpbGVfeHNpemUsDQo+
ICsrICAgICAgICAgICAgICAgICByYXN0ZXIgKyAoc2l6ZV90KShyZWFkX3lzaXplIC0gaV9yb3cg
LSAxKSAqIHJlYWRfeHNpemUsDQo+ICsgICAgICAgICAgICAgICAgICByZWFkX3hzaXplICogc2l6
ZW9mKHVpbnQzMl90KSApOw0KPiArLSAgICAgICAgX1RJRkZtZW1zZXQoIHJhc3RlciArICh0aWxl
X3lzaXplIC0gaV9yb3cgLSAxKSAqIHRpbGVfeHNpemUrcmVhZF94c2l6ZSwNCj4gKysgICAgICAg
IF9USUZGbWVtc2V0KCByYXN0ZXIgKyAoc2l6ZV90KSh0aWxlX3lzaXplIC0gaV9yb3cgLSAxKSAq
IHRpbGVfeHNpemUrcmVhZF94c2l6ZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAwLCBzaXpl
b2YodWludDMyX3QpICogKHRpbGVfeHNpemUgLSByZWFkX3hzaXplKSApOw0KPiArICAgICB9DQo+
ICsgDQo+ICsgICAgIGZvciggaV9yb3cgPSByZWFkX3lzaXplOyBpX3JvdyA8IHRpbGVfeXNpemU7
IGlfcm93KysgKSB7DQo+ICstICAgICAgICBfVElGRm1lbXNldCggcmFzdGVyICsgKHRpbGVfeXNp
emUgLSBpX3JvdyAtIDEpICogdGlsZV94c2l6ZSwNCj4gKysgICAgICAgIF9USUZGbWVtc2V0KCBy
YXN0ZXIgKyAoc2l6ZV90KSh0aWxlX3lzaXplIC0gaV9yb3cgLSAxKSAqIHRpbGVfeHNpemUsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgMCwgc2l6ZW9mKHVpbnQzMl90KSAqIHRpbGVfeHNpemUg
KTsNCj4gKyAgICAgfQ0KPiArIA0KPiArLS0gDQo+ICsyLjMzLjANCj4gKw0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMy4wLmJiIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMy4wLmJiDQo+IGluZGV4IGY4NDA1N2M0
NmIuLjBmYmU1MTVlOWQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xp
YnRpZmYvdGlmZl80LjMuMC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0
aWZmL3RpZmZfNC4zLjAuYmINCj4gQEAgLTI0LDYgKzI0LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8v
ZG93bmxvYWQub3NnZW8ub3JnL2xpYnRpZmYvdGlmZi0ke1BWfS50YXIuZ3ogXA0KPiAgICAgICAg
ICAgIGZpbGU6Ly9DVkUtMjAyMi0zNDUyNi5wYXRjaCBcDQo+ICAgICAgICAgICAgZmlsZTovL0NW
RS0yMDIyLTI4NjkucGF0Y2ggXA0KPiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0yODY3LnBh
dGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDIyLTM5NzAucGF0Y2ggXA0KPiAgICAg
ICAgICAgIGZpbGU6Ly9iMjU4ZWQ2OWE0ODVhOWNmYjI5OWQ5ZjA2MGViMmE0NmM1NGU1OTAzLnBh
dGNoIFwNCj4gICAgICAgICAgICAiDQo+IA0KPiAtLSANCj4gMi4zMy4wDQo+IA0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTczNjg2KTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzM2
ODYNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
OTUxOTc3NzcvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5j
b21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

