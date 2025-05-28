Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B2C5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 07:54:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10720.1748418846584433878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 00:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7243b7192d=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S4UW6U029624
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 00:54:06 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm3fkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 00:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOfPhSWK3Qp7WExQ2DpVgL7TnAy7PfbIQIhWFt2IaV0KG70or+8qgIp8lv1ht1JeiMZdsIO4rr5mj8JCgArJvMuuRpIUK03GHqHhPogAwjA33y4WWvVv3TjBkdmU7NPMkldxVqYFCzEwBqCOhQ4Ii3YdWhRF3L5m81mQW1y9PEV4nT/gJQUGOdWn5QaA0uBbvyhOzRTwNdwV5PnJ0IuDaUMANgLzw7kDo25osYD/k0QS3vPXWypW8rxsUBBKoe0oafZq0nYPu6QcUs2uHNoUMFod8vUH2K23Bypn+kUw12wp9e2eIjS/4bCEPEd0JAmSAQ1MHHdFWTCzGN2iFyPuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14z9WDkVu/wYGo6iF8/AcL+ETOA/BZgd1gKEyqN0gkc=;
 b=QKvEruKRwRvg56DX55E+96jxCZhcZ0vwcqpN3+GLIa61PMInHPRkxEZjkFdC2RIgJsOcOST35ra2YkpCwGew5gsoH4rkCA1XJH9bkL6Xhgm5fYndsEvYo305izYTCA1hQ1g5nGykMHWLyqOg9hJZC3oHJBbBdpWh0qQq9K8YF+iIL0NufUET/81Q2orrgW1M8VKvivLqsIX7W+wPIi1/q1THtQdaVKdRZeh8IzAfUYQFobiGVBQBTnALdyHt+xyf3yHoV8XrlGWwRFEp/nG23w6EiNRirzppk2+IfFiYD1LkiNYQs/ah1KkzsfeBLuS1HVWqZ3/Gl5pkua1aCxhGdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 07:54:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:54:02 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] nfs-utils: don't use signals to shut down nfs server.
