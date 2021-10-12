Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09044C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:13:01 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web11.11716.1634033580150780204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=LiDidBaV;
 spf=pass (domain: synaptics.com, ip: 40.107.223.89,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpgDC5EyviASrebHtxSxnEdnT9ItyPUL+HVdvZxbqji0gSPLSYk81DXB//Sm4FOaFe8tMVAjyGAwYx7Z1bz7+qJtrk9eIbxxl1HR54X0i7nRlHXT1iO48c1eRQDgSGHKPHILU/lzwZ4gBUMmJOtghD9+GHRm1wd8LZpb4kOyhBlhZaleJu2CqojN7jdwgCtA/HBfWs5neMZHeYOe8Ni2Cb70KP2QSMntbSUo87I6KoEs9eM8fFOfCY+2D683b64o5yRpU1nDvVODvo3VtEf7dY6McX0Yoo8zR6GeNWe1O52ml+5dzcafdWPJ8R+U+X2WFrBsJ2qv5Rj/dc7laSbmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCYKVaQlF2ZFJQzcRkpAq1bMleYz5+wraMP2ZLcMR/k=;
 b=SXhrhfhkCcsyyGyPyCb6QKqkXkZxqCZ9zJ0ibDIPygFNBxpB282W52iBcA6jGuhVb48wPySVtZ+ce6FselneoAomJC5uu72ZwUm0sktYNK9trm3V/E4surKwYYiVxaiXb8NLHnA3pBjQ1AttdqR0VItOOU6UBLDKfQQqzErDA7JkF1DwN1Th4oyiFmqjMzhCxLx+tJF8zAk2QOew/ix7IOCLba/KoNe04p70qVjGCBkXRnXej5hvnFMiH5ae2loZ8Kv/fqIIbO3i5XStF4IE2XIfn2uRvY4AEIGZ+mLzY1Yse1bJqysTRcn0uySFRG/r9IPPhBBfqttQtq4EU2Hvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCYKVaQlF2ZFJQzcRkpAq1bMleYz5+wraMP2ZLcMR/k=;
 b=LiDidBaVnnZU60KVFHgX0xPkf2oUf7DdpFBX+/pFYc1DhbaPgIQMTTyEYjFlPawnzbmvz4BZFulocyXbBxtte23f4R2whgwniwxTSsDpKtuGN1EJWL2nMQMysxE/3r8KZ108mXQotNVWRqero7WqgE2joh7frYc9PPby3E2FbTg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4025.namprd03.prod.outlook.com (2603:10b6:5:56::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:12:59 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:12:59 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: alex.kanavin@gmail.com,
	Randy Li <ayaka@soulik.info>,
	Hsia-Jun Li <randy.li@synaptics.com>
Subject: [PATCH 1/2] meson: move lang args to the right section
Date: Tue, 12 Oct 2021 18:12:32 +0800
Message-ID: <20211012101233.49978-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012101233.49978-1-randy.li@synaptics.com>
References: <20211012101233.49978-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by
 SJ0PR13CA0048.namprd13.prod.outlook.com (2603:10b6:a03:2c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Tue, 12 Oct 2021 10:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0218679d-5656-43aa-3c23-08d98d68dd56
X-MS-TrafficTypeDiagnostic: DM6PR03MB4025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB40252D6F784008559A66E80286B69@DM6PR03MB4025.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6n/SQ8X1Ua0ladcvbFLP+xF72OiUcRoGCU5+hyaH9lkd8w8Dm2O3u8b6MvUJGOmj//6xgJl+tki/HvxZCh7hXFWlVUvu/9pmI+TJS6wbCjAW2UAemzlx0PQ9gAaXARIOsuA0fvfPWvyVknaGVexK27hq5+7IVxgxOosxXRV5zxmLghGYJUqxmysqqoOjnOEpzyExz231fB7Zcf9vSjetYNxVJYIUo+Yhirqnvl4s5vLDQN1vGsCaDM5m5VU7Ue5UInn0kGQFsl8mASFjVHKCivKnGCI2zdmafTvScBjPmsaW1iE5Caa+RSUHb4x553FsGmuIXGvyWu2FAOxVXmow9pvVd1HYib2Ph9mrbmNedfeDDRFiyJW098xKH2zuNE4RTTsD1v909l0CpneX6B/S6R5ttKdAoQYNXWpJArOt/uEgytDCxeQKdutIN6tJIazlhZOcR2H1r5galK0r/HS9r4BoYw0NNgLhJ+0DgWopPw12tGRY/UZ79UVS4mQ+hGhub0ek5VgfQ3Oawi86mqqavgBZqGqjRutWs6zvFGxJTp24cK9IL+vrvgyBGszjI3vo9hhomJF6kS1zT8rjwJXiNzYa189Zav+aTVJ2MGBlVL2qWsI3xh5cMEbbSveALso3q99uptkulYjZmpV4uypgaa/SHXdw9fiOfDtFKQknRDOS2dDBVuFKb7Gj2S6ba8MeimyU+MLcf6oxEAooDA5PDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(6666004)(66476007)(107886003)(6486002)(1076003)(66946007)(38350700002)(38100700002)(4744005)(2906002)(8676002)(83380400001)(7696005)(508600001)(8936002)(4326008)(86362001)(186003)(54906003)(26005)(2616005)(316002)(6916009)(36756003)(52116002)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kpYnjonlIxTvRlyHmDMvhSXYhy8cRvPy7JZjzz2oUaLu9/nvDrqwi85Ycir/?=
 =?us-ascii?Q?gCREGrxQovuEdwqXXjCYGTCW3fWVNnsvxhFuTvytkwKQwZex4FtxmZy+i/m1?=
 =?us-ascii?Q?Lqiz75biCWNE4JfVmRygD7cFDShNmjYhNYWryjSp/j5vqQaPPXdq/PCcuni/?=
 =?us-ascii?Q?XTBsEkHyyFqiBEoUwFKXI9a2Qbr4tRVcrGi3ZOp89aqzZOeYEDT6mrdALSNS?=
 =?us-ascii?Q?ZG7tcg9WQttuJw+U6MmiCN4ro8N5GVJkIEZmn6L+361g0hYlcIZ3b8iL1hDP?=
 =?us-ascii?Q?6aLLFvSqO1FZVyLcca/9WhjJgz1k37a5VxbOlsAn9gjy3dHrwR/6dmyhEj/S?=
 =?us-ascii?Q?m/cdV9omW+ZLftgW/M/xbbRS3zZP6pWuUGWmpiqrH0E6t22Jto4r37hhQtlp?=
 =?us-ascii?Q?6t8i0NPo6CUjpevpZBbShjGxCwP99t7LEHtDhi0ezbyG79QVftgIzm6Kp0Xu?=
 =?us-ascii?Q?ZLtHPVUc80SdnQBb5fbK7eNMgKpzP7/MlCk7jVM+0+86TMAOqjSkVCpsFEJT?=
 =?us-ascii?Q?wP4zklElACzbjZkuVISBcgIB+vbQKPNMfWsDK48j/acFSMUls1xRhdIjbg79?=
 =?us-ascii?Q?Q5LgsBlDbziQK8LRX6UncXiiiM6m7lRzhwB2P6dKi6NRrIMq6JbB8whXES6J?=
 =?us-ascii?Q?N04xdCzbry0dxGOz6PhfBvicxdlLQ1YelVOZjlQNpjtLDkN7T2q9B3LgqOAx?=
 =?us-ascii?Q?dGc9LpJXCXEUVNX3B/Wvabr0kOT6QG1wYWtJ2ove1+P2DLrudN89WS34kN20?=
 =?us-ascii?Q?VhACzO5laUqSIKY46W+yKJ3MxdPZ89DE0L5ddqzuSd3HrGK5iz4E2Vg+K1kZ?=
 =?us-ascii?Q?7NQqSSb9mt0MxFoGMh6l71AczwffaPxWbxGstjDNJuzWIwxbxxJhB2VzV4at?=
 =?us-ascii?Q?D/luNSMHitQ1o2R3dxeqSnrKeDon+jWniofzMzhG5uy80IpE+alZOpW+3FEt?=
 =?us-ascii?Q?kHMjj9/CoaNpxlF8ObcYTNZ/qSQ617VnadB08Y3Ef0TZ9Kd/ybKyGpqZu1Zo?=
 =?us-ascii?Q?b5mYvr7P05INFz4v38+MVDxaN0nXesgFy6wQOzivaLj6k9Rjd6vedhvr93dB?=
 =?us-ascii?Q?ShML5owy6btpEHYLlotD64/D85v72v9Og6C6IJpuAQUo2Q4yfJDVGEGqKV9j?=
 =?us-ascii?Q?9J5KKyqERuk5taZ/HKmOFtZwue4vYNv8h+eWUmoS/sVPpX+UPeR753NY2JJ9?=
 =?us-ascii?Q?6r7dN1qo8vl91sdglP839rWpTGB49VfevXws3J4R7eR3q8PsL4CWP+E/mNTv?=
 =?us-ascii?Q?udYGMZu17UJPeVBAtz0CuYWYKVVv6CG5fCADxtPWJIITz65yE+E+T9xg6qIZ?=
 =?us-ascii?Q?/qCJt9p4q/aohuWCcX8rUq9d?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0218679d-5656-43aa-3c23-08d98d68dd56
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:12:59.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KVj1YG3o/UfXHb1v2A5AbjXKo8cLZnwe9Bgz8TGtKpCG/qibFz2OgL6UfwoM7e3mpA6ilQMVW0I3XbLoFo71fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:13:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156865

From: Randy Li <ayaka@soulik.info>

After meson 0.56.0, <lang>_args and <lang>_link_args would be
regarded as meson built-in options.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb b/meta/r=
ecipes-devtools/meson/nativesdk-meson_0.59.1.bb
index 0e76cc78f8..5657397ddc 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
@@ -24,12 +24,14 @@ nm =3D @NM
 strip =3D @STRIP
 pkgconfig =3D 'pkg-config'
=20
-[properties]
-needs_exe_wrapper =3D true
+[built-in options]
 c_args =3D @CFLAGS
 c_link_args =3D @LDFLAGS
 cpp_args =3D @CPPFLAGS
 cpp_link_args =3D @LDFLAGS
+
+[properties]
+needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
--=20
2.17.1


