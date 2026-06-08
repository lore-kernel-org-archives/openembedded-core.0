Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96CCCD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:49:40 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56450.1780930173012909979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h7ng6qEe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h7ng6qEe;
 spf=pass (domain: arm.com, ip: 52.101.66.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zBarMTR2jegNLePJXri/9TeTlyG7DgvGvt4DOMe4fPui0HijOCMz88IrZMi0qIacmqyL4vIkdU1E8Xt6lndBMDkiRcJ8ILmVgbyYcvieEwHuDV32LVBWSSDESbfdoVBHxYtsg7HMlrU/j7eRDZnJOLXONR0RhwrhlPoXpPJISYulPujtcKYaJYDSMHTh/EVCyyNzmYdtdZozsxilR1WKtP1FxWmO3ZL6N5uCRe5+UpiGOWbqjDW9CyaPJHhC5v4JJ6IWU9Bjh1z4uPpUuOAya/Uk8GN6heAZ0VOzVHmb9PPmA0Ykga5dzHj5pdzLkIW1LyMD33X9g2tTvY1iduVn0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRmZhdocUYb36lojsD6vyaJXCkvUr9Q3C35xIwmB2Rc=;
 b=lvJXmkX1R+WW/dpbkDNXnc4/FxY8/7NikLZt/oMvj6e0Ts/weWe6o69qVLBbAEoyyT2Kq3GCCDgY/0T34infFNqrNd7hEu+RR+UpLXydIwHGDpbHkaSfoLhz2fhfaelWvhwwlnvsc5qvGaNThyemimcuOMO9wD8V7zHhbgvk6kfL1eP92xz/saKOppShk6rYy93uWF7r3j6EmcLUpPzmBrDDKOGjv+1Z3Wbin7w2nO9FMIyYez5gM4CgdDTgOK4JTwj7wV5ah5F+T3G5Lzu6b1OwjJKwzCbtC44PIpE2TkwIVf/vK/WW6zL6aANY5BDJ6BDwLz1M+yw0JSI3JeQ5Hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRmZhdocUYb36lojsD6vyaJXCkvUr9Q3C35xIwmB2Rc=;
 b=h7ng6qEeCnJqwZuvuym2gB6ltYWiJeYUpL5rUTvG+81B4ejvo2aAQFvmqb0l1PLkdBfP7KeN3fd0zsU/p/RTw9ASt/Le1bTkt18ZhrQg7XWyretO3zaU2rXXkqUq4SD7dyfQIgG5Tlc2QMxA1jX4axUIeGqMXTIzhB8aLTvmjvY=
Received: from CWLP123CA0130.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::22)
 by PAXPR08MB6607.eurprd08.prod.outlook.com (2603:10a6:102:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 14:49:29 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:401:87:cafe::ce) by CWLP123CA0130.outlook.office365.com
 (2603:10a6:401:87::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Mon, 8
 Jun 2026 14:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 14:49:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwmwWfwhWsHZRUB1UR/qCMDt9GylOOAMhepRg5oh7n2ygG8ReqHvm5pv7q4M7WUjOFOQzW5BzSk3nv4w50lLrhMUONEpp0VZ9OhScBKaRiEwFxHiS4MzbiRRgI8Ko5PGs+9wAIBvVtvjk1H9Zt/Q5SGqnJDgB4fmYHH7wWHP73DCfZQf+Lng6Hw84TOu37x1wNVtpc89LxvVyouhh1ubn2iYa4WhhDWmGUGSraki9yO6/ckqV8AFC8EDTJDg57kdYbdsbgzGyz98EJvCKbsTNrSlNmPtnXWKLoXZh7/aaMhDsD1Rul5IOyQkQ+NuoADhS3MJchRK+zG2BUmtTlh11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRmZhdocUYb36lojsD6vyaJXCkvUr9Q3C35xIwmB2Rc=;
 b=gBPMkSW0t0aA4LjipXY0YoJxH4bT1I6T8fMSgsVoUjomoTZEbwF8nBnpmjXA32DttnpvuxLWELkqq6hPynSSb+fUTLOeuloLnEPD+O0IPs54xFQW0ddGY5BO2I3AUJcqgUJOUqSsSOLBW/jFHdqRb0s6tS8G3CeMLt/ybBNfTzzIz+WEzvxGJt+U6KH9VzAfNvdpUDlLPNRUixEH7MXrvFI+w6aEFp9bo03XM1n5eUGJr+7HVXiSdg6BwIvC4NIskiBnlacE/QG3Hy1g0sGfPAN/3c1hj/TfPWwq/2wJFa8IoqcBQoJdc0hVLTUd0owc/EeRGQFHd8KqLq7VXJWerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRmZhdocUYb36lojsD6vyaJXCkvUr9Q3C35xIwmB2Rc=;
 b=h7ng6qEeCnJqwZuvuym2gB6ltYWiJeYUpL5rUTvG+81B4ejvo2aAQFvmqb0l1PLkdBfP7KeN3fd0zsU/p/RTw9ASt/Le1bTkt18ZhrQg7XWyretO3zaU2rXXkqUq4SD7dyfQIgG5Tlc2QMxA1jX4axUIeGqMXTIzhB8aLTvmjvY=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 14:48:26 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:48:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] liburcu: add ptest support
