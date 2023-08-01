Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AFAC41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 02:04:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3782.1690855440497726403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 19:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hov8HDyL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7577539d50=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3710SrMT026444
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:04:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=k6K/GOnEe3N9PPoKCc
	5ydbPHUK6AfhW5MYJWavr/u34=; b=hov8HDyL2Wfc2Xs/KYSUJTwOgiAWZGVBXT
	a325dNl2roP+JZ500Zyhk8zQzNcj7QSfgKNyBwzZqpsgVsqtqkJhSlF+CwcQVKMc
	50AAlAI2yMzoNKwyvDYe+HPA6nz1Y7UwJTSnYrrHcKRK9faF7F2kxE1GbOScIRNP
	K8PAbkoTLqTgiqDs8KXcOkqmhzgswTZ3bYdydTgWmE63XQLW/R3wIO+m7Y9sSayu
	JvEQKPp5fydYaRTSdfpGHsyEZI1bUh54/JG8kX71uOCFV9XPd5DELympwl450bZk
	gGum5VhwF946hDp4y8f23n5n+L8vquBvpSlnRgdeYx5Mnyc+meFQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s529fhymc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1FXIC2/+gUUwPVBGUxBNpuH+Doci3SAx0aUs0giK8QsV9oWfopvLy9q7QBuTUw8WOKNBqnM9dKWsvoeej/aKT/IRPveKIMcey7nsICoz2iLcphfwVbWEwV2Z73E6lyUtMgY3+PKauGLZPw2OAjBIM/v2ZKMQhPOr4upuH8hzuUdKQ7NsfpaYMsfIJp5R3Odw+NMB22+oZobzPt10Lg1ShcCvVWDJsC6LBlBypd8fQE6JMEQ7q5e0mEvQaNjUaSN4OZZECn5p24QhJtiBFTPrHlNNM3zM8+0+J9syWwqSBf4GttQxve/s4zOf/Bux1fdNw+AWFrQ/EkTuComismEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6K/GOnEe3N9PPoKCc5ydbPHUK6AfhW5MYJWavr/u34=;
 b=cnA4z+KO3NI7u6UWG2Mn2WTQe0TkL7hTtGZSPtCjgUPFEaKeqL5DzdudD/VRJxCT42/avTyHoSnK/fVOkrv3kkZnSOSyJaGkfFGkpzvH7A5yW+1TFocIW2rWYbtFBr8gx12oj4RzKu8Jk1YOXnqoaazMLhhRWqBiWueRtytvDE4qzRkjmvHACasBNMVKlrZHQR8DUDCIYmR8UqHIgcTRnhyXau9B2lDxedcDKi+tcaUUu4wWWlc8wwLm5qDlHa+fzZhWN0mnjSmpygQerQQWoFM/SbKCat+7vnS7Mi6a6is9I4H3ueZTSEZKjtl6GcGHdAnrhQgwtQ1Kllon/HUCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 02:03:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5a0c:5fbb:a169:a76d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5a0c:5fbb:a169:a76d%4]) with mapi id 15.20.6631.041; Tue, 1 Aug 2023
 02:03:56 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 1/2] multilib.conf: explicitly make MULTILIB_VARIANTS vardeps on MULTILIBS
