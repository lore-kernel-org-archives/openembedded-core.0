Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA150C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 21:25:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.44.1641590705501508554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EkarhGFe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80063e4491=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207KsOdA032695
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=OP9i+qQC9YzD3mHiMzwUELBq/oU4T/WCqpEKrXvVh+E=;
 b=EkarhGFehcSXts0hKO/sk+b3O1Bq/9cFCSRk/DGZYFMFEqiLnep0U0HCVIx2G6JUsppJ
 vhIGN7xMlE5frMmVMYjG0N8GI/qemExjNpU+7x3Se60Ja7+XipqFzmjUuL74UyT1Nd8T
 +uyIjwPVMqEePWr2CE9TCDdSEz0uTcCsT7g+z43JnCP8dh49X+azk4zt8cMrJyTc1rIf
 hHrK9cdemrOIYX7PgaAW2F3aDtwT7YUSqY8g2EM3Y3pNFts3LJJHcQLVpVUjyIDeoizo
 xUY1ZXwcXBRu8/QzEwDuJfMPX+aFK136KHbM9wfOdd7Wb7OfV+x+u1QwubUsTeXZ0Mmf bg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:04 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 207LP3Ot001096
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:03 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwa5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jan 2022 13:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJD664s1npFzBXVK6qxm/YQ36Rm8lTp5Ls5Gup3aL2LspnO70AtHI66Sx+E1x2r4SbZqdL7ySZHMKcLlrVH50dAky3SayD4fIN7FV6jE+9xsTRKyAN5l63erTCjG/v3fCJ+8/miKdFjDxyxCfOPrgEoq+cfkkrmovwhkDX4IceNx633G3l0MnAR0cOPd8g+kV9jrIq/qjNgywL6Q2K4uJq7hHuGfyAPZq+3tfgnUUO7ihXuc/zKVLyscuzcr1YFE7WT9ep5M1/bzOUDWqBhINi8Oq7sbQAs+u4LASdKtnPONk8USGELD4LnLMMKY2Qjn8SebjV7/T+rtjHkrKLVqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP9i+qQC9YzD3mHiMzwUELBq/oU4T/WCqpEKrXvVh+E=;
 b=UtI8VMUgF7wAUrW9bcE/qfctnlxOTegEvRxR/zw5M5aBOH0XBZ9zoWtWtyA3If/v70gDdUMvBL8djniFCiQ+8sRjLDaWehJz/REV/f+niT0CuUy5WXQKB/VGcdt0fZYdvU8u6yUdyxzmQ0u1JUNXQFj3h53fh8WigFfKwQHAIVhFxtXundu6jpSAxz/e6SWWgFkxr7zPvkXFqvQ4Hw2hKbmv1FJ47j9+Nl5GY5e1xYPRjueMpM56rmdACyaYlZ8JgrmPwtNKhAdxMh9IvhydzJ4xPzdZ5M6xp9mtQKumtEFGhQUhc4iQ8+66S1MSC1sy6YWtLKxpUzr6jQ069OGPfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 7 Jan
 2022 21:25:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 21:25:02 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
        bruce.ashfield@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH 2/3] kernel.bbclass: remove do_strip() method
