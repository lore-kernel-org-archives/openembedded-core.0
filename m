Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C743FC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:28 +0000 (UTC)
Received: from mx-relay48-hz1-if1.hornetsecurity.com (mx-relay48-hz1-if1.hornetsecurity.com [94.100.128.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41942.1782902907001711511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=QYmP+s4V;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.58, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate48-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.159.129, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XL2YQ91X8+cwb5UnG6S2mQwVLjHdPVUv2U9cOtEVcdk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902904;
 b=Xbt5rysOGgR2panhKnsBLQ/Hhib0k1sT50hGDA7muF+IRwyG1UAIRHgOo4mfLUkuowHlhOqF
 ekoPRQXlX1/n9x6trAA6tst4CMao7sVfE2vLDS04MMvdmEfN9iGiLFmEH69R2yW3XWfap8F6iZ5
 Du+nLZye2vWrB8y7wwKNPlW3QBBJlUgRDmBKYcWLwRYoEhzB3L+0O5cqa93kX71VkEZmy9iVjJh
 U0fKzb5FaQGSIU74/bETQmfN2X6EeG/vNUeKfh7/pLz1r4mX6ha3C2QDcCyNLBFvn3sKISFtXS8
 UcPcpfp5dvMQG3mbtE9QIoZ8rhYdu9Is8yDqUINwPl12w==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902904;
 b=RFbfDw/YYAv2vZs4k83pDoqJ63BFiugeD2F1cvmm3DE2EhMjBqrLZ/GlUKhukPHBGklypZAo
 ob0iWq0rHpdjaxAq8bRhW71eKtiDE1luyGCFL0Lmt7vzNKLSbph0mVCg5pWNDZFbkk/b/qGx24j
 71TxZ4hKGmkKojsWRl9jU47D8F9usI9MRSnNw6v7mdD9lAjnq+kPBOnSKz004kC4IfRqo7IDbWp
 kRDtfYjLp9ZO6kDNbe+7YbZdY7RcEgm1KRwtr5r1wVhmhdPx288iNQvgNU+X5RCVv1m7xKWNiJ+
 SGaavFFyRAEbjqDGczAuSwT4fqRu9hVz21gXZXriKJKMg==
Received: from mail-norwayeastazon11023129.outbound.protection.outlook.com ([40.107.159.129]) by mx-gate48-hz1;
 Wed, 01 Jul 2026 12:48:24 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbjFyr8fVJUrtEQeNsBPtI2iNdaFOszZiOKB2gKLfuHRwY4Xcft965n4xHjcXmbKfBZpmS8lmqAyM0LZ148zFcdHTxjvv3ucxa1gjoHfd3kKULohfmvMI5sqArqJjyXYwg2MuYffkwZ8fV2briJGM/g6A/XNrfOtVXIpzEMEJxdg24+iTa5qRWJnArm0/2vHQB1aGWSwaFp8CVY2yyuC39geYw9z+wL2gvRWFCLyYxL90riyXoqp7NIf8yaafqMKk08r3idOcgmj0bZSuFIqrnWtf8sCIhjVjdcXtXT6g9Btj7mttKnc0whICs3jIY0cHSnyv9+pNt2dhhLOsUmPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL2YQ91X8+cwb5UnG6S2mQwVLjHdPVUv2U9cOtEVcdk=;
 b=kIGHFu7JSFMHPfQhOWVd9tLCk5Ez2fhwgbjhFGpPLbxRIsGAoeNSZ+injTnbwhrrEsROyU2/D5XZ1G/WUybMuPKS1/RFeb6iVAuO7VU9R/IMIUs+vTQQDvrZCLZ0Fk3bhMWcvzt6wY6lATq/ScznZ23bkNsY3ZFNZs3QCYXhXKJ3r0o9V4ystSi25x3TSjOfunA252In3qu0HCv7gxNnt2LGO17TUAPiUQFfUiwAGJWiYf6gKkeMGk8BUemozojilSgKSLqt2iQYR+s1dNsWUoXHZlRfphMiQr0+icEhfILS4nwq1+ajgZ1Ul1Du4xJOzAFLP1SxS/h0bl1doXO8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL2YQ91X8+cwb5UnG6S2mQwVLjHdPVUv2U9cOtEVcdk=;
 b=QYmP+s4V/NZQLUJBJ35y+ZKuBvk1c0Mb54lPjrPex8ntIRp5+4KzCRrrNdioM84S84N5atoBZsEQp9q8QdTCIu+/Qt8aUnoDc1AqosZjm6eDFYJaPXpymMXJvo9kykUxvus/x69kqqC7hQXSXRpAGujvyTm+5a4eehyvxltTJbMRnBwujxOP7G9UmvRjx1XKIIPHIWSSIekYXS9TRfHxxBhjVCqXtKvWMqTCi6J4UUHfXAYJdKAvT8nhoF2Fvd7PuAkXw5ItkUaL33jfNsxM9KOGNzOKjKj/RG9nPXaR9d+p4d9D0ZFs2AhWvytT1vM9Wv4ACi7Q6B0mh5rjHNlIdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:17 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:17 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [wrynose][PATCH 1/4] dhcpcd: patch CVE-2026-56113
Date: Wed,  1 Jul 2026 12:48:05 +0200
Message-ID: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a92beb1-1105-4d37-6104-08ded75e4284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	BaA9cV/nHQ+97ZUeAjd67jjTAk+4Idjb8ijBA+aT/ZLtKzwwg6PoR9jUiFeYkii2QR+1kov2jB9uJsNdPkD6NMStycPnlYh0QUTIHvRo15q4xeFzG6d7HW4RzMhwGT40zGgeV53lQd/pS6Uah8PQyp/SGFlp2EDRLRrVQz8n2E8y2gbbC7l8PLvuucfD6jnAi7MeoFToXBnKYummc9p9/r7unmho/s4ovt98M5+bopMoJU7WFTDcGB6NSwANDqGUSuDaQwzFtBK7eOqlrCMiPRt+TieQ1je8K+tlGbz94AL3jU5tGEgYc3gzwu5vhFNJph3P9fE4R5zgYjKgf5uZhPAKnFliWv9EguZIVEI6KC3kYA5zaT/AqyGQX3NTTEeZR7pOhhh9sKIwDp1svkXz1e/+7IHYA2l6jWzSqKPTbyifhzIB5ugV0/mWvXDyMtes7MA+KdbjfzPNUUPf/ar/7lqfBWbPfwTz5Xzxf4b7yp2N2kKbe7DE3HVQznDMtsXui28JzvcP5F9+6oMaUHCfiASgQgRmvrXJZP5QSreV+Rd0m6ZD6Zpxe7azaDT+incV986ZtwQsKqrfjeoKCbEyfjYCbJCqwdoccP/Hto49rgY83v0yfBSSbL1BLZTBfjXphiWqSLyc2KtwSNiov1rXszfQiTXYcJ4BDMtQjHYm/zg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AQ2I2vAWQW8bWuD+VCDmzuWCoBrkBA4vAsoXBN5xoZaGGztivLSEXrWhdiCY?=
 =?us-ascii?Q?lSGReRcGQExZa3YmVvjs0cqVXpluL4GtZgfHJ5Wsaq6/q4PRzsfGQFv4gkRB?=
 =?us-ascii?Q?xOwB3vNgIpE1qRNNOc2hKOU0uXX+Ndbnn9eBm6PI0EC96TNd+CZgbvEzEDrB?=
 =?us-ascii?Q?USkCTGgNwtfnkDd58nn0+N4f5RHu8vp7eOKgq++4KNFYxRpKjlzBWaELE3t2?=
 =?us-ascii?Q?ZFiW0y8RImfHftMOhQxkvqqi0ZJscACqTpxuRQUGnKj3dnbNLTmVbbnjW2Wv?=
 =?us-ascii?Q?KRVEuR0NSkgWz2xgpORrG6yCQVVHhFfQHEtj43uBTYZKV+MVEYbpMNtidOQQ?=
 =?us-ascii?Q?ZeoMqigTz74yDkhd9Yr6YiKYKudCICyY+z3c5JwTsiK8vproB2DPf//Hl34V?=
 =?us-ascii?Q?j2QpEOnj1tq98L1gp7vKwu71OcprrABTuURSt4DllULFh9jJxRXDOM9Hh3Lc?=
 =?us-ascii?Q?nZlGJ0Ve4oj0iOakDJuT1V/3QDhbiDJMdkojYEsDY1DESg+gXn8VcCQGg7m3?=
 =?us-ascii?Q?2S6aBMUyoUANwrIyaOzUI5XkaRx8h4gQJQzR7xwvMgWYBGB0gB+l4OlDU8DB?=
 =?us-ascii?Q?JtB9oMKrRgm0COBKrm9TN7X+yGmGb7ENyjsu7VHAqta9xko6oBwLgukTO21p?=
 =?us-ascii?Q?XiHv5L4LP9JO/w9yZzRCphGwIJZa+4sowBIArSYTCcjGUsIMGWtcsyRDCZFP?=
 =?us-ascii?Q?ehdWbwUd5tByjesiQ3WO3FSwKmaHarhk8o9EQ0UXO9LatgEUGDX5QWjIVTJl?=
 =?us-ascii?Q?eV+ClUs1hgF/N+8EwNd/FH7dHn/ki90cqOEZ3RQl58hEBnlgD5sdkXukiWIC?=
 =?us-ascii?Q?ufqovUieeacUcbMV2BMGKo8HRjNmO7D0ZXFQvbyHR2OMiN/b89fnCTKbRm8B?=
 =?us-ascii?Q?7oFvUshCrhSZjy8NWsGeNx37eQH1JCEYKpoTzU+kXhQ31aQOEYevqq5k8d89?=
 =?us-ascii?Q?r3YYE+EKEmXHzUUrhjBPPK5+vCIEEkAYn5Mpp+N40Hjh/c/WL2/tX0clgBI4?=
 =?us-ascii?Q?SD3voXtnCyuPT8al7yPHU+AL71SiPEjO5YKFFbMoE2Eeim7qr680r1q+H3PX?=
 =?us-ascii?Q?0NPO07I2EA0FnoSbqv/t9wQWhKfV0xXUhbciSGf+b6C3QEo6WZovI2P8IDRv?=
 =?us-ascii?Q?ZNCHghVzjjahpLrTr17CIhTvxn8RpD108W4p9si+Hg/WWGcP0Ro5eU8JuCNy?=
 =?us-ascii?Q?MLVGzPjwIwI60ny/u4Y/pqgD+//hiIveJ4a96VBDc4tHNnCPO77/Jg7BYZ0h?=
 =?us-ascii?Q?L+1cr37zpfwBvyL0rvUff8xWuKVzfJZPOAlvGQ9mELnJBQwT18d6PUexlszh?=
 =?us-ascii?Q?BWnoTG7bxu2FboPSwKmGV5ngwf2CC62iH1M8XAztqEWheDlZIzZQ8Glmc8lX?=
 =?us-ascii?Q?hzaJVmbHGOKPZy9rJ7jMAMaMEMoUT6RYQCAfTX8qC4bsvUgxCk/qDd6ZG254?=
 =?us-ascii?Q?y7KI9AEWiprJRyh25AGOAOihSOECeGFtHBXl3RLv+7hybIr//YSdPeaMfVsP?=
 =?us-ascii?Q?s3fw7vH1JAqmPxii6bOzvK059+9G1fkOK1Bck4apb4DR6c/X8Sej0TwGqAMk?=
 =?us-ascii?Q?ePWCaoLM/vVEGzrnC+lYVW8C39DqdHTFkAcRrj6q3On9aSiLyH8Xu21jGqtB?=
 =?us-ascii?Q?0TTPCtyX2a4GVVXUqjCyRRidyseIpeWe3wAdo8muLI36K9GkwGMrHFIgtEoN?=
 =?us-ascii?Q?lIty1V+HcXGXo8pBwBtD0WfqQVPiFb2ppHGYdpbPmxTemgyM8keG8U7yTDD6?=
 =?us-ascii?Q?dYO/CpymUSaCjQondtPVQvmVtPzWQQ6QVYItJDOVjKGa92G5QRtCSiqh6SNa?=
X-MS-Exchange-AntiSpam-MessageData-1: NHQmIVT65nX9Fw==
X-Exchange-RoutingPolicyChecked: 
	pYp8nIK7RcXp+Xs4xODke5I5jCFQD1ARCv4e2DPGXQIkjz9d3cLR82HnGdiYQekd2gc+9nFRmUES30PHOhFQ2nimq5skIOQ6lxf9Ufh7dOhl/hLumtLOC5qxMUvjSdsvdLvNXStr0g4XK1j1+uon765h4eilSq1sdGBiBC8HBX3l/nXy9xVHpF28XoWsh6oxGbyluWOlGP2rIVSLhMSnHvncQp2xbBEsDD8XRNudscLp7Iyjd7zvZTHBIbeXWCsM/85agHnRr/cjQn25NY7WiSUY7CbV5MNW7zsiyfONih3N5mqYaL2GxfklVd3vCoSE+ho/kBSUaHMss1W5ybyJOw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9yMhPQq/+2oDdfV/S5XiFErVzecxXVgFrd7phmreZNll7S9T2LI6LPvRelYosWnIXZsmJinO20pnqABTK/ulLuED2B2EDNBdYjmNdjXdheFh9HPI5NKFIFjJkRbaV02sv/QcBzHlS1HEgz6Ca3C8TdpV86cjTIOzyyhsWjQPkcIvDjas+zRBtGRt56Wr4i65mGWgr8cfNY/3qGMpYYprlVlVxoiNx+7ou55bbWoht3oFG3e6CBnxSDBWHRa5t9U4eJAx++7azvO1ELTnJudEf14RgLqI7LWKvNm/ZueXsa8CoALY+56FG06eode9QhZ5SYhf+QL2aIDK7lcbtqbbGyk3wGhUU3PCpiDGxvRy5oonxnqTFzIrhXx0h9HwNqwyBM8b4Cw334RdHbEMxBNu+G/5crMbbNbI6HCdZ4zk7HGKCg0476M2RYaKxkYNQJK9K2hcna/JA0lDU4Ja5xpV7CgF7sGgt9V8zv+HkOW/7gtV3YWWTr31e13ZnSQrGvsog7fdKwt4+1Rsx0Uuu+1x29gH+B24TzGGbMRC6qzjwnY24fp2uxM8+vZEsRySnMOA+Eq+Mj2Dyc0YqmAIXAKWb6eOm4b3h46meo8opXuorHeOF9P9V0H1hJT1ShfXy7l6
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a92beb1-1105-4d37-6104-08ded75e4284
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:17.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vdnydW+oqK337gnUWz6qIOUdI3u3qSquNGCbo+qeWq4uJ0EehqUiUqbRvOlSaRp1LZ8e6i1Yo39mOK7QVjXBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz1 with 4gqxZD5Y2xz1wsnH
X-cloud-security-connect: mail-norwayeastazon11023129.outbound.protection.outlook.com[40.107.159.129], TLS=1, IP=40.107.159.129
X-cloud-security-Digest: 22b050a32b4a1e894e997782e2d9781f
X-cloud-security: scantime:1.376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239967

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25

[2] https://security-tracker.debian.org/tracker/CVE-2026-56113

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56113.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index c940d6806a..b348c895e8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://CVE-2026-56113.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
new file mode 100644
index 0000000000..602fb7979e
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
@@ -0,0 +1,92 @@
+From 7c4a5dbae8ff99f8d3c2d8c1d3be95b60ffb4485 Mon Sep 17 00:00:00 2001
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


