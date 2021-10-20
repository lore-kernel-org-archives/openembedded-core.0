Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6375EC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 07:40:46 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.64])
 by mx.groups.io with SMTP id smtpd.web10.4847.1634715642636144651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 00:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=pb7CsOyZ;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.64,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsAeZEOlCzvrW0hxzVkFajQXg/IE5pVmi1lVFUYRA+MxlwI88noJG8cLSkH44unnrhvMIxYKtyxkgzLtZrDaYHfIK4qaDMih7SzpMjxi/wjp0UPicJeGnBqO2FCEP5vZl2a0A/p4zfIKaFj7u5Oa0rNPzdOf9olJ4eAuZP7JJQ25QBG/FAMnfr7IQ3HPVNs0SN7YTW1xa8yvecDpqNsgpl9JWkhIKVGW2eZKq0+FdY2MZ+oALALDfqiU5/8A0y9MQ3oqXwwhLsWuo3Sc6dGS60zUPAMCV+aE1B/cuGyp76sN5C0QYEd7DFT/F9sHHviFTZuoBvI1bZZ5v6/THjBRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlX3YfCymZLSmfALX1dSSylcraTXM9cN7n+jhYox6XI=;
 b=Kq2tX/VYBhDAN/RWOjWxCzjB6E+0pq3YYWIvLhDDE6/u2FzSHW/1kntM39nSl2LeTbrikYGs2vsSADMR13MGwigg5lyHk0Oitn/kXfljkup9yPDheAI4k2x6bhp4fMh1NCI1EIm8iWRPCaipPycg7he1b/nMpWgit57vyap88KqsxmlXjMf5y4cFSRrDzGe3l1KoEFQ8DjNAR6bAhA2dAGHHD1Zy4NmDpw/1E9ALhLwbHls5aTheLEU7mxzadfjypmyWTRU7cX7fvydkrptstAgX82diiD8fHrE6D33U3VbpZQDlPzrSP8JtqlpZeu+7CVIBlz461ISHaac0YTRL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlX3YfCymZLSmfALX1dSSylcraTXM9cN7n+jhYox6XI=;
 b=pb7CsOyZ8B0fGRbAUqVsz9xB7QmoBzwHJwTjDpON3zjGJDNnT6Slla51Y9a6GpqzOOOkycsfP36YskIzYpwwsRE3BMWJsbZ8clVyST7YY2x2SYM+ld3YToJJDAhRGhoryGwZMlmBqB2YtxmVy1J7PZeRDyJXqkJ/KPE/wPV2XgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5998.eurprd08.prod.outlook.com (2603:10a6:102:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 07:40:39 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 07:40:39 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/2] recipetool: Simplify common source files skip in
 guess_license
Date: Wed, 20 Oct 2021 09:40:14 +0200
Message-ID: <20211020074015.860-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0055.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::32) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (87.129.248.106) by
 AM6PR10CA0055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 20 Oct 2021 07:40:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d32c2c8f-9dc4-4765-4b5a-08d9939ce94f
