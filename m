Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5839DC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 03:59:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2212.1650945575093926100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JGt8kJjO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1115f13a8e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q3rCeY000968
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:59:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=FlUVivGRdKOrnm+vpbQZE8QvwRuoDP4aiaFxhxOVoa4=;
 b=JGt8kJjOMlKVkg86l3Jb4K1gaZMDynJnPbDnoOsqw4TxA7g0APgQkEvOyj9lJYEKSEm0
 4uoAhEtfRCSekIwKQx770o2nocLgjbO1ERRG7lQqxaWPGq1SptP7C5ZR5hDB+ChBI3Cc
 q4YmA0XNQrRFnkKNlSOCd3HOiR6BshKBa9o+7msBdoJRb+qKn9VUQVOBR86q0eeNHk4q
 dW+ZuvARS0h6SpaaJl20K8KefyRgJDE9P1Exrh+rx065RgWKAk7xnO1gaS17eJqBOwXV
 3pvy5YSVA43mJwRqVDh/MCnEjUweplrpOGWM4wWOtkBnoFsE7ADZulmvekuHBZXCj4OT aw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr49yvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E293iSZvkoGHc30uBHtWzPkqc/cWCkmoKeLnjK2CuoQgjlfzbYeUhVlp/HAMh9zNTFQ9xzUczq92DWH7QNgY6ngBCwGRBN/YcR1lzIlwFbaf/KHd4xf39rGcCet3eEGom4yUsjMpOr68mz9rm3lcZQRONc2xc/Fc1NDjFysVMHS4h7RB1Z9KLRcchCt30JrnleZGmfb4KNPqILTf6Z/LXE4mu/Jiy+pEMT1dYQMqXyJqsK7jdLqQ1qYVyo/kQI7docFWr+f6ngnYNQ4Hq4mCjKXvm5Oxrj9AI4livxPao8vcwdpn7aUEzG9o0+Ytzqx2Jgqaq0kZOVczQDfj0WRpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlUVivGRdKOrnm+vpbQZE8QvwRuoDP4aiaFxhxOVoa4=;
 b=T+4O5LbUEZLaOiZD/BNdFIadwmK5fB0OWXF7kCFJWKZtO9nFfbX67bOdd3aKFcY+6xZoIbXOzk02Fj2jSmLohZeFru0RKld7x4Qz1RVk0NX1vohMdV0wFYUnp8lOVPriJxuuyXPx6dTDDVomq05fuyB3jNoHzi/EwOOmVk6nivdkVDSZiDyrfk3xHXkxO50U4W63ahRl6VbRIHGhhgjC+HvL6dA6GslXiLR26NRu+3a3q/s2tVA8lHg/IK7EFZsNc2nm37QKY9aI1t/06/do0VPoQflmlGyZCQ2DN5PTiVeOsjuZzMFJa29juj0lOdhglPNQb85uQYPbmNG+7uY+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 03:59:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 03:59:31 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH 1/2] cases/buildepoxy.py: fix typo
