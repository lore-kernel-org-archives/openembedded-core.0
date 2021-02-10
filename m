Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.73])
 by mx.groups.io with SMTP id smtpd.web09.456.1612925219396249492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 18:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=knQKmtdA;
 spf=pass (domain: windriver.com, ip: 40.107.220.73, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g51R0LMViDGjDsffiJ4VUp//DfFY9ajhZPaxqdxluEuJjhU055bB0NFR9QnrICscBR3eSDqsz5R54+vJJR0PRPq7OYkTJQtFrfh1WeDKzCx8dwv0YW+zNaJW0sScH/FSxuI/noUqqRH9J6AXKpXIchHLmglcwq3JAUoAmPLcmVZ5For/HwtP6uzgBNU59Yo1iuxLficw/XoB2CU1qDppFXfqZAMsybBMYelMTIdlOzENQpXwAze2MBokpwbrQungup5FWRRE5Y9lSNZs6jX8Ty7Ja5NJJgE7LX9cPWwTVIyuI3QfG+7jy8nuMPsFIdlwfsQlWkVZK4f19wiu64Mplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QogefvTxI/TXBn0dOCz9GZi8JjSXXyao/dYAMQVFhE8=;
 b=j8EBJdxU8SqeY+8qwd0ChDWrCGeeEGeEUcGFhWjwz0ARCS2RHbk3hah+KbYCFxTUROHPV8wIFSAtEadJm9yTkknPlxec59u954nSN4d3OGMxNb2M8MPA3p6jjgRSThFrlRDuE5KAFbe2MPI01dd23OwkPHCzMw4FRDvu4CRNq96iRfKRT9mfioVg17f9OdQKZpF/UAjz+6XY7V9063ATqns6CyzhGoomR1Lj5tVja2W6CgTAtvWvyWpmBVhILvI+E4w+H+wjmoliRMp5CfYerWXUzPQnW7igiyB7pKSdujW1Mqle11ozLKR56ceBwboXzfE4kBNyvAdssS+L1Rf7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QogefvTxI/TXBn0dOCz9GZi8JjSXXyao/dYAMQVFhE8=;
 b=knQKmtdAbivdlMC5unf8JmkiSMGU9fRorGDqNa0eOOH6t47VgSrAteVXviQ/zH2sC464XCHNTQOvmjU6Lgq+DomBWGNvC74FH0m+07Gow5J+P1rKzda5ulrtDdEhw3AXFmmzvQ5P6qoRcuTmzWxLVlQKx+xW71RPTcS7LAt/LyI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27; Wed, 10 Feb
 2021 02:46:58 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 02:46:57 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.bbclass: improve the network connectivity check message
Date: Wed, 10 Feb 2021 10:46:39 +0800
Message-Id: <20210210024639.1033-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:c9::10) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR03CA0023.apcprd03.prod.outlook.com (2603:1096:203:c9::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Wed, 10 Feb 2021 02:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72d75aa4-276c-40f0-5dd0-08d8cd6e2224
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2143:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21438D795E214E875A19D286F18D9@MWHPR1101MB2143.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oB7DDI4BEZx1g0oGJ2WAAZM2xSt+MUqnP3GdJa4JkglGatCZd2wQRjw3vgs31raNMUocNzn/jlfgfD02/bai5h52+JUmXBn/VdyYR6kwwZGcC/SNhhWZ39rK5XSXWuZb+ERlBqqrZtXbzuIQ200K3pydQPqhIK+vYpwD/aivUvClfWyph3lThKiQK9LtECDU7JQEDCxaM2Oj0J9KSRXF7owV9/sbEYr7Q2/Rj3xKCO6zizVYS6kMuwfhUSjPIfN4+YfgHylYGZXdHFgbZ2fXX59Fo6rub5LQiDSD038N+iRl49DygFHt217TvQ+VEo6icSnt2/hHuj5JYwM0GMvokjkLtQ+mWoNjAtgvq4OiZLRGw1/3yqwvlKcKCTRAxtKtO3Ct2KPYeHtRSWIcYksj24qtR/8LYvH1ZxQu8QTQnZQt9hfs9C3msUKQyY0cPtML37BPs3pEtP4OKZwX8eSFmq2TB/czm5EvKpnVsdl6m2ROMS+0p2Oftcs/rkfqqka7AhcA0xjzzoy1BBPJnTUipHj+j0cvW4magcJKdGHm9XWjb0pRoK6CzR/UxvvIr1QG+2g1qh9hfMXHIX7HAzdAY77JDgXsi8oUekKxPBddN38=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(956004)(6506007)(2616005)(36756003)(6916009)(1076003)(186003)(6666004)(9686003)(16526019)(2906002)(8676002)(66476007)(86362001)(8936002)(83380400001)(5660300002)(6512007)(15974865002)(66556008)(316002)(66946007)(26005)(478600001)(6486002)(52116002)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3Wcv8J+WRWAyDPKW6omFhG+PXxw20cV999IRDpg8kuzsVXJj3FnuLcb+ejZD?=
 =?us-ascii?Q?XAAsRWCMZt5zQa4Co6H+e4v/2zpXg5mL1ATtysk/2oFOTG7er55HPL7InHiV?=
 =?us-ascii?Q?sdY6Qq559XWe8t5+cpbSTDEQCvt2gKhW7OenyvrAXLXQG7PmlQYDT2PRZofi?=
 =?us-ascii?Q?7c9DoOWSFuzvqZE4H4uBWu6kbcI058Xf0JUXeMPhwK70l9oc/Xntp6BevrZY?=
 =?us-ascii?Q?awHxjyDgW9JzWLTlY6Pdh57YaNm0zPU4+3JoSp1ok23rm6wsMKlu4fqzkoSa?=
 =?us-ascii?Q?rRcwlKBjwA4QTqnWNWMGuRjxOlNV3R4D1eM8YOJjYbqW7cYyPU1KNj6mVXg+?=
 =?us-ascii?Q?gLlMjFxHrG2xGjxhsye8sSWOmvjUbCXmmV/s25ZukDjWNpdQjwNIgnDJih8Q?=
 =?us-ascii?Q?UYrcSZv8jlkcYUStfeBc6H041ZlAACb5m6fAPC7CL80C04Brq8FdZ4IsFubg?=
 =?us-ascii?Q?RRXd9ZtCDVxDZREvi4zC7EhSLNW1hs0j7aEXmsZd/ZIcMkx/0VA/5CVT8Dnb?=
 =?us-ascii?Q?21MI6AgcL0IuHgxg8wCt3/I8WwVa4CYOxHyZlv7reWXbCB6vdT62O1GqsbV5?=
 =?us-ascii?Q?NCJlGUHixhWcGo4KzwnndOZOq87zUbPP0Ao+y33HRF28eYG+JIgLbYvf6W6x?=
 =?us-ascii?Q?N0hpWhzDsthYprLrRmkjRZ0FtD/O/ttZAOxrMVZ8ATjFuEDbjFYvBCDvoxYr?=
 =?us-ascii?Q?qv+PHQUnM/i0xyhqerZrBkGRNBK2xb+qse6lBlniyG2wBNwHvyj3AMjK0MAa?=
 =?us-ascii?Q?1pkPAkaYcyk0hJmX10pmqEMoFScYQQ1ZtFDFZshl18E2XBXJGc79TYKl5meB?=
 =?us-ascii?Q?WzOIvFFSM4kmYzu3wIh+Y/Qeh0EZDlooZ83d2TDZnh3rCPRVOx/VuaXhYJj3?=
 =?us-ascii?Q?S/s4ec1aZTAKPxNa/4/FGqKhGeUhO7yc5+lNWSzk2/y/HmUdTvi+JVVDEwia?=
 =?us-ascii?Q?3zu1qIZSgeOD5tomSs3KU2tI/TM2U5CLQFFXgYsYAcyb5/77pY2t2hNZePv3?=
 =?us-ascii?Q?M4YeZujjquq6GwiJDQt2AqR8ya58Ll2jJfGPHwAW7SQn6c5NOZzrIChxzl/G?=
 =?us-ascii?Q?ts0kcK5e0xolE4uCehUseN54905zheaRLnWzLxtH73omjLOuWT8udrOFlQuQ?=
 =?us-ascii?Q?D2vsd7egag627/2UdSfVdV0ExVd9DjSIwzBaiEHfmcHe2ZYHy+Pn+1L5ARix?=
 =?us-ascii?Q?UV6SNgh2UXNsvS37Bqd5OHG5CmCrq+EBq4kr3p81H3DugIdxbdNFNQcAmE2L?=
 =?us-ascii?Q?l/ioZ+D9t9pFO9T3vYHDWh5hbPa7N+a9Z7zTl/j7hmlMnwDS1pTW5mI8FGHZ?=
 =?us-ascii?Q?8621RvCsITv8zd8JvIEhBCuB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d75aa4-276c-40f0-5dd0-08d8cd6e2224
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 02:46:57.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x73K1VXRGlrhUYvkTEVC7Ksx67BWGdWgg4NyNSPPxR/qq86DnTjJuTH3kOcHm1Q0AgthuYGvux4XNy/n41Pew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The network connectivity check via checking www.example.com by default
and also can customized by CONNECTIVITY_CHECK_URIS if desired.

Improve the check message to let the user know if the network is actually
unaccessible or the checked URIs is wrongly set.

[YOCTO #12708]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/sanity.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 485173ab48..ebf0a559a2 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -389,13 +389,17 @@ def check_connectivity(d):
         except Exception as err:
             # Allow the message to be configured so that users can be
             # pointed to a support mechanism.
+            urlmsg = "Check network connectivity via the below tested URIs\n"
+            urlmsg += "    please make sure the below tested URIs accessible\n"
+            for test_uri in test_uris:
+                urlmsg = "    %s\n" % test_uri.strip()
             msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
             if len(msg) == 0:
                 msg = "%s.\n" % err
                 msg += "    Please ensure your host's network is configured correctly,\n"
                 msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
                 msg += "    all required sources are on local disk.\n"
-            retval = msg
+            retval = urlmsg + msg
 
     return retval
 
-- 
2.17.1

