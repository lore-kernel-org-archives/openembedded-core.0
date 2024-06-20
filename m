Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D87C2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:51:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web11.45425.1718884293716183074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 04:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Pa9+IX51;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.64, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=befQM86XVAApGk0uIJgkP/exrSevfdkcj2BIF9SB7ZcZV++abMxFRnA55LW7vZA/dgDV/5ip981hi0b15KaQ7+ylg9fgeCz+QYh6A7oCl6xb6xLC3SsDpcvKajDl4T6Ml2sAMxNfTQsjh661UYtr6ioDzBbv9zfCOelmQgIPeIjesmsRVYRXMeVw7oK/1EWa3ISBHYGI4Us/FSRlxsvQJr+3Ch7cnHWjXivbhuw6pnKltcNek+Kf6mZRd7ni3V8AOw3jLCF2jwmznpm8BgzBluWLfQyONukVhEYNje41ylhykR+oBgE6jLI4F1qw222dLPMyTSKvFvdp6g77GcW3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH1M4AChfTb15eHR5z8J3HXHUSsooKwsaLHpgtsCJIg=;
 b=CPcYNFtRa4fGWEwJEoylIs3iOkLpXaCH8shhH8nMolgTs/KnEPitux6e78hjrKFJ7rWM6Qxf8AzbGFI6ZavYNgieZUJvNCAQ5qrdPj6ScMRAtq6q5YqzmeRFaAnZ/FaY74Uf6UhNjL84flCTzMHM5+/pDvbvehDZhoKxp0gTy1itddGRPO9HiD+EPgjvLRVfet9jn89fKZHeqWwHv9kNnxPi2Z5VA9jJLBBi/bnDbRDMvodgmXHZul0LM3FJgAsbFU4oUqA4MJp9WYVAlZIGJvaxhj/lM+s0xCJWlILx5tqm/A0qnouk24R/KcaM5VGESBMcrfBEG6+nhAEEiaXgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH1M4AChfTb15eHR5z8J3HXHUSsooKwsaLHpgtsCJIg=;
 b=Pa9+IX51p8hiYJpOh8ATMjC9Bk+Q+HrWutR2upeRStNaDET4LDCDjd2WXdr2YD//JsEFHv/ZK++v/faqwgj88J41p3actDePtXnQsHe3quD66M6JdFwbrG4op/Ox5W2EQvgsAf5yc1xtCZgX0kcztFpCwcMdoaysvt88EVAAF98=
Received: from AS9PR05CA0078.eurprd05.prod.outlook.com (2603:10a6:20b:499::22)
 by AS8PR06MB8243.eurprd06.prod.outlook.com (2603:10a6:20b:348::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 11:51:30 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::9e) by AS9PR05CA0078.outlook.office365.com
 (2603:10a6:20b:499::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Thu, 20 Jun 2024 11:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 11:51:29 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 20 Jun 2024 13:51:29 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	Ross.Burton@arm.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 0/3] systemd and RestrictNetworkInterfaces
