Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA0ECCF9E4
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17685.1761218826889719447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KJ2oDzt6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N6ddnp587344
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dSSf/CdJAaXRz9F5Vt5ABEmjolFafzjF8n/6ef7L5mQ=; b=
	KJ2oDzt6BzRzbXcE/VK7clNyDDntCTOBn/pYxe5NZH0ySkADjd5qdAqUCEK9SNSX
	PF2MFcgjhi3/HUS1QHj0f8H8Cw9d/YSHKPMQ56+XFcwkXrCVeVNh12ah7JNSH596
	as3Ot/hF0UAH++g13amqvylnSfMtoJ8gQ74pmWnpN6L8Y9zg/TVtOi5MeCsKQPa/
	nvy5gtN6JTttBGHyxKPoVnf6KreZJwLzaI0LnbqINr6yjK+24K2X51eaLg6q4LvK
	kxM8hgcoR0LotkQpp3UNd+Urw/G/5jEU0dDCDXE8f70c95cfyokbv3B8ZvYFGWHZ
	DYzRUM5iCkmG9HXWnyRZkQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atgj6d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKJPHSDf24P7mV8LlfN5m7ZeWe2bjuXPFdS2GeliQVajqtyurBv86EviZPvnKt9jhdZJMGaYR02fFsqo1zFLfDQvwpXq+kzIcIEJ/zWc+SoBcuY5RKMhdDf+j4kYjnIckaLz4/6Q95sos9zJJmuZ6ErTApVbZ5r3sjE19v55kX933YBv3XQXiW3Aa8FfeRGOdEagw5RvQLcl27PMu4nmxxnUui1zBVPNp7EU9Osuq1XFlF3Rw3hZF5rnvTc6HjZ2CVjOhxkzHHgT1a91xEHphWPp2WJWFY22/Mm6cS0d7VwcfXuvJQcOyBj17A9gArPHCR0tevcI1kaT6M6vk1S2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSSf/CdJAaXRz9F5Vt5ABEmjolFafzjF8n/6ef7L5mQ=;
 b=CwmwOO8Nit11wcM6Z5/7ZBhQv22Mzhr0uLzn8HYMQdA0dLRCJJpYkawjotor1uYt2h9uUHj67UFXZgATtXg9MjGggZFrA17KPLvgrboEpZ+lIXOqpCbgEuRUlfpMua+l40dy08eUVI4uqa25U1Tb75Kr/Jzwhgyrq9kelxr3clZfBcBxzabSBgLbWexbvtRtSqpFGgcQ5k0SCLrT7FmOxb3smHJ/kCcRqGWi/RrZtJnEBpQlrW2dTdA2K8LJBITc1kf34PCGlvbTzIgc3j1c5/tlmie7QuiBqqdFxFVQtDSBkW3inmlYA8edIAQ+8SPJFIOHPQSaRMIa+W0dY2SFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:27:04 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:27:04 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 3/7] rust: install Rust standard library sources for make rustavailable support
