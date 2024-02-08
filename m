Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3642FC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:10:37 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.78])
 by mx.groups.io with SMTP id smtpd.web10.1219.1707415836437691662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=GOd0TFR8;
 spf=pass (domain: ni.com, ip: 40.107.220.78, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1kvIhkIRyAedz7fnR7JGRdsPz5uVPyCYUdK1j4c0HqYHCBYed0KZxugT9UVU4sjEFB5eoaPDzxE/W4di8sGkH1ahSDA6+8rjzQH5ty9DlQ3XVZ3EnsDLEIAVnSbbsQo8aRddx8QODxZqFiCr9pwnWwHCOIMQfP6TRLt3xoTs79mQm1ELjBYxFAI9mmhD2y2ThfmFX2AEMK6I/OluR1XcD9I9r+CZ/glHN50L+wqNnbntLfDcxIhgP4XeIH1JhVD5KogKIQ7WSYU6Or8Mnm9yXa8FRWh5Pbirf9EG4/hA5ostUiHmrw57+97zwUlDjRMhb0mRQpVGOaONLgVEOwjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QygtK46hpCuPNl2Ci2vma+ypv2Ymu0wGov8gvhclgE=;
 b=Y7pXXwDs2QltGcWcptBWajl+kYTYXNQJHCbnGUwCgMXTZsRmNx6rNwCOJJCQIuCG3DBbElQFlKn3GtqXiB8BxZDXBKdymzGl8GUQsL+xhn2OIaTMTK0MxBOA5ftsVbgiAG+mS4w+yRu9iwJgLV10xThSWCsCIYDaV/LJ4LAs05Icscp7hUEb+ahx1r/2zfh4mI9aUIPzrD1mAQiKdKBjFf8NelQtGA2hrx8KX7t45HpqCpoKqy6jngfowPUpUqXhehr/AmLdB/nhVmTKMs7tCcoR3/RZubUR+9W73Xu6gSvHHwXuEc/Uqgv3qDXyz9gwm4DOXK+g+SanBfi5qELzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QygtK46hpCuPNl2Ci2vma+ypv2Ymu0wGov8gvhclgE=;
 b=GOd0TFR8xRSt0BPDkNU+1kDvw6NJo1RBzRycO8lu+OydKuhaUUacs3Tn0W/7P17Gea66EFzxhRp+YrTw70McA0iC+8XK22ocLgEkKpmA/ddrHi+tlSSULo+9gL7116AUP9NdtcrhAp6KCvuv1KudHcM3HTo+UR9kXpWgCKgRKbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by BL3PR04MB8203.namprd04.prod.outlook.com (2603:10b6:208:34a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 18:10:34 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 18:10:34 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH v2 2/3] opkg: add deprecation warning for internal solver
Date: Thu,  8 Feb 2024 13:10:08 -0500
Message-ID: <20240208181012.1019913-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208181012.1019913-1-alex.stewart@ni.com>
References: <20240208181012.1019913-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:805:ca::25) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|BL3PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4d9f53-5596-4e5d-4edb-08dc28d13eab
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LXbzRo/OnkJe2nl3fXbG22A4ifJnZ7G5utLxgabURl5PDVqU/v9vTJ06e2rDyCaPW7sRbGRh/HaA55JDJHZQcoC+N1U8+cMIkoD3I5XAtLi7YGq46DWFeBgBOdTaW4raXasOdX+APMMlUwycLrqykMvHjirLQNxi255R+AMAHMDVgkONiH/FWLKxfNSkPpIG1NRzpxbJ2G7vfCpCbYhUnq4dds/KwyAF73EkNAvkuOMzUPsTB2+7NtrcL/RG39it6A6K1KZcW2Du1zqqF9kq5ADN1NRwm1h1zoDu3wAJVBe/8htwOw9gR4uvd+vIWVO0UqIYEEoiUFBag/9x/Kc6gQtoQcIEDSOohkbzGNwBBwlhUwDg8DKa/DEpp8jyeX0wo7vzmjQjXj3NcYB8T2BilDIWEBKByWzGyrrnkDZBvrJfknh4zAHFNKuoFZntIHeoddgNwu28Vvb74K0jnpnyh3LHjJiJOvyFYSfqwChFGyBcgky1mtNWEhjVGJSGfL+i9LDiaWAOJyyupc8/dm8sKHN2dmKabb8oIt67wrg2GXW/iICt1JTaGNSUAPna00nz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(36756003)(6512007)(316002)(6666004)(4326008)(66476007)(66946007)(2906002)(44832011)(6506007)(6486002)(478600001)(5660300002)(66556008)(86362001)(38100700002)(6916009)(26005)(2616005)(8936002)(8676002)(41300700001)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RhLscH23TZ67ClBUt+KA1c0JCfq9LOMmZdge10n1bPsSadUbsTLWvsisulL6?=
 =?us-ascii?Q?BvcFGnGgq4Q9cGSgAErPbbILnqqhg8QTwKFur5tHvLvuXQXRf1cuwMAW5W0u?=
 =?us-ascii?Q?m1cKVclGzwp19dMm16a+MwvsqgLZL8ikB2owgIoyID+0w1bgFlDzatfaaiWf?=
 =?us-ascii?Q?HO3L3bThOT+UwDGY38ORevjrC9Z0+VgejbUyHi6HRgK2c7JtT7SA4FvKBlms?=
 =?us-ascii?Q?4XKZw00u9W2pnzHpN9OrqHSuGb4r4o5uzR56YwRV5H5DZ/CTwdaxlD+n34pA?=
 =?us-ascii?Q?MzdaIYsybkWk7qPIYTvHVpyB3y1gI+piSWgtvaigkq0wHZaM/OK2l+FZAfiW?=
 =?us-ascii?Q?jGcvNBBKiA9bTU2ksktVREauhlb9ulUfN6g6lmmtsO7wvsVVktz6CiwE7y/D?=
 =?us-ascii?Q?gsFtm3zOP9TOLqN+U030C9zDS57eMmO5xO8/86z+PmxDEIp4KoEeINVEEobA?=
 =?us-ascii?Q?Gvak0Tkqo2AZzw1/ipDD/XjtT4Y6GFpZa5aq6EzRTc4cfedzXp5vvjIIx51/?=
 =?us-ascii?Q?VNcCj07A52bCPT4Aqgt8YoUfPbfJO8krLyVnezuiZ26ALPQ6SWDZHvmYEVXJ?=
 =?us-ascii?Q?r6TIvZPnqpq+mB0d7fNwAbnN2rD+jDcpokx9FclsTsvcM1LFzNOCF0SQasFd?=
 =?us-ascii?Q?tZP1Pzuvqh6/+jrjRbQ26sSH3U2FQj7uwVToKYQeoQwhGVeSFzc2DX5Ogg2b?=
 =?us-ascii?Q?yK9zBLSKg07ew7HvKQB8L3xmYG+E8wD4wHNBoclvyskum5/4Y0WxY6G534Ko?=
 =?us-ascii?Q?foheQyjVg2X7cS4AJFZMrLc9aleft7UbPrs5h7wOheidXCOb7EtqOrUo7Drd?=
 =?us-ascii?Q?gMLc30+uGWpKo/EIyG4RVilVUFWBleCsTWkyucy/7virynyQ1Yzfuob8TD9D?=
 =?us-ascii?Q?XBubtPu+UIGoZB/mXCdpCa360bggTk/a7pPqP4ay8MGjQG0uG5whBItaqou6?=
 =?us-ascii?Q?tjSYM1sOFiedJSrjt78HdKFPXASTmZY0+qyBqSufA7Vgct/E5i5Z3rVVo4Sd?=
 =?us-ascii?Q?JzYY5/YB1QhGnap3paf/oj2OcbLpp0YDYgC859Rzn9vpatDQFrv2HNFt1HlD?=
 =?us-ascii?Q?6PYIoadCuoO7byLkMsmHcUNvG2/2OGpEILqGSf693XztWFVW0U1xND4kslk5?=
 =?us-ascii?Q?7Ln6OvK0RtiUKnuEDKvUJFHmqt4zvlRhmLuM3soGRNIJCZLCyjnXtvikRWqy?=
 =?us-ascii?Q?RGMHSBJo8ARzL94QJ5SsXjIC6TURB9hdYLrZek3vI0TEcWYZBI8UYejLMnsb?=
 =?us-ascii?Q?weDkFOYyvXkXLMY52FEwQHujT0bhckbSN+GPc7bcVefYAm8CdsQQULCL3Gv0?=
 =?us-ascii?Q?0adOmSMtd58FmQexcMfVVlcqwIJDzhy+2loZsmmmNdvgRgZrOFwRURw5CZvM?=
 =?us-ascii?Q?rXNsq9ox4SeRyWQ3SIfggk2Hq878jBOksnhgw59kbsmJjRxhXj76P4seVvzy?=
 =?us-ascii?Q?Q08pwwXnnY6M9F/IeXMCjmm3TRbftcNYIRjhmHCAVEPIu19HlclML1f/9EQY?=
 =?us-ascii?Q?z81tDvJWENHnTEVpC9hsDXlgttDtY6KNmzGmyiyGmee/rp1B941+IhN3lydp?=
 =?us-ascii?Q?tPZJw3z2hnUSQL2vzKyQo/6efzcub54dZ0D0csPj?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4d9f53-5596-4e5d-4edb-08dc28d13eab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:10:34.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1LxHh/S22JxofcVfJuzqCb5OnrjLF7QV6ZHhgN4nK6DJhoSq8poZh7oV93zDlS5bq6x4PC4OoA7ox5f4AhK/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195169

The opkg internal sat-solver is marked for deprecation in a future
release.

Add a recipe QA check to warn users who have the internal solver
configured.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/opkg_0.6.3.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.3.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.3.bb
index 1f15c44e3e..9592ffc5d6 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
@@ -61,6 +61,15 @@ do_install_ptest () {
 	sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0" ];then =
echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
=20
+WARN_QA:append =3D " internal-solver-deprecation"
+QARECIPETEST[internal-solver-deprecation] =3D "qa_check_solver_deprecation=
"
+def qa_check_solver_deprecation (pn, d, messages):
+    pkgconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
+
+    if "libsolv" not in pkgconfig:
+        oe.qa.handle_error("internal-solver-deprecation", "The opkg intern=
al solver will be deprecated in future opkg releases. Consider enabling \"l=
ibsolv\" in PACKAGECONFIG.", d)
+
+
 RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-confi=
g libarchive"
 RDEPENDS:${PN}:class-native =3D ""
 RDEPENDS:${PN}:class-nativesdk =3D ""
--=20
2.43.0