Date: Thu, 20 Jun 2024 13:51:24 +0200
Message-ID: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 20 Jun 2024 11:51:29.0433 (UTC) FILETIME=[300F8890:01DAC308]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|AS8PR06MB8243:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dcdcb244-777f-4a55-9005-08dc911f52a8
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uNjFSC9qRcHXQLx4yFO32ZxZ13P1+e+E+ZSCrfzxKahg1cjuybvDXs4Gbc8a?=
 =?us-ascii?Q?uSG/GLc5EXDr09FPMzmYG/MBm+vmiuhhq8Q3RhdWLym1sKTpTxA+BXehyph7?=
 =?us-ascii?Q?eoI8NPvsRSnkvQhLw8E3yg+8nwac8Ks0BhfiyNVImHl/KGMSXQu9aXxx8NKd?=
 =?us-ascii?Q?gv98gtZ/iooWgLNsa/8UCpQeilYdZzlqLES/YJ9mNwsbiPM6ku+X7j+7yWC4?=
 =?us-ascii?Q?8OW2xg5x3kyUS1XIuklZBKEdy6Y/lWPFPZ2Xc5lvO7rcRWMkdx7/+Jl1pA/j?=
 =?us-ascii?Q?21QqDS5DKtC5xw4VRpD0FZOqTEDeFxKzwxrM9WtJeD6fCoq4NtikK/RFaoyI?=
 =?us-ascii?Q?UYIgPPybCWlBkJuIlTlGONh1yqY2bJYAlLXzyt6m/G/R6zqIoTcEe+HfuGTX?=
 =?us-ascii?Q?Lk7nfiIR6lz7ftvQezNxLE/o81WDzuwiBmyBzHxP49Zb84BdX8cYFZ+NSjgj?=
 =?us-ascii?Q?wS4IPbm3DKQ2TDR22WnsVGekc0znFPvc94BQV+EdnToRVViPkXVuNySpb2yI?=
 =?us-ascii?Q?T8swQDL85uWWs3+WWI6vQ65H4IRqP3c2S0kflTZEaX8Ev5dQazaOQSJc1BUr?=
 =?us-ascii?Q?vCKQZxZ6OQR9kw9grhF1+WfI8BRvueqdqCXgAw19kTCFfej9VTLv4CSX/rXc?=
 =?us-ascii?Q?raqELYGaGi8c37gA+bV5AGuD3b4SYHxkpS4PLNnQFPTewnNI0Hcnra/hIQse?=
 =?us-ascii?Q?DZR/M6D89XEJ3pdywt5az3sPrsa9FdzgqI3zvWpm8RIYuOryE1A+XexVMlER?=
 =?us-ascii?Q?izW95JdpEWN/9KKHXEERu8vhFpXbUcq71lxablOTtlSdCNpf54NZ3U9CKiXL?=
 =?us-ascii?Q?bYadi2uAi7mbwHAcIhQZVBiTRXK2dnKXKmk9eR1tbcYLs9z3jwM+TgxLZRnl?=
 =?us-ascii?Q?AcHT0Isjpm0o2qQQZRibGil/emw/1G3Xe70GdHbVRGFKVVSXiuBsRzQhcjoc?=
 =?us-ascii?Q?BgB1sjhv19/cmaiNBlNXcoWps7LGluNX+A/spIYl0OffhpJXl7qTTG47Zivg?=
 =?us-ascii?Q?lQKlwQn+63FxPk6eZBFQKc9ZJ9bmf9AS5+eXsyxhLVel/DS3WtJm0qO7gTyP?=
 =?us-ascii?Q?QBBCMWIwc9BYlO5T7vpvw7+BtUYkN3wAL1eafj0Zzzq77e31+evA0b9Vh+1Y?=
 =?us-ascii?Q?ClNdJP2QFo1TXbrhx2JXYJ1ExQOv3gO/zcVuzesHrtZYEFyWJ+SARziAKiie?=
 =?us-ascii?Q?QJ8CNEAjt7XqtQR17Bt6vdWAdRPDLW2G7DSwFtDy1ExBFvid6HaWiV/2wKUO?=
 =?us-ascii?Q?UQlbUn2Dnk4TfOltw9vE7fLJOtar02mK9szFkmxnELeP/KGVX+kzRpsVaWJJ?=
 =?us-ascii?Q?HQNZU4eBqph7PmjpjpdEEotk7rFS/av3GHUHrW3x7JFPcBBPVMMlxr5yrqKN?=
 =?us-ascii?Q?htlNT8Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 11:51:29.6247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdcb244-777f-4a55-9005-08dc911f52a8
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8243
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 11:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200948

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

changes with v2:
	rework hardcoded recipe-sysroot =3D oe-specific patch, to an upstreamed pa=
tch in systemd's meson.build
	see: https://github.com/systemd/systemd/pull/33427

