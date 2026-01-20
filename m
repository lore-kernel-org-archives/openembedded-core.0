Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29282CA5FC5
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12549.1768931655087506506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AA7pP1TF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K4fumr2877846
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=84h0isRZ5
	jZNw5g/kqMAH72c7qC0EsQNs6pB2g0TuIc=; b=AA7pP1TFhV5r447cgpMtBHgB5
	tTmR18wIDL3FHR2ZHe6q7bkxFTRU0hI1owOQKRh7j/0AuPQI2Amhw77zY1kIzfyF
	FE6QrNOVvWCySIjXBbYyyzm8A+ea5qW5o5LtbLrAXkQXhmS8PJa0zJpZibAQFHy3
	AARMmhhnVwmdn/dwJ2pQnht8PIm324oojxXZx7ynkO4qUkjsKQcld4k1i9BoVYUv
	jCIFkkOdyKblXsL1GJq5mrDgngMVfqosGzN8DH/22XjEt2wd9lIy1rREOeEi/+vQ
	rHtwIUKK2S+QxkIlmyZwYRX9/pBYSkqOg2QIJZr9cLGUgpKlWT/J2iO/hfjlA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukf06-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZFsawQbnq+hRzXKZyveWexB0H0Mee75UmNIWvOkyLM2xpSumM7zCVT9FVRKXnRk89UysaqKFJK3bbMY1sZbXAPmCIDGHJl8KOTo/NcfqgNbEMFQ2ZeNYIAIq5I8AF8RbaWpkiGrXO19tkofJngnITpnvZ1mbJXU+G6fyjtVO8BLef9PxmqbIhEufhSl+VBnFeDtNa0TbQuyaPXf3PXb88mrgDKhdIRxjQ6lmfxDgBibPFhQd+9II7wePU90tePujqdMYHbzqcDu7kGOGSx0FjW7Bs9MACk+zoyRjD59w8f4w6bHyCMiFs3lTHyJ+xRbp7AcBCLHjQaltAPEyaL3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84h0isRZ5jZNw5g/kqMAH72c7qC0EsQNs6pB2g0TuIc=;
 b=Jq6WLS782uw4pLVhB3vUnLJVCtASyxgzKu2CqYZsMG1YHuD4ZWYE8BYwfYlZAN4mMPGZF6vSOgRLx/wulr5hJaz4h+xAs9XFIrBNP6d3cnkLp4AvjUbW2Y9Nq63VSgkrkLlJ9hI2VQeHgDerWF7E+qbagThkiAd7FV1mSp6Sokv0wO/xNQS+BTBI2S99W9KlmA5eieoYKgC0aE/EdrIR00v8AkidRRh6pf9qvV1ukhNWNe/ouWfoW17m4ZfVf7vvyGEsPwihMZnXpTBjM7JbjoB13L6qGoFwoixBs8RZMQj1Ub3wHo8oOjLm+3day5UYIObBCcVxJAX/d7rksT1Elg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM3PPFE9E88246B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:07 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 00/16] Enable rust support for linux kernel
