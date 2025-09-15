Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6DECAC598
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 10:28:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29287.1757932108305618545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 03:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hy9sQ+P3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13533b6b07=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F9jmrv576272
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:28:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+v/83jG98gwZLvh0cbOj0fi04Npffl5mfV3luYet2Bc=; b=
	hy9sQ+P32tROP9RkTtIWesoQpcE+2oO8VbyHwOXxmwGTPv2q+sphy2UVJaBdStyV
	IrOStUvfNO9WpwWwntWviaYHhRgHVOLPbEcGwX6lv37i5m09i6kZ+fMg4nQJvk6i
	G+nTpUuM3stPd2TPqQlzkrZCi+2mjHugbK9QHV9O8TmAbQl34qMhFhiwFojPG1qi
	QRKI9wFRbHyNRixy6pU2BHcyhOn0k43o9RSIcZiSYA3jXiqtAHI01jJQRhlVWEUF
	jJOmJhNDChz8S0AmZ7AYQmg6AweS/9qJtTvECqvQ4dpRNsgr6Md7OKlanB8oTFfF
	no5aywOC7P/MKgZFcRcOEQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4953w29qx1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c50u62LMfF8mXSdeJ1Nxm8PvQ+oI1U4ALeWE9snkKarwlz5N8s9iskYhx276dNtRbthX0u5qTPkdYrpuDvm95Z40i3POPMupOncaysM5WjxjQlKASz6VXZ1N8cOt4Q9fvvFKbwCokIVDeM2tNDSgSFgc/If1lh+FVDXDAbXd2c1Wz2TXkXwmjuRTQYptLjS7rarVLDsAfffqExBjJJZKWpCMy738/m7RvZEWaAyIxzg6TOEtIkRch0HYGkZAQDnVmFH2nmygbCrTt4dS/THbdscSpyJxvNP5fJF01xlQWAELS62iicN0Bet5qfDWjPb/uQaItDbXRJig3P6HVM8h0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v/83jG98gwZLvh0cbOj0fi04Npffl5mfV3luYet2Bc=;
 b=jJdJtBA4sWyZlNKu5bWdY79IgpCN/4JvWGbzzxI0qmIQ7hGn57ySpk0g9ItIUmjvn+AlM81W+AmUdVTKyzzSwvuswAAsWjaHQ5snIVPQMoHTaUQS3m19jGNozOxivkBb38A+lDoAseHVwgOszHKCAjabsxvV8HnnzEgHqVTIXMioMX0dYRBeQ9aSEE6gauKj/6aiinVULGL1DVtuDRWwT/tNJHaeyabPp7sJFivWRLkuKByDHcKAieCG4LRsoP7x8tnxTc4mh0ycuR57U74OA74Q10s0w/kxjKlvgxWElfVtacyPxFU9STOxdYiBTs+paqIeoCtU0o8etIbq9PE7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 10:28:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 10:28:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 3/5] rust-cross-canadian: Add target-specific environment setup support
