Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C80C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 15:10:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11877.1783609800458262110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 08:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qogMbPfS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1650c03d73=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EdOto2502215
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jul 2026 08:10:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=oP59s/dem
	zYyGp7DL9RicHnCxwvgoqn3+u8Mipca138=; b=qogMbPfSBdWMzhwWntURr1mVd
	PzuH4vORvMuOuH+R8Ojf4Xb+BijOulwcMWEOlB0wD1RSAd1J09iUwxO4K0fJFpBd
	FERD5QAR1O1di8ZmJCuH5PC7ktO1fgKXqQUmIdj9RmYaOs8dVUZkMrAz2xNaIjG9
	dEnvmhWO+ooK4s70rSm2IJoQ24rbQA8yUxPj4S2BSkuB90P21jNlLACNgoRBPt/W
	/ZzJ8WibpS8rI89wmv/BT5ZNZheD1mUqUCvMbGdiV5bI8338J6df0/M7/l3pouZj
	OwWlzw+iaVrPyx4Jox5hho9iZ7v5eHqTkibiWS8OpPeZVvv4/kRt46Kllcv2g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1ats47n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNSxPnyejglaFwbL+CTxrcu+pl8cx2SSnVk+zPb9HYDyy9Mc7T+UZ5eJ8AN/d82tkWSP2hWLE9gSLbQhfqUkXhtzVNxclNEG/gxPDN/I4MUNCPx97YwIoJ4dVF9B+mwjZ7jq1vxRhohQnkq0cJUE7rNwVILW2C9z9Tjv5C82iTdAQSCQgTwSvmVln5aX/GNIbu1Qdxw6RT5SYBZ7Pd8tu4bo0rynBZGIpXbB5GeHGBXk02bHLAlBHfjVGQRVOCDaWzRbgN86ATl4nCWKhgFNpn+BZYWgYb/TrXacHieacfXNgcgBWqOCtnyBzD7Bxgq9JQ+c0Fvx7Rbn+jK5pH/XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP59s/demzYyGp7DL9RicHnCxwvgoqn3+u8Mipca138=;
 b=GZLMlUuP6gh5FXxv0Kfj2cKfIFgX0xBS+93fV+aA3WkFwvyhHTtHgHYV8+cqJS1xh1HWlU6QwjBRlQtrWZeteVcJiZgjhWn6bJrhd6HKFDjK6YZwi+EcEiBw7C/uqyxT2Ko0TVxcbtaKKSAy61CHpArH7Pw7h2oKT+eD3nb34nP9EEGcWuXu5DoArDrbA+hgvGFU9JN/Iww/mGjHJgX4voyA1YVWtVaaMZ2deHz7ZAI0+6oYg79NudcNIGiYNPde7pV8rGIDPDrXRsjvwqjQBAabO0emwhBnC40QN0GVCKPWxJXpCmLyvMP93lgWcobha7w/NAZOM+YKP7vFGjIb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:09:56 +0000
