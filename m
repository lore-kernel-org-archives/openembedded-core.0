Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D26FC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.170138.1783414579685281383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JeO4kfM7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1648a4fd34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678InBF1012280
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 08:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=atHj/gZgGpVrpDZW0MmZ62t6Yz7Wbs4bLKYyzYmg/Ts=; b=
	JeO4kfM7rNS9eqW6xXPAJPozLnpUe7W6zthZ1Ge0dazEnsEF9A3j0NQMy8hUGBes
	Pp0lkWP8sgGKm4XBhfPLKk0x8iTMg21+GMxnixt5YpCz2yyYJoilcwZsUUz32Zdl
	oIJCWDkiXzqfuV1FxUJzb+MR8//8meZxVG+pWTAbsvZwYjpmIc7URxCzGw+O4Xra
	DCiVk9GpdN3649jpzRIqYfcW73QrxvvDIB2aHHJ4Zg1XBGh4BSd1NTgYKslSwBUH
	qMvx+peZEt6Jt9hXnvDPvfL8WzVr9CVAjnuGhDGn19KlmmUzQPNAUgbcd7usiFWL
	FlBL4LwVlEUTIyCA7nNC6g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013016.outbound.protection.outlook.com [40.107.201.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58bvse-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:56:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZuaUaT2+oLsHRSJsCy+9Jj0/Am7mW3m6AL9P4cc6YuZPfYa0hT+xMc9VQDj5V8kk1CPzgBl/02a/DRWx0FAuwUq7GxoOgYhhcRMB2SIZTBy5Ktm9dWPPoxRTFgGno7SzUIf4nCsdJqDoc/BrtyV61Mrlw2Gdd/xIw2xcgbtOmglKtu6Oxq2sYEzcmsL7Nxp0xBcx1i95LAoW/teEUkWOB/pWpSvM/zw/r1USRXqIPzUHWVf6JtqzqTQu2E6jTFQ42l9FkRGoQLKlL0SIYH7/e7KwKkB1kSVWjbjnVHg5d8spKNdJxLELzd8468u445cSkCwf1s65xsGmAgr/TXJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atHj/gZgGpVrpDZW0MmZ62t6Yz7Wbs4bLKYyzYmg/Ts=;
 b=PoQt/IbLSQTtDbbFKJP/6GD0kLLcn7FVyABQ8ecUtnVb1B6faNTe3BXa1wMwwSL4QBk0PhKX9lslK5+KgiCVtkcj+OvEnBJ8rmXvbPX5pbLyolBIeLcUaLEjYUbxpImrimbIC5arXWFWlwXb9V7oEn2nbpomEMyyFECgqSWOWTHcn6af1sSW2Fk7GtquCUPozvmIGABzxMTFaRsSLsisQ8lrIKXhJDt2oglZioYd1F2Yy7vkJgoofDp8+NIxO5NKpGbZXUWF2o5akOrj219fHZrqUdOzBadG8qn+TRYj0NqHkaSdAc0PpQV8k+TpO5oMl1lXhoYGzqzLeR0ssnFXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 08:56:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 08:56:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v2 2/4] kernel-yocto-rust: use clang toolchain for riscv64 when Rust is enabled
