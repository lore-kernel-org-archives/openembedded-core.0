Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFC9C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 14:33:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web08.7732.1646231632021920063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 06:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=2MUb20nX;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.49,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZcPB17l3Zzf1SHIqtNomkK/PdjQAKcbX6ZMIguD3I4DWpQ156xSqh1guAjFl68GBwD+sg+M6SoIq/9G1SbI89PMBtboKFVCauH3S6knwphHu6MTlNsJt0eJNOmIOzuvjUayZ6pttzDs09trtKOU9RSgbFNNAyfQfKFXzkstMNcZegG58KjctBVMp8fCxAgWNpPZjEoi7dckk2AXRMJDqMhAcahtrqkgaib6VJKdQO3/ETXM5p2/nrF/xQDzn6R9T1g+jHG56XCX4NxgK8dKi/ejpuPi7jXnzttfwlnaS7wBxovZTA2MRSfkAuuvsoHp8J3+JTCw4T/fXLRhgEfAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb5+3ZTGJizhcqh2Vb/snQVvaFCW36K5YEwGRYdI1uc=;
 b=hIla3RfhOJSLadC3ELKD/WVEVZlobq+RCBl2LcnaL+Hue4xAm8ROs+3NueQQvRKr7qppzLQrR4eh2SkvukYd+cfXZlBcMz0nRa+ccVLgOIu36d45chiRELRIiNWIrIZ1qr2NRJVHv4kLYM6ab5r5a3USHSaQGCQSyeUr8U5Li+uKiRwXcGSafLCrZE8z5YLDUHwqvgqjflRckY4RU0j1rWMtHYKMkvC1MZPg4l2VTv+grUkPZEYmhv1EgK+YDaTPBlFprS3dUPnljcMCI/4rUCklFWyJsz5Of3/jgeWpJiXTHvVOYgQvqHPIhwPJ0X2Odaqy11vrQXszkWGxLhPA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb5+3ZTGJizhcqh2Vb/snQVvaFCW36K5YEwGRYdI1uc=;
 b=2MUb20nXXwlewj/brL7y8XmdQqb0RzmJ4wvBLDJp1Jh+vdTTcmF2TAmpqOt3rsS17jMQYdNfbNQAZVB4olaGBQ9LmHz0qTLKx1UL5F5IYGZyFSPBwRr0+i5pgWhsN7VRxBd5hEEK75193VgZD0n9XDSmvz7zVA31WdEY3f+RLGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB6983.eurprd08.prod.outlook.com (2603:10a6:20b:416::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Wed, 2 Mar
 2022 14:33:48 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 14:33:48 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 1/2] classes: rootfs-postcommands: include /etc/fstab in
 overlayfs_qa_check
