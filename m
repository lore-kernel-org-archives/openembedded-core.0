Return-Path: <Roopa.Kalmath@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3931CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 11:41:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5075.1791891708664423538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 04:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jw+OmnIk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4746a55667=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D5dEHG2299961
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 11:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=QojexrJxxYMdURY2q9ok72PwMikwyhrHJK94qHNoC7M=; b=jw+OmnIka4R7
	PrTRwUuDADBe80+8OI3SmcVS2XSEMnBFgeE5+LYrw9DSumPXFWkyMseuVDCOgvbw
	ZYmv/bBSzpwFSUUvsj0zd6oDAFkF+FMdNcONGjykTu4z36wk7U5OpDeXL/2xl0pq
	rGpPZlaV9nnlI7NLTCo9h8d+CDwxGTzk3RiKdboBSn27h2g/KOe6LrfT+68RVvtU
	zw5+FcDdxU+pldVFjKOtBvCylzz0DDL1dLEGzkzJ5ln0GRF7ccpYrL4ygMGujaoo
	VaDUqVg8Hd+wsaf/9Bj90D6dBn6tnd4wfYOOPYqRz+oMY/R7G4VajwwitMJK75wD
	hcH/ZYZffA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020113.outbound.protection.outlook.com [52.101.61.113])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7cb540db-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 11:41:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdGUVdAwsYzN64+8SQ8ZIKLLkKnUEDefdtbmlDBL1XOTVFfYvfvI4FTxqngBDkXuGEQgtl8cHvUC60Suaiu9qiLDTdnkUhaq/SFrz9qskbwErzzWc0hVwJKt7y/vCTfc9ELRLJXbTGpr0zq+/UZHuSAK8hyFYxcrSKAkvzdH847FZHFrIWc+U9gL4Fu+h2AJeY5xjMucFSFFiQbcU6k7causM7Dy5Scn1889bQqWwgeb7GI4EG27kTZRFZHiat06xmUADAwFTf1MXGcNEANV0cpNhHuYUorzC39XXis5N+zhWMNIo6oaW6bDTngpI9kJccBweIi4ez+ikN87kadT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QojexrJxxYMdURY2q9ok72PwMikwyhrHJK94qHNoC7M=;
 b=btZEQ505+RfQQeyJ6r8h0g05hJYntm0xC/NO5JZmEQ61wDozZ2frZqhnKrtG9/l7q1yB4I76itlWNqMBgseWQ3pPfyWj32BmsInOnqAMz9O/JK91Fw6hB16kjL5UQtj+TsHFzgzQVhFZSz/2QE3DXkxOH8j1mgWA0XCr9CvFcPjKcoh+gc2ScZllQUMVfZdxkzbMcFFVI+YrkrKR/6EjYB125R6IWZ0p12oIi34aefQ/1rPWRjCQw8hCfTlDODwz8RijxSV/I7CSAA07ToTteZuCX/FzAdWb+wE2VcqhoQPoA8HXp/iT7sXPtPxQoxMNA2RtsMv9IHBgjE1iA0ZDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by BL3PR11MB6361.namprd11.prod.outlook.com
 (2603:10b6:208:3b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 11:41:26 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 11:41:26 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v4] u-boot: fix CVE-2026-29009