Date: Mon, 15 Sep 2025 03:27:48 -0700
Message-ID: <20250915102750.3298492-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0941f2-651d-48fd-f041-08ddf4429ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D5ttygN8ExpyOy2tuhiEpYceMAWlF6sSSzAUW1IXDaJxt/p8e9nwl/j/zxKe?=
 =?us-ascii?Q?acFZ7WSgilbXSXLy79YUAlzpQtToWDcXxhZi7xSAdGu4Syt321BsZGKoyKJg?=
 =?us-ascii?Q?niYQASENpnglev5C4oj/eh3rk+40jshOZjUoOam3ySwvwPDOo3QiEUItHli5?=
 =?us-ascii?Q?ui9TPYNE+Mdq5q8w03MZ62S/meN2NLLovzJJUfh0CUjxwzvKD7r1zINTTt17?=
 =?us-ascii?Q?634pssWvQFF/y1ADhHwUB8mp7hbKdB2v/KHg2rtRMK0kOyAwbVkAdTnfL2EO?=
 =?us-ascii?Q?qxC5HQJ4GUAoOmdFFL5Aln4R5wwuQxb8I+RvPO1WeSCXOd1H6eWrjU0Os/yw?=
 =?us-ascii?Q?jLlB8Gzx87JXl7L+W2HDt3vk+l3UxH9NWW110TeqN4mu2HGgvPS+KuvP6HxO?=
 =?us-ascii?Q?zQ07jmyVoLq0zpQk3OBtka6plKKEBpkjKTjKiMUR3qgqndjogIIz9kOY6gGr?=
 =?us-ascii?Q?+HVmBnHpkeYshfChEAQQAj0EsTKYD545rigzMHSpV0izM5Gs2CYgvM2rxzLL?=
 =?us-ascii?Q?tcvCHzxNn2aFMKh++im3SJUu2siy1BqHH37bOHcLVd3+goCNkODUvCGa/rGP?=
 =?us-ascii?Q?sOeNdZwQxvORQsNvjiDiCh10TuyHVg1++yKqr2Ojij+/z4B2I5YhWSv7Atqc?=
 =?us-ascii?Q?Dh11Hg3h0JFpi1uw12ImwVTXmDSYAAQ0H3vam/cuJbJIspUayNsJhUE+cWkq?=
 =?us-ascii?Q?HFNkfz+IXdXUfBOkDTlUmOqEMON8t++2WbIehD1Up5eHRvznTmsybPrhCB3x?=
 =?us-ascii?Q?bn0FEMhTTmnuFkOY/I00z02st/R2xGUIJzPsNpxGv9ppjVf4Xvsw+ZL1jv9T?=
 =?us-ascii?Q?Aodm0hdvEW+S3k/6lHvMAHWYlImtfQ/mbauGWtKc1WWBhs/Me3Brk5s7s1Up?=
 =?us-ascii?Q?JSozK3zq1aNWh6DshfcEL924zPnLT871pcGHMLoZ686NCIOMvW/w5cQ8evWy?=
 =?us-ascii?Q?S5AAYIETIVOYgn/GiFchvCMXpGFTwKBCb0bpTTK42gKNhVBfeBFMqwN5ghwT?=
 =?us-ascii?Q?HOAEfmjYn6zuChOFAxlictG1pTaN87JaIRAWq67SRCUcM0xFdvCDctwjU4z/?=
 =?us-ascii?Q?3TIEfC8qLflZsuszSQMgmro8u5ko7TMarGU/5yGA08ExyPz3SuMP2Jk8YwUo?=
 =?us-ascii?Q?byU/0jdsjRAng2yTC0K7ox8zr2THrqa4M4CjDndaXuWFSNIs/B2Uhwyhvhaf?=
 =?us-ascii?Q?ur3OR2wcxcmJojhk8JWsbaHTszBPmaOX6WvqNGwzVasmfZV/2EozeobTImA9?=
 =?us-ascii?Q?KWAkQeSAwuzQ69kbtrm0uQKd5wFwqcN/IQ61Q6F0F56GoA/e9tBxGQabvOxh?=
 =?us-ascii?Q?v44TAwiDHU/yFHSiQxzmxZMeu5wt2MtPAtzQo08nVDEl8Cf5H6LOnBkD4tJt?=
 =?us-ascii?Q?gYZGGRi5xQIIkIjIa3JM/ZohQup6b4yzEvYa0yGrYkzJYmZDAQrrFj1PYB5z?=
 =?us-ascii?Q?tImYXQMPf2urbMa4cNYO5lW4hAyTf2tV5gjoHLYeGp/BH2nDzI1pWA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0h97frdJ9b7jdiHBn/ka7QQBhwOLkgDb+ghmenrdKs1AyXt/4uFPrROzOmHd?=
 =?us-ascii?Q?lm7rFITdkvD4T0FyHwQMyArcIKxFrSWNFOmZ/Nt0A8Alx1ViK6QgCXjz68H2?=
 =?us-ascii?Q?t2eNsyR1UX9eaPzwUEbSMMfaW00UkcTO6u/PyW60az1CTFJo49OGSnk0WM1+?=
 =?us-ascii?Q?VkQHd1yQUnXOeU3/ImhGNAgYLAGg7oQbOdcvoXnEYltqA1kX3CB2n+R6LDzC?=
 =?us-ascii?Q?fBqworu4YdbioprIN2JHMOgCyjxos5AnfpNj6tudhYtPJBfg6pIYi/ihUDQc?=
 =?us-ascii?Q?/6dp+ZTJm7MXo709JMEm6czLL8BGY7e8fUDRB/M0tzf3lP0Y0Gsi//JvrCET?=
 =?us-ascii?Q?zH+45RMGIkL2hf1fPAZ6RC9uwKoewh4rnI5e/epnvSMu/K+hFR08v0cG/wHA?=
 =?us-ascii?Q?dQv8jdwZTVYupmJDEih5ZWTsl+2W8sLGt7gQzPECTNuaprwdODs9qRvAZiCz?=
 =?us-ascii?Q?cpS3Z9p7TJgBjGKyhit+Gvm5EjXuLNhmzdW0dMrNXd21XsGgKALu0ZKTsHME?=
 =?us-ascii?Q?5+WDFUC0AXhwBEY4Z59N/votgc/1bqeIUIr7LPuRel/UthHPu9/p6fu/QtPB?=
 =?us-ascii?Q?2BsKVltgEjLxPtn6IN9L+Lgrea0MW5zy8/2Z8B8uHBLMY7xn8xNMyYCAOQIV?=
 =?us-ascii?Q?8Ha1LVP6jlOKkbvqwJV5paU1l9Z2sQbuQaOm55BLPo/N4SewVmBBcYwtBo3S?=
 =?us-ascii?Q?YvqZnHE0CIGY7ZtVUPU/WAdVedgW553B2VUKJ7F4EAhVyq5UjtrhXTLBqFHS?=
 =?us-ascii?Q?AWYbrzRuP8NWe3+qvOFQwy6DXChI6hm7ogKiaBMhBQmKt1ofUqNDffYWv/bq?=
 =?us-ascii?Q?PciOfHJNPYqqSJ1GWi29meMakPEGhNEc65LkHUBByqcJQoDrkLnnA2OqHWnN?=
 =?us-ascii?Q?yB6dQuJAYBdpgRbhbI/XoD4degxZIzTaKe8qbzntcEy3Dw241BaylNuijpvl?=
 =?us-ascii?Q?IVZww0Iku4jwmoOYU0X+/bLHojuvzXmCroWDtHWuRTPai8r8Ne76VGjJ6ta3?=
 =?us-ascii?Q?rb4iqB7PVz/Hzrrnw+z0b+cpZT3uKLqKEmVg9Zyz3YotaY+Y1xuPG3q5DSkD?=
 =?us-ascii?Q?iesY7epEiH6aGQqVm+DQYjNjJR+vMGdXdjzOjo2Vkr5aRnV2CQd/kOyv8m+s?=
 =?us-ascii?Q?s7OwrIZOwShZ6S+ezIba4CK+6/no9zV2SI7oWany7zw0LNuzGWEu0KDF/OAc?=
 =?us-ascii?Q?AqicfUZEIKXUgvBWil0jVnwtRicS39ZDChxAQcGSJRtixGYOpryDgUb0AXpw?=
 =?us-ascii?Q?bwjA7gowoGXwmq5mqdOJ//jWFRYfmvO1fGYf9ZiMU46rads+AFlUxmjXtJe0?=
 =?us-ascii?Q?LbTVk4+BIdUG7qsJwaGAvtmiI7qhS365OGmLC/AOSugqfU840HQ18+q9vNZc?=
 =?us-ascii?Q?nG7Vdhf1N4CukfoJUHr7qpGFONXuFjnIg25nC051oTAbvfu89PxXQTCyUGN9?=
 =?us-ascii?Q?Cv8K+6AzQMLPm474lGvHFXmQGJUsALyR7+wPttW06UpvdYsZx5ayrGTli6Xq?=
 =?us-ascii?Q?AL/MGVNvdYFqcxDn6iJxAI6JhaOmQPsdwjeFJw5mwVX0yG5YFfct/YS9pG2O?=
 =?us-ascii?Q?IpeHcdG9gSSbHSGngYKqwrV9iBxr0kKGGptfu1sp6yinFAqrzYYAscGumKaY?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0941f2-651d-48fd-f041-08ddf4429ac5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:28:25.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/j3T9m4++JO8t5FIqC8rm2/8DExajVnldiHyT06XNaEGzHaJBHQNlFG/4SGoi3uFmh0QpnRa4W3Mw/ry642GSYNWe0Y4MYWhFo425Iro5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-GUID: nhYZ12UeyvUYXjd1Ju7cgz01kgrllVfJ
