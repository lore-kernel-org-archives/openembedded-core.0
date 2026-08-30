Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADCCC61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 22:50:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18124.1788130203152368094
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 15:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=opv3FX34;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=370290f06e=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UMhQsY2382589
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 15:50:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GArAiE6BO3xUZ7orIjtu
	GxE29w0hJcVxX4EQmuFiGYY=; b=opv3FX34/4aKmlm5cKGHs4HhCVTC4Bb8XQ0w
	aZMbz3BcKFyEUZP5pCzpzn1e1fZOwWqafbpAV2DQt7SEdjKYLvEfNaXNUhYdHgFj
	9BkKfTPxvTUrEcESIdRJwp6EyxUThVcNLo8xuKlUlSMNczGIFpX/Cz39lA+1XW5s
	7KeTgOfmwIxttAAHzDQhzmFKTw2/2+9CuxrymCoBrV6wpELg6LvG4sBn0x3YXEh9
	+rBOzOGjxIASIj+VVK3CR8M1Nb1VOMsAQeY6Hn4Sv6wx4XkgzyggRCNm7oxUGXNe
	os5nNnvl6Uhe1n1lgIdY17PfDtRJPUMOTDjJv+QyQZYcK/zGMg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020112.outbound.protection.outlook.com [52.101.201.112])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe9bsx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 15:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk5MiuLDfR/9E/kxIhDuDqieQR8+fbgWYZFaa8/4MzAYn81kLw9qd+6WPGwlch8ULKp7uknvfIJNVZPMlAlwaRBY0B5fMNoifNpLsetncBTG1sATLQkRWTJGtLvmfrNJh2l9QXTSe2oXhYZAufLxXaZUi7Y8y7B7+J0HwvQ1CC3MVfHswYpthuJ6OGEvI3IfqoW96mGuh6xIMe5nedX3t8b2JeFa6zc4ODPq/D6EeKY78YMq2MBDAu2F1idl3yBSneMdiGtEvwsmxY+cc/Ul4eRPNRA3TDrE7fjY1kGQinhoFe+nTkxmhny0crcDVy1FsyTXKJDYlTZG05XDK9FRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GArAiE6BO3xUZ7orIjtuGxE29w0hJcVxX4EQmuFiGYY=;
 b=hoLYDR2gMxu/wqWgWOLMutkrBKfpC67ikW/Ij8BPkfjaOwHnK50nD69HrZF7eVuVYSkVDaR8cPAfXNXRCF30D2zHmzlfwhEaent8odc3z7ZUE3rLy82nHj6Yc5XxHeFgOpl1Hc79ltA0VoeT7ii8c+YfkRfF6V6S4qBziwNPqIzhRD13L4Wq3HlCMrQ040yqFHMgC2Vcnt6XLnq2kupNy9T0Dpw2Sgxl1B+xJ9H6UJrKv4oRJdK8cJ1A2z/vu9l7qEK2Oj0/vspjrK92kG8t2TkFSsb3gr3EcgLTG3yBxPsFFtH9C335MvTK9yKOvr/LY9NKfz6ldFKwQNMljxoRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN7PR11MB628000.namprd11.prod.outlook.com
 (2603:10b6:208:5f2::11) by MN2PR11MB4693.namprd11.prod.outlook.com
 (2603:10b6:208:261::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sun, 30 Aug
 2026 22:49:59 +0000
Received: from MN7PR11MB628000.namprd11.prod.outlook.com
 ([fe80::9c22:d06c:c830:3a83]) by MN7PR11MB628000.namprd11.prod.outlook.com
 ([fe80::9c22:d06c:c830:3a83%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 22:49:59 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] toolchain-scripts: fix kernel host tool builds broken in the SDK
Date: Mon, 31 Aug 2026 01:49:43 +0300
Message-Id: <20260830224943.58097-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0133.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::17) To MN7PR11MB628000.namprd11.prod.outlook.com
 (2603:10b6:208:5f2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PR11MB628000:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf4d3a2-8ecc-4009-a909-08df06e904e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|52116014|376014|10067099003|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lVsNQkT3ZB4fUoambxdw2bzt+jdzxCgZ6aLeGO6xrIq3oTXeFe7KJFhoPyHt+C4BWwDv7bRct0L/ITZTkLmA7S0OOPdDuCVvyjBpd7Egn1VsztJjWL5zaS0FCGSQccPnz5qzvRIOZP7670zmXWRSWSqgmQHDzx0kZ91x9ayEpCGNkTgbYNjud6k4L+46LEc3m0PS38EjUtKNLDhhg7FGFoBSZk5pVpQLa+dk04xJvSrkrSgDrGHwH1+1huKKwbmZ+UCpKILbhlp+ymeplm588vRkeXWP58XsgPv88nHxH0x99H4m70PwbrgdtarUhOsLmEqhcfWh8XeMjicgRWQEh+wEYis9wk7nYIma9mTFmW7RcngMPRdpVCyqt8jYr3UtnjmXAYGLasH/B6Q6cqOWwFZW/2wyw+/BqyZ8lWWdIkZVSC5DV6m/xFkdXBY8G7d4vo0rnLjfCb3ycg7ks20CvbW3cRr1Afykl+WX4w8z4KNGWbejvGxQuOVjg8mwkqNa5B4P0KejDqy9eXUmU0OrBwcMnILM3fsULitpBcO8yf9y3/feTgOGuzvWQs0hrsbNFOyjTNVADQG15+Zi0ecu/sDH21WGQET1/kkDN6GdcB/RwpC1fr5q2ibHXEIY07upEJmw8/dO863Vm8iUJjaBaPRN3xj1SaNYhUtUCgeai6o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR11MB628000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(52116014)(376014)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Eo5lRPkJocnttvUEHLZtjt35BKODeaATK7nchtOOb0BtLM/XmGBRuxDOFbBV?=
 =?us-ascii?Q?2ZmLGSLskvYnCrLEcikZMvI2Y18pBIJdZ2OePPh5r9L0CZwkYe/xU3C1ps8S?=
 =?us-ascii?Q?JZQ1XXx8KtxivjwqGaDz3m8+yXJpQDIfIgkzxqGSORlE8d7Pb8l5WLR1EMvx?=
 =?us-ascii?Q?wBThZ2GcL4jFWAlBiWcSRdHjgEQ0dyHdwmBHuVo61d03p+yw/TWp+JJIbSNC?=
 =?us-ascii?Q?hFLUzTqJNpkTbTtAvJs+oB9q9yJf2J6fhSuCwJFCE24DO6yGh3Hjk24MQVL6?=
 =?us-ascii?Q?b/NeIx28ZzXodBVUTKnigV9hwT9PhRjjyiM13s6tA8978rcffOjW4+jPF2RP?=
 =?us-ascii?Q?h3rofhilQVNdDsTb45nfyHOdzycCWbYNse5BebT7Mub/fbVWOkXvWP7siU23?=
 =?us-ascii?Q?x6KnfHmYoTm4Bpo1it4JSODTJLz6zZyxWKz62LYxuiI5ILaMtUllUronXHQ1?=
 =?us-ascii?Q?YYbljE9mPo0avOqp5DLA0zRIahUnn7bhXukwvc393KShijXbgW9Z+zNes6hM?=
 =?us-ascii?Q?/Zv5I1sDwPOzllHz40knaHbzqzIjaxZ0csOIgC4oZlnrySmBIIg4ZvmSpwtM?=
 =?us-ascii?Q?hb/vOtWy9FdBa138ZkyxPKC7Fddz799apYDtk6qNpDEqdHLGYTzXTDzRwhUV?=
 =?us-ascii?Q?+X6YiRRC04ttk6d+GPqyAWv9itqsWGZGbfNhgcJLNtkASJ+Wb4ql7Sxjrmh0?=
 =?us-ascii?Q?vMa6EDdHu9GokYzuo19hgG4MFe74P3pKuTTF2eJJ4hF92Prl1oTNDgtKk1jG?=
 =?us-ascii?Q?Tj6vo4xpAAHLt6H8j2aR2XS8sLqSW7OlsToZ0RraK+S9pM6fDckvcjySzzO1?=
 =?us-ascii?Q?MqMjXp/I8dAFO0w2dwMgyXYe+BP9kso14o63NaWcb/tPYVOJNyyJSbgNQPFg?=
 =?us-ascii?Q?qsv31IRFKw7twUYV/JH9RyxhFXVyx8MNTVb7j6OeCRTRARuBvQihE4oz+DlD?=
 =?us-ascii?Q?0HZGjVdlbqx0KIOh5XrJ+k4REHrabpmCZqAr+x0Cj5lCOVVoex7l9hNwIz7N?=
 =?us-ascii?Q?3HuRAeK/dWMoUGmvdIxpcfCUrc7c+wRTjkuWtazTPHfRW5p7zeiWUs0wHdLm?=
 =?us-ascii?Q?DsNttq9bXjNF+6Dgky/Z0kdWDofaFjDNRq59KDULyXnPkL/Qt0d/UEKHc8Rd?=
 =?us-ascii?Q?qv4AdclJNnthFXxABYuRYUsd4jTokeuQnQmkWYZiAoS29KhQiFpIGEtapd/y?=
 =?us-ascii?Q?w1nLtQ0mO/BosjWguyNq0dMWILe7t03UnS8jJBHWu8FSAkIGp5dCfXmmKxKN?=
 =?us-ascii?Q?54+XhdXtus3UI7JMzUvoxT4uAzu5pg6T2nbwlNJlmKo2gtwqIjtHkjWUHtrM?=
 =?us-ascii?Q?vqFvon9GeAJl1svs2R2dEEX2pq2VsA67eGZwU0h+6WM9Vpwj1JXsZuIu78cJ?=
 =?us-ascii?Q?SQgqbYAONQ3X9kKfS5uaCDVLII6VZJpuz6QSyxmgidmIdVqpk3W3GPMFuWZL?=
 =?us-ascii?Q?sIvUemAwLesL/nuZBNaCV3HGi0+6DTskfZuBxSWwFPjIwAHKkt/lyocMb20/?=
 =?us-ascii?Q?5wwoAipYWdha66V9hGpc3aLhAtGhsafkopqQhwgmmFChpN9lwHMRIfCmRjx+?=
 =?us-ascii?Q?9n0d8Os+gF+lK3bHJl4S1+sAPOrdguPMFL/tSZyfKCfArdk3L4F+Bv682uoc?=
 =?us-ascii?Q?GwpoWqZAVex9a/LW+0Pd71yJ6qN+s4OJf9os+EqVdU9V1j9hO5A4deZ7WvNR?=
 =?us-ascii?Q?Ucd0MBHNjr0VidcLAlzJQLSJdGN7xbCUNhgOBs5GvhE2Jd1Qim21fn9uJ8OX?=
 =?us-ascii?Q?3aKFl3lIRneW1qxrr7cPN9n9+TVtzYZ+zmOYb9+12Imf5RBHgUG2AfLOwwAB?=
X-MS-Exchange-AntiSpam-MessageData-1: fWLROAHtuRRA6PHHqef5hkf4gSIBfMLVaZ8=
X-Exchange-RoutingPolicyChecked: 
	2xcpTbqKAO9Y1hYFtERh+7vWGE5GAMK6sTuPvcqFx6vEQeL8xs4AyLV+LBM4yqVUkF+ORzAXMlJxSEK/2THFPef5Ujh59pvQgOHSX4V8XDeqfjg6WLqJejvb0lDzSNtyAQldby8Likg7xRJDysNLNzGo9xiSo5Wd7bKMC3M9X2IXWB5vBvhaylJDpLI0peKIczARCJrZB7n1et06TCEf8zNwpYc70SNSRJ4oW35tUsrNASBweLdocXt/YNL2tE+WZiLmo8TC9Vrtxn9mmeBEUUeWA7pAP6R865FUwvBvAx8h9XKQMdNsYnEgd+jmi9BSXROBCnO0xtH55iy6uXloNw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf4d3a2-8ecc-4009-a909-08df06e904e9
X-MS-Exchange-CrossTenant-AuthSource: MN7PR11MB628000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 22:49:59.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klJWbQRje06Qy/2rWWGLlVAGCGL4/ijxWO2GtdPzr8a5+HqCyZSeGnjlfrKtSaLtvPorvxLdLqFU0ko3eLc3vp1Yyf1q5xGm/MrKKt54/TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE5OSBTYWx0ZWRfX/gk3Kx7UZBEj
 nv9kyJ8BbFcijD/UViDUYbIYiSJTnzsrdpRZJ6koOzw0D/VxAtwvJ0Hv8YNm3gv6h11v3PgtR1/
 1R2MdL6wuG8J+P8ktzg56JfhGv4sUe2QXNDGzqdrCF7o0UPP2D7COopTyON57JampjM8Cliiohu
 NdrgP8DNSsDWJV7E+HK0LhP9HRsfK7xbRpDkYkX4BPjj0lnAP3Hz/AeYKMMaJE3tGoOBCQRLnK1
 eW4NmM4/QZ60EMydgb7gpJXQgoyfZTcFfI7s1qO+ZbeNgv6RiCT8Q5O6GYDlMRUsHr2Jt4SMUJl
 lEczf+GpY+gHtOKQ/vLtTJ6kmg1qH24MRiyOzBMMhPDwkMKtGQD+2tccXM1IQZuAsgFPLQC+zQo
 sf5TdoOSq52iU0ownPezSLGdCZJ0uJhczStZP19R7O4XT+RMFNaUo3HP5tyNN3S94Jhyb2YkeAr
 QPZqazhiXurTH+1YI9Q==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a94b39a cx=c_pps
 a=cE3fiHRxMl4nLvvI2vbFbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=MEhKQXDtAAOrrqDgL1YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE5OSBTYWx0ZWRfX+H8IEC87M50s
 z8dz+oXEr7Cs/8BbG2yHtoEAtKoByo4xHC2uRbZ5soLJ+mIB5Df/5H0Ha6wPGh+x+dljttIGf4D
 7uCi3nre3PczeTeMwCtV3fQnhcitH5GLhO8+YEVLpaqa38CjyTDM
X-Proofpoint-ORIG-GUID: 5YlEo_u8J7RE_V6g_WO1l4yQ2YIlTy4o
X-Proofpoint-GUID: 5YlEo_u8J7RE_V6g_WO1l4yQ2YIlTy4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 22:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244726

Building an out-of-tree kernel module with an SDK fails while the kernel is
compiling its own host tools:

  $ cd $SDKTARGETSYSROOT/usr/lib/modules/*/build
  $ make modules_prepare
  ...
  /usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined
  /usr/include/stdlib.h:219: error: redundant redeclaration of 'strtol'

objtool and the other tools under tools/ ask pkg-config where libelf is, via
HOSTPKG_CONFIG. They are host programs, but the SDK environment sets
PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH so that pkg-config answers for the
target, and that answer now contains -I/usr/include. Passing /usr/include
explicitly with -I makes the compiler treat those headers as ordinary headers
rather than system headers, so the warnings inside them stop being suppressed
and -Werror turns them into errors.

Ordinary applications built with the SDK are affected too, less visibly: they
pick up a redundant -I$SDKTARGETSYSROOT/usr/include and
-L$SDKTARGETSYSROOT/usr/lib that they never used to get.

Neither the kernel nor the SDK layout changed. What changed is which
pkg-config implementation the SDK ships. pkg-config dropped system
directories such as /usr/include from its answer on its own. pkgconf only
drops them if they are listed in PKG_CONFIG_SYSTEM_INCLUDE_PATH and
PKG_CONFIG_SYSTEM_LIBRARY_PATH, and it compares those lists against paths
that already have the sysroot prepended. So the lists have to hold
sysroot-prefixed paths, and the SDK environment never set them at all.

a3320989ca ("class/pkgconfig: use pkgconf instead of pkgconfig") already
sysroot-prefixed both variables for the build environment, in
pkgconfig.bbclass. Do the same for the SDK environment.

Checked with pkgconf 2.5.1 on a .pc file inside a sysroot, with
PKG_CONFIG_SYSROOT_DIR set:

  before: -I$S/usr/include -I$S/usr/include/bsd-1.0 -L$S/usr/lib -lbsd
  after:  -I$S/usr/include/bsd-1.0 -lbsd

which is what pkg-config used to return for the same input.

The native sysroot directories are listed as well. Setting either variable
replaces pkgconf's built-in list instead of adding to it, and for
nativesdk-pkgconf that built-in list is what currently keeps nativesdk .pc
files from leaking their own -I and -L into host tool builds.

toolchain_create_tree_env_script() is left alone: it already passes an unset
$libdir and $prefix to its own PKG_CONFIG_PATH line, so it needs a separate
look.

Assisted-by: kiro:claude-opus-5
Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 5bdf22dfa2..e971b9a270 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -63,6 +63,8 @@ toolchain_create_sdk_env_script () {
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':"$PATH"' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
+	echo 'export PKG_CONFIG_SYSTEM_INCLUDE_PATH=$SDKTARGETSYSROOT'"$prefix"'/include:'"$sdkpathnative${includedir_nativesdk}" >> $script
+	echo 'export PKG_CONFIG_SYSTEM_LIBRARY_PATH=$SDKTARGETSYSROOT'"$libdir"':$SDKTARGETSYSROOT/${baselib}:'"$sdkpathnative${libdir_nativesdk}" >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
-- 
2.43.0


