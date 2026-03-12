Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F7D106ACC7
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25676.1773331894694464253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cJOj9ntB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9XEm7008800
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vPY997npY/CClSu4GW/5WqRLph+lVTvaaOWgSA1BLyk=; b=
	cJOj9ntBOEKt3ybGsa2Zc5aXhZTHfWF/zj30vM4uVIm811uoT9W3atJgpaUlbshO
	aWvVQajeGqOgcJCx6ijz/uOz3dlSzIeSoGJ9rQCjuCTGU5mtKS+GTxTbfynx1yIT
	KwaTxBFuU3NzjGcTBt1Ks91qE0DIBQK7JET6HqZ060tDPkPI9rV5+xktriXPVyW7
	4GgP+8suE+yvN4kWc+3C45g8t2prX1Kv3EsWB9ZXJG3AllfF9YKqL8AWHtlYUfbd
	YA8AFHrkO3RcOQxUw0+1zChnAiYxjUpedvp5/iBR3ngWmLzOCM8rDiSbn8WFz7gB
	j55D4yf9faXgQASE7eUbeA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqrewn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPx+xhACSEHUSMFZY1NLtEIWTq7ielBT30FEzvk/9QGGo5/p3ROvQWuGxhN5Y/xJUWrj4Dq1iHM4VyXIq+yZHcT5//yuBmO5rZlT5570d6ZMKC2mHiCqxPWOtynq7x4/O2nVeZbhFqkyznyi6LPm3s/sRhSxXtkGy9UgjhzUmvswroxGV3cp0T3yMUXRxcWA/Wm195RT+4Qo3LMHIb/AdbgQTHm0Vi+uL3tGWT22Sq+VKD8uyVtBhYKteHChNw6UeYTAhdjBr3IHfqqddiseL6S7ZnVL8uRERT0wsqBgJcp16J7H9TfJ4obbn0nqfVJQWB7ZuM64Ik8asGNjaBqc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPY997npY/CClSu4GW/5WqRLph+lVTvaaOWgSA1BLyk=;
 b=i9VIEfmLB1iW9nUW03CAaoBXVdQH6JuKdY4W+LRpnq2TB6WW08esauyQ3ak764WKOodnmMeANpoXp8PuZw8dNi4af0hE+O8HY5yaoZUITEmhFjccezTvMmrKFIRG5+edJsr3ctCY4Ldsth1ui7WCP/vbpdjD/K66SfuDq6OcxaVs0KgdXEZ4yer5wdkslMy0J6hFdjV/tEULg+LAeOF1sW9jnf0tFy4MJsQpiCy+d/ZX2cLqKOnsoHCZ/GnczzZzzHPIzTz/wkrOaG4Yz2aT9QoziHlXetj0jR8dbFW3WTBZwQ3DwgmrQI7AyIxgFKWfX80Qb0dlyvrgNNFrI0mN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:31 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:30 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 5/8] barebox-tools: fix build failure with glibc 2.43
