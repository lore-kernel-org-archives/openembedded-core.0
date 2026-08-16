Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8969FC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19458.1786921893808107203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d3c9IlKz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMxGmp1139681
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:11:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=; b=
	d3c9IlKzUpEker+pqqP+7Rgo1bV9Qk9ysbit9ieqTGg9IjT6CaeRPm++sZvJBKBW
	0hTv+c48z4U5OKpAEOYu96so8cc61kdYq/SAZDQcjEqlDrKGacODbhmbb4tT8Yfa
	JxO3ITu1/Kius6K+134WefSEhk/Pdfs03WW6wLUJRWXi4aYE3A34A9pyQ24b7z5u
	meqyDt0S4iz5gSeMcbEe+rFx8w+owM/YqkIcmVWus+zxAvRLPvQUDTpu0jtpOaJW
	4aqBGubbAzj3V/7tUAnFtt+PcAl9//3qM9MIqRhn24uVWySc37JjhLtevR8DHwC1
	i4FBSteX/s3HaU9vrGcDCA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023109.outbound.protection.outlook.com [40.107.201.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2qmgse2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 16:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuirfRNwRZ01A3wZ8dHrOxlTrYCOrkfjayT0MoMO5JbWkGoLehtTpCieKUViawx1zv8uquP7o/Ikpsd4nkM2bBn/y0i2+MFyNOGNuPOHO8JVc3A6vzhSIBMHt3HpwrroeIvLLreZJ2dA4UL7GMIwqHIOmP6Z5hm7ByDr0qmJsEy72vEJ8WjP+TLnHXmOYxQGxRxrbklGLgxYDn1T27bq4NFguu+kmGG8+miphWukETF8W8Vtg/7BUGE6W2T8Li1eVRiqzOgSbaziCFcL4mdJwfYJhhKTAOX/5qiCH7ZYA0jETWzEPfeKfoi4wAAX41ONK/sirf+d0IxrdcTZ2J+PJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=;
 b=pYlmV2sdsWTO/B8ELDNHiH6bcPIcJpWmliLtpRG6cwIllLnKYtW3byjTuvwz2w8qKWT5rFjjWfQgD6Og3eGqJWZ+XUOy22IugsMZFsJ0gXxlB6lA73v/xjVul/DS9RbWHeZO2TbxiACB6rhXjIYJGDv3tJOWACprrZud2F6HlB8D/OLVtN7a8mLWDjhf6ZRcM8R8sbDM+6Wp6FAYRkqzOVJ2KeBQdAkC4vv3HqAM3nU9UUN1zYjcoZS+ezkYc+ML5BsAV8lrll91t/u63cDNQT1Kuur9grU8PlwaUlaVY5s5juiDBKVzuRgcUjGbgKaBI/hdqfOsKJmJwoUKAFk1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:30 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:30 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 12/12] lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
