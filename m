Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23CCFCE07B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:14:40 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69504.1772111672501770159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RZQ3vfEA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RZQ3vfEA;
 spf=pass (domain: arm.com, ip: 52.101.84.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y8BeBUAjW222RZjxtgPIM39e3k+W9XeFvaeNJZ5J17I+y4V4YgTE0L38b1G4cjLABvqJ9CtV5aDrqxFaBnmfqxJtlihoXCMWXjsgDyiSKN+twwmBu7hB0S9FbNBZGoXcSr2wTkD7hFQLU+LSDUH86cVEVfW/hoO+yPiLd1CcdFp/Yr8B1dcA7mt2VmrjHmeh8kVagkUSn1X4f09kP9ZCNhEKExN+C69xuepfobTtXjEK6ZqV2Co7gVR6uBenxRh4bGiCvmDE8L9ad+aX7Wr5MU4s2fvUQ2qKBnIYe0FdTIR0AgqEXQoWtq25kRV2LBpv5nYHCyoq+i7lM4ZL2Hh6gA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekb7hJ0o+/7yHbnq55XAUmb8d9DM4gm9rOUWeiHAcGw=;
 b=xUisAeyad27KcaTw0x85GN89zluVaKPbbc3u/AO3JpmZ3u5cLflDeBzNrusHd5rpRFSkRcHNFkvGT5/gfh7h4iwOePAtUzJkLh0pnhIzYBjJnjOZnQKqMYVjUMyneMtDrAG+zBrBSUDFcH9vO/7qqSl1tRSzm4pHZN7dsXKCKZ6A2l2/y9/RuUJ7Tc7cRbyota08QiiH4DjgLy22L0MEYS1lyEdlIqGIOid3FhgdcAiEDNU9b4O75V3cWHy+uK0CluhSO+UQWDLagUSzQoulwA19SBtM9U0xdXLhFBuqS7Vc14Kx51bgMgR5TuANl378ArSjUzVyB0yRGTVLOyUZkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekb7hJ0o+/7yHbnq55XAUmb8d9DM4gm9rOUWeiHAcGw=;
 b=RZQ3vfEAykjgJioS7adt8zX+Aqi3em4zwoHQqyMO49U+ssVNAYM1Crl3S//5ZIVQiuLcWr38+0htLqNjfH62YZAFFKw33pIPV61f4sbIK/Bk4ulmrmjCX31vx6iybLFRki7TjSpVSP7cuEUXbPf4U6FCp4gUnetMdnKsq+jc/l0=
Received: from AM0P309CA0007.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::18)
 by VI0PR08MB11504.eurprd08.prod.outlook.com (2603:10a6:800:2fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 13:14:27 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::91) by AM0P309CA0007.outlook.office365.com
 (2603:10a6:20b:28f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.6 via Frontend Transport; Thu,
 26 Feb 2026 13:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 13:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4DxECs0X6clkZjz1oYn3PBVyvX4es0yGW/18o8S/k5ON0rbA3iRMzdtrx3s68udUktWEjlj9Mexl9kga/Wmhxck8Ql6NWyT0S+os8R6PWcu4l14m71ehNCym/f6yMBNeuBxFr+LZ9i0eUXEJDlw2yZ+YOGpu/qGvzr9j1dYE4WFATA4wjn6iimvdxeecE6/dAs870ChN5im0VDZynKq31mHIvpAXJS8GlOKxK9ASA6xyLXQxTQJbOr7CLFAyTZF/iS5Ay52jFI9snK1O7EqJLXPf5hG14qNgaul/04TSGU49D9o788K3B5+gCaqJx7n4HHnS0/fmLxeQVfmUjnnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekb7hJ0o+/7yHbnq55XAUmb8d9DM4gm9rOUWeiHAcGw=;
 b=U1LbvuLcemjGO8srkj1/J+ViX8U6u3i5zPyNcRDuZp8LPvlKUk8GS5uuDBWoNVmIiSlE/0WLtNwOswFyK823PwXUtm8afb8NwGnXYHZkd+4VpkGTLNPT6OkpAP6me0HqBbXQlCsQX57vzY4Zq35XM6hhRpY57e44NRtkVVD5Mf6yztNkCD4IEmTkECBVp2mtB2jIQv1jgymn+yjtpDwCTUY0Ldy3rke4hlyJdwVpaKuKI6nJ50uJbUl6UoUwpXQkvKGQ4y3+OPbS+XKazF27AIsomKvFqV9C4ALCap+U4oOt+Kv3pb0yHNBN3F8YpWawjkl3KZ195psOv6+iA4KWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekb7hJ0o+/7yHbnq55XAUmb8d9DM4gm9rOUWeiHAcGw=;
 b=RZQ3vfEAykjgJioS7adt8zX+Aqi3em4zwoHQqyMO49U+ssVNAYM1Crl3S//5ZIVQiuLcWr38+0htLqNjfH62YZAFFKw33pIPV61f4sbIK/Bk4ulmrmjCX31vx6iybLFRki7TjSpVSP7cuEUXbPf4U6FCp4gUnetMdnKsq+jc/l0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9584.eurprd08.prod.outlook.com (2603:10a6:10:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 13:13:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9632.010; Thu, 26 Feb 2026
 13:13:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] procps: support ptest when TCLIBC is glibc
