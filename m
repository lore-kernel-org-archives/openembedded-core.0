Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FEAFD5306
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 07:09:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89821.1772176154240404382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 23:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A4ohTCsu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651884c08a=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R666w72637827
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:09:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+9ZtXHBKkihrmhbRA3ZxVII94sAgfAyjUf03Me40Vl8=; b=A4ohTCsuQ0OX
	dPbBgbkB6unEQ/wJ/8003T9ff8F6GMYwQdgC9BvA5yBWIGjaMMW706UVfKm+VtJa
	nhwuNhA4+PRywztTCm23n0yDU0xZNjRXlfXaisrXl12CDvKIsO3xu8MbCDs0mpYC
	keNa6NiW2z4d4ADrfU8rPto/Hv8fsgw93qgUNHVGuu4vDVQ212qGpNzNEk0os7mB
	s3oj++DZo6M1VCfe7dFBdOUl12yNY55OL5ImUvE2i/OvdixICJHRME5Cg2s65tt/
	5Pun4qT59+DNBAECzjdfX/S4tov3n5j/lX7+BYPnB7EIa6oJ08UeEjZVKFixtTLD
	yzT0GsL89A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdyjskf8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lT+qi213PBJx+J1Eu9JP7JprkH7tgtHjHSvPrjkXPd9mnI9pRswU4OELK/ISiaZZdha7Bwlt4/LlzEW2reRrMpjTW3MdIstiS0uGQb0hZD6vw4XiaW1m3+GUTwhIms/Z8VmgF3I7GBGSxvaVJURN3T7BNfF3xAMTUNzCsKNEv1jR1teR9uzX6J9rf5+tJVy3IYahsHGJjKVwQuErbUiUJNJ0hKMRMcbS3xUq2d9iOHkarIyQroi1cxwKs6pnGPuR0Y0cVRJIVrml3isZD/NyrigSzQ4ntL2shZUXgruKKY/1vJ9NyPBsGc1V+GP0blznN37ONI/KYZ4tElGecxsSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9ZtXHBKkihrmhbRA3ZxVII94sAgfAyjUf03Me40Vl8=;
 b=jlBF9y6EtNmzQJyTcyoepu96Nrepgtuh8D2ZVFHPCVjiJwXbuAJYGmpMtKVugcQbgj5wxgErxkVANU66Ekm98a66yB83NR7XKazHNG/ieArFxQ3i6zG7kO0JYzzUL5TViMlWH234Hkh0aMm+zGj3hSes7vqqOGxInfWy+qJi8UvAcxKJe5HsE7uJG3iJh868s6Gf8RcdTjRezOJbQD28Oji3xEXP0ZnWTgUSaxJ6fo9AGduTWd8c2gYuXrB4i0tpOKDeo4pPs6X+ZgzKL95KVTBL6lMhwYnzZ14PqwP90Fg0jATWEgciozHXh8jt+uYydm5BvL5+haVMA5e/FToQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 07:09:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:09:12 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V3] lua: upgrade from 5.4.8 to 5.5.0
