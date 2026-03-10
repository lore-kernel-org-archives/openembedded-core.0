Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6923FD4F0F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:45:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1318.1773164692246440996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pF8TXQ7c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75297c066b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8mSfZ689547
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:44:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hePNIccYm4fV/szXF3ZWxUYopOYOPol1zax3a5y2jtk=; b=
	pF8TXQ7cvP/R9+pZjd7z/C5wPie82jnnCNHkml1kid+/LkoGwcvnUBf9lAYaZhyT
	JPPEZeARqe7qj4321hRlM9vFm1+3RPZwMKmBa0aGMn3SwcMeO3JLPIP+3NuWwi44
	YOpdhh4dMdhvWsOwQstVDjUW64jhKGZ//aMghQ8bVJF2wn52QpXAd7Rf9qd0xHoX
	Zo+iFE7nrxDEewQ1NRajymhzT5lbPNZmKyn9Lpc+cpMGJiw4h/IwZGy27gJEi+/F
	2nPDvSD3biO5KcPNSlSrL1NGqCG2tCJHcAuGENgn9VUc8KNncjQhFkNg8enwj2qo
	RfCjIfn+nlkMfV3/SyCuUQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62khak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKDqAWaUq1V40Qf3mmQeQ2fMQCIjW2ivUJWefGntenl+kGB0679Nl2AiY5QzH2E3kXjpg3mgOeCTnDV4blWETWbtrS6jH1iG3YdWgwh4pe6GJJe6A5bhF1joPMiXrc+WGBCaK+j0dFpAmSps09Z1LLs2wZwhUvOakjr7qdtX1Z0LgnVA4CS7t7vvgw0YMk4gwdmNL4+wY7f3xFEgO9jmj8moGn2Gbzs4YdFUk826cjj7cKX/nz2fqKzVzaFSwhAvHujteWw1hskDdmH+/gPHjtXyk4WlIKwZ+HmAhjUvbATgb4+HmTDy4/10svkkBz6CPlLuBKUbcKmYDl0+5m9eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hePNIccYm4fV/szXF3ZWxUYopOYOPol1zax3a5y2jtk=;
 b=Dyf6ZTAAo+KqI6+gRJKRaOi8Yfj19sIUIO7Gmpaidg8f/yr8eChf4j0HY22Yj+VDYiLUHSqbvw6EYKdHqV781GXTATDE9n56aJmjwAIBgBh4TD4Hq/RqOwrolP3jcVmhyGAe0a9EQyiqDjAJNgufmJI/KwkL8VJS9tXq9o5RKNug9ILX0Hwly7SiILv5CKhmgrUjiJH5z2PJKM6UryEqYiOxWzHryegQLbS+pVQ/Jo5EN1F3UnpU7a+6iZo5PBa1LxcJR5+TJbFsC++NCdFxRUHB76BraHpsYUJOBbsAWpOKUGLZYe5NjQ6Vd8ls3xVhzPGzNC0hLIpr5fFn1P84Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV2PR11MB9538.namprd11.prod.outlook.com (2603:10b6:408:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:44:49 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:44:49 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH v3 2/6] gettext: upgrade 0.26 -> 1.0
