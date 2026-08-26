Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4145FC61DD3
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23522.1787780771923475131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K5N34yv7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKf56N410006
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ctvhC2kQctl4oGToxAV9mAJktbO4y4yZhcC5Qox2hGc=; b=
	K5N34yv7qefpqE5YzI6rS+QxKR1a8Rj2SVrOO0oPhtTfzS7fZDWI4h3EHbuA/w7O
	QLXLh+DOlnoiEQiuv7tHeGGdMC3eEjHSdJH2y5VXWAKz5J42TIbUhm+d6vsg1JFY
	IUhspdfm5P4J/UcR4XqInfTYgrdHf/0eNrd7/ZeSr0OHYixdH4yeAdRTRVrwSmMU
	b26z/y57pA0L7uLM9qo2lPG9I5w9K5g7OfcKycSBrLpa03MnySiExPjYshlFRuMi
	5Waa8f0r11VVO6MpZ6+McgWBbrkOo4Z2LoBo6fAAPSnMs/1F+fBbjIWaCi2SQwdC
	zzxjRl8M8lCASR3BTYE68A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4wWfB2r0zeyZ1q2/MW1rw7nya7ndTbq44B6ay9OZjdXKKW7mEpzNdba8s5+NG2WJoi6/ZAhpV1XFgZVZY1L0lnKdPQuIHjhAy34XDcX9SYSCpED1hp+ixYBlwlqGbWtXwkiho4q1gLLBJuzjd48RjRAHWZgKjTlJNz29PFGWI8GeRHOo4HQWkHKmfytqMAHIqcDtONjkZSXE+Km82oKMQcPN4GIxKLRIrCCeVHyo3YLojB56ANtPb2m0JVw5JvewJdNeH8pOhaEyTrIAeiPcDm2dV5z7wzOebd4ZSf0orMb3Y3rAIEWC6GmEm6NC6hJhwyfSTDPBFRJxQJWoufKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctvhC2kQctl4oGToxAV9mAJktbO4y4yZhcC5Qox2hGc=;
 b=ccCIHAihwYYlP64vbmpef2Ph2RCzqoWJy2odYToUAfGm5huGFZOh5u4vEedNkaHwckkS7ip4FFMfssVJXn7ryZfMccwBm8EDIBh2+1SJMWPOXho/zpHb9t5QA1l9W4g4QZA4etriRlnYCkrtYYIBvMZZlBAb4V3beqej+Uidr9mQPuhrpCvqTu3Bl4Uumqqc9+86yZn7i+viNAXiQf0UZyze/lxYINYKOL4tWAD+vuvdlLPpVcA1VI7tHLc5+LzxZDm/+spNbhlmxABXFRbNNIcUOAl3EXCcX1taMhDFR/nP0aZrEUTjQ9Jsqg50A+wiv4Gr6W88StLroeWbz03sqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:08 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:07 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 11/16] libarchive: Disable RPM filter auto-bidding and update huge_rpm test
