Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FB3C41513
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 08:09:13 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.61])
 by mx.groups.io with SMTP id smtpd.web10.13868.1717920543198755898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 01:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=jrbkSrHD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.241.61, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc9CSVqOhaEbO6edu2/OrZ4vEKyB/XnwPy/me+BjvAsrEYP4v8Gwg2RF1mfOQQN/t0apfHsUqwUEWH+Hl+V+GWDXaGtZNfPUKvI8d45F6pFBrnux/dQJvnqFUXHkDoJrU/Rb4MED9c+lLameodYrm7reOIIOHjbR/cJrTeOP3SdVAZCiKRhZ/JP+S7rf7DuZAQf2IM+rqXnD2MnaIta9PhmyJlKdm759KY8W/2f8nyMQ51iF3nMgZiVyZjYsIIe9W5y9c8WekYByzB04IXllGA/NQRrjsEepeI9akiBPvpD3XMXqpqYjVuOs4A5I/IAoz1VSJKxV/5zD5yRCO0Qb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19MMXm4zIUHmSQbia9Ah1lrggjouuRWxVi9OCeEk77E=;
 b=cUD7KnUDf5QuehbiUeyqMk9mgEILNvnYbCb4iC7fE7ZK3dMGeaowlDZ/X75NPtqTuHdFnUBDwZc9m7hcspyOEZySxrPzuIhMzsdz2poPNa4tT1kxYGAjVYKYea9xv5zR69b9lnXfO+iEy9NW1quFf6nJGh1RGgmpSIp1Xx1Vldwsd8Dwd5wMeyagAhGZLOE+wcE/oJM8Qjqmvf6RQRhmL1hUShgr20TrTWe6A27cDcxD2K/bixKr1BLcQLPiFCwjfH+gfPI2Ch/mQdiUxYtH9YgTWSRBeU8XYmy2ICa6CjkkdN5av/yYETOhgU9XslQtLs+H3EOXXMSBXd3MGnn4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19MMXm4zIUHmSQbia9Ah1lrggjouuRWxVi9OCeEk77E=;
 b=jrbkSrHDJ+RMXFtb8W/H4SQWwr8ddJtHNpAgvjamoGdDrzhY0OVFATkvcG2kN0Vbz3/Ng1Y6DBE86wYYUR3dmm6RephfLUMSvJsz01IpZg7rk7f2UwdySKXoRCN/jl6xkGs2ShuLJ3447JWMuN7jXmdn4vIXmrfZg7roesyTUHg=
Received: from DU2PR04CA0247.eurprd04.prod.outlook.com (2603:10a6:10:28e::12)
 by DB8PR06MB6507.eurprd06.prod.outlook.com (2603:10a6:10:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 08:08:59 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::22) by DU2PR04CA0247.outlook.office365.com
 (2603:10a6:10:28e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.23 via Frontend
 Transport; Sun, 9 Jun 2024 08:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Sun, 9 Jun 2024 08:08:59 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 9 Jun 2024 10:08:58 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 0/2] systemd and RestrictNetworkInterfaces
