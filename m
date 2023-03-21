Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFCBC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 06:30:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6750.1679380209025505598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 23:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q6jDN6SD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2444beeccd=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L5o9bd003320
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 23:30:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bOFZALd116RafIUDHd7807axu5C7tc/tS+3xrVcb3DM=;
 b=Q6jDN6SD0QOCkyGBzCKgieOKW4rOJHozAANy319i6YGmnC9Wh9z8LLXPnF98nGCf0oPF
 SRydCnk2jnYe6KVaBz5GEAeLYeb0TgYPVeu+l2aeI0FTXwozoi2ClXQJs4LeuxABCJvW
 FYGGpiFVh1mfNTXxc1FScakFl3/t8GNgQV0G00ZnuYHOg56vtU7TwaXSfz0K91hsBVsz
 fihfTFdG0+ddKzOUIOgbfS/mooORcVK/tpIa+yqjF298+ZN2CfM4wQZBLLEc1hRncqZU
 QtjbMxUNB/u41UR1Hg12sycwmImqYcu/zTmzJHaOua8okK0Vs7E55jPZkOlNXON7f0aX 5Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pdctmjcn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 23:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJpGOjXRoMRuhQmnwe3Os5dfA/skAQ9nTnJsNJ8nBU8wqd581jgvf9nAS6Rs3C2wUFQ/4T7OS2jQJPWNcfw8UJoHKaAuCzlwVA4N+bHZnVbG+Ca62UmU2Wsar2JmaswYFlZBT/ZIm/18Mgf6HpDXZZEyUzWwB7hb3BCXq8oNWpI9UcrzAq5mE5MCEx736Fk1fK1j7bBFm8jjkZQwkvdOtgO7JUn/pEa3525JuiYoje0/4zOcVF0fM8R3/F2PnqW/OqL9fML85NBWrhqSPkpb2wD4c/s2O6OBNCGqlrCDWijAvXZ2QE0R3BxEYBy1zV/HTgu0wKtWmWq5CEjIq1qQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOFZALd116RafIUDHd7807axu5C7tc/tS+3xrVcb3DM=;
 b=c+fKOLTq35X3j/o4+eDNYnzLMrYmzAeaMMoGVAM7rR2lcmxKPf7Q19+0G2hXAu4GT3YslhGsUTuW7rj4Nkn/WazBAlBfa2AaZoLqYiDMF4tbr+U2Lfmq0WjIXuIlsZ1igWZcIks3ZABRopdO+9BxFSdCJEuflnuQ9CY9JXUS64ozHrAvFzOvOg+hpfeAT5QG6WfvizrEdqTBL7T37pmfjrzZdq87UW13evXywvtyz28a7vuYaw9jMClgSzBR8Fkvkq5L/oc5ygdAc/UJ9r7Lkcd8nXDDDbvCkWU1Vlwrd8+qJQYRuHLzVvv4F8OpnMXZ6OMfuMcaJw04XHi1ef1UWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 06:30:06 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3a13:4a46:446a:6812]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3a13:4a46:446a:6812%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 06:30:06 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] python3: Fix failing sysconfig.py test on x86(64 bit) by updating test_sysconfig for posix_user purelib
