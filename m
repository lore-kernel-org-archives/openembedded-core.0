Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.92])
 by mx.groups.io with SMTP id smtpd.web11.9214.1591100255775750283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 05:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=ToyFKSA4;
 spf=pass (domain: prevas.dk, ip: 40.107.22.92, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdSf2U1/2eQLsBUScMwXHuGTNz5roeoJYVnIoTwjG2XVDhf1v0p3Q+NRM+wk08AZBa11AA7iq0SLqQhELskDuq2OZ735XCTpmpJTzVzG3UfV4BPVIYCwpXecooZf0gBSjFJsJwCsP+itNsMpqXFVpVftR++iHqw0SUuGE14IhpYO0CnHcwt+3iXq7zFTfLHe5+lrS7gTuXg/bYvnDPDWAusz1D/9J1lCKpMU5YUdRanCVZfluiDY9IAeuFXIUoBPtaDqAmlVRhTy1LM2MnlcjwNXUHhUC+9zScJ0qa4hjUsjxWJbF+sbOWmiIuPrwuQ367D7162X0Qo1bDAuBBzykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs+QP149kpowonUo+8iFlGTa/r6kHTHx391vWdkjFkg=;
 b=iBOtZcCccTcXl8YW+vR6NEORG7fqOHXY+mPQvlFfWZVJv6PWotNhIMvF4aChkIsColxXWk69WJxt3AYsxq9rUXJTUyrqzgILOJYEa04Z/Go3YMY2FUIZpqQxBnHH/By3g0zUDiK811mOSfKQuUyMlzjLze3wuYcDeSwqCmganXJmL6G0oxwyWaEsPqj0zIZyifE2EyyNXTC4ahpTgpGFRHGKjCYg4Z3I3/wlL9ncPD69SQwc/3js/RUB+6i1ue2L+ujrpbApYVYo+bJndMNEeGwx2vWmaM3sOkC1HDjVzMgu6HXOSzbvkWxvqNPAtVuwADtIbRWYQOuqW31isbn2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs+QP149kpowonUo+8iFlGTa/r6kHTHx391vWdkjFkg=;
 b=ToyFKSA4bYTvmx3/cLBv/jS7E5bulmrssvpokf1hx5ReV8Chdy3X8KS8cJWJNMRIpDZjc4TdeYl8le1Fi0O3gKeve/dQADki1vKr8bHmkxgLYtKG+u64TaEKKqsLg9EstHOFngTxLpJt5IxI/8nClXGqewMDUKl1RJaxW9SMiTI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB2064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:39::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 12:17:31 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 12:17:31 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	Phil Blundell <pb@pbcl.net>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v3] glibc: move ld.so.conf back to main package
Date: Tue,  2 Jun 2020 14:17:22 +0200
Message-ID: <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <1614B0E5E96C4272.14405@lists.openembedded.org>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
X-ClientProxiedBy: AM5PR0101CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::38) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.116.45) by AM5PR0101CA0025.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 12:17:30 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9659cc5-cc33-40ff-e0a2-08d806eeec55
X-MS-TrafficTypeDiagnostic: VI1PR10MB2064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB206417D2251986CB16B0B2AF938B0@VI1PR10MB2064.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zldi6GzbfOUIqkmjPlAiNIIiW47pzVjhCu0q1oGpFiBvfu4p/6oRGCYIQsnrPiH3vOR7kOfbTcdn0I8qsS6YXM+zytspwcphuF/b4gLZk5xMICYEKcZkbPycHD6+eLTsqqUWUpx8oChMnY3bBgvaAidBG4+G0YeBKRBzi72ogLyFKaoV6j4QoWNMirvt1OUVhwVfrlvqdUI3HjShAWbcJE8n6oeV5inN+rD7C+zgRedNVYM6dQ49zc4D7JnoP0Z5EVoY8+1RTwYRMarHjjI7Y0YnnVTsKl6ClVHksLKHZ8KvqPmoshMDjBsONVI+qgQHh98KuuAwvvKSQ8LgMwH0pA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(376002)(346002)(136003)(39850400004)(8936002)(6916009)(8676002)(316002)(6506007)(6486002)(52116002)(4326008)(1076003)(6666004)(8976002)(5660300002)(86362001)(66946007)(66476007)(66556008)(2616005)(956004)(44832011)(16526019)(6512007)(2906002)(36756003)(186003)(54906003)(26005)(478600001)(107886003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	FkUL80kxWhQyPp0nKdzkQ5FJxqa9Mv1y/6tXLHKGShWs4cKAFfK6SUZ0tfUGJ0Gj6fxO5vKibUQW9CtOhcx9QjaWICBZHA0s8W/xzQGZJbmR1earhXdb5Yas8mMOLpIreLr7Zlw294roCZYM1s7eWe3fYxXr6hWBmYD7iLs3EYiUHkwAJCcq37QCewsnmElvEWRUSvWvKa9reSYfEDuZjnsGQwopd9MngR7e5vegS1l4vGhLFsUGuGrTuXpL6AZcgamWaRFdhEhk6VtNk24AR/4IkqS7LGc3AWodFy6ostDh4S2ORfd45xHlqEuzdgaYnPy8i8E+s8P89uVPvLM1yKrrkiyWY8EpUH5hOwE/gY5irNUT1bV+x1yFd1OnbfvzLJo4INnyZqFDYzjtjVLxYx2aFGt1P7WP2cGJgZmrDfdt9qSPtfJf6pt2LkJqJLanoT147jpjYeDipgRNLUaOhVJFJlz7tKTMZ6IP7OqAnME=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b9659cc5-cc33-40ff-e0a2-08d806eeec55
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 12:17:31.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtrYuKDyrOefVyYf7VGv9fjY3eCTeUHR9ztwoGFbTA4FvviSfXnCvm3ZRJxqxrQQ+3KX4O8ILkN1K02On1/AlgoFIFOC65YUph+ajn/BYJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2064
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

v3: rebase to master

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
index ff25fd4187..5f1ab60dc6 100644
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
 RRECOMMENDS_${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig',=
 '${MLPREFIX}ldconfig', '', d)}"
-FILES_ldconfig =3D "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
+FILES_ldconfig =3D "${base_sbindir}/ldconfig"
 FILES_ldd =3D "${bindir}/ldd"
 FILES_libsegfault =3D "${base_libdir}/libSegFault*"
 FILES_libcidn =3D "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*=
"
--=20
2.23.0

