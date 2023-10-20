Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAD4CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:09:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.49800.1697789373037738274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=865775a26a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K7QqBl028399
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:09:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuf3a89qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:09:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btKDbTbRYc/MNzlQRgXTAzSFN5JmpiU55kvGnkwOjpMyu4pSx7NWONTW2SF9DDo/cDUVDB0IUR/ZcHwI3e4V6D1j80tV6HbtZvn6N6KxQ8O9+dLs3MyBB7bH9+3yhHS4X4pRdvS5W5Z2uTZFxcCs89FeMZgEoKZZCt0Z3EE3Sh/5kD+pPPBpk8IFEY1pnCuUI0+NPT2l2ziO+vfb7p8w9tYYgL5eB91lcq50U5bpyhOPpy58cjn7/usFLtXTTdXjfrhZgIdnZ/V2XcLhDVLrTyYemGFJsF1DjMzYTxI2Vjif3oKsVaxrNAKH0nHivM643VG3hdWKMCGJvwfeVAHBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un1+ayCCgs9tz36P/9ESCFLyC83qf222Zo+kmyt5l0Q=;
 b=RfhU5wx7anQ463Km2sFvALeXqOCVRQldTVV+8JB5syV4saWeYktRhO5wekEkI7m+p+0sK/YD5H80jTCapv+LzsAHjwQQFpg9JHMNKQmrmMJcBaezNw5tLMG7SLSyQYglTsLMZWltmQtrcFC7eDvE2Ky1fMvnZp/CnwE3eNw5uo6Fu5/lNAnL9J+iughs8gxcZxdlIH12ukOdfF3jHj7nELuq2BGiTz+augXJOZ3fPCITKtM5mcWRWpAEfk9SN34brsocTcu0i8k2d4m8qOa/sPzU324C4I8iS9FtJDVrNs7OFD/8pO41A9cJ3iVtnV7TmcZ8sJkngCCWPWbPY0SFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:09:30 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:09:30 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][mickledore][PATCH] grub2: fix CVE-2023-4692
