Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.42])
 by mx.groups.io with SMTP id smtpd.web11.2872.1617171715407569869
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 23:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eRSGyZox;
 spf=pass (domain: kpit.com, ip: 40.107.139.42, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8mgPYGSnH/h1qZRLlCgNaTkHswK31m49LvOfZ+GdMauybX3kTJx2qTPpcrR0I1u+zJUlA38VkVHHBCo+cRzhlZeqeEjqIoZnHDZYXKicvvLP6OKkg5cOnzG2iRqss158ey7RU77tZNlLkGynxmRTJubzzDNj2hoD2g7oFHEqI0BJB5MsqpwVCk5gH3au1/yvYS2LnmB4cx4S7+gXzBr7ZjIbxHAuj3GC3QEcBXXbzPefWRAGWcAn3icawmBXt0TPJ8AgSbYuvYcGDdqa3HUOUfnqSG5eyNUXrvjH4Am9jL1fBzXXcVXDKYuJFSBP1RXEnYvsDguZYxZBOSXX1BajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7xlZaOxPXNxAtHnvWkuk6J07I/h6shVQ1MpmbJj/4E=;
 b=M/Z31Vhsc9SerL89Jg3S/iEc581gS0nyZdlNk0JI56B4KvkizAw/bDbon4xz9BxpMOly9mfoy0DXX0VdDQjH8jLUbmHf/X/DQtAHYy0xS7hVOg3LvW3S+bfViOugKdC0d5HoqnpXTTsn+hgXjg5lJ/I9lf4yYsAVaM9ucy9bSJRGUx2vuB+Nn7iX7u9KoRmVGDYLHZXDjnZL3fsOSQci5+E9ospufQI1chSAKWz+Jfz0ZiqZ5BwlKu7yjnUmkXjejgzf8RuHx6dY+dZrLkSpiCXfDSXoD+xIpxNAlWsiEE8BaojOwWFCyoTR29CXNqoesAufJNeRcSxAKvFAPEOMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7xlZaOxPXNxAtHnvWkuk6J07I/h6shVQ1MpmbJj/4E=;
 b=eRSGyZoxbRAqw7uswYbrtu63OjlROvXs5mibE0OHG5r2seOiFsWMcZkjnED2/uTe/muIjbH+yJvGtasABjAs/K8EfOZWaAr51GmWp80w0YdMt2a1eAdDUmIDrn7+kR0fmKaTtXvqdqHk8/l0k2s2vxT/HAhavK0qnoaMJ/frPG8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BMXPR01MB4807.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:16::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 06:21:41 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:21:41 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Purushottam.Choudhary@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][dunfell][PATCH] openssh: Add fix for CVE-2020-14145
