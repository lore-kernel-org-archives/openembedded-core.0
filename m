Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACDAE77191
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 20:05:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.77])
 by mx.groups.io with SMTP id smtpd.web11.20895.1734984317855565748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 12:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=rpHFcFvJ;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.77, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+hDxrbs0eklw3ERosTsNz04k3EjUTQtpdkX8R6ShOhtnWXnSi/W6O2ZPirQBJk2P4zHP9UqB6x36G/LWX2huV0p3nm2DwLVXZYO7/Okx69Nj+hcCq1yZDieoSBrLNwOsaUr7Dd+4sDR64VanH+EEgfo8YUEKKlfZzCPxKORaWzEiUgxpoudvUtjyb2yR7ewOlvmQSu5+UwCPclx44TQirIGmaPAjLExML69rSaoDa7xrxIiuvR5RjCtVYLcvqng0mcg4NY13t6vHJAS7Qpqn6+/xHBZV39vMlF6evV9/xGLdx8cnntbcsYD5ukNl3sLvijCOSGIfZOTU5i4Dwzozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=G1MlKOel5VdAhkUSTgvodDw7XDSl9fJZUrXvsddEf7bM4W7McOsMsDzIPJt4JWlVfxKhkon8mORJ5Yeypue0daN8fV2yv1heRK34EL/cv2R8yoa1ZzV65o/MoL/EeiIkdK8dmvTceZeTF5EscPJdBguPytfg2MK0xWSzrly0fEfS6EbarfpvL1iQNtj8rSqViGRZJc++bFs5n9YIGKYfj3+HZfqgQoHBoIg9+8YJijkvshhqHAYmdFnmjf1QEs1tNvwY+CjSk1znOPf4XLeDvVQo/sh+lVDv69CAFfyehhTrT/zsLbfvV4fJUbokgwpVj4ba1Ir1Ye0M3eoergkZZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=rpHFcFvJxAy0jT9jd8BXVo7gFvPaL69xLBw0ziVuWgAfFyvHUn4K8+yODdQJgxBvJSjc6N3AlENP8O9wS8GTFz01ZZpa0HpEOYJGnq0paJ7qXT9x+aXsirZZ/D9Hfhh/gZD8nMT6aSCA/ccpf+eiqYp8BoxEUG6blnrIvH7vXtGlP/TeZ64Wm6fP3LPxqB0hM0bI5Az4iPGSOdrcteiZQQLUOo6xTecyTJkN50ejkjZRo8XZuCD2RR8PFguwbUBJMEiVqFLFnmwiaRuTzX0gSRwqqyv/uGTzSq90QAp4ppAS/pawaI6rRgy6ecRmRVCWT72gXbtY2RoVLJdEUk+wYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 20:05:13 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 20:05:13 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 3/5] weston: Fix wayland-protocols dependency
