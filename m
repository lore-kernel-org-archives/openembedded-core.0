Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949F8C61DE6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8085.1788094769785606434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V6jGCOER;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCHta81315165
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9cMrXM3T4qS1E3QhUVxnLhiOpKfI1Xa5NCGIj8b9gjg=; b=
	V6jGCOERraUa0aRm5oKmG+dqHDNClKucFKq8kKX8qU2rBSM6xiDLau7goKfTTkj+
	m6TXEH9MJSO48WIwva+W1rxeMqf5ZjgMKyl1RjgljFeObFassaznzhHSZX1mWreP
	BN5b4TdhpiMPT12OczEkz2LI46GyAUeJc88dxmjvRc/VxeGyIe7SeaxDBNkNW9Po
	whooOs2qaKOxRyXv/AuW23hL16ezGbbcmF+Pg3IGHeRLfrv7aljX/bbRtgrSENmG
	9iWkVy3eDGR8XURZcZ2jzLBcaTbIhzISOWyftv+tUPL7bXvT03EsqhBijICsbggC
	4sXt6zoxjaiA1sR9KG8j1A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wbs-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7g7kM0NloDAafAcNKvYVN3kltOolxbr/IB61uCZ7A+haiVFTmu2k1iuR8U9skF3kcuBZNFxSfN5hqgIBWpya3cB7WbDZ8lPuiDposbKKjbHbS+qHahl9SPVs1NCpkgC3eZevJAL9iy7ZA+/iSjylbXQ4Qs4a9Xu0EJFQUfhBuYMrrcbHnFqckVzbp4alCjs83Pcv6fFvPwDY2DNWfm/LNXz4a22xe9HwQA0HScUV1W7UjPcl0Cf8Qv8qm0M1NJiqvl6estXpaoGUzOWcrUXqD5HxXbIwzCPq81WoMjmOIB3D2ic02SIGgSl/Vb7Tt3yWJzoQ46jTPJ+3ohHJloK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cMrXM3T4qS1E3QhUVxnLhiOpKfI1Xa5NCGIj8b9gjg=;
 b=ss8l/p6yHQHk3g22W+ufLms8EB4KmU20slFWmEmDL78Set7G+8cslAnOa2jzvlmuP34UCL1NakC9D3DREzDe2WMBcwz0ubOxFCNf7A7Fsc13Ac+bk4+WjQ7WKXtjqXvfT8ZiRzleSN+wm+Climww45J2Cpo4+6baiuKCrYcXXLbHbIEMfPoGAJCDcHVyDO0JcPVfdE5oXBwSOxWUZ5J8ntnwi26lMpZc/CsRiFadbKwUX67AQKsTxp7djdY3WpS7EIT0srAzjc5hy9it/MfIk++C8/XhPoM1YB4WcaiokWgWtWEDHbrQpC4MxRiHtFKv/hL89oL5maWk5rcY8Na1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:25 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:24 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 03/11] openmp: Build via the LLVM runtimes entry point
