Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E17CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:30:03 +0000 (UTC)
Received: from mx-relay83-hz1-if1.hornetsecurity.com (mx-relay83-hz1-if1.hornetsecurity.com [94.100.128.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7473.1779265795389911073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=WD2I7Z5v;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.93, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate83-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.162.98, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=pa4pr04cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7Iyh6NUmlDa4Kc33wPympaRJfPKni8L1/xADnOnVlmg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779265793;
 b=og5M4XzET9qz0MjwZJw5+Bz+DaK5LUyWsdo03xfyEJDGReseVjOUsXr62f1j5C4ruqL0P7ct
 cbqN4rcWxv3/ZR05u5H1hbCuO6Qe0tPUyQlrpelSH7LFUREGF4IynYHGNJUAVwB4CDiw/l0DP+c
 da1eTxbjoxKfP14z5CNP8kuI2OuPwZnBQiqZdXwst8I5v0LPvEVp69D2OFX90KY0lQTMSznR/sI
 qqzXHvRm1DgOf3WsiOd3Qkp0KGNYA4z+zZiXOoLbkjK24qslJLdNFuDYGHdrAtqAWQeHfe6nEvL
 lwna6ioRXTStdkO3YD9nTEevMNtajmab02XCRyhW2dlTQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779265793;
 b=RUZOtezqz/CkYZDtsiXCFs+Vrv/RANHbPC3ozTxVKaE/cDnJ+uDo+LCdoMbC/2OdqJ1q1SO/
 9Ro2vFzF4rYIuev88/7FaZG8ps3msd5DNTDCUwg/TefpZX7nXcqf3QLsjrQMam4Bd7qwtLLnQ82
 YfbUkPWGtH2DYbOcegrKpYUORQ/k36Id/YTdhEDURrhxklxWkSJaoq2JugP4wV9QG0+ZDNGuKtn
 /YBMWDUN9WoSHvky2kf8R8HhdYebKkbAG71Xyj9kJ2o3UKC/CeHPAmLAWa7uGt0XP9xZRUU35uL
 qicO4gxz0U+X2PC1q5BqSm4LV9i3XXuh2vxRQvOtr0y2w==
Received: from mail-francecentralazon11023098.outbound.protection.outlook.com ([40.107.162.98]) by mx-gate83-hz1;
 Wed, 20 May 2026 10:29:53 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrGuF78KTHYd6MIF/ScVe4GOeBC5JzKRIvklBU/XaKhDmpJsEa5q5D+zy9OTIbeSjKZXKzrkQr0YXS6W07rIvcfNrkKJk13rk+jKU3SIOvZEe6Xt958ZDo0mnUmu7rYxDcb2pTAg2M/29nMr4OLz1v2syHb/LVKSbdKWoXDDuytcr1ruQs9wnhtMlnDDwT7AljXbYrsDaao322vGPZMoMTMvYESIRFr55aX6MqYLS04tP0r2r8erGII7QwKrenDZNE3wcjqiUTsOQ/qSCRk80LpmHjWRL/9ebgwEQDqNDgTTnLX7bqrCviKKNA33qFoYH1r7msl212SnnhnSR9ODRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Iyh6NUmlDa4Kc33wPympaRJfPKni8L1/xADnOnVlmg=;
 b=gAdh3bDwCqMoOGk4+SJij+4w+FTJFI8/CGtn5Y7oCkoltiy2OiF1i9YlD6IcpZp/+MuS2plsABt9zIeZkcZezrvGr4VWjMqao9ePEHMTQA38E1htBrCvP1xwKhyYDR/Dbdn0wXI4Rp4IgkA+4282M5M4esPwllDIAJ+3IYbogDsDnRKnYKPJOJENuJlfph6v+iGtg69iRH77NNBy9bwbiFqKsUUJPQTHa3ohp4We6R/S84Jc3jFsnYcVfaApfwJun216gyHWqaDVSEwz32PO1uJHHVVZZiTWHFYtOXTr16qONppQnzqeQF91A71dFgQqzE0A6z9W8L9TJ2kbZ2Sd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Iyh6NUmlDa4Kc33wPympaRJfPKni8L1/xADnOnVlmg=;
 b=WD2I7Z5vVkqavSyD56A1ySQ+q/c1U2VIF6hY6SNqe2XT3GB2ZxwA8V/qNuBwYp57I8k2VIb07sS9e1xQDy9jAFSOFb8EBYHz6Iqg/RH9R1QlH13wArDP/qX7zQhmFm1sS1SL0ArWDZH1R3TKxQGVt0/PFRNXRLpoxoDP5Zv37++GzU9X/sMtxwlmkdk0hXanv4EkXQH7+t5DLsI5XAMF4euVkqp2skj3UunWVxv/6SQP9vQg7XzPILyMAc5iB9lrLZK6WctS/3XkXHvRfM3/SmpbyePDLk9LV2X7vMnFUIitnZo7Uatm+p7sir0ZrFMf3CM+JIhX8KAK3ajIg4mtgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PA1P192MB3056.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 08:29:47 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 08:29:47 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 1/3] openssh: patch CVE-2026-35385
Date: Wed, 20 May 2026 10:29:30 +0200
Message-ID: <20260520082932.1979208-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::10) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PA1P192MB3056:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9f3f0e-e84f-41f9-c365-08deb649f38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|18002099003|13003099007|12006099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ZMq6leKc/2bkm2GnrntgbtFB6NqaqRhjUxwVDVdIFB8okiH023T4rsiwOcp0liWseTxMSu8BbJ8hsgBWVyObJ9YaZN7ZpD2IfIWCZ/dymPekW2GVIOsq4R8hEW+yQCOaRM3gwXte1WQMEG5CTI2S644/uMhR6WsgTWEERDrB9BV2UJBn+zHw4Oo8SIIgbAVDUcrU80cscn8OQF6ogXtDFkZPuB9dweV9+uwx5/XLs8oXDy17yGPopXJZAz5okchBvACzi6V+8pY3vUkdHhC9uBsm1FNn5NMfEWTHZcci6OF4mO9YLcZOrsgI/xveXGiqKCrA8u6+DCxu36c+/FaE9TewgnCchWqr7hDy67JvP1J88QYsNmwCErd0HxkRs2auZRr8qCczZhc40GrYywGQmISBkjIg+imdzPZq5gVKZHJUjAEfSw0DpBdVbA59nbFOxgObAAUpcbaZGkJ01YSsEKf+zp8YJaqitU09kIgY5jTnRG1a88r5bOVqPgPv2lPe7eQp8kqIc7ejifL3hCZjNe+zepcr83PPkv6GJSQsj9iR3MMU7Vg2oOXVtrPDQVImGqPqqAWlSEy9qcNY5GVSTPM3AM0nC+abG2NxEkulOisVz4vyk35xBpguGMD/sj3GmjUpc5CBWG7K2Ehfqo5nzAdDe9jg5uRnWOUUvQ/Uz/c4NEnVfJBLBr3HGDZVJgBDkNKmDHOT0x040Wc9FhDGww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(18002099003)(13003099007)(12006099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rm/k29IMOXkDvHasDz2/LjVGSxlxOpSVFLyF4MExdMVI9PAnqeYzzCTVFxLi?=
 =?us-ascii?Q?QG5HpMRXE1euWz2zISgjBRJERlg4u4T3F5npRnGc5DU5v3jq+RpsAhGmR3uL?=
 =?us-ascii?Q?XzLK6mcieeAx9A+s6qT5QnjzxrlYs50QQxtyarpr8k/Nu6xBDbQtl79IOkgC?=
 =?us-ascii?Q?s6YburzlAvEtxx0RgOHmAcnoFwgK0XcMwGPbJ0VzW+NjNZg0TAuKmT2Dpx5g?=
 =?us-ascii?Q?j7d4mwqp0IEeCyWyaI/dva9TPaZp3PKUjDNaTuW4zw8S7PlpMrLDLExp2+Ra?=
 =?us-ascii?Q?RN1mOIpY/dlQ5scEUJH8LB3jh9Z3CQ1d8Ezl8YccnMPmNfxw05RuCY3EClmY?=
 =?us-ascii?Q?CNxWxBfMb56aqO6qxfiApEth87xBNuc6cScEkn0pTPAZUOq2AlayV1kTy6SR?=
 =?us-ascii?Q?wo55dlysk0/batstSR6HK+YrpwjbFLxkJ3uEpwQT92L/M+lR5LWhpL+p9ADu?=
 =?us-ascii?Q?YWmsjrVkTZahoAxRwbn8AkxTC3FA3cvgEdZnFN+NL+AJrcfvIrJ4RYw6vIfm?=
 =?us-ascii?Q?7aHg/wUghCJ0ZWjX/KL8Lkvj95oKCG6F35GGEC066JkSgJh0AY17ENzvNhjW?=
 =?us-ascii?Q?Oq02infuiEHbUgDAhRUXDgKLjtoIVH5esVBQP19ynuBEBTw125bkInbpNCR/?=
 =?us-ascii?Q?UOqHiHlC47IekBTmt44l8W0wkTXy9zfIXowhTZ0t94B4L40p+41r6kzbHUfO?=
 =?us-ascii?Q?UpNIXqDYluROBogAqJh5xhN0vrUyrQeMUV4nMT1c9ztIExTTVl/OJ7ns4icA?=
 =?us-ascii?Q?3KbdZ2fCDim+N3UleRkmX2zXoyqeE0hOHvEMBAdF8n/AMNoLwtlL0NgVdl5S?=
 =?us-ascii?Q?B+TM5zxTHABPg2AXvfnhLvzuQULYit1WGnGTHRsux+ENW7bLYvDLIfrns7fA?=
 =?us-ascii?Q?5H9V3vrQwrPFY1RXJYhniB0bytDzaOnvQJdjozjUvHeNs6D8gOaCxd02e+v5?=
 =?us-ascii?Q?YFPIKV6kotVGyiNhdCyTmR9R0bHsvQ2h2neoeOFqUfMKBBuo7pqlPD9GOTQZ?=
 =?us-ascii?Q?EBLApSSaY2wjDxFcMhJQ57v4INF4ncTa66ewKiSSIPTF+1ucTnkEYDdr1I5h?=
 =?us-ascii?Q?qRAQdqD8Ul8D7zbpYqJjjuMoYN9tTy1KSR7GiLu1ZIYuc/OrPtpEF/LqRM8q?=
 =?us-ascii?Q?7SyiiBBVqeh2Z4NXHNakQ3LEELE9zl4O3Yk8QQZXpaz6SzPvYtzPSI3Ko0LC?=
 =?us-ascii?Q?edxOw29I4vTBGiY+5lrLdgO/7nlOa+bql8yB8bYRTwlMQ9CCzTXiA5I0rJj4?=
 =?us-ascii?Q?0zQeQkMCECXGGpx3sfdwxAnG6y9wtOMM00t01chb/XzzZdNcCGhwDqgvuvaI?=
 =?us-ascii?Q?j/Cyc0uon2QXn2VD1Qy6N7/UbfbcFbfg862bmGys/Gk8VfFks4dfJqr2g8DP?=
 =?us-ascii?Q?t/wdX5rW5VjbdIcSA8AjPpAIUfEGrtTn8V5TYaB3zfERTnMO63+IpryVYedB?=
 =?us-ascii?Q?MgWkMM/RfLzCwfUELYnoNAO7qAa+TGsVsRYmBOEhlHiX7UtUlXEZmKoNuAi2?=
 =?us-ascii?Q?NgCnyZ2HxO80hnEcbC1Tv/x8FzSWcQQDo7+x392zm3IjAmsiuSGwhbpa+z4V?=
 =?us-ascii?Q?U1OgZFIzYUC+RAjx50aqBS6/HT1SGDQHb95D+lKk7uSXKDGDtrLW/GHle9yh?=
 =?us-ascii?Q?BQEvCvDEmm0dD6Iuw1hC6+WcS0B6sDzqvQLg0gUgfzy4OypYI+L5xJge75lH?=
 =?us-ascii?Q?kszrKwsn7sZzU3jiDUfiaXVDbasN/igYiVF7v86K8tEVeZEndx7erDAg1XE2?=
 =?us-ascii?Q?Qa030OoPAg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Mp2tcTwyISdTj/E3FhrZyBjxhue39sIs2dpxZOhMGpyTOT6pmNPfXASvbDQYNhI2Jfpw0WLvEa5zohlbhZgw0YMauL8ZkeS3dWbEUF2il9c36xBXNDNmioy4uhFGujew2/+jh/d7o7i+hmg6wrJUmek46aQqWkrgYnQPajblR6Tcx22SJIwzj2B9q2cFC3YPf0XaDnshOZj6sqlylRQWPosZNrQebxiVnd295ycdYuWGP5Ef9bVNSw62ihgPZTsyR+qr7n18x456mWi/fEcb12jEV3wS/On8knggCSEoQ0d25GsmqRx1jeH3VLDvwcWfWe/UNVK8slIinlp5nQgISQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GI0FcQp3Dl+dxHPpzXlRwMYiVslXLefT4xC344DkG2whzYzWWPCfg85YTEVmfhuKkyW/ecZlzbaXFzqlissWZvZITVW7y56xQwl+DYSM321CJgMX8PlcGTNBQSoX4sCn6Vd7H0lcy4BmLL0eDcwFg+DpbM6XH+0VJBftRBSjYLc+y2wjksdkMFBfVDq72XWFrBveB/uyq26RmuhGE3AFTlUddD1KCcLemmB46cAmCq6PzEb/yIzpdgpbNCL39c+j6MsyZUEacAq6GEEX3ArUH5DZKuEWv37Ypgfyd8Pvqq2X5uH+PTG0IhSyx7mCY02rP0s1VkPHkur9bL9m56J2Zc3NH7gyM5djelBRqc8BUczTa1cyWtxmdM7UH6HjvAL4/EDxFxRXWmTYV+DHTi0cf3//Do9WdNnALtiri/plOIB9bOh29mUtpaaYH41bMuLwCBWPFWE8rTFspbfeTP6X/0WVoLIFjgoOlDqLtihJJVBm5tl6igusP7RVHS5X3Wggz8ELAZxDn7CTu0mG7YHgXcyFinQX4Tj5yn+MToIUpFc+mn83eSATJKrccQQG0zCz+oDUevM77XKceO2vYcigpGmFHA2xaLa0kpIXCLgn+4MKWeh3R54EnyDHXrbkGYMR
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9f3f0e-e84f-41f9-c365-08deb649f38c
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:29:46.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Makv4ysqu281HIBwtGAPEfyizNAI9D39q9okFM/47bqxOBjYciOOkOnF26ZMJM2p1Os0pDlVpnjXd+kQdbhDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3056
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate83-hz1 with 4gL4Tn0lhXz2Mbrv
X-cloud-security-connect: mail-francecentralazon11023098.outbound.protection.outlook.com[40.107.162.98], TLS=1, IP=40.107.162.98
X-cloud-security-Digest: b87820c39caffaa294721316390b4d75
X-cloud-security: scantime:1.175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237428

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] matching CVE description in [2] and change described
in release note [3].

