Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9508CAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 12:16:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.480.1759523515324486827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 13:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IJ8Hj1Ci;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=237135079c=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5939fsoG1411165
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Oct 2025 13:31:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=8Lq3qRqGq5fDMmqWEgZb
	sJjXUPeom4ZT4PqxIgVsbnY=; b=IJ8Hj1CiZUBGbJ7A7SdJ3KAMPeSPpE0tV4dP
	/jFowCVB0Zoym48EZa3W6zvhZIlQY6qXHMAT++7wpNevzTumriHiF5KFxJF7e70W
	7Kmwy7hpuH7MVdp9Y2D9meHMIvmqyOmuSls1OKTG9995rurIeTKm+yKXZL6WgM0m
	ztjnEdxUIuwrpUP9i094dLsqMOqMFqjty74+8PSNgPO/3ba1PslAZSTIl8ROfzfB
	lfHPMNpnyHRDMJ1/TCGPvgfV62KNsBiTrkkrttGMSvoQAGyKMe4uheueEwhMUQIi
	WehI36Whl5g6P7HHDy+xJ/sfLJ/g5iY9GMO9Eivel46XPBRjVA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49efegg94p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 13:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSbsd/Gi2FHzTB/aNjO0kCqaHK3rtYdCCWF5Q2ZqImo7JyEMTNJ+BP/aBBQGVfBVT2SRyOnhroAY3KktKz061SJJcuvT/+vbfOdW8Zzs1V7GGfmuYZ+qQrrQbgmzANXMFQb5rZ5nvRmO0+hJnZuC+NBLstskVMNwTceSQwkIbdkstuyyml10+r1T1yMUegSlNxISQT3LfGMCfyWMrYM3/jVeBlTWO7f+YgHd7bkk0LkpQO2+EuqTzg4JwAFGItQJDpSHvT2AzxEUWrs248bHulAYxzBROCRutF1dbppbLaic+WQLv/zmwJeCT4pRo5rPCwKv54KSrxTqFzRoi7zTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Lq3qRqGq5fDMmqWEgZbsJjXUPeom4ZT4PqxIgVsbnY=;
 b=eqV3b0OPfZCyLC/GCsOZnJTqwpNoqbqYIZwbfdtYN9YtVTE5lJFXtTVHvGxPoaIh42EvbZ7lz5OThulzsG2/Qy3ZuEF9urAkWU+XaomoBQq6GBIwWCZ1xksRB6SRu5wwM649tt57rgzuWB3UEpQTEqDYFumZ1kO5cdI+1Cb2i+O5BBbydI4WNfKPBlO4hE208SG26ySL4pRfOSwUa9+PiLNgCGbl2EzXOsRzonjvUSuPQK9iGWstayjU5cbzajjqYeIUq1dsQ0BG4n6NZYgP8k4UymY9lFcXbZF7/vSGCtoT/2NyeB0BmsHmp0aCjzro/7ft3XHBu1gYnd8pjsuHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.16; Fri, 3 Oct 2025 20:31:48 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 20:31:47 +0000
