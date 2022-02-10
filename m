Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97536C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 20:51:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web12.1560.1644526311329649070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 12:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com
 header.s=selector1 header.b=jYr/JQzA;
 spf=pass (domain: seco.com, ip: 40.107.21.57,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofEZztEqWZYWX2RBtcPDMMeOSgSbgrM8vc0lvxqVgfdciGt+TASACeCMg3sIB3T51puz3qlYpdBUd4wyZGJYgx1M4hRw/brKibyo108k6waulh/pwlMJsUiB1FFi7pFS+AsdqkL+kSyDAPs3gnI9pVZ7FOtlaa0x88XJ+1PulGUJ86BJGs2SQcDOS7JcS289s1evOCFm04CDCQH/YQhobvy11vD02MhxFUL0p2B+uwGGBl75ELa2Vfdy3QXEGdqq/O2711Abxa7GS1jGRDP5u7z8zhZ075zaIaZx1nRNJ+d31imLgFh8mtSfXYabuzwt4fASY19vk611Tjd6VbI/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu2gYGi+5aTj5To5snpEtx7aKRYc/6K8u4yzXz7rHqM=;
 b=OLHULcJvAVnzJKpj1cL0U1H4kPQ5ZR0oQxRZH3qI1B0Bhdex00y6EU7pVMMZz+nMX189diz9RA5wm3TA5ugG8xPkab9zm2R2CSW4gOYxoGp25sdIUC1cwZJwbWVt0T1h7GJeT2LAzaCil9NZtlF7CY4RtG7BnKuqZv/WHYYYGrCw4rOpcmF/ujDyDuA+8m/2NDfzYl/zJNz/b8BeKmsvs6NCdUUMma6vDp1+j7ajU8/Cz3UWCPuIgZpF21jIGHuwoJ1Vlq5+XMkMV5y3tcLIRW7/eLaiPV9FN4InPC6KaPJqdEi+W3uEBUuPA9C19IctRtL2AJvfNQoVRSxM3MfxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu2gYGi+5aTj5To5snpEtx7aKRYc/6K8u4yzXz7rHqM=;
 b=jYr/JQzAsbrR0VfcVb7YKelWQArCSApH0PZMY2cyAK6/J9VFy6Otlg63I6zD+t2Zeob7f9c0Zlsk2KXgIDylHp94o0N6O6+9bd87RQ7ENDVK3d64DBMas+46UU/EaIWwxbT5yE0AZM9H/xCkDRgS7Ee8pseLVfTOGBbMr/QqBZWn3QD8vhitdqHexOZbn4MPCG2lpUjLX5Jt9DZNlF3Arhvbx/Y37E2WdwqWWTjIFwZBb/RGKWIX3gpdr7kUeQAwb+5CSeYzEF3EZf3PWNn7pz2vtwp67xszgWrRnllTd5jyVMddpvXF8SEkM3oZgBGVIVrH/foTW5HRkhH9Eu52xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by VE1PR03MB5632.eurprd03.prod.outlook.com (2603:10a6:803:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 20:51:46 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::ed45:f086:5e82:fccd]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::ed45:f086:5e82:fccd%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 20:51:45 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] libpcap: Disable DPDK explicitly
