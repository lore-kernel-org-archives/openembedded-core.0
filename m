Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74384C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 13:50:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web12.27439.1658152239121447411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 06:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=hVjNNH3O;
 spf=pass (domain: nxp.com, ip: 40.107.22.76, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEg6pt2MWzsDOwzjCcucqDY52WqK4qBrjGowUcVI3EI3EozajEotpmIMNXqwutqgMxvgep05xt3jm4uEjmO+6ReTRfw3MsNnbJUUFJhb5WW/hN434BW9AI25xAKA0FXZFUfHE9hL8HAanqlpaV7Ftg09xkxGnya3FI5yjuyv3BKaQC1abfIQ+GIa8WPzYTjzrayhAIu9qt9j3vI0aLoNba8MYs6DStDMHExilgLD8h8AANqr5wehrZ0wvZubIjHpHG/fHvUGxzD95AGgZlGY+YnWjPqA8rHmLqqVRyPkUIr2rkKNEOP4IoYxvvT57g0JD/3Q6LkBqUlm8ywCtC3j5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz7i/85oUUhEaBGmD5+G8ImFx+a/mpx1LV69YLr/vJM=;
 b=LT7/ASXcUJ0t+nB23drPUeY9tuJ/Kx9TwXY+HPV6p5cThBYj/E4zCuGQkHls4u/TJzLlethqx6qMOmZvYT7si3llwORPHD2A+1RerzUbk0q08Y25Rv/VGBw4WnWMWD7cR2MmNuWoaMaxjqQNOxmeTnq/NhF5vGVoHkFnhHdRpAh1ohcKoOKJBkXLJZmymPWDNXudNI0gBbNki0hKkTD6Yi2skqTHuh7XSVOT71Sbuh3RzeM+ME6k8Cxow667ss1+3CbVp1tM4MsJOwH1Pm8VPQLK5psecNj+C4JzQon/lvZ+SRuOy3vRVTgyOkrq3Mh/sAujIXS9Vgi84D0SScAeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz7i/85oUUhEaBGmD5+G8ImFx+a/mpx1LV69YLr/vJM=;
 b=hVjNNH3OXwtD7pM1bJhBRbkQ/v7nE4dkLRL/tbwJvENVdATZcUYUbxMjdVZD/ytIMPNs31eTSXzVJ37/Cn417mgnms8GCnOR5m2+tInq2ywb6D5EHKEV3KaGAGJNASqQfcI261X0Bsdrj5Uquwe6M5ydbDgBa6pwOgdRyjgpyOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by AM8PR04MB7937.eurprd04.prod.outlook.com (2603:10a6:20b:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 13:50:36 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::c081:1ff7:5db:5b62]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::c081:1ff7:5db:5b62%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:50:36 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] gobject-introspection-data: Disable cache for g-ir-scanner
