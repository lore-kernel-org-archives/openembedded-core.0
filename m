Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.65])
 by mx.groups.io with SMTP id smtpd.web08.13351.1609961307153897584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 11:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jkyXaRyQ;
 spf=pass (domain: windriver.com, ip: 40.107.244.65, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrBGuhNAVpkCCKTsoHtQ5mp/NuLw4Um38uPolEjskrrkwlHT0oPtmhmKDdhhkaHQUf0gYPdlFqQpU8i5Mju/P2Swp5W2+i8Q1EkcFXB39TMmhHBRtg1p5QGAS60Vjiy+Zx6+LDUXtEDNDdITAECLpYNNtkymmYRvUZH1DrHfM1eEm/jlmInC6C/XaVo7w3ngQ2rqCWXpB3vsMfzG2FlS0Zg7Bn2NaVwtBileofelpJ9NmPrfQuJ0nHsgLB7DjllyOgKH9Yp/UglmZbfWioclb8yC3RL8pWCm2H1+QPpMh+6TTM0VWThp77FEK7dinNQiVz0D499gHKZw0TylL0FxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIIsj/QNe6e3ZQ+aUrzl3m/vGmc/MFPOV4V5BmWV75Y=;
 b=AJjRRh/5npFt/4avFh3NYly5Cov3yU+LOl1EfFKlB6UvdbK8w3T92vd0YdFIPc/obEAZcHBg5CF8ifVUDGMMvaU3hh65cfX48pQqXtkZdrLMWfA1m8B9wCxRRotCizvjYjGkV6hj9WcVMUTsSrMlF2kn+54jlZtYXkYoDM6nQ8PwevTQA/3AlOJcnPRo8qPf+xrcJPBuM1cVHATQ+VxYtEz5duk+xurei8eVgMVCWGsM6Sby5OvJGhVV0B1P8T5Yki8LkfY1RzL4YDIqg1AACefS30nw/OgxScnO+cG+PXCrCwrjMr2mcclUcDVAnXYBkhHaWInIgFQrHWMLKXyf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIIsj/QNe6e3ZQ+aUrzl3m/vGmc/MFPOV4V5BmWV75Y=;
 b=jkyXaRyQLHLukX2ceyh+Oqc4/c97/E5Lt/MFCbkQw16FLN1WWt7I8e0Htkp33QRIfYxZ1If1s+vSO3ru3DmKU6seiDgaWXGA2ndyjzWPURKiXbkH7KqKB6Bq6nFbDX4LJ2f2O1RkHmS0zptolsG7fYets5xp6JKbdd2ETeI8rHk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 19:28:25 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 19:28:25 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/2] qemu-system-native: install qmp python module
