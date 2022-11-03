Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3364CC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 18:34:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2166.1667500455872237968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 11:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SzRQl15H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83062f08e3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A3Cnllj028944
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Nov 2022 18:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=aqoru0WQ4Em6NDM0LkEuO7SUcgRKsLMfT19rIMEsO8Q=;
 b=SzRQl15HAo8eZxNo67v0cRghc5aEl+KYfKec9LYV1ZK0qhEjwB2iQ1Io0y9I6KCFrln7
 9n4QKgSoY5/4esaJubEOs+5NQL1SIhK8qitxVI883v9zy80ABnBjnmU53aMJ1vML64Fa
 vlrP8GrshdoB1WC+dBfHMcFWe5pO66egBsalcQCsKtqKq5CwmqyTaDcPABZLExNuE4XZ
 MMymR/+OKcddgRo/Nu8blCefTU15VuOxwXQUacGne9Kv7dvBLaKmnOA3TuB/II1LTcXC
 n+OvMnZNLWhiu3LUnKjk7ngrCT3nyZ1ngi2/x0G6OU7TXcKRsl/ZOl3AtW6Zj+o+Uus4 3A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3km4avgnvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 18:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUACI6qeZxsC9qNZ246abiWPXa4jQPuoOaDmcyISw3tpaz9UnJ/8ORJRXV+pb5DIF0Mft4P7wCgQOWQcxhcXKfmpUh5YD1XXfY+lDpe3zueZFQd0Dp0cmQzA5nfPRY7jveEC9R8ust8Vj/ItPq0anCr2wpRuDgWxpE81lkNMU8Bew6+xxD/C5YBXTxw8SwZY+POHRD92t4GFzECROg7P9Bd/PTj8LdZWqqL15OicmN8dhHv8HbjQCCyS0boFxjOef5hpw9lLiTB2zRXAmUDAXiO69DfCPNZkk2zO3yer7WQWdWFMxdhZjii4uRjI3U3IFm2dkUasFOyBZAI0va9y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqoru0WQ4Em6NDM0LkEuO7SUcgRKsLMfT19rIMEsO8Q=;
 b=XV530UQNlkopsbsptCAExXD0iLiESE+LQeKJCAAmnf78F1LF0bN6rQh5S98VyWEScR3VfKw94fVUdfkVh1NDKK201hPt9NF3OI2EYXqBAnf3klIsGg7tqmhYkuLKIxM5gJpFLfL3Rd8IYbp4rKJcz/A70PUXudHnF0Z/UkPV/roEb5wO3Gi4jnTc0G/7jD8G9K1JmQn20mIgMpW/5ZuHQ05OsSBBmQ2XXQVsvNAAJopOPpbW7CfvDg3QxU5dwwquxbJUON/B+OaBceanCkJgPrqQ1JKh8ijN6VtextOf4UYAFTClcHxpqiBKDNh1ZnKJYTJPvrWW6bVTxk+KHU1Cdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 18:34:12 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d%7]) with mapi id 15.20.5791.021; Thu, 3 Nov 2022
 18:34:12 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] blktrace: ask for python3 specifically
