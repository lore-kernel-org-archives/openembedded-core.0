Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A17C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:47:08 +0000 (UTC)
Received: from relay-r19-hz12.hornetsecurity.com (relay-r19-hz12.hornetsecurity.com [94.100.138.219])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41923.1782902817583006200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=r7sjyZma;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.219, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate91-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.124, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=TqR4fUncWu0U3esKpvMPLnVchHCYcVgxb7emE2faLTU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902814;
 b=pJ42RxIa6ubLZV4P/9jlEGk2vggFKo6Pj7U3S2g5ohItlu1KO7yELhuL+pIp9yYBMfjji+Hi
 4Uno25BbonduAwWNjQyhg9bQ7G/V2A3o/7kMfTu6ZHSIwuuNVZMmYx2pV7+ivHBNtMelHCUEAXh
 izkClKck1JqrNHxV+R0YTRxNTLyVNURRgY64t/ZFyWSl7xd2FyhdotDFSaylR0xltzuxyE9u+SI
 wBl3EgC0HH6mEEu6qnXNM5Kh8Uwxqjb17tibeKGDnBIT4TcxDE17/ktCa6WIohiz04NsuqUxjsw
 F7pfAT9GYiZwV0LoBxslrR1oOdcHrEcG8KjTobpcbe8YA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902814;
 b=Mu4zLwsKBZ0VZm4CTGcWDCSdBDgKBimhbyyBvSXVpx1q5hkCggYs0FV372doxgsE7W1QWY8h
 YYJS1JQ0WObnyy0oExN3qTRMpIWSriR2UuWNrbUM8wHj4Za4bHIU7X52QnoJbd19/PUvqh64vBK
 3FqTkRw2BPHjGPWQzfmDJjl3xgwqRM1spcehinKV9lq0QR7L1UWElRLf7hWlTpMNK8kApcd5g73
 RlahoUrmc3PCnnWBFR82JwMxp1PkcaE3SMfk6ednjQu9QiWUV5z5TWTBGJhhqh33Sjvy4SLmeSj
 TQdDM98A+ZPPX+6Q74if9MzbzEcHKaNCFQYziidijkwEQ==
Received: from mail-northeuropeazon11020124.outbound.protection.outlook.com ([52.101.84.124]) by mx-gate91-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:46:54 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvLbcLdHF5dSB2OWxvfX7UGbBjVrGzxXeLI8si9oGwzGVLkX6VMIvD0NPrVylQBf0D2/pkJZEv/Uf21xSs1S/OoHCmtdDGk7R9tkS5tCFQmPwqvZ1IVf1VC0a1578ug66ySwjSHcld7YklfQHHIX3d0J+hvXXUjPP5CqkBxVrOoj/tg+XJiNo+qhOR93BbY9JItt4WXYhhUzNgaiE8GthjPytL630t2uViSdbLoX3CbMUBKgGWosrIYJ+mOBT3zEHyN5kHIWHvnORVWDMPRec0Gu27aDQdCYpWmnOWlZbEsIHVC20dI5kC0WF6LF1CdqxboPEmh5HW3/LgJqCqO5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqR4fUncWu0U3esKpvMPLnVchHCYcVgxb7emE2faLTU=;
 b=qTylHMEBe9WInsWBby7g+VuqVl3Ax0UmGF2CSankrVOF+V5hX2dRAJkk5onRAYcuaiKt8CMyVdS7UWdXMjcRgBtp66n+vuSYXVzD2HJOVrpKg2CxciDzjtFv4hFaycartM9w9D09Nf9H4Lqh7fvMH81D1LnFkiBKpslsiGv4ru8NW91Sg+71CINp+E0GysvopPKfDnhTiPtL7Boase2Y69HVFuffWdKnrNZS7KF84d0bzBfDnwES9RzcTyl94Tls2BoVfJWylVaYkAc9dgsgg9OZLRJ4kyL/fLZN/rtIekCTkZf6elio+fQ7II1Op+SH7tukfuOgAbGGPMU37+ZHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqR4fUncWu0U3esKpvMPLnVchHCYcVgxb7emE2faLTU=;
 b=r7sjyZmaczXg58FsMnge1xOgS51r/x055C/jJkUEiiH3RPAlYbjc/LWCytkES3uR7A4bOPyFuGs4jF0HQgJI/U/0wwwAQMKtjaGJRwpVxzOTHlboM3hJK2XRf/veCFPUXaoLY1MSNnHtKtCVYevFQf7NUC5Z79VoQrcGsT+tbtG/VMtwF4NuWo/5VGjwhPGcsroT0D/vD5BJ6zlpylyoFwl+IXoFoiwLVrm7SEThmvAFfI8pOpVoUrtQ21uH25n4uaZDiAku0kwyfNYuqN97Dsk66ZO32wb92XQjUaBAwbPe/U0JqEdhC+KtIgN5J5t9Qo6DdDAT9vFfEuQyQBlYdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by VI2P192MB3195.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 10:46:48 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:46:48 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [PATCH 1/4] dhcpcd: patch CVE-2026-56113
