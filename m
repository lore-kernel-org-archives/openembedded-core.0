Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDC2C8303C
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 03:04:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5712.1752030238219818795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 20:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9285e3e2ec=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56925cIU029133
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jul 2025 03:03:57 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ps91upa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 03:03:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWZ8r3Kd9/B1zC1qGqBBEcQY2oODWdrXXGxcG+yyYxneoXFW4Euoiv5f1lS5FJo4XfIMlDh3gLKu9YCxHQxZDRkd04s3S35XojexTdkvfg2uFKU7BAizOF/4zG51Wuxw/0MM8fDjrvLi1Z9M+krqEJ15iJ9HIMEPQ2HopGRgFARHvM2lnknXqAO7Mlue9QEN081KNmZ7VRlOi9RIFQonIx9WNtzL98H8AvVwj4tnWkSaWc5zhQs/id7yde64Euujt6BFLccQav842q+Z3pGhrwNNnTfz4OgjMnu09/TFQ7Wp0OU89YXwFRnf1au7l0Bi7qYWiG5v4sT7QUuR1wy5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7AnwI4b0ATokeYUEkO5dRvGM8FPdJgvnQ9mrpmkUWk=;
 b=bOnpEZKQZ27LhWq04TbSqq2sHzRohPL3xL6hvGLYhDpkRqHwKwQOeNKT0TPBUld/+cRdIAPfKJBrk0tpXk8muUGdVKGYoJIfW/czcG18phm3HNtOZdxjI2Eq8bpTkpXBbQMFx7gSCt/yhgmOd2HtRQYm8vpaxfO3E1pLVbnn8GnTMJ7ejIgesd37GGgunDrkYK+8yqcjSxX9HQa2vno0Dw910Sr9N410AcQNAs5yXal1hIUljOHTvvmfuc9tjM2M7hqEn2y1Qtzwrvpoi+dRa/C8LgYxHxWVNxwnX/Y0dkpbJGWubaWU0UyyGnr6Ei6HupKs9P4ztXGKyllvzBKT3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Wed, 9 Jul 2025 03:03:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 03:03:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] kea: set correct permissions for /var/run/kea
