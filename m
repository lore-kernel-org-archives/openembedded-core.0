Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9259CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 12:01:26 +0000 (UTC)
Received: from mx-relay190-hz1-if1.hornetsecurity.com (mx-relay190-hz1-if1.hornetsecurity.com [94.100.128.200])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9311.1779969682710738347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 05:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=mkCZNGic;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.200, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate190-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.83.90, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=gvxpr05cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=jAtRnCN2f85Mr2q3NgtHocIX/vjmhgX4oDPsIbnde38=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779969680;
 b=hYRQPqbucnQ0oFHqEyFg+bKRhJqxFIkv8VLRVErpcCEF7FwrDFWQ9RDo0TeXoAeH/s1DCKYp
 F8nPPQNQWzgZ0dbgEGg5EgRO8fmsT3RuhFzm0O+LUnKwy8+0T6W7H4N90VCXJXg+zpx9JNsEBwR
 Uwvd4Ft7ciMOEVFS7z1Nl3mIKrty0qUnT8mwEtkv8rBHcc7wpNTzkOYmvhyEuXGsu8+1QL/8n6D
 ziyWwptRcPNgoxtf4WnRLxcBI+E5VHENwEe11v+4ZfI5W/ovEeeTKL4LkTbp6zqiUKIS7RvqwPy
 GLgqBZK20vn6GErY8dluz2CLGia1FEhc/U2rD3vYyHGMw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779969680;
 b=rTag7LR4AIzn7jzibdJseaaUiijzuZGpMMjtO7BNNa0FN7b8qPzGQKJGoG8cMoXIezHs3/9M
 PIZLhgWNiPe11s+HYFAZeA2U6dLNpqc3LVdeqzhpiz3QTF7VWgZ4X09fXA6axfKmF+054LyYdau
 IpehkJNRs3Ohbak/luTrm0Q3D5qlzMNpXYjg+4lvKzVgRZbbgb5mZsiUKGY7WuA85KkFLKIh7Mr
 mqAtE4VLVzAsg4PYUSjJGwwtt0XPq3cD3o+O7Vl9aIq0tke2tYWXBH+03bQelHLRzHHuA6F4+61
 vyo11KSh+jPPxAtvr8q6X+Ux5zWBE3ctade7YtJ1yYFuQ==
Received: from mail-swedencentralazon11023090.outbound.protection.outlook.com ([52.101.83.90]) by mx-gate190-hz1;
 Thu, 28 May 2026 14:01:20 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNxvnMCNJkk01Cpj6Lr7wQV0F3Lh8S6FYnNkuLV24NizD2UzWFJ+sX7r4+fxtqKNCn4IkVcZthg5zowLMlTKxSpntiGNGs/YG66z6xHUWgdvBjL98e4GpOHfxyJqXqaZh/jVaaqHMAY5fmOCNSD75e1jYOerO7Ian8WeBBzNtSDZYAA2OH36GrWfubiZ/rpmvrqOfK1I589J0aauZnutsabIgXQ4h6Gt8ZhH+vohPwkZVpW299X1k0s1Jg0FMh7vkxrsX6r5GogjIymGwfjBeLBrpL/xFZTRhOTtz3RFRCqGsH3YgleUJ2LJqOiTK3n/VoufS/uaABDQcC+yVKA/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAtRnCN2f85Mr2q3NgtHocIX/vjmhgX4oDPsIbnde38=;
 b=JP4IPVPE9sKUTHww3kqztVxxyR0DsHw+fQxO/9vrH58cMhFsPXFlkh4J8QCEZV4l5wm+hk3yw8qYQ0FbYCkuO7Lzwbr3K65HmJtTFlSjnWMhROXZAaqrg3yYgKzHLJO9QbpUBb0FfLg4+H23IIk4eSpSIFAC64LdCu1XQ+W9poUEjlNCGFay1vnxl8a73Qm4NZq7+ilFNDiqqXAFGGXPybtQUaASADMms1rXB8fETowA/7vuvL6VN2NBCHr7COrWlvtbV5RJkoNz969HIK2xUwdQw0mv8d2/NQZaXCH8n1q4Ashm/w5MtrvNwbWW40VY0LYc9UZKorb19bFJ+ZakBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAtRnCN2f85Mr2q3NgtHocIX/vjmhgX4oDPsIbnde38=;
 b=mkCZNGicSqkGLqwzD5IlYXYma8CrvRqPhwWtG5YCy/FdPAaPp5bIG0l3LgI0WyLi0dTBWSYOVUslbnYydUAC81Deo8cd7RWBAQPv971vvysr2vTZrtdtqO7egOLH1hwLv5PSV6jyw61ovpWNtwpIFy6WhX+bcmNM24Zl6D2lH2kSaiiq7CksEmAuy7sGJTptxeTyp+0ZDrSrrADfDAE8GwBkylCR8IDrU+Uh8BzomAV5KR2BDpiQ1CjNfzzIUnbyElgUqZx+Wv1Hi/JMZ2xshkCDg0YdoHocgVTpLRgdenbLCwK9c+YwPHq86SaZqMIvlJe/msDtKLVzlX36I5eEEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AS8P192MB1399.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3c2::17)
 by GVXP192MB1664.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:6e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 12:01:12 +0000
