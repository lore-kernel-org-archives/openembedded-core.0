Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23269C4829A
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 17:50:57 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web11.696.1707414654656361814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 09:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=FzAhJYT6;
 spf=pass (domain: ni.com, ip: 40.107.93.82, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBGYEErHvYmzmYTVnPbCvxgEc9RDnZFtbG6FonBiGmikn8cqzDjKB9S8CyKO5L9sl8lmg08wllaVNO2t1Xui/5V3h7e1p1tVnUpwSetfeXGpuxkcLwxiDJ5CIBFlRpl6G61oqfA3Tc6tPfkNnoY/DlWmn4um1KrczbYOolZAIcNntCFhCwjb+rLmThncjq9NmPczYQqsI1RO9f5QYSgZ7nKGucWzzeyWTuIk8sEkASjukJd7C5Q46j8ggXY2eivZUzRQtZUYG0GWhdYoajHj5tzkQWV3ye5VXOuiXlq6LkWSbelB/dHYaugFTA7naH/zApTSJ3v11LxH1RfgRYPkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QygtK46hpCuPNl2Ci2vma+ypv2Ymu0wGov8gvhclgE=;
 b=JF2+T/UK7ANzSl+RaP4Bo8ivHgYS2vusty/lgjUUZflGr5E6Bw3AQgczwCXGMAKAKyTvhMLs0BCqBPDxatYJu4IJySgMTA3a9daojqreKusFEyiQJ3Y7cN6ItTyU979NX5MOjiq56QnWZR2NG3DCS3Fl6Vse92dmzm0NddJ78e5XhIhwhWGmLbWvuiOAnGZR+aHq9aIzX4MbBxQ/KonmSCGEsXS6Pd3SaFbPY5+VgSZ06+Bpvg02Y6PYA4znW3JHn+9xGD/GRpEO2EFbBGzHC7mW8RFhzOU1i2F32gbe57wg/ogHUxoIWConEdYuBeUILL7IFwNhJey1i3sIuzPGRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QygtK46hpCuPNl2Ci2vma+ypv2Ymu0wGov8gvhclgE=;
 b=FzAhJYT6vtTke0yAay+EvHrufuiKeF3kK8xpYEH0DOwzWzTRLnf+1vVI/QgjeRzjQmOBsv6fsokYhKSDnwIhqvQGWGiml2T/E2z/YhAQMZ+3cnMYV4q5LdPxBsD7lNEgaeggbFdA4pUcJ1HvWTXLHF0SWXbvku16jrQNRXKb8/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7396.namprd04.prod.outlook.com (2603:10b6:303:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 17:50:52 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 17:50:52 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH 2/3] opkg: add deprecation warning for internal solver
Date: Thu,  8 Feb 2024 12:50:18 -0500
Message-ID: <20240208175020.1017580-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208175020.1017580-1-alex.stewart@ni.com>
References: <20240208175020.1017580-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:806:22::21) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3935759f-1b4d-4588-f952-08dc28ce7e12
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aLrtiaHo4brMBzg8CaCPvi+nE8obxPzm/AxqJgTyXTdxM3lvLcZ5CHjb3K1OovvynnTAT6Ggbl0YP316m4BMH1934+FD+3eyuuLAYBGAKGPubWe84mM/YVCBeizvfTjT+AsYtbiEfjGdeT9G9wvl1pGybW6AEJsuM9Mb0d0uoOLUyvxOaCXiThyqN1kZDT9FksO66YNnUGcdZh7iFWXLdMlZOApejTnDJQG3yD2GkPBuHcRXoLTuZb9XftndBs5r0vCPZ5huEUywQWaTNPc02CjhK4ju2gh7EOrXu9Pu1+NOYYJoIq2BXXB/MIQrZb2oy2zFA583JqECqbHh8iiatiYYIvjmQ8PuDRVMYTHFNJ3LKhBCgAkVR0BPfzK9WvA/xAVK5BPnRO8qxtZ06yByA4U14oMOy78LhGmvJ0gUMEt/op8WBNbEH4HPse/mbBrRrnYoIrNPnDnxUqd1K4f9BpGgmxLtFBRBvlUz5AsABde7AS3xeWFHMmFhvYZqDZ3IACL+aENipsODIyIhk9UiHiuTzL54FKkTkI0C6IcJ8UF0xPy//vp7kBHgd/+I68F2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(6916009)(316002)(66476007)(6486002)(66946007)(66556008)(6512007)(36756003)(478600001)(6666004)(8936002)(4326008)(8676002)(1076003)(26005)(2616005)(86362001)(38100700002)(83380400001)(6506007)(5660300002)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pCOqlLNpwD0/mnjX3D9lH+AfD2RL08+uh3GKmLARhnLG6Ng6Q/UM+ZzwDD0v?=
 =?us-ascii?Q?gO0dj7kLtscJsmsaJmDVdAdlyWoPxnFpBOnNfrbrTiSVQa0e0G/WMGOBcqSz?=
 =?us-ascii?Q?krfO/R2+tKOr20QWuGxMr0/S7+ZwrJ8jT7MNNpaupvfNByLLRU9Dfa2IGy5e?=
 =?us-ascii?Q?uSYD6w7YQ7b0Uv1htPu8TbF2yFsxwCaAyoJWJK+3YheiDQiILlxExj6zd0wc?=
 =?us-ascii?Q?5hbyNXCAuDB5tiQxjyu/XxjZOHXliVHw/NztkQXsVdaeRjbLcowX9lW4xt3s?=
 =?us-ascii?Q?i5n7mKzWcmboxBEDnwlR3WuibZpoOukITxqNygdn0oMKJrXQffeMzMh121Iv?=
 =?us-ascii?Q?aPo9bQcPO4yM1Gyky61Eg9FFXdOhuKJnFx8+Xhv1JikLUbzeknB6Q4HJ7GOM?=
 =?us-ascii?Q?Q1N8uV1SMZo018dbEBWqei1N6nBUZTQmTVS67Qzx/6cSkTtQFwOOdbEPXSs+?=
 =?us-ascii?Q?Bj4ZZd76VopwzzttiXc6+By6WghV/COwWkz0lkgiVL9y7bF7XdFK5kS0Wbtf?=
 =?us-ascii?Q?5FYL2x6W80/6AWzuigNfWYtbYubj8UglcUssm5r4WpSwT74yMnyXaaLlL31K?=
 =?us-ascii?Q?NFWIDJs81c4lAAScyw6XWlrpN6sQsi57cs9n5glwZqATlm+kshX+um0eFwuc?=
 =?us-ascii?Q?m/REtwUR87WTDiWBC/XfDDfLa6WvbAvLg1o+vU0EK/7PyugXEncq4QVttRzy?=
 =?us-ascii?Q?8o53iS32xEqpvXYQcQU9JLo5NQ6yzcVuELNJzf7XTgT8aLVSpcx5gJE6Lupg?=
 =?us-ascii?Q?ZYl25w2Hf+qVLQhB+H6nTl9QLsEU338+XLAZujgsCo756Z9MA4v2ULmZTI3e?=
 =?us-ascii?Q?IzNscX61kT9XVxKEbQnlxENUlHOxAGM5abVXCc3cnV4+2TygxA7NKiUOajx6?=
 =?us-ascii?Q?r7dkIm1YUq/pIARMXuKUGaY8x028NE/+vAtDsqeewaxLNU55W84uRnjyKVRK?=
 =?us-ascii?Q?nslcM5Lie5GEW1kxPHu5vw0DOPoL8YPsrsdDkTIYizYfK2mYchKP3i0JIZdx?=
 =?us-ascii?Q?tPRC+MCdf6mxJkk5l+bOxqnMWKbcz8Z6fGpMd+OeDRsIz2IoLgfQ372ZU8kO?=
 =?us-ascii?Q?dPxwsOTDGzB1avp0KUf3QF9jZgeSV3owHSRhE78hpqDv/X83jUhoBknef0Et?=
 =?us-ascii?Q?XImEEdXILPthhgZ3xO64XlrJWTZdS1hTXu2EEf82vB98iWpXqczfRc8RvAAl?=
 =?us-ascii?Q?KYPF6XIfc6//gcI84Cnd9TzvtIudpfTb4HmFjLljIN4zM9ZqFkk7LjudPB9M?=
 =?us-ascii?Q?cXcXziscoZ/gxBpAIDwyrwAQTPgULL5MX7aabSzYdeYbCzvai7FD9wINorLV?=
 =?us-ascii?Q?Vus9DuSENbyQfvuDEFxKkBskL2roI2NspySb/rNHs9g39jMnJt7f+pshODEZ?=
 =?us-ascii?Q?7Gnj61s1fpvqYhjROGhjIF+4lXxLGFpFpPEG+0qvSOHERwVQ0H/YDmeVujfg?=
 =?us-ascii?Q?yTcZbOW8unTu7RBhb/q7vuPhazBiGXE9MuuYL7VF4LI9+s1VkwpXnI3qcAA9?=
 =?us-ascii?Q?3JALZZV9JW7wULi2kGYP0PPaKZAsMq3l8Clx+YQZnvo6dVe4kur4S75A1x1r?=
 =?us-ascii?Q?ZZYgh7R2XqRrIPq9XpV0dqOzcRIJpiBoUjlptp93?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3935759f-1b4d-4588-f952-08dc28ce7e12
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 17:50:52.4804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i58U9JmL8XQcXZ73wWi5yOTTGU651bk76zidBQqK1tgd2silOvPtM/IGwoFSp0uMP3x2r/7GWprcu0x9PbCHHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 17:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195164

The opkg internal sat-solver is marked for deprecation in a future
release.

Add a recipe QA check to warn users who have the internal solver
configured.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/opkg_0.6.3.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.3.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.3.bb
index 1f15c44e3e..9592ffc5d6 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
@@ -61,6 +61,15 @@ do_install_ptest () {
 	sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0" ];then =
echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
=20
+WARN_QA:append =3D " internal-solver-deprecation"
+QARECIPETEST[internal-solver-deprecation] =3D "qa_check_solver_deprecation=
"
+def qa_check_solver_deprecation (pn, d, messages):
+    pkgconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
+
+    if "libsolv" not in pkgconfig:
+        oe.qa.handle_error("internal-solver-deprecation", "The opkg intern=
al solver will be deprecated in future opkg releases. Consider enabling \"l=
ibsolv\" in PACKAGECONFIG.", d)
+
+
 RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-confi=
g libarchive"
 RDEPENDS:${PN}:class-native =3D ""
 RDEPENDS:${PN}:class-nativesdk =3D ""
--=20
2.43.0


