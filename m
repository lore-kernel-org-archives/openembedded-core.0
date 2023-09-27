Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BDAE810BA
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:14:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13949.1695809677966478191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mj6u1N9a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7634b29f18=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R6MDWZ019196
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=xYXBIY6c1FSR+nvp/p
	b1Jhg2hfFSi3XMfLoW3w89stg=; b=mj6u1N9awRr7ivoEfa9q+cu6MJ7XNHubfk
	5EtFDefqcM7w2vNHVBejm7GN119o2mPZke7dmEx+j6dAsFFd/2Im9ZPddSlYUbs0
	3EqA2WjvhiaLW9e+ihgZff/VoaLD8iwbxj6t5idAEv400/Nor8TtujJR7zSl1cIF
	GuOL6y8OebyWxv2aUpOu692LT5BoyB0191h5Iza2+MOHRSHVt/NqpPcW0PTXqqNn
	4WB+VMiNv9s5xFW1w0p6g6EdZJzYHx82DgN827DGfzzP1fTMT+UQO6k+AUhH6wvO
	hAng/GrIwLXCBTsB983QcnAWckUlUjqFuYxya22WFXOhT6vJej0g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06bquu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:14:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRx5aNrwohiIKFBfeMc2tNqqFC/rCDAd4mNRJ3xoMcMuiAaPbsgQEso8nmbfGOU0QnlC1T+s0eqVEHwUEJLTSutOXh3mtal7AsNyHKXlCsgDLcPBwtEMNShl8P7Hf9PORgWKcmV6GKf5y6HYjz7u27xo+0jaeGqLghPC99RCV6v6jQGURa13B2sAonHIATSWMnBmNjvmJ5zlzhQ3ZHM8b0YEE6o5ueKAruTFjUbUURTr9vB+9AUe0F1LHB2WrAqve2VN3Oo5tOHdo1nNDPwKG223lNeQudgvKV/gwXepaTZfA8CZ0X4tYWX1VQKtJbxQkESnFkha2mb96hek3o2LMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYXBIY6c1FSR+nvp/pb1Jhg2hfFSi3XMfLoW3w89stg=;
 b=MElvdKANNkbWhX0znOlgUxUXkVcT1DHlaA+4l42hDG18a3xprHM9Wv4W3cNrYafmw3+1vZrux8Bm4+9XkThcrUmXJUZHoOvsaRWRwqVp5JccBW07MuNTVhNBhgPJYSRhOtvEgsnOPLoXk+9dC9snlg8QUioWUWSvw7QdAaGq1FRAojChW2jUlXE/BYZZUAfvc+tW6ej4dlvDQgDIPSqEZS595ZZJDpwqeOehYHao/2EUxC/IUb+0p/uuO5BNfWTq+2Dluy9q1BPL9NyYWJQeus+09iMv5sb5qMSNhFRlbAn6kLzyUnrwDENbMN3PIAujg0xA/emBQjpjqOMAy2i2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:14:33 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 10:14:33 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [][PATCH] glibc: stable 2.38 branch updates.
