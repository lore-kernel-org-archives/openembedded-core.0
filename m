Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947DCC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:14:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web11.12345.1644509668910751834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=yC5zphWf;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.52,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBZ6tMk6BrePC4QcP3ta1pYkQQpD/jH+5owhtxqQ3pJC/dFcwMoAOuTzhTRwI386InllU+QueYJLf0rAJgIhD/arlo+HNlQnwrCitBEO0uxSeG51HRvTtVYPq0J2gCX7dlfZ3XQuiooLcHr/eYld7ayqd3YiKADShhxZ3XVENQHCCyvvXvzse/RHH+en9E6bbZ9+P2RMIaPvmbklMCI81TQMiJgkMhAVqZZ2ZCsq8go0jH+UNrX1dkVFlP5/k9/dHmgG3meXANz+BEajZfZmJLfdBm9ab9uCkLjNb3OtqknG6heE5ULxzPJiUxL2FRWrTfnpPW8NKrpXXrDtE6elgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gre4ASP+me9fqkBjc3aqZQq2SfB5Taa8yz5rXXsQCeo=;
 b=HQpvDir08QEA6Ewpyig6hZnpQw/W0fmDEcnPNiXO1dbx84g5c3JVAkzbT1AWGsIsE0cdzgq6Yp0XNji8TlnRBCexDIrIFnnHCc8aaFDeD2F1pYlcuvp1CAZMScs2/7wMYy3iav7VCKDFVoTA1T81d+TkAOU3gZs4R6A+i02iIAvdp5UoTXIjokOD6V2LuG0T6EPy9HdgNwosFcl93uQPdQPZUdhpq+3rZ+PipaVd9IbvvBonWJmyLJlDto3yA05ZaP9pd8apeA0WV82cTEJpkk6j2bU72nJJH1oaVI64K1KbXr2sdXGp6SKTX7zS2CcbJX+gy8ei8fFjlnv+bM7p8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gre4ASP+me9fqkBjc3aqZQq2SfB5Taa8yz5rXXsQCeo=;
 b=yC5zphWfzfpgZbLnm4/su358JASv37s+tVAq/d7sqNhGF4HbQjvbwwPQtn7W2h5MFJ0DxCk/nkHoREscdiMfE+nWOnqP26Log89WlsN3GwWhIxnjFo5IwE0LYwDbYu+qruLcYQarkyOFnMPr+YvoE5YmRsndbgbkFrzkjRSkaME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM5PR0801MB1747.eurprd08.prod.outlook.com (2603:10a6:203:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 16:14:25 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 16:14:25 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 2/2] gcc-target: move cc1plus to g++ package
