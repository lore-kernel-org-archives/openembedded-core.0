Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC5BE77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:23:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.27158.1734884579574530729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=MfoDX+SI;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.46, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lG7fD4B7qPJRGuHz+7t1/c2+DGci7tcsB8a2S+AmelIceWJwUbDClfmI3bwpVrCOYtgrPbTt0HiPSDspmr4hk6nf7NY+XcnvPIU/pQv2lf49knKrtR/IHvvWLScpKi7FgI3qO7hwM/0NBe7QhG3fY/mtyhCwrDgwT9dhwELSKwzpcrHnEO6ma8KKrthtIG3rlJkGiED68g+xW4wVw5h/e/yO4sb7oYCI4Ajz/b+kbgTwdahlDRGSYL4NsXeLoed8ZnIyYw2EYoaB+CM1Xi7FOqWHolVL2jHiNhjA7QhB5W43tJZfOrTcGJxo7gQ077Lz2rj8Fm/S5A4bZSYe60Oe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRNg19NFfqP+ic1fx6FhQU8E8StpWzagqOpPJaZFFz8=;
 b=di1mHEnd0C6hwQPrmv9q5HhqyorG/8wnssDIVooG1CHAyDzJMGU7KzFLKzYlfPVp9hkbc6JZdJj0kAQoHRicpbYAIo5KzGvZx4MEz49/74UXFIlEIcY0cg7YYTe4RR9enXowVVkFgtJZBPl4clvCuAQQyngJzqejbzXNDSmOItV0Pcvr+HrFdqWO7bfiOs3Zt/wKKVPd9/brP5t8PJBEdqVF3VOChG1sIPH2IATAWu4W4xpTYN2Xv/dxLS6QVWofyudaweQPdUo7UyZKWoUbtb6HE/qMEBSA3772++aZqqMN3vCfL6icCWgY2J8lb3W/K5lPkrX6ZRtiwPkgZqCjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRNg19NFfqP+ic1fx6FhQU8E8StpWzagqOpPJaZFFz8=;
 b=MfoDX+SImlyMdVJSS3V7VkWXvsG3ln3YpBFLKyRwPLIoLZlnwG8tajruiZuY9JFu7aG8Rje5t08U5msVxXu54bNIGa6vilTG/cepNpOzBEZKDt+w1iyGITaPZ+DsxbR6BIu/UWsjoGtG0WAprcwxmCcFVSyMR7yxFr6r0pA2JHNeexROZY0MI6cnBGjXNH11rOmt8/a+nbMXIUMizVM4dfn1mxICshuPeztTM675CmuFDFwALjtU6WLrPVC9vdrleTN45hDzciabQWv5LsKNvWuRSqgmicKvKlvxALIKAYTMFcAXR3BH04i77YhDgUxV+IPgKZv8E76PRs5xb82K4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Sun, 22 Dec
 2024 16:22:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 16:22:56 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 5/5] mesa: Fix missing GLES3 headers in SDK sysroot
