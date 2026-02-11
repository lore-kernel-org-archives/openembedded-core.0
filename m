Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2249DEB5946
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 00:05:23 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7544.1770768320460792836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 16:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WtNp3pu7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.65, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt+RSaEn3AsQoLbYrgXTT5AtpaGeR1LubOYq9GupTM6rcGbS2v7pKr3uYSOJ8h3bcCnlUTclV8eVkT1oQ+kXFkzDRJ2YJcHnqoym6eUQW/8TT04SyBSxNDsLqX5MnH2LL5lyd2eh0pkgMEQzj4iIATqOuSSl1+YTPnBtdzo01ZDZsOcKrtHbKu7DS4I2TnikRPT5Ef7ev5EObytI2ImFux+h0QMP6X4lLQZCDELST2wSPjewbug2fHnrP46SVbtIsLO1IoTnLgwquJToaVqIkU0MnSICr9N19lRDtpGO2qqoMDStr2N1V9Ar8Y9NbA8ciwlBFpGkCmaJnkACDPtzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz4n2E0uGGzatjd7jwt4c0QdVZazxQ8lBj7+EWRsaH8=;
 b=cKZXIQqm4WkgoTHXU47yD79XuRIH5tgLKY9C1pMiksaZvibUXpBFIrG3rkRTq51Q2rvUE9tYZMNOOkipJSxIq6CudbGzFngP2bbc5DCkRa5MvQaEQcwbeMYkEAjJNzj6+KiK8HlEPUkoUh2kAfXwiYafjebw8nXgUjVmZOPIrfI4cqrtopdTrBzr7KQ6bBaOPDsybGORxwjuBwYF2u8AMuiebfacWpd//leGrgPVL0TOVQWX3F8o0jvkerYX3vYMRc3Ha0LldqfjjB44Wfnvb65bh5fiYI97039Frf8LIAhyszlPV1agOyGiF7uIcIzWsmoz4/FJCAak0LgRAAo1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz4n2E0uGGzatjd7jwt4c0QdVZazxQ8lBj7+EWRsaH8=;
 b=WtNp3pu78MJcWTndrqlX/7ov0+qJlmO1CtGWFbSnk7KMFnr8lJOyyOPGRESpbFZ9wMmhE/WsO+FNZPaZGiy6ZfQ63O2O+iIojFTHNLWgiaAWDm/DXpL3fJThhpmj6rs1aEjb12u/Xsi278/E7Dh0FusPTCHWrrLZErWOuQk+mzU=
