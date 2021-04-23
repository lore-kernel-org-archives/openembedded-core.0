Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.83])
 by mx.groups.io with SMTP id smtpd.web10.147.1619198324376374494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 10:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SFCxWY2o;
 spf=pass (domain: windriver.com, ip: 40.107.100.83, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwu5RKt2kNbFgZsnH5zeNLTbFIdf8sOTIpl3C2GO6LYCWEwnTe/V3EiLXV1VV9hDET9FTGks0hcPt0LJoe5n7m0Rtf/wqcDbJqTNVHGAz5t9kZgTXKf3374nRyXyucSwU3X/T/grHY1tcP+axiR1uwX0ArQYA+w/2HDMfDCV7LD42H442jN/ISk9Bb47uEI91T5jRkPtU/eG0kL8jUTSZXC9v7KxeXkMfVoNzQ3M+2GY+9X4SBXYuI8RK91nTXRZsVz+mlNaI58/MVj6BcQx7aTW3yfeJVS9wWdIKtwD4nQ/WP6ISurih5fwZoswxxjFZMqEcKbvMVPxVeqlyLPOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zruqFrUwlizXsBynJlV2ydXQqVgCH6K3fqehUTzXDoI=;
 b=gfFIOBMLb+TNixC0riq5KLjN0PFzCVDdVw72aFp3h2zUTyPHfFCwwQy4die0TRh2FWunbP1DLZZHMeUnvBFjg5zgPh3o4rlVeUBJfa/yjN7GP7MFly8vWnWuETPI4wsRqyWIYY2d6cu4/WR1ifuXQtB/9/xJANdDjQjSmSShmQxvqYeN8ngGzkGhyOuNOF1M3gtA1Mv1nNWSk2VD2Nl60KbvenSXX0VmMEpxCW4zJSX5A6TFSbcwy4qIbTvnFz3HMaFJCKdsQ+81FcTH3oH4kuT59amjQqgO99rRsZ0c6oNwtGtLXkHVE9f9rWob7FBO47emQyQSE2QgYl79UHfLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zruqFrUwlizXsBynJlV2ydXQqVgCH6K3fqehUTzXDoI=;
 b=SFCxWY2ogZR1zFCYAbVM5sfS7keZfXGe+BH30oEMkDxrz+6uKLEEVtAE56v2efnPh1Bxe7qHYSdUtT3SZ8lkwHzjqatFhs6915pW14wy7aCoA4i/Hd+9vVP/S+qNnKs145TVvX0nxddJSfjRfivzVNv2y46QHwms4DbQUtSTGKQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BY5PR11MB4337.namprd11.prod.outlook.com (2603:10b6:a03:1c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 17:18:42 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb%7]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 17:18:42 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] libssh2: fix build failure with option no-ecdsa
