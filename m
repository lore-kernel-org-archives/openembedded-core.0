Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A73DCA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 10:25:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6070.1791368729959637903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 03:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l5xx5dWV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47405e107b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977lDQ52564065
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Oct 2026 03:25:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ALgw0TH8D
	he1mhlMrFET9cz9/cV/jZjm//nQnohjQbQ=; b=l5xx5dWVyslHkNEFR1vWF3HGv
	gfDii74CFfEqfe7eqXHbkFKuKw32FUAKN74D/Dfa2PY7voXUIWUoMFbC6ZxhRJD0
	fM0keHxgiAD8SlGtPP/zaSxzr++xp6Ade7M1fcpk0ns1cVIYSOJKZ2jqb0+vZZS+
	e4LHhHQsQNBe6sc4ZpOs0cis4ZnU7GQqFRDWPY9CtYDFVkyBhkrG8Ifc6pXMX/Sn
	9pVOVJAp3Z2/ZsrrYHemT9BtGepyvo8+iU1uI7FWvvQXTZphwhiyEQO8rFvFZaMt
	TS+EV3kvJUDjec0Fd/f+rkZo9j+m+2sbCGV/8JVjkmMyI0NiGpafez3c4k7Dg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022134.outbound.protection.outlook.com [52.101.43.134])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h2w015bcy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 03:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyMYw2slui3aBFgYcVUyQhybUnrd+4FNyz44nqYRVAe9m+22oHoMVUnU/xnWFUa5YrQ/jf7iQYyve4D4X26iASpFtBfrxTC6U+Th4lXRbXuVKRUshk7Cp2SPny6HE/YbSa64oVwDxzn/K/jmDmhDjj6V+gC1Pk6AcldfXdywsT3lwubLcxsOycXRK3s0kgDzupBm9prLgIGrPqbEf4TRsgjGDA8O8yc4p+b+eUEN5wNFv598FuDSlK0M+igxvCrTMo0AHVWjcqupqoYAoDBy26bZDkxziD7n2IaJhG7w4fAvwzyrx7/n+Qk2CgU9YO9HBTdyGrmQssMaTrzfNUe3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALgw0TH8Dhe1mhlMrFET9cz9/cV/jZjm//nQnohjQbQ=;
 b=d2zh31wcQUg+7c+94wpqBZ7EDtyjY6rQRa4M0Suy19ZAGDoxaacn7y8leuLDHNcskVwVOuCFj2beCWDS/zGI8HurUA4uHaY/uyzvYJ/9kMOumFmU8PqQ+gBd6aW6lWDmHxsaTMYr4Xq9RuRmblRYnaIOy97jsStftZ+4dQvx9buNzDpScO7kyF5iYnWGu67VzUuxp9h215wpFdcaZTMXf7bmdJDunZ5iv8vLHH2yrD81Mm01QG1fDnEHByLKwDC9M22Z5DKKdkEC+UqaJBrgnHHGT23QbHdH3Al/fPGci42t0lvQV2XWPs1CMrXEg+IfCo6XzXowJDOO7KLKx5q16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM3PPF195D11F0C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 10:25:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 10:25:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH] glibc: stable 2.43 branch updates to 562cd7badd