From: "Dragomir, Daniel" <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] wic/engine: fix copying directories into wic image with ext* partition
Date: Fri,  3 Oct 2025 23:31:30 +0300
Message-Id: <20251003203130.23843-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: VI1PR09CA0115.eurprd09.prod.outlook.com
 (2603:10a6:803:78::38) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|DM4PR11MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a6494f-464c-481d-349a-08de02bbe00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xBqNFBbYypbG1rF0d903x0aAoA+CL4/QfDSOfkOKV8KihUsWYnSHXEJPimVi?=
 =?us-ascii?Q?f3G5Dw9CVp8L6y1nlzDYuhe7VTEVSZhZ6PAM9iJYxU9sNj0z29uTc5Nlyj8b?=
 =?us-ascii?Q?nlx/RV+j44uBSzYIBbcjFk6PuVYrYwl5mLKkRVSygihsv0B2HzCiVZSozRv+?=
 =?us-ascii?Q?5lHPgP8Z21LZUbV00yN+ya2d4AJbX5FWE+VqLuG2SMKz6lovCyMauFx9uhgY?=
 =?us-ascii?Q?jZLx8Rlqs3AYxiB2clc0jToAYNLFPrgbQvtpuAFxqlfaRc0z4A9NUXZoJSJB?=
 =?us-ascii?Q?y6I2uaIl45sF0cRydjospGYI9/lw8IPd2R+wR380kZ0q3gjQxcEZAr1oQHJr?=
 =?us-ascii?Q?XUlcVt9s+J9pLiAaIqDAtHjW0zXa4ckVNyB0AzhkW2ygEW/q9IdZVABBKy5h?=
 =?us-ascii?Q?7/F07cOfzeyPK5AzX4HBvlP2pKigUKG08MyKa5Zff5XdshonjEjEY03c4kKo?=
 =?us-ascii?Q?KlFkdu3G8qJBFW1v31sLJJIsHVjyHCXn424St/uDINhlAllFdKH/6zoO4eXg?=
 =?us-ascii?Q?0TpxzJRkMg5waqsQ7a9Gq5cz5ofIYOvKEWfatLOUIUWD3p9hD9GaWe+PKWWq?=
 =?us-ascii?Q?f1X1CpWEDL3FqZzTRmFsfWh78dmPByAhpqHefmENO2WPILw8vE+2smqaq9Jn?=
 =?us-ascii?Q?pQp0KF/M8wYKJdLy5EZ53J7beyYpF1Lh7T0WY799dOsQ9u0jSmCKsSNDlyY6?=
 =?us-ascii?Q?Pt+MKL+CNQzyur+YvMwMTEKRXY0rcHdw4Od9u97YSMLfMjTYiQciKfMUBN/v?=
 =?us-ascii?Q?U4v1DOe8NeV3zjE1IYmAk+iT66eHVjjf3pZIY3QIuSjtfs/KhziA23gP8Vp6?=
 =?us-ascii?Q?yCvV1RjzPTs3gwRaNNLXsLkcIGV/IbxNO8qjzB5tFL/4qL6SCoe1U0NZXOgw?=
 =?us-ascii?Q?WeCqwSz17tUoPQeuEUmkJNrrrYJr8Mq7Yxd6z27yvLo1q3QQo2QwjV2yoGAJ?=
 =?us-ascii?Q?DqK1BOijcmraY5JJNKFaKRbTuXd47Xji/emPtaVmte6Xq7uIsbyyBBn8umXX?=
 =?us-ascii?Q?Ysmq/RtiwXLf4sKmtmlw6d0nqvZDivf59n8rJKehrwiHEDn+22rhAhZYvqr5?=
 =?us-ascii?Q?boWo/IY08LV8XyHih+rVcFCbFd1HsnHkKf8VskLaXN/aoWMRsRSRlh0XpJkd?=
 =?us-ascii?Q?47GvakEHauAsn8MP2lGdGrTVXyNZNMrS/YO/HzqcCXJAg5q8Unp0g4c6+Ngv?=
 =?us-ascii?Q?zFvSTN4VCcmKppi8YqC4SHlzcrYE3GIrHCIE3eWl4wipc0Gb1Bz6X5bLBly1?=
 =?us-ascii?Q?j5zNRe464TtwIfHJrBSDz88ZdnXI8JfzGZYFNhRRs4cK/S1jq+B0EHpc2I/j?=
 =?us-ascii?Q?B00Dazgj+T/AVaQ2ziJbXLgbI4GDSdzTRuAtTdqlenUXiiO+UK9/p8M9pZOJ?=
 =?us-ascii?Q?X1QEMUWRMzxq5ToArAus3HgAJcZ+0t4pBoHhZNEDd+J5jBonymqJUiyF4uL5?=
 =?us-ascii?Q?ZCtD1gaxKyhh10WI9445NZqCNPGOkqJRkqJyHkhza3B9khSFwdzWMSBGO0cX?=
 =?us-ascii?Q?lLd7yPQkN9dMqdYu5y6qg+xRAL4F3KpztqIe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z1UInbjwbES/iq2zYoDOkt4WalC5eGt95/eD/1SXChBoHx2b+y0JTltvB6fv?=
 =?us-ascii?Q?/PS3OWPzcPrVlK700E4T8HABc6pjkS0X8nVDCHnW/VZA+aRFDNIeTnBBIB5i?=
 =?us-ascii?Q?L79qSMVY+t6fSZzXIm6o1BCMU6eUpcT1UvcrlVdWhfVkAC2stuEIHFli3Vuh?=
 =?us-ascii?Q?CTyPJ2LZALBYJLK1EdASrTAnLKK4l6QPFJvyyu9/yH9zfMxkppuw/9qWlS2W?=
 =?us-ascii?Q?xmbkPtmsM0xhg/JsQSkRNTrApMaOWO1FxptwGWW3BeEW4vaY4Tdx21vTEKcq?=
 =?us-ascii?Q?jK6U8y1UL7nTSxteTFT4GBg4+sBUkjqcXMJdbYQidh6dty+Fip3vvnhLQOy4?=
 =?us-ascii?Q?hArffQWCm6krbwNUS1N8Se/DE8a6ZQ8QWyjjoPNKdRnKzyee4qYJgoBK0K0n?=
 =?us-ascii?Q?L09YbaDYY3ZQA/qDMrJeqx+g0pi7pnovrlV0xL95qOZlKnw/A7oAsscNaueF?=
 =?us-ascii?Q?GwLketl7hpmrNZ9yo8P8zDqlEVUjWLivi8+d24pumD3LBi8sOJDO5VcpPi3R?=
 =?us-ascii?Q?LuWn1zeQvKXRlA+WhAyfltppY6XM2gRKIDsyAAq1RCf6Y/YRDb2+EhABPfpB?=
 =?us-ascii?Q?iMEUsw8G8LBuA8AadjC5+va10r9/hOVSE7vtvX42RAWXt0dwsXvNkrAJa7Xx?=
 =?us-ascii?Q?IF68FgWdTpKLbNGwm64eF7ifyl9N7n+SLUppffct5Q0FZmbmLBOYNfBcrc1f?=
 =?us-ascii?Q?gRrYJbo5R5PdvK/j51V2/LOZMw7D2kMHaK4UQS+SIDb2rrjLF7vfaiyCRTTH?=
 =?us-ascii?Q?7Jccr58rcN820gSib1NSJXsn7Y7rB1/qvlylpC/mYslllxtW9LEatSEbIQ82?=
 =?us-ascii?Q?3SBErJerebGUAhbvWJrBdkZ9vSK9+Ii/O0NXv667iVGlZ116wjiA2Bddapgw?=
 =?us-ascii?Q?Cx2RmjHoCGbbzGRPAN4GGgkYwKsHNzG4fRD5RlAxpzdjuWZatVqBSfeWJgzi?=
 =?us-ascii?Q?hikyNiRyFbRh2jAgGNACGyVCFldsILeOptDj6hNHvpX3d+MDDv99EMusWCbG?=
 =?us-ascii?Q?uZiO0EanYNlR1tD2zJ0gM1vhClK/0BooJ312aQBvzDIu+1ibjMRV63hGSMSK?=
 =?us-ascii?Q?Y/6zCnB26obJd3m8y0OkvCREhuEw8sVR0Xii2tG1bsZZiH8kkFEI8myo0xkL?=
 =?us-ascii?Q?IuriSVDtnzCI9XyB/klnYv+YLcqGSs8jxdqBF3fiKoOzLOrypdqtB2CPMLD3?=
 =?us-ascii?Q?L/ToYezCq3i3nPhF1G1McikZy+j3NI4TSaE/kOON7yMxADZltOTUT2SYbmbw?=
 =?us-ascii?Q?uM7GdE6mpixvsDN6RFZ9/uw6BRf1Bd4m7YoUJ2/aedQUAtqoXVWUv3t88XPv?=
 =?us-ascii?Q?h21T7QLh2GN4vgCAkYQP02i9aEQ48Hrcl++3zjSJcxXy2av/9Fdw/EUKya6J?=
 =?us-ascii?Q?swvuPsuWM8S7CU2Zz2TH7I7gh/WrbgDThq1BWDiXJOqREY47MWqIpODkkdV5?=
 =?us-ascii?Q?uoam4QYfDBj9JsaKyxV8a+I8p0/xSxNeF8y1agfnZDephl2re8uTCvniHMPN?=
 =?us-ascii?Q?EI70Sw4XVQP/BjmrVfn+6PBDmPiJHknkm5IOQLDyghU+qm5J/MY8Vqa/XaO/?=
 =?us-ascii?Q?BniSjzZgThg0YxOoqDrbjUKYhyz3hYFl2r35MUXvmDtIc0breeErucN1vmgY?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a6494f-464c-481d-349a-08de02bbe00d
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 20:31:47.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/ko3OVGBQs1Q9rx9Cpq7WwtUAry1shNtUcpyQ3FtYKf7f0WSiH5oTi9mQKMDCZQMC8xJsfNDj4aiZPaWang+tL/7MNXd+gPIOsX5sHyZrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
X-Proofpoint-ORIG-GUID: uhQDQ0JaijqLB8wnaevxaG5gYUJ5vNCH
X-Authority-Analysis: v=2.4 cv=aKr9aL9m c=1 sm=1 tr=0 ts=68e032ba cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=-5XPcBp7yNJgENPRR3YA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: uhQDQ0JaijqLB8wnaevxaG5gYUJ5vNCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDE3MSBTYWx0ZWRfX1c8LkzPdwmh+
 iIVTwzm8peBsguLrLcho2fbvdTo7hCgifn6kKVRQpC1xJPESGM7snRbNlgOngnf6m9MrwSxihHV
 oPZgSeNmGoQrFRmrYWZVx6JwKO3aCLlk3RFLXPYEKzGz+ZOXRGBO7+uFR+ek8FfPmLYRxs0JwwB
 kA8pRJvmsDXxXMdeOCbZPbS4DFnCg9ay5Ycjc9riyclotBZi5Q9Yvbz4AOjKrOXUzjCzIwVIhPc
 c4ruBaMsi3ZfyvQaXvZ2LU+FLE+ndG+FogMDPPJW+iVCKUAgnJbIMExayGfMTwDVAotyUEe5CEd
 dagxnmhR+L3Lrsqu77jwnqVfwt85YWgPSggNCrWQxyrHA0G9MatLT7eU0e8p07y91rmf9jJJPas
 iminO5kJP+H9RChn4fcKGkheQYHi8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510030171
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 12:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224430