Thread-Topic: [OE-core] [PATCH 2/2] procps: support ptest when TCLIBC is glibc
Thread-Index: AQHcpS+j43njF7eaL0mUs8ote1Oji7WU+PCA
Date: Thu, 26 Feb 2026 13:13:22 +0000
Message-ID: <7C785637-73B8-4927-8A7E-C689573CB8BD@arm.com>
References: <20260224014748.3336195-1-changqing.li@windriver.com>
 <20260224014748.3336195-2-changqing.li@windriver.com>
In-Reply-To: <20260224014748.3336195-2-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9584:EE_|AMS0EPF00000194:EE_|VI0PR08MB11504:EE_
X-MS-Office365-Filtering-Correlation-Id: 461bfad1-8a97-4749-7b12-08de7538f6af
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 diMgL/s/E4RppkCPX4veao1++i+KlEhrSl8ryMphfQLjxXTYQ2rOSFSya/6MckLSFO2wQVaQ3j+EfWxCN27lP4EA6EEA8piwhQDP+q0Rnx28c6xYAWct6Handb6K3V2HWNX00Xdt4wK/Z1H+DdpcLFa7c8yAs8PLI3JRfYJtt6i9iObAP1aQHVxicZRBxMbLE40a7IJFdt74fvR6qTOGXoeXsYgujNjA1I7G6trwEzU83pS6o+23K73U/oe3M2vG0cr8uvk/D9nTD1v4OFgByxxi3zcXdqcN01Q8JGPyNzRZ3QXx9zNhzSU8idla1NFAcUI5K0DBLnerYHRdUwiK757bjuG107xSiNEAJG7I6HAMefWyxnbbs6UMdccC9MGk3uwcCtbas6bQ90NDf4Hidur1o9G221KnnQhooXRIWocL8/Y9mitOGsEyCB6yTyd2M18FF0nZ2r0XJ51+WfXwHS+0mB9Yd5OMQf3EO8TLfcGUDOzCirnK2MHYbFEzHBhtLEuA13dYlo7Mn2Zp4IF2TTJcWZCac23EMWrF711VKTkMfGCcR0cMi2GUOpSCahxJVPcwcbR/v9rpasZmJbUWW3BtAo0uDwiynESQ28zDnDGnGcsK2/BjClKqmwgXZ+AA8Ekh2c/jKEz7Ln0MhFbZYoKHN7NYXO+t067k0y5PQx2ChUU/Gqz72kbzuPO88q+bONTQmyBfhhZlOD8JBckwWuezmIzhXB+nAGJgTrOlk8acgcDkYNGc592Y4k7hendfcILDfY7kroqbdu2RkM8kC2u6fKQo9GQjB/pjTn4TJG0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ED8EB6D281669E40BFF90539762936AF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9584
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4292121d-3f3b-44c9-9d4d-08de7538d13b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|82310400026|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	0Av+m+teyC9efVDZ5TKbGoLacw3CZyawHyP6JJ6NMl4oP1gkTurLXUkSdiiR9DvBLBWGy4LdOXglHnxpETGGz/pEjpg3OA8tDmFjojkaPcntnugPwY0/Hi66UrWZ9GaMufmuCZkgI2ZtlIkpDcsKljYMbBAFJqtxqKf3Z7FJXLNqs9oxYqHnTB/8jFSUpbul+3513UjmW2ik17gBgQthLNpmZoYmNKOdM8jL9QLXykOc5bhdmw8r+iHHBcSIGTFdc3oeKl2tP0UlBQSWJLBF/MI4RWzsAGpqGSDK4X1zyLeh0oR4ypbMYVMbMzS5ZB/Pqf/S4bCX3QttY6i6S0EQ3cn+Hpkzf294i6m8ZeOcmxpRpZuQjVVY3317ecHTubrEWH2yKVd2t1U+uP51lezEc4nbqsfcRGTwV1MyGWzoSKIwI9892YhwsV2xY7FvozyUWVFCCcy1MRpCJClFX2NBLQbVIaUyO5Nz3mGeUNUVM8qwoPZu1f7HQZLBGuOi0BEosQxnyT+XU0EvOb83CtTRiN+rwVFFUgSiYkxKFFfX0EPkIwrkj2gRqI/5TyEXsRwaCwsIZCzDHxmqLyOntCMO9C+VwNqr7RzrlQ+uEFVWYndqukqfRxhDy6m17F+ZyQv/QykDDmCAmoz50mKwamQQxXbVncunybOL3uESirltmdvhty0DZKQiOW7xJf3B5+yUTj/cfJM1HRA7zILqrPcZgB+ThHhy+l6DQTpjqlzR+tsnrOGAVCfAqmh1933IoUyB6QMETF1ibcPalNGr/oSxxa2zsY7IpUM/k4aG7Zp+YPgufXYsYalEFrp2YWlPy5S8FPj/XfGltNEm0sog/I3s7Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(82310400026)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yjBYKUpX/f0y/Mal5am6mbWHFnupGIDpnRCeeFQVwouazCXhIUqtL0KBFjFm1QxolgESXevEBKTWWpWXng0zHk1opy5Jp2sq4csm3efPaKqqYgdO3dm8AFbkz8AnI2Bl4lX/re80zD+IHhIzjPtyC/qMcSgqBV7woornRLMmug4cuELwRHac2TXN1tsLmpKA6MXibywwJfhToSCoXoNbiqS99paMPmZxsyt3nyi8hySssPAQXb3TVOoi+3gTezsb6tVB/eVqJt/sWcMY48JwzjQNHu/cb2w1f5++SBQdsCHwiy8C9y8Hbbej98O0Wbc7Bv2XB3zIUc9teokNZ0w1mFJhpaKlTvR+KncS7a8DlCfzFNCZPgWCnGjbWYg5ncxYXiB0f2RAZeannU1y/Lqh7RFzCWn7EA3zK/DsNZTCxrslDjhBsDrHMIl5e8mByGiH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:14:25.0139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 461bfad1-8a97-4749-7b12-08de7538f6af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232022

Hi,

On 24 Feb 2026, at 01:47, Changqing Li via lists.openembedded.org <changqin=
g.li=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> * support ptest for procps TCLIBC is glibc. The configure.ac only match
>  LINUX as "linux-gnu", we can patch it to make test can run on musl lib
> system, but the upstream testsuite should only run on gnu libc host,
> some test cases only suitable for glibc, eg: Some of the error messages
> for free command on musl system is not the same as glibc system, which
> will make test failed. In order to avoid some other unexpected failure,
> just support ptest for glibc.
>=20
> * procps's testsuite use DejaGnu test framework.  The testsuite is
>  expected to run during build time, this implementation create the same
> folder structure as the testsuite expected to make it can work well.

I filed a bug for musl support just now, https://gitlab.com/procps-ng/procp=
s/-/issues/420. Please link to this in your changes.

I think we should build the tests for everything, and skip the few tests wh=
ich break.  In my testing in an alpine container there are five failing tes=
ts, but it seems that two of them are busybox related so we can resolve tha=
t with dependencies to pull in the proper tools.

Ross=

