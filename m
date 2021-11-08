Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382FBC433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 22:50:56 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web10.4146.1636411853947300562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 14:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=tBWEsI5C;
 spf=pass (domain: nxp.com, ip: 40.107.14.42, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bW4OjTqCjR8rSL6kB/TxfxpXiSFAXZbvzi6AMykp3hli+B6uCSzP+VHjBma4erPJFhEEl0otPSusMeUErshpt5555dRlmUqbKX8PwxorylvDSBjIcRu8oS0xXxOTFc2H4hujMEb4BYR36fmcCipYMPJkZHK7iJVQL7Ks46tLWYk1dcq2Pcz2BJIopUHJHttwt2mu81/VOSzDr+QYgbYqpm0qpRcVBc/p15UAAqOdhkPpm8d7mXlTbiCfP8sokbe4qA0FNYYQID+Zf0286VKwuRvb3l8xxFtLfdbuJdTJiOIivq7Nql+s1NcGJ1uBh8Q+DzrofoRCGRDEwHloVnd6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95U3ByhynXbW8UAllBDFQyfj8reBuFf2SdYGQ9t0X2I=;
 b=CwS/cMCHJi/9EBYInnoBSmCxcIdBIE8TZ6NNg8QDPJ4vueGaBJHxcPB+sKy0QjA9GrHRPHtDv3eGHafzFhbxhjIZtC0ZiZOsGlDp72B0TBOwTE3DYIY8mrMiVZOPP/2KlkfIZ8STLaVkZGb8ruzgDN4BgLv0yiYslPtkUsTtGJbVyWQ5GXJh5zGJWpWGrmIOkH7O/u3nhF99xN+tSHT8DRhUWLMnXwiojBqupJ96d/vOOUC2mkQz39gMIV8k4ySqbxc5ijTkUUM621WKwvyp3kStmTzshKM8JzgwyxJlrTSa75bzLcPVrvP0lVJSY9IHA3AgOsnjQL76fv/LknoBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95U3ByhynXbW8UAllBDFQyfj8reBuFf2SdYGQ9t0X2I=;
 b=tBWEsI5CFiufHjjuPAszVR94Woa1CVWMabCwMCsiIlqrByJQGAxXQMPVfydDEl/D1AFFEdpC1LHSruefn6yIxC6Kdk4J0OdqkKgcEEd2OY1b7d2dXyphyIKnfVpeIGxkaZUEcZK4bR+j1h4j3ZkS78peQ37YuFIOixmtFf19+ZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB6PR0401MB2661.eurprd04.prod.outlook.com (2603:10a6:4:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 22:50:53 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 22:50:53 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [honister][PATCH 2/3] nativesdk-packagegroup-sdk-host.bb: Update host
 tools for wayland
Date: Mon,  8 Nov 2021 16:50:10 -0600
Message-Id: <20211108225011.24741-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108225011.24741-1-tom.hochstein@nxp.com>
References: <20211108225011.24741-1-tom.hochstein@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 22:50:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56aba35-250d-417f-f739-08d9a30a37d9
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2661:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0401MB26611FD798B8FF145B5A9A6CE2919@DB6PR0401MB2661.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M6tOsKFBcx5QJpts/DAcMkt97kFAx7DwGi2xF+PwtfaRcrvQ9AcgqQkasg3P/Z04xB1kd3fqdmt+2ulGD1/932s8OTZ3+PtwPmdi8muZoRReS8JqBl8/MuCYntAZ4zweYgOHdUM8TvtyJ9LhsNHHZJgPdev/JOLT0t9zAzP5mJ32kx6MamftgirAbRnHBk08JxHM+ZeEJOA5q6FsDWkuBdmyQy11M/HpZNsskO/QEDdC852HqB5p/3JjMn/ZhkgsBZDpJ5Y3xw+e5qPrk05lNhY9U/LhpN91B5kbprlr930aUGqGRhAZhFzIjWJ0sTV5rQgaUzbDD/rxaM9lkBmeg9Xj+85z6yyE4IkPvxq813BH0+slh96mfUHA6z3uSwxTyeldNc79C4xaOkTWIW2OzewaVS6h2bC8KsQlZBY3tyc425q8La7zUUYK6VvMNL2EtJ+PifyCoSup63kYHLeyy0rZEzaIxs+v1xaMK7fjgPukVutMM2UVCMB/1YffmqAhSnjempjZKMDZv0gzApYCy95m+9iNP5VwwTlsUfTb4zoXEhBHnG5XDlbjGeFVI6sgXX506+wDk05NmjRldI0qdYkoTkSwWw/0A9kqvw94jE5ReJrDKLh7lv6Q///wgD9U0t0Cet4gAGVt+L383I2JdniYQGME2AI6+R6s7Ldm51adPPl3Hg2c32kotaWVQX6fSKVhhWcxTximGZcJ/p3LmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66556008)(5660300002)(66476007)(15650500001)(316002)(86362001)(38100700002)(8676002)(54906003)(1076003)(36756003)(4326008)(38350700002)(6666004)(66946007)(7696005)(52116002)(6916009)(26005)(508600001)(6486002)(83380400001)(44832011)(2616005)(956004)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lLN4uTEXhJBRV5qNBjD1iPYXVGmhze908xYX7jhthKPJIBUuAZSlIDpdYVc+?=
 =?us-ascii?Q?h9OQ7D6I3IapmsfkaFw8PuJ1WEBKXQuaaRKh80bQPO8Wg8ZOnK3Srwc5bnM3?=
 =?us-ascii?Q?8ZiUWR96UatsOyBnV1ikjfa846z1Mk4Tk4LbHmTeEgU0rFQnqMLQxH6lSNyD?=
 =?us-ascii?Q?p6sfZug51VDfLP5GCsQ7R0viK6NY3Vi8GBJaVS9jBWUAjnoQ3eM6hSm18EMo?=
 =?us-ascii?Q?/wR9H06VFDxHADRVSUM1nXu6tAQEvOPsNhdXQhWXeLMvMMySAg5bD5GIFBHx?=
 =?us-ascii?Q?HvP8T3PgUem4chP9bNendUBMfjWUVGpYYYEyMXtsVxY3h1qT7VMcGQS6fOZQ?=
 =?us-ascii?Q?mjHWO7kHoRvrFw5QIYg3iaXhapYH1fdZjcuLp/Kq1aU15Jx4YIYye2dLtiHc?=
 =?us-ascii?Q?PCHOkkQ4AOqQEo3db09NsgXFT55CCEwAd7ob7nXCyrfn02XSSU6oW2BJ6z/L?=
 =?us-ascii?Q?hnTwuEiyGx53kDyUEq/34sxPnLMepYI3zdjJyysz6JFBof0/9pxa8VbOmsuX?=
 =?us-ascii?Q?VxlP8AZCzO1dQrPPtqniTzL4Nz6u2fTpA0JYR/2aBF7FZwYX3mZV1Dq9ORAQ?=
 =?us-ascii?Q?HdyWLgZzKofWJW3Yp+1Ua20A36ICcQW9ZSkkP0SIWRAZ1GV8aAC8KlGBoBCg?=
 =?us-ascii?Q?YcetdiGN0/XhsnF8raUNmT8FhGk9lFwX3Nr1MNEL8D6DM+my9zPSlTf/jDMC?=
 =?us-ascii?Q?VdxYxn8CydpwqYIBRySkoEzQCHMg3tByhbQmeSqkmZ0ow8ld15U9uYXSvYyk?=
 =?us-ascii?Q?w/O3Mz5TK5o8yO3ijXODqZEjEXx5ia7cgTcAHLDVFVV3ax7GDAYTdUjbLBNn?=
 =?us-ascii?Q?ZVDI7/5JaNvs4aWT9Qz4uQ+6VqTYFzvtxscL5jsgCmGF36KvmWYrDZkGIhUX?=
 =?us-ascii?Q?+BZ7Es1KCUauEKOS3E4fd0Egkowwf2n/scBtgbNLgGqoleU1XvlPrlV9+laW?=
 =?us-ascii?Q?YzWngFjNgcj8/a3tDmfrjW9Kb+U81gRyhuvcdIwEN8EkeQp9ZJ/sN6FTfF+M?=
 =?us-ascii?Q?6igL6pd0Orl6+VRJcaUsLYFNBmM5ROUXesDLPTMwy2AnlDVck7M+Mq4c9WlV?=
 =?us-ascii?Q?bDLRX6R7BQRmnET9LjhQEgSgJnGTiy6fWqB6EGOzYY4K/20/GYTszLQXA1hx?=
 =?us-ascii?Q?Y/mvl7faTcGGNENFL/zr/GC0m7auoeC/dQXiiMdimKsa7B0oYJa0c9klMJO3?=
 =?us-ascii?Q?bjqwzwql42k4xdRyv79SzjkXgG+AbP1LPa8duY2jYcPKYgInLm+CNIdthlbR?=
 =?us-ascii?Q?kI3P+tDHjaEbhwdyPjNcgIPuSqxpTVy7jW2KHR9J2aFY/Yj7FHUixUjCRU0R?=
 =?us-ascii?Q?apebYrQ6GBTaDybORUplEAicz03vWqIhakO4tVcXkwZDGSPh72K3eTk85t5G?=
 =?us-ascii?Q?ORETEpGtvG/nTGquwM8Cck+5tvOzCglLKhBLOVzs0EoUsq5hnhn4SfbyX+F7?=
 =?us-ascii?Q?3vaiK1Z/5UxmicV1ylbWnJ4qWWmrXxx+LQi4jfK0aRTmsAA049yw01jDynYm?=
 =?us-ascii?Q?xOF6znL8LxqPWwV1czLTp1RCUWqrDHL8pFi7vIq4H47jedw3kWZmu+FEmQR5?=
 =?us-ascii?Q?ktS8i5OTHOQfPUypDXDHTIMxod0s1IaBiLtnWDkU9ySfzjHZgSeHdbu+5ulZ?=
 =?us-ascii?Q?cIiQwTdc34UhX+F+sp91tJg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a56aba35-250d-417f-f739-08d9a30a37d9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 22:50:53.4146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qrSFGE6wq/b2LYIQ5zPetiWqddim+ivnUqjV49H2ECv+L8raSjaPwkZxBWTj+wsfNxea1eSldoKZszhUFNey+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2661
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 22:50:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157992

The wayland-scanner host tool required to build weston is moved to the
wayland-tools package, so update the SDK host tools list accordingly.

Also, the weston build requires wayland-scanner.pc to find wayland-scanner,
so add wayland-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31ed91bdbb0ec05730fb98d7cc523bb46aca50e3)
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 39e5002bb7..9166a0851f 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,7 +25,7 @@ RDEPENDS:${PN} = "\
     nativesdk-makedevs \
     nativesdk-cmake \
     nativesdk-meson \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-tools nativesdk-wayland-dev', '', d)} \
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
-- 
2.17.1


