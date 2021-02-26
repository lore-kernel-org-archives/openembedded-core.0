Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.58])
 by mx.groups.io with SMTP id smtpd.web09.9895.1614349267153301513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZdGpjQyO;
 spf=pass (domain: windriver.com, ip: 40.107.223.58, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXk1JwJ4Aidc4JrsvOYcp6pohoMAYhM6ERG2A6SNriOMERZ14m7f0Mal9EXfd22WFO3HkbZ5P1IWQCwvqn95aG2+c5APDIPUW1YAHCXHOCzCkQNECtdZ5PJ1gTeEAn2Ydit64RDpU3UKXkVbcmT00oMe36UQHUTcSpqOM017WKCQc2PtGoFQCGpBhLqfpZ51iyiNOQ4i6dvyZBO8s5soizDlzWo7yznz6dS6zh5e7ljVDtTGn/BbICiMKz7dLyJdeSBzJu98ugX/5cIeMBphaItfIcPkvbXBxNCwIswpAPBl5fdPNmCXMPd0EA1xgDMb0UzsI7XQ5Elw9XAYPCSR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoKG1nrKr9TM8fZVK1T/J+8cdUNaVjxK7lFM3qKHGp8=;
 b=XelQOY7FtoMjNugTrZgSyZjv3THp2bQe7PjwkzlrPRJggFmJ0bXJUGfFto6MZYuOUDRuE4FyfOrAUQECjXpyHGsR8BEfuPj564lyxOIGu2MIG/amM4w9XDhoEfYu3n2mBzur1EO1gY4M0MajEnoup0637W3rlh9RpGPW1XKmxgNXg73ezogLQJ/V65ErCmMsJVRRaszPwJDU71rMmSMmoEcJ7YQpmCSqMihqGlDWQj2OI1Qj2i3+D3blcmOFHbyxb8tcDn5h+9NJBE0EAXz+fRPCGTcge+ZzXxckJN3O8kz9HP+qkDMieW1YpTnIQmhBDllPSRdp+OXlpayppix3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoKG1nrKr9TM8fZVK1T/J+8cdUNaVjxK7lFM3qKHGp8=;
 b=ZdGpjQyOiqq/zgcXCJG5+A1vz3I03DJyACW78oBaqDd3yPEBW1CJydaSuu/nUFdpsrr7DL+DlS2+0XRIpkQ79igiVAeBzXzaStOOdubayU7MHWRGrSCcT6ecFPhMto49DihfMx3U0F0j2u6dXZXI00p5Hgn3uTmcd261J1LQEtM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2351.namprd11.prod.outlook.com
 (2603:10b6:300:74::18) by CO1PR11MB4947.namprd11.prod.outlook.com
 (2603:10b6:303:99::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 26 Feb
 2021 14:21:06 +0000
Received: from MWHPR1101MB2351.namprd11.prod.outlook.com
 ([fe80::ad02:3dcf:d3e5:b27d]) by MWHPR1101MB2351.namprd11.prod.outlook.com
 ([fe80::ad02:3dcf:d3e5:b27d%10]) with mapi id 15.20.3868.034; Fri, 26 Feb
 2021 14:21:05 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Disable CPU ISA level requirement check
Date: Fri, 26 Feb 2021 22:20:45 +0800
Message-Id: <20210226142045.29040-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To MWHPR1101MB2351.namprd11.prod.outlook.com
 (2603:10b6:300:74::18)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Fri, 26 Feb 2021 14:21:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8b2058e-82e9-41cb-252b-08d8da61c0e2
X-MS-TrafficTypeDiagnostic: CO1PR11MB4947:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB49474F643516E825A12D247D8F9D9@CO1PR11MB4947.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uVuJ/xNChuzG51tsfI29zUMyCZeOS9Hng2VRnr6jvEmO3UuDfP0QCGMgIMiy2R/uPZn1MzU50bjBa2hP2cr+5Jocy01CaZ2Ngp4VdQxuHrQREOdnXZXkeYdHKZVBlvTY9Rcapssb6g6WOHI0+S+ZS5k93z0uN+RsLYQnS26jPGd68R7LqeRQGRlvaA1QN/Uz7bVtrXcBW6/hw6ZPE7PaWhBlqlBgkub+aUukeuQN/grjIdoEq3XvQta5fu5CNFyTmjZ31FPrYmKFYZ5Hg2q2xOULsw9CJLdU1Y7Rq7uo96X+N5a7HUZFAEp8tOGcglvbgs0qclw1E2+xTauafe0oI1MJygCPo8l77hy/nUP51kgZaAcoX1jYtRxaubl40hXoPAeO8TaXVsYNw2zEWEElcAWsTsTAzRrXCY4q5IDdf3+g0RA89IHTg/9C+ufk7Yw+Gv8mxqB1TbDxx2Emw+Fg4gg4GQQ7jtIjJZUjWsfCJaJD/UK4k5CTaU4qmEkgHgXTkGEQv9A0Htnft4UEG5fEP1o8/csXwr+bhNVyMXpi9ZcASLZT06Hq+CqStMCS/5qIaOnfAXorCr8DvNcIrijiDQkoR+QfFVLJhC8hmDLnIQo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2351.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(966005)(6916009)(36756003)(8676002)(16526019)(6506007)(6512007)(316002)(956004)(86362001)(26005)(6666004)(2616005)(8936002)(5660300002)(66476007)(66556008)(66946007)(52116002)(2906002)(1076003)(6486002)(186003)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?d352RY0T55AdishR3gWalIVIt0qsxgEt1m80/OqMl1oMYQuDWV7HNngR2klL?=
 =?us-ascii?Q?cj8gsnHaWl2K0whtct7nK4jYuftEmNeCuFtM+BHLRpvUqhuDglTRhKW8Xjvj?=
 =?us-ascii?Q?JPC7D3pemr+5p0zeS1ZJDVp70wVYYrEmUKL6lOA7FaAUW9YUm5RRActG3hb8?=
 =?us-ascii?Q?kNeb96bkpmfej4/JkKtl5vsB+sxzaosVyoXnNGDdpTZl9F7pwnHxoVxQy5J4?=
 =?us-ascii?Q?IFKhHbkHnL7XoHcyP6y4w+CDszJDTO5Ip/fsKpJ88abqGmJKvGw4h33R3iM0?=
 =?us-ascii?Q?VvDU/Iqg2wFi6w5tYSkIZECrvOL5UQmJo2N97qQFcjNtZYBMH5jKPwz2+q6N?=
 =?us-ascii?Q?AvDxH70vHIA3x8kLzGlnxVGdXWWNnt1Kr8YJFrthjjBmM93lj2tsvA36UrYx?=
 =?us-ascii?Q?m+i++iXWTTQ12nFhILw0TVfgyNztk+uL7mobvwvtE5EVQzrK4Gqf1726mNTz?=
 =?us-ascii?Q?eKyqrpX8kVnCBkCSKDirTzGePQsezy8XFV4AoOtYe1it3PKr8jlS6zBKdwiF?=
 =?us-ascii?Q?hzwwZmfcopJeyIFzj9hMFHyZc1gizB3oS+v40v+U4KtXoJ0jZyMyQrzhJd/8?=
 =?us-ascii?Q?d/WfvmJTViRFyuTkkRzkIHZuVKaTHOkzuIPlew/1qsn3dD5wt24z+u6YEXy+?=
 =?us-ascii?Q?aN7yZbhe8AzjgMAxvjoIFxw11nuQgDp0N26DVRqL4APxDli2mIg/swZg7ix9?=
 =?us-ascii?Q?7t0/C9ApcTpWx6wAD2Emr+7Y+oLrFLXF4YInQ7w6/uJ2dalP/T0dhSJdwF3l?=
 =?us-ascii?Q?zdgInova7933fcY46BCaFm6DkrmEGpsP6E/yuR5gvW3BAf9f1HPnNkOfDe5M?=
 =?us-ascii?Q?F3iIXyfGmwPWT17DbWnCcyZ4uCA9Q1FpE+fn+K59qRYzTRSDedIUQJ35SDNa?=
 =?us-ascii?Q?VQjjSOOg+ndSvDDIkTaFfpwJFWuAkeEFBO90rcWZYCqD2JRo9IXKWn4ZsowQ?=
 =?us-ascii?Q?lfNveMIALkcdxbB0//b7YJjk4JqY38oc0MncKOZkUq8CBycOn4yWK4IDGx8/?=
 =?us-ascii?Q?MhEzN9BOrdPPJ929gN7S/e95Zv9boGrTqCA95PUdO8kxyTmDpVOqTuvSaK1J?=
 =?us-ascii?Q?OoNtnBlQO6MYZJzMoesNmgDmywc31lGENd/xsDyZip8dUw4osWi1vgWkPycU?=
 =?us-ascii?Q?4AY05PZdQI0FaOEK5qbBAg76Gi+dHCBEq7qrtO8PXnUBN6mfN7rRMIuqJHt8?=
 =?us-ascii?Q?eOFgap8PZFaMMJ6PyCyLBz6ccCPS5V4nYp4kgEAMqY1J531eZx6+qCfI92E0?=
 =?us-ascii?Q?ZiIiydPNVRevdagd9eSIQQOFqqSYG7QBDALnr+GhkEbFB4Dx0n4efxCJd6RM?=
 =?us-ascii?Q?cd2Vl/WbTvwxmY8YuTU11qvH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b2058e-82e9-41cb-252b-08d8da61c0e2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 14:21:05.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt2Rf1YyGSJ2TIvt4cR1J6zMqI+T+D8JbdEz/oj1tnpNmPemKA1bm8rgL5HhIZrfLhd0WxaAYburZnPW9PrQfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
Content-Type: text/plain

We experience the following error and fail to boot on qemu64 machine

/lib64/libc.so.6: CPU ISA level is lower than required
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

As stated in [1],

Passing -march= causes glibc to add annotations not compatible to run
result on -march= as too high ISA level is inferred.

ISA level is a new feature of 2.33 release.

Until it's fixed let's disable ISA level inference with
    libc_cv_include_x86_isa_level=no
(no better configure option yet).

[1] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=5dbd6a821ff753e3b41324c4fb7c58cf65eeea33

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index d2f02ad59b..7d14306377 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -20,6 +20,7 @@ CACHED_CONFIGUREVARS += " \
   libc_cv_ssp_strong=no \
   libc_cv_ssp_all=no \
   libc_cv_ssp=no \
+  libc_cv_include_x86_isa_level=no \
 "
 
 # ifunc doesn't appear to work on mips, casuses libbfd assertion failures
-- 
2.17.1

