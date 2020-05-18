Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.94])
 by mx.groups.io with SMTP id smtpd.web10.40178.1589801792558201907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 04:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=APyZKR4C;
 spf=pass (domain: prevas.dk, ip: 40.107.20.94, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScWR+FkQAXm0q1m0EYsIWlKd3aHJcIzN1t6mqlpKbn+SyhzCelT5IpHl5iApDX6ynSnXCxhz96lTKvISbkYszWjLnCIyaThFNr1YQqzM1NP95ZRCDurFOL3U36M2/ue3WcdTgF4WdNizacMXfOx3xGQks1NRe+oNWKVkqOlvlAyvOGFYGk8sysWRai4481ChzszHDrUkRnARZruvSVbsEOzVkXwnn/YCyUUUGMLPd4lPlMAjAzcYuOtn68Ee5CGm2xVoNIMiZ1lf1mI8uDj1XivF0CHM37zivrsV47vOMWavCbKgddHzHzIKQQKkkXW5zNkCEJT20gWd89vDHLBCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=027BxPT5dsRHEdO0te7+2LoKklHyYltmKOZmP3fQXE4=;
 b=du83hFmXap1yiaQNFw1LvJlXeCtafgFIhEETin5Ldl6ilXhysrGKmf000oXpW+J3u+2G81Cc0E7Kk1+Agv+AtLGLLmRpDVqocM0q5q4h/8jGvZSrdLjitrn/Z3/VErTVANnrVgSZ6pumyO4eqjCC+tlvaqSSuMj6Fiix47Fw8Y4XzYvvDfYvKlp17Ema+Oh6AZKPn6jkVW1dpg7Qbg5EXx0fsdgArvNU7xHFRc4A8jWwhXwSyW6CKU8yCG8m8MhLrXFdU6mdcP82eFI1kFLFVrZ8AYdLVDEl7kxwmuKhZwKkPuLkPD5vozMUNa/i7OCMrBcpUfaU9ZlhdtSxxjU72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=027BxPT5dsRHEdO0te7+2LoKklHyYltmKOZmP3fQXE4=;
 b=APyZKR4CFP0A7WLbNsi97rPwuzlECIz06Wyrx9cB1QhJO7QMT9vcKX8lp3lbDreuf8a5J+7x/at0hRHiSDkk8IHEyFW2RHJM41ClEuNjGHC1u1cq+I29MqmTA1Efrcb7ROX5TBK6GZdFnlpvKIoENElrBwrxS90s0/PFi1QAP08=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB1807.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:802:36::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Mon, 18 May
 2020 11:36:30 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3000.022; Mon, 18 May 2020
 11:36:30 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] glibc: move ld.so.conf back to main package
