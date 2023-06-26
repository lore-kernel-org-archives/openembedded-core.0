Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C209EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 21:48:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4883.1687816128209551039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 14:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=h5Ycivc6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5541c98b54=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QJW0vu018686
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 14:48:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=iidIinHjKHQZ3ERBde
	JV2FLjns8IjBPVrS1jdG5Hzig=; b=h5Ycivc6qhPUvaqsRahf1NTG564ME7i3NF
	ir4mE0w9CF+4U1bbXnDY/8H0bH0gRPV9fATvhoTfOTGilQ3qTclIhwqpvLnMV6Xx
	wCtXoRHSnyMMlC2JZ/rtR9jBVOeF0lHjBNEuTez5KS9H1j/NHOkVYTAI7Ou+b/Ik
	SAKqBu4y0JrcFulCSNQfqDX60B6DlBo6/KfOgGBQ+pvHtknhN0aAWYxTVer0tlen
	Tx38mkrcV8xbin8OPGf/PIOhvGofcYdg1L8e2aB3uorDT9EHZh5D7G9jbavAQs4e
	AleyfU3N/IW6GtfjHOQ1DkqtjBVgFtGOtPxNLHGhOS06V/wtVy7w==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxt22v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 14:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZPT1NJx4oGsV/YzBhpZOFwji3/9ZQgvc/r2AmxXB2gj1WZUiGw///BD2wD2GcHO5QbJfxV3V24VTjP0K6cgProTQ0puNO6tWZ4EtuJIJL4Kkke17vNGx71lQ5C7nQdazTdJViX8aBZdUHmdGQy4KSeSnTXTalf9ms2xKLw2zuHQyH7XxMZ+XAnyTW9ee/QYa5LNuzL34Bw1+rLnP92TCjX3uwqG93e5CHqeAwy+nZrjcqGFMREVMqr7An18y3eyMdNFjn1GpTAs/1EEOdUDSOR6PVY/7FqItAa/5t2hGaKw49PQlbNPOISmEQX9/TqCHoFGodFex/kjOyMdxw1w0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iidIinHjKHQZ3ERBdeJV2FLjns8IjBPVrS1jdG5Hzig=;
 b=Is2WzWz0ZKRrM9M7tjAuMuxXzLu1mlKUzwqcMDPEPv4H1qwZ09/hLwdRvfRZnqzINYy7rSKbsHJTZUcgO6mg01ccc+tiIVu9ttTjr69sgaBY12i0rrQY22TRmity0ZDd3FAZzmHgNe54TMnw2ABu2vWTHN/4UO+88znDulgktbYSNvmQ2HXDIqpsaqPdOIXFsIlL9q00/vxBziB4KJ1e6YAyWU5gVZWzBdqNsDSnUW93CYAieGK4eh/yvCNaVI7NoitXRzqYS1HSCTav2hr6PewDkgizq/HcSOqRdhbPL/oPkNo6DpFbVfTajigvd5tGGGO0BwFYw/d1iKYjH3pKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Mon, 26 Jun 2023 21:48:43 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 21:48:43 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
