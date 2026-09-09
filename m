Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C94C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:46:09 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.239.1788990367979000467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mh5VPdbJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mh5VPdbJ;
 spf=pass (domain: arm.com, ip: 52.101.70.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bhxfGeFfdB3TDrhK++9jY63xd3yqsHILjL9OYbWnXlxa1fo0xk1y7E4eV5X9fFmWLnlpjnUwUphmqajDENbxHYmJmOAg1nEcWQZtPyB0ODGJPRkUWruOPTzZMDx9LtPB8XNivUJCBSvsWKjPpAMJEgh9hY7clQlE6eVXlzKFPQVGvnyxWbnWunUucWRqzCcoVFWLlVrl5iLvkwLC/zOzQuU4ndgf6RZyaMGQEjfXcqs+weaDDoa6GiTRzkfnE6VXcBWrKK5CuN53F4oWQ+cZ9x1b9kPkIcMLqHD3f/7fFfT6vhosqWh0FCNIIuUzwJhUWbkywvLzWqAcBeSpkvqhXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlFHN7XolwiodzkN5HXR95gUUG96I8xEbAp8aHDNzyE=;
 b=ZiMA2QykmL1QVDL+fJeiC3EGIj0kyP7GQIEwycv8DshZA0OAqDA/iVhOIXK4gMQ+kHVa3Ro48JBFGaEgvnobCsCLFRBUDZqr8HDg6Miay/gxCLkhrmQ71BWkIIBXemiLQOALC7d0AMi0HbUd3mGM6KloEk1NZTt2deIUdFO4j3k3SugjPX0fXpHacJEQqEzOO0c+ZLRxCcHjj1eUk3DSXY93dYpDz6GzHomplZ0X93Yw6tDaen3Q2Ym/Pa+2lHubKQG0aw7rDGKQyGvaQcvi9Y7+Bty/fNq64vLrOy1LtT5ZFBUTi9gw9tDd+wmydYJY7mqPdI7SdYIEQ2TeEiyXBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlFHN7XolwiodzkN5HXR95gUUG96I8xEbAp8aHDNzyE=;
 b=mh5VPdbJ3nisGONlg2IpL1fxSD47SBBKnrWOuxx303jCW2sOBW/Rxv4wYCAQdFGmBnFoCQuVrHgHeJTdOlM8BoYCsTQ0867V39IbZlOnym/RLCKg0r10QT863ScSx/4q111eDCxsuZ4sCzBqUn5RYEjqybSgg3hFU4jlmFHj5WY=
Received: from DUZPR01CA0160.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::20) by AS8PR08MB6710.eurprd08.prod.outlook.com
 (2603:10a6:20b:397::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 9 Sep
 2026 21:46:02 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::8b) by DUZPR01CA0160.outlook.office365.com
 (2603:10a6:10:4bd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 21:46:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 21:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCX71dUxrIyMGBRnChZ4zfpHD20+Qf6v6m8R4bI0LsBDaQnmO9INUHXMSEvQfJy+tejhnrDY5arq5UVtFHI+4HOzcd19JMIl3trTDS2BZ4p91uTuiDBQkUUJQgVUkB2LdaZYPtk4gxWqWiA8si9o1DdfvTSdgcoXlM37B2pHPqsfFpDlFN5fvw8/ds7OJ9fp4EzHXTDdMFrj/mD+KvGegByXDS4PJLx8uj/hpVjQdaq9uHPVzXXgqTRcnoYn9xvCU2FAqhfrFqCdLZ7jTS6qK0pb/BKK+Wk+8fRjIBU7QVe/EO0cNvpNfmVgK1+yq11jZ4KCj+dpNKZvc/utS2mpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlFHN7XolwiodzkN5HXR95gUUG96I8xEbAp8aHDNzyE=;
 b=Khpb53LZ8Jv+wuxA61FbSPGu5WX29NeKCeHxYwhv0YpnSaaeE+jlVj432X0BzKlQDGBQnSPa6/bVwoLx/ymDhFTtOIFDOMvvozjCTmAR7t72mkb1jyTmrTHwY6mtwL7Ib0KPyLliNnAzgrVSWKkPvsdyBCdxCHjdCX0P78zv0niR2Yn1vL1peCNx8EAhjCGdna7YUHM39cjqEabpdlxrVF09yM3GqhTxYxTFc2B0/UpOufSw1pE1K1Chqqwj8ZTZf+mZSQs7tgvnmmxy6c4f1z0tBlSBFJcd+4t/FMhd0OSSel8OC/ipdNeE6GWrncZnkQ/d4Pk1MxXfEC8s37rj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlFHN7XolwiodzkN5HXR95gUUG96I8xEbAp8aHDNzyE=;
 b=mh5VPdbJ3nisGONlg2IpL1fxSD47SBBKnrWOuxx303jCW2sOBW/Rxv4wYCAQdFGmBnFoCQuVrHgHeJTdOlM8BoYCsTQ0867V39IbZlOnym/RLCKg0r10QT863ScSx/4q111eDCxsuZ4sCzBqUn5RYEjqybSgg3hFU4jlmFHj5WY=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB11279.eurprd08.prod.outlook.com (2603:10a6:150:2f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:45:26 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0428.004; Wed, 9 Sep 2026
 21:45:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] classes/setuptools: use tomllib instead of
 regex to parse pyproject.toml
Thread-Topic: [OE-core] [PATCH 1/2] classes/setuptools: use tomllib instead of
 regex to parse pyproject.toml
Thread-Index: AQHdQG6gsRwArtKdkEqUhAAOfE1CsbbGguyAgABFM4A=
Date: Wed, 9 Sep 2026 21:45:23 +0000
Message-ID: <E573F361-9138-480E-9628-1B40721E465D@arm.com>
References: <20260909151906.3417094-1-ross.burton@arm.com>
 <DLAYVDPOCV72.MSLAAVLWK6WS@bootlin.com>
In-Reply-To: <DLAYVDPOCV72.MSLAAVLWK6WS@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB11279:EE_|DU6PEPF0000B622:EE_|AS8PR08MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 8450b2b6-8e31-4a17-3b8b-08df0ebbbd8d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|38070700021|10067099003|6133799003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 tO+D+OHVL2k8GnZ2YsPOIZm8IUxw+4BVewTgK9qFTljBTpK4vYAS2470FHEErzSqmXAfayD30q4U/8puRY+vqWY/19fQnLf5BHSzqLCP92Nx7AjJV+a65aWvv38PPGAioPvS3saoRRMCYJevu2c5OczXAbRzlRjTFbcGSSd8a5Fv0AQH/Xl3kyC6nBjIOlD4KjmXagGk+3b/A5OSfmrycrgg/Sj1tMeD1nzW2Ss0CCJygKk9nikZOnyfwanyYJyEKQ4fPBcP25fzYViryI9LBypmrTG6Rs7xxb8ZhmI+qYYR6IKrDzTE/55vMkOPmQ/QOJTPe3BlmlIKHuJR4NlSbNwN50d7GtcYvlMgZUSJYWEYz/W/O6coIIL6WDofpePschqT6KiI248YSt259AgSpz+bgxWrH4UP/SBSBypss2raAAVDicWZ4NHc94iLp2eQSRNLtagrhpXi+MhRiotsj7L4K2/Iu9bISr6edcxe8hzfUgkz6+Zys6qB7IMpYgsgHU3DHDJOSm61RNFWY0D//jNplmWt96REI558hGAxrrhg/oDn9SjXNt5pWwXXQj4qCFSw+od7Nl9dv5OFnyrRIzaRrJc2wNGD9sSVNrnNju81+lT04JcnkNg1vzL9LOuYJysdgNAu4JCQkavFu2i6ExRLlIn2plk3tzdRxrxqAEo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(38070700021)(10067099003)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A59CF308663FA442804A510E0FE3FDB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 YppjBz+A/zDnhKtPh4cNz+7I0/CJ31baoysOMZBt9rq0ttcB62VGqIa5g+Lt6zbYzWs7ueMbgJ4eo/jI1UHBReZ0kU2GTRkPzfGL81HtQdeIqTXKSOCiVEtQofixkvJIkozWlDZMZQ8uxjVZyCMieC9AB5Zh/aJJ8i2GhxG+Ys7H+SUzGtsskC7oIBE57mJlP7ChGHsobPotFexCxEzDWvEmwIiNSrY2Li4RM1/WIZbQ+ULqYbcV+PcNoEYEaeg6b3hSB/pDoC77HO6RB9kicFhKrQmHGcYx1bjaayK5g+QovmBQ40KNjX7/L1YSQjD0Ycm6dKG8C2O/3ZnM9najYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11279
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	542c1c3a-2fff-4d18-c7c7-08df0ebba752
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700016|14060799003|82310400026|376014|1800799024|23010399003|6133799003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	pwAx/oa2lpMPlq0OaS9FGaIKOpGi+tRhGJ0qqyk0ldzOpwjIodRXnkSp1cr+0PbM0N+512uNxy9hnLC5qUc8jd9LkRda01GtjRFhMN/qgVbSofKg85YPilSje2bs8rMyguOQ84l4oURXWELb0OJm6ZhmQEqF5IhZaffQiqhK84md4jFMD1qi/LWYLpY3PCzoxdYhGxDqw5FLbmO3/g8wKyq655DMYNJbuqIQj5nenWaFnws6zi6FPUWMkP+RtkGHgAP0OxqSFoKuz1558XOsGP8HZjWRmxDH+57l9FlA58HOxojG5TaDhozRBmF6Vs/Y0bUFbvzNDdvhq2FgUjPZHqZfeUpGHJ0SSFScYl6XJn7nFnnjrjsHhHWGERRB/z7RxhHb2Bzb5sfTXErgjVRuhXMBe2ZjFxZQtwiwY4NM1elWnS4Ob4N7NhVKD8DM9Dfqivpw7oguQLY+yvrtURfAdi0TXJV+/HKwzTGjOcwVFdrIAbk3z0+o8YsYTrRgZGvWk7P5bmz38RPXhbHRR3QclCxzMhRM2jc0iXTF2nyHv3ZtonmAr+hpobtWZ2EpyfIfOZGMDtjbyEfsYSDnCG8u9Ba/ii6FfeVk3JdqyPeKi5rLJc5CL4RwLqJih2X/BRRZRnUbQhFR7o5ET2uHZw6E3A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(82310400026)(376014)(1800799024)(23010399003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LeiZI/HYaPZNab3zMqvt4iKnId239zHJdAjtVxeSFOEnVN/6eUB7iMjCg7ECeNI1FPZxS2+8Oa+MOZ5xF9qXPiENANx3IEPCKteooReT5tOMx8SUVmUTh5ZmXtuggNwW3kAHyNjlL4TuhsquX0Zw/5jilABN4hK9+qsS5IMEsVNiSWc7ZmHrbD88xJjGxb2+gJ9b/OrkzMauiIkIrWrV7Tm5gbeT9ggnmHNAYtpanD5h0CdiwcfU7VKse1mK/EBnrvwyz8xyqPYiVYxCHuPYGfO+aVc92Z75CSItgx8+oGpC3yJAAQ23NRpI2tnVJt27WCvZE3Ec9MIHNNCXK7UM62QJgOYPECnweV1/qSTy9GOhjZ4OQJkOjeCTYv7XEOLm2uiiWxQ6Vp6wXfF8T4R3PFQgPYQ9VT93GjLyDU5SCum+gIQbdvuvnD2pnul8WAWG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:46:01.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8450b2b6-8e31-4a17-3b8b-08df0ebbbd8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6710
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245501

On 9 Sep 2026, at 18:37, Mathieu Dubois-Briand <mathieu.dubois-briand@bootl=
in.com> wrote:
>=20
> On Wed Sep 9, 2026 at 5:19 PM CEST, Ross Burton via lists.openembedded.or=
g wrote:
>> BitBake now vendors in tomli[1] for when the host Python is older than
>> 3.11 so doesn't have tomllib. Rewrite the pyproject.toml parsing from
>> regexs to tomllib.
>>=20
>> Also ensure that the functions in setuptools3 and setuptools_legacy are
>> identical, as they had diverged.
>>=20
>> [1] bitbake 69810e0c0a ("lib/bb/_vendor: resync to add tomli")
>>=20
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>=20
> Hi Ross,
>=20
> I've been getting some error on the autobuilder, event though I'm in
> sync on the bitbake side:
>=20
> ERROR: python3-semantic-version-native-2.10.0-r0 do_check_backend: Error =
executing a python function in exec_func_python() autogenerated:
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>     0001:
> *** 0002:do_check_backend(d)
>     0003:
> File: '/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembe=
dded-core/meta/classes-recipe/setuptools3.bbclass', lineno: 27, function: d=
o_check_backend
>     0023:
>     0024:    try:
>     0025:        import tomllib
>     0026:    except ImportError:
> *** 0027:        import bb._vendor_tomli as tomllib
>     0028:
>     0029:    filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.to=
ml")
>     0030:    if os.path.exists(filename):
>     0031:        with open(filename, "rb") as f:
> Exception: ModuleNotFoundError: No module named 'bb._vendor_tomli'
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4525
>=20
> Any clue about what might be wrong here?

Sigh, typo. v2 incoming.

Ross=

