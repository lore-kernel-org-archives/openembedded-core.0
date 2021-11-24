Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CFBC4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.6874.1637765286114657847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=0HF+1dWG;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A81xWGjhx7KULVBeJ9rtnMUfIL9XqUCBaAKpUYz2s0o9MyPWB0OSfhYZFh2pDpdaWQ5f8W0tXvzYN6NP+tlHy404Xn9vQ7asDwp3anCSifU9TNK9eeAGGmbBBqlbaiTuvvNlPohfYV3iUPtYeNAEt6vJtwUlsVKitPD0xIVUF7v1+I6dY5LOrGkTODhphcpcxghhf7YcdE9cKUbNq80hGTC4fsEFxwR5mOH5TZxR03LrTMYXEtDNpZt/RuUtARrKjD4b3FBSZns2QXCCjA0O/Ui9AnA7/XGXYzcuBzv0A+yqHefTivUxOyHJHeicjCfuLZCzNgprtSYBUEOpg+11IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL8BFLDKHRJw9DqaBkSkYo2u18bBCQDuJhvjShoo4QQ=;
 b=f95EWKAxh9DrdoK9rbW86qLpJqxz2FVfL+vGDWxdLPw88RajSzt4elVCi3x1myHfoNkUrIwvii9X3eJ/EAVOMaOBalqjGhQWypbfkF8nqFB2TJnWlDm7U93ScuxudgmQP9LISdj50MC07WAoDTOhyxzI4ppDgs9w7N+gNWq4mHCEpT26l1wKa3F2Dr6mJqiCHfbTjTvYNs7CpV+6lgNZHraMcgjyOmwLrzrPCrYl5se5//iBB/RFRTIreYnUdHBVf593jWZ577KaoqodpTn2fvMmxUfjZdQ19+/nMAo7n69KAs/VaGPly1/RdpoqNGTXhOEKN+bkuWh7qd6pmqb9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL8BFLDKHRJw9DqaBkSkYo2u18bBCQDuJhvjShoo4QQ=;
 b=0HF+1dWGyVsy4XY7PEIGJKI78fJPPA5/Kp1X5m8zR24UXRwgcKN0+dKH8QZyC1Swy0r2mPw8c3LIuSeiu+LH8eEf/doyM3/Kn6CyIrQo/x12lYdKcmMhfB0DZUsvkd+rJVKQTJllOGFkJGz4KxGFWFKCyYt6OqpPiZ4ZJVLUQeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 14:48:06 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:06 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 05/15] bitbake: fetch2: Support archives with missing
 search directory mode