Date: Tue, 21 Mar 2023 14:29:52 +0800
Message-Id: <20230321062952.2778799-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: ed30d51b-e22a-4883-1e9f-08db29d5b60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iGOaKE7nb/SZWrj9QF8k2d64jAgAuHnwbzSa3c90MSc7K4hbyyzxXIIi9nfCdKZlhmyMrManZaMX8Nfe1qZlUIBSeR1e4xhVxJ12Hes+CI+lhipX6oKy1CRPuXjcpcBjTsYIJbeKBYUImMAa79FitIdKDzXbFD/qQPC+QciSTCDynC01LCBbazkhIYKcwoQgUJCSq0hPPoeDzFx6zFcY75m2t49rap8GDbshgb8PJpmxC+gkfXE/fE1qDGLyxV7W9PbD6pG6NoAXxy97rR9rzDcqyYtb2VDVl9tuN/JNivSxzMYJa1HMEi5FqJR6bZ1BhM3mw1JUJrOD2fM8PBs1VaIPRiGZfT0FLJ2FglC89z7LrfJa6eIY0j1WIUKkBgw1me9M1gIlSd/0v3WvRI/85X5LkseNjszvekCANYINNUmVlCg9lFbsDAV2K6QYHmW+kFICqHf66toUSIbZ3uju5vHGbFRJWR4E+ujY++JsE3aQMVIk4EgGaIaOdzX9nUN8zvYwkw0eUWo1REKeE5pKJZF68KqCG7xYuO2+PjG8IqrXt/DV7avp3Q3LAE0oBJtQYpjcOM2xbmrSf/vKjv+RU+d2+/Tsgtj5XFLbhYRgUtNVqonJy7i098+YLZ1OmzxqwQnCXMS/FxSZklnm9LvbScEl5AICUQDxCIy41fOfA9lX7Kpg7VjkQKpdu1AbYipb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(136003)(366004)(396003)(376002)(451199018)(2616005)(83380400001)(86362001)(38100700002)(38350700002)(8936002)(8676002)(66556008)(36756003)(66476007)(6916009)(66946007)(2906002)(44832011)(41300700001)(5660300002)(186003)(1076003)(26005)(6486002)(6506007)(52116002)(478600001)(6512007)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K6qnZKNYJtTLm1CepcNacXNaiN+w4dX3jbqepIv5cfqclMnRrmLA9/5VEtnS?=
 =?us-ascii?Q?Ri+kaWP5MewabYxttEJk4J6/9DFXjDmGhAW8OIOxXhRc2P3/ArUgPpmnj5Is?=
 =?us-ascii?Q?BiRX7Vvzwh7iO9dxbdO/+YcKTp+ULuUeNkwbZYunKTR6bZ8R7U3pn3awvalt?=
 =?us-ascii?Q?1qFHGntyaxzwelPbQ9unP68jACJBGlbL0VSm3Nc79MEk36RqHGfZwvLB8tNz?=
 =?us-ascii?Q?J2L44Brll6q8dU8C7VvplbGeq0SXE4rgiRlwFtSRtKjecok7FUX5BjkrbyxQ?=
 =?us-ascii?Q?W916T+NuieC+H9OrbSjNV44r45iqGr9JxTXGh5jI8+d8IXet545PUHWKYXfA?=
 =?us-ascii?Q?CZLIw1hrKAwFzGKYXBq+MHP7CsKSLehufQOJjMc03LznDNMBDMa64Te//kut?=
 =?us-ascii?Q?K5sT8SGzJcQqUQW4aYvhXXdGj5/8jCU+K63zkCwupx/HMg7Br+myP5jwCP4Z?=
 =?us-ascii?Q?iveL4yeIt/DbXe3r765+mwTcYsZru9v6zhaKCl5VZzzJ7DtIvJKTzMTD9sSr?=
 =?us-ascii?Q?0dRz9SnnSOC0pxxSTDqLAlb9pdKF++7UOuTCAlMd977fDlAsMqoJvjqMXZsw?=
 =?us-ascii?Q?uWyXxsk/ax6ACf1UrSUwCuGUFnjGHKSEnIqi++GbKTpEg1kS/SqiA2x7kpwt?=
 =?us-ascii?Q?KQTlvpWesVR7GfK3mqQQfv9HfQnxBGN6OncVoXY6If2uYa2dLLlJaQWWBQ6B?=
 =?us-ascii?Q?CNYzcbitmU8i10qPlPGVZ1rhkbN7uEC+fqDHqB4qulXq/ruZPy1G19HdPPEb?=
 =?us-ascii?Q?ME/8qT+p97R561+6obCX76Cktxe/8kAxy+RDsTjnsnDbgWaPU8mlyFm+z18y?=
 =?us-ascii?Q?Abd5n7wavdIard8cj86oaGIgb9uxWWHgZZ9EiRHLiq/KCDYD0yFMGL6Bcpi0?=
 =?us-ascii?Q?sNXmvT+k8Xo20nIYMKJ4sbsZ16nsmB4SzrVd0R34eF/9vUgGhH1ODsB/iqA1?=
 =?us-ascii?Q?NsWPzvSJI1jP14b9FplwitH+812SCAU3P1d+528F+1mxvM1sokCLNqI3Mv2p?=
 =?us-ascii?Q?CnQYbBWktcTgX208dGvENl4zUJ9m4R37KfmYEOgfJU9LjjTdWLlpyAAB5/yw?=
 =?us-ascii?Q?qPH14vbIY6lriyqFT7rgeQsvqNnm0fYlSn3ohm4+W2HzU8F4+dAzybpWwZYi?=
 =?us-ascii?Q?LfD8uUchpoBOiroFhBONw+tbk/F2sFNoQlEoXWTfmrlAOXYtsIeBACG96qTI?=
 =?us-ascii?Q?zoey2wn7jgA/9lEd0HSqOojx//lnsCgRiBf65fOMF/gSFI0KAT177FC/rqqw?=
 =?us-ascii?Q?aoYJodIpE4sw+Ui7cmYq6F+jSKzcZck/tjC/sYdmnoJerUljHpR3YjLwyA/T?=
 =?us-ascii?Q?wV378LtU7t03y9Ov4MBX34yVqAVMlCEuP9GPoKvhbztuD+8zxUpZNqzVoH5e?=
 =?us-ascii?Q?1+hFBSKphi8stVG0Trw42/rANVAkpjx6pygUIIE2IClKljCkECQX4QtVq+yV?=
 =?us-ascii?Q?3aAk/yrE2yQlwc2LOOn9ZpaQnjsTP5BXWo074SLqkJZAtwmH2fic26fDj9uh?=
 =?us-ascii?Q?o5Tzcu6jNzlpUtmFKeiNr84A3Ccziwj7wnMYKRvQkHRidfxfFw0zhnt7srMl?=
 =?us-ascii?Q?TlKuutts+wwfZHQUDF8pECQnTRE4VAqPDWWtVtQGyAis95CrFU38g4rEzIwu?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed30d51b-e22a-4883-1e9f-08db29d5b60a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 06:30:06.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXFHeU8sP/TSgTH2T83HeCAvDhVHJH7MXV2tg11ZPJLKJvLK10qpPg1MAp74pEbpj/P/wOtaIR80o7aG12Pm9HXyE+3xGVvMmSP4vMU+UGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-Proofpoint-GUID: sC309dkqSJzZYaVby_gLz-xMEbnibdm6