Date: Thu, 12 Mar 2026 09:10:20 -0700
Message-ID: <20260312161038.2578649-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: adc70c9a-fa7c-49f7-7a5c-08de8052025b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2HKuhBgJtyYHJntAJ6MnD3m6hCHdGwOZeeQwcGpio3gp5BKK2XNJhtGJFmOrNy/6PkVHrh/dtap0hf6MmMb71CBLzyIHq1KtBreGExq+4lhfag0HscbJZjBwI3WwJt6u9AMJkeprVT7HzXPCsWoBQrf0v6bBXwxYxXMTCv546NxmxtMmY4TUh66hq8lsulYXmRhJNRIvYByJSzZpxLDL/KmxHgJ+KkWESrgrAZ+j8cSD8bgVhLCZb+fRgHuED28cUGTG9O3njIGyBdnNOPnYOX0ZgWdnYxyg/MdBvG+wAVyzkBosIr0TaZccgE0FNRhK7X9miAmEhyf7ueLX6OMlS2lBfT4bq2x629RBlRM0Ng0LY56OHEe9DwWsXjWHAikXLFDnwaLSrFpaYTn0lY2uHIUfqXq3D3tzoHU/nJ6ZW1O27Tf67fkHctGgXCI+T1Jvg3kst0pHVKJu/8Awjt59/PcMMKV17US66Yzs+czElVhY1n5suU+R7yoRvAXPff1RxkN0wOZmrafPfTKeoloaf6wgrtLf6s/HIGvfyD0KE0IeJjvKyLRKVl2edn+37hOJ48DpqIjE8Q4FifsLpbBGpzXBKn5s+WnZhdSOuFtyIou0rmwJNoFEd0+Vc8ZnLy+l7NjaS5PuNCGw31O1iAknbx4zsOCsk0sJ1N8Jw5BJ9YTxCqdDblaHhPcxt5KlJk91Uspx7Mq1e4qO6Uo35+qxxdvIy7+5DHnw5ooDZoaAh/hzn0hAFa8F7vqxf0G68St+nge12OfrCFkf7hChhbdCl9fDnuqsuz5Q24dTB/hoN2s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?auRikNKQI5sxPZ192trC66kSVgeeHTRRmL0yTFuPM4VjncqQzA7kXGo8yXrH?=
 =?us-ascii?Q?WCbbnzm8VD6VZIBvH47QMZYqhJl5cd492Xy0wkNNhFkz2pGLMOkOR8bB09sF?=
 =?us-ascii?Q?EIg7ap+0MsRBeKmbEbGB+IMELMZGweWRz0CAm9QLrr1m6Q+H7IFi0PDSOIoj?=
 =?us-ascii?Q?q/jWvMUnj3f+O18Le/clrkHD449nEciXRSCWriC4c5/Cgv9dJYYDIE0hipF9?=
 =?us-ascii?Q?sIm8R69chsBwojYQHMhOOCQPadE856gxJyoK+BizQKKkjsEdGA8R0Ajaoe3n?=
 =?us-ascii?Q?c18c5jc3ykzw4ucDy8WejdG3lK5ec4F+a/tjjnS9jDOsefEeOW8MGSAhFV4H?=
 =?us-ascii?Q?KqXCFdYW/3noeKukp+SlZvo5/EuCIeDFnPIKHnJkRXjOwamOT7TbMzEmdkXc?=
 =?us-ascii?Q?Ika5ugb0AJL5z4rN1ZvHBx+4bjBtHPBiVbQ36lA4RrSw2jk6hpz43YSk4CWu?=
 =?us-ascii?Q?XvaSYjaQdwdD3iWjvZI4GFXvD+4vrohQFCMY1g+gnlViPo4axWTZmuxmKWXk?=
 =?us-ascii?Q?7QR3YCy8JLlTHeFcDEwQO9Uo8HM5R9eoNgjUUNLQrHkwGW+EJmqUvF9xw9Pf?=
 =?us-ascii?Q?ep3Xl7B4085l1EP4Ti4yrWjiR/Ow58UN0JO+ZskQDgQr43bobVTyn0ZrQjls?=
 =?us-ascii?Q?l2Vy898oIuOsikrrpV66UhF42rcL4n0omwRwUEw0ikHkw7N16wY8xg6ihNCE?=
 =?us-ascii?Q?wAR0MaxuBzfP8eAFnxAeyjrrGkaIlR07Qiwqq3KjHfZQtRDVXXunHfvSEpmQ?=
 =?us-ascii?Q?dOvMX4e725kOP0xpiU++8c1mVymQh6ZdbntKT20eKmWEanWh1cIRfoxXDR9V?=
 =?us-ascii?Q?grEhEhdMuMbMff4pKOG2CmIX05v1gtk6sCFiN1dl14rym9MLIA9KT2tduIyO?=
 =?us-ascii?Q?Rn8hVUGJuJNAV+hLDBjTUIK0CKrAXb80Hq1TiqCO0weLzId6gvB1CVwjdSjq?=
 =?us-ascii?Q?25up/v8/T8SFvkbUrNs95n1gIyezrMFxqevIa/PaT5BuEOEAkutM5ndgtHuT?=
 =?us-ascii?Q?33foFCnoKot+TMAhIwYmWg10UCWRHa43GIY8GXOks9gd2Uw+b/93dI8J8z0u?=
 =?us-ascii?Q?kODOaSbua04apOKXQ3Mny/EwQhK+URUL2WpbsMRcmfmMpnHPean4CECS7omO?=
 =?us-ascii?Q?uucSKLa1pYvLcNXzG+HDMK3C7XM6EE8N+3NQdvCRHnueW5VfN+PCuSb76A80?=
 =?us-ascii?Q?6iwxxij6RrzB2TOYzDW0Sbj2BRvVNKKhCbjTHeEQ5pegPyjfmYgK7S8f9vpn?=
 =?us-ascii?Q?RRWKC6tagvsfMk737VOeNPv3+OfCSSrwN99JNgRxd/PptCBpEs+45hQa+rbf?=
 =?us-ascii?Q?Tht/E+X2lw2o5pT63x+mORSBjRW/4QxPzIVKEAOWhGM962AR1PmFouNEK+w/?=
 =?us-ascii?Q?SREmRrI60ikLRLsChy2EXESdhw/dQpRXCwjmD1snwZSfzk0XB3RlVPvOLCYL?=
 =?us-ascii?Q?FMD3bR6DuPXHEfUMvmdBv6y4Uf8D7u5t/H8GrmUxLGqupby3fQUNVC9zZjVI?=
 =?us-ascii?Q?LCFZTrRp+nKq3BVhnjtVw7WKaXgc+2vkwD0RS7YWIUPUDZ+eCZpLUQYBh9Rh?=
 =?us-ascii?Q?X4KQIKjDET+f9/tVpCXRoKPHKaxbfcfPRzMo/Z736dmKA7hYXspX6aDkplXI?=
 =?us-ascii?Q?scx1r7IE29byzR4WQeXTJioZr3mflzqYjLWmW24aSBvD3uBq3/JikVLYa70i?=
 =?us-ascii?Q?Zra2tEJV/ynBgIxXUSxzu2+U4AKCpiy9aNBJMNbaZ27FokZJSzDCTTi7x1QA?=
 =?us-ascii?Q?/61xY51xE6XP5weiT4nRdB+l6q+Kwnw=3D?=
