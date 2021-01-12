Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.14.1610493101961372097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 15:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TP7dtst8;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlgAOcQ/CnjxhHXlNXOAN9g7yX0nq48NTgWBUfTs7lf+dFe7yZBEgzzHm+MVXTGCusd6KQ07j5g3uevl/JgKZ9CE+ttjwwAf/nCy/EAe+z8gF5xdqF0jbTdmDEBzDPcKszxT9r91dr0Z1Yprs2Svt/4JgJd+ZH37hrrunPtNZ4fZT4bt9Qf0xzP53iJ7av1mU5XHkVziL3l/kNZvM8HbTgm3CEoeBNmMjMjYTtwMG4yYHXy+Bz8ZoQHG+1ZKTA54aBhtaSPWl+3I9AWl14w+aXA6YTDH9YDH9DyG91q9UxMTPlDxZsc937VUH/K/K8fLoyX801UYh70IRQfUebXpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXpCe2PzX81XmnblXXuUdI9uCNZtud50LfBVn6FlVFE=;
 b=eK6RDRtSRF05a0LelsaW2b8sXYNIxfXJOkMcg5cYAWPSjpQ48YHCmwwofu0CLHNUPq+YVVK3ugtad/0FX/dqwUSjBqk1s/dYlYM8zIuyhGySEEdMgyvpBq3qDgZ0ZpvMDfplR8aMkVqp+WJLkI1EOh6cFp2bnGYplFLZ/6kXq0sJTIHwX1dVCpZnc2E5/PWsuS6ExAtEgkdZlA8AchR6cBVzXPGQimHaGPA6wXjv4Lp+CJ0Y1WLHDw7dgecnN+ngrWtHoeO5iODfJjFP/RRMEerXqEAFJdChmYSgsma5nwV3P860lWDPTc0GaBy9WBjKIrlDEOk6xDPSA+kZgp24xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXpCe2PzX81XmnblXXuUdI9uCNZtud50LfBVn6FlVFE=;
 b=TP7dtst8Lu3yso2K83yAUrg6ElWq0QY7MTWvAFpZPEGAYMJEvf5/dHz5im1nVct9spwuqoFu0c3+uayuo5kJTuryrWfPWDizVvTwXDas3To9wlZk/YuwACoLL3wEDmgTvSB0aTXrPbyUunjQzcxLpTdVh038HhoCilp5DYMgRUs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 23:11:41 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 23:11:41 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu-system-native: install qmp python module
