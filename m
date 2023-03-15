Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A879C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 16:52:44 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.77])
 by mx.groups.io with SMTP id smtpd.web11.1497.1678899158446629136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 09:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=x60M3B6S;
 spf=pass (domain: arm.com, ip: 40.107.249.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WRs4nZ3kC/PqV9gmPsB/eWdOL9JBJf/EeMEqydr/LY=;
 b=x60M3B6SDtsUgf7SAMY7dAX9i7xSfivjEu3hIwfiRiuAQ9NSoCe4+fzLnjBhDu7tmiWEzgc7LpJLGiei9gHZt978itVb+CdfPLOO6eFuQ/VJCC6j/UuZi3qs+dKf4pw2tG3mJ+GaAwz/Wb/nTntPY+klbLVMMsp7UQWPiSRogGY=
Received: from AM7PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:20b:100::32)
 by AS8PR08MB8735.eurprd08.prod.outlook.com (2603:10a6:20b:563::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 16:52:29 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::3) by AM7PR02CA0022.outlook.office365.com
 (2603:10a6:20b:100::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 16:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.16 via Frontend Transport; Wed, 15 Mar 2023 16:52:28 +0000
Received: ("Tessian outbound 0df938784972:v135"); Wed, 15 Mar 2023 16:52:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e5b677ed4e6b5f0e
X-CR-MTA-TID: 64aa7808
Received: from 89d422aed258.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7EDD7D9A-F43A-4547-BDD5-B214D54315EA.1;
	Wed, 15 Mar 2023 16:52:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89d422aed258.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Mar 2023 16:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkNf7q09zWVO9BLkz9JIbyYrFMtLLbA6hLRkTyqsVPB9wdojaZQdk+Q4nb89lZt14RraYpfQ56V5tUSBMaGJ1En+qcXeZshO5xgfXnOlXHoL+wgC0TtJqhgDHu7d1s7c1+NHmSuJm4iHgQSb+6ep4lrBRcbta+1R2lVUABHNtAM0HqwrwdrEMY9ZQV3twPuSk/m7XoBbSPoCVBvvhohHpJ3HBWz9uMcIF5G+qG8qLn+dRdUqp0LqiogbdiVCeaSAsQWBPYIjg4MdMiqgB4TOvFnw5BgyH/bxcBlu6H4ccEXJSUrKzOc/sLF0YmDaevbCN2OMhBdQrO82SmvhdumxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WRs4nZ3kC/PqV9gmPsB/eWdOL9JBJf/EeMEqydr/LY=;
 b=aL/74qxgS56ia2EAAuLb0HMEn2PClVni9Y3+R4YEXbOWpSQdZoy0ViMR5dIVPcpyTl8wCsXmaXyrXMQQeSJkDssmQhgDAvLaYUhHEcCSHDw+FKa2nFeQ1Hyt2twBNv+58FbJe9y64Kd/sc7eLq9yBUl6bs9MkNPFHoyQ4lrf8Vd4cPsX4hhklNh1g7yK7tddLDTJmVpziBgsn2CqpXmFJh+JQ4zI24PF5tBHwqHvHAayKeVmq7Y1PTZQe0jDevq33FjZIRtxNBwvI1KQPowR49DKVCr3PLBpsWrRBxfYUcZ/Uqf9Ws9QqO5oUONaqV6gkHCZVMuXvO/XvymRujWHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WRs4nZ3kC/PqV9gmPsB/eWdOL9JBJf/EeMEqydr/LY=;
 b=x60M3B6SDtsUgf7SAMY7dAX9i7xSfivjEu3hIwfiRiuAQ9NSoCe4+fzLnjBhDu7tmiWEzgc7LpJLGiei9gHZt978itVb+CdfPLOO6eFuQ/VJCC6j/UuZi3qs+dKf4pw2tG3mJ+GaAwz/Wb/nTntPY+klbLVMMsp7UQWPiSRogGY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8366.eurprd08.prod.outlook.com (2603:10a6:150:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 16:52:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 16:52:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
Thread-Topic: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
Thread-Index: AQHZVxRA1wVLCO6VakqtafWlq1ahwq78Ds2A
Date: Wed, 15 Mar 2023 16:52:17 +0000
Message-ID: <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
References: <20230315080020.2648416-1-zboszor@gmail.com>
In-Reply-To: <20230315080020.2648416-1-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8366:EE_|AM7EUR03FT035:EE_|AS8PR08MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: b830ef97-1076-4c90-64e8-08db2575a946
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AEx4HJaeMv66gJ1llJS86KgOATzKtPCLaV2M9/ZflE9MeuLvYF9dPh114pOKLnFcsDOp2natJuSAjfOEAuf3eZGbAgDkf6jiSWhpFtorWoUkvOoPRiNh/+NZ4DL4jbd/Q7/AWxpUdv+tyCr2Hb2Gi8Xd0IHZQ089M5fEPograVMpMbraNrMoHXhStOh5s1NUKkT32dJ1fvDsWcMjbpxhxEetC1DfG4mqk6NPrYPFIXbaQK6Gx9QE2NHklIIBlH3+t+quTHPgAy/rU3Wiz3ub9pac/XC7p1AFb74Njq2aMElCpUQouiAT0ioyJW1KrlnIVRwWNeqLC7V+oIk17MTp2nRa+/neZOuTr1Yp2X/AWfUfht2sqD2oMLBnrlOEnjd4+/PI/B7oIhuI70hd7Ccdgg7KfDY3BzBz4OecshiFvG4SSW7VMEYtrmJwWcOM3of3C6Q1WqIjslBJJePnKX4ODNFGtVFVWs5c6qlewMZtatlSZANvY1dToVNiTKt1j5NesbTlptNgBWav1/+UZoOSmYHCdfNQgL7C1nWO+qLjO5N3SNjUV40nbHdLN3EUAz8pe/rRkGkIARnZ111PgkR9cEcECYeWeyXH2DGDF7qESPpDFfRnkArIuYV4m1fnHKG+y+uGgmXM6cO3uT6FdhEI8m+niassePr6A9dRYUsxb+OC8qjThIni5iEZvv8ksX8OUoFjVgA4mVRSjjcXYTjDLB1d0WB6Eqfyz7OnHWntsK8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199018)(316002)(478600001)(186003)(122000001)(53546011)(83380400001)(6512007)(26005)(6506007)(33656002)(38100700002)(2616005)(86362001)(38070700005)(36756003)(71200400001)(6486002)(64756008)(8936002)(66476007)(66556008)(66946007)(66446008)(8676002)(4326008)(6916009)(76116006)(2906002)(41300700001)(91956017)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5F108746A9DD64DB14DBE805472560D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8366
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	45930694-5440-41fc-b421-08db2575a32b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f8k+ekAzcjlqPg/yftXkMrXXrelvCw2dhhYLnbYmF6gtCOoD86UmAKFc4wunR3eiEGnCfiLYuzJqzwa8wYPvDwT+f3Hnw8P07rfRSlKEIMT8Vv+Y46v3NxaG1Hclv4T6sLSdnN7CVb8kT/MtvJMFqFe3EQ+mF+DqKccy5NV8AH17BefftlgsT42atzfxx85VmBNo3b1n4GRl4ecLWHpuu6cnf3TEcG80i5d3S+TAekvpxqI38pEvwQ2wWT3gl1BzzN0CX0n2ZE+OsazSLNPnRZXgQTCMIqBJm+f1Q3H9Riw+Tcojy/Lk2bDRJd8AIR2fELv8tf40nGkN2vmUEmf+fntjARo9G4LR5LdcyWB4wa6KJFgZCJIufcaUj04QEbnWDuidmoj4ttKPZERMRj7Nm32tDa8mrmHVoW5qQuOceFow+m0eOZkH+MF+d02Ae1MynXEswnuhbQZGBhikm86Sa6UA36JgomHPy+PrRB8GgHGZXG96BBfK9qdtbNrKWVpU0CTeUhs4sWpM0WlePTNTEHiLDJtL90+prxjCrQUvJceOAh1GUdfPRGcnWukwXZra+mxK++sIJ7TBCYzJFJCX+Sil709LzF96jCj8iHUKK8aRChdAQ2WqLIWkm31OFmgpl27MCkvGKLkHap7ffl8ZKTnEr0wCgpywbbM5sokACoGW49KDAGc6AeSj+7lZrcT9t6ZHQKXClolQyx4tp9sRgw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(33656002)(86362001)(356005)(36756003)(36860700001)(82740400003)(81166007)(41300700001)(2906002)(6862004)(8936002)(5660300002)(40460700003)(47076005)(82310400005)(4326008)(40480700001)(83380400001)(26005)(2616005)(53546011)(6506007)(6512007)(336012)(186003)(316002)(70586007)(6486002)(8676002)(70206006)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 16:52:28.3640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b830ef97-1076-4c90-64e8-08db2575a946
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8735
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 16:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178651

T24gMTUgTWFyIDIwMjMsIGF0IDA4OjAwLCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9tZXNvbi5iYmNsYXNz
IGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9tZXNvbi5iYmNsYXNzDQo+IGluZGV4IDQ4Njg4YmVkNzUu
LmYxMjczYWExYzAgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvbWVzb24uYmJj
bGFzcw0KPiArKysgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL21lc29uLmJiY2xhc3MNCj4gQEAgLTQs
MTQxICs0LDcgQEANCj4gIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICMNCj4gDQo+
IC1pbmhlcml0IHB5dGhvbjNuYXRpdmUgbWVzb24tcm91dGluZXMgcWVtdQ0KPiAtDQo+IC1ERVBF
TkRTOmFwcGVuZCA9ICIgbWVzb24tbmF0aXZlIG5pbmphLW5hdGl2ZSINCj4gLQ0KPiAtRVhFV1JB
UFBFUl9FTkFCTEVEOmNsYXNzLW5hdGl2ZSA9ICJGYWxzZSINCj4gLUVYRVdSQVBQRVJfRU5BQkxF
RDpjbGFzcy1uYXRpdmVzZGsgPSAiRmFsc2UiDQo+IC1FWEVXUkFQUEVSX0VOQUJMRUQgPz0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdNQUNISU5FX0ZFQVRVUkVTJywgJ3FlbXUtdXNlcm1vZGUnLCAn
VHJ1ZScsICdGYWxzZScsIGQpfSINCj4gLURFUEVORFM6YXBwZW5kID0gIiR7QCcgcWVtdS1uYXRp
dmUnIGlmIGQuZ2V0VmFyKCdFWEVXUkFQUEVSX0VOQUJMRUQnKSA9PSAnVHJ1ZScgZWxzZSAnJ30i
DQo+IC0NCj4gLSMgQXMgTWVzb24gZW5mb3JjZXMgb3V0LW9mLXRyZWUgYnVpbGRzIHdlIGNhbiBq
dXN0IHVzZSBjbGVhbmRpcnMNCj4gLUIgPSAiJHtXT1JLRElSfS9idWlsZCINCj4gLWRvX2NvbmZp
Z3VyZVtjbGVhbmRpcnNdID0gIiR7Qn0iDQo+IC0NCj4gLSMgV2hlcmUgdGhlIG1lc29uLmJ1aWxk
IGJ1aWxkIGNvbmZpZ3VyYXRpb24gaXMNCj4gLU1FU09OX1NPVVJDRVBBVEggPSAiJHtTfSINCj4g
LQ0KPiAtZGVmIG5vcHJlZml4KHZhciwgZCk6DQo+IC0gICAgcmV0dXJuIGQuZ2V0VmFyKHZhciku
cmVwbGFjZShkLmdldFZhcigncHJlZml4JykgKyAnLycsICcnLCAxKQ0KPiAtDQo+IC1NRVNPTl9C
VUlMRFRZUEUgPz0gIiR7QG9lLnV0aWxzLnZhcnRydWUoJ0RFQlVHX0JVSUxEJywgJ2RlYnVnJywg
J3BsYWluJywgZCl9Ig0KPiAtTUVTT05fQlVJTERUWVBFW3ZhcmRlcHNdICs9ICJERUJVR19CVUlM
RCINCj4gLU1FU09OT1BUUyA9ICIgLS1wcmVmaXggJHtwcmVmaXh9IFwNCj4gLSAgICAgICAgICAg
ICAgLS1idWlsZHR5cGUgJHtNRVNPTl9CVUlMRFRZUEV9IFwNCj4gLSAgICAgICAgICAgICAgLS1i
aW5kaXIgJHtAbm9wcmVmaXgoJ2JpbmRpcicsIGQpfSBcDQo+IC0gICAgICAgICAgICAgIC0tc2Jp
bmRpciAke0Bub3ByZWZpeCgnc2JpbmRpcicsIGQpfSBcDQo+IC0gICAgICAgICAgICAgIC0tZGF0
YWRpciAke0Bub3ByZWZpeCgnZGF0YWRpcicsIGQpfSBcDQo+IC0gICAgICAgICAgICAgIC0tbGli
ZGlyICR7QG5vcHJlZml4KCdsaWJkaXInLCBkKX0gXA0KPiAtICAgICAgICAgICAgICAtLWxpYmV4
ZWNkaXIgJHtAbm9wcmVmaXgoJ2xpYmV4ZWNkaXInLCBkKX0gXA0KPiAtICAgICAgICAgICAgICAt
LWluY2x1ZGVkaXIgJHtAbm9wcmVmaXgoJ2luY2x1ZGVkaXInLCBkKX0gXA0KPiAtICAgICAgICAg
ICAgICAtLW1hbmRpciAke0Bub3ByZWZpeCgnbWFuZGlyJywgZCl9IFwNCj4gLSAgICAgICAgICAg
ICAgLS1pbmZvZGlyICR7QG5vcHJlZml4KCdpbmZvZGlyJywgZCl9IFwNCj4gLSAgICAgICAgICAg
ICAgLS1zeXNjb25mZGlyICR7c3lzY29uZmRpcn0gXA0KPiAtICAgICAgICAgICAgICAtLWxvY2Fs
c3RhdGVkaXIgJHtsb2NhbHN0YXRlZGlyfSBcDQo+IC0gICAgICAgICAgICAgIC0tc2hhcmVkc3Rh
dGVkaXIgJHtzaGFyZWRzdGF0ZWRpcn0gXA0KPiAtICAgICAgICAgICAgICAtLXdyYXAtbW9kZSBu
b2Rvd25sb2FkIFwNCj4gLSAgICAgICAgICAgICAgLS1uYXRpdmUtZmlsZSAke1dPUktESVJ9L21l
c29uLm5hdGl2ZSINCj4gLQ0KPiAtRVhUUkFfT0VNRVNPTjphcHBlbmQgPSAiICR7UEFDS0FHRUNP
TkZJR19DT05GQVJHU30iDQo+IC0NCj4gLU1FU09OX0NST1NTX0ZJTEUgPSAiIg0KPiAtTUVTT05f
Q1JPU1NfRklMRTpjbGFzcy10YXJnZXQgPSAiLS1jcm9zcy1maWxlICR7V09SS0RJUn0vbWVzb24u
Y3Jvc3MiDQo+IC1NRVNPTl9DUk9TU19GSUxFOmNsYXNzLW5hdGl2ZXNkayA9ICItLWNyb3NzLWZp
bGUgJHtXT1JLRElSfS9tZXNvbi5jcm9zcyINCj4gLQ0KPiAtIyBOZWVkZWQgdG8gc2V0IHVwIHFl
bXUgd3JhcHBlciBiZWxvdw0KPiAtZXhwb3J0IFNUQUdJTkdfRElSX0hPU1QNCj4gLQ0KPiAtZGVm
IHJ1c3RfdG9vbChkLCB0YXJnZXRfdmFyKToNCj4gLSAgICBydXN0YyA9IGQuZ2V0VmFyKCdSVVNU
QycpDQo+IC0gICAgaWYgbm90IHJ1c3RjOg0KPiAtICAgICAgICByZXR1cm4gIiINCj4gLSAgICBj
bWQgPSBbcnVzdGMsICItLXRhcmdldCIsIGQuZ2V0VmFyKHRhcmdldF92YXIpXSArIGQuZ2V0VmFy
KCJSVVNURkxBR1MiKS5zcGxpdCgpDQo+IC0gICAgcmV0dXJuICJydXN0ID0gJXMiICUgcmVwcihj
bWQpDQo+IC0NCj4gLWFkZHRhc2sgd3JpdGVfY29uZmlnIGJlZm9yZSBkb19jb25maWd1cmUNCj4g
LWRvX3dyaXRlX2NvbmZpZ1t2YXJkZXBzXSArPSAiQ0MgQ1hYIExEIEFSIE5NIFNUUklQIFJFQURF
TEYgQ0ZMQUdTIENYWEZMQUdTIExERkxBR1MgUlVTVEMgUlVTVEZMQUdTIg0KPiAtZG9fd3JpdGVf
Y29uZmlnKCkgew0KPiAtICAgICMgVGhpcyBuZWVkcyB0byBiZSBQeSB0byBzcGxpdCB0aGUgYXJn
cyBpbnRvIHNpbmdsZS1lbGVtZW50IGxpc3RzDQo+IC0gICAgY2F0ID4ke1dPUktESVJ9L21lc29u
LmNyb3NzIDw8RU9GDQo+IC1bYmluYXJpZXNdDQo+IC1jID0gJHtAbWVzb25fYXJyYXkoJ0NDJywg
ZCl9DQo+IC1jcHAgPSAke0BtZXNvbl9hcnJheSgnQ1hYJywgZCl9DQo+IC1jeXRob24gPSAnY3l0
aG9uMycNCj4gLWFyID0gJHtAbWVzb25fYXJyYXkoJ0FSJywgZCl9DQo+IC1ubSA9ICR7QG1lc29u
X2FycmF5KCdOTScsIGQpfQ0KPiAtc3RyaXAgPSAke0BtZXNvbl9hcnJheSgnU1RSSVAnLCBkKX0N
Cj4gLXJlYWRlbGYgPSAke0BtZXNvbl9hcnJheSgnUkVBREVMRicsIGQpfQ0KPiAtb2JqY29weSA9
ICR7QG1lc29uX2FycmF5KCdPQkpDT1BZJywgZCl9DQo+IC1wa2djb25maWcgPSAncGtnLWNvbmZp
ZycNCj4gLWxsdm0tY29uZmlnID0gJ2xsdm0tY29uZmlnJw0KPiAtY3Vwcy1jb25maWcgPSAnY3Vw
cy1jb25maWcnDQo+IC1nLWlyLXNjYW5uZXIgPSAnJHtTVEFHSU5HX0JJTkRJUn0vZy1pci1zY2Fu
bmVyLXdyYXBwZXInDQo+IC1nLWlyLWNvbXBpbGVyID0gJyR7U1RBR0lOR19CSU5ESVJ9L2ctaXIt
Y29tcGlsZXItd3JhcHBlcicNCj4gLSR7QHJ1c3RfdG9vbChkLCAiSE9TVF9TWVMiKX0NCj4gLSR7
QCJleGVfd3JhcHBlciA9ICcke1dPUktESVJ9L21lc29uLXFlbXV3cmFwcGVyJyIgaWYgZC5nZXRW
YXIoJ0VYRVdSQVBQRVJfRU5BQkxFRCcpID09ICdUcnVlJyBlbHNlICIifQ0KPiAtDQo+IC1bYnVp
bHQtaW4gb3B0aW9uc10NCj4gLWNfYXJncyA9ICR7QG1lc29uX2FycmF5KCdDRkxBR1MnLCBkKX0N
Cj4gLWNfbGlua19hcmdzID0gJHtAbWVzb25fYXJyYXkoJ0xERkxBR1MnLCBkKX0NCj4gLWNwcF9h
cmdzID0gJHtAbWVzb25fYXJyYXkoJ0NYWEZMQUdTJywgZCl9DQo+IC1jcHBfbGlua19hcmdzID0g
JHtAbWVzb25fYXJyYXkoJ0xERkxBR1MnLCBkKX0NCj4gLQ0KPiAtW3Byb3BlcnRpZXNdDQo+IC1u
ZWVkc19leGVfd3JhcHBlciA9IHRydWUNCj4gLQ0KPiAtW2hvc3RfbWFjaGluZV0NCj4gLXN5c3Rl
bSA9ICcke0BtZXNvbl9vcGVyYXRpbmdfc3lzdGVtKCdIT1NUX09TJywgZCl9Jw0KPiAtY3B1X2Zh
bWlseSA9ICcke0BtZXNvbl9jcHVfZmFtaWx5KCdIT1NUX0FSQ0gnLCBkKX0nDQo+IC1jcHUgPSAn
JHtIT1NUX0FSQ0h9Jw0KPiAtZW5kaWFuID0gJyR7QG1lc29uX2VuZGlhbignSE9TVCcsIGQpfScN
Cj4gLQ0KPiAtW3RhcmdldF9tYWNoaW5lXQ0KPiAtc3lzdGVtID0gJyR7QG1lc29uX29wZXJhdGlu
Z19zeXN0ZW0oJ1RBUkdFVF9PUycsIGQpfScNCj4gLWNwdV9mYW1pbHkgPSAnJHtAbWVzb25fY3B1
X2ZhbWlseSgnVEFSR0VUX0FSQ0gnLCBkKX0nDQo+IC1jcHUgPSAnJHtUQVJHRVRfQVJDSH0nDQo+
IC1lbmRpYW4gPSAnJHtAbWVzb25fZW5kaWFuKCdUQVJHRVQnLCBkKX0nDQo+IC1FT0YNCj4gLQ0K
PiAtICAgIGNhdCA+JHtXT1JLRElSfS9tZXNvbi5uYXRpdmUgPDxFT0YNCj4gLVtiaW5hcmllc10N
Cj4gLWMgPSAke0BtZXNvbl9hcnJheSgnQlVJTERfQ0MnLCBkKX0NCj4gLWNwcCA9ICR7QG1lc29u
X2FycmF5KCdCVUlMRF9DWFgnLCBkKX0NCj4gLWN5dGhvbiA9ICdjeXRob24zJw0KPiAtYXIgPSAk
e0BtZXNvbl9hcnJheSgnQlVJTERfQVInLCBkKX0NCj4gLW5tID0gJHtAbWVzb25fYXJyYXkoJ0JV
SUxEX05NJywgZCl9DQo+IC1zdHJpcCA9ICR7QG1lc29uX2FycmF5KCdCVUlMRF9TVFJJUCcsIGQp
fQ0KPiAtcmVhZGVsZiA9ICR7QG1lc29uX2FycmF5KCdCVUlMRF9SRUFERUxGJywgZCl9DQo+IC1v
Ympjb3B5ID0gJHtAbWVzb25fYXJyYXkoJ0JVSUxEX09CSkNPUFknLCBkKX0NCj4gLXBrZ2NvbmZp
ZyA9ICdwa2ctY29uZmlnLW5hdGl2ZScNCj4gLSR7QHJ1c3RfdG9vbChkLCAiQlVJTERfU1lTIil9
DQo+IC0NCj4gLVtidWlsdC1pbiBvcHRpb25zXQ0KPiAtY19hcmdzID0gJHtAbWVzb25fYXJyYXko
J0JVSUxEX0NGTEFHUycsIGQpfQ0KPiAtY19saW5rX2FyZ3MgPSAke0BtZXNvbl9hcnJheSgnQlVJ
TERfTERGTEFHUycsIGQpfQ0KPiAtY3BwX2FyZ3MgPSAke0BtZXNvbl9hcnJheSgnQlVJTERfQ1hY
RkxBR1MnLCBkKX0NCj4gLWNwcF9saW5rX2FyZ3MgPSAke0BtZXNvbl9hcnJheSgnQlVJTERfTERG
TEFHUycsIGQpfQ0KPiAtRU9GDQo+IC19DQo+IC0NCj4gLWRvX3dyaXRlX2NvbmZpZzphcHBlbmQ6
Y2xhc3MtdGFyZ2V0KCkgew0KPiAtICAgICMgV3JpdGUgb3V0IGEgcWVtdSB3cmFwcGVyIHRoYXQg
d2lsbCBiZSB1c2VkIGFzIGV4ZV93cmFwcGVyIHNvIHRoYXQgbWVzb24NCj4gLSAgICAjIGNhbiBy
dW4gdGFyZ2V0IGhlbHBlciBiaW5hcmllcyB0aHJvdWdoIHRoYXQuDQo+IC0gICAgcWVtdV9iaW5h
cnk9IiR7QHFlbXVfd3JhcHBlcl9jbWRsaW5lKGQsICckU1RBR0lOR19ESVJfSE9TVCcsIFsnJFNU
QUdJTkdfRElSX0hPU1QvJHtsaWJkaXJ9JywnJFNUQUdJTkdfRElSX0hPU1QvJHtiYXNlX2xpYmRp
cn0nXSl9Ig0KPiAtICAgIGNhdCA+ICR7V09SS0RJUn0vbWVzb24tcWVtdXdyYXBwZXIgPDwgRU9G
DQo+IC0jIS9iaW4vc2gNCj4gLSMgVXNlIGEgbW9kdWxlcyBkaXJlY3Rvcnkgd2hpY2ggZG9lc24n
dCBleGlzdCBzbyB3ZSBkb24ndCBsb2FkIHJhbmRvbSB0aGluZ3MNCj4gLSMgd2hpY2ggbWF5IHRo
ZW4gZ2V0IGRlbGV0ZWQgKG9yIHRoZWlyIGRlcGVuZGVuY2llcykgYW5kIHBvdGVudGlhbGx5IHNl
Z2ZhdWx0DQo+IC1leHBvcnQgR0lPX01PRFVMRV9ESVI9JHtTVEFHSU5HX0xJQkRJUn0vZ2lvL21v
ZHVsZXMtZHVtbXkNCj4gLQ0KPiAtIyBtZXNvbiBzZXRzIHRoaXMgd3JvbmdseSAob25seSB0byBs
aWJzIGluIGJ1aWxkLWRpciksIHFlbXVfd3JhcHBlcl9jbWRsaW5lKCkgYW5kIEdJUl9FWFRSQV9M
SUJTX1BBVEggdGFrZSBjYXJlIG9mIGl0IHByb3Blcmx5DQo+IC11bnNldCBMRF9MSUJSQVJZX1BB
VEgNCj4gLQ0KPiAtJHFlbXVfYmluYXJ5ICJcJEAiDQo+IC1FT0YNCj4gLSAgICBjaG1vZCAreCAk
e1dPUktESVJ9L21lc29uLXFlbXV3cmFwcGVyDQo+IC19DQo+ICtpbmhlcml0IG1lc29uLWNvbW1v
bg0KPiANCj4gIyBUZWxsIGV4dGVybmFsc3JjIHRoYXQgY2hhbmdlcyB0byB0aGlzIGZpbGUgcmVx
dWlyZSBhIHJlY29uZmlndXJlDQo+IENPTkZJR1VSRV9GSUxFUyA9IOKAnG1lc29uLmJ1aWxk4oCd
DQoNClRoaXMgcGF0Y2ggYXBwZWFycyB0byBtb3ZlIGV2ZXJ5IGxpbmUgZnJvbSBtZXNvbi5iYmNs
YXNzIHRvIG1lc29uLWNvbW1vbi5iYmNsYXNzLCBhcGFydCBmcm9tIHRoZSBDT05GSUdVUkVfRklM
RVMgbGluZSB3aGljaCB3b3VsZCBzdGlsbCBiZSBuZWVkZWQgaW4gdGhlIHB5dGhvbi1tZXNvbiBj
YXNlIGFueXdheS4NCg0KSSBjYW7igJl0IHNlZSB3aGF0IGlzIGdhaW5lZCBoZXJlLCBqdXN0IGlu
aGVyaXQgbWVzb24uDQoNClJvc3M=