Date: Tue, 13 Oct 2026 17:11:06 +0530
Message-Id: <20261013114106.2090607-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20261013095833.780884-1-Roopa.Kalmath@windriver.com>
References: <20261013095833.780884-1-Roopa.Kalmath@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0218.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::10) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: e6615eb5-45a9-43e1-ff21-08df291eea2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|52116014|366016|6133799003|22082099003|18002099003|10067099003|13003099007|261009223027099003|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dicMiyYQO+0CJcHjQ7RL4JaDf7uXb6/8sM8pk5amPB11Z6BYr7JfXoVfkdRtC1GoRwmlCMMhBmQnFHfm2EStpkw/ZgoDRdGGCU5I53hrcOEIai6OnoAeC8dqN9pMSbWwvirfl4o21kLFTcbDX//4UU3ONrqYl1vZucNiRocJnuriyFXZlggKpViem6Na2RAhElKrOvWo7esL+DlLlg9eqfbgKe3WueXzXQWU98QbnGANQY1TVvApSpOYHt9dOGOb96A7lH9nPfNHqSIcmnpqF/83+mtvPGed1ViHgZNoGaIgQtqwje7zXZYRgrDVpwFzHEE/wzA0YblwOsJpQnG1yM5rio9cayVK78SesNvnODIDoEVkgMCdpSATCLSB45S0vmOXtvKUv3x8LtpBQL+E2O0gRMmEecNVuXzz5JiVmcL+3dtMlr1dQySoWUv2rkdXfTIJGk18T8QjhgS9UsIq86RxQhBUACQj2VtJTSn+e4UNp+Evjj5QipSoRzaXs/nbrJ56o+Fv+h29uFCDOZsZJ3rrTTTTNh56Z0GRRNH1EPrNq/S5Ui8+eOle3XK3X66OaUdKIjfEA6HADmwdTYats1yWs07K401spyk/v2aIFfYwF8fRzN1iKF+WJWyT8Bp2UOFGMpCbzs75hzgR9odqfyI74q9RnrIf4UCjP8JSpYk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(52116014)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(13003099007)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5bVBKQIJQuUUo87r8lAgmyBgs7XD5wEAKi0Qvhiz742hMVkP2jpwUUuMwI9o?=
 =?us-ascii?Q?I1wcSDTo5V8gutOxgcughdUg+xEP1yJJ0PQwWjws16Z/XdC0/PMxrUQes6Qu?=
 =?us-ascii?Q?25zyzcg7J3U2D0cRbaYE6Cj8gKErqGGTGgezgb5iEDpsnYTzITCYePas2eh8?=
 =?us-ascii?Q?mqNEtuo8mD1CIK1W3ZCOcu/TgqjOdmoXQDpkvnDa6hJ9HWGiF3SWuKoXeiwG?=
 =?us-ascii?Q?clIN+10tkWJjF6cJiWvTK00opYvPx3xApvoYU8uJwe3Yy1K7MBV1flTS05tB?=
 =?us-ascii?Q?3/QO2WraY5L5QuEYUPtcdPXj7aSfjdKwQEyWzJUk3QJ2xRiQltxpZuwZEoje?=
 =?us-ascii?Q?jZqUibPirur8R8KI6a8hbTh0n8bBO4kp8VC43YAiE3ovQHKEfZvh7PyAacVq?=
 =?us-ascii?Q?QHbv7Bjrjhrg4ko2p+m54Sp7pwqJGqGAPJXhBfar4ZCi9m1pMNvRqnciEeAs?=
 =?us-ascii?Q?HQTbEb6X0MpWhisql9BG/vz+Cy8WuzszoHHZdHaIOurbKZqDjeoVPk5E0NBR?=
 =?us-ascii?Q?JNsBoznHUsR5MYijXYLQ22eXXUM3rNBNSjLIZKDBvH7nCYKTaLYo0KXG9SKC?=
 =?us-ascii?Q?ixoZmyHhJEFJ/3UWB1sliUhSUm0x5YGi26bpjqG+R6hlV0DsR55I9l7BiSRH?=
 =?us-ascii?Q?9E6YX3DstHurrGQnrBYkgQqsb82NwdtY+TEuEyRJ46MjHpM8zbvdKZ+MRapY?=
 =?us-ascii?Q?esU145wAlSbKPfLA+S8mTExuUlwdhVyf2A3rrIpfFgL6w8fCK2PKr7J3s2z8?=
 =?us-ascii?Q?cEjEXicP4+o3IsuqbOFe8XtGxuxjhAqPYU6NPtc8Y/6lCO7L6E4D/WhFhdVu?=
 =?us-ascii?Q?0THzvdxXGJHjWnTfIJwVbdl5t94JPD/zaGAQ81OD8D1fGK+wHQbg9bZV5o9c?=
 =?us-ascii?Q?P1cUDbklW6QCX+gJhJ0o2YNwvklsJ8jvnxReixcUgQ0G4ZQBiOmPDqF03VmC?=
 =?us-ascii?Q?KWUn1NsCOg/QpXr6HTAhFEHKZfwo4z9YNa3jxZNbXfUzxzYKxPB2nDm+VOOG?=
 =?us-ascii?Q?495M6Lq7jMzGwh0leDqBjWzeF9xBH1Ssst6IFhjyz+/T5uVzn77rCkg58w2c?=
 =?us-ascii?Q?c2o98DBRutL6DeApfI7eXsvndZKN70KcSvhgFzVUA95eas7CvicLYBulY2Gx?=
 =?us-ascii?Q?C1LETgAIKj8YkZ4NDbPlFO4z0tss+zDpk73+cO8UKTmPmMN/IMFhutD0xgym?=
 =?us-ascii?Q?7yhi4U5innOXJxovmsin/w9rFt2o89QnJrPf266fZQzNVvIjLNjXqcIy03Hs?=
 =?us-ascii?Q?bRFlPJMqiqACiWF7rXazTucu/Lua3ZB9g3stbY5Be6wsV7RGEyDIefwsK46E?=
 =?us-ascii?Q?ScWZkVJZ/TxkPcxD5kjeBjjHAwskfenXTk6JwXuFu6wwaF3UYYe/4wPD1A/R?=
 =?us-ascii?Q?oXhCmlPU0sp9QJAcLzlw8Bpqy+J2+hXYPZDJp4EVh7fzgmy7ICeKXP0Lt2q4?=
 =?us-ascii?Q?IbxDoVqdMhk6t9VJCQKCqyQda1qM4VIcTQEqb0r98wTIlybZYhnwAKEeeI2e?=
 =?us-ascii?Q?+LD70f9tFNm6h/ef/cu4c4qfiOy4wP/lAdn3yeiMAq2a28zeuXzmUhFUfhlS?=
 =?us-ascii?Q?Ijgb1CoipJnaykjj8sXl3tg3/iij6rdqPsgJfASSGP/EckzCyIr7eKudssDL?=
 =?us-ascii?Q?INtd+JAbDpvv7g22AIGXXDyxs5pG2t5Bqpm+thnaOuxJsOcbJoHsU972vQ00?=
 =?us-ascii?Q?bLrwQfz9etJvncmwlvscXwNY3LKQ7ujOgRcFb/GFp6StlWSKFQ3aLnl+V/eN?=
 =?us-ascii?Q?xe/5CUvgekf0CAgsOKxrffUizD8MJwA=3D?=
