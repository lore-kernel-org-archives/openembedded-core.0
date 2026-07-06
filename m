Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F274C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:07:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147112.1783328837439871322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N/YM1ftu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=164719aade=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666966rL2846807
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 02:07:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MDTSUm6Zo
	GNdQ2+IJ6ITXfQgBmskU65JNDbBXXoxoDg=; b=N/YM1ftu6BK3Q8I+TGbn5BMT+
	Z4rMfufggYJOkjILGLQ2ADhZP1ykYWeH1/64nEQX5At3I8ErbFaN6HochoP+0v63
	w5blfJPTD66CAQ52yalAAu1zQalD6QzixUp1LlM0PjSzaOx+E4kTyyyoIZ9ZKRg3
	r0TRz2WlF8uaX6bYBYF9W3QlaxUj/8dZEwAPg3uAszoYQqFYCf5228cebeQYyu0T
	qNcVQ8AJRIEzU3fibcmU5euzBA4yCXMy9HRqZKQ3DzTQpDn3DSdxvwi5vV8dcbRs
	tspaRJQV6ywOgolgQaM0cnUYTeSxNoTzEXBSlHRjkRAeNR0TVUMtvgjoyHXKA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf19r28-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 02:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0XFgGWpH35fxoM5tF29d/qEkWPqVCGZ7mXBq3eqRRBnSdCraqK0VlZE0PMOgfa2VZxJ8JMAHGP0WvIhKFHT3azCcW28CIjrgbPZ/XcghF3i/C/C1CeFoI5DFvF1or/VtKpR1Hg6d7Cfz/RZI//Re03G8FLh82GO77Xy6RwMy1NI/iJhIMlizZ6cuZLa7cJXhLBirb5oDBzRGXQfA2DlHHIQAVC8UXvnV5BaOALaWsZeqhtts8wmERkogg25IF6mdNd0nP/IJDcEOJtZu7FDZdfMZhExj9YIX4DwWSPjYT1U39InEP2EJj6rH1RccuZ863DDtfRVExyX7hv2kFKNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDTSUm6ZoGNdQ2+IJ6ITXfQgBmskU65JNDbBXXoxoDg=;
 b=e+rZzgi/RfGMT8WiVsuUoGtEo8hZPdet6ICzFTEYXcLoJ1IG+spxeIx0pi9FIj6MajZ0rvUdfaUFOh7OKqPRfO2+DWiZk3GAdhCauBYC5CASbcY6Abtyt+6D+e8cw9o3Htb173UM5cyQH9OoRvc73DqZtjJVW5A9WakvUwTRvcDwVWGAnxq+L5aJFebExSppftRixHnNIfCwR2xM4nXX4DVwWIhe/VCdBAWHFB4sfS/Yj+i5hh5WqzShCInNEWq03QDPk1OzUuVxr5GYYnqYBf7t9d+8FvaoRzZEzbT4YhYOFunJP0eWEKDvS5DX0Gd+vm4GDVpO9MVPlw4kH096PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 09:07:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 09:07:14 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: Add CVE-2025-69646 to "CVE:" tag
