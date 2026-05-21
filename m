Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CE8CD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:28 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33224.1779358219368865094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=FwWpmvAv;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:17 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMOfRq+8Xdy+5G5vp3k6rnDpg6at1fKtloUSNw1H4B02pqIsXNKS05zE3Ru1G5luS8KCeMDw8Ie+vfIuYBbJ6hpGiTx95wf/rY5ewKUziHdMsUn4eyPAuHSXb75WSINev67M1MRx+O4M9VttHk3cjKXBecW3DFhPqWw4Xan+tKknq441wo42haWZWarqXflaz0UnRv7WE3X3HFB4TC5rDXoulpj3ITl6OCisa/fbtG7IWIRmuF3diHxnAZlS+nOB+fEP0Otzm1bzhSD++EFIO1aISQnmMSWzLYnQXcuG0bbdIUgSs1+wmRGfJUli/Y6L5YC9toCiZmVpsGyplCOLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohH4dVTarYlsOvRFp0xym5uqakNm7Gr2CzGoEXbvTDU=;
 b=mAsgxnZgxHjGSBdfO0T2Rriu+gR52I9idYsDI2vgWUc42V4zjqjCW+50Qwjow6yVSkehx3T2RTDAPD/7JcmgCsOl4cqjhV/+frYDZD801ic8G/lZJr66yuwsev/mYUBy9am8n4HnZ+Iz6rvwUEVA3Vb8/rnT2Ij5CLiexEgbTLF7NGbUT1wDchlZJ47lr3meKHxQu989Z4/P6M09hLjKD7gz3LP9FXjreYPeU1pkGmJgYvgwcoUdVjMye3AXc/N6NvMP5baihQk2R1VUAZrPY/xcg+//6FK1Bp/KCiVgjdwYoslSvPPVuYVlTFB/o7G1Y64TlFSAiOBi5ZVr3MgpYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohH4dVTarYlsOvRFp0xym5uqakNm7Gr2CzGoEXbvTDU=;
 b=FwWpmvAvBKxH4Kfq94e8HOQTCRJB49pBQ3kE+EzUEBtQZtRKP5UVKxIh64uFYnBarJ4I6Fdhq26QLkxfmLhTSK9772vLM/vKs4ANXtccKG0OjL1iLSjCzeO8vj+nhjj++QhO8sX+F5Ry/yI0bkdWZZPI2qWtrdfYPBrutdc6AehtHRqKpXGBhKUtA9qgn+YvtGg/fOYeZ90Mw5MFbBDT8RU5WFptFh5IOIzCJUPHgo+3IldnjO24m/eYAnitboyF7l8lyNf3E1ON5pk639sKNX9ChqEsbyieBG7FdgeHOLPvxd0t732xJKu4cK6ZiH/UOCXyVWiskVqMwknkENMtQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:03 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:03 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 04/14] go: patch CVE-2026-32289
