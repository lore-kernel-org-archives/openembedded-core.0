Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9662BCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:30:23 +0000 (UTC)
Received: from mx-relay19-hz12-if1.hornetsecurity.com (mx-relay19-hz12-if1.hornetsecurity.com [94.100.139.219])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7385.1779265813439290463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ERYGoZNh;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.219, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate19-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.130.129, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=mrwpr03cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XX3SC3ncgltKsdBsQj7wGOnlLw7DqS3IfHhPTz85ZPA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779265808;
 b=Hk5eReoTTSehIuVs3lMgEdIC9JoOcg+MdqykmO+sUfg9vqxp0J/Rivb8HYZcJ2TvjN5/TIbf
 CIjfn7ZS+rAjcVwmmBKzsN5+qumjBra+w//zg1fi+LK45qbryDqVCObYsMFEC0LqfijdCo7qb2B
 T/b/Cz4pEsqcp+e+kXb6o9nZ1VY4ozfdtl+uJQ/q0y4R+NRep1e5ln1d/LYO7LZ9wd+5FOl2iUG
 Bu4SNL5A+d1A1Ws65Wlt3qXnRax9Blq0YMLHdU6G8tpQvrZi3u5NN1PHWa0bmqh3lBPnQmwDij8
 XvFAuSVMVjAmBxdNObOtv+44F2NKwTbUh4AjHtwOS3rJA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779265808;
 b=dG+9a2TaVGMF9rPGoN0xjysy1eiXQcTy2Itvqb+MxuSXZkNuoXqDq1cIH4hb2fnYGVSBag4v
 8wQFWKE5l8IaMbTNJQmYBH/GfJhfACQhWiL10Hat0ZUstb3yPhdGiBXD5DXCorDfOAhfEk0dEe7
 0GdXw3AGhQaHKKvg23gQvomgTzWL4k123+YyJQAz6Nr7xdwYaYn3l7FIACF9RTQgCvDB4KD54Y+
 ZD6jBsZF5zzM54kXZO4VCj12jtQ2jWvPV6cn7nElj10nFZnnb3xiVwF2zM/EzgiAIN4dKDXtThg
 Gp1KNNz0Q9sd1wBE7MEfF3JKdFKqfmNrNBvVCaYoDy35Q==
Received: from mail-francesouthazon11021129.outbound.protection.outlook.com ([40.107.130.129]) by mx-gate19-hz12;
 Wed, 20 May 2026 10:30:08 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfYJ/+KESgKJonugt1e8mJ30Ix0slrPjDdBGXk5FjJ8wDIEgYM/FCXTeO2ELCmew1YUas7jyjvTdkKLhW3/drTT+BOvyzw8A6DyQgGbzJ8MIBzcB4+MAhtQFjmdb/UFy3crms+M2Ejl0wCiCD1nfkJtIMcrZQXP/r1dgSvnYlNS82TtfJCum8VQz8yXPL3ytFU3OzOnQ8yUB0J5Dsh1cypimlCy65Jvf4DElg/hOpsbCAb3ubjw0/9Lk97zsAgOPiUT2SQqzEpd8oYhWFvzk5BIqttv3W2RB/A27cRys4Ucpx+QVMtMGSWJSjhnZLR9jDLysBIY2NpqZ/H8BaYUQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX3SC3ncgltKsdBsQj7wGOnlLw7DqS3IfHhPTz85ZPA=;
 b=niI7E65lejzVtvzzJ48Ya4CXhIC1BLk9r4/wO5qYX0CuwroP5KC1kb7vkZ5/yMTe1axt5rzCzEEbNYnasu7HaWPJj7ASJTZY0cijgqoThbyNGBt4AEymSsJYwWvbadHbrHvwoqasJJYDjaYJHT8dikPcShStCHYQHLevXwGGVjZpSNu6p3Tg+rliX6DIKV75FLZ8jiRDCFkilZIGcOYL8CpqXF6ro1aotOQeCcW1bHONVUpmyOZoDp/SEbgoX/NMQcGkWR+Qoyo4JIoEhSxs35xmrJCuNPNEkp5JbbFiwRfO+NlWz+k8YxaUqXmOt1ra5cY7XspohyZ4uVVxU01/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX3SC3ncgltKsdBsQj7wGOnlLw7DqS3IfHhPTz85ZPA=;
 b=ERYGoZNhZslu2uhFAw36y60ryVtBlk5Xx7EHqRAY38Twnk4VslETPZXvh2h7emtgFmTlUEBkjFej0HHwl7/UB90OO7Q5y4JHcQAncz0wt32grAkjUMgTxNDwtzLEpZ1WYnXmn0rc/y8o6DaRI6aAhpvIXp41Wt3MwHrLDADwkAvAvADT6f8NtVl0uBxYNlFrlGLda1Qg2zCaj8EpxCgh0w3dQcxEdiluME4JygNCD+piLrBjYsLfiSjixhbvCoHpw5/65zRchf3ZsjxGdcqZRA1mFpG/PRqTmpMd027+hUBFBieMcxR9e2wMjX6hMFlzIc6Mz/oTTovmkdVe7L2RMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PA1P192MB3056.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 08:29:53 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 08:29:53 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 3/3] openssh: patch CVE-2026-35388
