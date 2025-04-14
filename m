Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73282C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 05:35:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43345.1744608916749946927
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 22:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5K7tb015814
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hkvj-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcggvgP4ui+qJmwwFJuG4qQvNpHB21MpK9nUNsvpPAHq/tAo600PGG1CBwrUMWwl15xZ3Prt3NzrULBx4DNfC0xQSgrgTOnDpcqlfVy1GYE/GSP4mMsJjyW+c1nIQ7nVyYDOg6yTlztV9qzX5tc5/1KGy/kGcnzk88iIdtiw/saH346j7aQvIoOiUQ7Bw2mZ6UrMr8LsRtp287EpSb7gkxHaUESsD0uGdzUL9R1bOhaUZuby8xTlZ0V84Oh4ggTqY8jeIT+995Pg9eOIQ39Yn7vt0Ye9GThsgNFmxpGt0dMX5qQ21RlPqatIh1Yq/OOEqug5od2VfgdyZYzf5/jFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM+9hUPApbZJFfMH6gvLfT6nxSPGsrtp/VqZ6wjt2/8=;
 b=jWgOvOe80AQP6BBx9vGIAWxnqcRqfWVUossISsZLsAXQN/OPeZ7GtUAiqXSPiGttg//EtPoJOZCuvyl18WLdLNOyDoTh8/8iEX/cAcwQNfFa0HmYZT3Pkh8Leiyk/6TU8kwGfrFRHGrI+QWHmkQ4Rucg/vER1Ng1UjE+QGe2sVkm8wiPzv4AAvSlnSFjw/4ibUlp66yymdOSzG+klhTXE+cIrJ2XweTsKkoQjMvBV/pqgYKqlk5IkgqkwTcteHxJWIoPl5uE4EE26XU/7dJos1RhfN4ffqxcFLdc0lHO24WFbnsHbJWDhhDKFEO3NhxsCXMnnw9Q1xGMI8wo1+aOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF066A3CD44.namprd11.prod.outlook.com (2603:10b6:518:1::d07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 05:35:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 05:35:09 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3 1/5] classes/recipes: remove unnecessary qemu inherit and use qemuwrapper-cross
