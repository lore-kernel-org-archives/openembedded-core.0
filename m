Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63F4C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:15:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13504.1789560941140454775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZeR8twG6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3719cac327=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G4x7Lj1125782
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0vTHMk/oK
	/yC5V4sKENXAYJ0JskAyYV3YvVxnabLGak=; b=ZeR8twG6y4NJPWxqnWh8LQKIO
	CG74bjV5/JUny00bzVQrwvZU8eROZcQ/rzUoIgwoQSJrCYkDzX6fuB1oFpJCRsX+
	3eauKU/G9VpKyrtvd2iaEMc5VbRhcahNXrfbIC7FYp1E9Dz8MaDTb544Ug10PmhH
	fqHT0HO1cQKptTifVfBDsT/ryFRWcFPet9/OLSi8/sRCMKcGIGu7iu7UxEFe79Vm
	KjVbEdjNatSYbQEQWh9IBtAsyDJ73labxtICaY3J1G6Fe5xOAweAVYTYasPKUXJr
	4e7cjknoHkUetcEX1HqWXn9Qbi6WV2dSzDGU7SDbRVk/dCnBCNnUJzk6ZtTYw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021102.outbound.protection.outlook.com [52.101.52.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqc1nh8ej-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 12:15:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph4ovShwzcW1fTSln7/siB6YYtUTMFuWDQidlhFFg5EOcwfaopWdzUqC/gx2bTUXA5iKOuJ0yS43uE1zR+f3zW0dJ/Qm8wcal9/+vZpjR9Kk389Jc566lqxmYNIINNfefCe3uX0PmkO9ZYaW97fqmglFFeGJVUC/nlr9kfwGY1NaUKPDIdUsJ4GEiG3cMJ8cJu1///I04X2pZhMMETryNt4I8uUufLigmaX2gqEjH7My4h+RLUJczxC8Yy5a+MXSdTFUn8qMNcek3GMqsYxhpPWIbSQLsPLiXgnbF2ypLJJodGooqtKx1q11xrMJWlzAWvf5MeUMHKpRfKuyWw1edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vTHMk/oK/yC5V4sKENXAYJ0JskAyYV3YvVxnabLGak=;
 b=xfz8CtqIc7kMO6gsI8rCPbS0C9XSicN0cyZvTD3/VhtcCAbrBBMdqFkdvJLV8kp3fRTnoMi/lcgpUhCzRe6kj084kFQa2Pi6KKmkN50+e0zT6+CiO1sj8W68nYLMrPXfpZ8u2TVYA/TloqQKEQD8pC3qdSRHukAr1sU9sHhXbAcOafRvH7JEYPRZhlObdRBbw0DNIIzYEr0UJHDhyM30jmhfqdBpWk2Jt1ccOzKrwzAamnjHzzYMO6XjS7jYi8VS5NNO9Z8x2txMkyAF8AMVd5Qw8sZvW9V0mFqAkg70/UsXRuwoly20xYgsKVy4L9PAMKWSDTFZdhnWPsY+Du7Xqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 12:15:35 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 12:15:34 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        tgamblin@baylibre.com
Subject: [wrynose][PATCH] qemuriscv.inc: use fw_dynamic.elf as BIOS when KERNEL_DEBUG is enabled
Date: Wed, 16 Sep 2026 05:15:17 -0700
Message-ID: <20260916121517.1513695-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: cd394242-54b4-43e8-7521-08df13ec35d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|10067099003|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Rh9VrPiM6uCKglfLbzJSe0asKOflVrGfj8pH5wxm9KoFPpVxPj9yfvY+ZyyNfniKVrC7WHVYbG0kD6Gf3Wn32bDxhtCPNOQfoBW4HqRA1JgBb9jL3J35U/9bB6TfUotgj+FL/JC/wEJJ1rx/nEKpVTPw7U4jqw+CL7E5IvOr0a8OUYfAAbCu22Dqnn+T87WsY6+JFfDQq+Fhy703osUpRTTgqO43pzQmOPJbxLdqb+tctRO8U5qrfrfoVQy22uCI1ZuX6lwRLq+zUmO/CuxPFvj93imqm7BT53vdW/F2khATcAkutiv8VtD7GDywITihyMVrFacLblM465Zxd1/aZFypds4xVM4ngsAZ7EI4A2a0tpXDJmp3rIZ3clYKbRQ3LU8tgdLpGdqeWkufEtTrOk8uPmPx0X6BFXdR7G/Nq0D4VZhhRGRsoyZERAGkpfJ9NLFaOciD/MYQSIt22jdga0uo+0wMsgdsN74Rc8Zu0M/RMKPBeOYMzxSa6h+7ENMUmMD1n4DE0z1PnvFa5bGJrnMgVPPcAsimwPHK3K3GpPvcF2FSxou3tDR5C36PXVHO07CZ+Akpotdi0om3/mUiKBA9IXzQ2ma9Dw7nn5SQ8s0dNZiHfMVw34zSua3BzHMNQMtIPsye3pkdn8KUobQQBmUYpKfoHY3OUcCApWXWtXg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T4es2/CK0idod5nLQ/xNS4rSe2Qc1mwmg+diih/emXlgW65vegNFVw3IWutE?=
 =?us-ascii?Q?FbEdJ6sX1PwdFpGKUVpUgfenL0t4V3AcyF9FFPXjGrglzjkFclOTfDq/K65H?=
 =?us-ascii?Q?rTmjf2GqlA02cRGm6THjIJ14i6L2RXkORLdIfAk7VHpDjMurF/KPNOyzOJAB?=
 =?us-ascii?Q?1u1X8s8+7xHgfUPGCNSTcUDD1GAjPsJ99LujMMp3Ok7wpDz9Z5B4aO0j92O0?=
 =?us-ascii?Q?kh3lPHTuYOZrx+uMQixolKFH8pYEoMe1+tArnHrJKTua9ChIpdjbd+0Rs9hB?=
 =?us-ascii?Q?WoDEN/37YcRg8NdEoUyZCdmiGguM0zHdEBQoy4pTcShBjA7jyw/HnL85ouhv?=
 =?us-ascii?Q?cNeqH42+3mTUxTHA02J4FQI4XMe6ErZ50X6vDz1BbfLisBZhP1tVsU7Q5jRl?=
 =?us-ascii?Q?xkau3dddaD6lrssbdWgTIELV4xLqQgbNYJtbZ3qhGW+7n908TQ02oPuiZYuo?=
 =?us-ascii?Q?G5zxHRYxrDS5Od0waGyRiwcHphK/jTKS7c/UpnjS84FRf2a53MTorw4LZX5P?=
 =?us-ascii?Q?EQOVWN/ASydlbxaJYG8eahzfcmQ4eJ7JGzyRp0yQOSwiIaq3ZIMDzLaunAhY?=
 =?us-ascii?Q?ag3YKYEoihqDp/tULniC94w8olK9suytIVTSOaPnAjiY9aXmM09mYh1HFqFZ?=
 =?us-ascii?Q?kHxgvrsZp7NqC3qi6rnwe+njU29hJk04wPxFLE5V060ueUsRrDrDSgK+PhTf?=
 =?us-ascii?Q?aA8PvY6lNRq3F4+VKPUNx7frNPplFZqfZEE2p1sy6dW/iLRbG9n1L/L/TTmf?=
 =?us-ascii?Q?glgjjyTHK7YNH6gALSVVjapFLHPWGOxsveGTNfoIpKABYrByqygY/gfeerA7?=
 =?us-ascii?Q?H3Tds43XnVEdi2r+esu1NA5HIVm5eo9MVHNG8TzdsiEpx7YvK0PgRJoPLB80?=
 =?us-ascii?Q?XrOXwfJKxWuJQ7dHuYgJjkxaG3pUVdwjmlgdLmORI1Ie6w2+ZZjox0S9aU2W?=
 =?us-ascii?Q?qSW6ihxbQtpZ7KoVlCsAb9SsmBJu0ASOQtFrTCf1CpDe1oJ0Fpw1mIReqkgZ?=
 =?us-ascii?Q?ZqHXfrJgpw4vKG6elfudXQQbaSw+CjvRg+5EmbJfYoZ0GQjKiV5/Kh92bXOs?=
 =?us-ascii?Q?pz7zSdSoB4rQ8c75cQAoIgzonVUKeAwhWDNGbQ/RdIaiPmVLR60A9aU+i0OO?=
 =?us-ascii?Q?nGPi904J849+MQx+g1oCH0d3u1+AS8gulT+ok+aqAYZ6HtjxNxspLBCSNhp5?=
 =?us-ascii?Q?M6uqLI3NQCqNQ+mdLv2RbQ+6hDZ6XxtVX36JbJGGVmGRzdLUqywO/uqsszWQ?=
 =?us-ascii?Q?SwH5t905V3r+xs+Ou19w9H4Uv3yHOzWNPTkfK5pTPbuwLYsHg1J1VIxIPbgJ?=
 =?us-ascii?Q?wuazcZ5KItZBW3nV3zcO1x4ayZ85H0WhKt4XONPvSYH7wM4drLq6/IFeiK9+?=
 =?us-ascii?Q?8W5zFYcNzWps5OE2uHD6Rvu4fnaboAYp9hkBT+8CwzoeBuvWAImfLKOXyRBZ?=
 =?us-ascii?Q?rGRgisdonJAY7MT22sDmgLh0ep7F1LrB8Ba8N2x4eCYnDQ+li2RYCvg954Y6?=
 =?us-ascii?Q?EmniLgcXGOb3oaVHpd2gGHXKPkk7LxabmnrAOQRL1DNR97J7PGk1VDzPpq5Q?=
 =?us-ascii?Q?wRkWcbfcYQO6C1g5HIdMDjWfiqgVsiA8tfObl2fphvN09KP+VHNXxTqVndXa?=
 =?us-ascii?Q?Yu7tTw6HEBpSRONFbnn3I4emr9P8IZQ18xVWKihC6YsjEfydxpYnDbpeJ2qg?=
 =?us-ascii?Q?llYqtj3q9XF13t1/cFPEqzrT5Xp+Z8RngogSqBdN3024/VzXLFgCz/Tga4WR?=
 =?us-ascii?Q?QPzBOs9w5/m0mEUC926jesrNJZGfnaI=3D?=
X-Exchange-RoutingPolicyChecked: 
	vGANiM1GbwDI5Qg5He5f9YAEOYFs/ndm9zYRQ44MVS+Fu/8qU/4cofd/Ht6PIIl3p8kzbc+G/6CLyt87R5LmS0eZOqXnzlGC/51Iixm3Jdt8duIA00vfP7p8T7+3Hip6dN/Zflh/F0xOodOgkPL8Vjy7dtnPoeT3Yg50xxXczncBKaEDcgqtk4FaXh14D/MjJ5tAaM28wWw1ywqkLQaw+bMsoezsfO10fWqY9FRBbQndXqMqMIKMyPQxUPv7d/bbZOt6sP5P9aprk4nzevgbin2UEBVm67dJQ1lrigrIexMYwBcANzjthmWYbtCDiDr6LsknQuNHr1CqPhQYQe+PTw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd394242-54b4-43e8-7521-08df13ec35d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:15:34.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+YNbXnWRAkkgUzM1n/hEzEqluWVkElSO1pZcTmHgwJLqKhiBWGwMGBNHlciD4VvEJkUS7c+y9mm9Seu2C0M3T3M5u7hoEJp1K1TG0LVO/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: nKPoURYOjsqDNY8wsR1ovU9B5NMt9oBx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX5qtbdTy3g0mY
 Jeb+cZPA1LQbSlAUgL6NTNMpa5M/3fbyOPjKPB+wvtwBc8LSly81Nt+p8jGPV5gtEK2RynMPDrM
 cvlQ8O6JEZOma9Rk99NFeDtJcat7Nhy7vTDqD0XR9f2aJjFnsNyR
X-Authority-Analysis: v=2.4 cv=L+GI0OT8 c=1 sm=1 tr=0 ts=6aaa886b cx=c_pps
 a=DtwdgGxVrw5JanCww5rNYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=w4TYi2CdPyO6SPLaqLcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: R8PuuKtob_xhp6FSW7H9004pv1UggvUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfXwv6wKLEAjOBW
 m7t8PByB5NVQyANO7fLmTt8qRRMLL8P99Iqk5aDPZNARuJSIdj9UYEvVU3BqIPz2YJGScZoVVkt
 S6LtaFFrs0YRw+UwTW6gnl5xOkuUof5UyCMs+wgV0pvsftLXSVjRGoSz+g6+rX8YTVNkuUZGgvI
 LZI6IXsTr9KW4nboBjLinwWxuH3GnCJ5csSs72xkdBJsKStY19hwkGkhdiCy+5J8g5+o4+RU7HL
 HRMKNv6wDHJ/QbfOEey/oDTq/AeOqNmnceQiPkUBFPr1fMhUsKkD8O0et0bJi0zwwEl7V6BV81u
 9W0dHR4Ks/f+38QOSdhS59uo6knvkMoxxeRxp89qwtEHuDyHaxT0809XdvmhkC+chx6WvGkzGgO
 zmCvKAjlYqoc/cY8Y3XiOa44QCKUgRKwczILxdE83YsIUuDZM+LKs/MACex326anQHfNedSV/W8
 Xd9e854eEGY8vjjDkTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245965

From: Harish Sadineni <Harish.Sadineni@windriver.com>

QEMU RISC-V hangs (qemu hang-up) when using fw_jump.elf as the
default BIOS while kernel debugging is enabled. This has been
observed with the 6.18 kernel (exact version where it was
introduced is not known).

As a workaround, switch to fw_dynamic.elf when KERNEL_DEBUG is
enabled, which avoids the hang and works correctly with debug
builds. The default behaviour is unchanged and continues to use
fw_jump.elf when KERNEL_DEBUG is not set.

[YOCTO #16409]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a..6e7d4a8adf 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -29,7 +29,10 @@ QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_CPU:riscv64 ?= "-cpu rva23s64,pmp=true"
 QB_MACHINE = "-machine virt"
-QB_DEFAULT_BIOS = "fw_jump.elf"
+# Workaround: fw_jump.elf causes QEMU RISC-V to hang when KERNEL_DEBUG
+# is enabled, use fw_dynamic.elf in that case instead.
+# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=16409 for more details.
+QB_DEFAULT_BIOS = "${@bb.utils.contains('KERNEL_DEBUG', 'True', 'fw_dynamic.elf', 'fw_jump.elf', d)}"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-- 
2.53.0


