Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9792C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 01:32:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2022.1645839139308213374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 17:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=baR3qpHb;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9056547f3a=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21Q1WIc2013673
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=CMzCfW1O3CNSScQQxtIVrh+U/OG5y9OuSM6u67BQGJk=;
 b=baR3qpHbhyGgu48S/9m5T+LaU0PMLUnaWNVc69Pz3hMhM74OpU3T6HJcFzO9PBvz2fBA
 rKYjBYV+2P0WlUujcyVz0C1p0kQbjLlM2E6MpurPP2GmP6pG7ePFP8Ag5CpY1jglQr5A
 Nbp4/SNXOj+jilXlegU9arBFJSDp3WGzReXloBuL/NW3C6yN78uUG3pzr1ur9Dm6fpBL
 fcfv3+k0MbfXZa6VQE2GZ6RxnvGga6asRbtFd6Pcbj1Lhr2of5Sf15caoUOm+2kh8hXX
 O8piZ7PJHK3LE1KSLC94LwCrMIiVxsrGbZ70bZtH+xmPhPPLPe9ihMRbduI7iHvvHwD+ ig==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ef9e1g1ac-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 01:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfXss7/QAxJJg4ENi0/PqMd6Wiu7kVgwe1nOwoVXMiThQL3Nbw4bpPPRoCoNifMNEmy5B0RTaGn36mXP748DJXPvcVYh6mL1tDxdLNSRJO3jiFBUrsd6KC0iDIHpxNetHcukydKvU8mhcjDj5JIgwgScFln1odJ2VHRW3HjnCHErdup6m0hv/HoCegOjRtcPEKgACq1cfmVOruhVmARoD8tibIJ84mrWOK9EcMIpZCWSYS/TkIdU21VmKOIwWGw4/cO5yOce8ofyX0ePMNjLH/wmTQs/qQ4XFuecrTD9EqZwPSJO/6KcnxQ4om4psajRJePhaKdp6YHfexP5Pn9iTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMzCfW1O3CNSScQQxtIVrh+U/OG5y9OuSM6u67BQGJk=;
 b=JiotB56MIwP01Q6q6bHYV7zHWs4c+TmmcPw8HPGscNuyy6AghdKUKt4ntl8ozsI8TFAEAW60nXcFBNJVL9+TLJZyXyfKvpcaWdHI+W9sQThneGJZpOJ7M6cD8pDDQicAWlOh+f3jehAZcP3QKMbgvMURwyaqFGUuObqyWWsK3WjXbsOZgXtyRvOLeW9zEd1H+BEMRmBURKgw9lCxJkpZqdT5z2Rfi9svUNaJpkiP40NvCQ3LjNJPy9d0ZuKutDrlZGIhPknOwYLpr+QiRQnbUK7ET6ys0O74Fvt0P+F/5YIAIQEJRkxUlkKSv7DGzwxSEnqHXGP7lL4Px4LixsZt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Sat, 26 Feb
 2022 01:32:17 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 01:32:17 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v3 2/2] license.py: rename variales
