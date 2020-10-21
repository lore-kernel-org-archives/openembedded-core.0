Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.67])
 by mx.groups.io with SMTP id smtpd.web08.8226.1603265575758210525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 00:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pFpcEYR4;
 spf=pass (domain: windriver.com, ip: 40.107.243.67, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clnNBnQeksbQS7RteGuKzYEcGX6YNwsSKPlCUjvUQ7RyzIYtoW80AeE/HVgBsDU+1P4DFcDmuq3sBLRHXkQ5MK+owYggOXkC8vShQnshLyJiRd8KbGhKi1Bct6fMLX6SAHjkJN3bYOqFY8d/gPuc1Bcbvyzd7G+zkzWCoiLjSFtve3HXgBT7dwonVIqXmkLjxWIz9Y/M+F5sDw2swoY4NV/WO8GG6uYVraZrm8lvqA4HUQcRGd1ZnmXIeBpN7LBCFYq1IE8GrMy2WrFps6XLR4niYyhazzCT2FqjyRNhdO/+9t9AE/xesDEkvorIBP46YqPxw/skFgV3tArqkXon4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OdtBo9LTvuuGbpZzUgG0cDVQVFKt/nCmiuCmBcb8Rc=;
 b=MVQsYJmSPD1dkOr/4tqPJ94JVmZzGQh1m0gJVA27CN5uX4Y3W/g7sMDp24pZ70gFuRlpXjEPF+k1dsdPBdPSvi+FCF6W08obB/bP1RkCIDiimOJYFrpa5rN1TgF4pVmdL57sTLDdIhSikRXx5irf3C2pAHnps5pv2p5R+vxC2lG0y70tC60HoxM0/JeJ9PJiQeqLDGBriRaSQt1Zc0vxjW+k2PAsUybSFUXi3tuT1zj31ymIuOvgaTZC4KpsRrO4GN8IgE2zf48+AXBDy1dxsUgpy/CM1MDtPTk2WhSwMyFUIw+MSLu2gDT5R1Gj84I7pNYBDhqYrtly05KP7PdCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OdtBo9LTvuuGbpZzUgG0cDVQVFKt/nCmiuCmBcb8Rc=;
 b=pFpcEYR48snZa0dluLTDCMde2hGhOIyjJhrm8hhO8JRV+fQD15jHaXRQRqG1MN/OkL7XfCcWFOyeyVSSY0EIkW2pSDXgb4zZBE5KLpyxRamSz1vVDVxRnEAm7fvvop4Ge/kBWMg79pbpOlTTXvc21Fk5ibtqeG6FS/xwkFo1nZQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0070.namprd11.prod.outlook.com (2603:10b6:910:78::16)
 by CY4PR11MB1831.namprd11.prod.outlook.com (2603:10b6:903:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 07:32:54 +0000
Received: from CY4PR11MB0070.namprd11.prod.outlook.com
 ([fe80::74f2:e272:9be5:b864]) by CY4PR11MB0070.namprd11.prod.outlook.com
 ([fe80::74f2:e272:9be5:b864%5]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 07:32:54 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] meta-environment: fix site-config files identical for multilib
Date: Wed, 21 Oct 2020 15:32:32 +0800
Message-Id: <20201021073233.40046-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0153.apcprd02.prod.outlook.com
 (2603:1096:201:1f::13) To CY4PR11MB0070.namprd11.prod.outlook.com
 (2603:10b6:910:78::16)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0153.apcprd02.prod.outlook.com (2603:1096:201:1f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 07:32:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fbb9585-0046-4e8e-7538-08d8759385d2
X-MS-TrafficTypeDiagnostic: CY4PR11MB1831:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB18314D65BF3DA85BA3211BAD951C0@CY4PR11MB1831.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bwDGcCP+G0lBA8Sqi/LO+gwLQqbWzToWezWnMGlcw5bUOkXx1nNWQFLa0YIMbpJ6Lv8JqxjkbKxTP0EcWIYJw3P+DLW5EfE0Za2NRuJON/D0dmG59trVCjuC/mL/2VBPH4JV7Lo7cw7s4C3IEooWM/85pBj5yMG75hGdFfZM+ISpFUfvdzxQWTaI0zgJOGLVaQi46oXZ8PSROlEvPJlXW2/r0r1Ui0de7b/UQXjSPlnYuy3Wf2NXBDd+D5MtqkiQiT1t4byjyUoVRYODre6WO0Enjhmut+6A5T4483FoJzrmurDAp1GYzpeL72O9NGVM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0070.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39840400004)(396003)(346002)(6916009)(86362001)(6512007)(478600001)(1076003)(316002)(5660300002)(2906002)(36756003)(4744005)(9686003)(26005)(186003)(8936002)(16526019)(956004)(8676002)(83380400001)(2616005)(66476007)(66556008)(66946007)(6486002)(52116002)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ps6r8EVnAcHKZrEXFJ/XZMryjnEM833OdPVquOX4pyCG2rgcL9D4tYsIvISRyHEgVUxgoMtOepQsqJq0//1ZRVQ/Td8a7o6JoaDOVHsAZFLHtbY9QZgmx9bxACdtBrz8M+YO23IY6J97i0VyQS+QSD8RWz96wxoC2VJszAmO6yCWcXJRQ42xLaloZOd7UrwisoYTvYz/x5YGGEwqP8I82XKL1yJXi620VIn58uMN1Tuvzf8on8aqlkszHh1Y65OUhAPW/RERnUunHmJ1epYb90nIxm4VfzUt3N2xYbDKxlkA8pgvEhj+E7lga/f8anzH1zE/0yaxyQNtb9QaeEDM4V/PsSZ171XRV3dw9RAqSw+m6LLZrsyETQ2pFL9Z9nBKVas+l9FHAWiX8nO+faWFPguypCJZM783l56J54sYpfKo0Tg0Nh9OW9K/5ikV8mW+JpRR2pnG5sBAMP6WG98Ap70IOqFkcqbpYySI7DcpyHPH6MyRsmhtPUm93HwZZzPVT71LjjzxIPpMwoneOkNZfuQQXje5K8hOWRM7Yk/+P5+rl7GFyozNSb4xlrGYqNgB4134EHHyRgsEMR+m6mhXuQ0ayDp6WeOhJuC/s82iPGsTRVucbpGY7uVz0DgX/rsdlzwATm6CBZk1Vm+GsVgSxQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbb9585-0046-4e8e-7538-08d8759385d2
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 07:32:54.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXo9apcEiSCTDWKt2fZPJEqRWnQbkMSRkk0ksVsgGyCTX8KATGFo1TTcGYBGoHvTSjzdj9zlKtNNa6Iu1FEK3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1831
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Test steps
1 build meta-environment for MACHINE qemuarm without this patch
2 build meta-environment for MACHINE qemuarm64 with multilib enabled

require conf/multilib.conf
MACHINE = "qemuarm64"
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"

3 compare the 2 site-config files for 32-bit are identical
$ diff path/to/tmp/work/x86_64-nativesdk-pokysdk-linux/meta-environment-qemuarmv5/1.0-r8/sdk/image/opt/poky/3.1+snapshot/site-config-armv5e-poky-linux-gnueabi tmp/work/x86_64-nativesdk-pokysdk-linux/meta-environment-qemuarm64/1.0-r8/sdk/image/opt/poky/3.1+snapshot/site-config-armv7vet2hf-vfp-pokymllib32-linux-gnueabi


Kai Kang (1):
  meta-environment: fix site-config files identical for multilib

 meta/classes/toolchain-scripts.bbclass     | 47 ++++++++++++++++++++--
 meta/recipes-core/meta/meta-environment.bb |  2 +-
 2 files changed, 45 insertions(+), 4 deletions(-)

-- 
2.17.1

