Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.51])
 by mx.groups.io with SMTP id smtpd.web10.33189.1627320492573653215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 10:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rUdl+IHG;
 spf=pass (domain: kpit.com, ip: 40.107.139.51, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5/leSNKzki3FzOjqACgh6urWJntF1ZuuC12f2+mw3P1eEWInncCWm3m0bWtnHpZw6tBava3LabonaqIlCxAVq1MKB2t5GRrh/tleITTe7r6Ch+z4yeHaQ4zLS4Z1vTH+abLaKq7Smq6FWV0JCW46asudKAWd4M+0QgVysmJjLoCMfOlRYBUIl9Wix2BnzX6WKay9GqQwy2koDmZv0eHWb8ZqprhXzbR/8h3xlvYde8tUjtRxR9BVH0Qqccp7H/Ak/WTkfqXkIBC3XpFGvXIHwnGSeV+egpiYLvmALurc+IGFxQ2k/xGPMkS+T+IIxox3scoqpZj8zrLCiPKAb1gJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHrah5nZF9J+gL+pbDh4pLNJmDHOGZoF4lHxvb/vHV0=;
 b=he9PDMw0E0Y8iDaGg55lIpz938yH+yRB67cdtYy6OfDWV/4ySIBKvJoUP95H27vw1xZFTO10c6oNFklG/ryRxbXLxDMKZ8vbYeW7MP2buNgiveVBj60CtJIpPynqZcm4uIgOKojOkpGhVLFfFu16LLzeH4vIXTNPBscnVrKcm18FhFBT9rPGs+xBNKccDmev3AgQELo93reT0f8oTj4YVHsWQT07Q7f/piI3OqM/eNO4Uq8+M2DGQ8+/RDUx9hweW93jSjJQ1MNWRu4Ecw9CZFmUcpuEXQSV4HH5fLzomHk+dQj9z44C6GfU8C401gk5EX5i1Ytyl7ybrGxJ9CGpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHrah5nZF9J+gL+pbDh4pLNJmDHOGZoF4lHxvb/vHV0=;
 b=rUdl+IHGq4NcjJWf7LGLlHHYFat0PS3pDbQBOL0+TgqZVCu+yaBAeTZJmZbZ8JMO8P6gPs7YU6GD41XOSedNXAvKuzScJS+FK/DPJM616/Y/IfnA3yuSuQPq17vfLHi/XoZFxRd9Hfxyy6fRXaqYXY7xKqX05MYfaJYCPYJCYMA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB5359.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:33::8)
 by PN1PR0101MB1887.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 17:28:01 +0000