Date: Sun, 22 Dec 2024 10:22:34 -0600
Message-ID: <20241222162234.2411262-5-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
References: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a12c86-f719-4b9e-1d9f-08dd22a4e343
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6MfqpoIQ5LyaYyvuTkH5zewUztvbWz7Lp8BpD7bZfgeAGvAXGaP7nvffmmzX?=
 =?us-ascii?Q?o11wJVSndaT3X8MzIfWHJdm0lycG6dgLHkQGGysKF7J86KCnqnC4N6V88kK8?=
 =?us-ascii?Q?nWFz0aVz4yvoPJZPKiiDGrqnCHvuYNued/mjbMpAsS3PYX9V4kxFaKqc8AKD?=
 =?us-ascii?Q?veVhxRrDwsAjQ4aXXn6EnwJ8o6pKylQAI7lAm6lY2EM0JPWEPJ5GfgRZpJ4j?=
 =?us-ascii?Q?tOoVKdLFGe4OjSxdBFAnTH5yscKVwcho/MqXKUqaOMRMziCb/daLIcAGGRyV?=
 =?us-ascii?Q?/2h74Y8qpNCV9hgvugEc4YmHI09fm/G7U7OtFkyI5kpK0/2pnIguKhc27WFN?=
 =?us-ascii?Q?RmbmBQbrTtmAx78fj+7C34gXeowldMJKLsey0qIcHAEYd3myLN/c49cVsovX?=
 =?us-ascii?Q?qq+hlzhjtxOdKj64Qi6ONji9hFx1D65s0nzs2MMXYIRY6IiQiYavJXqBJuJP?=
 =?us-ascii?Q?tjArksmKiGR74+AJyPR7b+V2ZmaNu39fEjT4DirASUL1gzV0P3KGwmbQ/0YQ?=
 =?us-ascii?Q?q+KDYz00gMxNmjtm/TLj32kjIrduX51lf/SxAOFEw+2Erl0RVGQbiWcDclM1?=
 =?us-ascii?Q?canorbEllwmXay8mYEuxmUam4QGBom5tbhlhaAi0C+Csh+UeFB2OvTI9d3rA?=
 =?us-ascii?Q?cDXZ2sM44hGnyjc4VKYID7NbHRni5yXpn942SbKo8V1OE1s/uhI2dGD0b9I/?=
 =?us-ascii?Q?25/M+oZ1sF2zw8a1xqmxkvXmOxUqPFpN9TNXKXwhV6BGL00zHzu2ox9WcueJ?=
 =?us-ascii?Q?Fz3n1iUiS0iumBR+N8NiXKmo7WMLJ/bLJgBlbBZHI9YlUc7vwkB56hVojflm?=
 =?us-ascii?Q?5dTKijbpglj71q+tL0rFN1K1mLNy9yZg104smskP57HlF3BCIIHx9205IGty?=
 =?us-ascii?Q?tz6P02debBOLFn2oQtci37cT1mT/NGRpyA28kWgEWkD72+/TsH/mb5vLGjPV?=
 =?us-ascii?Q?UfPRfSP0o0uFRAOMm7efxBhB8OqA7l6xESRYqv5Df9aokGCCzddeh0QkbBEv?=
 =?us-ascii?Q?+sV4Pcaqz9Uzc3xGRp4uOXgdUQ07J5+vjQgm/EPTDIsMh4h3jxBeVFf6H3wc?=
 =?us-ascii?Q?f2suFb9o7Eim90xyR2AWtIK1NRR2MSpfyzSQlm40PoCnavt03A8hVJDJEQIO?=
 =?us-ascii?Q?Sknn6lnwYlUx24K8DwvkeQpPH0s2NYyMutSrsCGJwmoseH0aFHKZaA9HaWmU?=
 =?us-ascii?Q?j5YR9iVH1f+gzEc+tV7Ib+AUTPorgGfO9hNd4ajNbuvMQyg72T1O5YYOGlHd?=
 =?us-ascii?Q?PK+Fz95y6ANCRS5ujSbrlXlJZUc1el/LK7/21fHz9GTXnCb8JSxk8g+hPvJZ?=
 =?us-ascii?Q?HChzxOd9trILYVrmPHXa9PAaZi0Hv9ZDTNwtTQwlyB+kKpA9SYXJUPgJd3xY?=
 =?us-ascii?Q?BLInELKcvY3ile9e40hQTqF1La86oKOFmuZjGFHwalfaTJ+EdObq9x0RBJPK?=
 =?us-ascii?Q?KDHI0ufCtkaSvjdkyZZfqeQm/KPC0o9h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pXlwA9Rqffby+z/kFJ59xuwSkug9ALLbOzdGQc/Pp/fpdPG3R5HbYKNZHjSR?=
 =?us-ascii?Q?ECfhB6KGljHXTQDcH7SJINxtVDo6tRcF5pcPTu1QiI1gp4X1bF9i4mRXP4+g?=
 =?us-ascii?Q?Txu+ku2YkhgX+7kwuNARrbHP4++wJ0vGBgnhjeIfFAj1OeJSqgaqhkmaAFEA?=
 =?us-ascii?Q?or89F5jK5Rije+vE4TSpUWI43VApfCpbl5VXG9rypxBPnpjBN1OwHVEUu7Dt?=
 =?us-ascii?Q?Q4zzTJ8x9oRQNh/n8uR0fGRm9QJxK+X0hj4E6mCB90ZJtp71P/5J88WrKzvE?=
 =?us-ascii?Q?rBpWhHNx/T12WU07EIdvP7cLl66vlKj8ExRam4ke6t7EPg8w2CUttuRuuLUa?=
 =?us-ascii?Q?JAkqd/cMsWQvFvVONZ4dW6kTrDrxIcAcddhakF269fpSGK1P3GsfciJz1maK?=
 =?us-ascii?Q?Z0TV/t+wIoPG0wVwK9X47OF32zW3Z/uMMivUBVBfhx9rsCAO6WCuRKnStggx?=
 =?us-ascii?Q?w+8qIjFaSV9Q/74jTXUyg3jhSbjqzVZXM4/W75A10Vc2e3m0JEIISPUG641v?=
 =?us-ascii?Q?pA/dxWBfLj/8Ejf5Bzne8SDuU3Aqd/paUigmr2f7q5NPT6nuh/fdI+SCf09T?=
 =?us-ascii?Q?mkh8VVM7vPQOCedUog1hR9bo0ksH3sH20t2IbTuXrAQ5uKzK40V346j/dOD4?=
 =?us-ascii?Q?cwfx3HTFxQvUlSh6kisDVX4WxTyFU6xyXRo0UvTiGQxmLLOzViBT//gzE1Se?=
 =?us-ascii?Q?lBtcm2vXySVO3eNj7jyXG1DPFrIHogI1NHm4XSnsRVJTofVYh95uukhh1I2B?=
 =?us-ascii?Q?trSAoYH7L18J9aiyBUFAFgkk+2kjpf6gJTzMUPePGUQJTAUor1xdGGlwFjfb?=
 =?us-ascii?Q?Fw9Y2TuEL4Pg8OeeBYNSadduZGTZsSjhMVI7SJUBQDZlSwIa2xF1n5nL6cZm?=
 =?us-ascii?Q?VU4hHOeeXbCUTjKyRNdnDiEUWPFGl7rTCuBiqynGDqXH7Y65k9CBw/1PKZ+2?=
 =?us-ascii?Q?Xfdmgkg263OzB0AztEdDC9d3t4tq0iLuTBYRhPyb3Kgu1EXE9maAf518GVWE?=
 =?us-ascii?Q?41CLGYBk1x7uruxPWu/J/WM+QicmhmuwxcOgIq2g1bWCLElIp3mnyGukXLdQ?=
 =?us-ascii?Q?16i9LAoc3AidzAxXssZ45IKFTQ9tvhb1ak8frmYAAJidvxuFqFgrsOZhX2zq?=
 =?us-ascii?Q?iDELZFq0/8YMGZ6yyAAbYzpGN6YbGhUo3zGpC4TCuhJIWjKJMj3yuruOWZ5c?=
 =?us-ascii?Q?NdVQ8TG0rgJaj0tP08tfVFkjKYEIa1RoIR0c3Ly1lus1O192M9Tr7dj1e7Ox?=
 =?us-ascii?Q?xesi9knFwp3Ja/O3AGD5FTm9tRwO4vU8X67K/FYL9aux8N+wUkBfbmpxFIvk?=
 =?us-ascii?Q?9CP+rabm2cHIAmc/Q3h5TpYKHVuITFSZ5xpE0z7jefLrQcLbMGWaynpz7ZBF?=
 =?us-ascii?Q?8XfFbEXw5ehPvD1ESocXYo8zkIRlSPz6oap9BD9ioU7gvYM5ZbndNYp3ETP8?=
 =?us-ascii?Q?cI0WhngQdskZrDvTsCxazEetQL//pBVjv7lu7BYDqXngK7J98TX5M8xfLEdn?=
 =?us-ascii?Q?lfuFFAKUm4YePfaaDOruLreDJX1jY3HbFhPi39NC2nCft0ui6ejUmba55L+r?=
 =?us-ascii?Q?/55i7eI2XafIngvow+8MyCHXbnl7SvUClhRx7hUn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a12c86-f719-4b9e-1d9f-08dd22a4e343
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 16:22:54.0192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVso75FZ0BLhC2kJa+EtHxdQpisk489RS0ZGJ6GMwIdBmVn059+GEBXthIxrgMoNbzaV0uJ7MeRoex0+8O4dMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209011

Building weston with core-image-weston SDK fails:
```
../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fat=
al error: GLES3/gl3.h: No such file or directory
   29 | #include <GLES3/gl3.h>
      |          ^~~~~~~~~~~~~
```

Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
which is packaged in libgles2-mesa. However, the headers are split
between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
GLES3 headers end up missing in the SDK sysroot.

Add a dependency so the GLES3 headers are properly associated with
the GLES3 implementation.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 9fdf496e8b..84490158f1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -233,6 +233,10 @@ DEV_PKG_DEPENDENCY =3D ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
=20
+# GLES2 and GLES3 implementations are packaged in a single library in libg=
les2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its impleme=
ntation.
+RDEPENDS:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
+
 RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'openc=
l', 'libclc spirv-tools', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
--=20
2.34.1