Date: Sun, 30 Aug 2026 18:28:43 +0530
Message-ID: <20260830125853.1139807-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: d252a0bd-8f95-4e6b-b6be-08df06968476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|5023799004|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	GY9JETGmuf3UhlQhK7jD0yHvB4tZ1k0xLNl+OhB3r2ks69n/Bkqx4iqTW7DvTzTwYq+D7eeyLnB5uvdyQBbBaTQgbNiJlyIaiCWuUVc5ibW5q/bQUPMRby1EhLwEB5CiSPWG/S6LNiFnv4IHn3eX2BqknYQcnFQlzAFX/bhxdlQZmO4sqZt8DvL3z9snitgiR8VIH1BxnSod8nTG+GX3J6mHY/CxGDVHWxSwK/sLXRzR+50CNzBl+qiu7bB2KmqLBE4lwqS0EZd7Mi5WIg7krZ0dDYHla7HwICpNchAGfrjlzKAnBgeAcS01lgzfA3zVdT/+WPcGID5GYTw35ACvawOsinosPdOXSAzNdT8fscXr3ZpKhkH1RFyfdzzppV/BLaKzPvt106wsudLHEOOUO+fK5IlAoLqanj/uaFCakQ2UNuB3CSZjqcyl11VwuXGtd19piRZmH53Na4L/m/C0eOSQZUcgvz3HUN9eIcI1ZIXYjQSm/0/dilqSZHWlWe0ye9yNfqkP4MyUcJ43GfkgLqbxG6XAW+8sSBm6+aMaOL1xcSkC66Fo9ROU0MRYMFrTuTPRRN25ASuaFIrT44R0p5tddRrD8Upr4X1lFUbQ4ZSYFsPUonqGeXtPaNmXUt/+AFwa2Rd1/VZPkYx7nz+4njgOrkYhNFkpArTYgl60l8JhZYKJ39MXJdrElRMGJ1hYysAQpGwgI/H/O4E4biHCPCZNZAvcqhb3vy5AFq8tz1g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yT1JrcjHRMG/kXRH6icpTim6CfjdW8tQNsf+B6y8mH2CgKuxPhdVRvI28DMT?=
 =?us-ascii?Q?2xR/Nt9+HXn09+BiKrN8d901iNSG+zK0Amu+byRiCInlCFXriImjzT35e1Qm?=
 =?us-ascii?Q?aOITMh8olYlfvR0u9R7ElvhUx/WElAiqI8aNmtpnDIOkmMw3c2DLRyrMLu93?=
 =?us-ascii?Q?OuviHrEv/i5OjYOCTzwwzKWNiVs1XbEMH9aCfS9i3D4m0Kb8crM/EL67eA3R?=
 =?us-ascii?Q?PpzZ+pgFjkIWYGmkqAdyhaQYY1IrItMCxEHSehG149ht56RTJrzCjiczDfZk?=
 =?us-ascii?Q?G/Eni0gs8nBCiNiQa7+6PdYfWFSohBX4zoMEsHQMSktxwp7Vdu36tWc1Jv0a?=
 =?us-ascii?Q?PKZAbDI+9gjES6sL3hkhQRJDD6+iD3qDiVLxCivlxiGhCZRrh2Vi6pkkiM1V?=
 =?us-ascii?Q?iYmu9Gkc6mbiVYOy/vC/cRwArGFg6xWDDhECutYQU+O2zvG/VZoGDVyJRFG+?=
 =?us-ascii?Q?L2n6ORNk52uizJexrhYz4OWRfnLHFA3FiZG3ThxJjt4PdYU+RTddQY7H6HuG?=
 =?us-ascii?Q?yQX/NaQX0BKvhhj/P988s+ot6u5zBnWfw8oRM0dwd/2jeksd5dfE/YZLuBYJ?=
 =?us-ascii?Q?lwz+jF6kcf1Ek3eYZ/8Go1qtkRQy/pN3I9Inh7+gYEF8iek1A67LscHXMsbG?=
 =?us-ascii?Q?yav/OCjbX6xh4Ox9HXeS2sUPQASIwBt7338uUk2M1QPnpjFvwfzQ28VRKoZa?=
 =?us-ascii?Q?Ifae+XNOSI2K/RW9ekiY5/0IyGIN1JiQxEpEFu03fQyrLhHCV+lQqY1nVoAc?=
 =?us-ascii?Q?FcvAIDqjPZTichwoR5q8Prby400wFjqp6blRulqjpG5UmUdODPPiqzkIYVgG?=
 =?us-ascii?Q?v3MDnRpj0FTo6JZ6+8DN6Vf+t0rOSIcg1K04Hbjrf2J8ImUEIldxcgBpHwcx?=
 =?us-ascii?Q?d+YRoiJ60tRM13gQGHOyKFtTJwIDRRla56F0DekqhsnuTd2+jkW35+xkrexf?=
 =?us-ascii?Q?6zaooSyK3e4ccU4ZBrCSDSvcLdzvuvDZJARG46OQrl4GiAqhcz1RFZ+TyXKO?=
 =?us-ascii?Q?uD8c8Og+VfcLXe+h6hitHi7Uws9AH++bSyTNHa6fOmzSzSPA2fXDXzbxcqPi?=
 =?us-ascii?Q?vgdU+hytSgs8I5nLF7YIKkQHtD7aeMASkuvW19VKEhMhMZvdOmPkxE+t+plo?=
 =?us-ascii?Q?OAjFlgSNgRUqM5eE7r6NpRfGYz/wbKI+X2BPLcwZtM1XQfef+Vuro9bRbC1Q?=
 =?us-ascii?Q?6oZOY7jpzR4h8twZadqdYLGhlbgS6ME7cqTp8DmfgE0zLt1hOQEmEEQ/Kt7F?=
 =?us-ascii?Q?jQVOVIl4dFpEItKIysfYYOiDVtMdulriiVH4ZAAfz3wXBGSuN+fVAH1LL2S9?=
 =?us-ascii?Q?Ov0GjKZpU6JdOR0IMmQqS7dIg++UAQ3daBB6yfwKSfYRnET1c22pMDD9B25W?=
 =?us-ascii?Q?tF4lEpeBtcNMrj+fX1PZ1I4UhAXUz5wp9UX9lsk7hlzCCw79biGYlNsD/ScS?=
 =?us-ascii?Q?hHkInZwg93wTMYu2rup9T9JeH15nznixjf970mPaUdLdCwtUXcrQeldmigF6?=
 =?us-ascii?Q?UqerM572d45Un7zhLmz80kT+FdGruLqrQP7s2AENdY/lAGabkR+UwIyzOAse?=
 =?us-ascii?Q?gypAlKyWqRIIWLJd/ZkJZID9IPJTNfQNiGpUXnMX3SUHJ4fohi34rHMXQfjq?=
 =?us-ascii?Q?40HAZnAFJsurTUsQC/E8qU+XbbH3CsVX60ASF8DBEpD/fwMmByaSoO0GxfLM?=
 =?us-ascii?Q?VDPXvJ5FuUPySldfKfGpjUBE/hAWaODEHFYecLNkRJ3u6q0b7nTp8AS5fL4c?=
 =?us-ascii?Q?TnI1fCUhl3dM1iiSpwaJ5U5ujWOiyKM=3D?=