Received: from BLAPR03CA0044.namprd03.prod.outlook.com (2603:10b6:208:32d::19)
 by CY8PR10MB7339.namprd10.prod.outlook.com (2603:10b6:930:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 00:05:17 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::18) by BLAPR03CA0044.outlook.office365.com
 (2603:10b6:208:32d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 00:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 11 Feb 2026 00:05:16 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 18:05:05 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 18:05:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 18:05:05 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61B055Sw224328;
	Tue, 10 Feb 2026 18:05:05 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 18:05:05 -0600
Message-ID: <DGBOZ5D5OSKG.3ISZVKA2HWJTC@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][RFC] xuser-account: convert to standard-user-account
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>, <pn@denx.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1892BAF78F1F4DD5.591740@lists.openembedded.org>
In-Reply-To: <1892BAF78F1F4DD5.591740@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CY8PR10MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: e784f1e4-6271-43ee-8bee-08de69013c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjhxZzJmYUxjRmJpOEtBTVNUeUk2RWNFYVJ4NmtSdExDOW5IYWFXZHVZbk96?=
 =?utf-8?B?T1ZUYjZ5VUJ5Y1NHK1V3S3gyWXdYcllDNmZRaE5tbC9acWVjWHhXb2ZPZTRo?=
 =?utf-8?B?anl6ZVRQU2VFSGdzYnBBeTB5WDFVMDFqVEZ0U2t6bFVSWWZVSWJzclUvS3lG?=
 =?utf-8?B?TkdiOG5YVHBHUU93SUpDOEpRMGEwS0NiZFl6YitJdjA5dVJsbWt3R3lZdHZs?=
 =?utf-8?B?QlFBcVZ4ZTlpdmNFNDNLYVRsYnI3Zm81aHd6UjRUcTZRUmFQbVRRK2ZOc1Fv?=
 =?utf-8?B?eWdQVUJQVy9Gc1FuVUljL1FZZDJmZHhsa1FaWVEzVkM3OGhtM0R5STRRakN5?=
 =?utf-8?B?SXBBOHlCOGNWa2tWRzBlS2JNRmNnYkdNaXJOU3hISHc0QmJjWlY0VVpVRTVN?=
 =?utf-8?B?bndmb3BpZTRSaEZpbXNNRTl1Sm9vTmNXQlZhMkN3Q0o5VXRYWjZucFpyaWU4?=
 =?utf-8?B?WHpweDRTVnNWNW1Bb0plVkNESDBYMEZrN1M5R1Z1dGE2MFRDQ1p5Y0FaVmZD?=
 =?utf-8?B?YkxwTmxLb1g5emt0QU9IZmsyQWdsYUxmZ0RtVHkxVUFyandsVXVOVkNqTS8r?=
 =?utf-8?B?ZVRTZmY3UmFpMFh3MWthTXVlQjgwalBsWnd4eTlodkJDYm9ReUppNHl2TGdR?=
 =?utf-8?B?STNFSXg1UElWYlEvNnJDVkNTb0hQcFdaZzdsbDI4d2RYT0NWUmxlV0dUTDhZ?=
 =?utf-8?B?Z1RNRVNmZURoK3JtY3F5TEVxSUlVMzZLNlA1NVhNZ2hXMTJJaWlIaEEvazFV?=
 =?utf-8?B?dUY0em9iT0VqakFYQ2M4bFA3cUtSMGwrTGphaC9XR2JJUVo5MzZNRmdzZnpv?=
 =?utf-8?B?OFNqa1lIRkdSL2JoOGNGZTZTd1VKa1NNNERNY2d2WjhXVldQcG91UWxYTUJa?=
 =?utf-8?B?YkFmbzdkVEZVM21MTXNwQjNzaUJqSnNkR0JWVUdzU21NYkRiTUg5bEV6Nk0z?=
 =?utf-8?B?REFReDZCRDA1bUk5ZWh1UDRLUHZVcnU4UFVIb28wTGpCQjg1OFBDU2lJNkx6?=
 =?utf-8?B?QTJzbUZwM0hLanZ3Y1hnNkNqZTZOc2JCbitQTDd6bGlTVE9CUWdoWlpWS0th?=
 =?utf-8?B?ek9XajRnc29oK3NvcXExVlNWOWllTkpQelhWLzE3WTZQNEdscXh4ejBHS1Uz?=
 =?utf-8?B?aFpUVjRSOGZTWEhCR0Y5Wm1Ca25ESW0rY0hXLzZJbzRJQm1LU0FuWUc5Z2ZF?=
 =?utf-8?B?QmxkZ1ZtMzU2NytITzNYZEZIaFY4cWRxVE9ucENpampGQ1RmZEp0UU1lMXFk?=
 =?utf-8?B?MWMvQURDOGRwNmxvallHYlBKRmZneDd0QVZIYTJrbHNIN0JFZE1pVkFFRGVX?=
 =?utf-8?B?OUJrVUJKUnUyOWtmcEdNUk5aN2tiV2ZQMzE0T1NZdjEwSkxGVXRhbmJib21x?=
 =?utf-8?B?TXhwcVJmQ1NzY0RwYW93MGQ3TmJhd25ESVE0RUxBaEs3TE9RMTd1S0hZdFJx?=
 =?utf-8?B?TCtCUWl3MTdYcHg5WE9FbnNoazNES2tadkRydzArK3lzTjFMZXFZRkRCMWtL?=
 =?utf-8?B?UGZ4bFR1TkwwcFcxUWJrL2JxNWg5bW1ETSs2a0xZS0EvZjBsU0N4ZWlOSlFC?=
 =?utf-8?B?NXFMa2w1SUNkdFN1dkZBbGxuUG85cFJvUVhQVkg4M1dkc2JlZ0xXaWptZUIy?=
 =?utf-8?B?OEN4U0duS3hKME9ZS3ExS3hzMk1pL2JiRkpsZUpNWlJoNHpHdmZPcDNzUm9N?=
 =?utf-8?B?RnpzNWt1YUJRR0ZTNDZxSkJMdjFZOFIrMldIaC9taldCTzZyRjlySytLKzFB?=
 =?utf-8?B?WTFmV2tQTjVyVTBBR3dCMzNLLzh0T0JsY3NqaHVhSXRxWG9xaVNqaWZEbWR6?=
 =?utf-8?B?OVhyVktBNGwwT2EreWQwaDBmVkZBbUgxV2NRMmZHU1NVUVVzVDNHSzNxT3k0?=
 =?utf-8?B?Rk9pb2FzNlJrMUVBS0o0SFplM3IwTWNMMzdEakJmcEpTV1NOQzRkZHZkTThk?=
 =?utf-8?B?dlJRRk5ORVBFcE9Fb3p6YjdXWm1SYzBLNjYrTHdWTjFyNG41SWxGcytjVFBF?=
 =?utf-8?B?My92NXVOK001SWhRS3RMWXc3WmNlZkVVVEN2STlRSUNuMEpHU3Mycy9pdm12?=
 =?utf-8?B?Q3JsWjVockx3TVorWkV4cHliOFpCZXlBcXB3UERacFcyb244VktWYjdsVVZI?=
 =?utf-8?B?QkdEUDJQQnpyTGxsV2VQbSs5a0NxOXJ5d0Myb3U1L1Y0encvUGtsQ21pVDZz?=
 =?utf-8?B?OWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wXFdQEBwNOkZ10Uj5mhynohnt50s00tIeLxI5A04EtFQi3mkz2vVjEBPjMYKlYYyyuIOKVJGayqCjLZi+eah00vyrIKpI4q3y79Gf4zpUClRPk72j6y+uqa6pDqt6p949vlml/GIhyW2kYoeJ+8kvJcFvMP+W7b5RCr2guTaqAJyJDiKMSOn+zmGAxXtcDFbmrNwSXTPTtt40PJMAe6xiB93aKs/yUt/UIeMQHBM25/Yy+9kZxuwLt0+4lfVAoaS5udc9aJko+ADQJXY0sbiGd2ioUm/vW6HOyh2geGK+/qJ+aGzrbyStC3ExQsbF517q98PmL0gqo1WMSMYUnmQw3ExNq13OF6v0pcENgxhzNXxB1Ji/5LH+skxPNlq/MjbaOHN/8ta3gebnZcxZyQYAyD2LoNJwTsKZG+QJO5tGW6FOq0GQTvT7CoAANmA5ag3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:05:16.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e784f1e4-6271-43ee-8bee-08de69013c61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230941

