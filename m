Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD88C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 02:31:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33108.1676946706749168995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 18:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I6OnCzws;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141643becc=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31L2OqtP028240
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:31:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=F+stsi6+9HI27NvzdhDOFCDvpht8FRzOxBwqh7i5Spw=;
 b=I6OnCzwsDKvklRpsZvAFr8sweEeczowSokLd37sMYYYjtVKv7sTiH4Yff5ZENgxCT8Bc
 xYveqcc3sqzvGM3bmu4S18wZs5XA0QIXCJ7R8fOeHUI55yMUXf6BE/HAJYasbLi9tlyd
 BlxHb6DOW0Igo/yjuO1nBWg8+6aZsm+/TzBteoRprrAK2Q5r55sDSoKznoYfqWGnoQfp
 z5mkFijtDY/d4q4iEN55MfoW+4GSxvtJxe81RBAY0j5o6oKidCtibxVzDHva9C1Cfcy1
 vCxyt+jWmUe0JveICjeR84pJTpJK2NB+AFF7GPN+RnqtRcZcS5AZC2ltVZivELAjCz0X 4Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6t5m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:31:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4/BmFtXNHyLYBfl2bBK4NxT0mYdyIpzTrrSP1Z2UlCeKtiiXpYNyMHz2V5yAawgemrgtxVw3ywwS17lH1hgH38ES7nEKeXiOJhPgyjo9x1a+ClRih1n0rZrqGZT3mQ8nTa8x8HfclX6Tbrnt3jQGlj8wbPp6xIgChdh7NV4q7O2n/ANErEmr5/zosWou/6n/V414tyEW1/1EsAmI0PXQrW/8ZHIg5VGPLlij/LBd6xRDWiZFesOTDY7oyta/zc1jH6404kU6i4VR/OdXFnLjtFZFhUocSrMJqkLVAABdrA9mGlhl2JI7HlUSzO+9B7G9iq5GupBaJ9GTnV3oe48Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+stsi6+9HI27NvzdhDOFCDvpht8FRzOxBwqh7i5Spw=;
 b=iPhgSrA/J/RJ4Yc2EDcJ4Y2wWU59t6d7kA6wnzKnM1p7HzMCQ15myKmjs5Ey13JmC6D2R+pT5kbLvTdX3qOqZTe+5CIG498fac8OVLyVigdSinFXrNPu8d+Jz1NiOmfQk5tR23fCUFpPLR3koIj9hRbhYv4m/y6gzN2oAXhI/D4NlBqYwVPk3aPrfddpk019zxhvttD2dV46SsF/hd5OCC681XiafjoQADraxUSHoaN5557NYUBVOY/sDtSdjtJ8rZG8K24F8sjcWTalfEIurg/C6pA7gm4D3gFlpGcTQog/oVgwE15/3AUK8QPu1+XEWAt3ZzOEL39uh/KZSWIH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 02:31:44 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e%9]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 02:31:44 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH][kirkstone] package.bbclase: Add check for /build in copydebugsources()