X-MS-TrafficTypeDiagnostic: PA4PR08MB5998:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB5998CBD28E6998927B02523ED7BE9@PA4PR08MB5998.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	seTsijE69X/Rpp0Ue20efnpELZacKrRT5AJCRYdA+qVzIOtJ99jgivQJvGs/nuH2iPfe8UGog1aAaEBjPRyAb5SrzeCiaJNsSjqdqfMR4mr9IXTZfQ5PaHVX1jSlW8eqofOKxi8td9lvklVw7TcYGYUKkBIKlBfqvpSopxf7uUfL8EIehATJpAF1wlidPxGOwp24KWiMZfLCNukIxSb7Vob4PDAfYaFM0s9+zaY4cPhBqnq7z/GckyHcX4M73VS3611sXaYo16OppB2qqss2AVYe61UlJepTZ+OP3wBKV3mA5qontN+HG2KwTHzm4Sk6bb5uCH4czYBz+dollPd8BjgH49dJ7lRlF/LD+C8R6KapWr+Y674fJzg0/ADpr9GTp5alqOhTkel2b5NlDvE2UKnzPRHHY5F3MAZ8mencxJbuCU/7DV4i2HackjOEig5sRjPTVCg6LCrmzDTI2vYNEtTsZ0FCWXfJ/t17q+TXioGbsznDSmD/ZTfTaaxIEchLWfY87I9GXgAnzw3J2xqGaeBnSmpUAO3EuqCXsDMm+ae2ltdDkAABn8vP/ReKOV1o4DgUtapsEVZpM1OGAnIsE2ULCGXwJf2emBoPro/OUyuLpGnuyNmg0bYL7BBBKVrPxeaDCwhi/Zci8sjZX9K69DTp4fasSkOhL762lzCGKoaGm6tGMwGVnqiqmbSDZdPp2Avv6+K43Cl52r+W/tP1zg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(956004)(26005)(107886003)(4326008)(508600001)(2616005)(316002)(66476007)(66946007)(66556008)(1076003)(36756003)(2906002)(6666004)(38350700002)(38100700002)(86362001)(83380400001)(6916009)(8936002)(7696005)(8676002)(52116002)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5BadliRATrrd2K9qGa/S7oCq+db3DZ9L1mVg1vR4+eO5PiefBdCJplAcTt1K?=
 =?us-ascii?Q?v6WV7ePvx9dLR60puflfDIomKltGiSGVeazTdbH1mRZ7qvtrCReLGgTZPv2B?=
 =?us-ascii?Q?2+SS26LJozXMXJGF0YkER4Wd08LYTwKTIXNRPmxKg/cpjQHrEtFBqz5DtEW1?=
 =?us-ascii?Q?MXOIcjHEzpjcNcAeVQpQQrTt8b2bwP2kp2lPrLMywg5dR2H/TLu0jnSjtLPv?=
 =?us-ascii?Q?PXH7jmxVoBFoY+HAdPKW3YzRL7J6jlFABE9tW5LCnZji2NvjrK4rN/X0+68t?=
 =?us-ascii?Q?gt2LJz88ysG9SctDsg2s9f3FHdwbvTmVVz0zZOOJUJE5NjuJe8BNjQ0JfaqF?=
 =?us-ascii?Q?I7jUXfiJclUkKcIi9cw8anMs9zutRXAbml03TllE75x6oyhbtq1g6LBJF2Kr?=
 =?us-ascii?Q?XSfMmN2Qi344DI6haKBNzYbo/JdWl85JMZNpP5xwRsHcGhxOlOJFH9CBAzwQ?=
 =?us-ascii?Q?d2Ys/1SS6fYFG6tN8uAUBdK++VGSP2epSrGxSrvE/bvx5lJEpk5Temc9xsx+?=
 =?us-ascii?Q?erEM3rhFLYdNTV72MLOS0qHyp/Ltox+9ElimAW6CQCbsHXwFPoKAVXNVtwwZ?=
 =?us-ascii?Q?9M8LzPnU05RylMq6oQKsga4eiv7pyG5ieVg2Kl6XYlCrrpmXsxQpn21rs91I?=
 =?us-ascii?Q?mSeD4j3FoeTv1Lh+WEehtd1DDx85uC2sFUcDq7/7dK410JHbcmAI+aEu9n7F?=
 =?us-ascii?Q?2HQGeUrqxkermOb08bJhIWfZLacuBYAFNjHjb9k7LsJehx+PGu069p7iIMVw?=
 =?us-ascii?Q?2SXjdpbO6lMOosHhcJcYw4YqAODo/WWJ4KBtaZPh/enLso3FQMDmdk7KSvYZ?=
 =?us-ascii?Q?72mhN3AUs+CPtCIqrlbwv1o3i9j+rwLMaUCHnWT/GCOVVStAPrfmlMArOVXv?=
 =?us-ascii?Q?JmE5XFJApvFcsdmkMD9rCMWbJInboVaVhNJR1s4OvLJT7fkApTyAfaCWbXRB?=
 =?us-ascii?Q?vi1Wg3Wo67qR26hIIknSZgYH0HoMmuEdwi2lw2VtDQzw/G74X3Yg/pFlN17h?=
 =?us-ascii?Q?w9QEZOa9pGplJsYVtzCSv5UqNbRrXNZwEm1+9voyoaSj+3dMiCtKcmlme3kU?=
 =?us-ascii?Q?LsIUfRd5mN6QCcRsTMk4xh/oiyy3wghBaUBh++8KQtEJhTS++dTPTDdKNJ/z?=
 =?us-ascii?Q?A5Oc+ybHlNQarB13X0EmtIWzvhBT7sV+vojWr1v4MmA5HOYp+a/yowsAo+q3?=
 =?us-ascii?Q?qyTZV7ujM29ZXuwq5mixCFWYjPwm2AUBEn6H3Rkogen/HaKTNFixMLjuPv9m?=
 =?us-ascii?Q?/8HedHQ3e8FM05QsSrDorLG/I+CvC6nRnpaXZLCk0TB19sZe+UBX5CqI0jpC?=
 =?us-ascii?Q?WgJ44HjKnjchxF4/zbSmGM7eb/0c+uLr5TytPK7MEboIp/rYUSLh8qGk1shm?=
 =?us-ascii?Q?JdlXH9EoR2TfrxeZtyZmCaHrbn0lVAnaqYkbsEVI8kLuoZTe6wFtBNkB1jeW?=
 =?us-ascii?Q?YMqI+5WV/2mrVuY2bwcRyI/Rk9NdEP58?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d32c2c8f-9dc4-4765-4b5a-08d9939ce94f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:40:38.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W991905@weidmueller.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 07:40:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157250

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 3b58d6fa82..5a267fb57c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1188,10 +1188,11 @@ def guess_license(srctree, d):
=20
     licenses =3D []
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
+    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts")
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
-            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith("=
.json") or fn.endswith(".svg") or fn.endswith(".ts"):
+            if fn.endswith(skip_extensions):
                 continue
             for spec in licspecs:
                 if fnmatch.fnmatch(fn, spec):
--=20
2.20.1


