Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860AFC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 00:51:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4435.1646873473161586689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 16:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cPPTLe/h;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0068e34002=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22A0ljsn011591
	for <openembedded-core@lists.openembedded.org>;
 Wed, 9 Mar 2022 16:51:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JsIK4MpNGAh/ITnzZeoSRz6AObV94LqRi+RJAZ440J8=;
 b=cPPTLe/hp/zY/mXyaU/J09qkiv0E9k6YWXZdK8iqm40nDjJFpdsu+R3VLlmxEm9GII+l
 GpA2H15Ggeoa3uQtDZo+5CFtKOLIWr8lhLGnTUtXYI9wwNVN7Ha+TLgXHKefr7NeCiLg
 tpD4/HnvqL8TAVRnV7sNxT9RkPTI4UaxXo5MmgHbEy2cI7+r0q900+zIg81SYcg4dXzo
 /vmbJ3dPmAF/FEOcXfGHlsa/+94vg+woLlB2cFNWQdAVQ5xht+2cuOaoPV2LjEbP8dkV
 8fmmCfBoX0gCPFLGP+BvhtICBDXgKauCNKtzctOVuM6ZwJCZXw1zocsuG+alf01Tu9Q1 Cg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3enew6tkjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 16:51:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYShm21nUUTcIsqMyyLP82Wx4LmCBRpJD9aT8PaMrwx4STn0i0GTm6XFihGy/BmKtu+0pGSvptpPYduKBoATPoUM0Snb9fFEI9hVjt6XycF5UZN40ZBF2xgOsN8YRex7zyeil655ITHJsoSJiVeTu+Cdcgj8LpwYDw1o0E+HtsDCDz4HFzU+N5tD3zs9EG0YMODtya8HaRENZenvm/LzUfr4rNDDDL0GoEzei8/bxeDoTrC6jDY9rE2lTLwR3c9tV1smDMkchHLqDK2+KH7vWLMlFnI8z5Wle2H7TEmpx+vsusL9bmE54qPc5qtOMVUqHtqlov9Ur6jUiFLIxK+nYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsIK4MpNGAh/ITnzZeoSRz6AObV94LqRi+RJAZ440J8=;
 b=CrkN9Id3qUEGmwK/07ojQp9XZxm3bH1RAN029CeLQ835hdxIqScbG1+pVYM/EwzT5eS3dZqK6qOltB17BngkEwwQuBpo/vlnhuPNpG8TyCNg7235h0nwBbi+i190Yf5+F49xeJMo8cAnCGqPj1h6Cf4fCn+w2K5WjqCjeW0sde7KJjJ32HyOed6qoW35M+JgNBKknOqMPacAtIWt+uEEn2VXjN2yHW3Z3otDhZl3lH7csgcaEs7JtZEAEmhW0muVsP8hfvr3PSC/jVb9gzGW2Q2szFzyzZ0rA7h2k4Wt9jL5p9yS3vQVVDszHPe/ijYN0XSInWHNBX097Sr37mYymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MWHPR11MB1472.namprd11.prod.outlook.com (2603:10b6:301:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 00:51:07 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 00:51:07 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] libvert: modify dependencies on lxc_protocol.h
