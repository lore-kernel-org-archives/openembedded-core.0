Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F820C5DF9C
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11730.1787618783946408363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U6dsnMya;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0jnuk3986794
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=; b=
	U6dsnMyaiyhbaGxxMSxbpPrPwosKbUL4ytKCa82ZheE9OCWT10Qi9flpHhklUBwO
	uI9ISerMu67Ml9DQBP7uC/Ncj40ribNnzRQQNpYZ9vHpaqlohVPF5D6M0SQvqTZZ
	GeA1Oth+4sDFRBNV7X4iF/S66DK7sUKjp6QZA68y8hnCsc3QrhQ97yiemgYRYYst
	AtDLsOs23iIM7o3K83LzKaP9tdZb612lbu1J5RsaMtOvTJtlyFhRSY10ppNvgkQ5
	g+2OODlMVueEQkHiM+BzRjrtIHowzFX//+elepK+60a2ZeWYUeDxwR2/nIJRi23i
	dAOXAlPJqltOEjk56Pqu7w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020085.outbound.protection.outlook.com [52.101.46.85])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6unmx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCVf8crUJTf5h6gqKWnvkDJtjJyJ382AAS5eJDx4od2MCh+hLEVBRSiZJvsL5GuvHVXHIrI8UrHP4Pputlqx4qB3xuGifJAx5mgtxTVk1ptQIB7xgyU+NdfUpFH4/RaT4aoBURiGixLDQXPVPOgW5YIjeHKeicgF2kGvLRSmt3vTN7HsD/CHJXBJdeoy8G0j6TpPshkMxxVo/pIBe6/47Gof8BnN2llGQyUgaUHPfOR91poDNPehvH0A5N0+FQQHIkEkeGVv7R9zqVka2o77vlxa+5o6AXYrVXxkth8ILuA9QzKQPoav2zw1ZVzB6ZFAMc55gjf/LlMEK1ZndrWEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=;
 b=hFppp2qNESwF/PiZ9AUNkt7yRVDB32OjtAKhaiq733pmfi9uTPNly1QacgdJqO0rAhCcuZuGrU0PrM+mRrTHswh6vK1x3VPD9mj4rTZ2ekeuZ/CrRUAS5oZLsZiGr7kXOtwFyQo3bkww/zMYlnUpaVXko2aGTl6WE5vuQDcMZJjF9/lmEb2ZbxRgvdpFiRpYoEyhSctmzfus9UwB7CQtFsaUJIbN20P65psyxvENj/+vDxdknZIjUpDzOqqB9sQr/wQhQd+4SxUwdzxD3oPNGB7R/091iZ5JCdM2VplUlDEJQWYPj14wV9jVo5pscDfik1s6ZyVm6uJEpktI2cA59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:20 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:20 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 12/14] lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
