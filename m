Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855FCC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 17:47:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3366.1645120021789110296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E6BuuN1v;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9047f6eb5b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21HHJG4S014397
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 17:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=rm5WVlw1OoXZHnqbmP7UwNvGTI9NDJdvaM7oxWqwNzA=;
 b=E6BuuN1vN41seOO7asRpjCjfiUWpUv4atRaTzz7qf223iLdkZFNeuvXomVKQxPHMeywZ
 5fqy+LTpnvwQ1Enhm3SRnh+eUxE11YTJGYHPurwdZBGTnA7oaka3lL/Dyk4kDLb0wVf3
 icXE3c7M+uEaSg7wg0Y6ulVA7ap/kP8vKJe7I124uvvqxhzVVL7sOcaa3HHLWbs+xnD2
 oC8ibrzvQ3cXLHut3I0Epuwl/P5yqy7BtkuuadUmHBsdccoAOBnKMx0Ymo/Ph1IRZTfK
 /zlH8syjfeCYxZzcSgXMo+JBQp6p92jjKcSLhoRLXIiEz3cqAZ7PIaONit8cLb9GSJQF hA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8nc3skn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 17:47:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vzfk0OgrN1gdHVMqUfRU15NZDoftK0RpJVJ6C4JxZgkUUbQOd8pDxf6GXpYLJpSV1zthbEbVYO77WPBh3nF/OJY0WXj9yzoVEP1MET+9QtMf0qMVIa/Q+kBqL39sgSGaKhciaJK7vRRRctTqp1Dus3G3sOaEYYDrs9pDLTor4vUzAVm6g3PNJq77+tjCjEif+BOvc42hNoUvxFJxlrh/D1J2YZ6Xm7pXvXG7/oreRG+dnOmZ8M2iz+nKWUiprz0kZN6bKKnWaPlwxdV3tsn0y7cgGJuSuFGhePy4BvEW1c8EJJxu1tyeR+lZzTSEoWYrs/UOwjR0zPZOtfvAtlDuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rm5WVlw1OoXZHnqbmP7UwNvGTI9NDJdvaM7oxWqwNzA=;
 b=a0dmWBJ1QnoqsebnaLuCeazxYoDz67iSo+0DDQMZRO+Z0CiUtIH6FvHWRO8QaEdW/pbGIX3wOlAwepjz4BG4d0gvG6iSj+viOHj8IoM+yjNEFY0G/RtyVNA0fA+d8QAd8QDl1iy+oHTGeO9Vzt3bBQtW+PExL2uqcsqIF5lLbe3qlD3A7XZQUx6WYU8TOTcpHqThEwvxUPt2QrReXZwbh8qmWss3jJPDI9s6U4N/xlNNnFCOe6zfBevTfVe3sDNZLZoYx7KxbhLMgjQbKdfAyxwcvpCb5wnf5ZiSbFyhrEpjOJLUWgETgo/JEM2ture5xeYVy0781UedKHT21CBpNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 17:46:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.018; Thu, 17 Feb 2022
 17:46:58 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next] convert-variable-renames: change f-string back