Date: Wed, 26 Aug 2026 14:45:43 -0700
Message-ID: <20260826214548.3002838-12-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: da411735-31a0-4388-b2a3-08df03bb6fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	Wtc9ozg8fRLsKqQmeigkATZkxZS2ZzTof7WUlXFHe4WKsKY0wBCt8CC28+kCK5MuuryhhSKnAkx5BeNncg+3YfMSyfjd00n2HE/sHPLd+RH8qPgQ6MlZk139/zg6F6GJLLxyKsLQP3i1/h0TKdPIpfiJZecaMBJU0BfjFU222sVqOIgohgBmoKZQ3eDmeiBeZTzDT5M9e6Ez1WSqezqzdlvbJQW3rGk0G397fyqhCqXKIsbavvv8mGeZ3HfD7u1EbX3uwtusdnOForYDCdqHdoUF7jAyWbY27UVCzNSmAcpNweaYR2kfqOfwVNyEFrxXH2yCzWxjnqcraEFMzoyKRMwXf3zyv2Go2FqjkznIEiOEse8om5nK7DSFkWJ2wgMLXjZX6MmYaLbt/CKJH9ZNSJ7oaF3NPjC+6Kpp5KePV/1ACdJEw/fqKzbJ6X09gPuS6WgQ6tWdl/8A5n+ai3HvLGvRy6dons0DLyd+gnC8ZF3vZJ68azY1FHhBImfc52bqNLUsnAsTQOewqgfjINa/xa9PaJUQYwG/rg2X8iuJVppuxjHDKq5zTx4xYASaqJYdtusA8Ggwo0nhSEuwVR5gx6uAfl79dolTZ/vtLu0SdpIidiP6D8B0m5L1LCxJT/QhGtxkOxv7AofEcLWsga7sBJFn5x6HhhddRC/gZuiE8b8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J+2IkxfRibCHQ3lf/i9x06ZcXX6rZAeXFvZC9IPk6Vw3vQ+K7OZWWAdES/Qb?=
 =?us-ascii?Q?I8YgJ2HziBUT0/8HNXUF3YZ0AlQeYUbQ4iR/hAw2BPESD8bI4h64WEhzJhsR?=
 =?us-ascii?Q?/3HGLNzOrapihQ5vcmbRUKqMZWPfO+L9IUH6O5idWjAjTzShLs35hbDb+Zor?=
 =?us-ascii?Q?MR2QpvitewkOwC/fzz4k18yRYyE4RJIvhPwiMydeLjYk/sPWLcvkLi04xlIl?=
 =?us-ascii?Q?MVq3PnAv2L7vGdFnnaoVBufIhimQW/N4sO3XpuVkyDp7T34GuQh5gXqEjQIn?=
 =?us-ascii?Q?R226n7pcY05VGTM9e6b0m4QWmatu29Mf0rN2RSZKuPdEpWjZFFKQkIkdNXuj?=
 =?us-ascii?Q?GXHGqMTNefDT6c848r92kZY64ycidfpR8a5PA4tp4QichN7o02OrkuoQ+bKM?=
 =?us-ascii?Q?8E86GevsuxsXmSYg7SiQMjnqOCTlCGLoz+823d5O3lugN/4X2z9JVzPb7b8z?=
 =?us-ascii?Q?miNMBxf+iKBAgzmX6tTHF6VthiLoHJEmSyZBLjbSH96S2xqAwQjIZVK/hMR6?=
 =?us-ascii?Q?/7fPf9twOThI33Q5yprhXtHtnAlpvlCTK0dGP8EhNjTjHrg03yQ3yrdLfgpW?=
 =?us-ascii?Q?sfnhvm/DNxFWlJ+FoevORkj9SGl0WlYROVY2sMhOwyuHqJVSdF6/58lDmoDM?=
 =?us-ascii?Q?VMuhfBOnq42efbJkqrBZpB4QIKYuh8Tev/IzPQROOFuRECKOnIuEsOI+m0Tz?=
 =?us-ascii?Q?8nRqVFiDq7B0t9IV2QqyM8idnEYcBSPaJ2rfM8IzL0cM1SGFF+2tDafksIjl?=
 =?us-ascii?Q?yI40PTAJvV14z/Nk8CTDnmVVi9vW1Zz2cMMr8nEGS3z6SqkflXsEnzCstR6m?=
 =?us-ascii?Q?At8zTZSs5tCmKTtLk5tYx0NpRUgTqA9j2SWcvww/QXsjOrsWUhtt+8KrUHpn?=
 =?us-ascii?Q?yfLrc6t1yg8r9X4tCnlCYjId5YqxeSuS9pvarZaE5NAutEPkrSXOegF0/SxY?=
 =?us-ascii?Q?YK59XRuX/8K24Qz3oZpZxkp3hbq8LTFPCTgAKTINXvD1gukRcsRooTgHwFK8?=
 =?us-ascii?Q?3KeJWioIFkaLHzDPW+QOLB0bqSZT3r5MExg0AT9huuw6Lj3MQUo9lrjBJbFL?=
 =?us-ascii?Q?fbryqgUIF1NJdIpYojr6j9jmXUam9pNjg5tILrl0buo64KOxXutCuKrJOfg4?=
 =?us-ascii?Q?jGFSxtthEPbyV4GG9lcGnhme96cKN2l0uXPNichs6SqRsWLxe9HF3eS2w53h?=
 =?us-ascii?Q?tc1cYfkVkvDSNEnFmY+Zur3Za2y469+xxh9ILOPi3R6e3JvcZDLGFLqut/e5?=
 =?us-ascii?Q?XWRmcu5gq7Je+UdAw/xTGqwgjuT0GLhlY9nDsjyy5yEy6rc2hYFVa3Mu6+gD?=
 =?us-ascii?Q?1T71Ck4uNI521VXpEpKwaMANH0Em6NgWGktXp6aEsM/Tfk5zNzCDdLrCWhtT?=
 =?us-ascii?Q?9jWxvXt2DqoyvM0PFQlHz6Z4sFG0hgF07fXVxg169fChardD+sKAHpdgXlTl?=
 =?us-ascii?Q?IGlyxfqKQmNsReraL1bTQjKmCjbeL14oVoOVH4fomTp/IU8MjfzFLfoHUAYs?=
 =?us-ascii?Q?gtkU6aApY2CpE/28AZOj9QmNPm+0oESnPbXwj9iBJF8qsgWeb7A5JKeJnMfE?=
 =?us-ascii?Q?cLuCvh20jDKjTqnYywdMUUt4oa8VYxBaVFklGd0Qg0crH2xJQtfG6AnlhaJN?=
 =?us-ascii?Q?SsUbB15wIethP9+YtoXjyFRDt+eCN9beiNr4sYh5RvOZ0uccHPdYn9m4T/h5?=
 =?us-ascii?Q?YE03yjZ/uy1cP5iWau8KL1IYRNaiBekGkY3JZGCUnSuFUXIu1bGrNe235PFn?=
 =?us-ascii?Q?QuLRjmvQtSZ7ILkvnyVvq82/Yn7NjkE=3D?=