Received: from IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab]) by IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 15:09:55 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][scarthgap][PATCH v2 0/2] python3: skiptest tracemalloc_track_race
Date: Thu,  9 Jul 2026 08:09:28 -0700
Message-ID: <20260709150930.3068900-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0358.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::33) To IA1PR11MB7775.namprd11.prod.outlook.com
 (2603:10b6:208:3f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7775:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: b0520fe2-50fe-4a9a-ad57-08deddcc2259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	rE5Ip9yaXc3rTk3M10ya3hsebE9dmIZEVJ6t/2OxEMIDsq4b2Xr7I99+Vawm0XUnN2oyrUUAjrOd5J1kPgKTQr3WxcpNEm99iAxQbvLv0bVectM8fWgLlBl8intdEtbzRmULXNGxxo3nYYytq4bsyIM0UxxQCZG6+AKRDD5wCutx6Gkg7tiIiCFHIrCgrLpZ8kqzqnQww5B1iEoILmeYH+YKhzXVL/gx36UDK3G2zj0o61GXA6vKxmuAQsPzmiIHFuIDht8lMieJvje+Jp7DZDt4wPRayo78ajveKrpbfYYpwcJuAGmmkx9tVVq15qsqUJQT1M+1teL9EkCekRl3OO7CPbxr4mDBpcwi7JssYZ1mYnGU+uYcqqwcIUHlFKW/EEDbPlzOF/me+jCNI1pllI41I1KG6TaTZakZjqn1VcFNR3R4Kl2XxLflsOdXrbZeIt2+AtWFCyNVmzaYitfkI6ZQkKxFtXrwZOfUzMDs1WIfShwb3ldVzPhtbwtsd+6kvEjJohpWrcXTII+nU5jI6cxwT5FDPO99w3UyHvEM7Gk9O5+/VxDVmfvvT/6rS0OheG0F6MqXxQmoGlaVMsbkIN7OiI2OixPRhmDiaoEilExtNvmxOmdUWGswsXlJt1tE7xozQhpAlUpa6X3U/ulhpG4pOWQv6nXFji9qZBFklSOhciBu6MRn32mFuVDGFusj0Uuk619XtT6jaZVRzo6MmRnNEDxQtss5ioOfqqx7cwI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ZRHI1bkMhiBpOUNXFOxi4OginrT6LwWLSqg9ImwHmtoCv3mcKiRvQjqjxe/?=
 =?us-ascii?Q?OExf9ErqEP5kSP/8qukngZiZLwroSx00Cv+klie/omYNDsaWAzEx8ltdR470?=
 =?us-ascii?Q?EaON3XYjnVQLVRptDVpsOSEpLrS3FKqUWTTLJjQ0D7QimIzQi5fSuNvkCGSl?=
 =?us-ascii?Q?4FDDv+RSQKJLayhFEbaZNbfmmwJGeaiOMd7YoZwmHEt8zb59dWUKDXUokcjQ?=
 =?us-ascii?Q?Zn88WZiihjTMhS+y74W1GzItcMuc3fWDkTGR9FrTHTWwHJFa/58/KvL/0HSm?=
 =?us-ascii?Q?GrjceCWallJHmhBfwim3YWOQTWmhTNSDgvpAC93d3QPljhz3Ye7NhW5TQKZN?=
 =?us-ascii?Q?oPvDjKm9wZzN+G28oquoBdP+w5bP/TTy39La7ZQ4XfN8C9u5vIeXB9ID7aAI?=
 =?us-ascii?Q?+bMKycx4WLwdsiqyLi5CagDjGc6BLKAaN50p15BT61QYbsJKf2gHNj3Igb0i?=
 =?us-ascii?Q?RnNPOILLKmwWomWnYxOO1RSn9QtjllcLtkD2T9xT4Bypu4n1FXh6HzAluuHr?=
 =?us-ascii?Q?JB2JqwWOJLNgmtkLCh2MSP1uBsX0Xx14qjmsCy9iNKoL8TgWQXja8AXoLrGd?=
 =?us-ascii?Q?z9Hl9FZXmIhTKXZTFV9WWNRzubV2w6KM+9gWLkVinTQj45voh0D2MmlNR2/G?=
 =?us-ascii?Q?0oJ6VSc4M0zB8ZEEUbC78Qpzgtl/wzwg4vLFPlKKTf7MidQp+D00Ujy1lQsV?=
 =?us-ascii?Q?bhdDtECvWdyQRKyjESHoiYNfcjVBPiw7hfPDQGToY7DMRv+AQ5NiHWKru+1y?=
 =?us-ascii?Q?U0G7Kxmbezb2W8q8zp78Hs7ylxRuwBrO2nIAxVx+SKlr4gSBOwV1Bh/vuIGu?=
 =?us-ascii?Q?r0LRCC2gDWjnA6QQd4be4PGTAGnQ3Itao9wMunx1hzZhy7+7rHmUEbfS4w+i?=
 =?us-ascii?Q?IBXAVDfNomIZ/fdpM7Toa1KdFortdF5QDfS8SajFZ1MuBgb9iEsSYrcnT4NL?=
 =?us-ascii?Q?gHXBRCrVMPzp2q/iEnMlg3gMj9aKKHTYIPOva1pZaCjdL6gUokFabnGUsk63?=
 =?us-ascii?Q?xEAQY6mMgncILOrprCAYsZZFgRFyCXgYRZwPsHv6TbizjMKdqqSUfVUNxnGy?=
 =?us-ascii?Q?PH5Z3+oKy6e7L7jb3f14KEvbd+D3RHMWM5hLcFSGRisQUwm9Asen+KYlfP7P?=
 =?us-ascii?Q?HX9ujzKPUqIIFkQgZzOrrIH1bwBbso5QM0aqsfdkjcJdqmD8yg9S2MWoQCn3?=
 =?us-ascii?Q?rU8la/d6a2jwNfbKqNEPZFqk1LIWSunVcYdDWPazyajxuVKka2smxbGHvF0x?=
 =?us-ascii?Q?HNwpwDvgQCVFJBZOIdKW67OQh0/1MILMBIM35qEP2V8QsUW2OkfBXj1ZHJFN?=
 =?us-ascii?Q?KZsIdc+l/1wROiBCozDcZdR8M9OlwasnlNh2c2HI3TaWhBsYVjURu0IRNEuy?=
 =?us-ascii?Q?MY320LosxAJm9+H6SZ1SxvV38igQ0pP7APiokF0yOm6v6YW0zjV6ptBy9PWE?=
 =?us-ascii?Q?Y6xBzol7OQa1BXLko8tQNJRWOvKHsSPqpgolgy8KGlLyGg84zPGLXocDR3Mo?=
 =?us-ascii?Q?xu86SubCHjHk3YUviYtXy+FAK1bp5FHczWht5Mct1DegUSP+23uQdcwsbDzc?=
 =?us-ascii?Q?uVWJvgN+Taz3qWKshv3REQUxO4vywr2D/+14n+todNvM+KwMKnchF7kccaJ9?=
 =?us-ascii?Q?2x6kD5xIGySy99lIr3zhcYV6Pwc3HLpYqa4GJE87x8C24rqBXzUivbL2wJYt?=
 =?us-ascii?Q?jNwQTULSOtvFoETdPfRvhTg+eX6yibYbTf1ywFO7bkaO4JEoRLsqeIhrQepl?=
 =?us-ascii?Q?sH1teWcK8U5sKIY3X9Q3AUOi2Fh7jUE=3D?=
X-Exchange-RoutingPolicyChecked: 
	LXaLtdCiYfYUC25iZW3xorceOZgFY0q5R9F6JUY/5hfiONYn067lnJiRac5Lu6qM55FyZFoHHXBLWC6mZTD1lMf5Zzfw7aFkihUHcnWSbpYsiB3krbvX+iO4E3GgoU3jL/KwPLcRL6xgitNhkt7qwKLfVamVpAK9/7YJLLp5yme0aINO6WPAXtAK8m8w53X4U47NN34Fd508FK5Ftgj3gwRS7MB7kt4AoRyGjBLq9xkoKyAbzWfZ31RLc91Mg3CcuU+UG3xHHu85Z64I1/Mgn8UEQwFP22OboJXRCF+kKP5a5YI/2ZSE7WCNpDNeNMv3EWhIDxisMXrrtoRa4+OtNA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0520fe2-50fe-4a9a-ad57-08deddcc2259
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:09:55.5916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe9FzL3XJX9gWvRkJOhcyga0KqdSRaapjxH98M6qMF1K+FZwpFDJcsj7O7cVB8HWPgCUHmSaQt5aOy9TNu7Q7jFlLHqZqf4Y+ueJ92Y+TV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-Proofpoint-ORIG-GUID: mytDqdthsCOFrxHATec4wxAVZxI5643a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0OSBTYWx0ZWRfX9/2vfjYac4KE
 ckBKIoRZ3eg7CWRZPWfnRvPGzJ9trntSq+TDhrwuxEsgxW9hLrnM6uZjfrosudXPVexMh212u+s
 OAuRI5o+9OOi5PHQGGjBQSuFIUlgVOKKPRjg3LuCI8VaVqNmV6zFlOYBFUYX1eN0yrTU//p/6sE
 LA9aX5XwU3HgrRiIpNJBsMyoGFpMAuQLiqSabri7gLD0YNCa1tKzwomMn64nNxSyD5m+FXnlKOJ
 hY+kzbOy8A74tZoYbFGsSXhV7cqrvjVB4H5+1/DKVEVgkjmaT2C6xolWuzcdPwZNFIOlCZ4eBZG
 5oBDS80KZRwWMFuyzgqU4/23P4qDF7lMd7PKLCTH+f1i4R5FICeYaGxfXYwunZnW21a8VJ8Wj/H
 YoGdmu+qtOUx47qVweszRDC6rut5qNeWl38LHeOfmDdGw17XkfXk9s6bGWankNA2dMsWM7smyn6
 JZ9Gtw6QfytdGCfnJpg==
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4fb9c7 cx=c_pps
 a=nYaA4L0hYP7ZHAKl0WLIGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=U7pc2aMNb3km21bMqY8A:9
X-Proofpoint-GUID: mytDqdthsCOFrxHATec4wxAVZxI5643a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0OSBTYWx0ZWRfX927fRT4xx8JR
 zUeJf+kQeK3djGaClYAFGhGKnVTQ1Ur36txjlQdeqQmLc/LkGzCln7qF4AviNLr5eugu/amitUV
 vyodozcDY8yBzgO6VNUCgFUR9JPPJ95vazXxKgQyrnvKl4EOJv8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 15:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240583

This series backports the changes required to skip
test_tracemalloc_track race on scarthgap.
 
commit d9a44e7390 (simplify ptest exclusion list) must be backported to 
change the format of the skipped test list since the skiptest patch
assumes the newer format.

changes in v2:
- Split original patch into 2-patch series.
- omit the removal of class-target specifier when skipping tests for musl. 

Kris Gavvala (1):
  python3: skiptest tracemalloc_track_race

Mathieu Dubois-Briand (1):
  python3: Simplify ptest exclusion list

 .../python/python3_3.12.13.bb                 | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.49.0