On Mon Feb 9, 2026 at 6:25 PM CST, Randolph Sapp via lists.openembedded.org=
 wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Change this single xuser account template into a generic
> standard-user-account that uses distro level variables for
> configuration.
>
> This allows for seamless configuration of multiple out-of-box scripts
> and tests across layers without having to implicitly hope that the
> username or groups haven't been changed by a bbappend or recipe
> override.
>
> This was proposed specifically to remove some issues highlighted in:
> https://lists.openembedded.org/g/openembedded-core/message/230665
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> I'm thinking about adding something like REQUIRED_STANDARD_USER_GROUPS an=
d
> REQUIRED_STANDARD_USER_SYSTEM_GROUPS checks to the features_check class s=
o
> recipes can indicate when they will fail due to bad distro configs. Pleas=
e let
> me know what you all think.
>
>  meta-selftest/files/static-group              |  3 +-
>  meta-selftest/files/static-passwd             |  3 +-
>  .../distro/include/default-distrovars.inc     | 12 ++++++
>  meta/conf/distro/include/maintainers.inc      |  2 +-
>  meta/recipes-graphics/wayland/weston-init.bb  | 13 +++----
>  .../x11-common/xserver-nodm-init_3.0.bb       |  7 ++--
>  .../user-creation/files/system-xuser.conf     | 11 ------
>  .../standard-user-account_0.1.bb              | 38 +++++++++++++++++++
>  .../user-creation/xuser-account_0.1.bb        | 30 ---------------
>  scripts/sstate-sysroot-cruft.sh               |  6 +--
>  10 files changed, 65 insertions(+), 60 deletions(-)
>  delete mode 100644 meta/recipes-support/user-creation/files/system-xuser=
.conf
>  create mode 100644 meta/recipes-support/user-creation/standard-user-acco=
unt_0.1.bb
>  delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.=
bb
>
> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/stati=
c-group
> index 3fca4aa5c9..8bdf362ed7 100644
> --- a/meta-selftest/files/static-group
> +++ b/meta-selftest/files/static-group
> @@ -20,12 +20,11 @@ pulse:x:520:
>  bind:x:521:
>  builder:x:522:
>  weston-launch:x:524:
> -weston:x:525:
> +user:x:525:
>  wayland:x:526:
>  render:x:527:
>  sgx:x:528:
>  ptest:x:529:
> -xuser:x:530:
>  seat:x:531:
>  audio:x:532:
>  nogroup:x:65534:
> diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/stat=
ic-passwd
> index cc6c5acd5c..b309dad101 100644
> --- a/meta-selftest/files/static-passwd
> +++ b/meta-selftest/files/static-passwd
> @@ -16,6 +16,5 @@ pulse:x:520:520::/:/bin/nologin
>  bind:x:521:521::/:/bin/nologin
>  builder:x:522:522::/:/bin/nologin
>  _apt:x:523:523::/:/bin/nologin
> -weston:x:525:525::/:/bin/nologin
>  ptest:x:529:529::/:/bin/nologin
> -xuser:x:530:530::/:/bin/nologin
> +user:x:530:530::/:/bin/nologin

