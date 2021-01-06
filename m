Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.85])
 by mx.groups.io with SMTP id smtpd.web10.6508.1609932128296592984
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 03:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=LJj6JBoe;
 spf=pass (domain: kpit.com, ip: 40.107.138.85, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YswoDBB2ycwVsGJ0m4GWV+k9bU6EsIGHIe8Ub2v6rnpOQPiH2iKA5x/JrczkyoDuKYedvZmK0WFA02ukzIgzNLHLI1Xq+WoD75gt0sWHJh6o0zLzNXXDIk/sID5eeddLs8bOfCKM5C3Bs4WXjqWSnyxjulknrXjNExiaFXclfKeS1xbjQ/GFcA/UMIRaaFp51I+cgMMHEjElnFCQxh+5fJT60NBpzRtnUewAHarDt8oxZizg746RfXtfXzBiBdd+ZW7evZMH8STYGEOUF0xO9Svy0HkT6rySLu+VPcBUmVk8pxAK3qV8GEsjb1LnfVPmG8oW7S9cc+EJLU2i9RzW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6rxzwFryM93DP0VIxlw8wgqhdy1d2DCxtLYfaRJ/Xk=;
 b=iwDTQpR6on+7BhJ0qMWqEnqypqsgWPlMz2d8XWIPHZe7FnqKUb5or5uQFH4WdV1/SwgJkzZIyaeRkW4HRLx4LPvkYrG7JCoEasSPiyw8ZYF5h/Rtf30NepOJjqQJE2ibU4BQfnFMS6C8PQBbQZ06uquyi82KoIaIYyxSW/3PaRN6teDJpUBuivF35y5ZmT/QKHazHhz+mOcm3Jww6yiPRXsmk7OlPcJMLrwTQ1QFjfF1MlGGm5o9Uxqq++JTLMVzCdq4MVmyIsOS+wTkd6WN3uDjutCJB24yGh3qIdI066jZUfexeOdJfZt1muvNRISodHNGnwar9d9xB8cyV4VaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6rxzwFryM93DP0VIxlw8wgqhdy1d2DCxtLYfaRJ/Xk=;
 b=LJj6JBoe32qN+Z21S/2920J5AXFltVSqicvISKoRHZ12aXZS3H4DQEel5Rl2e7umRFUgFipL6cPrNkqJo3bSIuE68KpUh6Iw8rCRzPuWx9lzEDF0okESfrjVi27bvJ+QBOYOmzDcXBj86BDTuHbzKE19P8l2pTVC7nFtxTgXdWg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB2680.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 11:21:54 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 11:21:53 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com
Subject: [poky][sumo][PATCH] busybox: Add fix for CVE-2011-5325
Date: Wed,  6 Jan 2021 16:51:38 +0530
Message-Id: <20210106112138.30153-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: PN2PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::18) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by PN2PR01CA0013.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 11:21:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca67affd-16ac-4b1e-d661-08d8b235454b
X-MS-TrafficTypeDiagnostic: BMXPR01MB2680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB2680923FA51BC134E6A0BA84F2D00@BMXPR01MB2680.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QbDfi6bQYwz50wUL4frqCUJzTHgDo7FseTGYKLEuckcenl4jREjW70j2Q1PAQ8eKdQyEWMqu2qZI7Tznl7xQd7NbxgzGVzypnKJa4V6IRG76/AYGfp68Ixzmq2qG8BByHvquXeZwdSiD/usbIvO9pmW1DrZLRZzZ3Axz/qeaTivTM/eYI36CHe0cdF5AKXFSaZsuFakx34BAJ2zFm8nCGWKS8vQ2IyEgJYQDQ4LUnY4WJWRq0vnKvBgn+j7Tbs1MjyeUBZj8V2LbES8TUCDnn7rpthN2iGFPOxmC3oDhcxwx/CddJDjxrEkPibyrrhVGdhrOc2wuTTmK6HpSfAYFGVYCjHt8CBFAk0O1nVlSxpccLTxMxzrNdMqJlG5+dkCUaPDL0tCSJiRqviP+qfzMFd9lhpB56CfrndOelcniAnjue8ffTVHLad2/amFYHEEAwqBuSwfU4knnX2aUdPC/oGfHtUHDTwz+cuMJUN+jYY5gesJxYcpzKA0CD2Qe7KEKMRtPEleqQTIdZbAkCibqHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(6666004)(6512007)(2616005)(2906002)(5660300002)(956004)(107886003)(26005)(52116002)(6486002)(8676002)(186003)(1076003)(16526019)(66946007)(86362001)(66556008)(66476007)(36756003)(6506007)(966005)(66574015)(478600001)(316002)(8936002)(69590400011)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Fjn5vGvkKF/1kPbo30WoMjt/yvfWrMQ95OhGQJS/Fu2D3vy9/gipaajNLAWA?=
 =?us-ascii?Q?tok1xZZl/ExaxCdESQM8gKljhX0UAcIXZx7vOwuDobnLeOtZjgfa0AHuygnz?=
 =?us-ascii?Q?LOtCstDGEzOceeeMvc1ljBSFK7X4QEuP/sxvQjUiykQNNRHpvEy84gN7hWvd?=
 =?us-ascii?Q?tk0FB7dQMtrboF+Z/wLPZPiGVlZ0HNXFQM4JI+X9o0Wu2mx7c7OvcTGMv2Dq?=
 =?us-ascii?Q?hxoX8JvHiu+NjPGJb5igqAmc56XfAQwsFRzcL7PiEIYokFUP8W7JaKyLH6t9?=
 =?us-ascii?Q?NMmGoENug8o9OYGm0I6o8mkkjj62vFW8KVTAS7FVxwgaZzTGzYzQNO+qqYgd?=
 =?us-ascii?Q?WdAE9wCgAsmZgoBQBx3YaPSswhEpOsWD1fYO0I1t7dcsycq9RsoK8vPFLQkr?=
 =?us-ascii?Q?kQoy/2rVayJGcPmLWdyUWy5HjGNAGdxRJwBia91tMrYjvIBTKhzYV96Qk99s?=
 =?us-ascii?Q?EMS5i1uIgpbIHwwcUB0K+nUbDc6m4sAAWGlDYegGLH8ojyNXLc+Jmm4Z/1yp?=
 =?us-ascii?Q?Y5cFPxYFVmbIMIA+iQKejfGQK18O9oOSadsv9gQnUosVEAbFk2CoiFjfiNiq?=
 =?us-ascii?Q?zkGOHd9t27o7dMU2tBXC4a+gExR+PaThCHkqro1IBbOs+0Ed2ClKR7Kyc2Oc?=
 =?us-ascii?Q?AKfU9dnqynGN+cULn3uGJLBeKspQ3M2Fmea5lOcgQHYcCrEwlqiIj5K/pgex?=
 =?us-ascii?Q?mWSihSOlurytoaNx+AFNpNegZ4PEZcgMqvxoi3XqYIC28+XjpqEzTsAuovGI?=
 =?us-ascii?Q?e21IxofXz2tsV36v1p99ncTWGZPk1KLShP+9bUAJSmSxQJ2wJnBVFoP66DGf?=
 =?us-ascii?Q?OrNJoWS+VUG0VK8tXPKTAwMh8jCJaGfqXkDOxrqluoXrmkG+YdIUGRJSJ+rl?=
 =?us-ascii?Q?fhlWgqg44EEvBug2XXXYJirRdL0PSdTdCutxWZG9Tr0Vn/RF/e+IvbgZtAMD?=
 =?us-ascii?Q?0b4gQrTm9Ew2YmAbZrZDSEiv7T4Ie/naHZSb7NkSYM+PtMbDsBRdOUwMTvP2?=
 =?us-ascii?Q?sxvZ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 11:21:53.2137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: ca67affd-16ac-4b1e-d661-08d8b235454b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwY/KhyrY4QZBqkpHAMsnb1sR0m3wK0uM2Md+lfQmZmY0a/QqN3DS8Szw38XgH2zYYJp5J4lZlB8HYZ09NnZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2680
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied patch that Ubuntu applied to busybox 1.27.2