Date: Fri,  7 Jan 2022 13:24:45 -0800
Message-Id: <20220107212446.132386-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107212446.132386-1-saul.wold@windriver.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a6408f-af1f-40e1-2374-08d9d2242a0a
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46029399580C2E27EC7B22C6EE4D9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iYrqPTQtq21HMdnRhoEIy2B7ltw8J7R2zIPJqQ/RxaF3I59iGuWa41gQal/8pkO+XiVfoxh82Z0ZTL4D1JNqNfprhgN4Y4kMGaImt/DAWZVfPYAK73SzUUAiwPRbg9Ma1td+lp26OR2s1DZBwlzzs3BzezGdKs5m4FBh6o7Q0naXyQAJAuT1naHCJ20X/tOHaAqAcCDae7W6Lo0RWFoeLW2USymNFcyvU8ZiIDYoVbSNPc6u/LX9XxecHbzkYwasQahatuJ7BTLjGGLyf6Kn5/ENNSqFalEArVP6/rkOWUfekyIg16GfAPmENRgPqGmPZesJCUoYlMN+rVNwHYo2t9jZbFoMMU8JTwuoHCWEYYRaEpHwEMxWIpWdDrLqQ50lRxA18NnOub7cNJaCE9PutM0xB8Ae1nQYV0Key5jagzTAJ1Wwhi3SrO94+TCQF51dmCR8PYKwHYHR1hnhF+GV7sv4AyevjPf43s8bSqGAy2a4eoDNl/Ew1mDzS2NQiJvjGdTuQzKI5gF8Vczni/H+SlW3ZdGvOEran0qn4Y1COmQthkjB9SNwsNMsKy3LTy0EtAagHAmM+tC9FBtO8znlCH27f/tlcxCWZ2ou7O8qb8V9k8nR7hOIJHTsSWqGSzNI3PwIwOqIKEqffXDIwMrH+7Sp3JKqvqHP3ZSuF2TYKESmErI03h/7Qm7xKfEh6VisYqrka3MiGeSWN2V8wiLFww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(44832011)(66556008)(1076003)(66946007)(508600001)(6666004)(6486002)(8676002)(5660300002)(26005)(6512007)(36756003)(186003)(6506007)(4326008)(38350700002)(52116002)(316002)(83380400001)(86362001)(2616005)(2906002)(107886003)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7MxaU2p/F75wr/cffOoBqBrtPzl0NRnu2ju2bFTN/Es0gWySTqrdCDsGcEek?=
 =?us-ascii?Q?2+z0Fti/k2SUtbx0t3uf816liKukbdo3hIb3NNh7cfoaXMtpH1sgYS7lfoOo?=
 =?us-ascii?Q?JiKjR+bHEpL9n4vRXXBDrmiDXLnx+N6ldPL0+VtC+Ph0iWsgFnuK9kfHqtkk?=
 =?us-ascii?Q?0NR5ai5YLf56smijqVW1WfM/CzjiBViiquNrmcMsKTabxcGPpiAjvgmqtiCN?=
 =?us-ascii?Q?yaAnGadBTtrIqZclKLYN0LxWyqnkV2OXe8JgttzSbqJA1lH213YBJRqPl6gT?=
 =?us-ascii?Q?nWs2wNTOyCGVhhEEf+8gbKKOffHnaxuIo+o9zDhubI5ZTq3I5WuXWnp6kVyx?=
 =?us-ascii?Q?Igf6rFBr5hk+H4fuXi/Y5m3N8nRuqyQ2L0bYU9t/XN/0nQS8UATUM7LVM0DT?=
 =?us-ascii?Q?KX/+z5WkUi6D6n5aw5IJCODe9VvA8wxtF8GsR3+cJygGhPXqfNfLE+UbIgE6?=
 =?us-ascii?Q?A1BOEOVyn5gBSRFy9Sl36PCZ0VCrHyg8+G521FWRTa7G7H4Qk9jonP4JUVcT?=
 =?us-ascii?Q?+YYeTUEmv7PjJcD9Wc00njf8tXOQGiVP28qA527Btffx0ow4BOa54tQrvgAO?=
 =?us-ascii?Q?+4U9tMSd+1zkQG/6h+YMpJCn/HtQAFHmHNACNz3bfCwH6ZLcY9e3L+2S1puE?=
 =?us-ascii?Q?+nbp87FjIPKWp6rn1LuexFpPyCN4b0rnKVv9bcdMLKcCA9HdYZd/Pa+Xoeit?=
 =?us-ascii?Q?kfKeM8feYHDCQ/yhHCfCen8Pml5GB9XpOghZH4x50PEWZzmyqoWldaXG+16P?=
 =?us-ascii?Q?K0G4z1Xa6R5MDhv94ercHCAKCCFtzNLpGZxH4gCk2IA471Z+ZyQPttPQAoNs?=
 =?us-ascii?Q?AjdOrDQpIoL4Og7GZrIMYtoy6/AfHQ3tbnH5MWlhWomITA8tQsXh9puceKPh?=
 =?us-ascii?Q?dOf3F623jPaJHXJhviOrvp5riHoFJnbi37WCCMq73IST+EWRdAcYPXEFBYsS?=
 =?us-ascii?Q?FWP4hd5TVVYvU/QVU1LxdzRkICgw2POhnI297WoZDI7ujqmFvn3WpseXiBXE?=
 =?us-ascii?Q?vzIPdtWB47d5Q+gQGZzZJQ7tZXUnofTGvQe3zTrA2F66KXS4G4WuRRIv5Dpa?=
 =?us-ascii?Q?L4WhJ4swTS7+lIMqOpRCHLm/7pHQBlFmq3t49J/DE2sSxNP8iBzWEa7DC0rt?=
 =?us-ascii?Q?rUu6LSddNGJPf4sxWqRqA6kb6C+Rhq5ihTBkQHQxNphSm0jZ+BYADSnaXRPd?=
 =?us-ascii?Q?hkRuBzNWO9H8gtL7CGL9ZpomiHIaGYTtmqPMudmPvM9d2nbDsqe88R7b6zz5?=
 =?us-ascii?Q?vKqtBh+C8MQz/6HAh6sPHy/7w5/VD2la13nWoyTjRtNmWp9mBABPul/kViY2?=
 =?us-ascii?Q?GiqKnw6UzVczI1qtxMOEw3UadMmdNoCUo9tUJHHldngIgOj2HP5dlTlSeQs2?=
 =?us-ascii?Q?+Molfph09RDgSo4onDsZNe09K/QQHXglnJR1BVfMvfU/bWf5skv7w2An0Pbb?=
 =?us-ascii?Q?WFyhB2JFJE+vGFqN4TkyHPNmKdsuASIVeKFpGvkPvq6B2B+LIGSBz7Vu1nCj?=
 =?us-ascii?Q?qUsVa6L1veQiJY2rymM4iU3OLi8aofc2ym8r4Z0SC3IwH8lgQxvFA9TE9y6T?=
 =?us-ascii?Q?UP+A4LrvxtkB8O13fWNn0/7EX9Zqj7rjCg5pgWjD/6f9+CVVkVFzIs5/X3RT?=
 =?us-ascii?Q?R2UahQYhQgsBzWyx4OSGz+c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5a6408f-af1f-40e1-2374-08d9d2242a0a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:25:01.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xLby99AuHC7Y2XfCbj/MYhT2HHxfTN8uLalzRzLEYiKQzOWl0qyexOREMdouj7qJbfVqaQAOzVLriZj+bJgCJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-ORIG-GUID: 3xjpqQxn_kglFRCH9bgj1PMI5B9cWwoZ