Date: Tue, 20 Jan 2026 09:52:30 -0800
Message-ID: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM3PPFE9E88246B:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc9d08f-885b-4587-412f-08de584ce856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IHeMfymALw1v8QMgVL37FKW44J4PqybSVaHVWrocB8KVEQUsfnoC76RN+HdR?=
 =?us-ascii?Q?jNd1Ww6v7PQ9yqDRYnH+HXJuwU1IZ+y7g4vUQGuoWx0cWAeDUgunuPvNGTQ0?=
 =?us-ascii?Q?ja0nmBc+tLZtW7Z0/wSuRqhs7fcE4OGBWRvvGPGSbqtmAk3DkclofoGdLRBS?=
 =?us-ascii?Q?uvGM6F2ocXdkgcYXzhvsBZI1UxpH/ZWB0Q+Uxlddm6xdsihCB+5ueOdcRJOM?=
 =?us-ascii?Q?mkdewSAU+4XE8poU5d0r5UyklYbtjjAXnIsuVHpaxPchslJ47Qb4wiC+3lev?=
 =?us-ascii?Q?ogD9hquMTavt1ES/tFwxAEOuDiGHzO+CrbLyz5wOKx3f4+xtScErG1vqOiLk?=
 =?us-ascii?Q?ariC9ebs5K7/Vob/nl9eIJZlU9Zn971f91JTQACpSBMqE3jTeiM0YJB5hL2P?=
 =?us-ascii?Q?Eqc+bjvlfmHfoofVlWSXnZTeW1Ak370cSMzgZkswDCyoewW0h2hkBQTFVnXC?=
 =?us-ascii?Q?4PITCyFLYGm0Ftw6n/JCAcrFK9UiKd4uwcviuRYXqb57dWEfKIj+aT5VPKqk?=
 =?us-ascii?Q?pXN672GjZDgY6BEwI1Golp4KCireXQQAWRX7auEAp41rK67JMcGNqlDQza/P?=
 =?us-ascii?Q?toN/bbdm6RJOHYx0yjT0YW0DRtFvNsEEGhFQAqe9s0mYVny6sHkHwpBvTIbH?=
 =?us-ascii?Q?uhBEav6fr4coTIrodwirGl3C2Heb0e5+/l5VdaNb7pqHpkvvgGPkm/aPzF+V?=
 =?us-ascii?Q?cMrrFOsDxaokvIDEMnuVKJ0bG6x2w15zEGEfLSkUSRFZvypws5mzH7cXR1jN?=
 =?us-ascii?Q?SLb9wnWJTs9iV0OsdKCIWJNLbWyL4QR4O27ubwIMIqaK8ncfeXZfeDrlPMX7?=
 =?us-ascii?Q?XySJMC5gKsqSh+RiXksLzFbYuBDs9Ub/Z8PkSmIUNTiCeF84mjqmM0F6nbV6?=
 =?us-ascii?Q?rTPo0HtSviNeFnNx9o9blxRBUI8nMh1HMIE3btavTxNZjUO602IKUoop6q9e?=
 =?us-ascii?Q?DyKHZoOgIDvV6M8nfBcskHw+eEqNLbtQJQJ9bNguvsCWwpJyKm9NW0uLG6co?=
 =?us-ascii?Q?xUTn5bZpg5aPO0VCIUP/Gy5Uj8b6uXjnLtA1Ll3N1MOTE14ImgPowSvXwIUW?=
 =?us-ascii?Q?uvxOE/0XGEs+p+wCvuG+zl4qax5ZZrANFJkyBvtWnpTtM0+fTI5ew86Ov3+h?=
 =?us-ascii?Q?y84Z3gzye55TYWX+8NxgXbPUhrvPv79DWfk6GiUNQ1FHWMpAfbsRp4Wej5bM?=
 =?us-ascii?Q?YTpmYYPbec0GBZg4SpseDHbNAkX0DCaowjgBkCbr7sA7bA5kuWLbaxsiDr3m?=
 =?us-ascii?Q?LVK+WWXdk2JZI+0oDy/rUSW/XTu/wEsklkvOLd133s87FXnA+4hId2J0rI97?=
 =?us-ascii?Q?RyhabTyOeKqbuz9Zwf5GxvJc2A0bbspV1Kddmh2FmlEYFdZjF4lkMmBkgqTt?=
 =?us-ascii?Q?jAzIhE8TK4rqgRdfMrY9h8IzUMdufRxpSzRIQKOmxTx5bwrzEYzhGVIxjcC5?=
 =?us-ascii?Q?C1B7l9MVs6o1cxLndUTaI8Te3pWD0iK4gidTRqEhjdGL87F2KfXmSrjnL0if?=
 =?us-ascii?Q?ictAHvJ5C/QL3kzmGwX82ZjuuCqAx2+PwprggJRIr6O93JTBJgfqzV2CMTvk?=
 =?us-ascii?Q?Pd/oXiT/pOn6oEscHZXrIpPW3gfYsJ5LgCkDL81UUbhCyj7nq2rSolWtQqEN?=
 =?us-ascii?Q?GWP6gF2k5q489KXzycVJ4QIE3BuhCsq8g0e2CAFvMoBB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8YAGY4e2UY6lMOTTDlik8SQV7I6XyTNizsYNFhBEAVpmEKIrZabwKqNR3hR8?=
 =?us-ascii?Q?URHCFOnsBJIg5bj+Vjqao8iaSdXBlFVerdNJItwoHUy4GsNvbSUmg5xIUjtZ?=
 =?us-ascii?Q?d5oCcSGrnJkoFc3UZxeb5B+XCAJvj5rJOU1ixiau8v6e3P2YhZrYVMaPwjqs?=
 =?us-ascii?Q?rlhsUOXOpCwtF+sU1UXjXhlXKegIxx5noKhV55SF9l5j+Q26WJVniDlF6WbT?=
 =?us-ascii?Q?tGx8BECGYef/D6vZ3W21rHTz26DY65gDRiCn9UDRhD0oDzXA1tG8iXl3OLSx?=
 =?us-ascii?Q?lGsvS314TyDYtFd7WjmbFjx7lgTh1AL15f0kqXQAyP+Ou48z0s+bW1oW9JNP?=
 =?us-ascii?Q?BSsapAoEbpdh0Cubn2VR8V1XiG6rtxHmHsnWZZfhBUSoELm5+MHnxOAZREfC?=
 =?us-ascii?Q?0qSiKKpwu38cv1J58EXq+ph5LAG6DF0m2VTIGgIvfXM/cB0T7aUddQ9bSG54?=
 =?us-ascii?Q?Dq5XcKTMOUagdT9lWOPPYld0bkvmUb6LtnCr6bWGCiiJ91a+J0Pv129iwN+u?=
 =?us-ascii?Q?K1Lzdvmve1ky3pasGVdVU9k9Q7N4oOkRHbvgS9kbwW/bYILCRbDiaom0NMFy?=
 =?us-ascii?Q?350agD46iIWKcu/XOnEoN9sDYuzDhYXSGgpQ4YDuXdB+1hGWlzAiomDKpzjG?=
 =?us-ascii?Q?cbaTCgh5h1kdoz0TtTf+qZo631Lo5vvXfQ4RJA9APLxzXrxKr0U8IK9vsHfK?=
 =?us-ascii?Q?0VDTUDEvINDl/gXVbC7Lm7lEQGPF+9u3N2UYWNlBtPk4Fn34F/HcNlM3Kmd4?=
 =?us-ascii?Q?k+rlF4vF8z9/XtA4DH0YWpLRSV4Hr3QAa+fnSEOTvD/XsLJFtEPgE61F4+OT?=
 =?us-ascii?Q?9oz4oeW3J503j8Jy9y8SgiWXfAawLhPiRvRbygnl3XLZB7PDXFdVYQ69B3tS?=
 =?us-ascii?Q?CAALeJFC3OeeJ7Ol7ZF0LoTWv7hMoN/Uu/N/hKRAQXI7r7kB08hRAmF+mHgD?=
 =?us-ascii?Q?q6hW8G9OmHXopDqeL0oUjft4UKlOumYyOsEcSc1OGiojuweO/zLTGZ54z81/?=
 =?us-ascii?Q?N8TtE/2tvceB9PK45v+e8/JLCL9Ne/TmhqsLR4fe3eCz5fRPdMDbwIHHpQ0z?=
 =?us-ascii?Q?j6ouu+T/4gMEnj8TK+vo1xTBL5aFLdRWGO54pBKNNo9YI0IJgZVImE9ADglC?=
 =?us-ascii?Q?9ddQi7yiv4XD4R4O8l3NkistuW7MHqD/cZApZWFfISQD0h6rFiu9zifCa8g6?=
 =?us-ascii?Q?huDFwLfBwTjLgkohAUmfKhaQblLR5qkYu+MVuqlsr+Fi2lh1TTF0DaRqdduS?=
 =?us-ascii?Q?ORYtdZuuMb3HTvkXR8m0KRW9pyni4kmoRhuJ0LtbhlRrPrTV5p/8PrvCodJD?=
 =?us-ascii?Q?wudBJBbBBy7bYQFuiY688vh5FiMTIUfS2W53bcXejCLsgT+m8ZLo0DfDeaE7?=
 =?us-ascii?Q?5lnxjz1hzGhxQ5yPtEmLlY8iIlI6zCx3MDdxX6mg137ATR3RZyn7ftGrsOyX?=
 =?us-ascii?Q?eVDmys9XaQr9b42kQmMwsPGHkiqdwWx4RN40oHmVFFayk7Bhy6ogFMRmHihC?=
 =?us-ascii?Q?o+idV6r33egsGNwiT6RLR2nfxOC2Avg7I44S73wwnQFL845/4m32voqPSojd?=
 =?us-ascii?Q?lEodTXVYhyuqZVU0VwH5olbszvhDGlWz5ecTUhQUTowCeOjkTe9f1v2qbFEq?=
 =?us-ascii?Q?qNJ1nYPlbxGR5PG8BFTBPDMq7uWrDPJ4/kq7pCM+0O6DVYMzQ7J0EhEhUmbf?=
 =?us-ascii?Q?iVluWcPzQOguIMJpBhGmnXKK+WzWMc7wmTpux382o71sSv4XZamWNR0uoJwz?=
 =?us-ascii?Q?6iuYtbi7Stm0uvO9qKywYby8qmWVgFI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc9d08f-885b-4587-412f-08de584ce856
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:07.3659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNM81Chs0FvhdG8VcYllc8PRlaMZ5IKbXTNuqMYakECxQM5iG31KNSdh2HNsd6jHN1WmjOIZMra1ws8Zg0WW2YZFMMO/B4zXgeMhX5Wttf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9E88246B
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fc145 cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=PziaAcAM89q3oEXetAgA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: crNyEndv-h5K8kPoDvlBH0-akR8wbuWe
X-Proofpoint-ORIG-GUID: umBfkc-khZZZpRGMT22ShOqihJH3zv0J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX8nRIWa6bPi0z
 WPmfDQa4kIVX6GluhjDTXgkUKwhbXgBN9eqbyOC/Nb43lVVfE7cxXsFSWOQcfiwcXGg37h4WjaZ
 yja7cZp/v0tOTrVCLP9pWjyD0RZnGKsfxphuyORIBz2ErR/UIhJVASzCcDAiKCpns4gtyMyqA0y
 IjcJJ8Em+wJw4eYkIjps0577c96boxxWvMVFcTuvPAHHEcbOl/EtHePv+P2yQm16120kf3WeOjT
 2p15KrWloNc++29uJ0YZA5M0cQsfNsBZLhJFbQ/8cIhPuxSfD/pJOruhQyFPKQksvYda6ZUyo3Z
 8ocCME9rJBYeOt3DGlTZ6tCcw/aOnFSJV1iKLsdjQpdKVYvnYIHSUDzxiprWIMrL+8lSd7wU8ZD
 S/wJMT0crNelRc1FVwgf76kfgwZGPOT/BxCYBNH9WIiHeN7ll55Y1e+xtyxNRph34V4DzP9s8yM
 EUTMfy6420IcnevXavw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229747

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include nativesdk, as it has been merged
  into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files directory previously stored under
 recipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample" by appending
 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc' instead of adding this
 directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for building
kernel module which is written in rust and also provide support to build
rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support for out-of-tree kernel
module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Using the Rust bootstrap tool to install Rust library sources for rust-native
- Patch 03: Install the Rust standard library source ('library/') into target and sdk
- Patch 04: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 05: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 06: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 07: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 08: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 09: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 10: Added oe-selftest case for the Linux Rust sample.
- patch 11: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 12: Export artifacts needed for out-of-tree Rust compilation
- patch 13: Prepare out-of-tree rust module compilation
- patch 14: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 15: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 16: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Alistair Francis (1):
  rust: Install the Rust source

Harish Sadineni (8):
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for target & sdk
  kernel-yocto: enable Rust kernel support via 'make rustavailable'.
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 22 +++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++
 meta/classes-recipe/module.bbclass            |  8 +++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++
 ...-host-documentation-is-built-before-.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.92.0.bb     | 15 ++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 10 +++-
 13 files changed, 199 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
 create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch

-- 
2.49.0


