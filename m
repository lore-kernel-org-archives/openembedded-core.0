Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA852C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 21:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1801.1645739751595886302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 13:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g8yxN9BU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9054b88637=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21OLgUOx031979
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 21:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=LOjd1GmeE38WcdAsIA9el9+aAhpxiBKH/fVLQBGMFUQ=;
 b=g8yxN9BU8jhmbBOE1BcCUCtEEZsBgSCoulOl4Hx69YO7FyRBN7pGc+WNAB18YSB7ENQ3
 EfTaAKJAhcqICWWDOv4Zp5xNy4KyUBW6YURQ+PCToce8mLqk3QNvYNdhjuWmchfe128P
 IxJrZ/LzruI4zypN9KYSp3hspLGIKxwwMwyidzv9FB78y/kGztrDJek57L3UHmIE+esM
 bU68YqrtIbWSbkddtGPA3AEx3oTq/KkDhOVBN7BEkthnXmtaTvMyYTpu1XbVnFBjuFMk
 y53VXbzrycu1TzZ34MDZxZvsGnrb+wgj6+iibweTE1mxdodZM5AZ28KdAyg+16F+aujK OQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eej5vr0a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 21:55:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEq1/JpkibaTOBm99n4QhTadsyMnMRBjcxPLr4UfHVlapeWXMd+vmGV6ZJqMmZs5aSAd187gRuQGPJX/9NciNTZI4yiM/Hm4tkxZ1uURNNYTtH+v2GvFU2TkPWhlgk+qAdMugGMDAILy6KIXj1uU3eRwneoS26xeKUJSSgRoJmDI81R7Q9U0owdKo8eZJ21GyuF8fwWUEHl6IlUZP9I22ier8Oq9BJzNyBEzUJpTr+jVGu6qHIRr0e1ArJhIbISXQoq5Dv0cbPH5UMGXa5LGtGu7OnT7ke4rEnmJ8B7ueIG89C2NihoY4ndlWmAL7hYtfrmis0N6c7l4zJtFdyr0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOjd1GmeE38WcdAsIA9el9+aAhpxiBKH/fVLQBGMFUQ=;
 b=IK8Ajbr9QeFHr7jwRW8I1yJ/5Qvuix/RuakEigOzyJjL46oSk0zUsm+wLnvyKvOjSS/TUjoLZEnW2vtyxfcHUwEupkLX4aP0v71qwi6KbRHtOiPWgVxZJ0sJN/JaDGjwsMo9NuC9UNSv6LJtD3i/XexykaOR1UQKeg3sICgqcw4f/RodeeYpdrTnpY6L5sWXJo8a/+Vt9vjPaMdjINIyXBGW5hqEoSgQnVbpyUiMALNY3FSYNpoqOolanBW/IoAs7ubfiJJF8AajrnUJYmsyutCVTj44G/XG3GbTUSm0+m4TsiuoRzcZVYIlUoLvY2upADIkXfNrs0FbkPlIAoeqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CY4PR11MB1494.namprd11.prod.outlook.com (2603:10b6:910:6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 21:55:47 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 21:55:47 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2] license.py: rename variables
