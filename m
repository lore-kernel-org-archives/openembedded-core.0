Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.57])
 by mx.groups.io with SMTP id smtpd.web10.11260.1614094216887184843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=ie6fNe4r;
 spf=pass (domain: siemens.com, ip: 40.107.4.57, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYfyETmQ8YVQkx2TuXcJgpt81KHkRnO6Qp/OZ5v2urEIba1I6ddUYyt8D3hgn9r/Lxxehh2pBJnyqp6JzL8jmDsnQAPDKpasKHI2yUDUzVrC5vGpB56XjxVLbOing/eQ1iiI1Lb7HJT39+xXO9JxvmSqL3dN3LXMDpYxVsUDx1bFGKrxjoxxoNJxti9cFGGxKgNbvQZJczDvNczhtne5CBAclpWHAn/WsX5AwabllSVSC7KlvmrUBToukjWhukEyTsSpx9GbKDEhRJ4J0qlr0669a9yUGizQaLCDDvUSvOoEpb9vUPH8uVIGHnNTi/4XgnXPNhh0qF5tdhFF4bUfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RkLX/pYNjC0dYJL2cCgZVI1nzdqLi1U5PdslsPKzbM=;
 b=eGYH0FYOznjC4MOPbMxn5nuXUfy/VBXx38i3eYAYDVBm5pGDjeHeKtDOcTyzOq5wjzjWg6bKXpJ8rRywFNmaAaPul/XPyZZgQtuJPPJI+cDXceYJPn9dJWYXUDYK8RLBs3zyZtc3hDOhxb35gCWLH1dSINgXChXkok0zF1b99ajEjQrCLWIA5CnunbXtlHHsoTlYKtP5+PakEi/pv4OukSytz3twQCNUCHSoX6j8fwXM6xpj6jtSlY/Fq/4pJRZFELB4mmu0qkmZRpMpnknVUmMHynzgevxJd3smTEi5V9q5AhcM4aimOSfDrpYgfu9K+azgUGW4pgRSU6QpMGbwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RkLX/pYNjC0dYJL2cCgZVI1nzdqLi1U5PdslsPKzbM=;
 b=ie6fNe4r/NUQ3xAWSfpigS06ZbbHpDMKZPAMPaoleMP34LgZdYReopB5Ogiwc1klGz33SCPTHYxQYpAPtoBdK+GRSP7dG10kIVzKC/MBlUJHBjwT6XB4rA5h0mz8HywGpU5yXqWw3fvnQGzhaI+gTI/JzklWJzY/RxADpQtfhmU=
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2401.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:db::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Tue, 23 Feb
 2021 15:30:14 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301%7]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 15:30:14 +0000
From: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH v3] wic: Warn if an ext filesystem affected by the Y2038 problem is used
Thread-Topic: [OE-core][PATCH v3] wic: Warn if an ext filesystem affected by
 the Y2038 problem is used
Thread-Index: AQHXCfjIw/7zjw1zlE2bFMsv4Q25KA==
Date: Tue, 23 Feb 2021 15:30:14 +0000
Message-ID: <20210223152915.69198-1-florian.bezdeka@siemens.com>
References: 
 <7a7e2ce878209faaaa4ccd75b0d8ce40ffcfa349.camel@linuxfoundation.org>
In-Reply-To: 
 <7a7e2ce878209faaaa4ccd75b0d8ce40ffcfa349.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 8bf5a964-151e-4fab-dfbf-08d8d80feadd