Date: Sun, 13 Apr 2025 22:34:59 -0700
Message-ID: <20250414053503.1180029-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF066A3CD44:EE_
X-MS-Office365-Filtering-Correlation-Id: 54467606-8edd-4596-cb5d-08dd7b161f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E4YoD6abMngVQS13JcsCrbvQO2+pnOss4g2uMjSQN4RayRM9Y9OvPr3Os8UY?=
 =?us-ascii?Q?7STAHxRtG1a2+nC5puILcABDMtr4I9UsIczBUspmMNa3KhjSEFjfa5Kq0Qoo?=
 =?us-ascii?Q?axrneyrhlGm39j7MQQhGLEtBCCoe4XW1XSqv/GZuhrF+bcVz31ENOoNynh5j?=
 =?us-ascii?Q?G191aGaQp+Rm5hGU2YcqZuQVmuybJZH3fe79yMBFRZ5iqLyH86PyF6nGMAc5?=
 =?us-ascii?Q?cO65XnMY3FtZc68+P3TorVFjWET3IJXskpJujN8fMWNbQy62WrxuR/UYNC0i?=
 =?us-ascii?Q?7+g16xqX3WJ6D70GO7qrS0enKJgnIQdccLaM3DpBfmhFy7/+iTgxPxj/Rtn+?=
 =?us-ascii?Q?Mb5k3d+nefhErjln/0C5txfPbOu1OxA9/ZGGBUfQTeo/rvi5Hfsl0M+wIbau?=
 =?us-ascii?Q?rzMb9kTg4MOdfUZ971DllXl/0En4xrjLPIf/5EQbh856b9LmdbVpgfO+cDLf?=
 =?us-ascii?Q?sB/i3Bh1EAoaQ9cR5MzDhX/4lok0wCwk5/fkdVPafTimubZzKIhvg35nbZCg?=
 =?us-ascii?Q?z1NQN9Cap4OKYks0V94PC1eJKdpiJ8GWkasNryzc+gUhXcoENaCbSuyuLzA6?=
 =?us-ascii?Q?OWKE9W0SJeDH3GmQ+mbjHF+m2MmHWVxzXXuWV5dPuSerKNBrIxp7+6AjOUEM?=
 =?us-ascii?Q?i7/wsEO/zXZ0i6f1MeGPeyJvioycu2srDVgTtsvSAgiXhqSggpdE67tfTeDa?=
 =?us-ascii?Q?f29ogBdjLucaIsJEzY2cKZmEntBYrIFkBggen483CVx10WdkNLySewPq2WDA?=
 =?us-ascii?Q?EMiNUHKQqD6P+d6dhSjJqtToigsvt5ranFGzvb1upOPotIk0fXjUl9OmigJx?=
 =?us-ascii?Q?pOSwnzWyh7mnuPrnO9JXNn8Cev5JcE6bXVr4/YomJBRqurYBVLTV/HJDF1u0?=
 =?us-ascii?Q?rqax9N/JTTvMm2NQtpU2GVdRx5AKDyo7pzBWhX6h6B5ah5wTKjX/qFeRLylw?=
 =?us-ascii?Q?zgQ9WZHx2rO8Zk2eSW7vq0lvXedb9OMuHRaF4Pe5gwd2zwCSMcWAnylMO0e7?=
 =?us-ascii?Q?AaC95S+zrJ536UvuEk3hdZjB1uqcJ8260Oa5EKTkmBPJw5ka6c6gWliTr6wc?=
 =?us-ascii?Q?8l78JEYykhxeTayIpxUrLII6lSkmtTdK8GYMmA3ChqAqWuRnJWPfy8IzCN8d?=
 =?us-ascii?Q?1aLioGs51aEm5mVb5pyWYqTDvT5epN9kr0X4mJvYthr3d6a3F0D1YrnDnVPX?=
 =?us-ascii?Q?O/l4Fhe9btpPbTefBMM0/aii78Z6LP9HjdMeuGVFovq42VSklH45ZTpfZ90n?=
 =?us-ascii?Q?tno5ZeQeOuc/CPs5PY6sBr3fruwFLNcknpXDYIKizqsh4YozxEbTeGPq0+5V?=
 =?us-ascii?Q?BSEm3lz4gPxyS+9EQxfUuYyLa9xAd0/hVVcFt4oIOAi9HZ4sGMDuUHglf4hW?=
 =?us-ascii?Q?vS40ogjSDmgb0JjN0cchbIngjaXGOECVEygUn760GSWlvHLY4FyncxNW6vSg?=
 =?us-ascii?Q?lh87+WdaV1CQDZqPb3d6zZWlC44u9i6ixd6Hk6MIceRgFe4jLo8Fctb2heYI?=
 =?us-ascii?Q?gtRykJc2d4qdQfk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wx3gKN7MP9vhLv+BmNEhM3OBKqG4med91efUElKkjrsDVEt76u0ySmBl4DH4?=
 =?us-ascii?Q?m6XIo62oPKF+SyioA+v8vQdIH6I29JPyXOUA5c+sYAMlRQikSf0flVlfNbrM?=
 =?us-ascii?Q?8633FHxQW3icqWI2qaaA5q6d+3sjeOdBo1I4pfTk++knbM32gwgrlKTSk3Gq?=
 =?us-ascii?Q?5mrSCAPFf/9V5f2R8Vzw3VYqn1LolBjEf+CrvStCX+izHFZdw08vKBukgU/R?=
 =?us-ascii?Q?cxwfOSpcPrr5MBEKvwFKXqLcOqjHG4FTgtbSLhMJFwUASp+DrRTb42kAysU4?=
 =?us-ascii?Q?VJHzRWIKFgpj2JhnpjxrHGmkCe+K4JDpnGTUPHTMouzABPnMbdymgj+E14AN?=
 =?us-ascii?Q?XGq+oCJHkLyg5izhNRuNyZme09iBZM4CQOU4Izh9AKPj2LBq5I5du+qXIklF?=
 =?us-ascii?Q?aytO48znIJ6KjlM5brL4YBYjCCNYja3RqpXHLiuwbpxP71wfkJRc0QP6wzFB?=
 =?us-ascii?Q?0n+J+PhBS6HRx7Txe1WyfEQ0sTI81MLS+YWvyUavFxVhSP5Te8ItzVg+YL5z?=
 =?us-ascii?Q?nhvdY0xY83yWtQvJgzpLWh+XSL5Pj5Vj3KQwTFkXqX3kY9Hj+1gr8dnVqELF?=
 =?us-ascii?Q?uA51wAmydQ0H7Bro6bkdDIWvBTlmoGE1LhhSClOduLd31DtmnI8lC1CVwp+c?=
 =?us-ascii?Q?pGYLcwWQ8RHHrjgNDSnVuY9OvvhTB4n7VIfPDp4yGIg8WhBkHH/ZpG0Jdx7e?=
 =?us-ascii?Q?M2t5ScM9/zGlCaMezF+e5pyGmOTSbK3tO5nUEIcRqtg3rrNBcxXLsW9qoTKp?=
 =?us-ascii?Q?5u6q0yoeQJYPMSlu2ik/jGh3QGXJbNbXaVKj9583IuKBSZwNlTTUxeQ/+JsY?=
 =?us-ascii?Q?GDfjBFMrftIyW/tE7vJrgb7SjYUivsX3mETV92QZycr2irxyAuA9WPeDrNUy?=
 =?us-ascii?Q?RiJ/4JxLd5flGfuQ8Lu8DCmKUybaPrkKxZy0a5NNoaFhYGfe23HngSb2Z52a?=
 =?us-ascii?Q?7m4QWcx/ZyCPY/VA5jJsoNvlYk/cZBOgBmFEZ+bPMd/33TaHIjAERrSneO0p?=
 =?us-ascii?Q?r5ez14c3V4vLD9w6GAW8+CsJMoXy05dXiwmcUIbmBYgSL0JxhiBKOEJHZftu?=
 =?us-ascii?Q?bY7ajV+0mB/GPds6ORCtCkwojhGdSyMEqR46XdzK0XEI5UZ5xlIX8gCEmY3O?=
 =?us-ascii?Q?J93z+X43uEdJ4h4IPBDaImr1ZK8KH5YkoOsKA53Rg5xjW/w7iCe1BkXt9Jn/?=
 =?us-ascii?Q?ya+aJuVoeZxO5z6iVz62/uwgP1L/+jGmNlyPfYzR4/66UCVzpSuniet/osS/?=
 =?us-ascii?Q?15jSF59LoyIc6Crx5y05uS+2sx9uXCvzSyj0ZpRzKtJyY+g0Fs9VwyFwCfpO?=
 =?us-ascii?Q?CSCIjp+RRMHxzy5amIZf7ygk1TjOvknm0JznaqsLiaa8fnQig1nz7e5VKcRA?=
 =?us-ascii?Q?wkL/qoQfnLUUXgTT3MXnIFPxX0cE7qLrdlGpy6dUbIGe07fkNkIHja61rFxe?=
 =?us-ascii?Q?I9ULIaMNpmkkdNwMX6dS3K9HZ2eAflsvpBcM8RskPA2KC1ioBWtgJTwaPp4c?=
 =?us-ascii?Q?Ske29bPfoe7ArGdvQftMCil7o5vsi0mml95TvxrgEtg783XdaguwTB8yK78I?=
 =?us-ascii?Q?+PP7c7cZ+FPD6RQkb8myOJlIhlNcURM5YY0rqT+5aZfMFHuHyFdGf1C2WIn5?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54467606-8edd-4596-cb5d-08dd7b161f16
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 05:35:09.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mg4SOqHI23IyxRj0a6Ltx05+pjhVukljZ0Zz24BtnIXx+iHU5+XaIYT/AEQes6dMj+isdv+Uu08lBS143HYXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF066A3CD44
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fc9e93 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=WEx28BAWv0HXPgO7D68A:9 a=J6Dv6ctt5JGYP2we:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: H10nEu4cmK7Gamxvx60U31lPHurRinUJ
X-Proofpoint-ORIG-GUID: H10nEu4cmK7Gamxvx60U31lPHurRinUJ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214794

