Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5992EC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 05:37:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3294.1658813857752700302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 22:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZtSphY/8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4206887e6d=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26Q5Jtrj018385
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 22:37:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZQ1aiUid5Uc0Q1DytA/L1C2RTiZx0fPQB9gAHQhq8GA=;
 b=ZtSphY/8xMc5IThE4xz7l/+P1DYKzsFmzpz+mneOR7P+XkhfQjldlIQmt5GOx2zJEGz3
 9ROpIGyYdLmDuVZvZeaVTh8dTnUm2ip3wQ35jWF1Ft66H5s89nExz4Gn8YcnFn88mc5k
 5eesKN0irYFS2l09vCeMKGlMt/+LjhvBhEwl6930yFpdYXIaFl4O6jXoQ0kxveNpVEjD
 Ox0VU9Kr1FedC0aYBoKGhw9HnhjpsAfFE3ZqSw7GE+SZovOLsLh3JFcRBtGKy0VR0gfI
 BpJyEXEoH3V4zC/dvL94ZYBqd3M4jaKx/Q1nOe3p6sXb4ocwgIcdZJZ/kGid+dw6wGP6 Mw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgc95203j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 22:37:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJof1Huk9ttR6p6gWh3K9rLuRj1dd5YQInhVvJzKKCPFoaZNIHgdgrnltofKFnUhlK9jTrD9h6bwTRIQ+ZSqJCHkdYsvZ2Y/kx7DSxrwDiKoFbC+CPbAA7Fy7PvtF2dyTyuTpIl30jBsKIPI8Arumoq+27wBIbE9hT5UwQJtKuGTG864zrTA5YpeLnznWNA1Nyv/pyq2Z+aeZ4AtxQMPWQ0O+6g6ACSPJK8TDBQ23l99fvXHUz9i7oV43XFqDevAqTjxtBUnnhwdu1J3NoWTNOakpD04NwGSW4n+hTBwqpaG+4nZh1pLzOcwdj8/dWSnnQBcLMhWN/Q5TOOH9VayVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ1aiUid5Uc0Q1DytA/L1C2RTiZx0fPQB9gAHQhq8GA=;
 b=LgTb086bW2qGLwwA4y+vL8CULVMbI/TGDJfY242mWZTh9mokU5UbCxYDrNJszUZJQr0SxDewd1fUxZv7tpUwHQcgPm3gwSjHBPJZGTAxGjq3kzq9uFSJOdqtuqTuAaCGs23RTS8QKc2XHdJWq8eY504xKsOYzPP9jqi5f1Z90R2K8BQ7nlXBjnUG9u5xahwx5wpGv04EQLI4/Dfjohq/14iawiWK2m6S9E38ll+l68cc8cEGLtopAYJhGV+djLFEu/4uPoNfpbft2ZBDu1/DKNyy4LYy452B6d2WYcwRc78T7exAQW8qee5fumhCksHo1eC1dpJVKNlueF7q+fBdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL0PR11MB3121.namprd11.prod.outlook.com (2603:10b6:208:7e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Tue, 26 Jul 2022 05:37:33 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 05:37:33 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] git: upgrade v2.35.3 -> v2.35.4
