Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.58])
 by mx.groups.io with SMTP id smtpd.web11.6368.1609930413126722855
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 02:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eX3wgWh6;
 spf=pass (domain: kpit.com, ip: 40.107.138.58, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaG1WPdbcg6Uq0tldzq8MyyGOWIKB8fBfH7lprHyCDVLfwPdolq8Z12m9GKKwQDGpHeExBwgVUMSHDlBRK02IWOHnD0Q+WF0qIpDXRVmKWdNlzwTkFZFpmYBhHBR7iqj79NjvrCTFfj+NbU/H8Nh8/D49uump7Dpb0qMK+WEpEsORV/ruwOvvrmRG50E3AlgtI6DU+mHprF7N3TI3arMU1E5tHh2itlg2fDHnKmnbzu0dByvkX71ochQWeFsw2AeEakQQfT0YVUq+UA4tF8/yJo4x9Nwc76sRRVOLmNlrkIczVcyTilymhuLXmipEUvA4rVaKZ5eOAn7nsBagVOFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13burvoMSHHfTOOGcHo8GgUVJVtc5at2knyUQpE+0RQ=;
 b=Jg4EZ1EC6ViM1pOko6rVkGKqtG7n9Xjn+JTSAxu+5z9rlznZR/liaQsrUSCOXXEaMdGD8xcqqzbd4EKTzLXTOFQmEqCECmf/Mq5/ZcReMFDoAYhnYLYIKMCBZMOMTmTrJLveOFURqjYUbXYoPtUEI0vqX278IYg7eccUHQAhiicXJsB/SjaMAOehpqamefmNf5itv6RD71bMOck4G8eRYmWGJCkUaNuCK5yRB0ERmz9Cjvp/4L+r3DsmTRW06kSO7sn7Ygu0IMAwrf8ums9Fq6l5nlcF+NPJTKhkuugOrh0dVoDw1gXkMoT1zxzFMKLlef4u+bbAtNeK1aIKqVJ5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13burvoMSHHfTOOGcHo8GgUVJVtc5at2knyUQpE+0RQ=;
 b=eX3wgWh66SWC5bANcvUTMDOIILahcu9WsgC9GnWfJu3fr/+CguS0UqGOY/eXRtNnQsaVZwqszK7MncpoldNT99F2muZPgz+otj6Lg2nKMhEoCKoOhr4YVDP+e0YoAAH77I+KeeDAIE4mdt+6wIivYettW1xA8ZyuixGRRRGeKBw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB2161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 10:53:29 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 10:53:29 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [poky][sumo][PATCH] libxml2: add patch for CVE-2019-19956
Date: Wed,  6 Jan 2021 16:23:16 +0530
Message-Id: <20210106105316.27655-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: PN2PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::23) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by PN2PR01CA0168.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Wed, 6 Jan 2021 10:53:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 485592ee-2fa5-412e-8a6f-08d8b2314d2e
X-MS-TrafficTypeDiagnostic: BM1PR01MB2161:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB216164E1BE1FF373B1C3DD8EF2D00@BM1PR01MB2161.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C6Vzn0M4OT+C7Pw4uGN8jW1CbAccbdDJv6BKRJqoBVmyhXHwqdf0BnspCOwcDlATkOe6aRgrXoA7Xoawug0+UL4Yn3Sd83sPSMNLJuyA0FGoC7Uu8N1OwyEthTUYYfLLXXCJ+WUf+jWyWGJNfkR+5mteQreJPnHElTX97lkiiqibEBCiO3XbM7HS1LIUleT6G0PpiohsqTf+ESdnVEALVDfBGNTGrE1aTjTFGNVFyqmWLy595ZFSkzjiw7UnQ0t8ASMW/Ks9qbrLXXRBG+5YWswlyB0irC9TrL9LMk8u8ID11Fv9Mye9JAerT+k2Z8FFczE0HWS8s/G9+agXX2GE+ti5uOxc1Uq9IaiwBdYRal1KI/NfPngWhwc1m5MPSr92NDe3LReAJhUPPJa+IFKaku/TyFfAQ6sG8bd6swdqMCN6XG1C+EKMryDyv23YipXND/pfiWlpyrIsDlw9W307Y2hvoXY64bvrzq5zVsDojX8PR7HAH7Ipn4sL0eccVtK+z7KBh9smVw2Htioeu9bRyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(8936002)(478600001)(316002)(6512007)(966005)(186003)(16526019)(5660300002)(107886003)(4326008)(52116002)(69590400011)(956004)(8676002)(6486002)(2616005)(66946007)(66556008)(66476007)(36756003)(26005)(6666004)(1076003)(6506007)(2906002)(66574015)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bwiSC33qmE3x6o92sKxRU+0J4qq3QaB4iwVKOGJdKcM6zJm40I1dPXM65mSt?=
 =?us-ascii?Q?IUkmYFLcagyHc9cf938eVvNrdMLqngkngV/vEa8Z6k19EbKBV350BClmASM6?=
 =?us-ascii?Q?RAjWjcrbzQdoUIBGPK6MeX3NG1tpV49HzrG4q2xmDK/ERHeqz34AP5i+YGAY?=
 =?us-ascii?Q?NxOIr8IX4dfvZsFF3H3eKgduJxCnUmzSNBHjwE8egAWTKcGP/oZrPuna0BnX?=
 =?us-ascii?Q?RNgkmHpINCUR2Ij9lKaFLDVNp+bXb/foYHtwp5Sr7FZ+aXVTc+DsJ5P41//s?=
 =?us-ascii?Q?ODfCFgmM6WyLC43auGHTsvncIcDwRaDd2c6BtN041lDikZgeedYUBdZ1i1tA?=
 =?us-ascii?Q?shU+pqVHF57bDhWYghAr2wu6tc+WEYpmcQmFuu7ewb5AC8xRem0uGxW/EqWk?=
 =?us-ascii?Q?KLjeij9bST/Ju+suRCofg5VnbSmrSAtiQvaU4lpORXia/5Z0RN0OsWS04ofF?=
 =?us-ascii?Q?pc+6dOeLjYjAH0XQm8FuNb6/B5DILkZBwwRDe9OoE7EAEeZzebTRySpiNOmX?=
 =?us-ascii?Q?6BO//y1a6eOYx2bZw3HGY22YmtSnOdcO8Jt+SqsFogvh3ULsSjFlvw3cjsew?=
 =?us-ascii?Q?dEGlvAEkzQ4+Jj7BpogqQbsYA5KZDAF74AcnlhMAF+KXe53VgFdFk/2ok2Vi?=
 =?us-ascii?Q?j51WXDIwlfmNnqx+YRFFJ6pprojzKpZmbWwSEhbFQA1yJQ5c56D6a2SuUKRE?=
 =?us-ascii?Q?18pvQhVH2kaqkuu0OugdIvae8/kQbgjEjVXZGh7WgLEKj0tzJ3eJGcyViR9N?=
 =?us-ascii?Q?TY/IN6qpcXiBsFuP30TLxybrmXCFIAD9BtCxas4xXPPSdzWCEFo0rPBXi7BG?=
 =?us-ascii?Q?ru8/+/Gk9Ol5unOTRsMsTo/IwvMJLZmkj75Fo8UYy7ohk2RruhM37CheIKMV?=
 =?us-ascii?Q?R2gJynIlL5GWhwHDbt+oy4afEJBB+KNLKKuQoodGhT4NCZ5m06RpED5XNczv?=
 =?us-ascii?Q?lQj/P3p8XvizlaAcLSEoJp0WEfgagV5ib9IYlR3mlBvFCJ6nCDUu5hU6x5f6?=
 =?us-ascii?Q?0Cbp?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 10:53:28.9743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 485592ee-2fa5-412e-8a6f-08d8b2314d2e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R7/oNoi7/uPUQsDupPwYQCMpJBQlB0E6a/mY3b5TEeTFIT6kSYleDpxtQgQaH2IuEGjxTOb6PKs53rYinsPhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2161
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Rahul Taya <Rahul.Taya@kpit.com>