Date: Mon, 24 Aug 2026 17:45:49 -0700
Message-ID: <20260825004555.4111831-13-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bdf191-0a51-4458-a5b1-08df024247a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	m9MSr7yN0lsEiUsHXH2SXUGxoa4GSR290d5SP2HkdlXKycGTipPL7DRK9ypcpUnVwNZwYGu0FK2tJ6XMmqhWGqaYkeWklNwCEBoHkMycpKWyV+4YEa3Rf+xAK/uNwn48+J39rFqQ0eLk6OwlYB1atq73ty+p9dbbS2K50gnFREJi2hkwauVa/Op9PGc9dwLdoNeHnOAiYxdY9M7AnN8E6Q6QZWc39OKyiLUWUaTlmveJ5jZQj+oYcz0en0yMwaUdJnbMZM+vUXSPzCjeBV7Y5WagWuh3rMlKTJVOKfU4AUIthLJAN8q+PRIZlNctG3wDVHo9SeR1s6X+MQGfImnIeTlu2n6/vqNGjPmXZKs1Np3ukvzS2Rv9X9M/xe2Stz0olzTVkB4688Rl9IDQi1fODGhE1tK/MOxMWVXpszmflUlrD4Db/XZctBEMXMuKpP7ORU4K/e+K8X2owuh68HydJ6hMVROeyNAq4V0OcQqQfRGHW1KH4cUODH3Bvd7zgSFC8Vl4qrHfA0k/pQUjISHdiGPuYFXfHT1eKjGk53ZaIQtjv716H3tUSMlv8I8DqRfAIcp2Zvr++j2lUENlEfTsfI/sfgQQ3sa/HlZxDxgn6el1BwrGmatYlSdTy3nW366TvZnq1thN33j6hIqIuS0sLw3LWqY/FBLn4X1IQGYoWcZ6PEqIJqc6ntVqawMTAf+UHv3NXuslfwU5zSSLVeqXCnXSXcaqIqGj9bkM1WSYlRI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EZzP9UtZYESVd6JTDLENcpE7nPab57ZgKN5j1ZPsp9G+mvTWRBgUgUsyJdJt?=
 =?us-ascii?Q?v5xfgAQezOUadWYyPvHfiECNtv0CDqb9xMgFDMwVugBEmvXsRoLlu8eVVTp+?=
 =?us-ascii?Q?ZVCjx5+whIxYjJfihR2nK3+X+r/6i73AsJCpyM44DAB7/i9+sBEcRQ04ocvo?=
 =?us-ascii?Q?7hYUKl18S1RRHJJqtNkb+Bry+WfxeevREhNGKLoJSD/y5PDq6WS4u2GzCbcu?=
 =?us-ascii?Q?ZU8ogNt5kqDo1kIEH8pTZY5srp0Pf2o5yhQCKHx0GSJtWFrBv+OL6DlS47Qw?=
 =?us-ascii?Q?qSifFuF7orf2+7cFNQSzPE7NeoRZrMiJSg/yJDJrbJRw/x1E/W7V1mnWwO92?=
 =?us-ascii?Q?7mHpVlntABgB3go39dYQ+qIXnq/7Br5VHROZhznBaMhN47dbKaHDxBuXFOEw?=
 =?us-ascii?Q?XbsMXo1eg7pqXOKwRASLw3YTI7ivFsYF7ehk3b991BRynDbSNWvKFOxOmaRm?=
 =?us-ascii?Q?fzoaPnFjXBRh20yZnW3FYAEjQwmhmi1g8vByE4ZI97xNY381BZ2Wwy1yr1+J?=
 =?us-ascii?Q?QzI7syoy8jZWL8L4a0pI9VxCvLN905+Z+OUXQpffKJmvCQRnkPKTPaWmdiPt?=
 =?us-ascii?Q?3J7vFupVN2NSNtYBlbW6IEAo8vPT4X0t7J4N7ZDunesXwOmGRyoQOVe4nhUT?=
 =?us-ascii?Q?6CBqYe370jpbgnJS7B5+XSlKdfoWsmAGwk7A2OwXD4HBpji2U9RbE+YPH9Mm?=
 =?us-ascii?Q?UjcbXO4/Xb14v6ttoPNHLaUZX7QQwBdDIAbxoeK+HBMPHgb1q21Mp64yBwmu?=
 =?us-ascii?Q?OjYfMDFX62VQ/JvS6iB6ospEXTZ5LkfRMLAtIpt2jicbckRxgAX4Ki0zcEbF?=
 =?us-ascii?Q?9svC9OJNZUCnYYUM8y/VZzBaHR+qfFht7qawgNTeZiOYMZm5uXS1L+flmT2j?=
 =?us-ascii?Q?q4Owjo0bHo33b625hmOGTzppxnD1c8WVwJiuBpIyZBd9DcoXMJx+Tu6sEdmu?=
 =?us-ascii?Q?+90z1Zum8nua3TVwgy1ufv0FI3R/o1TRk4I1RBnWU4AuBw0wqsEhaTcHTR3O?=
 =?us-ascii?Q?a3sBP/a0lKS2cS2ewY+3w26knlfQtCr9ucExSILproXW/9QSZlAvZfnDtioz?=
 =?us-ascii?Q?tvFGN2GY6o0c+P7TVGAN1ZmLrg/JkKszNw43YgLCY83DN8sng6qOhSqO+IcJ?=
 =?us-ascii?Q?VZgxkzPvhEEwhKltMyqPN1LnahQVIx6eQazG1uJaNoa4rTZvd2NDGl//sVp0?=
 =?us-ascii?Q?2Jx4Jamzu3dYf5s3XVy7mSXkTH5+wym5sM/k6c58zRjLVmQgzsMDQ0VjmY25?=
 =?us-ascii?Q?KPZSqoTfqI4vPPwwvMNxSBCGJF0FDx2hLiecJ9oY4Wnopdm/cAdd/2jPHmTh?=
 =?us-ascii?Q?mLaAHcD0IxfmSmfUzCvmnuWH5/2zMTV9hZ8WRFUCVdsWI5Cbyh86juNBOgDQ?=
 =?us-ascii?Q?7Yr5Uy7tL4jGuQLPf7mZAezXtEfl+0qsttC2ZRJ7pEeBA7bsMSTtm98JSNLD?=
 =?us-ascii?Q?fj903Y/csdD/wK5XdhK3QogIWp1TsQ/tG3IEuDFinoEfaIu7LgpaIM0XSCKV?=
 =?us-ascii?Q?22b0mtj3FNFnYsg8xLB6guYWj/sDx/R7WLFn8hSyz0IY6fFC+g4m68x7PTSz?=
 =?us-ascii?Q?Zwk7mh27PqLMHEltSP80Ervxr/pK3Yn3emN8z4yQBIGrT3oDBnd4lwBM7Pbq?=
 =?us-ascii?Q?jKBkMjhfLkNcvdkkotuOEJ0HbJOo0gvxAEClooNAVWbF3Lbbfr/nc+Swfxst?=
 =?us-ascii?Q?m9bjMEFT82KxBBasgRUb7r81Idhv3wrdq3vu86N12nMKDlRPgy9WcKfjTV6g?=
 =?us-ascii?Q?zrj3Ybx4lK9oaDRFdXOYgxXSZhFFZJ8=3D?=
