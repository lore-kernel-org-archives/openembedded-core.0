Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web08.24662.1611126357755909304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wg6csXi8;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlRjWqzt5P7bAXRSeB4Q/6vmly7ZOovGUCOwGZE2fht4P6Vy/zETHVzqSO8Rf6bJfy9ZaLocAgKIzvzdu5FFymFWPpml2mFYYbPqAj0o0qo66y7A2rKbnbrhaWq/l7exuCo2IXFioaAEpv7RekjdjLK5cyQpbCEn+av7vUga5e6acV4yxQCmOGuQsNYsM7WaeD8tFquYDk9hOh0EKhNR32s4QzmhpG4jLdZI6OcwbpjYlAWiUY0OGJ+BKbgYASLQ1DrPhgIbR4+iJrnD95w0gH8vi+IBWStLHd91G9B81rGn9ZuextvHl30gb4aOzhZr8OHRJ1sUKTQL9bjyVomUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E30pxMhcpz0OeuxbjQRTPQVuKPSAAXvc4UNUjCLt4Bo=;
 b=Uvb1p1BxkCrRQB6/ULXTiQ+VXjIXSU7EKtbkdaU52m+XwElGPHy8I33oEqy4iBgCcZwEhLFS6I9YAwYJYfbPwJeuogjy3WrjTtFBibcl7/3bu+4BV0Ygi4BolImJktrw/6VOwTV9H9Iqhs7u89UxG5S8KMTV6TE83QuEd78wTuYbMk7ZcULjkDf+SLOSl3zNSGVjJJLAc4uzVMZ9kUafHnY+HQlpdz+GNQL23SnF3ypHuWXpRsUPbXEj+vCTiUgCfdeUanaswgrE7hmxmyxHoDuR68i9bmOeqez1ST49i0gVfxT8qvsq+sTjEp6upZKDF6mfujg+pcv48YPVmHGuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E30pxMhcpz0OeuxbjQRTPQVuKPSAAXvc4UNUjCLt4Bo=;
 b=Wg6csXi84laM/+XD98uC76UPod02ewh/E7kJSlTEvzbuWCe43jzvSiKxD41rLR3FYfw2BIUVJQSfTqS/QTL1pRjnJMOa5NXh9DCcMhx5YoGU/rKsYQ4+kdJmPvmTWY5B/KVUVsw6lRxszZ0nsNe8+EcfHQBJVW4Y5jfIuMYtM+E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1949.namprd11.prod.outlook.com (2603:10b6:300:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 07:05:56 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 07:05:56 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
Date: Wed, 20 Jan 2021 15:05:27 +0800
Message-Id: <20210120070527.32242-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
References: <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SLXP216CA0050.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:5::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SLXP216CA0050.KORP216.PROD.OUTLOOK.COM (2603:1096:100:5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 07:05:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59fc0a09-ae79-48c1-1af3-08d8bd11d328
X-MS-TrafficTypeDiagnostic: MWHPR11MB1949:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19490D94257868D59B3D9E0CF1A29@MWHPR11MB1949.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+4Op3OyrzkQnXRy0GfRIJTwjepSGToqz7/jh+kg/gB2o/rWMKWi1DObD7bpA31RR6iPZ3farKHwiB7ysVfG4zzqQ3fal52ks/Pdnff2HJUQg9kl2PinE1FkfDXzfTfNa4xbBSugk6i4ciThxMeseqsCtJhmIjPqTDQZvO4AuTEyTzMr87RL30eONb+BP/Ye3DB6y7S+poWEWfZGYDKm1zUGkRSC606kVB5guageMV9dEMdrGU3scZxDzQPD2v9KG7FRHLxFL8HFJXmATa8Kf7aE31LW9nW7tqsMpCocOnILrDUeryrUq9avvOIXk2wvkUYAw91eKiufvQ5eQxA0shSKiShWCUf8uQsGucU8yC/YLxPXj/SDDoB+iYVHt+UTwosxsyvKGBi1b0rVahcYdCy7CRWqBn8a7qiAtDEdvtZxaTfa3Js4h8baLHe2f45btTEdx7OcfwUiIEpiH05aUK3YyDmZB9wMavtp9LLFmGOBRgytqjO5atXRRmD30DFSNSPe7LlaLoVgHZ664MHuuxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(6666004)(6916009)(66556008)(2906002)(83380400001)(2616005)(956004)(5660300002)(36756003)(6512007)(16526019)(186003)(316002)(26005)(9686003)(86362001)(1076003)(8936002)(6506007)(6486002)(966005)(8676002)(478600001)(66946007)(66476007)(52116002)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?8aIlQPVwC4nFO5OpLIGwj7GCQiZ1hVB2EJVieEiSHMBmONBWNQMxyN5SBfYE?=
 =?us-ascii?Q?fXm/pc1U95oBX21vokVa/jKZs29W53eRDH9nMmyIqt8SHXYmk7kUEchRCuwW?=
 =?us-ascii?Q?cZ/I64JmNivpAXbEc80aZczAEExZaz2OlVYhX4izl0LFDou9Aor7OPCnaoxS?=
 =?us-ascii?Q?pKvESmc8uWNsrzfLnouPfFAJvnXmlOZYmfwYWeUNC7gIygk8Bx/10uGeSXcI?=
 =?us-ascii?Q?3HCWkdkphtfRFAw32uRN7Wml3He5kps4f1VnVJC5saYm8ve81vfgHFYHteoO?=
 =?us-ascii?Q?VEc7bYxak448HYz8l2nIVRTk0XstURSzhxnPDLj0wbpCK1Vf9OBpW7ITRIhS?=
 =?us-ascii?Q?SSz6EbS0m8CP+ny4x1lLYsSyI1ZVQ20iS5gp4akT19URx55f75Q+oGc6Z6pO?=
 =?us-ascii?Q?dlnBimVDwyWltgrK6GUuWwzXndoclPYiGtS3nbm7R5fG1T5Wi8pQzTC4yIeb?=
 =?us-ascii?Q?2BzDsmCNUMOPAqfoQJwFWrGefHMLeOPJHwTFf/8bSaRocwRBPJr1iA0gGn4F?=
 =?us-ascii?Q?Xp6bvdUvo+9xARJyMj8W8vDBwtZJOCS7jkA0HxIayPI6FQGZWkfMCL3o4dx8?=
 =?us-ascii?Q?ZTo6SDI4WFK3xQiEK7sKW7o8yIXTtiuYPczPyl2te5wxw6wPN7I3NsMqbjcM?=
 =?us-ascii?Q?lurft4Zd2QTrS2yThJjs/7cJ26BfJ6CV6XuL3gjGjYHT/a2ZW92LO2zhhMzl?=
 =?us-ascii?Q?djjo0czqpUHsVfihmobfJIX9c+fkHHV5IGTJxBWgpMC5ZeMkDXeH/tBdsJnx?=
 =?us-ascii?Q?69nld2SPpVjO7ZUVBucQKA4oiBgBaS7eb4vflk3bGs8ied6gkJ3miVM+ruRv?=
 =?us-ascii?Q?2mTxsanvI7m51LUjOzsyP7wKPHdaFrN3K3m1FvvM6Yds1puwt7xr6IsF8RRD?=
 =?us-ascii?Q?OSDFvtYBOJFF2LUDjxLglMLsScBjdJ/m6ihZ8U3255TcphZeT8YP0DvnwQh+?=
 =?us-ascii?Q?d2CjuXNy4rARJNqzV+eeg9s4D4yt826g7eoO5KE8yPg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fc0a09-ae79-48c1-1af3-08d8bd11d328
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 07:05:56.4149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLUopF4IHoIrW0F5OiH6WsHnB7Zzj2HidbkY8h12ZECJV4EM8Kc4J1T++3/RSvBZKvQ4I3FnCReaaON/St3YJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1949
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When multilib enabled, there comes below error for packages which
inherit useradd bbclass randomly when build eSDK.
 $ bitbake image-name -c populate_sdk_ext
 Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi' returned non-zero exit status 1.
 Subprocess output:
 /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot-native/usr/sbin/useradd
 Running useradd commands...
 NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --system --home /run/avahi-daemon                               --no-create-home --shell /bin/false                               --user-group avahi]
 useradd: Warning: missing or non-executable shell '/bin/false'
 abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
 ERROR: lib32-avahi: useradd command did not succeed.
 ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567

 $ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
 [snip]
 path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group.33605'.
 [snip]

 Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
 /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.

 Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
 recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot
 to fix the above issue.

 [1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af1b3b8c3e..312b544d41 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSROOT},${RECIPE_SYSROOT_NATIVE},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.17.1