Date: Tue, 10 Mar 2026 10:43:59 -0700
Message-ID: <20260310174403.2309825-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0580.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::16) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0a2c60-f46a-47cc-8781-08de7eccba3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XBzq7f1xx8RQf6b5I09Zjgjd6DKwLWnAMVajR0IS2+VC6XBvXWirZm7v2tku5RBlu19Ujf8C17xhhPXGteTTYyTKAa0m8SbiDz1083RbdDqNJZ8tlDWPyghGigzQGDAj9zIc4oxS3tvR8NZqZqZI1r0YzNV63r34gnJj7h11CmvDPi0lDy8yLYc9RmLZyhKHCGMUYEFFNcOUOPpK3qkGjYxrrbPAYpERGKag688dy/w/PT9nGjeHDKBEWiDscEiA99BKSimlVpylkogUiJ9ZN6jAHSQG2NyTzFPW0XjtSesvTzwFJrcbtjQH8mdir3yrLXFDSKzqf6pJPCyA+LZ8W68S0tIlrUb8B2EuIi9NCUPToaElEH20cONwz090AJzoezPWUnFq+XKTGxsDIR3WjSdERo635BBHQ2PdToRKGrUF1tojSkIONwfq5DIWigYmjUH/a1yQIvKkgi4U14HQ4FxVbwtCEG2bgGxlDHmj3Qx/IwVN0L4l3j8dMvlqXHsG8WpGn3Hb8r53NoMmTVmKuuPBaHsKfwl26i0tV2OwPI+VCVa7hDP3QRTPYvL7cD94md4sXsygoIP+2bXgLNXc5mjtrhT6xl8dIyDixnyve9EhOzHcKIpHRWGRI6BkT74Tm13s6X1bj0wQSl9PMfowrdeX3WFeXb4XEBVHU8YQIFnw2SskQT2gTiTCu27yBCIopF9M0q6xEU0J39cuQRNAOvK/GLLKkP5U44LvHu0IDHIXitXC+CpcusQomTe8aAun
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GEDaJlllIlzhtMBF22TcfsbGXmzVfona4D7P/KtovfUWLdqIKXyrjgULK5Ag?=
 =?us-ascii?Q?zjPLC8xiW/iifVJ5CODH19VexXqEVWOxLRRxzFmUaNUE0gf7v2jegpyUR3M3?=
 =?us-ascii?Q?peJh5GGi4CXKVpFkM3WPqqpJHqbbHka5musOyJ4eQFTmEZ13sUvvIMTUCy5m?=
 =?us-ascii?Q?SPbACj/RdP5BVyBjeAX/6IHOgjIHFp6ZGG18hBCeH6MDGR7a+8O5uIXgRjjP?=
 =?us-ascii?Q?X771ssrGmGXJ2eEknF541Q367rpc9VZguJsisiDYZRPQ1nx+PYKDr3tzsUmM?=
 =?us-ascii?Q?4Hm73rUXFSRvAYTCXEgA/1wrWqVFjqL6yNUTglVIzjRBJ7S21muayqNuZ8cG?=
 =?us-ascii?Q?A/yIqRT24debfoZYofN31m0WCqJlV1eziAecwE+B4t4WVAtCsjP+/S0BKWkB?=
 =?us-ascii?Q?NSB5vcJQw9k9dACa90bEG6h3M6yO5X/jLFJs3S8OfObMDC369VNz6hTEkcM+?=
 =?us-ascii?Q?04T0xRiWdEQa7J2+XUfeMcP/xIQgxqEYoM07Wcm2n2Yof3hjYVsfDcqnjl/Q?=
 =?us-ascii?Q?ksW71pvRdAu7kf5V9Xamm6vGAaLKTlhAHTKyfW0SZlmtgtL+X/tBNYwW8R7h?=
 =?us-ascii?Q?gOh//5jo/JjVvQPDUDaF4cWRlA0FdHvwud/yjZwKVP0EY35jlumRDTNOgz+A?=
 =?us-ascii?Q?D5olfsgxw9DtCrIHZ11z/d0QALWEzvkrQ4t4LuMj3lXpQkL+Q9cV5h7Gnuv4?=
 =?us-ascii?Q?gvrwb8BD3R6fmLCdfvOEEv8nrIeObnvYVQ+FobZPkUHy3EESjLyI538IjVdg?=
 =?us-ascii?Q?utetUQxcs3u6Su3pkXlhQN+RsDwNqkKnWVxSkGNZZYvR8qZ4BTd1t/2FTxg3?=
 =?us-ascii?Q?aYVwBMQQpPDLm+RVPhpmv3mkQPcxG0RxpyrwjRTfX4jZhaJ0ju0IiXn5RoJz?=
 =?us-ascii?Q?apoXUeLMC4BsAMhks5Z+gGjO5RXjnL60KR4ZdlPViCFEpRoIlPrmk6ZjcH70?=
 =?us-ascii?Q?ywkkAP7Dm7Va9ovmHYP1YzDyhhbUx2T6xnaAkcjDly4TtnpMYjUBzpVIyzdb?=
 =?us-ascii?Q?o7rzVDm90hZ0nqR9zT/z/2ZWV5QJFN50CBZuSMNENLXTiVvx9vkXiH1MWX5h?=
 =?us-ascii?Q?JfijggvF1U/A8WJE7BWB2BsmAuJXsxcIojAPH3wHWJHgiNZXnATpHZ8GykIo?=
 =?us-ascii?Q?luBsk5Teaj+WSFJxvzw9qeNGWoxmPkex8Uf6DYIUrvcg+CMVh6Fwpmf2mTJY?=
 =?us-ascii?Q?EAdi1KaKiM3UE8glRvBrbTeQ57W3C4oJ7OJsLTT82Uva/bDsp4oombjLbDx/?=
 =?us-ascii?Q?FNZca1F/d/TRhuF3e6rQ6hN7BOdE+ht3I9fV5Jjp8Hf9Zg+1UMTTPGbFjL5Q?=
 =?us-ascii?Q?YU0q2lug5uvOr7t5ReZSgVw1ST7a3EBq1lns+SlP1FCdgjXSETE/B2QX1ysI?=
 =?us-ascii?Q?1G4lR6G17ko5qSPTYextVQxznpnKsgbxzWT+hmiqdWYrJevmcDm9772AWiQ3?=
 =?us-ascii?Q?EvOuUDP1vgFRNq4tDwwRtMh/OWEYiKVW3sCtLMEhGufcqWeK3l7VgtPqvyup?=
 =?us-ascii?Q?YNy2SbYkM6l/Neb8IazekQ6seO/38iFb+Jb+5TlovJ2yQ0UDGbT8A/qve6qw?=
 =?us-ascii?Q?uVKfK6gNx5reBLHU/yfTVerbCX5wWhaKxVLFtDUN9CJ1oi2A/jD8cqLXw2/x?=
 =?us-ascii?Q?Rv3EUdxt1RD7kcxBKdqily7M7kQl1KD+j2WKVVAgrz0qyyHWE6Opg4+FNqDc?=
 =?us-ascii?Q?n59C8dSNiFPptCzT58eA72sshivkGh2MzP8gz6mTOgXfoUX8/f+RxDjxl5TT?=
 =?us-ascii?Q?X1pvmUn5FhLbq/E5EOW5+DGkilzw780=3D?=
