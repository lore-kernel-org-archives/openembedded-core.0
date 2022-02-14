Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B6DC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:46:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.35436.1644853554743174786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=OJPvNiVX;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.51,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF2QkAZ5v45em7Zq+2FMUJP7vD+USbpS0wpe4zYIwhV/04FbC4gGL6vHGriw8+M6GVI0OQF6K3hOUp6Vllju/E43550IeCRBlq0RULVxPIv/gJtacfTrxhZ3omsH9hIf4ZoAow7I9aXmHqiKQggPA3GFQsAdRrz8188W0XsmtlmkBIccsjpH01SGCMR1R1nDuoedkXqCT/aglReFXmNtBs7b0zwceo426Dn0BWWFwki6P+tew1vMgJ5Ep5tH/+66OkGCzZmVUG0QMCQ33UrmqdrYlqB+9OfBLhzdtD9BLaOGgZKs+wWDjaV8FfpPYoc4eAcWKMPjqJdspNsido74uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTrpHTQR1DR2BcA4qbEZIdP7nHkjWK7foZ0Gd2FPqYg=;
 b=VcofF/1/+GEvmX+Vn0Of85nmnJGedo6inWgW1pJOC/z4flzlVTzg7rYmnYYANVfWn/b/BzXLuivu9xtPQBylu1zHZGHI7GW4E24yhU64dddn0seV5vPgb2NbSicASgNN8u9JpXGIfikTn8hzc4PMJeaSzO235XuF6oNWtsZBpS/k3A2QBdOyR4pcUOdPs/QAt3XtPxH0kJ0pl41DxsDqchgWtTQv859NQXzVgs+nTowJUXz5UuR1eyi1e83B+hcgTCZxiBSVAEGbQib4uc2XrCZoVn9IPVi+Rg0ub2KYV0V8CPgfC/hfqRJZSkg+yVsmZoHWmFg+bdjV2KT6kpNbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTrpHTQR1DR2BcA4qbEZIdP7nHkjWK7foZ0Gd2FPqYg=;
 b=OJPvNiVX85HQYtCl5MQDRMpWDtRMqjIy5oKHuhSTIPfCF3+YKfMeyTyoJif/Ro+dXyKH8wI1vozTzgo2/h8BafPals2TwLxWao9/dqtJ3ox5sueXb2x5CBYtOvX1XX49VC8YbLvb6Gau+872mZuLbi+SlIkA3U0Q8xey0RBrEXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB8PR08MB3929.eurprd08.prod.outlook.com (2603:10a6:10:ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 15:45:47 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 15:45:47 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 5/5] selftest: wic: Disable graphic of qemu to support WSL
Date: Mon, 14 Feb 2022 16:45:21 +0100
Message-ID: 
 <20220214154521.26905-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0257.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451086e0-44d5-4880-6648-08d9efd11153
