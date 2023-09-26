Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9896E7D27C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 10:45:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web10.16079.1695725128605642704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 03:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nMreHidP;
 spf=pass (domain: siemens.com, ip: 40.107.20.55, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCHE4dQ+Rsxrcfone3LijEqzOVvljSXZWHLt6Z5mWInpWb50197Gnw/mtZIS/WPPmmFCJj4SrHZkjbskC0pjZfhCvG1inAOQpWVCWQbenf+mAbaV4koq1utpYtfsamK7t6xQ0oM0Nom/2f5BthxpEO9SvjPCcjGrEMyblcN+HWDIE1pPH7W+R+1ZJ/Pe1naR254mBQ6dJSPmepb89Zzmdf+oz+bw6Fa5cGsP3/akuq4DYLlRLMaUwi+lJ1z9/aVktAVrQFY86jA8mEauf1+2uglk1xrYKjwgqtsfQ3Ux6DFW8g3g1Aw/ily+V0oULCmJ0Q+GM71Tnmxly1bNVEMrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dilhVXhNq1ywXgg+8LGKH5XyDF3DLqZ1J8b2QodLol4=;
 b=fT4M/uaPMhMJCv97gagw3ihAN0DInjLEP1sQLe/jUOn4eCg/qh/Q69nVGKESHsS8BcwS5EnBtVHylVruGhm1yesj14PNFDpxlfbLbRZsM0ra2LV2V9M76+R7teECmX59GKfKrwbxm8NTcJStPjnRKTmzYcy4rLOwdkKLIawwIRvnXkmUXBGESTTak71C0MGBvz+GFTcwJkNqQdB77+WrkcA0FafdpUvdd+oYS12GmAkG1qOgv8R5tMlxIcR3zlLUkmKzZxcrhJ7l7C8zJ+wcR+MOxkAa65HxUEC6lt3IQsu/9OzMux2iiS29sHedBpnA/OhVNky0uezt3F7jScWWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dilhVXhNq1ywXgg+8LGKH5XyDF3DLqZ1J8b2QodLol4=;
 b=nMreHidPXTzzLtIpot6EvYdlCEmCbMUnd+RYfaFZKGKpB9GXjWfOT0NZgVjPgBLUJq/IEOnV3meHwObzWdpvBG2FIpxanJK/VfIuaEzIJV6OeA39BQBuUkmUWFZ+JoY8f5fkEPCk4UWa47L5WBxE5rxkYqvYPzN122dWIW6t6M2wPlCmg6n6o1Gh4u4G/aBPpjF09xBSWARg67ej2iDwsR7/vtRTsvPeTobB1mgtNRPsr9DZt2DSv2fJ2ER2f7tBgonCBTLQdFoSx/qViLEbsCK3mkb1klhZ06P5G5EiqP1dFKA+w6tdX/VOe9w+k0ipQksk0cfp0hCcn/KufAQsLw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 10:45:26 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::94ec:317:b98a:30d9]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::94ec:317:b98a:30d9%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 10:45:25 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH] kernel.bbclass: Add force flag to rm
 calls
Thread-Topic: [OE-core][kirkstone][PATCH] kernel.bbclass: Add force flag to rm
 calls
Thread-Index: AQHZ8GaOZVaecidEVkCyAQWELie4/A==
Date: Tue, 26 Sep 2023 10:45:25 +0000
Message-ID: <20230926074358.48827-1-alexander.sverdlin@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
received-spf: Pass (protection.outlook.com: domain of siemens.com designates
 185.136.64.226 as permitted sender) receiver=protection.outlook.com;
 client-ip=185.136.64.226; helo=mta-64-226.siemens.flowmailer.net; pr=C
