Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04822C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27391.1784923486187949111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qUP6UTq3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGr06r2219733
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MfgyRssN+UdYrwV1SraStVNFPJX3DlPW/QUr//Ar+pY=; b=
	qUP6UTq3vos+XUqpyDiFfackdLIWlZI7QSM3OphWRtTwbcx7twBWja5BLtZnkBxe
	ODUwsxL5ov3hRSWOCMTJoqgA7SNJiObmi4JusczizKZgiARMaQHSCjy5FwtL8pN+
	Y3rKMO+YmUtFmAP6pwismAQPQTGQpADlhMjNh9Lm4w07q+Zu5uxhHyYsZ8d1gJpp
	t5Gc2SipS/VK0GX92klyKV0M7ni+f3aGWXOE4sOJkcsZTKmdPC1nP4OjBjo3OwYU
	OcAotJETVz0nYEKpehnRWYAyWwAiwS074SmU/Pxsj3NsT1+UZ+vm3O6VBnbrRN1h
	oB3VowNDfUkS+EifqkGvyg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fm8ay0q11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc7yCGCcsRy5dGkQPbnNSF8QH10QA/zR/2l1MVXaMdi/lzkl40ur13aWD1l59UPfeLeDh9ztU3eW8bXcFGtQVJ+ncx7rt4ps3JNV/RlmYg1bP6iSCT8sFnYM7W1//lVzSY2ZgpnI4OtRPVql8NoTAyVzuQyhIAzvv1A30jXj3RBFnmK50tNd6osz/P5fE/gOfKo2ybZFo/GqT+CfOTxaDBkwwQuKiQCHpeCPxapuHBCRsHx5nfoYq3v4yDNbZ7qi8RYlurykdmuyijWBjonNMNpjIZLHWqgiS7tnpCu/9o8uQ6Xe47f9Xi8uKFBiDEzmqTbgvI5WOc7w6/3aKPoVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfgyRssN+UdYrwV1SraStVNFPJX3DlPW/QUr//Ar+pY=;
 b=OxK/6ATS2zh/3eaOck7YtHGEpU3dMKVo+jP9b24Ka1JahMHpsDNAN36JJ4ar6dp9Aj3cRimC5xpfmPxRbrArxvWz+P1cm5hCVPMOV8bptHVKrjMli9zr6pnfF/gsqHWd/1IqWA33j3ambCQZjLc+7YIImH6WOIeG6PLmajhGFmsgiObsHXHhUDFATVb3rL8amO3uV1qUgozIzUrhdYh24ZebCrTGlq2jNe5f6yXPyvOBL0sb18VYqj+zOsY0Wt5ZzG09ogfYlPmiZxzqr9MoXM9gn0YwUDHzCOG+UFlWQPbTDzH1PWBkmYGkaTZDpwuiEwOydWDwed5XgfZz2Iy86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:42 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:42 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 5/8] lib/oe/package.py: Don't redirect stderr