Date: Wed, 31 Mar 2021 11:51:12 +0530
Message-Id: <20210331062112.3925-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:1b60:9508:640d:b317:a101:445c]
X-ClientProxiedBy: BMXPR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::23) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:1b60:9508:640d:b317:a101:445c) by BMXPR01CA0037.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Wed, 31 Mar 2021 06:21:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9fb0d20-55e4-455b-0b98-08d8f40d3f74
X-MS-TrafficTypeDiagnostic: BMXPR01MB4807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB480760E91DB8C62C3412D64B997C9@BMXPR01MB4807.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZfDCpVMNO7ZY33pu3C72HV+2vhEaZscnnbx6BMI+q246fMT1YKSca8tFpuUpqkX/YUN23sbdqjAEV2cgkRsA5rohXU90WXoPZ6D+2dNwj4IoVY/KlXRoZEs9cBO9MNHlulxxoZHaz+oycRbQwz3ZLo0zzpIk/Uxw213H5PVdRQp9oR5fWGz1Vcatl8rp07pwuYwpV5SeyyNdVkFAa+kAIa5WA93FFBA5YL2ItuHiSz416gZPfH0EcpNjuperqd0x1eIB5KaPuwgNLh8B6zyuVnXtx05/qg92cQsAg85pkWuSGBnDgGR44CX7k/NRsAKAi/u5N+/zUGMq8WyyDcuSs1ADPnc381DGrrkgEt5DpjhcbyJk5XaPanIcY5w4HzflBJyI7iTbVDNrMuGvJt4W0bbu9CyE+zWJjeVgHecNOI8Z+zUcDRfVyuU9XEFplVCykKAWvS7qOdkBOB9FEKY2O1AZ0PQOwmhtwFUi2JThpFb7hqxtPe1KXag9DYEvqcgZhO+Gc0CNzYzAfhG7t3LWJOLRyhWMg6S1svdEUVjlRxZhkSpRngrBluiLQwJl70BLdmnFJQDCFXk/bAAW5rjnFnqAITA76/lqoPTdtknX10p2EsLOJcA9WvjPGRQsxT0ZUPZ7PoGawUchoHa6K4yu5MKHRIK9PzcF/+RQxb88EXNVQiDTmlptpp2yLKOpPhSlNEMr5hTMsVOSsDjo9HSCjfZ/Mk/tdwhxrl6KVn9dh2E0IpIfBzXLNxGR7MPYdAK+S0tWEQC7Kzzf02XQm4MAyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(6512007)(66574015)(69590400012)(186003)(38100700001)(2616005)(1076003)(6486002)(966005)(52116002)(83380400001)(2906002)(4326008)(478600001)(86362001)(8676002)(16526019)(8936002)(107886003)(36756003)(66946007)(66556008)(66476007)(6666004)(316002)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fwCbOpaX0XPdD+jKQO4Xb5wArmPIdsUebvF/YtRm+NEBv2jWQHjGEM/BZCp+?=
 =?us-ascii?Q?e+k0HKyammsJKzV41kO3henKuwpyV+9azloi6fC7JMxwmL6NsuUe+ILDlRDJ?=
 =?us-ascii?Q?19iy+NbtXxR7vn0CGUpL7sjphK/wtURK9Q29DllucmAs3uwfJxnRrPd2hJrD?=
 =?us-ascii?Q?6GuVnRGJMF4RJz4kcdrD4eJ/E9p8xK2GH0OUy1S3wLxQhDu3oDts4g/yEniz?=
 =?us-ascii?Q?lQzMUPVYqC/CMEIIWXrwpllJ6oxq+p+cFd6JYS6COkmgrfMW4CHuwIwlUCp8?=
 =?us-ascii?Q?2tOEmndJTC2s3sWisb7f3k4K7374BwopSzCSr1Ja3VOf7jU6uM979fRSZYkj?=
 =?us-ascii?Q?ekvucgqnsWg4MaO6+gmbJ1ceV/5mMqnXG+Rl0JnwFIDkaFFjYruxAWU8iBK4?=
 =?us-ascii?Q?xQGbVt3gg6GN0FfkSrKGEv9cdJHImoqvUoFhXozz0XeYikf3CIRnIUF0KooU?=
 =?us-ascii?Q?8/TCoa0q7vVr1j51HB6GUOplESCmE8DXJqtmNX1D9iIEAbvPF18vSrWcg1l1?=
 =?us-ascii?Q?RQeLiRsmL/E/0RYbn0YQVY3aA7WLcPrbXYwQTjZ4y+l3noOM7g7yuWHl7kt1?=
 =?us-ascii?Q?enTt0+mSlfQltAJBDiNxk4ZknYdYH1tfHhBfMPb52r6i/RXd/pJnUqhuaYAO?=
 =?us-ascii?Q?psnxrQrCsWZ3fkar8qTgA/Piwxt6mAdqcHm5WdxnDEqNL/lOtNg79284JIzB?=
 =?us-ascii?Q?ea93ORKvYHu8jlPBGKktoVDvrZ8315Adu+aRpfBHwl5j05mU8MrWxiSklp+C?=
 =?us-ascii?Q?dxV7PBR/MOyItpzXHgpQ85rlHmarsamAZc0IrFJIT/hN9HKhNEK/XIfCGLZ6?=
 =?us-ascii?Q?6+QWw1/HmG+CP7RLjFwfNAm2Pi0VZo/NIT3N1TubvkDXp1cDk9BJbixWXowO?=
 =?us-ascii?Q?TkQ7meIXMUoFc/prGrydcvIYeFy3IMDYBKjya79IaxztH2tImYhvowHHRvyU?=
 =?us-ascii?Q?H9G6mpN62g4hkOTACpn6zL2U8tkOahGGLgTRBR6ZVXFUG3At+F0zeI2i8eqm?=
 =?us-ascii?Q?vv7MYCdIqFFJGBlPjdqXtGHz84XGX7n1f7rPAes23vZMqc0V0vRjQ3gZDog/?=
 =?us-ascii?Q?1KVEUyy3VwPH2YfnAtcjE5ITOVkmw1NOoXUXlSdcb4c+mROeWrIGqn7BDdAc?=
 =?us-ascii?Q?yViEH4Pf/fiFPUwKOpqKuHoPf+hZ0qUikh0k5f43QFJBegtxJr+tafl8cwdD?=
 =?us-ascii?Q?eUIfvT59j4vmziVYEffHz9H3WTpLxfaIT6T8QToNdIun6Zkf/Ufo6s1CNRuG?=
 =?us-ascii?Q?/pGBQ+QaOrKQuigg8o5eZq9qYT2VKS9uNyr7Bi4YF0PBxBJ/O9GRR0SNB97n?=
 =?us-ascii?Q?IDHHmkZYyqEuf+CnkhIWaAVzS1BAc0jwy/n6jvh+YR+WM5Bw6ggWoEZ+1vQE?=
 =?us-ascii?Q?d2w/NyVMwxFTY5C0Hfd9LIxGdx4E?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fb0d20-55e4-455b-0b98-08d8f40d3f74
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:21:41.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2rGTMDdlLdkcgGGDL6lZ3hnnJNyrbC38Jp78ro21oF7Vmel4zgkaDoS5SQEhW3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4807
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied patch for CVE-2020-14145 which fixes
man-in-the-middle attack.
Link: https://anongit.mindrot.org/openssh.git/patch/?id=3Db3855ff053f5078ec=
3d3c653cdaedefaa5fc362d

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../openssh/openssh/CVE-2020-14145.patch      | 97 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1414=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000000..3adb981fb4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,97 @@
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 05:23:03 +0000
+Subject: upstream: tweak the client hostkey preference ordering algorithm =
to
+
+prefer the default ordering if the user has a key that matches the
+best-preference default algorithm.
+
+feedback and ok markus@
+
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 38 insertions(+), 3 deletions(-)
+
+CVE: CVE-2020-14145
+Upstream-Status: Backport [https://anongit.mindrot.org/openssh.git/patch/?=
id=3Db3855ff053f5078ec3d3c653cdaedefaa5fc362d]
+Comment: Refreshed first hunk
+
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 347e348c..f64aae66 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sshconnect2.c,v 1.320 2020/02/06 22:48:23 djm Exp $ */
++/* $OpenBSD: sshconnect2.c,v 1.326 2020/09/18 05:23:03 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2008 Damien Miller.  All rights reserved.
+@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, str=
uct ssh *ssh)
+       return 0;
+ }
+
++/* Returns the first item from a comma-separated algorithm list */
++static char *
++first_alg(const char *algs)
++{
++      char *ret, *cp;
++
++      ret =3D xstrdup(algs);
++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
++              *cp =3D '\0';
++      return ret;
++}
++
+ static char *
+ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ {
+-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last =3D =
NULL;
++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =3D NU=
LL;
+       size_t maxlen;
+-      struct hostkeys *hostkeys;
++      struct hostkeys *hostkeys =3D NULL;
+       int ktype;
+       u_int i;
+
+@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hostad=
dr, u_short port)
+       for (i =3D 0; i < options.num_system_hostfiles; i++)
+               load_hostkeys(hostkeys, hostname, options.system_hostfiles[=
i]);
+
++      /*
++       * If a plain public key exists that matches the type of the best
++       * preference HostkeyAlgorithms, then use the whole list as is.
++       * Note that we ignore whether the best preference algorithm is a
++       * certificate type, as sshconnect.c will downgrade certs to
++       * plain keys if necessary.
++       */
++      best =3D first_alg(options.hostkeyalgorithms);
++      if (lookup_key_in_hostkeys_by_type(hostkeys,
++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
++              debug3("%s: have matching best-preference key type %s, "
++                  "using HostkeyAlgorithms verbatim", __func__, best);
++              ret =3D xstrdup(options.hostkeyalgorithms);
++              goto out;
++      }
++
++      /*
++       * Otherwise, prefer the host key algorithms that match known keys
++       * while keeping the ordering of HostkeyAlgorithms as much as possi=
ble.
++       */
+       oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
+       maxlen =3D strlen(avail) + 1;
+       first =3D xmalloc(maxlen);
+@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *hostadd=
r, u_short port)
+       if (*first !=3D '\0')
+               debug3("%s: prefer hostkeyalgs: %s", __func__, first);
+
++ out:
++      free(best);
+       free(first);
+       free(last);
+       free(hostname);
+--
+cgit v1.2.3
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.2p1.bb
index fe94f30503..17965557a7 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patc=
h \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff=
8bcebdff64e671"
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