X-Exchange-RoutingPolicyChecked: 
	fCm1GkSRB3KdZXb82oszBlDYU0MyNHP6jz4YbSjFC3g/nXShtqcu9/N9LLV+kTcgVANc30E6z9ezsTdJFHQRRRIViWw5jpUlZNmYOB/O4SXl+4rbOB1SIiKbMf07b5r2t4TFr0vJDi4XdlNhSmj4xBqrnwcKEp1W+G5AgOlXTABZs2NSqPSE1jJJtAywnpkzuGlZ1WjmAca+aFF1X1Rt8dHn0CS9/xsxrbgI+FE7GN2a4GOd0hRRMRlspsroxRscO/2qCODlm9xkts51HXz3J3XQw7gSeylqrfULtd0WhzQruQ3xIUcgpCZ6Fmhp179oxnkn0S61n8fvtueICmPwMA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da411735-31a0-4388-b2a3-08df03bb6fb7
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:07.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtMWyjUTQPbY41FFbt8viWhEyIkm36T5qd1ty69vgXpQWIuHfqbbmv21DJznIVL6tyFikxni03L39LL02bRnl6DEVePiF4jZDpw2dzGNf3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea2 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=lZjF4Bz7cVrG58_DQlMA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cKJ2NhXUDhwc8N3W09cYbZVF5lJNWF31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX2N7ESLg3jWm1
 jBxvSzkdUdvF4UyitzVMbSUlt8nkVxUspfydMSq55DbSz64Aw+cmA/9MLUiYtghiQEdmrQiA8xe
 YTmlNky/V3LahLnkyJQ82PHs1LIiRfio47bTC9saRdYUI6PTf1RnZGf1xRUmlXBQfHZ4JhBLBDD
 3JBWWJ4NqkQ6uSAsuV267/Gr89tDZVXp9kvutiMUMRqghHzFcGj0K6WTI8102Wnd9PGGnUI07Xt
 RmahPlgKUOi0EsSc5Fgmvrk+WAgXY4krPBEvVSFP5C+b8yXxCvq3twOvp6rDVAA1W/7ZHMbzVXX
 d04uA1eDnBQKgz4dNtlcQ9WudKbbJr9G2f/5ZOz03d4QrJEJ9C3rVzJQ7enahE96MVwSS2lbeCu
 Ch43gi+4o78VeGHQDGrGjrifyoq7DavVnizTXpwPLgOeN31YrOrKp016UgOHG4kkl6l9C/UTTjz
 tNJYZBSelBJG5hzBfVQ==
X-Proofpoint-GUID: 0DUhKeTW_YuVTQRDzNvxy-c2PHuOs09K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfXwXKO+xbrIHIj
 3sK6cNyAce5FzWIVyf7y0MJjfQolMdrR1bNn/X8iWeczrusj3uznrX/puFYHFw8n9ATkBdwJ7fs
 vnXH9A49gsBSf8dwT5TMqufHII/1fqi6Age3WWT7yppmDc3GfiEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244427

 * Add 0005-Disable-RPM-filter-auto-bidding.patch:
   - RPM is now handled by the format reader. Disable the filter's automatic
     bidding (return 0) so it never intercepts RPM files during normal
     archive opening. The filter remains functional when explicitly requested
     via archive_read_append_filter(ARCHIVE_FILTER_RPM).

     This ensures debuginfod and other tools that use
     archive_read_support_format_all() will use the new RPM format reader
     for RPM 6 packages, while maintaining API compatibility.

 * Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
   - Include the test_read_format_huge_rpm.c changes from upstream PR #2846.
     With the filter no longer auto-bidding, the format reader handles the
     truncated test RPM: opens successfully (ARCHIVE_OK), returns ARCHIVE_EOF
     on next_header, and identifies the format as ARCHIVE_FORMAT_RPM.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
 ...0005-Disable-RPM-filter-auto-bidding.patch | 73 +++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |  1 +
 3 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 29d12bb539..03a207f33f 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -11,6 +11,14 @@ Without this patch, debuginfod cannot scan RPM 6 packages:
   libarchive error: cannot open archive from pipe: Unrecognized
   archive format
 