Date: Mon, 18 May 2020 13:36:17 +0200
Message-ID: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM5PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:206:1::42) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.116.45) by AM5PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:206:1::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 11:36:29 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd011290-4230-4c2d-534f-08d7fb1fb55f
X-MS-TrafficTypeDiagnostic: VI1PR10MB1807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB1807812572B8E3367628CAB593B80@VI1PR10MB1807.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+7nOKxhLZhBtQFzocEgIgutledzPb3RdygdWT93RCgVn7w3dlSALCdrCIyRHsybRkMIQUG4nSmd1h6p6Tmxqq779rwER1a5oS+GVi4xp53f8IIJjajCOv5e6k/8tnAYNd3RFoqsmiCNDKN2lt4OCSLKBfVyuhWTe+xr8bN3MdEjXP7SL3Y4+Vye8Y7S9V0p7RFcAFDd+YugskAyFPjyauoLFaF4zf7+fvncu0ed6Zl8VJ7a+ES5XpXb8X3TyxyIWVhaBKZqBo2APyRmSqAfwTRMaRuG1EH7GdIXFDmpZMRzNZSZFMeFJH2Er2UpyMIeu2drKpHvIwIsjqk7e2gw2jwuISSau431ABxGogqn5Yi65vZBW/2Talk/f6/jmNfK40YojEyoVD69rzXCkFGU7GrCRlCJMXGGKxy4L4m5nzjMQTbVxRBleyfnAtkk3gt/8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(39850400004)(396003)(366004)(66556008)(66476007)(66946007)(6512007)(86362001)(4326008)(6486002)(6916009)(107886003)(956004)(2616005)(44832011)(16526019)(6666004)(478600001)(26005)(8936002)(8976002)(54906003)(186003)(1076003)(36756003)(5660300002)(2906002)(8676002)(52116002)(316002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	UIe0uUbovyIwVbYrDgqKPVqo9/V/geUBEU1miLM5Eji0WLn/E6x9IVr9AykCcBwV0LbdqBlgI8jRTTrnv4o3OUcAQPi9NgOW9wjbJUmZd37iSJcNWglnFPrG3kbeKGjH65kuokkXx84ISisAtAnCONszyynRrKUgqTrkTmnzrtq54m7zike/WEKcWyZEicxBiCAqea0OY0hjyX1f19RKlraQQnb5kH6k39whNYmPSB0VQ4phzGMLxtQKgI6WiVThvhm7fv3uuwOzfid6ju2dcPvfbUe3EhcMA1ZaTi29k5zsLRA5fw/EPJKDNqnLDYl3M7oYue/k55k5Or7zbK4kSMX8omR+jpFy2BjOGEs99bveetPAg/gDcNtk5s8J9tyOaP7w0X5kY7VyiQemw9RZwGPS8UG/Cpe2eMrY4/NkajFZKXdBzcXoOpyFNgy75eBmuiK9FgMDF+rsfGlm4psF0JX3wy9E38nhK4fAbb9LKxk=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: dd011290-4230-4c2d-534f-08d7fb1fb55f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 11:36:30.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnOeSCiya54oS0frf52loZuWroFWeq7rfJ4eJR2crkJkluRGzXcLEUPt1yvSdPHA0laaFajY0wTlT4b28IS8UxDEBEyc0nbeLZBc9cqR8do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1807
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

There are cases where one doesn't want ldconfig on target (e.g. for
read-only root filesystems, it's rather pointless), yet one still
needs ld.so.conf to be present at image build time:

When some recipe installs libraries to a non-standard location, and
dutifully drops in a file in /etc/ld.so.conf.d/foo.conf, we need the
ld.so.conf containing the

  include /etc/ld.so.conf.d/*.conf

stanza to get those other locations picked up.

So change the packaging logic so that there's always an ld.so.conf
present when the build-time ldconfig runs, then delete it (and the .d
directory) when they would serve no purpose at run-time.

While here, fix a typo in the bb.note so one can just copy-paste the
line from the log-file and redo the command.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/lib/oe/rootfs.py                     | 11 ++++++++++-
 meta/recipes-core/glibc/glibc-package.inc |  4 ++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index cd65e62030..0ff4278d15 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -297,9 +297,18 @@ class Rootfs(object, metaclass=3DABCMeta):
=20
     def _run_ldconfig(self):
         if self.d.getVar('LDCONFIGDEPEND'):
-            bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new=
 -v")
+            bb.note("Executing: ldconfig -r " + self.image_rootfs + " -c n=
ew -v")
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c=
',
                                   'new', '-v'])
+        # If DISTRO_FEATURES doesn't contain ldconfig, and the
+        # ldconfig binary hasn't been pulled in explicitly, remove the
+        # configuration file(s) from the image.
+        keep_conf =3D bb.utils.contains("DISTRO_FEATURES", "ldconfig", Tru=
e, False, self.d)
+        keep_conf =3D keep_conf or os.path.exists(os.path.join(self.image_=
rootfs, self.d.getVar('base_sbindir'), 'ldconfig'))
+        if not keep_conf:
+            sysconfdir =3D os.path.join(self.image_rootfs, self.d.getVar('=
sysconfdir'))
+            bb.utils.remove(os.path.join(sysconfdir, 'ld.so.conf'))
+            bb.utils.remove(os.path.join(sysconfdir, 'ld.so.conf.d'), recu=
rse=3DTrue)
=20
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=3DTrue):
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc
index aa8e059216..387e90a0ab 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -23,9 +23,9 @@ ARCH_DYNAMIC_LOADER_aarch64 =3D "ld-linux-${TARGET_ARCH}.=
so.1"
 libc_baselibs_append =3D " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', =
'', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
 INSANE_SKIP_${PN}_append_aarch64 =3D " libdir"
=20
-FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/*"
+FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf=
"
 RRECOMMENDS_${PN} =3D "${@bb.utils.filter('DISTRO_FEATURES', 'ldconfig', d=
)}"
-FILES_ldconfig =3D "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
+FILES_ldconfig =3D "${base_sbindir}/ldconfig"
 FILES_ldd =3D "${bindir}/ldd"
 FILES_libsegfault =3D "${base_libdir}/libSegFault*"
 FILES_libcidn =3D "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*=
"
--=20
2.23.0