x-ms-traffictypediagnostic: AM0PR10MB2401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR10MB24018A191D125F9B7E2ADBC6F6809@AM0PR10MB2401.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zt787aUrNVsQTdqaJ9TCsn1JZfIe5koHrevsG1ToFx2EMcVbiqq56toaNGI6WZgzG9yucxJYNy15Z4BnQRgVIZF13PMOCjbncquB8j+Jlk3iASe7fAlHtFcGQqdzYrMqits9S/LJbfZFWtqkCBTUjmMWqu3og8bKy6IaZVm+QIgn0xifYpeHgFYmYo/8OSeO+mlzOK/1wTCAFz+xX8JPyAw1eVRhJI5+OBtFymNC7JoO6bV4yv5IUBnfPSG2jB4vakn5PRsA18zySV2e6a+wShBO6ypSRe5dcT98lOqlQQFZkPBp8CIH7MV/TaA8DrXJK9I3U1fqpDO8sfi0K80NScil3IzDOHAtPG85Yj7EeRilAs/th7fUA19vf3S46317oVrkEtFS8ou52pCovd+Yhv/SU7LWkMeXtxYlDVDJdN4sQRL5QJRt0uTkvtoABGBRH2gcpiWAp94lBka5z1JEO43bQ9XeTcRYuDP8vsOaGsXFyMai8fKCwIPhyTC6zT8r/idTGBws5ljKpcVzdpWt7A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(71200400001)(36756003)(8676002)(66556008)(86362001)(6512007)(76116006)(66476007)(5660300002)(107886003)(66946007)(66446008)(83380400001)(64756008)(316002)(6506007)(26005)(6916009)(2906002)(4326008)(478600001)(186003)(8936002)(1076003)(2616005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?yEmCIZAvZd2z7B89/CSyGf/piSJqcitpsj25W4pDTPLNT88cTlYqtPgcPd?=
 =?iso-8859-1?Q?nPpCpNED0rAKqu/6cD0UazKo6jq7TFVy/U2DEJR2RYNHmmhyOt3Qi1rJ6g?=
 =?iso-8859-1?Q?s9jzkP2dzmyuJ4M7R9AtKzsffARA7T04/dekG3uwZnoyvmYBlMyZ4svE8t?=
 =?iso-8859-1?Q?QsWfR8GUzcvb9jc6d9GxCh4j5qiL3VAa/XUtbU5qteN4R3uD816NZw3ZjQ?=
 =?iso-8859-1?Q?FCCiDxI5XrtkimJ8fXtPv0g4v6+84/OqfrJ6w3BY66JbCzINorPaeLBqRp?=
 =?iso-8859-1?Q?AVN7pPbSeM4LDsNT95FPCerMVATILPj97p+Ko3aa4jeT6HfOGGCQYx/vHP?=
 =?iso-8859-1?Q?x9IaH80RC5CLM7jggVxm+Z37hev1uLcTQV5hPVAHtD+SiUH9bpzDi/Ltzg?=
 =?iso-8859-1?Q?VuGOgfrrC08yRgS8DaqSrEd+fkc/BE04N2R11JyEWb2K0YmiG2WEvYR7bR?=
 =?iso-8859-1?Q?9nABf+SoT2Iz/idKgG2++jKh+6klIrJo2gSSNsXWYoEhM20sak/QyH8AiL?=
 =?iso-8859-1?Q?Hp/GFPhJwN4YKinTfq1KJqhea9ZJ0pRwGcAqW3jq2rLudpR7ANB0gyqzkf?=
 =?iso-8859-1?Q?qVColHgQqaWVBf+tMLT1kAXUmhgq6RsGPulYw4QqirDo8YxyhchxA7dbhR?=
 =?iso-8859-1?Q?VsjRU/fbh6MZH+pzjDoPCnIils3bHh5tDW1A39VnE7tCZY11AS0S7d/jxP?=
 =?iso-8859-1?Q?tSuayP/iNANUmCw7a5yY0UUQZ8y9e6uPFxF0bLVAw7Y+tK/KsVAx1cHCHQ?=
 =?iso-8859-1?Q?u3X0Jkf9x7t/0eXrE1t7AyMgIl/5bY34l877CRjLv1G1y2u304gJhjS8qw?=
 =?iso-8859-1?Q?811645J0Kdqzs21kiZBR5006/Aq+4tCUCjUJwNQ/vMmicTRzLvsoREIHvO?=
 =?iso-8859-1?Q?T6iiMe7jZvhF0lWxiwTXBneqUYqFlk3HUbqMZ4VQUjHURzoKr0EaVoCAgR?=
 =?iso-8859-1?Q?rSPwTIus7wRz7ZzPuhzERAD5+ooCUnrjxW6PFXQ+SNAbLNe8TbuYd/mY9p?=
 =?iso-8859-1?Q?UVUvF3GM+D/9Jwmce8Jp5b3/DSvLSUGRLn/hOO6on+RvUe8HWNrVwm4LFJ?=
 =?iso-8859-1?Q?dGuFLKFRPuMKodnGJ8xwEbBGyVlvk2G4NCMg78sPxLE/DEQAAYKc2ncq9f?=
 =?iso-8859-1?Q?BGSO/v9ohcVhcIqwNRhwiSryXM6UAZkezFdAeokD4cop7msPo/iQfPRlLx?=
 =?iso-8859-1?Q?0F43TiOTj1llo33wyvb89Q2EGJNXc48zE50+fcJqhW/M1SMyLc4ImDbFbg?=
 =?iso-8859-1?Q?LNljcqsp07H+LWrufn8CVxuhaAxIq4bl08gPcrGYuJ1cBFEvQ1XxVfb6DK?=
 =?iso-8859-1?Q?7uGa6uon2t+ZT679YRq8L52NxPQaCOpCCcbuf85P8CReS6Fq6mOslDlK/L?=
 =?iso-8859-1?Q?SLi4vkstbO?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf5a964-151e-4fab-dfbf-08d8d80feadd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 15:30:14.8254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: usgXYuPjdcviEwr8u8HibiCwvfYtyNNyFb7BXhJBOgKFkxA/ARkuDsATf0GNlWf1/uIO9ZQCJCPPl5tfdWQ7VYwQQhYz4vQpUnkm4aJ9NH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2401
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
problem. By using `--mkfs-extraopts "-I 256"` we tell mke2fs to use
inodes of size 256 bytes to be Y2038 safe.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
=20
Changes in v2:                                                             =
       =20
  - Fixed a warning reported by CI system coming from a partition in
    /scripts/lib/wic/canned-wks/mkefidisk.wks. One of the partitions was
    already affected by the Y2038 problem.

Changes in v3:
  - Moved to "-I 256" to become independent from the /etc/mke2fs.conf
    file (or even from the mke2fs compiled in defaults)

scripts/lib/wic/canned-wks/mkefidisk.wks |  2 +-
 scripts/lib/wic/misc.py                  |  1 +
 scripts/lib/wic/partition.py             | 38 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/can=
ned-wks/mkefidisk.wks
index 9f534fe184..627a03beca 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
=20
 part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --ond=
isk sda --label msdos --active --align 1024
=20
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --ali=
gn 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=3Dext4 --mkfs-extraopts "-I 2=
56"  --label platform --align 1024 --use-uuid
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
