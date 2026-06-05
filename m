Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289EBCD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 08:32:12 +0000 (UTC)
Received: from relay-p04-hz12.hornetsecurity.com (relay-p04-hz12.hornetsecurity.com [94.100.139.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3831.1780648327586518129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 01:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=D1YG7TbW;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.204, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate17-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.70.130, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=as8pr04cu009.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bHQWIvTEAEhlDcyg/4RGeLbISfaAuEPjTK3waaiylAg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1780648324;
 b=dkU3GBEA0zi+En+OfILtv3W+qkOO9x/FWXnCskFYvM88CCT2lHucwzyp83GJqO8OdbEdQi4L
 AebrPvWBe0awKxX2XdmPtBJUe64Y7AnK8S+cxCAW0KFQ6RcqAl+lVbydotdCebVkIWXqQKqFo71
 eoH6dXxFbohd/AKI7A9uLhYVKqXU5IxrpNXQoJR0rAP//myV/Fh+iYHSA8M+YThBnkuSCSb9FTP
 xAcPhZK8bm0r0aZCe7EvtCDKRze88oI+gGpMF9WlmEdHwbBZxGjofpdZP6A+VArw8cPFSyxdkAp
 TCXQg8qBSU9nDR4835z1G25DncV7i/BdVJu5TA0ExWVVw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1780648324;
 b=Ze9bZner58ZHfhtBP47HdLFSxlROXGXLsRw4E9p3tYigwT88cJvnYPWQQytZt6n5c1HXVxtR
 yPS5waiefbCfhHThsfHqAPyYBNr5czQnyB8IefoGoYyo9ye8SObPPNGNxjuxDIu6IEnOIv6tm7m
 At06qlS41iyTrI9hSCh7sY6UNfEaiARmANmkA1FUWyWhUzP54NOr8bHz7UIUeAmDgMTCShI7IYb
 cESjnp8aV9Z5cp7NGa0HD2q6EjneBLeTWNIQPVymJF3BzJjZmsT5yFNOwNVQO8LxrdLpZnyR/lc
 JnmL/F+hfHUj6nIatUSozkN8fyzfSZ7ZO0ewN163vN+Mw==
Received: from mail-westeuropeazon11021130.outbound.protection.outlook.com ([52.101.70.130]) by mx-gate17-hz12;
 Fri, 05 Jun 2026 10:32:04 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhpXlrFaNPL0ZD6ts9PamCQ81H3gy7OspM4zCBkkXL5gPwIf8egDoiaSNk6uVOXD3G9iPEZrt+UXbwyRz/dJKjybuWK1Hfe0qHB6yYi/LLmXtQunWxP1dCktRRTDD8JPcbmLAzp99euaWYv1x4Tlg3v5PLEshriIZ0FdoOsXgUqxCHmQ+lq3m55hciLNDdTG4hVqAsOSXeTMUDxtGd2MPORzCDGiO146c4LpNiEjH3+L633MdILxM1RB2b9SyuH4VsDeCS1bukNMmv4At2rnldKrCXvsrexMEU7Hpy8YnELr4TXvXJvcMIkmEvSYexWScJs2YTLLZA2qLoJ0bIzBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHQWIvTEAEhlDcyg/4RGeLbISfaAuEPjTK3waaiylAg=;
 b=e7CdyWgBtmVLTPArdI9Bs82xU+dIr9VdH5j79BUIT3gOv3GHtJRpIvN/s5t7A8gkQV7n0aXGKUV64bjwkl8RE7dRM7pny90e65cLXcFsmOOSM+6pWcmd/dtWb6oWlkqkeTsdLTpZ2IlpTdnkfalKx1n2GyAWoW5v0OKNuhbhSJttiqgdNEYHCKNImB5nGKtP4jajSsSefPJvzPyUm8SCbAIatUiW2Fohai3Kql8qz4ucx1i5UppIlOCO+mx5ly5BXvl4Db3L56FdBy80ZXuBldOPxCdz9HeeoMjCsLZ5QuM2TY1JdFc9XpxJc/iQfGSpuvxTuER1H2eqAKA9k5Fumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHQWIvTEAEhlDcyg/4RGeLbISfaAuEPjTK3waaiylAg=;
 b=D1YG7TbWQix1PgQyMxQyijBkImSuZ8Wymuq7EmD6g2Wo7h62330bk9c2I4iHSnWBoJhQOiQjVpNXzJfbdYswS/6dme5Y+1uljlMh+vxBLeQZKz/pZoj9Kl0vXdRh6RbktB6TafEMf5auGl1arc0nLAeTRt1hpDhihIZRCR3jBpPFhNKu56fRmVnDgH5H7li4uRQIQguMEjsXRf5aC4E0jVvwTsVeOfzwmuIOXGGxl6G7kIN26Sd5ZI3PiAulI12sbBTkR65taGhoVft0DhYdvGA9KKLhu2mRMgQk0xN3/RT/jVngDrg0u3X0JZLQR55kAIsx6FTSEA5Dj4km59ZAcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PA1P192MB3307.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:31:56 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:31:56 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH] expat: patch CVE-2026-50219
Date: Fri,  5 Jun 2026 10:31:40 +0200
Message-ID: <20260605083141.1881236-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0218.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::11) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PA1P192MB3307:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e837765-ae3a-4b1d-56ac-08dec2dce707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|1800799024|366016|6133799003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Hjotnx/CYozomiu8yTNnKc3hN+kXUAawi1RVHaWrZrX9Q4s0BOIlV53eSJAdhEzVC7rI3/MhdyEmFDQoz5hezcPOcaY/M4Fv97aL2cAlAaF/KJ65FsWzmnEe98i38sKREYAmcU1R1P4ZBSHubzsWeDyyThLcGyrSgmH0e3D5o2W1OWLMGqLlCEmbgQ6DNhqMZ6MjJm9BzcDf8TU9qZpuDDxYhg/HWK7YVUPwytplNfpSOnTzBzCOuLQn62Iiwp9Soih5o3g45zO3qM3c6mmtByHZ7v0vWUN/PumxAJP/jDEiMiMrYNn/2QBbAnYgPZW/vebxbkSi/KNqy2nUTxyNYY8wwOkFIqsXEAv2qhVKouvQM5Eh3ecVWI7XEM6Sx8lDoCT/KhCzMpxVatOlOQSsJkPwGJB+Ke5Fr/TcUvnVGLl8yu2GfI8omS88SDb2+FrfjLm09ViFSOVs7aL8dEsN9DhYf36JsNAZdnqhdYdK0xeHy1mznHtvEQJjXCNekd67UasL/J0EbRUhfCKbT/dpPditUrda+Js1T+vriuN22iySCW41rZW6+eBly9oI9QHmOWozxrTrTA68TDqSVyhX2MGIB620uON39waN8ijha3PNaUH9G3Zce1iz/xMw1TTvp+rlyZCKHH/iR3G7Dl74lIEx67V87jBgOPbFDJCrwd0CkfG/o+Qia/IyKfTFJjm1xgkCak602LiFrkifD3LXLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(1800799024)(366016)(6133799003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y1mUeGrJxQfq4yDHxCw/WxGwO/Ygk0O8Mo86ai86HXXsCf9X8VKD7hteWGpc?=
 =?us-ascii?Q?kN0V5o2UHFO31gbmka2tie5ZVn2O7efARTicWfzk/JnfqfxJ5bbx/0SVVgyy?=
 =?us-ascii?Q?wN1XLO3SuUNdiIiimItA0BUDIkhvN11xAy9pjN8qhFaq23Rq7CXGi/ZXkDss?=
 =?us-ascii?Q?nSGwXUje+GP3gyxc3Reft0Bj+4uzW7jBItdk3ZH666DUibuI207+LHehkArY?=
 =?us-ascii?Q?w5PEDGeRYwsb+cMeUT+FjhpaXvtBpCxG2SSvluBY9peN5Y5TvWVKllPKpb52?=
 =?us-ascii?Q?CeYhpAXrRl8xCNn7i4GvDEw3wy4dEbJ1JRKrjSxIaDnx0prVeuntvgAw+ERk?=
 =?us-ascii?Q?92+xPLyUDtwMBpOH7OuASFvOZHjycCr2huvY+2yza/bKAnv1splvDX15mH5N?=
 =?us-ascii?Q?ZJsScUqbQgW45SEWSWoPenWd8NP7KnaM35V5gQDQZG8gGoknx9WnrTyHNz8x?=
 =?us-ascii?Q?Z55TLFR8IA0aoSk2fMWlKfEuc0gPNHDJYE4smIhescQlJ2i1KZvMbE3NcyXp?=
 =?us-ascii?Q?eJw2oZ8NHCiqJjAX4LxZXl9so7/k06DBTctTQ3e+WKmZHi4UZZldCEBbWEhe?=
 =?us-ascii?Q?r7Hv/SR6Sy6wQsIVTP1/c7KHi0t8uM9z1+zYqBqHmOjpgUMO3JhltOUgtNJS?=
 =?us-ascii?Q?Ze7hOH+fjjUpy41r/8rX4D7UCg9OQzbffWWeRdgnEFgo5qIx1fezmlfBVH2e?=
 =?us-ascii?Q?A15wh/ERyVkzugJ63gyWv2kEP7NdXkRGxwApwi4VME/fJSTZIwM1fUqbkrBp?=
 =?us-ascii?Q?efntlXmK6xkafnOtaWu6WXQjlBlzvflW3Y4xC3YPLZ8+qHHtQ3SddrAdB4fs?=
 =?us-ascii?Q?j9KdnlwarpeU6aA8AQiCQp+yK39xMK0UEjSTp+D46rgpLBPI2UFlwkjcJA9y?=
 =?us-ascii?Q?394guXAyIP1hP04Gjq48U6R47b1MUmhYbzUm2LXqtqutLK712gwqzQBB0vzI?=
 =?us-ascii?Q?MO6DLWNYI0ROeboFmRzKF1RX9Enpt4oib0qsBIGdKgE0RtQfj8w1tcuwKfnq?=
 =?us-ascii?Q?nVK/111EVP244Cj3b4nJLPQhUzHBEU8ZoYegv9gamoMMnBMR2X7qnMEx3WZ2?=
 =?us-ascii?Q?xRB7TCcO/uLoHspjvSg4CY84JzqKDrv97QXq9NqAQRA4wnOnDZDslWhQbCYm?=
 =?us-ascii?Q?/IBvkmFgQW581pxTEy25s+W69T9SX/vRGbVSbFgq1UPkvm398+Y0x81EbS/z?=
 =?us-ascii?Q?2L6pQ4CmR4KlINkANZYd7cpYLafBqAqB+uxBvOOZuRguiWBhzd2+nuu7aqaR?=
 =?us-ascii?Q?y26J5poXl0ruKFyqa/RTYpz7j6aSjrxvYao1w6cxvks/mdW78kPUHpNcT7yB?=
 =?us-ascii?Q?xtZGLCPCECuDa6lhEDwLdqKNEGgOTr42G0pLLfqzTvnCfVtdUqOMmZBqA9jn?=
 =?us-ascii?Q?lKux4mg+bMrGBBOWFGxum4cmm/ZQBiAi+yzhDpILd4Xf5XBxBajFyMkPikef?=
 =?us-ascii?Q?GENTA9KIYssto83pcv3OYy9pw/IKQxrzi8LErNYBYjiILGMWYWacsbS0S7Fk?=
 =?us-ascii?Q?d4WHn8u6+kwCQrU59Ep0Mj+kCfH+3pbNAr2ngHRDVuSpGh4F7hkPy2XOIogL?=
 =?us-ascii?Q?1Sqhf/8aFE9iG2Cb2X16R+UC/5DVs2NOydxaQo5du4lZyIXQB6UenhsKucMP?=
 =?us-ascii?Q?p06BloRkQN14mF4gX2IWeCEn5zamE3n7aGeQu0v++xhHS9jHPFvKywBnrLA4?=
 =?us-ascii?Q?mCo2Wy2Va0UqWrqBuL1/DWKjhO3gh5rfRaZL6RulHKrHbeeUTEzMSO4bp9G8?=
 =?us-ascii?Q?t9TfPnJybOjopwlE5M/RdQtTo7oV/KMZEMNEDM2e1jEVqMNL0KhsU5z/9oLn?=
X-MS-Exchange-AntiSpam-MessageData-1: lKKhkOjeioCpcQ==
X-Exchange-RoutingPolicyChecked: 
	IjvKU5w/kcDzLpFThMiMSLC11H4sJ6KoNPvNLY99hEaMZ1dM+//e4yEaFyj3THaEF0XpepRZOvlEqcPV4Z9CDhDet9o6zK5ZWyHBFKFSHdnGNaHyYLHnB/ks2r4d0Y6u5ypQ8Ljz2k/UpIsiYiCV5q9mqY+9DKaJzVkex25I9+bvZK+1fA7slCX+8mP/ioO80rg+mVoSsPbWC8qz5b/n1UUZ1T9kArv/Ph98/UY2mFSsQnWQgwP8kEDsJDsreS0NOn3F2kqb6mJAouia9MAcRGz7yvLNwNTZrYFW2K7NR6xp6O3hIAl5HIE24KwGSOtE8Mk8jYjTzLywgpPXvrYzqQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LkhwkSvcNIXrPvHqRVyXcV+WXdyu1ec5NpEhae8s9lNZC17LCa/Qar/2a5GEDFji+o2YLLFUaHUkQOosIU+BBqPj2s4CnGlOh3E2lhonAovRE5qxepbZBPmr48jJk935V2ZWWrgYhyvwrgONrlpIjA/LNT8YciwQUxA+DOzJRRvXKcsJ/smtcrC91pysJKCz5rXDhb9k34NFWXKjdkZOGrQiM59gFIFVOk5ZCOyzu0/RR/njzKUbO5khclAXY5I9jfMW0KOf5xmOdn6PBItPGpECiX1qBdaNe8TBbzliA6YXUYnnTJUnSRjmS/LbfKtfs97SdEhOQdxQyNWj5YtunUPziK0MIhs26SY9DvGHFakju3vqVK9R6TZZob7WjUFoAir6ynWUkZGDUpb01I+J7bsOoYzNzaNel9p4zK5JBpz9tWoeleT2QgbJplRKwALvS4BlmF5+oxYWueCmyik6JKm9BPcXJOxPZa+Rnb99woV1qvr33QE+9+J4V5o1vHp0QurgDAbdWXfOCxo5gJfmun5Bq3WvuBeOujJrq3zu2odiQYB68/h3iOGXzZck8InhOti/ScvWEoUcSKPDwU4ySOA1ln93A0DcVd6/n5++fNozIyrDwKWG/6tGFxEdbb8p
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e837765-ae3a-4b1d-56ac-08dec2dce707
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:31:56.1875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6WKNYaTd1+3UAbRyND89RPd2JeGqot/DLo5E+FnqXF/Ak9bHAngsoTtMscd5GmA4RY5OGBWZx+Q+aQrnpeg4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3307
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate17-hz12 with 4gWvmt60d8z1L9Cy
X-cloud-security-connect: mail-westeuropeazon11021130.outbound.protection.outlook.com[52.101.70.130], TLS=1, IP=52.101.70.130
X-cloud-security-Digest: e6e9f0a8f6e0e92694b9841c7c6a616e
X-cloud-security: scantime:1.993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 08:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238149

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/libexpat/libexpat/pull/1246

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../expat/expat/CVE-2026-50219-01.patch       |  59 +++++++
 .../expat/expat/CVE-2026-50219-02.patch       |  82 ++++++++++
 .../expat/expat/CVE-2026-50219-03.patch       |  90 +++++++++++
 .../expat/expat/CVE-2026-50219-04.patch       |  32 ++++
 .../expat/expat/CVE-2026-50219-05.patch       |  46 ++++++
 .../expat/expat/CVE-2026-50219-06.patch       | 152 ++++++++++++++++++
 .../expat/expat/CVE-2026-50219-07.patch       |  30 ++++
 .../expat/expat/CVE-2026-50219-08.patch       |  42 +++++
 .../expat/expat/CVE-2026-50219-09.patch       |  42 +++++
 .../expat/expat/CVE-2026-50219-10.patch       |  33 ++++
 .../expat/expat/CVE-2026-50219-11.patch       |  30 ++++
 .../expat/expat/CVE-2026-50219-12.patch       |  40 +++++
 .../expat/expat/CVE-2026-50219-13.patch       |  47 ++++++
 .../expat/expat/CVE-2026-50219-14.patch       |  72 +++++++++
 .../expat/expat/CVE-2026-50219-15.patch       |  80 +++++++++
 .../expat/expat/CVE-2026-50219-16.patch       |  44 +++++
 .../expat/expat/CVE-2026-50219-17.patch       |  62 +++++++
 .../expat/expat/CVE-2026-50219-18.patch       |  30 ++++
 .../expat/expat/CVE-2026-50219-19.patch       |  85 ++++++++++
 .../expat/expat/CVE-2026-50219-20.patch       |  60 +++++++
 .../expat/expat/CVE-2026-50219-21.patch       |  44 +++++
 .../expat/expat/CVE-2026-50219-22.patch       |  46 ++++++
 .../expat/expat/CVE-2026-50219-23.patch       |  34 ++++
 .../expat/expat/CVE-2026-50219-24.patch       |  31 ++++
 .../expat/expat/CVE-2026-50219-25.patch       |  33 ++++
 .../expat/expat/CVE-2026-50219-26.patch       |  31 ++++
 .../expat/expat/CVE-2026-50219-27.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-28.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-29.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-30.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-31.patch       |  29 ++++
 .../expat/expat/CVE-2026-50219-32.patch       |  97 +++++++++++
 .../expat/expat/CVE-2026-50219-33.patch       |  39 +++++
 .../expat/expat/CVE-2026-50219-34.patch       |  39 +++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  34 ++++
 35 files changed, 1731 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-34.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
new file mode 100644
index 0000000000..52c97bf26b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
@@ -0,0 +1,59 @@
+From 2225503f79c10ca8dc27cc338fbf285aa30a3808 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:15:10 +0200
+Subject: [PATCH 01/34] lib: Introduce handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/f69d0719bf01596f1d95c9e902f4a279e62c6305]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9bc67f38..e2ed3e2d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -784,6 +784,7 @@ struct XML_ParserStruct {
+   ENTITY_STATS m_entity_stats;
+ #endif
+   XML_Bool m_reenter;
++  unsigned m_handlerCallDepth;
+ };
+ 
+ #if XML_GE == 1
+@@ -1248,6 +1249,23 @@ get_hash_secret_salt(XML_Parser parser) {
+   return parser->m_hash_secret_salt;
+ }
+ 
++static void
++beforeHandler(XML_Parser parser) {
++  assert(parser->m_handlerCallDepth < UINT_MAX);
++  parser->m_handlerCallDepth++;
++}
++
++static void
++afterHandler(XML_Parser parser) {
++  assert(parser->m_handlerCallDepth > 0);
++  parser->m_handlerCallDepth--;
++}
++
++static bool
++isCalledFromInsideHandler(XML_Parser parser) {
++  return parser->m_handlerCallDepth > 0;
++}
++
+ static enum XML_Error
+ callProcessor(XML_Parser parser, const char *start, const char *end,
+               const char **endPtr) {
+@@ -1600,6 +1618,7 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_parsingStatus.parsing = XML_INITIALIZED;
+   // Reentry can only be triggered inside m_processor calls
+   parser->m_reenter = XML_FALSE;
++  parser->m_handlerCallDepth = 0;
+ #ifdef XML_DTD
+   parser->m_isParamEntity = XML_FALSE;
+   parser->m_useForeignDTD = XML_FALSE;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
new file mode 100644
index 0000000000..80d28e519b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
@@ -0,0 +1,82 @@
+From 63695deacefe467ddf7d4df9ae579f233608a449 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:33:26 +0200
+Subject: [PATCH 02/34] lib: Prepare `m_notStandaloneHandler` calls for
+ upcoming wrapping
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/cdd21e84e150cc2ca961533e157bd52e3cbb4aa4]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 34 ++++++++++++++++++++++------------
+ 1 file changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e2ed3e2d..1d28940f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5450,9 +5450,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+                   entity->systemId, entity->publicId))
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+-            if (! dtd->standalone && parser->m_notStandaloneHandler
+-                && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-              return XML_ERROR_NOT_STANDALONE;
++            if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              const int handlerStatus
++                  = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              if (! handlerStatus)
++                return XML_ERROR_NOT_STANDALONE;
++            }
+           }
+           /* if we didn't read the foreign DTD then this means that there
+              is no external subset and we must reset dtd->hasParamEntityRefs
+@@ -5490,9 +5493,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+                   entity->systemId, entity->publicId))
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+-            if (! dtd->standalone && parser->m_notStandaloneHandler
+-                && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-              return XML_ERROR_NOT_STANDALONE;
++            if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              const int handlerStatus
++                  = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              if (! handlerStatus)
++                return XML_ERROR_NOT_STANDALONE;
++            }
+           }
+           /* if we didn't read the foreign DTD then this means that there
+              is no external subset and we must reset dtd->hasParamEntityRefs
+@@ -5702,9 +5708,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ #ifdef XML_DTD
+           && ! parser->m_paramEntityParsing
+ #endif /* XML_DTD */
+-          && parser->m_notStandaloneHandler
+-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-        return XML_ERROR_NOT_STANDALONE;
++          && parser->m_notStandaloneHandler) {
++        const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        if (! status)
++          return XML_ERROR_NOT_STANDALONE;
++      }
+ #ifndef XML_DTD
+       break;
+ #else  /* XML_DTD */
+@@ -6093,9 +6101,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         }
+       }
+ #endif /* XML_DTD */
+-      if (! dtd->standalone && parser->m_notStandaloneHandler
+-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
+-        return XML_ERROR_NOT_STANDALONE;
++      if (! dtd->standalone && parser->m_notStandaloneHandler) {
++        const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        if (! status)
++          return XML_ERROR_NOT_STANDALONE;
++      }
+       break;
+ 
+       /* Element declaration stuff */
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
new file mode 100644
index 0000000000..687c706167
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
@@ -0,0 +1,90 @@
+From b7e3a0a77f1d62b03f198817668e17a794a56171 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:45:34 +0200
+Subject: [PATCH 03/34] lib: Prepare `m_externalEntityRefHandler` calls for
+ upcoming wrapping
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/1ffe852fe1d8e1d73eb4eb5798456aefc8300299]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 1d28940f..07f63928 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3467,9 +3467,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         entity->open = XML_FALSE;
+         if (! context)
+           return XML_ERROR_NO_MEMORY;
+-        if (! parser->m_externalEntityRefHandler(
+-                parser->m_externalEntityRefHandlerArg, context, entity->base,
+-                entity->systemId, entity->publicId))
++        const int status = parser->m_externalEntityRefHandler(
++            parser->m_externalEntityRefHandlerArg, context, entity->base,
++            entity->systemId, entity->publicId);
++        if (! status)
+           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+         poolDiscard(&parser->m_tempPool);
+       } else if (parser->m_defaultHandler)
+@@ -5445,9 +5446,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           if (parser->m_useForeignDTD)
+             entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
+-          if (! parser->m_externalEntityRefHandler(
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                  entity->systemId, entity->publicId))
++          const int status = parser->m_externalEntityRefHandler(
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
++              entity->systemId, entity->publicId);
++          if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
+@@ -5488,9 +5490,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_NO_MEMORY;
+           entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
+-          if (! parser->m_externalEntityRefHandler(
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                  entity->systemId, entity->publicId))
++          const int status = parser->m_externalEntityRefHandler(
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
++              entity->systemId, entity->publicId);
++          if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
+@@ -6081,9 +6084,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           dtd->paramEntityRead = XML_FALSE;
+           entity->open = XML_TRUE;
+           entityTrackingOnOpen(parser, entity, __LINE__);
+-          if (! parser->m_externalEntityRefHandler(
+-                  parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                  entity->systemId, entity->publicId)) {
++          const int status = parser->m_externalEntityRefHandler(
++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
++              entity->systemId, entity->publicId);
++          if (! status) {
+             entityTrackingOnClose(parser, entity, __LINE__);
+             entity->open = XML_FALSE;
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+@@ -6873,9 +6877,10 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+             dtd->paramEntityRead = XML_FALSE;
+             entity->open = XML_TRUE;
+             entityTrackingOnOpen(parser, entity, __LINE__);
+-            if (! parser->m_externalEntityRefHandler(
+-                    parser->m_externalEntityRefHandlerArg, 0, entity->base,
+-                    entity->systemId, entity->publicId)) {
++            const int status = parser->m_externalEntityRefHandler(
++                parser->m_externalEntityRefHandlerArg, 0, entity->base,
++                entity->systemId, entity->publicId);
++            if (! status) {
+               entityTrackingOnClose(parser, entity, __LINE__);
+               entity->open = XML_FALSE;
+               result = XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
new file mode 100644
index 0000000000..a36f96e16f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
@@ -0,0 +1,32 @@
+From 8d7a4bd5734d401a29f912365e80ee6900f2d877 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:46:36 +0200
+Subject: [PATCH 04/34] lib: Prepare `m_unknownEncodingHandler` calls for
+ upcoming wrapping
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/adcafd4316259ef48b1763e584733a7bff4a8db0]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 07f63928..c5aad0dc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4970,8 +4970,9 @@ handleUnknownEncoding(XML_Parser parser, const XML_Char *encodingName) {
+     info.convert = NULL;
+     info.data = NULL;
+     info.release = NULL;
+-    if (parser->m_unknownEncodingHandler(parser->m_unknownEncodingHandlerData,
+-                                         encodingName, &info)) {
++    const int status = parser->m_unknownEncodingHandler(
++        parser->m_unknownEncodingHandlerData, encodingName, &info);
++    if (status) {
+       ENCODING *enc;
+       parser->m_unknownEncodingMem = MALLOC(parser, XmlSizeOfUnknownEncoding());
+       if (! parser->m_unknownEncodingMem) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
new file mode 100644
index 0000000000..78c0b4d68e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
@@ -0,0 +1,46 @@
+From bf93761c4a40fd32d49fcbe96fea58fc8ecf01a9 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:05:19 +0200
+Subject: [PATCH 05/34] lib: Register `m_attlistDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/781092f189a8c8e8be6640258829a7f783864282]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c5aad0dc..1551691b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5595,10 +5595,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             poolFinish(&parser->m_tempPool);
+           }
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_attlistDeclHandler(
+               parser->m_handlerArg, parser->m_declElementType->name,
+               parser->m_declAttributeId->name, parser->m_declAttributeType, 0,
+               role == XML_ROLE_REQUIRED_ATTRIBUTE_VALUE);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         }
+       }
+@@ -5633,10 +5635,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             poolFinish(&parser->m_tempPool);
+           }
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_attlistDeclHandler(
+               parser->m_handlerArg, parser->m_declElementType->name,
+               parser->m_declAttributeId->name, parser->m_declAttributeType,
+               attVal, role == XML_ROLE_FIXED_ATTRIBUTE_VALUE);
++          afterHandler(parser);
+           poolClear(&parser->m_tempPool);
+           handleDefault = XML_FALSE;
+         }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
new file mode 100644
index 0000000000..6eb1f12ee4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
@@ -0,0 +1,152 @@
+From 2becec67ac41e2fcf8393bb59bf28996ad4fe6d4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:08:02 +0200
+Subject: [PATCH 06/34] lib: Register `m_characterDataHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/5ee607587a997220a48e78b5f6c55a05e50e5b20]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 44 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 1551691b..480d9672 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3362,7 +3362,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       *eventEndPP = end;
+       if (parser->m_characterDataHandler) {
+         XML_Char c = 0xA;
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, end);
+       /* We are at the end of the final buffer, should we check for
+@@ -3415,9 +3417,11 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE__,
+                                 XML_ACCOUNT_ENTITY_EXPANSION);
+ #endif /* XML_GE == 1 */
+-        if (parser->m_characterDataHandler)
++        if (parser->m_characterDataHandler) {
++          beforeHandler(parser);
+           parser->m_characterDataHandler(parser->m_handlerArg, &ch, 1);
+-        else if (parser->m_defaultHandler)
++          afterHandler(parser);
++        } else if (parser->m_defaultHandler)
+           reportDefault(parser, enc, s, next);
+         break;
+       }
+@@ -3663,8 +3667,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         return XML_ERROR_BAD_CHAR_REF;
+       if (parser->m_characterDataHandler) {
+         XML_Char buf[XML_ENCODE_MAX];
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, buf,
+                                        XmlEncode(n, (ICHAR *)buf));
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+     } break;
+@@ -3673,7 +3679,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+     case XML_TOK_DATA_NEWLINE:
+       if (parser->m_characterDataHandler) {
+         XML_Char c = 0xA;
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       break;
+@@ -3694,11 +3702,13 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+          However, now we have a start/endCdataSectionHandler, so it seems
+          easier to let the user deal with this.
+       */
+-      else if ((0) && parser->m_characterDataHandler)
++      else if ((0) && parser->m_characterDataHandler) {
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                        0);
+-      /* END disabled code */
+-      else if (parser->m_defaultHandler)
++        afterHandler(parser);
++        /* END disabled code */
++      } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       result
+           = doCdataSection(parser, enc, &next, end, nextPtr, haveMore, account);
+@@ -3718,13 +3728,18 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         if (MUST_CONVERT(enc, s)) {
+           ICHAR *dataPtr = (ICHAR *)parser->m_dataBuf;
+           XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataBufEnd);
++          beforeHandler(parser);
+           parser->m_characterDataHandler(
+               parser->m_handlerArg, parser->m_dataBuf,
+               (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
+-        } else
++          afterHandler(parser);
++        } else {
++          beforeHandler(parser);
+           parser->m_characterDataHandler(
+               parser->m_handlerArg, (const XML_Char *)s,
+               (int)((const XML_Char *)end - (const XML_Char *)s));
++          afterHandler(parser);
++        }
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, end);
+       /* We are at the end of the final buffer, should we check for
+@@ -3749,16 +3764,21 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             const enum XML_Convert_Result convert_res = XmlConvert(
+                 enc, &s, next, &dataPtr, (ICHAR *)parser->m_dataBufEnd);
+             *eventEndPP = s;
++            beforeHandler(parser);
+             charDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                             (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
++            afterHandler(parser);
+             if ((convert_res == XML_CONVERT_COMPLETED)
+                 || (convert_res == XML_CONVERT_INPUT_INCOMPLETE))
+               break;
+             *eventPP = s;
+           }
+-        } else
++        } else {
++          beforeHandler(parser);
+           charDataHandler(parser->m_handlerArg, (const XML_Char *)s,
+                           (int)((const XML_Char *)next - (const XML_Char *)s));
++          afterHandler(parser);
++        }
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+     } break;
+@@ -4643,11 +4663,13 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+         parser->m_endCdataSectionHandler(parser->m_handlerArg);
+       /* BEGIN disabled code */
+       /* see comment under XML_TOK_CDATA_SECT_OPEN */
+-      else if ((0) && parser->m_characterDataHandler)
++      else if ((0) && parser->m_characterDataHandler) {
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                        0);
+-      /* END disabled code */
+-      else if (parser->m_defaultHandler)
++        afterHandler(parser);
++        /* END disabled code */
++      } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       *startPtr = next;
+       *nextPtr = next;
+@@ -4658,7 +4680,9 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+     case XML_TOK_DATA_NEWLINE:
+       if (parser->m_characterDataHandler) {
+         XML_Char c = 0xA;
++        beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
++        afterHandler(parser);
+       } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
new file mode 100644
index 0000000000..35928cdbfd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
@@ -0,0 +1,30 @@
+From e4c15c4600f0a50fd03b4e23cb79c89a2ce6faa9 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:08:40 +0200
+Subject: [PATCH 07/34] lib: Register `m_commentHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/0e7dbfee7912a8e25aace775be47e5ad570b9cc3]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 480d9672..d1258b81 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7178,7 +7178,9 @@ reportComment(XML_Parser parser, const ENCODING *enc, const char *start,
+   if (! data)
+     return 0;
+   normalizeLines(data);
++  beforeHandler(parser);
+   parser->m_commentHandler(parser->m_handlerArg, data);
++  afterHandler(parser);
+   poolClear(&parser->m_tempPool);
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
new file mode 100644
index 0000000000..3691e6728d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
@@ -0,0 +1,42 @@
+From 8e1f2385d561cf1862376759ca85290bd4dba62a Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:14:10 +0200
+Subject: [PATCH 08/34] lib: Register `m_defaultHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/e5b76bd58dd9984cef46c2a66a98b03c95a3c774]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index d1258b81..23cb2c21 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7221,15 +7221,20 @@ reportDefault(XML_Parser parser, const ENCODING *enc, const char *s,
+       convert_res
+           = XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataBufEnd);
+       *eventEndPP = s;
++      beforeHandler(parser);
+       parser->m_defaultHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
++      afterHandler(parser);
+       *eventPP = s;
+     } while ((convert_res != XML_CONVERT_COMPLETED)
+              && (convert_res != XML_CONVERT_INPUT_INCOMPLETE));
+-  } else
++  } else {
++    beforeHandler(parser);
+     parser->m_defaultHandler(
+         parser->m_handlerArg, (const XML_Char *)s,
+         (int)((const XML_Char *)end - (const XML_Char *)s));
++    afterHandler(parser);
++  }
+ }
+ 
+ static int
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
new file mode 100644
index 0000000000..781e045900
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
@@ -0,0 +1,42 @@
+From 6852f7b0f8c2ef160aeee1b45d8943e2771cfc68 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:15:01 +0200
+Subject: [PATCH 09/34] lib: Register `m_elementDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/b4a711a33591c0d45d6e630ed6448dcbc5534700]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 23cb2c21..3ff60ce4 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6173,8 +6173,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           content->type = ((role == XML_ROLE_CONTENT_ANY) ? XML_CTYPE_ANY
+                                                           : XML_CTYPE_EMPTY);
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_elementDeclHandler(
+               parser->m_handlerArg, parser->m_declElementType->name, content);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         }
+         dtd->in_eldecl = XML_FALSE;
+@@ -6256,8 +6258,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             if (! model)
+               return XML_ERROR_NO_MEMORY;
+             *eventEndPP = s;
++            beforeHandler(parser);
+             parser->m_elementDeclHandler(
+                 parser->m_handlerArg, parser->m_declElementType->name, model);
++            afterHandler(parser);
+           }
+           dtd->in_eldecl = XML_FALSE;
+           dtd->contentStringLen = 0;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
new file mode 100644
index 0000000000..9aac151867
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
@@ -0,0 +1,33 @@
+From 2c3ffbacf4dbe1e71da7ba2bac347ffcca278597 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:15:40 +0200
+Subject: [PATCH 10/34] lib: Register `m_endCdataSectionHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/b08e08c0558152a4180597a3e880dc70040c2b2a]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 3ff60ce4..61890253 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4659,8 +4659,11 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+     *eventEndPP = next;
+     switch (tok) {
+     case XML_TOK_CDATA_SECT_CLOSE:
+-      if (parser->m_endCdataSectionHandler)
++      if (parser->m_endCdataSectionHandler) {
++        beforeHandler(parser);
+         parser->m_endCdataSectionHandler(parser->m_handlerArg);
++        afterHandler(parser);
++      }
+       /* BEGIN disabled code */
+       /* see comment under XML_TOK_CDATA_SECT_OPEN */
+       else if ((0) && parser->m_characterDataHandler) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
new file mode 100644
index 0000000000..bbb291bf79
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
@@ -0,0 +1,30 @@
+From c5d62ac8641754fc5c176c15afe0314b0ddb8778 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:16:13 +0200
+Subject: [PATCH 11/34] lib: Register `m_endDoctypeDeclHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/bd454febe07b931e638f2186755585b67a738d31]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 61890253..9d8d9de9 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5498,7 +5498,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+ #endif /* XML_DTD */
+       if (parser->m_endDoctypeDeclHandler) {
++        beforeHandler(parser);
+         parser->m_endDoctypeDeclHandler(parser->m_handlerArg);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
new file mode 100644
index 0000000000..0ee5a143d0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
@@ -0,0 +1,40 @@
+From 9510f4cec802ea02c6766e34e823ba4f00d1e4b7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:17:10 +0200
+Subject: [PATCH 12/34] lib: Register `m_endElementHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/e411d9907b8addb334d1ed5db1afd5b5bf625f24]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9d8d9de9..9e95b284 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3579,7 +3579,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       if (parser->m_endElementHandler) {
+         if (parser->m_startElementHandler)
+           *eventPP = *eventEndPP;
++        beforeHandler(parser);
+         parser->m_endElementHandler(parser->m_handlerArg, name.str);
++        afterHandler(parser);
+         noElmHandlers = XML_FALSE;
+       }
+       if (noElmHandlers && parser->m_defaultHandler)
+@@ -3637,7 +3639,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             }
+             *uri = XML_T('\0');
+           }
++          beforeHandler(parser);
+           parser->m_endElementHandler(parser->m_handlerArg, tag->name.str);
++          afterHandler(parser);
+         } else if (parser->m_defaultHandler)
+           reportDefault(parser, enc, s, next);
+         while (tag->bindings) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
new file mode 100644
index 0000000000..56b6546043
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
@@ -0,0 +1,47 @@
+From faecc1168a844fda20c604365dcf01200dd897ed Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:23:59 +0200
+Subject: [PATCH 13/34] lib: Register `m_endNamespaceDeclHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/274aa82340fe1b2205e8e3ae1cd35e2168cd42e8]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9e95b284..e4c5616e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3646,9 +3646,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+           reportDefault(parser, enc, s, next);
+         while (tag->bindings) {
+           BINDING *b = tag->bindings;
+-          if (parser->m_endNamespaceDeclHandler)
++          if (parser->m_endNamespaceDeclHandler) {
++            beforeHandler(parser);
+             parser->m_endNamespaceDeclHandler(parser->m_handlerArg,
+                                               b->prefix->name);
++            afterHandler(parser);
++          }
+           tag->bindings = tag->bindings->nextTagBinding;
+           b->nextTagBinding = parser->m_freeBindingList;
+           parser->m_freeBindingList = b;
+@@ -3840,8 +3843,11 @@ freeBindings(XML_Parser parser, BINDING *bindings) {
+     /* m_startNamespaceDeclHandler will have been called for this
+      * binding in addBindings(), so call the end handler now.
+      */
+-    if (parser->m_endNamespaceDeclHandler)
++    if (parser->m_endNamespaceDeclHandler) {
++      beforeHandler(parser);
+       parser->m_endNamespaceDeclHandler(parser->m_handlerArg, b->prefix->name);
++      afterHandler(parser);
++    }
+ 
+     bindings = bindings->nextTagBinding;
+     b->nextTagBinding = parser->m_freeBindingList;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
new file mode 100644
index 0000000000..9ff3e03b13
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
@@ -0,0 +1,72 @@
+From 7790f829712eb6ecb60f8a325f81017a6073c1a5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:25:42 +0200
+Subject: [PATCH 14/34] lib: Register `m_entityDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/6e62649e6b25eb789166b9131dfadfe9d806f5ce]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e4c5616e..c2d3ef60 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5700,10 +5700,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           poolFinish(&dtd->entityValuePool);
+           if (parser->m_entityDeclHandler) {
+             *eventEndPP = s;
++            beforeHandler(parser);
+             parser->m_entityDeclHandler(
+                 parser->m_handlerArg, parser->m_declEntity->name,
+                 parser->m_declEntity->is_param, parser->m_declEntity->textPtr,
+                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0);
++            afterHandler(parser);
+             handleDefault = XML_FALSE;
+           }
+         } else
+@@ -5721,10 +5723,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ 
+           if (parser->m_entityDeclHandler) {
+             *eventEndPP = s;
++            beforeHandler(parser);
+             parser->m_entityDeclHandler(
+                 parser->m_handlerArg, parser->m_declEntity->name,
+                 parser->m_declEntity->is_param, parser->m_declEntity->textPtr,
+                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0);
++            afterHandler(parser);
+             handleDefault = XML_FALSE;
+           }
+         }
+@@ -5802,10 +5806,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (dtd->keepProcessing && parser->m_declEntity
+           && parser->m_entityDeclHandler) {
+         *eventEndPP = s;
++        beforeHandler(parser);
+         parser->m_entityDeclHandler(
+             parser->m_handlerArg, parser->m_declEntity->name,
+             parser->m_declEntity->is_param, 0, 0, parser->m_declEntity->base,
+             parser->m_declEntity->systemId, parser->m_declEntity->publicId, 0);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       break;
+@@ -5825,10 +5831,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           handleDefault = XML_FALSE;
+         } else if (parser->m_entityDeclHandler) {
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_entityDeclHandler(
+               parser->m_handlerArg, parser->m_declEntity->name, 0, 0, 0,
+               parser->m_declEntity->base, parser->m_declEntity->systemId,
+               parser->m_declEntity->publicId, parser->m_declEntity->notation);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         }
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
new file mode 100644
index 0000000000..648ee4ef8d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
@@ -0,0 +1,80 @@
+From eef385983d91a4675cc992ee1352e7093cbffffa Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:45:50 +0200
+Subject: [PATCH 15/34] lib: Register `m_externalEntityRefHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/d4ba1c29165de39605b799223392dfb28bed85d5]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c2d3ef60..830d5963 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3471,9 +3471,11 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         entity->open = XML_FALSE;
+         if (! context)
+           return XML_ERROR_NO_MEMORY;
++        beforeHandler(parser);
+         const int status = parser->m_externalEntityRefHandler(
+             parser->m_externalEntityRefHandlerArg, context, entity->base,
+             entity->systemId, entity->publicId);
++        afterHandler(parser);
+         if (! status)
+           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+         poolDiscard(&parser->m_tempPool);
+@@ -5484,9 +5486,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           if (parser->m_useForeignDTD)
+             entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
++          beforeHandler(parser);
+           const int status = parser->m_externalEntityRefHandler(
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,
+               entity->systemId, entity->publicId);
++          afterHandler(parser);
+           if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+@@ -5530,9 +5534,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_NO_MEMORY;
+           entity->base = parser->m_curBase;
+           dtd->paramEntityRead = XML_FALSE;
++          beforeHandler(parser);
+           const int status = parser->m_externalEntityRefHandler(
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,
+               entity->systemId, entity->publicId);
++          afterHandler(parser);
+           if (! status)
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+@@ -6136,9 +6142,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           dtd->paramEntityRead = XML_FALSE;
+           entity->open = XML_TRUE;
+           entityTrackingOnOpen(parser, entity, __LINE__);
++          beforeHandler(parser);
+           const int status = parser->m_externalEntityRefHandler(
+               parser->m_externalEntityRefHandlerArg, 0, entity->base,
+               entity->systemId, entity->publicId);
++          afterHandler(parser);
+           if (! status) {
+             entityTrackingOnClose(parser, entity, __LINE__);
+             entity->open = XML_FALSE;
+@@ -6933,9 +6941,11 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+             dtd->paramEntityRead = XML_FALSE;
+             entity->open = XML_TRUE;
+             entityTrackingOnOpen(parser, entity, __LINE__);
++            beforeHandler(parser);
+             const int status = parser->m_externalEntityRefHandler(
+                 parser->m_externalEntityRefHandlerArg, 0, entity->base,
+                 entity->systemId, entity->publicId);
++            afterHandler(parser);
+             if (! status) {
+               entityTrackingOnClose(parser, entity, __LINE__);
+               entity->open = XML_FALSE;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
new file mode 100644
index 0000000000..52541b642e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
@@ -0,0 +1,44 @@
+From bf963b8553bb11fcf4f42da91c7a0311265d3990 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:27:13 +0200
+Subject: [PATCH 16/34] lib: Register `m_notationDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/4739ad3fda250cf458d396d9c17a0e0fef571bdd]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 830d5963..a16cd70b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5949,9 +5949,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         if (! systemId)
+           return XML_ERROR_NO_MEMORY;
+         *eventEndPP = s;
++        beforeHandler(parser);
+         parser->m_notationDeclHandler(
+             parser->m_handlerArg, parser->m_declNotationName, parser->m_curBase,
+             systemId, parser->m_declNotationPublicId);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       poolClear(&parser->m_tempPool);
+@@ -5959,9 +5961,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+     case XML_ROLE_NOTATION_NO_SYSTEM_ID:
+       if (parser->m_declNotationPublicId && parser->m_notationDeclHandler) {
+         *eventEndPP = s;
++        beforeHandler(parser);
+         parser->m_notationDeclHandler(
+             parser->m_handlerArg, parser->m_declNotationName, parser->m_curBase,
+             0, parser->m_declNotationPublicId);
++        afterHandler(parser);
+         handleDefault = XML_FALSE;
+       }
+       poolClear(&parser->m_tempPool);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
new file mode 100644
index 0000000000..97b3a52ff9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
@@ -0,0 +1,62 @@
+From cc21091dc63dbe984ea15872ce80dec2a4021517 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:34:29 +0200
+Subject: [PATCH 17/34] lib: Register `m_notStandaloneHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/d7a9c975ceeaa24c730e50fef2bedff5f99d2172]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a16cd70b..4c4708d5 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5495,8 +5495,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              beforeHandler(parser);
+               const int handlerStatus
+                   = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              afterHandler(parser);
+               if (! handlerStatus)
+                 return XML_ERROR_NOT_STANDALONE;
+             }
+@@ -5543,8 +5545,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
+           if (dtd->paramEntityRead) {
+             if (! dtd->standalone && parser->m_notStandaloneHandler) {
++              beforeHandler(parser);
+               const int handlerStatus
+                   = parser->m_notStandaloneHandler(parser->m_handlerArg);
++              afterHandler(parser);
+               if (! handlerStatus)
+                 return XML_ERROR_NOT_STANDALONE;
+             }
+@@ -5766,7 +5770,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           && ! parser->m_paramEntityParsing
+ #endif /* XML_DTD */
+           && parser->m_notStandaloneHandler) {
++        beforeHandler(parser);
+         const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        afterHandler(parser);
+         if (! status)
+           return XML_ERROR_NOT_STANDALONE;
+       }
+@@ -6170,7 +6176,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+ #endif /* XML_DTD */
+       if (! dtd->standalone && parser->m_notStandaloneHandler) {
++        beforeHandler(parser);
+         const int status = parser->m_notStandaloneHandler(parser->m_handlerArg);
++        afterHandler(parser);
+         if (! status)
+           return XML_ERROR_NOT_STANDALONE;
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
new file mode 100644
index 0000000000..6ce48b881a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
@@ -0,0 +1,30 @@
+From 66b312e7ff31f5c824863210ca70710d7b200011 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:35:08 +0200
+Subject: [PATCH 18/34] lib: Register `m_processingInstructionHandler` with
+ handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/8bb00d345d5f92b17a06e01a926ee1dda797e0af]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4c4708d5..407d7e0d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7207,7 +7207,9 @@ reportProcessingInstruction(XML_Parser parser, const ENCODING *enc,
+   if (! data)
+     return 0;
+   normalizeLines(data);
++  beforeHandler(parser);
+   parser->m_processingInstructionHandler(parser->m_handlerArg, target, data);
++  afterHandler(parser);
+   poolClear(&parser->m_tempPool);
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
new file mode 100644
index 0000000000..b1af834e1b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
@@ -0,0 +1,85 @@
+From 3a187b3b2690763b88a2b77655033b279a511dcd Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:36:39 +0200
+Subject: [PATCH 19/34] lib: Register `m_skippedEntityHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/64e3adf0c9d7e1846cff784de3159f1067eb5e06]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 24 ++++++++++++++++++------
+ 1 file changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 407d7e0d..fbf081d0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3441,9 +3441,11 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         else if (! entity->is_internal)
+           return XML_ERROR_ENTITY_DECLARED_IN_PE;
+       } else if (! entity) {
+-        if (parser->m_skippedEntityHandler)
++        if (parser->m_skippedEntityHandler) {
++          beforeHandler(parser);
+           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);
+-        else if (parser->m_defaultHandler)
++          afterHandler(parser);
++        } else if (parser->m_defaultHandler)
+           reportDefault(parser, enc, s, next);
+         break;
+       }
+@@ -3454,10 +3456,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       if (entity->textPtr) {
+         enum XML_Error result;
+         if (! parser->m_defaultExpandInternalEntities) {
+-          if (parser->m_skippedEntityHandler)
++          if (parser->m_skippedEntityHandler) {
++            beforeHandler(parser);
+             parser->m_skippedEntityHandler(parser->m_handlerArg, entity->name,
+                                            0);
+-          else if (parser->m_defaultHandler)
++            afterHandler(parser);
++          } else if (parser->m_defaultHandler)
+             reportDefault(parser, enc, s, next);
+           break;
+         }
+@@ -6131,7 +6135,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           /* cannot report skipped entities in declarations */
+           if ((role == XML_ROLE_PARAM_ENTITY_REF)
+               && parser->m_skippedEntityHandler) {
++            beforeHandler(parser);
+             parser->m_skippedEntityHandler(parser->m_handlerArg, name, 1);
++            afterHandler(parser);
+             handleDefault = XML_FALSE;
+           }
+           break;
+@@ -6802,8 +6808,11 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+       } else if (! entity) {
+         /* Cannot report skipped entity here - see comments on
+            parser->m_skippedEntityHandler.
+-        if (parser->m_skippedEntityHandler)
++        if (parser->m_skippedEntityHandler) {
++          beforeHandler(parser);
+           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);
++          afterHandler(parser);
++        }
+         */
+         /* Cannot call the default handler because this would be
+            out of sync with the call to the startElementHandler.
+@@ -6936,8 +6945,11 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+           /* not a well-formedness error - see XML 1.0: WFC Entity Declared */
+           /* cannot report skipped entity here - see comments on
+              parser->m_skippedEntityHandler
+-          if (parser->m_skippedEntityHandler)
++          if (parser->m_skippedEntityHandler) {
++            beforeHandler(parser);
+             parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0);
++            afterHandler(parser);
++          }
+           */
+           dtd->keepProcessing = dtd->standalone;
+           goto endEntityValue;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
new file mode 100644
index 0000000000..f5a8ba24b1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
@@ -0,0 +1,60 @@
+From 3074268d4d1eb1aa36a7df823f40d631fd98175c Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:37:49 +0200
+Subject: [PATCH 20/34] lib: Register `m_startCdataSectionHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/222278ad452d27f8c35ba031be14d6e70aab5ab1]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 32 +++++++++++++++++---------------
+ 1 file changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index fbf081d0..b6370ea1 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3700,22 +3700,24 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       break;
+     case XML_TOK_CDATA_SECT_OPEN: {
+       enum XML_Error result;
+-      if (parser->m_startCdataSectionHandler)
++      if (parser->m_startCdataSectionHandler) {
++        beforeHandler(parser);
+         parser->m_startCdataSectionHandler(parser->m_handlerArg);
+-      /* BEGIN disabled code */
+-      /* Suppose you doing a transformation on a document that involves
+-         changing only the character data.  You set up a defaultHandler
+-         and a characterDataHandler.  The defaultHandler simply copies
+-         characters through.  The characterDataHandler does the
+-         transformation and writes the characters out escaping them as
+-         necessary.  This case will fail to work if we leave out the
+-         following two lines (because & and < inside CDATA sections will
+-         be incorrectly escaped).
+-
+-         However, now we have a start/endCdataSectionHandler, so it seems
+-         easier to let the user deal with this.
+-      */
+-      else if ((0) && parser->m_characterDataHandler) {
++        afterHandler(parser);
++        /* BEGIN disabled code */
++        /* Suppose you doing a transformation on a document that involves
++           changing only the character data.  You set up a defaultHandler
++           and a characterDataHandler.  The defaultHandler simply copies
++           characters through.  The characterDataHandler does the
++           transformation and writes the characters out escaping them as
++           necessary.  This case will fail to work if we leave out the
++           following two lines (because & and < inside CDATA sections will
++           be incorrectly escaped).
++
++           However, now we have a start/endCdataSectionHandler, so it seems
++           easier to let the user deal with this.
++        */
++      } else if ((0) && parser->m_characterDataHandler) {
+         beforeHandler(parser);
+         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_dataBuf,
+                                        0);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
new file mode 100644
index 0000000000..22d03381c4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
@@ -0,0 +1,44 @@
+From ccb6591176850f051aefc05225d0e9ea1c5ee516 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:38:47 +0200
+Subject: [PATCH 21/34] lib: Register `m_startDoctypeDeclHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/82f1d14a033f7c5bd6f658c3cdcd2515efe86745]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b6370ea1..f2ccd00c 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5394,9 +5394,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       break;
+     case XML_ROLE_DOCTYPE_INTERNAL_SUBSET:
+       if (parser->m_startDoctypeDeclHandler) {
++        beforeHandler(parser);
+         parser->m_startDoctypeDeclHandler(
+             parser->m_handlerArg, parser->m_doctypeName, parser->m_doctypeSysid,
+             parser->m_doctypePubid, 1);
++        afterHandler(parser);
+         parser->m_doctypeName = NULL;
+         poolClear(&parser->m_tempPool);
+         handleDefault = XML_FALSE;
+@@ -5463,9 +5465,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+ 
+       if (parser->m_doctypeName) {
++        beforeHandler(parser);
+         parser->m_startDoctypeDeclHandler(
+             parser->m_handlerArg, parser->m_doctypeName, parser->m_doctypeSysid,
+             parser->m_doctypePubid, 0);
++        afterHandler(parser);
+         poolClear(&parser->m_tempPool);
+         handleDefault = XML_FALSE;
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
new file mode 100644
index 0000000000..065cfba5de
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
@@ -0,0 +1,46 @@
+From 749611ae3b7785d5b4fd679b41ee8b6503556c10 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:39:38 +0200
+Subject: [PATCH 22/34] lib: Register `m_startElementHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/4f9a8f1cc2ed03cd9e23d281a6abac44dc89e8ab]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index f2ccd00c..70f01e95 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3549,10 +3549,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+           = storeAtts(parser, enc, s, &(tag->name), &(tag->bindings), account);
+       if (result)
+         return result;
+-      if (parser->m_startElementHandler)
++      if (parser->m_startElementHandler) {
++        beforeHandler(parser);
+         parser->m_startElementHandler(parser->m_handlerArg, tag->name.str,
+                                       (const XML_Char **)parser->m_atts);
+-      else if (parser->m_defaultHandler)
++        afterHandler(parser);
++      } else if (parser->m_defaultHandler)
+         reportDefault(parser, enc, s, next);
+       poolClear(&parser->m_tempPool);
+       break;
+@@ -3578,8 +3580,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       }
+       poolFinish(&parser->m_tempPool);
+       if (parser->m_startElementHandler) {
++        beforeHandler(parser);
+         parser->m_startElementHandler(parser->m_handlerArg, name.str,
+                                       (const XML_Char **)parser->m_atts);
++        afterHandler(parser);
+         noElmHandlers = XML_FALSE;
+       }
+       if (parser->m_endElementHandler) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
new file mode 100644
index 0000000000..69b5dd6b2a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
@@ -0,0 +1,34 @@
+From bbdf4565ffc47aba55fea3379245d01e626dd229 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:40:13 +0200
+Subject: [PATCH 23/34] lib: Register `m_startNamespaceDeclHandler` with
+ handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/ddd0238420113c97594083194e517e8bc742700c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 70f01e95..1ae77aae 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4617,9 +4617,12 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   b->nextTagBinding = *bindingsPtr;
+   *bindingsPtr = b;
+   /* if attId == NULL then we are not starting a namespace scope */
+-  if (attId && parser->m_startNamespaceDeclHandler)
++  if (attId && parser->m_startNamespaceDeclHandler) {
++    beforeHandler(parser);
+     parser->m_startNamespaceDeclHandler(parser->m_handlerArg, prefix->name,
+                                         prefix->binding ? uri : 0);
++    afterHandler(parser);
++  }
+   return XML_ERROR_NONE;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
new file mode 100644
index 0000000000..5e83b776c4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
@@ -0,0 +1,31 @@
+From e763c4db3ea639bc435ca7eaf5ae94ae4beed17b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 30 May 2026 00:46:47 +0200
+Subject: [PATCH 24/34] lib: Register `m_unknownEncodingHandler` with handler
+ call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/f66d83c9aecaa802174f95a1348a89f56e3b9441]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 1ae77aae..9c5433cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5022,8 +5022,10 @@ handleUnknownEncoding(XML_Parser parser, const XML_Char *encodingName) {
+     info.convert = NULL;
+     info.data = NULL;
+     info.release = NULL;
++    beforeHandler(parser);
+     const int status = parser->m_unknownEncodingHandler(
+         parser->m_unknownEncodingHandlerData, encodingName, &info);
++    afterHandler(parser);
+     if (status) {
+       ENCODING *enc;
+       parser->m_unknownEncodingMem = MALLOC(parser, XmlSizeOfUnknownEncoding());
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
new file mode 100644
index 0000000000..9c0370a3c9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
@@ -0,0 +1,33 @@
+From be50a6cd7ac802c27f370c0b9c61920738b33f94 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:41:00 +0200
+Subject: [PATCH 25/34] lib: Register `m_unparsedEntityDeclHandler` with
+ handler call depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/6e7c5af75a743c609fdb35627554cc7e940e6593]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9c5433cc..ea29489e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5855,10 +5855,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         poolFinish(&dtd->pool);
+         if (parser->m_unparsedEntityDeclHandler) {
+           *eventEndPP = s;
++          beforeHandler(parser);
+           parser->m_unparsedEntityDeclHandler(
+               parser->m_handlerArg, parser->m_declEntity->name,
+               parser->m_declEntity->base, parser->m_declEntity->systemId,
+               parser->m_declEntity->publicId, parser->m_declEntity->notation);
++          afterHandler(parser);
+           handleDefault = XML_FALSE;
+         } else if (parser->m_entityDeclHandler) {
+           *eventEndPP = s;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
new file mode 100644
index 0000000000..0e87a361f6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
@@ -0,0 +1,31 @@
+From 9e21ad00545e6ea8a02773d4565eb3b2b16eb171 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 21:41:38 +0200
+Subject: [PATCH 26/34] lib: Register `m_xmlDeclHandler` with handler call
+ depth tracking
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/91484ffb98ec138df79265e431a55823bc80c6c4]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ea29489e..f1ba05cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -4971,8 +4971,10 @@ processXmlDecl(XML_Parser parser, int isGeneralTextEntity, const char *s,
+       if (! storedversion)
+         return XML_ERROR_NO_MEMORY;
+     }
++    beforeHandler(parser);
+     parser->m_xmlDeclHandler(parser->m_handlerArg, storedversion, storedEncName,
+                              standalone);
++    afterHandler(parser);
+   } else if (parser->m_defaultHandler)
+     reportDefault(parser, parser->m_encoding, s, next);
+   if (parser->m_protocolEncodingName == NULL) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
new file mode 100644
index 0000000000..3f4b1ec9ed
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
@@ -0,0 +1,29 @@
+From 98218922a1bc94d6eb8371fb7f18abf0e2a76f08 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:35:27 +0200
+Subject: [PATCH 27/34] lib: Protect `XML_GetBuffer` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/5d90d1aebfe606af2550e92983cbe121d7eda032]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index f1ba05cc..e7642d8f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2533,7 +2533,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+ 
+ void *XMLCALL
+ XML_GetBuffer(XML_Parser parser, int len) {
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return NULL;
+   if (len < 0) {
+     parser->m_errorCode = XML_ERROR_NO_MEMORY;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
new file mode 100644
index 0000000000..f9564ec175
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
@@ -0,0 +1,29 @@
+From df1172fd2bc3e3be5319e788cb99867bebe6d3c5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:32:38 +0200
+Subject: [PATCH 28/34] lib: Protect `XML_Parse` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/b59f1865e6c0c0ab2c1623b9dfd53aa6fb85bb96]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e7642d8f..7234cc89 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2356,6 +2356,8 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+       parser->m_errorCode = XML_ERROR_INVALID_ARGUMENT;
+     return XML_STATUS_ERROR;
+   }
++  if (isCalledFromInsideHandler(parser))
++    return XML_STATUS_ERROR;
+   switch (parser->m_parsingStatus.parsing) {
+   case XML_SUSPENDED:
+     parser->m_errorCode = XML_ERROR_SUSPENDED;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
new file mode 100644
index 0000000000..d67bb1462b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
@@ -0,0 +1,29 @@
+From dccaa02c0193fbc5fdc0cf5991fa6d1400715fc8 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:33:44 +0200
+Subject: [PATCH 29/34] lib: Protect `XML_ParseBuffer` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/ef3267d5f8157862e33d87c45c6fe82ac26e557f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 7234cc89..769eb10a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2467,7 +2467,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+   const char *start;
+   enum XML_Status result = XML_STATUS_OK;
+ 
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return XML_STATUS_ERROR;
+ 
+   if (len < 0) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
new file mode 100644
index 0000000000..57dca36e6a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
@@ -0,0 +1,29 @@
+From c905fb91906554ed8132c2b11738c2bbdcafaf42 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:21:28 +0200
+Subject: [PATCH 30/34] lib: Protect `XML_ParserFree` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/827fbddcaaa8ba2171ef76a3223d6f403388635c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 769eb10a..4d2cedac 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1939,7 +1939,7 @@ void XMLCALL
+ XML_ParserFree(XML_Parser parser) {
+   TAG *tagList;
+   OPEN_INTERNAL_ENTITY *entityList;
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return;
+   /* free m_tagStack and m_freeTagList */
+   tagList = parser->m_tagStack;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
new file mode 100644
index 0000000000..de693a448c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
@@ -0,0 +1,29 @@
+From 9e9a6f2de2b9bd399011dd1685b235e0c580f312 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:22:41 +0200
+Subject: [PATCH 31/34] lib: Protect `XML_ParserReset` from being called from a
+ handler
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/34bc7e080a1b432ad9d6879a6c718f2d6f12fa22]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4d2cedac..0294d71f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1655,7 +1655,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   TAG *tStk;
+   OPEN_INTERNAL_ENTITY *openEntityList;
+ 
+-  if (parser == NULL)
++  if ((parser == NULL) || isCalledFromInsideHandler(parser))
+     return XML_FALSE;
+ 
+   if (parser->m_parentParser)
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
new file mode 100644
index 0000000000..cdd40ad521
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
@@ -0,0 +1,97 @@
+From 2e706f49a9d764e1170706acca686e17af82c095 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 13:37:01 +0200
+Subject: [PATCH 32/34] tests: Cover calls forbidden from handlers
+
+[ make void* to XML_Parser conversion explicit ]
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/2e16f4c98f1f28bb9da36108b60c181d77752acb]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ tests/handlers.c   | 24 ++++++++++++++++++++++++
+ tests/handlers.h   |  4 ++++
+ tests/misc_tests.c | 15 +++++++++++++++
+ 3 files changed, 43 insertions(+)
+
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e6582231..b5118347 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -1978,3 +1978,27 @@ accumulate_and_suspend_comment_handler(void *userData, const XML_Char *data) {
+   accumulate_comment(parserPlusStorage->storage, data);
+   XML_StopParser(parserPlusStorage->parser, XML_TRUE);
+ }
++
++void XMLCALL
++forbidden_calls_character_handler(void *userData, const XML_Char *s, int len) {
++  UNUSED_P(s);
++  UNUSED_P(len);
++  XML_Parser parser = (XML_Parser)userData;
++
++  assert_true(parser != NULL); // self-test
++
++  assert_true(XML_GetBuffer(parser, 123) == NULL); // i.e. rejected
++
++  assert_true(XML_Parse(parser, "", 0, /*isFinal=*/XML_FALSE)
++              == XML_STATUS_ERROR); // i.e. rejected
++
++  assert_true(XML_ParseBuffer(parser, 0, /*isFinal=*/XML_FALSE)
++              == XML_STATUS_ERROR); // i.e. rejected
++
++  XML_ParserFree(parser); // rejected
++
++  assert_true(XML_ParserReset(parser, /*encodingName=*/NULL)
++              == XML_FALSE); // i.e. rejected
++
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_NONE);
++}
+diff --git a/tests/handlers.h b/tests/handlers.h
+index ac4ca940..47623910 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -607,6 +607,10 @@ typedef struct {
+ extern void XMLCALL
+ accumulate_and_suspend_comment_handler(void *userData, const XML_Char *data);
+ 
++extern void XMLCALL forbidden_calls_character_handler(void *userData,
++                                                      const XML_Char *s,
++                                                      int len);
++
+ #endif /* XML_HANDLERS_H */
+ 
+ #ifdef __cplusplus
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index cdcdd507..5e490faf 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -742,6 +742,20 @@ START_TEST(test_misc_no_infinite_loop_issue_1161) {
+ }
+ END_TEST
+ 
++START_TEST(test_misc_calls_forbidden_from_handlers) {
++  const char *const doc = "<doc>Hello world!</doc>";
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  XML_UseParserAsHandlerArg(parser);
++  XML_SetCharacterDataHandler(parser, forbidden_calls_character_handler);
++
++  assert_true(XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -773,4 +787,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
+   tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
++  tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
new file mode 100644
index 0000000000..dda72a311e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
@@ -0,0 +1,39 @@
+From ea59c2c53276eb44526244def65a7be8f0d617ac Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 26 May 2026 15:41:46 +0200
+Subject: [PATCH 33/34] doc: Document that `XML_ParserFree` and
+ `XML_ParserReset` must not
+
+.. be called from within handlers for the same parser instance
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/cdeb65e1c4570861ce91c529e934a1f1d9629b3f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ doc/reference.html | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 8f14b011..fad5e1ab 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -1095,10 +1095,12 @@ dealing with any memory associated with <a href="#userdata">user data</a>.
+ <p>To state the obvious: the three parsing functions <code><a href=
+ "#XML_Parse" >XML_Parse</a></code>, <code><a href= "#XML_ParseBuffer">
+ XML_ParseBuffer</a></code> and <code><a href= "#XML_GetBuffer">
+-XML_GetBuffer</a></code> must not be called from within a handler
+-unless they operate on a separate parser instance, that is, one that
+-did not call the handler. For example, it is OK to call the parsing
+-functions from within an <code>XML_ExternalEntityRefHandler</code>,
++XML_GetBuffer</a></code> as well as the two cleanup functions <code><a
++href="#XML_ParserFree">XML_ParserFree</a></code> and <code><a href=
++"#XML_ParserReset">XML_ParserReset</a></code> must not be called from
++within a handler unless they operate on a separate parser instance, that
++is, one that did not call the handler. For example, it is OK to call the
++parsing functions from within an <code>XML_ExternalEntityRefHandler</code>,
+ if they apply to the parser created by
+ <code><a href= "#XML_ExternalEntityParserCreate"
+ >XML_ExternalEntityParserCreate</a></code>.</p>
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch b/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch
new file mode 100644
index 0000000000..54a512d621
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch
@@ -0,0 +1,39 @@
+From bcb2de3b2b03bb67c892dc3c6ac51795c5fb50a5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 14:01:51 +0200
+Subject: [PATCH 34/34] Changes: Document CVE-2026-50219
+
+CVE: CVE-2026-50219
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1246/commits/f17ca46befb59098da339ed6d2438de3bdece8b5]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ Changes | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/Changes b/Changes
+index 4265d608..b8755c15 100644
+--- a/Changes
++++ b/Changes
+@@ -30,6 +30,19 @@
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+ 
+ Patches:
++        Security fixes:
++           #1246  CVE-2026-50219 -- Disallow calls to functions
++                    `XML_GetBuffer`, `XML_Parse`, `XML_ParseBuffer`,
++                    `XML_ParserFree`, `XML_ParserReset` to guard e.g.
++                    Expat bindings from memory corruption;
++                    this CPython issue is related:
++                    https://github.com/python/cpython/issues/146169
++
++        Special thanks to:
++            Asher Darden
++            Matthew Fernandez
++            Yousef Shanableh
++
+         Security fixes:
+      #1018 #1034  CVE-2025-59375 -- Disallow use of disproportional amounts of
+                     dynamic memory from within an Expat parser (e.g. previously
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 151720a9e3..cda545d624 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -51,6 +51,40 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32777-02.patch \
            file://CVE-2026-32778-01.patch \
            file://CVE-2026-32778-02.patch \
+           file://CVE-2026-50219-01.patch \
+           file://CVE-2026-50219-02.patch \
+           file://CVE-2026-50219-03.patch \
+           file://CVE-2026-50219-04.patch \
+           file://CVE-2026-50219-05.patch \
+           file://CVE-2026-50219-06.patch \
+           file://CVE-2026-50219-07.patch \
+           file://CVE-2026-50219-08.patch \
+           file://CVE-2026-50219-09.patch \
+           file://CVE-2026-50219-10.patch \
+           file://CVE-2026-50219-11.patch \
+           file://CVE-2026-50219-12.patch \
+           file://CVE-2026-50219-13.patch \
+           file://CVE-2026-50219-14.patch \
+           file://CVE-2026-50219-15.patch \
+           file://CVE-2026-50219-16.patch \
+           file://CVE-2026-50219-17.patch \
+           file://CVE-2026-50219-18.patch \
+           file://CVE-2026-50219-19.patch \
+           file://CVE-2026-50219-20.patch \
+           file://CVE-2026-50219-21.patch \
+           file://CVE-2026-50219-22.patch \
+           file://CVE-2026-50219-23.patch \
+           file://CVE-2026-50219-24.patch \
+           file://CVE-2026-50219-25.patch \
+           file://CVE-2026-50219-26.patch \
+           file://CVE-2026-50219-27.patch \
+           file://CVE-2026-50219-28.patch \
+           file://CVE-2026-50219-29.patch \
+           file://CVE-2026-50219-30.patch \
+           file://CVE-2026-50219-31.patch \
+           file://CVE-2026-50219-32.patch \
+           file://CVE-2026-50219-33.patch \
+           file://CVE-2026-50219-34.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