Date: Thu, 23 Oct 2025 04:25:43 -0700
Message-ID: <20251023112547.4044904-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5b5d9a-3ce3-4aa1-71c2-08de12271766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I2WSV0RcanHdsKrhvf+uyFuNfHupYtAkd+WcfaWX6Np7SHu3MB6hP+8pmpPM?=
 =?us-ascii?Q?OblFLGB3N2zHQp95r8BBoEVmn/ClWfewW+21EGi9g1WV1+6d47IDL1eKsW7A?=
 =?us-ascii?Q?lQFaYRY7d9Gz+hfbLJ8FOu4Tpy7syQqHv8X+gnPrGzxkW5BW8BKJoOR7ueQs?=
 =?us-ascii?Q?Y7NoiVxnq0+VhB5zjcvOC+q2PeBDQNwXoUNPFNx/ZTx6IAQdpCevKVSMVgj8?=
 =?us-ascii?Q?//iDSl6ctFmud/9q5jiKhWd6dONcaBvr97XGMR+FFuu1oS2FAsRiNy/HUyAh?=
 =?us-ascii?Q?t7GSo6G0mfSZ/OROTieWgHkR5LDVxuRpN4YKXVABQw7Z6MkRtt+P2VuS1S6T?=
 =?us-ascii?Q?1GQPLQGy6ko2O2QLJa7MMFpDqgeGYHDbMRTXrPowqBYeHWfMZA1DapgCTppm?=
 =?us-ascii?Q?b3z6ajrfH+WE5XYiatN7H4v9iwsASH122fROGazrwxsO2993JO3yfa0EpQgu?=
 =?us-ascii?Q?Iwur7UkheQOAxKOQCdlQ+Pc5oRzGy6B+MAmn95mgtUoCDUAOBrBC7df5SVmQ?=
 =?us-ascii?Q?M0Si9DHeZPhkUP6+ZzkT8R+JlV9a+utdreGHWWNXG6qWEErRdzvb28h+8axN?=
 =?us-ascii?Q?9KcKRuzSltgOwNGZPaU2fyKmMMDs7V4hSBJCvQ1g7m6dh7hJtvrrvqys+xTS?=
 =?us-ascii?Q?pCtBR5X0nHjs9XWoiBqstrTqmYVUvhYOYz9YTbGLK44Ph2KHBd+9O7nctT3W?=
 =?us-ascii?Q?En1iXglQ53ApWjfbk3YZi7PDfL2GiNEC9adr65/LI5asjJ5AwPO1+NyFoJMV?=
 =?us-ascii?Q?Hz0GxQNrHFualP9ChW6Jl+CS6WeB63MJOHfuSBsFkjW9QiXDy9yE1d2/TU3v?=
 =?us-ascii?Q?MlPkx+ilqGXTfxEPDZ+Z85euKgGZvRvapsjK94dn1vpmyBRbDgp6HTEj76Ve?=
 =?us-ascii?Q?iKI9WG4GNccplNTAx1YjfCGIfcw3Lax9upG0geTwewH3q1qafTGhIWm7isXA?=
 =?us-ascii?Q?Tg/34bxgm63OdtH1CvKtvOaDYA85xjHqqOfkCrP1TLkP/zpfem8lDiOPEgxH?=
 =?us-ascii?Q?KZi8v1vuB2cU/nIrHdCa/z5GR61ornWNH5uzg5b9rZbiHHykI0lAN2jl6Ml+?=
 =?us-ascii?Q?Sgd6Z7dk70lrxcszQpuAaPYp+i+9PgFt8kJwL4OYSIXT6TJD4D1Ed333vb/W?=
 =?us-ascii?Q?mu3od5pzG+7A71uxdljnuN4TWAy1f0PZd1da4O1pgjZDX9+XgefQerKdLdtw?=
 =?us-ascii?Q?bicd7wHR2hW/yynoc+KEbYsIeyjwyBguuMd6ROrSvzw0cfmPDpIU7RmMYDD/?=
 =?us-ascii?Q?ZIFkbhDFiTOg9oBB01mP9etueQKRnFhv9oQsZ1eIE8nWFB97rzmW++0Vlykc?=
 =?us-ascii?Q?lcVNKTGdRA/zxLTVXFPbP1GzdIjCm4w/XfkSPnB/G1sw5h7VR0L4M14a2U9a?=
 =?us-ascii?Q?HIoOSMztzWsLo8XfN06tzBt6SNT+XI14ofVM46PAhR0sPG+hTX+LyrJScbTE?=
 =?us-ascii?Q?4cJIqq0TUa9PFtDT4nGQ20fOyiBUL/pRXQlc4W7JjDgLRdVryJeR5oOU0bms?=
 =?us-ascii?Q?Gs8hGm6IfHh1Bx2a0xUO/dFzA/N4n44Wd2ab?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?156NbZKQwrhuPNOOeBdkaRckbrH+yPkScrX2EWvIYDAIv1WP/1rV7Xq55VCT?=
 =?us-ascii?Q?ZQyk/nu7hAlEYgXhenRXqWw9y76mZM3nYO/taCtNpoh/DVycGEDirCiJSA+e?=
 =?us-ascii?Q?VhUCXZ9ttBaA5TYB4Fv5YDeqSSRkNhJB7kVmtRxRg/f1csrmcLxW1yx9FjUH?=
 =?us-ascii?Q?xkqrtmL5YVfAwYJI2ZOIjeha/L9bV5Mt8WyQiG4cQIi9OxcyImmVOTmj+cZs?=
 =?us-ascii?Q?n70rZUN9v00qSgiA0u4LaWQCk9M8+EWtHE7xtE1LaceeG8lcFnpc6773Lxjd?=
 =?us-ascii?Q?aghkSx9IT9m1ugGmeTXvW2WF8EbMHYuZP6Y1dH+g1XAtH6W8+yESZDB8M6+i?=
 =?us-ascii?Q?lS9QEkxFOn5WRXCrFFuqf8NtKRDdqt3zr9YY0hvgGYlcSAVPVVEtybyDJCid?=
 =?us-ascii?Q?ePt7FlClHw+uS02ILt/ne8kJpkJmOXySbfeRfwD8jUtbU9mtvWJkE59V1KbD?=
 =?us-ascii?Q?VHk0qqViq/2u9IewxC0Q0C9j/2guAp6dj4FlshAyOilQi+mpEuMwMUT8mg+8?=
 =?us-ascii?Q?JhIVpWB0vA0v9FNYFDnUocpuDlkPsNFoKr46iUi/oxPqWeO5JYdc9J/98Spr?=
 =?us-ascii?Q?4wQuHNTf5Prr1xcQSu60j0aTTGAWnG1qkIibCpojntrqWaN9pOGYq0YW2cU+?=
 =?us-ascii?Q?sXqrq3Be+SfXrsAXYZ8+c3uOwrYSNViYnyItSEcQn2c2HrKy3Emcut8eh3uB?=
 =?us-ascii?Q?sjtP8pZcR4F7F2lLsqG498CnjmRf4aCOGzbcPdIvbter9foqm6kt1lj5bmJJ?=
 =?us-ascii?Q?VTs2OPgX6oXN5TegokM8548lxBMpLmSde2UmlybinbcI4rDGfdRoZOWgu6CA?=
 =?us-ascii?Q?j7sH7ofJ+6P+4w5Gwp/nxo0Tq1BKJB3f+52AEQ7ZkRREqi3D4MCLAyRr5/R8?=
 =?us-ascii?Q?O6cfOItFK7wlwq6Oe37HThpheZxKA73y0TkwbXjfnNSntBiwxgBsFA+vIKiJ?=
 =?us-ascii?Q?aEezVt37IzCTLZWOhIybhTCmwGNuUzaSNjCMFaiFXMRcccFJIcB6ZSWyKKAs?=
 =?us-ascii?Q?b4RwjK3B2BOfz7/XEOnS+ydbKTn/Ikp4CgxjxYpvY8krTIApJaD+YvBkjHrV?=
 =?us-ascii?Q?9doIM7tKx2yxKJ6N1TBDpbsnA5qS9dEQzThkliT3YWLQtUu4hW9e8IIEgWM6?=
 =?us-ascii?Q?7Ond4CLzvFVAngSQrD5iz6F+3Ea8iXFE2TIpxeMQiQknI2LuPkAAnLiZ/KEX?=
 =?us-ascii?Q?kk88JicFaInwz8o2WhJ4wR0qR3bo2BK8mHhGakSYm3JyoxXj8oLzAawL+utL?=
 =?us-ascii?Q?Dto8eJg9ygScZj9rtsqDa+C7HyfqL7aH4y2GAdrJv6TY+xB2+Omxz1er4XgN?=
 =?us-ascii?Q?vW3as0BM8JJEleZPAP7X+Kw05JmmUK1KWEjchYTIsMXQSeokvUoR16qjeTjs?=
 =?us-ascii?Q?vkRsZNUeDwwaMYN5YLbzFpKpqryXaArhTMM5xb8JV+HlzRawttgygtA2XGbm?=
 =?us-ascii?Q?AuLxMMNTUeGmyrrpUopD7x0PNQ9m/RYMsvY7wsPmsJCVZ9l/wSDsbfXgxu94?=
 =?us-ascii?Q?U1lOE2BPd1FN07gdg7XbH6Vsh/IZZNsNfspK4wVXwWXNfxQjqupn+vPmYoKi?=
 =?us-ascii?Q?TuuBR+9v2VW0bdfpZqKfseTmXJFeqp3NVkhQhcjfx+LU0prpS57em2J00m7a?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5b5d9a-3ce3-4aa1-71c2-08de12271766
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:27:03.9664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHCaxEX7czvrTcxbI4q9H7wBpZUESVnGFlqH9QiZMkI6LJB1bEB7r1Sz4Qkb3tl/NVu7wCE5iIph4Pe3CYHUFsobofGh0vrzoHjRhv+vaUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fa1109 cx=c_pps
 a=cLI4zmX3yytpP84iY95SKA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfX7P3DeET3WzGT
 Xoz7BIojQmF9LH8VwTAvqA3UKvfbWBy9OhMu7uC5OV493wY/00U374NgkZz5ZbTUK7wrNNGzFDI
 mPdVtlJuOE2xZBTt3ZpueZ9nIrB7WpsiGzSNehP3gctrVsc1c5ydg3NpkYHluucf4YQ98Ip8YO2
 Ao9R/oW/cXFGGwt6jDnjm1KShpPEHE5WyQI7Zhc+YaFqLeAQJ9QJxHmMJpiatRvF2vSUpvVh/SY
 msGH3vOZiafRC8s9Yi510b3SIlKX3OuGORZYQGl4CLWcq6LSbDp4A+LExbXEOzxt7wSjDskOrtD
 KDHiEkTLC/ccuecvSoArQUEu7bvcb0P4jKVNyu1FgzWExj172r5hUaj0CsD6mOIX7XTGrt4pHik
 2JbPVqxpM4s4rmIsrdbBRzz7Zc7Trg==
X-Proofpoint-ORIG-GUID: qJQnWupXhQT4MLvYrD77cySQP9Zexx_X
X-Proofpoint-GUID: qJQnWupXhQT4MLvYrD77cySQP9Zexx_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225239

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process expects the Rust standard library source files (e.g., `lib.rs`) 
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust` 
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the 
  `nativesdk` class, making them available in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 0319d73b93..4b9107b23d 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -54,7 +54,11 @@ do_rust_setup_snapshot () {
     # and fail without it there.
     mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
     ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
-
+    
+    if [ ! -d ${TMPDIR}/work-shared/rust ]; then    
+        mkdir -p ${TMPDIR}/work-shared/rust
+        cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+    fi
     # Need to use uninative's loader if enabled/present since the library paths
     # are used internally by rust and result in symbol mismatches if we don't
     if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
@@ -288,6 +292,13 @@ rust_do_install() {
     rust_runx install
 }
 
+do_install:append:class-nativesdk () {
+    if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+        mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+        cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+    fi
+}
+
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
-- 
2.49.0