Date: Fri, 24 Jul 2026 13:04:20 -0700
Message-ID: <20260724200424.954199-6-sumanth.gavini@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f8c94b8-49fe-47eb-bb80-08dee9beccee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	BxkCRO0Tm12Y7ZdS7gWrR67dGNInbxRn2xY3l/DyacTgzCW9KTIuPdpCTetjb/3bQypqqDcvJogciiUHzNT+y9VfS+vR2h7koM1JJtCQKb4Jy4ZpBPr723nnozyvHGxU2cCNB3V3dzxVGy4vOChOslkt7G8Lo6SppyYY7YSyNnJ11COrXkG3OJYu4mR6DUknfr9tJ0oeXhFmzc5aJTItv//kBGGrFAyhVHzCW+vHZ/2VKGmWWstASfOwmM6P4qLfxtKgZ5leVnj9INbozPF//Av6OY05InG6+YBg4oFe7l6TySjWYmTb95sN2ctqsSwuXhGvJh3K5R2tKkErDkXl7QwXuKxu/F39ln7POCGiz1hyFA+1jFUwKnTGgTYjiglWg9jIRvwtYF6Byzuzv0KMMqLS+TfkmHnJZ5Yn9QzwHJrWYmgUcImr6e9QpYuflDpnlBniBSJnfqxSGPtMDmV6KwktUHRbndWKPqMfZ9PvQvcHheP3A10p+aShvV98U+3ojhHr0TdQMgo5iLjDN2lNU/UdikLxo1kXnv7PWa4a9CCrrrz9349WcmjKrQ5TTQFDhSF+Uc6XwqdKFxGIsfm9JbDnNjAg86B2oRUBg4x2HJWX9tOut6mp2oEOkfFF7K8LNFejGVLtYAaZozPV55J3VqxuMojb5hQy8qEjBjurpSVgGfE3SJcEuZFxzQgXmmlJgAyG4+Wkam9LzqibiWlu5AldfaYOrEFzodVwKWaFBek=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AvymXEDyDQnupiTnEFurcwmYRJvd+UyisTVNQuObS5YhpLQdj2PUS7YBgSCm?=
 =?us-ascii?Q?oMez4YQY56usp9KPzItyT5NdgaqWqJ+O+Os1rLzOUdYluH8o41dneIy3F7o1?=
 =?us-ascii?Q?rWrwrjnz5ibcrxMqFUjTzwH8A1f/VYAkK9ejt6C/H5mXN2RiUa1mrH4gGkML?=
 =?us-ascii?Q?h4KM/picEjDxZeIXPIqWwKjVoJGmGofSIB/luQI0o3sz2ZFLJd5Lkr8heJLK?=
 =?us-ascii?Q?Mmhwr1wvVb82pUb2x7Lqnu4Xn80NPUHCN0/6FqcHbVZ39QRcFrccdDx0/ZXz?=
 =?us-ascii?Q?kbjaKqs3VnfJxif9R5rh7RpoG9wWwGKiFypw+w5CeaQD/w3qiUQn9eWDYcOa?=
 =?us-ascii?Q?cT2khCWsnZmRUgmfaipRH+ICfDEuwrTOraACPrg1intrzGHlQ2yxy0k8z6/C?=
 =?us-ascii?Q?gXkvCFtSSifcj8KXXn+llKkYHTQvXOAX9REfTLCsp816AR9vpcuCB03xurbt?=
 =?us-ascii?Q?Er3/vaWb1ABu54ewPbfN+RhHhat3LiVLSPyDyja2dAJO5v4cyq0MIv2IK/Oq?=
 =?us-ascii?Q?xY2kom3wifg+W12zQ8V8oSxZgSXd6cr9h5djrOHkByutB+BQR+y0gyoNTt3+?=
 =?us-ascii?Q?6ZSNoXlRBdFaMjOV5SHzPKy6mhAzK6i+jzwIu5M8vpPfcjbAq6h7ygZKCMFL?=
 =?us-ascii?Q?IGAZll0U5UGSyw55VS/F0Y+UR18+Ei22Qv7HyCHZ4VrVS/bUb47W0Pj17E26?=
 =?us-ascii?Q?Vfr/rLuul4LmT8UnFKMKPDDM9TO/cNuZdumIHSGXahWv/+Xwfx4VXptR9Nz9?=
 =?us-ascii?Q?Go8+cC1SMbr+m/VffS6ANPZWuFgFb8HGXKvxVMB6vs2z0Sld2Zpa72vsc/YT?=
 =?us-ascii?Q?RB/l26BKZXY8keHmeQF/hS4VGrIPtDCoBFcbdctPjuZGdjQA14atS/DZiw+T?=
 =?us-ascii?Q?q+nI1jUD/Jc8fa/mQDo+17id01AoD/MnP49ctBKMMxSp7QTFHY8obL7u8ypd?=
 =?us-ascii?Q?T6hLuEm1IJkbrBkjFW5/ftbIj5kzD9JUTTDxP2P+bhEyfcMNVyGXA7fV6cXG?=
 =?us-ascii?Q?37xlFGU60+XgpGNPdgfUmz1OjeKL5g9cujERiaHz1QjTSYcNJWCTP1gdDv3V?=
 =?us-ascii?Q?PrwP6+kiOvBg4PezLVWGDK2K991mRooioAfPD98Ft2PJ4xpavmJZLhxKe8g9?=
 =?us-ascii?Q?SiK3Astt8LSajQ/ieT4zrDYqkKfDxda3wnYB1t77RiWXgMs+GJQVNjJ2VPsl?=
 =?us-ascii?Q?vC5J7IrOznq3D7rbqGbhSRWozU6RV8YPDlR23fRL/TbQt2NTGqN5HKDzBxhH?=
 =?us-ascii?Q?LjiDrnb48AwnYKn37i6aeqOF6eH1F7+RgBVSkpG6sM8agGy53x6zIxYCnKGt?=
 =?us-ascii?Q?pDj/1rYpVgJ5VjWQJEkfia2dI435FiCAgzCk8vtVlZuPFS4lBL7zAugsmOlA?=
 =?us-ascii?Q?PmJzu0Z5HfN7FD+xGDHh6nFeWOaKRNfGzASTUvJHAO2Gs7nXhvPeG4pNCwRh?=
 =?us-ascii?Q?Gb8IHUR17x3kdz/q+Jw96tquE7N0jH7mXU0irmcah5anUJcfytDmby2fDDcG?=
 =?us-ascii?Q?AuNTIqeYffwtQMdorzP811D4hwzBbXgf8TPjKw+uNAWD/1nAjMAc2gxcA5Ld?=
 =?us-ascii?Q?wxmhX3ictTJxPXqx10613UOk2Lepx+vaIyMp1oQL1Ri8E3yYpyLYI8Fr3b10?=
 =?us-ascii?Q?Ij4YwDkbpED/UxdJNZnT2jtBpENjfld+2D9q5Lh0xS+VFlloqnNki6/striX?=
 =?us-ascii?Q?w0jQhdF7f33HSGJHcG2GJY687PYxPzL+VvpUuDawjasrh/8yHdYMPzRdzKcS?=
 =?us-ascii?Q?oAEaiTbp4vEWEqMg+LmIYlgJo8zqFOw=3D?=