Resent-From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AM0PR10MB3297:EE_
x-ms-office365-filtering-correlation-id: 79465615-5de6-4f42-6d97-08dbbe7db0e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w6Br2aaCyR53a2bKGNO0faITT/spfV3JYnU3D3FB2qR6M5IbzqRPv5zd3diR8KWiy/OV2LcRc7O+8oZO/Q+I/GLiqGwwN4CfG7g4p+4Lu09EbJlS4GVYgVZPDsLt6EbzeXiyS8xEXlwfDvXyuyeeOlmkJFE5QbI174leOLHVj1OTY3hlKnd/9/yfq39SALqvrRgQI121ZoSwPQP2NosWGcAwq6ddDpQk4mXVD1vbESMZXxLJGt73QpoUk//aUrOBnU9EQdRF7w+hjeQrlJ20Sbqu3g+aWYQ4Iyx8YWjfih+pojNqeLbqp2II9JQYbgNFQwmGH6UWY8zJpQzORp2xbxx3CwfCCxWp9KzZJUkolMDG93lZ21dVyEryQ+Ywt8spk8cblh0Uj4RxoLgaYPxNwsGf4N5jSd8P8P8uWB7hajUtVX376YxrQ7ngTvfnhSGB17D+QGqtRQ4NGOCDznUBVa3Vwl+pQy1fmYghwi3YqvWFXfwiZZzsyxzOP5BR5zqjwc2K1iNMzpvp/q0R+o6hjt7r/E8uA9yiMxGOOuXmD0SyokYpbwxzcs18aaQ8+FQ6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(5660300002)(83380400001)(8676002)(316002)(6916009)(41300700001)(8936002)(36756003)(2616005)(66476007)(66946007)(66556008)(66446008)(1076003)(91956017)(6486002)(64756008)(55236004)(6512007)(6506007)(71200400001)(86362001)(82960400001)(26005)(122000001)(38100700002)(2906002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ZKGhlfryPbnYRrtdTaF5kZogAgdC3FdI7Mphl7GtFJOFHJ0KHRn8NQ2A+z?=
 =?iso-8859-1?Q?xMaiOALEkLsJOZ6jAQ19v+lI7oIrnH6ta+5864Tsb+PTZuYNDaZvtAPlf3?=
 =?iso-8859-1?Q?2gXtsMS2ENP0Z0WAkEw23rHRlUI0gfXIJbMjB5cOgX9Ly/gL9OW1GWGZ2P?=
 =?iso-8859-1?Q?D+IsugAETG38zzoeVsheANekHdCOOYNi1GpxLavpoAsQe//hC39pxoPMQE?=
 =?iso-8859-1?Q?hVcrPVh9CMrSm54+eUFBwmLzFUFhQXxz5asQx0l/T9kq2arNSBEXS8G1F0?=
 =?iso-8859-1?Q?VGKc7/SEuvBu+S5RnhFYw98g9RyKnUsLB4LBo7IVkvthWy7qJqHIAoKO24?=
 =?iso-8859-1?Q?/4HfJq5thXvhrRPbf6X2xqOv0cchWyfWRk4ePFMSW3SQdqoq7MBcYLQcXh?=
 =?iso-8859-1?Q?gU/4a8rEc5Y24JVlko3CO5AnALA5jesYt/sf0o6ZUSs0YhDpOQ15CHCCcE?=
 =?iso-8859-1?Q?+8MBwFSdTCSjpncasEVnBV97OcScWRhZQ11qJ/l/Kijfh1PDMKUALJ70ec?=
 =?iso-8859-1?Q?cXb4EqAHHe6rvby+GyicbuGjsgzxMSe+O6NQE7soo/l/3uNZs2dYgVQtrk?=
 =?iso-8859-1?Q?3zuslEee4YsGxw9u5b4pBhqwLzQOrq1xg2Dnezg/LEGNuMT7NDyRKgECh1?=
 =?iso-8859-1?Q?L3+4y3fVcVZ+ePylMnX/4+REqCYU6FW/MpoTfZBxzOByf7iHu1Hw1linsO?=
 =?iso-8859-1?Q?7yK+AW3xAMoDFJhzS8qcozSBso9Y717aOfdA8erR16BHEddMz32iboPQ+K?=
 =?iso-8859-1?Q?KEnvLLjNhoiLdPaaPi/7xeL0kqU/GWlWV8FDcpjz5blimgeEibIjrT49BC?=
 =?iso-8859-1?Q?cSXGIRTKlchXGIiWoE5hniJAsoqJ3FN9DM7Cp3brNxKkpL/9Hbk7Aio4Tp?=
 =?iso-8859-1?Q?J2E8CRp/f96Hw28mTU+PoNHfSVB1d63BsUQWx3m7sH4y+WepcM1NADz0yV?=
 =?iso-8859-1?Q?KRc9Mj1mmj06iquUad7IiIXME7xCWoak1o9uz0nvLKgj4OgAxNY7Z8AhWr?=
 =?iso-8859-1?Q?piaEjihUnscyQnZ8smt1ifp183Xom4XEFf/hWwlXIIOce93QtZ59EL4Aqz?=
 =?iso-8859-1?Q?uMy5fp5d1kVt78LMgRuezf1D97W2WHctcXco/cjaKoA/uc4YlLV3EIvGIz?=
 =?iso-8859-1?Q?3v4N5eAUzRtO1UuOyUyH2D9z53aGwYQgD5L/5XABWGtLmMlE8Jhi12gdFY?=
 =?iso-8859-1?Q?AWqDIkzODcHtTkn/kaDU6kPhxJiwGbmQoZVg403QCLI5kaPiG//EAb8IGL?=
 =?iso-8859-1?Q?oWUSxiTHTHx5etsfH8l1FwZYEjwVvOKZDS1XVDHfxtzHNqylykVu1328j2?=
 =?iso-8859-1?Q?j+tR8lcAzpplWt6VUw1nzwsUzAaCfQplPRiYojO68Jt3QDHdRqKDyHQyZd?=
 =?iso-8859-1?Q?GqlL5G+ZrtRuPI26CTT5Uy8BwfOMk7UODK7bjixAiIBHo68qu6NI17B93n?=
 =?iso-8859-1?Q?r4iCFjynZHZiZWs0I/oyGaQNgLjWgdUMc5sK9RqYcZ4gfjbA6JXJuQ1nnI?=
 =?iso-8859-1?Q?m6LL8FLdJQfbcx0OIySIRBLdXGVTw5+/YwaVx8FSZbXHNfsThquTedhWxU?=
 =?iso-8859-1?Q?m4qSo51L0a0oRtddhhXBEPLcNGqisGaZ5v3aRoYEcXQ0APtgYw9wXqNjuN?=
 =?iso-8859-1?Q?8RYhLx9NpiuXGX3LHjhppoOjCpnZw9ca947N/lMIPE+zk3Poa916W6bcqQ?=
 =?iso-8859-1?Q?VgNr3iqIHw+Vy/J7Dv8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79465615-5de6-4f42-6d97-08dbbe7db0e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 10:45:25.0498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsPSrVTuasjNaBzxbczxSyiA5LPT/Tqtfrx53/aek85JnWLtFw1NmcKrhl0phfM1/3pAbVk4I5+UK6BEXkn1TkdlCCVDILwDzsVyU/8SVL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3297
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 10:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188244
Resent-Message-Id: <20230926104531.B9896E7D27C@smtp.lore.kernel.org>
Resent-Date: Tue, 26 Sep 2023 10:45:31 +0000 (UTC)

From: Ryan Eatmon <reatmon@ti.com>

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

(From OE-Core rev: 2e669bf797b15d803e7d6a700e449bdc467a4bcc)

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f7d199e917..5951347361 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -442,8 +442,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
 		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${K=
ERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware module=
s_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
 		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type=
 d -empty -delete
 	else
--=20
2.41.0


