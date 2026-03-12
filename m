Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD691FED2EC
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:15:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16775.1773303329692563987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PTpK16vA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753101834c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C6koDI1844649
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 01:15:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=8rb1KLI/Q26zWW5BmxPOLRWt9Y8RVyZymtCb2VASfVY=; b=PTpK16vAV3wi
	doH9OAdkcZ+T/Oc3bvaK8jdj6DqyY21Trzjjqv/9pOrG7vDlLojL7eN7bsJgyb78
	1Y14N+KN20855YwJl2wiW6Bhn1WdzYLN/UxDUeIE/pPmsJl6nOyKJqICKFW+qiHt
	LfYxBCSpULlmqXTLTGKk6HxEdJZE+xDxyEOKucbtBnSiqnJvdx+eb5LGHzUrAOCP
	4gmsujGLfb+xD6wVwYKhRt4FDaXPjclrhkpA+G4gXMmJazCPnpFi3sxpqjT7Z7Cb
	XjnXVA1ES47VMrwDqART0A6HLLHKukOmHck5m2XP89KTA65ZhJBsLD1Mz8Y7ogGH
	AphY3HA8mw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6prehk-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 01:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKX5vBqZvWYdwHfOTiuQwQIuZNo3kwKYOAaoWHcuQiOsRM14Uo9u6VzUMgHGXYiTqe0hGCrU/eRGaMa2d+KVC7iabBOkqYktzURsU9BHHgBsLJSyj8bKPH8aULMuImTnXFMZeuDz50iDieterNJX1SyLUfPmZ1AhMiVOtJcN9K76uy4PA1pbTBtQzDk5YMomoYPWFNh18zzRfupYmQgjv6TLtiOgPbSiofcWWnLRgQCCYIiK+WAhfuPsEhM/lADBWGdNm7nX8G50cfs0v1xy9I2FXEns05Q0q8sYuy98SBOO57dFpJd6azZwPnSGPZDa5lwm7bJoiflRPsUnjsFm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rb1KLI/Q26zWW5BmxPOLRWt9Y8RVyZymtCb2VASfVY=;
 b=BZ97vQmL2GmjQSxSJ147BgYFxR8VG+rEsWQYTHfL8DZBMca7aDejiBuAHsm2IUUwHEZvkR037nOUHIc934i8yc6AQ7WQ37GV470cWxcmtf1oxGjq4wb1rCXgizQm6G3IiNxuUZKk/7p1kc0eHHbSoUjQ7VvGoOfPOyUQ96UtNUVynyYWI5rJYetNN1Twg2wythuvvoO7b9tHiknwt8u31PI3G2f3NtkvnsYwJOmPM51Rva0qpySqG+2PxoEEh5d2/300E+mid6Wep56xMC6Yqh03LEX/pdS7fj/iqiQC9ZBQjTl0ot3OQmrE0+KEiK7WULKmByH5nPEBBKU2CJ46HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 08:15:27 +0000