Date: Sun, 16 Aug 2026 16:11:04 -0700
Message-ID: <20260816231104.3871015-13-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb68c1a-6726-4e44-5bbc-08defbebb517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4oOCDDgsEicuNUZN70bX/J6wN8EglA5MoQAhiGcDEzWlE3/OKCAuiS91CLsj4XJgJhE7P0tv9fFOOala+Mp9Zlu3yPxXT55ft08+a7+iX0Yap1ynvgWJHMjrmuYt7RJhnYJkTEao3iisqN2NjH8hgi023VcPcT8x+YCR4YVHwc67ilMkwMFwLF4JfXIrvlHkl2Q6EaZuLvRugHnHPf6NqT5p63Y+h3lrTSwWMkX5P8avveda33QvwlICXFDDLmdhJnszlA5eUfvdp/OPKHhSbNTHK0Ebyc1iXLDKt9hr3RKwhNu41dNIT3iQ01txYyFax3bq9iLJNpsyyOYNsvmN0E1YwmRmLoL13AbKYcqBoA9PbGDZP9HAwsIPxkNosycSno5JvV9DEqh5xRe5Qh1rKKDDcQo8owj4aRM4BBGGhBBDRR2N469989w5iivGvhE0gO0O3piYhdSdLUBxX28iiBDZI7SjIpENKLnCjpvcur1H+kFf40/4Uo+xmNwM+D5kxI8Mn1DsQd3ZTOaVYaA+JKSIkVapldQg7pTIugJyj+7V2KY/gYHjsmb9u/9BKrxbfeCDIyJ/5AOCsI5pUAlqTCYRc0xFGFJSfswdsec7cWeWwNt+iA1uNKHrDvKD0BunnCjmdmKfAGfx1m7H96L03Rfv0oeezQlKgJQMdEY0E6Az+ktzZSBn2hUr5M32PD/ShMN79aZhtAg3KecPURmGrgNwQHwnLWZKgFBZCSJcrpA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vw1lfRCaORshS49f/mhtoMERTBp6agp1ScTjuyPQQdkuiU2e5vO31z5K9ym7?=
 =?us-ascii?Q?aaHIK94spajv14BZWYy3pEsQxpZ5rsrAO6FILv2/6ulZc0AovyiZK04TcAdD?=
 =?us-ascii?Q?0GFF2KPVNPQYp1fsELqxewdALNz+5u6tsoCAIo2D7OIiCc87I2WaKlJ8BjeC?=
 =?us-ascii?Q?eNcIKUsvmcSIGOyzlpgdfyOBxFdhoDUWHjCf8dGyqHbwc76X36Dfz30qaP8K?=
 =?us-ascii?Q?9ybUAgRS9SaAlh/OePbpwyrhoLuW3RCNP1NyNjrerAEIVWyyYTIQii9goAPF?=
 =?us-ascii?Q?HKEkfI38ysrgz7CLfXWxZTvQebVgPFXEMKUHoc/mPP3EzUJqPVhPbwEc0g71?=
 =?us-ascii?Q?lvMeUbTI0TlZ2QsBRIvI+ktjluxqgcemhZIkGz3WrZfMxpzqRHsLzhQt4RnJ?=
 =?us-ascii?Q?GXx+2HjQS9ZYiXhqG85LaOpaPPzZ8sgqQ/Mlbx6OudgDPtp4kUA4+N1enwfa?=
 =?us-ascii?Q?9udwWl822OzsfdKkzWRrv/U9XbaL4wjCV3xYGJEmaoIMWE3KsAwrScVh1OM4?=
 =?us-ascii?Q?uoZfsBqyYF+SJfT2ndxCgafcDkZa2EK77sxyHJlPbTW/m9C+ZGpQ4qBjbh9i?=
 =?us-ascii?Q?qbnga6/UPYg3lrqoFvDaQlMJW8ViXCvTAvGxhVi1Q10sGUB0RTZPlZB36ME+?=
 =?us-ascii?Q?gDoCqUxJ9tvsM4w/ww8KDeSiLeLyFktKo4zfP/9OhGYrzB8FkHG//0ir5PtM?=
 =?us-ascii?Q?5NKYKIGGUKuQCFUNz9yof5InbJulVclcpwx4bbrOiAjgvaKfMNcDlq0yGEdv?=
 =?us-ascii?Q?pD1/tG/nklbq8B1NpbEqj/1iQ/OwyWZiUFcfYSEeZX6Mk2xVLrIUVsxlB2PP?=
 =?us-ascii?Q?96l+Nu8SYWRx0Z8DEFLvpgtExwVo9tCFAjQiwcP5wjbN2RTMcKUjophgU4+x?=
 =?us-ascii?Q?2LV8kaHn+T7Ev40Yg+Ia2V5S1hC4pfHjQ2GF2Dl/JSVaBhB7KFCSaywO4+Wr?=
 =?us-ascii?Q?qxTYa02LNjcZIwDzL+cAwyfH6O9Sbm9seaZphDjLZdEPn5b4gUCQ0WvvB5wO?=
 =?us-ascii?Q?2BGPnh70qO8zphXymKzTxJ+wbz5pKIqPdkkfjVo+CZqc29GChHotQDHW5fkO?=
 =?us-ascii?Q?/qusa+oCI1LT3TLsjcypbNE0ntet7V00HIMLlVpY8EKeDv2RzghByuVfoXPI?=
 =?us-ascii?Q?Y3fzPlZnCgN7Yl9sFJChctsl0YvfRFDShYpPVAEoRWDQMVoqMJr+/facmBEU?=
 =?us-ascii?Q?8OIoTzMLZmB/Dla6juq/bThP4mavDIwAmBTSLJOAdnpbbuhzh8JjfqNChHoE?=
 =?us-ascii?Q?x8h0UzijzIxGDtscLBYBg1WrSPsMeJb0a3KwYv/8GqaUgtbWytyrdgGd6yxV?=
 =?us-ascii?Q?wOEkE8iuKNPmL7UQOMjqp/RCivd5qOtdndYLiV4FXIzPC/UotngcxO9rwPIC?=
 =?us-ascii?Q?zxkYynvwgWcBE2E1ueoMJCqiM0E+KSKUNEh14GU3po+Uw9RmazS5kVqIG40e?=
 =?us-ascii?Q?qSx8ck3sBkDaAmDWPjldWM7VoB2dgl/C4Y3LZ5plyCZp+eJrwB0Virpkv7G5?=
 =?us-ascii?Q?b1REl11gS5y6CcXernYJAmLfQ0aAC/uTl+kNF/BzEEqCLUQfxI88sgC7szcd?=
 =?us-ascii?Q?tLzqrSm6xm2Iwkl2ycTe/HJZwURYc9eCSsPqKgOuUfXde//kdcSj02V5Of8W?=
 =?us-ascii?Q?CrinVP2kaB1dNuuhcAbauf6Ya6+G4h7WPul2fa4ODrfFl9Ob5CzM4cokfAgb?=
 =?us-ascii?Q?aSSrae0XjacjY9IGEi8KTbf894BMJ3vH2z0R/Kk5WqHFGuC8nzgTYNtntMEL?=
 =?us-ascii?Q?F1RGongsnt9gOHzpjcDVYbff1U60eec=3D?=