Date: Mon,  6 Jul 2026 02:06:59 -0700
Message-ID: <20260706090659.2543025-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: d46450af-c077-4e56-85a2-08dedb3df8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|52116014|366016|18002099003|11063799006|38350700014|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	gm2LxSOhuia/bSUWYVhhve/8nPsixtqZ4RdaIfW6Zr3e8GjHZuUKVe/ygkS9AwLNCqQX3Atl+1lHG7XuSTlntXGrcMGnLJHOtAGtHWHIlIFRPgCk+pYBwwegZkMSzb0I4h69rY9fqv1qdSV9AbtBYTzJBYUKFIZwOYGCR40Xd0TtP6y14ZJ7nJnToH6QGMSp4jAHpFHaUq95nMYtyMzT+HFLn7tTU30jNiw4ecFiHb0X+iHKUjCws0OUdLpqkTpOQo4E4yVA0awu75Khv2gjzhOgCF3V+j8jgzVwO1Xe86d3DDxNy3T2huZdP8LRSnkODqvC4Ez3C337JrIkGpKCGZ68Ovc5bHfk/D9jOSbA1DfiRXzfAa2VTFDasSz/AXQ7DDhI1DuJlEu1MHbjv2JKNMDLv+LfIdagbuQIVTXMJCC91WRcj4sQEN0Xanvq0Mj+ebkCt23M7gEE5gQMiMV795Sc4vUY3FyZqR4n8xep5QiaCpB5qBbcZLQb5Vw+be7l8cwLZg7pnuR94sIqyKycgc8zqprT+Ll5TI78YHkwzh66uVKRrY3EWO2ZBTiMFU8sRNWKb4uTYPumcnU9DgM5A63G0oX9OGopkyD/+kSk78Jxh6O/RQ3msysvPXP3eEgrOaLi6YmDKbFRRO4z7nEgaxfxGujwZQ4YO/0P85NL4Vw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(52116014)(366016)(18002099003)(11063799006)(38350700014)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YMXCv88kZgTk/vEJnfRz4mrBxjG12MXXFLrYNMD3yLrAwVF+PXpddoD7FXzp?=
 =?us-ascii?Q?smOZHzVFjbWakensrUlSjwtdMXOIs9YL2flFhxkTwMwJDJQk6H2NL7wyS6pX?=
 =?us-ascii?Q?L8XDLeDD1avza/qfyOFT4UvyGG5mG66H2wYhOMTTJqmSZR80MSEDbQ0zv+WY?=
 =?us-ascii?Q?RHb79KEafWpHMY7d4D04zrq7HqhH8TzCO2jjjsURZ52nmMn3vDA5yWR9JZ8k?=
 =?us-ascii?Q?zby9P0cKU0PM3Dm9xmE2ZN4hpNmbPKW1Z8drQ9uYhgGHsBXV/9nGzWvx/tXG?=
 =?us-ascii?Q?BYWNKfde31jqgXtaaVESycdnYFPaOY1fEDRLkuR2ritQgvn93qy2YHKJS+l6?=
 =?us-ascii?Q?aOcBX6WljH+hAJ1ZNORoPdCwgU0MVeRdw2Upkvm2kAeY8lLZnL9dwVXUFwg8?=
 =?us-ascii?Q?Sfgcy55IiXxOC6Bkq4NtEqxDX/GhIytyu2R8X21r4V4oSB1c6jDGynhammG1?=
 =?us-ascii?Q?80WiGvL3z/n5RvkBwDRYVw3+rLO1KoSiAJSf2fRfcUnGqV1nvcv6hGqPQ9X2?=
 =?us-ascii?Q?USYCaAxpCLHvauYvVZBUC0JaTCRUwGaz1MQCmwtPA0xFhzC+j9GitJ/6FL98?=
 =?us-ascii?Q?CvmVqAMSn0ROnkn3gtEBZt8lJbIEQpWH3X8y8PXe60U5C9NVeOoXNytdggSk?=
 =?us-ascii?Q?Pb79qjP4l5mGrPW3XDZZYAspmwMfn42xxuegRuTuYpnxP0SPk22n1DLwt2Xh?=
 =?us-ascii?Q?xqS7ONJuxkN5ylPyrGndH55xX9x/nhBwhw98h3fyXEp912g9HPVJhYikiDvx?=
 =?us-ascii?Q?KXWpzb7KHlP0xc0/jQDj5MKDj3lkiF8PQK3k66ZvNTBIVnECaZ0crmBWWoKZ?=
 =?us-ascii?Q?JwqZX31/l/oWXFgVUbmS81utSef1esWkiSZTvFpBWx9qMntgWIWmvDYB2Jqu?=
 =?us-ascii?Q?oE4IufEg/Dv5RLSmCrjY7JsnG02R36AZ3SrO4GIyp+R8t+1mzA15+/+1HE/R?=
 =?us-ascii?Q?nsqDeSGCf6H6Bx/5a0daHaVuMt46LV4mcqjcwogl8hBjqQCIR+O9yVXJGVkJ?=
 =?us-ascii?Q?NTneK2IZNx/eKhCbRsFmmtbpafqHM2/aDuUg+or4sUYDsBEE+Tl6mYX8qnJD?=
 =?us-ascii?Q?dADB7UU6BuJr5YUaohYoj9fw8X0buwujMcwQ4WVqpBrEMYWqN82OHW10pDf4?=
 =?us-ascii?Q?UKbF1O2XJVWQU8LDKqqshUpF0uKYqUAjooc0eTEYK/31AOMF7SM2a6ODxuCB?=
 =?us-ascii?Q?KLie6ZLTRWi/r/8/ihvxuCVSHVj9ocIBD+UztpMF9Bhd5mXct1GubxWCOUS6?=
 =?us-ascii?Q?OUfKywExg8mWh/VaerfCkGOTb1lDdvRdPZDDHzWNk0mQR9Q7sj+4QcIJe24y?=
 =?us-ascii?Q?0egVmM9oT471rLVjQ70z8dlybpN1Jg5VOK7+YbsqcbHwRkmtvchhey585pU+?=
 =?us-ascii?Q?KW9aLuCQNBI/cNUbGvTpdiorEI66P4aJR6Ji9b0Xccmrh0NQTDE/I+NJnyA+?=
 =?us-ascii?Q?v97DzU9PAGgMJxuSxVjexpD1FZ0fDCXLGpCNMslNnmQ/zIN+ZP3PUSFrJ8Gx?=
 =?us-ascii?Q?f2unzUPvXUocMtgJncvi37Ieufud9o5VaPtsmOT/G3iYbSRUsH0udsSUVk4a?=
 =?us-ascii?Q?mLA5VRbmAcnKvGZZOgkJr22KiPikWmrVLCUIrs/9qpXQXPrOc9dLjouyMNvM?=
 =?us-ascii?Q?jy/M48m6fUQt2FM4+el9LNHjCm5VPbg23SMi6171EYJ9fdALWcXj0SCP4Z61?=
 =?us-ascii?Q?oYtMv6f1HbGwrw5eS65UCsE2ghTaOX7VPfdchIUKlXuYtn2jike4c00+0ThJ?=
 =?us-ascii?Q?hcv8950m+S2kEK7fZMHWoAAbLtmYKTU=3D?=
