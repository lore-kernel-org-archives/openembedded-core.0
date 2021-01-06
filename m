Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.82])
 by mx.groups.io with SMTP id smtpd.web10.6518.1609932220114402265
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 03:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=brh0TS2B;
 spf=pass (domain: kpit.com, ip: 40.107.138.82, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L32MycaYtSgedBB1D8jGZXB7/CS3nihTLLiInajgx8NcEz1YSsk8wnEZd4sDFuWBEC4mRGsGttqbSgs8VhxHDz6Up6kVl5+ApG6oPeYoyae7Zt4M2J0xA6MYxXDkh7nMh6haB2/PwKHNlUpCrgbbeVpDecBxCryrjHFfs584UK7F3GV/3adbNRwzFjAEQw4KMSBDgp4+EHXix5u9mSSo81RD8hh/t5FSg+8z+QGchLjZa+1zlIT7Jhh5XPlHXQx5bBYbjg1jMw0RNMrddMbs9PvmVVsf+Dpya4xgjwPCjGjvXZiikwR8ogXBMkIdKwSfX0rlcfwHuIjRsY/i+VyHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWNVG5x6tX42UWaSzWWe/+uOgjSDo+zW11fwp42/94k=;
 b=eMncX589HnQjXl99XZVnGnh7wk6qyr1yV/uP60c5AIqeC2L6SagIUHIVs0FHWAvz3ky43mJ2sUy/hSHm6lUsP3qKEval8rop1yl19b5ke8/ljRvvwcF0cZCHdbgmVcPGOj3UQwRo96geKo76H6WPO80zklgPsVDAnPNfmrE36wtrj61FT9vpjsYIxSwwGaiCE8qRr1h1RP6ICpxCfPc7qCuFtVCh8zhctxiK+7qfF1sapQXrPB9XCa8froW5ooY7yqrjOU2XE34c7/FuzhPbW0+GNLG++P+Z4caNmFWw6/azKgWcabX0MwDkl/AWKWt56OwtLWBmbvAkEgMe0j5Gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWNVG5x6tX42UWaSzWWe/+uOgjSDo+zW11fwp42/94k=;
 b=brh0TS2B0xhNjI9npyzzuOc5WQ4YeV86Nluf2zEWH+aOTURZ3XqxyZlprpe0Hs2vsnwgLIWWvoRkxlR+YbEzyQWQklP4mCnD9hSffmljI2W7Qr4HV7/u1bCvecbgAqSAcrUfJHH+xXrEErNaJnWS/JE+7WatEHbLr3Ge2Y6YW/o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB2680.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 11:23:31 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 11:23:31 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com
Subject: [poky][sumo][PATCH] busybox: Add fix for CVE-2018-1000517
Date: Wed,  6 Jan 2021 16:53:14 +0530
Message-Id: <20210106112314.30270-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: BMXPR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::29) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by BMXPR01CA0089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 11:23:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c26f9bb8-b254-4587-bead-08d8b2357f4f
X-MS-TrafficTypeDiagnostic: BMXPR01MB2680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB268062EF75652D84539F39F9F2D00@BMXPR01MB2680.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T1NkjXFVP+ipBNu1VwkssrNfz/e3c7XHDGTnh0yFBi7I61nVgU/vYRc87R2BrS+Og9hLIxV5dbuDG48qWGdcsfhaS2Yod+50wJkoxRH2xIqvX7SoqucfHSJfauwy1erYLOs0XNZw8r14PSURqR3MG2jajF7Q7f8q62ystjn4z62tY1gC4UIPvEJfLLIt2H1NatUeY6/Jt3SpaTL9eJRpQvzx4/29IX603tZ2DXT8O/p31Y89YyrJuTvF+nSd+/eopMTmarEsiuTnshXgD7Vl4YQw3/i0/lGkG8qVK8OEHtUePCLmVhj6AfgcHUryivfryljefCKWDy73r+MfEfAK7xOMRhK0kvPXEM5cW8h1iaaNrHd0cIWksMpMAmlciyK+mAcWtCVUohq3rSBi9LtMgByi25Ixqw/tvlGURPIDl5aoYq+4rcDpzx2LZdX14wKcAdbEB/vWB41OeCsArchtQqgpdQR54MIUCgOv4ccMFbKkzxO8UtZrIJ07EFaElgk2nUm7st7hTjWKSoNXynViFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(6666004)(6512007)(2616005)(2906002)(5660300002)(956004)(107886003)(26005)(52116002)(6486002)(8676002)(186003)(1076003)(16526019)(66946007)(86362001)(66556008)(66476007)(36756003)(6506007)(966005)(66574015)(478600001)(316002)(8936002)(69590400011)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PoYaYvAeYrlatokZQ2AldfD6+0Z9ROuwShObk09kRjntXeSzFg6nnZ+4uklB?=
 =?us-ascii?Q?KyXgbLmUuUx1yrDrOapx4dJ1UZa9QkIVknrSRW5fO9OrlCdrVRMyEw0wUAud?=
 =?us-ascii?Q?fF8dpS3HaEspfU8LxzayWOidqM5ox+2WOEpGMfr+G9t0jJPnwkkIqsfo1+LC?=
 =?us-ascii?Q?RZ41PModCwAgbe3ZvONgbn/ezH2mpOfF8xj9sgVCuC2Pc+DTdRMOgzWDbAoG?=
 =?us-ascii?Q?Qf6ETjQ2EcYEfVgfura3djLLFSVaB+QX7ff1jBbDVKr5sywGn7VTJBpt6lij?=
 =?us-ascii?Q?B8IUlbC6sjonJRCsF5sNo72LV6vqmr9Trdpwh3dfMDEQHbLB4eEIfEriJ6f5?=
 =?us-ascii?Q?peKawLrtvoyJNlCRWmljQe76MCbbczJGYJ/T1N47PZUglr1/Z4LXBpFKv9mZ?=
 =?us-ascii?Q?j89/bEIoLwUYkKCXTIBNw/5goFXXYb7Vuc4izYXObY/kFwgtWYjNWfV1ROGV?=
 =?us-ascii?Q?2hfsXKaSz032q1Y5Jqf4uZHtwZF47rYqU6PX3woQXkaX4Gu+mCf1UEeAoZXX?=
 =?us-ascii?Q?4m8mtyRMuLbhAugJi4Yf+HmEr0N6E9YFGug8Li3fypYDFhvwwSanMfCDDGLQ?=
 =?us-ascii?Q?KxunjVKqZWtswhuA83BAnTpP1VM/tdyydW1geZrVmk0BwLmQijjhtx7jiBNR?=
 =?us-ascii?Q?236y1CaC+7aMYwIVIvokvK7Hh2RI7wIkM++2E6A/qNZ4OYyLP5a6cmuiOc3Q?=
 =?us-ascii?Q?WapOrBrQ6wmEtxGZX7pIgvdyY4Qxg1JOVOCabTI0wjWz+1xTBZYE2BRcrW4+?=
 =?us-ascii?Q?TGQi3Z8v34I35hAM4bFJO8fYfyQqRpfWcImbqr8Ay1RnDyB9jf8914AQQemV?=
 =?us-ascii?Q?JbP8o3AN5I1vwQgzhf3peabXinGvDRahUP5mQUl+2QEROJ7J7kCNOzrLG5n9?=
 =?us-ascii?Q?fTgVm53DAEUmhmUFqE/tbXXoDz8tRGr+mYJ1u8oLfwTDPBim4iWzwDccP+xR?=
 =?us-ascii?Q?d6opZREhK9qYefWWYi40yRKkxyBqq6GxF/SBxjQWsJ1PeG2jWnnFwmw8YM79?=
 =?us-ascii?Q?+1m1?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 11:23:31.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: c26f9bb8-b254-4587-bead-08d8b2357f4f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFWwFnE/vJGLYU0AkXBAqK0k6vPuQGE2n5tH2Baf6NemCRwUwvyeeWosrQPU2dYd+aT9qqZ+tI0MqPoBX3SbQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2680
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied patch that Ubuntu applied to busybox 1.27.2