X-MS-TrafficTypeDiagnostic: DB8PR08MB3929:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB39294B962098B75F8D028ADDD7339@DB8PR08MB3929.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DgUHZaEVUFDEfk4JAe6X5t7JSaceawv5ONMJMasZATK67Wbu0BNBZKAolXPLJr9MWZ0zzix+X8YwAwnQWp5hr3o2Zrsx2Cu5Oa4ij2lxZtpoHdFpH+2CiONQhsGLZ6J48H/lyC/bMIZ1gxmavMIa3Ym2R6N6Hv6Fg2rmJS1+XJRme147r27EgyRsRSc/plB5W1N559ojy9GcKocbNpLGycO66qMG2TiL1SuMTuVWodI4l85R6OIZekSE3ZQ/ZpOuwZ3xv07ZbnCwOmaTgngMIFSlygPV21sqAchYkWOiJoKBzFvhAqwIVYnixKVpyLJo3N2rGkQ5OYEnT8/CjGMF8qZNTeiA6CaO6aDtcVdkSqC4gbHPUbFizD5nx7kRryUpBgi0FR4lbHebZdW7xi+hz8Vob7+r1lvdyGD1Bw5HPoOLKXn/U8ot8xRmcMtYMVLtzF4q7H/A+kNBvasg7aEavNPFj6BMlfpbWGv/OxTQeMLUybbJb3hLCJEA5ho5bgJ4Rli35Oa9Q3Vdqrl7nrnZSPEMMplwbM4TcQDyUrXiTxptHqWcvcsat+GI0tdNI3ywHgfgRPSgTCSB57ka0iPWfYrKpT63llPssn3RbH7oApe9j1E+aKTwBc/UIGpKkcHjXUITmj9giogJo6VILyvxP5FsarxYqs7avN7jnDhNM9UEhNN+rmWexmnyYON8uOxNqpxD3tojJssa8vzsHjx/mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(36756003)(66946007)(316002)(38100700002)(2616005)(66556008)(66476007)(4326008)(6916009)(6486002)(107886003)(1076003)(186003)(26005)(6666004)(6512007)(2906002)(86362001)(508600001)(83380400001)(52116002)(5660300002)(8936002)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n9keOCjt7WHXKhkn6xrV4Ea57bjayeWxbpBLSh0rReEcGruS+trVBlRpJ5LO?=
 =?us-ascii?Q?ApaEyoTrcSscSNTS41I1I9F6qDbNmU4zgssjkbc+iqpc7/CoNk1tFLKGhKUm?=
 =?us-ascii?Q?430ntl1NshgT/dh+eOI6g4wbM5fm17+8NDgveB21KMQ18wYXQMLwSXP/QYGW?=
 =?us-ascii?Q?A8mgLWkmpgUhps2y36OQsk6Z1dHK7RSbLt1RM3XMN7rFmW2sXRiNc8N2rJyA?=
 =?us-ascii?Q?CIrUORBDwenJWnTMJO10tAYW3/SlrEBTzp8RBfqz2iNwIL9/dUkD9aAc2ekr?=
 =?us-ascii?Q?CcCbAeUPysF8uPdiqNRN+IPL3F39UOPRKF7ELjFY3uaclNhbMWc2fppXyU3n?=
 =?us-ascii?Q?6Zs3dW3b1wzGIBk/9IjPFPfx340h/PMxcU6h0bCclg8q7ACuX0Mm0WYBuCl/?=
 =?us-ascii?Q?bHKfI1l1VW7r9vIL9CDMrBpbw65tD8petG1zoILIT6kv0VetPqX1T3gnzFAR?=
 =?us-ascii?Q?rasyljC2YEwIlJDj88H7IIfa4mw/zauwoXeZ1ywQdP30cJ4rBb2LROV02pua?=
 =?us-ascii?Q?A8j4hVIEKzKz25v7MCVywzzk0L31yjLPkQvVjT8ooQo0c8KVaEpXB2uO4H6C?=
 =?us-ascii?Q?Nu90rPPl/rKmR64wciF1Gjnv9lJZYhj7415FNKiRtmvLMMA+ZU7ZW2Pv0dhb?=
 =?us-ascii?Q?0FDX/8bm8g2PlT1rDBK9mMEPjsMr4sLZe3TRxOsFQwpx/kLM7P3CgATJgOhG?=
 =?us-ascii?Q?lgKIydj3zpAoVQK+uLfBHHGwbbEAyhsIZlHYU0SuJsTlMy31m/IV6rMHwErK?=
 =?us-ascii?Q?waQRfNJRsuIcwQhSskukH0TcoVN+FLe/4uPlu5ZruPvLE+YNrl4mFWwa0P1d?=
 =?us-ascii?Q?2q+jOFWE/lm5iLzUsxr+OlRPTpKL56yg6KWmQot7X0EYtX1ShXB9+RDhacS7?=
 =?us-ascii?Q?dI0D8N/mIS5qq5AJxrtT/KOolLdUaKoIqvkWKFyTilPffcNuLkHoY41toW/U?=
 =?us-ascii?Q?FDYzkVpqNrf54/5sDLPo/IWc2DGscOuSAWL+KdVRZzGWVr66fatcNQ/ewH0v?=
 =?us-ascii?Q?Cx/cOrjIXXaTfkYBDKajRN7La0odF35pyBEYirP7mFNNSVzFVkduOoqUaTzC?=
 =?us-ascii?Q?lW5j+WAFUIIxUvcKYTYv6vG5eV9IyDjEcJ8cX0v5lI9p1L0rzgfq1gt+8TAR?=
 =?us-ascii?Q?QWM/wKMMpZrIxykfIAZyyVtu1aO4nxQ3l8Y8QNeLLPvQmvmN/9H7dPAZyqxt?=
 =?us-ascii?Q?9hohB3NUlwOAu0qD8dkcdC7qLW8lyQdC5EisH+lK0CpnxAarRAyOPDEIuTRS?=
 =?us-ascii?Q?3WradQ5/uxkBaMKNIP0YHdRHhhHpaMLV03IXxUivbG5/p24vs5EFsUW3p7CL?=
 =?us-ascii?Q?+4F0cafLiQfs15bZROL27mK0iROt1HPHhY6WTGsWCvDxnuGJ7LpVxlboY+S4?=
 =?us-ascii?Q?4maq1tsSrU7kwDyXi7YRGbHYLZQ1MdVWuST7FTujniwdu1eDMw4u8Pc2UrZz?=
 =?us-ascii?Q?G+MEbBapGpAp2jAj7S5MRr62r/Nb1B+fAHhuOQZspPyKLRnRoezNX2UTgFZK?=
 =?us-ascii?Q?HBZkZn4kSNY5OIunvOw4NrJXSuYpbVhKOCqegukschZkVQvVnRfeV5rxdMDB?=
 =?us-ascii?Q?5u6V3w0I4JRptvpgxXjFU8z8pbSbZn/G/lPHhDvCElT+DCWi4n9A4Gtz+wY6?=
 =?us-ascii?Q?IU5Cr/VQPGW5n6NYwONpbMc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 451086e0-44d5-4880-6648-08d9efd11153
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:45:46.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 blyEeHIqLBPnWqPu8jji3YcGzPkkxvitysDLgQM0hBQn+qkOHrJuRbfCaI2lwH/cjnSGKOa/8PF2tZ2gfjNYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:46:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161718

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Disable graphic support of qemu to support qemu tests in WSL.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Add patch

 meta/lib/oeqa/selftest/cases/wic.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index a021f8d84b..6f3dc27743 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -851,7 +851,7 @@ class Wic2(WicTestCase):
         self.assertEqual(0, bitbake('wic-image-minimal').status)
         self.remove_config(config)