Date: Fri, 20 Oct 2023 16:09:14 +0800
Message-Id: <20231020080914.1377762-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 369c7b31-a44d-4c35-546e-08dbd143e2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cuq2CHfLXFZPi2+gj1ULYtp/aKj4Cl5ThyIKfnA6haehut+WHx3TtytQaPCIMK6FKJoVpLK5VpTOnYIGdgdpmgzzYJ78IT7fkouaYmGYnrvimsdE/dKEGRvxSoPElIbIk+8z8gQuZ1ruKvTTaNu4c33rGWckr7249Urz+186TiDqByHRAaUa9ST9bvftUGMa7NqVOou+E9SA9Y/VXeNG9nlLCpqeE5gHGWyL+3kFSxj9KAi4x5QAQ9ITAvb8LgitLCdt21BnBsaSMOf3um6NYv3IErmA23h6sMe8A+GAaxhU5FwzRfocY5lv1gFU0RcGzQ8hxMwdpnKm+R+auFR8q969aQ/OZrUkIHGmzwFrdkzKT+umHRk+BL9ANgDhb7ouQp2p3dCHnZiK6Q7N9n9DQY6Au+pWQVmHYopAT3PTGY3ZwKvevsWGrthdo1QOSN0+2nT82ROIf80pSr4/a1Apt/2Fg/Dor3TvKs18+/d3r+7TWqTq+XCeQrWZ+HHY1z0zGwjisBqg+JFP9sRDlxi9za1A8vfppP8dpG4qNpH3Faiv3+duU2F6ssiC6/QVnmO4q9nXTY8ErXtvtiK84Kzp8wGDKCF+jatDZCsfW23IL0Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(396003)(366004)(136003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(1076003)(26005)(2906002)(8676002)(38100700002)(8936002)(83380400001)(83170400001)(2616005)(44832011)(6666004)(6506007)(52116002)(6512007)(5660300002)(6916009)(316002)(478600001)(966005)(6486002)(66946007)(66476007)(66556008)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nNrNH1keu8b1UGhSyd4SZO8d/t0cwh5O8+0kQQRb/3ZlVe2F2WJOSetWwh5i?=
 =?us-ascii?Q?KT0c8AHd+VCopqgE04GtKhCxN+tS0wuaXKduWPzfYM07UhZ029ADtDJv8dbw?=
 =?us-ascii?Q?/p994brhdakwO9IpK7GCXZMqsKdKx/t/SWKeKBgWCsdvpLg4y7X50NkV1LxP?=
 =?us-ascii?Q?aseiAlJCokytRnvJLtnooMTCYBDJKDbUstoc/EDwEZ+Ax6vL0LARUxWeECCZ?=
 =?us-ascii?Q?dziU5uvl650/00q2+5PjYdquoMZWiL3dDMpE5dBjk5vNLB0GsgrfXcpCgwnI?=
 =?us-ascii?Q?oVCT6or4ZHvDJHRpObdkZ3v2uNEIIeRlKEYrDYX7BIPTHIsiZR+H10t8BhSH?=
 =?us-ascii?Q?mtNzZRCU8shF4yKx687Fwu0w/83mfqPhVGCwEyo2RG1owcxLqytBSUL+bAom?=
 =?us-ascii?Q?+9AAxjfcFdy/3VGmehklrAqHS9Epk/r+CMCm5jkCSEaxv5RqzyLkl9HegwGt?=
 =?us-ascii?Q?saw5B1LoFK1DlufQO0d7N/H1m7sNy/LkrfLEyRgsQRllnC3yAKX8ynxK8sM9?=
 =?us-ascii?Q?5ofAu2jAWEPAqIgS4bqEl9INzEFThmwxzzN/PFjjsPPoQRRDBpNy7IV5elZr?=
 =?us-ascii?Q?PIi77UgkXDf94lWSoCUnNkpTtyi2by5GQYRL1TNeJpFa2vptQlL1WUMBajhb?=
 =?us-ascii?Q?OqBlc9F+qG8GGpIH4lnWh8hfOKHwNhwWKbWnchdVBjnSHgHpYP27LqmoUyO2?=
 =?us-ascii?Q?sMrNWtTbQ4tsC7tZEv4I5T2aZ4k1ypiqHMGy0zMVy3SKDFHXxGLFVpC8AYPN?=
 =?us-ascii?Q?2Ng6/b+lGQrmwOZN0qjBhDWKZsLhuEAgbtfmX/VxquOBwwaPGtEIT5u9O5PP?=
 =?us-ascii?Q?YydXNs98vl9fwF7/KCEVNbKZ3PuJHqNz2srf2/N/eFfWcWrUqFcZ2pZCm2xW?=
 =?us-ascii?Q?g+Xt50kxvoazDNcXQ1Z2dyZGPKNxxCln2lEvS+9jMJK9G/4++DGvgHhDGCX4?=
 =?us-ascii?Q?CNLIS4tmLCwIiW498OLAyOL8Ho9eoKdP7LeUR5/+D+JusEFcIMK9uzy6yYrJ?=
 =?us-ascii?Q?ADWUEgB6PwyHCoahgPzls93av7c1QqmfJWiTkRgd/rbM9pimRKq0mPia0TEy?=
 =?us-ascii?Q?NHeW5rYxdD4exOF5hxWDACxYFFTHERcBCLXzV/RtSqmcaJJvwf3Su9nqRngT?=
 =?us-ascii?Q?pYlVSjKqhyHhOqISxtUwzixWwPsyRTFRFGqpf6a4lD7sDbdOoMu+5wzTZng6?=
 =?us-ascii?Q?USwSGWiWyBG6zpOb2aT6mqTGXyxUb9kBturcGS66h0fnRbqw6bqXjcDxw4KY?=
 =?us-ascii?Q?fYPCD8j1E4+oWDRizgkcATLtiVmT/sKuQUH6JnVq/bVyzRNnSHxC3vQ7KSYA?=
 =?us-ascii?Q?cfWOozBDfFoPjcMXU2GUabbCM+JIAVMjB1VQ0GeZ9YrJHfe4iBnDkV/zjjDv?=
 =?us-ascii?Q?e9gzeetH0pDTL1EpD1jkIBC9wRWbuUP8v/g2v9xWHme76qn+oB7mDjgU228t?=
 =?us-ascii?Q?ztnrqIYBZOWcDETgQ/7vj3mfDQ1kPsOKdyLzPq5LgzgHx10MPIfDzUhC4DuP?=
 =?us-ascii?Q?P0xagc7MLhd1P9Exjwo1S9pb0wK3QrRBsx8izyX6jIRwSTuMk+oNh0SCOVho?=
 =?us-ascii?Q?pP7GJI3t5yA2T4z497VOkN/vH3h5jfvFXNB6lE9eEgPyMe+ZAcUYtUT2k4No?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369c7b31-a44d-4c35-546e-08dbd143e2a7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 08:09:30.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tk2yVisjgKkFGodW+2pMjxbQdkcjBYnKD10R/sIaJ2aZl6HC5ijUBeF7OrgbSYiNUgaVkPCE7L4oz7VNpL9ieiR7h8liSdQ6LeFfWf78+eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
X-Proofpoint-GUID: wKDLmL11uAPi-I2rsLglXu8yXKZuenEB
X-Proofpoint-ORIG-GUID: wKDLmL11uAPi-I2rsLglXu8yXKZuenEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1011 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189506

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Crafted file system images can cause heap-based buffer overflow and may
allow arbitrary code execution and secure boot bypass

Reference:
https://security-tracker.debian.org/tracker/CVE-2023-4692

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../grub/files/CVE-2023-4692.patch            | 98 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
new file mode 100644
index 0000000000..305fcc93d8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
@@ -0,0 +1,98 @@
+From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:31:57 +0300
+Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE_LIST attribute
+ for the $MFT file
+
+When parsing an extremely fragmented $MFT file, i.e., the file described
+using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a buffer
+containing bytes read from the underlying drive to store sector numbers,
+which are consumed later to read data from these sectors into another buffer.
+
+These sectors numbers, two 32-bit integers, are always stored at predefined
+offsets, 0x10 and 0x14, relative to first byte of the selected entry within
+the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
+
+However, when parsing a specially-crafted file system image, this may cause
+the NTFS code to write these integers beyond the buffer boundary, likely
+causing the GRUB memory allocator to misbehave or fail. These integers contain
+values which are controlled by on-disk structures of the NTFS file system.
+
+Such modification and resulting misbehavior may touch a memory range not
+assigned to the GRUB and owned by firmware or another EFI application/driver.
+
+This fix introduces checks to ensure that these sector numbers are never
+written beyond the boundary.
+
+Fixes: CVE-2023-4692
+
+Upstream-Status: Backport from 
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
+CVE: CVE-2023-4692
+
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/fs/ntfs.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index bbdbe24..c3c4db1 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+     }
+   if (at->attr_end)
+     {
+-      grub_uint8_t *pa;
++      grub_uint8_t *pa, *pa_end;
+ 
+       at->emft_buf = grub_malloc (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+       if (at->emft_buf == NULL)
+@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	    }
+ 	  at->attr_nxt = at->edat_buf;
+ 	  at->attr_end = at->edat_buf + u32at (pa, 0x30);
++	  pa_end = at->edat_buf + n;
+ 	}
+       else
+ 	{
+ 	  at->attr_nxt = at->attr_end + u16at (pa, 0x14);
+ 	  at->attr_end = at->attr_end + u32at (pa, 4);
++	  pa_end = at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+ 	}
+       at->flags |= GRUB_NTFS_AF_ALST;
+       while (at->attr_nxt < at->attr_end)
+@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	  at->flags |= GRUB_NTFS_AF_GPOS;
+ 	  at->attr_cur = at->attr_nxt;
+ 	  pa = at->attr_cur;
++
++	  if ((pa >= pa_end) || (pa_end - pa < 0x18))
++	    {
++	      grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	      return NULL;
++	    }
++
+ 	  grub_set_unaligned32 ((char *) pa + 0x10,
+ 				grub_cpu_to_le32 (at->mft->data->mft_start));
+ 	  grub_set_unaligned32 ((char *) pa + 0x14,
+@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	    {
+ 	      if (*pa != attr)
+ 		break;
++
++              if ((pa >= pa_end) || (pa_end - pa < 0x18))
++                {
++	          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	          return NULL;
++	        }
++
+ 	      if (read_attr
+ 		  (at, pa + 0x10,
+ 		   u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR),
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 41839698dc..5ce8699363 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-3775.patch \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
+           file://CVE-2023-4692.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