Date: Wed,  9 Jul 2025 11:03:40 +0800
Message-Id: <20250709030340.1193069-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 869e6f99-ace1-4e41-0d83-08ddbe953d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W1lPiHcMz1mcuJj6kH2d1lQk7ScUz9DWHl61wYuVqxhQ6cN8wo4Q3nmq1H7T?=
 =?us-ascii?Q?38/fzRyVtZtElzBtR+TXRbXmmr5g/5/gCJGbgfnbFCZGbfKGBHT24JNyO+Cy?=
 =?us-ascii?Q?Qea1McS31+cNmZ056y1mioPmM4rPcDaEOv77UbKrOXlzG/8Pc7JdknD3fIIy?=
 =?us-ascii?Q?9SJH2X/VtoF1wAtCaYbwrqaQ+65iB17+kP/qA2VadV/KjOmDAzBfuUCncBZ3?=
 =?us-ascii?Q?940saPddtUbrmkIeljBbgEiM4aQ8Y+LhTTqRKvQ5NH9abhPeTwxsrQoBSVs1?=
 =?us-ascii?Q?6to4a4HJiIx99r94DsGE7uV8uYFKHBfaO5AzefMdxk0mb0qc1aQ0uvdYl50y?=
 =?us-ascii?Q?88Z/aB5Rj3/IWBa7TIJaLP+wsBJhZPUJo90Zs3wLV/kr0JNXnA/M0n/k3FuG?=
 =?us-ascii?Q?NdpE/uISj8tr+p1A8SB6a+bdrBWIdOAS9BqTfauHP+OnN6/khqkJuB0levhS?=
 =?us-ascii?Q?B34ywm4xkayWXMLh7+dREK2w7+SS83WOebBQODeelkToV9qrWN3XHkqmkLPy?=
 =?us-ascii?Q?+6E9JRvXWtq62IpJlzap/NTWoCKz+dBPz8TVPPuxoEi11f72FWf4fiI4tNrT?=
 =?us-ascii?Q?TLKDvK0d/S+63hj1ABKW3VLgUoh01poqIajY9/Y042WVZVT9dndXE7ZOaNMD?=
 =?us-ascii?Q?Q03T2/l76hjaJxB3WOTNQ6pJzo4d9T3D5jipzCl1ISvWusiACx99vY6q3z3S?=
 =?us-ascii?Q?kOKpnhcNWscR42f/RSB5EUbB0GFn5RO2ygxgz3uN4iGOvsmECToKnKJ//OtF?=
 =?us-ascii?Q?qXAjmhKiPqKIypnAu205v8mHOUOF+j7SN9Dh/GoFtShPC05gK8QGtktyq7/W?=
 =?us-ascii?Q?VNnix1kLsxQc7S2vdk+UJ3RZb0Nz6Ce+gfJhihXd2L5uSH66myZH+cmKpUuR?=
 =?us-ascii?Q?vJX/a8aGpnM0bikfKPw/0/xehkgvVYKJjaTI8J904//0tvbF1Ao5PjN7J2QE?=
 =?us-ascii?Q?uMcJdek+VZBbT0i1NKgnEQ73SdWj0Em44/nm82NdEUVe8bFIk+hOur+lFQMh?=
 =?us-ascii?Q?Uodqlx5JdJzS85w6D272ox4YXZRoDdbj18ObNSEQ0tYxbYxur0pPn+/2Pqcr?=
 =?us-ascii?Q?qjQH2qOdBNHIFrKf90upA6mGSbloVpoQSxjbhXEtSyiZlKjubGUDlLmB7o6g?=
 =?us-ascii?Q?eVAtdiPy7HYHQn0Q9P69ftd06b+96Gv7ZJUPIeCfJKV9RnEpXRo2WtDIoUbH?=
 =?us-ascii?Q?7Q8cY0c+2LSttaE+Cer1qONMA0yyr+kvYS4IPFao60mfZqP8FlEOgvkb7Sb5?=
 =?us-ascii?Q?jUD2uGHelT8yfSDIM+AYxzRcfFozeSBy7ZyzmNA91c5fC6Zsy36XqhSRaXTa?=
 =?us-ascii?Q?ql96U11J+Zi7ld34e56tEOFyPSWyuj2DrC4hb+/hxpmWKRp0UYQyMbw9Teqx?=
 =?us-ascii?Q?TIxuMS6/Xll+8zTJrhYyJVgLD9ZJswCLMDzTs/+OSMdilYcbAJbZwoMKiUBj?=
 =?us-ascii?Q?bbjhu+szo00=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2m4K23Nimih+cZHkVE82gJdtlp6QmLkMU8X+2GKuw1XuRS73TFPmNMyWEkNN?=
 =?us-ascii?Q?xr7SaoL5KVKoTNbkQn7jEuAAh/1biLZNAC9kl8dyO/7FyO7ogUg7HaR2pkTS?=
 =?us-ascii?Q?giwmzTDMALI8jlSxa9WBfYj7QSxeWBarz0Wg2PKzAs/XXJhFCoHhehT11t3z?=
 =?us-ascii?Q?/0D0umYjZW00f8BNIM80MZiZj6tLU/gzznwbtGp1wvGqOb8v5GLMIhr85WfR?=
 =?us-ascii?Q?TykBHM0OirZHzgL/g4vYVVQJN0eky5Aa2gk9+dntdo2hbEA1GZmdQryQ28Rz?=
 =?us-ascii?Q?zLhICtb43SBOEKKrxeqKy8F17fC/AJfI+PIMbOOR+usQDv4ky7xdZe3w+vx3?=
 =?us-ascii?Q?7xEz6mKPkmUByl+nSi/hpy6I8WE8WOGnBOsX3eaKHsX8D8w700izyvt/LGde?=
 =?us-ascii?Q?XyTZpzRZnRZ6UxJ0ehsq9OLw3C6kkAh3XeoM95Tr9OQkhQbi4JUSl6os5BSQ?=
 =?us-ascii?Q?CzhbNi8h11vAbG48s3ohoMwbp4ctpZ/AS2k3nv1edqNrjgR/iNLenCjOb04N?=
 =?us-ascii?Q?K88A7VVVG7Q2guJKuy5d8Bg4PhhbIzAYzKbOyKDj06DdRKL/aGnzxjyEU+Mv?=
 =?us-ascii?Q?bob+FiwwL/c7jmx4PwMRPYldCfam8slouSQxS5hRESCwBX8jUZ3n0eRnLH0X?=
 =?us-ascii?Q?0dwemnfWsweU82GzNC+/i1nteuQX5HiVlh21KKYiglkaqF0IGEYfsrqqvhcj?=
 =?us-ascii?Q?5WK6DpPTf4coh71lefIFg1hCNO2oHpixBZm15WS+YXKkVbQMhtLHDvbu/CyD?=
 =?us-ascii?Q?QP7mbvovOQKQ0WnxFK9OaHFhosX5AajEi1i+Lox8CGDeMOlGyk8uh3lhsMtg?=
 =?us-ascii?Q?0bP0hcWLwhNOsVm2uskGWLvXyNa2ocQnsPFH8vkrtOKNp1jAHKEgsvXWozXW?=
 =?us-ascii?Q?/SE0B9JVPUBppCGwiStZeqgu6EMnX4X+XoKffVD6pwIa47vdf4GxTTXiaCUI?=
 =?us-ascii?Q?Btdg7N0R8anCzwTiJ8MhGZ0rJGHQi75/rM/c5XNgpmVgMoh8710dg8GBbv/p?=
 =?us-ascii?Q?W5RXYJqEWc/wCNGcKjLmgI2C1Y3dHFspOmf/u1x59G7dIX6qG/ihtTBbGDTm?=
 =?us-ascii?Q?QKT7jEO5fJPztY5lsrH8lYW5+FuOo0aypk+oeq88KA866GoiYA/DiP/nfRfr?=
 =?us-ascii?Q?Ig4FeIP2qbb0sR98HFDFWBHTqIDma1IaPhvgoPBJREckst1ax5A1dTJ5AiRr?=
 =?us-ascii?Q?kIzsFjGhSO7l3Go0731iwHNO6ALc7ugfTg8QelMvaYfqbEWjMAkeVbY+PWJB?=
 =?us-ascii?Q?W8UtB6kGCX+O4cRktOG+7QzCKXu1CpnEnUVRvXpR6ruJsQCzpIIB85Dtv1bf?=
 =?us-ascii?Q?fX/ry0XjikgVp2LQu1+jCHVdw7HPdE2zYblM0+I7vuo17NR4Mf+cctTEKgEN?=
 =?us-ascii?Q?EQ8SQ7yU8XSJw91uaJvA/6JU0rLnOVrg439Vvxv5JFNGJ6R9tBv3YZRTQ1MP?=
 =?us-ascii?Q?a1mGLrc9sw6DAnJ1NaEWm/4lL6uiOLIaDcuFjPZXyShTXwedLnYgA676zypo?=
 =?us-ascii?Q?8qzzXzNHfvxYFkjpVgxCfqmGF1jjUCfAtjuBRedetcxgWBSSGij+ONva+nMe?=
 =?us-ascii?Q?JNDhIcE5p312ma7aDuEDofH5B+jDdu7dWmIM6BWx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869e6f99-ace1-4e41-0d83-08ddbe953d60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 03:03:54.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGJilNZjXlndF8hTYILUplVJfL4yfG1F8/1EnscWjgfmO/vCy9B+vbAe2xx1oNdIBEMWNpup2dEZYOPaLJ1b9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
