Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27355C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:18:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.47])
 by mx.groups.io with SMTP id smtpd.web11.9831.1678803482268054688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 07:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=LKzWMhfG;
 spf=pass (domain: welotec.com, ip: 40.107.6.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOWvQzq8QWUP1GW7nqxQvDjoEJ4nG/oPbRuiAe03dsIHsfWfTOJcZCV73fK5JIpkio9uVe/V40YgitqGRmegQoyTnxKWCJIM+PBTJvTrue+Pw0p3sox5smPTP2+Mza0payJBPxqnK8T1w7kEzOsyL5v9VCQchP1SDMi1iUY+xO746Mm1CPr9UmhrMY4J3vybiq3tjeMrhVZ30TUAkYmpkmSP6qORa3pc7kpGITfi8T+Guc2eRbXD9DIPYY3cJbXuj82gve4QpYiB8d4F4SGNYtAelVpLMUhUtpXD7c/hPvV51LfRNCH6pxD7UNjrVdAiBLWaaqKt1fJhdnPIuaoP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+e0DOAUtkLtUhhKYIV15mHYe82nIxqkdWsPfJEA+w8=;
 b=JpmBGYXCYP5XIvsC/rZAXiePgZeAqScNeEkX14ULZAPQbRW6cmlqgD1vOPJ8yWsYJSZ6Z7H+hrZ17gXC/0L+Sl34rHerDeXfN9pD+GKfHYy6rs3OH/38adsc36F4GRuvX6E2Cibmwjva33jT820VNdre6HbVWG/CU7OdxoI8Xc34EJkVhDNx2JP+XUZdyGBvXsbc7Y445HnmXDGTYprRz8vGESTYece6Kd3yzTofq3fXKIfLw+7ECsgoZoyWj/7CjdG8w3CVJrAU+IfbLjVnhWF0eRa+Kq3IoQMO+jFIfZPYZ5u20bfM35ygGw1xQkLRe7mHbTz9sw/b0Bviweicvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+e0DOAUtkLtUhhKYIV15mHYe82nIxqkdWsPfJEA+w8=;
 b=LKzWMhfGTkdDx36EpSveBndm7ED/JTy2TSPNen/dZHB3XZeTWYabQkyjgxmPYupmOH6JSLnX6W/37DqrbxzCxSzSlZIapLSAIUZg5sSdzoEXMZtXv247szCcjS124M1vLq7wVJDYZpszR8ORcI8oVry96CRJAc8s/rGgP8ETmgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from AM5PR04MB3203.eurprd04.prod.outlook.com (2603:10a6:206:7::12)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.27; Tue, 14 Mar
 2023 14:18:00 +0000
Received: from AM5PR04MB3203.eurprd04.prod.outlook.com
 ([fe80::daaf:ccb7:8f6c:dbca]) by AM5PR04MB3203.eurprd04.prod.outlook.com
 ([fe80::daaf:ccb7:8f6c:dbca%5]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 14:17:59 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [PATCH] systemd: fix wrong nobody-group assignment
Date: Tue, 14 Mar 2023 15:17:50 +0100
Message-ID: <20230314141750.3652939-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::19) To AM5PR04MB3203.eurprd04.prod.outlook.com
 (2603:10a6:206:7::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM5PR04MB3203:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 0747a3e1-a1d1-43aa-1b19-08db2496ea48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g5etieDVmlIYInj3H+KrWzb7gywv5U4FmfG3OvyW77uqfhZas7JsULA0iiXRkWfvoMRNhR1arvO5zPK2ZF1bbgn+g6wV3mmlu8ZywmhyRmTmOtGsmNaG1AmCInTW97ssBoTS28HpddSVNEJi95TlGqBeex4FCUovWhsIojYDLobY8IhkuBpFFk9fBnsIK6Ay3yaStDv8n+JSp2Cp8Tw2kwc1Uzvw31vKBvnI4rICYuKba0F82wlserixlQhI/xBpHBSsABgbGOpgyMQmEZni66P0QHCch6CPf2+vkkmy4Igw+GVfJDI+aYscpnVyhb8p9h+69LduIagBhl15uNg5fi0kViOet8l5neyevG95xmSal6g0jsvNTHBNLUWQ63Tro1jKU9zKXKlJYpFhtgvvVlln5U5dmK4cM7LA2rl+789xZEr73YYL+kBpV26LuELua7Ib7Vhb13plZhMiKb1GCzaNsr1XlgeD27ELFwcy47YsPdiA9uYjfWGgzcaydHqdsemzFzAfgmaAVUBiG6LKcK/RJPSPeB/JZQygTQeFlQ5LACy9HYs8Vn19jzQ5tOk7AGgZA/MqDm9RZZneuQ4I8OwhfqLvDMpI5wNz1Ek20lEkFY7k9aKJFmDBeoeNqv9bYyaU22984kuOp5PWkf5LRs8PezcDkhrO5ONNYxbA1+rwel/ZqvS1cnYN9POqEzbI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(451199018)(41300700001)(5660300002)(4744005)(8936002)(2906002)(38350700002)(38100700002)(86362001)(36756003)(478600001)(66476007)(66556008)(6916009)(66946007)(8676002)(966005)(6486002)(6666004)(107886003)(52116002)(4326008)(66574015)(83380400001)(316002)(186003)(26005)(1076003)(2616005)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vpYu/HddO5UF0bxO2f3JlVZX15kxYCge/4w/9j69z3WILqNW+J6na5VcLtLA?=
 =?us-ascii?Q?6IU9UGfQ1PZ2WNgvb6Emr3ULF9+mbLDAuQow3DiJre8YmORpXjO54jSKKDVU?=
 =?us-ascii?Q?uzL3s88nXkQCf2IZCdRnkgw02vhD89fF+rack5odGo2UfK4nI3L3dIpY1JVB?=
 =?us-ascii?Q?SnUvNSRbSrjj+GvlExsYdBjBewsuLPg1MtoPcQaTDb3I0R2LglZxZUgOb0Ug?=
 =?us-ascii?Q?hJ11ljYS7om97kKLgb0aylRU42iRpNcF3g8WKgV0sM8dlfzszYpFrGsrrOWQ?=
 =?us-ascii?Q?Kfo63zNNwAY5EO6+R+jrYvv/C/iCsx2TkNg9Z8I5wMOhQmKt5Ls8rfMqyCU/?=
 =?us-ascii?Q?uteWBATrNC4KeTuUZwnutUTrFf49w9zRMUghIgFuvRjjSslnl0AdvgDO5CY5?=
 =?us-ascii?Q?b5vLjPqCBChVNrExnXsoIlhCZo+LeeIg0xWn5V9SusSyUNbQmYp2gwbetf8y?=
 =?us-ascii?Q?3+/H0cSs8fyR61duUY9MuuyNy8L6NQ9BqVGfEvmz8BFHZD3CKZm6dmROqQCr?=
 =?us-ascii?Q?R7bX4lKjitnG/xhhLds1DQUSWh0+tAHvcww3BNBQ39h6rh9RnJWaMKuriLPA?=
 =?us-ascii?Q?+928ECjuPJapAuPrggi/zmOYqCx4Ks41RfTHLxfzhVIqAeIPVGPhA3u4LM5c?=
 =?us-ascii?Q?hj5UYk41kBD7MEbPp9m9X2UyNL6J2xpzXop/sf0SewJ0/x+nwU6jC5s3+IXo?=
 =?us-ascii?Q?aO4mJyH5Up4iva9GTWsq/TVj6vbs/3yDdhnekCW9O6krqVCf6MOlhpJajsPw?=
 =?us-ascii?Q?DtLy1B8e9NEXgcsXMTKmwWVPZ4yLi0ptzecEyE811tRp+LxXFExupyMzXP1T?=
 =?us-ascii?Q?Nd906T9YPikcxr2gV+dCnZoJbXd8YhgVpiqM5e/qYdJjDFpfitzAavOrjiv0?=
 =?us-ascii?Q?EzNcNA/W7tgY+JKPcKNZUQn3KnLPCBSB9vaisuDeHz1rdnukU1FiTFegWXyv?=
 =?us-ascii?Q?xUJBnuJuLWHZ188HZXN9D23lhxuuKPuBbU1WdksTXDMbL+wxT6tu4GrJ7ZrG?=
 =?us-ascii?Q?LPEESWIGZheq8U7Y9xWNSr6ZSKw3kdFVxkW2ZXzRiuII5uZzJCwiN4/UBn6H?=
 =?us-ascii?Q?1uO3+IywrigejTdreT0jX0wqme9CGQnr2pJBFco/AgIwL0irzTOQDt4mqQ6d?=
 =?us-ascii?Q?WeYqq+N1EjX12JxNwWUkpWAbRk6Hbiqc3z3S9Zi3a81nww2jnQXrKusNE9LR?=
 =?us-ascii?Q?vn/4kbTTb9VWN9DsnnbW4RLcrTdksWLdTURuRlTR1Lhzy1+XqakQRz0CzNBt?=
 =?us-ascii?Q?g1Zm9dGYgh7ua7ROPeTYvo9NFuLSYzs5fwjZjWfjpJWc3aUaXSit7hL54k9X?=
 =?us-ascii?Q?Qk3uwcNmNXftBwCSp2yk1lQeurAsb18XkpgKtsnab5A6epIFEj5mjqqW8AOz?=
 =?us-ascii?Q?Mnq5lu7mZjI+vUylJ2OE3zQSZk4rgjVYqVaAmzqBc/6+48ieG9cd4R3+8OdS?=
 =?us-ascii?Q?4BZobd48y5b/ZPPEEMgErQ42tP6795vi73ujWE4FQ6whwUumZAYfRH4/I7U2?=
 =?us-ascii?Q?Itk9Q/oDuoqBTWgPTKxWthmzfZc1sr552v6f8MuXAtO07VFU6kFCUOkFKa7x?=
 =?us-ascii?Q?cB0K/Bc/ppTDx3urwZqVA4sUSWOL2YHUkVssewQ1?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0747a3e1-a1d1-43aa-1b19-08db2496ea48
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:17:59.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBK/2hKqvRj4uEGfrgkm2Ayrfnm+zfcHYlUnEdPJVMGcfUxFsz4zrmGn3EHg7VWJ3HB02Yhzd9epehvP9/udng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 14:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178491

The generated /etc/group file had a wrong group name for nobody-group
which was nobody with same id as nogroup groupd. This was leading to
duplcate groups, with same ids and different names.

More can be read on this link:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11766

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core=
/systemd/systemd_250.5.bb
index 7df7bca4cc..9bb42b971f 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -221,7 +221,7 @@ rootlibdir ?=3D "${base_libdir}"
 rootlibexecdir =3D "${rootprefix}/lib"
=20
 EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
-                  -Dnobody-group=3Dnobody \
+                  -Dnobody-group=3Dnogroup \
                   -Drootlibdir=3D${rootlibdir} \
                   -Drootprefix=3D${rootprefix} \
                   -Ddefault-locale=3DC \
--=20
2.34.1