=20
-        with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
+        with runqemu('wic-image-minimal', ssh=3DFalse, runqemuparams=3D'no=
graphic') as qemu:
             cmd =3D "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -=
e '/dev/sda1 /boot' " \
                   "-e '/dev/root /|/dev/sda2 /' -e '/dev/sda3 /media' -e '=
/dev/sda4 /mnt'"
             status, output =3D qemu.run_serial(cmd)
@@ -871,7 +871,7 @@ class Wic2(WicTestCase):
         self.remove_config(config)
=20
         with runqemu('core-image-minimal', ssh=3DFalse,
-                     runqemuparams=3D'ovmf', image_fstype=3D'wic') as qemu=
:
+                     runqemuparams=3D'nographic ovmf', image_fstype=3D'wic=
') as qemu:
             cmd =3D "grep sda. /proc/partitions  |wc -l"
             status, output =3D qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' %=
 (cmd, output))
@@ -1059,7 +1059,8 @@ class Wic2(WicTestCase):
         self.assertEqual(0, bitbake('core-image-minimal-mtdutils').status)
         self.remove_config(config)
=20
-        with runqemu('core-image-minimal-mtdutils', ssh=3DFalse, image_fst=
ype=3D'wic') as qemu:
+        with runqemu('core-image-minimal-mtdutils', ssh=3DFalse,
+                     runqemuparams=3D'nographic', image_fstype=3D'wic') as=
 qemu:
             cmd =3D "grep sda. /proc/partitions  |wc -l"
             status, output =3D qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' %=
 (cmd, output))
@@ -1119,7 +1120,8 @@ class Wic2(WicTestCase):
         self.assertEqual(0, bitbake('core-image-minimal').status)
         self.remove_config(config)
=20
-        with runqemu('core-image-minimal', ssh=3DFalse, image_fstype=3D'wi=
c') as qemu:
+        with runqemu('core-image-minimal', ssh=3DFalse,
+                     runqemuparams=3D'nographic', image_fstype=3D'wic') as=
 qemu:
             # Check that we have ONLY two /dev/sda* partitions (/boot and =
/)
             cmd =3D "grep sda. /proc/partitions | wc -l"
             status, output =3D qemu.run_serial(cmd)
@@ -1180,7 +1182,7 @@ class Wic2(WicTestCase):
         self.remove_config(config)
=20
         with runqemu('core-image-minimal', ssh=3DFalse,
-                     runqemuparams=3D'ovmf', image_fstype=3D'wic') as qemu=
:
+                     runqemuparams=3D'nographic ovmf', image_fstype=3D'wic=
') as qemu:
             # Check that /boot has EFI bootx64.efi (required for EFI)
             cmd =3D "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
             status, output =3D qemu.run_serial(cmd)
@@ -1418,7 +1420,7 @@ class Wic2(WicTestCase):
             bb.utils.rename(new_image_path, image_path)
=20
             # Check if it boots in qemu
-            with runqemu('core-image-minimal', ssh=3DFalse) as qemu:
+            with runqemu('core-image-minimal', ssh=3DFalse, runqemuparams=
=3D'nographic') as qemu:
                 cmd =3D "ls /etc/"
                 status, output =3D qemu.run_serial('true')
                 self.assertEqual(1, status, 'Failed to run command "%s": %=
s' % (cmd, output))
--=20
2.30.2


