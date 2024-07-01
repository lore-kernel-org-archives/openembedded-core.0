Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DE5C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 10:04:54 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.16367.1719828286443983296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 03:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cwRS1IxJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cwRS1IxJ;
 spf=pass (domain: arm.com, ip: 40.107.247.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NYwt+65DA8uMYPn8o26ebG7rzCPir66LPqIJ1mMN4MPETKUc8b1aFZHR6FKkdjpL6xVpSYbPMLifwmzSfi+bwBj5wXMnZ5go9jXCSpLhzGdv0K1/HJZg1Ps4e4cdJHiFXeBY5y1wEVHsN65gRAdAXJEGY757uOKMRHkirQvcx+CEc5nS91kqUDixBmyTh9SCcK0zpNKUn2leopxXVKcRDvUBtdECS+iKsKWqaguqz+zuo2tzhTIju3fauSYpG8NuvOXBbXdZvDebdoqciRqtAlbafdpXwffC6DRSqj+luKVACHnl43E+1F+nd+EQwr+9vkc6x06s2XipXTWWe4pn0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFEbiiSxdMAmv5eM0j2XkVulmFuvq1NlexCHGc9kL3w=;
 b=P2CZKCtW7+1ClX3CTyoOezdj0QrwRbM2q0Su2JQDypWvLqOBipArU+sImfYKBtpWo+c+yUnyPvPj2vpOsWMyfmSoumsufKs2987Xsj+l0M4Tfj5QCX8iq8wuGKJGiVrc4QCct011f6wWX6C2ku0xPsM9SLY+gaWkts8R+02/LVqaQ0O0pNJFvRkcrmJ+m+ozNPzJqohbjsLWFmh21JK5YQlMDCs2SGVNUHeGkH3Rm6PLAOS9RZyuEPlJNDhipkMbqJ4/PwRBVyfOqL0Ece/cV/YNANz5Af0aKA+HowIK14FvRfHVzifXuTQiU/2rsvA8jJfmLhl5BfdcxGIsTmFVlA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFEbiiSxdMAmv5eM0j2XkVulmFuvq1NlexCHGc9kL3w=;
 b=cwRS1IxJETnWIpDlEw1VfMa/frd7t4ih+de/0NWCZa1u7MIJwF6mYhyeF2W1zvcNH/AHPZAjmxHJEhAbQPJeH6hBQX9uTqEuKqYK/ZA5hsuIHKFOoTexGPt9uwAYpLVhlfxv9dW1hPMxF9MiNOQGSSdbc0JCrOdm/vo7hj99n2o=
Received: from DB9PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:10:1da::34)
 by PAWPR08MB9805.eurprd08.prod.outlook.com (2603:10a6:102:2e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 10:04:43 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::74) by DB9PR05CA0029.outlook.office365.com
 (2603:10a6:10:1da::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Mon, 1 Jul 2024 10:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 1 Jul 2024 10:04:42 +0000
Received: ("Tessian outbound 74e6406985af:v357"); Mon, 01 Jul 2024 10:04:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: df5b9508b3ad3491
X-CR-MTA-TID: 64aa7808
Received: from dc3eefbac40a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 52057006-0CC4-44FD-875A-945C013FCFF0.1;
	Mon, 01 Jul 2024 10:04:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc3eefbac40a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 01 Jul 2024 10:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1xzr9YhI//FvcnpxRPoDQWLk4r9u4dgYKZp/i/XbVNRuRjVa3m33zNGTXBA4+Wh2e7UHkdNp3NbiuentwBIU6tAAEXZuYb0sNYcS3T0kRgZG707mC4YlMFJiw9M4XzSkIS8YYoofTJ6E6zpza7iNWOb+PA0akkgwCinC9n8FCHfn+O/Z6/FLfQHEc69KPW2FcRHWfia20NbkMopkFOghMzKUpEOkUKiROTZAkj212mqRQCH+iApvhbppledACM/tsA3sGga3pM/sYRlIigQRmW6MFONbNufX7xlIWuDCvFbquV4mHNXjZBsAxdkFP2J5Q8VJoQ3Atp/hQx7P/3I9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFEbiiSxdMAmv5eM0j2XkVulmFuvq1NlexCHGc9kL3w=;
 b=SNyB9AJpYuidIbkT3dLnGWDlY1WcXAVFk/npYOA+be5SeBBb8VN2yz41ykI0jcydxQv2ZvZbA/D+JcDXrUVhvOdCu7ZPDgrib3RU2e7MdxLTudRUvymCXhbrQ9DSs7GdZZ89kfHxjx7TLaw1xRExqTv0RxYY+eqmIcSgq9YQ24pFp2mO/iIJg8Uye9Tpk2rqNWrSjIQM2d4jn5r9P8SvaN5NQwnzuNHcAeqcwcZfgOR2Rm/GoO8171fVStVtNkSKbbr0oT4Vv7zsKsGuYlJvNbVZjhVWjz7k9rlQvkdR+1F6oTE2sKm3fh0nFg9/Yez4ddoB5UTn8QGYP0SnA7ZJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFEbiiSxdMAmv5eM0j2XkVulmFuvq1NlexCHGc9kL3w=;
 b=cwRS1IxJETnWIpDlEw1VfMa/frd7t4ih+de/0NWCZa1u7MIJwF6mYhyeF2W1zvcNH/AHPZAjmxHJEhAbQPJeH6hBQX9uTqEuKqYK/ZA5hsuIHKFOoTexGPt9uwAYpLVhlfxv9dW1hPMxF9MiNOQGSSdbc0JCrOdm/vo7hj99n2o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8255.eurprd08.prod.outlook.com (2603:10a6:10:411::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 10:04:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.038; Mon, 1 Jul 2024
 10:04:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] librsvg: don't try to run target code at
 build time
Thread-Topic: [OE-core] [PATCH 1/2] librsvg: don't try to run target code at
 build time
Thread-Index: AQHayLbF9B7jGnJH/0OjwPrH7dA9tLHhlosAgAAUHYA=
Date: Mon, 1 Jul 2024 10:04:32 +0000
Message-ID: <ACEDDB40-9232-4E05-8344-56B7F6E39683@arm.com>
References: <20240627172322.1600152-1-ross.burton@arm.com>
 <42643948-fd67-4001-999e-623d37ce309f@cherry.de>
In-Reply-To: <42643948-fd67-4001-999e-623d37ce309f@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8255:EE_|DU2PEPF00028D0F:EE_|PAWPR08MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: c752417d-e496-4fbf-56f3-08dc99b53a44
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?qFTbujE0UiJvgS6xpce6zLk6t6i3tKVNak7UyItummh3SlbRWXowL1XjZFFS?=
 =?us-ascii?Q?up+RBL5c32uTf0+GYMvhmDg6MBD1vxDnSVkubh1Y8kAVj9dqZDudV0o+4jow?=
 =?us-ascii?Q?HdO26dcCV6EGGuwYrXzpnL7o4sTJf3aBQ/bIIIOuV/UKUKZNZU9J41bnhQDB?=
 =?us-ascii?Q?KQXodi5IiSrGb2Gt5Euz/Wtka4hWh+33PTlT/Lq/7R8CCtpWYo6A0tSIot/a?=
 =?us-ascii?Q?dK5P8PKJQVMTkJRLNAKZCv3dDACKkmTMDg4ns7pP9DgNqoZDwDvvEge/od3H?=
 =?us-ascii?Q?XyjjfSv2UNtz8TSK1fAtxRzXPqLuv6jV29ACKIprw73CUHlSJSBKm+whYNQH?=
 =?us-ascii?Q?oOu+lhPzvKi/nps7XgDgjaKeQrAxKJJy2l4s+//PYsNftE2D5axBYMS0nnvH?=
 =?us-ascii?Q?eBhxVy5LVUyV254q0B8NlIwdgSInOPHUpUWhBqbl6dTBxH/ExymQblOceaEd?=
 =?us-ascii?Q?3w2+F022tOPs+xBSPrK8zRaEecXV5dqeDFvhI0TlkryNCiUnstbBE9BGYG+c?=
 =?us-ascii?Q?JFwk2kbUYhUNyDdkkEiCuSaxRObTdiRZlw70MyoAYqE4Itib0vI28hsk5QGL?=
 =?us-ascii?Q?+gOwiuFkAGU36hyjHPKAITBmVCTgk7hvZC+tdq0sw+hZ0Xkh0mkckKcoHpkB?=
 =?us-ascii?Q?mwCirMYF6oA/XUKQyWfu/6khoeq9MuULceAg9VlNV2H2ZW0ull/3sZMpgSvy?=
 =?us-ascii?Q?ZKHJ1Rp3H4rwdgeolOzWfHwmMOD134VuNPMjrEW3JrTysXV+EgfEeVuZOgCk?=
 =?us-ascii?Q?1ZvwHtdcmZR4VLiY//6h6CG9/mHGfCkELBMgIe4GD2EfMH6ZwwC2jppcrKFb?=
 =?us-ascii?Q?6eJcUwhIvZqOTHLoVrzZ3XK3ORnIl+pnfhtvVrFQWwRgaJ4SmUiJ5bqCNR7G?=
 =?us-ascii?Q?XCrbhxV550WTPQfytkp2QzsUB9+tq06NSrZp91r1opTBOTS2Jqfn6aSf79Xr?=
 =?us-ascii?Q?dkbfQC+HUnAgoi66DXU8V06q3qHKynD6EHWbUyyg/JvMco18ufp0ylTdYYHa?=
 =?us-ascii?Q?vNBLOvhWF8ER6wB6ELmmnzhA9DFdb8QjBaxHfty86qRo/8K07ymQ7vM21Ejt?=
 =?us-ascii?Q?kjoTM644lisc3omow4vgxSBPg3dMMwB92XszKc4QbXbHloWhigULtot+w/vn?=
 =?us-ascii?Q?6G2rPDVI/+FPdMPocrjQC7Ym8Iz+Cm+Owar70E3pKWqC9pgJmVORheeBubd6?=
 =?us-ascii?Q?S2Hj+O0b0TdFt3+5++KSVvlP6c/HacgznMhjDoZk6IwgeDKVt9+X8WAxJ0Nw?=
 =?us-ascii?Q?GB0lS5DUIwR+F1AUd7pNAgHi9c52I0tGXqwyoqwsIpQaT1OK1uhEM5ZZRaUQ?=
 =?us-ascii?Q?11QkS7FPcDBOxYIdLIKFG3Rb9OxgrqhhMSggsR5KwSMieyWs9gwYP+c/U+nQ?=
 =?us-ascii?Q?R6f6Us6siyXzxk2kZ+r4xpBQjT1N7q+4xXr+vCh+eZc820nJew=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA89528E3EBC734E8D34D997B0BD7CE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8255
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94762980-b227-4623-785d-08dc99b53407
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CMr7+8X75Y+2z/4oyZx+fqKuawtYZ6MIKrRN/jauDkPUlMNmRXZSI18PKo3B?=
 =?us-ascii?Q?Esowf0lv8vQfmciu/3OtwtIQAUyX3GKW6/33urAzTTFtPkcO9DgUDDbjFntE?=
 =?us-ascii?Q?XiRS2r2W2PxVutkpHt2dQ/cEkgq0eiUAI3ghk006Bs7Rc8h7+nCg28L65gvw?=
 =?us-ascii?Q?VErhtOvjISMNmQuPMVuu8Xmf1WsOjLdJVavaVCxd2W69ylZi8dypSAoscoE5?=
 =?us-ascii?Q?kc9qDwTFDS6Y5pCqtuP3hYnm80czmOJ6JJ6i/TsKNIXELwYvfFX9lTWhHo/6?=
 =?us-ascii?Q?r5jpHJ88WLnYBQQHFL5kCMgE9Z6hW1AJV3sabUQwulJlUYPMKG3UgWdwiUX8?=
 =?us-ascii?Q?U5JuuSQYWoJylxD1oNIIBonl+pYSG3X/CKNVfR59guwuhjWCMUt6p+d0NTK8?=
 =?us-ascii?Q?laDSksSzLXPH5bSJAvnkkbIwuIT98Rk25Hh6NFUkl51hWyA+4l/bcZ4BSLop?=
 =?us-ascii?Q?tQt2Ne8TgT8annzh1q1edHZms/6oc4KhqJ8Kf4gJGrKg076yllbRzOjMtVEr?=
 =?us-ascii?Q?JySNIdy5ZT+nASP9Zdhr2Oqan0mTuOGLiJAtCgbgsQMPJQfFkM6hXX3XmlaS?=
 =?us-ascii?Q?rvHKU7Fq3yiFbbj4+l9GsIdIYvzE+W73UvRnnIBgEtIkME8+hiYwCCxIIH7q?=
 =?us-ascii?Q?IQnM+qqSMoAlblyzipKw+HtLW+fL5P7MNBjn8caw3EXHJI1UNOLwszorZx72?=
 =?us-ascii?Q?77gFQ+2OHCguovTmDn0KDdyUPPajO14hfUZhpAEFiSrenL2li8WfaKLJKthg?=
 =?us-ascii?Q?M93WGvy9ekr6V4Da7ARQvIKh9+7zi23Yk7RGx5OoghY1qIGvwMkCF5xi5HOw?=
 =?us-ascii?Q?VDLzeTHqaA/yqEXxqsJcYaMguqGP/1y938ZvNsYbejo4zz9rsNuaxaC6glXi?=
 =?us-ascii?Q?euymboIjWOwgRnjsCbNUGFwgiDSSC7BzpECXQr1/HTf2Z8BoVBPjrJdyootn?=
 =?us-ascii?Q?beJ84YR6SGMboZTngiIA8IXoNvdvYzRtOOBdL5EeLtegGqivVK6g+teg6YZm?=
 =?us-ascii?Q?PUfZABbsxaOJmjvfuw5Ks1/tFDFxfO2Rf1ED8w5a3RwvP1aVeGyjBz27bSYf?=
 =?us-ascii?Q?6iIWpsutwPM8iqQeFp6AnJUh9iMuOTUNf9VWgQsmzSTZ2vPupxUBC5SRGz2m?=
 =?us-ascii?Q?QMa3OuYaxNizpAULzgMLt90BKrKLF2xIcUfEeSfPeg+IzbUo2IgplT0a2wx7?=
 =?us-ascii?Q?GbGUWWxcdGTJpjCiDhudZt6aSgsrlRJs8gIsGko/aRF53n68AVFKXebPPiFd?=
 =?us-ascii?Q?a17m3LZAEZz2dxDhwUmT3v6hqqF4+wivTlimxi3IYUsbYcggW9bWxc0n4DwK?=
 =?us-ascii?Q?nsIMO+zTGGG98pbwZiyZNtHmaLVKECxpPu2EEz+l6YEQfJypvffJ/VuBj/BQ?=
 =?us-ascii?Q?Y808jzQphpfypZ9KHZDeTXsuVvzOMF7/HtViBKZOxg8ymTsyxkGD421s7iUj?=
 =?us-ascii?Q?FT9kr5XOb5+dda8GSU+sXHxfHIbmR+Mk?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 10:04:42.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c752417d-e496-4fbf-56f3-08dc99b53a44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 10:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201299

On 1 Jul 2024, at 09:52, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>=20
> Hi Ross,
>=20
> On 6/27/24 7:23 PM, Ross Burton via lists.openembedded.org wrote:
>> The rsvg-loader test binary isn't installed but building it causes a mix
>> of build host and target code to be executed.  As we don't install the
>> test, don't build it.
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  .../librsvg/disable-rsvg-loader-test.patch    | 40 +++++++++++++++++++
>>  meta/recipes-gnome/librsvg/librsvg_2.57.1.bb  |  1 +
>>  2 files changed, 41 insertions(+)
>>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/disable-rsvg-load=
er-test.patch
>> diff --git a/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test=
.patch b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
>> new file mode 100644
>> index 00000000000..e56772a7e2f
>> --- /dev/null
>> +++ b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
>> @@ -0,0 +1,40 @@
>> +From df94cfa4a637c229fef32c349b5c2dfee2dca3fc Mon Sep 17 00:00:00 2001
>> +From: Ross Burton <ross.burton@arm.com>
>> +Date: Thu, 27 Jun 2024 17:09:11 +0100
>> +Subject: [PATCH] Don't build rsvg-loader in cross builds
>> +
>> +This binary is a non-installed test binary that isn't any use in cross =
builds, and
>> +causes problems because it generates a gdk-pixbuf loader cache at build=
 time using
>> +a mix of host and target libraries.
>> +
>> +As we don't install the binary, we can just not build it.
>> +
>> +Upstream-Status: Inappropriate [upstream has moved to Meson]
>=20
> Will we have the same issue once we bump librsvg to a version that uses M=
eson? If yes, it would be a good opportunity to fix it now in Meson too so =
that we can benefit from the moment we migrate to the Meson-able release?

I shall let you know when the upgrade to the Meson release is done :)

Ross=