Date: Sun,  9 Jun 2024 10:08:54 +0200
Message-ID: <20240609080856.1020300-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 09 Jun 2024 08:08:58.0775 (UTC) FILETIME=[47E78A70:01DABA44]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039232:EE_|DB8PR06MB6507:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28d81f54-e078-4c6f-ddcb-08dc885b6aaa
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qfF1qaUZFNyPfPlsJlM74Y5hPscLSTSUDkhEKe7TpFns9JSWocmKIVc0l3o4?=
 =?us-ascii?Q?kza5kEBHGxTKaXSI5oyvsx5mU7elgAypLWsHmy6vnxg07flaxs3steDoMBh8?=
 =?us-ascii?Q?2dqrJhFBKKCjNe5m2RATs3LTx9w7+f5yZfa32ypBwn3hurQwF5bT79KcJcTa?=
 =?us-ascii?Q?1ANbSBn4Pfjvh0ZCb0LwGAkSatXQT/8sHEn0swYKRtUc1IAbTpIQpVfA6NE2?=
 =?us-ascii?Q?ZJP1WSvancggzKvW3KKqtEdXHP5IlA5XVP8/CLk6n1PFiJzwQroGltu1WqQM?=
 =?us-ascii?Q?pG5xCaVmqnhnMYmXLtpZ8H+RAJs0dFgY5bXvPM09D3SMpYe+GH1PR/SAX0EN?=
 =?us-ascii?Q?JIfgcXwxwLdmVo4WRrOhEN9vsrGh5iq/x/JqxgqnYxdoIyxDeQ5VopBQo4HZ?=
 =?us-ascii?Q?t4JujrFK7X+DaNpW3SWPyIOABEJPx5wHoMOTunsl+K16BTBVcVf5Pv5ub2w0?=
 =?us-ascii?Q?2qLI2dFiZNfS3Ag4SCd0WgJTBnBp380TiTLZk3EvKzR94x2B8k1BL5vIUpwx?=
 =?us-ascii?Q?RRH/4UQuM510r4XzPRj5YsgSuj9DaS5oaJXEzCIhVshYsuTPPMfkU3qE2RMT?=
 =?us-ascii?Q?oPKAGH1dxP0r3ugk+GTslB3JsmeBPC8LRe9Ati0NdlF/ixAGCub3dZS/72us?=
 =?us-ascii?Q?NNNAA2PO6HUbfCNaTQa49VuvqQGeADKnZoLCfCHkG5sts98vL5+WAVJXG4Sl?=
 =?us-ascii?Q?2/iCVU3oeIBLgF5Q/5+hQwSwi8Yl1XEldMWg54Ti8bKwX1paJpChVQuMO+2s?=
 =?us-ascii?Q?VdJRCMUkvb8mNtMPM87R2+dS6eOunFGs1DOpAPWFWuhCwM8GUvMMGxC4CC8H?=
 =?us-ascii?Q?2ngdqfuXRBhJjTOo190LKDBJmEdi+8PGBZEiL9J6ZHooR7fJe7h/yO3Nu5SC?=
 =?us-ascii?Q?Oxc5y57SOVu3WmWV7nsxtU7tk4mi/SWtj56RVLMXYQcAepi2O4dd9Q7ZDgC6?=
 =?us-ascii?Q?bcs15XfDG1I0hCzDHuUruZPcDdS5SdaS5/NBN4asnlo99Hls7QTNhW1h2sYh?=
 =?us-ascii?Q?yhYxtOue+Vyz9cHrSTQLabsxOyCqs6GnnQAwJydIBBdjSZvdExZiHfzuUUWz?=
 =?us-ascii?Q?mOFv3qaiUTvbZuoXq5X34dP5k2C6v2trxvh0oUUcCft/JsCTR5Ts2+CeFHHp?=
 =?us-ascii?Q?HjcFmd5B+erl3WuSs2U6/+CbuZmIJbbQ2x8IAGhOgrN5s75eD1ULeRUglHBs?=
 =?us-ascii?Q?zAAx3W41vv4czRBF/KkaPWD+w/uEXPrn6WuJNPY297FkCrOaCPxIQgLSRjjl?=
 =?us-ascii?Q?8/Uy4vwY7yV01WjMFXM1LFcPcPx5sWz95RKQkQI92P7y+Fuw6gnbPcpmYdhr?=
 =?us-ascii?Q?85xXokmqS8WK2JtVGWAruPOKZ2MdbATRb77okgIIoXL00vFUqXlScBmc0jx3?=
 =?us-ascii?Q?fA/McwM=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 08:08:59.2128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d81f54-e078-4c6f-ddcb-08dc885b6aaa
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6507
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 08:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200452

Systemd has eBPF based resource-control features to limit file-system
and network-interface access [1][2]

For these to be usable the corresponding eBPFs that come with systemd
need to be compiled an deployed to the system - this could now be done
by setting the PACKAGECONFIG+=3D"bpf-framework" in the target
build-setup.

Then clang-native (from meta-clang [3]) could be used to provide the
bpf-compiler, that then systemds build-setup uses to pre-compile these
eBPFs; the other build requirements are bpftool-native and libbpf
(both form meta-openembedded/meta-oe).

On the system the only run-time dependency is then libbpf to load these
pre-compiled filters. And "some kernel switches" [4]:
CONFIG_BPF
CONFIG_BPF_SYSCALL
CONFIG_CGROUP_BPF

To use/test these run for example:
$> systemd-run -t -p RestrictNetworkInterfaces=3Denp0s3 ping 8.8.8.8
which would result in 100% packet-loss, if the default route goes over
another interface.

Link: https://www.freedesktop.org/software/systemd/man/latest/systemd.resou=
rce-control.html#RestrictFileSystems=3D
Link: https://www.freedesktop.org/software/systemd/man/latest/systemd.resou=
rce-control.html#RestrictNetworkInterfaces=3D
Link: https://github.com/kraj/meta-clang
Link: https://kinvolk.io/blog/2021/04/extending-systemd-security-features-w=
ith-ebpf/

=3D=3D=3D=3D=3D=3D=3D=3D=3D

