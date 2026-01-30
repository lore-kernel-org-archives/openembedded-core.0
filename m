Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8C6E6BF12
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 13:56:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10817.1769781198088038266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 05:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TZ8gDI5K;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=649059ea9e=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U6AaCe1469294
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 13:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8pBguQsoL
	q9HsPUHIakHySGv8uFEvo1Z3xNI/dPHxls=; b=TZ8gDI5KEm8ZAS1vfREMTigxg
	x6rhj8CFnvhh61ngmPBGOAhWfJpZ+OM9iwM//+iIxByivsACIJqpUa19cPid4bmd
	5WtqtBTgqqk4bIjF27PRf7DwRT3cSbAuQYB9XPlRs28CYjCHnUjdCO8hDuguvIl3
	x/JJc3lP6cnvCLd5xMmdkQcDVBy2vCozPvu4ra0zex/JKlJ2ovWNZGUpZhGWJ0UU
	K4GatYkoW9uPLrTk0mIxykomufAAK6umc1IWPH8FwQSYCmS/Xw2A1xpl/i1edOHC
	/m01AJLhiAVit8RZqBQ5Y12hy7tuLdecBOwPefroZQvpDWOcFQCjuCRb1XVRg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjjdue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 13:42:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHV9qIvz9pYtYApsT3QhUt+wWT7TLdL2ivl0VZ3NCPRZvsXYQrrpfoPP5GrEzVGFZvg8UN7veTe3HeOk0e304xkqU9QoAu+jA7SVEarsuf9fw/O1+ZatMV9Yz2mwZtJ7xABKK7a4xs6/BN/YfLL5otfJoPchpMO335oB5LEBQETuT9/KEXPatAzV1jlY8CvtLCJ967nLpGT/puPVV0j/C9JCLEH4R7BuIqcamb3Tl7wDyMlJ6mXtVtMimRTzSN/seBELlcl3V2d7yDRAvfFvLKrG+NsaskNhzsAlPpx96sunj3j//M/9UkL+ZclPtVKFGd8JnTourkbU2LTkx/+U1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pBguQsoLq9HsPUHIakHySGv8uFEvo1Z3xNI/dPHxls=;
 b=h5Skz4CORenfWBjC0m6FFLPjCqnN23R/S4ofyyiSOHkIuyS9Wq7tXM3sP6ONt3tiJg03VmBYbGrE/DMqXQ4phKqmdAmJWK3r7tMPQNuJr+KeHOIJmRYNWMgk0s+VJEvNbrO8/y624McZ5oYYk6m1O+9Ht1PWU2FE3IfNgt5E5lr6ZJBKd8FLVkNiJQZlqDePpvu+AIYBnD8cbTN32iWPWVB0AfIWpARleLOod9vGzYZ6eCEjoyyL8MFEW4QDJTvIr5sosg8reJFumXiCqyKKVB9WIy2/EXnzIbzKMJL9u3c9EaMbTHo3u+fdSkFQIzKx7kLY0wOWb7u8NrfOMlW/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3228.namprd11.prod.outlook.com (2603:10b6:5:5a::29) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 13:41:54 +0000