Date: Fri, 27 Feb 2026 15:08:58 +0800
Message-Id: <20260227070858.2687898-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
References: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0044.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::6)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aed95d7-fb5e-4831-015b-08de75cf1c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	LUENLzp9uE/yn9zUCSqcYwY4otSLuWAg2YEpSUy1soQ4DHPqHworI1MaRzxxFOvOFQb/WrcupGHRyqfYoCO2Qat4EfoRfUDmqhONHk2MvDhUvPOrJFUkvljAq03c8ScIUeBv0TdGUV5uZuiOKSSFAhHhoQY/+bgliUNs9bKBG/CjsimJd6RedHiLXLdWGDfRXJnLXLIBUfJLNJSO/oxZS6HDKgqDOKbT7lTa3fb5pX2DHcP4VAA7Im+YUso3hW4ivKEOdAplk1no6ctHXD/bgVhRCiAJEbi+Gcruk9IOvqMdXPaTuOzaUOYZvvsDoUHn5t0tZHh0ksjbWFD+h4BFs/oeTCa9xCFHmJd52/blK+lrNy7+A9HKBWZ3Q9G6yJixXRdRqf5cohIEF5Z7yumPeIMGBB4U0oEdolD7bhBoXRL+AUCOylSOJaQbOFV68q+MUABR+wBZwe+OPC0hmuJ8qemulHUIXzSyyanYZrEq1rLDc41KMEa/quE7LtuxcGAhyQv4EUUE7Iwrge2B0sBTC2QJ1XTt7zFMRwgM9fZtIm/XKxWo6YoyJAnFjzx0K/3LrZDXMypkj4pR+EXrshK+IMg+yB6LJBOgsVui3jMdKcnX0lJz9fP0Q+u1uFGWghocfDXwRQOpAtORXkIbesUoFQjpiWFyg4Fwl9LuVBQtMapE5bAGdAFiAwIIsXlwu41xAfWAbpUCVUbvkOmpveNWvXdmcIChMWia7g5HyLF22FQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FcZ0bjhrL1Chsmy4g6zzpr4Ba9b+Ksi9KQpJ8U+TIax34Ihn2n+Li1lYRap0?=
 =?us-ascii?Q?w01a2WAdRsfS7OVDpvxcAKBAQuGbDECL4o1+j/PTbLISSR6A+lzvchpgq8TH?=
 =?us-ascii?Q?uex2Bi6v/b2Bmy01VQxFECPIBdeeJIDgHWfZ2sXAf/fcQD4AllZLncHQZDg3?=
 =?us-ascii?Q?bMDVcQMk0mgH830Z4UsbhHM8ICPIE1kOaHj2V39GbatfxlnISX/LRy9RCxRl?=
 =?us-ascii?Q?VRTpx/NsmUuYS4aeMvSYVS8nAIVtS5MvdW35u11jwznvW0PhYoRj37QosD2V?=
 =?us-ascii?Q?5T8ofGmCprkfHzaYDtCtSc6UqQv9mvPNG7KT369b3GTxoCcmBJusqv6tozZJ?=
 =?us-ascii?Q?5oZt/qX0pwr17KJZufdvqL4HcdaJv1JFHuFahH3GYclqRpkwOUfvdzbfrwh8?=
 =?us-ascii?Q?TF9mdV6DX33mFVTkjtLM/SR/r/bntMCjwHqqBLDj/mGVpuFhX4scWqfit+1w?=
 =?us-ascii?Q?MuUvxvQYUWhc5ugQDC9XwvcvXQKxrQ2EKmRcC3RqWoFL04Dh46u+UfDJqVwy?=
 =?us-ascii?Q?4fMC4CuPggGrZ8R+Nw3znb1xIEIWu5bdqvLO7P1wYz0bxHm/4pgeBw3Azxzw?=
 =?us-ascii?Q?+km/qEH/X2bl9d74KZ/aaCLhvSjq+YiTlrU1sKZ2QwCu2qgfdyz6f6O0kYrR?=
 =?us-ascii?Q?lPkBjrJxrkDYwTou9Vk8aA31T/M5mqQjIlUDW21YIuJ6AWH/hub3J3cW3A0v?=
 =?us-ascii?Q?CHIGuNeLBiaSQE+7212VIlxaxr1OD/pHuI1nLFcbuRNAE7+mGshKeraRpvyt?=
 =?us-ascii?Q?M++snzMZR02xVOWfGsBQcyKOBEU/xKXBn/mnMgVNj5FNJYWxDZhdEjdyJbYE?=
 =?us-ascii?Q?5Z6ys9hamksvdbvhCG1xXsQMCmeufEkxmyK3/IBP5d7/8KgXPuilYsyfFup9?=
 =?us-ascii?Q?Pn/5Et/YlN1QGhhPghPQYQaFA0GVCuyz5yAj1D9GW0HlxFEd3V+rkWKG52sH?=
 =?us-ascii?Q?eOw3Lqknpn6CV3nPnyKYOPH2F4WBWlm7gbGQHY937n8j6Gp0mT6ytO1ZUslu?=
 =?us-ascii?Q?h39OKP40BZDi2skXCtZe0KcrfQtPJZXIGWvK17OEydz4X6Hq4o/jthC8V2ip?=
 =?us-ascii?Q?9KMVuzAeZjaNQDw+vCJtsFurx8gtUa753LfMp5UH7Dhi9ZIReCUjrlh63ZWs?=
 =?us-ascii?Q?rRh1bzsuGQE5iVxPKqHMG/E53Zuval91hOet9o0c2CyhwOzadivuqvZajnlP?=
 =?us-ascii?Q?UO1IJLRsOgBo9tMgWhn4bb+GtkKKniRGTqk6DO1F6+g2OukrhJPAmBfqYsgY?=
 =?us-ascii?Q?vFZOPqDwaPIquHdRQC2anTCIk9SAdc+D5cfLe6oCzLqj6u//m9tKLDKqu9gc?=
 =?us-ascii?Q?HNHkUbITRb1cumaiN19kKs5DDgAFteaAlR7ClWxTQhJ34wd0b8OUxLJWQpyW?=
 =?us-ascii?Q?JxiCThBkIa92vqwLt2KC/H3rG6W1x5zg2bBg0F0KvpV5Q8QmjP3C2lAYQiNd?=
 =?us-ascii?Q?+Tp3ETd4SIWMOPafD6wxYE1x1NBbo+tG69G5cLVXRZax+rIgG3q4hKfY8quY?=
 =?us-ascii?Q?r6ZJheUsNE3hYRQU1CYtbosMi9oyUbe8Ci7MHyy5KWchcbSLGT8hY2tYmf2c?=
 =?us-ascii?Q?u0To4o/x6pW+1zNQBpxFbuCgxWn9KVjTFO+8P5WTq4gc5IPVseQzONZB09H4?=
 =?us-ascii?Q?NaW5qxqAdEdXy1SdR/p3HiuEgNN1ihYu4neoVQcYtgqbVWY/BrXt3vFqw3KD?=
 =?us-ascii?Q?Fv+BiSuUOKgiAgAnrNeCLISUpgX2+wnewvzIQC/BVpBAND6LTBN/EXIrsi55?=
 =?us-ascii?Q?xATN/Vpt66jyRkTJk6Rq+EiA04HVnxc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aed95d7-fb5e-4831-015b-08de75cf1c01
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:09:12.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy85Pet6oJ44BiMlkhuP234TYX8PFyMepM1paL0Q1DkFw2eAFzwXSN28qQmkrywtcqQjYEEn0UBInPjxarNLL97kIW9PQxSX4PawGvucC+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2MCBTYWx0ZWRfXzjtnKeub6P/9
 MBba/hvOOMkJJGQ2vLGvxf+YZXaaupBVgve9jnM44Y+I2mM0jxc+LwqnSrRqzYRwcS9i7MH5Ku/
 wHNwSMEUONB42lUqo5gT3OPYhG6BvzD09wAXw+K5NpprYLXSzFYOCCWzn9DM99Ec85XCwtih5or
 GsM8T2E6kkdApCBVTX65C2R4cNuaqlpCwchetdjcOXcmhm2UR2ctKD4wsPTpSqiIJcdvK+5XABb
 TgduJf51Vjw3xDAMjwcpmQvNJpEkWGbUG1O7raRka8zG9dVs8Hu5+UjWYDHglqwH75xnAzacW9b
 hr0rzmpNqiMYlb7eA0Qoq0InaPSW2pPM2N7N8QnXzZ5uwnpGi/Pig6Sepemfx0vzwUHoWIrSWWa
 2KrrhRKo3lM/S4B5jV9xlxn4FcQ/TwTH/1lOqwelaqd11zfCdrHUqIUfPuW8RRQK+dHRY+waTQf
 QIqyUa8g73JJcz6eZhQ==
