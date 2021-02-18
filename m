Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.60])
 by mx.groups.io with SMTP id smtpd.web08.6475.1613653584404346405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 05:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=PqyUI2gj;
 spf=pass (domain: siemens.com, ip: 40.107.2.60, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoFD/3qm8wOdqb/P/6/ti6XfZLg5nljI22yhNq24zlUxzNmWuq1CeLbYcLId0kmGwBSXIpAq2Y3e5Xi/uOTD53TlyJMLE/L6sv/PM4mxXneEHnKczhFv8eFINy+K2DV1qcXQsuf4WMo/v1M8TSg6n6/Cx+cjY3yUT2+ESXT0NGIkBDGzzuzQKst3/JJHmBHu5bCbiUxI8tO0kn7Z1RyZxevJFIhlz8poMf2YRRRCB/H3n3/CTX1G25yG9H9lm42GkK0MxcpT3TZBaMaLy2pyzAVUikhsLU6AxeucQn0JS3JRawPTZ43Lf+JYxNJOphJdd+ccZ7PZYvWRySPVcZhRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhuMwj19CafcmSyYWA38ffQax/6cV7/ZDKjLVZhbkmE=;
 b=oAkAMmuk/bjzoqEgSZMU1jsoePeF0Z4jR6yAqFBl4zNbp2R1wj8hnonHqUgiO2/bsxJgnooobya461KxwZeMJ3cbCqDLmG+VrMOX8+cKjMU7jwIuH0m7p9NIoCglZyg84l+9GnYkb/kFVAuAfBpA+OiUY4umfYDSJs9Zj26ywYVpk7dgEGJLGUxhIq8rEeoaEUZ5icnsXd6FT/RzP1NLrAR3EfpJmikQiDBV4kaB67TzTUO/LphhjfBwth5vglpPY+qvRbuqvBjFjooeycW9mo4jothAsoCg3mfratq8lr99CY+rGvEq02oFHBxDZN7R0bGHkZWNSIymxDpodV4epQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhuMwj19CafcmSyYWA38ffQax/6cV7/ZDKjLVZhbkmE=;
 b=PqyUI2gjysou/B1EK0lhRDfBjZlTEuSjfR+3UF9VfaHQfUwc4xewdgfnfPOJL5iEoOdgGvOqZsqcWsZnqkDce5ActMSsJdVVZwchNJ6zDgM+EjwZaKD6XxbXUm563HQAXH5wXxDwxPqhQFU1UJyLd96rfu4O+N9g3Z/+eb4v/GE=
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 13:06:21 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301%7]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 13:06:21 +0000
From: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH 1/1] wic: Warn if an ext filesystem affected by the Y2038 problem is used
Thread-Topic: [OE-core][PATCH 1/1] wic: Warn if an ext filesystem affected by
 the Y2038 problem is used
