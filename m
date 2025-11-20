Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D557ECF9C42
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36757.1763652429072722260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Yz2HBP1K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKEm1MN343869
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jy93khrwFclQLoVz3P9MPYWGRQMYRcTL+eNAv/ov3UE=; b=
	Yz2HBP1KpetAXHhENYkxgezjezizMP0E6QN54i77cS3Ya+6Cc0xxbqY9q0B+2Ncn
	tVHbqiTnQdZsz74aEyUUPjTHmQpfxONEM0hnnC5lBE8GSeNUddpjcLwMn0CO5Vox
	2iQkIcEvSEMqxZubol4f8+ign9t94skavIwzmWoQpOqDQY/y/WWQWTrhpbnod4DU
	dauTqOekZopbUtSsjwJDoI1qAPiJyBCisRLMHwKXr+xM74J0pCqZRTUf0oPC9N2N
	CwiZI7bGQzmfST1gS/Sizkx8JbQ+UzDgg/Rz3+O4iEaKfzlEC66FIc31QrdjiodY
	E0jESoqWWohARi3Ogql6Pg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjecsw-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or8hpZjLlcxyfOf/yCEIfC48WVI3vxJkuarZ5GOao04wgrkraUMpzqcQ1sxAUkfs8PPxJFUkfRXdkfqbLkny9gmC6OvDCw0fJJR3UcxRCkZKa4lNoX09aDVFi1dL6JkzSWgN/JR/BCce+Pi4TwsT8An4aYrPmaiWyxPF+2LKn7YI6URKoaBT9GiinFHozBXGFUi80kukjSYzDsaL6mjoEmtuQTNz6rHN1ebs11bKCD8vTyj+f1nnYtkXj1sHkVcBqz8dgCQ4JOs+CxcqmJpkYAEXyNgQaJbAqYxqHPhLtSqN0uCkku+lt76Duu7vqWy92Q0YR1tXr8DrNx71mmdPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jy93khrwFclQLoVz3P9MPYWGRQMYRcTL+eNAv/ov3UE=;
 b=HhvCZMA2W3lACM2u4yJXYHMAtmTvbp9m9t8sC03mAAiE6mZ4WVumSgTGGUIZtDrYlNpMpAljpEle/npj+ZzagceEjjtDUowOfjIPd1H+1MdTXDFfTCk9ryuAMLmZ7FPIVRyCAFQL6VqqO1mA3KXhKuT6UhQt4iLQNbA5qWBUOAVCKB/2TfvhDDWsKgsxut0JhN7w7FWVut5Ih3ijdCKVpvHXMlDSRKqNx6J0jWkFME8q2pXBBuGbdir188RfJswE2v+F9qsO4l3AE6+qNUmEW1g+rJ9acYY5TjGWr+eD284Xd3r89/fpxX45uKOM9TRvctaIlwo+SgNOr2j3NMfibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 07/11] linux-yocto: enable Rust support in kernel configuration
