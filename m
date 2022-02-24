Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D90EC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 07:41:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7630.1645688480560059138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=izgWGZjP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9054982802=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21O7We0n014214
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:41:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=zsUQie8CEY6gdwm9d5FbpzHbZABOlwD3Bzg2M/udpW0=;
 b=izgWGZjP2d7nQFNBaQcKf0bbfFWsKLu0NzM+RwcxPqwpI11+YwMj5tLhHKmrMALJtM4l
 +XkqaVjlT10OHaI8PvIGU/YYpuVzCqCSDFQWgaunBOIPz0KUUWDMkdaDcpQblQUHGgY1
 DNB3sXAQwiSN99XbfzTdqUDtIaKCV/rQSInqAyDX7pWEALwAuliDCOxb+LMKthJ5dctl
 FHI46JOacvzjXVff3J3tKoJRmhrOcXVpngJRzbU+k41Zaoobo5NvI0FP96QdbNeASWFo
 Nu07KR9gr6bn0fSa/AJJZmLMlOQCi3m7JZSkkWgfNT7IF7RqBrVda8gCuLmEZQYcLzR7 2Q==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecj2kteu0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:41:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqizTJm0vB36HLGoqQod4jfAhL4Z4Iq4k9/7npiQ3vK4voK7zJjPlFGYmv/CjPICnVNWHJbsKhFk0bIIyIsWfAt6riMAZkKQdeot5qfGP0Bb6cDdJzKybJJLi4+8ycHsAEZH5kvaasACfiPJ2SWqHyt7BYCq3OOdIZp0+Wb2VM8irar9/F3+sLu3xlUR4A5kiXsJHTHhyFYkCq68LgOlZfp2XTlbQGN6sVRlx2ykdpywtGsitJKI8mSNne+/wb6cx+Mcue2w4zZkR3BcrHNeEGi3EQI6vcA2GCeqLtxDMs1w0Cz+WiKGP/Bi9wT5hOrgxaOxdqUgNU1NSX+U5Hndew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsUQie8CEY6gdwm9d5FbpzHbZABOlwD3Bzg2M/udpW0=;
 b=AjQoow6/AJlH9qk4b7S7ZaohJWohRnyiUvUz5JqJG++mPFYy4bQsNEN7BWAnolZTSMgypsdmXZhORV2uvGiZt4dDqvb6gVrUeD2MOMrYhGETHy4+E7MGTi42pjt5voht+MVzQ/RR3tcekmOCzFKtZbPT17iXnDxzjPsDWzRdTFHchXvhJKiYB0Bow31E8De48zjBla7l+czQwbf4zHRqDomqOtUluEG8o0xpU25fwZv+ziez9YaOWQ8M6Qvr0wGqkVQ3F+/9UuuZo9bzHZDM4b27AQr3d3GgYuEHe/omhhJlCUUYazAwfwOipsGgVmMowb0j4RsYpE5V/cf6oW6cfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN6PR1101MB2321.namprd11.prod.outlook.com (2603:10b6:404:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 07:41:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::7dee:4199:b4c8:c79a]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::7dee:4199:b4c8:c79a%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 07:41:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] glibc: fix multilib headers conflict for arm
