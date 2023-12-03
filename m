Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD948C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 09:27:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36000.1701595657973928382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 01:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DF/Bbxb6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0701187513=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B39RbpQ018094;
	Sun, 3 Dec 2023 01:27:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=cyntggoJGuW8eUkYuP
	uxMVkdKyc4vo8zrS3JhTBBO3Y=; b=DF/Bbxb6/YCjUvHPrCIKSVkOGdE0LrwOik
	Pk68Tq95EMKSOgzyTlUHs1hN74HuWY2NWmSKuzlhh6viSiFIXoOW+9GnhKXa9xDI
	QOr1WyanNGbjvBe6EM5tto/IGkd3ZHoWzgqh4j0QVTmJkkEt8viMTYB19GzWe6Or
	ruXejWlrWXB6iiXzkJJQ3PXlJFDRpnycQKf7kpbJMypOSp6Zv6fXGPrHw1B1Z5Ro
	4dtMgny21vXVW4BxHJv/oNkDjerN0VLb3rvPZDK2ePTuGHYtJimzR9r9TOt0TBKF
	7KX1652Odrcc7hDjdrc3/pL9J4uJTa601nUk8adwl9JJGoGSTP7w==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym0fh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 01:27:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljxAJEhW08cs7jgwXAnzkmoPIkWyAX5Z+Uk2kQJJyuvRHkev/ZpRmS7Cm5obRx8qybFsshTTletjlBc72KAffDGAE9NhrM6EUO+RsM0kCuKl3MH8j4z2Nt+4/bqGZ1i9HXGR4KwwmhUVT86BbcNelVyJyvtvXXUS51sQeLCW6SCQVUJtUrueZ7yaER8UcIS+yXKHR62jK5TsiRlmkzqGCW7BesVebCIw5cIveqQ+1PfNWKA5CNDWq9YrRe3KYytlbUL416vOvZd/hCkzZ3CojhkgV+ZkuPuHi10ObFXPk8dnfwiAdaw/DlkfGD58eD3FT/0KQfmSmN0MOY+LkcKvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyntggoJGuW8eUkYuPuxMVkdKyc4vo8zrS3JhTBBO3Y=;
 b=dvcylY0wB2T7+Z9rvex26H1p+do+t6MtZ7IP7pSCzMYPPJN+l8Okpve9tfsjKK/KZ3IyTp31OmwjnHFz/VpKngLWMWLOz3GW3gLQLqeUof8NH91I8p+wJgtXvqLfVcz0QjBMp6iqVTbk3UrUQplHLFXRguuWupkTBH3G8VvJGJuf9tS5svlPIAywj7tJ/VKhQlgGszb0nYaTxhLom0rSIWoTPwUxYIzj5R/lVL+mMeI54BWCwhHLGR9cZNVQDkQaTa6OSVxboa0P6YZ5N2L0Yq/MfMnKKh+HaytVsLoxEyBO+tIkqnjA4NcsPDQDptDUu7jaO1SOy1XM1SAf/+kcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 09:27:35 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7046.032; Sun, 3 Dec 2023
 09:27:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] json-glib: upgrade 1.6.6 -> 1.8.0
