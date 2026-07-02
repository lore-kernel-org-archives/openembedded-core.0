Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0CFC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:05:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68673.1782997501557608854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fGTEHnRk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fGTEHnRk;
 spf=pass (domain: arm.com, ip: 40.107.159.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EaZAhKnj3KPI8KaoHGtaGLTND9zOrfn7lKUPvO8tGTnhvDqBFHEp6c+GqJBxjo3AhaxTR5q9CFSPsV8NPas+P4WYl6+XjWYtNNWn6SGgvxlNuV1JXqCCLAUghPmYYtz72YSEJEC69ry2rt8+t2fUboBeVVFJLfE0UnNiITONpCT0pKHTg84WkwoRO7a9/aH/CEXndVLDTgOFI+WkMp5+EoBs0J7ASKYjDR/iAjVdJhAYidMg/K61ZV4CcUr0KOw+ENpoCLp0R/jamTwEK6xZiKEe7lqgY0r00LF57VAdpmbiVxflRCGOmuH/ZG4JOi0WlT7AgH/+Qs6PG8vQPgNHEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlRSAn3ZFfS8O4jv3dl8LIWl9FBpkCdzF5abOFQI9go=;
 b=Ll4OeU1GAbeeEviohCeMFB9cTepGVEkq6pa5Ja0c4DFZuPe3NBbWJ8H8N1WT2IvGdF275F9YGg4ypKORwUExeepSgQxxmIUBsJt6UEb1+gSXr4Yy3xLbCfKZj1yQO8IXyxGi7+qjiRYyVq6LNVo7ue4+OXwhkBbiG8fdqGxkrvekjniTCHVgmz3p817LjlcQo2ku4eRCrm9Jv6K2LK6aMfFjJy2ZyusQ+iZpGLIwAIZgdsPvMJ54AQa8Ji5BmTQh+HKdfNZgvJPi43Pb2t6l3/CMUQPsE7Zi/o0Cpwgh92mon30cNygsbobaVoYYcDvHffaUe9NXQCdojqZ4iXevDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlRSAn3ZFfS8O4jv3dl8LIWl9FBpkCdzF5abOFQI9go=;
 b=fGTEHnRkRiGhUaFToYNAI/HxkxITBuDUbfkv2VvrJgsgy1f4t6tKgEbTbYQg6VZxS7yobcVfCl6s0aeup1y+0komOsjo4FkOMsrAXvunYiojjbtyOs+IONWV1bbplQt9CxGZkdvmUFM+2Fq+hSQuo8YlxAWERCbO8oZPA4iUQIc=
Received: from DUZPR01CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::24) by AM8PR08MB5714.eurprd08.prod.outlook.com
 (2603:10a6:20b:1dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 13:04:55 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::4) by DUZPR01CA0099.outlook.office365.com
 (2603:10a6:10:4bb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 13:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 2 Jul 2026 13:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsESwUUvtCNyKiS5WQS+tAc6ts9hYTFXhpvgPJ87IAyJsiEBfhaJ2QJ6AuHv36zXHPJ/bkDhdZLlml+XaibFT9P7biJII+iPDq8GVEwCaAghVEWI6lgjG/l2HRp0tpctTVODJgsS3O7Ogg0SauBVKGycOxaFiQpJyl9SXz9oGqwXOysdzLvZy+GZ3Ul1nVOV2A968cVi514bGddp8c7ngl2gG8XtdXpdO//fV+5mqa5qV/dq8Fkug7TolFlo9muoGVLwobjEIRh/S08ecIngCaE7OcEClds9pAbZ68c23/MiaDPR+2QZ4T87YEMxKJHErhqnEEjwtLUiMfG2sC7f9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlRSAn3ZFfS8O4jv3dl8LIWl9FBpkCdzF5abOFQI9go=;
 b=yS0YmZodvzYL5l1CO4X572qLNVYI+lKp4bXKm0TDGb88Fc+oPyigIuezfKby6Lhli888znK3mZ4RRNdGbjSvG8ZZNZV27KNyL+X7XNXNkKW+4grVO4dJIr+j9Fe2S1cZIvgBiWVeCtsaW339FkoP5vRWT2rWLvmo8lttBo6w4tYDLCp2As5nQ2CMI3bMYaddMZr9Mc+LTJsWVqEMZrCpTIjgYsaw4F5uUAISXGbn84M0WHl3XHqOUcEaAYbu2RgZRGeB7kxEMYUh4cnNmneaJ8ESql146lAQkQ9xFt9pOhQspA6qv+a7K/gPh8nCGRjxrX887A/KEBJ1XCT6REynAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlRSAn3ZFfS8O4jv3dl8LIWl9FBpkCdzF5abOFQI9go=;
 b=fGTEHnRkRiGhUaFToYNAI/HxkxITBuDUbfkv2VvrJgsgy1f4t6tKgEbTbYQg6VZxS7yobcVfCl6s0aeup1y+0komOsjo4FkOMsrAXvunYiojjbtyOs+IONWV1bbplQt9CxGZkdvmUFM+2Fq+hSQuo8YlxAWERCbO8oZPA4iUQIc=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM9PR08MB5986.eurprd08.prod.outlook.com (2603:10a6:20b:281::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 13:03:52 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 13:03:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "anders.heimer@est.tech"
	<anders.heimer@est.tech>, "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "joerg.sommer@navimatix.de"
	<joerg.sommer@navimatix.de>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: add native hwdb generator for
 hosts without STATX_MNT_ID
Thread-Topic: [OE-core] [PATCH v2 3/3] systemd: add native hwdb generator for
 hosts without STATX_MNT_ID
Thread-Index: AQHdBT7meCGRwS0GHEer8Eq10Ve1N7ZaO+kA
Date: Thu, 2 Jul 2026 13:03:51 +0000
Message-ID: <D6CAA5E2-17E6-4893-A8DE-A99AC61DA48C@arm.com>
References: <20260626073812.769193-1-daniel.turull@ericsson.com>
 <20260626073812.769193-4-daniel.turull@ericsson.com>
In-Reply-To: <20260626073812.769193-4-daniel.turull@ericsson.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM9PR08MB5986:EE_|DU2PEPF00028D0A:EE_|AM8PR08MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: a117fb2d-9b0c-422b-acca-08ded83a82af
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|38070700021|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 lPHYgEGlkGbjrLSGuXUMSVmqMIdQShmdxiOXR9KE4zrfh0OQtUmPSErNU7YD20C2L0aMcelTx6IXB6KZvtDIy+ZmJzEK5ve2ErSH3VnjbgApjBi8rjTrO8VDYeuvCzcy/Szn1gfNWFpq5+/+W6AQDFuXlNHXzAb+QQsXU9vcAoFUKlycjE6DsFffoVsO+GVXq9SQOb7YHy9PyRFQjaMhfhpYXTc9+wAxjvU2U8JCeXCpUtz9TpYb/Xavq6l32hVv3+u6bK7T/g8Ylw8er8F5s9E+kG5HDmEx3aVKSrbtdskDR1Ml0CFEuE/SdqyONfMdBkboz2vijfqD9Y8sd7ENdLJw3R6d1pmjbVzZoUefUw7y/SsXswBrco1zu/20oxHcRajOghdGzSCvSwHvnJkMjWVRnn1tonfZuyHz1VMF8Oz6nHhvZ1AC6ZgK7r1VBugt3XtrFGKIBl8K3dF5aqQ2RGC1rKkIzWUD9YCeI/IDfA1QBHgkjxN7KJGjR4SxGUMyOtRT5fnVtg9aBn96Clafpf1o5QPs8nVuDs6ymKRW9LGiopCwYrWwgXfO9qBSMkrk3rryNMarJHYPZEt1ej1ig7kgCy4vesv7JHwnQlRlzVIp70Yrsbj5sgxrLGkcC+FRN4VqZUO4U1/kPc4DjllWCDCHrDDb2iO78ApKikk7i5KvdFKs8kybHmyzRZ4lr3kLSPcRpjAguKWNim1Zbf46zA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A75EED2C44F59345808E8A2E90953C60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 HUO2StnPKvE9uAZ+V+70VxNajIrSHZJJodX3nLU1Rgnz7/w+3w55umuiE8ochDUrHI35v+Tlei009cvSw+aI5lXSaviuMbLjeIVWpQjO6ZDgbs+m2aH0EqlfFm2tDITS0hHp73tCe6g0DpW731vwPg68wGpxn5B6MrLPz9rMGcW6KDSbZU0/Hf0euz+einrxc1eRW4wBsMMeIuwDeszeezjsyJgPTO5dpX7N6WkwWVNSYANn+ZNs41nTc3IbWUfcU6svw49iJXZkgzFeRJaT8lslwPWf14OMnoblC90l0Qnro3mKPXBBlX2E269TzR5m+gCDja+JQrNoLJqz2igrPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5986
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7533f6ce-7efb-4cda-3411-08ded83a5d01
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700016|1800799024|376014|82310400026|14060799003|23010399003|4143699003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	fDxkc5iXH17l6Fp8cU00vdDBQNMyoxn8ZCbHQAWdBoj2FqhQqSS7Bih1rNWK1WbnRmKTA0dJK8HPZQP3nWYjk6liCHRg8gjptrvycXldTBwXu+zFr4DjpRR/bW+PRnWmzAOZr26koiR+YpybA8626NWVRzcvN/Pa2n5Gu96BZnCw6uLtjCM1+rmdW1/Tn3o603wownVxwVHOr0rDVxNJZVwHsfX086VPOnkmkdtBfLvtxgwQwL56UbCjPLfsmFTiK/cNRF0HZfBH92CTSl8+LyJefDZUe/1MyRMS2RNwpf7cGb7pk9POGXOeFnKzluMgJmeeWEGLal8aHJwiPQV8hDVKm0EmYSbtUWrXxkvmVmv8PSPha42guPN22cVP56t7lZBUVU4jq0cgxQ3JjAEN8UM1HOTHtUB4/FyJ2FEEATN8b5Yvx566xfX+w9EYBKuXMu34yYbxXg9p++E/lEri4tyg0wZYKHi456Fx0knNT3VUENaOE0lJ8GCbIP+4i/4r7lVLwn6oYZow4pIfKIy1Gx9n+0gJ5wm7mutKOnhib0399HL1f9qD0aodMuTp/bPwDvM5LSiDP65uYUa9qDd17OiEtbWNez4XDMhVUPMk5IlUkPqR8mBmA2Eh3ciZVQQbz9P+mkORpYzRWCHanRKzTLzZZRmIotn0YkMCCIeKDGvQSgnoumGw/7xLYk8Z61Lz
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(1800799024)(376014)(82310400026)(14060799003)(23010399003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	19Rc4DmrO+8egJr2Z9g+lCWkcDpu0ZtXp6lXIDb00xbgzWS8N4Scjc+zW95dYAG8lWX5VZbLI0jvBSTg0bfsSV1gPYF1WtZF7uWzQ7cE7Vh0dRK0fPTgUtGidE5x/79bdkKSte4uaLZchyq8ipaeTNr8mO2PbbynWcVgWh172fR1nYAjWBO2bIU9OJJBvcQ1cQk1iZ+Bc3JBCRFqjap4Ow+R+fNR8e/iS1YUDaVz/ArVo+A75uUMiJIMFuvaJYeU+yPuwM60B4SoedIuxcs21+ZBDXi4HP/mhjuzig8+0ioMVnMbFNP6WAV1t7RfXPIvAhCqjrW+7hG1qIcA6OcqynvR7mjqXZl3ucrSmR9chP7Yl5hKGdeM+3MJZQdoiHiOPhyVX4e5FTXm9ATAlZqck7Ivg/YmIp5hDn5ladr7hVqvqhWDHU0+vvQxoVa9xdy+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 13:04:54.4459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a117fb2d-9b0c-422b-acca-08ded83a82af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240044



> On 26 Jun 2026, at 08:38, Daniel Turull via lists.openembedded.org <danie=
l.turull=3Dericsson.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-core/systemd/systemd-hwdb-native_261.bb
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: MIT
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
> +
> +SUMMARY =3D "Hardware database management tool from systemd"

Would it be better to merge these native recipes into one?  Something like =
systemd-tools-native, which builds both hwdb and systemctl.

Cheers,
Ross