Date: Wed,  9 Mar 2022 16:50:48 -0800
Message-Id: <20220310005048.37403-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b43c328-9020-44f1-b8fc-08da02300fba
X-MS-TrafficTypeDiagnostic: MWHPR11MB1472:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB14728245DA0C94D4E1A4F4E0880B9@MWHPR11MB1472.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bq8+oS54jB4/ZbWMdauS9UpsTt0xcPiMEdpvIKwQC1436ohUN8vEJbCi3u4mzphdIVP+uERh18gBtsUn5BVsudGw+NPTdtYaBFt5kBBKt+exO2nnzWul8zsQ4yNYEWqXXxaVYzIvx+wqpuJC7OSI9bYFdpeN4tymK8MzuTmXofwzPscrq84e+iiO+aAHCBb+WEzl8e/PkjY9LPQZX44KpOvJVLL00Gi4VffVxajiatRw4h9SEdDD8d6kypDWT+v2EItXW/ZWC/lnUxWjOqvaXrg+9ZQvqFjvc5sd8aWDz/2D4MiPLuXlG6GmZ15cz/xdS36asLEdQeIlIgC6ge9qhgvAr12yYmg83rdAqLWQagLrpEzQD/4Ct/tvmkDRjY8oi+PUYAjkDXD/Yd8MBjv2uTGHQh9w4hi2HJFcOv0bmrV+dy1ED8nx5Hfyvue9M7LwVBnNwjc/pR7d6BRixpZzStIHgrQtHOvbnrnJNMJP34vpZwpJMlZBvNW442dGKNgTLe9pLXtYfUWD7x1pYFUq16cZzvECogFH/c8wffyZVX5sqZHujrO1A+Lp4OYy/FL7pC8WXolf4+eZnDV9BSrbhWLfknzjBuofJsnv6Qr0uQhyywY6OM6UXUggMkP6MAGaqC1UMjMIbSF1mW16g9Qm2B+qKgtCOsglbqgtLZeqyjvGkO6DRZhvHG6YgVMUPlBgctgRCW08PbsLLZh6tPuq/RvCvoF5dVBjOCFKerCVYEEwns8AWFp7SjjNYAtQ8tchycoAZDHCV2Tv4eqVZ+HE1pf9jT6+vwTglArFfeRbeAZd7SWhpMwTeRvcGpLfJAOg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(508600001)(2616005)(8936002)(6486002)(86362001)(5660300002)(6666004)(83380400001)(8676002)(186003)(6916009)(26005)(1076003)(44832011)(66476007)(4326008)(66556008)(316002)(66946007)(38350700002)(38100700002)(52116002)(2906002)(36756003)(6512007)(6506007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a4iK40Jeb3hpwj38Ip00dVgEothr8tlgT9Iu1COa9KWTlx6Rt5/RLTu95qHe?=
 =?us-ascii?Q?UbVb/+IIDxii2lM2lvEKGxMv2CwDWIWedo9AmwXDVgJKZH7Kmmn5lWz/+VQp?=
 =?us-ascii?Q?v7jYoC3d2PWpndcqcgja4jnRJjDcnoYfCusoGJffhwTZzYZnafCja2X9G8K9?=
 =?us-ascii?Q?R1STRH6Mt7mpaoZ+KvQyNzfc2jXXm66EK3hq+xhPd86+La+eH4Vcur6htTbL?=
 =?us-ascii?Q?cPKKUf/iRxs3TjpKSwXxmNHosJl47yGeeoRrgKqnuVmwb6/dGsOGpFItyEw8?=
 =?us-ascii?Q?0fFwgUfgKBBgoDIfGHBbewY57A4+wmgJZpOA9zjY8lZzA5tKfHjO5N+5pYlE?=
 =?us-ascii?Q?LudeUZoPcx7OyTd0NeaC6hxBAJbaw6jMPf8R2bmc4/StbBJJgvuAKWlvfLgu?=
 =?us-ascii?Q?wiICYO+bL0NWnghldPMgjJS2IFEQ1ZntntGLYyi/Vl3Y/zlsIyxLBblfsD1C?=
 =?us-ascii?Q?syjEhsJQ9ldddy2HKi3yqdzz/6bf/whHPvC7CtPXQcHO7Lh6hWOgaQAHY3l8?=
 =?us-ascii?Q?byOkYX5xBE4sVOeGJIIUlQPOvXsPNL91SbkNbz5Xd/hh5nlFNJ/+Uc6MW9v+?=
 =?us-ascii?Q?lWhcwIx+lf8KQ53USLesTKHvBdSBDmHzbVhUHBIE1wkhUenNNFaQFwILzyaT?=
 =?us-ascii?Q?K+N7LVW1AhJfpYwPFgp7U2nOVUWPM64NKtzkaPYxR65s2oj/t7Hj752EByqL?=
 =?us-ascii?Q?Vfbd/wKpptu7pBLM7AFabo6VpAPPeYA69S4U60sL6rHGC8NrDIMzsbclKTSU?=
 =?us-ascii?Q?/pFfMrUfYRyKEv+/WvAtRIWf5eD0imCy9JUGLgem6RRuDR4AwATAP3Zo2sKm?=
 =?us-ascii?Q?rNH26R1HJeue8W3rXoEbheBVbKNiD4hJMI+xypWq/9nhDiWvUD+1cizmHeW3?=
 =?us-ascii?Q?37uhL6PI7R6E0BvPjYNvwkXVlyDn+E5SGmJqFLCof6mMxx12myoBUcLPqtqX?=
 =?us-ascii?Q?XmMF6KCV3zCYGMWLtq6LkdGgMSLzOnE8yD3FrIgZz/i7yiJP0pMMcuyLSo4p?=
 =?us-ascii?Q?/8+6enagPpARtz2GxQvWu/JyL2bPJyVgR+kQ48IiR51yLtG7NYlaJtFWssNS?=
 =?us-ascii?Q?NzJ6Dfaw82werlqqdw/wGoa6OA+/Ru2K7Rg3cYWGu798eRvvs86gfar1cYoD?=
 =?us-ascii?Q?vdSq0AndSHFVFLqFWpCm76HR5QFeHf9HWNJcK66GWiL1MkpO+SJLMJmrgtPk?=
 =?us-ascii?Q?myKxWYv0a/F0/WkWQ8anyLGrlJ/Qu+BszoJM7Qm5kXuraD9jB6JBQj/RWlDf?=
 =?us-ascii?Q?Zu/zWV4MeDCTE7h4V83/r3pwu7VFyFTFvrSI8pdmk9vs8Pju/8DDm8aSnsHt?=
 =?us-ascii?Q?G9mbJvcrZjZ6CaenfqIuysNI+9vjibr9mA5Fzcw7nlngpUeHoNZNz1zUgqh8?=
 =?us-ascii?Q?jXSquiJuqWZqN9MINl09QVRCB2gmONL2ovQau5PnLU+tFrALbxqbhnOi4xDL?=
 =?us-ascii?Q?ZhR6HnrtPiHxLXNDVTCaZQA1PoAfA0i2oo+M7P3Pv64UhOTFCgyyWKPEnmGj?=
 =?us-ascii?Q?V7RmO4/3D18rUO0iDksXeQqVpZydcIxg6cwCgIGEfoGjef49OyEWPbdwduBV?=
 =?us-ascii?Q?xjjhIyXn4j27HD/auZCHXHjN7cMkhUDCXKc2t3Liv+TtptrHvpmE86CPfO3v?=
 =?us-ascii?Q?2xtOmkqVZPFzBT9QlWSv80M1RfT8OlK0IP8Vy7FgKzcSrH7KDQO91OHsUVuT?=
 =?us-ascii?Q?fAFv57ZHAkIPD+18x8gHKMZKvSI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b43c328-9020-44f1-b8fc-08da02300fba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 00:51:07.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0yVBlYYXIYqGvt+i9WzuiKUCmrtOiTk+I4RAi6od6u2dX2MfBR9w6FIuH6Kz4V7xw7IzBtdYjuNmTq2Rt0QbTjcrzXE/1mmH6usjJ4eembQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1472
X-Proofpoint-ORIG-GUID: FmAyFBajoYhsJRvg-xeH8qgnmFCjTMQk
X-Proofpoint-GUID: FmAyFBajoYhsJRvg-xeH8qgnmFCjTMQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_10,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=449
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 00:51:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162996

src/remote/meson.build does not create a dependency on
the generated lxc_protocol.h for remote_daemon.c.  Restructure
how this file is generated to allow the dependency.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libvirt/libvirt/lxc_protocol.patch        | 104 ++++++++++++++++++
 recipes-extended/libvirt/libvirt_7.2.0.bb     |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/lxc_protocol.patch

diff --git a/recipes-extended/libvirt/libvirt/lxc_protocol.patch b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
new file mode 100644
index 00000000..595c3fe4
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
@@ -0,0 +1,104 @@
+From 38af66c1a9c4cdeb256eeaf563c6807757c370ce Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Wed, 9 Mar 2022 23:17:33 +0000
+Subject: [PATCH] working commit
+
+remote_daemon.c and others need the generated header lxc_protocol.h,
+but do not have it as a dependency in meson.build.  This means that
+builds will randomly (ok, very occasionally) fail.  Restructure how the
+header is built so that remote_daemon can have it as a dependency.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/remote/meson.build | 48 ++++++++++++++++++++++++------------------
+ 1 file changed, 28 insertions(+), 20 deletions(-)
+
+diff --git a/src/remote/meson.build b/src/remote/meson.build
+index 0a18826..31a30ee 100644
+--- a/src/remote/meson.build
++++ b/src/remote/meson.build
+@@ -1,27 +1,11 @@
+-remote_driver_sources = [
+-  'remote_driver.c',
+-  'remote_sockets.c',
+-]
+-
+-remote_driver_generated = []
++remote_xxx_generated = []
+ 
+ foreach name : [ 'remote', 'qemu', 'lxc' ]
+-  client_bodies_h = '@0@_client_bodies.h'.format(name)
+   protocol_c = '@0@_protocol.c'.format(name)
+   protocol_h = '@0@_protocol.h'.format(name)
+   protocol_x = '@0@_protocol.x'.format(name)
+ 
+-  remote_driver_generated += custom_target(
+-    client_bodies_h,
+-    input: protocol_x,
+-    output: client_bodies_h,
+-    command: [
+-      gendispatch_prog, '--mode=client', name, name.to_upper(), '@INPUT@',
+-    ],
+-    capture: true,
+-  )
+-
+-  remote_driver_generated += custom_target(
++  remote_xxx_generated += custom_target(
+     protocol_h,
+     input: protocol_x,
+     output: protocol_h,
+@@ -30,7 +14,7 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
+     ],
+   )
+ 
+-  remote_driver_generated += custom_target(
++  remote_xxx_generated += custom_target(
+     protocol_c,
+     input: protocol_x,
+     output: protocol_c,
+@@ -42,6 +26,30 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
+   rpc_probe_files += files(protocol_x)
+ endforeach
+ 
++
++remote_driver_sources = [
++  'remote_driver.c',
++  'remote_sockets.c',
++]
++
++remote_driver_generated =remote_xxx_generated
++
++foreach name : [ 'remote', 'qemu', 'lxc' ]
++  client_bodies_h = '@0@_client_bodies.h'.format(name)
++  protocol_x = '@0@_protocol.x'.format(name)
++
++  remote_driver_generated += custom_target(
++    client_bodies_h,
++    input: protocol_x,
++    output: client_bodies_h,
++    command: [
++      gendispatch_prog, '--mode=client', name, name.to_upper(), '@INPUT@',
++    ],
++    capture: true,
++  )
++
++endforeach
++
+ remote_daemon_sources = files(
+   'remote_daemon.c',
+   'remote_daemon_config.c',
+@@ -49,7 +57,7 @@ remote_daemon_sources = files(
+   'remote_daemon_stream.c',
+ )
+ 
+-remote_daemon_generated = []
++remote_daemon_generated = remote_xxx_generated
+ 
+ virt_ssh_helper_sources = files(
+   'remote_sockets.c',
+-- 
+2.32.0
+
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index 5ad7d59e..04c66eb5 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
            file://0001-security-fix-SELinux-label-generation-logic.patch \
            file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
+           file://lxc_protocol.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
-- 
2.35.1