X-Exchange-RoutingPolicyChecked: 
	Y/lZ4Uv1QA4lTB+C8JGhZKtTK57uqVFFfmk5AAYBOiEF9Kg0UttTTJ7t02+OXg0/Yl40iOj2ofcHMc+C9K1pDbbRrspCtvITMJzpu257X2PZ3OSflvjQjpnIF6vmEBZGUS8WJxzP7Noc9wl+6RaSST26NkuGYfG8TUeh9vbroYmBGgne0PsPbE1I2HjZPwq4GW2SN5ve9Z313m10gJxPOk0XIT4Eng+gl+OSCMpHO2zFhc+5SUUtTlY+FKlsFz6E7y9P2UmGFpQEwwzhhfMTIjc7uSkRC0KL8xenbsNgZWKDsawaHxZxwZPaXbYDY1iN7ZWZK0aDQOEwhsLb2FQS+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d252a0bd-8f95-4e6b-b6be-08df06968476
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:24.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgZXcX1oHj4GbNmT/4Y7LqFwNY1mgl6cG02ScvKXBko173U85subpk3tqz7VWJto/IitQSpb3TIEo5as72txPlnTuXi+66Zfwdt5lNbGcH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX7XdYbCAw2ro+
 U121warxRYAAkdQU3MhEKlE+zchZOKklHb3Lj3LUQUwB63ll+2N49JnE5V8n71ynyuKWuQmqYwv
 YeUWN5uHyi18zfkn39iBYwmz2K52P/AlMgjSXIm25IY8Mcr5C0SliTmZDhMzxrhfDkpZMyHcTjo
 pv9euJQNJPaJlxX+GXCibk/fNJjakV57Y1v3reEq9Fa7LPki6QN3pgof4Ia/sXYUQABh2Q4Cbqe
 6HNKXX6xe3OPKE4UpdB6mJg5aCrbOMdmqkQJp0WqtQyWpmiSsT/Su1gGbIA344XnyPEpSBszHLY
 LJ8Ec01uXho9NBrP6H+SB0DLxMb+jDouK9UTgHbY690/xJGW8AX6WiN/IByOS7JEiI4ZEi1PjEQ
 fKVK+J/IZdRjr8nKJvVP00G+5xG+eG7uWO3KTAUoegx3rfFBVudTU12bxGg5OGPW7nE9y5VWs+h
 jdaH8J1VggrHfdvPNcQ==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942931 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NmgzoDSYu718cQv-uPkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfXzhdYniXON2cL
 kXX6vgpccfFhJd7S4aaWOGTxFnEqhnRlDITMmU7vxQyODE/swUckR3vZrmJu8IdIFPhuHrYzhDu
 gQrB0Hm6rCLy0i+6LIg0zfYZpbbGjENPm0VuOgoZxfztBxL5N62x
X-Proofpoint-ORIG-GUID: ZEsfh0mBzzHT6qWKLmQVbioRWnZBgfjt
X-Proofpoint-GUID: lkiECWqKa5pNKxIaprEbu2OEGKAVivwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244645

From: Sunil Dora <sunilkumar.dora@windriver.com>

LLVM 23 removed the standalone build mode for openmp, so do_configure
fails with

  The legacy standalone build mode has been removed

Configure it through the runtimes build with LLVM_ENABLE_RUNTIMES=openmp,
the same way libcxx is built.

The runtimes build reads LLVM_LIBDIR_SUFFIX; nothing in LLVM 23 reads
OPENMP_LIBDIR_SUFFIX any more, so pass the standard variable like the
other clang-family recipes do. Without it openmp installs into lib/
while a multilib configuration packages lib64/, and do_package fails
with "installed but not shipped" for libomp.so, libarcher.so,
libompd.so and the cmake files.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/clang/openmp_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-devtools/clang/openmp_git.bb
index 2ba83d48c6..90d4911623 100644
--- a/meta/recipes-devtools/clang/openmp_git.bb
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -18,10 +18,11 @@ inherit cmake pkgconfig python3targetconfig
 DEPENDS += "elfutils libffi clang"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
-                  -DOPENMP_LIBDIR_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+                  -DLLVM_ENABLE_RUNTIMES=openmp \
+                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   "
 
-OECMAKE_SOURCEPATH = "${S}/openmp"
+OECMAKE_SOURCEPATH = "${S}/runtimes"
 
 PACKAGECONFIG ?= "ompt-tools offloading-plugin"
 
-- 
2.43.0