Received: from CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229]) by CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229%6]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 08:15:27 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gstreamer1.0-plugins-good: remove PACKAGECONFIG soup2
Date: Thu, 12 Mar 2026 16:15:06 +0800
Message-Id: <20260312081506.970978-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312081506.970978-1-changqing.li@windriver.com>
References: <20260312081506.970978-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7297:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 8687a2c7-38af-4c3a-5372-08de800f84ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	V5PVdiFmKX/8ZstnJxtg6gRFODQ96WiczaTDAvv4t37WCvran8M5qPs1dxLZflUnN5+2VXvZEGkZJzEwS7EAcYQGzU1XKfdTJDB342u1XhP7r9P+shmBlg/waOmNnOtJSmsSywW8lxKFv+510iqg4vJw6hxUU9/r1pIbZRU7qCs6aGVgGshxZYdWtwgU3Hu+tub7zxyoh694RhescuVCra6oQ8zsEJvdQpOTqn15NPcob/5ZFJaEB1RW8SMVfrBoLDbqR97mdiLt5NjC3iPVtNAyZMTleeICJGvjRE0RLVjvyuM2b6ZmMO2yu9KxHYm2KdljcaWge8ihhH2uIUMAlBs6ON9FHll+Rskq0WUvMUQKPD7ktq6TBCLNHNb7D0aIjEU3jOM8ebYm7xxt+MwW/2Dc0UuJZzQkUbRVKPv8MBJ65KfkQfYVE/JBsizzW4OShhOfaxxmN6L6sYh9WDGhlJcXRQTdcxOXFqgLBwTWrvdy4oJWGy4RxyoMc9gxPqfa2DW9tAhusH4TIjtMHJfEB3EtGQGnbPjcycuSy37+j1UwNyerFBPbSgTuEqq3/BzVwzbACYwg/WbmrH7aHzKYjk2efAxc4Q3OgBTHrmX8J3zGj0ePlcBcCXjNCOt71zZxszow+IKl+XJmKMGRc4gZd+nXqfa++t//751yVbi8fh49n/Ne0baT9uWaG1vpvgVQHwzZdM+cRk90Vr5b4phYdctsViHhg+nypjuAiab9x+3tRLj4hSeGF0tdHqF9WkkwHsLjiz0hOgS1aPBgLVcXj1VIbRyajfnTm6PlQeDaZKE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7297.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Cvsx63iK2PQWIdKfsVP+QOm8ciGDWa8J6tEtq5m99MWezapFW4Yspfj3sNT?=
 =?us-ascii?Q?4ZAV9RkUaivbvbCIfdswPWYBeQP8IaIR0NQ3SEY8j6q3UymJ7Z9Ts7fA51Kt?=
 =?us-ascii?Q?HTJGY+LoIzOQglbs1+parNaeUjiqicIi6ZOQNFwgKUsICMqVZnsVUcxJTEaQ?=
 =?us-ascii?Q?immUNIhJVhA0CrBbW8dle4gcShjufUh2az4blox+GXEqbiAKi0oyfCF0uCDT?=
 =?us-ascii?Q?ozKaoegbVCBC2be/ntdu4HNJoiInXN5CXbr7JQGqG9Rd7331HtIvnOZP9XwH?=
 =?us-ascii?Q?4HxU8XY04F59EYxmkriJSW4PDBsndfUj7MyO3hMtdUQ6wtv0ewNb7YUYQNT8?=
 =?us-ascii?Q?2Pnxi9UYOUuwQWmeeeKR++GwIw/nCkZJQZbFz85YjHiGxEwK5+R59ZoBRfOe?=
 =?us-ascii?Q?UXE8aWqOJqsHxVyP/u00PEOqGACKIGxrp/WMRsAA6poibz45SchTUvVtPyW4?=
 =?us-ascii?Q?+w17rCA0WAi8g+PSdAEXO8+nKDN9WPOwyR1YOBJF6NugQZoQoesUAi9g4OBh?=
 =?us-ascii?Q?HF/JNF2a2hjDST0DbVxIYIEXLJ+cvJdLaGU7LwDDK2m3mTNAYU/J+ji8QPQG?=
 =?us-ascii?Q?ZzqsKxBrv/mDSIo/GHV4yagZsdPcc95M5EV0jvGKg0daK/JczRvorPZoOI69?=
 =?us-ascii?Q?QkRsmeo2mJIiwUHMuCODXvtYQgm0UJ1EWhbbFL2sYteHquIA/1EQ7xIVDJ4K?=
 =?us-ascii?Q?ObTUyN95H6u15FgxlHtHnY6dQrFs6sm8accVeWr2GAXrCjEoG46a2q/TKDQ+?=
 =?us-ascii?Q?avLYIQgycBX0aueq89jxoHEGJQth8zg3u7fxnY5PuCsjRDcvOVC5Pkx01GLl?=
 =?us-ascii?Q?f45RfkHrhOgL6M91vCWnQ30i4En/Fo5XMkmreNhjlfxHAffy8cyF2jH1fQeH?=
 =?us-ascii?Q?QUxle6/LMFGFhRTYMO9sSUvUkujYvfeDY10bHE7VJa/M0Nhx5N34xFuQO72G?=
 =?us-ascii?Q?saUWiHCA3eJkUXQbNSGFyn0ZIvzwSTwlmivk1oBghueiRnRgecTeaqjE4DrW?=
 =?us-ascii?Q?MfV/WYlBzQxHpGZlUriVObz3au8nE+zoil5LLEzkN7Euu6jTdsDVuKKwHHAW?=
 =?us-ascii?Q?IvDmDRJM9bhekSg6/3dAISpREKbAp86UvL47vWKk88mQ+Qpx8AzzxHScSed3?=
 =?us-ascii?Q?72OzbzZvq379cR/DVxegNmFD358o04qzdg3PncDdcgIsAgHd/g+LlspDPNbb?=
 =?us-ascii?Q?SmKnxABctdJkXp4OEFAG36lFaekyhnpwhlOqdN9yoJDAgtyF5jT2pFB61qFn?=
 =?us-ascii?Q?+k1bqbbs1DmukAVhoaMMS8Ti4QKPKdUi/ZB2QpeOaAFBoR9Ykes58XO0p4e7?=
 =?us-ascii?Q?RIzNc0Lgi6xJbOEtPSvHDAVZ/N8jpFWZiZRxkJ66kKx/qPL2XTOJUQgZKisU?=
 =?us-ascii?Q?UTGHzCYf+86XuWMP9iNDA/hkn3fwOER+Gke79KLjI+x3YoLnjOavBQw6ZXoV?=
 =?us-ascii?Q?o84CXTRsdKoeeYLS4MZqrtgVWN0N5UT208q8YzB5QInI/ggTEKQ564Gi7pOO?=
 =?us-ascii?Q?AqD1G7lyfD4XGk6wAADKTMzB1o+bVPy+DqaBJVNZX2VCDr8iPdnNP5LrOEU9?=
 =?us-ascii?Q?Y87iq2e83J+ZHPyjq6QQgoYVYjuOEHawqnflVW2MroTZfGpzlsYORIkW4Jw/?=
 =?us-ascii?Q?2Xjs/OYefzl+LghpIMRQeqanRATCJvkMby3mHteAPAubNG0g0LKCspoeHWmv?=
 =?us-ascii?Q?PaL7xD99swhf8Bz2WPaqiMbjSqruG3oMjt38w7hiVbS6cxgN3eLxGnN4KOXB?=
 =?us-ascii?Q?X0jLz4cZykI5G2X2JMfvM+wGJ7GugF0=3D?=