Date: Wed,  6 Jan 2021 11:28:04 -0800
Message-ID: <20210106192806.1335560-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106192806.1335560-1-saul.wold@windriver.com>
References: <20210106192806.1335560-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR21CA0070.namprd21.prod.outlook.com
 (2603:10b6:300:db::32) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MWHPR21CA0070.namprd21.prod.outlook.com (2603:10b6:300:db::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Wed, 6 Jan 2021 19:28:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82a4a99a-61ec-4cee-e31a-08d8b2793cdc
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2031D0FBBAE87B8AB0440F7FEED00@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lSKKLZQzj/oxUoL5VyFPuWl6pDKL3JQV1ziC7CeaoIZrrqsuQo/bcF4HS/EjVeMtOP3r2JZr3LuVSIbWbko446TmzMgYOcs4xtZh8DGHBACoa5Thia3GqMfxiZHhS300OYXMx3bEE3bJwfVsbpr3A395Mn3HPOZVmFU06eJebdoOAy8/ycQ8ZNzD0oKYuTr+Q0wRdiuUbr+sBtxhQDIaRDzvP7e/IhlRw3w+DB0zspx7/XZZbARG8BDp59SgDMkKanvexDG40KzEBkp1lvY0oieH9W47yte1j62IlYk3/d9TJE60NJtH0WDr3Yaf6WyMg75fByedy6UnvGEqbvUPRw0LNG+z6dMFZRcBq07GsovlVGSblTeFMXtmu21t1vVVcyGNAmFPcgynGC9UyYqdVYjEmpVT0c+FrK7uNyQn5VgUJRbc0fWVoG1srz4/pAipDtiLDt32by2eds+wtTpcLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(66556008)(66476007)(6916009)(5660300002)(316002)(26005)(6506007)(966005)(2906002)(66946007)(52116002)(8676002)(36756003)(478600001)(1076003)(956004)(2616005)(8936002)(86362001)(6666004)(6512007)(44832011)(6486002)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gWvqjAc8piejXXJp9vHOu2frpV56c7luo9rklYXvJV+IxJZySHlHW51hwHE3?=
 =?us-ascii?Q?o0aQC0Qr6eXvMzVztoJESZLOaePhmYhmLYm6icY3fKIF9q1XmtT04SD1TLHc?=
 =?us-ascii?Q?XDBzNvpYS0opbdkpBaX8TgtEiVMoMD0nj2M/orEm1Q9o2IQmE4jh6Wu2a5lY?=
 =?us-ascii?Q?DVR+gcIFVld14iu66RGX01X0Uu0oDNN1JPfdG42wD2FQlwwbZEiLALPU04zj?=
 =?us-ascii?Q?/ab7UNOcDVBgAikEG/Shtx9usyrKZTUUOuLCMxRQdMUQ/F9K+m+W6167u/gX?=
 =?us-ascii?Q?k4YA1mXkJp6mof3uA3FVNu8YtGUziRjCuD/uSJbnDKC6KNSXKejRMyLxqY3h?=
 =?us-ascii?Q?McJ3E3DMnijWGCBbhd7709MrhYB+2aMrIWuhzoqNPbgzMq1j/3nHlVt2gM34?=
 =?us-ascii?Q?SESmPTXMtk16Yu6McNo8yHm3t2c+aHbDe66tGccmglpQkikXTjr65YVevskr?=
 =?us-ascii?Q?fgs2Z6WxH62j5iKZAgD+Q2LZOp8I7MoIf9wDUi5VvcWMGJruT0DRFbsalfBV?=
 =?us-ascii?Q?SRRZHMnmnyDmBBhyMYuNkUsfb/XvETXZhkVZwUHrLex9+fRgaPIJk8BxcmbK?=
 =?us-ascii?Q?nQvDQ3QOhCULjP7gyY0vuGnTIWec96mcBsx+msJf+WBnX3O9x1GzcnWaNLDc?=
 =?us-ascii?Q?Z+EzhgH60WXid3XyvvjeM38VW2QaEKd20KCj5GpJ+3T4tgtn2UzKoxV5YsAg?=
 =?us-ascii?Q?ilpXkR+/8GAjbU1yLKcZD7ZhRr9MAIKLLKofsYgebZpaHs35OypeARgMzfbt?=
 =?us-ascii?Q?4uU51OHlAKHM0YHu2I5FvN3jugXskjdAV2xJZINSSkHazLZcD5n+MkdLXDaF?=
 =?us-ascii?Q?kwmiDQRZl9EkpKnJFMm7QYz1fDfoh+QvQf9kIJKvtMd5C9rTyMxIaL+sQryL?=
 =?us-ascii?Q?eLssfztDjlSqXj4YQVjKsGsKwVyIm3cHeNSrpL2Nl4fh29mBt0wE9qsPuwF7?=
 =?us-ascii?Q?sSkt/5SGohNgz8y9upHtsQVfLOTU1GyceMWbF+H8d6kuYRaD/Q6eDGDV1ajc?=
 =?us-ascii?Q?EENE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 19:28:25.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a4a99a-61ec-4cee-e31a-08d8b2793cdc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7Z33oXA3bTJAS43c2+3xUsdztUrR/3ZGvJp403uYhqgNCN3DY8RnZ0tyFNrFO5NHAHYjJAUJMujJTt6k0Bu/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The qmp python module supports the Qemu Machine Protocol [0].
This module needs to be installed in a known location so the
qemurunner python script can find the qmp module.

hosttools seemed like a logical static location, for
reference the usage in qemurunner is:

sys.path.append('./tmp/hosttools')
import qmp

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb b/meta/=
recipes-devtools/qemu/qemu-system-native_5.1.0.bb
index 222b55cbc6..dad7fde96b 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
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
+    install -D ${S}/python/qemu/qmp.py ${HOSTTOOLS_DIR}/qmp.py
 }
--=20
2.25.1