Date: Wed, 20 May 2026 10:29:32 +0200
Message-ID: <20260520082932.1979208-3-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520082932.1979208-1-tgaige.opensource@witekio.com>
References: <20260520082932.1979208-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::10) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PA1P192MB3056:EE_
X-MS-Office365-Filtering-Correlation-Id: 37316fb4-89ef-4daa-4909-08deb649f7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|18002099003|13003099007|12006099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xkfkELaRBahwWxygUBgdShTaHef/h12jmpHZ2a0RWPsH36uPVtHY+E0H8elVJQrxb7mfu071yS/b7XXCk1Jhc0rSCo4VsPA9Y4mw0oewZ6bT4zQgUbO7gjLkvBF2IlA9EQ3zZRWDhNGSjFfKnhBXwNr9A8/C9wfJkbdvAH9lpe1YlACAWCKM3SgzIt9hDHtvkdlntEWfp7lpZl52XewM9pb3W1w4W34cWygsD88rBQpQzFdFk/c+Q5EJcFLxntFEsZTg9fsSTDaZ+Eq2VxhcW2VDu8n/NF6qePWxHM5/jlYOELT645Lrh0sMikyzqPd2svjB5ZQq3R5qI+SSOsmXBp0JN1FgaIXHcdJhSuGQTLwZfPU4/KOE5O5253okH1a1+LjmBrY7NIKuG7xcMvI1aIozCtfDX52YpKlk6x4naPVl2pVZ2EjDBXoOAnkxeEZe73dd+BFgsLmWBCpgCShau9Hk997j7t+KCHcHmfULGnjIG5RJVRlas3oV7omgKSrq8x3Tof66oOh2ewinxkFv3xS110pL7WT7XBW3oRL6XrXWlFDOxqm1/ovRczIrWHbTIgsif7hZ/ZGVU8PeAiFkcrIpYNx5gVBUzORrA8ev+HWnt9PynmVslZb+1ExpEwFKbY5zZDi/QvTs0BIKBacUeP6LC/HcqU+bTaLEqdvZrL0RmVb+g8UzvtU7f4tJCRYAod+Sw1Wqg0oYho6YDqIwkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(18002099003)(13003099007)(12006099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tzaOFcCW34ZFQYGp+lwjf0vsC8Fo+teDujJQrKDYO2fp7YFi5/aNUGlCGJ36?=
 =?us-ascii?Q?NYRHnlpXmecV8gBVjSzi1yXRVCuhCNMK8Z1n9YxK7s7cuxeilTocFVYSu2so?=
 =?us-ascii?Q?am01mZkEqY1wr/ninUndGJykoYPKK3PTz/MpfCbJfwHJn/O74ixgYZvVJ3JR?=
 =?us-ascii?Q?T3If2L+sAXIA/wdRdJpj83aD7s9l2118PhrckMyzUzcSrJJONh+i6EsO6UgC?=
 =?us-ascii?Q?baUfI0xbyoguRTkYZC9ganS3F8E1Wb+P5evYl5B3xLvDCDHXs7I5HdsrAQmP?=
 =?us-ascii?Q?4kriOGmIwF7UzLaOWOHmd4ZwFI4IozYHZq09BSaKRosR03NiZ5cRH/0w19DD?=
 =?us-ascii?Q?ofzcONgGRSrbWSRuiFEUfSZe1JCmb3F5Fvi9yUuUcCsDQKq5WgrbQwaHyrli?=
 =?us-ascii?Q?s/Dsu4TbX4keu0FrmAzjnjnJTzBHcMuUzpmK1BPBaNRbpjhYH9b9vZflclMz?=
 =?us-ascii?Q?hMENnwNOOyyBCOVLXk0XwaNIpuu+tvaY99O3kcdx+aLXd9okqbxBnJMWkKly?=
 =?us-ascii?Q?3TIg6MOf0DV0Ri1zdt2MTX/srFigDTBPOJ/m5pClaZ5FaMNuI+UL/qF8spyG?=
 =?us-ascii?Q?5dfppgpPss8f13p7DWkC3Iudk66480c5eMIgnr93lQAaDyslokgNBMXnWzPU?=
 =?us-ascii?Q?wgDMe0GreL4vf7vZClU53Xpi3RdLPgNLYTbdwu3qkrvST+e9yyU4JqZE+4si?=
 =?us-ascii?Q?ZXfRtO1dkYS8vlqznKBX/685PvsksJDLDjBdL90+VUY21y+rS0UwxpEiGO1e?=
 =?us-ascii?Q?zOeC4GOvfRR5D1AW8jnxt7pzurfOTyKwW6+0ZE2s0eVcymPrXQN0bUe6K8lH?=
 =?us-ascii?Q?26CjOEahyG8v6+b6PFcGAIs1wX7S4WctNr52wDId+vHCLQnWVQVx8pYG+63l?=
 =?us-ascii?Q?9UhDRC8PuMOX1YogFMs4Fl5fTILqSzJKkFNGPTnMMCzKAuLbhZBTBOJWpbUn?=
 =?us-ascii?Q?R9BihOE4GQTXB5VeH0pA8PHKAlr62cjVKBF0USZwXIV6rK2gnwzG49trKAAX?=
 =?us-ascii?Q?iqd9lrA7FZ/GGFeZJRNuCirD6wvS406QksvVq7tf9mka3j8/fqnyURqRm6hP?=
 =?us-ascii?Q?cD3bxIX7i5tzqV01O4DISqRXTL6l7gDZ+98zM4hKl1mfnwPfsCT8Wq/EpqwJ?=
 =?us-ascii?Q?kM/jn2vA2txdPqtTr7rb2OpHJ2wqG35RmG7+yw5aieBJ6T9Rdv/RkNZfJXF2?=
 =?us-ascii?Q?13k+izM5eKz5xAlG5gJZmh/pD8MGUviezNCjQ+ZDGq4RzQUhhoWtgBDpFcPc?=
 =?us-ascii?Q?IHhsD8d9FPGHd9EQuPmaObfLn4VDNxCkC5bxNvYn9cb8P73kINsgU1pdexWw?=
 =?us-ascii?Q?IHv3Efkk9kzmL6P+O0kqf7ztiLZgljr8OYOdC8Ox6LShKbwwxwQTUR5wYHaf?=
 =?us-ascii?Q?7C026u2lwIRm+16WYC72VYuUBcycHrqkJe/22kxo52TSBbNVT9AKe4vlG/78?=
 =?us-ascii?Q?+E/1/dRuW+KksdX2OaVHbJmAQsllEvjdy+JbT0/ZJ/tHqIq5q3MoyoNEHEe5?=
 =?us-ascii?Q?Xc0Gg/b524EF9jVjjeEl+LZ+162fXHXeGlUpIprXl+cp6g+k5yKENKRAJShX?=
 =?us-ascii?Q?S6LlMQLIxvsaHzN5VgVZyzRBSvl4tMTK32sBTfbWlXmAFMdqUX+XSiF+PWfE?=
 =?us-ascii?Q?Ofv5Mu+hmYj/1peuWuqgt/6nH5hd9tJWxwqnH2PNVSd+DNMIYB8duwQvso6H?=
 =?us-ascii?Q?2iAjnglnPxohcX9m/1ORRvIc9U/PCTue6SXZXQmFXr71W2/3ShnJ9lhugUF4?=
 =?us-ascii?Q?s8zukQwr6w=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	msx0YvDk6HCe2tLLlOvyBBu2mEK7CLXUsI5JoviRPJIpipmnQRwITFfuHZLQc2J66H6VqpwZGmfyyNoZXWRyVIEEhKZpDbIEEwj2A5M0c3TsmfRbYBqiJiIYeP8xcdbdWn0PUG7OsiDfOofnRtM7Z6LkFo7kQfmA/OHi/Oa+DEftNHxt9PVtS0TOZnNrwv5ZPM4+pqlCsdAEwyH9Un8QC+4rGMmzzTKv3IyEO4dKlDmH0r/mPOTrIoHE5Hm2zaj7RrI9dO6EBvBw+mcFYFC7DaeAqZ47E9jTrbTRZOWZ9Fk+JnPZIqG8nyOkp11/LIpvbWkb18DypcoiWDoF5GaJAg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	hqf5tQzfn7kCeZl1zgMMhKGRb9mC5du3X1GHQbDT9qHASDd2L3suh6Fy3Y9cwtFA+C+qG6QGvlpTVMI25mf3EE2ETWXythJ1VjTlJGgxnJonc9Yq4AH8L8ty1DFM/aY/s65oPIRYXXRX0a0A+qpPWIMnXIsOEHdDP5mZFZv1dOxtLEGgIJCPj9XgWqiQq6aO53GCD0wi3MmWYx1KAKHs7igDnU7FyOMOfLsF2eaZ76PomGppIizO/FfVdz4Rc5iw46hb7opvJs0kbmVlSkZ0GsFJMWZcKLivr/OM8lThcvmzYBMXi+ZHBAmKlWSBgqTCVnZ1ST4gAycD6qp/CQR65raccEsEZNXhaRtMOCjl9FjtUTGJY3PNLPTAyjVxAwNXMZoXak5IRk62JXUNEMK2T7cNG6OQWWDm0KLZ6hc+MbX1vx4mh8TMTxRtMhIp/uW2GVLHVWzIV2vLQrPFyT/Lt2QrOuoFQ3q1ZK0dmgko56h15sFU8KpgF8fpUamSntk7kjMmC8vcenMDaBZQMj1NOn5aEghO8pTkys6hVQDM0QDnSLfdwoTSM1IYz6o0A8bsQ2cavBpwQAwkqmx9mZXSq8PDhJKMpZrNhTrGtsHPESaQE0hgjJekOnFxZtHzYVIP
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37316fb4-89ef-4daa-4909-08deb649f7b4
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:29:53.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL9uVeHJ/amblsmW2dOgzzERvwpL2CrcCBIVDgfBLMAZiHyySrrdHLl5ApeRDsGEiftDE7PZLdtWBT8PFIv/ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3056
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate19-hz12 with 4gL4Tx5rMZz1mtbB
X-cloud-security-connect: mail-francesouthazon11021129.outbound.protection.outlook.com[40.107.130.129], TLS=1, IP=40.107.130.129
X-cloud-security-Digest: 606195b22e641994da6476af4d508f04
X-cloud-security: scantime:1.767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237430

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] matching CVE description in [2] and change described
in release note [3].