Date: Thu, 17 Feb 2022 09:44:17 -0800
Message-Id: <20220217174417.731425-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:303:83::35) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0a81b86-cba0-4a97-cb8e-08d9f23d7e6e
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5474321C65D64A514ABF4BA2EE369@CH0PR11MB5474.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tzAF7Xa31pBOk/ChgnIMNaVPdyAJKJzMVt8Rd4Hyp0shv218StoIBKPFCv5te3dCXuroWH5nV+rsEHbjiDgssWaZE1ylI0P6vZh6INT1cbwzzmEPHT6RzayhDXFurgiYv/j7DvirN/XteddL0+yMXLE0uVDoXWCqQNH5JIvtmvFPNTiUKAiggqxVfhuOxnztb1biHIEe5yuA+iE7ErJmNzo2OPQW057wZuXeFe9XzAGanF0N6UIeYdcQeNcji9ul58hgXVqt+werLbDOx/QYjtywSq/9K3jW58e//E2/r0ag+AmYaG7oQiyNwSoOA/OdhyNE+/TZPi0s+Fcd67gZqkG8FANax+XGlIelmGYpOW5AEZ5slIujrhJ/JoxZYddpU2dzrMH/SjmkQR8NCeosP69IiEsHRoVPWAJKtv7dDI2s9PrIc0S6Nre2KVkMrFEXHXvY8FymxPLYMQf2uteyxKLBL8SYh5uTBxrIqECrkYW7UoZ3wWEOmIrvlb481UubBHCvco7Gu4r1bA+FG3G4Ya9YQwK5TBZaupBkudagHjJ3bCMdiw/OjwZqWt6TuvHYJMP/UPFEIHihXEf9dG+2D9n1yBT8QxACfXm/rLEmNYXPmxrN+fma8c6kfAahaOFex4qK9qadqTK20soWz4YIhyHvMw3pmN7tjSxoIUteO+DMg6OQJpetV2pDdHIyUtbH6iFMQdWKeRQMbyPFoiKb0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(44832011)(6916009)(86362001)(38350700002)(38100700002)(6486002)(5660300002)(36756003)(8676002)(66556008)(316002)(66946007)(66476007)(83380400001)(6666004)(508600001)(6506007)(6512007)(2616005)(1076003)(186003)(26005)(52116002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OWIVQrJNGL3yAz5TiutDW5jTHRQAeNsqOtSMpxP4XUarLsp53+2/M/RktFRD?=
 =?us-ascii?Q?VwdMVaU1lxnScX17nr6w689P42JDlCiAwXSMrYJMBe5QLMzfpUZ1XiKCIbmg?=
 =?us-ascii?Q?D4IUWT5XUIZKXukiuYcQ5rfMOLw32cbiMfJy2Ti40SIqdYYU+d5d/3VhiuLr?=
 =?us-ascii?Q?B0OlOF5iZ9p6NsVpX7vcLJR18oG8X/hZS0BMem5fWMG4A9DVx0fe2bCm6pIx?=
 =?us-ascii?Q?R3XinYb/uOHDHdz4W3NmkeksdiXAaSSeaQ5DqI6ELAfZCnc5KCW5W1KEK3ji?=
 =?us-ascii?Q?RZ7IMMjZe2h+3H9Twn5ytjjLgaUAqKqrsVAgyCTBlYlmXYl3ZoUBWuLUpBL6?=
 =?us-ascii?Q?u/S3a110SAHv1MneR8pfNPp20zelivy2Rrk5xOGQ6JTCAkQAZbLhPi4MZNjd?=
 =?us-ascii?Q?hD5Cy3mLXsVuFgCkAfmZWHBYiAV96Z52IX9ZtuzlSX0wDcWjmi3VaKDiGcSJ?=
 =?us-ascii?Q?6XN+S+wKi10+mWH4892uwVfA0jx7HUkbHlIX3R2W7P2al3IjJ1YZn0c1GSoZ?=
 =?us-ascii?Q?Ro0gEjoTftLFNfdFcYgK/uIaJu/kfpW5LJ8buvitZ6ag69JFT/zgDckLIoOc?=
 =?us-ascii?Q?oqQGByyqk/xig4uak3ymzXM7VR7EaqeXOXqVTlgYslUjTcidGhVcXveDYXQ3?=
 =?us-ascii?Q?fIe3rzisqyFpwkROmqb4LOLBQB0ucTv33ZBKGnBTaH3mSivFMRLtA0Zw//uC?=
 =?us-ascii?Q?HHqCQXrNXQ+eQkbM9PNNb1tRi/A/nqZnOOpECYdeEr1JNK0aE1SfcZiqkNRv?=
 =?us-ascii?Q?Di8VsHhImsgNQq0+zhM/nIlurH181EIOpOTJpNYGeueHsNZNXwrVIYThbWmf?=
 =?us-ascii?Q?digkmJVnQtZs7yEC3yLQRu+ZDN0+YYLFyaJ5E0aTeR9BFwGnr+ArA5eNrLT1?=
 =?us-ascii?Q?tmc+3MjlLf9vUbOctpaJ3AjaMg6CeAE7o1nJ7whavp/++92OwDWzjEhIme90?=
 =?us-ascii?Q?5i3tywXwQlU4vKun/NNFU0a4KAO5M/pEvj0GID8HzNgeZe3fPfMUw81V+Ce0?=
 =?us-ascii?Q?i7Nkknt9cxI/FCenq8XIpjZ/0JTo6zqXaYdNgM05CLtfhdOL/LlNcWz9D+4s?=
 =?us-ascii?Q?Eujx+qpj8H0Jp1iJboP9Ty7UQ7atkajPmt6D+SMhewPmAtdv95wmUMWrLd4F?=
 =?us-ascii?Q?BPYj0gXOFuhyVf92dvFhOi/QLgB+uPniPjPQ2kwvmSw8AFkRxgSPcpr1UP4v?=
 =?us-ascii?Q?7RAm6h4mO61+dKGGieB3EkJybryM4bFn7bhoSguj4nK/zC9WhyBl3FeUyZT4?=
 =?us-ascii?Q?lir0Nn8nHqiO9sLjOF6X49X1ELkzwiBz9Cd+BcEVugS3kQX4xjEsl7cuBZdq?=
 =?us-ascii?Q?6n70zxUQO805PYov4b0EWu7l0tHnIotEEpaDSvRwGp8jD08qVpPnAN1zWXn7?=
 =?us-ascii?Q?jk8YRNxCI/HLK9qTqVXjHEgagbRsM4PpgO4VV8UYKDoWF/pKcX9lZSLK260C?=
 =?us-ascii?Q?JWENLzAvdRqTK9MQvP1yH+FsR0v5DgUmZeV+wLTH3/xdQA+9LN7WkeN0GOSS?=
 =?us-ascii?Q?Hk2l3tl7Mgsh1+7BhELlfjyNVbgPjkJvOranpBXrtIetOdNZg3y7dvCY0B4F?=
 =?us-ascii?Q?XVrXG2SJgCKAjT1R0IblC4ok7qOvSlln7+wJCDrbveST6fKr0hyTbGjwEBW4?=
 =?us-ascii?Q?kG6B9ag0u4ySQYjM+6iO/n0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0a81b86-cba0-4a97-cb8e-08d9f23d7e6e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 17:46:57.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fNWBquhdYhslaRae6gkN0szuAoEfhpDabA7x+m4NpYw7f3X0YlSbKnOiTQeo2SIu+Ouiua/o0gwMPkIdUwns8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5474