Date: Fri, 23 Apr 2021 20:18:26 +0300
Message-Id: <20210423171826.14423-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR02CA0050.eurprd02.prod.outlook.com
 (2603:10a6:802:14::21) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR02CA0050.eurprd02.prod.outlook.com (2603:10a6:802:14::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 17:18:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6efc88ed-9920-4ef1-1307-08d9067bd7ed
X-MS-TrafficTypeDiagnostic: BY5PR11MB4337:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43375022C957A970048A753DF2459@BY5PR11MB4337.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g0D/EHkO3GkVqa5AZY/YbQEDanlqu2z+7xf9sZOiaiideY3BCi8RppAwcl56DCooPV93+QEDiyIhtiGL0L0ZDJxFyNIC8sNAMmiZRuIIbNmHLYTRk+wSs2iIJ8+sU8BOyYnW+alUyQ9tMxCtm7i6sQn0EpMc87FF9MW6604ArdIY9+iCS6YAAkkDMFDLN1HoAGFChsfUPV3eo8Q45yFwMgmYA0IuB3Q7zlj5E5h+uZar7wTl7VtkWBihTIPUv/K+FOQ9EEFnZqDlPraEyOCmfoV7fFKFQIq4tP0c9K5gj6IBrI0WvoKmuXsKak+DbpU8YegWASDInoWkUQnpKA1syj/fcCdlW6T6LRC3ABk1wR8xs2eFavAh2K5qzmvEjVf6UjKDDuevNidiGO4pTqburHRVpDUEAJCPV1NIJ3tbR6LQVyxGU1zvbu6VkJvgKYhqgUS5bFjxrhlEa0kXv8T3Rvez1mTv8NmqHOkIyCSTRpm7IqqbzDiYpppwfJ3xDHbrPQ1KgagF9Upw4YqmjGaEDCYppfXNX5TM4T/RfM0XLb5H1yxit4XkNfwkdSTCpDemBEAnO8/52zRzUXa+LdbEEHmPvUYsNCUeIyldJ8LHLg3FZFJE9yEv4hgeFz7KwfZvQ4NuF+n8O1N4GoF0+9yqAW/tcMD0emTcxGIBKxaRXjQoKs+iI1EVTY2jdYCYoeudnZ5khsxVx5ACbDq2bLdjQefoTnmspVjdM2AUZaFDu7iz6nGwskldkWkBET6avd4I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39840400004)(1076003)(38350700002)(38100700002)(6486002)(2616005)(956004)(66476007)(66946007)(66556008)(478600001)(6916009)(86362001)(966005)(52116002)(8676002)(44832011)(5660300002)(6512007)(8936002)(36756003)(6506007)(83380400001)(316002)(2906002)(26005)(186003)(16526019)(6666004)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?0Lw0l7rdRQH4P2Ci5CIS1sBRXLVk9/CbkbnjqVz6VcJG3DdMOcGjzFAWyGPz?=
 =?us-ascii?Q?r5L//HHXyA0EwS5RQtHuw6tsTYMD+7mGBFx05OR9pafS6BI86YHqxnaW23ZP?=
 =?us-ascii?Q?9qV+1IDECtqHQ3NGS8Z7P6Yb+C5g0WIiVlM+pMwyA81VoBBrmie4UUxPb2yQ?=
 =?us-ascii?Q?QENxGiuEERgICmoPZMSS7BsJQ3w+puUGNTPUlDUeR+DpsE3hsTjua2htgew7?=
 =?us-ascii?Q?sUqyT4kH+EUEhhQuH6m3L8Fm5aXY5/CLinHSHaQ2ZYnvHWJL/knoBjOyTtAq?=
 =?us-ascii?Q?KNFqpcK1z+ZEGip0qcGK3OHJ0ZZ8Vz6e8u883OhW3dR/dYx3H0IQU6kbhkX3?=
 =?us-ascii?Q?yIwx9PKS9QiW8sBBuQkjGFZCqwUnRZ/yF+GdQJQTWoPVtVGG5aBQby84dysg?=
 =?us-ascii?Q?ko8/BiFOmJ6yfmc0G4LSeJj04S3y5dHFWDJ+MMmV5snhNKHPHKVHdprTBPtj?=
 =?us-ascii?Q?XYxByzVAs7xETpabXqOO79LOxWutmBKyzNgab1Qi8wdc/CFoPbQb70fdxpsY?=
 =?us-ascii?Q?A23I/DLGIlqbEctQ0zKOWscY1ax3HFA6gEICeB7Hs91Pb2+/oaDoaCyWhvYJ?=
 =?us-ascii?Q?Tnom6DL3CCbZuDvH7KbxG/AfsTVlYcC7/l/9J25XLda6CzOU2CJbRhHhYbxa?=
 =?us-ascii?Q?2QRdHz3DrUiX/VgnnraYldLmN/HgdeygdeY10ghxSiAsy3uKVmEUvZxTMFOe?=
 =?us-ascii?Q?QDez+Gpnb/OJc3wsBm/tKLwgEQUU4LfthFwuhZRPH0I5WbOxvy08KhY23vlM?=
 =?us-ascii?Q?phUcHi4Fq/jJ7vqP2oymKlBC9QPqPkaUOs10HO2trRxlt7MAbcQVpu/ZdoIH?=
 =?us-ascii?Q?x44S/6W3PUGd2VO9AhbMQ1lucgweLapM9+NTsjg6ZE8Ya5iDybw59KByUc7v?=
 =?us-ascii?Q?vDm5c9PpMdXa/T5Hxh9y8SwknJlJMtRQMY9NtJ6+v5UQDQ9cdsGa6+m4X7CC?=
 =?us-ascii?Q?YbB9gQFgqMARAPjBc2A6zoQyW13woFkXFNG6Jb6Sy2VO+X9hqE4gCXLbJpvq?=
 =?us-ascii?Q?7ZQ2hrgLWU43gUO1lHSO2hspw3PndHPRWwOHdeKuAxX3WakrW2RWOVP3HFfi?=
 =?us-ascii?Q?RQkLDVEkI5Oe3JZjW7HXcwdZeU3SoNdAYYXZ1xf2a72V0ajWP3YiWODz2GjE?=
 =?us-ascii?Q?vn1caez+d9z2hg4fJykbZxakiDxK67Tj0ekIQv9XgYg4xbq50Yc7dGOCui5U?=
 =?us-ascii?Q?qs0xsjELvjyzCyq+Xrr+HrbW9OuqSwYtPxzD0qD0bS+XFiWn0ncDSBK8nTxO?=
 =?us-ascii?Q?9c8pW/s1hGVoWJmY27vgqfo8jrEkZ2FV87Zh3VnY+dh+AROL6dGk7z1DdBnX?=
 =?us-ascii?Q?Dpta9dADVJIItRnLHdeHwbWP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efc88ed-9920-4ef1-1307-08d9067bd7ed
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 17:18:42.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOJjQg43xz6zM5JAit84lfvaXNEdVeMIla7l01PyLTkcFAq3J3HNtSlRbs8+Ah/83HmnaRM3HBOX4q9213XZDYBOtSjfh4e+SKO+hdD8zJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4337
Content-Type: text/plain