X-Exchange-RoutingPolicyChecked: 
	M/0hfW5ZEOZjN+7OSE3NdwIUkHkC8en9dWB2afzrKl3CD4fYDb2fDkLkf5pYzgiXH8N3V/kj/G+7migUNTqLQXd3bRW5cnp6ugdlUAZ8f0qz/DRcAEPu8ZMWXzB6PTXHjRf9jw0aMCaD5IXUwQfVzTFQiQheNNazRVZRMxyHUCH9Q5T9f/DyT3UyAInV2AZMxpxB9wzuog0NU5gXp7nOb7+X3tUu2S9BwiI4pJk/oJv9GEucnazzQAFWHuvDtgK6ZLtcA4lIfBzef/L4znLBxX/l7dfFvDhAMb5JzxvUwAuZ34gd8yPXdZxQWg7cc9F0jdxD5A07lmjIW7NNXpVXvQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0a2c60-f46a-47cc-8781-08de7eccba3a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:44:49.8823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0zflU2Im014qXp11MuoYnKSuLU043Tt984pI9pr4qAJhybXEhk+pnq/MyqkX7kW9a3fJ+zN4MtAHUVeBFeaBw1P0A+2v/SlHmcdTL1okqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69b05893 cx=c_pps
 a=IFr6uxAXmWssV7p2N+XdEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=_w0Y06NQe_0rs-Bk8U4A:9 a=pXiMMb81OCeSR7P-:21
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE1MyBTYWx0ZWRfX7UL3u+xt2GZA
 me6F8DuA/P4zM2H1Rn19U/NtlT6aa9BanwVSToBsSmBexnBBxDIlRSX/5RTsEhkoD64kvK8ZC/9
 WPNHq9fuZqF32V6pY7APniOHMuE/hzgJ0K6vc3M9UUoUv+/vKiwzbOXdZ5ayHAHndeRB/9wkIQV
 qm1xcmSa2/zKAHKmGeBLfP4HQcc9PrIwYRmBaQjqoHa/HzUOI3fjYQVUL6aCS/ymVKaCxyIiXNV
 2s1d9+b24AU7O9ldyNmy8i/sDevPwTNNfSWHFp1xhGctuixHmt0bWfiwvCz0eKyqYlE7WExt4ZZ
 PoEuuOyd12qbzUxfF0xCzqJOrh0/0l2PYugVVkdJMcSQ0iM+nRb/qtC8NPWobNgSGDeqoG/cwFB
 eCORekk4i8UbzFnhs6PK5sHMth5KLN7hn0+pNRdbOabqbke56uEL6QVkfD/w/g/XeigjAXfIcZr
 Ss0Cc0aTidddUPTmylw==
X-Proofpoint-ORIG-GUID: 6ZikGC0NHQEhjebiR4yhoY8EJ0n2X1Zj
X-Proofpoint-GUID: 6ZikGC0NHQEhjebiR4yhoY8EJ0n2X1Zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232801

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
https://savannah.gnu.org/news/?id=10853

Changelog:
1.0: https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00007.html

- gettext-minimal-native: update Makevars.template source path to new
  location under gettext-tools/wizard/po-templates/traditional/

- use-pkgconfig.patch: refresh patch hunks to match updated upstream
  context in libxml.m4 and selinux-selinux-h.m4, update selinux
  discovery: replace AC_SEARCH_LIBS (getfilecon_raw) with
  PKG_CHECK_MODULES for correct sysroot handling

- gettext_1.0.bb: add autotools ptest directory and install
  gettext-tools autotools build artifacts for ptest

ptest results:

=======================
All 630 tests passed
(41 tests were not run)
=======================
DURATION: 45
END: /usr/lib/gettext/ptest
2026-03-09T17:58
STOP: ptest-runner
TOTAL: 1 FAIL: 0