The patch is available from file:
http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubuntu=
3.2.debian.tar.xz
in path debian/patches/.

The below patch is added:

CVE-2011-5325-5.patch

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../busybox/busybox/CVE-2011-5325-5.patch     | 35 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2011-5325-5.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2011-5325-5.patch b/meta=
/recipes-core/busybox/busybox/CVE-2011-5325-5.patch
new file mode 100644
index 0000000000..92e0e2289d
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2011-5325-5.patch
@@ -0,0 +1,35 @@
+From dd56921e2d404c8fc9484290a36411a13d14df1a Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 13 Apr 2018 13:26:33 +0200
+Subject: dpkg: fix symlink creation, closes 10941
+
+function                                             old     new   delta
+get_header_ar                                        434     442      +8
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2011-5325
+[http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubun=
tu3.2.debian.tar.xz]
+Upstream-Status: Backport
+---
+ archival/libarchive/get_header_ar.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/archival/libarchive/get_header_ar.c b/archival/libarchive/get=
_header_ar.c
+index 93e071c..a979706 100644
+--- a/archival/libarchive/get_header_ar.c
++++ b/archival/libarchive/get_header_ar.c
+@@ -127,8 +127,10 @@ char FAST_FUNC get_header_ar(archive_handle_t *archiv=
e_handle)
+               archive_handle->action_header(typed);
+ #if ENABLE_DPKG || ENABLE_DPKG_DEB
+               if (archive_handle->dpkg__sub_archive) {
+-                      while (archive_handle->dpkg__action_data_subarchive=
(archive_handle->dpkg__sub_archive) =3D=3D EXIT_SUCCESS)
++                      struct archive_handle_t *sa =3D archive_handle->dpk=
g__sub_archive;
++                      while (archive_handle->dpkg__action_data_subarchive=
(sa) =3D=3D EXIT_SUCCESS)
+                               continue;
++                      create_symlinks_from_list(sa->symlink_placeholders)=
;
+               } else
+ #endif
+                       archive_handle->action_data(archive_handle);
+--
+cgit v0.12
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.27.2.bb
index 716a0650fc..ecb3e8f643 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
            file://busybox-fix-lzma-segfaults.patch \
            file://umount-ignore-c.patch \
            file://CVE-2017-15874.patch \
+           file://CVE-2011-5325-5.patch \
 "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
