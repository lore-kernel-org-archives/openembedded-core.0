Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.11047.1613061134875057234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K6ZJOpPw;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5qaBrM0myCQRIUJxqOUM/YXfUa5ADmBoHVugg/5TEWLFDr0K0Vq0N6feqQKH0UotYFvzO2e/FsAkZvrrW0u4JZfCVS+0bPA9iUDEBU1knKu0wn/4yp8sheLAfaRo913Atq+1hB5J0Pblfwd5Tt+RhUo0KHZCDuAjo/iGWLN35ZVYAOq1xwXUjukv+SbD+nfZ1YLsTFtZb5FrFnOwBgp6EidaVnH0/wmMwik9dc+9ElAoP6yXxctwMgsnCw6wFEyp7vWPpGbTre/lEvsCczjO7gxWVtP9OLTIGKG8t4fGJfbuh97rKatpBxvZipNMZkYChTLQQmIk1X9L+bZg6oSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZED9mXyFSRkv5b3LBW+Cm9UZ43qFqQFmmg9N4dt+p/Q=;
 b=dtTR7eaHNKbD8PoVaGekne9ZktzHiV6GYqAPyClOXczUFUkJ58UKEdHwen2KrMvs9usEaaNm3SfT9zzmbbufAFgLS5Qm9FBgbKjtroDF+ixIMH4e5vPMnp57gTIKsZoEimP17uXwTRpFSasGLe+Q4CYOZKM2PGiaIGnd499buVDUx6jezByB72wAAvWs0jKyG6CyTYMDQLmhsMrmi6Y+4su81SeuflbL4v6HIQXz7OaTNS9yA/kbfHIihcBJc1w27O2fZ1WVd/uU/mY4gBwYnYeRZyhd8kTQABOL6n7wwDQluE+YzwyFWbg3hSBREKnw2fXW+wpITeMi93Tj8Cd8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZED9mXyFSRkv5b3LBW+Cm9UZ43qFqQFmmg9N4dt+p/Q=;
 b=K6ZJOpPwDc8si9cFPjLzIoASgWHAteb39WBDaWKwUZrfpcffoNQxh7aowuluWBzyUNSCn5mDemSknhPddH2eID2RwjLXBYiKG/eLftLbuZrZzPRX8rrgrceUjyYfO0KRbU7Qms14T8aAATlhXrfAMa7XhSONXV8oI/IhbN/rGRM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 16:32:14 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 16:32:14 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu-system-native: install qmp python module