Thread-Topic: [OE-core][PATCH v1] liburcu: add ptest support
Thread-Index: AQHc3HxK+RrQpPlnTkC4do3ae/Wx1bY08rOA
Date: Mon, 8 Jun 2026 14:48:25 +0000
Message-ID: <C48E94AC-D3B5-4082-9430-06E4E1A93B08@arm.com>
References: <20260505104512.62425-1-pratik.farkase@est.tech>
In-Reply-To: <20260505104512.62425-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB8359:EE_|AMS0EPF000001A7:EE_|PAXPR08MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 54beaa85-9b63-4826-e11b-08dec56d2496
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 ErZE+KNDmAvwLgkr6U3VjjmWxiX66UHkYF7qft0ZqLXr6Z9lvWF83Vi/ZouZNMOqf8mVWPRtb15npK3R08VdfcjxUMH9vXppM9plHwr7hrmxz4ibS5mQ5gDBz7R0mw9t+Bt+XT+0sDioJ2wkVDu+Sc7iCTKvuVgv6fc5fWioQHP1cEXmzyy0bzM05mIXXbrrP1x5H5K2kRQMmC2DH+12ufBww9kJhYYpo8g8uN0wioCf+bZnfCMdBSDq9AkOJn0PZ1bfS8HoXOOui34LuZIQ59r5h6V8PJvZseHonGcCvwEY//EAIWOvydo+ZoEHQ2uyBw+F5E5W8I4Sg74UrBKl4RfD/Y6ttlWSTURMugSoo8NrZxOVZSVlwYJturlGZH6E5IMKtZK82wxWd09qSubdTiddmeDrJC1ybbIzIrT+2qvGfx5jdX4IMRjy+MwBJe/oeHwRw0zOa2xgIXPu8AePufGruq9NYE5qFpUs99s5G+YO1C/R8qnixYxtJ6XFzma7EinID2ExnDbsyOyHOHB/d9AUnEmLDz+sRCOTqXKUEDUxQvn7ecDKatey/t58leTFB1ogjKgMjfPr3yCvAOA2wyxlp0byzXm/hcsvb22BGl6++ujkyCOSwNT9fbSFHpkdXvK2csxHQf7UvpNAjuH8KMnm4ZZ4aLL+jdvL34gMiCFQ49h+j46mbIkCAilhWwzbR87RtLKHAvXqdqdrR/s5kpl8TA4/2De5KUuhFBhJ/ACEVey++iUHG5vHlKTqZsFy
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDE60001F5861F40B6623046B0E4C56B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hSH9b0Oyk25jgMSoIk3OeAlC3ntvcJAHRuwaZgzxO0G0ob6gBtdDYYqvXmU+kU2bZvlwx8IDEqzIclZ2aCnBO+uAdgJNpDpxibQbgqrex1pFulBOKON1SVX4FVa9ditF0rohHe/X2v2cLemwRXUtDwM6xrc8ByyWXojsewnU6y+txICNy2036KtZF3zm6ZZGWyM8qpKseda1owJeNUltDKWXrJtvhqpx140bE5L7d5tlMBFTV9ucMHJZs2I3rtZETyqlKLIXhcuZJYuuAbtN6XOwoPTJZpQAaWcuVeBcfsZvqouxcudjFsb9D32HLWyAR4BYRBfF+IMQCTx61v5aaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5d425c7e-27ae-4f1b-fece-08dec56cff14
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|376014|82310400026|35042699022|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	wX99sXFtEUgOUrK3QwxdPQ3Hz42Xqb6UlIcrFSxuF0HvyluYqL6bkN8RTbEmRlc8Mhm7FhZx+cC3F9Z35SD2CZ1fulRkxe7xtvDSTkzZGY2gVFSnl1C1zHceBnNvv3iQ3SPbNP1naCzhs6dFlfAkb0r/wEiC50UzqWQBijVQFGDb93p7cXBzTQHQuTA659rS9iWVi0ZzKsksH9BPjvikNpCG0RJQ0474hKCyLRUJwLPWImMciuVfAxDNjiG8U9l+iGzf+pDy6KwWtv6LZIe4Gbs+JjzloSG+8PhTLqXqFTS/12TTRdIJ6McztP98OYf0tFbt28AhabrS5Z5Wn+hCffPDFzuefBpbuU5aV1BBOA3qvz8XimRNa4z0rKGz5FcdtVrVuhMwfFgcehVeCoEkZ4r9RUSmjFBlLoFgzwAWZO99ZyuFW46J7SAVdRpwSoWFfmncum2QGA9LdFZoCcFFOEv5gexYwB7XiO/qPMGwEfhDhQ6yq/Z3dqCI/n7GeATpPrwbjXQ2T58o6vKY7q7NvdT6tp6IxsKU8iVKI3oQTP5eePKuQecUs0b5weO7mD0xwI/Fb2eAjn0E7Rf8mwQQjETAfXVb59/N6kLs8P/7s/tUsZhpKXro242s6JrUdbLBL0zsevcsguTtTYgAgddBHUcah+P3RktAqEQYLUdctzBxHgvKgmYgD16DvP8J156/1GYbPq5MyEZaPYTjmQz81uSRP+lH+3tQmyxYC4Rdu4s=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(376014)(82310400026)(35042699022)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SlR1922SWYiPGjr8zhaudwdRV04FqDx3f5NHSZ96cOWVcc45CkyhZVdijUiz4DGKsGQLj1+7/fGcZWhunYM78L4GQVEVV0ramsamvbZ4AL9dqDUYmWejPmXbVlTLu/RPw494ulL2WAzR1pDTK5ntpNeMHII/GKnknhn3wTLdy1yeiLBleEHYdd0KBrIGBLTmNhNbuE6M60nROwBUZBiVmxIjhGwIYr+yFWgs2I/e+59UXUw1boIIxT1pIZDhn7cFLfWxem37puvm0hmCppD2mTmzD3F2fuWlr5vPZwr7rdewJX7Hi0bY+5wwnTgXvEHF07/5GZPw5AjQykMJtqY4qW2EigRjLLAYa490IRqVDqdIsD89b9nfK1X59BH7ObpT60qkhkkUW2RtV60AalIqXZAALMiPsK3xsdLO/TRCU5E3iSWPJlAoCU8xSmrATTcW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:49:28.8261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54beaa85-9b63-4826-e11b-08dec56d2496
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6607
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238249

On 5 May 2026, at 11:45, Pratik Farkase via lists.openembedded.org <pratik.=
farkase=3Dest.tech@lists.openembedded.org> wrote:
> +    find ${B}/tests/unit -maxdepth 1 -type f -executable \
> +        ! -name "*.la" | while read -r t; do
> +        ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST_P=
ATH}/tests/unit/
> +    done

Feels like makefile-getvar would tidy this up. =20

Ross=

