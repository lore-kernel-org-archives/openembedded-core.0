Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FEBC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:59 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42195.1782902934106521878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=mDoNNFbB;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=fsDWWIjyGljet+d4855tH1CyhONoe0T+VTozQTJ8ZkA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902931;
 b=BgS78jW0bgyysxu7Z08rVPhwkxXJdWeuq/qkHJvNXoaKrhwyqjIGEZt4KpPNtGFyTGrcI3oQ
 jOkYsDXFEkx8QtQRynu8gCdf0iXu3R/ZWIdkbtELC3GMj1UIr/zXTSbOEJNnvQ79ZzD5yyooLg3
 0hJNEPROIwCo6V/o/7l9KHTzq8Z3XBkEVt5ETpyCMPMfhQ1Gd/2LOOrZmyRP1H4lxJJjjSRIurR
 wqKod6tsJSgMqZ0PqQEJ0WSMHunDPtEvpFlRILJG/1hDsRsOuHA2D4wdZwXJBfVA8Pb7IY2stss
 7fz9ore5dn6nOMkuliuON8jAjjVbaHyhidejPZvTCCFCQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902931;
 b=EzYn+a8LHkipQONNxXIHBuZMqsuB7Y1S/LGJlAqYhIVenpSIbCsnNKoKZZEIzNkR00B1ypMZ
 ZQqyBYH6fQ+aM6V6aGJo69F5s9q8CIrwNGiRinoiOjOsa6nA2lc4TtIO7RqVXYf81JJqhNtfi8h
 msKKeJ7r4wVAPnrMokI9dco6lNkVr3tmoNYvxiOxQuTPKyV/lBmzgB2zE/PC2exvUrxl7ezp0fo
 ayh/Febr9F18SUq5NC3wspjHrMxfYmNcSfxv0BoKDG2wnWnCFIF5il0oPmgXyJOYX8YGOxN4Dtt
 jdQlo6yQWn9icjysd//VBGbKjdByNw9IU2w6gtkftQ0eA==
Received: from mail-norwayeastazon11023137.outbound.protection.outlook.com ([40.107.159.137]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:48:51 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaJtLdihcMH+WASwWfeCJOi4DCsaPsV8Wb9EGmA8eeWPeJiiQwPVOHi6lCJS55HEf+EIATjaj3jEtrFIIRAWJl44zFdLPxE+VNVI8b/EglH6rO19Na9Fwbtj/or3hDI7nRSdWJQ1e9z/F8GwECpLXqabkFBLYUgqpKFr09oykgJenXKFDJl58LaRmO3G6qJJ9A5fApE9edktgH19DcT5aL9ABLxREHlpYo/SfLvNqwkRkjlnkkKUTtu9kxcmKE2mI2VLabPXVdwC+nAunlZkQpKWmkKiv9t0tAbn/96kTajGmN7NArIe0d1zzLj1Q15ctG+iAP5GmnNTQWW9/Up4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsDWWIjyGljet+d4855tH1CyhONoe0T+VTozQTJ8ZkA=;
 b=ZAScmjaYOEnux5UQvPvvxb+tVNMdlQCOQuLUdXdMMvEI+jhSuvI23k+jQdLhMCeqPYCvneM5D7S3w8Vnbndq+dVOlNxHGjZpVM6uUGu9TNXXKh7bghaXnRoWpjqRGauRqyH1nzGWHk3/q6mGwfujxKAsi43nnyBVaxtR8yeXX039NN9jhgvrTRT3oEU3BN9GJ/JOLREXb6N4vZm2Izd/OcTPX6QZ3AfUJD4yJAZkmJ/h489Ezujnt66RGt7isrxp4puWtYVSmHT3lP53dZhYn0uoNv5dVmsK4OcRqQQJoXTvkdHu1CBe9UBUAhfrlaO/FdQI8NAUKCnqPqZ3XjoiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsDWWIjyGljet+d4855tH1CyhONoe0T+VTozQTJ8ZkA=;
 b=mDoNNFbBwcMB+8Oai6UO4pGnE9Iieoccs4IeDYXyvGb380+eqRubx8llZ77lsuW5kgWttAIbfYRzvJZnB1Cv39mG1pG8m77ReZ9mDxa69RYDaVVQHWVLAs5JbUxZVvwxqYFtTm8pYa4n16f0CkQ94TuLzRS13HNF9OExkJHYaz2sLGm6e+SYDaKZ5HSnFTqNhq6msdqvzZPVt64UkyD/3KAmm75itUjhP1gRSB0PlTOBxalizT4vfmyne5m282MB1xDtPXLOwlixTuCtRo7IBaHq2TpBSuxk5ss2xTo20GCN6hMCd88ZKvpoFSkAwUb8zZ0+qkCTOufb1JE3RYbXOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:46 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:46 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH 1/4] dhcpcd: patch CVE-2026-56113
