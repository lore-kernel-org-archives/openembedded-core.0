Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.284.1624568336802528570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 13:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Iqb+/QHb;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1809c31b6b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15OKdLcb022964
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 20:58:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 39cq2v0j33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 20:58:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3YSZ4Kabyq4OrFfzyFfZwJRTb8sZ91vgLvBxJF2ZrRZ/QwCUwCKBKuDWdk7dw/ANz72F5bgQfztXFaNH0tC39Ux9X5aJ3eNsa1e3bEiVKHHGeT8WU7FQ5KVjV19f3KabxLQgL8RtuxCdpTy6WR0H3nM66PNMI7hYEPG7EHn+ItUaMyCq82wOtzr8vXBfjlXDO+kbwGsxJehiETyVBs1DKdGG/z5Qvi4xydI2nJM8cVC2LC26LnGBKnBBqit+JqLgfZncwTmz5tKOOTPnddfzR3RuMbvuW/pGgKDZNNM429hy0q3cnDVNFJSwMQwlcRNOBBywxqG/n4a3T9+zmrcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13Y4RFlXLsNXb31ThWbQlcR6oGBHue2nm9Az66ChHok=;
 b=nrlLq5rVZ5YTe9XxTCS21sTsAm1ZNJHJsWLG6XFJp7XrUWGutbDImSuU6T5aPiFQ7jo9wCOm7G19lUu48ExChlIwrdVRB1au6Tok0plD6m7Ihr+cOzVCtUFQY6k/HZutQXk0UJk5c2J0ANAGAWyy/GMqYyvJCUvAq741Tx5qMTvQtTVh8cysQkClbF+1D+g8ZXkSSVAqqxAsyCn4/TSWgHn2bPgU8aJ3UgTQPuegexmb15Js5U7rnrMzEMtozQrTUE/C5kTbR49XQZ1fDLoPfy86qdp9cA/qm36awrurMwyl7HpSwSlmjTdlJtbE6j5+piiCTN4o52xAZ6pTlGAQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13Y4RFlXLsNXb31ThWbQlcR6oGBHue2nm9Az66ChHok=;
 b=Iqb+/QHbAY60B7Xo/1SrHEDNj7AMG3r+JzYbKBJMHfz/J8veLe0wdJ7jxv2Fxkj3XoGQSDykPsmGhjOloQ3bDn4FNrLnnUoRZ1cwHFgU4xllEIU0f9Cvi2LKit536bNoUMWGBui9uD6wLXOnOXvUhvsdrSb9prpaE/cyYuYlYfk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR1101MB2189.namprd11.prod.outlook.com (2603:10b6:301:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Thu, 24 Jun
 2021 20:42:54 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::ddf6:b028:79fe:ec73]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::ddf6:b028:79fe:ec73%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 20:42:53 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: Add info log for qemu startup
