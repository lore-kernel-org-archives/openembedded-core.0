Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FDFC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 04:59:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7948.1670216353885792671
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 20:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PoIb6EUf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93389c4f0f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B54xDSw016916
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Dec 2022 20:59:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=FhPAJvqflJaUcXoqde5AafbFOu4p+9VqrV8AFoC+6iQ=;
 b=PoIb6EUfrhU+xdRqWwWd/t7FL9UV0VnwJCeX1qtPp0gLypnQ4lVZuaQDA47GY4jO6ca9
 3/lOhdeQW0psiLdH5SQ/hSe41KweNvOCmE7Td9U17qiTxKEgOhqoQPuWWNUsGn7/Sbyc
 8bc3enhi8Bi2GJkakOkf4lpVRVZXU54BSQQgv72RBiRXCwzjWhdNXiSlBALfHNICSil1
 INpPg5R97EhiFaPvd/YhryNxGOkwDMF7Vc7XBGL5sj3Njsg+drobwLWOaNZt1sCe0C0n
 XxThRKOZcZhfiZQdzwASNpLJITRcpLeBVaIu/Mifn2E6ubfeWIkyyDNva6u5/PTVzC8P Mw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6s2wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 20:59:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHI2uDHvWl/Iy28yfwrHteEshENQ7hpDRReD9CsoSFWDRnin+yq4aB1mW9UpRapjHCXJoFe2WwFdr7ZODXYPUoN2Bx9+d6Se//Mi1lbeL/KalY/K4EYLn1QqIcUl2KpGahz9/I9hU35DlsonCFVT3Kc80Xl/xjbSVUN6+vc/mHQP1SbSOMNsG1r3AGlGmZhVqYmmyTRORlSxM7l2pT46D59Brk8Ao8tNvQVhEqGVvuNi1XNhbwj0RfsgVH7/9AA7ne3R5tE6TJXdnSNGlRGYapsa19puAir7IyMId6OPLt17TJbbnbX9kO9fVxoCiM5wpoW+XGMA7/IfxGN9uCM2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhPAJvqflJaUcXoqde5AafbFOu4p+9VqrV8AFoC+6iQ=;
 b=Ont0oyAkUtP0+8e1jGVxiXK8WvZsgdQA7szMWcCo8rbf1ibeGfTSgK97N/JD4s9tb6Uhq1OxgxqA8SZekyc7tD4T9IA/sAIgnNyHk9kuZEF4C1Q6XYMSjVWDSIbVfb/nxYAjUngGMCxl+CnPbv4O9r9xdNCRapzbwjr4PH3th/I0sj8m+z/knLGi/cINT0u1ktDF84C8DVBQZcsAIvlTxvfT5EEFSJWuEL9zqA8cztPqPExISxhDJYcV1/qhuh/YfowIH2DDx/8l4qDBRZv01fX/eitf3IEBTBE7UUMZKh1VRFvpnCwMNO07VHr1tBrMy1rYkz5gY8QKL4vbFMCI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 04:59:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%8]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 04:59:09 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] rm_work: adjust dependency to make do_rm_work_all depend on do_rm_work
