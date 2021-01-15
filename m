Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.76])
 by mx.groups.io with SMTP id smtpd.web10.4571.1610681009077750937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 19:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M6/1mQ0C;
 spf=pass (domain: windriver.com, ip: 40.107.223.76, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCPhpJq8IFDXzEShMhuA24BZm1saKJJzOmspfFR3CyZUu0/puIFQnNAkZ76cIUlvBxl5eNPHxe6VnWuiwN/2Ppv00zgfY5thOkfyN2ylrJ2mHAEkjQPZnlXTMBta86lZFikRtSkzTUO/oy0QljOXZTJD/2bSvxkYXiVrd5NbegTv27ZT/vEDb7HVtyg9QWHnBq9yyR+EcwxUNx+JHIKdOfATzY+c1iTO9M6bfZWoco4iEg5Qy6lrXsSdTit8v27JO8chn7etVYLFNc+3pyWm6ctftiDcX3MDwKukB6Kmphexa827UaVA/p1NhKupYlnytyOx1GS1QwNOEdLUKoriTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnGFGmE26ebMUIzEuFVdV4oZM3pkSp6F/8AGbClGr34=;
 b=CHhJZc5QujmEyJsEvhL+tP2XVy6k7SaG5YXqVDY9sCIFXl2Zzs/50pv6MllsxwQ5bTRyx4Y2VurcAZ/9lM6/fI/yr94Wft8TtmYpZpDecKtJteGrk2kGJ+Vmt28fpxYVCPAf/nyxeEjDNc4DaX5up31gsmUZi4Q8jHXo2xt4ADhyOlBL+QE+EF1YqS4FZ6tT34FLB+fps40GR21b5ngPkgoH83hV1D4SBwjaEylzpziskzVCp/YT6/UVG+ahwYFFyvS299ouE3cXv5SzuhLoRtDIs25o9569zvabcyKYL+6Fo+2M6+Q37G206YvTh8ObiSn7veBmzGGTW5+mQSCNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnGFGmE26ebMUIzEuFVdV4oZM3pkSp6F/8AGbClGr34=;
 b=M6/1mQ0C9JxGStMPmvIM/FF6jeL1bLGpiYzsFeW6/cQpoXl83L7lJJbbWv/vlOXvM90A2Tge8jcBvU43DpWvd/P2yspXmS+CF6EfKgwsWdmiaVtGfb1bUVkbMcsKKIZUXZeGj5cZxJ3Wn8YHYCc66fsBarJVo2v6NH4f2yQDlkI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2189.namprd11.prod.outlook.com (2603:10b6:301:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Fri, 15 Jan
 2021 03:23:26 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 03:23:26 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
Date: Fri, 15 Jan 2021 11:23:09 +0800
Message-ID: <20210115032309.24983-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0057.apcprd03.prod.outlook.com
 (2603:1096:202:17::27) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR03CA0057.apcprd03.prod.outlook.com (2603:1096:202:17::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Fri, 15 Jan 2021 03:23:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66443acb-b9cf-4cf6-0c48-08d8b904ebf0
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2189:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2189D6C26474882D3B131389F1A70@MWHPR1101MB2189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i/nRTxVUVjQEcnNu4oUfrohRrxR415v7fGSQngunr6wpa4whtKgcxY/dxvQY77aQlGcKGwHWfzlkuuM8Cpwtv6JZs+XXPB8v8MsmRP3LcrKPDxBMgaIxOxi7avl2B/nvCFxNqhCGrjb6zAhMMl0icGVzu2ZGzF915N+RCohFtkc2s/8AV2EmnO+q9XKelO8n5MUnMUpG9SUvpBexePu4PDIBDhA0PZ9pA6LmeSDEBxHZg133brzMhxtcAna2aa9ocPwgMtcyzIe0iZaBsU24LuC1XJQLpdYPI5j4xZb9jWxkIag4PNOwqFjH1txefDqMvxMTmNpVsCultDrRNuzH1HC3PvXDpKCrXChntQoH+V9cNV2FIF+Ln5S92gKFJ9df1zP9er30BHoPlnbDj4Y9G48813CgobZ5b7sGURST2pNk4licyLodsY+Ti8uEvvt6qsg4KasscQIXOlTl4i0qUDmPEEQZH4PUKdk7RrwEwcNePZK5Noa7pJw/ow78Jmki5+I+2Z8yFOA0hXFvQ9RvrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(966005)(5660300002)(6916009)(9686003)(6512007)(36756003)(86362001)(6486002)(66946007)(66556008)(52116002)(8936002)(2906002)(1076003)(956004)(8676002)(6506007)(16526019)(186003)(316002)(26005)(478600001)(6666004)(2616005)(66476007)(83380400001)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LBMg155J0quIMK2HDAttgBcTuBgQ8ym6h8RjpT/qxQ3T0ARk8KzNsBCclK5R?=
 =?us-ascii?Q?UHkCI5IRsukzwvaFHV1/Sli4yWzFHG98f2zELu+UwOtNjuAuBmZ5m0M2bsrg?=
 =?us-ascii?Q?CvF+e2LnbOZrf7Cs6Bex4XaV4fMTk8FR4wjfBphmt8Hx2/3PXKYRdd/t2Yel?=
 =?us-ascii?Q?b4jeYy10uVI0Lqe9Ctlgq3Ld4mgMZ6aI1XeZiyCSDI8++eQ3rdaZzExvwUne?=
 =?us-ascii?Q?8lyKAmuCD9mNR02pajumRF0GeyWCOqIsU+VNvYsV/BZ661dm1e1Z2K3V/MPw?=
 =?us-ascii?Q?G0TLqlPaDwikPH9RW9/ljTq1+8CeBxW4aTtl7N91hSeELVStWRR3adkKaU9q?=
 =?us-ascii?Q?6KQDvsHlCeItpQGjZHUgHCtWkFpFSPgdWn3giLeu0AS8cxoJ+ZLerrbSWWN5?=
 =?us-ascii?Q?LVbYALNk3qELmgNkHpqHFcULOXNW/XIKGnbljLPv4nyo4+paps0HcuYYhWzZ?=
 =?us-ascii?Q?VELrnIDxJbC3Ouc4buNkLECo/1vF1YqF6XaUtczkmNwQCHV5af2+mn0hyH9F?=
 =?us-ascii?Q?xWGgfYNK6CvqIR/Ych40bXs1qO6BcpA2Balm5se9HYRqL3/cuT1L2n0H2f2v?=
 =?us-ascii?Q?VQKy/tMeHHc3Eq4sX/6UPk+ZXVAX8N7xINvZwXAt17hvB5JyAGyHD95St4R4?=
 =?us-ascii?Q?dbnpRNpwyCxo0IZMppzuPvg0l4eqpkFcjAwiDpQjxw3oxFLCZE5J3H8mkmnH?=
 =?us-ascii?Q?/vs5pqNA6pabHEKgsiB82tTLCWD6mAW0V+j+Dgi3YSY2wqr/G+Pk5lGUrwoX?=
 =?us-ascii?Q?i3CE86wyTR34lxs66QU8hC0vduH+U8rvRxafV93lSntD8icvspbW/1TfD3iO?=
 =?us-ascii?Q?DdKR19flW0NrDdcNwFabKCJ+mqszHHr21u/zpaDc6NYnTMFMUJsRLmtEhVOe?=
 =?us-ascii?Q?WwFNJlXJhTybkvoQu90WAC4wrIAEQBOvmI3kN41Nxx1GiX+zYdKbv6uuB/7j?=
 =?us-ascii?Q?2GdiG8O5b6BShoJVeTsWVkJXNyoiDOCD/p+9Tl8vQBw2GfMJ6Mdg8j6uVgDZ?=
 =?us-ascii?Q?K1+Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66443acb-b9cf-4cf6-0c48-08d8b904ebf0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 03:23:26.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McppwOdBksCvcUAYQVcsLEXY1fJBiYm8/tBk6cqDyrU4PTJwIKI6Kvi5067manWcJH5js7+R3eCKCxvTLxAP8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2189
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When multilib enabled, there comes below error for packages which
inherit useradd bbclass randomly when build eSDK.
 $ bitbake image-name -c populate_sdk_ext
 Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc/work/int=
el_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/p=
ostinst-useradd-lib32-avahi' returned non-zero exit status 1.
 Subprocess output:
 /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe=
-sysroot-native/usr/sbin/useradd
 Running useradd commands...
 NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc/work/int=
el_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --system --home=
 /run/avahi-daemon                               --no-create-home --shell /=
bin/false                               --user-group avahi]
 useradd: Warning: missing or non-executable shell '/bin/false'
 abort()ing pseudo client by server request. See https://wiki.yoctoproject.=
org/wiki/Pseudo_Abort for more details on this.
 Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-st=
d/1.0-r5/pseudo//pseudo.log
 ERROR: lib32-avahi: useradd command did not succeed.
 ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x86_64-wrs-=
linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567

 $ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5=
/pseudo//pseudo.log
 [snip]
 path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/intel_x86_64-=
wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/re=
cipe-sysroot/etc/group.33605'.
 [snip]

 Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
 /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-s=
ysroot.

 Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
 recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinu=
x-image-std/1.0-r5/recipe-sysroot
 to fix the above issue.

 [1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/li=
b32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 96c1c62b10..1dc08344ca 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI =3D ""
 PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/reci=
pe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}=
/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WOR=
KDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/s=
state-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR=
},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSROO=
T},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-=
control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/ss=
tate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-bu=
ild-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPD=
IR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
=20
 export PSEUDO_DISABLED =3D "1"
 #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
--=20
2.26.2

