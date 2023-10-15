Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5033CDB486
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=D/byFKJW;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaXF9zvBoMqAg8F/H6wo2FocGDDcbpm2mo6RjaxWJE2NCMqXrBRUEVQaElP7P5r6aujP0RAZyHZd8SjkcQZsNZcHSszBSAHCEa49s8uh70Y2Nj6MqlJvHX0lkOPPYYILpfBJW9qQ/nZFLAE8HUe8ZaDBm9KTQc6Ub7/8XCY9KBO0ugnbD5XAwiQ1LcOr39+esKku1UYvvGf+cz+NbYHlBzGF9oryyZrX/dtBiPOTjpnwKF1NPx2r+4SaYGZ91y/MKnrLYCAIfaLaH20DuqeyajfOt19vfLH9BRPC2gfzYXTtHoX1fbcEXZj9/SW5UifwXjUKbR06oYJePZ6Py8QU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/uswOqNFOt1x08C3lwLsvp20EExQ/4R5pDoEM+lNso=;
 b=SFnCqZVOoM1vAOIM1L258ew1nGaqA5aAHeAKelwqDFcCeUMS0jYcaXt9lGa8n5XUOCRvhI9SaO0PleoQCpSMUWRrCRvcepEshfhw+DwRkG+t3HFd7x55i0VB+qiP8CW+naksq4WCNEIqU6BucNaef0XiJFNTzbcrhRWf/Bi+4I60PrhyZoI4vMNryb0qdWkM0FUdS2JtJNX6Yn6CeGUPOzC42Xp2ueD4xqYubR4Bb2SYGWGzKij5DisQcv6vpWvAdezroU6HErWrPF4KPKKRqSIk22k/rJijowfh2uiV9PQ9r4gbxhr6F8wSjmkl8r5rUY71l8usrvSl1AxDY/ieMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/uswOqNFOt1x08C3lwLsvp20EExQ/4R5pDoEM+lNso=;
 b=D/byFKJWNJM2Whee22lvHEXq5wIPF1Dviiw0husEkjBWN+Z43X0s5aOZTBEbXIVywPJ+2djx+wK5ltK+GQCtLaAFDxs59wK8jTbiIyGYJqAXCYPfkIDMP7gyadSv9wwGKD2POReFtJlIZI+65Qv7ujZbnu5FlqzcsQVfIPVO5QoqLEHYzKnGKOC2Ae5uniD0l8qcPJYy8uNDYfNQit9/K090Nbte2S3+SZj/YvfAxQ9kioPPNj4j7BUgV0gm1arnGm5Dqc93C+N1kqlgWE9Xncpfano9h6HR2HtWen8PBOjhLG2XTqcaIMN7dl4x5r9LU1y7jJrd3hiKRrJpt6FeHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:34 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:34 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 04/11] path.py: add support for ACLs and all additional attributes