X-Proofpoint-ORIG-GUID: sC309dkqSJzZYaVby_gLz-xMEbnibdm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_03,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303210049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 06:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178850

sysconfig.py use platlibdir for purelib. Update
test_sysconfig.test_user_similar() for the posix_user
scheme: "purelib" doesn't use sys.platlibdir.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 ...est_sysconfig-for-posix_user-purelib.patch | 30 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.2.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
new file mode 100644
index 0000000000..3d39839309
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -0,0 +1,30 @@
+From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17 00:00:00 2001
+From: Wentao Zhang <wentao.zhang@windriver.com>
+Date: Mon, 20 Mar 2023 13:39:52 +0800
+Subject: [PATCH] Update test_sysconfig for posix_user purelib
+
+Update test_sysconfig.test_user_similar() for the posix_user scheme:
+"purelib" doesn't use sys.platlibdir.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
+---
+ Lib/test/test_sysconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
+index d96371d..20aea4b 100644
+--- a/Lib/test/test_sysconfig.py
++++ b/Lib/test/test_sysconfig.py
+@@ -373,7 +373,7 @@ class TestSysConfig(unittest.TestCase):
+                 expected = os.path.normpath(global_path.replace(base, user, 1))
+                 # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
+                 # whereas posix_prefix does.
+-                if name == 'platlib':
++                if name == 'platlib' or name == 'purelib':
+                     # Replace "/lib64/python3.11/site-packages" suffix
+                     # with "/lib/python3.11/site-packages".
+                     py_version_short = sysconfig.get_python_version()
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
index 43c147ca6d..d3ef5c8bb7 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
+           file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
-- 
2.25.1