Date: Tue,  7 Jul 2026 01:55:49 -0700
Message-ID: <20260707085552.981820-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
References: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFF6F855567:EE_
X-MS-Office365-Filtering-Correlation-Id: 0baba92f-fad0-4e35-cb22-08dedc059a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	vmhn8Ig5OgZoSdBLF512b/hZoW2toRDe9hsE7pVbpzly/xbTV3Uq/PjDIBBBWWMML2689n4bTIo2T8yRGpKAYxRSlt/MlqUd5L2Ak1DqovrAcKInuHPm9Ua00b+HOXL0P4cEhGK5+01XFGU07qoW11UJObXnkUXv5XVuc2SltGFmLopIQPZQ9nX79+92LoMnNFew06lUs7OYvtgYZ9dKRCVYXjd2pkuew2rbN07wszrre57kr17ciobvYV+MwJfRBZx6l2EHIyKSv85HSpI2HMDrJObQfhOCc+ZVgFhcUQZFmD0yfKxCIKkZyqvQfyk0howeBfSTAkLDITNE0vmsxdBguNC+cMePH6Qsp63ZqA0c5FrIVWPkTnZOIcd1fej/mO2h8vCcKSEBhRx3eK076W6hxQuMEftrLxr31gcjP5tA2Z65JPkuDeTEnrjZYA/1DwMigRW1fuOTOkKgTQIw3P59Iaxzj0Z5TV0LZbxJO6oR1aJ9Qh39PE2Cbl3FuKY+CeTWGKL3wzdjo0XCaVxhPy8XpNHPb9yeeeJ0rzhEVAYGYI55Zr0LNIusd/TnILTmR30SNVMNRnZgfGFkfedrt6NpsSweLWqtZxvPlJalYAAAexWd45wle9tZF+AfO5+pge6CIMBcZ9IIECt6DKA3rfOJSFNNjzBoDCvq7jPmupsxoLEnnL016iN/OEF45TmGv4QHNX2lprUskrAwG0YQ96c9DwKuaguVnQotyGTIrN4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LnKKCD7JEjvTt6TT60td1ka/EU3djlBj7He1LRIiJ6w1B8kTpKdS87H14kFs?=
 =?us-ascii?Q?M6jdDLoEV6hPT7FHmqFv43cbtJ6GHeDmBdnrVcIj9qUqwP64QYjUB5KIfkFZ?=
 =?us-ascii?Q?g8vZGjdxC8ObDldWKkPqnm5WJJkK7CD8wtE438V6cSLHhfCLF4+YhsFzLz86?=
 =?us-ascii?Q?K2zBHxBOUicle8lBOG5K3+9NSCLAMUdZu6K0gF6KCV0r0Nz9xbJ0QVE/SfIw?=
 =?us-ascii?Q?VZsVzuE2m8Sx8cIAjq9XzDYlq141Jc10dQOpjVM/MR8vjKGfjI1GvVnRSJvo?=
 =?us-ascii?Q?Lmng6K003zVba88dMN1Kpkx5nYzo/YxeVeCZ1qQfuExl2OTts02OCCJGGR3G?=
 =?us-ascii?Q?d/QBpdcwvI//bg4ydFK7vNWGeNtwAHQLyTJ7kM1tYR+wc0rPVCV39/cGRc9R?=
 =?us-ascii?Q?h6Uaz1xxoj16J8BIYyIiJd3G2aCv4jtXjhrn5nKFZhO2O04Yv7EP+Wazem2u?=
 =?us-ascii?Q?p/1wwPG6f1G+cXDS7Pibj1BwfJdDJZFkxzQIrB8xiMANl+RBJtR2CUNJ+c0s?=
 =?us-ascii?Q?HVmHyxW3e/1JIqYd31TIXcWFj599U6vi9rGaYDIvUQR5bRGSLbek4kOmzK13?=
 =?us-ascii?Q?koRCAE0HMbfJMszghy5GCdTYTFg/jQ7xuGBLbXi6V/LzioBAh91fzGzWRziC?=
 =?us-ascii?Q?X293LijZBf+sGbTcYu1tcl3q/Hw2+Dy0H9TbY+ETvEtY8DWhvyxPN6Cb4WIF?=
 =?us-ascii?Q?O9EAuBWlzLFdA8GLdJwFzzGUzQvn0h+O0a2W5qEo7hee0DG1GViGdHDkhrjB?=
 =?us-ascii?Q?3DBMAO6IokL2EIhwI3mkRiJKWtkQhbQV7xDCUZscYml4UBZ12ysIhNkhMRx5?=
 =?us-ascii?Q?vhaCB1dIdlSr4oXa5+LC2tI44gTkxlaheWWRy8lY2+3Qh1dGjHi7Rysi/FzQ?=
 =?us-ascii?Q?m4KKFzaXpeV7D9Veau7S5rV2CtM8g7He7KsU7960JNyUNZriICAK3gs3S84k?=
 =?us-ascii?Q?f0xB0divFTn3c8IKHZY3o8o+bmSsFHndpZljxQM4QZMM54GDvyr1OQpATpoC?=
 =?us-ascii?Q?n8hJQ/GuKHIgHms77wC3j3JOdNJSPS1Vo74lFmsOHfODGNcToYuQN/dIngxC?=
 =?us-ascii?Q?aBaDtUqPFm3pcHEktqdu1cO9urV35knoy2b/QQlkdQ1HugL3StYqC32NJSSw?=
 =?us-ascii?Q?cRQk5UZ/VWAuSWCB1/W2KGDYYg4bKuHxLn11+ikRDtMfvxw4jC/5Px+sKESx?=
 =?us-ascii?Q?3JWq5acsCJPmocG8hnLGGRiRv3FyHK7Y9T+h0JM60NfCkLTlaqhyKhuhPQ6X?=
 =?us-ascii?Q?xQm8k4+pav/qg4d68+/tt0cgavUkCnYuJbwV5JwmrLXUGBaDENhDsc9PM+ba?=
 =?us-ascii?Q?C29QEs/2gMXiKfxnC3CtldpIAkcPowoj1uJZ/HLcQs0R40qF5pZNK94ew1ls?=
 =?us-ascii?Q?woeUAIOdJlyts2Y2N3mSImNs3WLm3OH8fjevl1bfy5G9WxFOVByypwI8ZsMb?=
 =?us-ascii?Q?01LS/XlqEWAe1JVYJIqau9Q3D3nRJCIPZlv7S5zVQQS5I4k7Hb7bT/Zv0m/R?=
 =?us-ascii?Q?0W/Ijbf4nODBJqcKarsCP/sVfFcynDKh+KGK5+6claBlCd1+ThG+Ql5JhjcK?=
 =?us-ascii?Q?C9vJ343S5jdYpOnkW1r6RoObDd02os64CGYr1nzUeoWQ4Rso8jbltLrk5PNr?=
 =?us-ascii?Q?IfsjVD0x66/7ZjzVyBi4z/aTZ8wuau1+4n1juNXtRRsdUTOULREP/j6yDHft?=
 =?us-ascii?Q?P5rerZxMfQQtozu+ziVr4TZmI/hYVPRJo+wMSVxg0nueOkSS70Kv59PJAxsV?=
 =?us-ascii?Q?Enzi5Qw0Z4e9tF3De0WMiv7ncnImVZ0=3D?=