Date: Fri, 25 Feb 2022 17:31:47 -0800
Message-Id: <20220226013147.120437-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226013147.120437-1-saul.wold@windriver.com>
References: <20220226013147.120437-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0255.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::16) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8233edc2-16b5-4a13-12ba-08d9f8c7d2c0
X-MS-TrafficTypeDiagnostic: PH0PR11MB5928:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB59284E4ADB703F63EE8F7C5BEE3F9@PH0PR11MB5928.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QlvWdRoCqgP9jtDmApJqLoPHl4hb9Fb+pN+YYqqSgj0zhCXtZqQqVd8spqqIlAYUXx/RErdyN5KgVNg3rjZoef3SMHMBOUrZLpHCCrXpehzxNba1979haSwydafkWAYX0U+F4dO5JDjk9eu6Ya/zppIQ7BW0cViTvBr0AVrVgYiRjxwyUedY9T5JOS2W4FD3/gF+OXGan41QMzR/Dqmad+2dJ9aOb/nM4jbHhGsQsI5sjK2mdDVaMlXkCslPsCt6+Qn5CfPNmL7XaUm0notJvrdxF6duy0djzgpn1J0KmOojSUBYcbnGDE3du0GQ/9TZrNy5D0BdLjKiAQ2iVqogOeqt3DKkDH7/Si6Oa2rcg+qQjxIJR5JRQA3DVFQbVqzIABAalo6eVKR55YNqZ1kPHP0PUhIV7OtWLiUBirOoPBFFe+IEUgANZBXG97V60DfS2DcOLs0iwMAAeiyfyldsuzIkxPWxB6xJmvq22y8sFf76xFZzm1Nr8cQ69p+p9Ef3nfCTHUO+B8eCWayqk4JusKhaz7A4lxzn5mADW0xk5OR309ckNhRE9rBLYiyARfu8ngEXtw7ryNihcsxVh78gKaJhJfT+yEivioQxqsOJUTIQ/D3JEOQ1eM4OmdDyOEIdC+BIJTsfTQ721J4lppZKPX5yKrj1FxdkK8rQV+UD5yT5UYG1QSb5Tgwuw4SgtPsm6sd5dmPf2kb5LdKtyhi0pA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(107886003)(186003)(26005)(86362001)(6916009)(1076003)(316002)(52116002)(8936002)(2616005)(6486002)(44832011)(6506007)(6512007)(508600001)(5660300002)(4326008)(6666004)(8676002)(36756003)(83380400001)(66556008)(66476007)(66946007)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0/6OSUAhkDlKQJ0DvQLx46H+syp3s6DOQKqUkV39J6G1EVBHp7S5WwcflWj2?=
 =?us-ascii?Q?Qg5GZZTMIHmrkIGu+b4zMm8h4PDgFT/VMJ2m6KupfGZ2cSHSsDTovaD7kdPI?=
 =?us-ascii?Q?iMZjeure4QghQcYVDc8dmkIFXpf3StlxUqx2knLX7FIBsQE+uSqiFNaNeUCM?=
 =?us-ascii?Q?H18GIrKj4727DYMhD961M1+KnyDWdDSwbK6Vyf8dIsgAfx+NA6rLYdTdFzae?=
 =?us-ascii?Q?CAS14D2mpu145J7NNgah4jg0/ozDT9QqvRspRsFWoOkhY2xX3AZlGhbk+fG9?=
 =?us-ascii?Q?4MvJleXERwMN/WhWkio8JHjAeiErkcVimP3ZxARilY3W39WxyAt8kM7q33a/?=
 =?us-ascii?Q?vJsagNnl3FCQUOke4ZcI9qd83gJdNWadYf01QywcrKBF3DSOR0EM2XM6KhL2?=
 =?us-ascii?Q?PyE5P+DWy6UGxffmz6pXDsl/IPLXuToqcpz+zeTZc3VRj+Jq34PjwyED7Xnb?=
 =?us-ascii?Q?Tczcx7GlRhnqvmE1y9F0D0UivOdOAxp8sK9yPonwTzGqpYF1SOAKBYfMuf4Y?=
 =?us-ascii?Q?z6zFe+d8SKln/4Snz2EGGH3XvoSJHj0DwYcuZ2taTDCSQTwNXVbpg7NGoKO8?=
 =?us-ascii?Q?GOCUOR6QyACMMIVi6LdF9FJOgsLmkfENnE7l8TYWrzRnQ10aWIvq/tq7ukix?=
 =?us-ascii?Q?T8ZNB6K6BqiyZPDgnXfGKD6E7QDEgg1/AlOT3Kp3QYeM4Tl4gaKEq8iD7ayd?=
 =?us-ascii?Q?PgyrkxBcx8InJ+VMlNfXiidriXS3KUKhcy7TfH9fq1Gl1xVwgR1IEsP0ALvS?=
 =?us-ascii?Q?CCEMIYIlHPj5Jv2R0x02SeMLdY+tf013l/3Qy7xuTs0hqwdrSYXUdjqRhcf8?=
 =?us-ascii?Q?dUmkaU0mitCooz8ax6fz0GZw6uVkT59nqZMGePIPSW8J/iJzjd2sdSBkHTT+?=
 =?us-ascii?Q?k0p14dlm4AUkx/zSVGdMaLhOSCBXL8XZPjzapqDHUlNtXZwv8O2y3h1hdzCj?=
 =?us-ascii?Q?0imfjdzNE2aPoPrFRi/CIPRIkKPSMJTTZjhHck5BBzrMj7Ddj7oF0Jzt96nZ?=
 =?us-ascii?Q?tk/avNgRgr2gi8Q2fP8VYglLKtfGzZ8ttZIMFoTjBN61PektJXuDMD7u4lHE?=
 =?us-ascii?Q?cSNFE8daVU9MIJ8FSAMAwcMz/xVz/XYtCpN3s2JLcsmbT2T7FnzAx+gw3oNW?=
 =?us-ascii?Q?TvuoznBEEWNzrnYWF+DKLOYocPiq+owlzklpwXJujPaHFU1IRQfImPcv8aod?=
 =?us-ascii?Q?u0kplw3SlUD61Yvf1inQ0rWWt1xaOqVSKrBOwny8XgPbALpKpInNFQ5DsTOR?=
 =?us-ascii?Q?ivacPbQkii/zRd8rm/GWCmPNHc6wosIhnSkFnFjEa8ORMV8AXPZZ4HPmljhj?=
 =?us-ascii?Q?NX9va+9QLne8/bZmuwNs4PY7Rs3IdM8mIAeGw9a8Z0hcBbuQAcvYHTBYp00O?=
 =?us-ascii?Q?uiZGmrp7h32l6cZOgNmWzrCOoh6vFUwDUSnGgMvX2OQmvlrbOgZOJtMNaY03?=
 =?us-ascii?Q?4fd3ICj5G16ej5469kLQXCxbZ5lssRq08P7Kwc+chtWdgJHiOs3BZU95Q5NV?=
 =?us-ascii?Q?D+nIMI9kZ3b8vU0yOIgK69WEbELkCWwrKIRkWoel0NiJ9Y6Syu/M/xMcDILn?=
 =?us-ascii?Q?A69TPoHlSLP2R0T1w+/WuO8sSkoKEKSrfhZ+N6Kw12rr0qdAs7Ae6/dlS5KB?=
 =?us-ascii?Q?o8XmfhHnQ0bsi2TWMK9L+QY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8233edc2-16b5-4a13-12ba-08d9f8c7d2c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 01:32:17.1207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d0cwhSWqHj3Llhg41TCHmsJsqWTMxGDFAoNYlRX2LjrXQ8jkbxYo/7QMjbi9spB2A6r2Okj6fnGKjJN4Dd9SOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-Proofpoint-ORIG-GUID: kIKDvjWFaVhoKZGjve341Ve8130GBLqJ