X-Authority-Analysis: v=2.4 cv=Cv2ys34D c=1 sm=1 tr=0 ts=69a14319 cx=c_pps
 a=+gGuMjfID3j0L7k8h/8w9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=z_5uEx5cAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VuS7OJ34O3rXvPyP91cA:9
 a=JtrFjcrP6MhGCbC1Nd-z:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zMrtHdIKir0iGtTdroD-jTPmGObaK02v
X-Proofpoint-GUID: zMrtHdIKir0iGtTdroD-jTPmGObaK02v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232080

Changes:
https://www.lua.org/manual/5.5/readme.html#changes

Refer [1], PLATS linux-readline is moved, and readline is changed to
load dynamically, keep readline as PACKAGECONFIG to allow user to remove
readline dependency.

[1] https://github.com/lua/lua/commit/366c85564874d560b3608349f752e9e490f9002d

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}               | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (81%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 81%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..86282b3f93 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=299;endline=320;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,8 +12,8 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
-SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
+SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
 
 inherit pkgconfig binconfig ptest
 
@@ -29,7 +29,7 @@ do_configure:prepend() {
 }
 
 do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux-readline', 'linux', d)}
+    oe_runmake linux
 }
 
 do_install () {
@@ -40,13 +40,13 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.4' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.5' \
         install
     install -d ${D}${libdir}/pkgconfig
 
     sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
     install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.4
+    rmdir ${D}${datadir}/lua/5.*
     rmdir ${D}${datadir}/lua
 }
 
-- 
2.34.1