Ignore the discrepancy between the user group gid and user uid. Will addres=
s
that before the actual submission. I'm looking for comments about this conc=
ept
and execution.

Personally, I'm not crazy about needing both a runtime dependency and build
time dependency just so recipes can use the install command with the target
user and group. If anyone has comments about a clean way to work around tha=
t let
me know. This is kind of a weird crossover between distro and image feature=
s,
where it's difficult to assume anything.

- Randolph

> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index bbd936efa6..63c7a11c7e 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -64,3 +64,15 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
>  # the variable to be empty.
>  # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protoc=
ol=3Dgit;rev=3Dmaster;branch=3Dmaster
>  CONNECTIVITY_CHECK_URIS ?=3D "https://www.yoctoproject.org/connectivity.=
html"
> +
> +# The STANDARD_USER_NAME is the default underprivileged user account nam=
e.
> +# The STANDARD_USER_GROUPS is a space delimited list of user groups that=
 account
> +# should belong to, and STANDARD_USER_SYSTEM_GROUPS is the same but for =
system
> +# groups.
> +#
> +# Please take note that not all tooling currently supports changing thes=
e
> +# variables. Scripts like sstate-sysroot-cruft.sh and reproducible build=
s expect
> +# these values to be the defaults listed below.
> +STANDARD_USER_NAME ??=3D "user"
> +STANDARD_USER_GROUPS ??=3D ""
> +STANDARD_USER_SYSTEM_GROUPS ??=3D "video render tty audio input shutdown=
 disk wayland"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index b231daf485..6f595f6d02 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -808,6 +808,7 @@ RECIPE_MAINTAINER:pn-spirv-tools =3D "Jose Quaresma <=