Thread-Index: AQHXBfbacmIdutL1OESxn2ZXAOENCQ==
Date: Thu, 18 Feb 2021 13:06:21 +0000
Message-ID: <20210218130559.43404-2-florian.bezdeka@siemens.com>
References: <20210218130559.43404-1-florian.bezdeka@siemens.com>
In-Reply-To: <20210218130559.43404-1-florian.bezdeka@siemens.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.29.2
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [178.27.123.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a363c99-b7a0-43d7-a633-08d8d40dfd1c
x-ms-traffictypediagnostic: AM9PR10MB4023:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR10MB4023D13881C3873C4801A9AAF6859@AM9PR10MB4023.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T2PW01PCk4gmtCq2Na9DAjg45y/GVHXpnQ+xFk96XzmyNptHJfgOr7FWCOMSsZQA7WJ56IHOhk1yec8Nf7r+tzU0uyAYA9zVSk4lik5pXDoQrbQp4STVE2VhZufY+toA3xGnWDumUJ+Zfsb2iyj2VPX9GofStuE+t4nZLjiuS0RzvT1JFwPmB8GadSdhOdqiKizOpaRD0gpuwM0sz+OII395fxfNJ3nZIc8gbdyz6IGRComttoojCm/iGRP23DHSzYYYicz2+vGseREKVdnmN8UKSnmlmWWOjvj6l+SRutIzdiejgoT5ADmlQ5r6ZrcyddJ/ih3ohyTUuyR8vx0hWWQ+OZaSIqfxL+bd16Sz3xEJajuIiHhZJZz0rMVLfYIqR4Mclb4LmbDtyTHzcZAGEpLdAgiy5HcdkS1tXVCvSd26aztsUyq7MdEjuG4RnLelvmMhJQAzQtkw56ibcrvcmWFy+WJOv4adItP8EZsivQC8mrLWHtmmTAuxEiB9zunjCXBfXWQ88sAIErTn6ScLWw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(5660300002)(6486002)(76116006)(316002)(478600001)(66946007)(2906002)(36756003)(6506007)(6512007)(8676002)(6916009)(71200400001)(83380400001)(4326008)(26005)(1076003)(86362001)(2616005)(64756008)(186003)(91956017)(8936002)(107886003)(66476007)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?+XDmV8w6WeBgVee9ORjBq6QJPiuz5G8GFmq4k0tdf1sQXn0e4TLs3igx1s?=
 =?iso-8859-1?Q?6KUwysV+zF1VlRvjqfsk4AVf6FyHDq+8eSR3hb361GNLqxWvzYU1F/K3gh?=
 =?iso-8859-1?Q?jBTNZ1ywcoVJLOJjPgh/2ZZn2H+r372FvxxcvG3brO/FuwRWhaNWbVaVgv?=
 =?iso-8859-1?Q?tRIqlwCnWNA11pgiyqLpt0O0S0cTOFEnI9NNYdDvNFnGfyOgeX6z0MDQfH?=
 =?iso-8859-1?Q?un3riBTnAM7Lsu6yzntD7roCstvbQQ7kht+5OmkXezSvDE08q5EC7xZ9gi?=
 =?iso-8859-1?Q?pwGmGD0V1fN4kYStpneKGa66OXShrzYQUUzfoYDKjH+A3iDsh6BPgu24mk?=
 =?iso-8859-1?Q?5PS+iA61RrbS04tArcvaV9Kfxl3cveb7pVnDLXSikJifSm2NBa8/mDFSxg?=
 =?iso-8859-1?Q?51Xroag20KIcGiPrItZSGBDDaWpI5PaSglulYHTEifmMWfs+D1hz6MBIm5?=
 =?iso-8859-1?Q?QFJZCUBU0IDoECKuQg9Iip1eeQv1oP2DOI5RC/IqnZBh6gtM+II/94+6B8?=
 =?iso-8859-1?Q?J5Uzn0Maa7kz4avkfnRKc1DGT+pgZ+pZoBpnCl9IVH2Twc9bihzxMCVew1?=
 =?iso-8859-1?Q?KzW/krmG4SZQ3hL+2gguPSCKGb7sxCemvzoyZ5TsLvdjNw6ngRbXiMAq9w?=
 =?iso-8859-1?Q?jOL5fMpbWJktwhG4fIqr4ZLyzvX3102MubShilGYwkyJHnS+QQ1dbR22I5?=
 =?iso-8859-1?Q?DRJQGjMfRP8ePyNFgxfM+8E5tUsaxhfgDVlQ4IFXnbjzY0TdwsnlTwQHRs?=
 =?iso-8859-1?Q?JtuvNW/Wq6tyNPNWhaCycJFVa2VpR2bT9mSUYz/FK6RSn9t4fewn5fO6Yv?=
 =?iso-8859-1?Q?ckNfrsG8THMFZD5/cyExgs/Imqp4K4S15HFjnPMLfpm36scJ/jWBV6deup?=
 =?iso-8859-1?Q?qyOb6o3ox706RcTO+7u1Ay1HBab7ccHlsVUPa9OvOIU3406xbOufCHEa2c?=
 =?iso-8859-1?Q?fdYxTcqAgHBVHzSrgB2Fu1anYPwOm23IAZuiVfChWsu8Dmi/wshRrExWp6?=
 =?iso-8859-1?Q?GKjGelwQBxW5GH/gYfgl1A8AZqKqUmSoCW/BuAqyw6CHLJtPoxOAFKrOru?=
 =?iso-8859-1?Q?Bx3rZJh6mCn2R+Hby6mBtww80vkoid/HwFU8Dtw73k4FlYqlZsZmC6WwWL?=
 =?iso-8859-1?Q?oosyD78LDGc7uvL/tcdS5N2UmzpCuBlMDTgnF4nBAos/YdR4sabfxXuTkV?=
 =?iso-8859-1?Q?lnvoYYMe0Y5ZXtwIo7lTaQRtfwnLwD9HZ3jOYsQ4oLyHrv2AC41x5Mwzfm?=
 =?iso-8859-1?Q?TDpdI2N8jf6kaSTLg61M18HB4B7JcIQZu4BZNO9gqp4ughglh6331drG49?=
 =?iso-8859-1?Q?MaLUPaFs2lwRigNN2dGj+xiXgLUAow47jhgapYmc4u2fdaXN/BYvXyZg20?=
 =?iso-8859-1?Q?aHfkCkoy1J?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a363c99-b7a0-43d7-a633-08d8d40dfd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 13:06:21.7822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XiGM3+j4eDAzXqiPLysDW/U5ud2ReWKdNWHzSfFa2+P+7yfrlPc1p3Da/0TQRN1DS/xztAHS/5h6CkvDxHGCUijNrp54msWtteU4swOw83U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4023
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Florian Bezdeka <florian.bezdeka@siemens.com>

We are getting closer and closer to the year 2038 where the 32 bit
time_t overflow will happen. While products (=3D embedded systems) with an
expected life time of 15 years are still save the situation may change
if your system has to survive the next 20 years.

ext2 and ext3 file systems are always affected by the time overflow, so
let's warn the user if these file systems are still being used.

If ext4 is affected depends on the inode size chosen during file system
creation. At least 256 bytes are necessary to be safe. As ext4 is
used very often (and partitions may be created small first and extended=20
later) this might be an issue for many users.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/lib/wic/misc.py      |  1 +
 scripts/lib/wic/partition.py | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 75b219cd3f..57c042c503 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -26,6 +26,7 @@ logger =3D logging.getLogger('wic')
=20
 # executable -> recipe pairs for exec_native_cmd
 NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
+                  "dumpe2fs": "e2fsprogs",
                   "grub-mkimage": "grub-efi",
                   "isohybrid": "syslinux",
                   "mcopy": "mtools",
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e574f40c47..85f9847047 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -298,6 +298,8 @@ class Partition():
         mkfs_cmd =3D "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
=20
+        self.check_for_Y2038_problem(rootfs, native_sysroot)
+
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs=
_dir,
                              native_sysroot, pseudo):
         """
@@ -388,6 +390,8 @@ class Partition():
             (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
=20
+        self.check_for_Y2038_problem(rootfs, native_sysroot)
+
     def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
                                       native_sysroot):
         """