X-Exchange-RoutingPolicyChecked: 
	EgNnRv/+5U+Yba1gImM6GsZrvTa/NFXjkosxhUgNh9DxoRVlX+dJ0/Nl9HJXD7szS4RxlWEaFkTf/3V/rL5jbWVFAe66LXE1NddO0HF1sheKaizL4CfZTapiELDS8JvU2ThCviRarflEcZRLFsbzrux3Tnys6DyqBto427Ks43cQmVyf8v/B9Y2zIqBXtaXym5e6TLFzFxkhhHQwVULecesMNdi9jggbcit6utvaDWarjNs3ppBbGujIwatnvFMVeyXCjts/4zzlISnV+Hah0NMfI0tLlbx9AtVzbaxfIx0ng8Uuy4INCBMCJxwnzINPlEKBZmJ0lSm+XxmqENy3yQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0baba92f-fad0-4e35-cb22-08dedc059a26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:56:15.4619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIyCVx9hU6R+gJMjopcBxHg//95IxGDXKQmfnmtB6OKJ1n4OJJWAYtzts6wQ1kyIesClEwEydHeR4p8gLi4DuJ8QWlNKwX7u5vi+g+s/XJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX/84sjKNXthlX
 seo/KZan2hPmySFeLWjyJeO5YOtEnIFagOFg3kP5d+rcIqhtc9As3pSxntrSzludN/VQBvgGtoZ
 +n0aP/oHyZJLoGdkBuKw1EGpz1hZEOWx9SuDN+guEoZg5GnBcKCZ
X-Proofpoint-ORIG-GUID: BYwYV9T44B_QxB6r_094Y4kgvZQyU00a
X-Proofpoint-GUID: AnmPZwuv33g24YaAuEhr32p4_PAqoF2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX1YFWU7KETJZJ
 4Mew6cv0UA9/NfZuu7DMBjmCBVs34HIyQG2szUvD6W1XVkxYL2DxSGYd2MQEIHS0eOgAlnXA6H3
 jTunfqCaNt3stDbtrIIBHSe/3F8wS/oFr6QMe9QYGEegTJPIVrX30dYx2zM7d1RJBkX8L8tq02f
 IOrJSm3ucBzp1AONNr3wv+Enrk02jhcYjMDZpy1I7N4bRROMhgsr0y7qeuv+vCQKZ+SoGt5LK15
 uol6SdlEADpRSP2cejk3/HM3KASgi90K9MzTgbrf63ZMOu76LrnpuVKDXMhtnaY9WNRQFow2c+U
 g+8UlLYA3xhH5NX0gcarFAq4REATug1mjAzSmoZ/BuIjgdscUpGxBSZ1Bm3yVYglppcORtO/o5t
 SWjP7x3XJGDUmiWcIfC7qk0Pg7NkV0hhx9m3B4I+j5YRuFiqLIruxmIO87+QheKwrbAFgGa9pHO
 MBX7E03zvARSFlBUllA==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4cbf32 cx=c_pps
 a=+8K2uRBjRfMG8L7NFMG7mA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=8GuF4qZaY04rh7fV96kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240371

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
is enabled, as Rust is only supported with LLVM toolchains for this
architecture.

This aligns with upstream kernel Rust architecture requirements as
documented in:
https://docs.kernel.org/rust/arch-support.html

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..5d047b5f01 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -91,3 +91,7 @@ do_devshell:prepend() {
     d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
     d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
 }
+
+# For riscv64, Rust support in kernel only works with LLVM/Clang only.
+# https://docs.kernel.org/rust/arch-support.html
+TOOLCHAIN:riscv64 = "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', 'gcc', d)}"
-- 
2.49.0


