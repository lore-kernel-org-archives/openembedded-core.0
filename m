Return-Path: <rong.fu.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AA1CD5BAB
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 01:34:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7734.1779672860014404186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2026 18:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PReiApwo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605345c29=rong.fu.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1P2xn1273131
	for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 01:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=O0vZHJ8XEdFFiIpqBCf9
	ejHjgmH5RlBzE9Axb3LgVtI=; b=PReiApwocr6EXSBlo0FUZKOAxUOMNYDyl3mM
	8NMMgbd3ehUCOcfo17N8xPjFJNH0nrNM0mYTYhXKWOHCYlsM4uSu859U4aOrfUGj
	VKgTx0NC0OVOXKkHj4FxtBHGwnScolAvTzejb4jk1GE/Ll8og4wFjIn2HnCwlRZF
	zmNjSaHi+Ur6jl255zEGG5QYRuEybU7zn8GQLgnqNk6U4WW9QYTWaWNzWzeluzxd
	hHgVfKBXasKR8kCmdpOp0OSJR8gh50LVbRNEeaix7kNk6E4NRvHD50vHCXt7NDAA
	lhTlmMNGBoEAcMntH0cE1k4tVgHfSr8Tr/QE1RhA7YrFQuYrhQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f02005-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 01:34:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgAuF/JwP0c/Q/xetWCZLlW1EYObAmgowC26zGjGzuWUpl9/03PX4U5uGp8uLrnfpyLUyawtOieNUeKmNYCI2PAY/wcAk4EKp587aCnBZTkMVVno1R9BdFcWAwjGaftZCsQkFjX5wQ/yFFqT/bWvAG8d7Jr34exPj2BUXqN4LFRc9UHxpD0IgZCCtxhdhrZt6FqciqsNc+q1T4tp4tR/sS3nLTwrnZnoeHCJ4Pv6E5rBcrBBSBn7pVIg+fphTSrSe3xktVbXcxg1F5SaOiuPX/25ptlF6olforGxsISqVTZsEm+L7GVXljmghue6N9hrIjNAGxX4Pdq3MFI3y8oMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0vZHJ8XEdFFiIpqBCf9ejHjgmH5RlBzE9Axb3LgVtI=;
 b=Rd1ENTnTsvxYi/aOQ5Y4v+rYVrJweFZwmxdLN9uqG6EOC2xKkKI8P9e4Re6CNp0kMcwNgSVpAs2VVlLaTsspiLqx6eEEJXagJTvL35epZfVvjuG5XjWWufx78yAmOLVBR+/aZiiW5W654G0Xl3387dSCkRmR7l7Hqj9IfazV5AltwuSf0yCaz3Vr0fpDOIOjglRJastHhS7q42d/TnvfjfA3wpqdMTC+YbWbKTX8xYP6eali2s+JOu1fvo7S6PTlLJehlKcCl/xwbkMfl5dqesTjlnylHCxmDeO0Sr5m9sFEmc/az67VecUPVIjefaNTv22xNYIu7cHwBbJD0he1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 by DSWPR11MB9740.namprd11.prod.outlook.com (2603:10b6:8:355::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 01:34:16 +0000
Received: from LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36]) by LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 01:34:16 +0000
From: rong.fu.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Fix ptest failures
Date: Mon, 25 May 2026 09:34:01 +0800
Message-ID: <20260525013402.3744277-1-rong.fu.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0201.apcprd04.prod.outlook.com
 (2603:1096:4:187::23) To LV2PR11MB6069.namprd11.prod.outlook.com
 (2603:10b6:408:17a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6069:EE_|DSWPR11MB9740:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4a0f55-a4ec-4a3b-c032-08deb9fdbbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|18002099003|38350700014|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	8v+MGBVtWZoPt+8vjlq6JVAL9FvdgWltUSX2q1L0Au13QzW7J/TflApV1nDeBDhX4/P9E6qeSQzQMAfl8aHNl9xFcIfBgDB4g71uXIM7IlP/b9ccUve16Ee9d9SqdFw7+W1TWLbVsZEhZo8gcDm0v+20dchAOOcAatZA9W7A1/knwJLbI68miOZ6a/BtZisj4n1YLuWNeN9R3bRk4iR0CXkz3Vkjjlltw8bFhramRrFRBz74quLt197QuwLSgYGucVdbIDF57kg1VoUuZ/w8F9Y4U5Jqc/N/ah4dbc6S+4LaEFG8LVgF4OOTB1quaVjmyKYeUuv2tapM+5yOMc7oiwAof1Mjx9G0/UgRJ/u/jkc8D+vl/XoUXa/OAxUL1PRh+MYifAhzaX+C8fc+gRazgPTDx0FS8EP3djbyYySr8h3ZbzSpQC/bcz8iuic4yJIMSVcFtyIS36hcR3ciBhk4TYkHsu6tByDISObBPK+S/FeabTY4YxrTkQX33hAReKtsOxj/2dL4HVQHBi3OgjJQh5EB68rlLm9QfporUeQsF17G6rxqC28rO48InvDeieMHecoecFha1iRnHndvArLaEJJUSX8g5wIc+GnMwMyBMGmmRbtimMcYnv2kwrQY4JY+4eyyY3UOHK42hQTBSP3IWvc0/FCm9ugs3pkZygX4JElhA/HTCFg0hoQ2JkgaS2n+StqETlt3H2lb5yRTBjz6yMbjz6fcQkcFjfUic2mZ5nPpAYADGqXjp5pgjsQw1FJA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6069.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(18002099003)(38350700014)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CYwIYjPC/x9T0Ym8CUo/HPFLSMJp+H0Om4baRTe9NpZlNU2J9JTkw76AHE8y?=
 =?us-ascii?Q?QRqjH62aDX6yDhuWUf6I/20GZ5YjMH7qaJOrknD0P0+G/9ixVSgBsxmQ+yb4?=
 =?us-ascii?Q?85cciOfZJmLTFX6cKwEdr3B7g1HP2fq+QTa4LdmOkXYbnKElwf6b2w7B1kE3?=
 =?us-ascii?Q?Y/h87me2IRJ/QM/0hMNgf24dPlRfmvZ+sG7JTHKtD1dT8PWgZDCTm12DZE1p?=
 =?us-ascii?Q?9X00nTxVLiXSukGCIqQ9jlFBI0MX97UzvvlxkeDLFpZZtOdv6lSZ/An1V8Ih?=
 =?us-ascii?Q?xRgZ9KVzWeXjDP2bGFvO01mfypUsh09HZVxRsTy/2ewlwGGxnwsb1ZGcHru4?=
 =?us-ascii?Q?0vOAF7op70pVRoERiH+Aei05nB+0gMwMxW9rbqgl090QWJHNZIwWSzTw+U1z?=
 =?us-ascii?Q?sgnQFvf8HLEE+E03ggwIF7S8KBuCl9xkRzzi7femEw++EFgyvgIq0mApTOF7?=
 =?us-ascii?Q?IfsMYrbsQF/FH0D1J7hUTMqapZ3wTKOKpVurd6SdJ5RDq8gPFH+SDIkRyJjY?=
 =?us-ascii?Q?j0nIOqyVNpIuispl/MsaV33mNnBZVY2mtzzd+nr1RoEcTuf6aY0aj0R4YUzi?=
 =?us-ascii?Q?5+azvE9VgXy6i5KnPJhyYanYp4QZGndX6xSIk1tX7Iw3xJt5I3xndTyygyt4?=
 =?us-ascii?Q?e4I6iH5DGxh928WvYXWILAN3UXAz151kjFGaEkV5x3NEWJEOjRG+i2ZYsD84?=
 =?us-ascii?Q?SibLDFcQ08MLWI8pNfRDcDCQKCBVSZyO5zg7jZn0+PBYrFo1QyaOMpV+z4to?=
 =?us-ascii?Q?2ksjHKP9pGynSjjepq43tDffCLCcT+gZdHWW0olRDQfuc89ElPkxreQTbqx5?=
 =?us-ascii?Q?1EiE+lAfoKPuGQADaT1hf4jkmVBbGqucejFWmw7Z79T807UNodZOFN9woRWL?=
 =?us-ascii?Q?E80OfGVJbKc5MLvCa3o49rP+3iNsD/SwXhkG3Q8+EOk880WN5MjVE0x9wlQZ?=
 =?us-ascii?Q?2iBS/HGklNOsbXjmwFQF26IFQ1MHVE+dDiJ5olY039/WaqNNwFtjcIJ46fCU?=
 =?us-ascii?Q?/X5MZuNcrIf+R9vTBUAC1BNU7tdFyxlzVGr9hvKIXiigO03MEMkDZd+UdZkS?=
 =?us-ascii?Q?4X/nJLMBLT0FjoyhMUSHiLu9DJfHGLwIGpGp0BTpSrsaexZ1BYke89+iQuko?=
 =?us-ascii?Q?gwi+NMd23OHa/PHYqcLDHQX42KJNs71+/TZkuf2msvPyHr9AW/ojsSkhICLI?=
 =?us-ascii?Q?UvCYt3q/bXkg8PWJ2oO0XFoj2sbaGap9W09vf/MAXzrk4tl7ReWYM08Hymg9?=
 =?us-ascii?Q?c1mJpC76Dtd2Iai2Va0qSIK8czvvzwDfCI0FRJSdVp2DGCCiap2f4zIRthEw?=
 =?us-ascii?Q?PpEsAwngZGccBxfqq2dmd/Lm1uN94CPvM7k2r+ZKL2vZmaxMK9P+itz4VckZ?=
 =?us-ascii?Q?zTTKZ/JaAy4DKnNYkOEfSNUJ5xTN+yyV/PFzf2WZdr3fyqeB0tcNoRdc9lUn?=
 =?us-ascii?Q?Ecf9gD98E5EPav6DVz5R6cj0c9qLZYwiBDZsc+g9G10u2c8jJsXRD5P5XgmL?=
 =?us-ascii?Q?wAmZzQhiNEw0faEw5oIIuT8uGzft/e60Rh5znKZG3//akn8VleSeCQnhwgpZ?=
 =?us-ascii?Q?vJ/NqOcFF8rXUE7A3YeOMc7u69ZCcaGcFLHkN9vZtcodF16w8QBdx6dsF9C+?=
 =?us-ascii?Q?b6SaSCCe1RpP8dvdldBg/MH4XiRy1i9yWe71slPvskGiCuaWCR1ldhRh5UKi?=
 =?us-ascii?Q?Hg8HNJud6Db571sXvBxQtODfCtZcKjU7h2WvzVOJhVDWLHoZ6/f6VUucdZjY?=
 =?us-ascii?Q?ea8Fku9GoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	sTUwLC49X+6EhFffuZXO+AZ4D7GTc7d1bOHwhN2tdRD57Z/BSI03d4HVSnGNx/YvitRFRKbnGTxaOf6KkNdUGS2dmt4GjzvdTxZdsozlwQ4EMcLfuNf1Hfr08rD9bR6rvB9NC5AS2pUKSfMARv6nMvg87t/+/+p+PqcTdyDz84Yo5LsKCfXIzGdyu2HybdoztUt/Oj7CXt9FsrmDimSqJ2lIt0jJJNYPitRFeTiUsT1sag+OpiAUK/Rxgz27qf7UquGLyPnV8JwTG6o0SV2jdkw/uHEvDae7+c+Q/gnSSI7iUWqiKahn+g6RW3sJ9xmExS0eC1g3VaiP3onJToS6Rw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4a0f55-a4ec-4a3b-c032-08deb9fdbbd3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6069.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 01:34:16.4561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYHIW7y6VzdG0kgF0e5DZT3A1IO7b1B540fjGYPOXkImXDInOf1p16+Rn+I8/1zPquzkxThHmKliKT9/j7Ll/izO7IsIy/zWJEBTcWDC1B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9740
X-Proofpoint-ORIG-GUID: 0yc4lrCyTPNyDT5O_a5kqSHUCDM3p51M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDAxMiBTYWx0ZWRfXyETEcWjnrV41
 N/RZ4g3NzK/yDVz5KMLsNCbk3jmy8byXwdLvQwiXA1paYVEi8qLv7I2t6x/VY+WEDJRzj60Hj5+
 ao/OQn/22BlDr5dc7Xn1OfnJw0I/S+ZHt5IoO/uqbzPW6vytjA841ivjl5v5ogKiEIYMjJBxPrs
 leeUydxTPte1KNYg/PVstaTHTTIASV/rvxFUpw1I+PlJWFPnMyHsxUyzK8JuuTIoywKPv5/5KZt
 h8MDiJYves3GICcVwUAZyBswgCTw1OBdJL8rCm7Ze3lJlj2pXp9WxfkAZsh/bKCR1+qeoXoUOdy
 UYDMYdW/kv03m7ERrur3Fl/2dPB/O1GU+Xu+XJeRHhLMcV9y3Yj7wf5+scb1ipL4AeUzNnXJnFO
 lVAD/gpE0/tJma16MFlk8QZnkRuPZqyrHIVd8dCaLyNHWKCtpi/Im38eUd3ftchHQJQz07X49AV
 /f0zaIe/kNWxZx0YDEQ==
X-Proofpoint-GUID: 0yc4lrCyTPNyDT5O_a5kqSHUCDM3p51M
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a13a71a cx=c_pps
 a=aOchWjQmdX1ADhYh+yUFEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=4cvg5CL6pUHf-Wrj8-AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_07,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 01:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237567

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Fix ptest failures:
/usr/lib64/perl/ptest/perl_langinfo.h:8:10: fatal error: xconfig.h: No such filey
    8 | #include "xconfig.h"
      |          ^~~~~~~~~~~
compilation terminated.

../../../../reentr.h:124:16: fatal error: crypt.h: No such file or directory
  124 | #      include <crypt.h>
      |                ^~~~~~~~~
compilation terminated.

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Rong Fu <rong.fu.cn@windriver.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 3 ++-
 meta/recipes-devtools/perl/perl_5.42.0.bb | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 4b4756118c..b33800ba54 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -59,7 +59,8 @@ python populate_packages:prepend() {
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
-RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps"
+RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps libxcrypt-dev"
+INSANE_SKIP:${PN}-ptest = "dev-deps"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index cf28067bab..f61978a3de 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -104,6 +104,7 @@ do_configure:class-target() {
     #the others in config.sh).
 
     sed -i -e "s,${STAGING_LIBDIR},${libdir},g" config.h
+    sed -i '/^#define.*USE_CROSS_/d' config.h
 }
 
 do_configure:class-nativesdk() {
-- 
2.43.0