quaresma.jose@gmail.com>"
>  RECIPE_MAINTAINER:pn-sqlite3 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-squashfs-tools =3D "Robert Yang <liezhi.yang@windri=
ver.com>"
>  RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
> +RECIPE_MAINTAINER:pn-standard-user-account =3D "Unassigned <unassigned@y=
octoproject.org>"
>  RECIPE_MAINTAINER:pn-startup-notification =3D "Unassigned <unassigned@yo=
ctoproject.org>"
>  RECIPE_MAINTAINER:pn-strace =3D "Robert Yang <liezhi.yang@windriver.com>=
"
>  RECIPE_MAINTAINER:pn-stress-ng =3D "Unassigned <unassigned@yoctoproject.=
org>"
> @@ -934,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassig=
ned <unassigned@yoctoproject.
>  RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
>  RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.org=
>"
> -RECIPE_MAINTAINER:pn-xuser-account =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index 29cfba0833..98ce3d0d58 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -26,8 +26,8 @@ PACKAGECONFIG[use-pixman] =3D ",,"
> =20
>  DEFAULTBACKEND ??=3D ""
>  DEFAULTBACKEND:qemuall ?=3D "drm"
> -WESTON_USER ??=3D "weston"
> -WESTON_USER_HOME ??=3D "/home/${WESTON_USER}"
> +WESTON_USER =3D "${STANDARD_USER_NAME}"
> +WESTON_USER_HOME =3D "/home/${WESTON_USER}"
> =20
>  do_install() {
>  	# Install weston-start script
> @@ -83,15 +83,14 @@ do_install() {
> =20
>  INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_=
init_manager', 'systemd', '1', '', d)}"
> =20
> -inherit update-rc.d systemd useradd
> -
> -USERADD_PACKAGES =3D "${PN}"
> +inherit update-rc.d systemd
> =20
>  # rdepends on weston which depends on virtual/egl
>  #
>  require ${THISDIR}/required-distro-features.inc
> =20
> -RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xw=
ayland', 'weston-xwayland', '', d)}"
> +DEPENDS +=3D "standard-user-account"
> +RDEPENDS:${PN} =3D "weston kbd standard-user-account ${@bb.utils.contain=
s('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
> =20
>  INITSCRIPT_NAME =3D "weston"
>  INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
> @@ -109,5 +108,3 @@ FILES:${PN} +=3D "\
>  CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/=
default/weston"
> =20
>  SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
> -USERADD_PARAM:${PN} =3D "--home ${WESTON_USER_HOME} --shell /bin/sh --us=
er-group -G video,input,render,seat,wayland ${WESTON_USER}"
> -GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r seat"
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/=
meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> index 169269eefb..31bd75aeda 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> @@ -38,8 +38,8 @@ do_install() {
>      BLANK_ARGS=3D"${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s=
 0 -dpms', d)}"
>      NO_CURSOR_ARG=3D"${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '=
-nocursor', '', d)}"
>      if [ "${ROOTLESS_X}" =3D "1" ] ; then
> -        XUSER_HOME=3D"/home/xuser"
> -        XUSER=3D"xuser"
> +        XUSER_HOME=3D"/home/${STANDARD_USER_NAME}"
> +        XUSER=3D"${STANDARD_USER_NAME}"
>          install -D capability.conf ${D}${sysconfdir}/security/capability=
.conf
>          sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capabilit=
y.conf
>      else
> @@ -62,7 +62,8 @@ do_install() {
>      fi
>  }
> =20
> -RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xu=
ser-account libcap libcap-bin', '', d)}"
> +DEPENDS +=3D "${@oe.utils.conditional('ROOTLESS_X', '1','standard-user-a=
ccount', '', d)}"
> +RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'st=
andard-user-account libcap libcap-bin', '', d)}"
> =20
>  INITSCRIPT_NAME =3D "xserver-nodm"
>  INITSCRIPT_PARAMS =3D "start 9 5 . stop 20 0 1 2 3 6 ."
> diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b=
/meta/recipes-support/user-creation/files/system-xuser.conf
> deleted file mode 100644
> index d42e3d1f50..0000000000
> --- a/meta/recipes-support/user-creation/files/system-xuser.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration =
1.0//EN"
> - "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> -<busconfig>
> -    <policy user=3D"xuser">
> -        <allow send_destination=3D"net.connman"/>
> -        <allow send_destination=3D"net.connman.vpn"/>
> -        <allow send_destination=3D"org.ofono"/>
> -        <allow send_destination=3D"org.bluez"/>
> -    </policy>
> -</busconfig>
> -
> diff --git a/meta/recipes-support/user-creation/standard-user-account_0.1=
.bb b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
> new file mode 100644
> index 0000000000..1aa1e71bc3
> --- /dev/null
> +++ b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "Creates a standard user account"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +inherit allarch useradd
> +
> +do_compile[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install[noexec] =3D "1"
> +
> +COMMON_ARGS =3D "--create-home --user-group"
> +
> +python __anonymous() {
> +    common_args =3D d.getVar("COMMON_ARGS") or ""
> +    user =3D d.getVar("STANDARD_USER_NAME") or ""
> +    pn =3D d.getVar("PN") or ""
> +
> +    unique_groups =3D sorted(set((d.getVar("STANDARD_USER_GROUPS") or ""=
).split()))
> +    unique_system_groups =3D sorted(set((d.getVar("STANDARD_USER_SYSTEM_=
GROUPS") or "").split()))
> +
> +    if unique_groups or unique_system_groups:
> +        joined_groups =3D ','.join(unique_groups + unique_system_groups)
> +        d.setVar(f"USERADD_PARAM:{pn}", f"{common_args} --groups {joined=
_groups} {user}")
> +
> +        # make sure all the groups exist
> +        groupadd_str =3D ""
> +        for group in unique_groups:
> +            groupadd_str +=3D f" {group} ;"
> +        for group in unique_system_groups:
> +            groupadd_str +=3D f" --system {group} ;"
> +        d.setVar(f"GROUPADD_PARAM:{pn}", f"{groupadd_str}")
> +}
> +
> +# default case, and a requirement to satisfy the parser check
> +USERADD_PARAM:${PN} =3D "${COMMON_ARGS} ${STANDARD_USER_NAME}"
> +USERADD_PACKAGES =3D "${PN}"
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/me=
ta/recipes-support/user-creation/xuser-account_0.1.bb
> deleted file mode 100644
> index 04f506e7a3..0000000000
> --- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY =3D "Creates an 'xuser' account used for running X11"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> -
> -SRC_URI =3D "file://system-xuser.conf"
> -
> -inherit allarch useradd
> -
> -S =3D "${UNPACKDIR}"
> -
> -do_configure() {
> -    :
> -}
> -
> -do_compile() {
> -    :
> -}
> -
> -do_install() {
> -    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/=
dbus-1/system.d/system-xuser.conf
> -}
> -
> -FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
> -
> -USERADD_PACKAGES =3D "${PN}"
> -USERADD_PARAM:${PN} =3D "--create-home \
> -                       --groups video,tty,audio,input,shutdown,disk \
> -                       --user-group xuser"
> -
> -ALLOW_EMPTY:${PN} =3D "1"
> diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cru=
ft.sh
> index b2002badfb..5e1ae9c535 100755
> --- a/scripts/sstate-sysroot-cruft.sh
> +++ b/scripts/sstate-sysroot-cruft.sh
> @@ -127,9 +127,9 @@ WHITELIST=3D"${WHITELIST} \
>  # generated by useradd.bbclass
>  WHITELIST=3D"${WHITELIST} \
>    [^/]*/home \
> -  [^/]*/home/xuser \
> -  [^/]*/home/xuser/.bashrc \
> -  [^/]*/home/xuser/.profile \
> +  [^/]*/home/user \
> +  [^/]*/home/user/.bashrc \
> +  [^/]*/home/user/.profile \
>    [^/]*/home/builder \
>    [^/]*/home/builder/.bashrc \
>    [^/]*/home/builder/.profile \