Date: Thu, 20 Nov 2025 07:26:45 -0800
Message-ID: <20251120152649.1128685-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f27e594-6f5c-49c3-ee46-08de2849437b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jgY4HZPQvYtNNyZX3t8BLXXpKUCk4Lae54V/VSeX4Ig9wfJ7HHzRvp26Wj0e?=
 =?us-ascii?Q?jNMpNyzWvUj36OCi2ffa7gP5R5nBHFoRZOxqe4r9kXQ9xw7iHv4pxgPf5lPA?=
 =?us-ascii?Q?7yLp2r6CswF2zNzeLneS+cnYS5vJsFliSOaQXyk/lg3fUiJ3bo+zgsG5Ers/?=
 =?us-ascii?Q?INQd++pyRePcxsfhWhIQRuWuoIB3hkRmP+L4zXHmvztA4ofudxdYul5HOEWK?=
 =?us-ascii?Q?kyS3Ee8SZKlhpoju0CzcbZ54y6Ci41ifIzcpcoLSzMBWFC8Cxv0dFBtbgZ2a?=
 =?us-ascii?Q?5MHY3phHu4iKl49LDRXuEGWanH/GCQ/bxDYl8lg/I9hvQcVbl0RTXylebtiD?=
 =?us-ascii?Q?gtfR4cgx6/xjctgjTlhLpDYrs+kBun0YCVVF4qF0v7aPatSD7pJ/V1+FXlY6?=
 =?us-ascii?Q?SQtnvLpFH3gVgkkNdOOtRZkPPviPqDm/PycHzZ32m9OxW+/SqRs7CJJ177Zj?=
 =?us-ascii?Q?MwtVb08HPfzIKpoA86gnF5NkMDE6K9pao8oisD8olnNYDozVzKb1uK8vCZKl?=
 =?us-ascii?Q?/umCeSv+lr3tt2v1vmAM2D903IRAuIYVCPxgKVKnYwfUjHpJG7Ol4JAnbSy/?=
 =?us-ascii?Q?DXQdBXVKxeEP5MRnnM0PYRmfZOa6oDwZj9M+L+ZxAx0ets0Gqqp2BEpv9no8?=
 =?us-ascii?Q?9NxQO6JYJJKUQIbxeO3CN5geIvGdQGh4nANVUJDF+oHXjlPo8rfayzJtU4XJ?=
 =?us-ascii?Q?2xvMWlhjzsuPLAT0IJAcZwPrG58uWH1pXiD7QFYyIfdjxK1VgwxSLrWAFwFq?=
 =?us-ascii?Q?3hXG/urto37Chy0w62X51HsP2Ep4NZNNmdjjuc5rSkAjUUfFVOb9rk9EpsNu?=
 =?us-ascii?Q?pu4/1cKhigJz5NuxUAYV68cle5UauWCGByNMM9HNcdbZF917JCOa55ClRwAV?=
 =?us-ascii?Q?s9Ur/Lnc7qQRAfVtmpQMmfMdOzQ53KhXiZ8EPwRd2gXFbxny4nccRsAJxap5?=
 =?us-ascii?Q?M2HFdWP9EEWf0i8ybCAnxWYOIp9ca5/4jDwQRykUJRRkJJO3B/E2WoS+vAW7?=
 =?us-ascii?Q?UwY3B27k+wcP/hdHeAGSN410/HktSP+Xeb3bJJSwCSBkbpPxvvebfelxzKnT?=
 =?us-ascii?Q?nAWCt+6VmXftI+V56V1PGVUl/1JXqFJ4ArBESiqbKoV5SUAVA1CSb0604qUA?=
 =?us-ascii?Q?b7hDvQrB3eHUr9vgRgm5+V6mv8ETE9kUW299L+/TjoB/znDAb+DpbdwktAlt?=
 =?us-ascii?Q?oTGiwDbf1He2zIZ2z0poHF14axxHeQU5KKcltyvBX7fuzFdzfaIAvAif5wO+?=
 =?us-ascii?Q?TzKqpaqAvqF8oVMETdRFNWt5mCIhvyACQjv7n1tZ0wF94ZEKz7CHjfoTxqP9?=
 =?us-ascii?Q?ufc+5M2HlASva05+Scx66eL4cmdr0UhGtkhdL1HkIRex95PA9xTzk/YhnUwL?=
 =?us-ascii?Q?mjV5Ho4X7hc2iCu9lgIv2MoqSiCv9aqgMxOVGmSxxxcX/FOj0EMJ1rGEcrCA?=
 =?us-ascii?Q?JaCEOqj7JFV2CSW2UGfiT89e4esHt9f+6n9FRw6Bq2wh3UzWhIfk6MDfRLPL?=
 =?us-ascii?Q?Z7AYUFO4RiXOIeZi5QGRtimNZ/BKM0buRYix?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J35FlNiCoXJ0Ol0Q0tWlYHa6bcE/B2thXfCVfGIV6ndTIVg1ZvIrGBebdaZD?=
 =?us-ascii?Q?sYNzb5eKCpNNmx/C1ijK5Ejh+7Rcwat00IE5umgtztQYT2UoSkKlMo30TLwO?=
 =?us-ascii?Q?9lanmU8WGBUnTI9H+qocwO/GcME/CnJkdeS36pFI/ZF08DlOEh/OtjLdDGC9?=
 =?us-ascii?Q?xfL1EW2vOBd58rs3JRWv5lDnwERaSxVTcVnmrCE43v6bdsRFNJ8BDHX31eyL?=
 =?us-ascii?Q?IaKn0jwgVhFbj6Yjl+l73J38rfFXK94X3AVSwn4BoXZOQrHIgQz1IsoVHto1?=
 =?us-ascii?Q?+TjUO4D1iHTu1VucGBwKDNf466Up076qzVRZc0Z0HdPMJxJPNPHE6ykStImW?=
 =?us-ascii?Q?jV0nCSsIFh/MfTo+wBryzljSEqy4/w2BWgOlXjOvhlQqUhnmHIDRQ5EB51Q6?=
 =?us-ascii?Q?eP642LBHlGY6FMl99aITZG7aWFpW1k70ptYYt0gDG5ted2VcOpMMYEWm4u1X?=
 =?us-ascii?Q?NX6daxlW9PZAIKyyLyDU0DZSpqNXHjVZGnQ89AvgwNLmQsHQg5cswx2yalge?=
 =?us-ascii?Q?0yeLxVitRo5Ex/VzPN+06w0gPK1YUMrxPeRvJEoPWbZTwC4rH+ABcgBLLi10?=
 =?us-ascii?Q?qFH3KUWHfdRxK8oCMxZwsupNSaWAM40TEZ7C+tb9U6Q2uGO6CvotUyc8lgxg?=
 =?us-ascii?Q?A0O2ALk+IOhMpMy18Q+gDsRItdJW3BDj887jN56RrQxAjhcUQK8JHCg6rZFT?=
 =?us-ascii?Q?LvWR9ZCG/LxNS8SMI5H+ZsmGw5CM6i0Qr/PFyeqfvvNkEOkT96vMRbGIGfh7?=
 =?us-ascii?Q?AGnjLlmuifbgLkJCjnfoU/3+cKT9r1QhflV8gqir+VNIb0HHUxYU49kq8G07?=
 =?us-ascii?Q?cyw4Ws0b8O+7+KvTtCiu1m6X6tkPsWsFgAWaQVTc0qVkzwwl5U84vp2uvvQy?=
 =?us-ascii?Q?4KPXxkJSwh58X6q3awk3/Jinf1A7jYdFu70uNRCdZf0DhBRdeKWC7MlEe2z/?=
 =?us-ascii?Q?w2PyH3ioE3votuwvnjIqoDsZlEyGfKiMJBBrjH7eRMHp4W8ou2zw4v7ZxPp1?=
 =?us-ascii?Q?tXIbkr/HGAyywb+yOthrec9kPXvEMhfg6+VFTSxdfRbU+ZVnpB5A9zOxbQGB?=
 =?us-ascii?Q?XHut4kETY7XGyJgbIyowZgUd6GuncG1DooW7p7rxZ+T/nBuTXGeC3Q3HL8Za?=
 =?us-ascii?Q?bEy5dXeEfrI0pP1gKyMq91NP0kLrIVt3TJQeVmBYq/w+ul6/6kaTREQMD6vH?=
 =?us-ascii?Q?6JlyKg/0hdeO8bqAI2B6i8AIuZI9neJtVF86fDfgp7X50VSqcz/zeedD9aT6?=
 =?us-ascii?Q?GAX+nw0shknfIE40XBxMC7ZNNdalPrxvDU+3i/s2B6u4JtrAEYIx1Q2GG/Wc?=
 =?us-ascii?Q?ZmKfbW3p8+IM0RVsC35BnMjO7lDjzhKf0yDworNmgqWO7mFyFf6M9zNfeUbA?=
 =?us-ascii?Q?pSPWFPTSJgK9Mp2FjE2IC07wNxMDTxKkH/4jCNCTWSmJ6ALg8NdPaxo4n0Ns?=
 =?us-ascii?Q?WzdClSgt7uvVXuNwA26ZoM5CPXir/+lYww3JWTDTn/QIdQ+wouluA/Yg10mW?=
 =?us-ascii?Q?SMA+fyuoI1+YoFv6yvshQggGa1kOHQVKVuJKDMgEjPBnzUj8C8OZ93v2hnm0?=
 =?us-ascii?Q?6DrBMV6/ew8ZDegS5TX+Lg13/rgSNEfBvEs59EgkArZOyyKi+sN1bVgphAbi?=
 =?us-ascii?Q?byAdkhXzJBEpKt+XrmYxdCc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f27e594-6f5c-49c3-ee46-08de2849437b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:06.4058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohhKfVw3/dWuPr1yJDKJyzGkGw7akqEjv6bnSLFkl1QVLpPcw32rNqgvsJpKSkzsgAn/HeoxrAgiww6Cre8eI9fvMQ1rlLyzhsdfkJiodH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f334c cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=X3MetliuLA2BOnX4JlgA:9 a=itNntiE7ACGd12bT:21
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rf-tXMNikjmzFGYkgqLcPtdiUQ6mLBEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX7TGOsiyqDDjB
 NZa3tje2iiOWj2aiSU37esSKYTGUoVVSuarxLCsHAXOHZhZZ3ZkiYD9u5kLq1xRJ6SPFW8kTbyF
 EEPMLCcUR7oSqwwk955DD9d2OqZfPkLh/dBEVQrs4LNHTgrKwl4Mw0/U71oEVLSmGQXx9Z8KgQh
 4hKSUP8Lqs7WUWIsn4EiuwWjsBVf3JQQT8PL8cQRLIh2NAhKWqPy/PlehO04At80Burh/hY4EhR
 18e+PCvS9WKRtDu6b+gLfpfC/Y0qY3O61b8+p3xmysDpe+iD8j4FsUuoXwM6Ac8pm+KRL17r411
 sQmIYVKTTUNvKt2JZPGClIM1ImnfLu6SopXSPKRus7F0uZUcDzHrWQCj+2GNDH2a88bTnRW+SN4
 paV/abdJBbMB3AWSTEBXWc6mAYQD5Q==