X-Proofpoint-ORIG-GUID: gDJPgczCvBqr_7KHOmib-h9O24xj1yTM
X-Proofpoint-GUID: gDJPgczCvBqr_7KHOmib-h9O24xj1yTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_06,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 17:47:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161848

Add back Copyright info with update.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 scripts/contrib/convert-variable-renames.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/convert-variable-renames.py
index 28a3df597e..bc3e01887c 100755
--- a/scripts/contrib/convert-variable-renames.py
+++ b/scripts/contrib/convert-variable-renames.py
@@ -3,6 +3,9 @@
 # Conversion script to rename variables to versions with improved terminology.
 # Also highlights potentially problematic langage and removed variables.
 #
+# Copyright (C) 2021 Richard Purdie
+# Copyright (C) 2022 Wind River Systems, Inc.
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
@@ -56,7 +59,7 @@ context_check_list = [
 
 def processfile(fn):
 
-    print(f"processing file '{fn}'")
+    print("processing file '%s'" % fn)
     try:
         fh, abs_path = tempfile.mkstemp()
         modified = False
@@ -75,13 +78,13 @@ def processfile(fn):
                     # Find removed names
                     for removed_name in removed_list:
                         if removed_name in line:
-                            print(f"{fn} needs further work at line {lineno} because {removed_name} has been deprecated")
+                            print("%s needs further work at line %s because has been deprecated" % (fn, lineno, remove_name))
                     for check_word in context_check_list:
                         if re.search(check_word, line, re.IGNORECASE):
-                            print(f"{fn} needs further work at line {lineno} since it contains {check_word}")
+                            print("%s needs further work at line %s since it contains %s"% (fn, lineno, check_word))
                     new_file.write(line)
             if modified:
-                print(f"*** Modified file '{fn}'")
+                print("*** Modified file '%s'" % (fn))
                 shutil.copymode(fn, abs_path)
                 os.remove(fn)
                 shutil.move(abs_path, fn)
-- 
2.25.1