Date: Tue,  1 Aug 2023 10:03:35 +0800
Message-Id: <20230801020336.349339-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 0462ffdb-020c-4a0d-856a-08db92338fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s6cx1j+4Z1gqEoPk4ART7KVuc24b8loealPI3nVanXVszsbPCTupGgID7oMDIcV/gugkDxLmt8UgFn1X6eN/WjiSpbz/1SS87HQwpuLJ+xcObpUWkWPxDAXhUe2Z1tsgbbTkZHGXzd8qn7tFnTubkGfouBJgUqXdQhqtKXy28tAerKxK+Z+v3nmtDZJtuUnGFfsiSzYs4aheXi9i4JO9hOzNcboKf6QaI0JC/gQIMrr6ZjYlmsaouVELNNDBlDg2Pb/87R/octUg/Tr/m7iLzY2vbnphj6q0Cr1gpyoT60i/+8tD1TzqHLK0Sy05ebJ+QuAzy26XYP3vmMKD8VB65CALpZhhVktQ0EWVnj9tWceIamQByQsJDxreZZj0G66apqpKvpzSnOCcuD5hNxkZ8cQRXfO1KY6OLVgeWedp4gzVVePnkvi2KP4hCCerZBwa4J4IfVYv2QsrNAuJGbAlfEaE3RgJqj1JxGVxmq262VscqYqKFFrJrI28ePWF5iFT9RFzuaPhmEkymD4EOm155zNnXvwzOgD7A+MjcYoofJlldMkTacs1+mwysYCqWc8J7L1i9N6x8IBo9CDPnEBIYJiaM8pJXzWubxa+pCGBnar5qv0CihY4SpTWUr0kTWN0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199021)(5660300002)(2616005)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(316002)(83380400001)(478600001)(66476007)(66556008)(66946007)(6916009)(86362001)(6486002)(41300700001)(9686003)(6512007)(52116002)(6666004)(36756003)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c9urKOq+dgLS0tDt3HryCQdhLvDp9fZWWT078f5Y6MBK1uXYVaFVBWqpPr3T?=
 =?us-ascii?Q?5EfdLkuMPWYebB8rRh1iyV2u3am4rc4gId0ZXlESmBTPbFrbW+VQrQ4ZnbbS?=
 =?us-ascii?Q?NNK6OFYhnkENi+SSwBu8jq8JhbcKENrNEUJwiF5NDWcZ9GdCTfBOwz9c9me3?=
 =?us-ascii?Q?+HP8WKjGtYjRxiiAj/X+sh4q/7449jElkVNWmy/Fd+CfAfB+FE/z0dmBfzl0?=
 =?us-ascii?Q?jQwAyKbW6JOyEIgLGsnRkJGc8CC4NTGPhsfbeTaQ5rb40aSQ2+fs02XSZbKO?=
 =?us-ascii?Q?rvc5RQS+2gvxISjvpU7Q+OvIFAkkjQNJSdGDct7ukRpNUqOzY+hLBWvm5ZfD?=
 =?us-ascii?Q?5+YIVKQzGlm/duLTAo9WwF5iitdt7bR6vbNPRPx1d9r9OdR16p4TRrYWLnxt?=
 =?us-ascii?Q?mQ/+yybgvpic9XWQePNJz7ZFJs2jEBwPFS2rhelCuqUlbc/iAg4wOiEx03Qr?=
 =?us-ascii?Q?Jn44Cslf4ccFxeY60xQL3oLUBhUQSEao9ihwaYFpABkOepd5Dqtgx/Av7X4O?=
 =?us-ascii?Q?Ya8WZXSQ4LuJ3WR5wXMZFUpvV+//iChkvqgo9U5ogNgEiDsh2ZMBdY+hHFxe?=
 =?us-ascii?Q?m+yXZitU33OByFaMCQUWO8/VAyg7uaC5vGkUXyAk5UirCojYqBcOenD3w/UM?=
 =?us-ascii?Q?v4di96pf23k75JIhIyVOQYpRcMJvubl5BbK77Wm6hez9Fnrpl66Mm7M9o2JT?=
 =?us-ascii?Q?4NeRpVgAsNZIP8jZDfEoaS1RvMUm0ZYmYiph3CcNkQ8vwiRb92g3LWueEpg1?=
 =?us-ascii?Q?6pxQc8lmcFzSjMCpJ5khs+UX3mwxtkS7GVlvjXlmQYAC/XVHwZg9/bvh/snQ?=
 =?us-ascii?Q?zgHg92eeSVfjAY3fHErjWzsdVCC8LlpfQKkzyAN9EcARNuiYxJ+AWyDlCb+T?=
 =?us-ascii?Q?01mcmf61sZBLlpD0dD7zdyZgCAi+0lwDs5ytE+y8B5K7SXGUcJxZZ+xNwCDk?=
 =?us-ascii?Q?iBVlcaIZNejWG1HQ6aPcpAxh6JJyks38I1ZR2HAhHjdiABIb++FEJ+BU/NH4?=
 =?us-ascii?Q?2n2TUK6t/He1eD30n562Pg+5078rMehjhw/4msjAUUevJtaQh9pXrlOqd5nE?=
 =?us-ascii?Q?rWN5N9f9truQGmmue977RuuEjLymbbkCrtHT/mGdV/kdNL7bePUF08se9Xg+?=
 =?us-ascii?Q?r2Ew5lveO9vYH+BKogCsO7JXpkJVQcwCFbAILLGr4X/l19bv1dRPM6mmZiwu?=
 =?us-ascii?Q?RvpudsMDyXyXPzj83mZQXu15KFr6gLVpHvcl3NfP+0xWEd30mymaZ/HKuWV7?=
 =?us-ascii?Q?/3vm+Yo1OmaD1miozWJ1O8cXkJKQaByHFI0q/mQuGwJGdArm92KfFUPpVZ5/?=
 =?us-ascii?Q?m0orEb+nTas6RfEIrUGc/ZO3Kr19NoTxTLOmLAcrSupyxTni4ekbtomCZUKs?=
 =?us-ascii?Q?FFP15Fp9J00NGfPz0WvsT4DSZ5PAtUDMhApsaREEDWzv4I+I/vI/kSkuwGV6?=
 =?us-ascii?Q?KbMOfm+h14CF/SQMwRE5FBLxbBcU7LKOy3srtE9deS7pBwwQq0uZXUuos+AU?=
 =?us-ascii?Q?2VqAQi7v7vW+8T2TE47wBMxGfTkr6I6QOIN+jGkAQ8O23z5Jt6PuSh0fGblm?=
 =?us-ascii?Q?ie0C5aK1BIrYTVK4a/2fxS4lRt0eI0E86kwtR7eY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0462ffdb-020c-4a0d-856a-08db92338fcc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 02:03:55.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDKIdon1XKYEFq2JLZbZ1kRzDR9QPXxgOkg2/A8MZ5Kehlab9h+zKTENBdQu9Llc1MmluZNjLvDQ7s0wNF6LmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Proofpoint-ORIG-GUID: woPOTFDIzcA22VEMAedJXXLc9HQmNXWI
