Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB5C43217
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 17:21:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.245.1642008062375206296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hNQppaM5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=801136dcde=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20CGf8xP027783
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=mybti3GnvXs+GiDwYG3gmRgeurEeCTP+xcqcOMZuwQI=;
 b=hNQppaM5beyrpKu8zZdAMXIHHonfuoAYahlcfk6PwKEiG/DJeztbUHPQ/QXbqU1rQKtn
 XMA+jlqOqdWV6Dz9dCrocaQWqvsugTO5kB5W6FT1KEemcmSxS3E/Rvwi6eQp7ummkfwM
 qo1ltX4PxHyCHdZVMiOORLZ4GjnJ+KnaY65xiunSLd8mC5qm7a4PologTs6tJ6dDInXn
 yPlWjV966MypMPGzEklLkLSGgSdc08VM9qcW+zZ1AQpNwUviakncvw9gdLwH2BRzyy93
 3c4jr+5p6Jjn/15kPTakmvQZdhsTj5dHx2sV5/ckmTSekk4gjHrClF/5g4IvAhP6N4Kz tA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy0786nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:00 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20CHL0Ti026388
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:00 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy0786nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 09:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyISRH1qh0gANip9OW1OaE3ND9/wzsMaw57Q9jgAc1JGfSALKjBKSHOUcdkqCsX49idor1lB1h8KocvPQ8opzBpfjjkoKN4oDLLZwmZB+NxjLQMta1hqX45FSEf8UBAyDEIG7Vxv2H9wcQAjZzdCzFDtrZff+/hA6JwT32Xom8l7cAEQLySzEPsd/ClgKH6C6MLojjR5d9WbEkAZDpYuji6KHhMOFBLAaKtiWs3Tq5osjyn+pmL4BthPS2Ypr41M9/fSjJE3CHh3gi+kuC+r+Rgj8F3uoPdII6/s5COp7DUAmu/42Qp1DBmoBqtKnptw3Nl0QO6b0D0ds+HhPHbUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mybti3GnvXs+GiDwYG3gmRgeurEeCTP+xcqcOMZuwQI=;
 b=NcrIaA4IUTSA8XDf/j/XH/tURYTCpoUsKR3W6gI2sSNj5HlcfdPWcHkXcTT7sXAXUO29NgVH+waxRVgpRZSMsCaNpboa7PZORQOlPK5ZP5SLD4gwQaR7JHEwlDAsd4G22ukg3UwpyHQ248X1t0+R4aH+5bLHeNmCMK1XRRpUCzUT+BSzC7dFG1nStGSZmQkxaa+XSbl6r3P6+d5MIHtTCs8/35XLt4dx4vm90sCWJK+AuvHmDYEW+SWWDs+CSEhWUbILveHSn4q28TjFdGkW3jTeySNTV5bYCCZgEm/Ol4DGzI0oDq90LpOa5abkMj6Mv2j2ikmTK6TCSnh0oDnNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 17:20:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.011; Wed, 12 Jan 2022
 17:20:58 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/3] create-spdx: Add kernel work-shared source