Date: Thu, 24 Jun 2021 13:42:42 -0700
Message-Id: <20210624204242.2321234-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR17CA0094.namprd17.prod.outlook.com
 (2603:10b6:300:c2::32) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR17CA0094.namprd17.prod.outlook.com (2603:10b6:300:c2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 20:42:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab3031f-b1d9-4f0b-32dc-08d93750a3e4
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2189:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2189441EBF21FD724C7A4ADDEE079@MWHPR1101MB2189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uRu7bD+6lbfcMp29HZQEpLprsjessVnuOGuwQEx7mxA0GKFfKBNGYFnY4WaG+b/RlCHjpxILSqLFi2CU68RUQTuLHYPPXLM5XcpzHZH33+IZ9BCclmSLlS/kFTFZawckkf8s0mRKU3MrXfX0zn4nltdf8wdZCGBQLLeoMZeCb0/KLLi/dnHn0eo6fIWWQ9YHbt6fD/HvrHskFuiea2j6mhVxE3d7upYk5NTwv1iWl3WBhitMam43gy7GD/tb4kPLryaNRmz0ksO8c2lKEMa9zfd6vjLKzzIZ5nIi0Wxrx7JX0BZq1CkRvwUieSLYvcEZxkdhUb8BDpvjvYx3l2Y8npfzTSEQtpZ7jpGhL2hyr0yS7cYFHWwwl2RWz7RO/2WulGF+LyYBCG+Xg2EHhHH4wbNTB/jlSYesSIOXwuKI1aK7qZwtrH1Dff83Cyx+9wFk+evamHPbfIp4QaWNTTwNSpX0txbppYDekUYzqTafaaHLLtkv6D1MQQlCnmgE0R+24P1fIQrlVbHda/PwiFI128rzARkSahV6ss2AMxJZ1kkvQyFdSPTFF4ghom4oj5BTvna4C2IZPshih6PEEwToP5kJUmJ3uKdHfyP07XTkOm6yhLdvVoyt1uyeuOG1/YYaTO3wFsZJvgg/3S773A/7+NNffA73ETvfEBV+IVWjNIQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(396003)(346002)(136003)(186003)(6506007)(86362001)(26005)(83380400001)(38100700002)(6486002)(52116002)(38350700002)(66946007)(66556008)(66476007)(6512007)(6666004)(16526019)(316002)(8676002)(44832011)(5660300002)(2616005)(956004)(36756003)(8936002)(1076003)(478600001)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HMif3un2ytfeIVn/xihQZYK5WmnI/yunvxtVYlY4gTuTc2t3y75zKQZl/gvf?=
 =?us-ascii?Q?EjP/NtGmL5OeNCvxsD3kgkNhtvSF2NVhDkHF+PIDWfFixIhmamRM6jBCO9c5?=
 =?us-ascii?Q?vGgKPWXBUPwn7IPwSQ9m38uN8ulBQwH5z3q2TY8BdfQw1cN87kt0u6TxakLK?=
 =?us-ascii?Q?B2W3TUpDz7UlAUv3/6lY+S13TLEF6F6Y/Yfg+OZxRztmtSlmalRyi6NxLf2I?=
 =?us-ascii?Q?uoOgzczPPygg2UI9AEoqUJ+3J7JVk3dbZLuZu+IKBHhocWRIpOysBJUyRg0Z?=
 =?us-ascii?Q?3wJFKRCxrlXYU0C23iNk9KAmPAwWbp4nm5/AEQKElpmGOQTHASh+WS35DHqv?=
 =?us-ascii?Q?EXT162HbAinf2o/nFBdPXeguo/4oxoxKZmq54iGczkA52vWigPM1xzxEO4fA?=
 =?us-ascii?Q?dz1wnnTuGyvgNVnPhD57/HJQn16veVUCaqKRquWlt17mP60+7LVb43Knh6jY?=
 =?us-ascii?Q?3TpRDuc8GZuOrj/XUcNymHU/PN2IoPsD5w0/jwsTVt4uSPhTDYpcD2epzcaz?=
 =?us-ascii?Q?e747yweqVaABTVLpy/5bWx+vZztWmCDpIIIP29nCtYdyELIbl2tnWX/ums4A?=
 =?us-ascii?Q?3V77bHJvw97//OJIOqvyUoxkRNg8SiIYlQLOrzwX5SSDP/qoKCF6pQpMIQTX?=
 =?us-ascii?Q?wUj37fSduK1L4kKmcZBt+BC4Zh3y72ryGskPlCtEpBMtYuc76lYMZ0d/9/C7?=
 =?us-ascii?Q?CrMOopTCRZrsoLNZCOw6LcGfr5ekWkYLQErnluAheiEs4sLTEWIu18eyL5pp?=
 =?us-ascii?Q?a6dHj715lvAIFXXq3xwy7+ZRXMmjiYdzYmuu3sjyOMBM+OcMyvfiieuz1/V6?=
 =?us-ascii?Q?EvUt5QD0E/Zwrb4/5JK+u+tNiP8GjU7MtemYg1T/izhikKLLz9mSFcsB/dfy?=
 =?us-ascii?Q?sBW/RymPEayra4o0ZrjyT2yBHMHSFwuh2FfWe0YzZoCLCF6NkXaHz6X3g9Pb?=
 =?us-ascii?Q?5MI2SzJ3JTRF7DkKirk7juRh37YfZau22CJ0IVNsIO8eIcLh/+pr3+0uj5TM?=
 =?us-ascii?Q?9ie8i4SKUvQ4SDEKuwa9WMjfHeSRgyv8jhxwdzBnBUlnVYCyqIeEKa6+H0Ph?=
 =?us-ascii?Q?gQ6DmN5Ujk5tzmO3Q7gf68uQ0hylGnsO9+VYBvhix6qanrxJMQGsu1BnBF2E?=
 =?us-ascii?Q?sP470MGrhhbKvGP1R9ePbXzLIN+9lWbAabAoNKnbxNdHujkzOEuuS5bINit9?=
 =?us-ascii?Q?xEalcCFB5QjUEMq0DmRriTGNGu7GS8JTHiunPjEF1ICJ4HBkF0QvcSwJjd+g?=
 =?us-ascii?Q?RyDy+JH4vAYlWdxu+iVfbkpetKC4zPX/24DL7ipLcJbKB4nCmerHleEAcaxI?=
 =?us-ascii?Q?I3QBHVfZfYNb1ULEFf2faDP2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab3031f-b1d9-4f0b-32dc-08d93750a3e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 20:42:53.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLqvc+r0QUep9JnbWDoAcMHJOVgpnTfz6ZiWA8qjs5gF/wZfon7RSP4YenB8IaIyRzfzGYY4CVu7RFeisgN7BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2189
X-Proofpoint-ORIG-GUID: UOR0lxlKzLBatq0RVVvR6C5Nyx2b2vEA
X-Proofpoint-GUID: UOR0lxlKzLBatq0RVVvR6C5Nyx2b2vEA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-24_15:2021-06-24,2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240114
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add a couple of logging info to track time between activities, first
is from after the Popen(launch_cmd) to after qmp.connect(), second is
from qmp.connect() to the release of the qemu via the qmp("cont") command
this includes the mmap() activity.

Example output:
QMP connected to QEMU at 06/24/21 11:11:56 and took 0.9556229114532471 seconds from launch
QMP released QEMU at 06/24/21 11:11:56 and took 0.26789021492004395 seconds from connect

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index abbc7f7d1f6..c7f78603179 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -236,6 +236,7 @@ class QemuRunner:
         # to be a proper fix but this will suffice for now.
         self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env, cwd=self.tmpdir)
         output = self.runqemu.stdout
+        launch_time = time.time()
 
         #
         # We need the preexec_fn above so that all runqemu processes can easily be killed
@@ -339,6 +340,10 @@ class QemuRunner:
 
             try:
                 self.qmp.connect()
+                connect_time = time.time()
+                self.logger.info("QMP connected to QEMU at %s and took %s seconds" %
+                                  (time.strftime("%D %H:%M:%S"),
+                                   time.time() - launch_time))
             except OSError as msg:
                 self.logger.warning("Failed to connect qemu monitor socket: %s File: %s" % (msg, msg.filename))
                 return False
@@ -367,6 +372,9 @@ class QemuRunner:
 
         # Release the qemu process to continue running
         self.run_monitor('cont')
+        self.logger.info("QMP released QEMU at %s and took %s seconds from connect" %
+                          (time.strftime("%D %H:%M:%S"),
+                           time.time() - connect_time))
 
         # We are alive: qemu is running
         out = self.getOutput(output)
-- 
2.25.1

