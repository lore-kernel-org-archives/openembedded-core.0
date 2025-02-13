Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4907C021A5
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:32:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2740.1739414504758479198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 18:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139445ff2=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D1i7uZ002673
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:41:44 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqagk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exsZt8zv7lQWLlcKJBpZOMnxIm2tREht8oz9L1os7Dg95iv2G0nzTcXcSP/Ti311AhPuqbGVA6ymI3HcSBAIazyr0E4cHbRl4xvKkR4QfBC36Zco2pY5YVaKafDmn5RDvlQsVnk1tF/Tepy0JixFRyJeKktcgDa7U/LZ7cYD2Yj00yutl/04tzN2BZHVPxC8KuMLJW1MtyOU1hXg2sXz9DAtB6rgomQhMeA8aNF/2Nn6g794apyx4we1XQ3BsWMxSYUJYG1TohgMBQ7q5DB5S8EmCbLaU9Zmqcc2ITr+DpWfNwBCWzBa+NQPjpQ8/0qBGbJAbn2eJlF6kmMsPEjGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwltlu+paZepFq8qgptONQNYrwr/KzF8uDN9bUwzv00=;
 b=JjakWCd5IbDxQQg/kqwvSzvuOsqElZ7eExug5+M2one21SEXANvw5joF+2OCnCskg1m3kC6WjZdhG4mrttAXTR3HD35ZeNkenZT3vsttMQlUHfKyEb3zxwRKDwlUa9C5HSTXYywzd/6UTCzcPjX2DK489S0V2avm5tj6cebuLzKCxs+ViLZFUuxsNpt+L5OGAiGgmZKipK+Kv9MdyWc5jUDfKg0JlUr6G1WvsE080tH26C/1l3waQlZ8MSygTGOEdMT20mhT0XfAi99IOOxRQ2RLqiM/CY1AxVJA77kjNLmPL74Mi8vuaaBtqsUwVvfrRtjWtuADhIacw7HcIx7lig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CH0PR11MB8236.namprd11.prod.outlook.com (2603:10b6:610:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 02:41:41 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 02:41:41 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/1] python3: Treat UID/GID overflow as failure
