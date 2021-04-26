Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.77])
 by mx.groups.io with SMTP id smtpd.web09.7897.1619448323771437106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 07:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CWmuXYMu;
 spf=pass (domain: windriver.com, ip: 40.107.92.77, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqmZwc3Tbmx/5y70aBdZXWJGX169DPuo3PVjGlEhG9Kw3GzEtIWC0FVstRMtvaTA7hDiUDJcVkgz3dcKmu/UWDKexW27JOH99U7ALeKTi3eHLnifzKeNzA53KBI3N1y4WTSZcqJjw2MZf22Z+Cm4UKCgs6YexYOhk/L0kVrsNNDHBn6QxRc+UosKMpRZZph7YtglmiIhWfSwxDDL4TB65/HDqG9r42tsCqICVL8Q7h6K74dJKjTEElUS1Gp5A7I1RBB2+DFAdxuOyQRokpK68QaJSkVbj99AYuWGS1ezJyVPn87o29kYwUDLqHWcLV01BjzSc3VhpVnK7c5qa5xkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UcpNlzYM+9fffDkJItctYcDX0EgjAur9tZWZ0a4V6M=;
 b=mQA/N41Jv7GrpnXjP9gWuC4uwVFjIObuOAX0+LSj3v2HRhA5Z8yvXlfU5zb7ygMhDSNKkjNw9AH0M5tV07PEnNVDCR4Ot4Fc/ddr738ITALaQGxs8un1fDlh6KlsKUb71NEwjg3TsgxHv0gcTXhc5LbMn9LxTrGwGTmjncCuqGEgQGWw0FMddkLqJzz7j9t/z63f7H247JTyrllP3xW/AeOu3xIHdmkDSwcCtn6JmfYIe1Cg1ldX/7DTpEYvbzuUVy6Pzp98fP+bx2DQcHphDil9KxQTIFbsjt5/GZrrJsAgQYTPQLq3kiMjZoYQ+SKJcLX5td66nNKu+6sFeRGicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UcpNlzYM+9fffDkJItctYcDX0EgjAur9tZWZ0a4V6M=;
 b=CWmuXYMuxV3I1mxiV1NfTQ9PgSDn3LDdptmSI3FkH5rn7LBG1BVDzoiNbfh2y8RKBKPhBPTcesQL2Nndu9rfnDwwr7eOZBuofBlCLcQ/KhWs7l6DSyzIcohdGOpKR1hX3z46H2aqawD/hzIA31LbQCbMlcpRteSSCKH4w3nhhmk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 26 Apr
 2021 14:45:22 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 14:45:22 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu-system-native: install qmp python module
Date: Mon, 26 Apr 2021 07:45:09 -0700
Message-ID: <20210426144510.1568305-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426144510.1568305-1-saul.wold@windriver.com>
References: <20210426144510.1568305-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MW4PR03CA0164.namprd03.prod.outlook.com (2603:10b6:303:8d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 14:45:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d2f7e7-1477-4f7d-31f1-08d908c1eb82
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50734DD65EE58496645BB576EE429@CO1PR11MB5073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kR99xLOa+DNB2toppJnp0R/bszyxhCU3cw/rCy8N3lKGgsEtiNu0ONGlH02/+UXLIENqbao8/2hS/3QByYu2p+i6ih33/t9wQtRerXxVRWhhX9Ii0tcskkTQhwRUVsoSP5KYINK5EsP+63kOdtaoOdgnryHgrxZqKaF8Cs55MiDpbq1L5As+9aQnCCZSLy8next8Ue9sQZcMwLAEe1H76D+WS/YRxfYWq/yopyiFj6PZRo3T5jLcL30TeqddzPbCqqYgzywCp/b7Mm5Tmj1oHR8ED2bO3s1eNHmfQq2zmph8H9Gp9iB+guGX7SYxWrUEHL36B9vs6xRUVoaFofRTIQCLm8q/6jNr7bqRo1lwCpOvAVk8iiaGL2ZhbAWjkm3l5/ExKY19R44UOiQp8mE0Yvo2AA4mnlLFuDSS2N6XDEsKc11jD9D8n6tYsboX6qmguXzCHXtdAJV7MpO0YkwguAd6zU9/99rmi41KFRrRJFC3YCja5eEp/g4cyvNMYDJmKFOC/Zh8B7QI8ilv8AXb/D+LGRAZ33oOl00ag0SKCWyunpOUnGZdVQGgl9XfWAprFKRW7FykmSYXpYurdK4o8UteHSYQlU4Roz3mCxGTLzzdSYE8+ZN4FVqRdYSRmc+L5DrPKA9QIoeRnCDxNTvIQ24dMjZ6X4hxV69NxWZ4iHSBMkxhSF6FLNS0UAgVaZETYHFiyQtPDImScd7m8KvGvjAPD3/yA2bjUgbNUOKSx/7AjwSs/cxlVMp/zxYaijrc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(44832011)(2616005)(956004)(5660300002)(6506007)(6666004)(6916009)(6512007)(36756003)(2906002)(316002)(16526019)(478600001)(966005)(26005)(6486002)(1076003)(38350700002)(186003)(38100700002)(86362001)(66556008)(66476007)(52116002)(8676002)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3Hzfy2LUpkxyL5zWTdf84QobSaTOsiyE/8tZslTVeXuMGcBi0HSsrAYVCblB?=
 =?us-ascii?Q?VFvVpy7CAkWVz8x/C3s3dHsABj2VcGqmOMV5/JrjuHqLzFjELyevKp4Mwyrt?=
 =?us-ascii?Q?DRbseLfnZhLjIRx6T21zw+Vlt39ygg6FE7pPenpyXfbutE6VupnpWrdTDcpF?=
 =?us-ascii?Q?PTRv8s24CusRKil4J3hyaYcS1urdrUkZomzDuvC1u9BVo3BiB8vL9IiV4zha?=
 =?us-ascii?Q?MbfItaPRtc9QH6AGLYi7n3C9JRxBcMsTU9Znd1KhCiI+knwoh3NTe+BKCFkB?=
 =?us-ascii?Q?Cs04/jXn7Oef8jXLfAOESHDEPXLkRZu3e2fVq1gI1vHISCg73v/PkXSWeeEs?=
 =?us-ascii?Q?yNPgdqOP4/sCAMAOGxJS8Q8hKPgVvxRG7MJ2ewaoKtGhYkFuKtpUwy/YDg40?=
 =?us-ascii?Q?0O6nD+CWlMVtdgwhRTDStFd1uWsu0NX2UjWLYUBWLnkBMmUxBLiK0lPkhCMC?=
 =?us-ascii?Q?Z0Fci8t15PeAbOxvIidbmrlTgKP7eULmVUo656JgJkZJA1IsbSjmThp3opxg?=
 =?us-ascii?Q?XHTv9HICgoFXkhI8ABtRuFUQ9/1OHdolJHzwJ2AcSyz3MmstzW2LlRsxWYY/?=
 =?us-ascii?Q?TzIdKObdlGtTOdCAdHdAqBnn1arkX79JhqM+yzqsKZS0drjfpFUZx5c/iWU2?=
 =?us-ascii?Q?0aKS/LEL2Z6eiBMooND8FthVFufFJdWfW2YuUu7npm3TiEv5K2WU0zz5RaPV?=
 =?us-ascii?Q?NRftPmPJQ7WZHnpvdOnV5SN/ifQR394f9rNs4tec+4P3UVf93tRQFx3t53po?=
 =?us-ascii?Q?3fSx+ZtbSnOUDQF6NREOxCHh77fB/9+jRIfLtdXnFJSDWfunYLLKA8T5tRgw?=
 =?us-ascii?Q?0NwRUdFlXzVS9h4zIOp30UKICUWVgX+5YpMCLESZcWmSX7MoHLNv40DnJmpJ?=
 =?us-ascii?Q?0cT9JZsG0r/BR3kQg9tj11F/n9L6RMKn39+pgUjLGuHW23bHZmIydIC7ZkcV?=
 =?us-ascii?Q?rWo8a/Xz70a5OcEV3KoLnldSpwPPldfhQ5ELplYWK7kooxB/rUrNqFMJZ224?=
 =?us-ascii?Q?xNbeYz/kZP+ll0KbSHZDRHebMF3izeOuiIMmnC4l4xkawimSnCr0iMWbSM4C?=
 =?us-ascii?Q?kARec5Pl7lx5lWrchkLsoakL5SaftqCiF4GoWf1jXqtwLxT/WScNWWSikiqJ?=
 =?us-ascii?Q?Kfw1belA2qXvKwL0eqqHcSUNK5DB2/W5iaiYzUdmqADunPFqOUT15/5TbgXT?=
 =?us-ascii?Q?3u+VSN5wfUmHwENXqQxYkIgizqEY8wnOWIwZMp1kTM5Hm1WkFJUlFzaZqmi2?=
 =?us-ascii?Q?o8nFh+F8KUw8x2j+nDOqQc3bnDAPNsGVCM3UAPOgh+GJnaIzeD6h/jadJTxU?=
 =?us-ascii?Q?uDRqcrKThdiGHVxWtp8lMGu6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d2f7e7-1477-4f7d-31f1-08d908c1eb82
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 14:45:22.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cc9kZZBZ1mkuykq9pMAGF9GKIzaveTvJPU3Nyy9ZMe2SOtjISn/wWTAgd4a269DqrPs0q9Sd186OSPUkdgLsEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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
 meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb b/meta/=
recipes-devtools/qemu/qemu-system-native_5.2.0.bb
index 222b55cbc6e..390dadea48a 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
@@ -1,5 +1,7 @@
 BPN =3D "qemu"
=20
+inherit python3-dir
+
 require qemu-native.inc
=20
 # As some of the files installed by qemu-native and qemu-system-native
@@ -23,4 +25,7 @@ do_install_append() {
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

