Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED2BC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:35:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.102])
 by mx.groups.io with SMTP id smtpd.web10.8668.1710408949626951478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 02:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=EgpVWSy5;
 spf=pass (domain: navimatix.de, ip: 40.107.22.102, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdnibVatErDlDHKUHKxkHYhAD6NJsMglkkEiG2+tVfsgJFATWHsW/W7FZE/gt+xjfj1PxIX3kEaUSGwwkUhklEX8d0o5O74T073MCCUt2uYa8jUuNX+s52liy/qcJRl7OGmjq81TLUUCLvsl2VYpgLrqKR1XhpkTr9ZpzlOWLdcVGE6ZBFxwZQqteu4n8Ebk+Do6iEXs9oXG7MX8lMkneXyaIGfFHNsA0OgD+UXCki8y574NySAUKNdRU2AehBZc6ITDmsITO0OSWrTE3pHb0GeeL36XwrAVMHWOXWtc/NKYopmabM2azfWny/9UsYEFqxJzRPhEfVZIut3IFgdkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FYsCDI+L6ZFm6tZtplj6h9jpTwH/prYpLebAyD30Lo=;
 b=THv00sQwRAh0U/Obb96kHd3y9/ck5HjBaTXicxsuszKVb/7az0Y95noTQPaa2lCV8yn9oErnlX3BzXfmBMoI/C33PXrC8WqJ1RDjYgOLLlfA6HjifoWkHihzfR/VKW6wVbNI+jLDaCAd/Ee/eKzmGXmHku1Cs0ar0EjBVxZNbYmEGzDzJJBOTPDHYxYMIbSG8piJKPRTMc7n0dP24u1u74Fo799Q1rZ318elbElweJn/uCAm/tSt0vqv2W7vQMhVZUSKXa4egQxjXJ2x8tjmYIkNMze/TQ+sRQFNfIPGftI+7swNXFgwANTilvNeC0VafLn2w1OId7attkGxEyTYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FYsCDI+L6ZFm6tZtplj6h9jpTwH/prYpLebAyD30Lo=;
 b=EgpVWSy5YPogctLcxp56KrvGq1TAXSF+di9F/KXb7Cjmhk6G/1xMJKIitcZx2/QY+DoupuYPRcMPSo9hSQSygVg+g/U+hzkWKKt8y5ifYCPTeeNBSfoYPKic2X0RAsGQVzrmM6I99k10SgcBI8KVhaAZt+vj9LxSuAQ1tmi3Gdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by AS1PR01MB9418.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 09:35:45 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 09:35:44 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] autotools: update link in comment for cross compiling
