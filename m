Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22451C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:08:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.123410.1703772524190198861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E73fm9hs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1726ddfece=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BSDVBQL019036
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=nhcP8zXo/sg6qcIa2l
	oB+rQUwS7ASa/iEq20bALOKec=; b=E73fm9hsn3XuxZuounLpz//Vqb3PkmGW5Y
	jKgK0m5eyOV2OZRT6B+Hdh4cadMQAo8QgMPkW0Jb5nQTy+L+avCLnSL1FVZt1pe/
	EkAEKSUvIHrpJxflQ31ygjbx/5tIIUcsMWAAw9zrCzh7166rQ9m2qhz3HZJoXMRZ
	Sky38dgSa2PlMxiJ6x9pWhmQVXuGedcluLg5sOmjV9mv9RkAk24XRjdfN9jmde7A
	uS0Clhu8TrrWLGwORdFcpOHWW0bcFrmNLGbC4YE+PgsbudSzEbEUFfN403S81czc
	wKnbIEeWEFeUoC+infhxjvYKmv7Kc2glH9N4O0PYjErfrbymOYiA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5ph6495v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:08:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n13EUcjLVJVPvhkcwY/8kQeRo+q2PNvKmFnBQrvWdtY+TmUE0pu3aypwP4l3RQ52Dp/Mfi4thMrZhiLfcJfMd92SHKM6/qqurKj+4Iw7qoHhiD3v0ny/IRnwJzmDZzhuu2fZWqI13EFAAlIUPsGHb4fb4bNPYztZcu2oX1hhAQpnzVyZXNISkzxpfX1dSf/Gs72ATEK8diPPRufAID+ToCfJjz9BIOlsxQ71mg9s4yIOO0C0GepJnv0/8nRnOsm7Vnc/YGlJWrX/3/MZwoIcPfhPq+jqsc7pHusGasexHTya+tWjg5Ni0Dp55JdD68pIp/E50yVRaKNRVeoYqA3S1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhcP8zXo/sg6qcIa2loB+rQUwS7ASa/iEq20bALOKec=;
 b=lBnYVqH0Dr5X9zZPRsWfQF6hHJh6xCW8bk0O6kFiThPlNYE9+VXuYiw6Zh17np22j+Koxze7mnoxPnLg4TJqcCKm9OM+uuQ0a03G3szWrxmLpOB8E4ehbRC55JLvdeiNdNjQEE+0ZnpxJSyA7pFdp41bZnJtvLoeDoZHf92LfdxK7IK4cg4hAjfq/w9Psp7FI5G9ktT37DT1xsqLqWM6hEfr0q1vZQOK6P+3DyfhbhoQvwW6vnI+wv8s4EAM37O2BvevuH7vqA4kbHcVrcT2Al9ZrSh79nOKTXwqmqthO5JYFCP8blzUNDEu50GgzYPGyVqRCP9hlma6o+x1EEWogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Thu, 28 Dec
 2023 14:08:40 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 14:08:39 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Harish.Sadineni@windriver.com