Date: Thu, 24 Feb 2022 15:41:07 +0800
Message-Id: <20220224074107.867356-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224074107.867356-1-yi.zhao@windriver.com>
References: <20220224074107.867356-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9b5c3c-74f4-4dc1-fc80-08d9f7690b40
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2321:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB2321395D95E00B9748EF1CB3F93D9@BN6PR1101MB2321.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7aFab2a+oRQ1h2VCPCYIN/yuEzi/+XLaPn/s8szn83lptx+sOiRFDeV7p8tWqUbKSNjtTxPfZONHGSBLNQOFt+eWV7nlyHhQzQXKd3Bwz8YF1mD2UHe/S8SjwoEjjZ2FNEad/hUZIN7T+cvbND53WeYmpqMvqfSU7CEpNe9pPOh08k6wwaQoQ1B6+BcnRg9CYtu1gJAvL2fHz71GfhE7L24RnCes5m+nZv1vz0FVCpzo4xdXCnv1J97XJDh5+hOKSzw7H4krR6BhLXTW3erktrrQ19t0eBEABhP09fKqV3Zqzml0bpLgTHFmqj7LnIUQB+RYJGF1Drq7M6M88Euo12vF82kzN5vEOeG3f65h6NRKF0/Jptr426R7XSWU70/X5e/V3yWRy/pBEcgclQBdqf+u7ocIxZP9qDA2R+a+fPAsqhHL59G8U1gfu8EXdEIOyzMKKYR26kl2SS+LzSLM8TZEcAPMXd9Py9c+/e+naqQAuoJp+r1RW008Pb8EcIIYRVXKxF2oBk7IjvMJDcYbpyrBA21kSlJbhmBE5LDVRrpDCbfuG/80FEVT9xEwN3c0u6uAKSI2nwJoobnZie2MNRU9Ac1UHCQD9sWehDAR2AB79UA2PypyKykJGMt5Yr+DtLrxNel7VSpgcz5zCYkU1BWCDt/RsqicJmfz2T7YJXkT1pt7cEJoqd3tFdNgsYSZFDHVDIWs+Srlg6H05NnJvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6512007)(66946007)(66556008)(66476007)(36756003)(86362001)(5660300002)(8936002)(44832011)(1076003)(38100700002)(508600001)(26005)(6486002)(2616005)(8676002)(186003)(316002)(6666004)(2906002)(6916009)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N6Gfol9aoTxXroHtr6kQ/gRr+atusEuudwN6QMjHjH0E848trI2jzyIQ5ink?=
 =?us-ascii?Q?YJX/XM4sqWYgHdlPZlsjLPX++Qd0UodCVBYcIXh2oLIgqZbiqvd/DFIw4nd4?=
 =?us-ascii?Q?hcQ/L+jIwXNl5QEb+TwFfbsFPa9YjgM3ByZPPgw6h5/35SdV5qsx4zBIU/Dm?=
 =?us-ascii?Q?zAQzw7Bgt/HBRCP/4fvHPVCnk7UC7lx2rc471+fI21QdNDpCZzzCMKdq2d24?=
 =?us-ascii?Q?8Wbx2K/U1jKCjf231wFR86yIeDsXd7s6F85bcKJyhTDh9FKMLnTOS2Rmf+E/?=
 =?us-ascii?Q?drfAcUx97hl0uCtbUdRgYXeFXYLk4H+vwxGdhe1oC67BraKa35vge9coS0fs?=
 =?us-ascii?Q?qCGF7vo4i5eOGMC5ZjsIg63k4c0mjkL30eEgOge0+hNpT0U6f2uksGQIFlMK?=
 =?us-ascii?Q?dYPQLccr3JOATfr+0COKR0UoaQXKqptMMqSkDv2oOJmFjcE3LJo81fFXvPAR?=
 =?us-ascii?Q?O3Tm63UaJsu+oFb+6DYrIEMtnkY7r6WIMzSQ9zqnOBuS/ALzfP0nkmggK3D6?=
 =?us-ascii?Q?YjImuMgIonXdtAgc0AX5almhgyMEMzVPbmvlBRypB4270B8lBjf7zW6Ctq+U?=
 =?us-ascii?Q?H2Oe+ekACVyyjdkmyLXp8g59TjQpjcnF67BElQMILATcj4qqXbhEDbJ3Ngzs?=
 =?us-ascii?Q?wFq8u3E73VE5I0CxNJsFHIyPaPUVCHMZkKJWePukSigVrXOQGKRUi3iS/cpb?=
 =?us-ascii?Q?ao+XiE48/8isGBhVjFuGL/70p1tvjp+k8KIdA6Z11YwO2PRf5e+42bW8YGfn?=
 =?us-ascii?Q?0uHeUD+qEuPMUx6t7Tte+/aQG3BQSGPUoEBMbzn4JoIWMd4RBXk0pLy6qDyc?=
 =?us-ascii?Q?6ActdLfdHYgwqI2nUOofRhCLq2qHBeVTQM3iFyrd1Y1F8cC6AzwMWENJNzut?=
 =?us-ascii?Q?mZ5pVCocsp2JO9SfhcqxVhxBWwW2GjSyLrBxheVpDKm2byXD+5WCuNz9Hz19?=
 =?us-ascii?Q?G93+CXLWHx0dV4gZoUQMjq7SIEatGauRITDOlIQqDSNfjP7OZPKpS/dUPAtl?=
 =?us-ascii?Q?IQbzJSxogRvNMfi0Ry7Ft13o6ZLJc8Ibs17lcIMP2e0oLRBDPf4uJYkqHkjM?=
 =?us-ascii?Q?ze797nvifkIkSoaUc66kHmQK7Sk7BuZc1YFk2PDMCnrKvFY2Xnji7dR3sYAq?=
 =?us-ascii?Q?BgsJkIbD9c9CPDIwncBOHLUFc+4ocyd5GNjICrn/SdZuxrvndj/dYPxpHMiu?=
 =?us-ascii?Q?5xMzhqX62j5EVpAv0wSGoG6Hrg2JOVBXq2yOVvkxPzT+3U7QxHy+QEybqutP?=
 =?us-ascii?Q?euEUHqnF2p7DrJeK25zUuntinupUKObKNId2nI//VGjhdxQ6STJg5hhiFYIT?=
 =?us-ascii?Q?lkBg8J83bcS+18LyM6zTvCv1s9XAHQN95jiSh5T8xOJuJGiUGXuEpSeUiojB?=
 =?us-ascii?Q?x6fwGRkfc+tYqFZwXJ0T0JYj1NcHmoiiW9uqh5XMIsCJXeAZW/Mgqb/sI/0z?=
 =?us-ascii?Q?q7AeplbSHcae1ShcQp8P6nRrKujZQHdFOmIttgv81Rsfe7uQOwqKcPLhONzo?=
 =?us-ascii?Q?jSutyPM5N6XOe+pzXmhj1ipwOv6iQRmWfHjUHqSgErJmhCGYZPGpLfrlNrQB?=
 =?us-ascii?Q?PnBL7tx3F/qhHJTTuQyXoFjBAjfP0uLu+M3QyG3tEE9paExabdKdwh5fXJIo?=
 =?us-ascii?Q?T56BvsDd91Z8G9YvqrmJBTk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb9b5c3c-74f4-4dc1-fc80-08d9f7690b40
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 07:41:18.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4oHfqFGQb1Cbq6nF9m2KkzYGKw0ifBbwXKdlT35r7ysJ0adMgYZYTg+uOtCtKICC43k8HejV88bh37njzCjaTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2321
X-Proofpoint-GUID: Tjyh5JyKLDoRjEFFQX7gsxGyPlpbCpuQ
X-Proofpoint-ORIG-GUID: Tjyh5JyKLDoRjEFFQX7gsxGyPlpbCpuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=822 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 07:41:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162304

Fixes:
Error: Transaction test error:
  file /usr/include/bits/dl_find_object.h conflicts between attempted installs of lib32-libc6-dev-2.35-r0.armv7vet2hf_vfp and libc6-dev-2.35-r0.cortexa57
  file /usr/include/bits/rseq.h conflicts between attempted installs of lib32-libc6-dev-2.35-r0.armv7vet2hf_vfp and libc6-dev-2.35-r0.cortexa57
  file /usr/include/bits/timesize.h conflicts between attempted installs of lib32-libc6-dev-2.35-r0.armv7vet2hf_vfp and libc6-dev-2.35-r0.cortexa57

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index c1c0114a07..7f9e7503a1 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -162,6 +162,7 @@ do_install_armmultilib () {
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 	oe_multilib_header bits/procfs-id.h bits/procfs.h bits/shmlba.h
 	oe_multilib_header bits/struct_stat.h bits/pthread_stack_min.h
+	oe_multilib_header bits/dl_find_object.h bits/rseq.h bits/timesize.h
 
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
-- 
2.25.1


