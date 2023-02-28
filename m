Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19B0C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 06:15:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17498.1677564948443839457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 22:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=avYghN2f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1423c41bfa=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S66pek007882
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:15:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=QqBHkd9drRPNzKh2cDfs5K3chZ0l4alqMFB+XYkddnI=;
 b=avYghN2fRINYjLNZHCQ7Yo+UU1ZWBhNC0AedtNyqhZnoxQD9jYbNYrMkdnBuXHYGi3nB
 9a97rSU2lU3qH6UU8FO1pATP1JyiJm+rcwvnMX+onvt6RRXIHVHDRcgsIBUJbuTz/B41
 nG4HuKjJyxmhohIX5ZCFu2QN6t/hnP3vBegAxN3mwxfAbwzCp22RHPePeLI/5EfkQcA/
 G5JVB9kUqComIkcZ5zY+DR1VpSAUqFxvQtgSIj3LrUq5+DoVwXkh3YPT38lrfE5I5l2X
 ZQ71BYl+egqz8QQP7DM9QeVa7ZA5sd5qdM71ovjngwtxg11uq/nN+zymrtu8r6xSXjfK DA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqradct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:15:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGRL+6k/eidNDBga8vDDRa0h6EapimQQnNxl/E6REwhFGRNEPhT7YkzDHxwRw5X6JvZ42+cjcNGUXqxlWGr95j7JON+G1v0SP5Pmu/OKP0n0XRzb+dlxEUifk/LoNXzlF3s5u4l5l8XucY4JSDLy3hVgAgRA96uVfjhsQ0so8g/RXHKpVFjscRbQAz8bj7kSOOki5TWFLcsEge/LpVHCiCqS6fiftCI3V4dQkmxqqB7u2H7JEVzhO3ePZ3NRhommTlTDcgltc436m7h4JK86bGIS/Xz+obADgXYpuCJWYyGLjW9fe0+OViKeDMpEzy/OZe0BXmtqg/yzOYr0VXnPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqBHkd9drRPNzKh2cDfs5K3chZ0l4alqMFB+XYkddnI=;
 b=nqa82mGuipu5yV6WQsZMTyuZXWpQXbVy1krDrM9mZjiKyhik7BjnZoPAMztAtrJZoG+7jJeP+HTySpCMhg2h3M4CnDE1FtP2rM9NTHPyZKHRM5EP4ujtd7FU0SBLBijtip2R7jMgQ8JhGMXb2FXpRvyPo0MaIbdOGJW2Lnb4kAOTNUf7WCUUdtqPO3eobhkPL3Rz2bmdjp10zGMxgP4G5gd1+tquS4JmQ5aJSLHDjHJiWWimW582PtmLSQ1rg27VyO47dkW0iCm/wyFgNI1XzMz98NyfaWpkINzt3y9IeK0ggRWjvw3xZFGJ/vE+H0T81RNe+TVMvGFIj+5GiMr2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5396.namprd11.prod.outlook.com (2603:10b6:610:bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 06:15:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6134.021; Tue, 28 Feb 2023
 06:15:45 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gpgme: fix python setuptools invalid version issue
Date: Tue, 28 Feb 2023 14:15:33 +0800
Message-Id: <20230228061533.21075-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ce9f99-12ff-4ee4-3b6a-08db19533a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TsCTZ8lBzm1eAlR0MmNf6oo3NWqVxq26/eE+bP/JzLtYMSaPn6uOY62QNCs9P80Fbvm4xvw3Q0G5GwuhL+dMf8qTbxqxLdYt4Dn8TEr6IZXaFkrDRJAmhS8vX35QRVhMcGMaL1MzQHfzemKCpU0FO1l9syQZsDn7Bp/559KfbKSNG7K+m4oqUi4XwHqEj6gjZwvgtoJmwGpnbXuYyF1Ghih4KoYdZrpKT883nqVZEw6KP3Q0z/Ce4D90aYSys2sav3hBSqPyGsaWpubP7nEpkRaf15+LtDNeWMs4mDtDRQjczwhso7wj/DJw0JuzYASLFrUtsTVzf+zlevQjFJJacaO5RIVzeAO23nXqE3NhkFZZzYdx8q5rSi069GQXVwagM00lrP7KyYSwszevnLDzTH7pmo0CwmnpF10JOQefQNG41fjkhLFAMm0FcNsCBJT4PJ6GhN/0Y7maSjwXCLyZxDsebvxhinZfo3R/U5vai7r2GXYmNXr0GHScrtPc2raXJsl4la6tjOtg1PZNzlXReLdm2IFILQFJNMoLNS3AIRSFsX4FLakHPmYpIxexh+DfEFXg5aspchlp0vHZcQvB9qZJoMpHps0dKqeo3wTxOGfOQkd8C/Cvyz5Iaij0Sn9VheHzjaIeIAJHSw6MjRxFt9NnMzcowYVysWLVs7IHhZZMUs3dOv34vmNm/oKRbbSlBfU4/uufv9NMn2BFRR202Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(451199018)(316002)(36756003)(86362001)(38350700002)(38100700002)(1076003)(83380400001)(6666004)(6506007)(26005)(2616005)(6512007)(186003)(8936002)(5660300002)(52116002)(2906002)(478600001)(6486002)(41300700001)(6916009)(8676002)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9EXpY0VJ9Bu2rzFOLfVSWFsPSHMi4E/8mmYsPSvIDnd63xjYiVACEnfQUTjZ?=
 =?us-ascii?Q?jSyT9VnmF6hPLVNrHQImorRk2RxzDDyVdN/hEYmeL9lYdHunchqfUECx+EaM?=
 =?us-ascii?Q?JU/4m0B6ZrgDLeipjy0LMjuiRP5riWIVavKFsHlaxNHhDGf828s0pA8ZSVuq?=
 =?us-ascii?Q?DxcHpmZ5oy6fY/ebIZBydU86gN9H2KQJfg5y95gYvEFcdeZ46WVadipYxBEb?=
 =?us-ascii?Q?/YbwhItBHzbgZq7SlTow933F+cw4z/5c04Mrag8Ze7aubtQXRO3+Vul1zzKT?=
 =?us-ascii?Q?t9bblNOaDSmDfB0xwZir7Nq+1u8aqWez6KGY9rk7G2u2z38HB+3mDzT83Fii?=
 =?us-ascii?Q?JalE9h02AxHsr/A41vPcvNfQYj/MGsYCK39e9sXkWBCGI+LZeAzeXq+p+c1w?=
 =?us-ascii?Q?xJHUf4kBHV3RzfC2Be9R87knHskwYYKWOv/VVs1ZzFzFHnND/HirIgzihoPe?=
 =?us-ascii?Q?oO6W+PQqrwldow0HvCNreesjwQNFNEaXlXyJDmrHTCVQRR5iP4jUle6buMDd?=
 =?us-ascii?Q?Kdd0oS7S35U/qH0wfEmoGRzDfWfK43JbGhOFZ0oDRUJWh50AfhPUSxVHpIfq?=
 =?us-ascii?Q?l53r4CYXnaK25+SSPf/9WHcdFVGuwlNEwUibrSaGvJn2IFqsKNO5pmlOwUae?=
 =?us-ascii?Q?/CKSvZ5K0YTRlK1X+kyxZZlWrL+/birysQdeHa/Wa5YJLrj06CFma6kk1KvE?=
 =?us-ascii?Q?QGCJ6bxSZmE4x4PSF3mVFeNu4lTCN/uK7RSdDsvM0jASnP1ky7KQQ0lmKMsP?=
 =?us-ascii?Q?EyXs9vLWIhAxld/pRtVgz4ZGqsi/kK4LgVgLPGWEPbMoZ0drBpFbl2x8s09y?=
 =?us-ascii?Q?oqioshbC3GefTW3AMoYcnywLQXoZWm/tfQtg+nM+VGaHIDDl1L5DspEfN/Gg?=
 =?us-ascii?Q?WJGqCLBb6MOufrCNtmj/ncLeYna6H9+FFRiipWah6yTCpiu7/iILOQNtuxOE?=
 =?us-ascii?Q?WXFAvkG+6vhGPirg+8MGLjhWKixUhiAp4ZCXIWWhoSedRxK+C+NqACQom4Z8?=
 =?us-ascii?Q?fQhmFSwmt6H8/hgNdolILG2kubcMb8zSnZii/lEhQgv5AUX3+qyuKKN+J6qN?=
 =?us-ascii?Q?b4LfDIO37NtGiMZmY5sB92WHP5UmKJvPcp6Jm9leMRt4P0I2IWzWoQDjzGpM?=
 =?us-ascii?Q?Quu28vPvZMZCz/d83pW65782EdH8NNbpTrcjlT7i+Tp767e3GITME1djCHZg?=
 =?us-ascii?Q?Ez9qOTbycFMTM9Mz3QFLyQLaIMv7YkGQ6R7NESqLfR4TuI6U7n/HFuxCKfsT?=
 =?us-ascii?Q?8BkGk05egtOoa6WsLYbGDU+YcthAo1kZiLJK+SLVwcJlZWlen5GtbzzRA5Vo?=
 =?us-ascii?Q?OHnJPhFNJusfaxSfbZ0/gImiHasf0dW2mjUVJJB1+PoFie0flpoxVtyx1hq/?=
 =?us-ascii?Q?AO9+J0zcYbW19ddU5wl1jytpPTFTVXSVYun8CU3wZ1p5QgjBOcogEJhzwHJO?=
 =?us-ascii?Q?SepH/fnFoIjP0VfheL+iI1niMhxAscVTVEOoVInnmpixpwCIbISAhMOc9MzM?=
 =?us-ascii?Q?lCJFpaPPtcGMrcKXORM3TtCG4pmFKCklZMbJ7IsT1QSVbbExiR3hnsoZivEJ?=
 =?us-ascii?Q?swcUT76sOUy6YctpgDH6Tf2VLjsLddfkwxPYF4Ms2xmlH7RYnGhJgdP7qC9O?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ce9f99-12ff-4ee4-3b6a-08db19533a58
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 06:15:45.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICx/JQ/6YTf5wJhZrRZUTUe2ySDuwfO6OucSDmvu3T/VvZKcY4UEaD4SQEgb29ijKQGK+qtHdBML7rWpqudpAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5396
X-Proofpoint-GUID: mDmGxac7hPu31dfe0gMymvjMvnCoCwE0
X-Proofpoint-ORIG-GUID: mDmGxac7hPu31dfe0gMymvjMvnCoCwE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_02,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302280046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 06:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177819

The python3-gpg's version is now '1.18.0-unknown'. Such version
has been treated as invalid for setuptools >=66.0.0. The error
message is as below:

  pkg_resources.extern.packaging.version.InvalidVersion: Invalid version: '1.18.0-unknown'
  (package: gpg)

Fix this issue by removing the '-unknown' suffix.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...autogen.sh-remove-unknown-in-version.patch | 34 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.18.0.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
new file mode 100644
index 0000000000..29f9d6a856
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -0,0 +1,34 @@
+From 46f346dff73122caffe62eda84596a3a3bec859e Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 28 Feb 2023 13:43:51 +0800
+Subject: [PATCH] autogen.sh: remove '-unknown' in version
+
+python setuptools >=66.0.0 treats '-unknown' as an invalid version.
+The error message is as below:
+  pkg_resources.extern.packaging.version.InvalidVersion: Invalid version: '1.18.0-unknown'
+
+Remove the '-unknown' suffix to fix this issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ autogen.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9b36158..d5cccd2 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -266,7 +266,7 @@ if [ "$myhost" = "find-version" ]; then
+     else
+       ingit=no
+       beta=yes
+-      tmp="-unknown"
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index 7ff4837d6f..a7b0de44a5 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
+           file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
 SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
-- 
2.17.1