Received: from DM6PR11MB3228.namprd11.prod.outlook.com
 ([fe80::9c7:8577:7549:d188]) by DM6PR11MB3228.namprd11.prod.outlook.com
 ([fe80::9c7:8577:7549:d188%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 13:41:54 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] rust: Upgrade 1.92.0 -> 1.93.0
Date: Fri, 30 Jan 2026 05:41:37 -0800
Message-ID: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To DM6PR11MB3228.namprd11.prod.outlook.com
 (2603:10b6:5:5a::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3228:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a142f0-07d3-45ce-2b1a-08de60055463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yg0YCr7d/7FkkixO4MiBjko40SW7lB6HmmW+NyYYYkQhB/ygPVxA+NN5w53b?=
 =?us-ascii?Q?7UAkMwbSoKqKfNy+RemQYIpFXXw6cyIMp6uXF+tzry4epCoHjfsVfz6Ljpl4?=
 =?us-ascii?Q?wazarqpsOHCAA1otwRLMWGccjredXVXpTO1cuZnjxJFi8mEd1iCSTHB8c8Hg?=
 =?us-ascii?Q?rWqCW8d3BPbV3cjCJmJDA3zdMr063VAhSjDSK4TH7SDVhS+YtspekJZAaJEq?=
 =?us-ascii?Q?Z+xCb2ar7HkvTrp0C6zmGDFvRikdOHVnpZhYHQ8/msRKOWr6aTWp63H13NmG?=
 =?us-ascii?Q?6meOgakphD3ZvjLal2PUUeo302U8M7JScL0dj5gYRUjojhlISh+SkPLXDABi?=
 =?us-ascii?Q?eTjprLQDjWYIV3QVySJgcIMarjsfQ0fNXdvDgYM/sxlSqlzDx5CPYO1hmxPF?=
 =?us-ascii?Q?MkqV3WZrue1YpBMfi29N+XCzggauVmRNVlCGDkiAu0K7G0ChMz/LbDa95g65?=
 =?us-ascii?Q?3v0PnmsbaTabz7Wq7SuP1PEbPBJULOLy6E18U+SRgHauW+GSqUG6oQ3KVKRA?=
 =?us-ascii?Q?3PaAoR4TIB/6iA0A0FkBCbaxkB0Fh2YdplpP3HHfLa4sLmqch+1XNRQqLibj?=
 =?us-ascii?Q?9xX7zDS0m2dLZv1bzQm/+Y4rCOgtW4VXNA/AY89TD5OeNsFLUmBXUGmYejeB?=
 =?us-ascii?Q?NK5b69C8XFHLPjVLXaInX1Cof6wbF2OBsZ0/DNPRp3gRbZxnELWFtsTjAJaY?=
 =?us-ascii?Q?uqv4U20WExJWXI/0YKHVdMzpHMqzxwFZnzB8jX7ieeXx7F7RKL6J1pw3q/2p?=
 =?us-ascii?Q?mJwb0M9+TxvRhPbxOkET+wpU0rBH1S4NFqerMM6iKBSh8awAshJ1Vg27AVHc?=
 =?us-ascii?Q?PRJTLXI1/j9JTJql87t+wFp0Y1koVOgZbQ9ixtIMI9DpI0rGvS3KQj1xAdYI?=
 =?us-ascii?Q?OZzOKMdKxok8HzcGN6OSQbo0aaFq+vusRgoCzkeIwukdAxnRqiThI8tWSPrq?=
 =?us-ascii?Q?DU8/33b/TQxKnJWCxEOFyPrD0xItEZhm2Kpq2vRf5Z08X0SKii8m7EoA10o6?=
 =?us-ascii?Q?OcaYtEOWp3twwxUzPUvlvZlvPsIOqxZRXEpr/q/e5i/vnCYLTrgsEmWRuxh9?=
 =?us-ascii?Q?UHa3Wl+/XXRB/qtb3+2wCqrlvAWzBjVLbT71dx67pZY/q8/GZweIlBYPPCWL?=
 =?us-ascii?Q?QFKzAM+CStj9RnS8p583eoDiaSi9HN5zMb3/MJvnYqVfHWN1u7sgwvNztP1R?=
 =?us-ascii?Q?SoZgCH3P6JUUvNCmSMHtVLC55YSrUkwh7tHb52gRKIt99R7Jn01fqDHQZzid?=
 =?us-ascii?Q?x0Bhc55zGlF08uN2b9aF/o0KoR6KBr0yuFXu+yQGQzGBQ4IrmKl69lPMa112?=
 =?us-ascii?Q?K6ASZe3KOLxtu5beknVWS3d6RGQdxgR/1IpeDt1aTrMhN/BohPROWZZhL/2q?=
 =?us-ascii?Q?mXDzUZk6AhmcPOM4CNQcnrVJCb52UAmn9cbUK6Dqv5A4Me6EaoY6Og45wNRL?=
 =?us-ascii?Q?gZVImUbADMZgAi4sNvdQGNhZ/Rif4YXs1+OgufFQBimbeVqeuIQDVL6kXf5A?=
 =?us-ascii?Q?w2CHWajGySPnsOKKbUbGXQjKiN8WAjJuOXkBXg7CnMNtz1GHEQt+2Thk5jTY?=
 =?us-ascii?Q?o/L2tp7T7oVz8kEkFEWVbUingpw4HDjlYISaCsS/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3228.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qbRFlRHR9nwp+/5qv+7HYtbYwOmnrbzJQsWL56yR7UTOfHpqXEFP9UjXYJAI?=
 =?us-ascii?Q?eoSzgz7U/UKygCAQ+7eaQg1QJ6AvjCyqruAYjm7avNo9HZzMUJBCiP3zCU39?=
 =?us-ascii?Q?OlT65VgU/Wq2X33+5D9XjuILK9VmkN/z/XgZurKzylE2uUplRAkB0sb2j48/?=
 =?us-ascii?Q?pluAygUuCjhAsbrNOtckL8lLHZWcnY5EvzjXC1cOxeijE5+JCFpHsR+Q+I1G?=
 =?us-ascii?Q?OSgn/YmTEOsw4LXcb2HySLBxLR/YaaqOCiKYHKR95g6sgnHsCtq+Qvam7dwo?=
 =?us-ascii?Q?Ye3ZPHUTQKJGDoYNFluxUPbA1sBEho4qBIjAmOGkdi91+asLmTHzYu6J/y3M?=
 =?us-ascii?Q?dufSq8Z+xHToFjU6SZpp32F1+kY7ARI7U1l5blosGGUI2aWn75iZOpzNoeAR?=
 =?us-ascii?Q?sdpPlusfrE58E6NydQpEUBuEn1VX0zp2KAaCmX0D8Ds2sWXauo0UZDVMaRS2?=
 =?us-ascii?Q?2LlO8F49HnoXO4e0WIazs9WN2f2HBJi2V1dvf53Qz8mhQVsjR/3gB3Qk4CZ5?=
 =?us-ascii?Q?QBSB8F1pdGQg1qhsekKA/ICSCtMORkEsVokm8v5Q484oz4aJEbPD6Nspwoj6?=
 =?us-ascii?Q?FjDKRhZf8Eg9IxTtqqxqE/FKvPUQxyv5MtdbYaTkZ/7UorYbl6Ko4EdcflMA?=
 =?us-ascii?Q?691u7M70ZCLyalvp8MAQL3iHyUz/7Hk1egkV6c1Xi0i7LOh0yFiozOw6EUvp?=
 =?us-ascii?Q?y56rZIAQmfNruwhypG/gvzZyJpfTCtLcQEA1iRyfRVPY+kFpA4s0RmIxK64i?=
 =?us-ascii?Q?ocQzArteQW6mI465KAlVwl2kh39hWdAAMNWCLjhxC4Gtbf2r7/g7Rf24nXRe?=
 =?us-ascii?Q?Knig+TXl/OJdXwpwaLLN64NSarP4CJgngrGYsd673pC02333jgj0dwhmRlT0?=
 =?us-ascii?Q?8jGFrQFu9dVLNpVTHsWFcxdi2dr00YGaJiK2ukMcbXNHmUKZHiNFORydfa2B?=
 =?us-ascii?Q?YUcOrqZX+c6E9o8JfvAym40nqra65ttCeq6VvgRt1dMlJ2bRR2/kvuWN1qkC?=
 =?us-ascii?Q?73eLGRtyfQeuts+hW+11vqBlseoQbxJytcO/gZ7yPdUyxj0SB8k7Ah8oNSyl?=
 =?us-ascii?Q?aUj2fCALWsQK+oRVOBZWg+dexIzB1SVdsawKhS7sb+Kb047fBYRiRiXq7tp5?=
 =?us-ascii?Q?akoc2fkheOiAECfBH441HBG/SFMaWJjiW/Ljkoy2rchi5c34M+MOQTUGb7Ju?=
 =?us-ascii?Q?YyMOUXc8tCg4NVNqLkFCSnI6DcCV0KieTx5wqyeWNWJG6uR3ciSppoeqoIit?=
 =?us-ascii?Q?oZnun+yklCstorupaRsiQGf9n2vBUZIDEpDNd79TRyKtx4eH3PATuhVr+QxZ?=
 =?us-ascii?Q?Cn38XBKS2PKDb0Dxfkzus4RkPJt6QxJM9/tCWAcLGcAo4+HjeZCQgwJrSoa4?=
 =?us-ascii?Q?/uv8aKSUcFeQ43wHKcaERpqAuA54Nuug4zW28vXL0Sll17dl2Ovf5M5vePmX?=
 =?us-ascii?Q?vZhPgSUK7HKMjHcECx5qMFWSxwyYXT0OJBcoOtLFhdsN82dzWVkSrgyJOPAQ?=
 =?us-ascii?Q?i3jTXxhwl3HDdzDq8GaUfGZPHtQMCTMlcjj0toTaXNm471cOP2WlapBhgOHY?=
 =?us-ascii?Q?NGAHbD3+jJ28xnIxpEI/we3TLJk9dfM1JCxCd2mQOL0P6W77iCfiJTBnOKaA?=
 =?us-ascii?Q?rLwiYw14dFOFXETLDKJjzS2BjIH4skXePEdpZ7z2oC5ftlp3pY8ayeMROK3s?=
 =?us-ascii?Q?wubasur/+/Zv1DV9au+ZCZ3I8AYBG++IeSeGdAVft121S4KHY/fg9OIj55W1?=
 =?us-ascii?Q?hUcRdCu9lghSXp+/4VICOCzx6ms3kjQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a142f0-07d3-45ce-2b1a-08de60055463
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3228.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 13:41:54.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/KEDjU3VoyXvwz2RpTlrnwek/ZgXNRjLpmjk07Yx9VQPTTsJ0qNUCX1V4TfwxP5nj0QMcwuVeq0xIwk7efEpbGjxcVhLifmlElhYf0mBL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDExMSBTYWx0ZWRfX4xr5xgN2g6mC
 MOPmDqkX3nsE6AXHDN7K08UWGGqwsVypZOZd93qdyWAEBt25dlDjrL3Dhm01ZtHbOinHI7FPWRC
 NjY9lGY8LIRGarkeQeT0N9UpKPuT6yknkFt/VEC+y6CconVEde7GtGNhHiqGUB3pnULeoLQVhdC
 we0S7NOdttAUhdrUsJ6zb46rfLzJwlkPDYswLbMTR9haomo9M1lguYTVzVhg9Y7Ivl1/s9DmmHC
 1seXafWI3oxJIKEHMHsigkKtJazNNjKhzHLxdUwATHoRBrNmG2cUkoXTlm9ihLMeidjbQ1uxjia
 AUiPuWWyz+A/jn2p2pkPf5N4yfFJm6MHpbCmiXfcS3n9fAtzjGHJRjsm6GQ8KfZf8Has2Q5QNk/
 VREsoyIH6oUrENmPUMt66ZY79eeZwbF0xjvHpu2IVaAdf+qCu3GZK7eZBj8gLSYd4ZmNP6RRxq4
 tsK9+93gvSTLVjALqSQ==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697cb530 cx=c_pps
 a=UidE1AiM3qFEYM2TBOftzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=gh7gwmtKEEy4JrJeUUUA:9
 a=ucLIaGDZBtE4KA0F:21 a=ocp33sKsEv4A:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: C7hgNzDSU_dn5Y4hMJGJT-hccJDzQdqs
X-Proofpoint-ORIG-GUID: C7hgNzDSU_dn5Y4hMJGJT-hccJDzQdqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300111
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 13:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230197

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
Rust changes: https://github.com/rust-lang/rust/releases/tag/1.93.0
Cargo changes: https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-22

* rust-oe-selftest.patch updated for 1.93:
  Renamed UI test directive from add-core-stubs to add-minicore as in
  https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07fdaa57983b

* OE-selftests:
  - Exclude src/tools/remote-test-client from test suite.
    This unit test modifies the TEST_DEVICE_ADDR environment variable,
    which breaks the OE test harness that uses the same variable for
    QEMU remote testing. Filed a bug with upstream:
    https://github.com/rust-lang/rust/issues/151823

  - Enable +v8a feature for cortexa57.
    Rust 1.93.0 added a regression test (PR #149549) to verify that the
    ARMv8-A system register ttbr0_el2 is recognized in inline assembly.
    This addresses issue #97724 where LLVM wasn't recognizing ttbr0_el2
    as a valid register. Upstream Rust enables +v8a by default for all
    AArch64 targets (PR #105026), but Yocto's custom target specification
    doesn't inherit this. Adding +v8a ensures LLVM recognizes ARMv8-A
    system registers, fixing the test failure.

    Related upstream links:
    - PR #149549: https://github.com/rust-lang/rust/pull/149549
    - Issue #97724: https://github.com/rust-lang/rust/issues/97724
    - PR #105026: https://github.com/rust-lang/rust/pull/105026

Test results:

rust v1.93.0
+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  | 21,689 |   646   |
| qemux86     | 21,439 |   896   |
| qemuarm64   | 21,495 |   840   |
| qemuarm     | 21,421 |   914   |
| qemuriscv64 | 21,466 |   869   |
+-------------+--------+---------+

Test results difference (1.93.0 - 1.92.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +205  |   +33   |
| qemux86     |  +205  |   +33   |
| qemuarm64   |  +206  |   +32   |
| qemuarm     |  +205  |   +33   |
| qemuriscv64 |  +205  |   +33   |
+-------------+--------+---------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../classes-recipe/rust-target-config.bbclass |  2 +
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |  1 +
 .../rust/{cargo_1.92.0.bb => cargo_1.93.0.bb} |  0
 .../rust/files/rust-oe-selftest.patch         |  2 +-
 ...ibstd-rs_1.92.0.bb => libstd-rs_1.93.0.bb} |  0
 ....92.0.bb => rust-cross-canadian_1.93.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.92.0.bb => rust_1.93.0.bb}   |  0
 10 files changed, 45 insertions(+), 42 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.92.0.bb => cargo_1.93.0.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.92.0.bb => libstd-rs_1.93.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.92.0.bb => rust-cross-canadian_1.93.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.92.0.bb => rust_1.93.0.bb} (100%)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index a0a590bf62..2e83cf5aa7 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -77,6 +77,8 @@ def llvm_features_from_tune(d):
         f.append("+a15")
     if 'cortexa17' in feat:
         f.append("+a17")
+    if 'cortexa57' in feat:
+        f.append("+v8a")
     if 'rv' in feat:
         if 'm' in feat:
             f.append("+m")
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c6e00dea5e..0c82a81de6 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.42%"
-RUSTVERSION ?= "1.92.0%"
+RUSTVERSION ?= "1.93.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 3a41391101..3ae1946e43 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -70,6 +70,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/coverage-dump',
                             'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/remote-test-client',
                             'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
diff --git a/meta/recipes-devtools/rust/cargo_1.92.0.bb b/meta/recipes-devtools/rust/cargo_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.92.0.bb
rename to meta/recipes-devtools/rust/cargo_1.93.0.bb
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index d1fba81612..dc4ed9d94e 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -207,7 +207,7 @@ index 551485469d3..575db924968 100644
 --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 +++ b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 @@ -1,6 +1,7 @@
- //@ add-core-stubs
+ //@ add-minicore
  //@ build-pass
  //@ compile-flags: -Clink-dead-code=true
 +//@ ignore-riscv64
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.93.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 4314734df4..7a0049c45d 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = "1.91.0"
+SNAPSHOT_VERSION = "1.92.0"
 
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f3ea3c964b7f3b884337f2d411764032bbd1722d7f55592a547cbb29afd87c03"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "ff23dc81f796d64e34e866a44fd0bcae726e34014835369b8f9393a544167eca"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "003d7008219ca0d225ad1dfa301f7c079b123499430ee0780c85782e0878eeff"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] = "a5f8bd961fb30962144d2f68be0bdd1014cf07110323087b0d6a68251a7a4eca"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "7c8706fad4c038b5eacab0092e15db54d2b365d5f3323ca046fe987f814e7826"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "ce2ab42c09d633b0a8b4b65a297c700ae0fad47aae890f75894782f95be7e36d"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "cb2ce6be6411b986e25c71ad8a813f9dfbe3461738136fd684e3644f8dd75df4"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] = "333ab38c673b589468b8293b525e5704fb52515d9d516ee28d3d34dd5a63d3c3"
 
-SRC_URI[rustc-snapshot-i686.sha256sum] = "bf718b184d6ace8fab0012835d129130a6dd6a8d78f4f742ae9308a86b96dfc5"
-SRC_URI[rust-std-snapshot-i686.sha256sum] = "059fe4b9802c3cb64b539cc501ff5e64f8d750573009c3004fd0b583b3f50d39"
-SRC_URI[cargo-snapshot-i686.sha256sum] = "92486e31c070667681328ad57dd3bd4ca1e3d37958540d622b2afda9b67fbe3d"
-SRC_URI[clippy-snapshot-i686.sha256sum] = "14cae2980accb8536ae700bb7ec6a3b540a06d84e7a4c71db1c7f05a17b1edbd"
+SRC_URI[rustc-snapshot-i686.sha256sum] = "c1c920cd59e255e5dcf844af22b80483fe4b04ff04f143be6da69314bd6733f8"
+SRC_URI[rust-std-snapshot-i686.sha256sum] = "abc840631a4462a4c8ec61341110ff653ab2ef86ef3b10f84489d00cc8a9310d"
+SRC_URI[cargo-snapshot-i686.sha256sum] = "63001bbde1c036fae9ad624807bfb18117c7e7cb4a04de81adc4acc7e8580c07"
+SRC_URI[clippy-snapshot-i686.sha256sum] = "f21090ddb01503ab7e326ff8b1ab44121611121e83572aa2dba2c5ceffe12d22"
 
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "04bdbb954f48fcd0b125fbddbf3e59841ec81c58ff858471f7977c8343d9a73c"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "cb0c3c2704add4d1271713ff87e1b7a8a4f756b4dc9f580b62953532efd0f7b9"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "9437727091d30d73a987e2c56463a2de4f01fb69cfd229617e2f8a7d8de5c05a"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "060a0eb3ee236e8a3bfb2cad9495165d755ea60d32e62ce85f12ad17c26afedf"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "6207ea209b332c01437fe742c2ef2bc914c88b6d4f9a23a43bc01ad924f6e4a8"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "62e2568ebf6f1addc750a8c32dd1fa4fef8d27679cbac33b837afeb54f204819"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "32f4b393f1471d7d50c9a50512f02116187b3ea6a885c26ff2d74f87fa72baa8"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "70783e0b31682938db53b78f87c948acfe589e3ece5dee6ae6aa5b667a384f3c"
 
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = "c625de10cbfd21031f71fa6fdd50ccaffd449744614ef1f57ee3cefe80c57792"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "d5ecd84b78eefaf30fb65ec169af1806bd06d0b5bbe166bf010b058c9c59d27f"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = "1f8f0ac1b05acb7cc50592ca39ec78e374093a0701405e8ea1894bb64a7422cd"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] = "425e5a1a72cc20c476416682cb5df4222c0b9c28fbb9818d4d8f505ccea578e3"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = "961cb6b8c2b5e969ad8eb0256fee43b88608b27310d946a7df3c9e9577139cae"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "c3e809a324b00eb53096c58df38645bb496c6560de334dfe04ed0b77c0605aaa"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = "1249c64f95d8187b3a89cf8429329bdbc98f53a9fc538e898c95c487e3234d90"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] = "93ed9fdd6fc2655c7789ed096d57a47178532b6bda1ec4480adca7920563e934"
 
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "139a077f72197ce73031dae7cd2156fb6718b09fe9a3f4008266d34fb8d09ae6"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "ac046a72a957bf9fd1213e95d46d7ca431a6704f63e99c759ccdd9ae7c07f7d9"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "abc14cced999e0d5f0ec75f10af33998dcaef39fab27b8e2c63b93ca0b79f2ab"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "b8129667c5b30963698466b7edeef4c5a1c869e78b5f9218fcf1426defa5cea9"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "357dd4745f978080d35dbb6192ecfea331abbb93d88be7d70407856b30722a40"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "2ce706afa4a46b6773340854de877fc63618a40e351298a4e3da8eb482619863"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "e94a8f97c3143158e285b4f8ade1fae844961caca30c0eeed44f6c14da484f05"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "7912584254f455b90ed6ce6089c4efded33bb753d1bf948286ef2f4f782d2f30"
 
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "c526302dcf4f1627525b0eef3ef4181bea801f119c4a0963c3675b390cba164f"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "c79c071fd14ef094c1a2e750f19795e7e162f4237bf92299885c0d56fa6017fe"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "704bfa80ffeeafacb8f13043873e20e1b9c4a5e785ee6c5e7d0e5828fc1f0c8b"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "1571b18b39f97d808b9f10ed2697b9d87bc3959abf858bfcd3baf9eaf8d5d548"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f48a214ff6fa36a77de8a0a2ee009be8aa48ba1533792450aca5edac29497606"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "eba59766c2d9805c0a1fc82fd723acbb36569e1bec1088c037bba84d965f70ba"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "49dd01f5d10e3f368181223db0fbf7dc191161f7d80a295de4909bf87e53da58"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "873047278043e6506f5c98b8f633a9b96dc49ff83869a86a151fe5b1b9455044"
 
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "7c3d4ceaa630ddb45bcd538c687637a349b2c3e18634a2b944178a7b4b42a4cc"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "7486237c83844d48ac96b67241ef0c1f4f702ceb74c44721f6f8660c3068dede"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "8946ea952e5a516e8bb6fd859d9798902877e01bd4508b717f8b9fd915019ad5"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "97feb6d6b2158b410a83c40d7eeba1e97220e505eae6666aa09d112665cc8dc1"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "729f4c074ccda30bff493fa94f255bcfcec1be594fecd8a4d0f57da845121c64"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "8ee20dcf3b1063fa6069b3ce85e1fcf42794dfa783263314865cb53fff42d9e4"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "e8708d0a929ad15941ecde368e8a156911927a805b492afafc737124b6aa55d4"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "bdedabeedd48080e6ef70376c52338fbb45ff80d1fbb12a81aa2d8cabbb706c8"
 