Date: Wed,  1 Jul 2026 12:46:34 +0200
Message-ID: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0275.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::10) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|VI2P192MB3195:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5b5972-ff68-492f-9ee8-08ded75e0d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|52116014|18002099003|13003099007|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	+IZMIZ7HKua9Ng00KfD3bG6kupxZtskbZy5mLoFuWkcI80p36SyLMGWnNyu3GVvbqL7MSec4oqmySA/QuKLJ4xtydp5yje6SgGpl8nMEXERZQ5mONMfZ792y4VTiXajZyzE4Y7CWHeMZ7RBAJXT6oOmJ+eP6DdwgGDmKGIjPah3D8CJUpcHUGRLeYG+jrPxzGJFUKyEbhLQbvh8Rde24cDXq6GIcH34JVdYFezp8tbIyLgDxd/F62KS6jg518b50LAJNP0zqUxkGYEXyuYmkWSTI35Rk/Euf8v8+11w5cvI5BZfJJSyZiZy6ArIOJCxENr890UDw9V6UFW7I3ZPwK5qCwuuAFmC/kG75dD+dP1gi2eBwBubWVDaVrAzFlmlJk3WcpXKARlnSQVTRikq8zzklNWhyE7SmVOeLZH+gKGJJ6A4LTlD+tS54YYLt9D6oKyMVvJUWdddFeyWNVi1/Z0hQWQTeEnbwFQLhzLa3SNDdjUB013dZYl85dBLGHputxbyxKlbje4wS0sQpAYX04Qus0cDI/jazTDX6UdnYrW97nBzbLN4BxtKnKWpAZ8oWzZVdyD3z7vSzoXiTtsmsUHX99Nw+Yf2uhC70Tx0UM/m5mqA1tYAq//H5JcQrQCstyarJBun3JbsYR1WYJfUUq1hG4hDRf+yKz1AHzjdwFhs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(52116014)(18002099003)(13003099007)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WU/8Op8mcPHLnDJYkPGjgn55QtAf3jLr6oCIp32p+NX8lCjYEwTZtGkz3ISI?=
 =?us-ascii?Q?OkbNRvSu/JRTSKHY9jncZk/UvUov1PG1ygRfnAfPsFYlm0TRDDbYtfdxWk1R?=
 =?us-ascii?Q?FMtjF2xrGWek1je/JobZ8THNrskAhDXIvMxqaQ9uBHNlnTGj6Xa66T3vFLbi?=
 =?us-ascii?Q?llMiFSni670pas0fRjmpljuVjheuegDNSvpgyCl5KMWPWQmXyUP7Yh0aInNa?=
 =?us-ascii?Q?3LRMO3iezzjHAU0cdt1+SklUHwB9sb+i9+N9u9oK/23wa5aCuguy4CZL2mKI?=
 =?us-ascii?Q?wHifxhlldaLLtMS/ODS6UFufuZGtRo6a4zDjsp95HQpZrSQdun88uass30Hi?=
 =?us-ascii?Q?CLapRf8zvnT/4mMApg/bCxkqa6Y9FOHJRFrHF5ep4Ah2QZ+qINtPgZNA1Hc5?=
 =?us-ascii?Q?9n0MUurUAowQne1hAn+qSV1pDsyXICZQXV/yfX6YkGMqy3uk0nB9taiwF5DK?=
 =?us-ascii?Q?rTzcNEee2FeQGjsQnor1IYPOexXlWm0lZljwGQ3l6x7YemgqU5N3uJJSc9zg?=
 =?us-ascii?Q?LzkNdCIKOV936kJakBpjoYZv2IR+oktJbSdt5fxk1MthePYoPjC3lCZ85tVN?=
 =?us-ascii?Q?ULaXzaQzKBoukTnGglYgMVaMueEFZ4296u7sr4cebD+P4ai42jQHQ750djLQ?=
 =?us-ascii?Q?TRGQecfEoZHSMI5mv/ef0s/4VDG1Y0NeSPta1m1+AozpYs3OVFC/sfZnNWPW?=
 =?us-ascii?Q?dZDWXHf9UElYgvuLHXjG4s37WUpcYo5PZNqso+33IC3U/VAEl1uKSEuVDT7V?=
 =?us-ascii?Q?qYS3xsCgcAq7VeS0Z7P4Hj7VT6buZOrFoS5GuTrAJkHRNLdof53CzQtdf8yB?=
 =?us-ascii?Q?5D5303KCn4Wr5A+j6/S1AYfRFsl0OlVi+2pqWPh83meNegO4ekfVi/h3vcoy?=
 =?us-ascii?Q?vQ4leax1B7EUH0Gg1Bso4T9aP0N/sp2b14j/gdMj/He76+0JZua66tO4Tqas?=
 =?us-ascii?Q?joiS0jCNRd3Tq2d2JbcIn6XhY3itXj4UkbgnhhDzCmcX8gYuCKP9ZBegHtTv?=
 =?us-ascii?Q?N2rkWFUh/GMS0lyvlNo+ioPYZSVDw2032Yz0EPQUsP5OKREl/esEYsKinooz?=
 =?us-ascii?Q?gPUhHy5mcqurnARqT3MkV9bK3bQUL0eMOL0f7yBntr2i/JPWqH2hG3NtW7KA?=
 =?us-ascii?Q?sVzuWVrn3pmmsXtGe6QbGWo62D4doVj8y4unKcCLJ6emLAXlSWymCAT/yuYL?=
 =?us-ascii?Q?/HJLf7XdFnGtNdUsyHqvSr8BDtBfM5ju2wA4e96XV8PVFFUXikpQq2+jSx0b?=
 =?us-ascii?Q?kIXJzXpZ44tr+aQj0tsa6Gqj7xeJ7UcXeB6WjwxOQo6iuAGEWTpgjbGVGXBX?=
 =?us-ascii?Q?xD1WVcafP/ALOFi3Svy4QijJ8O8ky4fFtxa5H+CqXoVSH+tzoRccWJPsfb7G?=
 =?us-ascii?Q?3MwO8aYWAUtvZpJyGSet49efXU+BAf8rwQvqW3+udxUkMTmnNyWSC1lvRblh?=
 =?us-ascii?Q?Skn+p/36l4csHzFqY8dn3PET99BJLUVub2aEYi7oTjRjoQpau2XDtN9pWgh8?=
 =?us-ascii?Q?cjkEVcfHGkCDKLQQw7PrM0xA00taNdeAcaPq69q1Dg9tURF5jGD6OvVmCzgb?=
 =?us-ascii?Q?GW5bCd4OSn5kzV6x0jSIuTbpH7zRR42JG/n/i7oFcTIGBgbeWbEO2yOZV9Aq?=
 =?us-ascii?Q?Hp/3IoEYcQK95tDvGh6ht4EaUfbjoEadRuXf5ThhDsWL8mwZaL/BKErdTWfA?=
 =?us-ascii?Q?Y3Cwj4CYCF/rLNxjLj/7XAwJCdDCpNhwOuATy8DrRfCYfFmzh9OPT6MXsW42?=
 =?us-ascii?Q?+EbR+29Tgz8p8lE2/di/fkQw/IMjjeNqvL/e4uZ/5spU7fjSH37OpYoQCC3p?=