Date: Thu, 13 Feb 2025 10:41:23 +0800
Message-Id: <20250213024123.116274-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CH0PR11MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e87db5a-3330-40ad-391f-08dd4bd7f269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uqGmIy3QdyVzaqMPt+jPEC9NDISRFF5sJK97dJ9TjbvkrSQyXzNh4jHck9lQ?=
 =?us-ascii?Q?bfNG2qxAxd1wMTehCMO/axLG9KUuMxG7p7YlsWTta5bXn1RXPZnqE+ZJlzD9?=
 =?us-ascii?Q?9ymoErAD+ACRTQXT0VkX32841q1kOA13ZJQO8VBQJz0JUgamo/DFWDaxH5AF?=
 =?us-ascii?Q?VInm8JkRV5F2IE17mHmpypPLo/YLScgE9Xcz5cICPFlK645dms1YyRDZt4jZ?=
 =?us-ascii?Q?sQCzv/TpfQ48d4lJZ6FPdY2Ldh8gVwLrVqK0l10Ai1PwgYNocmvAlZEaFCXj?=
 =?us-ascii?Q?M/lNRAaqEcsOdOoTplekZryOnK59b90WMu1vG1/sSVysgE8NZvPzYqrJXiWc?=
 =?us-ascii?Q?xdpt2mERcA6JOG+lrdcuUoofTuWXAumOh3Mj78BNRTKcyNTJcJOxJ/QiZE46?=
 =?us-ascii?Q?3etkVG1k4E8LogzqFIWuFDm5fh1RWhJkKrpP7uM13LZ+xwETOzfni6t3B9RJ?=
 =?us-ascii?Q?dZww3Jg09rrgjSODlbEgHsOy3tCaCuNs+EGfFNja2ch6Mo4w8kbujZW6Ahwd?=
 =?us-ascii?Q?IcHAEAH+do5x6zP/LWnMKLOFkIzUR70Fk2OeX0LpMvE0p0nVyDKdRfUV+/WH?=
 =?us-ascii?Q?CvUBYMwrzwSRu2tZM84B17Djdqc6EwugNR0BMucZYILTqHeRezbkypG2Q5pc?=
 =?us-ascii?Q?sycOVwaaRCfe7q+a7WkujD2sWst+2aBOs3a0Z3MHNDATksYTjp9YRh1u0Ez4?=
 =?us-ascii?Q?Q4SdyYbkJt6cmu3Tguqcm0Be9pZOxn8ke02jVN2K9Yk9d+V72NNb978nmBAV?=
 =?us-ascii?Q?vTDb1teeKJPnd44bBXoJ4BPVhLivQMP5h4coPfAIZshjtaV9Bx4a/0VAeTFg?=
 =?us-ascii?Q?oX5C5eFkZsJ3cGWsK5JwvesYMyCxiorRePGHtHuJk4/sZIxP7vJXoMZGWz/w?=
 =?us-ascii?Q?QxNHADKsVEiWu+yJ3t54p9Pvz4W4xtzHba9Sb+3y8Ue8ZEjfT+mn9DgCNZqf?=
 =?us-ascii?Q?SAN92l7gGA8UIPOissBgj0aZ3inY65GZ22ePuzLNh8xGCCnr/ok4s5XXbX40?=
 =?us-ascii?Q?kKZDtL5Cvokacb59dbZeC9boOzu9DnNzhMdaF3QdpsurlhjVXUp39OTEWdZF?=
 =?us-ascii?Q?UU6f6wpmBofDT/mPo6/krYO2BSH1SKznTnGMf+qc/r/dw4M2RujyaZBolmbz?=
 =?us-ascii?Q?EpuRV3QgvxQgjJ/HhdhsKGSFceeK+hGc9+PklnnjrxeChX0Z9mT4FWqdBYpF?=
 =?us-ascii?Q?TvH2Rulf5pCa4s6ltIr6D1c+wa+Ghy3TEA4Z9h1BVFarrpXcfKZjGw+j/TOW?=
 =?us-ascii?Q?1oA6+IQRvfP7FzXNVxNS0WrFi0t3ZjprkQgOQbuanhXSiO2NVQ2eKfEcRvma?=
 =?us-ascii?Q?AbhGnWT/lpIGIdT5reBr8mj4lcJVWIfRC/sc+yitznkE++Z8RdgPTFlxdnDN?=
 =?us-ascii?Q?DUuY2C4s/I0ZA0MvSel5MItbxZRIJq+6Z4/8UXT037v2dt2xGQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kGbH4TbWGUjFhYGXhPPs/DDzze1KzmbuloI4VSZKNr+MDl+S3qKnLpU20JBY?=
 =?us-ascii?Q?5Ao/GTAoA89D7gSFAsN8Rdh6uSsFuTfCyF54hWEEwp9bwIIX3i4TCenN0lLi?=
 =?us-ascii?Q?z7v2hp7l7W7pLZtiNipTtf5UKTBUo8MlHyX9yRYY5qYUwyoHfqK5yIoh6zTF?=
 =?us-ascii?Q?MTngFzlvZ0Q4X8TBDBN+HldaJ5n759yfvjX/ME2V+j8tZ3OsNtJkne+wPrzK?=
 =?us-ascii?Q?a2W6zjmUFbJFuQTjXny50BU7RpLfVb9ae10vFFJUHTl2PCbQ8DtVDnGdnTxc?=
 =?us-ascii?Q?KN4sP379I1LpVA/c8Jcnp8doVySWOY9n4W+63brq5CPx0feA31VqxZZidREn?=
 =?us-ascii?Q?LUsRBr3QtcB3+XXu3qQZjaBIefueKzkSLxB5zCyr0TXsp/k1J6NeNgrSHwHQ?=
 =?us-ascii?Q?QZQZ24ucOfhqbUQTylndTVOA9GfpyL5N6EEt71qDem2mDxUhgCZmw7jXNOh1?=
 =?us-ascii?Q?DivwUTLvSMaArvDfV+0q7cvhJ8b8J5SnV2qi16O/7vFptNmLtMIyKObfrf+z?=
 =?us-ascii?Q?jWgle2we1X05bCgCKkm/B7A/4P3by6mdGUTf35ECvsDS7JnMLPUw6jEn3RcB?=
 =?us-ascii?Q?tyVT9Iog3myuwVAZeLWDNVesSpHbStncBFJxVx7i801rTe6FmFhjihA0vsAQ?=
 =?us-ascii?Q?3iGtb0ryfGcpRlX5XSI5bn01REVwoUzqWTWgBWmV5vvou1qV2VMtzICOo7FY?=
 =?us-ascii?Q?Sv07PIx7VOnIdIDQO8fLMEDyw5OB2+OK/Drvc4UNNHEord5j+uVPx1Ayh+Ie?=
 =?us-ascii?Q?X5XHcuvXeegXaPN1k7an3lpGud1H1tL1UXLbRVBoDgyyTftuJTYFvDiblgLf?=
 =?us-ascii?Q?5vr113YOGlAwUcro+SM5ByFHitFmW4iPzpurxNDDLJOlMY9TEeCxWbun2QE5?=
 =?us-ascii?Q?3VUNcxze6fEPJqRJXWzhxgKyjPJdajLXygDtgPayprj8eaEKGKYrCcnyAOm/?=
 =?us-ascii?Q?ayet6XR96Euz76SsMF9J/Cn5bytzxUd5Ua6hHAAxCgiNmjrvxsL5JtKnAm6H?=
 =?us-ascii?Q?QXejIBw49tOcJ7T1MSYrAdr0v8FIkmmdsGHz4TenTGj6GS422ifrOvfNle2s?=
 =?us-ascii?Q?8fsb4V/aTEXbk37OofY2ma6UKBTQOoz6gVXMCK6/ShIU1yZI7yoDdYeWYYCU?=
 =?us-ascii?Q?PRxqFn4VIs8Ypc2IFFgfxDwfd66wm57sE1ocYAKutAvbdv30Kqlc4f91daAg?=
 =?us-ascii?Q?NXOa8pTPVarP/BLGNa2NODmGFYol6kkjpt+hqJI6xRELhZ3aZbGeKmBwDv0f?=
 =?us-ascii?Q?NUNVTYR0WGmRoGK2+OT0kix3HnosmI0Hbkqlz76FxkCJ2wGX7snLlmfpHXQg?=
 =?us-ascii?Q?vGsYCvwa06Grb6J+fRn/O8A/xyEfhGwi8V4/UbzlMrzcsJtYlqmoa58hRZ21?=
 =?us-ascii?Q?xV9RM5qyrgKGFYaiHy/PRj41mqR8VNejm67y3rBzqAWRlgT+Yb1bIPtP5UOv?=
 =?us-ascii?Q?vEYmEUenrBcCZpLq0N8zfaoh7yJcVzvW27WOItIXf2bdW1fyVjLBHZHLh+BT?=
 =?us-ascii?Q?SE+uJbJWfijXmLcv9H3Ijo2n+XyPlczFBBG5t69g4oDwV+JWKz7I8Ih++J5n?=
 =?us-ascii?Q?FyyA2oFbJg7p6z22YQ0/Lf53RP1uWV3Hd85nD1CQ313cQKNqEs6/o35GeRK3?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e87db5a-3330-40ad-391f-08dd4bd7f269
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 02:41:41.5990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S55QQZHDNcyq8O0mWubbz7KZdGQfxQDSTj8+vyHLVgkaS22l5Czb7I2i83MZMph8mBdO4XEwSDjkJW8xChU/E7n2G6lUovQ+phalEYXY5wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8236
X-Proofpoint-ORIG-GUID: baet2UkvMD-FGcJkOVbnJnZQ8qMKgegy
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67ad5be8 cx=c_pps a=6eDru+6t2m7UgPRwoW7UVQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=_Eqp4RXO4fwA:10 a=NEAV23lmAAAA:8
 a=8AHkEIZyAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=jpDDr5YmfQ7TLY7y5DEA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: baet2UkvMD-FGcJkOVbnJnZQ8qMKgegy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=618 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130019
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211321