X-Exchange-RoutingPolicyChecked: 
	I1zHJKFX1fb5/7Dlkuui1AMTs8fZQF1GEH997hbe4xHn4Bv7DOjUuBrBneWgNGl2j6nMd0JgvuDBF/m1pWSQ3XAPjwOBuMM53PSQJqy64WO/KoCHym/yQ2CbJRlbJ2SsC9VRzNEJDcnHfKYSnmvtX1Dk/2RiHna4Ncq/nc+ylGqdtWfqTc/d9g6npFvzZU52q805zXXKycJ/ctU+WFsrrbRZ2XfkU2RYXZpsOuefk8SUuq9YpCqlzJYj/y2PTA/ZIlDNLBGRkxiRwwFMWikDspvr5fHMEpxdn+1i3mFydRHAyXZze7A1nKvgFyKCerbETpoi8N5I0IVIoo2vUeHCAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8687a2c7-38af-4c3a-5372-08de800f84ac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:15:27.3323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOf72eChzL7yxAB654ga3bx+Un5Tt5c0UTqhGzMGJc/G5eHY7uR7QUza+8NdFN9vpZCM8gxEfZdwrMeV3DmkI74L+J0liCyENE/V1DTcI/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b27621 cx=c_pps
 a=4hG4CnY/eg4LDOVkUp5rMg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=kMG_xlHWQGcNhEGIYbkA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ltk4ZKYv5FRqIDE_jMmvxjNrg0XYvBhe
X-Proofpoint-GUID: Ltk4ZKYv5FRqIDE_jMmvxjNrg0XYvBhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA2NSBTYWx0ZWRfX99zCl/sNPMmg
 3HIXGDSalYZVnpQLvreHpvpZllNmTuUmX1dZZK0zEqOIrNRF2enZMW4JoZlwE/Qsk2qHXn7oNmq
 6uHMWBUvnPVv7v+1xSXXs7U7rKKYbmp4R0B7uONUF8fPmXb5+nYCGiodbpt4ZiTez7TQZBkKc6C
 x46COvN5rl/XIAyCa0VzfLYEr/+JpdMCAkM9dye2I/72kF9KThajoEeXc2Y4PHm0ZVvYZ7RAFZB
 n70mem2oRh0sR8XntLReDvrbmeNnTYeuV6Tj47x1dS2Rkckfos/zwWyT054laSdSVoZ8OG0mc7s
 mqPdhtPOprwT2QLwLPcU703ByabHLgej+ZgGMAkf5JIJrsUSSSlb5erw3FD3TbHDO1e+VDB4P6w
 Uj7axmIiw7b+vaOoHaJseDnR47hVVV3uG+tP0mlSon6XaEhcQSTGkUv+BKMMy2T2AEDPvTq57vX
 8DibwujgOgDUci28bfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232928

libsoup-2.4 already removed in commit [1], so remove the soup2
PACKAGECONFIG, which may causes depeneds on libsoup-2.4

[1] https://git.openembedded.org/openembedded-core/commit/?id=94ebc5b798aed6eea642c5e2a4df24b386520636

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.26.9.bb              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
index d77e52d74e..7ff68e4cba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
@@ -55,8 +55,7 @@ PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
 PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
 PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native qttools-native ${QT5WAYLANDDEPENDS}"
 PACKAGECONFIG[qt6]        = "-Dqt6=enabled,-Dqt6=disabled,qtbase qtdeclarative qtbase-native qttools-native ${QT6WAYLANDDEPENDS}"
-PACKAGECONFIG[soup2]      = "-Dsoup=enabled,,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup,,,soup2"
+PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup"
 PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
 PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
 PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
-- 
2.34.1