+The test_read_format_huge_rpm test is updated from upstream PR #2846
+to match the format reader behavior: the format reader opens the
+truncated RPM successfully (ARCHIVE_OK), returns ARCHIVE_EOF on
+next_header (no valid entries in the crafted file), and correctly
+identifies the format as ARCHIVE_FORMAT_RPM. This test requires the
+companion 0005 patch (which disables the filter's auto-bidding) so
+that the format reader handles the file instead of the filter.
+
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
 
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
@@ -29,7 +37,8 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  libarchive/test/test_archive_read_support.c   |    2 +-
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
- 14 files changed, 1162 insertions(+), 15 deletions(-)
+ libarchive/test/test_read_format_huge_rpm.c   |   13 +-
+ 15 files changed, 1169 insertions(+), 20 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
@@ -1398,3 +1407,34 @@ index 6062c48..11dbbb4 100644
   
  	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
  	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+diff --git a/libarchive/test/test_read_format_huge_rpm.c b/libarchive/test/test_read_format_huge_rpm.c
+index 51208c7..10c7fb7 100644
+--- a/libarchive/test/test_read_format_huge_rpm.c
++++ b/libarchive/test/test_read_format_huge_rpm.c
+@@ -26,6 +26,7 @@
+ 
+ DEFINE_TEST(test_read_format_huge_rpm)
+ {
++	struct archive_entry *ae;
+ 	struct archive *a;
+ 	const char *name = "test_read_format_huge_rpm.rpm";
+ 
+@@ -33,11 +34,13 @@ DEFINE_TEST(test_read_format_huge_rpm)
+         assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+-	/* This archive is truncated -- if it has data, the bid has screwed up */
+-	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_open_filename(a, name, 2));
+-	assertEqualStringA(a, "Truncated input file "
+-	    "(needed 34359738384 bytes, only 10256 available)",
+-	    archive_error_string(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
++
++	/* This archive should have no entries -- if it has entries, the bid has screwed up */
++	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++	/* Verify that the format detection worked. */
++	assertEqualInt(ARCHIVE_FORMAT_RPM, archive_format(a));
+ 
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
new file mode 100644
index 0000000000..26a0159908
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -0,0 +1,73 @@
+From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 11 Aug 2026 12:02:31 -0700
+Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
+
+RPM is now handled by the format reader (archive_read_support_format_rpm).
+Disable the filter's automatic bidding so it never intercepts RPM files
+during normal archive opening. The filter remains functional when
+explicitly requested via archive_read_append_filter(ARCHIVE_FILTER_RPM).
+
+This ensures debuginfod and other tools that use archive_read_support_format_all()
+will use the new RPM format reader for RPM 6 packages, while maintaining
+API compatibility for code that explicitly appends the RPM filter.
+
+Upstream-Status: Inappropriate [OE specific - keep filter for API compat while format reader handles RPM 6]
+
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read_support_filter_rpm.c | 37 ++++----------------
+ 1 file changed, 6 insertions(+), 31 deletions(-)
+
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf..8e90da3 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -79,39 +79,14 @@ static int
+ rpm_bidder_bid(struct archive_read_filter_bidder *b,
+     struct archive_read_filter *f)
+ {
+-	const unsigned char *p;
+-	int bits_checked;
+-
+ 	(void)b; /* UNUSED */
++	(void)f; /* UNUSED */
+ 
+-	p = __archive_read_filter_ahead(f, 8, NULL);
+-	if (p == NULL)
+-		return (0);
+-
+-	bits_checked = 0;
+-	/*
+-	 * Verify Header Magic Bytes : 0XED 0XAB 0XEE 0XDB
+-	 */
+-	if (memcmp(p, "\xED\xAB\xEE\xDB", 4) != 0)
+-		return (0);
+-	bits_checked += 32;
+-	/*
+-	 * Check major version.
+-	 */
+-	if (p[4] != 3 && p[4] != 4)
+-		return (0);
+-	bits_checked += 8;
+-	/*
+-	 * Check package type; binary or source.
+-	 */
+-	if (p[6] != 0)
+-		return (0);
+-	bits_checked += 8;
+-	if (p[7] != 0 && p[7] != 1)
+-		return (0);
+-	bits_checked += 8;
+-
+-	return (bits_checked);
++	/* RPM is now handled by the format reader
++	 * (archive_read_support_format_rpm). Return 0 so the filter never
++	 * wins automatic bidding. The filter still works when explicitly
++	 * appended via archive_read_append_filter(ARCHIVE_FILTER_RPM). */
++	return (0);
+ }
+ 
+ static const struct archive_read_filter_vtable
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 3b3824e778..2eefa28532 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
            file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
+           file://0005-Disable-RPM-filter-auto-bidding.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