-SRC_URI[rustc-snapshot-s390x.sha256sum] = "073c3817f91ff425ffa141a6db215d54b50db5a8abe08fed593b7597687bdf94"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = "454ecc9a53dda63762f3d1d92b7e4f4459c58c89d39a4178cce1fd9fd0ce09b5"
-SRC_URI[cargo-snapshot-s390x.sha256sum] = "3af10597a739402d6ecb3db85abaf62e12f7b298d2df6377c3c80e09a54f91b6"
-SRC_URI[clippy-snapshot-s390x.sha256sum] = "8d3bb8aa79abcfe5c24a37651d09dd356f994663699e65e7dd9978514a5ebf31"
+SRC_URI[rustc-snapshot-s390x.sha256sum] = "6a8cf614a74f7469c70d32b378f0163633e6bbe19624b248b758501c5bcdfe84"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = "ebf944dc95015498d322504a54e4f9cdb28590f7790aa3a9eb86d6cf4b6c93ff"
+SRC_URI[cargo-snapshot-s390x.sha256sum] = "a290edf359a5632dfda3b2325a309d9edeb58c97de97e3cc67274335b58adf05"
+SRC_URI[clippy-snapshot-s390x.sha256sum] = "41aa44f1cf37cac87b83e450eb19148c539ff266bb40dc146207ad5b9e1e1acc"
 
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "a7169e8cb6174af2f45717703370363d8de82ce55f6ccba185893045b9370874"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "89e6520b16c12b43526440298d2da0dcb70747c5cc2d0b8e47d39b5da9aeef49"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "7103c03fb8abe85b23307005a9dfe4f01c826a89945d84b96fa2d03fd4d2d138"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] = "0087c3d58d2fdeafa89830c299b1026c9f981b49835db89c922b3c6a299b3225"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "78b2dd9c6b1fcd2621fa81c611cf5e2d6950690775038b585c64f364422886e0"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "5f106805ed86ebf8df287039e53a45cf974391ef4d088c2760776b05b8e48b5d"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "e5e12be2c7126a7036c8adf573078a28b92611f5767cc9bd0a6f7c83081df103"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] = "2c1bf6e7da8ec50feba03fe188fc9a744ba59e2c6ece7970c13e201d08defa9a"
 
-SRC_URI[rust-std-snapshot-i586.sha256sum] = "47e91cba208b1f87348e7b6a49274ebb4364651a4191fa67e6850e7813e26ad5"
+SRC_URI[rust-std-snapshot-i586.sha256sum] = "8b984b31ffca1f27d32ee77ec2cc4c2ab59e72beab67bfce13bbd926dbea8715"
 
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "4f7bffb09cf5a0c25dda9b51811c60996eb1ae06a277c1e836980c21b3a44766"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "d85afb14120c3c7367338a565a920db653dccd4bc5062398791d7b62b89fd1fd"
 
 SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d7d44510e4..514f3fec1e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,7 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307"
+SRC_URI[rust.sha256sum] = "e30d898272c587a22f77679f03c5e8192b5645c7c9ccc3407ad1106761507cea"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.92.0.bb
rename to meta/recipes-devtools/rust/rust_1.93.0.bb
-- 
2.49.0


