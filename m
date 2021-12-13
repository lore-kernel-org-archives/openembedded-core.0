Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479A9C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:16:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web12.9142.1639387009113439422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 01:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Tu/1Vkc0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgBaioUMIZGMtjyJVOqq0LhnZdHtOXCx4dpvberRer2M25x+bz2W+ICiG+dWPHq0BgnJIq7A590hv+BAZFhKbBWuzQKk0s+ahGD3wfVS5nGWu1a9F9Q9fhl0W5GLTNDka4exU7ELVtGp64ulx4/3NsDr594YPagzlPnObf+cU7600SPpXSyryo73oGquA/6Y4NjP1cskGjFnW9M46M/dgKGA+vya8M4WDAKA1O46fqHp0T6W4XTfiZ5c33/nf9eef9tX7hTxcvCqnrT9XQ+dysmDqXfpoMyw+Nu7+Zw1/ahoWPBr7Fju+/o44k6DQYuzOPo0VldjEEXAf3HldwyTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JPRj0cTiDwXM2v368mCfXxdTUxYtSdogEWNvPOzEO0=;
 b=VYnHwD38BXZLHs5SyY7dZBhlPIFzE3sQkHS/rdsiJB0NqGDU9+DwiIsPeuQjb/bTPoDF0i4kig/13e/uJUV2zlqGkjkmKWCRCTgyu+5/il1z3HzgmPUyV/dBZD2/t6vpk12Sjc13hgY00gqNrJ66jK1+nvjEBArs9/+8L/a0S1e7sO1paXPQa5G5aR6T1vH/bp4Bjpqk1RLBAiXgF5lGIigY+xVNnLXd7o5/lwvTtq1/TH+PpYQYVHTXwMaWbf7tqA9Q/CqX6SrYIdW+H4vei5gM5dTZiHNbV1eDzhSE9Irbk+B9oYaa9e9EI8Sj2+KKEoyRB2NhrBb5hqMrFibXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JPRj0cTiDwXM2v368mCfXxdTUxYtSdogEWNvPOzEO0=;
 b=Tu/1Vkc0IwnrW1pbCGtCw86zd/5UMX9eDtMTP0HxvQHV4HSXGRFz+25KdajrPSGfuiJAx5ZS+AMxaMtQnBzBwF0+Oxvl7t+sE+dCC/zfZ7W1s19ki+URuJnjEcGuAcI4Ls+DO++7Zcc1LES8QFiGjGlfxaMwcaCMcdIquG92hak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2620.eurprd04.prod.outlook.com (2603:10a6:3:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 09:16:46 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66%5]) with mapi id 15.20.4755.021; Mon, 13 Dec 2021
 09:16:46 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 3/4] kmscube: add build dependency on virtual/libgles3