Date: Wed,  1 Jul 2026 12:48:34 +0200
Message-ID: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f22a4f7-33c3-4de2-6198-08ded75e53a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	WbU7vq9ZVShHfAlcTbi/C3q1KDplcSyvQA7zfyxjYckEVjFu8ujDr5E7r80PcmgnbufgQt2qQxmZs+nqIyNli2hwhHbaarPbUMjCtxJAVl2Un3MDKdKCe8uEPdwPbETmJ4LWZ+WPrC4tqtF1vsXDBbvbgWRqOXX2SLWseRSvErOjMf3qfeadcNVGFfm9oQ5hnsArA76HZIrp1ao68CRBVhLJpc2hh82gIcwNPffeIgVN94yVdbFM5CNi7DhL6Q/NAPVvL92XTlsLAyzKcK6xxlClk5MQ5tKKK2nhl/KXJefsgsQo5LQuHeKGiE+c3tPRsfz/kXOJIcR1B4Cm6JIxZNiVTr1j5vMJTh7dXgBajxVvp9cUG/tTQv3w5y1eOzLVXhrCJk/z3Eciej2yWHOLT353gJykDoAvMLVkJG0TKOLp75qYgzbbyKIBUWTlQ/npU4hm25zPO6vCGPGuRzwWNiE2tKL+ur5cqiem57gkr0C920bwwVkcfUqRAhpIiST00qj/Vp/5FGt4fzsIg+YqBuX7fhXtzNndSU8vMKWbi2pXVWGBCieLgfanveHdFqfBlqDEw7iF4GOsWAA5OBNt50hXVr4EYgPdYTtSTnK32Fsgc+8+HQNI8/zYoSi/2reGZWtl7ngUze0gU9N3MBlUqEeLRKzQ4+/DvzEGkk1ZKI4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dl1rbbDndsqdtHYy/t9Su2zUwTMharzKOgVuiQFXN0SYpGciUWoam/mHKziL?=
 =?us-ascii?Q?U7wyXBP4dRNJRFYvRB7iGuAc8ZO017O78MfmM9e/CfLoBjBFFbeCZ2B6Wc8d?=
 =?us-ascii?Q?NQGPfB8ypwpv/5dmus6cz54GVoNa9YI+fUEmP2W99gfQ/7/6UPiYPguuuEvv?=
 =?us-ascii?Q?QNfCKRwAz9rtUwtxKuhziCLFdMuTKlzMoxgSHEFWGI7Tca7D8cY0lGhE3MMH?=
 =?us-ascii?Q?mHvvOzVFtIlcZH4lD86yhcqZblfHJz3MpJzYkPmFHJ+C1IwU41YVBFRILU5O?=
 =?us-ascii?Q?XAtuyE0ncfUhEPr1hGOyopxjCrtNEeC9mGzOLv5ho3PmhrKY8dKSgxjWpPch?=
 =?us-ascii?Q?aCXMKdGjzb+duw+F+8dMA69RvAoXJGlLTHpoaDJIgPFH2DgR5+brfux+bjfs?=
 =?us-ascii?Q?hr4Ly+07V3AezhOFQ6tsbbIrbPteQOEhdxCnSyCA+ZKNTqXcRC5XAQlbuAAx?=
 =?us-ascii?Q?C69e1Iq59UKr/rirkaClYDXmzO2klLOplCDwgATuFSMl+6s6R0GffA1WckIg?=
 =?us-ascii?Q?Z1JlrZqZuCR6K+9xL4iSnIn/rmQHBvq0uEWTv1/jUc5yESXRK4exHT121/F4?=
 =?us-ascii?Q?lOy9KbcuDq4fw2wLSVIFtWr13yETBkDH474F/ZfvhiqCraaW3r7jG/xZ3OUL?=
 =?us-ascii?Q?kksJXoGpziVSATvElqlt7tJ+hPiMrypFA2Z0F8VSpggF6k+qpK9hQTeiSutP?=
 =?us-ascii?Q?z5yBCasquKzuoaEKlktLQrW9mlNf+mZ2Hfk1e4yGlts0q/OU9J0Y+eIlsBjM?=
 =?us-ascii?Q?st7Ft18Oq6cIUuJjO5R8yW44XdN+K//6mp0oYfyPTbydkd33PWp5u0i9z/Dw?=
 =?us-ascii?Q?NFbPc49UU9Zm+Daw+yvWirKBOTeYGy/YImmCMf39d/FEN9BCM4eXKA38uTX+?=
 =?us-ascii?Q?4w1gPfQDqIR5xKGOZYJb6xsPjWndnsPi+HQxd99pnbLvDJvL8ADeL4Ha0JCO?=
 =?us-ascii?Q?iq9pxSfcgMaHojth9toPi1E2vILi/s38cY1zUzL6ewdLVwlsDjTOnH/MrKag?=
 =?us-ascii?Q?l6nxUc6xM97rtHv5Y0Q/GBEUJR4/q1hmUIh4zC9H3nK051SCEj6sA3EUyQrj?=
 =?us-ascii?Q?+IS5sJiccnpv4hN/fi39yMqI5Xv4wnt4VvZ9QF3fUdWN/QZbfrTnz/DFXBIa?=
 =?us-ascii?Q?lzLQJcknNY5ajuocXQNL+eHKhw5PLy2+xbS+8Ym2YTIQrG0tw9GSdYM2q/p9?=
 =?us-ascii?Q?d8m/Xi5a/89eFUnmHNGF3exVOH6+CFptveZ/tC+S8kPzXy0bKuFBo/JqDX4v?=
 =?us-ascii?Q?0NfAGQqnos6PcYu1baeGrWaNtA3niwfoVZxE87sOlFAVeCXXT0Bnrj8twXKW?=
 =?us-ascii?Q?Ez4i7FbacGkMm6xCqSR8jQPY+XHEv5fr9UsgMug/zE1xWOmX5u03/c0SVjfp?=
 =?us-ascii?Q?/zMrkAJxgy7c494+Fsg6vD9z9/Xi1+zQD8ri6ma7n35sQrtHH4NEsrGzrLh5?=
 =?us-ascii?Q?y6o2V06XagIofE1glnp1sIcPyaI9hKfcF2i8BfSfUymKvbIxkKYdSVa8I0/m?=
 =?us-ascii?Q?CtCJ58MK/X9JkX3kV11bJLbmKl8AJmFjF1mGJjulrC3y32knWBFcKJygW5mh?=
 =?us-ascii?Q?Y37RPq/sjW1beD+08L0nAf/stSHMmg5YS6F7uCm279iu36CdxsiJ3FgC00Hh?=
 =?us-ascii?Q?LefLypk/CafIhZ5CIAn67Klu6l+pqra0RaQB3YNLxFQCaYUV1afrRws4et8b?=
 =?us-ascii?Q?6fZX3GqD9uMJT2OoNnXHaivYUB7yTFLxPTV4elTJ1IPVvqofrqEq0tu7x/62?=
 =?us-ascii?Q?YCg2Uq5gx12U33m7OUt55+h3cHYREUffc7bbCPtkbOGJ2TVhIHh2/S+zCjxb?=
