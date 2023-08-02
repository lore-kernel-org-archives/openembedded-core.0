Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ACCC001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:53 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.138])
 by mx.groups.io with SMTP id smtpd.web11.575.1691012452313609051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=AN9nXebk;
 spf=pass (domain: ni.com, ip: 40.107.237.138, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku5PELRniEt44woeeYHN0y2G6q3mBb7F2e1ZTNLHQxco/B0WaH0RT6XdupiXOnYb6ddNs/4kbVpdw+4Op2kssj6raFJK3TGIEjr8kKwldUc57z+NVZEH1vBKvdp8gSHwun3tR7uBBP6SeLCLFNpUTcliIfLHx44sO4z5lW9pn8oAi+rJbXZb3+UOYVGtqvpvP0BiKu2v/7nc7TXLSVwVHzDUNyQif8VT7GtfmrJuGNeboyXyrtQv3rvbukxS5JawLztvvUp5E2PNCrTZ8exbAsKzV75f6I2FBcweTShanYIztkO6nXmuRzruIFEOQ4p6oPANnykoDkqhVsrQL//2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp3IZuvVfAnQVh7kj9lg+pkZs1BGDtMA7mOv9bcvjlc=;
 b=nIvYdiLQj5bG8da23wKMIBwDf3uAh++sbT/+XJ78cx2j75/NgkB09gvP8OLpPDlz01AYJZPBwksb2+3kyvDfM3walmOofy5CVIA988wSgHMSgQFdFeueFqvVb03nvPdg7m7YmrARG4Dn2bKOf/sTSqLGvhkHeKb5g3x9oV4i9An8JXMxWHjjbQ15fCPHVWa1BoJvgl2EIdfiEQfKhhMXxOtQpfcfikLMFpGvGskHWP5OvM6javY7JwQk9mOcGjSW1hgMDcJ/Uga+0VE6c6j1HzMfg5Pvbe6aMoFDEF9yONGL2RpB3acMJMESsZ3O+ExTRJ38rT/AuJNiuFhaW+T5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kp3IZuvVfAnQVh7kj9lg+pkZs1BGDtMA7mOv9bcvjlc=;
 b=AN9nXebkXfVQwSHzicavCdXVRnzfge3oFmRiu/0jAPSTFD/Ii6zbcqPotS0USWwb2wvsQzDGfgs5oNFHj+QO1KkusWPOQNM+k1OHG4vxGvatNkhbDYwSiKpUcK8rfZjYzZjifPXNJG4c9QXrJia2qfpW5IcbZa6he2GGr+6j9kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:50 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:49 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 6/6] packagefeed.bbclass: Add cleanfunc for cleaning feeds.