Received: from PNZPR01MB5359.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::157e:7fdf:f13e:f3b1]) by PNZPR01MB5359.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::157e:7fdf:f13e:f3b1%5]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 17:28:01 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Neetika Singh <Neetika.Singh@kpit.com>
Subject: [poky][dunfell][PATCH] curl: Fix for CVE-2021-22898
Date: Mon, 26 Jul 2021 22:57:46 +0530
Message-Id: <20210726172746.8295-1-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BMXPR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::33) To PNZPR01MB5359.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:33::8)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (47.8.13.138) by BMXPR01CA0023.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 17:28:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9292d57d-8964-4333-cc1e-08d9505ab7bc
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB1887957256D18EC1E79747C59FE89@PN1PR0101MB1887.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eZBVsDhf/Wm/eV38FBc1gLVxKDGnesv21XztnWfTGqQft3Pk4ym3oAYawh/k4x/tEC6nc/kTOLuils3/xnzTqbTTMSyzLCCq0WnyGzGPQGefnGqdt71zqi+kxKBu0twIcVuLvuMLYLuWTKkAH6JFeEMQUstUWkkm3F14iO+AdFSbN8fBmomGJnxFwhJYZ9mbLRzdb9DzuceRriyNl3A3tdVuBUu/mW34r631lRBpkKZxtC6r0u1b3/22oj0+gG3tPOkfrYAdFLnq+BFDEhANBdNzxiiwYto5s/4iJtczkhbKDX26GDuhBMOkW4XNIfpjerQy/f2khyVANTdblGpmhCb0aauqAM7ihY5zV+xcqYLg/IjqHTaly4cNzY9fIs97xvX3tU8mRYvimNEPtdcA3gYSTAPZrKSdocR3Gmt7oSpOJGHVgezdeJoP5l4q0HQMiPXEBWlivDvkajZbt/yedl52qFEaoRpjFEeMRgQeb1/aEB7wWK/Wzwug//8tI9UgMMR85yXsQcS1vc6vVNh1U73x2PmzKuYzj1vkLsQ5DK7jLIpbnvWxS6UyPmdmfOk+QC2b4Yl8Ol4PcujkZdEohFyX34ZrzX9/Uclp5j3hZLIHNaMNXIZad0N7wow3MQ0MIvAECl37UhAGsw1r4xqWY7/ksgkY1nbdH1Oy1omYptcoubh2MdIW8BxoJfwIvKDv29lCzQxxKQEkqVzHxEC+qFn/aCZ7GkpSTUKaQ1Sg/ub/csk76tmZOpmARJ7DOr5t+qx7CZrGx3Rxci5Kbl2m/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5359.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(316002)(6506007)(2616005)(956004)(107886003)(66946007)(38350700002)(66476007)(6512007)(186003)(8676002)(4326008)(52116002)(26005)(6666004)(6486002)(38100700002)(66556008)(66574015)(5660300002)(966005)(36756003)(2906002)(8936002)(478600001)(83380400001)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LdJKrFy+9jf/kws1cAsT/ZNKgKa33yw7lJ1712H/q0PbXU/ZIFyTxdZtrDgR?=
 =?us-ascii?Q?/QDgqfhMEt9wEKw4oZNEHIvMfj54eorT3Mqujnnd4iMELLU8gRjATefTuKWD?=
 =?us-ascii?Q?sVRmkCu/Nek6fzs3xMix61vL/GcrOn8HY1K97waH2b/JqlDEm1evT9cA/s2V?=
 =?us-ascii?Q?dMQh+dZOXWgJMC84M21SYJ6WFwImwNyK3kE3x0orVHHN1tPkSel+fCm53DuZ?=
 =?us-ascii?Q?zFELmflysHz6gk4NEPrB3M63y/FbRXv75DW1lSnNUkVpbRGQuBqdnVd1KH4j?=
 =?us-ascii?Q?gcTkrR3Dj/eJP6a7GTKWxid0lE5aZu3toqp0PB/koKC9Sgtw2jFYnLPn1VxI?=
 =?us-ascii?Q?x/OSTA0ubFmc3OlBshd7mGZAJdccjk88hdaMPSXoKKsrwyHnU7GVBGjjPHVu?=
 =?us-ascii?Q?HO+hhgPyJ3Mce5Ow31X+AgkgkK8Uw32tSJDet1kEPH4SpXNxeLp8YX95Lt/t?=
 =?us-ascii?Q?IM2Aj1ZXdDtx/8FqxNCzaQSnREMsZR3OcG6z3vS+SMNxks6WWf4ZGxdm5+pN?=
 =?us-ascii?Q?7LeQ9bumWdGqIhQD4ucw57wlyfqRIVbEVAzOqwZCCXZszgsf5/J389IDCJxq?=
 =?us-ascii?Q?RBDIaPCRW68qX5L9f6EZO3DazZWHCoISE1wtmFTr4fF6gsUhI2ABtfIQHN/d?=
 =?us-ascii?Q?BlsMM2fgUQZ1hbUSmLFoCMLecNxfJRrOqG7mANcx96o4DoNKNacOVF6wHN2p?=
 =?us-ascii?Q?vDcS7MUoqBO0VrEY5Uc9+9AuYjAkVijAd8HW3GqjTRZh+QhTbe4xQ3sbIJ72?=
 =?us-ascii?Q?b0xViilu/Ew2jhNPC+CANsO9P0GY01AeeX9/nzMrxA6goEbj2SZvy6NEcolp?=
 =?us-ascii?Q?3YLW6PDGSiZDjQ90tgoqSw5sFMZ+T7BoFklnAmxBPf6bY6yCYKhlBBINTqEY?=
 =?us-ascii?Q?PoI75uV3QFsMEFaLeHctLQy2yYKShyZzU1D3mt6LyRjTieKh6s6TmfxfeJha?=
 =?us-ascii?Q?sSKgmZUMUVo5FHGWQk5ufnXSg+ibtDzo+eYY1zSJEpAdlca1f81AjINPJYBt?=
 =?us-ascii?Q?fbrx5oMTwgbWBgcVvGw4t8q/hOj7ngb5G4tVfJUFfNc8yRhMssJ4tB5yqAho?=
 =?us-ascii?Q?301gWR/xY59OiroDt7sIZjPxsAj/BVYGk6g/k5tIhZHWl7iP/MWHGaktYuOi?=
 =?us-ascii?Q?e+xS+tNvQEeNVq+jM0Tlrcah4NdIohB+8N0mw4DzybmS6mHga5G4DMjv5V8n?=
 =?us-ascii?Q?fs+nWqk1fWFWnTqTwvzoK61jITGzMYCvZTnCd7AK9C7q5DSg/L5D7Fmx4m4z?=
 =?us-ascii?Q?vSu/zrdiGzQqUSEhNMkoq5GPtydVyqBG6y5qpHsEWCTFewiVe86lKYA3IRju?=
 =?us-ascii?Q?JpJ8pbg8B0UkYuV1WPRde+ky?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9292d57d-8964-4333-cc1e-08d9505ab7bc
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5359.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 17:28:01.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+1ejODpC8p+mnN2S1LjYjBXuGzgJf5KM9zcjPzqVqshvzm0BYrGDx+9o0idCdnst1mE2hhDveJnQQSXXr4N2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1887
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Neetika Singh <Neetika.Singh@kpit.com>