Date: Wed,  7 Oct 2026 03:24:42 -0700
Message-ID: <20261007102442.1180223-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM3PPF195D11F0C:EE_
X-MS-Office365-Filtering-Correlation-Id: b24beed3-6791-44ab-f36f-08df245d4e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|52116014|38350700014|11063799006|56012099006|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	gUdwKQZ41ZD8IhW35wuX+9U5xMDjlz+tdsqOxnV7x8M1OybJSPkJ3+tD45F1jwepm+Xvbo31a/VCIccOpfQE9PaTottDF8scN1TedRzhKmLYCKdsuL9qgNyJjDLqa/nCMdKjB+uiv4bqry/scQvjDq4prO8gqEdvA7oEVjVFRvSIS2mIwzwG3x+wedLcEngoDdYsplmnhekP5v73GWvtD7AWVjd0pojxdYp4568A3spssoC1KFeAFRkWAzolENKgh2y7wmqBT03WpSOYo5nWc7vfqFAuZLiOCtPAMQ6DOJP2LVmLDkB3Xo6K0BWD0WQ/axCxGMe5ni/JhDRSzUO2LfL7YbM3Vgvdp503OoFsF2A9KwIF6TBCIVYBU3tjWS9qT06iyflqgGB/jx1T1O938DJj/+VLetUanMiPt93JkJlVxyN21eNK1FryJpQ6nSDPXjwRCVzvnJW4TXBfUq3ZQt/Xqaw0HNe4BoYPVklgtet5UKgq3VJ0b165ky2ecTvXOpRGnbfeedf8dE01k635gx2UbY3kVLEj1m/lMzbu7GtX/ZIbFrGSNO5JlBXvxWyPIQzhfbV/8lmL49A5CZdrXfxN2TllVqRwqfuEwrwdgIdLtiZe4LXjrSAYGWYFjQuDtsQDb/TyrXbQu05YByg65vkVYuVp3ffjQb+96bgfKblnkNJ5vUxXA5BgBouyNCBWv032aqRBTZ0o4Eyv5Bxnb3i9M1D2/RmWb9xH0r201iQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(52116014)(38350700014)(11063799006)(56012099006)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LZ7IHC6ZNx+5LMAFRBH0pff9i+i1/U3I4przQswcpsyyrlp5d6o5LzrQaoUb?=
 =?us-ascii?Q?HIz5frD/N6kbKpujwOuVs8P+CW3uiC8YGv3Q2Svs3j9bS3gKZFUJvvFBNTSa?=
 =?us-ascii?Q?sw+V6yct6KjdUJLEl1XJBzfP2vuiJtunHQAAHdSMuTH+dJvkqh59eWOsdHFX?=
 =?us-ascii?Q?MH8op9R0BMnTTJUxX1E70tend4hAIRDh1md5lWpY4ftOTWcaLsnVcuelfmm8?=
 =?us-ascii?Q?63M1VF3XJ0kf0oJQ8nun85QoHmlwf2pBHeYIuhtiQ5FGdcQMWT/m1kGbNAsJ?=
 =?us-ascii?Q?CCITA2OcaIS6vqrkZcbuHTjmVKqXlol/simr+SoZDal32m2Ccv2JF7xsEOT+?=
 =?us-ascii?Q?r/WQTxvYePtDx7nmPBw8SquQzgz445vn8iwt5SqC+1+PKY0ddZEtUyBJbaO5?=
 =?us-ascii?Q?SEbZSidxAksBs2woONqgT8JQdAB4w2J9p/Q0I78P7Phl+Og1GEscQmu9XFMA?=
 =?us-ascii?Q?qEtLwKkTZGwceyIki/SF6i08xLRgzbJyvoY82PWpBobwoJCmF5+0a+2z3o5U?=
 =?us-ascii?Q?B9QezkFWW+PbuxMSuMRyvmnMoYlT6YSsq1z6UjfUewviUhLk7mUosAs7nKGr?=
 =?us-ascii?Q?/lAMG+6OXQWAfjwbqKwmS1piT5kfAlOXeFWJwv7BBijsdJ4ut/k1liOGVWov?=
 =?us-ascii?Q?e7dT5obq0xGf2YKFa3T+lm4ZatmYd6VLs1sk6Ke2LQMam7RJ01sudrILqa3T?=
 =?us-ascii?Q?S0DBYKRmMH6nN2Fx40aJ53EqtwBLrmC+Z68sZndt7UqjK9VPjtudiQozhQiA?=
 =?us-ascii?Q?25pkRcTrxTpXGssHIUHuTr/nCswfw4wqXOuufEcbOFILsHEdChUSEDoCSOxi?=
 =?us-ascii?Q?nw15+YeeLf+R9wxj1HiMtyQXcOYTQrYNWGpz7sXUEwJg01nrevKcskoEwBv1?=
 =?us-ascii?Q?O66r9EMWb0KQRRrwJF6CbNhD9lx0elhYVz41X6c0J5eUtCBMsaax9/oP2QuH?=
 =?us-ascii?Q?AgUBh7VWoUD5GwDu2zCP4Xg6f6hL93g/r6F89CS+fGp+OsWVDgFHi4Ns42d9?=
 =?us-ascii?Q?qeJCaftiKOqsyx45GnLj7wFQtI8xPlkKwDD4+cwjNFRnUts/75gFTr1pov0D?=
 =?us-ascii?Q?dkuxvlfpTChKsQyF467C7rNejaDgF1XFlorsT2kWC9E8RB+doQwRnX2MM3hg?=
 =?us-ascii?Q?R5pcWAITojlWhj9HGHNl/5hVGs0wBBvjnADYN66n6O5nogN0EZF5DW9+wvqD?=
 =?us-ascii?Q?XFwJfrFrxblJgqZT8HMr4SZ0cpBbWMQdeK3RL6SucitJ1BnBOQ/ydd5r3Bu8?=
 =?us-ascii?Q?eOaUg5CJbI4K9VlbUgPVn3FRgxVCKPP9ZG07rGf/ynuUOq4vTgPt3ASzMG2E?=
 =?us-ascii?Q?ijZCUn0TqXuxP2cehrlk39bFp+/vgpJGzRX9XW1j7AZadELymeK/JcSZLS/S?=
 =?us-ascii?Q?Fp9rT+AglBKkMbIzpE5EqW3beAZyP5GheVs5VpNLoly3amHSIwgq7rO7ehAd?=
 =?us-ascii?Q?j7CKAzSJQjl0gkZDXQpcUa02Ag4CWqAo12RsASKl4BJCNiCi7b1Mp2sKFCTz?=
 =?us-ascii?Q?Nnk6re3GR/dZLsnX98ukggOw2P8im3gyBIWJ+BZgLjXRTpW4BVBouveC0ucV?=
 =?us-ascii?Q?R3n6+K0G8LwMVq3L8/TNGxgoZ87MuR0nCHbJ2Fs51Z2jPgvoLh8aH41oEYFc?=
 =?us-ascii?Q?ekTTC/rFY9mPV3XXOhPMf82iLX3A5/2UK8zsqULX2M/QwkFBqXIWEhctdEFh?=
 =?us-ascii?Q?zP0SQ3MMhuccRZTJHkxgZdrlNyPuGaAV8ipa+SAbIaVOCusQ91IrSRLez8kQ?=
 =?us-ascii?Q?s1M9GAQbBPpFQO16zPnMdtKeXEI1/uE=3D?=