@@ -449,3 +453,37 @@ class Partition():
=20
         mkswap_cmd =3D "mkswap %s -U %s %s" % (label_str, self.fsuuid, pat=
h)
         exec_native_cmd(mkswap_cmd, native_sysroot)
+
+    def check_for_Y2038_problem(self, rootfs, native_sysroot):
+        """
+        Check if the filesystem is affected by the Y2038 problem
+        (Y2038 problem =3D 32 bit time_t overflow in January 2038)
+        """
+        def get_err_str(part):
+            err =3D "The {} filesystem {} has no Y2038 support."
+            if part.mountpoint:
+                args =3D [part.fstype, "mounted at %s" % part.mountpoint]
+            elif part.label:
+                args =3D [part.fstype, "labeled '%s'" % part.label]
+            elif part.part_name:
+                args =3D [part.fstype, "in partition '%s'" % part.part_nam=
e]
+            else:
+                args =3D [part.fstype, "in partition %s" % part.num]
+            return err.format(*args)
+
+        # ext2 and ext3 are always affected by the Y2038 problem
+        if self.fstype in ["ext2", "ext3"]:
+            logger.warn(get_err_str(self))
+            return
+
+        ret, out =3D exec_native_cmd("dumpe2fs %s" % rootfs, native_sysroo=
t)
+
+        # if ext4 is affected by the Y2038 problem depends on the inode si=
ze
+        for line in out.splitlines():
+            if line.startswith("Inode size:"):
+                size =3D int(line.split(":")[1].strip())
+                if size < 256:
+                    logger.warn("%s Inodes (of size %d) are too small." %
+                                (get_err_str(self), size))
+                break
+
--=20
2.29.2