Applied trivial patch for cve issue CVE-2021-22898

Link: https://github.com/curl/curl/commit/39ce47f219b09c380b81f89fe54ac586c=
8db6bde

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 .../curl/curl/CVE-2021-22898.patch            | 26 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22898.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22898.patch b/meta/rec=
ipes-support/curl/curl/CVE-2021-22898.patch
new file mode 100644
index 0000000000..0800e10175
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
@@ -0,0 +1,26 @@
+From 39ce47f219b09c380b81f89fe54ac586c8db6bde Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Fri, 7 May 2021 13:09:57 +0200
+Subject: [PATCH] telnet: check sscanf() for correct number of matches
+
+CVE: CVE-2021-22898
+Upstream-Status: Backport
+Link: https://github.com/curl/curl/commit/39ce47f219b09c380b81f89fe54ac586=
c8db6bde
+Bug: https://curl.se/docs/CVE-2021-22898.html
+---
+ lib/telnet.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 26e0658ba9cc..fdd137fb0c04 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -922,7 +922,7 @@ static void suboption(struct Curl_easy *data)
+         size_t tmplen =3D (strlen(v->data) + 1);
+         /* Add the variable only if it fits */
+         if(len + tmplen < (int)sizeof(temp)-6) {
+-          if(sscanf(v->data, "%127[^,],%127s", varname, varval)) {
++          if(sscanf(v->data, "%127[^,],%127s", varname, varval) =3D=3D 2)=
 {
+             msnprintf((char *)&temp[len], sizeof(temp) - len,
+                       "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
+                       CURL_NEW_ENV_VALUE, varval);
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index 13ab29cf69..9b510bcf9f 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar=
.bz2 \
            file://CVE-2020-8286.patch \
            file://CVE-2021-22876.patch \
            file://CVE-2021-22890.patch \
+           file://CVE-2021-22898.patch \
 "

 SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
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
