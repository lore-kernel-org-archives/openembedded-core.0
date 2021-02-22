Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web09.33984.1613994158657216978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 03:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=U0zlRD5W;
 spf=pass (domain: siemens.com, ip: 40.107.6.87, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hR6q9JmVYjK4GaE9xazkQDUiYOtX9MzcZ4KLlgJGmtc6WyFD6ALh90IRf/xAHHKgXmp6t8erp2MZjDa1JV7lTBm9xv2Q1b0j4IIhD26vV7Lgcjx0SPSwbyPS/SzdSb22235LrlTuKYfu0ZQ9tSZThBmfvvswjP3xqAnqiupVatreiCXIjthwO0PbXLH43uT7NR+jJw8C8U9+0tHOUdtE4Vxho10W+YwVh+cSgiUMtKGk2kdWmCC2NthuxdpqUItIpFAYmXipB4VgRJKgpR+0ycoa/i6lx8buSexUROw7kIR9hb0crId46nYW1TNmZfvGNuWzWAa85nhKDAzpJrVn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z1H2X3Idn+yaQvOUG3k2d15PjQanWkvOKUtjlvlfj4=;
 b=oMeMsHQITQou+TJoNE7aajV8tkyBX9De4TjqG3gSL/inPhkV5ZE0gG/6EUst3RDGh+9oT3pv7CV6+1t8C9GXSI3NtViLaTS/hXew9Jx3itqMN6qASquCAhHkaoyZtWGiQ/xsF+QKw2QYYkMWfteV5LxAp4D2Z1MlD7R28fylaOJef4cnsUsikpppByUwgc1j9qrHTF9DasDkbnpWGszgWVfBoU5e71qP0GIVCDarH0BXK0V0fFYkrMV+38FmrnFIft/h6Tt4gkzh6fLE+CjVYoikwcGYAoOJRLClVZkn3KzTJVt3rwPuR2ieiMOg+7FAjjFhD0w0yllLZQoY0ITaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z1H2X3Idn+yaQvOUG3k2d15PjQanWkvOKUtjlvlfj4=;
 b=U0zlRD5Wd207YpL/UElruwhC7kL2NKPuHcMAn8P5cpt7RYc8BDESUDiEZ/trgwz7czIhS8dAuV7Nkxex3YIaYdmHKTiToGrGAc2TM5e1LaEE5VqZsOQNBVhuxkWdbTBjzwH35vT6hvthe9YSQw75cGB3Ed8yk2XdYfaNhWCpZqQ=
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Mon, 22 Feb
 2021 11:42:36 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301%7]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 11:42:36 +0000
From: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"henning.schild@siemens.com" <henning.schild@siemens.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
	"florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH v2] wic: Warn if an ext filesystem affected by the Y2038 problem is used
Thread-Topic: [OE-core][PATCH v2] wic: Warn if an ext filesystem affected by
 the Y2038 problem is used
Thread-Index: AQHXCQ/QgRMMnOhmG061Q5ykS2aueA==
Date: Mon, 22 Feb 2021 11:42:35 +0000
Message-ID: <20210222114120.32592-1-florian.bezdeka@siemens.com>
References: 
 <5b5b7cb71b40268712a8bf9d18e33bf6901cebd4.camel@linuxfoundation.org>
In-Reply-To: 
 <5b5b7cb71b40268712a8bf9d18e33bf6901cebd4.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: ed6994e1-e5dd-46b8-58da-08d8d726f332