Date: Wed, 24 Nov 2021 15:47:29 +0100
Message-ID: <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a7915a3-a673-4911-4a05-08d9af596cc2
X-MS-TrafficTypeDiagnostic: PAXPR08MB6447:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB64479922C3630419BD8D6D61D7619@PAXPR08MB6447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fHeQOD3GVr9KpK8YEQxgHICsphHHDz+ZtrCeQZyN41kliYOyKtyZR1/H2z7ovGwda1Ecg+EU0UH1BaWzwQ+0aDKsiLZLumsk5bZcobTgcpNIlX9uF9ma3MpJ3TDhnXcHd3XDBGnA81sgeTwroCfzOr9ZzjojLYw5AN6bIh4mGbuz2VCy2b5v1VMUpPLDmel+N/tDYH7oXTOiLnJ8OXWR+T+olwJSMBq+NEoReFmT2cgJ8Gk36dDIiV1c2F6KVm8n18p3RbSwMLeXhFKXj136hDlJp+IdEbedXIOhNk1sZxNa444bgUlHiUd6FkDiLenUZVcUwKcrw0r6PYwWMQHwRaEhpugVvQN3kAHlE/HUeLtxK30QGbRckTb5mtww9aHIPeQgmGut3LtxxMAbfmCXUyLA2NRUxau9+aopok6ESXD4LyvxCz+P7zWTQZtmCqXys9/4tm8MtkUiUJRSqqWeacv4zcGnDE7UyoINaz1kKikC1ICbZMPSCGLD94JCmOVdMEvWDBAST0aR9PExwghUclrt4NbpacoqEYYU+fMbb44URoU+6PCd4j8lRe7TFWJJoprv81CVckAJqixQn2zjgSL5XwNAdyYBiTf9/CXal1qGKK4oK8a+Sw4EkUkbqmyPeX8f2Pat3awAa4JgtPkcsWuJVDLiMlPJhhoe20BeVHRWcq/qBcp6LoSjkqgkSx4X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(38100700002)(38350700002)(52116002)(110136005)(2616005)(956004)(66476007)(66556008)(4326008)(66946007)(36756003)(186003)(4744005)(26005)(316002)(8676002)(8936002)(86362001)(5660300002)(107886003)(2906002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gqXqCEQGWaCHtTb7GicOrh2tno4/h40iFDRtOE521deq3cs+81Vwkk7mghol?=
 =?us-ascii?Q?luNkndATxn4haS9R0IHsCRDxO2dQ6aQaqXpUuyHNCLEOO7hNV5VeztC5AlRd?=
 =?us-ascii?Q?INo3gTTKWL74MlSCkxQcidZNDmeDGrcOG6JPbI9BIbN7JaZMgHYSu7FK7/5L?=
 =?us-ascii?Q?q6rbR3WdrNh9iI1Lxb41DfmHWwxpJIqLH1SKToFLfcE0PxMauUuTCUA1LQyS?=
 =?us-ascii?Q?Pt5S863cWS7jB55mQYPZiv1TPc130KRwEPpd1vTp4JnMLg9yvMWyLUegC9/j?=
 =?us-ascii?Q?BIoJEFw1KpxnsnIUQm0mEefhv15r8aReD70am2/AbevdS7I8C4+iEC2gyGG/?=
 =?us-ascii?Q?mGgPJmQrlob3j4fbhQjSmhpdoGbwaQdAb9DOvw8fnikbjRzeLeOO7Oe1qIW4?=
 =?us-ascii?Q?OoBLIABh2DsIBpDDVdMeYBZyz4PvRSifoGffDzpWp2dh4vvADje9cdjfdZl5?=
 =?us-ascii?Q?6Yuk4NVyZlHVuKyrUftBuoiM2/VYE7S23UXjjyVRcaeEz7wuZg4NZkhwis9O?=
 =?us-ascii?Q?BSqckp1Rx4NiTB00EV/XuiE9MDSdYqZ0S5MFrnm0GBCyg3mO/BdbTBdtagaX?=
 =?us-ascii?Q?QxOU24jd2E30XKujqzzZnQ8Nc+1M8Hr5h8T6jnNNIt+Vn88pt2auk1ll1q1i?=
 =?us-ascii?Q?ADS3D3Ra5ao1fmfVzfWSK286nrS4v9ZHtp97YOtLedTyWhs2fBvMWC1TvD81?=
 =?us-ascii?Q?jur9u/RPRjq8Xxy9QgGKMmsnDMmXzAvIwyWta8dpHzYm+QwthBE+qhpR9XBg?=
 =?us-ascii?Q?8pHGRfseiGgPhNi48Kjs+C6eKtEYIQIu9stbSiqFcaCZ4cfZ3bpdaF/DvSsH?=
 =?us-ascii?Q?4FarEiSMypk/MiJLZxhaIyPrztKW87elua2Y9wqFcD8RpfPtYdutF88WGO9y?=
 =?us-ascii?Q?suEnyQmaBYAK1rgw3jWPsx6uCxGrD5q9VU6LLh+Osd7jlaiIVAF/ee+6r+z7?=
 =?us-ascii?Q?M9RFoJZi/P3oD7Aw3OLWFHqynQNkjso/dwVkbQ1vyxJAFPxff8FRkhqa0Teh?=
 =?us-ascii?Q?TLB9v47BrQkxPdx2/Km4ovkmXvVGIJs/iLGylZBZtUAZ4T0+hLUJo/PXHawk?=
 =?us-ascii?Q?rwzOkjKa2EOVlV3KGceXSR3SKC0vEYtXybxyBTTbz7SK/Ki/TrjURxeKgSaK?=
 =?us-ascii?Q?gkA6WvUMSaUXWadB97xatIcu6BL96Qv5jg1z92/0FOL2pUYhBxhs9Ue8hJ7V?=
 =?us-ascii?Q?t0fIucA/JA0jc9tHU8DYse6T+00fKLd2uUTVBjJlx1ruE44LYAMzmGXoO6D8?=
 =?us-ascii?Q?aQLMDrVo/dTVJw/0YUroo7ZnqLZ2HzmRwWqT48JDJNpm4LVd16+ogDzIFozt?=
 =?us-ascii?Q?/k0aJEAZND7b7SEash9UIRH+yWxk69ArOr2BfLHxnxkk6rAFeGIP3yoYDbyN?=
 =?us-ascii?Q?JFLH5jSmXK4grKTU9IGYSfI1DUoUcS43dyWuvE7ZePE9jCoD7hHSZYI2o3QC?=
 =?us-ascii?Q?+KV7MyPKuEZwzIUOHdKZdzDcFiUxiWmZDf7N5TAzG7JxcWnNhsyewQKGz7k7?=
 =?us-ascii?Q?CRMzCTjy5FSteN4+FY7yVp8si+E26kVZCAFRIsBj+n++7jfSQse0Uigysr/A?=
 =?us-ascii?Q?5thzQbTtfx/r2U3xglSCIVu1YKC4/yZtO6+qomaWd5I+K5M3+JvsrAhpupdq?=
 =?us-ascii?Q?onLDPRMp1k5f0zCrrg5+D/Q=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a7915a3-a673-4911-4a05-08d9af596cc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:06.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UvA+vgJKwHheoeVJc4E4qn7EpS3n9PpKQOdnZzn6qchcvCpq+6+ttYdId4ZV6U4TAOBsz7PF3DAwLoqrdbW2mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158706

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 bitbake/lib/bb/fetch2/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py
index 05b2d2e924..8ad4e3a5ec 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1554,6 +1554,7 @@ class FetchMethod(object):
         path =3D data.getVar('PATH')
         if path:
             cmd =3D "PATH=3D\"%s\" %s" % (path, cmd)
+        cmd +=3D " && chmod -R +X %s" % (unpackdir)
         bb.note("Unpacking %s to %s/" % (file, unpackdir))
         ret =3D subprocess.call(cmd, preexec_fn=3Dsubprocess_setup, shell=
=3DTrue, cwd=3Dunpackdir)
=20
--=20
2.20.1