X-Exchange-RoutingPolicyChecked: 
	CF/z0D/Ztcv7rn0F7Q6SOFSAqKAHrAU3yVsb7OZhfPklhXRl5333ec8iAa/SjoLYV7j9W2hKDLsOR6cpKak5UnblWsQiA4tZ/f3GLLkkQcVw5b2QYREmSZcwlnJhVK//1+cNrG6rhZOOyBZKhihoaWu1oaYAuv3DCz/NsZ6xMy18KrRLXTXpiJmY3WszTKekQLOS9h5gAAWmGPyfw07xJl/dwaD0qhFZUOa08uIWPqruXlOufa21zOcxy+M2/7LTOSNqVmkFadAHegWH0oLcz0sfQEZyx1osVxwwftnhDubV4r7OyBg2T5BUb7IdZc8KLHjWOYOMNRzbXRb4ZxyQYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24beed3-6791-44ab-f36f-08df245d4e18
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:25:27.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llFDRzm9ZxZObTtdFyt61xGv9FiY6YL4sW8Pq3LrKriS9FoELYLl2gozUMeMmYcvHkvHU1R2k9Cuchm/Ws4JHolvy9/S+pu6/yUmF2guk54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF195D11F0C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX4KHy/xkxI8TZ
 jKDuHBjqt2s7jHUeICXdwVzwj1Bpm8hxzY87aBMK4PDVdOj+slVqSuudkXnWcIsh29n781a2cZS
 V52jjKH752rXaaBrWSABAT2VXXGnIjsxLLbtzyH3nYUTnNPRsjDS
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac61e19 cx=c_pps
 a=H6ktR1pBjhOhntuJGWw7QQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=WFWlxVT8Jz6yjtqyapMA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXyO12dlUOvmSJ
 kk3nI3lLyyYxomtCWVcblDaG8uxVJ6JOX7gWGuQUSNquXMc1GugMvtyK0MrB2ouljpi0k5Ca95I
 Xj3ex1x6ifj+8O9HwlUtewyob8v7nLfBZ2BbNXPLiu4Tvr+UvXkHIPTALMKukOZpVMgT8HKso+V
 gVFKAiqf32Hu0jpGcMWeaV1Pd5bm3ZQhW1hHylheHV8ZQrlVCyZzpIiT4TvMEkLhNGbLOV5mmyc
 wNLS3r+YV7gZHTgt3E/bbTmXWFdXHRQCaLX4ISowvVBsmQpjRUYZN9eD39+U+AW/+A0Kaeb8U/4
 zMBEN9+zsm2caVLC5lcx+jkJTzesVTvGu0Zz90pjwKENPfhUt73ZJnA0XMLK0I6jFxqI3uYR4tj
 JAmVDlldGBl9wOKOzZF+6kh+L8p/KUQKnkyeqowjnaw7Z+g2i01tWYa7swGPk1dgcqmQ3ya+Rzj
 +pZ6j8IhsgDzsd8ntjg==
X-Proofpoint-ORIG-GUID: XJMVO4UOoimFukbhCeM-XT3GmZX-lPG2
X-Proofpoint-GUID: XJMVO4UOoimFukbhCeM-XT3GmZX-lPG2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 10:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247382

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

CVE-2026-89092 CVE-2026-97399

Commits between the old SRCREV (9cda6fc96ab) and the new SRCREV (562cd7badd):

562cd7badd powerpc: Fix one byte overread in strncasecmp (bug 34683, CVE-2026-97399)
533e1c955c elf: Open the normalized $ORIGIN rpath in AT_SECURE programs (BZ 34360)
8305f5b8fa realloc: Fix mmap non-mremap reallocation case [BZ #34697]
e51efbc44f CVE-2026-89092: nscd: replace alloca with malloc in aicache, hstcache

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6601   | 6601   | +0   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 142    | 143    | +1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 560    | +1   |
+--------------+--------+--------+------+

Changes in testcases:                     Before   After
elf/tst-dl-path-normalize                  ---     PASS
elf/tst-origin-secure                      ---     UNSUPPORTED
malloc/tst-malloc-too-large-malloc-check   PASS    FAIL

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5f6863df16..e8e6bb665a 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "9cda6fc96abd035d9cbe68482138d4a78a51a7d5"
+SRCREV_glibc ?= "562cd7badd3f9edd74b68316439f910f6f7c4c1f"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 104d6b4067..07e221eb46 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -21,6 +21,7 @@ CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-20
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
     CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
+    CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
-- 
2.49.0