X-MS-Exchange-AntiSpam-MessageData-1: 1Nb77pl7wDXQdQ==
X-Exchange-RoutingPolicyChecked: 
	GRUiJIapfz4/bV2It/DgZyEfe9pSpXdZ02tRYoFcmUaCqGEDDfIsK+8hYtBJC68ekoxCuEcWhWNdlmAFniUFlmCShJYG3qzuDCEG9G8N1K/1e4/5s1fsjnY86Ir9wnJCmrEQPDHFsVwt7qOW89ZrGrPnJ4f/AMS1cf8ldafKXvHqsaznCjjII684ttYzK3dnOYrbB0d9kswnG6Bh/QaEzjodK8HOItcDPmh66VAB18/qdVe6olcNmW98EWfefcvTX2mgO1V8DEJTjKIqZlUhbeaXlrfmiz3iT/O8nWQ8dRDvYeN0sTvkPvSazUK4CDQcWEISnVGrr5y/Id8MyDIt5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ans+3eHqo1PzwMkj2DaX3acmcEO1ol/r3kI6OuH7BJ7wjZgW20uIR26KPWKlBdAIhxIAI2fuCRQI1oG6mw21cf9TsvnL6oZQVpCpZo4hnQiSciKlu83dhD8mVR5U35pUx2ieFLGGvXe/HayKfhP5e86Oj1gDW/K7HlM+5g4svyDWVUuTimSkJ4mi5x6HR3vq9QWmI3DbSBD1MN5RXhCV4rWa4wglaAv2T8Lr33PsI0GN+zuqdHbgfEDspmaN3rBHrbQtqHqifUDk8f1ASml9ezMTU94xBGvcorCrGq3qq3GzB+nNkOUkcEd66gD6dVHgQxLdV4cvfWKD7ZjWTqH6CfSsPmlvRMu8s0Pzuiz6cqaw5sB5hJizYeDJSeLPUokaFs7dzegeKXp9HFLbIRv3A2SKY3uHEEGG1m51EJapjMylodtSQJvDhsPws8xl7CtJZz+5Z+xQJxoiJSezc9MnDpNIo8Mmgw1RYZkrR9jHsQBOJJwh4FzYkLLxcwiQQXSEO+FH6fKPypIpD/OLZkBN/Ywj4VGPJaFYy/QYutOGiPadxrpuuEEHGxNLUERFwAdlUCbJSZBGJ0Cp2+/BgBLM20ryFsjejIkLtb/M+Sqd3alm3E2iYBjBnBcMCaukcH/X
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5b5972-ff68-492f-9ee8-08ded75e0d5f
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:46:48.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY808RvI35OkOmxovkvOhN6ZAspKLJ5I8bjYG1IomY0S9yaqimIQbZwEeJGh+QKNBUgsk9E4jA95dHDGFfgC0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3195
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate91-hz12.hornetsecurity.com with 4gqxXW3wWNz8FvCk
X-cloud-security-connect: mail-northeuropeazon11020124.outbound.protection.outlook.com[52.101.84.124], TLS=1, IP=52.101.84.124
X-cloud-security-Digest: 34811824d10232d3a91deb810b42d363
X-cloud-security: scantime:1.206
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239962

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25