Date: Tue, 26 Apr 2022 11:59:08 +0800
Message-Id: <20220426035909.26021-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a47b0d0d-7a28-46ac-dfbe-08da27392a7f
X-MS-TrafficTypeDiagnostic: MW3PR11MB4538:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4538A05E30FB03A296016196EDFB9@MW3PR11MB4538.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vJ0WOGBi5XEyESBVeqQwm8T+6dM7y7VlCFimY3NvI5+ON/kgleFfuh4f8EcgJqDlc+GxvgLbh3+yhULKyhih9R0YzVyQ5cg04yQWLnTa9SbCwkltRzlDN3m9d9ZiStgpfM+wk5Ut3pgBIAk4G02eHiWRvDEUZkcwqnxyE6RVrk/j0wXEYWfxsnXN6u4ItxK2+EBVGdewO/aWAkxs3NUCr+AP1CQKtmjGYDnqaqbDDSt2tYG/jKs61xtwFkdwaqog7I6ooYPntM89Bw9XaPepyE43UzXv1DD7t5LAHMnlXVoEa3EAq295+1liCYZpe2QQz+ltjRwZfGPtOQjBm09MAW6u7U8uqcMkJ0yskj6vXM/6anhkPGb2G/9Z0lQbI/vClrOnK46GLPHTOMcWkVK6cIeWg04N5d3KEPGKz6LwtBUpr0Gv3zDpJzrx0WdG1sSHVh/gfPg3TPc639WHjUA8iLXYE8xcGBKiwIXt4Wn54o/5awVmtZwdBGVZxqFRriS7gYw8DU+W3APPqr0j8VETrd8KDiQ4UEHgfkSEgQeK9l2a1yQsAOkNO76onArLcxLQ7dq8uICWjbFUYAI0P2Ka1d7ZZipVJSl9LJj6UdRThBXuqWNEXKpgWOosgFvz0d+NW2WAoBColgdXPZvEpIdNH1O5CrU9yaVIG/3LYwCpJ8Gkw4sKRXDIz03ZyiVvU8rtm4lw4m8TFCFVfkIuEauARA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(36756003)(52116002)(6486002)(66946007)(66556008)(66476007)(316002)(6916009)(8676002)(86362001)(2616005)(6666004)(8936002)(4744005)(508600001)(186003)(1076003)(38350700002)(38100700002)(2906002)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YuIgrdL99USA6EKylUv0j3LG2piJJ/FsAu+caYe0mlEdh4A3wYyk8wLDMXRy?=
 =?us-ascii?Q?ZV6cCUYFJ0GHbF6qW0pe2gGVo28myYvZg5wqSF8SdW0twRnzPO/ootGIxEks?=
 =?us-ascii?Q?CAo4N8DSvRUPs6mwTbSkj54xNVjGwrwAkaa/MMd/tgMjgKZpl/fOBJn61Ptj?=
 =?us-ascii?Q?ipnPUHKgd3PAUYMrYwINO1usNA/WlKzV2PsxD0J0f0A9aZcj4QOfLZH2gpZ1?=
 =?us-ascii?Q?+vydKgviU5zF19WOC2eDwxsAuvmK2LBg7ZSsAS6jawBxVfj8yTt5idpENpvD?=
 =?us-ascii?Q?ceOvHCvfnHneQ99YGioAeu9/0JnhK544Q8W4lvvTMTz6YyFTPi9lAFl/i6CN?=
 =?us-ascii?Q?+wtzuH6xs67b1pK1ruSyRn8u7YBZtb4thlf/u5/8jRaR2vuOmdZbN8YUeHU2?=
 =?us-ascii?Q?v0I4YCwXn18s89lNt+XTvY4uRVN3iT5C6tYCa6TjiNFGJzWeSSbhr+y8NnvS?=
 =?us-ascii?Q?Bi/5pZcM1lTgTNrvbHvP0Ry2mQ7RP/lNcxdNRHeVHjirUOdKRnLtV/qO+8eR?=
 =?us-ascii?Q?Q5AI9uALNh7th8zfOTPMoZln88KbPXnInYXRzGLi2ym27t1WocKPdWYF7uDD?=
 =?us-ascii?Q?NfnisSEtxt2f2SwowgFx4p3VWT4OeBqQjEG1LGjpbSd3tl1pcjDTkU4gDccs?=
 =?us-ascii?Q?5aLms19zNqC+EmdJDCqZKy6MB7KhicOK8Mcf8zJqgtVzUSgRcLK8Fme4q7fy?=
 =?us-ascii?Q?dtBF1xf9NOU5f7aZM+hSrjUjV27a+mQux+lrOIgcbeabWze//szKP9MFv2+8?=
 =?us-ascii?Q?2QjD+ie5+iqazja8RflaYc+8v67/6WHBlr+gJ/i2PxKW6tfbRjGwuhmWKudV?=
 =?us-ascii?Q?uFnLCdOFuKfhEqp5YEQttbOTZrCWoAp+ln86Y6fNbhzuK6DnEZfpRJZNVB2l?=
 =?us-ascii?Q?T+NNUhMTztCXFZDR58HZh3VkrdmDhFsJjKA3XoRbkv1VEfuouPD2pU0RZOpb?=
 =?us-ascii?Q?mvD9qXe2kUimAmfln039uUV5lB+l+P+19By7vSK9XwFrCj/PWAAD8kAeSxev?=
 =?us-ascii?Q?eWrjFAHBTVMo8VcoGmXrNt2D+91EOyF9e0hH6oFtvXjFvZyCSAWZvb8TFfDi?=
 =?us-ascii?Q?0dD60t/+wjd79mTKGLlzK5JHHtLYjX2+xNBxsz9uCYOyL3O98auFfrB48a4n?=
 =?us-ascii?Q?7ltmcT0QfgdKN3PVDjz7D+ak4I046bY7uLQ17t9e7v9ItXTlym6MKJA5yyfA?=
 =?us-ascii?Q?9qmKG9jnrBt1Z/eApiEnCxbOmdMtkjbjZaLORICJFpFRZEytnoGFFMb85amR?=
 =?us-ascii?Q?792ak5CpLFp+gau5LWdzZIqc7idcb6d3bllxJI6iRnB2t0jiA4BySpjlu4sO?=
 =?us-ascii?Q?sGW+LG2Rdc66MLmqkBNRygu8UIyBTuthDWEfNloWwF/eKHnBUJFAGGZ9Z9g+?=
 =?us-ascii?Q?MnvqSEDOMOPwV/1VjBS7Isp7F3yfA8JD5hsZL1uAhUIBYg+QV10zmU7cmO4u?=
 =?us-ascii?Q?tvq1AfY0qlrME3BiIdBLv9Ph1y17d39QInIELeA3vuJhH+Qo/dkjsODiOMUC?=
 =?us-ascii?Q?aYTkDIakQI5BgceESADaoU2eTOw8aBWWPHvBF0AbMllbaFAdBhRjuwWQ/3fi?=
 =?us-ascii?Q?qSFAcBmflIv+KVrJNRiKpumA52naErgQcyKJwpwzCssL/pIIp7EQRxjg/ww1?=
 =?us-ascii?Q?GfPKr0ya4AsVxeQekiJx1j8MQjFB1wbvPhLYZpzT/b//tJFMFGdDDUADDGHW?=
 =?us-ascii?Q?GuOMd3vt1COAOSsCwoLIFn+Brs8hHpFhY1m74kkZLJpGrx+x5emO8uOnAzxz?=
 =?us-ascii?Q?V01K1xI7ivjwEhunF1JGQFGLrJc/n9I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a47b0d0d-7a28-46ac-dfbe-08da27392a7f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 03:59:30.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a4S4EhE7xtcnomfiAW7pF9/M13duLe786ftJgROASEFQ3efrErPKm1kiAqtlw8THx6+IMZRpKToxgx45OgZEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-Proofpoint-GUID: 3HuIkYQguwKPRGQoeU43nwJHA4ZQjPgD
X-Proofpoint-ORIG-GUID: 3HuIkYQguwKPRGQoeU43nwJHA4ZQjPgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_01,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=644 phishscore=0 clxscore=1011 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 03:59:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164857

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 385f8ccca8..f69f720cd6 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -17,7 +17,7 @@ class EpoxyTest(OESDKTestCase):
     """
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-meson")):
-            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain Meson")
+            raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
 
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix="epoxy", dir=self.tc.sdk_dir) as testdir:
-- 
2.17.1