X-Exchange-RoutingPolicyChecked: 
	seFiproBzcO/pAJCoGgSlNPPmrfrbm7XLBwIljUXq89bXVUaS8HjH98ZmxdoIw6VMq15/zyhY6tNQGrT1Sc4dbCPuaMZ/NanA5sgficPPSnQo+WiYXBJWIs3i+jEcmr/ezMukV/K/UmtN+vCOc6kxWvfitC1P86YLF+zjLZocZaTTcinvltkeXwqc3ccT1zNg0Fp/WwbUEKZNTqCuhVQ7q5jfHomYNdRb3jVIRLM1UMBBjkHESIb/r4at0waEbwx3tstbXR0dDFB3Yz7DE7rMNlrRdSXiomIlOaXUmgTqf8ooBwQUvQdvPh0+c/yv53XX7znFti0HbfADM0FMtnhKg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb68c1a-6726-4e44-5bbc-08defbebb517
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:30.8713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Tsc+8xlYMawHmf/MqStMcgkzmcgeeQeiexNvHkrboMLrjdNb6Ar+aduXodlLwsr7CYrJrWWJGb/ikvur9+oe7ZqWaRr3+yR0V5hzySqZBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=br98wkai c=1 sm=1 tr=0 ts=6a8243a5 cx=c_pps
 a=79HFkgKL4DfSaZBTv+UA5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=p0aGjYm6jqd3QCOFG8EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vPS-lY5Z9tIv-guX36rx8hHff8_mcmjT
X-Proofpoint-ORIG-GUID: pOvL90aAIonvNqKGcPLdiou7JlC0G9Zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX5SPcegdUZqge
 8329aK+8vIYXMksez2o+sArZL+iQwYW6vcJKPjpYnCbSLYA4QPLfH3PlHRUgFJY7hhDAm2jFAU4
 JtJPbtXy4aobtiNC1iLSt+DBKRyc/dXuvLpFtQOjUZ1JJmhLFE7v7Caa8Kej8uyoVk6wypg0CeF
 8Xfa2aIaVYBmLVtHXvAd9i6Thu4yR4sCl0CghXDkTBHprhU87CHnMZTIC0exMmWkLpjxZZNS7CB
 Wnr0gl5L2UJNj7fcjrIpmfona4kHqmqIu7mREB4afwQJ/+yp1Srzv1INK7B/k0GNQn8oI6F0WVO
 Ka34jbbK0U0zZn3dMeYnfTl2kRsKICwfAMosqSYnIxNCPtD5HeOlExCAcP6zSqlrchqyv+McbX5
 Le0d1WsViYw6+14s812KYvsiIf1HcYLtwJDGefLQcLkdrmKlm0nCqzIYI58vv9AAIn9AoAgzNdx
 hCCK73FpUyuH836vi0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX4WjVd+Drygwh
 qeGtshudODsJLYg7Jl6EzgtFW8HSx3jUHKBFM4kOB5OcV/wgWlvLTwPdlWcz6BOeB2FlLtDmy0Q
 r3ry6SWjeKz0t1IckhvfWi/ZqG9eDeNhhz1ir57LWWOa2BoydLDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243578

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