Date: Wed, 28 May 2025 15:53:49 +0800
Message-Id: <20250528075349.3238440-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f12ad5e-fa4a-4f96-7d2c-08dd9dbccff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tj3KVyvsdppYrOkXCf5naxgpVHzhuHA12KNMfuxfb2wQYe5GPeMsQ0gx8k8R?=
 =?us-ascii?Q?EeI0be7TZ1D9RQtKmLoD6YRPkkgAhIuJivLMItYj5Ch53215v0FqJt0E/Bnw?=
 =?us-ascii?Q?8HSZ3YPtttL0SOZu3bPrFFwgtHJXEM4g5aZ3i1In/x633hqA5P8TievzTtL3?=
 =?us-ascii?Q?8Khn3hlQsgaY1UwLlToP0f3X37FagwuFSD5xyErwe1CL/OPIYP6Ts3aQx3Uk?=
 =?us-ascii?Q?2KYfGsJqmIEcyRkm+vR3h6Opk1cvWyDpkeiEQnvPFHoC2JMV2VGjjjFxBKGg?=
 =?us-ascii?Q?eaRsUKYnvWvp2STQnEAgN+amKmM1xgmMRTjcTRiYGuv4J0HkrV/yJjZbwMbq?=
 =?us-ascii?Q?8prIJ31i4cyyUNmGRhoAJAU12xqzycWd8oGd1l3f9xJmGkuqlEGFp1k6GCcV?=
 =?us-ascii?Q?/O581RLO2Y1D93FbZe1amTt6PV413Zgsfnk6nVaHUxizxAMGD7e1N+a3vUf2?=
 =?us-ascii?Q?iZpUWn/YPz+wQjJY+vXZYvqFUQuGAoNang8S9+CRl0vhKjA/dUQmqPjFwIYs?=
 =?us-ascii?Q?TXie4YxzhYFOFIP0ZYCLX/MCVUk4LwcPDpBQtJy+gG01j20SmtwOlkIC+Xoo?=
 =?us-ascii?Q?fIFagPJA6IPXd/YLqiyxuV5K66sC+BTancivNBvCyVodDCCwLuLxXF8SNvJC?=
 =?us-ascii?Q?RK1zqjKmKdkTOzm5iwtWQtAkAmV63PVAGw19+y2r2nHKBNiG6vZ8KoNgG0Ga?=
 =?us-ascii?Q?t0rlJ7v+YcrKvSxZfVSw8teOqCrSeDimLBwq5AREzb9/7erSk4XtYoHPrbqj?=
 =?us-ascii?Q?BNa2L6ozOXTCHO5ufiTEFz0OAQoGyRepk2yOpFXqsNFQqYbjSK65Z0mSvXiJ?=
 =?us-ascii?Q?dSkEa+whQS8kL8zdlgdSx+ZVRKx522tSSM37Cw0vDhulWGJUBZCIpm1ehk9q?=
 =?us-ascii?Q?exvPAcAyBP/QN/NUmVf3z/WkiIFckQHWsqaNymU0Ko7I/O9X6vKLEoVl1rCC?=
 =?us-ascii?Q?L99Mp27fgbz6D3UHwllM7SixlM7j7SS3NzEL4+ptjR4tJm5Qf8PpMvd7fFnp?=
 =?us-ascii?Q?SwFD1OSQUeoTBN1NoWRytOePMhai+MOvVqyC4puAYCzTK2nxEnLN4GSmNsi9?=
 =?us-ascii?Q?g1e9kt9x8t6FRe6ZimST5aBE5wgUFEB0bUYCl1SfrKr/mjKXXC01vpGZ0hYn?=
 =?us-ascii?Q?H6GfWmf4F9dJ4VtaanP8lxPiqnojylOehgeu1L+H0i8g6tFxg5dG+3IEoPae?=
 =?us-ascii?Q?qggyTESfF9iMwJ5o2TR+7d4AKFeImvAsd+b5vA8LOSEnv9TwRInqkQQATZE8?=
 =?us-ascii?Q?UXpz2bCClpTEblkcjeqesflybIJ0N5k+rWwbx3+s+f0NkaAl09TH41heXh+D?=
 =?us-ascii?Q?VLo6Q2bzQ9pM1dQSZhFZ7f5PhF4EJLKitMhmIlzRFxW0WVd1u60rntGhhSCq?=
 =?us-ascii?Q?vieobpf0TJrI40go86ukpBLQSD5cOwNzYlFvE3Ga5wLEGF3RqqTTj0WLaVu7?=
 =?us-ascii?Q?QLBp6QIg5xUg9sBmLlhj+7Vx2kWogZGfCiC5cBWjUuMvftcJ6aCWKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qcAT7PtU0LVxTei3VdExlcKAWXOeljuutYRh2JSabtmUjVADolgjb7VGI+EU?=
 =?us-ascii?Q?6WVVS8K2x+pbe5rIzZN6XRs9/22CyqHQpKSXEphXkuDS5NajY7p25CJRs+1F?=
 =?us-ascii?Q?/5cxtu1KGR/tvQU1Oad+hyGRMOo7K8XM3B/PGu+ibITUv9SAzmfvdOwWu2qN?=
 =?us-ascii?Q?WepvK/p+x1ffTyH/acBDNOaxZ2CoeYOP5USZTQY/5yzE80FmeW8FOiwFvFje?=
 =?us-ascii?Q?YjcjZp7cDWqSYEKl2aJLyNdp1L0TZTJPNwqDpnZiYoYY7KO/IfjTnPqYkbaT?=
 =?us-ascii?Q?IIpY8Qjom+WU5fCWlmLzqzqhzfB9VVKwogo9esgJuFS2hNGEDHqG378oA5f9?=
 =?us-ascii?Q?NBQEmXrbqyo6aFyqvhQeFYJWUCgwYcNY0ANeKxCwVnONTuC78DZX0cXYJ4wg?=
 =?us-ascii?Q?7650yyTD2RT+QMvOoz4AjBEAJyodsfgjFhyfcs/n8SlTQ4IXpoxid6JEMtbD?=
 =?us-ascii?Q?05CoBAs9b4zFbDuB5B0zEwfKIdGndazuMgcoQ1kfQX6Ei90rPc56bDfDvbNp?=
 =?us-ascii?Q?QQpGaJLlIltBZb6WDKrIkPqWclo+IMNcv8JTCE4v/dWb98reB4taUSteplIV?=
 =?us-ascii?Q?kiMy/5cFSoPcCtmJOTlXz7QZNfDtX1tcIh0KzR4OiqmFgCGcZzpqrwMzXVyA?=
 =?us-ascii?Q?GrRaIHZFRzVBvbGXx9ZXonpSCmRdTcqsRNcv1bpMXsDuea6vgA2dnt+wa3Ac?=
 =?us-ascii?Q?7q5SXnIFWv3jNzGlFSTPOS3QL2tp3mQ9tHK2S0NOHPj/5dt7hgcqn3I4H+iz?=
 =?us-ascii?Q?XxcBy+cSvGV2Zg4BdbOolzYAjmQylPt4WRWtsk9TAE+UohKjAStpI1FuluAM?=
 =?us-ascii?Q?dn45amv1Kpp9rL0mKWQJTfjJFGHRj7szTOB6OeRBz5OkdDXYsubtpv1fQxCQ?=
 =?us-ascii?Q?EONVHdea795W3KXeIQshnDHq1Wg83wcTIbGQsObebXRc7EkuezmodNIkdCIq?=
 =?us-ascii?Q?WWMMgscVYZWr68TyJGjb3abuLuwfo3dYzVo9MgmN7xoXRWh86PDe90Giz63X?=
 =?us-ascii?Q?PtY20iHeY4fbp9rMu//2D1N8fZY1NvNoiHucf3N/qgorrD6zw6XwY8Y8+9g1?=
 =?us-ascii?Q?3BsL8k8LB3QrGgZ7eAZU3tOBn3fL9keCei9WaRIPCjN8MUyb3RHOj0Q6lhLM?=
 =?us-ascii?Q?TwlgQuBZOswwRmqgz+KoXmegQczehe+DABSLKYIozQmhOA+F3tfZQVlsJlUX?=
 =?us-ascii?Q?9e9Bbqw1WwoS2Njs3pKaJVcXByxyPoCtimH4tFSwuL9uq/bA4rbtgOhxY/Xy?=
 =?us-ascii?Q?Saa+vpcUH/r7wpfE2vkgK23+WPqeEq2FOu2mGjvd7NbItReUlcVHB1YO5FfW?=
 =?us-ascii?Q?xKhqQaIgPj/5N5YxRKpMGmS9r2z8lLgOTAYba09wDjKqyWY8U3roEpjLaWyg?=
 =?us-ascii?Q?BEFEdEWqck6u5qRGfxG4h7z+WHeMQghCp06TIe0JXEYvrasCuCx2EAgjUWrB?=
 =?us-ascii?Q?3Gw+ipkQ3TD+cseKBznKjSpEOcWzyydpZF1m3GuTgQaEt74Icw/L27C4l9kK?=
 =?us-ascii?Q?C6bEDv0T8rMTu1+u2xF/VGF+BXXytX0H49ksbeN0G0naBB4T/QNjH/tBqtDb?=
 =?us-ascii?Q?tSJbZfEImPIE7soLeEwRtXLBnN8/j3cpwk58afSg0uKZxHG59KPyFAcK8xcm?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f12ad5e-fa4a-4f96-7d2c-08dd9dbccff6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:54:02.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8IXMrJ0cnKuj5K4F+NGgsj1oW9X4W6GraVwrt4x2Maq9EAQDcKOG2ObGzYU8GvEXs0PEAdJhi9B6XZZdgBBmbYRI0binrhAsj3lFXBoURI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6836c11d cx=c_pps a=mThsuETHHIkSkG/rO8ockQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=38rMEbfbbFn23TXZ:21 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=gbk0yKnyYj3XjN68PW4A:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA2NyBTYWx0ZWRfX6VO4Fgv0979k G11hpiUcbn9hJGU/RA1Kt/Cc89pY1e4LQSG5lSjjld4U6YF2yoBC73cl3farV9YbFJKb8vQj5Y8 WAHYyAOyxu/HU6Iic1GcaoRG40+sceWXvb79ua7eRhJkx7AdK7YOnF0mRAuUHpVvNukorOy3cwO
 IAaaWW0NmnFUI1WIi/C5Eun20AQ6Qe6MwNFbBMo0SdvQGK6h4o5A7/ucR1yVH8prVjSHAhCKg63 LXTBZ5w/Vm/jRX4xzzQ4Sbkv/azuTil3aZ0+w4YIlJ0N8lOpbVya8JLUksCIWWepAGaNWjCosRk udOijaUOI9dTcAMpEJirdkYRjBsp5MYuhWZ+36iCR7wVINwQxDA76BMdVJA2pr2OFm/qF35sCWN
 pHhFg5vY7cr+HsA+329v7xd0lyECd4Bvx2/y+Ggp5LTLwGDeORfVjpihMBEEuFEL1u4wxQZw