Date: Wed,  2 Aug 2023 16:35:10 -0500
Message-ID: <20230802214019.1068795-7-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214019.1068795-1-charlie.johnston@ni.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::30) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd94c24-226f-409c-e4f1-08db93a12388
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lYjoq67coTybtC2HPQNcl73ymO7VgmgOuA4k5qzQK1ydP9GqWPbCGU8g6jcaxzIBUh7j8pH9l7+yziZC2KRklSBmFNES/Ln+zm60XuSNqhoHqJFwUzCutLLYGtE4P10sw5oiOGHpqqFRY0bshCzJ8hMCQ48F2QoUMlYZO39WuyAHs9ttFQT7JO0mATmt/2MOz3ePN/JT4VRzTaX2JbplkA6TCATSBXpf5ydl0OLuECFtliYS0PCknf38aZyZ21t+kAoXDU+xXY3qw4cXsr6h8MUyTKiqrleBJjddtYhFzlnWpxlgIw7LugXsalJrwja7RjxS/IGJS8xswzLS6UJSejKFURpgmMOVeUsmhjq0nEPL8TY4h3Q2gKs0GZ7QWH5TaogKOG54Cyra4nPsxDhT+7H8/u2siUNfif8l4hVLEh0Pnog0hnMMyKY/HPt+B4UNy2zYCFrFSScjjNPKgA23pGuYWumvaLCDpZDGMGVyHbcGMmzftACjswHwE/3umHCdUMF0ULXx7ujXr0gwDDeCpnQi2krAAqlDtzIT2rKUWP+2oU824VsbEY8vX8gAq8pz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(4326008)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mfWyvc40Vz2HAKhKijSnRh24KbhhZvhtVwpQ6SqB2Z7EahYhnDu5DdMDipD6?=
 =?us-ascii?Q?kp05OidJyPZmz4mOiMqQ2HI5XdchoHkFRcRj6a4k5UYQfZOb4i45GmRXtdDQ?=
 =?us-ascii?Q?whcVq+nf7qZtpDtNgwA8/6JdQRA1wu3HQdoItfQC4g7d2eG1JTBu3waEfkih?=
 =?us-ascii?Q?veB2mMotEnzKmAug8CE2tPNnxHLBWtN67w7UqmMOdI5ZI2fKLuvXBh+SHGLa?=
 =?us-ascii?Q?UEg4Y+bD8i/YH3nirtf4DZONA57itXoKbdJkpt6ssp8zAJtbYIZWLIJaTPX+?=
 =?us-ascii?Q?hxf/u3ByKphEZVk1ZY13hRmvnhWsx35Jgprzwe3F/YAU6JpCkLGDKDdJAhK2?=
 =?us-ascii?Q?5FgNGH/YlQb911wcO0qOOqkBp8Xkv7Awk3wVUfs3kcqSDlha2eYwWJHuPEc2?=
 =?us-ascii?Q?kaqNucA6WolhA0wflkowqLSmKQc7of1F0920ay5rQZcLoATjj2MBNv1ohe9v?=
 =?us-ascii?Q?4ZX5fh8gR1pOhJv9WOg44+0YpxarT3FwCO+kOjMA8aBT/o58PhtF3dlWDors?=
 =?us-ascii?Q?j97occVRNLz3LVykTD/rTPObdyD/AXoaSgnVwLuKhgruvKK3rFmIj94l42ZK?=
 =?us-ascii?Q?pvT8uipC1X5YLyafDI0dViPg797fdvq8PVeQbCKI+7GGvKjx5BwMgalmDTBc?=
 =?us-ascii?Q?n0tPv8pjw8K5O8N6SiVpaBuGdpJ0Hs3fcBsI3UJ86NTYqkNcILsmvxUVDfmd?=
 =?us-ascii?Q?2lTmjzYEQP3i2msaVKLUaKbKIJOGq8Rf+rz/EDj6U+/+K6vjzAxERlZQOhM3?=
 =?us-ascii?Q?MNY8aSFKYQB5D0mPw3DVMGBcgpDpmpgabZP0ULgMOmKcwQgK4n1O9LXcvz1k?=
 =?us-ascii?Q?mCDeoZ9zBk4dEz1JMojmhOHJ4gqR1BC0L0BBicZ4OCR801JR3Bbl39wlSqC2?=
 =?us-ascii?Q?vSMcQ3w/0mJOKyR3STqslIOTxynJp0Av2ES00xGA88xnC4szzNZXp4qtxKAD?=
 =?us-ascii?Q?v1/HDwR4gtp1NGW7YN6b7jn2rv9+xnT8euKDS6KlIMVoOT49B4USydmXeYck?=
 =?us-ascii?Q?WkN3SxX66QoyLtDSWq2hPFyrfuwJwuk3E8UM4ll6Cz5RUr+mSKBjQOyt99Qi?=
 =?us-ascii?Q?EWvdF9CBk+CNwWFuPz3mtk73FRDEi0ohRia+/v1H6iBA4VUn2EPetYoFEwGn?=
 =?us-ascii?Q?ddfYglq82N1eSDIurSHYvk8tpuNQgrST92maGtihlkByHBKLlafh7SMKqerb?=
 =?us-ascii?Q?h/FWka+34z69cIw7i5olgp2l02sS75IL1+Amz8PME9uAC6brFKQFrctoe1cl?=
 =?us-ascii?Q?Hz6Qa5GZip5cSjPCvlbeO5s5u7F4VC/8QASBNzZYbOh3+Rp9XeH1QSlkxyxR?=
 =?us-ascii?Q?lBeTufBvjSrvrSlMTkiybA4SZm8JWiRy3Fgh6vaDnzEUgNN0Azs/dnqCI/U7?=
 =?us-ascii?Q?zzKbIcwXzsVnlX0dt8GzWtIX0nWGXFYTjx6/9DXPT/nRpwTFqhkw1qOi63MQ?=
 =?us-ascii?Q?VPQ8EFYeXphjIEFVeHClo5xgvTOwq24DgPCzR99DuLOJCOq5l9TG4BQuTgpW?=
 =?us-ascii?Q?tBuljM6vb+8TVCRa63a6M39Vu8na9NITfy6mTeg/gHR2EjGr3DW8vqir9QS6?=
 =?us-ascii?Q?2UMqQokWNAwt4YwnYJNYsvCt9ETvm6qNke3kWTFrsFB1fniPyCFj8eUf/zpM?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd94c24-226f-409c-e4f1-08db93a12388
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:49.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfySQd+5EvycbtNLqH0yQGALuPCuBl0SgNfrLvXidLJgANSqmfdBq6XV3zakaDPNoyzUEpkXKOsU88n9Ap3n8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185440

Since the packagefeed build logic does not use sstate,
the deploy directories will not be cleaned by a do_clean
or similar commands. This change adds a function to wipe
all feed deploy directories for the given feed when a
clean command is run. That is, regardless of the value
of PACKAGE_CLASSES, all DEPLOY_DIR_FEED_<PKG_TYPE>
directories will be cleaned.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/packagefeed.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
index 08df96f662..2eedce9f74 100644
--- a/meta/classes-recipe/packagefeed.bbclass
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -23,4 +23,16 @@ addtask packagefeed before do_build
 do_packagefeed[recrdeptask] +=3D "do_package_qa"
 do_packagefeed[nostamp] =3D "1"
 do_packagefeed[rdepends] +=3D "${@' '.join([x + ':do_packagefeed' for x in=
 d.getVar('FEED_DEPENDS').split()])}"
-do_packagefeed[cleandirs] +=3D "${DEPLOY_DIR_FEED_DEB}/${PN} ${DEPLOY_DIR_=
FEED_IPK}/${PN} ${DEPLOY_DIR_FEED_RPM}/${PN}"
+
+CLEANFUNCS +=3D "packagefeed_clean"
+
+python packagefeed_clean() {
+    bb.note("Cleaning feed directories for %s" % d.getVar('PN'))
+
+    deploy_dirs =3D [d.getVar("DEPLOY_DIR_FEED_DEB"),
+                   d.getVar("DEPLOY_DIR_FEED_IPK"),
+                   d.getVar("DEPLOY_DIR_FEED_RPM")]
+
+    for dir in deploy_dirs:
+        oe.path.remove(dir)
+}
--=20
2.41.0