Date: Mon, 26 Jun 2023 17:48:30 -0400
Message-Id: <20230626214830.121925-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:208:32e::17) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CH3PR11MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 3731eab0-7979-4fb3-a6ed-08db768f1c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJPpa7UbOLiWiTiE7Cm5PXz0XL1GelEvnsAHjFyEvMSluQbJ6ULV/V/4bJpCacMaoRcxCiq2K1JoV/GDIvSJFwLQaueC0LCtkS0Xz1p6G9otf5WqAWPWo1101ttER2/5J6hNKh8BMti733Go8/9Brd/YJDgg4AiwokDlxVY2+Mu1RaeHYrqEzSsBdPShAZroZEF5UyvmK7WO7IO9S2Jk3B2QOTcDu4lqwpzXS0KRJcfgUJ8CtFJ/ND3eH2E84AnyOZOZn0iS4N0uNFk7MXkkU0QwoUXN7gLJFlj6MBehP1/TzsktBhL/1r2KbEB/Ipxp4pbyK7YfF+qfK+BHCvQuz2AP/MV+GSMAIySouKIe3ucvUygGDDuIBlaUTbB5pyFt67fMXp7x5veMPxdfhMpRY1bWs0hcYFS/T7DoofPOrts+oF3xid/I2PWVV/pjtCUcgGUYYNvabw2BnDQyhrPWCAI1vOs7h3k79siY5aRFJSzezEsMKIatkH1QESeVFWa3T40tkDZjMZgMGmm4cdf7XUDWoUXS9Ojz+Ry3UDtJyYwn3w64FD0C/fTCYc2yihVYBaaKCEjATRQExqqzvG8b5eTQuT8gElV9lOSZPvAPQzs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(44832011)(5660300002)(6916009)(66946007)(66476007)(316002)(66556008)(478600001)(36756003)(8676002)(8936002)(2906002)(86362001)(41300700001)(6486002)(52116002)(6512007)(6506007)(1076003)(26005)(186003)(38350700002)(83380400001)(38100700002)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RjTcpj1SD6mMyOBMzcl5Z1aZDQLUxHSBrhOpzQCB23Aq78YyH4+kuSW9APD5?=
 =?us-ascii?Q?V2OHNj5aDDJ4SwCr656mfDTEWFuYtWsFlbr7PEs0fa7d73W3Loa5jrBrNVn7?=
 =?us-ascii?Q?g66Fz/yrZpxxWFrK44xkrpv0aCxrOoSCVZ53SARXhpU6dnjAkD4aMETlkVU/?=
 =?us-ascii?Q?8qlAWWsaj/jlclPQiEEDeKvQgSlL08aDlhFFg+tHrn9np+Q4vBVMjNwX9wOc?=
 =?us-ascii?Q?TtWX5yQBE4d9pqshDwtR6UUpXV+EXnbzXZMazzlA8LEuIMtpSKzzJUIPxklt?=
 =?us-ascii?Q?hhNnwB7aglZ2wOhE2xkfocS6cxYRhVaejm+YHcPu3EYwnX6gvgw5sqRhG0iq?=
 =?us-ascii?Q?/XkxY5hcBFZKT3BEEG2kaWfA7EA8JETPl3llDTgnzUverBAYgMVirP/c+/Yh?=
 =?us-ascii?Q?jjoQFUsBlGm8EOh4cCmY+T8zRW988W/c1qKOmgJGMpJ2eiu4Gf8Y4oHNBvWE?=
 =?us-ascii?Q?K9yrBCkO2meC8M4Dof1j644LrBD9X0EcsDj5RtSFR0etq1bop9IjGmcmfPdg?=
 =?us-ascii?Q?WM3yw9zEKgekFYqJ7EXqCItP6GwmVcRa3wQO6Ezy3M44S/x/YppRZ1xOzxxq?=
 =?us-ascii?Q?vfyaElB9GZghCmnhlCzi1tOnTCyB++bg78vtPRul5l6ibKNGXmhhLZq3+Jke?=
 =?us-ascii?Q?WiMe+9ESv+ZvX8nWrAXjBmNB+p1HVhHVHE4TXSbW4mbeh4h5RzQ42k7zt7mf?=
 =?us-ascii?Q?zhsnlWyKnyOFvbr3gO4kFmj35//6fymoh+y8A5h7HNk0aCo7/kSmS4CV9Sfc?=
 =?us-ascii?Q?pT1eiRARVzUb6uB9L7nonvYI3UZk1a1FRaXkrNCvw0cobagJcuzEjyxi8JK3?=
 =?us-ascii?Q?AY42e3ZYCdSEUKxLdOKxWjY1djClmSP1KIz8R+Ko8D4NNs8fdiYC/AHecL7f?=
 =?us-ascii?Q?NHfdqfUH9l8o30k3Ppsot1DewxQEE855R7gA2FsNBYxfOGt3tO2X0WTPZGDo?=
 =?us-ascii?Q?GMuPd+AZjBnpiN06E8z6ALNmmdqAxZBt7j8LeeqU46i1Sty1ZL7+YnBlcl2t?=
 =?us-ascii?Q?t6HSNhNcF5rCCWL1y9VpXWuRUBCBWEDvkzVsia9QefS4pJg1TCuQoPkUhkt8?=
 =?us-ascii?Q?bF3P/pVWk5jTr/fR3Nbq4m4AjOj09yyr9L2NUz4MpY6ul1Iecmb6zEYbkjGB?=
 =?us-ascii?Q?sAyTE0xIGRhpiRg0VqMrE4HfdRY1HcUT1+gng4bVz3eXvEJoVTa2AOYoEx0A?=
 =?us-ascii?Q?WOG+Sf6s8D938Rek81MY4Y27OMSyLX2Sf5skHxNqERwjROXsp+ik3hvOWJjr?=
 =?us-ascii?Q?LUssQf2A7s2zQz9/VbOI2pFhstfZkDattYdFawLimm4vh3+WoQafNPOT6zuG?=
 =?us-ascii?Q?vzSWld7BV+txOtvRTiDnLvyt2jHFDScKa179oA6S0FpgzsJzMWRg3wK1c3oz?=
 =?us-ascii?Q?K5bWj/CJqsJ119wECTBcbYbdYV86Kdh3DgMaFTD5QycCyBMLaaTpI70pFBEI?=
 =?us-ascii?Q?a051kY63yAy2vhCVFtlv/4XIh88MJtgb2hufRxa/mNf7eZ6q1I5s4xTCh1Qv?=
 =?us-ascii?Q?WyecCvHfjhIw0rN9T1za+qoDcvJF9RZF+Z7tZjFia2YlwtL+cX4Hbt9Zqzgg?=
 =?us-ascii?Q?rfWmTIl05aX+thVrUKjiIrsoO4ZmNl3nfhkevs51I8jaRzdJQiqJX62bubPk?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3731eab0-7979-4fb3-a6ed-08db768f1c35
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 21:48:43.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuO+AGk6mMZurDtG4wGFau2ibu8y8RA1T+oDbXQbYkgt+4GRgbRBLHuwUFqRF8N+CVlIEYLjCLRP1VfojRmMN2vNnXPkiFDJ5BqZ91fs6F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
X-Proofpoint-ORIG-GUID: a1HljzHYDJBanxX-7FMQRaeUcqRkYMfS
X-Proofpoint-GUID: a1HljzHYDJBanxX-7FMQRaeUcqRkYMfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_18,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=498 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183432

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..a3b8a98589
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From b8d9618cbbec5a04cf6dede0a6ceda41021b92ae Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 26 Jun 2023 17:34:01 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
+
+python2 is deprecated, use python3.
+
+Upstream-Status: Denied [https://www.spinics.net/lists/linux-btrace/msg01364.html]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ btt/bno_plot.py | 2 +-
+ btt/btt_plot.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d0eeba3208..288784236a 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https \
+           file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