Date: Mon, 20 Feb 2023 18:31:29 -0800
Message-Id: <20230221023129.2231373-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.35.6
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0b26ee-148c-454b-df71-08db13b3c5c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UBbCUAxjiXmFgz/3RqhGg5vvX1lyZkTqHJTTuEHeclm0eeNu9+nKG7NcwG2uibKp93UqJGCviuUlI3QjScn2A3mlepoaYEYCU257hKopK9ZS7OS1tGnN9GZ4YAYxT/v5XUDj2i+USPn5bzxwGnJ1N8gKdH0a15xSnNVHsh1L3q2gplrVv0qwsvKHpN0cuwVDbXOIYlZACrHto1r1AWHiJZUTrtBywhASNzDPAg4U4soshlomnFCb4pb5rPG+aVnmvhR3s02zErPR9v7IyptLW/CKyJOFILwZw2NZFsfX3i7gnBEez20J4OfCJSeBn29CZUTyq+LmoPlwznHk4AWOz5L2M72ylI3tLjTI7YNm/FogWghLB56udXcRa9ERP92qpNTgQmed9fUx35+DJzfEFV5knlYZoXcdfBdHoanFUv6T/2nUqCxHDKOuA6q/3GchgvaLzOsI/URhwi+b1Ip4cMURi+s5sk+b6bWPpNB1V7fo1hzhv+TUZhAgXi1JnsugpYcXEwSQgTaUeYesK8w6Naq7cL4VevMPt6dRcM7NmEeXzvVhnspaV+Y/fGK3oXVsc9ophYrZJX70EIsEkFtP5nfAgWlphZlbfCoyEkLmoAt3cFnx3zVxaX13d6I29khEm5Bmmg/QTKXRDocxhME31PDtPr/AACt33BeEL5W3zuUpzq3fqLVGB53NfnPcESj3E2QBAkyqIdYnquwu4IqJ6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(136003)(376002)(346002)(396003)(451199018)(36756003)(478600001)(1076003)(107886003)(6506007)(52116002)(6666004)(4326008)(8676002)(2616005)(26005)(316002)(41300700001)(186003)(66556008)(66476007)(44832011)(66946007)(6512007)(8936002)(38350700002)(86362001)(38100700002)(6486002)(5660300002)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p3sheL3x58TfqvDT0t0j/1i4R4vSd8Q6idrTzjwcgtajRdHXnUhtB1LP3uv0?=
 =?us-ascii?Q?4SdCgpRwFVMwj85kUIKRPOOcuT0bn7oW3h+M5yZEKT4qBlSsy/sOCtWa32Wq?=
 =?us-ascii?Q?JWRiCHqe9cMO8MV8jTbn0pMaWgJiqNR/BrLoax4wKqUuutUrKLqT6AjPh9Qc?=
 =?us-ascii?Q?I6CJv2acq1ICN+c5yHSO6yduwV6OCkg5cSOjcBQ8O91DVUZS6MbGOwfriNTR?=
 =?us-ascii?Q?mSgYmAbw2WZIR+GhuDhEoX/mHfa/yU8cVR7frbOwzEIhMFBxJCkkfn+8XdjO?=
 =?us-ascii?Q?Z/LkNue4g1Niaj066uozdNbuFPdRAv7pP+4ks+4W1zMwNu9y//bCuMpLdRus?=
 =?us-ascii?Q?hryDJtmx/rVGNn2zoKBonjnyhe1CvlzoSYzSgZRMWfY6WzndoUufGC2QLjRy?=
 =?us-ascii?Q?+dWlIHcwWdOhxaE439L6i8M0Q4zyhCTyTIOlXLJNvmzzADumrp1A4S3+A5s7?=
 =?us-ascii?Q?XKUe3zTs7d5/YV56R/dprgcgMETMMHemkxo3m9kW20L+baondkoOTQtdubPt?=
 =?us-ascii?Q?NlXjFpphpVddLFnrwu3V/1MgTZYskgrKAZOuLBcdRiY+QyDV6ob5w5jH3jYn?=
 =?us-ascii?Q?v+2NJtFBsB4HFywo0qkgHJx6JyetOxPaA2RH8lKfM3/bNsw4yfLB0B5YGANr?=
 =?us-ascii?Q?1JUS0U1PTDROy7HPiQ+725hHPAq/NMkpjhYamwWGUM/c7p3qegfLEpTtygru?=
 =?us-ascii?Q?MtufLeu5rhvJiuYXuBIgEv9Ms0+dHy+Pvlq1n9otU6wPBNy7jJTCU0MnPeBR?=
 =?us-ascii?Q?XqNn83AL9AeQ8JbqX/bgQVC41Iot8ACEmMDs2L9RDPg1i83KzYgGhCoQdb70?=
 =?us-ascii?Q?NJe+GpfDW0PpmwEtkeAXwcuLrbAMSY7Yox75AwwuazIrLUVfG3JLvxbjI5l8?=
 =?us-ascii?Q?3bFJ5yk6XOZT7hmVDfyKNVaGqCla9zrODmCp+O0SiH7FZ0VXNZg1XCJHEqSI?=
 =?us-ascii?Q?QuPWcZuRYTm6ML6y44KsBdz8IOQSHY/3RAEqjZor3e0Vq5rDPCOjLLuyhB/J?=
 =?us-ascii?Q?spswChosRBxTero4DFMji/9UhQjxGKMPmp75REG/u0VLKFolQp9wuDV762fb?=
 =?us-ascii?Q?UGnan/x/0vBP/Xp0t3U74FOwdMk2SHRHnbEFrZFSxo5RfyNIbYR21WYSdFGg?=
 =?us-ascii?Q?V88cg4JiOZKQVsWrk1+7jwm8mDfJ+KdcN8M+pO68fvfSBN3S+qnK5OgyYSFT?=
 =?us-ascii?Q?JdEGTWXn2FUajA5GZg6xFl8805bGFtli0Bhf0vnOELn56xPGrH/eqnE4QzIu?=
 =?us-ascii?Q?TEOCD+wvbu7sRtYQiVwwvjSdvte4OXqiSW+Z5EJtH9A/1zvn7qYiBV8ya1QH?=
 =?us-ascii?Q?z3WLDR4RK6wG81DUJZLelRMCCpf0OtDFrUa2V+7uh+Wb63C0YjCpfjpvLw+G?=
 =?us-ascii?Q?gni6hCgT3hAmUaVMqEggY6KTc59GabtivMy3q4Jgzdgk+QFzS+ToVzbnZcne?=
 =?us-ascii?Q?WS4Tc6CCsCxTDcNXxPnMC0O3WwbCQZauu65revXYcOlA42ftZiZNLAgFDfom?=
 =?us-ascii?Q?ifHtAi/IAuyGllVNOyZqiUhONszi5Hf6BSvy7ftH4EtjiZ1KpVZYenl11B9O?=
 =?us-ascii?Q?coIovh2vPro9Y8v8StSQexUQA+oy3aM6tTKSdjDySnd1QsX7G80vvdnMEm72?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0b26ee-148c-454b-df71-08db13b3c5c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 02:31:44.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JMMl86djv/jQcespBvNdhLerw67bywbgKY7XQD/Ay2+ePg11dSsaERIVwpaUftQD4qK9WNILLEKAnjnxilYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
X-Proofpoint-ORIG-GUID: F5rYx-kMRV8KacMPTLVp7MuXpoQNhodB
X-Proofpoint-GUID: F5rYx-kMRV8KacMPTLVp7MuXpoQNhodB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_19,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=797 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302210021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 02:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177480

This is needed when the SDK or eSDK is installed in a /build top level
directory as it conflicts with the build directory within the existing
/usr/src/debug/build (which is really a link). Rename it and then do the
copy, this is not an issue with master currently due to some other
changes that occurred in master.

Fixes: [YOCTO #15026]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/package.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8b11fdd155..2950218145 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -636,6 +636,13 @@ def copydebugsources(debugsrcdir, sources, d):
         # Same check as above for externalsrc
         if workdir not in sdir:
             if os.path.exists(dvar + debugsrcdir + sdir):
+                # Special case for /build since we need to move into
+                # /usr/src/debug/build so rename sdir to build.build
+                if sdir.find("/build") == 0:
+                    cmd = "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/build", dvar, debugsrcdir, "/build.build")
+                    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+                    sdir = sdir.replace("/build", "/build.build", 1)
+
                 cmd = "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, dvar,debugsrcdir)
                 subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
-- 
2.35.6