Date: Mon, 18 Jul 2022 08:50:11 -0500
Message-ID: <20220718135011.1198964-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a392fa1-e6b6-4715-b34b-08da68c47dc9
X-MS-TrafficTypeDiagnostic: AM8PR04MB7937:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VFjZY6vM5WOdORMudr7vcOO9xU+lG5PFEOGrqW9b0S6UaBfX3gpXZ81DdruufRkL39jFofe05ya2FH7RXiuSp8UxVa/OilWdWX9UOygNoV01AYwkXz83F8cBWf04aA0zcts6tz0KByj5KaTmOdFVzeb+e78L8cWVOkKWcGDKNn1bk+lcL5hwGWmdyQLuq09HRCaENd+l6EGwVYa5iyOZQrqJcyUjTHhRfoiBI54JbH/PW9Rz0koa/xNuupPUeHik5VNhpgFh/faq1FgTDcAR8KgB6kE+DOvLW1vDnJqj6p2cAuBkmbNEd4tUIBV9cK79ULfkir0FKDi1vppnaHJe23syb65Uewn+Ak/gt6d7JvRqZAIn8zpRpO+pRyYsrY9jssn8VN3rru9iEW7i+ATAbDC3oMUZCCeOBx7MqokjN6HRmpcUSgoWdodB9wBGdIYPwf4M0HaQq1gBaDf9wA2SRBNwDDtRHgnNxNsK5YBT93MsdlnvIemBmwjfeTOQfjTUdU1asevqkXXd3bYji7SQD8I1YWwL9/uEBTfOe5G59w2X/JouZzDnryl2JUY8J31R/XSyuVYekwWrupy1sTnK8PlOUDvBmQJh4mcPcxT+wp8vFN4Iz3RMfEn7FtqX/dFSk8NexOEEs+uLtjCY6uF8mLX81KCxOHPWLUpUT3j8bDS1EZbIvNFkN8NCYek5TYYoJ8ci0xlrcDyj8Iq+muZHSAJ8uihTFhzu0dNvW1kHKAHNW/NzoQBdiosPgj8ma3V9cpYtXq510WzFOhdkxMqoQqo0L4TPsyY4zgUc3XnaobdCxF/+0Z6R2OQMLry3adXhNW99TqMTTjo748gfOcVg7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(26005)(1076003)(41300700001)(6916009)(6512007)(2616005)(36756003)(186003)(966005)(478600001)(2906002)(6486002)(86362001)(38100700002)(316002)(38350700002)(83380400001)(52116002)(6506007)(5660300002)(6666004)(8936002)(66476007)(44832011)(4326008)(66946007)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VHRbQYeIiNj3n/AbYnbvk9xEm4KdXBEc1r7TLkE4Xpdh6DwPgFPNurZsP5eW?=
 =?us-ascii?Q?txv5u6Rh1SLzJYJPws8jtkBuD3wxH4IYW4FWJQM+FuWCrQgNJEe+8lUuvMQM?=
 =?us-ascii?Q?j3FKy/c5mff2WkbU9g732WbfmRKtVY/ZwnisKQ25FfH7Ow/a1l0/Nf93lUmH?=
 =?us-ascii?Q?T8LzmBFB5u1A2C4dzyqcnOBnUS7Vw1EJ1wM3DXpEM83ga59aZ/qccPoJu4LR?=
 =?us-ascii?Q?KfL01BEmX1cpFSrbWHqVhOIMV9Ri29E6+mu3zcR+HeZY7IArs3Sr0nJgrg3x?=
 =?us-ascii?Q?5c+/c8h+aswYnNi4VHRqHc4RM7mVPnROe/q95jbdiGiRS4303d6NT7mKq3dn?=
 =?us-ascii?Q?OhiyT67Keygw65RcUv8xMbGXimjPNaP7gBHbS43SIXkU0WTuYrg02yVFDWS/?=
 =?us-ascii?Q?qdOMfB6rb2M94CAZw9hI5eRp/5gDG/MIUV/SdK00iUgfwSvuCxXXOLlDMI+i?=
 =?us-ascii?Q?4aS54Uf+rF7y71NgTuGb7IBNwk2p/GOXnzXzJFfdqwe6X+08XAcP3DTctbmi?=
 =?us-ascii?Q?l1U0LSyUO0wSWWDxVZLcimAwldKnOTpac4WToxOXZDan6EvCOsim6uCXbCMP?=
 =?us-ascii?Q?kwz15YiRi8whLJ/5BzKpdAnJccKWJDFlHrvIdpsKy3mPvcnoKo7rwKffmjec?=
 =?us-ascii?Q?RDeAm0zoCvxB3rrKZxPTpV5jv43Lp99rKadhmnhk01g8MYR4ORQ29Zw3WORh?=
 =?us-ascii?Q?MBWGcrRaY6D2gVwYbbwGInNgztnMB1kwOvVfX0/k0Ro1sUCqXV60NlIhaeH3?=
 =?us-ascii?Q?kUII4bCGwaI7p3WjgUULuZNcBxEyx9pgzn/IbBYGfdCppIA7ne4Bk4tPbLx7?=
 =?us-ascii?Q?Y27Nq4nYe9ndZYVCkfjVFXqtJ68dVkja5F6SkjHCBu3tkGw/7qa7L8Gi6xPj?=
 =?us-ascii?Q?pdrCDJzSSTi+19hlUNcwDBZWGqdgo05BDiIHlFgJQG9ASIZSy/K0QNIn9v8b?=
 =?us-ascii?Q?0SgDG1ilF45vDqkQSyxd1UoaKATmKWFVu7Ilm6We780LRy0oQmtM8OxDBefU?=
 =?us-ascii?Q?hJFmOCXrzzbgHJtF2lvfen0nARwhh+38eC2YuIFPFl7pdJH7BqtFz2Aa9+fi?=
 =?us-ascii?Q?GI9Fxm7gUgSa2GUBrnvMkkSazoSsKA8EPioaVYxF8RtYjzpvSuWnUzJ8BaNF?=
 =?us-ascii?Q?5QW3LRgd0Vk7cSRMNS1ZBjPWbcyUSyFi4e63XwcoI1B/A+146iqvCja4XEs2?=
 =?us-ascii?Q?N10Sn5mx5ZrqyVWU63aZoZ+gtCgMHfXB/rpJSOFk4cDhFkgNe8gr/A5LP5Nh?=
 =?us-ascii?Q?xjPuFRHZdGVYOls5AMZDSyjrmAvJEvVqH6TmqBsnfJsYcsuRp01FG9HH6jPV?=
 =?us-ascii?Q?CJzMHuiLl4atSGQR6THY93lGg0LMYBXfAHsgFc4N3PfAckepPdGs1kkSSzeD?=
 =?us-ascii?Q?eAoq6nyG1ZyrNLA+2SLnYV3hlPwXrh2iqiJOup9vaF9dLKuv3NFeu8aDfpnY?=
 =?us-ascii?Q?oPHEtSNj/y6mI4YSMC0zxCVp5Mg6TNYhMheGwwkul8Ij3pXJ0zWZEl85rTTO?=
 =?us-ascii?Q?foN3foMUNEYgm2Csf1FebkKci9ePlGJry4LYE4DwwHr0kQ+VBY8ywDb7He1z?=
 =?us-ascii?Q?rAAIPhAo98i8CZ8IogxlXt2aZLA/ANwjEc/CjDn7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a392fa1-e6b6-4715-b34b-08da68c47dc9
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:50:36.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WlFOwsw729TByWNbpFJsGWLC429Z8NS+zTg9amQMyx77gNjFa7g5Kd7PeJ6mnm8NMpO/wkpGOdmF+1g4Lh25zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7937
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 13:50:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168197