Date: Wed,  2 Mar 2022 15:33:28 +0100
Message-ID: <20220302143329.4168-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0061.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::38) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd528f8f-75fa-4400-5a95-08d9fc59a9d4
X-MS-TrafficTypeDiagnostic: AM9PR08MB6983:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6983E37E57067DE3A60B7E40D7039@AM9PR08MB6983.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nk1uqQBVOigxBUE0bnAqoNJNakLiaYWAo0FQhSCAQvy4e2g2AqqWaUP8duxNnraFA94t9xoHcSvCjWmbZ6UMAqZLB7dBUw91jAMcOmf+my+I2jXazTP6qTbTtHUpVNYcCgTFAJHLBLnDmiGP/TbynNcmUWyCIYl1I2o5OxuVLCI6pCBOVQLdjrR5nlGc2s9s40oH7M9vRCJeoL/7+sepjUtDzcNJ5g70l7OH1zRgZiZpoW7Wvu/820Mu3kDlTegVTk1cOLghv41eSddIMLlBZeHdAd4ZZ3LjkS6eNauArigCXjTWHZ5ThvwQtBcrclYv/FqR3JyQIsKPiSWB9Y9eC6TI1r1ohhSXxeAeKWjox9l3BRXb0K9MMzH+EanexjbRuaIumJwBeXtgHJPhynq2DzLWnnQV3TMcS9vnSIeAlDA34Lcwj544bZZasAhYlxkzDpK8b1Utw2WdHuEDA3GQ86nYzt5/x24lGmuuHl0aUH6IO2oH5Y7+tsk18dOxaI3qMzONQZpYsZSNQrcYP2BjVo0snzAM2emhFlKDQMRsFN+2JA8lz+sk7UHGT9DlD1a0NMl+E+RNnJxtZTVmIgF1AXKu1Oa8lvSMM602xcMGTHNFXPbaYeE7HUGeHuwaCGnR8mpA5FFfFZDfR2EcO4JK7yHR8E3UDL9ecWjIWdEMG3pp1k8nkUrzIZnZgsjv5qQbW0kuPsOYJEvifZY3cl6thw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(38100700002)(38350700002)(6916009)(1076003)(316002)(966005)(6486002)(86362001)(508600001)(2616005)(52116002)(83380400001)(2906002)(4326008)(8676002)(36756003)(66946007)(66476007)(66556008)(107886003)(6666004)(186003)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ZlStqUuTiI+8LsQz/5aZwcmdXvQ2qnGaUWqwIJvMX5Wg+E8UNFZmjwVofoq?=
 =?us-ascii?Q?zmIIt7/GXbLbOLB2j2HTfBkrWZJDOy9sPgKn9v3l0goqMCu6qmS/277zYvus?=
 =?us-ascii?Q?91GrXPX7Jj2vw6HxMDNaKbwm/1icrwVWOhGyO3NL5XG9UHpZWXAjFqpIu6xe?=
 =?us-ascii?Q?EafcEjdr4mpyGNhe21UQS0rCBF3UTg52+cf/M3URDUfoCt1ctkr2XBIcXuSu?=
 =?us-ascii?Q?QVJEWLd0LX8JIh7nvs2VzzxC6PFxlAgg6AMwNOOrDoIs6T17bJaurTaMfqIU?=
 =?us-ascii?Q?3B2sSCwnMHutaThHtQhcXJFj7voCJ/DxXQOrqTIdZD6iqqmaMLrQ/Us90Xt4?=
 =?us-ascii?Q?0DJQBAULSRmqCpm2NvGwRFQ8X55ETplOmRdZla1vEslG1yp0u847Qc+wNz+x?=
 =?us-ascii?Q?VMKfmTwb1IRMNifN1ahWbSOQP7Z8Mu0KlJOpZ8BUPqoVMaO6t7r03L/Vnul9?=
 =?us-ascii?Q?wtys+UkQhhsQWtMGo/AX2GrmqI6B/xIwupk76bywn62mw5Tg8a3ErgMwxbVy?=
 =?us-ascii?Q?ryICibwFyFpa1spazLfdRgHBkwfCME9lof5fjgcamc2Aj4IinWg1SgFxgUXH?=
 =?us-ascii?Q?2Z96YtmaFrCFPqAPfsCvaLyU5qdUpeEmp48aQLTqAZYWaRkJwTSpLEUMmIsj?=
 =?us-ascii?Q?fBL4/YqlsU4nL2Bvz2+RCNfmUmdFM3tQFU+rrxb6jCtY65xXuQVgk13wrgMW?=
 =?us-ascii?Q?Ui7j99MJzArn7tVnDQJMF7eK2vG0wcqME7TQDKeb+mytCujPOuNfQ8rTwoGS?=
 =?us-ascii?Q?osKz4XhUAqhxAsg097zRtpIdOekrZ2HwrRs+yKn2hiDl2vggPFxd4B7AQLpZ?=
 =?us-ascii?Q?LB26C2LRsVNRmpocdXuFT3gbP3e2/p8NJnxid/ZROcRbrntEOB+AX9ojNT2i?=
 =?us-ascii?Q?H+Mq8L91yjbUdBGpDKVlE18xHaEqB/Ltpzo/bL572xOLQI04REZWJrP7nRtY?=
 =?us-ascii?Q?28WZeOPUZiGMLN5ki32Y6UgkFkdzMUqJMzMU9zqGgmbAYCw0z2MQC/aVq8fV?=
 =?us-ascii?Q?PPSOANA/FpFeulhqj8//yAZc0G8hL+5eed2TYoUgQ4Ihfq278oA361vGe1QC?=
 =?us-ascii?Q?92ignwLpFtv1xGQXeiGcfo/ptkM0E3w0hhsvJb3FrGEHULkZLY7ooHvurXZ4?=
 =?us-ascii?Q?MrbEyAbRf5wfEqqAh7LhngAP2M7BdWaI98O5R1wS8A5lK2H6dAWw4I9qkMxp?=
 =?us-ascii?Q?Fkqc5GvESIyEiJ4WkYW3c0Yj0yjKMCFwb7tCpUR1tdA/dPr9w292ogZJw1k5?=
 =?us-ascii?Q?HeVwBqno8GoOi56CC6i/ddCbzWpOzoi3sy9XmZfCF8OEf6ZLMfQJjt/KqC0Z?=
 =?us-ascii?Q?AaWW1u4VhxMOfmaXQPphH5ZmSfl17T16jx5qB83Sw0mIxxv5MWn0BfHiQB/f?=
 =?us-ascii?Q?ijw8TSrpqAQ0RGBOjj5YPadT0BziomtWior4CPPf4GF9FMOy6KnWzSY3OvLM?=
 =?us-ascii?Q?dReCI6aYf1goGpspcFs5nkIOaDgUpfaDvwzvOCKV518JSSwAGeZ61Uw1WoQ6?=
 =?us-ascii?Q?ffiJ+8nP64xYrdr5WkJAMy/3PgJBhSZEVVryUFGpxLSpog6D65WDVdH+OKWa?=
 =?us-ascii?Q?ktwhzurc6XCOTECZSNLxbmLDJMKd2ZRJqP1Fg9tptbRSM5tvT56QkhgGqG1o?=
 =?us-ascii?Q?F08oi7BGOpDQUli7/OS0Hpo=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd528f8f-75fa-4400-5a95-08d9fc59a9d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:33:48.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0kIkL8uIfo8dmsxf4BLbHO/NY7VSzEUH9Jfy4b/uFYBo7/iLwz/YnQu7Fq15HkySIHWjRZipRlON1sK0zpM2Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 14:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162612

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The systemd init manager support mount point configuration via mount
units and /etc/fstab. 'Mounts listed in /etc/fstab will be converted
into native units dynamically at boot and when the configuration of
the system manager is reloaded. In general, configuring mount points
through /etc/fstab is the preferred approach.' [1]

