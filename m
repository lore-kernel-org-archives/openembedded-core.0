Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AF9C6FD1A
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 06:32:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.57])
 by mx.groups.io with SMTP id smtpd.web11.8722.1678170729562349621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 22:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zhDub7V5;
 spf=pass (domain: siemens.com, ip: 40.107.8.57, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/cWQrB3NDN/0lMpKecYZl8OwELZUAY+k+A8JTjDHf073rY3hY0VhdPsbnLUj1CMbBngPrvFuYD9runN14DVYyynQLqSrnvtp4e7EB2wQFRlP7c8VfebNQ0NTL9/pqg4U+P/kRh+SfNK9LHrDexSl+lUwWXiNm+yyiM6BDWG47insMn7ZxWlQw7ngFIz45WK+Xj44fwcENN4u2Hfoeulvlg1V0xBpR8RdJ5stpssu1/yZzwMkvtCsJ0A2d8ofoUTDOhuGm3lBkVsrU3KOn3zqzhVNR2tN9fLlUNs/I8hyJhSKq5bWSiVMQSHfcR3cPhwyxkh49gvCBOBZVOXeX5QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfquEvIeX6Bkk6mpJKrhBBYfkhgm2ymsdnuclNJqaxM=;
 b=ldEGM+U3V2tZSNDl1G8ecOnpTaB6jcFnioQ51VFfOqXg/uSaYpVdzvASUJPNTCPMIDL7SFT/fPpCIDtO47OOEvtBAn+sOWaxuFg7CfCfA6rau9ZV5OYfctQjkWayGUqukc2SY1fUrVqtaXB4ufjUJZpayA7RJI3G1B4IH9OzuPUXjAWnZjtOm0kz8XFLH5PblQ+0zLdi0vp5Dxf7o/2hFBsQG0QcH4XsjZ93+QB3h88gdOwjU56j6guMs9BTEtW3O7MdlnvYJ2BhMpKeauI8ac/GV4DhcYXF/N/jmSmrUgSdA1KADltZbgr4XJJ/TT8/kyWKQBamp1DH/ktF6sBQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfquEvIeX6Bkk6mpJKrhBBYfkhgm2ymsdnuclNJqaxM=;
 b=zhDub7V5dsZGAJfAOksP0yIoXFxSM2928xagXd/7kuNH/cNpA7PuolQpno15VY7QtVuUnQTiJN1G5iioodhNk9kGMJx7HHoR9eAdnaAefPYhYqg56aIuxkNVmNRcYhd3n3LaKloLqbIvyBYGwvQA4l9YYLT0Z2loUwyqCfqLIjjIHGvC0zdIr1sIXAPfSgRcNurzenkxWLjD0mGm9hbYvYzFjkNAiLcUSRjpPpl5CsDtrTAoLwt72uvMusPWGx8Fmm8rTmvUZ4vx52SpOBbxdTmpOyxADSxqc3BYH+PQBDl2CgT3oeiAj5rkYi3rNk7L0wGs+e/MR6WoATvgDIbPFQ==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB8085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Tue, 7 Mar
 2023 06:32:06 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa%7]) with mapi id 15.20.6178.016; Tue, 7 Mar 2023
 06:32:06 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: [kirkstone] Google go CVEs