The patch is available from file:
http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubuntu=
3.2.debian.tar.xz
in path debian/patches/.

The below patch is added:

CVE-2018-1000517.patch

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../busybox/busybox/CVE-2018-1000517.patch    | 56 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2018-1000517.patc=
h

diff --git a/meta/recipes-core/busybox/busybox/CVE-2018-1000517.patch b/met=
a/recipes-core/busybox/busybox/CVE-2018-1000517.patch
new file mode 100644
index 0000000000..8b1eb3d45c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2018-1000517.patch
@@ -0,0 +1,56 @@
+Backport of:
+
+From 8e2174e9bd836e53c8b9c6e00d1bc6e2a718686e Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 8 Apr 2018 18:06:24 +0200
+Subject: wget: check chunk length for overflowing off_t
+
+function                                             old     new   delta
+retrieve_file_data                                   428     465     +37
+wget_main                                           2386    2389      +3
+--------------------------------------------------------------------------=
----
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 40/0)               Total: 40 b=
ytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+CVE-2018-1000517
+[http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubun=
tu3.2.debian.tar.xz]
+Upstream-Status: Backport
+---
+ networking/wget.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+Index: busybox-1.27.2/networking/wget.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/wget.c      2019-03-06 15:03:11.4472803=
36 -0500
++++ busybox-1.27.2/networking/wget.c   2019-03-06 15:09:58.757358868 -0500
+@@ -642,7 +642,7 @@ static FILE* prepare_ftp_session(FILE **
+       if (ftpcmd("SIZE ", target->path, sfp) =3D=3D 213) {
+               G.content_len =3D BB_STRTOOFF(G.wget_buf + 4, NULL, 10);
+               if (G.content_len < 0 || errno) {
+-                      bb_error_msg_and_die("SIZE value is garbage");
++                      bb_error_msg_and_die("bad SIZE value '%s'", G.wget_=
buf + 4);
+               }
+               G.got_clen =3D 1;
+       }
+@@ -925,11 +925,19 @@ static void NOINLINE retrieve_file_data(
+               if (!G.chunked)
+                       break;
+
+-              fgets_and_trim(dfp, NULL); /* Eat empty line */
++              /* Each chunk ends with "\r\n" - eat it */
++              fgets_and_trim(dfp, NULL);
+  get_clen:
++              /* chunk size format is "HEXNUM[;name[=3Dval]]\r\n" */
+               fgets_and_trim(dfp, NULL);
++              errno =3D 0;
+               G.content_len =3D STRTOOFF(G.wget_buf, NULL, 16);
+-              /* FIXME: error check? */
++              /*
++               * Had a bug with inputs like "ffffffff0001f400"
++               * smashing the heap later. Ensure >=3D 0.
++               */
++              if (G.content_len < 0 || errno)
++                      bb_error_msg_and_die("bad chunk length '%s'", G.wge=
t_buf);
+               if (G.content_len =3D=3D 0)
+                       break; /* all done! */
+               G.got_clen =3D 1;
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.27.2.bb
index 716a0650fc..67ba7fe423 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
            file://busybox-fix-lzma-segfaults.patch \
            file://umount-ignore-c.patch \
            file://CVE-2017-15874.patch \
+           file://CVE-2018-1000517.patch \
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