Date: Tue, 12 Jan 2021 15:11:07 -0800
Message-ID: <20210112231109.4048330-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112231109.4048330-1-saul.wold@windriver.com>
References: <20210112231109.4048330-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:303:114::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MW4PR03CA0389.namprd03.prod.outlook.com (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 23:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b48a33a-2061-4c1f-86d8-08d8b74f6bb9
X-MS-TrafficTypeDiagnostic: MWHPR11MB1534:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15343E147F92C98C7F54909AEEAA0@MWHPR11MB1534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dkc1hcAH+L+YYjxT1z44r6aA+CLBuRLJ6vgiwKPCwE75HHUGN4K0DTphGcYufN+VwNRVEgil03m8XvCE9gtIw+L5aJ2vJXYcSXv7TmkyimUdf8lZw3axmWtD8cbCGZFy3PrSNYkzGnSN2xMrl/4b6lAkHclHpbKroTtvl2p21KS1erBwliAOh1oHY+710lit+fIGe0bMdIQ70vz/AvciACw6ekWBo5HfluWh7HrLpTlgqe2MjM05o0nass0j26OUJrET2Kc8ZL0PMlMKb+cFRtuaJ227eSmL2FWTahu3+HhJSFIDENiYKhFOR1FsUaNvtN7IvBuQ+Sm9p6xA7Lk48ZGp1S42jzr1vJgHYhXz2TvlVmXZmlsbXKvSGlcfNW4nr21FFQXtu9l/y0LCkKGyu+YYcOJlgTiawZeRTSsLtU87Cik39aUOmz7rBZsXg8CCUfnxwfK0UzP0+nrRbT58kQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(186003)(26005)(6506007)(16526019)(66946007)(8676002)(36756003)(316002)(2906002)(52116002)(6486002)(86362001)(6666004)(956004)(478600001)(2616005)(966005)(6916009)(44832011)(8936002)(6512007)(5660300002)(1076003)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?FY4z8g2GadbN+Gd/tFOvZtu5vI97pdMRt8oyYl+fVPczj7Td+kY4t6O4FKs5?=
 =?us-ascii?Q?iNxhrJ1rPVLK4RKE5lcItlk+y5+Y3Txb4APyLHsKyClMFt6pvg5gruc6x+h3?=
 =?us-ascii?Q?v+3nmIzup8cMwh50t0PM3zkYmBdf/N2J1bGApE0jDSu5dHkpNsQ1nFGIlsWB?=
 =?us-ascii?Q?QocY4OTYqjO0QdNXGungVFwoEYyjDKfF/0JwQvLQzTCRP/IECFX16S+7i9xY?=
 =?us-ascii?Q?dkRQqccPrDBWTi7jyYBLNzzeALEtmdAHCA7x8cyYHdzvZc9PyPU8IutnrYst?=
 =?us-ascii?Q?hMKetu4tEp36BB/NIx2CcrfiR8NeVudrusAx9b8Y2SU0T273cShlV6kQ8bkq?=
 =?us-ascii?Q?JBjdeEWFIYjddLHECxA828RZq/PBuXJel0vymXY2h26JsDaTv4qD1Jmhg2Sg?=
 =?us-ascii?Q?Id+tPSBaWGzT//cQAbcp9uxy9TCxDovUsZytzREwYZOE4EfRGyYPG56X/4zi?=
 =?us-ascii?Q?atwZ32H6v7VhMItTlv5oG3jb0TNc3HjZFpXF4iupzirY060EefITDHNBqHwP?=
 =?us-ascii?Q?KTVgZqDeE/yI4heq3LCDZhM3YWz1I4sq6ZOIot4pKKP/rxUvx3+JbPqKHcax?=
 =?us-ascii?Q?xgwpNjqtO+3Gkrrp7oYJ6e2tx29PvD9UHNa4Blfi2RXiG8NCS8acFHLiFhuO?=
 =?us-ascii?Q?DD2uX/0bF8plzufLMSVkgGIrLhQS/EKBNwCnUPrCSD8gWmQh9+2KEIeyia3W?=
 =?us-ascii?Q?IxVB9WrMqDnQETVTDuBwKiLeJWGb9VhWEOoWVHW64HSfRN7C+3ZRc62qLVFS?=
 =?us-ascii?Q?/9bDXO9JHLCXFT3zawVJusNEBny77QZsVB8p2qkM0eYrNjJCnd5CI1eRgnLJ?=
 =?us-ascii?Q?67cmTiXMtS06+FNWhmBtCs7SMBr6TTGWGwF6g2GZDG+QypARE/i8RE5MVtwG?=
 =?us-ascii?Q?6kpTiIv6uOI03yLzFFhkoWuxk8HspA59eT29pE+u3k2i4VYsGEQj5O/V9/Jk?=
 =?us-ascii?Q?kttQ4bJ1/Jnljj0HVaPPpljMVlbUX6tHSlQAilRYA7i/bCF+Zp5JTpSNEopA?=
 =?us-ascii?Q?4BGx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 23:11:40.9599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b48a33a-2061-4c1f-86d8-08d8b74f6bb9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+vfYT7+s2Uxdv5m26kfoFFLL/pgpov5wzE3b2GzmoidaxY2ak3oZ48nKI5ZnRSeTGCUyQ6/XVz+4zXVGo3ucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The qmp python module supports the Qemu Machine Protocol [0].
This module needs to be installed in a known location so the
qemurunner python script can find the qmp module.

This change causes it to be installed in the recipe-sysroot-native
of the target image and that directory can be added to the python
sys.path that needs to use the qmp.py module.

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb b/meta/=
recipes-devtools/qemu/qemu-system-native_5.2.0.bb
index 222b55cbc6..4a58bf9055 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
@@ -2,6 +2,7 @@ BPN =3D "qemu"
=20
 require qemu-native.inc
=20
+inherit python3-dir
 # As some of the files installed by qemu-native and qemu-system-native
 # are the same, we depend on qemu-native to get the full installation set
 # and avoid file clashes
@@ -23,4 +24,7 @@ do_install_append() {
     rm -f ${D}${datadir}/qemu/trace-events-all
     rm -rf ${D}${datadir}/qemu/keymaps
     rm -rf ${D}${datadir}/icons/
+
+    # Install qmp.py to be used with testimage
+    install -D ${S}/python/qemu/qmp.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp.=
py
 }
--=20
2.25.1

