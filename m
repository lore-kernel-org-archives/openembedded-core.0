Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80152C4707B
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 04:42:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10339.1704256946450904099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 20:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pmwxnibP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17322eae69=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4034altO013607
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 20:42:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ljWN2b1/gZGHlVCL2I959yHu4F2t3cYAhThwFPTSKrc=; b=
	pmwxnibPEaHK2EJq6tvoyFxU5c8v4u5G7Bi2W23SWsBBlmiPgeLcZjbo6xcXPfAW
	15DGjmjPrApOfafmqnRmAPOHoMBRaMwl37kXiMZ64ff36KVEjqYGDk1OmjdXisaC
	zRtp58pX7fTGIL15Fjq0HfihdIBk1FlFEUMMO5E/GR13nZcIi41BpkbWjUG1hnxC
	ECQC312MGzjiQCKs7KwCNBAYN5SU/oeRKlgbxb6prRN5Dx+YVvUDu2BXfXvrX2pX
	rT/WMjF5526Bn4pjM982WO2z7ai6Tcsw3ZhBEjka4CSzZwF0tD2lZb3shSE0blaJ
	g4ivehTlgG9tj01/XkVfow==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkkub69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 20:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvJQY3j/kx9hsrWvanzjBTMXIrNzhPSBDN5ahJAe/vuXPZoz4lzI7YPjtechOl1SaEYoWscVrM3qc48bdcOOrSQlM+kRvMJZTGE1KSuQsCxQd+M3nrO+9vqFnjF3Nkb5Tb3T6KJF/xGYwr7I+MOMIn2hkbVlUhqcZmIhh8ZHqI1AdV0nJzNwNGLzxu8gP8AE4Op9BJruwFM/BSaWAmwuL47bWWZgFHWv/bcJxq1SOrPIcbZCE9HFiJg2traWtquy3qWVyEwFKz62O6MbSArWzdzYjQUfvgxwFNW6NWCnSRqotTWiX+lfP6tY4DrE4BTABr0ItyMqjQNcpWj5b/ANfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljWN2b1/gZGHlVCL2I959yHu4F2t3cYAhThwFPTSKrc=;
 b=XalLs3VnzTJS7MIExRaWbJ6eNXRotQ+jE1TMcJuTzw3idVvub5+uAE5fmuB9Wt1mOaGK1r0aDjioIR82+eqfB/AsOSr3IUjYB+zlyAmZn6mlK3iiYVETfC43GlOUVx/4sb+LKyL6vJmKlNBZxSPAkqmvGm1/V4x+HAeKpodwrhJm4mdUvYEP3Fb4IO1h3KSfheh4g012v8oMuq048Ykug3IqD8OqwCQ6RNK6qhDaDFoWBcvVdBHOQsL5Wy4dy/pt7bKXiNlb2zYqOvqq5hSsdHJ+JfHDBDnoj7MagBOUD8toUixjYtKb0ArSqLcwhD41BS77u13l6Ak9yWdkaicHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 04:42:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 04:42:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] dbus-wait: bump srcrev