X-Proofpoint-GUID: kIKDvjWFaVhoKZGjve341Ve8130GBLqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_11,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202260010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162417

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oe/license.py | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index b5d378a549b..4cd382b4fd7 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -99,20 +99,22 @@ def flattened_licenses(licensestr, choose_licenses):
         raise LicenseSyntaxError(licensestr, exc)
     return flatten.licenses
 
-def is_included(licensestr, whitelist=None, blacklist=None):
-    """Given a license string and whitelist and blacklist, determine if the
-    license string matches the whitelist and does not match the blacklist.
-
-    Returns a tuple holding the boolean state and a list of the applicable
-    licenses that were excluded if state is False, or the licenses that were
-    included if the state is True.
+def is_included(licensestr, include=None, exclude=None):
+    """Given a license string and include list and exclude list,
+        determine if the license string matches the an included
+        license and does dont match an excluded license.
+
+        Returns a tuple holding the boolean state and a list of
+        the applicable licenses that were excluded if state is
+        False, or the licenses that were included if the state
+        is True.
     """
 
     def include_license(license):
-        return any(fnmatch(license, pattern) for pattern in whitelist)
+        return any(fnmatch(license, pattern) for pattern in include)
 
     def exclude_license(license):
-        return any(fnmatch(license, pattern) for pattern in blacklist)
+        return any(fnmatch(license, pattern) for pattern in exclude)
 
     def choose_licenses(alpha, beta):
         """Select the option in an OR which is the 'best' (has the most
@@ -131,11 +133,11 @@ def is_included(licensestr, whitelist=None, blacklist=None):
         else:
             return beta
 
-    if not whitelist:
-        whitelist = ['*']
+    if not include:
+        include = ['*']
 
-    if not blacklist:
-        blacklist = []
+    if not exclude:
+        exclude = []
 
     licenses = flattened_licenses(licensestr, choose_licenses)
     excluded = [lic for lic in licenses if exclude_license(lic)]
-- 
2.31.1