Date: Thu,  3 Nov 2022 14:33:56 -0400
Message-Id: <20221103183356.40685-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::40)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afe84ff-c6a8-4bc7-687f-08dabdca00ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rg3l+wisMjMVMdhXkA4b/baxCUFHfZNF2K1tYS/vF37Tu0nuTnfmLy7nHwQpyb6u6IzRidhQ/FMf0PbjQnq3bfw1/ZK9BC8BrKK75S0ESQMZWzK3v2GTxTjy89oH2mPAvU9jUFf7Yw9bABOmHZoQPZIXu/sFoWAyPWvfI50dwaWifFYdlc8HYNxxqJKzAt6cHfTWVYjx8q0B71cc+JnkPbpc+wTWD1DofMj4NezB2hH/OtcHpr/JPRSdk+QvCOX9b40MtcmoNQ++vimDAXtfihn/i0EsgPIi9hpZooOnxOxaYN1HCWx64KHD7CJdgszZSsGlEUyFE0mg2PTdKBmwRREXXqi0ioRmVPwpPZkDdhl/x91d6dME5mqd+9OvTh7qO17/daUPNfMic6uXrXiT9smrlGMY1IyFfOwVcU6EA9EH2fIpC1ieIQiFR3YGIR1Q2+p1fFKUS7tujWYQ0EOjX4nDyyZrJ/GV7x+ZqE5dvkyD47Cb5G7H5XyKb725AddB40cpQzCQ7hi8bULmvwuecAtnw83QGIYklilsSsAroYXZPRkOGZEtOBCyVIbQ47DiAwIac3CYs2OrvD+9b1JM/uYxeGCZ7dnTKvRDvinKWINVy8bcQSiRTYi428UWJ9xFfDQj6wk6RgkJNJii5x/TZrQNicOGc90rFmKM/NhP1XWghBLCZHw0p1fXbQ8XO1pCNwAfNAzMlHycqXlfb7vWovHjNLdBkVX7rlgy2CcdlqXN+N7a4iBXHmY83Viwe4pk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(136003)(346002)(39850400004)(451199015)(36756003)(2906002)(66946007)(38350700002)(66476007)(66556008)(8936002)(8676002)(44832011)(6916009)(41300700001)(26005)(478600001)(186003)(38100700002)(6512007)(1076003)(83380400001)(316002)(86362001)(5660300002)(6486002)(2616005)(6506007)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RGc72szlWLzcXm35GOIzY3hsBW9Kv9SuIB3eidt9sx1GjrQfyCXKljaFQsRN?=
 =?us-ascii?Q?hBAxdK67XshqcZIfq2rK3lmkJSJGOKYpsXDmZ5fPzq1ISSMJLRMurCmcPt/Y?=
 =?us-ascii?Q?9idWPvQypbrDPMwpi9Q4UqhgXuj7aAFNxCyrjLrhTCK+txUduVRTN7FMCycS?=
 =?us-ascii?Q?f0VR3isvViTuBxPZkZAvHM6YsbtXku731QX7alphgz6ZK3uiVP8MP5BQD2/i?=
 =?us-ascii?Q?LC5v3TYDNd3OadJYnEtphpxq9y/vA02VGEOUh/R+ZVwC+eQ9vliHb9hUKgwM?=
 =?us-ascii?Q?HSzP3QbIYyvF4o9/oY/Dso1GTD/7HZH7yX3v0646oxTECQCh2ov8ab01tZUq?=
 =?us-ascii?Q?Hoe2xGesaUgPfii9t95cMivcQLcx4c6GmvffQ2tarySfTGh+hdprvDuAH7Gu?=
 =?us-ascii?Q?61V5ualq5v81LfbnnAdnNpIQOxL0MmyOtjKg1K8fxAUnEu5ZIK9gaDRwEwJV?=
 =?us-ascii?Q?D+gdVV8SgjOjygiCyJrxbcOxeqbZlzLoP4ZsVSSchvEZaqD+CzAguFrJL0zp?=
 =?us-ascii?Q?R3S/p+uIsNNw7D3oG88xM1/P4OjmcvVnCejInWdh2+nEIJTPllAExMuqJpMi?=
 =?us-ascii?Q?PHNa2qV00P9r4i7/WZYIWS4wxBjkJT1Ghit4Emx87k5JgVvj3f4pfKehIx10?=
 =?us-ascii?Q?AaHnQcDl9MpdjISbuz8ZI8RhS3Y3er4unX4Tpru2nH+pauNfZC+Ri5bDC8vz?=
 =?us-ascii?Q?Ucz/DAwiuJCGq6LM6ck97BdCVa3Pm3CjaWdro/CGEEHNp0+DFrV4VGeFIh8J?=
 =?us-ascii?Q?RLUoiSJWWZRFSHIMA1P0CuCimAkDKk9znWuxas/pmbZWwsGi9r3FSVvd+Kk0?=
 =?us-ascii?Q?yvfqAs7oiJOFNaR68+PLgHagfVohSl4AcTQLqgQfe3A5ZSFTgu775dl4qakV?=
 =?us-ascii?Q?wT76zeYBJ/9cN3W5MXttENFqLCuuens9RAjNARoCUyR/jQkwV438jo3KnUFm?=
 =?us-ascii?Q?cSPbudWy1ueuuLNX++pgPCu91tx+ndzYwRlE7MxOYQS2NVa56BbeHv+dG2U2?=
 =?us-ascii?Q?Z25NYLf/amVBvJojUkyR5f6Hah/ljKhqoiydN3c+1qq1/QnAh1VtuxTaeUvj?=
 =?us-ascii?Q?WOcM4NBYkjmvVolNgmRWuU8iA+AXKa2QyH5EPtKpb6vlo2Ib2ago/kyK6hwO?=
 =?us-ascii?Q?kM5dXPQmwGcji3Vs9nS/vZsYahwlFr00CVXggHqNN/1nDxUzi2V827Nkoed2?=
 =?us-ascii?Q?Te6XV2or8DnjRblboeTzBKHsvDcgeZ6ydg9e6ingv+Ge77mjK8pAvcnU+2uY?=
 =?us-ascii?Q?wR5b/nyqXpjKIMFK/NVdh3kDIwKaaqzh5v1lcMp9EyoT+sx1WXRZdB7SEWfz?=
 =?us-ascii?Q?LiOSfgOiVorjvkUiX6SpypADPJcQfd7ofVoremi12Rq5zCiCaQrs88L3EYfz?=
 =?us-ascii?Q?1VqgLOEP9FtvP63xoY/oU9dvOeH3x9vWx+vkJrO8xzR++S7vC7Mpe5W9ZOJl?=
 =?us-ascii?Q?WF7F0MEFOMPP9nBiBMDpELpKiEkbsmMcWkds2NVWztFShG9b1BrJ2frwyzO/?=
 =?us-ascii?Q?8JkO4GR4zw80chxl/DNCy8rsjENkdGbHZKLgKp3ZEQZew5VAkwF5lvHH1RZB?=
 =?us-ascii?Q?Mb05dwVRV+i7usKQbWEEuyLxbt8fLKBzD1tAWT/dkgxGR1zwybGkQV/tn8Bi?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afe84ff-c6a8-4bc7-687f-08dabdca00ed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:34:12.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEqIAHIxaplnpTeXGexuGY9GM/BuBXunHcukkDX5EVPTaqlqYnrvFQSk7ojQPMtDOXmPaOB27cOfbqptpyoQBqTPBbdOl9RSXmHnILe5nH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
X-Proofpoint-ORIG-GUID: 9Oia1CwgcdqEC5fGDCL-ilPpMBeWAeFR
X-Proofpoint-GUID: 9Oia1CwgcdqEC5fGDCL-ilPpMBeWAeFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=427 adultscore=1 clxscore=1015 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 18:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172649

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...plot.py-ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..42412678f7
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From c6776fb9c990830357e71a0e75805e7ce25877cc Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 3 Nov 2022 12:29:59 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: ask for python3 specifically
+
+python2 has been deprecated, use python3 instead
+
+Upstream-Status: Inappropriate (OE-specific)
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
index bba5e04504..c278e066c7 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -9,12 +9,15 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
+RDEPENDS:${PN} = "python3"
 
 SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
+           file://0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0