Date: Wed,  3 Jan 2024 12:42:07 +0800
Message-Id: <20240103044208.2304438-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103044208.2304438-1-Qi.Chen@windriver.com>
References: <20240103044208.2304438-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 761307a2-3ddd-49be-c62e-08dc0c1660dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MtrNkQqfSV14tFFjbfUjQzSqGOfFplOJdMIyr4Pr+WehTpxcGozK0AgD0gMLCaFh96F5pFfOpLddxpv8ydUDJ+dm1rCfbNPTsMi081klbGXJjMBtwOXt2v71dNCSnlStnz1ZZHiAqfe733V5Nkqkry5wnFhX/doiCQJ4ZMSMUgoMR9FQ9tJldD3xMPQGVwxJ1ENkORy/fEVJHtl0d1jwAs3HcGUqJY/HuQaUtXIlJGp4MrVUQOD3FwNdCKl4hAHzzDqPBh3eHYFbN16bTfO/jP+9MFic3VBYVnZzqW/bdkrzhsZ6yrKHfazSPkFphbM7RbDQQcAq+Xgu9UpFsX20CQPO22LrIeVcNABUbbtUcf1hiK0wWBOoCkOO+R3l8A93R4SGlxjaDr1rWkuERpid0bofExZyWdIMEgaUtDmcHu/rpOWtrOloODAYThK2AeKCc/eVjLHUFO7DzsQqjM5sFtBwTrOmDuUZQdYcvEGi1SJps2touWz3XB7Zt+84yhGUo/3TOO1aueDojBTEM1ZM3+GeQk9OYwMiu6RD85lltyCw6R+hkVwMFrEhxvKyUAeAFZkK9CRnIXU+LNHlHTM4qIrX0hZOHv8GP/99aYhnFrC0NaYn7lyYDB5FuNZnFeM2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(366004)(396003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(8676002)(8936002)(83380400001)(38100700002)(26005)(4744005)(5660300002)(1076003)(38350700005)(2616005)(478600001)(52116002)(6666004)(6506007)(6486002)(9686003)(6512007)(41300700001)(36756003)(66946007)(66476007)(6916009)(86362001)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DmXtBWLdmKsPOZZBRrf746aS2VYSpHltWkP24k/3bLB3mQaCGfgygle6O2Dz?=
 =?us-ascii?Q?62CHa3zn/cmnXxGyINUuhD6bXOKkOhvnCMlRLCWyZtUxLnrek9yqzedU5g0W?=
 =?us-ascii?Q?F7MvWC40UIpIwTbxjhPc4vuGb4072dMMUw1g1AXoy4xHkYv0lkhfDFn6f4cD?=
 =?us-ascii?Q?J8QucfVlDy+SSFK6j7o248F0i51lOuenhUjpOK5s2M5Nzev4+bPUDAsPviYr?=
 =?us-ascii?Q?cDqKTwGZ1TFYZREcuaWYPHJioItvzXSQ28xVgo/jQHgVzOUD853hevkfBkey?=
 =?us-ascii?Q?A0i1swRM0s7fslml8rqeVF1O5NNvD4qhZri2IKUAnRbJ93O3xgtUva6u9hyQ?=
 =?us-ascii?Q?+DH4H4UcsgsQ7UYGlUEP3ClkqCP2bQ5iiTv7phUv+gJYesmV9ZudXORdfdpe?=
 =?us-ascii?Q?kYfWwE3HQGW0FSn7R5AD+o6qktMsaa9Iu9Ra5fmItTWkfZeTCkdEqTtw7WCE?=
 =?us-ascii?Q?vD+iHf2A4hBTQ5SSibCAJbMuvzmfVW+NwoE35GQYSi62GjmIZBD4GIn0nLhZ?=
 =?us-ascii?Q?zixm6OYjGCvmSxR47Ss5dOfcaqBBIVqjSEvVgTJzHBCSHj5YpK3HrPl0YSiP?=
 =?us-ascii?Q?tFUNrpWRal8veyYrERWHTDThII1OGUKHI9js3TrTvpuvzpPPZ3mjzVNRvAsd?=
 =?us-ascii?Q?O41Q2pC0P7u3bvwHW0d4x4bcScl+lDDB5lGd5yzUdJyHxhdWvQWeIeL994z8?=
 =?us-ascii?Q?ucvd34KxWOVuI10lLm4orvpxjFwPmbdLlau+LaQzuDwr45iYeNdTTDwaM7tc?=
 =?us-ascii?Q?eHcWWGGnNGNCpXTux4pAn0vHR9GSCn52aXwupNNS5tBSrhoyafajhvJuy/jB?=
 =?us-ascii?Q?QiC27DTgEuaYclF7n7O6eF0hbTt8cAAewdZe7rlDHqNXqoboMViJZRfP4BlE?=
 =?us-ascii?Q?9AtbzB9fJM0MnS+QWWQbgwEAPjfv3KuE1jBGuS4Sjk/qwicXXmWrDYLZ6Qmx?=
 =?us-ascii?Q?0YBwy6TONzVtxgX5QPo9VlvZ2/RiHZGvnumPjZvaQL7yxMc1P1eTy8X9oYqy?=
 =?us-ascii?Q?oPOo4B/GgMWNi/0TVLQo/GeiHNmss1AuCTBYUrp7Y3+XD/UBx0ZocW2T5hai?=
 =?us-ascii?Q?iOkqP5j1eUUTPBVmBegpbHWp9gIZ6XL+L8ynJDPUdZLPLo912zPPJ6bEpUh9?=
 =?us-ascii?Q?c/64sKvWOIbw+TBZQ0JDi/ryslI5sVa0bC9q3WzyEjY5NTMhDv5Ox+vNbgsv?=
 =?us-ascii?Q?wseElhYdO1l7+fwBNSZ7C8iMgQTPOp1iOCKb3wggmCQSGcvM+RvW2ze28uQR?=
 =?us-ascii?Q?I3SxGkZQmXFasTkvOhmY6tlUqBKeugBzy5asf6gJMnnuy6cwkFbSK1VjsV08?=
 =?us-ascii?Q?vltxTh9xje8qtldGHeKpyXAIpH4so8VMdTTawOYSsuEXH7PkFSG3nSlHjBaY?=
 =?us-ascii?Q?ezeXX/3u7Klc5FZb8F9A9K28AjvL94UAgUN6OMDcbLxFYfGkdIu1EH1NbCGw?=
 =?us-ascii?Q?qmnSWCrelF2WbWpapcdh0H0ZrRHRxqtXn3sIu2M2wnOdU5fq8Q9KfHRQBlL9?=
 =?us-ascii?Q?B88dWTzl3geMMQ6wLGQkauauar5PeKtqw9/C5mOQORNVI10b1vzohRptJoEE?=
 =?us-ascii?Q?KxE6w1vkzzr0MCY1jezohj2RmEoKMv0dsgTpFrFh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761307a2-3ddd-49be-c62e-08dc0c1660dc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 04:42:23.5844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VI9R8Qf8reTTa2gLZcFwI79oiipouyc9PFGCgGS1k3watvi1sIpbigE48lmU+T6tZfeh+88fyecF+pn8vCxDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-Proofpoint-GUID: inPlGZ_nEsbCi8P9rX5R6lFCBw7y188h
X-Proofpoint-ORIG-GUID: inPlGZ_nEsbCi8P9rX5R6lFCBw7y188h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=576
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 04:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193269

From: Chen Qi <Qi.Chen@windriver.com>

This upgrade only includes one new commit:
64bc7c8 SECURITY.md: Add file

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 1cdf07d03d..39363b9b3a 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
 
-SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
+SRCREV = "64bc7c8fae61ded0c4e555aa775911f84c56e438"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-- 
2.34.1