X-Authority-Analysis: v=2.4 cv=PLcP+eqC c=1 sm=1 tr=0 ts=686ddc1d cx=c_pps a=YUS4zuHJQkVrgTdUfwMyaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=mvNiJOInIswJCcDHtC4A:9 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2KE__ho3VlbgPEoWNiDkL8EcX4wYL-KE
X-Proofpoint-ORIG-GUID: 2KE__ho3VlbgPEoWNiDkL8EcX4wYL-KE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX27BNncGER0gd yvtDnQQEDF+X0yq3UvkJJ3C8LJRrmekeM+lowpNx2vpju8lYiCDlGb2VHTYSAKEwb0hoHIXpUYn uxDPEJNvfwZcb/P9DVG2AbDvtfJ+0EkvYwR4EaZWqBxqkrUY1kSi3WTLZ9IYSwO2UG+7sCwgPtD
 h9I83eOMKwhj55tzm93fS4RYo7hGxh2ZsgNEvlVFSrstUhJbSLrEsRqfgnXrSUGvmvE5fvrS3cX XfAoyVh93yP9djNmAgBJnMs/1SBGIuZpsHt/IwcVSBRTXfn4R+B/yxd6URNhow87vuCulNBxPSs L8MZphRFwX+io2j5sMmyxUaq2ridRgDF7Lak3JxvnzOvDVJFubCs//2kKW1n0FGcFwI+yJ0B0Wg xOldfyj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 03:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220070

Set the permissions of /var/run/kea to 750 to fix kea server startup
error:

ERROR [kea-dhcp4.dhcp4/445.140718820303936] DHCP4_INIT_FAIL failed to
initialize Kea server: configuration error using file
'/etc/kea/kea-dhcp4.conf': 'socket-name' is invalid: socket
path:/var/run/kea does not exist or does not have permssions = 750

This permission check was introduced by commit[1] in kea 2.4.2.

[1] https://gitlab.isc.org/isc-projects/kea/-/commit/f7061c4e9711f395fbc940b0cf0ddbde87e0fc13

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp4.service     | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp6.service     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index f6059d73cb..aec6446f0e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index b851ea71c5..a2ed4edb59 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index 0f9f0ef8d9..ed6e017d0c 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
-- 
2.34.1