X-Proofpoint-ORIG-GUID: -5LEhYKw2qAsWsedLXLitA_fQq1gaArQ
X-Proofpoint-GUID: -5LEhYKw2qAsWsedLXLitA_fQq1gaArQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217337

From: NeilBrown <neilb@suse.de>

Since Linux v2.4 it has been possible to stop all NFS server by running

   rpc.nfsd 0

i.e.  by requesting that zero threads be running.  This is preferred as
it doesn't risk killing some other process which happens to be called
"nfsd".

Since Linux v6.6 - and other stable kernels to which

  Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
  signalled.")

has been backported - sending a signal no longer works to stop nfs server
threads.

This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
server threads.

Signed-off-by: NeilBrown <neil@brown.name>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b09ad289a36)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 0f5747cc6db9..4d78312929e2 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -66,34 +66,14 @@ start_nfsd(){
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
-delay_nfsd(){
-	for delay in 0 1 2 3 4 5 6 7 8 9 
-	do
-		if pidof nfsd >/dev/null
-		then
-			echo -n .
-			sleep 1
-		else
-			return 0
-		fi
-	done
-	return 1
-}
 stop_nfsd(){
-	# WARNING: this kills any process with the executable
-	# name 'nfsd'.
 	echo -n 'stopping nfsd: '
-	start-stop-daemon --stop --quiet --signal 1 --name nfsd
-	if delay_nfsd || {
-		echo failed
-		echo ' using signal 9: '
-		start-stop-daemon --stop --quiet --signal 9 --name nfsd
-		delay_nfsd
-	}
+	$NFS_NFSD 0
+	if pidof nfsd
 	then
-		echo done
-	else
 		echo failed
+	else
+		echo done
 	fi
 }
 
-- 
2.34.1