X-Proofpoint-GUID: Lwl6NWknukXhg5-X4tKB34__XPNPsQys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_09,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 21:25:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160269

Move the do_strip() functionality to a more common location in the
package split_and_strip_files() flow. This makes it possible for the
extended packaging data to be generated correctly for the kernel and
kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reused in 
the runstrip() part of package stripping.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/kernel.bbclass | 35 +++--------------------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7685c6921fa..30e67abb936 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -421,7 +421,7 @@ do_compile_kernelmodules() {
 		bbnote "no modules to compile"
 	fi
 }
-addtask compile_kernelmodules after do_compile before do_strip
+addtask compile_kernelmodules after do_compile before do_sizecheck
 
 kernel_do_install() {
 	#
@@ -698,36 +698,7 @@ do_kernel_link_images() {
 		ln -sf ../../../vmlinux.64
 	fi
 }
-addtask kernel_link_images after do_compile before do_strip
-
-do_strip() {
-	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
-		if ! (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux"); then
-			bbwarn "image type(s) will not be stripped (not supported): ${KERNEL_IMAGETYPES}"
-			return
-		fi
-
-		cd ${B}
-		headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT_DIR}/vmlinux | \
-			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
-			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
-			  gawk '{print $1}'`
-
-		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
-			if ! (echo "$headers" | grep -q "^$str$"); then
-				bbwarn "Section not found: $str";
-			fi
-
-			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT_DIR}/vmlinux
-		}; done
-
-		bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
-			"${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
-	fi;
-}
-do_strip[dirs] = "${B}"
-
-addtask strip before do_sizecheck after do_kernel_link_images
+addtask kernel_link_images after do_compile before do_sizecheck
 
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory.
@@ -755,7 +726,7 @@ do_sizecheck() {
 }
 do_sizecheck[dirs] = "${B}"
 
-addtask sizecheck before do_install after do_strip
+addtask sizecheck before do_install after do_kernel_link_images
 
 inherit kernel-artifact-names
 
-- 
2.31.1


