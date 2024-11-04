Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525A3D111BA
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 07:35:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52517.1730705747452887964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 23:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10388ffa1b=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A45BWNp029473
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Nov 2024 07:35:46 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0hjty-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 07:35:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI8AoJmoIm2GyRQ9aW1Ob373LJwGutp487el6rrylMEoJL9UfyEfWW48myVQOYefCUG/IjEzBHIhOAESc4ZUK4R7hpPdjQtOnywUMTFWL8d60y5e4gnizccyBGcvRbIu/QEwJtzOZPpNpmQZDdKwjGXJFxy1t57jMW1u8nN1l8/uhDEtUrbiXi5BEI99bBZqItWhZ5WtTb31tlMMHDzz96rhRhgAGb7iQG8gxyyVvzQXBoMPWRFFB+1ElF0aDXvf3IRnCFAvJ3dXRw0JBjNAaOCPCa4bga9WNmcAoIY+bsnwS08LZ9P0M3U/rdpgxOCJYzJKNCP1e63s1lN2seJ3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjn4COp5rTUUpFD9b9QK3mCDsBmikgSyqD3WFS0I3uY=;
 b=tmpov+nGWPqtUS5fstnYKO+9GOgJcyIElDiKvsTTS1NfOA0ZTlcHR8JiqnLUjhugnuCyR6Hz7Njw9bRAlNshgf5anSvc+9nYcDrdkKVgnQb8YMLqfkOoHyifziMeaS8wxqHSvhmSW2h2xJyVo8gqbc4dik8U/yfr0Xj/o0neklS4uHQYh7uI1f3VjvMUixhNAaZIPRjxjv6Yj497e6SwtVHctn3MlZcqT22VFLUlC8kbNBRQDjoNx9NX/fRHYJhdL9QqS2hpBXH1Is1iKWI2cn+a3xfX+E/TANM3M7hddeG94iijlAbn56qlHDWgWzUE0vUO/CyoZjzkFv3wPRa1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 07:35:38 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 07:35:38 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2]v3 tzdata&tzcode-native: upgrade 2024a -> 2024b
