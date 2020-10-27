Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.63])
 by mx.groups.io with SMTP id smtpd.web09.7616.1603762201443896093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 18:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U6bDA6dm;
 spf=pass (domain: windriver.com, ip: 40.107.92.63, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISG+GY8VPnwyScEcIMIAjnWS5hhzQRFRZ7ndzffgvfnal0jCd4PzEyEc9L89lWps+1n4NB+6/hsiFv1tu3BUTPD/T9TvrGILuk4W3xVCvjEaE2zFZcsOOaaYnV/NITx/ZjVXznZr4obcEt8zUlSZ0DP2rdHec0xuMfAFvWGJTI0uwIpDETXIXlW+poqnxjDrR/Cpx2rxwSXvOwXtqCnvtKfDaWl9bJoBvrVF//hJyuLYTGBo5mMOEVsICl335/yTK6oTQ3VTNJDPl9I9obQcbIQ6h2xlbmI++ML+sj2EFQZwvnpY480VznwYvB4pvEDEH/p7XV8OHI1j8IF4nKjntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDxLiE5Meh2cOXCyg93yeZHX6TccUbKua0mh2by5kJg=;
 b=jHL9MbzILQNInttyVQwDZrgOQzrFC+vDLyJTtKACt0lkkCK97LJLDdRbVH6gnFnf50PlWeZS2UmMuSiOJaXjTncE6L8j8kfKeX7T+ADZRbJVXDRPDsEjK4CIL7zp2IKpTo+9Ht7wL0vm5LxUfD1MvmLSruLE00MrXXpHuPOBxjoKHRzqzDAZ3kgErjFikS/TCogZRyXKnwnpJb2xcxBoiz8gp1whe2RsB9lHtp2i9Q0Oq20B5//UghXSwSj08PP9xan5uh2RyXq4swJkhXSoa0wpmoPf69wm9gj3Kqc+FM3EmQllcR6xHIxQ6xd0AuVECp07bbLnf8M2hzoosBA4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDxLiE5Meh2cOXCyg93yeZHX6TccUbKua0mh2by5kJg=;
 b=U6bDA6dmME9SgCbeWxJkjkMIcqfUFcLMPBYkFTkw84IMetxjMLNJJcCDS4KhrwynfIcSDzN/YclZE7cUh1CC6iZF5p8btxK3Go5LGD+L03hn7e/lya4GoTt4c6FeGWfXk0AkwQCuWJfWta0UUPHZ8SwM61Y9aupUx64NK0N8v78=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1309.namprd11.prod.outlook.com (2603:10b6:300:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 01:29:55 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 01:29:55 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
Date: Tue, 27 Oct 2020 09:29:39 +0800
Message-ID: <20201027012939.45485-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Tue, 27 Oct 2020 01:29:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5b8d5a0-7c70-4849-ec8a-08d87a17cf14
X-MS-TrafficTypeDiagnostic: MWHPR11MB1309:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB13092F3B634429C26541BD2CF1160@MWHPR11MB1309.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jr20VsWAPd6ca01HUwvZDrX00nNAR3YSNRDDCtj9dD8xfY7HwqV7jZkRii5d9CC/CEnolSbXVa2JDpF3/45zmzod/+vDxEIFc/qQmSTrWklMhAQWRgY88oP27MaMUQ5+eKdGgWUKpuXz1PPIh4Owe2KEZWjR55b9K34WEGBeEyUfgVFRzRdijaw2HpH2pslCrZFxBrmVVdKwepr2DWs5bVOxKggLmRx+tzuAdinfEbm4XPLbim0RY7LxBZpN1yezaVBqD54ez7TH5wm+/x5Xm2SDGtwUN5nLuozHSyiKlBXDvb9Ss4RFC9HawrbXZeWv/qx9a/dPNmoACYF+QZphpuA8uQVvwfELeN3kHs7KTYZM0pVLA42Y6uzwwOlWdjHVOEpOVbix10/iww0sr+hCnw+kKaqAgGS3jSemwOe3Ym4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(6666004)(66476007)(66556008)(16526019)(8676002)(66946007)(83380400001)(52116002)(5660300002)(478600001)(86362001)(6486002)(9686003)(6512007)(6916009)(1076003)(26005)(186003)(36756003)(2616005)(316002)(6506007)(2906002)(8936002)(956004)(228453006)(130980200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Wnto+ku1r5PZHQBYHg/yOXbyqSbwU3+J5GyJwIFb7C1eCKRSolWFqz1aZWWbzW+ESrVfXaqj9gcIjdYN36xG4o4hoquvQxyqcZb1ZOLmw6OT4gl6VkyXh1Yz7IVWZfUn7h26Djh0YXRefwCi3vWeK8uxrpJVswqoCRK8kp8zzPDyMcQ8lRaECUWRaNmGJ+4beiA/wCcJtfl7HvBJ0DMPqsKny1CBTp0WFbt52YQKyjbg5vIPHJOBSj1FIN7Oapm5ZPWcR52NkguzfrJaQd+eQZz6uBgYNw/uZqFnISNF5pEmAve55g3asjKNvXJw3SM3u8lI0FIe+Pbe/34fs9tneBHyHrSQDCn18nCYv9G1z5s7k34qQ3JLDtiPWCbzNFSrAj8R5/J3Ss/A70aAlOZ/kgyiCNsKvF2rs9pT8NAwNfsWG+RZflO2dQDYh9leLP8MfW+r/Qu5/3KxyAqx4by+N0G7cwOvTelXV6gJunSxPhSoVVkHiILIHU9UjfNjhvdMGqoQoxNP71f3eFtLRAp9+DRrjvIKbDK1akQSsT95ZE9wM6/nQY92vSKpW3LWa/QTrNdzCf0hBlAzN0TsankjdQRRw1huReth57O+GSuyjdbRCt+n1ERckfA0wldPYf7uJbgkn4pfnWew39CDA7Q3UA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b8d5a0-7c70-4849-ec8a-08d87a17cf14
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 01:29:55.3680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /e8ltvwNWaABjrNvbf90BauPW3egPGIhrDktXGEkfszy4RE2Us9BGAcKefhi9CRz4i5lze52ba7G72gcHmtGfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1309
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When ccache enabled as below:
INHERIT +=3D "ccache"
CCACHE_DIR =3D "/path/build/ccache"

There comes do_install failure for some recipes randomly, take
linux-libc-headerswhen as example.
 $ cat /path/build/tmp/work/corei7-64-wrs-linux/linux-libc-headers/5.8-r0/p=
seudo/pseudo.log
 [snip]
 path mismatch [1 link]: ino 243004209 db '/path/build/ccache/6/stats' req =
'/path/build/ccache/7/stats.lock'.
 [snip]

Exclude ${CCACHE_DIR} from pseudo database to fix the potential
do_install failure.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6e2d3e544b..0705e53a6f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI =3D ""
 PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sys=
root,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstat=
e-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/=
sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-=
build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TM=
PDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
+PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sys=
root,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstat=
e-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/=
sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-=
build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TM=
PDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE=
_DIR}"
=20
 export PSEUDO_DISABLED =3D "1"
 #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
--=20
2.26.2