[2] https://security-tracker.debian.org/tracker/CVE-2026-56113

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.2.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56113.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 6ebfc19532..12ba7a1152 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://CVE-2026-56113.patch \
            "
 
 SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
new file mode 100644
index 0000000000..14095685ed
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
@@ -0,0 +1,92 @@
+From f0e7f32646004a472f8322bcee4a38416f88a130 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:17:10 +0100
+Subject: [PATCH] DHCPv6: When deprecating addresses, restart on prefix
+ deletions
+
+As that might invalidate the next address to iterate on.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 5733d3c59a5651f64357ac11c98b4f39895c8d25)
+
+CVE: CVE-2026-56113
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 91341994..8a8a20a0 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -2593,12 +2593,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_message *m, size_t l,
+ }
+ 
+ #ifndef SMALL
+-static void
++static bool
+ dhcp6_deprecatedele(struct ipv6_addr *ia)
+ {
+ 	struct ipv6_addr *da, *dan, *dda;
+ 	struct timespec now;
+ 	struct dhcp6_state *state;
++	bool freed = false;
+ 
+ 	timespecclear(&now);
+ 	TAILQ_FOREACH_SAFE(da, &ia->pd_pfxs, pd_next, dan) {
+@@ -2624,11 +2625,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
+ 			if (IN6_ARE_ADDR_EQUAL(&dda->addr, &da->addr))
+ 				break;
+ 		}
+-		if (dda != NULL) {
++		if (dda != ia && dda != NULL) {
+ 			TAILQ_REMOVE(&state->addrs, dda, next);
+ 			ipv6_freeaddr(dda);
++			freed = true;
+ 		}
+ 	}
++
++	return freed;
+ }
+ #endif
+ 
+@@ -2636,7 +2640,11 @@ static void
+ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ {
+ 	struct ipv6_addr *ia, *ian;
++#ifndef SMALL
++	bool again;
++#endif
+ 
++again:
+ 	TAILQ_FOREACH_SAFE(ia, addrs, next, ian) {
+ 		if (ia->flags & IPV6_AF_EXTENDED)
+ 			;
+@@ -2658,7 +2666,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		/* If we delegated from this prefix, deprecate or remove
+ 		 * the delegations. */
+ 		if (ia->flags & IPV6_AF_PFXDELEGATION)
+-			dhcp6_deprecatedele(ia);
++			again = dhcp6_deprecatedele(ia);
++		else
++			again = false;
+ #endif
+ 
+ 		if (ia->flags & IPV6_AF_REQUEST) {
+@@ -2671,6 +2681,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		if (!(ia->flags & IPV6_AF_EXTENDED))
+ 			ipv6_deleteaddr(ia);
+ 		ipv6_freeaddr(ia);
++#ifndef SMALL
++		/* Deletion may invalidate the next pointer so restart */
++		if (again)
++			goto again;
++#endif
+ 	}
+ }
+ 
+-- 
+2.43.0
+
-- 
2.43.0