Date: Mon,  4 Nov 2024 15:35:22 +0800
Message-Id: <20241104073523.3352231-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|MW4PR11MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b5b5ae-365d-4ed2-4ad3-08dcfca34708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YEk72wFI2QJf9QOOwHjesTqVfYyCvtVCPepe5swv/VmPxaW3CjNpvL25Bhfi?=
 =?us-ascii?Q?nYZJb5DoGQeULCPTNk0zrm6DCsSGK2gi34Sd5hXiFe4Q9i18wZ0eUbgozir6?=
 =?us-ascii?Q?xc8q2LSTmBYDN2sQds5QtkWkCa2O5dZPztycNBOW9mveb6E9/tjzh4F8/Q2V?=
 =?us-ascii?Q?fCjFgrYaj2iMuxa4xj2jQnlc2rqFTM8PsU8GYcFNWHS8dP93hrSXqwpjWI9b?=
 =?us-ascii?Q?K4Va+JkSXXX5Uiaslp/KUhyUd5KZnlIe6CA681AClcJags+pMFu49dowcxwf?=
 =?us-ascii?Q?TMt1SJV9DXOTKo9Pm5vkVJHDj+FuD7ztTsXmzIIg3Wy6Pd3CUFxQnlVv6jxh?=
 =?us-ascii?Q?mOSVxjdHlL+JPByK6KHdkWt9Qr/xLd7jd+au+S6/ZnGrtqwIRQBA2+SLMnb1?=
 =?us-ascii?Q?gAbVwoq8y88mFRhBiw800yJqK1fDiq+GOYfKhXPuQe/0aQ8DRmwardGT06wU?=
 =?us-ascii?Q?jI3nHXheoEGWRHdanap4Z9QueN52RYY3sf3dDcqHPlCjEO+TQO80kuZMegWP?=
 =?us-ascii?Q?gg2uAUASGD7S3BVjShR07ZpCl237nNfIcZ9K1C0AHzJvMS877AbCtm8+o++F?=
 =?us-ascii?Q?df6qGqssUGdbiPbGrxftNdB4cI1vZK/DA2hiv2b2NNr+Xs4aDq9WhELBB34G?=
 =?us-ascii?Q?JUuWluKMgblD3GKJVO6KQgBl2y9Af1CNIoIKOMV9rAQNWYZDfA4utzGYIoKx?=
 =?us-ascii?Q?cy7YL8+dfAtVYkFQlXMeq4gKAWllSGBGuT3en/Tn9xoSBGAp3DATcE90Hc0b?=
 =?us-ascii?Q?BymY+4HS9dj+6wpStqsC2WP+dBXY9h55y0ij7SRZBc6So8H/xa8XiEJXkf14?=
 =?us-ascii?Q?jAp7ezAz8WTbg7SYhUHspjz2rnoYIRVWIhgtMiXchPpnyVKqtwrqYH9BFHlk?=
 =?us-ascii?Q?gWB1BY9EUfd1nigicX2OOxtXLtGncQuAs+8P6Gci1OG1bzm8Z1rECYg9YMey?=
 =?us-ascii?Q?uaJakFg3/hZeEj4/h0bBLpeIn2eQj95sIOIrZ608JvWAJFuLgh58Cfrq4HY6?=
 =?us-ascii?Q?zG0ikL6nbekjNwA3RaRrB2Xw3LX2R2qNLBrmzxn0Lx6HkstxBN7Qy6Gn0JPK?=
 =?us-ascii?Q?Xw8o3xWO6zs2F+7Zgud6l+Bbc9ju8vxq1LL7KKnYvG/jBU8ZdI59nPoxAGdS?=
 =?us-ascii?Q?i/wAOCIEL8FLXe+o2+nDJlnjFJ4vNO7B7rZfe/HHZAnqpAFD8jtrE5ZEVrMS?=
 =?us-ascii?Q?qp0aMpSpfZ7RnZ83L1LN9vTyXcmJpfCNuG7ApAI2a8b0/51JK839uxkTU0Si?=
 =?us-ascii?Q?kiULBmBEAlY557HGCcpFn49mmgto0Yrgecb8fhEuZPKxGcTYQo2mK6SGH24B?=
 =?us-ascii?Q?9hiBZazh8xlnxN37J+dAIz1EeXCyd6QmtNpw+wM0HOsJbWaKutzvxOMMXqas?=
 =?us-ascii?Q?0ypl98JUGDV5ekP+7xxCuw6yuUiK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gI4/mHG7H/oZpS/er9Pcp+ysFs0XzqHK2gJIuthA6TQod2zyI9nMzhP+sVET?=
 =?us-ascii?Q?9tCF82zQNE27kYRUgffAi2Hq9q5v+sfFmvOjlRg8B2Xm5BdbKH9FmR1sQUVb?=
 =?us-ascii?Q?hS9izhrKUMadplruG9wgtTCaHCdrEANepUdYoIqYrbyrtpUbui5/LGr6KvhN?=
 =?us-ascii?Q?lUHJZ2u7beSpxFFop0rR049wzlqTBw2tIZTNt6EnGzHOtLl/4G3i/itx2fML?=
 =?us-ascii?Q?n8ET/K1D3M7a20WiJ9jD5oD6FH+Lkbu1oWN502d8M9SL0saP9xW5fpIEDWrB?=
 =?us-ascii?Q?tBQyeK5MgFMNtg5sdzYMIByy1/62eQ/AJHCNyU2yVqCxdFElqHmSrWlM2okT?=
 =?us-ascii?Q?QVPfAL1i8qee//Rluz6PoGycyEioR5ePpIz9T992JzKpTAv3pvuesaenOYxC?=
 =?us-ascii?Q?3+koh7WPzgPn1lcZxf5WeZMXNUPBZb4vSOIntLRZHp5xH2QSxpzJ824pehcN?=
 =?us-ascii?Q?uJTQCrTLRSV0naOZnSK2BZgY2D1HTLCcBYV3XEqoIoQLInyWK0h5VikeEe6L?=
 =?us-ascii?Q?MR3FbJRVM1Mi9bMS3zFcf6686SIp30OrFCr5uHlxdKBU1osYkyMhmVnBzuXJ?=
 =?us-ascii?Q?d8JZ0x0K9Afibl4P38d06otOPt+WpqeWf4hfKgDTEXqqTc1yAVe3jAqceZVW?=
 =?us-ascii?Q?k5KdCd9cmDk9br6ifd3rBCU5PH6vx+UzLewVBU5AzUzkQwozfhHBSeK98iRm?=
 =?us-ascii?Q?cV9hjWkz9b3ipCnx4iI3wdemfdIYghLsGH4Od6PCgkEXHFz7wqj2uKB4Wvia?=
 =?us-ascii?Q?nKn98sXedL/53WMSCv/bct3eymnEbykzWTMRdYmiz3FqZH+81x40c9LjHMFm?=
 =?us-ascii?Q?IudIscFLQqhU5sbmLfAd8MdEOtVPFoqnKq4DwHl4b0v7NIeDUdOEDzK7DDSr?=
 =?us-ascii?Q?Mf4WS/vUeTkTG0JlWJltJhxvzStkT0lcS3x5EtoIe2+l4M3q64NrX/FTyfwP?=
 =?us-ascii?Q?S0DeAWXwzrv4QXKQQCOywFYoCLJW1TYgmIAhcqnU2VpX3/PH6bCYwdPIf9EV?=
 =?us-ascii?Q?CzC82ml7uCeYfU+yETdmLYCKwCSWDuPV27EdFsYa9MRBMrlFzRoTVZ+DGHEf?=
 =?us-ascii?Q?9cjh9uzuUfrmOwotAixs/U5d/IV0P45W1GKNToQ4tlwWBGuCmeLO0JzbLo2x?=
 =?us-ascii?Q?kRi6n8a5sNX1CH9Lkf2as7GjyfbQOK46DLsmbWReKdVlpaMr+ES+ETVS7UX4?=
 =?us-ascii?Q?R0unYt7JR2RvpNsFO749j1YuJWA7zwlCjW4wmewMFeI0ihN4Ri3Vwln3M3Hv?=
 =?us-ascii?Q?NcC31bsTFbB1maXd60mFNi4CM+p1FlW8oKb8prZglp/ODrtZgsRNidw6OitT?=
 =?us-ascii?Q?8oVh0kaff16mrhiTCtYxmAv5Qz6zITS4vhSSBmNCjoKUKGOVoFFGKBbjdtY+?=
 =?us-ascii?Q?Wyxl+VOSjrTXM/TVE/gU/cyfwoR3nhzjvZYVEACJ80fZNbQnRnwY58BaVrTa?=
 =?us-ascii?Q?O73wrMyjyaWMSeeXrpKoVMAtDBE30h6EeMGR3Pgn24drhJrhyMjObqZUJSXV?=
 =?us-ascii?Q?fZtNWWe5CItowTUKeW+7Z3pG9TEX64A1ac5rACmVIa9TBaz2b0qoyZqJCaed?=
 =?us-ascii?Q?Dr9Do2O2kkebeV9KcI7iNOoC3hIotnc3hXd3FXIAmmV7NLfshELVMmrp0Ouu?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b5b5ae-365d-4ed2-4ad3-08dcfca34708
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 07:35:38.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsV4hpMen+f2beKHqjVW+um/o3Dg7ilncx+DHo/cp+X7PWobXigFevGa+L5AmL5lSl6F2g+H5LZqBOmlfGAYKoYRxf3T15xNegMmC9v1NcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=67287952 cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=I0CVDw5ZAAAA:8 a=vEEcL3scq_NeQSkCwNIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -g2Uo_puogtd5qanZZli-27QBAD3C9y6
X-Proofpoint-GUID: -g2Uo_puogtd5qanZZli-27QBAD3C9y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_05,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=848 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411040067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 07:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206675

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