[1] https://github.com/openssh/openssh-portable/commit/487e8ac146f7d6616f65c125d5edb210519b833a

[2] https://security-tracker.debian.org/tracker/CVE-2026-35385

[3] https://www.openssh.org/releasenotes.html#10.3p1

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../openssh/openssh/CVE-2026-35385.patch      | 47 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch
new file mode 100644
index 0000000000..4fc19a6062
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch
@@ -0,0 +1,47 @@
+From 9df287221ad61f6b05b3e80bc57bdaacfa5ab243 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:42:16 +0000
+Subject: [PATCH] upstream: when downloading files as root in legacy (-O) mode
+ and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: 49e902fca8dd933a92a9b547ab31f63e86729fa1
+
+CVE: CVE-2026-35385
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/487e8ac146f7d6616f65c125d5edb210519b833a]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ scp.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 492dace12..2c21fa19a 100644
+--- a/scp.c
++++ b/scp.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: scp.c,v 1.260 2023/10/11 05:42:08 djm Exp $ */
++/* $OpenBSD: scp.c,v 1.273 2026/04/02 07:42:16 djm Exp $ */
+ /*
+  * scp - secure remote copy.  This is basically patched BSD rcp which
+  * uses ssh to do the data transfer (instead of using rcmd).
+@@ -1682,8 +1682,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 1cdd888ccb..3a9010a7a4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984.patch \
+           file://CVE-2026-35385.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