Date: Thu, 10 Feb 2022 15:49:19 -0500
Message-ID: <20220210204919.3029824-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:208:236::11) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69a049be-9f43-4a83-c9b3-08d9ecd7264e
X-MS-TrafficTypeDiagnostic: VE1PR03MB5632:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR03MB563204068B952DE19A780DC2962F9@VE1PR03MB5632.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SZFFkh5jCGE6sMkgWYfkgJVqpeZAMm4mYVFhlBjfX/036pMkMgtY0wKnaO0OKBtCGAc+Kc1b2POC+EHjnE4XMULvFXNc9KlgUsjFuTAtv/X49iNvuCPN2tSJAhP0Rj369F+PlE03Cw54mGvbB0UMt4I5VUuFyvaUbDT3kLfEhLoDwxMCJwXoklXDAu0tF/snPdhtio6N/5FnIOYv5P/L3zPdmqRTSwBWPDTwXtZWdwAySESpAUvdW2pTEpl4LL+O2u6EzCKZqWXWzCYZccwyhKJigxcbTSt9lf/MP8pfIeg6xgQLqVqupnoeMD1jarXezRphVItJNRfB6jeJVQYTB1KGkju0Heo9SHBnRYLUMddcGywj5aqXFcLV9Yb4X/tRhlXD9UL+ryve7OJr6dCXn6s5OAPrudr/oVt5HQjpE4Ano1GD7OpLIN8mfXkehJ0hy6mWO9MDq5Ll42se88LBMCeoBMJWSrb3GvJLT5ffD122oDQfk5fweMwBfsnaV0Oei8D9vr1aJJGlu9CDqg/W2WYguJF4yh+SDqos6AREOtfOqrAMAKORwD4xq7kqzqZNhQ7KoCglycPZksHq6o5P8VQesSOjPuzGqrmMkqwJlw1sJNLuuk0/mtgrf/ZiFZKpmKPvzZ4irF48Z5+aAMvSdkuKlhJQaM6vht6TLO2GQWHPVC21qpk+HtvtmOBPu1b0gxJ5erASvhr+Owp8cDWkgA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(52116002)(5660300002)(83380400001)(6506007)(8936002)(2616005)(186003)(44832011)(1076003)(107886003)(26005)(2906002)(6512007)(6916009)(508600001)(6666004)(316002)(4326008)(86362001)(8676002)(66946007)(66556008)(66476007)(6486002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ysWUc5VFRHkDi+d7sUaM7vuBFlcrrkH2eKmxjGtO4KOI7ZaF7xgqvs4fPZdj?=
 =?us-ascii?Q?n2zxGLitZJR6sAWnn/lNT8H8dL1ZWQWl99Lwn+g0it1ngR8FBeZlzRYLLtMu?=
 =?us-ascii?Q?MME7gb/5em9pCceFmxcWj+t56Ep6ADdQVfQBND2JkmysuPtTxw5dF6OdP5U0?=
 =?us-ascii?Q?QVS9PvvNFl7BFrmkrTcYAIJifDzPBehnnxvNRJzfoVKLQZDV+S6qQZdTWBSt?=
 =?us-ascii?Q?1+O+1A+eo+4CYBd5DakYZ0t5vU5+NxM5m3Y6R7iJvK75+I3Pj7SI80MY3xnP?=
 =?us-ascii?Q?y5m5HPYilowx0Fpce36MSfh+PDr4XduByMhYLEo6ZWuInELohSHylIWfx6FL?=
 =?us-ascii?Q?lst0GXadpnjx6l8vusjxqSUsmZn3NrjnY9uW7V7KXwAdmKWOOpirxHrcOAuz?=
 =?us-ascii?Q?yxIlS1EMuJXzLqmvn8g7kpNeeV2BahAhnpX3RXFrZsI7W8uRG2HbA4EH8UJi?=
 =?us-ascii?Q?ihvxZqO16mJCnDQprNgyWfLOWXNbxAkT8TcZJhpCKxJet+qQqfJdaw7c237S?=
 =?us-ascii?Q?gUZ1X1dTdI8484oo9sd9cb6f1PnHYK9zFKdDkr6LXdZKvpD/RMNDuB8JnDcz?=
 =?us-ascii?Q?Dn/Wygnyx2edC7nyNbXldmr22ndy/Eb+JkfeDkQbSMdIxW2sSxKDJNgqXW1s?=
 =?us-ascii?Q?bQl8I+mLsJsJYqAZ58Ops2tp5wJlZRW+8PxgthuGYNDaCGPK6PxDBVxuTGHP?=
 =?us-ascii?Q?XHXqO2d8Lubge/baxvldHY60XZqPouW5TBuTL8HdlWmQ9P8cjVm5EGHQ0SdT?=
 =?us-ascii?Q?13vV5bsi5cBPAz0o5deIaLLaDrkipU4zAd8VvjwDuGZIflIRpeoGMeU8i4/2?=
 =?us-ascii?Q?GZ0YEF5cvQyrrim0r+E/lDVMCBWb1yNe90JnPLpIYjLoDiNWYLsn/QvBhe6p?=
 =?us-ascii?Q?ni7j7WhNn04+C14w+ySUftVGQ0UGposplAW6qg4i7kcFPejNJFOINz+EbTb5?=
 =?us-ascii?Q?GS8cd/UA24r7yMqSjo7WaJilUa+64CNtlfB/WKpsaWgG0CQqt1JXUik7alsA?=
 =?us-ascii?Q?ExX/UM4AVg692NZp9ePenM4r7mNnVm6DZ9foYAuE28tvRSjN+lcxlh2PIrXv?=
 =?us-ascii?Q?Cg/2/u1F5qbaf0oj+5o1dnp3KNyCzWms5guruWKv/bbliltfcP20ax+svrSc?=
 =?us-ascii?Q?8eZYlvMt3Vn2bA478NibytvP4A96vpgmPBmznVkRgr3l/LkAikvUKAG+pB05?=
 =?us-ascii?Q?lZhmNWVL+BU4STYPfkrS9AV51oFV41Th8VNP2KfAmVw3shvG2CjaNsosb12W?=
 =?us-ascii?Q?Kb9OMCZSkbUeceRi+QnBh1eFRHBBPk43G4l6HB/HAJZ5/h+DdWZ44je+BYcP?=
 =?us-ascii?Q?1QvXuKLUgn05KSt9bLxIMXfoD5ZlRk2sNFOSyNJa9sr8rqmkvCp949Prf7B7?=
 =?us-ascii?Q?rxhsqYsjjdrghGdtDwl6gESa5bU7juX+wIeLso5OsV1/m9udI+9OQrvoK900?=
 =?us-ascii?Q?ALUERGwiv1rUcmhzxE7yAEJC8CfOs9y3Xgw2gCzwy07SDpe3VcskkzT6EnSM?=
 =?us-ascii?Q?TiaPnHez6vdOgjevwylgFxpbhsxhpxsSOrEhqjAaHRuXSAZdQia9OT/K+iGD?=
 =?us-ascii?Q?2FdZY3Gswu+KNzERYiw7Dxj1AC6XZueUl5eg4kA7adB7C9PPITaAotCZL+I1?=
 =?us-ascii?Q?EQ2kQh17chcKPjW1ohcw3yg=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69a049be-9f43-4a83-c9b3-08d9ecd7264e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 20:51:45.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4j1hc66TG9zWwL8Uo4nwT7jRXrH89vnUIloJGgL4C30A89+cFrPv0cCsArSKAOzuemd2OHxK3OGH7wMsx6sVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 20:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161629

libpcap looks for DPDK in the same way it looks for DAG. This can poison
the build even if it doesn't find anything. Explicitly disable dpdk.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.1.bb
index 9a8c46e0ef..dbe2fd8157 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -19,10 +19,11 @@ BINCONFIG =3D "${bindir}/pcap-config"
=20
 # Explicitly disable dag support. We don't have recipe for it and if enabl=
ed here,
 # configure script poisons the include dirs with /usr/local/include even w=
hen the
-# support hasn't been detected.
+# support hasn't been detected. Do the same thing for DPDK.
 EXTRA_OECONF =3D " \
                  --with-pcap=3Dlinux \
                  --without-dag \
+                 --without-dpdk \
                  "
 EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
--=20
2.25.1