Thread-Topic: [kirkstone] Google go CVEs
Thread-Index: AQHZUL6Jc9VVRVusOUuFBbQ2Uq517A==
Date: Tue, 7 Mar 2023 06:32:06 +0000
Message-ID: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|VI1PR10MB8085:EE_
x-ms-office365-filtering-correlation-id: bbdb6afd-c6dd-4d4a-70f9-08db1ed5abbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VGxr7tyhefq8UCk4C1UgDbQ/jhdhdgFEQIYc/ZaoE2k+6EQpVwiqkkIlkHIzvcEaUAa033kSE29ZTfLnzQw79cEjZKc+MzbGZgztELz14PxfrUteoI1n8kHMhWKhR54foD4ollLiwRghBOs8sqDBkIujOTyaZdYzPx2QPHjMc8VzG71R6El7BDfA+Bnfsdoc4KOF0BAez6BEmpTsNiNNUItHNxr7IAtlU9yEcfW2p28IDhx99N4reIv24b1CUC7ICWEwNsMH07tuqgU6HzeQ769zmX/s37bhpPMDIQzfp46W6J45yoRZl+16ofbKz40mQz+geBp/jkhUo61GYAH6ytCjbwgrKKxOrGl3h1nXAkxCoo45/Yfgjp7N5j2o4eOUNjMffio6MrqG5Zvs/SCm0PR9i5LxlvozF/UmQjnKZieGKxeNERu+Nri1LR6YDSqa/EgxX8UiehbmThkXSzYcmhcI96qEBb5gaWxN5dzGizsJKYGFyDUobjX1r6SyagvYApnCG971f/K+SCBs7IfUUQQX+OWIfNHyRWfeMKwY2yTpR8Z+nzmN8lgLzppFOUREN3jDbyeCA0cqPKWLeChmWrIK7YihEfltmr/KAA7QH9XW/hw3S3FYDmcTHcHrlnUbYnYBywHQX6ZT4w8MSWFsIWBFG8YVtTdPKuLostwB0bwnRY2HJzevUtyhawYxJwYyWZINnPWzjNFHcBnO/RR5xA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199018)(8936002)(76116006)(5660300002)(4744005)(8676002)(66446008)(64756008)(91956017)(66476007)(66556008)(66946007)(2906002)(4326008)(6916009)(41300700001)(316002)(478600001)(71200400001)(107886003)(36756003)(6512007)(6506007)(6486002)(26005)(2616005)(86362001)(82960400001)(122000001)(83380400001)(38070700005)(38100700002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmp3ajR4VTdqUnBZWEZ4UllZZGdMUjFETjBUTGJ3Yk4reFhlRDRLZm5xcnhi?=
 =?utf-8?B?b0h0NGdIRzU0OGlJYmFRN05pbHpld0xNdytTbEh5RnBENXZ3ZWtuRTNEQllu?=
 =?utf-8?B?RjBsU0drTUEzaWxQMkt6UW4rVWFDK040WEJ1cVgvcU03WEZSK2RXaTU0V0g1?=
 =?utf-8?B?b2pzVHA2YlMzVk1KTkVmbDhEa2NDclcxNVRkSHBCMFRoTjV1cm5WSm5zTCsr?=
 =?utf-8?B?RXJCY2hqTW82bnJJaDZyTUxkS041bjRkQmtOZVh6TytJZ2ZZL3JJbURxdXli?=
 =?utf-8?B?TnNXQzZvbjZWVFA4VzJuRWcrUzJIZTJoMit4TGhUMFo4SjI5ZUR3U3VWOU1B?=
 =?utf-8?B?UWUvdU9DN3Z6L2ZHVkkra0FxUEFxQ0pkcDMvSDRGZURNWnlCSUpjSkg3bG52?=
 =?utf-8?B?WTVjYmRYc0pQenFqYkdvOG84dUIvbXRwZklDNkwrZ0RWR1BvQU9wam83Q0RY?=
 =?utf-8?B?QkdpZUswT1JJcWVNYlJ0TW15NTRyWWFqbjMxeDQ3Q2lHT2NqYTBLMGpBc3Rz?=
 =?utf-8?B?bDlJYytBYnJTTUljQUR3eHJMdWNEUDcvNzY4S2NRbTBEU3ZDOTFBTDJhYmJl?=
 =?utf-8?B?NWg1YWtGQmtDdzBUZlVvS1E2VFRwZFpYdFNkdjNsU2NMY2RaVzJUNS9mSnpH?=
 =?utf-8?B?eU5QZ21Va2RRZm1MN3VrWVBpclR1UjFXQ0l2TFRKSk9Ld1BIcG9oKzNxWWl4?=
 =?utf-8?B?RHc1UHZwdUsrTVVpUm9tVENGcDRwQjlnMy9Rd0hnNW5keStXdk5FSllUclo0?=
 =?utf-8?B?OUdHWTFYeVprSGNiMUExallNUE5Nd081U1VreFZ6UDN3V2tqREFLVERtcUpw?=
 =?utf-8?B?akZYVkx3MDBycjdGN2JPOTVUa2M1Vmo0QWpjcHhQM0V5YUs5YUE5bjg2UjM5?=
 =?utf-8?B?OXhMWHo5UytodXN2a05LVEQ5a1RIWEpUallvTmdlZ2dZdjFpVEsyRU90SHMw?=
 =?utf-8?B?dDZkOWxlMGNiMmpXWWFmZzY3V0Y5YW1EbnczelpPWW12WC9jS1VJdWo2bEdJ?=
 =?utf-8?B?MC9velE3NlRvR3lxQ0c3MXMrdTFrbEZXdTc2QmNCUkd0QnArRllFdEFQQXVV?=
 =?utf-8?B?cXBZK3NBdTROVTVoc3pNSDNIbURzSjh6UG1MWlZrNjlWR0pDaXJIc0daUXlw?=
 =?utf-8?B?VjhWSFV1VnZzdWE2YzlLRWJsc0lRRGh6Um1VSzM1QlRqd3hoSVhkeDFHc2Vu?=
 =?utf-8?B?Q1I2ejlXRzhaNGhTNGhFLzhyS2hWM3p5citQdnp6QTJEYjZEYjNyWUZHb2NU?=
 =?utf-8?B?K0t4RFNwNWtvRzRGRkl2VEMxTnlYeVR2RGVYQ0NmWjQ4NDdLR0I0SnJHZklU?=
 =?utf-8?B?cGJQTWRubjJmbG5MMVVMK0d6ZmE2elNOK09ZYnFVRVc1bENpSzBxNmwvNExS?=
 =?utf-8?B?ZzU2Y0RZV094cDk2UzBhOW1HaWNmZlk2aEZMY095QmVqN1NVSnp6TDR2WEI0?=
 =?utf-8?B?SlRzRmdLRzY4cGpxWVlVUUROMHVWNkpxcCt2YWppcUd2TmVhMkptK3pWSGR3?=
 =?utf-8?B?N1lFUTduUzRkT1Jrc1NrM3R1cCtzZ2Q1K1VTbzVENWdUWHdFQ1ZWQjJkaDJp?=
 =?utf-8?B?dXl3ZVF0a00vcXJKRmIrMXpFQXE2T3Nuc1dqcHI1Z20zSTNXaXN0Tm1QRmwr?=
 =?utf-8?B?d0liRXpZSUFqVTNxYksvV1hYMUUvSWU4MGxUU3lGSUZCVkFiSzBwc3JOcEUy?=
 =?utf-8?B?MzZRUzRlQklpT3pDU1ZRRkFHcTUzVUs5NHVmUXJPYUhEb3hQMjJldTZVdVJa?=
 =?utf-8?B?cExyWEtMZFc2eDBzZndNM3BhbVBYbFgrLy8zM25BWjNURUwvQ0lManlDeld1?=
 =?utf-8?B?Z1J0TGFtZGk3NCthNEkrUzgrcHdNamxRWGY4TFpmNjV2R1hqZ24wamtZUG5n?=
 =?utf-8?B?SnlwQi9MWGcxQiszVjJ0Q0lXcFBVTnZtZlpaN1JwZWRhY2hEN01DN1JIaDlC?=
 =?utf-8?B?KzYvRmVWb2xzbm11MmNWdThBaTVsek51QmNDOS9KS3d5MWYycFNTd2V6WkEr?=
 =?utf-8?B?cUR4ejVFbmprVGI1SFQvSXUyNStWUUd4TkM0anVzenNLek04UndVdjl3Q2lE?=
 =?utf-8?B?c0ZGOXhZZkRvRW9JMDlHMUtIL2JkZ1hCajZ1MCtibGUvaURxQUNTVStickY5?=
 =?utf-8?B?MG5nTDdmM0hrU2Q0NUc1THhLZlQvQUpGby9KMW9oaXNUejV6TU1qU2FrS1RE?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A0270EDA098849BD16A346D183D681@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdb6afd-c6dd-4d4a-70f9-08db1ed5abbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 06:32:06.0861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JoqIF70iKJF7u6ADR4qrLaTUJzTjeIR92DAx1OEITVVyltM3uFWO9/WXq3znMyjitsuhJo9dfRm+PlfVTNkV4I2xMc1fjn3HGwLaa06Jxm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 06:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178089

SGVsbG8gZXZlcnlvbmUsDQoNCkkgd291bGQgbGlrZSB0byBhc2sgeW91IGhvdyB0byBwcm9jZWVk
IHdpdGggbXVsdGlwbGUgQ1ZFcyBmb3IgR29vZ2xlIEdvDQpjb21wb25lbnQgaW4ga2lya3N0b25l
IGJyYW5jaC4NCg0KQ1ZFcyBpbiBjdXJyZW50IHZlcnNpb24gMS4xNy4xMzoNCi0gQ1ZFLTIwMjIt
NDE3MjINCi0gQ1ZFLTIwMjItNDE3MjUNCi0gQ1ZFLTIwMjItNDE3MjQNCi0gQ1ZFLTIwMjItNDE3
MjMNCg0KVGhleSBhcmUgZml4ZWQgaW4gMS4xOS42LzEuMjAuMSBicmFuY2hlcywgYnV0IGEgZml4
aW5nIHBhdGNoZXMgYXJlDQphdmFpbGFibGUgZm9yIGFsbCBvZiB0aGVtIHRvby4gVW5mb3J0dW5h
dGVseSB0aGVyZSBpcyBtb3JlIHRoZW4gfjEwMDANCmNoYW5nZWQgTE9DLiBTbyBub3Qgc3VyZSBp
ZiB0aGlzIGlzIHRoZSByaWdodCBhcHByb2FjaCB0byBhcHBseSB0aGVtLg0KTm90IHN1cmUgaWYg
dGhlIHVwZ3JhZGUgaXMgYWNjZXB0YWJsZS4NCg0KU28gaG93IHRvIHByb2NlZWQgd2l0aCB0aGlz
Pw0KDQpJIGtub3csIHRoYXQgdGhleSBhcmVuJ3QgYSBjcml0aWNhbCBvbmUsIGJ1dCB3b3VsZCBi
ZSBuaWNlIHRvIGhhdmUgdGhlbQ0KZml4ZWQuDQoNClJlZ2FyZHMsDQpBbmRyZWoNCg==

