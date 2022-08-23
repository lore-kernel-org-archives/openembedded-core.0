Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B42C32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 07:04:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.74])
 by mx.groups.io with SMTP id smtpd.web08.28847.1661238242356018808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 00:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Uzcc2yaM;
 spf=pass (domain: outlook.com, ip: 40.92.90.74,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4HMyJ4EBMwRclz7fcvMSTjAye3VbTvGBG7w7863M4nGA0M85MGDpmWzrXZ5iDoRQ3vt8nuzun1OhBjSgLS8V37eBFIklsE1+5zZLLPfUtyXjZ7vgQ1T8/m3+nd/ugnSE95VgyRpHMv6Dyy5Hh7NYf/7mccHQ+xVm4JcQlNJNYryiwhZhtpMjbnNwnIxRqQDX9Tkd/20vEgL9/z1V78ZhWPxSsjSwJSSL1EK/CmkENJx3syhfzb2klb0Be2vRMa541Az/68+ZCGPM3zMiscmYQcJPB+nyU1GhwJHVHC4jL48QZtXv8OmggN4RxLkIEcBHCD4sWc+oZIDVLAeSoY74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry4B8zl8aT4Fh8y+U4dpXKtffGoR58G0OSW/VgrtPos=;
 b=E+BM/AMdn6g/eXLDwunkbIWtu3CY/PxF6CWNYxhbFxpqNIGnfcqujHkKDo/g1iYd+Q4X5fPY7WbdsudRxzqmSnMjeH+OPRkzIFjq5t8vVyw7UeM8T3p/nYdwoDARhBiY+3CHlX0HGMjIpZY4iUEv2qUeaIsKiIK/G10yZhAyjR26cTk6gYR2y2VsWNps78GVIbueNKv9VgSnMO7kOziNYK8031Y4ry5tIKNmAyNP6ItyTuUqJ/+Eqhdk2QCJD+cjuEe+5oHZ/V9/g/gt24PEgLU2FWM0zaHEcdTlVd9gR3KCyhTNUGBZ8OaqKNcY35H+tRWyXKPtSRmelEKvP/mmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ry4B8zl8aT4Fh8y+U4dpXKtffGoR58G0OSW/VgrtPos=;
 b=Uzcc2yaMQFxgNLhtNQu/wpCEHlQVcYjyC9L/r5s4id8gd6IKUqW1rIAf7MrthXA5r1PF8mRzLZOKchzcjI5t9UBPUlS/1heUAnWnfk6pNAav/qAgLQtOvDOEexQY5cLbzZvc5muXsmPvwZOvQdlZfFAh55arfRsf8aA5y4VHoz1xGT5iE5eSpFHkxQeXR4gRlzNSHrFMUDFcY+L88skUQWZ4yx2mmf+RPJ1XbScn31HKQXytN8a2y/XOMOnzZ0BMMdTmqsruQ5C5XrlcSYd0oxxC78nOsHIPeV74ty/fKNnB/mQVg69kPjTXJPEtwDeM+QiaQkgJ/f2/SwPUJGfOLg==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by DBBPR09MB4809.eurprd09.prod.outlook.com (2603:10a6:10:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 07:03:59 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 07:03:59 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] python3: disable user site-pkg for native target
Date: Tue, 23 Aug 2022 07:03:36 +0000
Message-ID: 
 <PR2PR09MB310088221E5A065A376AA985A8709@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [v3JFj5qI+XbE3EOANRFnWt8xPGGWwVwkWPHLU56PxgxRNO1CHHHIqupxftl2TsGi]
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <20220823070336.301556-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fdfdfe9-ba97-418d-181a-08da84d5a6c9
X-MS-Exchange-SLBlob-MailProps: 
	6rN1YWC+iUWbwRqukzy/wa/jviTFW850XITpEhZeeGNd43i/xII6u8dBxR0bnHmD7XmOns/TZXdzNrNeOj6rBrm/4bLSIwE4P2/GI/RxHd+906Oka2k0INz+OWmVAP39aMWqNHegbabpnPYWkjqdbqtZshMTi5usvzb27ppnOsxDRhmRHGxg6C29xgfbejKatDAI+fQQvb2ezklhM9HYfaAEKruBjFSXjFtyNMhNsmAiNEhgkn5thWhVqA8nizIC0OwbbviMzQyqAq7G9pp91IwzUH8UtkNwXbmFXZFq93v5Qi82mxOwlx7uDbhUxXuUi83ZWQ+u2x4bWeXceUu6GowqGIP0SRuFISyAbOPGSF92MrMYcyQihdt46iEa8J6WKyCimPW9H2HvQseAmO5jQgqhlxMimjsy35Hze0t9+dHhLDnAXE/bmwU8X8W6tVBQYbgVYlMdcLRRHpm/p8GZx4ZYzPZb2ds1U94nJtiy+T/BlMwcx0dIThlYEA0sQ42mTOCCfjUqRtqvaNIUrw/OodqwFMLCqSQyysZ/lGrVKYCFJbcMzlAt3GQdbZaTnsMIfXkQ+6qMLSfnpKRknPJhfYBH55ZfU8KjosLl8Kb215CxZQwGu0jDEO8YC/+8tcib7NRBOtPs7TMUTBlc9vx2z6ynXhrTlnsjNCPzAkAY8Tm20FXwCnPWGXEnKHrc9A1CZ7+xB/6LfxOpX/I/JnTTzMn87hA7ta6AbHoOvcMhB60FkB9crk2gI2D+b7J2bYstKbenwV6PKAERExFimMi6VFWCCY7NNxzsQsgr2F75nnVO07Hb675M53NNP9nZDIvO
X-MS-TrafficTypeDiagnostic: DBBPR09MB4809:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u7Fm5u5YlkrN0IzjnNHILrY+O4yBj9+nWvsJrUyJ0W8spOn2K9fLzMg/vZ5Q1OoT1wB9+Cr10oxkPeZYFUVRfYgzhaSx3+P0NF30/l0gfKTifngBGAxb8P3izCc7Cjeo0E+yd/XT9K/iVOpzdBWggLQxuDeaEueu1Dh7Z70IF+2xpO8ATKVksxWDDOQstL8PX9o0kpDZi77PUsTuTERKMUpVr3ZW61VV256WYlt0uJcrWf5bl7xY0nxBtS0QMXKu1JZl3/wfHvS7qz3pN4BdeN+FM+V0YTq041jHh29Z2RkwMBvAQxBNdf46V1pCrY44TfLOFApCJDqStCxKDEVx68i5V4NX6Gbbm7/WXo6XdC08WbeKqPjeDNWaoiquebYfOyvLm0AH6diHFOXhBRQBz3LGu91WF1phsl1V40MBpgM8Mb6rZQLcaQANfBljuVa2oGUzAXON9PlY5KuO1T/Tmc0p9I145FklRaWBk/kLdK1vWnjHVc17D65hJpy/qE8WfXEnHOsJSRSKO7E3gjJfP6Qsqcijf4nJghi7t5/eijtsc1zB5QHmbtAhvRHZ2kcGy/5ATqNhxHuZnLB1vG3Ic4SPF7xuiVFjloXSkpuH2yzQOE7+xT8XuxeH+gbDIq9r
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TW/z4kbsyYynGUm+sddssRI2O4+jfCd4LW3CNTV9/Ic84chigueyxiJ1f8Qm?=
 =?us-ascii?Q?E+nOJO/9QXXuNHm/dnFb6RDG7NXGN84KK7YdsTfWE6T1iZvATNVW7jeiE5Yf?=
 =?us-ascii?Q?kEIWLLONGc6RHbDxH/N9f4Ff4xlijcoG+1gme9rSopP/leiyRPG6nHYPBEGZ?=
 =?us-ascii?Q?s0veHsmvF9Z8hCSrDV2zEQ5UsF/YS8kq+G3lQxcIGZhieu6etmrI0DnCGWgj?=
 =?us-ascii?Q?3omo78ENt1bBs+lauh1ne0mOS+eWlK0FldIW4atHWzuPMESxerRjvdfzVxw/?=
 =?us-ascii?Q?BrovlVH0I+IFjeGHpoqU2DZvlC/V/mMPCiKRUQzDmVsADgruoZ5aO7UzK5Hk?=
 =?us-ascii?Q?J67Z+1S6jKI5qObZ2+3Osf82/Tov0/SWuGTxirU694w24xriIYHGOEtjAd8O?=
 =?us-ascii?Q?y6VWEc1kuIMnzaZ1kdv6RYm1B5q/duQqGckZnBXkv88lky5NmfD87eMTUrFK?=
 =?us-ascii?Q?D/iz15xlKmroSs4tNO9NlKaXShw/lVwFaFMChrT3c5S6r9VAsAUMIEX5tk7S?=
 =?us-ascii?Q?8iNH6cPXc5fTAQjY3tZJWRboD53RI3soLNfX2v6IkTLWYyxJEreeFXtvYHxD?=
 =?us-ascii?Q?2vNN95k/S4lHuUQhBjSwRujgNA0Uo2TtWBMxRb9bzQJAivsYhTo7meRokH4r?=
 =?us-ascii?Q?H0EY2RAazxJ5vcGJ+zH83ud8Cp7vH+amTuzuxNcbGGGNLotBfwwkUdVFQMLr?=
 =?us-ascii?Q?gL1Dggnvol8sbjuw8UpM9lw7u/nSPt+tCusd+G1oVOZ4rzvhrWj0D5weqd4z?=
 =?us-ascii?Q?hHt72ar+ToG/bwyqP2q51AZJSkj9BW9wDiwMAdNZURJ5Ka2ND5JXP7m8E2Ii?=
 =?us-ascii?Q?HFFBfqIi84LGzAhqCnQNMWUGMtUm92sHIdKZhJyDBgFVCBzP3lVkgloEou2U?=
 =?us-ascii?Q?YRJTHCDoRYZeYcMnwwzFM9fg9gxmxOru/AVplJP/yWAEIRtbkhnXYVJen2+v?=
 =?us-ascii?Q?Btp/g2NnLKKz2NhdEe+lbpMkOM2a62zI0H6PSnADFDky0T03gASrioeyvklB?=
 =?us-ascii?Q?vesBUC+i+SYWPaWCsTl+TusJ5TuQsEttG8YNGUg84Erp6cUEiKJieYj0uzSu?=
 =?us-ascii?Q?ZPmZTt2T+xQpPoF4pKPVxDabXsjKcsuEvr5McQ0vcj9sWiQwFWTGazhEgJqs?=
 =?us-ascii?Q?bTTm8oJsO+bnmvLkO4RvfvByKVD9kM8OjzfiZm/zBd7xvEXIEfUllS+27Lle?=
 =?us-ascii?Q?hQ3/AjlFE0XrEYbox1O3EvKBLFLekXhDghXRVDSY08CRnz8yX2esaed6MuTF?=
 =?us-ascii?Q?egB6bLfEpFqD7UXEBqf6ZAI6hj/zIVxXboM49wD7X6EypDWtBn+edwFu4F4/?=
 =?us-ascii?Q?cC0V+t1vj9/Fw5PxBzFJ+3aoY30ZeYMSj77YV5IijHtQUg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fdfdfe9-ba97-418d-181a-08da84d5a6c9
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:03:59.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR09MB4809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 07:04:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169694

by setting the ENABLE_USER_SITE flag globally.
This is the recommended way according to
https://peps.python.org/pep-0370/#implementation

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3_3.10.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-=
devtools/python/python3_3.10.6.bb
index f19cd50273..1b28728732 100644
--- a/meta/recipes-devtools/python/python3_3.10.6.bb
+++ b/meta/recipes-devtools/python/python3_3.10.6.bb
@@ -171,6 +171,9 @@ do_install:append:class-native() {
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
                 ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJM=
IN}${PYTHON_ABI}*/Makefile
+       =20
+        # disable the lookup in user's site-packages globally
+        sed -i 's#ENABLE_USER_SITE =3D None#ENABLE_USER_SITE =3D False#' $=
{D}${libdir}/python${PYTHON_MAJMIN}/site.py
 }
=20
 do_install:append() {
--=20
2.34.1