Date: Thu, 21 May 2026 12:09:37 +0200
Message-ID: <20260521100949.1299757-4-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
References: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1672:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc27374-4660-4b0b-21d8-08deb721203a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	OmKxIx4raUcoP5+rnRFjCn1KFPCnPZNig958MfOD49INwmOLGTc4j1WLFm2s9eqiNu15i1gsH0UJcVAnQYSBkO8om4dPNVzLfJloTTHKUPeSFwikDb1ohfc0wd7haeuyRonHvAY6u6SvjRVvIw8vu69E58wOOqU1L68L86uuxXdarHi7vmbP2VYeewARCTS37sMVlQkTdbUXLs9R5G3XmXgms/+uHQRkRgenEXyKmEANo3GEQsX7WUytExprHPeYQ8QiKaj+iL24bDyE2zMa5NcPb5+eunRZp4r5JYeceMqXtisXf9mDnwEJ9wRb8+ZoBcBgdvo1EESiDdz9xA5c9kbb0k6h55vIJQ8lmGjRVPlNZDdM8uwAfLNnc1mvYEciojPEVYpTKSZoTrCzEwKVK9WAyGanx4tC1Azh6clP6QW5BhWP9/wz/635iKbB1eaVTKRzTmCTM/yNI1GUQLITNTbzIaMNJBMxKGxALx54tog6rBZoIl6jcgPp6QaQarWT7xUZZYHO4Zc9iCwduG8GjqC5PuIOqJoZ30uHMJPtHngv6NiyKe16yHDlZiPd9BSXbkpZNGu0oDlt0Z1apAvY3fQEjoVXn5NFmV4xLKSoyxV1v0kTOUAfOUVj7L6Xp56P0zgkVoqYMQKDkD36OhzIfU4BI5lD6oEMKodLG50VClnVjvm+LliTWdxxOXYwDXQGNFoNySvyXaqrWJucBDwWxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnBiQ1ViMk5kN0szTGU0RVJTTmlldHlEWWpYUnAwZ2N6bGF4Q25DMWVSdDZ6?=
 =?utf-8?B?d2cveXBxOFBaTGcvK0VBVlBkbkdnai9tMmVnMkJNQUxYTjdYYkVvNWRhdlU0?=
 =?utf-8?B?N2k4dGVBaFRtREdTMUpCa2J6SFNrSkJ6c0dsSWV1Q0ZRWEtUTTZzbHFYVERh?=
 =?utf-8?B?Zm56UHZRdmRjVXh1T3Z2Y1BSN3N6eVMyTHJFZUtJQktYUDRsZjhIcDA0aVlK?=
 =?utf-8?B?VDI5aVdPOFFrczM5VG5hNjQreThFZzdOUElqSTlZWlhGcmNWM1hEaXIyZUg4?=
 =?utf-8?B?SUg0dEsyTWl1OHlNL3MzOFZ3S3FheDVHUG9HMzBqSlFmR2czM2xwTHNDQ3FW?=
 =?utf-8?B?cUYvbDZuS3VVNDBqbDF6cmJDenBGbDFJNVpCR1BQOGZSdWUvYkdlTTdacnNJ?=
 =?utf-8?B?L3dFMkgvTGVvV00xVmJ3Sm5sckNEYjJyT2FVY2J4ckZValcveTlES0o3TDlM?=
 =?utf-8?B?NUl6eWFMOW5Dai9uU05GWUdzcTVpa3U3VDE1ejJkeGJJZXJwc0picW9hcjFP?=
 =?utf-8?B?a2Q0RkYvODlkWUdLK1l4VHk0YzN1T1BGY1cyZno4VlFzZ0Q5QUNoZkN6Tm5n?=
 =?utf-8?B?WHF5VmNKWnpuOXI4K25USGlpWjZFVHM0OXoyYThqcXczSlFFZHRQYzJqMVNQ?=
 =?utf-8?B?d1pMRzI5QjN3R1ZPTkYyazdNQzVWQkx3NzRIeXdwNWMzR3FDSVVBQ2hYNDV4?=
 =?utf-8?B?ZEpINHdmTENuRzVMbDlSWFJuRTdyemk0T1BIYnpwZVlnSXRlaXMrbHR2NW4r?=
 =?utf-8?B?SGp1TUlGRzJ0a01OQjN0eXdWQm5BczhRbVdYZTdSTHBpVUlhdmtuZTdPMG9N?=
 =?utf-8?B?bTluNFVqcUxLZzFyTms1QVhCckxVcnNvT2pVUE9sbVR1ZXBqbGZzWHdiMHBz?=
 =?utf-8?B?ZVF4VTJ6ZjlVSExJL3YzWGhtMmRhaDR6WVBrTUZpU0tLa2tJa3lCNVNqNXMr?=
 =?utf-8?B?ZDRPMEM0QUx6TkVCVXJiMGlTM25WYUZWTUtYaXRTRGJtcjFoZ0dWeW43RTYx?=
 =?utf-8?B?NGRRRVVyOWtHaWV1NzNNeTM1SEJkWXJDT1lMS2QyV2laRDZWcWhHcDhzbDJu?=
 =?utf-8?B?L3hNenFTYVplNEFJUFBDeE0wWUdMQTVPWDM4VTB4M2U0Z0piK2pUclpRNWQ5?=
 =?utf-8?B?VlMxNHllN3pPYjNuTVZ3MFdpeXUzR1hLeVEwOUFKMFkrWUhKaUw5U1V5akZj?=
 =?utf-8?B?ZURBRDFHMlIxWEdIMW5UY09KSmtYc0h1endUK3lhbHRlVGNONm4vVVV6d0JO?=
 =?utf-8?B?em8xd3ppNDlnREtUbVhFQmlSZzFaR2VDNld1RU9BNjZndlhGRW1WSDJBNGFF?=
 =?utf-8?B?Qmt3WEFKL0l2Q2FERmEwQXNsOTNPRGN6eWFQVDhOWEJ4bTdycS80YmsyRWh5?=
 =?utf-8?B?d3RRdUVwT05LTUZvUjF1NC9jRUR6aW1GcFcwWC9PZ2t4VnkvQzFpQ2F4VVRq?=
 =?utf-8?B?aFllaUJ2dkhOMDFCM05ybWlKdm1sRmJjNml3MTA1RTZKVTkxd2J6RWFvR0s3?=
 =?utf-8?B?OXVJdUVoZmJQa3pmZlRreXpGdklEcDgwYkp2MWdvSFpZQlRJTEthaXBoSUtS?=
 =?utf-8?B?S2FwTjBlNkptemJPaEpoYkNrRUJGelpqdzVDa3pUTGlvVDU4Q2FJN3loL2wx?=
 =?utf-8?B?ZHU0ZEtSOGY1MlB1V1lIR2FERDFSbGdYN2NrS0h4YzR1V3dZY2NyUmpQa2Fj?=
 =?utf-8?B?cWdDeDFteWhOU0RFNDA3QWZOTVZNdVFVaGt0dXhGZU5Eb1B0ZS9EeG1QQW04?=
 =?utf-8?B?UnF1aStWMyswM2U2cW9GOVFtWmJJYkFOTGlGNXdBWS81YUNxTU85Z0JwdVVO?=
 =?utf-8?B?RExxejBVbForZnlNNWV2OElGSUsxY2FVS21RYVlyMGozZnFuNGs3dEhUR0NI?=
 =?utf-8?B?aEM3WmFzSjUyd3RkV2dOdzNSeFY0UFRQSmFpeE4rS2pVckdDVGxvNFEvU3px?=
 =?utf-8?B?MUlhTHEvZ2trdGR3U1B0em5yQmxmSW8vdmcwTFRJMHZFY1NmUER3b3UyT0Y4?=
 =?utf-8?B?bXFXTHUreU1Vb3Y3L0x4VTRoZk5JVldoNXd5bFV4TEJld2lFVkl3anhTb2pF?=
 =?utf-8?B?RU4wUzc5NG1UK3RvSzM3OHdpQUR1OVNvTDFmaE5KV2xIMEpNRWNQV2RxMUJ0?=
 =?utf-8?B?QlB0UnNxUDRWbTk5RkQzd3BreWFCRlB6Y0cyMXBNQkRwak1FVnNQYlMvaHpX?=
 =?utf-8?B?T1d2cjVMb29xUk5LV1pVdzFUSWJRTkNWMDFIZUx6b1lLRlY5cUZyOHNpVElh?=
 =?utf-8?B?Nko1aUFDNm02ZmxSTGg2YW52S2RubEZUMGt5dkhsVSt5QmlhMW9OcC95cW1J?=
 =?utf-8?B?RTBqZ01aWU85dFFqNjBrbHEwL0lyaE1OSjhtSTFHc0tWUW1kdlZ0UT09?=