Date: Thu, 10 Feb 2022 17:14:04 +0100
Message-ID: 
 <20220210161404.17199-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220210161404.17199-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220210161404.17199-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0309.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 012b92e6-5a73-4180-5859-08d9ecb067da
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1747:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB17471D33B798C9BDB44CEAC6D72F9@AM5PR0801MB1747.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sssXdldd49apVdotXSvuPGzjNm/haNFACt5iM0QCSY12qHUDqhozP+0cplclH4RExbRErYvZFgfHiuDRK0F7yH3t8HOdn9iFVZ4hnR2w/l+T82NaNtMvFoXo2qR/YSIs/2QA6VCe1Lh77GjjgvGaqhbhGOop1IFXXyhEfsUlVUl6gm45Vbo+Q/8GMbqQVR47TQqXnhx67Dk18zMlM1tLKAmDhGhoayK14YOu51brs11DWP5vL8CNDCW2aFy6rsAS1HMQOpe4VmK6RlsIAdO7qgn1PgAChY2dzbz6TSjUg15I8F6TjjQ26QhMM0M+ICx5/FkwAmySdtk2PP6Rob8CAieapXStvzVERn82KW+SXcNUs8V2Rt/PxbwiX7hZCRwNvCD2d1gsmVBTzeTwNPnxcZEnMEGLsIahp3giOTgPUS/9NAFLkd/G3MBiV51zSsrSV5YPRbKOG+TiiusqxlP5ulrIHEKmhUIPs2ahdyZPhs0wi+hrc/53SnspVHG82UI75om5a2O9jNR+tcjtfHrNqPxlpj14gPEdRjBOsNMAKfpzBy1D0iJT7UZ6L58Kwbvz+KPesUXTyHOux+Yh+GqLtlE6EPhZyGTunVjVgemdKyp4TNU2xT9CQUltpnvt6SsHH9hrs7KZAZcGbM91qXEsCJqGuUlYgz7M52eJYNedXtbjQTbWzJHeWn7/F7Xa9IxVSlMjHgEru9p5Ev5DoObrCax4Gc2T+cjXUFVVMfkhJ4OhX7xt3R+JXbH1l9V1TIJUOOVtYm7pKozsFRkbSh95TUuReZQC+z+wHxE3WR/BFhA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(52116002)(508600001)(83380400001)(1076003)(2616005)(107886003)(36756003)(6506007)(6666004)(316002)(4744005)(5660300002)(8936002)(186003)(38100700002)(26005)(6916009)(38350700002)(66556008)(6512007)(8676002)(86362001)(4326008)(2906002)(66946007)(66476007)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aD4phnz4W6PB+2ZTukKDW4ThbpeHLO/ffHFbomf1r54glWPGxs3n24DXOIk2?=
 =?us-ascii?Q?aXB3nDq3tcMsoGPvn3N44chFfWo6DrPUQA9xaxwAMUWzMD0pSPPZJRYl052i?=
 =?us-ascii?Q?xLU9gdNYK8iZ1/H9nIzoZ4NQm2yIaBWPelsy+uB8qCA20VV4CpSgrOqdWAfI?=
 =?us-ascii?Q?GeXyk4FvUS78+RvJhPKLg4oEZcODyBMJKFOGxr3MPj/ABBr0dBmBMuVSkpcY?=
 =?us-ascii?Q?gxnaS01TcrKtZFQqroZTCcn9NAPme9nPLBmTJ3TMLkRt4IbFGaeVIKhFIjTO?=
 =?us-ascii?Q?2EGOx7RW+Gh8whCEnRhMRrhzNs0LUK6wS0GfdmaPx1WghPT1UZ6kXZdQtK44?=
 =?us-ascii?Q?bIdhO6ZgRi9Xm51CrBYDl0iuqcKsj9QAOUpo4rc5sxcpKgFUhlVMKgMJle9K?=
 =?us-ascii?Q?WmgtDrs1nYoISxr0PhdREeXisPJ8+rpqygh4J67lOoPqsqIT/IDJoHpgdtvZ?=
 =?us-ascii?Q?7n+FxVRNsQ3HJGgjLWwJywGJdg82C2aekvlcPZo6E7DoDWNy7X27Sx9FVIyh?=
 =?us-ascii?Q?yoNzaTGaWsmFtFQk4hQPH4RoHRaDNaqgB5bHo8fVgPLjueSwr6K4/sVpgHW6?=
 =?us-ascii?Q?qlWIlHTKycmc1GCBIP7vgJSGrXdO2za/AYezIa+bJxNqUTkW+ZW+WFIIQnfx?=
 =?us-ascii?Q?9Wzzr21x8f5SoU5JfGRECWo4tYpQHP81qVmvC6bQHsE/p3h6mSm1RSc7a0Ce?=
 =?us-ascii?Q?02cRrKFLmL35ON4STzJyqAGglV3U5pZa6Dd0EAgvfpJ1UEglCBa9LUy958xf?=
 =?us-ascii?Q?nyqun+tekwm/BH+i87dZQTEz+CpC6bsw7V+s867Kf8lNP6SHVt4re7gg/C+x?=
 =?us-ascii?Q?O1IPlOmCIKteRFjDOQI9F8Y/20LltlXT7r5QBsi9FtXOwJrC0+zrVeJf28rl?=
 =?us-ascii?Q?an2WtxXxTjztpSMAvzsN2ENTR6RvC4BMoDkG15pGW6hwY1hjcMdwnW9FDG4+?=
 =?us-ascii?Q?vBW3ISRCyzOGyy3n/6fHIkvStcjQCKydEESbM5FVYBIRJ0fWOUsca+Wijhxo?=
 =?us-ascii?Q?N1jj1ci74IfCeYZrlAkm8Bz6pqCZjq8O0jP/jSXLwGj4rv76Zvt4hhIUMKNJ?=
 =?us-ascii?Q?tMn61ici/u1ID4W0bERBcWIZiPIOE7JwQ8sLn5nobsL7AL7yO7NOFeg1mLJk?=
 =?us-ascii?Q?dkI3W+VuA+Xw14kPmwfD1NGiSMIh0BmWPBI/WOg5klvNH/1CTyUGV2dLDz/t?=
 =?us-ascii?Q?r/e98xO0sW8ABTmB90zxRbNGqFkl0vBQoKfumFjCi4XMtg5I2j+U1KA8Pp3w?=
 =?us-ascii?Q?V2+wohlnKYPxCPzGUPBYhCmNMYES5omsqdiJZmN2ZbdrPj2uXx02D2eY85/h?=
 =?us-ascii?Q?5C/dddP/Y8aNtmZSqek7cbj4oJur0A0dZg8m0xGuyWwAQor1Y9RRr6Fi9ikZ?=
 =?us-ascii?Q?S98CugkzSNHJD8HC/+ZjRnfvrhWYpl7fFCJZph/1oMVShKcCDseC4ZY41f50?=
 =?us-ascii?Q?bs4uKTC0R6D8+TrQL7XhexVudD5nBggwbXWCI5u7NN/Xu/NLEoGcaa7Rb00j?=
 =?us-ascii?Q?k+yIlkfxwQ+OYwJC9X0pW4AhyzvtwCwBunTwokNTywCngSO31B3BN0UPJuxO?=
 =?us-ascii?Q?Elq8+kLKl4cMfRqvQC8XUUv5kmT7cVlxcKee/I5IJt1zpLFGVklwZXuAJOuK?=
 =?us-ascii?Q?w50tjFf3g5MzLl7mrG8dd2s=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 012b92e6-5a73-4180-5859-08d9ecb067da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:14:25.2753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xSNViaGwMw7H9gJ+FHiMMGGFi1HaLq5tGiUBt1YSkdGku5+6ptkvfAo6F6lhuCZXlYk8Hu4igQsHYX4zPjYp8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:14:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161616

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Move cc1plus from gcc to g++ package. Therefor, remove the duplicate
FILES entry from gcc package and keep the entry in g++ package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/recipes-devtools/gcc/gcc-target.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtoo=
ls/gcc/gcc-target.inc
index bcea75b2fa..66f737c9dc 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -44,7 +44,6 @@ FILES:${PN} =3D "\
     ${bindir}/${TARGET_PREFIX}gcc* \
     ${bindir}/${TARGET_PREFIX}lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2* \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/g++-mapper-server \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
--=20
2.30.2


