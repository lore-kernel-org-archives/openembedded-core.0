Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEB5C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:16:43 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.86])
 by mx.groups.io with SMTP id smtpd.web11.2678.1711041399210167259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rz5Vm5Jq;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rz5Vm5Jq;
 spf=pass (domain: arm.com, ip: 40.107.249.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b4icFKeQZ6eq0rHGdKeGNcmi7as5yzM7JyoZE1WorGtOwrYlKKTV+Fun8mvMTIushf+CC4hmClFSYCgj+GFkRqqEvBKya0tdCeDcjjUCkli7ZUgzwVzTqtBFt/26TyBoe+EWLUqPPkBWrLAZkJR/SdaURStw1SwFXj2pmJvlitK9cvn4fERZeQgNhUj0Hkw0rqZOYK2ytb8+MepH2v8zZ9hdqYki3qKJs5be8vQk3PbeN53t2lAYFrNhLcP5klfA8L5jwRF23VBMl7YIbb9UZHXECEaNr2CObo48d9FnHHh4aT5iDjRus0QMeygetM67wh6lIwP/Ua/8Hqz+KY9H5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaZQ30bk3YgBNThfH1/wLqF6Mx4TRxZdJDhE/BIHAQg=;
 b=Th9VN0tdK5eyU4TDt7zGeVRDvfj3PnUByTVA720DxuTuoTdfsugzE3lZ8L68z1D6YZqB2GXcLnvdrU4PJfv3PvPB6k6Ga/xhp7g9USThGXhm/h2zXJlWGX1B+2Oi17TFgm02vgJWkZ3Vo6PcgxiJ1Vy/5BwUAfdKo+qg4Hk/yC91Dz8IfeKONSbuTVUmHJCSfyW5Jufq5zrMhkUpWnN5wa6tK2sZ6QLGho55jCZNxxjAcfZkIHy0+aBYkJthQxowFasy6AJWdB336QxlQR/xz92gt5vpXLi3kcLOJ8J0j5bwPGujnS2GoMiAVg2ZFt4k5ID0oyrgvifh7F/+0Gj/Fg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaZQ30bk3YgBNThfH1/wLqF6Mx4TRxZdJDhE/BIHAQg=;
 b=rz5Vm5JqQ8QhZtdCbJePnW7AmTqf2iOqzZGL0SOpxIx8XV7WUIdlhXeas+GaIh5oPh8dD7fp3jAWrjti+2ksbHpazbdVKf7VrtCZT5uBRaBWMY9xj4uho0o7oUK9hqg1UnBaBikoFV+jjQ7FjixEEhaipwIHZ8qH64m5Y1AcGbw=
Received: from DU2PR04CA0351.eurprd04.prod.outlook.com (2603:10a6:10:2b4::10)
 by AS4PR08MB7554.eurprd08.prod.outlook.com (2603:10a6:20b:4fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Thu, 21 Mar
 2024 17:16:36 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::3b) by DU2PR04CA0351.outlook.office365.com
 (2603:10a6:10:2b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 17:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 17:16:36 +0000
Received: ("Tessian outbound 9d16f63426bd:v300"); Thu, 21 Mar 2024 17:16:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cbd5f22fad6df99
X-CR-MTA-TID: 64aa7808
Received: from f2f30e577b84.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A8746C7D-6C18-43DF-AC91-9AE7F425345C.1;
	Thu, 21 Mar 2024 17:16:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2f30e577b84.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 21 Mar 2024 17:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq0dtwGy4qAR5EwvFli8vJkzgIwFx5TepD8i4/RmANGJMnMssLIqgmngjQLTKd8T7XPlh8tH7NnGyc924nYSiviEpXwQTqeYRWwxunpL3kMEgRqBB3Xb4jiySj0YeWxAeae448yzr6O4qYO5bwlkQT3iYSuGteDpv8ylw6QeqTrPydGZQyMCsDwfJPOPLKq9jK8CBaNBKIsQTaOlFBxXLkzKhQNfSJsZsi2irkJgiT28UNcWyItbHJ9MbkyMBtQEo/EhVjET9xfZW4YNVyVk9z/A+gidVeAZR/OxgeXmsVWIPsZ7ZYgkRKJU8d/flEC1XJxMST1DKLrlSlFzIEQj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaZQ30bk3YgBNThfH1/wLqF6Mx4TRxZdJDhE/BIHAQg=;
 b=iANUwZwXWmgIAPkWAh6nXY3LiWPdijAMFk9bS3n2NR2Wf92Nt/mDGfVB6X/OPt9F5B/dbQ1odNM7a+ZYd7T9LTcPJy6kLPrjAtH4X0xopOaVpmRIXTYJAMdh4PsIWdknMlB1f7f3kuQuzZm9Lycd1OFHYFevXGWgOqA+OPkT9erxTfr9MGX1Pzqn1svbdEY88WENpQF7HbR80MCOqbQ93sIXHFvepFRMdmIQtwMw1HsR482US5LOaTFaSeHtot/8eQPpl2toQv/YzKe83D6i0SrnE8g5i7zoMuxbbkmTl8vIwJaeeJJfkbGRK9b6xKPD9BnKCj6JDAldrXVy9hTDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaZQ30bk3YgBNThfH1/wLqF6Mx4TRxZdJDhE/BIHAQg=;
 b=rz5Vm5JqQ8QhZtdCbJePnW7AmTqf2iOqzZGL0SOpxIx8XV7WUIdlhXeas+GaIh5oPh8dD7fp3jAWrjti+2ksbHpazbdVKf7VrtCZT5uBRaBWMY9xj4uho0o7oUK9hqg1UnBaBikoFV+jjQ7FjixEEhaipwIHZ8qH64m5Y1AcGbw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8377.eurprd08.prod.outlook.com (2603:10a6:150:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 17:16:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 17:16:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emil.kronborg@protonmail.com" <emil.kronborg@protonmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: remove vendor from CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH v2] pypi.bbclass: remove vendor from
 CVE_PRODUCT
Thread-Index: AQHaeuEBuT89VN3L3UO6V+U1QvtxyLFCcTWA
Date: Thu, 21 Mar 2024 17:16:27 +0000
Message-ID: <9310D06F-A46C-4AE7-B2F8-947562735CAC@arm.com>
References: <20240320160459.227582-1-emil.kronborg@protonmail.com>
In-Reply-To: <20240320160459.227582-1-emil.kronborg@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8377:EE_|DB5PEPF00014B94:EE_|AS4PR08MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a12c090-7813-48bb-498b-08dc49caa9c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Yzfx0+t2WZyoRXIEPiW5Nws901rhESrrh1nZyQ3S76DaSpuOJdbT9BHSfc85dTnwNIWfvlF8hmPfE4BIqazUIdjGIUdGYA4kZU/uF1ifw6QpXqcqA6RXqDH4fsCBwHvM38Ez92JwrwzHXOwIMrtHgqT+JGOIfpor5KI4B3mplkVQ8Wg/IieK+S3tIqmRWMwhaKoiH4894hkfcxckIAiUmiyk8no2uzzENXLb0K+fjnrjwsQNtLXETnDFPLTpwpMmIYEiVPKrIjfAnRtO7e3BGdLQhgRymW1t4kH0HmV3RMievckVTF7lPP3nCPR6x16RA+t9CuDuabBYZHNfm83UV1QqPKGlAj6NX8hLgOMgJtCuVzgFx/U+q3R4bkPROq5u4t4ojpRxjY2HwV6X6+fQHSi9bj0iIdZrOpCometFbJhj63+YyaNrtb9JD9eneLjou4wHkguz/CN/ZCGt3BQee5KE98fUsf0KxRhSHZNMjEKRWWivbJXcLbyHnFsvCyDdDzZwC936gMI3aT6jwkpAiqAj0TS9rq6D2PhA4/fnbwx8+bU9RNt13H1UU2PUD6214VPGHgGZ+D0W0EM+hSAW6RvQi7WzLyQAmOy98q1n5obO4Pgj+/tsxH5q29IzRLw6bA3TbjuuVXQThQObcy+wV5yLCabcAFWJBI9ORrPsvGUp6TPjQrZMO22OWxBzNDIyQMzpPhCSdTPlvxLXllaYbDp0Me4dmnFHg8M//FHMzBg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74910A93A441594FA3CDE34C96CC1F35@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8377
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f67b83c-2adb-4638-9e13-08dc49caa4dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AUCtyl7y4yTmlV2rlzhCoAESC+qBinKiHlWYRoDVnw1ddCmFIBXyyTMlnfDkIKeOP0Ij5makaLeOsetNjZyGErfQUKa17tIyUnKM/s89NbOR+DjkkLvDqFZV4/45h5UGOcxUVjjyc7BYfTTvB6cuhj8lz5hpypcFg8FApmIO5OS7Qgpoq8lISWUiY35VJLQfsDmXuGbn0kQVxA9s3mF0qEM4xbvytAvLsVHi5bvO//VeV1yqFAL7reuSxOyEZBLe9+a7whqdyY1Vrd45v0jbAo+WoIBOqZs/ZJldfBcvkBI79erszrRSQvLlWIXxx4p5uh41udXwT3+NfnATjob3Epj4ka+jjhnnqtwIxlKyHL91Vrza79tYl5aPk3qvDyUTjc4V0pabIdL71yxEGvKdLpkRQPlQxI9CE5AGVRBaLWqC2pZlEGiwOAtTrtJftCI1hRyUFUlrKZLv/zQcZ4tEW47fXotLSm3XdyuDYLO8Wre98Bq13ZMKcVf60FOQaJ5e3D8IfZshChosLP/T7+JN3QkfBExMep6yNV61NWWSmhOf2jVWCFTgBBiJmUFvhHsDghaaVf1we5T1/m58/Zy9sK4KhNsZ3WbpLIRMC189a5gXpNgkX/v7h1UC+d+effzdjeROUMybpkx2v3k7q5y+nbWL3lKBJ9+a/K8kfYeVBq9li9V/qtJ25PaFs/YJ0XfatiEt6K95QSusqe/rdY0W95YcPV4admnbAbjF5ilw/fkOOjffaEgzqFySjpt2bINL
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:16:36.0202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a12c090-7813-48bb-498b-08dc49caa9c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7554
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197421

On 20 Mar 2024, at 16:08, Emil Kronborg via lists.openembedded.org <emil.kr=
onborg=3Dprotonmail.com@lists.openembedded.org> wrote:
>=20
> By specifying the CVE vendor as python, some CVEs are not found. For
> instance, the CVE_PRODUCT for python3-pyopenssl becomes
> python:pyopenssl, which yields no matches in the NIST NVD database
> because the correct CVE vendor is pyopenssl.
>=20
> Generally, CVE_PRODUCT ?=3D ${PYPI_PACKAGE}:${PYPI_PACKAGE} captures most
> cases. However, some package names, such as python3-pytest, are
> unrelated to the correct CVE product. In this case, the correct CVE
> vendor is pytest, but the CVE product is py, resulting in no CVEs being
> found. Therefore, not setting the CVE vendor is the most correct option.

Have you got comparison reports for a world run before and after this chang=
e so we can see what the difference is?

Ross=

