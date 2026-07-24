Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6950C531FC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27392.1784923486998240835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VtY89Q9i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGsN6X2222015
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	VtY89Q9i2csvhq+bsWevTQVP/gkji5WudT/lXLLH+YWbgcF7+uVdVlIBb2GLqoEP
	22QlrY0OMkzWvbwEfJthEzObniseOcsUtyBNNHKIUFeUB76XtSMEGp38RikBorCV
	MzMUJo/VV0ZS6ACJMy++q9eTQ2vJFabI/rb3c9cm74iqe3AI9HCJ+Ae9tAI/Zr74
	/OXmujf5b1ztf0vrvkLCyIiMTQBzsouI8lKteAgPBGQJS8ELAYajPyj44IMo5YGn
	iF+rRZGI9VUKgnV6kNMQphwVEMfLmqzGbbiEl+cq9nWnfFBE9yDGyf0tWBzvzMUf
	URdvjCldyERnKFGgMig/og==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fm8ay0q16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIhzflqQyfzSNGGs+GcJyRpnb/WP1jzhtqhokhn1zlrb6Lo4V4RcwvJ6wApc++dnvwOUfM8tlD+QUERCKljS4404BouUfO7Zo9vie3fAou/pgZyYLxG0RKtJtfXBX6lc5JuM65Xg0rpLBEtSZ+VHF2mXBhAMzPj2vBmJpAQqsN7I2tThb2IRYTsaIdiCw7ydZH2KahGmG382NQUznIRXorxQyGkwYhaOhsML+kjKHYqj+UiPxE0ELOerrNJ6JEkORHWJ+wOr9p2ewyDYgb+u1Bl0bIIYHd+8WPuiWPJW7pdpdKnHXKiCkCk2yz7oei+BuVeUXkFk/uAzBwC1bhsgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=uwo5lKDyTUQ9Qt8EmOODGBUrAkCpYEbT6Esu4mPXXimTTmS02P9fUAH/SMCDkFMkUqjRBFdS+SA6lfmNC2htoY9oMDAlZpXZocbFzXKmkkr3YQAKXbQ7CmomVxLQGsZqXcZPOzoTkdogR/LnDZOQFY6kAQCANGvHLWgUmtQK/sKm21TPxkPhSsqF5TykgXvszcQv8kifUYNW7I5h4voWuvrgN/8dlAkw++y1zhJCQgEu1ELxIk21WjLbQEeDZETB5B9tPQtackFxwM51t2H4OZWHiQhxmXaLQVvL3ymnjSn590P9cKOZJyESs0qbZi6aysi6qIOkggl51Ra0GiXedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:43 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:43 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 6/8] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Fri, 24 Jul 2026 13:04:21 -0700