Date: Wed, 27 Sep 2023 03:12:43 -0700
Message-Id: <20230927101243.269982-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:510:23d::18) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d1d4ff-cb05-40c6-7508-08dbbf427f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CgD1wbR6qu0iL0CGeaV35Gyhi22kI1iE91OKht7hO/hK4yl2mJWJMXw+fOT9V+EYK/Uyic2BbD5RwIHiPgFLlgbV4bv9lXNIy08GdVkWWpUwEiCDrnqlr3OPChLUa2EUe/+9PHF9iQQb+XMvYGjFH9BSdlmoLCNgRAEhi2DDIC2tmJYLcQAcyAKitOr8e61Jr4Qk5Rj88YeFeyAw3YA+NQBGHMvLgP8QK5V8aK2lUIefOlD4Bh84F8nhAiA6eErL93/sR+TjzBz6E3aTPyDBh6Np8XvkZNbvaGnZER+XFlyZvmTA4/GB7KTuw8JR9RrQb82me/g2Jo3FZasCxethfumjGJTHiCE/anMMaBezNXPUkLWOO5YTDLSvhfjpU7/C4B1ZNiWv0ilYZHsgsje96aDlHcG5nJ60kYf12SCXqAWcVmJpuzXcMFf2SJqT8//HPFjlOlxiisVa6SNiwUKZD9ViPoiamcrRJgvkF4ED5mxzPy8VqXYmHVBYBommJw1g0KRsdg2I1d24rAcZjsuESj6Rar/JGr02CT4DCn8o7xTiecbPFyqCl2fgu3CLiMJMiypLBETVguIsrZFqiwG3TmyfeVR2wHqtwEfFGfYjMRx3WimVKj0b9cVle+tR6DMC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39850400004)(376002)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(15650500001)(316002)(41300700001)(26005)(2906002)(8676002)(5660300002)(478600001)(66556008)(8936002)(6916009)(66476007)(66946007)(4326008)(6486002)(52116002)(6666004)(6506007)(6512007)(1076003)(107886003)(2616005)(36756003)(83380400001)(38100700002)(86362001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MOg5EJlterZ9d+24CP0pOdr/8zq9wtIXEalh86wbB5Cieg6e811iVX1Z79VW?=
 =?us-ascii?Q?YUXlklRuu6nCB13HySGAr3J7XGMxaDifbvUBrmwOXHRpeQOv6jCPixpj8/NT?=
 =?us-ascii?Q?glOiMd8w05Z/LAvSbh2G+u6w7ubs5aSJHXaOQhZjXLfKA91bFCJIBhgOX3XW?=
 =?us-ascii?Q?mdXnGnycEbNlI5a+lwoqH+z0uFPA+XW9sjj7AsunVmBmOSXN2toFZBt37Lzn?=
 =?us-ascii?Q?z6iTGrpMfmEXHvtVIDgq0QT1K4ebEfVZ6yvtXEH/y7CPTU+ekvWxKlmv2T1/?=
 =?us-ascii?Q?qr6Ul9XuxJctu8Z5z/EbyG0QVCk2mLsKEZZPav/xzYygbF59o4qdkLNLUTQC?=
 =?us-ascii?Q?6SIVOESxZ8gluucZ/Qfw9XzA93Fjro3IPsb1/BM71uclW11t4tqQ0DUuaBv6?=
 =?us-ascii?Q?t80/IkCYILSAVUnP6aJ6TOPrOiunAc5NgpWVx91PGBgNmvbYy+4cejP+OEZ2?=
 =?us-ascii?Q?BwU+arhr02UDAozEuoT7sjfPgADqcjOYqZgW19EjPxIFHSyrWmUTKbN+TgJW?=
 =?us-ascii?Q?nRSx9GIpN0us8TqsCqcPHFA82Gg1XNLx5aQCTatoTzW30OhF4bZgShdTqP72?=
 =?us-ascii?Q?HFAmc6SUFeVuSoURDKrjf4lmr7Wx2ZX8OtbsTwVdPfxgZqru0pMbw8onyE+a?=
 =?us-ascii?Q?tIhtYVmAoRNMUj5kRwQggVkUIOHTrMvtb9Fi1rJHS6fAIHJ8QsZ3GY0rgp8x?=
 =?us-ascii?Q?y6ZjcxeYRMYTI4VDmgxIWyjNQTU7PI0XBLW5/NU9wnAz477zRa+SD1GJZJy4?=
 =?us-ascii?Q?k0OAH4P48RaIl2gHayvmcsu7RXMwPor2mFim/CpQnnGNEpnXZ/ClUofU2u6s?=
 =?us-ascii?Q?4YE8+xhlveNZHdvh8jLu1Tz6JbEOD6WEYLKGVbFom9nhvilh6vdYbunNyWTd?=
 =?us-ascii?Q?JU0rNKL8A2SBf0atiIkxSrig+moou1IILpKasSj/BEGoUhvcOJJuxJzysYOQ?=
 =?us-ascii?Q?uVIKhoGBmPlqeQ0W/JMAWumKnY8Ngf8qQo+NhFhNTVAYbcp4Tmo4wfnvLrR8?=
 =?us-ascii?Q?wKTB/wAtZvFVmzlVRUX0TlPBSacijXYiq+VZnDPma12PA7FZ19RDV9ScqDWl?=
 =?us-ascii?Q?9P9+YPfTVIYgCozdJG0nUomRTXkpyyBrZhBnoUCAXnmcD5tPvROkTIICEWy4?=
 =?us-ascii?Q?HttCX2EWFmAMGyqcXhGG8jAWkZMyyOHvfFgmQba9Zse3FQVUPtGuLkahW8UT?=
 =?us-ascii?Q?g9RFu0RWAjDIV5qoMVGCaspU1vkxCIZLLtwzMocX23WLwm7dSCJV2jDnWXBE?=
 =?us-ascii?Q?nnnoz0VdhFywfJKA+VYMWBIouaMoNrXw8uuNPMmQs9ciWSfXHTZP3wbSe5Ws?=
 =?us-ascii?Q?7BsWeBTn7v6k2pylI17irSNUSFJwRaAuvizkNp73tUkXdzTlxQ3YcQG6t50p?=
 =?us-ascii?Q?EA+dNZWFDEZhtm0U8yaO55WK7SUNQ15AvTo8H2Me4Ks7WXehznxQ673fdZ68?=
 =?us-ascii?Q?Sez2awNcvBzpzbzxV2ggKfwZM2sGqzqVXSFvfSvFOdp8K+Umc1mFgUcehQT3?=
 =?us-ascii?Q?yL4A3S0GX43CDAIe1lHJMUsc4MiP1yZcfJR9NLcKhCB2yJW5Xw/8X28KJz+l?=
 =?us-ascii?Q?8a+/J/bLDDr1xvtzHGwFV2Lgjr8WP4E+OElYzXYkqZeX8eqQdCoYJhFN1kTu?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d1d4ff-cb05-40c6-7508-08dbbf427f8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:14:13.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxM3nZmq8tdXSDipkb7hgDBob+yOD4q6mr/AMLQE25IcG0ABVnUe9jI41d8fnW1gzWdO+iKA5QfAZXqqXHTyeHKNmZCZW/Eejdi79CMI1Qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
X-Proofpoint-GUID: fouQy3mucqIyWI0ygXQTdtakIVdamlL3
X-Proofpoint-ORIG-GUID: fouQy3mucqIyWI0ygXQTdtakIVdamlL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_05,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=627 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188296

Below commits on glibc-2.38 stable branch are updated.
0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manual/jobs.texi: Add missing @item EPERM for getpgid
d94461bb86 string: Fix tester build with fortify enable with gcc < 12
63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug 30694)
00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
89da8bc588 NEWS: Add the 2.38.1 bug list
d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in link map
750f19526a elf: Remove unused l_text_end field from struct link_map
a3189f66a5 elf: Always call destructors in reverse constructor order (bug 30785)
7ae211a01b elf: Do not run constructors for proxy objects
92201f16cb libio: Fix oversized __io_vtables
5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a907444f50..f5ebbb2ee6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
+SRCREV_glibc ?= "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.39.0