X-Exchange-RoutingPolicyChecked: 
	nD0ymubvPNBrFI3ZQFUXgV5VAQA2HDTbR2RFGD+kh/fxtwrkndgAqktYTrekNHoahU/0yKoHwk2jmD9OPWoY83AsdN0xxghu6hv5ZtSG42tS7LqizoCjjyCJsMG/QsgpkaK22gjp5Wu9kjMOJ5k5kPfQizS+1/j0QxBgi80YSd1LGIPUHSK9BSvJVE2RzHhRI0Ys8BNax9jELuRCCCDrU99pBzn3h7epxNaBs1aHisT9q3u1j3+mPW13IyXZUvJ/Wp+r8tMmPKlJGgBeygMkWmStwYpA7oan6UvjwvSatlD9ijffb5DfoheFc2T/50tDGUDJIsLoFG0ms0E2eu//Yw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8c94b8-49fe-47eb-bb80-08dee9beccee
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:42.6717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tYx5Bw4RJ0X1kaAjThcs/V6PC+LBjsHvtCe3V/bIAa+71nBXPSdjUd6+hcpR5KkJG19IOe/WICACbHeOdxfonDCAa1GEVyvmtkYkU2T7E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: gjc4Z6AkqFdRKsjHkqJaPza6Mx0GGXOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX1wes7Kz+0zkn
 SD2arjp0wILn1T0m0dw7VWj2ME3jVXAeyZtt2/I495wV9rbmRgpwTg+vZNspK3IYjjLOnhyly1c
 OBeWFVvPILi3z/onqMFjtOV2fEKtAhyi5gQRqyDaVpCfqhv03413EmirpmSKHMqffbafRQzXZhX
 HX6zZwsP4+84Y/JONdpzVxKCQfh4h96cz0/Z+I4Y0MP4feMroGdqitCWa9F05CTg49RC+flJ9uX
 29OnZ/aL6ANcGirGD9agcbYlYYwE84ElmWSkvQfHkliwpc+pgW0iJv9P3VtbDadRUG8ZX7NgZoL
 UBsTNZzGvg+TdHfkWc5t/5ywJX5JUDon8YXq6zjgW8Fv4hGwR2Y1KfigHJLS1qNTbBH6WdwVf4P
 4CJ4X2c53t7lYB+f2IXixY1eLjRdfpTPpsyETJvWXHoYFlkl5uC0bSl3C7as7n8w+ECScmJU1fs
 o2m/+JmunpKFiyCIJLw==
X-Authority-Analysis: v=2.4 cv=LOFWhpW9 c=1 sm=1 tr=0 ts=6a63c55d cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX3L3TMoDDPnZE
 eG9DOacQPqzh2yHpIh48hmLTTkuvLBTJ/ZsTYmYj+xrIROj4oawyp0YdfcvLBjOMwIN46xdfNYq
 m9QmhEP8IomTUqfFS8wdoO88NQAI0PkAw1N5HEYyTxSwCEUhPIQA
X-Proofpoint-GUID: oHcXEz9bhSGSoSgrUAplbv1UspyVB3Tl
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
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241946

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d210b4a73b..d6617cbac3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -291,7 +291,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

