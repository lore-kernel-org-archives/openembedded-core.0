Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404E4C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 09:02:05 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.87])
 by mx.groups.io with SMTP id smtpd.web10.5022.1663837316435546537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 02:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=qnB60jAC;
 spf=pass (domain: kpit.com, ip: 40.107.222.87,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWp4GhxlLKGQ4Uglz9104Vpy5OYrIlaOZNmT34b5mH9T0RAHsWgSBjgnc+ccxJhH8pq2vwg9Kj5logvfmQZXcoQ8NOSRuwGoFp/hPIqCSGqOEa2toY82tTY44I+IJP5YYE+aGGFQD0CTyemO6vlKLL1u1ldwTCZg8/bir8wZGQmzhgESptpsT0hD+vztmLX1HbwcyCLmFr1g/8oF9n8ctBQissILUVoh4QOxMWpCn+KTMjL5q90S6Kwd2s4I1tsz9bAc2bcxZd/yBV5z4J55fYz46Q5nIFNO5ukvJ57v9NET2EhJ4rlkGxrC5GSuR/cqGK7zzfliZ9G+EhCER7v9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/rzRwocWS+r1nIuJ+fB96rjUItDv06YvWTQrDDKZew=;
 b=ShOtJ5nyWLSc01BVuUoFgY7aAJBC5SvTQVjBhqsoIQ7ZtmG8crjBU4LKTKyPq9cieGHHZVhJ03SKgz7Se1gM480pikbyDksRtqI4M8oOuNsmKx6v0mi9/swioF2ZLoRzcX7tLOBdhXntbwV/YwEPYacsH+kj96uqRWDOiOpIoFQ/iPWqO5gajX9bFjKChWSayZ73sDFR97sK3EzS1o8DLip434iHQXheZzus2VlhHgCtcv/TjUOh+2mlv6NQ7ItUPFE6wvRRPZ8TpBfUytjF3RdP7fYMX6/EAdbmEDNbm/lYZCfAcTUlZ7w6jxctRV3RboQiM5PPbO3RBrNn/MsmZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/rzRwocWS+r1nIuJ+fB96rjUItDv06YvWTQrDDKZew=;
 b=qnB60jACFQp+VdUiX29/rWmaaVWbQERTCsIZFQjgsJVaVMcj1Iv8G9Uv1hmTQRCu44tcwgGcF3L0GWdM1wbegEO0g6QMfUaFEJQBK18/SR9/ZeIDvtn9UTi4K99iIOcIdLOwkoTKZ5vk19FumOMVC7ogLhMTjcLEd04GV1umklk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN0PR01MB6209.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:76::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 09:01:42 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 09:01:42 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [OE-Core][dunfell][PATCH] expat: Fix CVE-2022-40674
Date: Thu, 22 Sep 2022 14:31:14 +0530
Message-Id: <20220922090114.11228-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|PN0PR01MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 687d79ad-5c9d-436c-97eb-08da9c79112c
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Vtf15TcOr8NJcW4zUoRl1ZAENDkgHpXmV+Ntpea9d5haqp5PDzIL0A5ZEk1Zu7OVjN0WAaDiDUSrgCscaGnPURFvDkt3AjUmVCUXk3AdftPVV4V4HBQ3gqyoRorEULZmZp2Bp6aVRIjH7BlqvmHH/N3Y347O2CyG+jsJdoipXplxvZc0C7lMwrdpEHzB3W8L6Q3iTnSgSKQjlIImqYl7ioTBcAzeykfn6xo5rhw1q1uCxuOi1wPoYJtmFwquCy7hLn6L/efshm8nd4pROQP+f3rqOapMCRq3CFNENSlGAjy7gtq9h2xisv9mufUN3T4Djv6sDZmz8Waa+Re6cpVmOxn5wuQ9g9cRExmKSm47oLz2v03N7vIHOZ0RnZI3PQ3bxwGoYhzHuwENAMxogNvF8qz8qqeUV5h1/eOv3HzSFjqidbBd+GbUo+2exptnA+ePkF9aEjZIOTHzufZPXGPVomRX/p3My5Ul/eazy8aqnGq6qJ6Dao2Qm0+sT3HDFCygm5DqRuWpioeRlT8We05pd0tVPOeNfjlIqb2+7ql4p232spx/5ivEKAMyLUfaSD0XWnVF6+8b/nRTx2eFO6XAOLloouMEYtrYrAeQMQ2vy5m7zmGj0Jxq4Gyvo/70a71ROgvNMkakKDewImQYX/8xVLbFSR8mrWe0bVdFmf37UumECUZ4ZEjBPkfeAl8nNGYFweGaG8LBORMP3SBm/QIuGxHrv/zD336uRYqV6n0Kfwz+xuKnn+gMyyZ1YQA75uJLGkyhEZ93I5XPe8oulfY+qHPr523SAZEFEyzE2BGOcwGFLyPH04LxseEJQE+6nxRN8kcTmPf2Bf6Iv1eNo3Hzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(26005)(4326008)(52116002)(6916009)(6512007)(66574015)(2616005)(186003)(316002)(2906002)(966005)(1076003)(36756003)(6486002)(478600001)(6666004)(107886003)(8676002)(66946007)(66476007)(66556008)(41300700001)(86362001)(6506007)(44832011)(66899012)(38350700002)(38100700002)(5660300002)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sWssZ6EPo7elxah6K3UFHgUi+nX7y3LkbHa538qNKNDVdNswZ6oDGL4FcLoY?=
 =?us-ascii?Q?OIRLOamJ2WsmIaApsF4/XfOLXXz3iF/hnkoSf9oTlcX8aXdAccKVkOEaf/Oi?=
 =?us-ascii?Q?+FOYU3wf9mN+W31NMX5x8fMoK2OexxLWT3B3GpgpOnPnTKfavK+rHs2q42B+?=
 =?us-ascii?Q?IEg4VvSMDOfMc+wAIrd1L/eTZFxOW0WMFm5z+aF00borbPPrLmBcYFncaawo?=
 =?us-ascii?Q?KpAMNVVJC0J9Ku75i6Ki4trzq0Xb/blu1sPCJZ52kQQbBl/2BESpKbAtrwrq?=
 =?us-ascii?Q?b2GBVohwn4gI5K951gOs/t3ejnJNLxd53qZZRZlofZIM/bDytl/RiphdWdXf?=
 =?us-ascii?Q?d2BE5KviSpOc4pmKEiGfKqua0MZV8r/zVgVc24+DuvaxELIOhFA+/rc9LaGv?=
 =?us-ascii?Q?BROeqYHJsa4Mc9llIEAO3KJQ8G7Ni209puu63nV+5mZY5WqVHJwk6ihn4fzC?=
 =?us-ascii?Q?VwJ5cgpZIEu5FQTKnc/c7dZve5D0apJni5YpUDiw8E99oITzDhuS9UCr23M1?=
 =?us-ascii?Q?VPuKYbQwdjJ+i3WW4r83ZeR835jblebHvSwgEtOD2RuMhcVtrcUDLaMr81G+?=
 =?us-ascii?Q?5P0h5tfyhdwt/2SNeprDxB/ztaEDJvhLVdPRGV5ayFd7QQSsJYLNiO5ZdbUA?=
 =?us-ascii?Q?1VaW4TVGXSdX9U1u08K5v1lfbiiEvCEbZdZzj38Tf3MIIc2bzjcdU3yZGsio?=
 =?us-ascii?Q?mJYGHQMkdClAGo7qGOybdvpRBLTh+7ECZQ9n8Lpv0z/fkg9X5AeUvK8piMgR?=
 =?us-ascii?Q?mk37f927I3grH+pdWFvF2WQ7sLclLsbLAsIGd9RaY7tME+pwQb+Ss2oh2F4v?=
 =?us-ascii?Q?vjyYn3rEL/Di/HHSNyfcuQuTb3sGfd+km37+/TelnVTA3YGzX8eD08N60j/u?=
 =?us-ascii?Q?7hveldufzYxTppatY61e4KvJO8N3uwX5IUcG3sFcU7ksgjQ8i4kEB3R7S2Sb?=
 =?us-ascii?Q?HQGiIDtGj4M9QIQNx3on7vNyhqX6RbVyDCqC3ZpXUcp4lSF1PURjUQLlqFUs?=
 =?us-ascii?Q?HdkEGJ4t0pvjq+L+B1af0Ri18koDgMT4Yn63MtinzlTu+cAiPCMV0ApTzB+y?=
 =?us-ascii?Q?lzr0xH5IOSpABSWBJiKNTl1vUTTSG7H9qdEXCX93yUCaGHRRFciprqf7Ih6U?=
 =?us-ascii?Q?R2F9yNREB7tTKtqojnecOqCR03/ES+LmKMO1Oo93f3v8CElk+lxYKvoQZG1T?=
 =?us-ascii?Q?3vQw9gIbGsjEKS5+Aji1HavEEBDWMxGnJEKlafEM9RulaCULpzjkfzmvhmQy?=
 =?us-ascii?Q?6kIOP6uCNySQpV+wStAhEoPrfTR893IsoxDPizGglhwWYf3qCqTjmrE0Z/nv?=
 =?us-ascii?Q?MjWF/UwZ8L4Eo2Ff+QS8i/NHQivlq4Hm21KqqMEGPkJpO7e3I5bSHZ0qnkzn?=
 =?us-ascii?Q?S/uRKFw3ubMT3lY5x4noU5GeS1mfdtwk/C+6jVNvGbQwq9XXCyy5GQZsFkE5?=
 =?us-ascii?Q?LN5GaGXN+XJSrGVHLHFhXYQlWCMbVzsqUmkG2sA4B1qXGCpgXErIo4x+L/Ow?=
 =?us-ascii?Q?XgoKV436qDBd1hbz1DDXgerdsT92Sx9+89XFJU19WpOlBRSfYpTz0rNEhUqt?=
 =?us-ascii?Q?i1RYUmfR6KuhIWfpV/b5pT+fMtxYszoPPTaXpQz9?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 687d79ad-5c9d-436c-97eb-08da9c79112c
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 09:01:42.0551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TulxcC59LfJ/3ZkiwJWrHGkDNbqQbEqlBjfIo5E4YqvAFZ2bJmK4NHm+3GGCSNBcPMa9Wn/cybul4hjdDDFAJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 09:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170966

From: Virendra Thakur <virendrak@kpit.com>

Add patch file to fix CVE-2022-40674

Link: https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba5=
4393d465bb77c40b5c33d343b

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../expat/expat/CVE-2022-40674.patch          | 53 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/reci=
pes-core/expat/expat/CVE-2022-40674.patch
new file mode 100644
index 0000000000..8b95f5f198
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
@@ -0,0 +1,53 @@
+From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
+From: Rhodri James <rhodri@wildebeest.org.uk>
+Date: Wed, 17 Aug 2022 18:26:18 +0100
+Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
+
+It is possible to concoct a situation in which parsing is
+suspended while substituting in an internal entity, so that
+XML_ResumeParser directly uses internalEntityProcessor as
+its processor.  If the subsequent parse includes some unclosed
+tags, this will return without calling storeRawNames to ensure
+that the raw versions of the tag names are stored in memory other
+than the parse buffer itself.  If the parse buffer is then changed
+or reallocated (for example if processing a file line by line),
+badness will ensue.
+
+This patch ensures storeRawNames is always called when needed
+after calling doContent.  The earlier call do doContent does
+not need the same protection; it only deals with entity
+substitution, which cannot leave unbalanced tags, and in any
+case the raw names will be pointing into the stored entity
+value not the parse buffer.
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4a3=
2da87e931ba54393d465bb77c40b5c33d343b]
+CVE: CVE-2022-40674
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ expat/lib/xmlparse.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+Index: expat/lib/xmlparse.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5657,10 +5657,15 @@ internalEntityProcessor(XML_Parser parse
+   {
+     parser->m_processor =3D contentProcessor;
+     /* see externalEntityContentProcessor vs contentProcessor */
+-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_en=
coding,
+-                     s, end, nextPtr,
+-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
+-                     XML_ACCOUNT_DIRECT);
++    result =3D doContent(parser, parser->m_parentParser ? 1 : 0,
++                       parser->m_encoding, s, end, nextPtr,
++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
++                       XML_ACCOUNT_DIRECT);
++    if (result =3D=3D XML_ERROR_NONE) {
++      if (! storeRawNames(parser))
++        return XML_ERROR_NO_MEMORY;
++    }
++    return result;
+   }
+ }
+
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/exp=
at/expat_2.2.9.bb
index f50e535922..578edfcbff 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "git://github.com/libexpat/libexpat.git;proto=
col=3Dhttps;branch=3Dmaster \
            file://CVE-2022-25314.patch \
            file://CVE-2022-25315.patch \
            file://libtool-tag.patch \
+           file://CVE-2022-40674.patch \
          "

 SRCREV =3D "a7bc26b69768f7fb24f0c7976fae24b157b85b13"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