X-Proofpoint-ORIG-GUID: nhYZ12UeyvUYXjd1Ju7cgz01kgrllVfJ
X-Authority-Analysis: v=2.4 cv=PuaTbxM3 c=1 sm=1 tr=0 ts=68c7ea4b cx=c_pps
 a=Jpon84a9jUr9T0N/wBB0/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=d0bnlDB7liAsWXr5pGsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5NyBTYWx0ZWRfX1P/xaO/HM4If
 Htdt0pIrK5vpldXiI/QX1Bqo51InbZUNsBbbohymLt8IMb8Wj9jLOapBpcAOtw4lXpvf4kINpAG
 be+gg4nzIeh3A4ZSCdIMWNsifGxAIluZM0uGQ2aNzVwJznZMTSVxeJow5y4tIsycXl+mE7o1T3U
 pJ/sjVwUlTDKlVlizSmt0kGjuSJIaNSAGr3mfNi7BJn4xp8Fy8crm/YV8L87o+gyQ6ycK1+KV1a
 1yj/n94NSlSifxDYDl+2+PeKopLYiDLpfVjN5ohhM8vuIGjaltKOY9AoNTHTqDhNl++Ub/osnXd
 OqLGZITSv2X/BZkimioqzWe6lX+U8GZ25NDfWs6+nFlOSRJet7TQQ6zddLoYIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223400

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
This change introduces support for target-specific environment setup scripts
by placing Rust-related environment initialization files into a separate
`${TARGET_SYS}_environment-setup.d` directory.