An intermittent failure occurs in libical-native do_compile:

| Traceback (most recent call last):
|   File "/.../build/tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-=
sysroot-native/usr/lib/python3.10/shutil.py", line 813, in move
|     os.rename(src, real_dst)
| OSError: [Errno 18] Invalid cross-device link: '/tmp/g-ir-scanner-cache-a=
dxo_2bq' -> '/home/bamboo/.cache/g-ir-scanner/bab9a83d2cd93e62ed005a2c1d4f8=
9ae75c67251'
|
| During handling of the above exception, another exception occurred:
|
| Traceback (most recent call last):
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/bin/g-ir-scanner", line 99, in <mod=
ule>
|     sys.exit(scanner_main(sys.argv))
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 590,=
 in scanner_main
|     transformer =3D create_transformer(namespace, options)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 409,=
 in create_transformer
|     transformer.register_include(include_obj)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 140,=
 in register_include
|     self._parse_include(filename)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 230,=
 in _parse_include
|     self._parse_include(dep_filename)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 225,=
 in _parse_include
|     self._cachestore.store(filename, parser)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/gobject-introspection/giscanner/cachestore.py", line 153, =
in store
|     shutil.move(tmp_filename, store_filename)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/python3.10/shutil.py", line 833, in move
|     copy_function(src, real_dst)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/python3.10/shutil.py", line 435, in copy2
|     copystat(src, dst, follow_symlinks=3Dfollow_symlinks)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroo=
t-native/usr/lib/python3.10/shutil.py", line 374, in copystat
|     lookup("utime")(dst, ns=3D(st.st_atime_ns, st.st_mtime_ns),
| FileNotFoundError: [Errno 2] No such file or directory

A similar issue is described in a fix for gobject-introspection-native.

https://github.com/openembedded/openembedded-core/commit/d3c48ff7d19e86b233=
8b1778f9563969bba3d336

The problem was fixed there by setting the environment variable
GI_SCANNER_DISABLE_CACHE to disable the use of $HOME/.cache.

Extend the fix to users of gobject-instropection by promoting the fix
to the bbclass.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/classes/gobject-introspection-data.bbclass              | 5 +++++
 .../gobject-introspection/gobject-introspection_1.72.0.bb    | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes=
/gobject-introspection-data.bbclass
index 2ef684626a..d90cdb4839 100644
--- a/meta/classes/gobject-introspection-data.bbclass
+++ b/meta/classes/gobject-introspection-data.bbclass
@@ -5,3 +5,8 @@
 # so that qemu use can be avoided when necessary.
 GI_DATA_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-int=
rospection-data', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode=
', 'True', 'False', d), 'False', d)}"
+
+do_compile:prepend() {
+    # This prevents g-ir-scanner from writing cache data to $HOME
+    export GI_SCANNER_DISABLE_CACHE=3D1
+}
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection=
_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection=
_1.72.0.bb
index 355e77d107..9a47e908b7 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0=
.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0=
.bb
@@ -113,9 +113,6 @@ EOF
 }
=20
 do_compile:prepend() {
-        # This prevents g-ir-scanner from writing cache data to $HOME
-        export GI_SCANNER_DISABLE_CACHE=3D1
-
         # Needed to run g-ir unit tests, which won't be able to find the b=
uilt libraries otherwise
         export GIR_EXTRA_LIBS_PATH=3D$B/.libs
 }
--=20
2.25.1