Read mount points from /etc/fstab to determine dynamic mount units.

[1] https://www.freedesktop.org/software/systemd/man/systemd.mount.html

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/classes/rootfs-postcommands.bbclass  | 38 +++++++++++++++++------
 meta/lib/oeqa/selftest/cases/overlayfs.py |  4 +--
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index cd8986d8a9..e1276a220a 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -376,25 +376,45 @@ rootfs_reproducible () {
 	fi
 }
=20
+# Perform a dumb check for unit existence, not its validity
 python overlayfs_qa_check() {
     from oe.overlayfs import mountUnitName
=20
-    # this is a dumb check for unit existence, not its validity
     overlayMountPoints =3D d.getVarFlags("OVERLAYFS_MOUNT_POINT") or {}
     imagepath =3D d.getVar("IMAGE_ROOTFS")
-    searchpaths =3D [oe.path.join(imagepath, d.getVar("sysconfdir"), "syst=
emd", "system"),
+    sysconfdir =3D d.getVar("sysconfdir")
+    searchpaths =3D [oe.path.join(imagepath, sysconfdir, "systemd", "syste=
m"),
                    oe.path.join(imagepath, d.getVar("systemd_system_unitdi=
r"))]
+    fstabpath =3D oe.path.join(imagepath, sysconfdir, "fstab")
+
+    if not any(os.path.exists(path) for path in [*searchpaths, fstabpath])=
:
+        return
+
+    fstabDevices =3D []
+    if os.path.isfile(fstabpath):
+        with open(fstabpath, 'r') as f:
+            for line in f:
+                if line[0] =3D=3D '#':
+                    continue
+                path =3D line.split(maxsplit=3D2)
+                if len(path) > 2:
+                    fstabDevices.append(path[1])
=20
     allUnitExist =3D True;
     for mountPoint in overlayMountPoints:
-        path =3D d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
-        unit =3D mountUnitName(path)
+        mountPath =3D d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
+        if mountPath in fstabDevices:
+            continue
+
+        mountUnit =3D mountUnitName(mountPath)
+        if any(os.path.isfile(oe.path.join(dirpath, mountUnit))
+               for dirpath in searchpaths):
+            continue
=20
-        if not any(os.path.isfile(oe.path.join(dirpath, unit))
-                   for dirpath in searchpaths):
-            bb.warn('Unit name %s not found in systemd unit directories' %=
 unit)
-            allUnitExist =3D False;
+        bb.warn('Mount path %s not found in fstat and unit %s not found '
+                'in systemd unit directories' % (mountPath, mountUnit))
+        allUnitExist =3D False;
=20
     if not allUnitExist:
-        bb.fatal('Not all mount units are installed by the BSP')
+        bb.fatal('Not all mount paths and units are installed in the image=
')
 }
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py
index 82007fade7..79d36fa93c 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -61,9 +61,9 @@ DISTRO_FEATURES +=3D "systemd overlayfs"
         self.add_overlay_conf_to_machine()
=20
         res =3D bitbake('core-image-minimal', ignore_status=3DTrue)
-        line =3D getline(res, "Unit name mnt-overlay.mount not found in sy=
stemd unit directories")
+        line =3D getline(res, " Mount path /mnt/overlay not found in fstat=
 and unit mnt-overlay.mount not found in systemd unit directories")
         self.assertTrue(line and line.startswith("WARNING:"), msg=3Dres.ou=
tput)
-        line =3D getline(res, "Not all mount units are installed by the BS=
P")
+        line =3D getline(res, "Not all mount paths and units are installed=
 in the image")
         self.assertTrue(line and line.startswith("ERROR:"), msg=3Dres.outp=
ut)
=20
     def test_mount_unit_not_set(self):
--=20
2.30.2