X-Exchange-RoutingPolicyChecked: 
	feiwMrVTLCQCLwcNysYcdVaj6y+RISvK6SvriwQvEsVImxFkxlK6b8QbaxFzjAigyZOb7wyYHRRddIhFs0R2tU3+q9UeOpamWrwGJM2oeb0hrzMaerfoFY9GRbhueaN1LsV+TIWhrDENi8okKVYS/YwSk61cdRbbFVUCaKRZJ3QJMNBP8BrvSmE/kcqgP6n/VE/MjQ5MZqET46aBUUDyzqgWrC6KI4KiqWEedgSymOKDhetiWWkrwI3uFhFSujc+xL34jXW8+s1XZ17hq/j9ALloJYTm4duI47u2iiuR+RvM9vJ3zT2EcSaypCd/gArp/LKE10Yd5kZi9S2nwSvNsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46450af-c077-4e56-85a2-08dedb3df8c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:07:14.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyZdsw5WalaceeVS9SQYCLiYjcdVXeHyh+K74dkxAxNy2Uoxv4MKlQ2zA7uC5o3i1dWYbZyAfydsZZbDhWgs9rHC1IjSDI8r7ZGIALTuzxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX4KQN0S0ukctp
 a8nNM7fG6YOWH8hKaVF69zpNgwN0B7mUb1r8wXk5f8KeDRRw3OehIJt3GRUOZpPp4pKj8Fa5JWz
 GoOuDcLSe2RdoahLDFEfvU2ruP06U8EJGQ6C/lGDMAF0E8SID+VK6XI0KusnZk7OOQ6x4BW2Hds
 2IGp5R8IhVxqlGGVZkbTUj1fFjhQfdkrJRarMArXJ1Ivw0eNgJLfv58vaQgF91TWprlgf4lHNoU
 kva/ihIJw2gd6h4T5GltzyDXACc+wocIYw1KdUSF4gSK2ZspZbe69RayNZOgOwv8Y4LN3VDSvm3
 nmS8s46AaAzXSHBzn10NyMezzM2osyCZIoVTqmRinYa/yfVsvXPmAm1JmM0zycmfV6yT7swWGOK
 5CLDoQXkU+U8p7/WPJmrLvbdw2uYvWiPVP1wTCZvnTj3ssSoU1kS6XsJbbuIDwJoD7Q5t4EgjOC
 GgmVEYvOIebqgrGu6pw==
X-Proofpoint-ORIG-GUID: rdPC-urh5bmt8L8uKRHHCiTEREUZd8N9
X-Proofpoint-GUID: rdPC-urh5bmt8L8uKRHHCiTEREUZd8N9
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4b7044 cx=c_pps
 a=ifAyozehCtGKCK27NPK/8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=FVmQkJsakjPAdh5vaLMA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX7X0tYzLv76qr
 bKMynTRUVI9eon7rjyhZoq/wkN5wqBnKTcwsq2GvlxEXBQbK3XbF2Mm6oXqPpJ3quUGRhGeN/OT
 No4VTSk59TlW2xos9Qn4vzCOYElc+k0C+bwOkBJsBC1+qJz/fOq+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240228

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
existing patch already fixes the issue associated with both CVEs.

Update the "CVE:" tag to reference both identifiers.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
index e04d7ed6c2..e123273338 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -19,7 +19,7 @@ length field.
 	(display_debug_ranges): Check display_debug_rnglists_unit_header
 	return status.  Stop output on error.
 
-CVE: CVE-2025-69648
+CVE: CVE-2025-69648 CVE-2025-69646
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
 
 (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
-- 
2.49.0