Date: Mon, 13 Dec 2021 10:16:27 +0100
Message-ID: <20211213091628.2037474-3-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
References: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::35) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0108.eurprd06.prod.outlook.com (2603:10a6:20b:465::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:16:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba73fc04-6f08-480e-8b1e-08d9be194909
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2620:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB26201E18523BE1282512AD6CC2749@HE1PR0401MB2620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V/eI6tWi66I2mIQBWAbCZrUCMNu8aaq0lF+m9IfAnPe5ICa8lKfVJK5S6RnvrVYZTxLK0BZs5flO8miT6pYIO6L4FkdUvZuQsIu5wSnayhfVO+n4hTW+cmK6Zz64pA/cvXdM1DUEOCmhDIC7Ritruq2EZOUL53ZiREChaFGU3Dd923BhEAAa97nQcAVzHTWoiXU9gsQ9mbLbnROpD+FUA1WxWhlhKVj3Yl0wBDAnzkS/UelQmFZ4sTQFAFnmoTCCaqdM1S+ZVHbVZP6tlqUOE70M+oBIx2GwTrbw6y+JlrzmUwwklBxR2UJ1d83WQwSLRw76yIAfxkFhO0D6xrgCWEWX9TzUMI1CKbzkULEeJh+6JAO4ty4+P92RuioyH0Ye+BRYRX06OPPe5gHnKdsd8ExAlpjb36GT3a2DUuKAed/QcJZZ4XmYdZRQ4KLYe/Fb0gQ0Xm+Oq4W1ixHxTTkL8h5P2Td/NSpd04JhRJSxbqWHxxbaEpJbCdNvXYjY7TFxfseiOG5nm7ijCtlI4yHw+aisR3HTnKTDEP75VrXvhnKpLZqFdUW/AHbe5NFD/eFr7vhAzgm7WIgC7cZGSX3tqqA9eZj41b47KBOvwJdb+WIvq/iIwnnB7aPYCizXOF6ynW/BjZRTe5gzQ4rxCyIm7XaTDMwhX6HJ8BJbgSTYVKUP1HWIlWzoq+c+QfHBUVUJ5ZieaMN6/UFPW2FLABr6Ug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(8676002)(8936002)(36756003)(956004)(6916009)(2616005)(26005)(4326008)(6486002)(38100700002)(86362001)(52116002)(186003)(316002)(44832011)(54906003)(66476007)(66556008)(6666004)(66946007)(1076003)(508600001)(5660300002)(83380400001)(2906002)(38350700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D7WaMxMjWQevUsLo49hZHrhrG2II0FoQsFMGiRQwGxl5sQzM6UryBSfvhc5x?=
 =?us-ascii?Q?UZhsDBHwAjkxh2OoJ36UxwDaVoHfhNskzm5RDzuAlnDTzRUTcCcwk+wo/U5F?=
 =?us-ascii?Q?xOXR+Y77uFFkF67dskTIQ5FX/IzIkBwzCXEqE6DBzBeu7eez1L6oy2t/WzOx?=
 =?us-ascii?Q?Raj54799N4ARO+M3a4VK0uEl8xddqWanE3bD4c9FnD6QCNsXY5ccq7JNI2Fl?=
 =?us-ascii?Q?mH7djxNXBOzFMwAoyf10OkItrGDuaSOf8XzpIcosEBy1OQJzqPfb38uJsA8J?=
 =?us-ascii?Q?N6Om5CZlDm/f48rXerFiQ/M/72lsu2XEXNz5Ko6qSMNCOsIWfvzI4kuY4cjq?=
 =?us-ascii?Q?M1jCUysqdk/CZQ5M83SJdkmpG4+7eZRvEaZ324BaZaCLIGZ2EUmZxWDj7ddP?=
 =?us-ascii?Q?zNX3ArVA5KGXtSpzB3YW8yY2utsbpyF4MtAGH6UXJt4FyXblBTsm+S76aBhO?=
 =?us-ascii?Q?8r7joyuaxOj0BEJlzt0NcjvGdLwmy0W8Duq+9M6lKxjqjm0FgnZyZQSmh2Fq?=
 =?us-ascii?Q?g131n58MMBLjsodvveuAIcYuatadwzEX7UzmwOqmvxaWtTdhKUXAfPl65W3M?=
 =?us-ascii?Q?zX9wDFWOSg7kgift61E7o+Zf0QYS26x4SvlmF7BPSyxntxcj8/yYv70APNYF?=
 =?us-ascii?Q?FMgtm65uGdKb3+3s4RCzj57Ai1oOFBnlMXRyssXgD4M9a85rrD4t0wdtj8k7?=
 =?us-ascii?Q?y93sdVefyHLTPtgVMkeCyy1tbH2fXlscwmX85wXn3xofh+Hl5AjWh2rRuh58?=
 =?us-ascii?Q?cqQo/gdZwpaL4LuZx8GA+9thBZWMcK5QQ24PNZh2MsED0f0tI8APoUVH9Nf/?=
 =?us-ascii?Q?6tru1iGWbysCyj2qUOAEMde9HTgUahz0sryVhn7bHWvCLKQA49YSD2+SjAd/?=
 =?us-ascii?Q?2cw4rrZvta2ojjL4FfREi1IswAe4dQdfBeFNl8hkNzpk1nFPlHOZyNXl1vI8?=
 =?us-ascii?Q?gd1PJp0hT3qT2M7pJsjRdhBQODMzdcUdRpAQtbadDxbsS36u68I6EM89eDli?=
 =?us-ascii?Q?V9qrgF+FqJa56dxAJI9ccYbDCPF8gBy9xO/XcfAaHa1exnFlnZanFTAX7bdZ?=
 =?us-ascii?Q?jRDDSPRlAxeS/9qWbc8JpYV9b0nyUk+zJxtCj7eZhQizaIz1g5zZKnNkWnxK?=
 =?us-ascii?Q?koIO0ebr2OhZQC5izPsGexNUBzhQxlvmwcTPgXc1A/2Mcuxc3CiwiYoA0DD1?=
 =?us-ascii?Q?3FIAHi1fl6g7viL/AToKQtJXBqGfQ3vO8PsNYWdipu0OZ/xLz0WL8iVBuL+y?=
 =?us-ascii?Q?acev52dUIvZgDGWb1akTxONCmltKNgNmMOTGLtaIZsBpbyFzGKoSnghDLMMJ?=
 =?us-ascii?Q?0hSjunBjO4rVpj9m1jhYMMKFXEY0RfW/K5LO8UXLnQnpHsAmvFtfIS1GjAFk?=
 =?us-ascii?Q?nGzCOEYxRvPjcZI99gCuZAs/cRZBqz+UnU6DqsihmxW6Yq8q5MynBMSDvnSp?=
 =?us-ascii?Q?ntnVrWVvCSHd8BwO9SiilYQBN0viEfjYngnGMAYHCfMWI7xCN7i8NrjQs18t?=
 =?us-ascii?Q?AzFo6Mj3xaR3pLkD4SbBC4fZQdgZ6taYWS7pgoeXEKfyTsYfKWnrjxJ5l79r?=
 =?us-ascii?Q?DCJl6lcfCAZC0DJ3upJ21FjsIjF+aiGZJjD818DsjBmtyThxS/W/8xs3mXJ7?=
 =?us-ascii?Q?laEg+UIJEupHi9kcjx3Eo9WHjYXSLP/dEolJYb8NG8uEk4d/0nnqkMJ17rUW?=
 =?us-ascii?Q?oN/u2QH6tj23MMf1UUVeoKwhant2WzDOvc6JQ2+OzKQn5ptsv3dYrSWl6QVV?=
 =?us-ascii?Q?Ia2tS0mlow=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba73fc04-6f08-480e-8b1e-08d9be194909
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:16:46.0801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0AV6YJ7g/o8mIsywlKffKRwVN8HXI4gUeX7XCGQ3guvcVd5UmbZHHMBzle8FNZ7sDSHHQKxSgCjWiRxC8eCe5nF3X+R/Uiss90WRuN/eCEFICEqr37VnouTxKPCGUWVZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 09:16:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159615

texturator requires GLES 3 headers and libs so let's explicit this
dependency. This was not detected until now because mesa, the default
provider, actually provides both Open GLES 2 and 3 compliant
implementations.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-gr=
aphics/kmscube/kmscube_git.bb
index efaa962704..54993be89e 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
 HOMEPAGE =3D "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE =3D "MIT"
 SECTION =3D "graphics"
-DEPENDS =3D "virtual/libgles2 virtual/egl libdrm"
+DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
=20
 LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b=
309d4ee67b7315ff7381270dd631fb"
=20
--=20
2.33.1