Received: from AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
 ([fe80::92cb:30a7:4e3e:18fe]) by AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
 ([fe80::92cb:30a7:4e3e:18fe%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 12:01:11 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [wrynose][PATCH] perl: patch CVE-2026-8376
Date: Thu, 28 May 2026 14:01:00 +0200
Message-ID: <20260528120100.1801387-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::15) To AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3c2::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB1399:EE_|GVXP192MB1664:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f16ec6-dff2-40cd-1df7-08debcb0cf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|12006099003|18002099003|38350700014|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	OlG/LKM8Nu3AnB3svkw2OtZiq0t8tQGPS9aA2V+4WqiDzH0oGzNXTuugkZ2IY31sP0D7SSXcw/ZZSazBhJJ0SCEHAjwwdfzi5kSVokJGMpVWRxDvYSGadF8QhjnCa8UDmFh81YuVw7Pi8djHx/IOsy8WX9/IzVeULhZQsIYMMOJHIZUKYknxxBQUw+7aZwGVSPXAfqkxJOdNpmK9UkJqCCPFNktVotOQgSAag5JZ5/uv2AGctEW7Xe9FG04Om1i+fLPEeBKz/wNIQMXQ8w6ko2Uvt2w2plGzf1DHrFvZXf1SynQeyNHqaVzpWEpRMATFdwlt4hfNkJsyZsjJ5TgcxohWhmZF4TirM0ZcwFON6T+IZJxZHcx+1T8HcEB0zByH+jEREPfwoxdEFoGZJ+9iQBPSnHg+K961BUwIdnVvKFVT7lv1x0+F3CLOWwcvDoS+hJIbC3EVf+HFaIlScF4VBdXj4HxknPSDpDQydiIvsZiJLAZ7P1+whqFbjSNTTiw1CXrwvJdX6uWZNiiD2NdGDVIndXnBj7xpUfL7N2MxLHZ+C0buw9FxzZxje146bxXAtra5HIIfT16UTsxD2OQjSpoeQ8OouePk3UB09I0ZnvPghp9TChrkkvwR5TLB6IzFQWlYkvkpWXqau3PvbzWP1iIy2CF/vLNEkCecu9OVgYZpgIkrlqVci3s8IafLmhAm+hXd9EgTM2Y8AJ9v6e8kk8Xf/fR2U8PhSxS1Pv6NXE0302WnbFsegHrmhcC6HLvC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB1399.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(12006099003)(18002099003)(38350700014)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kAey0yUhTBMtpqFeynPrKMybwBAWaaae0Eq9TMcfj8Zo6SkjYluOK0CnoHSw?=
 =?us-ascii?Q?sllpbzGDJRcyLebNfI+wbAwbKJgUCK3ioQqI/6q30Sa6DmADRHITc4q+R14i?=
 =?us-ascii?Q?QXWTDK2Fkh9G2i/GCb5lgTXFgnEyRonmjr80wu26L8loAHU1JmbdNo9dekFw?=
 =?us-ascii?Q?AH3X88b4b2znQxrs6naPynVeFyhlxKJapBhd9bwxQeq8mYG7DJ+VRgMbyiuE?=
 =?us-ascii?Q?9rF1C1mWBQB06wSAvti61PADb/Gg9Ux/KOjmSxTgIn0UsZngOPirK8+Tt1Qb?=
 =?us-ascii?Q?ElNLx2iJGnZs43OgxDllT4N+Xs4Ogj5iw0d5ANy1Vn0G/X8wAorfJTlSnzWM?=
 =?us-ascii?Q?Ng8xJwtK1davfwDuRtfyzc0DwL7EQsqkGauvRhjqF1qP8ydnR13o1CBu5CrB?=
 =?us-ascii?Q?rpZdefDZxjkyKEZ4x9y5XGD6S9YFMkB/mkynHXNeDtM/E6gEMupR+yRG5KFa?=
 =?us-ascii?Q?TC5nQKofbDAcdCb5OGtYixZZLAgOWM9Ej4NcKnxTV2+7F4CAatxTTRUgH1Ty?=
 =?us-ascii?Q?165p23LLntagnri4QkaPxqF++5YrA+0C9lDQUo3cYf6vmKmsNm6mdVu/iLbI?=
 =?us-ascii?Q?lTXbaFCLMaWJKen0Nq1YpFTjl0hld1F5BIvXZXrsUQr9dzCF0OVym9RIto7V?=
 =?us-ascii?Q?OzoGUDBr2amE98mBkholiN4gARIk3z5rZ0hAfVlQK3w2zc1WiiFB0n0pVvA2?=
 =?us-ascii?Q?AW6rEszCSN7Iq1xYrQMqXNLoOMoClT+6m/O5f5Ex4JvgJrsPuiC37xtO1oNx?=
 =?us-ascii?Q?43zUjdbBgiPrSqlAF0U4zdQ9KT2AwTb+VAtVGGkJYZkkpUGmIu5wT2gyiDRV?=
 =?us-ascii?Q?h9XnquSO88WJwbvcEM3FNBpWayQRBz+jOrzZIsJ0GA5mQc+i94/xXz7o6/Dh?=
 =?us-ascii?Q?1RUzsdbgrc1ALG28jfoYraHIJbUjDc5eZNYSM9sC9S9iMyBbE0UwB8OF1ec9?=
 =?us-ascii?Q?FJHLNrTCjXHKeS/QN9D5xVcGu9PaXHPllQmIhWE0SpmvGwFmrh9ckCFQC2uL?=
 =?us-ascii?Q?PvnTpzR3E+bl+ooji6+iiRzqqyD9KnteoGQUgPX+T2CU+UkiADDAjHXBG1Ux?=
 =?us-ascii?Q?UF1f4hMq8VPLgd68oSSlV0IU/0M1yNSEY0lkx+yOA/zxto6LbsSu2mSguda2?=
 =?us-ascii?Q?YAS9zPtxoamis5qBw9+HM0cTPRT8P9PTwCLyie2ZAaFkiM5Za3+inwvrtr32?=
 =?us-ascii?Q?IkbGGFq6MaaWbMXSLRggNkfHcBE7iRl7ns8Xc58FngEz3S2TPDLWk8QPrUxI?=
 =?us-ascii?Q?ELoRaCHcXEunIt6OXTXZwv1OFRXb0nuQS2uJERgiE2XoMgqru9xVSiea0Y+0?=
 =?us-ascii?Q?gBxV5v8L26NjukMUY63DuDMRwYaaNNBN0tYg4onPj9lkxjErjW82wDEDBofU?=
 =?us-ascii?Q?mstrhNolQ82Uo5gwNBQ315Dc2jaOzloE8Wi7ZnWxYyLa+2VRKdJoaYgM6M6O?=
 =?us-ascii?Q?2PlcqsEWnROLO+jhBr+OwjY7zfjs/GBRGnhpQEDyhcXYePrsyebQCumCYIJB?=
 =?us-ascii?Q?/iD8iamZtl+NMCVGZJF609H/IyzsKvZZy+3l9wn3XsP8iGIwH5buLOKUfRTP?=
 =?us-ascii?Q?uItZ7zq46P/aeDfcH4oM9cf+5YxdYgYVc9c2Fi968CQxZaIpLnN+BmBi+1yj?=
 =?us-ascii?Q?cSYUnHkO66UQzOSEWv0X2ldHCVcn3StOCbkBRqUwzeuatsjVbtjOgb+/DJnE?=
 =?us-ascii?Q?iOZlQcMWkZWifnHnWYDOORMJmEU/SeuEK0CQ4/tHhQxvdl9Ob6gLEWOBpAgg?=
 =?us-ascii?Q?RZnl4jPXkA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	MFe05bMdQG2ov46gGDXOqjTBHbO1X9QhBPaAsayzovqolP1hKMXTnt/YH5St5mtFD6NU09fIhpANGn2Aa7ioguVZHozqsmKuYm6cIbW+lISjYdX4l8KZ83eRHifciiHXp0O6TJJOsrZUHaoytLBZAPA0otV9DVEzs6Q/Q8bK2cLyBOIRAbXkoMM1dPjNTRaIEbtwY7Eve2w9R7fhVhweZteFjbTDSW26GBKA3bnJyK86A9DPmlTXLyibh6BsDce0iCK6IzDPzEO70QMc4S0ixjAGGkj3h4D5fbGz5cno8E8XmmfsnCrj6v3QTvIYHuQy7W4BZwjnkF2HxVZXOLDxdA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PDpfdD55yGoiylz6Lm2TYyZ3EOZPANIzSfV9j3zvqki2oLTCfnr0LXvQsFaqBXYWIUwocbuR9mr5SdcfXQmalxzZoTltnDmdJqJJpaO89MS4OWugN1uDKiA/nRd6xnkPdDyNDfgDR14mqhWYzqN61Ygt64nQuy1iDd239gi55oZoirl67gP9jCM04p0XHhrhUBb+GRONp1hq4e4oy6nS1tSO/PVNOK9qv/QizmKJAVNZWqiKOBr9gV7D4JC4yurGlaiyf8o7QlLfjVSKlW2eKNYu4ai8CIrtgqnDXpEMK1uPNJ0sMp7Shu9LJcOcrw3W3lfCRlfv/A8rfHf8uN0C7OF4XMjyX328FYGyj7JgJj0GgWP2g0RIcD3ZOYmx089/4O87rruZynH5DX+GYNDRHlyWDXHk+OOTG3soa1KWx5gO+yosgjwGX+PV7jkXsnV7phHuCrRk70AEpytTcSgFFliCkRqP/hZbr9nDIlzwXABAmTUFzg+VdS94Kn028DazmL2w8V5ghcRdkUwDh0IYQn++5mNXi+Un0RQoPMhPjXULkqoMo1T1Py22eGxLnlgUUgUeg72zEtEeNJTiJTDpIA+ax8sx5bkPrLqCc9vOYppULeWYc40VnL8U13RQi/8+
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f16ec6-dff2-40cd-1df7-08debcb0cf9c
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 12:01:11.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P4rC9RebBi3zIeZySmMEANcoOrmtpNc+GfwNoGh5LKJmlhifMjPt8A+50zxeN3aEYckulFu9Hu2V3VS22ZH5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB1664
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate190-hz1 with 4gR4p12vVrz3FCRZ
X-cloud-security-connect: mail-swedencentralazon11023090.outbound.protection.outlook.com[52.101.83.90], TLS=1, IP=52.101.83.90
X-cloud-security-Digest: bd8d821d27308274e600333fbd393c3a
X-cloud-security: scantime:4.509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 12:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237701

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/Perl/perl5/pull/24433

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../perl/files/CVE-2026-8376-01.patch         | 62 +++++++++++++++++++
 .../perl/files/CVE-2026-8376-02.patch         | 49 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
new file mode 100644
index 0000000000..2b5d27147a
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
@@ -0,0 +1,62 @@
+From 6ad242ce86b16b74437e6815d507bc003e77a948 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:47:31 +1000
+Subject: [PATCH 1/2] perl/perl-security#147: test cases
+
+The suggested case from the ticket and an alternative.
+
+(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ t/re/pat_psycho.t | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 336039521d..73a7992372 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -10,7 +10,7 @@
+ use strict;
+ use warnings;
+ use 5.010;
+-
++use Config;
+ 
+ sub run_tests;
+ 
+@@ -31,7 +31,7 @@ BEGIN {
+ 
+ skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
+ 
+-plan tests => 15;  # Update this when adding/deleting tests.
++plan tests => 17;  # Update this when adding/deleting tests.
+ 
+ run_tests() unless caller;
+ 
+@@ -211,6 +211,20 @@ EOF
+ 
+ 
+     }
++
++  SKIP:
++    { # sec #147
++        $Config{ptrsize} == 4
++          or skip "these only fail on x32 and use too much memory on x64", 2;
++        local $::TODO = "This crashes";
++        # original case
++        fresh_perl_like('/\x{10000}{1073741824}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow");
++
++        # synthesized but similar case
++        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow again");
++    }
+ } # End of sub run_tests
+ 
+ 1;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
new file mode 100644
index 0000000000..a1fef66119
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
@@ -0,0 +1,49 @@
+From 0fc9c70ccc0fea260326e08baa60d92797f8a79b Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:51:00 +1000
+Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
+ lengths
+
+(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ regcomp_study.c   | 7 +++++++
+ t/re/pat_psycho.t | 1 -
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index 9106452dd5..05f1b017b1 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
+                                                (U8 *) SvEND(data->last_found))
+                                 - (U8*)s;
+                         l -= old;
++
++                        if (l > 0 &&
++                            (mincount >= SSize_t_MAX / (SSize_t)l
++                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
++                            FAIL("Regexp out of space");
++                        }
++
+                         /* Get the added string: */
+                         last_str = newSVpvn_utf8(s  + old, l, UTF);
+                         last_chrs = UTF ? utf8_length((U8*)(s + old),
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 73a7992372..9fd764fd5e 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -216,7 +216,6 @@ EOF
+     { # sec #147
+         $Config{ptrsize} == 4
+           or skip "these only fail on x32 and use too much memory on x64", 2;
+-        local $::TODO = "This crashes";
+         # original case
+         fresh_perl_like('/\x{10000}{1073741824}/',
+                         qr/Regexp out of space/, {}, "ssize_t overflow");
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index cf28067bab..1833b7a352 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://CVE-2026-8376-01.patch \
+           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


