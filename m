Return-Path: <stefan.ghinea@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F80DC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:22:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13514.1700515336819326381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rg++CQS+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9688a6e38a=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AKJMBjJ012097
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=PPS06212021; bh=qXHJeVOgVPeEs1K93i
	jNIMbDd1gDLl0L0gdkgWvWP1o=; b=rg++CQS+V1r0bNABqohXgA67wSGORdP0cf
	U8LkHWAW3S5+ku51om/EYQMXRPut9WhVMx3NbPcQzQTUgyOnOta3BUe9PM6f815y
	zdFKXmsRjSmfcZ4ol/kO54pTsbEiBZ+apZWrW3NMKxgBbBV2bL+U6WtP/vcVxRhx
	ssOQRW2RZ6/6arPtI6oAmXMlKMRMLj6wbPWathn3sYh8sor9EwIrZgDcA/fhDxKx
	EMOR/Azzel9vV/rPHTz1gDFmS2XvcRWkairfquPw6SloH5EWLUZ4cq/OXwqWh96b
	YFDfq2Qq7iNq+TGU2W97CDMc8FRUod3PEAdjF5OP6AD1gnHEogVA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwsxqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:22:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXkCXnBP6KeATclcJ57oZCJ3hXbFQeUOakUEIHv1NR0OdNMKuNMSSvwA05cWTsWE9ZsA9iCQIWNlG94tVNTwIZHc9l/H+1oPyMx2szZ0s8AXpE9fs0yxTipoz5mLGHPqw9AAphkc0UeXM8dKA3o1YJEmDxnvuUdBzkDnPbGJajAsL+49q3nbVv0svdFoBG6rFo530oWnouXClLlJ9aYz7ZPt6EgU5xaPWZQWMEij2IUIMosq232i+2uZqC71+IxzkwmDTN26QT9dYOX+OtAtz9Rrv2dPEeFhI/Lf/aGrAMMpFUL6YeXwdnK6jCpwTLvPMAAdl1B5aT6C3pJoWSNBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXHJeVOgVPeEs1K93ijNIMbDd1gDLl0L0gdkgWvWP1o=;
 b=X3QRrdRhBRdUE3oZmLopEVJVTrgT80iWAFDY0aJqx1vzoVwn1R8cL4wbbiAoF+HwXUZ0HsDh2Ym/8bhcDrqlCExQwwgPTbZwas/g4gTdfMg62mxG6ExLxU4afc7wqOW9BlAbcu8CryJlSu/bjJq3Uno3UoxE9LulOtAWuYJRfQ0XcKvMO+GMXk2xbJ/gYShV6nKUoUvf2652bOXJDvPZzxVXjGSdhDIPCUSU/hqYuLDnT9ETMy4mspCf6wAds8ptsEZFVFc3G9ImpvHkDe4Gq9TBv+/15dHVDOUjJ//Jnp1VwjmAjdEuBEdedggRgndDreuNl6wBxzPDVZTkkTab1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 21:22:11 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::f127:7e1e:4aa5:4a8f]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::f127:7e1e:4aa5:4a8f%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 21:22:11 +0000
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [hardknott] [PATCH 2/2] nfs-utils: add krb5 PACKAGECONFIG to allow building with gss and svcgss
Date: Mon, 20 Nov 2023 23:24:36 +0200
Message-Id: <20231120212436.27604-2-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231120212436.27604-1-stefan.ghinea@windriver.com>
References: <20231120212436.27604-1-stefan.ghinea@windriver.com>
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::29) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4989:EE_|DM4PR11MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a8ce49-c393-404b-4c96-08dbea0ec25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O/tnEAk8iW7960zoLTZh+/6WHr28BvznZD9OPdpkEGJNBEhWMXsVx3xEjEUCSa0zXGtVIdTGlMJqMivY3Ny0aPPGlFajckq3hs+8oTFaTxWhuDryffSqXj1cAraGZSvPDp+McnZhbmqwBsvCFCvoEBHyeVcWI9qjtXiJHQp2U1bswPaJrvtkw+EJZxBMq5ABeZnjLwck4czHzmbYuvVyIc+mWqIQQqib5hwxoGRJUhTkCcsfmAXxo8gK8FmPotGKq9TvkM7Rx09+j95OmbtU6RG5JkPY5JJedxt8H1z4ONjBX+eA1zYRVwsTKGd7KHFG6GHpYzNC9nnGkOgUGNJhjTL/M+K8naPq4DBE9NH4kJQ/lli9djZuHZ2ZqWOKAOlZ38t30/eEgNuVKIZYZB7DY+cWclIaF14TP08uWzMmcYyWrORzIOtxEWsWppM+GE/iD8b1Rvqtwmhc+o/C0fAugcgjiMk3CV9wYe3YpGwjknk9ZZ2a+lRDgxn5iiyIHpq4zhQgHB9TLXOu6k3aYWPpiP9iqYV7Pfuvodrp7wK7SmGM2KjI9f/MNFc2TQRrmsBbG1RgoBORHWzzew9lUIWjmjj6UVf/e0nykxueV/VYIzFqGxozRDQrw2KjI+weqPkD/vXM32RxdqI7I1UW39XGDzOqOtRMYabmmPGmgrOhdWw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(136003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(66476007)(66556008)(66946007)(6916009)(316002)(52116002)(6512007)(36756003)(6666004)(478600001)(2616005)(6506007)(1076003)(6486002)(26005)(38100700002)(38350700005)(83380400001)(86362001)(44832011)(2906002)(5660300002)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6SC2VMWj+/KVmZZCXn/QFhOySgvu3nwoVauzkzH+Lh3ILT7dWgct3wm/HLYd?=
 =?us-ascii?Q?1IE/cBM6TRqdSxwSwHVR6VA+GFKj2v7D5hVvFBlgOl4GnwF3Qkv1Kvn141/f?=
 =?us-ascii?Q?tB2IEI8ejoLCQ5bqoUggrg88PrI4XQyeZNNHCpWdLbmmRNUEGYt6xt3mmuKN?=
 =?us-ascii?Q?aczybSo4uqNWOeXOANthExptuPCDff5lwRA+0nAkmtGszPD1lveWok6IFXCq?=
 =?us-ascii?Q?Xj63a6NYR3Q1MH4Tyrmnm51VNrI/AcQy/SvbKlq1z1thRwcEutdaOq3tY/pb?=
 =?us-ascii?Q?FDd20afSNRUUrdNtDZR2HM7z1LyqjLdlstijKL0wZpygmy/oc90g2uhLbqnI?=
 =?us-ascii?Q?Y/aX/9oRWovsLcZbidsDMDtvIBvMLDqKLxeBt3pbjIANMB7nV4YvGGb/VmpA?=
 =?us-ascii?Q?nvWAwoFgGyHus1EcxiMbPXCk4I7QhDN0Veg4JTjJ0E05+pVtrwLXfioWp+1V?=
 =?us-ascii?Q?tXXj8q7Q0vXM8JHYZIQ80FusyyR+RfhpHgHFncwaBwxE9yGdQVK8LpsMv52J?=
 =?us-ascii?Q?u9/0E+DiIeOCS3i6nn1JJSqogSlChyJYWAzSneNbtcIDpbliMIIw5kpBHaK4?=
 =?us-ascii?Q?G4IoeSlKQGyPXg2ayCk6LuDjhmPA7QEyrvY3vkoQ6YItcrD/6WO72xGCRHqg?=
 =?us-ascii?Q?Q4aOycEH+HhE+Epas6N93KkZTjfHBy+N4bkGRW+pvqNsExHoMw/fxxskFSEn?=
 =?us-ascii?Q?WGhnOx4IPkbL4tVVL5xDAl30KZ1PFtUo7ceammGAq73sBKooqAbdak/xoPrM?=
 =?us-ascii?Q?eu+GaKwo3bpjZvkPLPqUQ0YjcyFXXiB2xdAesvTrN3j+6DEVVAJyXk/1GMac?=
 =?us-ascii?Q?dCwgc7/GzzgwCyJzmXqTJKYoIexMBfLzrgZ+EkeDnzWLJ48nT6Wah7sBRgun?=
 =?us-ascii?Q?k/YyXsYegrqdU57HDB18DzfP0im3cZnRwd+x9MHvYxL+M6BJm4AOlZm94uCX?=
 =?us-ascii?Q?Fc+IQCOt5iYorz025iLAoV3EB/JayIrkWxHXYTcxDBjKeKpY5OYlVfBzwpEP?=
 =?us-ascii?Q?F3l7MYExkNrmvuf2P6oueA74ML3QBI+J7RKJ7zAEgvNNzkCJL0EqRqFWYS83?=
 =?us-ascii?Q?4vW4IMTcKkxVZqmzQpfhEqmNkVOHhSnaHH0E5V+18Vhr3f4zDBVWBv0APGu+?=
 =?us-ascii?Q?Xez9MYladGxf8xqZOK2x8iFNNypmIqEy9md3CmaM7X2i6IwcSGEtNLAJ28Rm?=
 =?us-ascii?Q?PZIzf2tFcEKCrQN2Oolhnn+44/el9HQhyei8i2oiSv5SF0oSKUzz81423ehx?=
 =?us-ascii?Q?FsEUhqCMlCrw0B97Syu887FvBT6Mlv06wfNZ4/U+2gn1AB56zHdVSzPrRYD4?=
 =?us-ascii?Q?fqw512XUtRG17c2fMIgygR5akCSzEIpeMXIYBsj8xxvL9ggN9/SnYKaGN9zD?=
 =?us-ascii?Q?jZWcGQ/dZz+iztekZnB88IjkEATJUCxM2Vjtfo0gBvK5UE9+I2Yigx7tUN5Y?=
 =?us-ascii?Q?pKgjNC0JyIBQzILI3yjzE5dKTfauAIamrqPT8theN9eYKLpvxOYdrG/tbLlN?=
 =?us-ascii?Q?+I1IaCLNrAQFw/Psir/J4RXVGYlHn52L9stJupH+g3AXlXNcU8mlBhR9OXeE?=
 =?us-ascii?Q?UEGZF+xlvRacTIs2OGu4LrQRrovb8J4s4NW3fZpx3ePrrI9Mn2hBYqKHveVK?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a8ce49-c393-404b-4c96-08dbea0ec25d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 21:22:11.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3zlNkpprMfSEY7dbXaZ0rK9OMCs+1zkbJJ6Kh5gXbv3QlUovvtFsz5gZ32RGkBTXonbIT18DyXMrisgMIXiazC918oEecHf9Tyj91qUS1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
X-Proofpoint-GUID: lCnVgJE27WyWBT1vgLGNKP8cSzLPH8kd
X-Proofpoint-ORIG-GUID: lCnVgJE27WyWBT1vgLGNKP8cSzLPH8kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311200156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190932

When building nfs-utils with gss and svcgss if the Host OS has krb5
development package build works, but it looks like a host pollution.

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 ...with-enable-gss-enable-svcgss-option.patch | 52 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.5.3.bb              |  5 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Enable-building-with-enable-gss-enable-svcgss-option.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Enable-building-with-enable-gss-enable-svcgss-option.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Enable-building-with-enable-gss-enable-svcgss-option.patch
new file mode 100644
index 0000000000..23232ec099
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Enable-building-with-enable-gss-enable-svcgss-option.patch
@@ -0,0 +1,52 @@
+From d4494617c98fdf4e956d74ce34b847a46ff36e0d Mon Sep 17 00:00:00 2001
+From: Stefan Ghinea <stefan.ghinea@windriver.com>
+Date: Wed, 11 Oct 2023 22:36:32 +0300
+Subject: [PATCH] Enable building with --enable-gss --enable-svcgss options in
+ Yocto
+
+With $dir being used as base search for both libgssapi and krb5-config, in
+Yocto krb5-config is found in $dir/bin/crossscripts instead of $dir/bin so
+add this to the search posibillities relative to $dir.
+Remove check for needing to set -rpath in KRBLDFLAGS.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ aclocal/kerberos5.m4 | 13 ++-----------
+ 1 file changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
+index bf0e88b..ba683eb 100644
+--- a/aclocal/kerberos5.m4
++++ b/aclocal/kerberos5.m4
+@@ -24,6 +24,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
+     K5CONFIG=""
+     if test -f $dir/bin/krb5-config; then
+       K5CONFIG=$dir/bin/krb5-config
++    elif test -f $dir/bin/crossscripts/krb5-config; then
++      K5CONFIG=$dir/bin/crossscripts/krb5-config
+     elif test -f "/usr/kerberos/bin/krb5-config"; then
+       K5CONFIG="/usr/kerberos/bin/krb5-config"
+     elif test -f "/usr/lib/mit/bin/krb5-config"; then
+@@ -71,17 +73,6 @@ AC_DEFUN([AC_KERBEROS_V5],[
+   fi
+   AC_MSG_RESULT($KRBDIR)
+ 
+-  dnl Check if -rpath=$(KRBDIR)/lib is needed
+-  echo "The current KRBDIR is $KRBDIR"
+-  if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
+-       -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
+-    KRBLDFLAGS="";
+-  elif /sbin/ldconfig -p | grep > /dev/null "=> $KRBDIR/lib/"; then
+-    KRBLDFLAGS="";
+-  else
+-    KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
+-  fi
+-
+   dnl Now check for functions within gssapi library
+   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
+     AC_DEFINE(HAVE_LUCID_CONTEXT_SUPPORT, 1, [Define this if the Kerberos GSS library supports gss_krb5_export_lucid_sec_context]), ,$KRBLIBS)
+-- 
+2.42.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
index d8c6391b3d..1b4f281175 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
+           file://0001-Enable-building-with-enable-gss-enable-svcgss-option.patch \
            "
 SRC_URI[sha256sum] = "b54d6d8ea2ee62d64111278301ba4631b7bb19174e7f717a724fe5d463900c80"
 
@@ -53,7 +54,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
                 --enable-libmount-mount \
                 --enable-uuid \
-                --disable-gss \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
@@ -61,6 +61,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
 
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'krb5', 'nfsv4 krb5', '', d)} \
 "
 PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
@@ -69,6 +70,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
+# krb5 is available in meta-oe
+PACKAGECONFIG[krb5] = "--enable-gss --enable-svcgss --with-krb5=${STAGING_DIR_HOST}/usr,--disable-gss,krb5"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
-- 
2.42.0