X-Exchange-RoutingPolicyChecked: 
	QOyWJUyS8jlWZJUg/j6HmQjTZCpNa2e2kLmBboaWb3cUnXwwejqWsVOguw9gAX8ZF+xcXfl2f41sQnwlgHqqcecM27OQgJAxwP1ai8tlied7pJTW4FA6iiUOXsAz6k7kboi4+2i9VsvgmwZvFfQ0FpY1I7gNbIyP4AMZXT4zvI2Os2zNS3MXltHD5aPIlBjz1kia9msltW7MAhaTmT+qObhDR5zTCI7Kx9S0dmZtWny7iMVhDCAXYJ5tjGRMoRXqT3iE9dtxCgulmbIs9SD0H6Xz2va6+diApEoTjWiecjN2teZiw81mFQQhdqGzmh3zuArPrNSWVhDM2bbkSp9iww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OJUS/03aU5dI0GmTvmmLvZ9NhntK6IactGKwf6Gc+U1ec9N0ux5IjS9J4sKwLkwAcXuUIl8IaBzvF5+DDQs/5KoyufxPtHnWbTb5YdAfRxswWhMqgk+DoGKZzy80aGetSkLFFi9SlSR7jCVTOCbcRCDezEzE38DSxXYAebOP4W3b/fB08cYlqoyoHsHAsKvU5f/IwjHjgIMkbfdAhh6ThjWSCVnlTyzCA7PBlcNDxPXlWMC1ViGyCjeBlj7mTFaMwo4KKHmOD4e0vdmXguCy+9ZyyJRJXrSQeNSbJOr5QKeZZa/UN9ZKgg05ypD2lZ4vP6cGISnS3rEgW8c44+/gnIt6U8T2dAjOVI16GLqzfDiMOcwQod3c3bcox6LMvkGBt4Q90KIlHkKb7oBbr/Ks39h8iB0iEyVRrC0Zl6RKVfF6zrKWLAWwfIZrlfqv0kRkGFl5k7fDr00cyhbn/6mETcuf2XQJRre7zbmRbqAjTS8ulHdRjT6KObDJPJXzphJlHRhYnN8P1PLOoLVkYUvD1HA4rhk8Hcg4uGiNBlOt2l5PDyy2494rO11eZ0QukS43fuWG+TPIn8Scl+lGjok6YILV6y0vBFuM5IcxGirVcelyAnHxUbYzgSqBMRv3xcvF
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc27374-4660-4b0b-21d8-08deb721203a
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:03.7360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aefwuiZxlZaU5/aKIFTj+AsqDUkOcO8+sJSA2eGYNL0ypcr0TSHUNOjfQPSw70T4fg3vtM+D5m74v5vgbFh2+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkg76YrTz1X3m2
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: ebe40c5427ea43bc40d99d5f9c615533
X-cloud-security: scantime:1.555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237488

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/763762

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32289.patch                | 217 ++++++++++++++++++
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32289.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 99c2945a8c..288cd5c95f 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -44,6 +44,7 @@ SRC_URI += "\
     file://CVE-2026-27142.patch \
     file://CVE-2026-32280.patch \
     file://CVE-2026-32283.patch \
+    file://CVE-2026-32289.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32289.patch b/meta/recipes-devtools/go/go/CVE-2026-32289.patch
new file mode 100644
index 0000000000..28ff0c00e0
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32289.patch
@@ -0,0 +1,217 @@
+From 5291c6d3e6d0bc0a764a9a6bd6b3de1be64b8264 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 23 Mar 2026 13:34:23 -0700
+Subject: [PATCH] html/template: properly track JS template literal brace depth
+ across contexts
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Properly track JS template literal brace depth across branches/ranges,
+and prevent accidental re-use of escape analysis by including the
+brace depth in the stringification/mangling for contexts.
+
+Fixes #78331
+Fixes CVE-2026-32289
+
+Change-Id: I9f3f47c29e042220b18e4d3299db7a3fae4207fa
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3882
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763762
+Reviewed-by: Russ Cox <rsc@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: David Chase <drchase@google.com>
+Reviewed-by: Fan Mỹ Tâm Club <letrivien97@gmail.com>
+
+CVE: CVE-2026-32289
+Upstream-Status: Backport [https://github.com/golang/go/commit/199c4d1c3c9d509a51f777c81cb17d4b17728097]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/html/template/context.go     | 14 +++++++++++-
+ src/html/template/escape.go      |  4 ++--
+ src/html/template/escape_test.go | 38 +++++++++++++++++++++-----------
+ 3 files changed, 40 insertions(+), 16 deletions(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index 8b3af2feab..132ae2d28d 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -6,6 +6,7 @@ package template
+ 
+ import (
+ 	"fmt"
++	"slices"
+ 	"text/template/parse"
+ )
+ 
+@@ -37,7 +38,7 @@ func (c context) String() string {
+ 	if c.err != nil {
+ 		err = c.err
+ 	}
+-	return fmt.Sprintf("{%v %v %v %v %v %v %v}", c.state, c.delim, c.urlPart, c.jsCtx, c.attr, c.element, err)
++	return fmt.Sprintf("{%v %v %v %v %v %v %v %v}", c.state, c.delim, c.urlPart, c.jsCtx, c.jsBraceDepth, c.attr, c.element, err)
+ }
+ 
+ // eq reports whether two contexts are equal.
+@@ -46,6 +47,7 @@ func (c context) eq(d context) bool {
+ 		c.delim == d.delim &&
+ 		c.urlPart == d.urlPart &&
+ 		c.jsCtx == d.jsCtx &&
++		slices.Equal(c.jsBraceDepth, d.jsBraceDepth) &&
+ 		c.attr == d.attr &&
+ 		c.element == d.element &&
+ 		c.err == d.err
+@@ -68,6 +70,9 @@ func (c context) mangle(templateName string) string {
+ 	if c.jsCtx != jsCtxRegexp {
+ 		s += "_" + c.jsCtx.String()
+ 	}
++	if c.jsBraceDepth != nil {
++		s += fmt.Sprintf("_jsBraceDepth(%v)", c.jsBraceDepth)
++	}
+ 	if c.attr != attrNone {
+ 		s += "_" + c.attr.String()
+ 	}
+@@ -77,6 +82,13 @@ func (c context) mangle(templateName string) string {
+ 	return s
+ }
+ 
++// clone returns a copy of c with the same field values.
++func (c context) clone() context {
++	clone := c
++	clone.jsBraceDepth = slices.Clone(c.jsBraceDepth)
++	return clone
++}
++
+ // state describes a high-level HTML parser state.
+ //
+ // It bounds the top of the element stack, and by extension the HTML insertion
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index b368cab38c..c031ed27b9 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -522,7 +522,7 @@ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string)
+ 	if nodeName == "range" {
+ 		e.rangeContext = &rangeContext{outer: e.rangeContext}
+ 	}
+-	c0 := e.escapeList(c, n.List)
++	c0 := e.escapeList(c.clone(), n.List)
+ 	if nodeName == "range" {
+ 		if c0.state != stateError {
+ 			c0 = joinRange(c0, e.rangeContext)
+@@ -553,7 +553,7 @@ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string)
+ 			return c0
+ 		}
+ 	}
+-	c1 := e.escapeList(c, n.ElseList)
++	c1 := e.escapeList(c.clone(), n.ElseList)
+ 	return join(c0, c1, n, nodeName)
+ }
+ 
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 1970db1695..435c83378f 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -1181,6 +1181,18 @@ func TestErrors(t *testing.T) {
+ 			// html is allowed since it is the last command in the pipeline, but urlquery is not.
+ 			`predefined escaper "urlquery" disallowed in template`,
+ 		},
++		{
++			"<script>var a = `{{if .X}}`{{end}}",
++			`{{if}} branches end in different contexts`,
++		},
++		{
++			"<script>var a = `{{if .X}}a{{else}}`{{end}}",
++			`{{if}} branches end in different contexts`,
++		},
++		{
++			"<script>var a = `{{if .X}}a{{else}}b{{end}}`</script>",
++			``,
++		},
+ 	}
+ 	for _, test := range tests {
+ 		buf := new(bytes.Buffer)
+@@ -1752,7 +1764,7 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>var a = `${",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${}",
+@@ -1760,27 +1772,27 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>var a = `${`",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${var a = \"",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${var a = \"`",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${var a = \"}",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${``",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${`}",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>`${ {} } asd`</script><script>`${ {} }",
+@@ -1788,7 +1800,7 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>var foo = `${ (_ => { return \"x\" })() + \"${",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${ {</script><script>var b = `${ x }",
+@@ -1816,23 +1828,23 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>`${ { `` }",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>`${ { }`",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var foo = `${ foo({ a: { c: `${",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{2, 0}},
+ 		},
+ 		{
+ 			"<script>var foo = `${ foo({ a: { c: `${ {{.}} }` }, b: ",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{1}},
+ 		},
+ 		{
+ 			"<script>`${ `}",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 	}
+ 
+-- 
+2.43.0
+
-- 
2.43.0