[1] https://github.com/openssh/openssh-portable/commit/c805b97b67c774e0bf922ffb29dfbcda9d7b5add

[2] https://security-tracker.debian.org/tracker/CVE-2026-35388

[3] https://www.openssh.org/releasenotes.html#10.3p1

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../openssh/openssh/CVE-2026-35388.patch      | 47 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch
new file mode 100644
index 0000000000..d5afe2538f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch
@@ -0,0 +1,47 @@
+From be42fe5ce64f2798048161a891083ef12780ca2a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:39:57 +0000
+Subject: [PATCH] upstream: add missing askpass check when using
+
+ControlMaster=ask/autoask and "ssh -O proxy ..."; reported by Michalis
+Vasileiadis
+
+OpenBSD-Commit-ID: 8dd7b9b96534e9a8726916b96d36bed466d3836a
+
+CVE: CVE-2026-35388
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/c805b97b67c774e0bf922ffb29dfbcda9d7b5add]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ mux.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/mux.c b/mux.c
+index d598a17e2..c841feb79 100644
+--- a/mux.c
++++ b/mux.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: mux.c,v 1.101 2023/11/23 03:37:05 dtucker Exp $ */
++/* $OpenBSD: mux.c,v 1.113 2026/04/02 07:39:57 djm Exp $ */
+ /*
+  * Copyright (c) 2002-2008 Damien Miller <djm@openbsd.org>
+  *
+@@ -1137,6 +1137,16 @@ mux_master_process_proxy(struct ssh *ssh, u_int rid,
+ 
+ 	debug_f("channel %d: proxy request", c->self);
+ 
++	if (options.control_master == SSHCTL_MASTER_ASK ||
++	    options.control_master == SSHCTL_MASTER_AUTO_ASK) {
++		if (!ask_permission("Allow multiplex proxy connection?")) {
++			debug2_f("proxy refused by user");
++			reply_error(reply, MUX_S_PERMISSION_DENIED, rid,
++			    "Permission denied");
++			return 0;
++		}
++	}
++
+ 	c->mux_rcb = channel_proxy_downstream;
+ 	if ((r = sshbuf_put_u32(reply, MUX_S_PROXY)) != 0 ||
+ 	    (r = sshbuf_put_u32(reply, rid)) != 0)
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 9267bbd2c9..a1b5d4a553 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61984.patch \
            file://CVE-2026-35385.patch \
            file://CVE-2026-35387.patch \
+           file://CVE-2026-35388.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


