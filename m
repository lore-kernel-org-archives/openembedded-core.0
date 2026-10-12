Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E11CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 16:38:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17934.1791823112968676401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 09:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H2rVnUVb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H2rVnUVb;
 spf=pass (domain: arm.com, ip: 52.101.84.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OKwBYfq1exnSRGj88tSbQnPwFmxaT08+g4vImHhRCeUCiaclwHypca7XGC9hCy2O66qES4SlH//pbMlD0Jgfm55Enj2tZ3YsfURL6FsMy/fnkLDMUt8BkwUIQiFMml/L+pX540lfs+LQBq0i7T3cO+SzYuH98wXZZczVpb0H5NTkXajipQkIpra3dKbFxfEvqzVhaVyRvwwXOPfpgU7nUVkXH2gLHekYZOE/hpJ/fKYudfSSspJS9rkmUrVGXY5NgrK+ZvfyG58WZToS1NDDvFx2XG+pyn1MDKVDbN7OI2K5OuC5Nea5FRngr2E83yo5vyRI4f3Zf/MeINyPOBPxhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slhmPeXNGZMTRlIlKxn6Bb+Qg90Yer8iTH6agprkd4c=;
 b=YIHLVWbIKpNgimxLZ9cQTWy/x2GJnkJwcKtt+fvpQVaI/ZDjAAqHqWEYdB5ldFlW9miShT4NeItQZ5kgI8NB9tdENITQI6sTiz4gtoZGC2FewQFj6OZ7nCCz+vKjgnZfFCKm645ul5l+k8nIdu4WETSFk4eqmW5zokH/Udb4Z8+eA8efND1q3bB4HYv1NORI3QkUjEJO1KJm3+X6hG8eLBZQlzHnT9WGw3NPolXbEg+45T55hC97YhphtX/o7dOraw/wMw1WWhYCIaSl3eIVyE35FpJyPv/vZgmpgrtnH656XKMHTRWhd3T5uI27z6iuI6eeNgsTzN5jKR+YqJOBQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=geanix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slhmPeXNGZMTRlIlKxn6Bb+Qg90Yer8iTH6agprkd4c=;
 b=H2rVnUVbJx+5+oAHDVwCt18GaLsvmiQDaVTcK8d21ZbEU3CPTvTd6vdjeHRYreYsqv+SX8mUC0q6GKPLBSmDzBrWIP+mxsArE4T9nZHt7yZc39C7yGkCK5mOplOBBs0e/31MXLduxlp3mzxnSJqe+P7zlgg+MCxe2Dc2LbAgnBM=
Received: from AS4P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::14)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.5; Mon, 12 Oct
 2026 16:38:27 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::71) by AS4P195CA0005.outlook.office365.com
 (2603:10a6:20b:5e2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 16:38:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 12 Oct 2026 16:38:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK3MGeqqPFpumD0LJJtFuz2Xxyijmgj/PMoQrh+RAHm9zBwAhIf+Vy5HoY57aMne6shZGLp8BKthTTdCp73FOLLwh4XnLNOJyjT4Z54Hi410SK6PMR2WivQ9md/b5KdPgI5jGfkEPB9fFEDi7qq9APM/vK3CKt59FLIoL84hKmQswwxEZxL3GpBCclBJmWeKePQ+tS3FHC/RyTDyR2Y3+qaryHsUm9xz0nNgLWWU8mOu9kLMZMcROlgBx3kaZq4P6f4qQ5TJ9Nd6t4nII9wnWH4pp7G8DcujFLrYZR6USMaC5r+QjEBXtqpxKcrQgCmFfND4VqlcOYOoW6bf4vVWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slhmPeXNGZMTRlIlKxn6Bb+Qg90Yer8iTH6agprkd4c=;
 b=aWp9rf1A7A84xkKAEWe25WgVV/BjUy4JjAF6zy+mZp+42fkaK6qwrBUUTNlw2MWTQFoh9x7xr94lm6TRObl3g08iR0EvpROWF/gARG3/T0KzkSsbmknPIYoQFVt5yjziIQlAPKZbHmKAncfPp6tafw/HB0YHXmPaIvinrCeUtTm1l9i+owvCD0UyKHM/gzW5RsbuQ8/9ONfUHgLxSHiF1iA5P4C8MuCwjzrDQl7CRGx9StEmx+f9/R0z15yX2rZjkV6eO5kfFZppqAC03rQYb05QXyN2vEGWguSfHhTnGdwL8LVu8BX/y4fqwaufUN2HL+1w4R8Ky2Os0i2Y++ACTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slhmPeXNGZMTRlIlKxn6Bb+Qg90Yer8iTH6agprkd4c=;
 b=H2rVnUVbJx+5+oAHDVwCt18GaLsvmiQDaVTcK8d21ZbEU3CPTvTd6vdjeHRYreYsqv+SX8mUC0q6GKPLBSmDzBrWIP+mxsArE4T9nZHt7yZc39C7yGkCK5mOplOBBs0e/31MXLduxlp3mzxnSJqe+P7zlgg+MCxe2Dc2LbAgnBM=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DB9PR08MB8340.eurprd08.prod.outlook.com (2603:10a6:10:3db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Mon, 12 Oct
 2026 16:37:54 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0522.009; Mon, 12 Oct 2026
 16:37:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "martin@geanix.com" <martin@geanix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: merge group members from /etc/group
 and nss-systemd
Thread-Topic: [OE-core] [PATCH] systemd: merge group members from /etc/group
 and nss-systemd
Thread-Index: AQHdVx3wlkMq0sERvEGt04cTcGYcqbb6IcaA
Date: Mon, 12 Oct 2026 16:37:54 +0000
Message-ID: <1462F035-8188-4C35-AC07-90DCDADDF53F@arm.com>
References: <20261008120926.541493-1-martin@geanix.com>
In-Reply-To: <20261008120926.541493-1-martin@geanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|DB9PR08MB8340:EE_|AMS1EPF0000008D:EE_|AM7PR08MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: 420a6b14-1350-46b4-cd60-08df287f3d81
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|38070700021|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 srsGHpING0uqJmzE702VuRIjLLHCqU1js+g4ATNiQnpS0ZoCbn3WMWUgzmxxZyWpHebvFcHfClijM8kfvNFDXHHkgcMpCUuk9dFqdBXNuQab0+ZAYsYeMk3aJDY2D0S4T5wtHdkkCxI9u7fJpo1yzAhLI8NEbsOybmBEGxUXO0nTk5zGeK19Bis25u7dYoqQslxO/bxENUDwvzUWcSd/g2XsROrnoGTtz3WKvBiq+V5MIWpLY/nm8DA/E8E/bOcms44PV1e+ynT8xlOX28qpYRVtX4UmiPggYR6sVN29CSQ4te4FMEqVfSTbhnF7k4oKvVx1P7b3u8cCb1eqtx8yrfEz9NeqLm5OZAtv7r5r9lpi1+PnUPGnHZGuseZyXHh4tpIVdqMOjerytOexrpMWpe0XNavso3WCbji+B5G2SViRyij4M5XIVIxZXmIctFYCICdNQZYzbeTw7v2iCIAb0v8O/hQTf7DCFuibvLxDQAKm6Mhtv7yqzCgjbfHVz4qOR+GVPB4W3wM+mR5aVxCS1k/A07jJunljwVl0VeYkmeKIPwkS9SZcaX0hU9qIwzy8GJduTDt3OsMDpkVXoD54wDdbSInJlP7XrO00d7kGhKoh/Eja25zsjKlJPrKenIKXGUlF+VoztsfGjWaO+fnZcNyae8ABggBNfKPewQKb3oQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(38070700021)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F35A30AE442A54E9C494FB6E75DD445@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 WFWPYrThRYrdPyHdFbXvu64TpRa//FymzXIkgQNT1IYP0lZf2duiEFk1nUsO/G7X2cQ/ZUKmXxsk54RBy84fPS4d1iWPsFm6MvCBXUmf66FDjAgD2xH14uKsKan7eztdDGXedDVjWSsjwF9r0kT/OynK1xdeQdH8GiQRkksZCn47cIWHGIvvhoOAJOL+pfxI8nVrvoz1tutJxS7qjXfL5rXmOi52CreFaNrPwaAtJPUEzS6ZhDmvOpfubrxSgMyHsIdZoYaOdBj7oLLM5YtI9sa8A4kOe6srf9pdwYRvpltfrJgtrcqveunGKfS2biP9XIB69JiO6Jl0F4a5/GOTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8340
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cd1a9d62-603f-402f-2c86-08df287f2a64
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|23010399003|36860700016|14060799003|376014|1800799024|22082099003|10067099003|18002099003|13003099007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9xs7crxn3Xprt0U5WGEgE9YOXMgvhG2SH3Jyu6M9yWqFaIcTTuf7EuZoonZy2JZicfZQCahX3JCeBGjunSqASTb5Ze/ojO17+NZAZZRjqYZrV09VkiI+wqW5UGxSm9mxgvTsUhrZGvKZWne2SjwS5DvdHyuzY8uduuz9t0nYKyp3SCdooyOT8LbFSq2RZCJ+5xgeIp53b94g37Ow5k2IicX4xU0C5Nmw1qmkxiProxgzhraO0um30AvZt42Fe2nqHRCuSlG/3yCVhk/aJikUWodBSDZCCxwv3LAJNqWSbBYL1BC3KaOKy3vig32+pKjlJgXjZAMhHXiW/SOWC8S+EjHfwKw9gRvGpNaw2aOgP8o6U5S1QeUvMrGnZccIGivNZQtvPws7LlKTYFCH1p5D6YhQHlDlx5H9XICfJ0QYiFOhH/vUimsG1XPK8eLzSkega7ydkD5wBMQZaGRxsApTGnT238XTNUTZgwhRxb5NlED6lxt83JoKKSkIPKxUTi3IDrdLMLDk42jmCTBskTC7o2pMZBFNL0F3l/dOCzr2ftNiKp3+F0WC1xeRvruTNaRrkc/TjOS3PKRhosOYd2714MUeL5CX2it9F9bQLpq3MimfksoMlsWNxINplDLBZDrmZMJt7hKh5/O/rEYouPLwb1nM58zz6qGFbuXXsSLjF7w=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(23010399003)(36860700016)(14060799003)(376014)(1800799024)(22082099003)(10067099003)(18002099003)(13003099007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9YgMSAA+0M1i+fW/7SRLTroJU9yctRmbJjvYuKIIFPOz24w85j0Kdb+b1nX9f+NereEAr0+0Y96lpznxe0K0dwXZX7yeUEAZx0m6/9EumM3QUiVUIK0QnmMvsz+5FduzEv+YDPXTeXkPDnZUF2vv38Ak9Pqh8C4JrycjubfU+wv0znMubFi8uwIhGyMZIfEcJAoNZTy6AF99Di9B7wW4voi0Q24TVfEzEFtLzzhQNYTzG83byglJQ7GTPLpPb+oOntrO0V3ExZydbkHNgMkbRCjBnIYbsU2Xfez4JAB87Fggd9wWdkNPj1qhJtTUVBvrvcW8m0Z5cMI3H3F6LI8J51X+mz3RjBJ29ack3RtbkrhHYuHBV6y/SycjR3JrzLkpdz5XzE55byrkfelDiFpkNLeWycANqdZgd6t4I5ZGmdJveRGaLrrp7+Z4odzK47tZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 16:38:26.7386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420a6b14-1350-46b4-cd60-08df287f3d81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 16:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247671

On 8 Oct 2026, at 13:09, Martin Hundeb?ll via lists.openembedded.org <marti=
n=3Dgeanix.com@lists.openembedded.org> wrote:
>=20
> When systemd is configured with userdb and nss integration, it provides
> group memberships in **addition** to those recorded in /etc/group. For
> those additional memberships to be considered by nss, the group database
> must be configured to merge the result from both /etc/group and the
> systemd nss plugin.

As this is changing quite sensitive files, can you add a reference to the d=
ocumentation to justify this change?

https://www.freedesktop.org/software/systemd/man/latest/nss-systemd.html

Cheers,
Ross=