X-Exchange-RoutingPolicyChecked: 
	Iqu9n1K1H6/BGiqEeAEUXfuUc0NAHoou2XmjrljTjYHFH9wvKW3ejIKW1Lgav3HyIsvIPVxPxgvhH/oQofHVBeKTcmBXgeptQX3R6f1n1W16A3628WMIOiUhtSTdX38V88rAafn168Di9gPvG+ceHIDz9wEs4pnLIkaZ2TEmcIDkhDiygU8ut2uxghb+l3VVyTnPKF75GbRvAPONpj+9XZSlh9sde+L4ZdVONmzWBtBRJsfWm+R22ENBPITNBWBtzI69xcrP/+CW0GfYFwn3EkqFoWAjverMtw7sW3ibnXOWPEOamGohqyIpERFvcv9g5SmJEsHw6UjRVK4iFtZkeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc70c9a-fa7c-49f7-7a5c-08de8052025b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:25.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRzKlomNcbObOJqLlH5DG3UNczMtYeJPsjFdX63Gb02FvbWIa7/4XgpbnvknzTtT93i45ubEaAOluFQUermEmdSjjCwXrT9yiolMW+A4/xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Proofpoint-ORIG-GUID: g-qfFcSbbss5lQXXXBInRsPZZWIHidU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfXx8LPMp/lQQ5q
 FxXcq7Kg+aWWVF8sVWaK1vfdmPpYu2WV4CxvSh7wWQLi2syPwiHNUaWhVemuw5aWRrq6+hJ9m7z
 XoUSRGl44Ygs0XgbtJzRiIJGQgpGJylqWOKIkercfUVVX6o+xn85q6RPrySQ+Lf0LgXAP/h7kG4
 Lu9Ja52zVzdqOwtE3hWRuywwCpMYxY4+wZ7mt+ElKN3BKLfwfAhVhpELYYku3PlKcl7Ulf/4UQq
 klKrrvQ/aJn55fbpKvUxcwN3RThuM0XSFjYW4b7ysHHKA6icKJ2RHu2ljm3K/WRWH8v/5wbJSRa
 XitbA4RsmQwYvxejzTNmVseZN4u0iA+DUnYJvtWl8+HCY+rsCkWhRYtSe9dwR3+30c2K76oaCQ2
 7UWDVnlYe/Y2jUurZ1TuS9bmtftS85YQljSFEQYnanqGeXb0Jdda7szU+vyKzFYZePSu0VCMwpk
 Zi1Goyizue4EclvRhWA==
X-Proofpoint-GUID: g-qfFcSbbss5lQXXXBInRsPZZWIHidU4
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2e5b5 cx=c_pps
 a=Z1Yvi+W4mc/VVWckEa0YUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=sqegTYKcpFJ6_3p44j0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232991

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

glibc 2.43 introduces linux/openat2.h through the fcntl include chain
(bits/fcntl-linux.h -> linux/openat2.h) which expects __u64 to be
defined before inclusion. Move <fcntl.h> in barebox scripts/include/
linux/types.h to after the typedef definitions to fix the build.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 +
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index eb327306d9..1459f48db2 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,6 +2,8 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
+SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
+
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
new file mode 100644
index 0000000000..2ff7cb82a6
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
@@ -0,0 +1,43 @@
+barebox-tools: fix build failure with glibc 2.43
+
+glibc 2.43 introduces linux/openat2.h through the fcntl include chain
+(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
+__u64 type to be defined before inclusion.
+
+In barebox scripts/include/linux/types.h the header <fcntl.h> was
+included before the __u64 typedef, causing build failures such as:
+
+  linux/openat2.h:20:9: error: unknown type name '__u64'
+
+Move the inclusion of <fcntl.h> after the typedef definitions so that
+__u64 and related types are defined before linux/openat2.h is parsed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+
+ scripts/include/linux/types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
+index 5b01333..33cea19 100644
+--- a/scripts/include/linux/types.h
++++ b/scripts/include/linux/types.h
+@@ -4,7 +4,6 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+-#include <fcntl.h>
+
+ typedef uint64_t __u64;
+ typedef int64_t __s64;
+@@ -15,6 +14,8 @@ typedef int16_t __s16;
+ typedef uint8_t __u8;
+ typedef int8_t __s8;
+
++#include <fcntl.h>
++
+ #ifndef __linux__
+ typedef long long loff_t;
+ #endif
-- 
2.49.0