X-MS-Exchange-AntiSpam-MessageData-1: 17DyZmNNfJeLEg==
X-Exchange-RoutingPolicyChecked: 
	oeyEURW54hN+mnx1kBxBodb+IKrICM65X/bBpY/0WC9gnAeCqXwsqOXNsAdc+2aU2t2Ylom9+jFbwW6q5HpnhfxKcKswU3jFEfbgVKeh5IsYye9cY6H4V0BvfNllEYzLX7HtB2gygFegY3pJFeGW5b1L6twiUEqJCqE73TUvWSlCX/s196YhMEozoE9mIcE+dEvT80so3mUTVvl+CHWMd1LRid5yo1kejGAjg5fh7Zu2M4vuFVz84TkSU1GXwQ5v28RkmSXXVGWC61msCUncVRgyMtQWKdZcjIgeSmOmSzJqKNwF42BjY0uj+F8W031vaoUTcBMCSlhnp70ZvQ3NhQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Ubu9djeyYkb6sEzQ+Xe27jg4wuG503hgrB1VIK6PIxYsoHWHPezLVs2mp1lN7vTWHYYy3mJdqWe5pmeofh3N+KEUJDycFhlys+MZ9ZRBRjAwCIMMQCVBsETFf0+ti9BczgdRPXXQS2abByEGc1dufMig+29I1PbAuUEG4OccgGokqpvsLjd67ArCqqwlO8A82u9GC7iHaS9puiFm80lGpLUQw+Zumhy5KJPmkO6J/mIJBJCtiE3e+wrDMiUR6tKul09DoOxWrGy29yo7KCOjxAp0/erk217epfZ//eboM6O15cIThGk5Q9D/mmGhYfxGdNnCBzxL54SAc1mwILocyIl9GEspqdzucEyraXFFE6Z1gwtie0wvW8PyZAJnaxM/H8K9tZ8jtQnwa+SnXrRicuuWgAHb0XiW3keKvnlMUBnTJ6FlGwGe3q8bs/tQcDj3C0KC2+JFpR7Dit/P1bFzawWQ2YdUk55wZq3avC7FdSp959M8OkktW5iQFSf3MBmXsygkVIPAd0478utFMYzD+f7Kj3qJo086lkwRAkrhiqR/r5Fx2buOx0YcbywGowkIz6rdInm90H3lbsiaYQj1HCrI2vmFeb3pyOAM+kguaFt0aOWycmovATC2zGjFKWc/
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f22a4f7-33c3-4de2-6198-08ded75e53a1
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:46.4067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAjTMkDiKLCmDxorpqbTlc5yF7+/egwk2NKEmOTr5FBvfYJ2rXqQBwjniIN1vdHvYb1RW7SOoirvvWRkvx6Y/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gqxZm2sPnz1P7Lg
X-cloud-security-connect: mail-norwayeastazon11023137.outbound.protection.outlook.com[40.107.159.137], TLS=1, IP=40.107.159.137
X-cloud-security-Digest: 8988821d5af9378ef213a25076e0217c
X-cloud-security: scantime:1.094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239971

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25

[2] https://security-tracker.debian.org/tracker/CVE-2026-56113

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56113.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 6bde9b1f51..65dcbe52ec 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://CVE-2026-56113.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
new file mode 100644
index 0000000000..6727bc1a69
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
@@ -0,0 +1,92 @@
+From 9f953ada0df6e7a568f006f3ae0ff10a77a95924 Mon Sep 17 00:00:00 2001
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
+index bdc3664e..5154bf41 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -2480,12 +2480,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_message *m, size_t l,
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
+@@ -2511,11 +2512,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
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
+@@ -2523,7 +2527,11 @@ static void
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
+@@ -2545,7 +2553,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		/* If we delegated from this prefix, deprecate or remove
+ 		 * the delegations. */
+ 		if (ia->flags & IPV6_AF_DELEGATEDPFX)
+-			dhcp6_deprecatedele(ia);
++			again = dhcp6_deprecatedele(ia);
++		else
++			again = false;
+ #endif
+ 
+ 		if (ia->flags & IPV6_AF_REQUEST) {
+@@ -2558,6 +2568,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		if (ia->flags & IPV6_AF_EXTENDED)
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