Date: Thu, 24 Feb 2022 13:55:33 -0800
Message-Id: <20220224215533.133373-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0029.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::42) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a93b815d-20c7-44ff-a1d4-08d9f7e069f2
X-MS-TrafficTypeDiagnostic: CY4PR11MB1494:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1494B8F239042C07FCA3E7C1EE3D9@CY4PR11MB1494.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	exaTv9RN2ye/5rWh0fHTBIwdVNo9GgtBVcpB9ueuO1TWvhAzRFgVh4aon1/QFcBvpAjdbuZp6LKuhB2xAUUFBBM6+P9dKpTNep7QJT0J1xYyhyU7viaorNoG78ZI+V01HxGyD09tF8As1YhRbeqcEh6/jfd6vdML7gyBO97iS69rw1R2NohTwbFRTq6ukPUhKBG5U3MTvjE7H5HGtfdRYXAMlwpG92of6Esd4MDFvq97mWV6dZe6eIe5rBkWDdKMJmgRWmyp3oDXlCtB5gNJTdk17kZhPPmDwIPov9kVVOGVqkiwn3DhqSRmJJSy7BvYnQPp/D4UEB/4RUftJTWEf+SmujJechUBq1kt7GOqfZp3W5CKFEdVPkoCMcT5h5SmJ43sKg5hcAgoEbHdTyNxvAi0ypdvzQtYPaYtHzTGqMMWP0Cn+dCBWTM7YWglTo+UPKVlAB2DZbOrzJR5/WcNQ3Rp/DjfJwrMLKrsI1HOy43UOEWFFf0MSxdJ31No6VkijkIJQUi6wYTCB1cXQyIc/nRWN903TQSpRYCbT9vyBOQQMB9NwRSZ/tjWLWwgt+aumvkUEkeW81Szs6q46jBWSFYR/OFIFlazKbqLJvkonDud65gWEFV30DEZ3ocHozcYyWBVatRcSnx/o/M3wWI++r/oK6mTRsIw78Fq14EPVYWfF7b5+7rQGccIOekS7r/gNo7+69rJ9Y18M58S/kzXgg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(44832011)(38100700002)(36756003)(83380400001)(38350700002)(5660300002)(2906002)(8936002)(6512007)(66556008)(107886003)(6486002)(6916009)(316002)(186003)(26005)(8676002)(508600001)(52116002)(66946007)(66476007)(6666004)(86362001)(6506007)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X3nzcN7dCTYAOqTsgpFVRAbbquTyw/wHXmTf3ObI/B8jbBLI63o4FUKeFE5Y?=
 =?us-ascii?Q?yn7jFKTGpgxl/3JbLoA1SP05e5ReXTUzWIPFNOIHUSw9kpaJmX/KG+i7eALv?=
 =?us-ascii?Q?yCpMR108/8DndMQjaBvWC4dhJ75NjsGkurNgTzmFI5WRUy4MhGtLXDNfUFil?=
 =?us-ascii?Q?1a6Q8hMi11ZdZV9u/gN4JiXu7Ku5Ec0LvHcYJAXZplR+4sI4rGGCPL+v1hjf?=
 =?us-ascii?Q?2z0IoXJsAC935y+jY9ZSvT+FdH7GGQsr3tMzV8Mxv9NL+k524KKQdsK97Exn?=
 =?us-ascii?Q?s5z5YUinV6L6IeL3C7UlKmU7WcD3TTJzBQKgZjw4/ELIu938P1imsFrrNnJE?=
 =?us-ascii?Q?XiHxzcnonwr349sOxEs3XF7ACY2dmQswGuq6B8k3Km1lSAHJqbDszv2lnK0t?=
 =?us-ascii?Q?f9KdnLFhOgSWY1pL4BXgnUD1uFnKaAWAkAGZVsv40K/MfyKUnB+u+ncfA5nu?=
 =?us-ascii?Q?TnkOM1jJxSrMibfk0ecj/TFwylX4lLa9/px5DaiQOG+c12s+mz3ToQcjmYMA?=
 =?us-ascii?Q?aXyuN8Pm8Je8SlycMfbzt0cti6CR0Fsm3wkZKsuSvrNePG8m47ciMfMqWGHY?=
 =?us-ascii?Q?gqE37f5rG5MY6861Q4ym73Qrc6bQvuCtFt4FVu0jHngxdCc1FZLfLtf27c03?=
 =?us-ascii?Q?GG46My6wn70JWX22ticmBBKUWTQxXl0sNQJ60njl/J6yagwxNb4pBn4eMs+M?=
 =?us-ascii?Q?t9zXkE7c77YNDovlZlPe9DiytxppYL8VATXnrp5jCufrh6dAXI2Zy8wy9/NJ?=
 =?us-ascii?Q?3qT1FOCXdUsPPK0UjDQksBf8vyHHX/O5bOqP8KMs4/8rzbv1yLWhjH6CrCo9?=
 =?us-ascii?Q?hMUWv6SbV3084+MMa1xWKFfSmxuRucCD8s1VDKkW7lF6WdaU3L/b9UVFMXgD?=
 =?us-ascii?Q?Xld03GfasU5sGs+Cuiqayf6g8Iwrp4ifc8oVeYzx+p+tj8tAHE6Q2nJfckBV?=
 =?us-ascii?Q?OqwBp8VKYBmpq0goLG+e1IHx93ft0TlkosUA31LExMNO12Q8PQr8vk0dTnpS?=
 =?us-ascii?Q?Uryd6Q/f/rjaNfy3pt94KcY3S8gzNnhqTmhb2RusY9l/uuThwcSn1JtGCzZD?=
 =?us-ascii?Q?Nx9dlGG+qmiQ8K+OYfbFpWJGNsw6wUN4UPHkIUug7saSFcc9goEwAoDBwVTa?=
 =?us-ascii?Q?5kllB8gJ/RN4MaBlq5BowSZfztbyMD2ysgLsyuB9JjoZqyBOmePP42ELuhW6?=
 =?us-ascii?Q?NGJf7AsPBXgdGmEBAuk4IILph9H3Ewu3r3jUqZA+TpB8ISw50lgVOysgmv6W?=
 =?us-ascii?Q?UjAOf/ksGbMl6jk5PjQYhwDIpg2RDcStCMKv+V+MKcFCgydvT8DSU4bELfGT?=
 =?us-ascii?Q?Y4qH8C7ojWNW1jTeA8TExGgf/2+eJEMKBCLJuwA+cyzu7ZHiOxblLHA9vkuZ?=
 =?us-ascii?Q?ANvtD3O9io+y1KJsEKoZme6C8AZwNm+O14qjSobw0KLYKCdQliZfwJYnMzIE?=
 =?us-ascii?Q?xbR9c9/E1kA+6VjVMYI2Nb1X9BPRrFWRLuKmtK83NjvdWSFimFD8XGcwOD8X?=
 =?us-ascii?Q?6gu4YB2oEU/AyJIPXT79R7kO2/sytT94PSxtItxFK3frW9jJkSqiqsPY/Yfi?=
 =?us-ascii?Q?J0JDXED4/h1G8hq2krFRA8+Apbl8jCo6opOtKtKc3C9GyEDgO0R7tXb3k80V?=
 =?us-ascii?Q?CUE/j/coqq4JX2I3AKqSaI4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a93b815d-20c7-44ff-a1d4-08d9f7e069f2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:55:47.4847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ovcF2XJkeg2jiIXAkWkp1g/r9KI6l5U4PZEPAL+l8dyRvOXXohiqklR4yNQgieyQTept3FdnmPH+AUZ6xG22cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1494