From: Chen Qi <Qi.Chen@windriver.com>

These classes/recipes inherit qemu.bbclass but do not use anything from it.
What they use is qemuwrapper-cross, which is needed at do_rootfs time and
needs to be pulled-in by PACKAGE_WRITE_DEPS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/fontcache.bbclass           | 3 +--
 meta/classes-recipe/gio-module-cache.bbclass    | 3 +--
 meta/classes-recipe/gtk-immodules-cache.bbclass | 4 +---
 meta/classes-recipe/manpages.bbclass            | 2 +-
 meta/classes-recipe/pixbufcache.bbclass         | 5 +----
 meta/recipes-core/systemd/systemd_257.5.bb      | 5 +++--
 meta/recipes-core/udev/eudev_3.2.14.bb          | 4 ++--
 7 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 6f4978369d..deadcd2fbb 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -9,8 +9,7 @@
 # packages.
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 FONT_PACKAGES ??= "${PN}"
 FONT_PACKAGES:class-native = ""
diff --git a/meta/classes-recipe/gio-module-cache.bbclass b/meta/classes-recipe/gio-module-cache.bbclass
index d12e03c4a0..3714678c7c 100644
--- a/meta/classes-recipe/gio-module-cache.bbclass
+++ b/meta/classes-recipe/gio-module-cache.bbclass
@@ -4,8 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 GIO_MODULE_PACKAGES ??= "${PN}"
 