From: Khem Raj <raj.khem@gmail.com>

This fixes ptest failures on 32bit architectures

AssertionError:
Failed ptests:
{'python3': ['test_extractall_none_gid',
             'test_extractall_none_gname',
             'test_extractall_none_mode',
             'test_extractall_none_mtime',
             'test_extractall_none_uid',
             'test_extractall_none_uname',
             'setUpClass',
             'python3']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43104b547cb79693c83df0882773ae8dd74b1d35, update Upstream-Status)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch | 40 +++++++++++++++++++
 .../python/python3_3.10.16.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
new file mode 100644
index 000000000000..88b84c602435
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -0,0 +1,40 @@
+From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Wed, 23 Aug 2023 20:00:07 +0200
+Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
+ set it (#108369)
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/5d1871576500adc4ebaa7f59b8559605a57ad36b]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ Lib/tarfile.py                                                 | 3 ++-
+ .../Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst     | 3 +++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 3bbbcaa..473167d 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2557,7 +2557,8 @@ class TarFile(object):
+                     os.lchown(targetpath, u, g)
+                 else:
+                     os.chown(targetpath, u, g)
+-            except OSError as e:
++            except (OSError, OverflowError) as e:
++                # OverflowError can be raised if an ID doesn't fit in `id_t`
+                 raise ExtractError("could not change owner") from e
+ 
+     def chmod(self, tarinfo, targetpath):
+diff --git a/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+new file mode 100644
+index 0000000..ffca413
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile`: extraction of members with overly large UID or GID (e.g. on
++an OS with 32-bit :c:type:`!id_t`) now fails in the same way as failing to
++set the ID.
+-- 
+2.45.0
+
diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
index 19a85a8770c4..48f845b0891a 100644
--- a/meta/recipes-devtools/python/python3_3.10.16.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