X-Proofpoint-GUID: 23htQu4cDj0Xc07tGYuK2ZyhMrGb7lLe
X-Proofpoint-ORIG-GUID: 23htQu4cDj0Xc07tGYuK2ZyhMrGb7lLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_06,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 21:55:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162331

Update the comment to reflect new variable names

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: Update comment and change include -> include_licenses,
    exclude -> exclude_licenses
 meta/lib/oe/license.py | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index b5d378a549b..b1105f6149c 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -99,26 +99,29 @@ def flattened_licenses(licensestr, choose_licenses):
         raise LicenseSyntaxError(licensestr, exc)
     return flatten.licenses
 
-def is_included(licensestr, whitelist=None, blacklist=None):
-    """Given a license string and whitelist and blacklist, determine if the
-    license string matches the whitelist and does not match the blacklist.
-
-    Returns a tuple holding the boolean state and a list of the applicable
-    licenses that were excluded if state is False, or the licenses that were
-    included if the state is True.
+def is_included(licensestr, include_licenses=None, exclude_licenses=None):
+    """Given a license a list of list to include and a list of
+        licenses to exclude, determine if the license string
+        matches the an include list and does not match the 
+        exclude list.
+
+        Returns a tuple holding the boolean state and a list of
+        the applicable licenses that were excluded if state is
+        False, or the licenses that were included if the state
+        is True.
     """
 
     def include_license(license):
-        return any(fnmatch(license, pattern) for pattern in whitelist)
+        return any(fnmatch(license, pattern) for pattern in include_licenses)
 
     def exclude_license(license):
-        return any(fnmatch(license, pattern) for pattern in blacklist)
+        return any(fnmatch(license, pattern) for pattern in exclude_licenses)
 
     def choose_licenses(alpha, beta):
         """Select the option in an OR which is the 'best' (has the most
         included licenses and no excluded licenses)."""
         # The factor 1000 below is arbitrary, just expected to be much larger
-        # that the number of licenses actually specified. That way the weight
+        # than the number of licenses actually specified. That way the weight
         # will be negative if the list of licenses contains an excluded license,
         # but still gives a higher weight to the list with the most included
         # licenses.
@@ -131,11 +134,11 @@ def is_included(licensestr, whitelist=None, blacklist=None):
         else:
             return beta
 
-    if not whitelist:
-        whitelist = ['*']
+    if not include_licenses:
+        include = ['*']
 
-    if not blacklist:
-        blacklist = []
+    if not exclude_licenses:
+        exclude = []
 
     licenses = flattened_licenses(licensestr, choose_licenses)
     excluded = [lic for lic in licenses if exclude_license(lic)]
-- 
2.31.1