Date: Sun,  3 Dec 2023 17:27:23 +0800
Message-Id: <20231203092724.3484441-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096::18) To
 DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 597eb496-354c-4cb5-a629-08dbf3e2155a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JpI+4HlMm5mvJxAQFyLzdDhDeNVSoPiJaeL0036QsqhSTcEg310Z9RRI/CKy3HOw10xH4mHd4NWSmyaBuhT3BisrECkTDRTZes0wVJin+5PVJKvcl6lEpxoMcuVSeNdOWkkVU+1ZKblWzblNvVqzaUMAl241YQ2zNb/AJ3xD8Aa7r73/HbjbNLdLYg/Sdacd6+zCrKKxUwmQdTd/KHYKK/F3+qpd6scgcS1HrxNxCx7fvhvkZ/XXM8mKsHV9PldTA6WtrXw+UsQgCJ6hySpd6Lp0HElX4toXcsO/ryCDJYAf3wwCji+t5fcbpYzZilyAXdUrvDELVFm4vhMrVrwPIwDiLzS1KY7GTLdB0/O3Wu/OschfjLnuvjIStuv10IbRt+6KmFBrTCHAOamkLtwuNr8kDmp8GYFXgIN/d6zL9mwURmCSG7StDHgdTMXbWN2aVxK5mpGgRcx4mP8tcjrZ95YyXWArchhZOQuXTlt8b0Adv0zVUsIKy/NYfIgcX1N3IVc2Rn03dQO93NphsoEwXE2E6iJcyB2HHe17UrBJWaLD1qauxdTPYIEfcUGelMYy/ycQi2C+FW1YlWDFnmSB/LNJG2T1FsXi7bx5Wg3WIy9nKpjtzR+ZLAHTVRXhOIhy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(346002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6666004)(2616005)(1076003)(52116002)(6506007)(38100700002)(66946007)(66556008)(66476007)(6916009)(316002)(6512007)(26005)(478600001)(83380400001)(6486002)(8676002)(8936002)(86362001)(5660300002)(2906002)(41300700001)(44832011)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L94alMndEMnqpC7dtj6IQ6RMo53x5MLUBgNAe37Z1Nz0WqSnUBd4SJ0eXeBt?=
 =?us-ascii?Q?jdPn8f2deZFQTTMvXPWo98t/IWs5tJvjvFqDDGep0vk7yzej8damNKg5C7of?=
 =?us-ascii?Q?7pJrbpoCVDUDrWnYx0SEsCNLSRE/1wipbjrEz/ixUVGzt9pgOBEGMG8AMQ+D?=
 =?us-ascii?Q?syRcMKa19Xf59xtMNGO9Xb6x6TbfNhZ9utV6Lh2mHUj5BAKUUXqhQNTeSEDA?=
 =?us-ascii?Q?21Gx/nxgFnWv20cTAQ3x4l9MlmdLfuscdl0QtSlzcwCaDYWmB5IRgfx2rh+a?=
 =?us-ascii?Q?5pjPAID7hnwDnnhO9QzlkU+GUpyucEekaaluVzvQUvZy1wdjNfhRdNNWNSkk?=
 =?us-ascii?Q?kvxs13lTOJVO6qFay14DncmiQu03hlU+M/FGkOSbtcwjZgk9hFMmekgy/TaA?=
 =?us-ascii?Q?jMqiNW9+OZ+aXQzwHUtEFgHpG7rRy/eKfL2E/re35BAm0e8kH9HmvOWf0Thc?=
 =?us-ascii?Q?pJFD6tlwD85HYilhjV1dQnMx8u+JpQIk4iYudx5aukht9sk1xhgiaPVKtAZz?=
 =?us-ascii?Q?NfH3jYvLB3+r8/ar96X2+c1I+qCV91BeT0xNHK5RIzesDD99SiILMbKgDG8M?=
 =?us-ascii?Q?sCp6qKBOLKoNXsqG8+oKSadi7kF9gH4HvMpRiBPBD0cMxuL2UTdP/aa74Htr?=
 =?us-ascii?Q?sd17DNe3fn5Pr/dFTIvy/LzcEkJ4eD3VAqb0tjFkoj3/AYSSSgjfVPGnQprs?=
 =?us-ascii?Q?Lil877BX6Bj9eeZihtrecCGOKGjgnpuTxowJk8qEX5EKhT5mDou8TtJ2rx3B?=
 =?us-ascii?Q?RIjJo5YJAjzUp5riR2DyB1OUU6K6jTaAJJov1JnTn3SPp7D5d1Q0JPU7KL0h?=
 =?us-ascii?Q?va4a2C3JIXtFaXUhvaBfuC/WVplKhyRwCOeFW/nT4qDPAMILEuIdbjm4y4DD?=
 =?us-ascii?Q?d7mC7Jo3O1HsTTFahZ3y/gGiCeYMP2tezRlps4w9JPc4ZHW+22bwN/7ZiJTG?=
 =?us-ascii?Q?bqDoqKfCoe1gv/jKeEMQRLX2ghsfoacSPMml/9gmTVI63DSMrI0NkenvXuHj?=
 =?us-ascii?Q?AnTxf9ECefwFeH5yBLU8cv8pOIdUXer6JcPkT4AzzVoi/+gAhD+Pfr8fbCfB?=
 =?us-ascii?Q?lPnFInxhDPD1RrAqkp9Bm8Vq5DTq3o+6WEZJGRe9c9egQZnr0CTMMVdnh5p5?=
 =?us-ascii?Q?nZon74u3pRULmKOOn/TOSPX+54z4ef30qq+NzVsfiqR1aHPtAghnvMzAHoGB?=
 =?us-ascii?Q?lNx1AeAn6dLrgruLHtlIf/Jz7nJmMnICJRzHqWcKz9tLtboasrpL64eaZyEE?=
 =?us-ascii?Q?nZ9PZtklEZODbB3bkvly1pbNLqXD3RXUIYus63htGcPGDxDRMpkyidRQxACe?=
 =?us-ascii?Q?+jbPIAn7alBHwMlWgNECCi2KZ5XHpgx+SCUb/wk+PoMa9aCL00wqn4oYrvf6?=
 =?us-ascii?Q?TutVdN2VQ9oeSRqi13O9F7XBr11pB9JyOS7NdMbBANRBX8rUveSnXNEbPGt8?=
 =?us-ascii?Q?D7mN5RiQZlS3OECbERH3G9zys+1X4+5rGEHUy8/nEj0CCM1b01Xi1Ike75QO?=
 =?us-ascii?Q?6znT6/RXqAx1wje3NEfoxwMWgjXTqghtujkVMuhd9JQz1kUAhUsGeoy+uEPc?=
 =?us-ascii?Q?WvB1sZ8Chz6zsEC3UOrNU0rymETpM0WO8kWuzSXd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597eb496-354c-4cb5-a629-08dbf3e2155a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2023 09:27:35.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddeu76YVRmG2EhMF4qBiQmCu+R5XR79GilW6r5MBv7ZTrnHi6zXxPvW57f6HZshMpF0aECL/6ci2/jQgiHvLdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
X-Proofpoint-GUID: Q_5lbcvinYUkoGmVYS9ms-X6-xAqbwdq
X-Proofpoint-ORIG-GUID: Q_5lbcvinYUkoGmVYS9ms-X6-xAqbwdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=459
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312030073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191704

Overview of changes for 1.8
==============================
* Build fixes
* Add current node accessor to JsonReader
* Make xgettext optional
* Avoid leaking memory in error paths
* Update test suite to conform with TAP
* Ensure valid output for exponential notation of numbers
* Translation updates

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../json-glib/{json-glib_1.6.6.bb => json-glib_1.8.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.6.6.bb => json-glib_1.8.0.bb} (92%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb b/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
similarity index 92%
rename from meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
index a9a71953c3..2094ebe3e7 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
@@ -18,7 +18,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e"
+SRC_URI[archive.sha256sum] = "97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.25.1