Subject: [patch] autoconf: Add missing perl modules to RDEPENDS
Date: Thu, 28 Dec 2023 06:08:00 -0800
Message-ID: <20231228140800.1673928-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: bce3eef7-4449-4e33-ebd9-08dc07ae7dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xH0REWPCGL9DrnHGN+7rvREe2kfnKYZEWiiqwl5us3SENiztaK2HWAizEgsrfQqWK269Vr1A3ARH3u8RjBJKY5vinekrL0h1MfRYbDO0vh0oaZE7IzJF3E1kf/EW6XUJdvk2qkCQ7PIIOX6Epo9g6t699c/KiJoSzYpnfQWRU38KGDo/PMB6fGmlNmAEo1f6LmC/ETknc9EiuxQ6Ne72QsF3mS5qAS0GK6hOhEh/Nhatbarpu9ZocgR6pwlZPR9P9LnarP11hzghGPRbKDaWjfkilYHf+L/SEqI+iO+emsU7AlhW37N4bxeYkQN/gbIXALLK10pCKmPpKaHNytffOlsx10LQ2Kp0rm0oPMa0JxiAJQlVlHe0BSGv1xAxAdB0QHLCLqk74dYQZVsbXX7s9/yyb6xmmwb0NLHlm6jk0JSUz/IdT1C6hAkdVMwdiDG0iYlpdXTiw74movkbyEdsed9MkLK0bP9YggHSIEdHkhBPIeYIk0I+USxELk6YK0fFCDAuKMHwniVbFm97IXX3jcfZjrfwS4sdVEZaZ8fIYa68PR+GVtdPuiirjCbxsLZRSem90KVgZFW9gMqic+9Svq2W4auv/DX5lfh/FcL+4jwP0l7kxHa1wB38v5WWeM98
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(39850400004)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(2616005)(26005)(107886003)(1076003)(6666004)(52116002)(6512007)(5660300002)(4326008)(478600001)(9686003)(8676002)(2906002)(8936002)(41300700001)(6916009)(316002)(6486002)(66556008)(66476007)(4744005)(66946007)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kgWAls3NEg/6fcXGCNgsJFHzzmSVYD8XFK1u5fUbwo9HVP3zxJj50fAqAIoi?=
 =?us-ascii?Q?XshbXHiR9KIQSnxqEhCG3hRxHYHs9b9BVP8nKVMOPk4xR1sIE5o3FVL+hiqA?=
 =?us-ascii?Q?9djEou24A4X8Jbv8nXif6TEEcUr5BL+FgaY216amc3vEl4SCQr7pcvWhgfxt?=
 =?us-ascii?Q?JSDm9Z/GVG2KM2bz59hfCgcFrKhe6bvUnQoDiPyMOE3DTqtAv4qbz4gNBL4A?=
 =?us-ascii?Q?QSZ/ZBPUELDJEq2oplpUJyUCuxpMLj3AaJoAVo3bfHjplG0f+Gp5icvrk8V+?=
 =?us-ascii?Q?hlH2VhQ1JUM1gvobnM1d87cRur2j5RoHyAcNSwb7pQRAtm7ttjxgIykz6oeO?=
 =?us-ascii?Q?PiOeQ018+dD8uZ4Noo8pkZ4+cU2KQChO6F7k+l90UsWBE736iRGxGRoFwNkJ?=
 =?us-ascii?Q?LYP+PmBvMAoMBnNTvrhGkQp/hesFMpQDN9XwbW5Av9jsVkBBzyK9PLZ+ch8w?=
 =?us-ascii?Q?YNUaCS+tcuGJf8eqyeLcQspPILs1uA9i2zGIYEbNMv3ZwsCp71+cLvwE3QhZ?=
 =?us-ascii?Q?3MMvHjGZJXcjyMl5yi09gPqM4crqr++NW9YPE0d+qb4cSMLLUzcR6JQb8jl4?=
 =?us-ascii?Q?DT9vF3ab69UctJBiGQu+fX93nObAe1A2jwT9CQCCXmQuExYV/7hFyH3IYy74?=
 =?us-ascii?Q?apHaIzIn/01SYP/ZjZwTb5N17k60H3omZ1JuEsERpKBtmqaIBQFQrWk0bbmr?=
 =?us-ascii?Q?eaQnlgxpPz9Uvn5lI/cN51MJ7Z45FchaovGmEnRvpB6nTTOxwxBf3FehUDHb?=
 =?us-ascii?Q?13OMOtidHlSTTd37NqP1HZ8t8msiG0YuZL04HWzNBR93ByFjxmXe4y2du3fK?=
 =?us-ascii?Q?sz3o1PV8DxODxeP7NkwjuwGFi1AOVfrKGWsocIM8J+RPKXiKW/n1gKAkMm1q?=
 =?us-ascii?Q?HWDWxIhZEE7YTp+GbuZ80SBwGy/kztsOrmlspyj+9llq1r19tBRO+Cj+QZlE?=
 =?us-ascii?Q?xGXxkQegPhC3LUUY3rMulZDzcAY1whPojp4fwlZTnnm53fBx4R83utOXRh8f?=
 =?us-ascii?Q?EIpehPDgtS9JsH/Rap0h9r4Yrc6XAfhUt2Lpjq5OCo+gasYL2HJx0Vwlh76U?=
 =?us-ascii?Q?rMR0lihCfMI9ixf4DxJzPi194DPTD/KA3kaLYaksBfAxXhnIUE0ArfsiWDES?=
 =?us-ascii?Q?2iK/MRNpuFkJWEbmRp9Y1Rhgpp9XRQkBBy4xkYADzALgeGb+TDil2j++39mH?=
 =?us-ascii?Q?Izg6xey65e9R1Ikd+3ASZohqJFsCTwbSG53crApKG0GL1pm1EGzJTiyf39/1?=
 =?us-ascii?Q?CfzOb76QtpVRpKUf6sFy2VXD2tMu1fMGxiETd5ksTIHI7nA9/prbi9uzu+9p?=
 =?us-ascii?Q?wN9rO4hUZOzuMQCVTGlIMHbc/FdLpUnvsi32Y8lbhDNqRNVr7U00YuJPoLVD?=
 =?us-ascii?Q?0X3HUX3wNCQpDA8QuTcLUvRyjA6o/lgqmbr9FToZJygWTU5aed5WuzHSEAaZ?=
 =?us-ascii?Q?0KaKdTrDScrx0qCNU7SYixup4Q6ZI0MdevuMXVQUUgDR/AqSz2azVXlG29t1?=
 =?us-ascii?Q?G0DSBuYDgrlsbhYw205MuLpiF680HwcX7LzHKx3GJ5kftGyZPMazUtOBhOhV?=
 =?us-ascii?Q?BYecGo0yv07PUkDQW3YiMtVYWJ41fx0WWVC7esPqnewS2FfFVnaAVGyoSOI2?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce3eef7-4449-4e33-ebd9-08dc07ae7dba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 14:08:39.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMIl7IRLhhYty2u1FcIMqo5LJIB/FZ0cVCRoUvHWJd7m5asJSLt6vz+dXERwZDfs2nogjbCcALbRUdRlaejRxNc9gPuiPcUt8lqZ+Fcrgwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
X-Proofpoint-ORIG-GUID: OvqfNpiwdGJXhwMtj6dT1VvBgLoy-3qt
X-Proofpoint-GUID: OvqfNpiwdGJXhwMtj6dT1VvBgLoy-3qt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1031 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=966 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312280115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192979

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

In SDK,running "x86_64-poky-linux-gp-display-html --help" fails due to missing perl modules which are required for it to work.

Fixes:Can't locate feature.pm in @INC (you may need to install the feature module).

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.72d.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72d.bb b/meta/recipes-devtools/autoconf/autoconf_2.72d.bb
index 939fc3abd5..d76db28796 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72d.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72d.bb
@@ -51,6 +51,7 @@ RDEPENDS:${PN} = "m4 gnu-config \
 		  perl-module-symbol \
 		  perl-module-thread-queue \
 		  perl-module-threads \
+                 perl-module-feature \
 		 "
 RDEPENDS:${PN}:class-native = "m4-native gnu-config-native hostperl-runtime-native"
 
-- 
2.42.0