Date: Mon, 23 Dec 2024 14:04:54 -0600
Message-ID: <20241223200456.2504683-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
References: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: e763a3db-c87a-4a60-167a-08dd238d1c5a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+QyrqEQYxahtW3WEUjXhvGxGnc5qJx72ibKbM5AiGfBFmRE+9d4u2VLGgKqC?=
 =?us-ascii?Q?Zzd0LB/SIvOY/RxNWK1sKxBzOYN3FBySdwX1zh7PpCuGBaaAlue6jNxe/zSd?=
 =?us-ascii?Q?/jCsrqV8ted4iKCMltUpQoVsPGojNRveDlWd8OQURfGq6+Ie2jWFrIAZZ76e?=
 =?us-ascii?Q?nFq9tTYRzBe4irThwAUCOJBolZhEQciMlcLFWqDt2lKf+6Hdc6i+2zCrGwxi?=
 =?us-ascii?Q?uA9O+DCEIHcYIHio96Mw0vWhYqmmauNvoI7zcudklryZR0u4fQK13bEBhVpn?=
 =?us-ascii?Q?8/oXUwcstvuHOBsHbxACCYO6w2V+ytSbqfc3u5Z9YvamFVEQVkGGIrAXHArI?=
 =?us-ascii?Q?BWG7VJb5wTRUAZOI6m1JZn31k2bIC9y1YAoi2rETz32zHopyX7TnJL1pKe8i?=
 =?us-ascii?Q?0lzkgzo84LAIuHWrMBPFysEl8s5ctiUozd1G753g771JOtCjULl3CpKEWseX?=
 =?us-ascii?Q?bq4QerrvukOFjo8xdPmmBXLWq30rCbexKxHxi1C7n2e4rOdJHHhLmZ6T/BqG?=
 =?us-ascii?Q?A3tlbGJp2dhMguKr92wbsPzID9DQUNprGs72DIy1OiW6CXhA/E9rW8MJryhj?=
 =?us-ascii?Q?Wf/lvWu/T/8Z8ZYN2jsm+4D2LN4sjFMXSUthDo7zu+Q7mUze5XYaucgV+SrZ?=
 =?us-ascii?Q?GHNCCoHSo1LhmS46JoXXIiLSuGvP6t451SUNzdkEZkvOq9VjvC0PJFqrW5iH?=
 =?us-ascii?Q?izAQVdQ6OUxu5b74JMvBsr4PXeHhPL2EQSK2TA8h2DkLseIhMJklAIyTH/5E?=
 =?us-ascii?Q?EFyJFX3ddeIZjz77EJN0FtajOZYZCP+vudt8shFGS+MTLoM9gUWmF7xnMp2I?=
 =?us-ascii?Q?xI19jF5bAwedB1HAIfcoDAcG19NAbLi27Ya0UDtY1UjQA94orxmOeJfnH5F6?=
 =?us-ascii?Q?kE+L7T8qHg9agg9nkgrkltHtObHl17buDAaar4xn4zbE+uzva5Pexm1BOUHK?=
 =?us-ascii?Q?L7+QGv+6DwJZUi+Ppq8oSN40N6INkA8CT0EV1gt1sQ+Kkad8o6g+JCfEjpXX?=
 =?us-ascii?Q?TfbPdFGdP/l1FI1vfooG235ULb0jKcdSNqda1ge5bhefw2AGg//L0pWvUvii?=
 =?us-ascii?Q?YNzcRQW5TnzT8VKi0cEOHMjJj77NYt5AMpyu5jLRjMY3ZqboyqsDqZsfDKTf?=
 =?us-ascii?Q?OPgN7BQdCCZe5cX2pj3kTxI/MzjdiHNcim+Ov6m9P5up+GHpbJpnlL1mvwWu?=
 =?us-ascii?Q?4Xfbf6YCObuDLWXlvhtCom5D1v1diL3AOqBLYqKhFOKJvzKIqcYhKLB9VIdA?=
 =?us-ascii?Q?7iiQCX06h1b2r9ekvXHx216vZv4km1A1T5s0P9oclnkMXbIRqfDOKpOKvDPs?=
 =?us-ascii?Q?ge/BWi4sCpTOib9q6kFJ9jh0ZyWqN0FrlhXVfBlI7rqleh2+j3pWM4SW0ni+?=
 =?us-ascii?Q?5s1yro99MM0G/U4GTBUlBp381ac2tfAuM+2ZmgXGiEYRTpwyOuxSu3UpX0Qi?=
 =?us-ascii?Q?lfjUSher7ppSAkmwAnv62Th8LVKGleEG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JqLLKeQSuodcemAX0UM4zq1GGE78YA7sOhCf51h8Sopkc8myWwOs191qucRS?=
 =?us-ascii?Q?5qdtGeiXeAhZQt+mJc5XqtEkCrZhkguNqaezvIa8MVhl8H/wvPd/FwRy/GAY?=
 =?us-ascii?Q?undbCfq8mioRDhG5Ew0mpwdNRBN5VWgp1AtvSxLifuzLyuYumKAp8xWcro/X?=
 =?us-ascii?Q?fpd3ZYpf9IdH/yL7Lh6ACNduJLOaN6dr5w02shWTUb5VcmX51+xAQdXD4dUd?=
 =?us-ascii?Q?DUz5tqmutdy6GGhtvDvygC7gwXbYwikXUSdJ0fs60+GR7UkcN1RbCF0ahVz5?=
 =?us-ascii?Q?DDi3Thxp+SKxbunP8ptgg3+nVhtN7NWmMojPyHg1/8DMwhIVf97HsZy4x9Sg?=
 =?us-ascii?Q?cW1sriShaElz+SmeXWJ29Uqlo0mHsew5Wq14lRpiOvMgHGVi2j/W82rshabu?=
 =?us-ascii?Q?+xWRl3+AFnfyh1FvWMwyjU3zUT0/j1oZYCxkzN1hHvkfuPiSFKHnqZaqETKU?=
 =?us-ascii?Q?1jp+XuMZbgpYFIJXhIXUKBQUkCe9XDSxypcZXxel/y6KiZsQom6M22H9LsXy?=
 =?us-ascii?Q?G6atzTgixAY2T+oG+6gvv8Tg8r0IQ+bAMKvvwCEk+k2um3MD0bRYi2bb1jIC?=
 =?us-ascii?Q?eSgjZUez7F7XrV3neJB4J23u0M/WBH1+xxuJQxUlI2PEbZEEFF6KnrBSN22D?=
 =?us-ascii?Q?JNoEueJqgWgOdwanAhNErb7pDokg3DzGPeV2HzMAj4n53UhqxFCZyjKYXafm?=
 =?us-ascii?Q?Y68ubK5PN7ahZxBLFCZrc+fNnBP7UkaWNPU4UchaVlRhuusAb2HZXe1Gms3i?=
 =?us-ascii?Q?1AtOCm2CCILAIeWqBrttFq+hMDKeU82ZvSNaGcDfbGYS3h//uLODjcyi9B8y?=
 =?us-ascii?Q?teGoYnTbb0fzhMZs9E31vzgJPB6E+Dd/Rp+Wy7dqO/zZv3lAF4RAFtbNauiy?=
 =?us-ascii?Q?/hzQmo6uc1AiPBKDJ1z7+erzXJyrUA9K9GwJFVJ+llBBk3yTWXaw2e8+4rqI?=
 =?us-ascii?Q?9bEWv2ICq/AFBpZnm0zkuxmhsmDFBk4jlEpIYoMkpjFZshLw4H0bjl7j/C7v?=
 =?us-ascii?Q?QdJireUWdBy4KPKvrVhgJpBMIdjEndcHm5yn/wGXgnRYmF4tDYqhCzJdTCGW?=
 =?us-ascii?Q?vKhJdEpUelSAnuIWtNkafq3EUBCg7qaupYxS/qlIU382aD6QybRFPv9R6rWI?=
 =?us-ascii?Q?eWz26F6dviQ6/j/scoLlavgpSzQHEcwFcu/cOullIGBWabWeNYSLqYRBnA5z?=
 =?us-ascii?Q?uGgUz2HKm2VlHVeSoJTAf7XQoHTekYRulUtP51V4alTHxqk4Q18wfKcrTwgX?=
 =?us-ascii?Q?IjKXqNbNe2ltXQ0XokfdTsU+ZcGAprEceYCWYk0qZBhj//hfzAftOwQN/x0W?=
 =?us-ascii?Q?PieZPzERl8rGHCxBg3IrdFMdpR+/ZnZv+rFMJxNQD7lPRokMjmcEn+ZOZ9NH?=
 =?us-ascii?Q?zilOpgPmW4xPm1W+Qmt70SjicwRG0HzTPlzZKtsE8CsO6GlfPFx7t32jqvSb?=
 =?us-ascii?Q?yRVin5BAJJ4vMQXPL3JVLCybEanfletyEZzue0uLQH5XXla1Xw1trO+2pFBj?=
 =?us-ascii?Q?OyGclyhLUm7ZBwseaLafUNcOBSPMWKRUc9LT20bn6ixtME6osQgzvv0povbk?=
 =?us-ascii?Q?QPmL6AHzlWlQRHxe37+SWy6JWEdYqVs5ylDWq07G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e763a3db-c87a-4a60-167a-08dd238d1c5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 20:05:13.2351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXxvqfcGEqpcSqJEKNIf5vvau0B6b7tA/ZmaoOdoaCQf241Vfv2tdI6GwpNoUtDS1hfxHxDHii2zRmAYgmOufQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 20:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209050

An SDK build of weston fails:
```
Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)
```

The file wayland-protocols.pc is missing in the SDK. This is traced to
the upgrade of wayland-protocols to 1.38 [1], which re-enables the dev
package, which moves wayland-protocols.pc to wayland-protocols-dev.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 50749d7d15..4cb0ca4d5f 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -137,7 +137,7 @@ RDEPENDS:${PN}-xwayland +=3D "xwayland"
=20
 RDEPENDS:${PN} +=3D "xkeyboard-config"
 RRECOMMENDS:${PN} =3D "weston-init liberation-fonts"
-RRECOMMENDS:${PN}-dev +=3D "wayland-protocols"
+RDEPENDS:${PN}-dev +=3D "wayland-protocols-dev"
=20
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM:${PN} =3D "--system weston-launch"
--=20
2.34.1