With the previous version:
All 626 tests passed
(40 tests were not run)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ..._0.26.bb => gettext-minimal-native_1.0.bb} |  3 ++-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../gettext/gettext/use-pkgconfig.patch       | 25 +++++++++++--------
 .../{gettext_0.26.bb => gettext_1.0.bb}       |  2 ++
 4 files changed, 20 insertions(+), 12 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.26.bb => gettext-minimal-native_1.0.bb} (88%)
 rename meta/recipes-core/gettext/{gettext_0.26.bb => gettext_1.0.bb} (98%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
similarity index 88%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index b5c32d0786..28392a26b5 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -44,5 +44,6 @@ do_install () {
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 	# The gettext recipe also installs the same Makevars.template at the same place, rename it
-	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	# cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal 
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 2ddf47334d..02ad72fc9f 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,3 +1,3 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
-SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
+SRC_URI[sha256sum] = "85d99b79c981a404874c02e0342176cf75c7698e2b51fe41031cf6526d974f1a"
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index 2b9fef1e94..031a44d4dd 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -27,7 +27,7 @@ diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.
 index c7160d7..8e46cc7 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -15,6 +15,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -35,7 +35,7 @@ index c7160d7..8e46cc7 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -33,106 +34,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -399,7 +399,7 @@ diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib
 index e2613fa..2a733a7 100644
 --- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
 +++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -71,6 +71,7 @@
  [
    AC_REQUIRE([AC_CANONICAL_HOST])
    AC_REQUIRE([AC_CANONICAL_BUILD])
@@ -407,24 +407,29 @@ index e2613fa..2a733a7 100644
  
    AC_ARG_WITH([selinux],
      AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
-@@ -79,19 +80,8 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -79,24 +80,8 @@
    LIB_SELINUX=
    if test "$with_selinux" != no; then
      gl_saved_LIBS=$LIBS
--    AC_SEARCH_LIBS([setfilecon], [selinux],
--                   [test "$ac_cv_search_setfilecon" = "none required" ||
--                    LIB_SELINUX=$ac_cv_search_setfilecon])
+-    dnl On Android, in Termux, prefer libandroid-selinux.so, because it
+-    dnl defines many more API functions than /system/lib/libselinux.so.
+-    AC_SEARCH_LIBS([getfilecon_raw], [android-selinux selinux],
+-                   [test "$ac_cv_search_getfilecon_raw" = "none required" ||
+-                    LIB_SELINUX=$ac_cv_search_getfilecon_raw])
 +    PKG_CHECK_MODULES([SELINUX], [libselinux], [LIB_SELINUX=$SELINUX_LIBS])
      LIBS=$gl_saved_LIBS
    fi
    AC_SUBST([LIB_SELINUX])
 -
 -  # Warn if SELinux is found but libselinux is absent;
--  if test "$ac_cv_search_setfilecon" = no; then
--    if test "$host" = "$build" && test -d /selinux; then
+-  if test "$ac_cv_search_getfilecon_raw" = no; then
+-    if test "$host" = "$build" \
+-       && { test -d /sys/fs/selinux || test -d /selinux; }; then
 -      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
 -      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
 -    fi
--    with_selinux=no
+-    if test "$with_selinux" = maybe; then
+-      with_selinux=no
+-    fi
 -  fi
  ])
diff --git a/meta/recipes-core/gettext/gettext_0.26.bb b/meta/recipes-core/gettext/gettext_1.0.bb
similarity index 98%
rename from meta/recipes-core/gettext/gettext_0.26.bb
rename to meta/recipes-core/gettext/gettext_1.0.bb
index b99b301af4..37e46869a7 100644
--- a/meta/recipes-core/gettext/gettext_0.26.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -148,6 +148,7 @@ do_install_ptest() {
         mkdir -p                                        ${D}${PTEST_PATH}/tests
         mkdir -p                                        ${D}${PTEST_PATH}/src
         mkdir -p                                        ${D}${PTEST_PATH}/po
+        mkdir -p                                        ${D}${PTEST_PATH}/autotools
         mkdir -p                                        ${D}${PTEST_PATH}/misc
         mkdir -p                                        ${D}${PTEST_PATH}/its
         mkdir -p                                        ${D}${PTEST_PATH}/styles
@@ -172,6 +173,7 @@ do_install_ptest() {
         install ${B}/gettext-runtime/src/gettext        ${D}${PTEST_PATH}/src
         install ${B}/gettext-tools/src/.libs/cldr-plurals   ${D}${PTEST_PATH}/src
         install ${S}/gettext-tools/po/gettext-tools.pot ${D}${PTEST_PATH}/po
+        install ${B}/gettext-tools/autotools/*       ${D}${PTEST_PATH}/autotools
         install ${B}/gettext-tools/misc/*       ${D}${PTEST_PATH}/misc
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
-- 
2.49.0