Changes include:
- `rust-cross-canadian.inc`: Adjust installation of Rust and Cargo setup scripts to use
  the target-specific environment setup directory `${TARGET_SYS}_environment-setup.d`.
- Ensure `CARGO_HOME` is target-specific to avoid conflicts when using multilib.
- Updated `FILES` path accordingly to ensure correct packaging.
- To resolve the following error when running cargo build for a lib32 target when multilib enabled,
  the RustFlags should include:
  "-L\$OECORE_TARGET_SYSROOT/usr/\${LIBDIR}/rustlib/${RUST_TARGET_SYS}/lib".

error[E0463]: can't find crate for `std`
  |
  = note: the `i686-pokymllib32-linux-gnu` target may not be installed
  = help: consider downloading the target with `rustup target add i686-pokymllib32-linux-gnu`

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust/rust-cross-canadian.inc                | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index fcfd178f34..87373bcb7f 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,22 +51,29 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    ENV_SETUP_DIR=${D}${base_prefix}/${TARGET_SYS}_environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export RUST_TARGET_SYS_VALUE="${RUST_TARGET_SYS}"
+	if echo "\$RUST_TARGET_SYS_VALUE" | grep -qE '(32)'; then
+	    LIBDIR="lib"    # For 32-bit targets
+	else
+	    LIBDIR="lib64"  # For 64-bit targets
+	fi
+	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/\${LIBDIR}/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_cargo.sh"
     cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo/${RUST_TARGET_SYS}"
 	mkdir -p "\$CARGO_HOME"
         # Init the default target once, it might be otherwise user modified.
 	if [ ! -f "\$CARGO_HOME/config" ]; then
@@ -80,5 +87,5 @@ do_install () {
 	EOF
 }
 
-FILES:${PN} += "${base_prefix}/environment-setup.d"
+FILES:${PN} += "${base_prefix}/${TARGET_SYS}_environment-setup.d"
 
-- 
2.49.0