Date: Wed, 12 Jan 2022 09:20:39 -0800
Message-Id: <20220112172041.143485-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112172041.143485-1-saul.wold@windriver.com>
References: <20220112172041.143485-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3de86ce-597b-4376-af4f-08d9d5efe5be
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42263D8B6E623DAD9847CEDCEE529@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CyWWjWR19/h6lgcXSQ8yqHPDODt9+HFvMtJfuVXeemMDoRx96Vs1tTdpjFx/idsJoQQKVDYUihxDDBd1md/zFdLW0Ku+aX0mmShfKc/SBA/ZElm5N8EO1HRoFVOQZa408dhU6nalGJnQHUoWm7zDqYPeiIbVFZzFQEzVut08SJNjEqjaqqonq+Nf26bVkUX3pgZvdd/yHZyA+TrntoyF+GrhN15QHvaOjWy2g9iUHm9JaVzXPjgEwXyr/OinSa6/3KO1HHa85+HWo+bRplu3bk55LO3nPBO4l1GkXi5eVvarfvnpgthQfIDi2u0ZiPAOzxK/uYfM32gYXl0ASCnoUz2QLnt5FwymNDNu0e7rgTcEwRYVtYOv7NRYdgEtJdhov5y34d380I6AFPydaSQ+juBFFTOCl4ZbzLmYCZ3EP3AnSQtHOh7JIiIWBg4fE9icSdzSGnBtaExVpANSY/DUgmBhHcom2I2h2WHe98wq8tSTUAhcI/Pu4xMS+yi+ZmWReluknlulGxwgE4usNylzc6UHSuKLBPrg3qlTuXcIX8PnVl2swDMlhbvoKLc+yc7fKQPaylJ365KaZSFWMDkzcGBbUhYa5kennxbd9oCJ+EvYpXmWpjg2zO+D+OwEDNTeLV9RJJDe9DlgGZNbC98XuODomUfR2pSbv+1sMQtPjJlSpFgHzxJ1+gBN1xRib1/oYQ26XzfMWotzbZzOICxGXw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2906002)(316002)(6666004)(8676002)(66946007)(1076003)(66556008)(66476007)(36756003)(86362001)(186003)(107886003)(6506007)(6512007)(38350700002)(38100700002)(52116002)(2616005)(44832011)(83380400001)(26005)(6486002)(508600001)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?owNlY05rQYP00r/Zu/njBA2em8zXp6qNbuxMgWldyq78mq4aJzIGfJZt6ENz?=
 =?us-ascii?Q?QqJR+hj71ohUB7ExRvcSBu64TwTllJ6QKtN+v+piHPR2of26mVLDWfCFoSHV?=
 =?us-ascii?Q?UQjq5fobs/I5IfLpTmGK/fMjK3ZU2Bdtr2AlaRzx/At2iDz+fjiCHbNpaKbQ?=
 =?us-ascii?Q?0bX0WaUHFn1EhTBTybj72NluSL50oo3eb9WO0J3C23FpyG7hCmS/xMa0S1zb?=
 =?us-ascii?Q?EZ9SWqYrIOWayKsySGwp1S3oWE7EyN3yDzMPuxxow3O5MTJC8TGBXRI3w6Ga?=
 =?us-ascii?Q?A4ho00gefTgpdvQecw2yKYeavjX+WsmdJEJ99cfUlFPDRFlo8wA/58xbBCYB?=
 =?us-ascii?Q?f59O30Sm8kADhi4nUELFCEYOW+Xpr60VJ2fxHJdN64AsrDtjsj/4+sfiutCN?=
 =?us-ascii?Q?Ktonjn9NZUaDvP7WkK8BT6OwepJ3AD9rBLqj+nEDgekygtnWUbHiWKRWm/cW?=
 =?us-ascii?Q?ccd28rjAQl9WV9rYlajtsId8MMjYmWnOXx9q6gg8bMgapRgR8/VxvW4X3/ok?=
 =?us-ascii?Q?PBbK8f0oqxxCZFT2YTp20hM4o5X1PkNKigstVVT1D3kHm/V1pGq1O1gfyG4N?=
 =?us-ascii?Q?9L9Jmj4DajB4N1gZkUATptjFFuiGh6lUoFBakX6pXsouXfICqmG9mJdgC/8C?=
 =?us-ascii?Q?pKUOXXQYM1LEZ8tvOF4yy3J1lV79PeDH9TU4192FbLXZNVMsLOsvHUBKjHsB?=
 =?us-ascii?Q?mcgCPPsWo1ELIxBM5Ee29vWhW7CKa/cOxrCrH5ealY2OIK96MKXBRwnko3dL?=
 =?us-ascii?Q?xrtFbmY3/NP9uePE+pLVuhH6TZHbjOqVm+92nlR9X+reYOGzXil8zaGJPXdL?=
 =?us-ascii?Q?EORdO/b1UwMeR9A1wXNLRi/SsrQJueDuBeELZWXsaYfDgxRznvOIDoiYRpkl?=
 =?us-ascii?Q?KQkWtLElR4pXIJ5CIdT2LxrDgmGDMG/+KGUordz5BLKD2/MqaZU9iWxQlR6a?=
 =?us-ascii?Q?Kyg/36JAeSzBof0nRZv553oex5RTECi0NDjzpmTE1COmfPcQwyBvu55kov97?=
 =?us-ascii?Q?a2fIy/cYeORLdJPcuVU7T1UuvcCwmL4kLTk4ld7G7M+92lUIIN4leNGmDFxs?=
 =?us-ascii?Q?7S9GHV1NSYzZc7OVh7bTfVDaIFCoDQk5PCpm2p4QRiRNlX4fjYitJCpVQfZ5?=
 =?us-ascii?Q?gtW2cGtF8V7qlUBD83VXdAd8d/HmbszHzDh20VY1jTTg+zLP6+czhD9DhqIA?=
 =?us-ascii?Q?xera89cA1AYOSEOmKU2mV+kofMPbVo1Z6hkTziOnsV5/qkczJtikT8ET/byd?=
 =?us-ascii?Q?Sc0vAkvNoVQgSoAfs+PUkQY7ko/ce3ry9IuXKiVSx7+RIrLe2itq4E03/46s?=
 =?us-ascii?Q?NlHYUol8P+HOKdmVzEB2E3zc5bL+1Fz67prvju1QvaD0BOucjMR8ZRKmfge+?=
 =?us-ascii?Q?qpaH4IqJb2r1n5RIikJrYdtUmpHEYJszpJASqp6uRNPMDkb34FmFJyWyBRWP?=
 =?us-ascii?Q?9sNwYRMgnlbGQukKH9foycDK6cv558zBWCcEQwbH/ZkeH3yLiGGPHHvruZ4R?=
 =?us-ascii?Q?urCXhtpCTb/cslKtP/rigecxOSK/wifWhozUG2MEfP3wjGVKOPQHPkdz2hYt?=
 =?us-ascii?Q?SskjkkmzjKK7QqR6QEpya3e4lCFxX+60hI+e/ywuywyxjGDP4QEDDx+++PhU?=
 =?us-ascii?Q?RwCRt7QgQ9yRIdQYEcYMlYc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3de86ce-597b-4376-af4f-08d9d5efe5be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 17:20:58.0370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4lSnxt317XrCN4GaMf+PdjzEoFXpHrsPK99ADzMp5VIPe6sca9pKUtIy6pvwQ9nqFBSSxZi7aP2kbNlpCXx8ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
X-Proofpoint-GUID: xflWD4oQ1sLQD1MIg0XWGmiWKH884SE2
X-Proofpoint-ORIG-GUID: O-UdgdJLGDh3y--jNvhTlV5ESAqiuaKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=870 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160495

Since the kernel source is stored in work-shared, we need to add it
to the search path so the kernel and kernel-modules source code can
be found correctly.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 0a4db80aba5..e1ff2bbb787 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -254,6 +254,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
         Path(d.getVar('PKGD')),
         Path(d.getVar('STAGING_DIR_TARGET')),
         Path(d.getVar('STAGING_DIR_NATIVE')),
+        Path(d.getVar('STAGING_KERNEL_DIR')),
     ]
 
     pkg_data = oe.packagedata.read_subpkgdata_extended(package, d)
@@ -275,7 +276,10 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
         for debugsrc in file_data["debugsrc"]:
             ref_id = "NOASSERTION"
             for search in debug_search_paths:
-                debugsrc_path = search / debugsrc.lstrip("/")
+                if debugsrc.startswith("/usr/src/kernel"):
+                    debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
+                else:
+                    debugsrc_path = search / debugsrc.lstrip("/")
                 if not debugsrc_path.exists():
                     continue
 
-- 
2.31.1