wic uses debugfs to write on ext* partitions, but debugfs can only
write to the current working directory and it cannot copy complete
directory trees. Running 'wic ls' on a copied directory show this:
    -l: Ext2 inode is not a directory

Fix this by creating a command list for debugfs (-f parameter) when
recursive parsing the host directory in order to create a similar
directory structure (mkdir) and copy files (write) on each level
into the destination directory from the wic's ext* partition.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index b9e60cbe4e..9d596be3a7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -345,29 +345,64 @@ class Disk:
                                                    path))
 
     def copy(self, src, dest):
-        """Copy partition image into wic image."""
-        pnum =  dest.part if isinstance(src, str) else src.part
+        """Copy files or directories to/from the vfat or ext* partition."""
+        pnum = dest.part if isinstance(src, str) else src.part
+        partimg = self._get_part_image(pnum)
 
         if self.partitions[pnum].fstype.startswith('ext'):
-            if isinstance(src, str):
-                cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
-                      format(os.path.dirname(dest.path), src, os.path.basename(src),
-                             self.debugfs, self._get_part_image(pnum))
-            else: # copy from wic
-                # run both dump and rdump to support both files and directory
+            if isinstance(src, str): # host to image case
+                if os.path.isdir(src):
+                    base = os.path.abspath(src)
+                    base_parent = os.path.dirname(base)
+                    cmds = []
+                    made = set()
+
+                    for root, dirs, files in os.walk(base):
+                        for fname in files:
+                            host_file = os.path.join(root, fname)
+                            rel = os.path.relpath(host_file, base_parent)
+                            dest_file = os.path.join(dest.path, rel)
+                            dest_dir = os.path.dirname(dest_file)
+
+                            # create dir structure (mkdir -p)
+                            parts = dest_dir.strip('/').split('/')
+                            cur = ''
+                            for p in parts:
+                                cur = cur + '/' + p
+                                if cur not in made:
+                                    cmds.append(f'mkdir "{cur}"')
+                                    made.add(cur)
+
+                            cmds.append(f'write "{host_file}" "{dest_file}"')
+
+                    # write script to a temp file
+                    with tempfile.NamedTemporaryFile(mode='w', delete=False,
+                                                     prefix='wic-debugfs-') as tf:
+                        for line in cmds:
+                            tf.write(line + '\n')
+                        scriptname = tf.name
+
+                    cmd = f"{self.debugfs} -w -f {scriptname} {partimg}"
+
+                else: # single file
+                    cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
+                          format(os.path.dirname(dest.path), src,
+                                 os.path.basename(src), self.debugfs, partimg)
+
+            else: # image to host case
                 cmd = "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' | {} {}".\
                       format(os.path.dirname(src.path), src.path,
-                             dest, src.path, dest, self.debugfs,
-                             self._get_part_image(pnum))
+                             dest, src.path, dest, self.debugfs, partimg)
+
         else: # fat
             if isinstance(src, str):
                 cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src, dest.path)
+                                                      partimg,
+                                                      src, dest.path)
             else:
                 cmd = "{} -i {} -snop ::{} {}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src.path, dest)
+                                                      partimg,
+                                                      src.path, dest)
 
         exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)
-- 
2.25.1