X-Proofpoint-GUID: woPOTFDIzcA22VEMAedJXXLc9HQmNXWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308010017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185183

From: Chen Qi <Qi.Chen@windriver.com>

This patch is to ensure recipes get rebuilt correctly and avoid
incorrect sstate cache reuse when toggling multilib.

The following steps show one example of such incorrect sstate cache reuse.
1. enable multilib && bitbake <some_image> -c populate_sdk
2. disable multilib && bitbake <some_image> -c populate_sdk

The error message is as below:
Error:
 Problem: conflicting requests
   - nothing provides binutils-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
   - nothing provides gcc-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
   - nothing provides gdb-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
 (try to add '--skip-broken' to skip uninstallable packages)

We get this error because packagegroup-cross-canadian recipe is
not rebuilt when it should be.

Current codes have tracked the dependency to MULTILIB_VARIANTS, as
shown in the following chain:
RDEPENDS:packagegroup-cross-canadian-intel-x86-64 ->
all_multilib_tune_values -> MULTILIB_VARIANTS.

However, MULTILIB_VARIANTS cannot automatically depend on MULTILIBS.
See some results from 'bitbake-dumpsigs' below:
List of dependencies for variable MULTILIB_VARIANTS is ['extend_variants']
Variable MULTILIB_VARIANTS value is ${@extend_variants(d,'MULTILIBS','multilib')}

It's obvious that the value of MULTILIB_VARIANTS depend on the
value of MULTILIBS, so let's set this dependency manually.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/multilib.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 7f3b9463ef..ef3605a73d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -2,6 +2,7 @@
 baselib = "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
+MULTILIB_VARIANTS[vardeps] += "MULTILIBS"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
 
 MULTILIBS ??= "multilib:lib32"
-- 
2.34.1


