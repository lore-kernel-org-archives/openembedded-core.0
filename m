Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.114])
 by mx.groups.io with SMTP id smtpd.web10.7137.1591091063360346988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 02:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=LZdTi1zG;
 spf=pass (domain: prevas.dk, ip: 40.107.7.114, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=froNOgj9PE/fel0+2oLPnpw2lMiy17Xi056GSQAPwUgesgngSGxbhlplmPcpLG/XZ/h29VDoC1OuvtdUUOrPHqSlSqkzf+vfYvSVqOk2h0Eaf1o4KO7oDEopMeBY1zQLxVC8UkhopmvHIc7svNU1a9qqHAzH7nxhfPkBjKvvoC7wt7uLjI3E4EQvkmRR/ZejqWlfrXJIp6xfIq+7zRyFx1e7hLKn1RgFP/GVTrIh/84gBiQRveU1pI2wOYfasBnS2xM7h+0h6PCAfzGjxQZLcKQW+lhtXw1V5ymDmE/LTCCiT48fnNJAZl4sinhCrfoN29IjypDhgwe9wqW60Fv9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qZzCmR/bMRD23IOLav1tBQ+xuPk1xIsGhwSeUu8HSI=;
 b=ZeVPTT60ryp1iX1+Tn29yGHAdzoAICZWV4c/QwElCTPFuXid2EJBNpGetnp6lqN8T60OZVKTp11cdN41IYZOEuHrXApMsUbsumdmCcjfu/Zb3lMAoWH1Odtx80894OOvSvxku2NkAqZKmD6yhgvjNiAL6diDWpaxwSqKTVCpc4ikB5uUThuDJ5p1WQsAVo6wZrpCuN0R5EFo8zHFASjCQT1cSSCwQakGKfH5qlXviD08iuUr54s4c2yy5Y60mf3BJV9SzsQHREVxnWhSSn0WpR+MeOniqeyo1ykoPXrEYLlT9/i+u0TY6Bg6elTIQnOLiHlbUF9aowkaha2/sgtnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qZzCmR/bMRD23IOLav1tBQ+xuPk1xIsGhwSeUu8HSI=;
 b=LZdTi1zGOwoINxAkubs+uPLXAl7I67Z/stPnyA+TsK+ApqjQ6ACSpZpo7NGYqrY4VdjAAH3PGfkqlRe0hkCfuDZPrJFHvk/st/HaaxjxWSCQ8uyqWiPHSywqH9UIVAvBgbu1rx1wnIBPTApeV5KaiNmDjr5iXFQcBk+itMzmnis=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB2367.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 09:44:20 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 09:44:19 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	Phil Blundell <pb@pbcl.net>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2] glibc: move ld.so.conf back to main package
Date: Tue,  2 Jun 2020 11:44:08 +0200
Message-ID: <20200602094408.4893-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200518163628.7984eb9d@opendreambox.org>
References: <20200518163628.7984eb9d@opendreambox.org>
X-ClientProxiedBy: AM7PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::14) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.116.45) by AM7PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:110::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 09:44:17 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f65ec33-07e7-4de4-1502-08d806d98551
X-MS-TrafficTypeDiagnostic: VI1PR10MB2367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB23673B66CBDE662884B65C68938B0@VI1PR10MB2367.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Foiiamn81x9DIb2bmtJSdRAlOoitIgrz6Dhfr/lqnEUW4APUTegIUnHc9n+vRiD3OJDeeArwt4C66n1WeQgMbxp/2DKO3osMo/Wbmj/zuI6Mngm3WhHSaSC47HxSyjIYkwsGXSE2tYCVW66OJ9BY2y3QXQXwJa2Nq2ZJMVhsIzG6zSUmEaL2RoNEMtZbRi3JaTRFcv1M85uivPHC7AnZbVDg1lCOfniZpr/ELRTI8h0k6QNMrzijtsD38glOQT9Q0CrHxukBLyaQ6G1NBvo5TGxh1z69MnS+QaccgrlZpGfuHKxW4TF5+At+m+HaJ1srLPZYc/XP7v39W0cxhNZHHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(39850400004)(346002)(396003)(136003)(54906003)(2906002)(107886003)(316002)(44832011)(956004)(8976002)(52116002)(6506007)(6666004)(6512007)(2616005)(5660300002)(6486002)(83380400001)(1076003)(4326008)(16526019)(186003)(26005)(8936002)(66946007)(36756003)(6916009)(86362001)(478600001)(66556008)(8676002)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	AvI+xIn1LwtSql3VKLFAVCh71U2NmxCgETfbCgE3wKsxOoclEKvDMOHT1uccMZ35tvYP/nxKGw45zY+s0CkjApJyulmWGt+gLDYav8s1iEAv0TAK3CCpvvnCUhRJtiIq0Yr54Y9F+w8h72u/ZMK+63zvrvsQsUt04eJ9G/wl2/3LUlIDWiTApBC4pIf4agA8Vn8+VFndsVhHoLlWkyC5nFmIWB3qHgpe14ViuKCX9bzVTj4GG4ChXesbx13AI+wCtcnlAu2yXjXqSTPC88noa8rlh1fUkIcY0udtG/MxKnqb0knyVnYIuhDUNnHlW34RN8cXVmU+ni26WZulI0FK6W/7nBWv9Q+dauhBHTiSQoNt7mUmuEVtGW9WUpDWmIy7vZmUgbaWxU4FOf6OU18YLPS0Fj1crxiDl0bFC15vrCLZMs+RaIENtb7uaqMSfnTPvtLesb1ovtKplWCLaZIcrR5eYlRIQILkSSJ5FYAx3m0=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f65ec33-07e7-4de4-1502-08d806d98551
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 09:44:19.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUOzBeXgLiUHc6bEBf1a0U5kBxluwgYIxqh9mJFQbzVDd8yJWnlxBwVh0NdgT1mE1kx4BGR5LxIM37RH6zLqSXVt33B93sj41N7LPzz5E8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2367
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
present when the build-time ldconfig runs.

The ld.so.conf and ld.so.conf.d/*.conf files don't take up much
room (at least not compared to the 700K binary ldconfig), and they
might be needed in case ldconfig is installable, so leave them
alone.

In case of a read-only rootfs, one could add some logic to remove them
if one really wants to shave those few dozens of bytes off.

While here, fix typos in the bb.note (add spaces) so one can just
copy-paste the line from the log-file and redo the command.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: don't delete the configuration file(s) - that's also a much
simpler patch.

 meta/lib/oe/rootfs.py                     | 2 +-
 meta/recipes-core/glibc/glibc-package.inc | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index cd65e62030..a0ac33ada6 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -297,7 +297,7 @@ class Rootfs(object, metaclass=3DABCMeta):
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
=20
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