Date: Sun,  4 Dec 2022 20:58:56 -0800
Message-Id: <20221205045856.68662-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: bf59053b-c490-4e8b-a37c-08dad67d718a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jzdqc+U1caKpSZWA//b9p1D96Zmjfb8u0HVOBYcr582yGmwbDNbKs0VUimbK+qz9GfcVKhdczYfC8CPHeY97G0HZ5TGWZiJPYGpYi+z2bXh63G/vcRHuiFY6466qYIBfhRNh+BDirJLvUsHfdjBu5g+TywTUBr1qLhGCuqv7zgyfZAJ0M45v9H8X8Frus+/BAA7E2n81jgfnw8xSjEOwRtXum0oSdFnJ4RMmeSCw0WgV1E99KBW+Hiq4iqwhjpEnOzpDKW6K+ddPDRkitgJm4cZF9Y3iCSIOePPTeuzADCZuy8DzYHkYqAutKtfp81QGba/ob8DC4ukEQjgt8T74ohBue1xKgeIPsB7vf9nDzUQMQJLxMLwUQSrXYSBlaWSFz14MrB88Y+qm4JsOgGnHY16TYi9Oulhw39TB9IlrUkKln9ogvfN6kt3tXwuzco/8Tcn26vUiOcZtRt2vWvjzm7q17tzR9yxf9+Y9cDf0x7Sig3zuAyVP10/YcKPNbnUiI7imrSYuWqGbr/spOdhcJ7hbuWGrvfJshcNcPuVMDvz+2JIaJOKJiSYsVqm9cwvUZw5Ft82DrPiJZ/FjM3Qj4FIH8YTrtczK1D3ITDl4cIRGEqnKSq6vUq78+z1F/95BWCzK2b3xQiUgS8mWCjZyhfhe+7tkTPf66DL0qWSJHFpshH7YMqH5p8xXSADZznPHy4qutYiUZLpEkGoA2cpfDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39850400004)(451199015)(83380400001)(86362001)(38350700002)(38100700002)(2906002)(5660300002)(41300700001)(8936002)(8676002)(52116002)(6512007)(26005)(186003)(6506007)(6666004)(1076003)(316002)(6916009)(2616005)(66946007)(66556008)(66476007)(6486002)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pkwplbPAIpqvAKAETcWBG4ese9Q6z3jc8ULeeZPHNtSJ26zZmK+RH2oiCust?=
 =?us-ascii?Q?7qjzn5egQBunggPHzRG9UbbqXFEvhHMFlL8cCy77TU+bLRkE9dACc4Dz5UwA?=
 =?us-ascii?Q?b60DX/ANF7KDDfG9NwqUUYDsHT1gCynJAjbkCMHGWsPDdD6D/9trROWu8SWH?=
 =?us-ascii?Q?CStng+RK5w9x+giQdcSK/B9Uq9T3wazlzgJolkpNBBLjDhqV4PiUnuJtIg7C?=
 =?us-ascii?Q?HUEvvRaqCAIrJuGVDuYV2zRsnA6rfXkL0rSrUGhTpW03sGtTk9fnJyz3Gh0d?=
 =?us-ascii?Q?T9FPT/EC/xsgZL98OQAY0IrWNpGavj+PJkL2vJ7cV6Y5qFxE4C8ca6RCs0aE?=
 =?us-ascii?Q?axSVX7z2B7253RhJMnNCrbjEcODnWZ3BeHIk3LKLLi5xhI1+UORGLBVYUPer?=
 =?us-ascii?Q?L+C+Dq2QU+7ysClDyFNG6kFQHgkHU0Q9AAu+w8RSyyF+egsPErn0DAqas/VR?=
 =?us-ascii?Q?LPhHhLJonXONcobw06bWRzQlfFERXih9y9DWXHzqhXEG5pE3srMaeRjCFUEj?=
 =?us-ascii?Q?eLtQ0+RkkNxjsnPh1Wh+Po6sF5cV0jFH4y01iqfag+6rafNek/7ENeJQY5xU?=
 =?us-ascii?Q?c2r1AcnSzYDo+CXaShpSibJ/6BdkytqiK2Is8SJuVbDjZmAgz5yUDvfnlAiT?=
 =?us-ascii?Q?vMqkFor01kxirQZoNuv3DOVKZk25QM06vot47GXlWw1fHBi4rgPlkCFnFV46?=
 =?us-ascii?Q?HkJHRCZQTuO5aWvSKSu8okrx/jo/gNdHhj5gvfgSo6+JjxyqOjoMgBeB9yJN?=
 =?us-ascii?Q?cS8QBOuyDy5m6x+a22VvSIDN1nNdT2CHc2E1Pnh/2M7bAan4EA6t3+Gj58W2?=
 =?us-ascii?Q?LzzCI3r2AixHbrss8ugGxEN0Qg23qGRK/oknbpMzTgIU8nZv9zqldl+J0S/Z?=
 =?us-ascii?Q?Z2kEl/i4qmcUQOA+3EZeLgZeClHuJ9bQk4i/M58FGTBRLNwXoQ6EpLm7XQ4e?=
 =?us-ascii?Q?wVp9NTzUO2sIp2sOUpzxytz8lg4DhBDymOTt5CRHEP8JQdYA5kOwf+qf+2kt?=
 =?us-ascii?Q?WYzEfFmxojND5szegNaHckkZnwAGZrFOmdiw7j50iJG+MMouTmgP4UJD4sxy?=
 =?us-ascii?Q?cL3EB4oY6g2QpBFoanoYQIFOnCuSDbIgcOdDs9ZsRPJFaMZ/1X54KweGyM4C?=
 =?us-ascii?Q?29Gly65fIbIsiJ8b234fNJRuSFU2aNUqvpPUr5cUqKkfZGr6D4U5dU8ynrsW?=
 =?us-ascii?Q?euSCj0mXsAogJ6EtrFSYBj1HTWLwu0gTopFK2FWwouvkyqywUbu7DvIGUhGF?=
 =?us-ascii?Q?eHWGCMiNlXZYpH4v2cFBk92ZS2+4hF28A70Di2oNZwe5DLspc78tO4TEW4WL?=
 =?us-ascii?Q?JVHXMPq/hRizof61PTiUvZpmGkuiZU1QFLWWxbnBo7LphuFrzEIeRx0mGusx?=
 =?us-ascii?Q?NgtVJ/7pjRJhWfsVNjduQnVAeFVZiFjsJHhx8pn/YZaSHba+aPiWvmuNBneZ?=
 =?us-ascii?Q?pcyJDCDwC0kJ4zsME3QHna4/1wU6yVxr/B+LdqZU6Ksz9G3A38amBzV4eE/D?=
 =?us-ascii?Q?VgNdgR7AUDCypIqhGwbiPaGVns4bj6Xjw34pBgbMi7f+o+HuOdHpXK3k7Nxd?=
 =?us-ascii?Q?J3QO2csIETYe89FMTK7TjZoW//GsJz5tIBE7Uvn2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf59053b-c490-4e8b-a37c-08dad67d718a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 04:59:09.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m34rp2P3evvrzgcDIUN9Lvv1hp2VHvOvjpajceXOGpPN5bSxZH+/e2XvtO4jEDjQW9uATpME6xaoTFvAmlCPWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