Message-ID: <20260724200424.954199-7-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724200424.954199-1-sumanth.gavini@windriver.com>
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
 <20260724200424.954199-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bde510b-440c-4189-e976-08dee9becda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lccPAbd0HDt5KVa0PKMBETYXnqx932FGhHM1D0nKPGyE6fyX765YIUIqiBqA8KxPvk70nvaM8tOWB+Wk09EkyHEsOfNECtHPj7x8h4oXpCYvv7kSJSTbwKEWcxC8sUMeTaLKpbhy3S5hz2lOjIiv2WElgfWkJDcqR4iDoPt5lD/HcgBLh8QL3GsgLNoFPl7wBDQNSZJ6leZDbyyb0r7FLNZFACKpmKhociZ758Vha/kEryofuSK03/mOZmJqf6tABb6RK7TCTBVDWip2rrlwb7AGjV9dmoYwEdd8BOgmw9mlGVNtlJNhH/Pg91ni0/DvJLcvtlL7O7I4x2e/H59qHhRV3Xbr0NEScUZlHP079D7+tZwCqdEfGUv8jrdtnP0YedHYDnWFWn4ntI9G3YPLfzdf0YM7Vm4dr0H1A8mM9PWoW92/DMcr1OZ55PM5auGnW7mu3/r+FJs59qCrhbymcu/1GCMntDJEOycM1xyF6EOeZ+L5SE4Q5nhknWqaMMjD8xxdEF6kLuYyriJavBR9/h/Q04ZeweVycqEH+Sp0cjUWUl9y77kKEgk/L4r7lPEoU2ZyEfjDwHuKPg5EQ/WsAbrv9Zy2/amon5XJiUklUJMNxYdpmUP7RQswTNfgJrr6mDsIX2sR5iLJ/PSKxtrMpDggmM6KGhSzKyOmBv8QsfUXV5IdId01Xju+ZQxfGESBsWKByET79ZkmpE5c+Fy9dwOoeOpTXFgEmyJB+3LlefY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZFt8A2sWucz+PKPMk7dZ4c4vJD3BVcMpOuY/zLXl9O2piIfdbY6xzg/HmfHo?=
 =?us-ascii?Q?0NwnuZsi/xfugUy8pL/v0qOpmP1RaDUklvzRmUpIrT5SHSoO2qWXKUcJ5Tag?=
 =?us-ascii?Q?tRdx0rS7LJngyZKkyfdGZIFyhq9gzGf208DQCototlJlgGxoA+Go/xdPTwZ8?=
 =?us-ascii?Q?sO/MPWeyWRFU7eLJAzC6G9SeH10I2tvQ6AOi/UPAKIZzrfAFBtHp9LLJaJoK?=
 =?us-ascii?Q?ksz2b8ooOOIzmy6LYC5R15r7Ua8NQgrYw/zld//zlGtgOuZm40ty4FoXiVf9?=
 =?us-ascii?Q?n/myDPopid2ra9Xix+LI9sux02xZQ5hln0DM00Jsi/8f+wk91iR1fOyBLUpt?=
 =?us-ascii?Q?XGhcOqQSN9zjby01mUk/JLBWByYxQc26mVPV/b8v+zmGX4u2QB8HB3LP44eI?=
 =?us-ascii?Q?CobnNIBXoa0hgiZNyuh85pmgzSXxS8Su1d4EQdKCYQUt+ndpxTsr163NPag9?=
 =?us-ascii?Q?SYs1o0NaLLvOcnKiPjsswdlpX9oqtoVkeK9zNXJcxvn0BXfbuKjxm4l4AFJj?=
 =?us-ascii?Q?xkQsv8SZ9/FYuDwwwdHtliayJuE85wSvO9ZsnKE7zEZZ8PlLhkbWkS8cJ74c?=
 =?us-ascii?Q?h0x9lr9FHiVe+OjtYWbh5UgM5yYLep8znBb+Hzx4sHqHCzk7CTr7OuO+H08n?=
 =?us-ascii?Q?FBbs4XXA+3B5BUsA4607oWLzcdaR0rt9Tla6/s7MHl2GJ/EymKpeBqLA6T48?=
 =?us-ascii?Q?xmTSb01CwG7sfENfZsxIa3mF/xZ2CCANrnQVSiPjGVI4pcmlvW+0EsfnbT9E?=
 =?us-ascii?Q?y4cLua+j5aN5z7wz36SJ9KaJtEofwQHaiLm2otrrOrVzIcCrjvrtsKd9ssa3?=
 =?us-ascii?Q?kjOxSyzl0766igBVApI91UmBMgd/XRpTmxIog6O4gCZDmFWLAn893edsAHTS?=
 =?us-ascii?Q?wsMtjOe4up8EmNEeu3OYdetnJnXQX+kvwcz74T90ySHi69YZko39y7YTU4mg?=
 =?us-ascii?Q?CUe4evoe5w77BuNuATH6oIgNyVbTUrUc9kvE8SDQlbqirzEtomsAQZTX6x+o?=
 =?us-ascii?Q?FXV6s4qDNAYKCI9OQqpFQoBhV9MRQxgygs9ghZ0nlDIJbtbbe/AGN3r2kw0G?=
 =?us-ascii?Q?WvbZT5Va7eSMZNoDrzXCmDKVEJ2EKLHSo/lVV7FT1XkuTRe3KEK2fvzD2p8d?=
 =?us-ascii?Q?64RJ+MuonbIy2LXckSMpuSR7Obi+Xsk+NlrinIhQXz1PLUi/uZ3jJSaU1kJL?=
 =?us-ascii?Q?KF7Zw56SBzUWuMLZINgmykvhM6KCatieLUCauf8nM4izdoyt8vBJWx2kzqr9?=
 =?us-ascii?Q?1aOoQUHUa62vscVJFcNrSNPPdlQRNMcasXbVcKzGhY+sq4VmL22ybzBA6/fc?=
 =?us-ascii?Q?/PBVV9xzGg1hZqj4pQiK7PMup8zuyhiVnJgVl1t3VOEgTmnUY0b2Sv3XlIRZ?=
 =?us-ascii?Q?hmuOuHtqHQFxtRdnuvhDSbto2icq+Y7h5rtpIIHc4ie2+RCw866j8I53TGlU?=
 =?us-ascii?Q?ofjxyDoAVtEvhNqL4dT04eRmFhN/dzyjlw5luT74bNzHE+O4Tx07gI0DkiQY?=
 =?us-ascii?Q?r9WAwwjA6l57gvp1mwHx9yO0NZ/ATqgrSTdtqpN0EAIJMKHFKBUbyfrXK3+/?=
 =?us-ascii?Q?j5bK7m6gUfLi0RAZGMrn7a7UEk3s02MV4r7dIqhbengH3Php9JyL21UPj0Cv?=
 =?us-ascii?Q?FlGy0cvnb9h1xF0DH0/24RUhlNHoGxnlPePUn/uCjdmEw4RMGtKhS+lrTCK5?=
 =?us-ascii?Q?ZOzDPK3DBvKCXvD1ZEVNPVl7QE1KSwmK1/rfW0JeFPbxrx2DyUTMYKyICqk/?=
 =?us-ascii?Q?AKdX07HeC+iVTzGLDP+ZKyJp2dVa2e0=3D?=