Date: Thu, 14 Mar 2024 10:35:34 +0100
Message-ID: <f6a5258a79baf579c37aaf7fd5988103da76e4ca.1710408934.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::6) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|AS1PR01MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: ca77bc42-5837-48c0-3eea-08dc440a1f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZhDPclFCp11XDXfa9tigbqcjgNX49FzZJOB0PiiSV/wd6lFurTh2LpDUMC9Gideq5xzPN+JNMydDKBcr839RZuiwZEpmaj9L0fKNUWflyFID1Vrzwy0cWEAuG9DjTdtCeCizZPM00g0Lm7IJnGWa5VG2IqxEkKRdkm1zowY5B2MhQnhu+0+/cV6IKLBr8RWobPvEGmJ7usCBUKK0xnUxCaVg68yUIIyy+gliuqAZkerZ9eolDl1GiVXdH+FfU7bd3G9LS0rCSk7VXTWjaFnY2yX4Yr+PC3sjCAsF7NwUM4nPp6H2zm8zdNIKykr1u7h9PvgKS0Qu8ECrq/yi5rsm0BtEd1oq+ly6cuUCaJ7/RsUV/Vp53gL1N3pWXqSaRsYWfEJuk5nIZeaAXn7aS+IH1hy7s8ziGYeYBrzAap9hWyT0jyPcijPMcjcSoWGPuYuXY7exyg9wRaPpUNzvpIX1j5eMlHmBEwLisiFAb9TsrUqbt6tTDLaSvF+pBEtC6aAgnWxecvy2JOIROvNyGHQ/jg1XNi9kXUMze9dKT8tF26/4vTDBU7L+lyIH4o4c85FdcN2MCb1PV7+pjex6kSt0S5wxuAkyePPptn9vN0dPYpmCwDacLCwU15hKkR/V6jOmKckF2Yd2ZGonUvml2B8uIOdYwHFLWETGdudinazwT8Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rcjrnP5GZGlo8uW/K6oldV8K9dsRoixXraIzsyDiLD0dSad2/28A/7EXREyB?=
 =?us-ascii?Q?YvAg0IotJrrqOR6PYN/BeHj9Vi9B4zSHtb4C3E76oua9E8euhMZdRQp5FvQm?=
 =?us-ascii?Q?FyhywzOaJcPNWg+43zhfi8HXwH7aV+ZCLSD4xNDDhq5cARDRKwMSoaZ/aClb?=
 =?us-ascii?Q?pg0FH529AxOwIQtIXsKSkjmORnlzPzNVuMNCyexou34xWMA1ScfVSnPrchGs?=
 =?us-ascii?Q?/m7MdO398SfdzofyoGAUqiaKB3TA9EoQZduWYblYCb9bGySVA5WqB/yYaL/3?=
 =?us-ascii?Q?ZrWHyI1Y62QqK4x/86829H1h9slG5Lz92AgqiD9GL1XO6Tm6PuJN0SJY9/MG?=
 =?us-ascii?Q?VjDEwf+KwTKbqk2UwVj/bvPZWa4j71/nK38YqiKilY3L9cwjIJLa3RMji+3K?=
 =?us-ascii?Q?9Dv1TX850Z/6k0a5QQRnKxZ6iMuz8YS9jCrde/7SYgWAbjsOCHRp5U4+dk/7?=
 =?us-ascii?Q?np3cPWQJc/NgTR26uoxWMhBBqYbERju7EgAOfcdGglJ+YfdIroYwAr5kISQS?=
 =?us-ascii?Q?zyMa9K1QGPx2gqME265g1BMNUbPj5z159j+n4EJliGibCbQxaq27o0sIEdgJ?=
 =?us-ascii?Q?Q4Gm2pRwWhmame+ZwcHwti2pQLmYom7C6eI4dMyspzDkPMPh8qLctCo1e56x?=
 =?us-ascii?Q?nJhmyQ2jXMVWWHxj7hAkOmXaiLUWQDNo/Z/Omc+ClkazxeHCvoXhxEMchEQZ?=
 =?us-ascii?Q?DvWx63wC0PXGaj6IjkiG5VfpUnUzpqJfFQQbWUZnKV0MeIQvJtwfFyyDAmL3?=
 =?us-ascii?Q?fkjdxBIPt3U03YkbtgaPNgtl5F9gDOnI6ZexxpB+E1yWn3YrpB/zUsCr6oo9?=
 =?us-ascii?Q?N+8sYNNBAsXrGAtQlO9v3A4Lu5Bh15Nhuiut8oQUwazigP9DPFUGdMUp3hIr?=
 =?us-ascii?Q?O/g9Hkpxlkkj9zHpbPtLZugE3rMh4rUOptKq6ORgge3sC/T0oCZDtYvpSmGm?=
 =?us-ascii?Q?FIwdTb7OikGkAiJl6HwPTBBavHpBgEjR8i8v2xOmQAJk8vHw3U96iFWObaCZ?=
 =?us-ascii?Q?QFNe+4q7lz3YeiFAeIRN88shOVLyuitQKltV4yfS8Jo7pVvrQxN7zU1cc8XU?=
 =?us-ascii?Q?IoZ3GGO8AP7xuevXBpd0rWrLOisE0O2/qdjGHGgTp2DO9YJrwqoAjkq+Hwb9?=
 =?us-ascii?Q?/qYWqJE2hG84nvh37Bx4EAxyfH3Cc++87NIh2/XzsFLPbIqMHOlCzVPnt2sl?=
 =?us-ascii?Q?IOojmN2IkecySQ2Ky75w+T0e1JpXXixy09DYvSe3ZFo8TE95ESpcX7PDxfJ6?=
 =?us-ascii?Q?XlEW05RaOtP7BmSZZj6w/hfF7mbDiijBvHzBOQJG7x+BC1dYS2AxteUeeKqS?=
 =?us-ascii?Q?2TWasT3T/4k3XtIgFAQoEEFtoAmi2l0YbBKsx5T8LNX2vxBpIhIhTxYV+OtK?=
 =?us-ascii?Q?UUCoXASs9Atx6JziWXh/JVKMy1jzXsc8N45WpxPT3Y5Q7wyokyoCbJbdrP7j?=
 =?us-ascii?Q?C+QhpGU/+NN1WywTebTEDCEq2RHI4MDn97SqFNLUfeuCi8ag66OunrFnSQJl?=
 =?us-ascii?Q?sSZ7Qm7AuOcskMMDEUL/nS5EogLO/nVDMblsl26HsrPi3sdKhJkaaDjWHkgd?=
 =?us-ascii?Q?fBSfeIeZQliNv8wmHgzgSkAxGxQZDBrmkfI2wlGrCp9OmQIGNK/2S2h0iNLV?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ca77bc42-5837-48c0-3eea-08dc440a1f67
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:35:44.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZpPQBJpYw/r2604wkBMeR+KSUzPv5Dh1Q15c9U0jeE/7pmXBZnx2tVwJSvbJoEsRW9iXIUJ49mrq8w7yy1YPTKE1BdxFtyYoLaGu5mxP7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9418
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 09:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197100

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes-recipe/autotools.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/au=
totools.bbclass
index ca76cde0e7..9359c9b4e1 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -43,7 +43,8 @@ export lt_cv_sys_lib_dlsearch_path_spec =3D "${libdir} ${=
base_libdir}"
=20
 # When building tools for use at build-time it's recommended for the build
 # system to use these variables when cross-compiling.
-# (http://sources.redhat.com/autobook/autobook/autobook_270.html)
+# https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
+# https://stackoverflow.com/questions/24201260/autotools-cross-compilation=
-and-generated-sources/24208587#24208587
 export CPP_FOR_BUILD =3D "${BUILD_CPP}"
 export CPPFLAGS_FOR_BUILD =3D "${BUILD_CPPFLAGS}"
=20
--=20
2.34.1