X-Proofpoint-ORIG-GUID: ELmJ7ZdagTnI2pvTk4JPoUBCH8bPMdyc
X-Proofpoint-GUID: ELmJ7ZdagTnI2pvTk4JPoUBCH8bPMdyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=974 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212050026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 04:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174276

For now, if we use rm_work and `bitbake core-image-minimal', some
recipes' WORKDIRs are not cleaned up, e.g., makedevs-native.

Adjust the dependency to make do_rm_work_all depend on do_rm_work
to solve this problem.

Below are the detailed explanation of why this would work.

Without this patch, the dependency chain is like:
[other deps] -> [do_rm_work] -+-> [do_build]
                              |
[do_rm_work_all] -------------+

With this patch, the depedency chain is like:
[other deps] -> [do_rm_work] -> [do_rm_work_all] -> [do_build]

Such dependency chain adjustment fixes the issue because do_rm_work_all
now depends on [other deps] and thus the [depends] of these [other deps].
Take core-image-minimal as an example. Before this adjustment,
do_rm_work_all does not have any relationship with do_rootfs, and we have
do_rootfs[depends] += "makedevs-native:do_populate_sysroot ..."
This essentially prevents 'recrdeptask' setting of do_rm_work_all extend
to makedevs-native. With this patch, the do_rm_work_all now depends
on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all's
recrdeptask could have effect on makedevs-native.

With this patch, all built recipes WORKDIR will be cleaned up with
a few expected exceptions such as kernel and qemu-helper-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 4121a13279..1f28bc7187 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -180,7 +180,7 @@ python inject_rm_work() {
         # other recipes and thus will typically run much later than completion of
         # work in the recipe itself.
         # In practice, addtask() here merely updates the dependencies.
-        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
+        bb.build.addtask('do_rm_work', 'do_rm_work_all do_build', ' '.join(deps), d)
 
     # Always update do_build_without_rm_work dependencies.
     bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
-- 
2.37.1