X-Exchange-RoutingPolicyChecked: 
	qA6Kcv0ObA3TivTWue7oyTIvBSLijpzSRUC0iimZdWxNTEle5ICgSZrKGwTmVEDQ6txhbjlc8qmAhQujrHvbf6S59fm3mDNrIO5xckCDEz2Hjrw3AasHK3bT9SKf7+wLh3EgjNcb6LYLVTTJIk5Y/eouuHvnDtcvAGVYcSeaCIhJ9F6o6Wj373mXfOhturKzNtcOfBi41EW8b1jK8z/Cao3KbwFtXbPo+E/s0alb+OdAdkPJdHmlw0ugyxYC2KB6bKkItFQzk4JNxDZ5R7wXgfgrCSjriWFvzUc9SElFE2J8fS66r34gcfOjICOHyCzgW6QoiNjncX7zQn/yNVet5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bde510b-440c-4189-e976-08dee9becda2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:43.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaF8MWfNTfz19P07mLPGLYznzsnQYZ9bmrtQfJmpXKY6gDdk6auGORrFy1HtEajyGS5JpeULeEHGQXtA3PpqyDCX3NOaSFkPLwHNnUKtf7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xMSOKbvq4FsaCKn7Z6IoXTHsWv3gyPxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX/mTD1esgte2N
 x/Q+UMPzFwvUX/FDs498/9Nu0SmfVDeVSzs3Quub1zMODvMShGiXgEhMmqT+Z22Iu3Nges+gVah
 em5hkcKA9vaaHM62LSnAxixdu4GmRGvI3Yj4q+Qkvny7jplP7nU0wwuR5QUZXotvI9IpduvKWaW
 jx7GDRs1lDo/47zH94z1vwCJIfrWIlEwtrAo3uhvq14ShGpKTDXQlurAK/5UM0hxhrsBmV7WpFW
 5o5e5Xj/lC8HjG6YZ3VISefVk/u+Tl5dKQw1LE2MSUgBEGgcOcuFLKgRw+2dC4nqyXBDlFf8d1o
 hx/aTftTfhdsDt5Uw3th7SX7ntzgMng8wimGSyiRgPzAuWYSsZyZXwcINS9blRfyxcX2z4cHF9p
 kfz75V18OYXGK4cNSwJifP6UpJjXJdH5hLomlq2e9BIW+cRp5TZ0vXLI1TMDztFI4DOlZkdU3Af
 0WevlCBqv4SLvxd+igw==
X-Authority-Analysis: v=2.4 cv=LOFWhpW9 c=1 sm=1 tr=0 ts=6a63c55e cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX4cn0dGwo7h6f
 crQ4V8kJCE76tni6TbuZfYsolvbtj+wxWdgwJb1Q39JyCGzJPvqgbtCtGrwCgyqscbqX4a9Yk4G
 BVIqoiFdBDj+G2fR0tRl+N3bNXjaWsN6X6iG5qmrCr96tbq8F+EY
X-Proofpoint-GUID: QJ_9YpinrwN-slZ5Ru5m9EFzuRWqr7Y1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241947

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