diff --git a/meta/classes-recipe/gtk-immodules-cache.bbclass b/meta/classes-recipe/gtk-immodules-cache.bbclass
index 8fbe1dd1fb..585838c105 100644
--- a/meta/classes-recipe/gtk-immodules-cache.bbclass
+++ b/meta/classes-recipe/gtk-immodules-cache.bbclass
@@ -8,9 +8,7 @@
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 GTKIMMODULES_PACKAGES ?= "${PN}"
 
diff --git a/meta/classes-recipe/manpages.bbclass b/meta/classes-recipe/manpages.bbclass
index e9ca2f895b..f3d034b046 100644
--- a/meta/classes-recipe/manpages.bbclass
+++ b/meta/classes-recipe/manpages.bbclass
@@ -10,7 +10,7 @@
 # by default.
 PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
 
-inherit qemu
+PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'qemuwrapper-cross', '', d)}"
 
 # usually manual files are packaged to ${PN}-doc except man-pages
 MAN_PKG ?= "${PN}-doc"
diff --git a/meta/classes-recipe/pixbufcache.bbclass b/meta/classes-recipe/pixbufcache.bbclass
index 107e38885e..c32673df55 100644
--- a/meta/classes-recipe/pixbufcache.bbclass
+++ b/meta/classes-recipe/pixbufcache.bbclass
@@ -9,12 +9,9 @@
 # packages.
 #
 
-DEPENDS:append:class-target = " qemu-native"
-inherit qemu
-
 PIXBUF_PACKAGES ??= "${PN}"
 
-PACKAGE_WRITE_DEPS += "qemu-native gdk-pixbuf-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross gdk-pixbuf-native"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index 24aad11c0a..0f0c846db6 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -8,7 +8,7 @@ DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime
 
 # unmerged-usr support is deprecated upstream, taints the system and will be
 # removed in the near future. Fail the build if it is not enabled.
@@ -932,7 +932,8 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
+
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index b3e7d092c5..a2d222e655 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc192
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
+inherit autotools update-rc.d pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -77,7 +77,7 @@ RDEPENDS:${PN} += "kmod"
 RPROVIDES:${PN} = "hotplug udev"
 RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 pkg_postinst:${PN}-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
-- 
2.49.0