X-Exchange-RoutingPolicyChecked: 
	IA5DVuRYnZDcT6IBu4TsQfh3gRdaQSjpl4Wp1oMv89pSoCCCaPjTFYzOmdxLDjxKOuAzIqur6hVm3jbQNwlNRDHEf/XbS/X+bTWaYZkItlbZQepF56LN22oq04gPDDMFpMj2pgpVTBVwKEY/EXEuor0E1ML3rDHHKqbxMMX4CqJrhB0ngHBxfhVCSoCqi83pL8vqQSH64zPgtZl4aAnhZCtshb/LZk8wkHfc//plb/NWkSJOkzQfTDwyq2kNhTw8X5hwBpY+wygrA8N63T//smdrwd2ZbAHz59N8hAUddheZvA0WePtWt58+Vpl3T+3Rf20DOX8cg33kT2eQXIk/wQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6615eb5-45a9-43e1-ff21-08df291eea2e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:41:26.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+jpZ1w1N6rbTn+F2XMQcrO1RLD3S9BFNwSnULNY+U7V8KdcLIa1x+xgckU6fSvB/2Y0fmJRB2Ox0afsxWjSTsTP6cVTF/G2F+PwLsG1uSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
X-Authority-Analysis: v=2.4 cv=K/a3jCWI c=1 sm=1 tr=0 ts=6ace18fb cx=c_pps
 a=CAOigU3XQIFPQhMveDrRuQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=1VxDqnHFAAAA:8
 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=azJBALtWKwJuP8R5teYA:9 a=aZ5uHUMKh6B-zo3GvD48:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=NLIdpY7OFUhHErZYHOup:22