libssh2 fails at do_compile if
DEPRECATED_CRYPTO_FLAGS = "no-ecdsa" is set in recipe:

../src/.libs/libssh2.so: undefined reference to
`LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY'

References:
https://github.com/libssh2/libssh2/issues/549

Upstream patches:
https://github.com/libssh2/libssh2/commit/1f76151c92e1b52e9c24ebf06adc77fbd6c062bc

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 ...EC-macro-outside-of-if-check-549-550.patch | 112 ++++++++++++++++++
 meta/recipes-support/libssh2/libssh2_1.9.0.bb |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch

diff --git a/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch b/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
new file mode 100644
index 0000000000..b331c1bf81
--- /dev/null
+++ b/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
@@ -0,0 +1,112 @@
+From 1f76151c92e1b52e9c24ebf06adc77fbd6c062bc Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Tue, 26 Jan 2021 11:41:21 -0800
+Subject: [PATCH] kex.c: move EC macro outside of if check #549 (#550)
+
+File: kex.c
+
+Notes:
+Moved the macro LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY outside of the LIBSSH2_ECDSA since it's also now used by the ED25519 code.
+
+Sha 256, 384 and 512 need to be defined for all backends now even if they aren't used directly. I believe this is already the case, but just a heads up.
+
+Credit:
+Stefan-Ghinea
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://github.com/libssh2/libssh2/commit/1f76151c92e1b52e9c24ebf06adc77fbd6c062bc
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/kex.c | 66 +++++++++++++++++++++++++++----------------------------
+ 1 file changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index cb16639..19ab6ec 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -1885,39 +1885,6 @@ kex_method_diffie_hellman_group_exchange_sha256_key_exchange
+ }
+ 
+ 
+-#if LIBSSH2_ECDSA
+-
+-/* kex_session_ecdh_curve_type
+- * returns the EC curve type by name used in key exchange
+- */
+-
+-static int
+-kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
+-{
+-    int ret = 0;
+-    libssh2_curve_type type;
+-
+-    if(name == NULL)
+-        return -1;
+-
+-    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
+-        type = LIBSSH2_EC_CURVE_NISTP256;
+-    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
+-        type = LIBSSH2_EC_CURVE_NISTP384;
+-    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
+-        type = LIBSSH2_EC_CURVE_NISTP521;
+-    else {
+-        ret = -1;
+-    }
+-
+-    if(ret == 0 && out_type) {
+-        *out_type = type;
+-    }
+-
+-    return ret;
+-}
+-
+-
+ /* LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY
+  *
+  * Macro that create and verifies EC SHA hash with a given digest bytes
+@@ -2027,6 +1994,39 @@ kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
+ }                                                                       \
+ 
+ 
++#if LIBSSH2_ECDSA
++
++/* kex_session_ecdh_curve_type
++ * returns the EC curve type by name used in key exchange
++ */
++
++static int
++kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
++{
++    int ret = 0;
++    libssh2_curve_type type;
++
++    if(name == NULL)
++        return -1;
++
++    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
++        type = LIBSSH2_EC_CURVE_NISTP256;
++    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
++        type = LIBSSH2_EC_CURVE_NISTP384;
++    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
++        type = LIBSSH2_EC_CURVE_NISTP521;
++    else {
++        ret = -1;
++    }
++
++    if(ret == 0 && out_type) {
++        *out_type = type;
++    }
++
++    return ret;
++}
++
++
+ /* ecdh_sha2_nistp
+  * Elliptic Curve Diffie Hellman Key Exchange
+  */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
index 0b8ccbd217..a5451628e7 100644
--- a/meta/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
            file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
            file://run-ptest \
+           file://0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch \
 "
 
 SRC_URI_append_ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
-- 
2.17.1