X-Proofpoint-ORIG-GUID: U2_qT0JkMp5wYLCwURDpP4WdWDNla6ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226630

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Introduce `rust.cfg rust-samples.cfg rust-debug.cfg` to set Rust-related kernel config options, including:
  - `CONFIG_RUST=y`
  - Rust sample modules and developer checks (overflow/debug assertions)

- Update `linux-yocto_${PV}.bb` to:
  - Append `rust.scc rust-samples.scc` to `SRC_URI` and `KERNEL_FEATURES`

when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/files/rust-debug.cfg   | 1 +
 meta/recipes-kernel/linux/files/rust-debug.scc   | 3 +++
 meta/recipes-kernel/linux/files/rust-samples.cfg | 4 ++++
 meta/recipes-kernel/linux/files/rust-samples.scc | 3 +++
 meta/recipes-kernel/linux/files/rust.cfg         | 3 +++
 meta/recipes-kernel/linux/files/rust.scc         | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb    | 2 ++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb    | 2 ++
 8 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

diff --git a/meta/recipes-kernel/linux/files/rust-debug.cfg b/meta/recipes-kernel/linux/files/rust-debug.cfg
new file mode 100644
index 0000000000..d9aeeb4e91
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-debug.cfg
@@ -0,0 +1 @@
+CONFIG_RUST_DEBUG_ASSERTIONS=y
diff --git a/meta/recipes-kernel/linux/files/rust-debug.scc b/meta/recipes-kernel/linux/files/rust-debug.scc
new file mode 100644
index 0000000000..ef0ef3af6e
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-debug.scc
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: MIT
+
+kconf non-hardware rust-debug.cfg
diff --git a/meta/recipes-kernel/linux/files/rust-samples.cfg b/meta/recipes-kernel/linux/files/rust-samples.cfg
new file mode 100644
index 0000000000..c6cc803702
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-samples.cfg
@@ -0,0 +1,4 @@
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=m
+CONFIG_SAMPLE_RUST_PRINT=y
+CONFIG_SAMPLE_RUST_HOSTPROGS=y
diff --git a/meta/recipes-kernel/linux/files/rust-samples.scc b/meta/recipes-kernel/linux/files/rust-samples.scc
new file mode 100644
index 0000000000..476cc92f93
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-samples.scc
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: MIT
+
+kconf non-hardware rust-samples.cfg
diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
new file mode 100644
index 0000000000..105eb0a14d
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.cfg
@@ -0,0 +1,3 @@
+CONFIG_RUST=y
+CONFIG_RUST_OVERFLOW_CHECKS=y
+CONFIG_RUST_BUILD_ASSERT_ALLOW=y
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
new file mode 100644
index 0000000000..51d9de1673
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.scc
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: MIT
+
+kconf non-hardware rust.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..9d52dc4d9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc file://rust-samples.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 5d10a17e70..d15f7c6e6d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc file://rust-samples.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc', '', d)}"
-- 
2.49.0