X-Proofpoint-ORIG-GUID: q_iCnScR2ixvkHiUUmxmJFM0XVJw1EmP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfXzwQ9ZIh4rg29
 Zyza7czQcv6sxoH6zmDeDqOjbeLduzaqX2gGn84Q7LRDPobrCuK5fi6LpeFsycyhv/yRlaK+tRQ
 fFicFezPZfA3VWs8Jc+l1/bSoyuL0GV8V4oVZX1RTXVPO1adydq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX6ZMT48VYaKgj
 4dLcxI4ihe6OPK5KsklVVQBCMtWeicE8P1+1mcTJa51HOJNEvhJkC4LPnRJ5P6qqqFdDX8qpFfA
 hDTo/v8LmwV7TPnV7s/gss7raHejqNs+awgJRpOAdKrpN/PiNSDc4pvpYy9IyUk8TS2sKKKEPkj
 iTV9+/gAEDXJRAwof9wwPSOmW8RZq5bfuu+thqr4w0jbWm+xFJEpeLq1D7dsRurrdQtm/lNVbED
 k4vHe5RSLNTodNWwSGzeOCsk6s/1wN9O/xKT70INkk8VZd/lAUB1k4vduOwQAXTO+FnquZhWM8G
 m85jhDiWylsAn1FT3veT13T3SR7zhWyojsNPCLptENBhUZVje+qrmGI3mYDrlIZnoFtZ/a/51FY
 A0k0XGCiDBUPhS8jDua7yxhpVvcTUQXvT/t3rAzpthzljrUax0sDO8Idz+022TXBqYU6oY0H2Zh
 i2wcKHskmrY95pus9wA==
X-Proofpoint-GUID: q_iCnScR2ixvkHiUUmxmJFM0XVJw1EmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 11:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247722

Backport commit[1] which fixes this vulnerability as mentioned NVD
report in [2].

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc
[2] https://nvd.nist.gov/vuln/detail/cve-2026-29009

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 .../u-boot/files/CVE-2026-29009.patch         | 53 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
new file mode 100644
index 0000000000..35f168005e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
@@ -0,0 +1,53 @@
+From d6694018eaddefac6aae974f9cec72fd6e58f1bc Mon Sep 17 00:00:00 2001
+From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
+Date: Thu, 9 Apr 2026 10:44:40 -0600
+Subject: [PATCH] net: nfs: fix buffer overflow in nfs_readlink_reply()
+
+nfs_readlink_reply() validates rlen only against the incoming packet
+length (inherited from CVE-2019-14195), but not against the destination
+buffer nfs_path_buff[2048]. A malicious NFS server can send a valid
+READLINK reply where pathlen + rlen exceeds sizeof(nfs_path_buff),
+overflowing the BSS buffer into adjacent memory.
+
+The recent fix in fd6e3d34097f addressed the same overflow class in
+net/lwip/nfs.c but left the legacy path in net/nfs-common.c unpatched.
+
+Add bounds checks before both memcpy calls in nfs_readlink_reply():
+- relative path branch: reject if pathlen + rlen >=
+  sizeof(nfs_path_buff)
+- absolute path branch: reject if rlen >= sizeof(nfs_path_buff)
+
+Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
+
+CVE: CVE-2026-29009
+
+Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 537d4c62..9b628ecf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -698,11 +698,15 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 
+ 		strcat(nfs_path, "/");
+ 		pathlen = strlen(nfs_path);
++		if (pathlen + rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path + pathlen,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
+ 		nfs_path[pathlen + rlen] = 0;
+ 	} else {
++		if (rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 9610d9e8fe..8dd15cf9cd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-46728.patch"
+SRC_URI += "file://CVE-2026-46728.patch \
+            file://CVE-2026-29009.patch \
+"
 
 CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
-- 
2.39.4