X-Exchange-RoutingPolicyChecked: 
	g/ZqrQmQNCuDawoBIzGq0XyitLA1stN0uMpSd57fAQctdLzERcStytqCj/JRkRrvlpyPbrw0X15w8dZve90g5YFiNVkVDqCnt2fJ4aoYdPH4uCc99qRnZ+OTlvwKaQZL5B1lM/QgnJroOdFum7R3rVKY3oKIcdmgLhuCAYCsNkh8b71+YRx/LYOZSVCloHp3DkIXCVObpWmXZlkR2XaaCv4tfQFrBirb7U6b/aXBkCxkFdQlM9s/kLOL7xzynxHyf77MizxoGoBgonTomOXztPwIA5GSsbn3xKj2kzZLJpkHLgbgfE5mJVccUm3reOY4jOFfULuJJ70IvV2YVVVnvA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bdf191-0a51-4458-a5b1-08df024247a5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:20.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST4jzzPkMTEkhmTzWSKGTgygXVxn/myKIYg4nNP9ZbBB7q3fZF5uAdYZTxdi4ceml/MfxPfu55ZwCbtPCMr7n9kfEUi7JrA22NOsE8iERoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfXxW5IMO9caS8m
 9S/3PHLanWwi3D2QUO4rxHQt1zirA0nJPoCfB2gvzBCn7yf2YkKvKy8XdWuXILZHy0E02/sCF27
 NokTHy0PWyAEyfE7+imSSOJ3exRG9AgcydGyfP+v7scqrroFI9Cu
X-Proofpoint-ORIG-GUID: hh13he1F8xExasvtwi160EAsJWk9KEJ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX4ou/hhb3d6Qa
 9CUhrz5+qHGByYCOTtwA+n0QCJC5hJbTOiBphwrzJBZckt8ul0Twzqoj1EMs5OPDbykImP9XTXC
 1XgiZvtDdvTbCvLoMRxynjwU6d0z4DNm4xFOZ7+M7iY4XeKt8D6/eFfQa8pqTKlC/QppgygQIzx
 HitRTwBXqM7U47yuKAZglq56+MThiCT9D2y9iYKsWa+L0gWOhEagCN2mP9pIXEL87VoX/yGyf7G
 EXr/MA2xHiDfdNOWISTwoI2vWQ8SEFCLfAsI4UJf7EHaGJ3InVa+zQ/es8p747owAxKdv+ykNuC
 zXz+W0FpVLFZxZ5U36n0IpRdgvQlug+z0FLDErgrXo3NtCYqcspDLGU6HxgagVx9VgVLDx9KUcy
 5OOuo7SkXPFlwI5uBcjsTFTqF9ZAg/GHpXiFQnBYqWNv2bV6dAFYt9IXLwup+F0kPOL67xyXZPk
 Qolhb4rNOU8PCZlBawg==
X-Proofpoint-GUID: WP117VW_AmIOHPgSxHri3xlUT27ub662
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8ce5de cx=c_pps
 a=NH0nRcagBPXjbvxaFUBjlA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=p0aGjYm6jqd3QCOFG8EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244169

With rpm 6's internal dependency generator now active in OE builds,
pkgconfigdeps.sh --requires always emits "Requires: /usr/bin/pkg-config"
for any package that ships .pc files.  This line is emitted before
pkg-config is even called, so packages built during the early rpm 6
migration (before the PKG_CONFIG_SYSROOT_DIR fix) carry this requirement
even though they have no pkgconfig() Provides.

DNF only reads primary.xml by default, which holds explicit Provides
declarations.  pkgconf now has RPROVIDES += "/usr/bin/pkg-config", but
pkgconf packages fetched from the hash-equivalence sstate server were
built before that change and have no explicit Provides in primary.xml.

createrepo_c already generates filelists.xml by default.  Enabling
optional_metadata_types=filelists tells DNF to also load it, so DNF
can match "Requires: /usr/bin/pkg-config" against pkgconf's actual
installed file list regardless of when pkgconf was built.  This covers
the sstate transition period without requiring a full rebuild of
pkgconf.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 1d831745ff..cd6efe3d3b 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -318,7 +318,8 @@ class RpmPM(PackageManager):
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--installroot=%s" % (self.target_rootfs),
-                             "--setopt=logdir=%s" % (self.d.getVar('T'))
+                             "--setopt=logdir=%s" % (self.d.getVar('T')),
+                             "--setopt=optional_metadata_types=filelists",
                             ]
         if hasattr(self, "rpm_repo_dir"):
             standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))