Date: Sun, 15 Oct 2023 16:57:42 +0200
Message-ID: <20231015145749.69995-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d732d07-ea7c-42dc-0435-08dbcd8f33d3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GKW9N4CoKtw7c19KZyXAEEkKrcfX/rAJ3Vk6Y3Mhjr/WJofcw3QBXgEHxjOYG1swDE0m8Sa1yF4N3ogsIY9+MRlCCRLo5RqdZKkuzprGokj/Z6G9XB1nP1qbPWMHwhJUrAnA5ESscd/eSnA8TEfUUiwOn84jYTbnhaxWBBmcEnUbJXYL9gGb2/KsN628/3jR2eZqsFMvbssX/0bARcd6TooaDS8M9UhYy6z7dfk14sw+z+e+bSBmCAyaZvCIcH4PiM5enlagzge7XjcKmBF71LsndGYkwvjt2x76DvEFqnv5gjQ4Uq16qK06llo2lIJlzj9E4NyDC+vwQ+/4EdX8OQD1WDxxDf5D5NH/ZqkZNHgkq6dSU2GAo1f4o9R8AbWqVsSxi7rR35P9lHX/s9uGGMu5MkD4Rt9dX25CpbJo8JoqkZXzeTp20SzLiYVCmoXkfX7MnbVN62uXOocyMA59psC6gXnBa8kTCt/TfNnpq1MET3KV7ueB6hYJ8KHt/eTdmocGGWJ40sW4Tm5t57/ypKnMaiJN2Fueg9lBxAg99fcZkFWLNkXUeB8Qb+ZYIwuVuWFtEeaSzWECTykL/Ofy8JL3N2m5EEemSR1NYgpfbD/7kDqgg5buTN3kieuxZNkb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oxhlVmohvSlnhhB6xV9aEP+OUqLvZ1EZE/VbabkYXkkrqv1ZDc6hP15QGf2/?=
 =?us-ascii?Q?G6rxfEvZsx3DAkjIQcBnM8Gd60dBeUYNuB8WwRBYUeZmu4XIwfiuamPevoEv?=
 =?us-ascii?Q?WHRjxz8fZXFBWd1UDftLjtQ06ckstNvfw9TRqE2jV9JLTAKvgflUIz+oHpof?=
 =?us-ascii?Q?vVTkgL9CiDKNPeHzOnuelVd1yzu715ovpbKolO/VNNcMmoUQDrGcuOKWcZr7?=
 =?us-ascii?Q?otQpjn1aAeM1BU7/Dm6qHbF03SlAdlhH2ZGW+Q3xRarAcqwxWnjz9gD+hicC?=
 =?us-ascii?Q?8EP6i3tpyqJnSY+jM2i8BuXGVcr1LEsjznrekmbY837iIaKyv+pzsfJPpeoa?=
 =?us-ascii?Q?nQo9OWblltk/M+IOavpBxc7L4KRVGbx9f16aPrYYzwOsPbm1OauesJ22iMX5?=
 =?us-ascii?Q?MchPtzI8ny4OnjuZpJ46s9LRaiT7e1uDCxkdjCjjfXAHR4AY6TuVGB+J6M2v?=
 =?us-ascii?Q?vA+PyYBAu+SbbPAVs/DA4rDPUMJ+sE37iJA/F1Ok9rgK6hGTjON5Z9PeUmqW?=
 =?us-ascii?Q?RlA6xWWAlOz4KhE1jTRW4X3ZlAg4Qz5I+ewGzJvyVOdCSyBOuPYq36ADH8w7?=
 =?us-ascii?Q?YtLi+i8e8Y94WD6zMqzZ921pyA8u2RxnGmEt/+gdQgzbo+pdqj+Cr39kgxUt?=
 =?us-ascii?Q?5BXQC04m3UjRWtCPkBgMzuJxFEBpkVBkwZx5BIqgjxIPBLlZ35h2c5DtGpUL?=
 =?us-ascii?Q?5a2+kmM80DLhNU6EaLgoxwjbpPcA4kP03t0mrhccQHnzRG8kIYYJEgkMvhUc?=
 =?us-ascii?Q?zNzATbZ1Kc/VckQdOgYyVAaFfq1R4IsO7RBqioZBU4Zl7hDLe8ymJpKvDSW9?=
 =?us-ascii?Q?i5Lb2E3EGpBKGRvO1XhKCdh7VdGgoZTMDQSo3SouO/b4qVHVcQexL17L2Tl9?=
 =?us-ascii?Q?COHYN+IT8WbIvgW9wJ+QK6jilGZm+ggvAq5Y7oT3qTRHQHhU+H1kgVdvKFY1?=
 =?us-ascii?Q?ftgMGKtkorGS5mmM0xtz4+uoRwIdCQQE4GXDHuokMO05FIWnRu6RhCP9QDrI?=
 =?us-ascii?Q?7YgX6lKgEM6Paa0STq+44sNE9orH93Iq7VrLe0mHNS2m5XIhyhAm0J7eyKx/?=
 =?us-ascii?Q?ZEw6FHZiVPM5kjGDxTXdccdEXY1gMm1t1+SmlpM11Z5pi/A7fsJ0YIHpgy1w?=
 =?us-ascii?Q?X8uq0NdPdunbCqmdDOKzdXDiKOx5MwIfQcgSuZxPCii7ggK3PtYeh2tMo50j?=
 =?us-ascii?Q?/ejf+ggFVzGD1BUzy9rLjR1kuHOShHGz7T4cfqR/7i7cUdYHhQsfRdU0zYw2?=
 =?us-ascii?Q?bbaxtnSO0VpXHoQJ7V7y2lxs+Y5h5O/KWi52f+yK14vTea+4eyTNZHUwH2ri?=
 =?us-ascii?Q?/iBtW2KcdDbK71FC815/D3c1dbFgG231b1A18C1+iAnFdzqVp8mFYuvYKU4o?=
 =?us-ascii?Q?ch78uit9HIP4MUtr06jOeshJzwr3A4fVK/8T1XKveCl5qkU1hin1SpMFnW77?=
 =?us-ascii?Q?qduUfdmRTIfD1tKEf+IZUk9AmgSxIg+V9XRGCsQ7Mk4y4QQh5In3RwuyBafV?=
 =?us-ascii?Q?2ZoOcUDzg0dF0qZ2ptI0LmisV8oAqeFjk1u5A/Dn29xCU+k/Y7YQQGIjAhZg?=
 =?us-ascii?Q?2H4bfLjEdKdGeUGiGGuOIGpJljcDUwoOMakwG8iY?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d732d07-ea7c-42dc-0435-08dbcd8f33d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:33.8143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6qZBlP9rHdkRHX3ZPdpn+6FA6f+F/A9z78IlZ0Wcy1wUtA7hUFJHSCeDsWEiy8hpvv2mq1eARJp9H6cy5oyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189149

Extend `tar` command inside copytree() and copyhardlinktree() functions,
with additional parameters, in order to support ACLs and xattr. The posix
format doesn't need to be set in here, as GNU tar switches to it whenewer
is uses --acls and/or --xattrs parameters.

Additionaly change preservation of additional attributes for `cp` command
to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
were previously.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/path.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..56e8e214ac 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -92,7 +92,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
=20
     bb.utils.mkdirhier(dst)
-    cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p . | tar=
 --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
+    cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p =
. | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
 def copyhardlinktree(src, dst):
@@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
     if (canhard):
         # Need to copy directories only with tar first since cp will error=
 if two=20
         # writers try and create a directory at the same time
-        cmd =3D "cd %s; find . -type d -print | tar --xattrs --xattrs-incl=
ude=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --=
xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
+        cmd =3D "cd %s; find . -type d -print | tar --acls --xattrs --xatt=
rs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --ac=
ls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STD=
OUT)
         source =3D ''
         if os.path.isdir(src):
@@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
         else:
             source =3D src
             s_dir =3D os.getcwd()
-        cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source, os.path.real=
path(dst))
+        cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, os.path.realpa=
th(dst))
         subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=3Ds=
ubprocess.STDOUT)
     else:
         copytree(src, dst)
--=20
2.42.0