Date: Tue, 26 Jul 2022 01:37:17 -0400
Message-Id: <20220726053717.24780-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0173.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71e34309-3c1d-4c2b-3045-08da6ec8f057
X-MS-TrafficTypeDiagnostic: BL0PR11MB3121:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wp9JZNM/CQAvhu4Ubxu9qRbScXvVWBUK/J2zhf+o0dN20rIf68pF1FO/cVTEGtJIgAf3hlloTw1eNtxzRCw+uk72yUgAc3c1WzngNV3mk/7kk2GYs0oj32/shl99Gk5pma86d2v5q3z6nNC3f786P+hF5Hm294ctDhtteFnHHKFxmRDKlzQnOf2J1hD1ivHW+1/c8e4SZ1J403sBeDfKdnzwKdGL3upU+6Usq9A5RGgKkxw98nfiqXihHnRX7uOBc143Frle7cY80zag0BnfpRyFD11YPIQyln4E6Odu8dP+EVsMkwuDFy5F2a55zkZdO15ta3ECq5loq1Sqbfx9Kj06XyuhjZSH4/PFvvRo7J4B04u4n38MGkhkzNZAdM3lPxRoojVYmlDzz4mjALu6daOcmXxQ8J70ErzamPCQmVKYYDZHwaX1VpiX8mEYIJQmxLepjp9YyxVjz7geBGxLZJ/aDptE4gJgAplglLBr9N2ZWEo93rt+Tl9WRFjM8JtBCKhZgfQ5xZnD6K37cqFSfQsfBHgsu+J115uv5FKkXrlNgMYPaa+3PlKXjZ/HLdnscGW5HrSMudqsNkvvpMWSfM5qC17dTf0DUqBaHfilcPQuJthxtmA/fVSmNWIE28omn+lurpdTOEIbzwjsqa+EmnuJwcfrCEbPak6xXsqc1G0VL6yfYSnJobictrEaUuir7zEpLeTNiqKdTdG9nuRKI2ZnEO79PjLsbgV9O349qqD+HKIeARpu1lzuGkcf9C0c5xH+HTNL+ONWKJHfX8e+5JKLFcwJ3OK0GEifGTxlSvU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39850400004)(136003)(4744005)(44832011)(2906002)(66946007)(8676002)(66556008)(66476007)(38100700002)(316002)(6916009)(38350700002)(83380400001)(1076003)(186003)(6506007)(41300700001)(478600001)(6666004)(6486002)(36756003)(8936002)(5660300002)(26005)(86362001)(2616005)(6512007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gFU4+42FDMPi1FIh6W8RneyOmffMw/qojDWdoBL6qn9Mk7v0JkHeNgIKYxCu?=
 =?us-ascii?Q?ihnpQFjrGmVg81J/jeQ1Wd0ckhc+7Ebc04DXi3uHRgtJIXg0rgbn0e5k5ePC?=
 =?us-ascii?Q?rv3KzGnEuIrgE+P4KqjjR4tUmTyoQH90VShAhQq4885xs4DAF/aXFp89GRhy?=
 =?us-ascii?Q?9+YjXm0/fqbDRpKg1W7uryEt7n1p1jKi8wFI5vV1ny490RjcYpWFt/bTR0TW?=
 =?us-ascii?Q?Nt6hw9LWqtKwL8y6mPFZaCCFeeZAt46XPIUWDJOfkjyQCg3XhJ5AfqY/0s1d?=
 =?us-ascii?Q?ewkehNPvv4Rh6kPX/kQGDOebd6izZrY/PLg1yVN42rvFbgesNb0nP8Vj8kKD?=
 =?us-ascii?Q?R4yCmJMSWMVAivQpKrRo/AYHdU0RcxWW7EJhXbWuJuq7d6WGanlDwzXAJ36D?=
 =?us-ascii?Q?E+PRB/SX39mcEyFT7F3Jw+0IvhKjPJm2OkNZ37HYEpRSS54Vz4SIUc+d2L4/?=
 =?us-ascii?Q?3pStZSstizmwSq649G+We4xRWhggUwtrxkxDJGz+7TSfTrE7iE4noreR6w4s?=
 =?us-ascii?Q?9eh4JTso+ptR8LvXkZ8oIpyTsdndVm/PA6tx2kE2/1RQmklKLaoZzP3e4jjX?=
 =?us-ascii?Q?WJpGYHhTGhpyPmijV5vHy747NlIDUfCMwpglIs6q+G/psj59JSXuL3sFA7MJ?=
 =?us-ascii?Q?ZCYsLhmS2QT30f1soU9MuSizhJo79yl4rzKvOeij3JqRzGa0HEwI5pzjWig5?=
 =?us-ascii?Q?Hy+w3hkaIIG1otr2GbtZa95JMLFcKL6347DaWEA/ES/x2+T8ZI8K8dkQSIMy?=
 =?us-ascii?Q?7+61WCFVfUUyPEY+T85IUAuiporOOSXEYOrgjzuJmNwXddSc56sgg0gkB1ZG?=
 =?us-ascii?Q?lXiKSIyPm0mHXtnS0xkhnklR7BasXrZeD1J9UtMhnzY/3NqCFlAzETOzFQ7C?=
 =?us-ascii?Q?cEwyCOjhEnTqnaSdowzZI3N/7i6B9EkY3RaRZab7SK3tNkMKA2ADRdFl5P46?=
 =?us-ascii?Q?3d2NtFm0Q93L0+wiKaS5H78sFMqja/2PpsRACqEaz2EUUzXjDJNdDSVgMJZK?=
 =?us-ascii?Q?itASNZmZ2Tp/napYsv4dglD+NgstT1JaaYjMGyDvqgZaPS3qDfMTXJZjCeEF?=
 =?us-ascii?Q?nHVcq6QM3pbCVyKVPwcsEmu4BJQllh2NZ24IoyJ6ae0es7YA0sZJnXCGrGxU?=
 =?us-ascii?Q?ukH2quGLDinHNoT7BOXsXi9gyVOCCMcDW6lrfpyFWpQOyjKrCyeujvND4ZrD?=
 =?us-ascii?Q?6REG5Mws973+NybNBMwrxT3nQZdFYKhh9/Reik3PpJDD/TFnFmLaOtTwGzhD?=
 =?us-ascii?Q?m0eFFNoH3VapYvH10bdHRfdZNDQQJfH8T7b3j1IM3aQKzIWsEL6xVOvpxNPS?=
 =?us-ascii?Q?3uvfq9op8BdMOXQLBbxiIijN/ZCZAJgXtbqiOD12UvGgTnH02+Y6sneqR5u7?=
 =?us-ascii?Q?KysJTN8ESU67+f0ekBmpI00+eHNHjhdpjifCoFiSMf8XZ8kOsJrXGL664l+6?=
 =?us-ascii?Q?fHgZX0HYmbDlVZa/RpLna0VlhH81lGuvmiV3DomirMWeDkwDLKOIGcXygK5Y?=
 =?us-ascii?Q?RZ3wgRxAZvZx7Il9zVMqNxnE5bu4p1XnXwZNNY2RVmFDQXRN/plU9S+his4K?=
 =?us-ascii?Q?mUHunq/AEDNq6dHQNF4qKHIRPOip2Cr8yrwngbAUMvL9sT6/tQKgjrBCn67d?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71e34309-3c1d-4c2b-3045-08da6ec8f057
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 05:37:33.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KBECnxTi/LCS6c7PfZKCMuJzORff6OsEa6ebCchvPmWQzgd6SMgcJXGbivHqYSOvHZOgYiCybkCkcsVI1NgPEdT00sbnA/3MaXjK2A1KA5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3121
X-Proofpoint-GUID: 5ot-Dqm3SGSIqRY8U8uuTTW6GFdAWVZU
X-Proofpoint-ORIG-GUID: 5ot-Dqm3SGSIqRY8U8uuTTW6GFdAWVZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_13,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=585 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 05:37:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168495

Minor upgrade which includes fix for CVE-2022-29187.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/git/{git_2.35.3.bb => git_2.35.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.3.bb => git_2.35.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.3.bb b/meta/recipes-devtools/git/git_2.35.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.3.bb
rename to meta/recipes-devtools/git/git_2.35.4.bb
index 794045c8b7..18f39875db 100644
--- a/meta/recipes-devtools/git/git_2.35.3.bb
+++ b/meta/recipes-devtools/git/git_2.35.4.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
+SRC_URI[tarball.sha256sum] = "4970108bdc227e2c3687899f8fc7501c54c839dcc42f4d999ac9e3e3f52df583"
-- 
2.33.0