x-ms-traffictypediagnostic: AM0PR10MB2049:
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR10MB20498993F8A3D8D6466F7CB6F6819@AM0PR10MB2049.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Nv0wOOD2UcWaEPwL0VPEs91l8Yj4kCdfZ8wYWG6sskKzH7hzwuthreU2udeet3F6e8aCfFD6uc+WKQsbgrFD800AOtUnp3V7fVQaLN+Deeu/Z1OpVdv538RpJap8pG5xIRfeOvp8Nrmtx7KfJiWxMqcWE57LLQivPT2cg9UT043inOSukLO0u0ia5hZh967rSZRI/9AFF791cD+xiaVzcLF9TbzU34PN4ECxEbnsQk41GOYV/BR5o3NSRdz/gEUA08mAtBdVxGdLcJJ9/0fGZn1tnEbr0qUSFpKkIUKVg2YseHv4momt/lxdwX8n3VYLIKEXFU/oabf7fElwJHExKiA+Rw/KyggTix7ChvDaTGzsWtb1dV8dhipd3KmGltDWygoPqdvtiFatzJeeLUF1ZqTKgr1qHkkyB66PMzJgKPVvL3Gdz75YtV4e5XHtO/J6LJCuMvI7lFfwvVvzKnpxdlup2AKoh4k1Rvimh4NGUetscgqMVJC7hAWCCjviKVl2vteMku4+KiwrNurpKC0L5A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(2616005)(2906002)(6916009)(186003)(71200400001)(83380400001)(6512007)(26005)(1076003)(5660300002)(8676002)(8936002)(6486002)(66446008)(316002)(64756008)(54906003)(86362001)(6506007)(107886003)(76116006)(66946007)(66476007)(36756003)(478600001)(66556008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?siENsT67dGerZ9VC3maM70ax6yng4NFhltR7Ldi9b4BHXg3aZN5nKicnPN?=
 =?iso-8859-1?Q?S4Er6hpek9t05We26n/YIYZAGZXLvvsfV1g2zijzs9MlkoNT+a2zoGxBbv?=
 =?iso-8859-1?Q?SzSE2oh12I/9BizdaKrvgpvvVL+LhcnI2nQZo6XtaGm8SGc2Oxp+HHoLFW?=
 =?iso-8859-1?Q?wassVxhAm00g0qUuaBm5ezqk/T1ntCSGuyOfL1xtu/uyeMdEzjzBBQZdCn?=
 =?iso-8859-1?Q?mnQcOEpRwwbvmAZzOFrjHjoOY4BEpRK2CPuhMfE33oYbGboHg5EzetuVE/?=
 =?iso-8859-1?Q?8y7Ba+ZnhnEsWRjX3buXOWROBFcWQ9PuN1siZzJjvhYPY7PfxouRk+h38S?=
 =?iso-8859-1?Q?4Wv6rxvNegMhrZrp9l0ukYwHXd3mPcY+hRHPxGIk0502eTFCopOD7REFr8?=
 =?iso-8859-1?Q?Lx8cTCMXu1HgHm4BLpzxAJDEx5d/zkPwYKIWnGWmvH/Bqzk2nITtBOKEte?=
 =?iso-8859-1?Q?HUhKgonnw4+/Ehvu8Msr+LOrsftXJWoyNTd5ww6ffYAUzbCoNCmj731382?=
 =?iso-8859-1?Q?+u9H7LgEx4f+voDGgR+DTzhhbyfy+7XD2SLILHfqB2vtA7uwca7zVZOfjU?=
 =?iso-8859-1?Q?LGEyuu8fFPxGbltZITgJWhFAHZJAo/HkyFlhvil+P6aGjpWN8l3gkjAUBS?=
 =?iso-8859-1?Q?5S+HeHwbZLzjVGJ5diSbdbjDAtAsN8aAPqQcK6FmsIs38wSe35H0W6HGEi?=
 =?iso-8859-1?Q?ueRvV6uleOef6z6qy+ou45qZTU29oekX/9a3nZXfQ45L+bwJEgMOI7LzNO?=
 =?iso-8859-1?Q?a+nNhAb2VMuO99NYO89jjHb5NF8QJURwlhZtaN8i1/LzqHI/8sI2dm5/1X?=
 =?iso-8859-1?Q?+gp9uQQf9D0JuKfaGxET7fmpCISzwC7O39gXEDWCGM5jDNCAYVRZZzXOV/?=
 =?iso-8859-1?Q?9cmbeALtFp/HRDoFBOtnQnQGW8jgnlj4k68VzSQ1avzz+SGp4DkaEKuj0M?=
 =?iso-8859-1?Q?QOwKtfMhJAnhiXmwW0fOxTHrvAzQBgSSOQd/YuzoPy5Rc2eql7Wa2We7SK?=
 =?iso-8859-1?Q?4XfDrKYnRHsEX9NYZhtd3YjDr1fSS3gyggz+ngyk/lXlFU/Va04MIzsdUY?=
 =?iso-8859-1?Q?DQDrcgubZ0n+6pMGcgRUwkqyM1HkGQLnV2TtaJgOypE3OfY7yQGvdDPNMw?=
 =?iso-8859-1?Q?9dL6sfj69ruwO8548WRn+9P/BHYGZQPM/uuhLx6jIYwOfxXxnXJe/Yx71u?=
 =?iso-8859-1?Q?IvSvggVgKXOPmYwnuug7pFa3xJOg6yCNpGHRp0h7oNbpUhbjbKD3NWFGwR?=
 =?iso-8859-1?Q?8dXSVggF9AfkGvnKQagJvvLtLrxUVrHxoJYOjGTPEMOdu1dMPhHq5DPXjk?=
 =?iso-8859-1?Q?iv9D396e81tEYpwuHAmfJLXHOAJgV8ug6HMIBRBRJpUoWzSRY6DqFIPFnB?=
 =?iso-8859-1?Q?FJBTGF5ioV?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6994e1-e5dd-46b8-58da-08d8d726f332
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 11:42:36.1007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdUwk4pdRIRKk+AbOo3gY8xyFgatW6T3wp+pCUokzedsAirjLgs46nsUv50ntr6e9KZXlx9ETYMUBLJZ1PigvB52uvbMyX72fTMxGrGXSik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2049
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
used very often (and partitions may be created small first and extended
later) this might be an issue for many users.

One partition of mkefidisk.wks was already affected by the Y2038
problem. By using `--mkfs-extraopts "-T default"` we tell mke2fs to use the
default usage-type, so disabling the auto-detection of some tuning
parameters that were dependent on the file system size.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---

 Changes in v2:
  - Fixed a warning reported by CI system coming from a partition in=20
    /scripts/lib/wic/canned-wks/mkefidisk.wks. One of the partitions was
    already affected by the Y2038 problem.

 scripts/lib/wic/canned-wks/mkefidisk.wks |  2 +-
 scripts/lib/wic/misc.py                  |  1 +
 scripts/lib/wic/partition.py             | 38 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/can=
ned-wks/mkefidisk.wks
index 9f534fe184..d1878e23e5 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
=20
 part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --ond=
isk sda --label msdos --active --align 1024
=20
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --ali=
gn 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=3Dext4 --mkfs-extraopts "-T d=
efault"  --label platform --align 1024 --use-uuid
=20
 part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
=20
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