Date: Thu, 11 Feb 2021 08:28:09 -0800
Message-ID: <20210211162810.3702567-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211162810.3702567-1-saul.wold@windriver.com>
References: <20210211162810.3702567-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:300:13d::15) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR20CA0005.namprd20.prod.outlook.com (2603:10b6:300:13d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 16:32:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24833966-99b0-4159-496f-08d8ceaa9679
X-MS-TrafficTypeDiagnostic: CO1PR11MB4801:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4801FDE243E68C2CDE9F0B9DEE8C9@CO1PR11MB4801.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b05WeBu51LJsEhnUY6+uc4o1dgkgboqdBtG+6jJ7DrjoOjoCaGQFhYsLHoEkGrE+t194LJJdlqtDBwNAwGf/YIaJJOZkopnJF/2YY/qnXKdrWmRDvnsR21oBfe1GERENcwVA1pm86FDXfv1pXafvfmzGupTFFlXp4SB4mNXpPDRFu86scTVAYperTwApCCZ2YPyO6u20ZvLHhKEmbdvWYwN2VRW6ZVVKcx17L3UDRnqr2D0wSJrdh6VAM4pAG9S8R/vdWNlrtonE8TEz0wzn6hASmBl0nCUXSh9vWN7/TbWdFFM6tFulCSgMEgcm3cmFLUeuhB30nT3yfR2LlM9R23DiVPxKvaBV7/+nGhneXXz//EyLgyV2oro6MWbrKRfJ7qabxhoBqLYcI9TlU2TyZRNjse7+EGbnKmRGs3/xHihfIhT9kUWl6avUdx5PHfkTzaRsjFKOITerjwJtMNZdy24HpxsK1f0Dpc6h69WritNYXEFBmUhslfxiE1e9wcYR4O9B4C4MLcLXWoPgZO3S5rtPQdOF7jvFjLuVQ51YREJ6EWZk+DIdlTKUXqZMGJ/rW/gT1ROmdZrcIJLqahv5fZOIxTfgR+0gQvfxrQHM/Rk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(44832011)(6916009)(316002)(2616005)(956004)(6512007)(86362001)(2906002)(6666004)(26005)(478600001)(8936002)(8676002)(186003)(6506007)(16526019)(36756003)(66556008)(1076003)(66946007)(66476007)(966005)(5660300002)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3/SIELzvLjI1gl7SRs5tjHKvJyyH1zOtaSbIfJzexJIJ0vBLfqB7slQl/q0u?=
 =?us-ascii?Q?+ttqR+5ApXxTd9vrJoaT9u+2udGqyH1T6CNh8lo15/ENS2DR9HQt9dnRz3BM?=
 =?us-ascii?Q?eb9KbEU2OCnRXryWJEYeW1A088rZB2Vk3ItzVw2oVo/tkryvE2k5kd93/pFg?=
 =?us-ascii?Q?sLvqq+8V1zhQtZZOJa6HkaECot3xnsuXe+oMkaiWXmAk6uLAnP73uJLLXk2m?=
 =?us-ascii?Q?R9VI8pyajabvAoD9/nX5gMGZapngTVjrbBEm5R9dCn0e5zrWczcyud8i0foD?=
 =?us-ascii?Q?uffsAHqZyxedT1RkKLsm0z1UlInVaJ4EHAXwaanjCK3StntVXQ46Qj/hH96c?=
 =?us-ascii?Q?590CE3Va/w3uSZChLKmi/OsOFC6GBNHZuV77PnO4D6F5QD5yPhgRLhvW9lT9?=
 =?us-ascii?Q?HKJzffkZ9FknfK6UbmLpqEBbR1SHXHhcPa5SFCMaaHoZ3aPK4mLTu+MP8Si7?=
 =?us-ascii?Q?v3CFU9xcXAngv9A2R4i52Gpy7LfWbCg0P32RwdRF2G0sP3ldsZ+pxPeiND+W?=
 =?us-ascii?Q?+Xp5LqWhs74pcLKnZUB14JdjTN95kTz0PNnAf0SZoG24yQL1ou7sN+UUxqHp?=
 =?us-ascii?Q?Ue162+iXGd9KUlClxAqGS/oil6IQ6jKXme3Hc35y0PNKdf+BYwGaw7Pu6/rD?=
 =?us-ascii?Q?fwJAfvH8s/7nPOkGEsbyShHtMP1moeWedkLx/vxYSNlUbHIMPDpXWaYAt11o?=
 =?us-ascii?Q?3UG4Db7tq282SI2reqB7BE8W3d9WDY1Gr5JirmRElo1XkGT0V7dXbteVo+3P?=
 =?us-ascii?Q?N0Oq9tCTKK08Jx/ehqzo6d7QTJFz+10eqwo/RGGXEQCuPHtFQCQwNWNp0PgU?=
 =?us-ascii?Q?8Rm/RHVW0yGwFAxTv/KdV7XKVYchKdrWl0A8ZQYPtBskwDBPkow7CR+owbXp?=
 =?us-ascii?Q?2Jk15a0YCFrCoPUmpltHZJmTKMOLthLdoQSCqYNJpu6BrO3033ZdiFE+iTIy?=
 =?us-ascii?Q?OwxjLNVY+W5aG5rkuZzeKjYZqDIoskfQL8420u1y4G+u6yTHybl/j0Y+DBgH?=
 =?us-ascii?Q?GkPx0V2hv72wxcXG6YFi2AfXqug18i0fVf3IHPq1gdQj/dXxJ5vNPe7lriYg?=
 =?us-ascii?Q?XnUtmcEhZajtADXBhHByrByZKLRO/yoivsqUyZ0GyM5mzRFOhwgcmkk4Vjhy?=
 =?us-ascii?Q?MCUf2tHqhjc4QPs+sj7ogshxokJZuSM1bjDkrTUXCfrfpixd7VEMxT5cV0OA?=
 =?us-ascii?Q?g5SPN/EjAmgEMudXlG9TEi1FdcVUVh3Ek7/7KYEd6yQceGPKV83C6b62Hi3W?=
 =?us-ascii?Q?zxvNZNceD3iFdTm8HWoTnFVyEeL/8irTQoL8X5ijLjUHH/Ud5tXCdK8WEhjY?=
 =?us-ascii?Q?8E74vXuSnJwx2xI17CipZLcb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24833966-99b0-4159-496f-08d8ceaa9679
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:32:13.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2Yy20+VGUcKla2vv2bqNfa6fLBYV1uFU9htYxJG3PQj5Q9XlGe/ws/2RVWLZjc+5xzcZMUhGImxM+SHYd7GtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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
v3: moved inherit above require per RP's comments

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