Fixes memory leak.

https://security-tracker.debian.org/tracker/CVE-2019-19956
https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641=
d8d9b0d0549

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../libxml/libxml2/CVE-2019-19956.patch       | 29 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.7.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-19956.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2019-19956.patch b/meta/r=
ecipes-core/libxml/libxml2/CVE-2019-19956.patch
new file mode 100644
index 0000000000..8dd9dd82db
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2019-19956.patch
@@ -0,0 +1,29 @@
+Fix memory leak in xmlParseBalancedChunkMemoryRecover
+
+When doc is NULL, namespace created in xmlTreeEnsureXMLDecl
+is bind to newDoc->oldNs, in this case, set newDoc->oldNs to
+NULL and free newDoc will cause a memory leak.
+
+Found with libFuzzer.
+
+Closes #82.
+
+https://security-tracker.debian.org/tracker/CVE-2019-19956
+https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd9064=
1d8d9b0d0549
+
+Upstream-Status: Backport [http://security.debian.org/debian-security/pool=
/updates/main/libx/libxml2/libxml2_2.9.1+dfsg1-5+deb8u8.debian.tar.xz]
+
+CVE: CVE-2019-19956
+
+--- libxml2-2.9.1+dfsg1.orig/parser.c
++++ libxml2-2.9.1+dfsg1/parser.c
+@@ -13892,7 +13892,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDo
+     xmlFreeParserCtxt(ctxt);
+     newDoc->intSubset =3D NULL;
+     newDoc->extSubset =3D NULL;
+-    newDoc->oldNs =3D NULL;
++    if(doc !=3D NULL)
++      newDoc->oldNs =3D NULL;
+     xmlFreeDoc(newDoc);
+
+     return(ret);
diff --git a/meta/recipes-core/libxml/libxml2_2.9.7.bb b/meta/recipes-core/=
libxml/libxml2_2.9.7.bb
index c749a81657..7c1fa4ceb3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.7.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.7.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${PV}=
.tar.gz;name=3Dlibtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enable=
d.patch \
            file://fix-execution-of-ptests.patch \
            file://CVE-2018-14404.patch \
+           file://CVE-2019-19956.patch \
            "

 SRC_URI[libtar.md5sum] =3D "896608641a08b465098a40ddf51cefba"
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
