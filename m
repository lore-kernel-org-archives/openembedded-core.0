Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99B8C8303F
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17995.1751441360923035569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56255i3N029311
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 00:29:20 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3sdr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mb7ZprbuxkHvrMVz4GiRhuiG25BIm3ZEGr8ttovaxUzfT4Zyx52Gn+pz6pIx2l0mwrFMl2T4RGiCBP+dWMril7wz6Aw2fzmK82lGjjigPl4HWHKMzJ6/jQXMzCHRuwsrB0/ohcdfavmKxSW3UpzgDoTYfNhw+vJG9SaFA6t81Tv83/DpI/ndSrSLNvBOCpsPRFPf0Of9akWLs3vbOHmsTrp+nTe1SNlF0elzmU6VDt8/EjgkvOgq7x7BhGJihpE5+6yJ0Z8lZfeDBlU96Fogkr1BvJVgTBPDSJC0iThd9i4LDpVpHnv/2Xc9JqKvEXJz31344N9cvM/BCmnqMF00dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmOhjYX/Q6nOnPkXz7l70YeurEgbeg/X5CUMkrWaPLE=;
 b=XyoDYMkMAlvJkZocMIa+Idy8/NM9sg8GpIdu0pYamjeJk0TLWgqKhVg2XCxr3bub+axrBz4XomZYqER4qW1PwcO3oRSFBJFaNiQZtqjDJwTKw/b8zQ2WUBPkzKEDBefJrLGefdCvSxI5sVAgsYGehBlwT4EhMAWShYEusJQplDgzY/IqpsTLDxqVXmYC29YnJF6CSizgvmiurICXieMgNx3g1+I1rHOGUghRXaKKg+HQlTMWGT/tYFenaBQs8VzrIfhWD2JlbMT+RnaQNEWRBmiU/1n9BZV8GrwZtTPAj75lOrecCKYfG7hakWB2V2Ih3CVj3z7o6H48cgeZ1QTB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] libassuan: drop -unknown suffix from version number
Date: Wed,  2 Jul 2025 15:28:56 +0800
Message-Id: <20250702072857.1267224-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702072857.1267224-1-yi.zhao@windriver.com>
References: <20250702072857.1267224-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5371e4-6bad-4fd8-209a-08ddb93a2807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P2UvD9wbFKyujIbDNLTCft6yYetVMaPGZRpZ4GebMmAHa8MZIqLz8wNQ6xy7?=
 =?us-ascii?Q?zYP+DEetTAoJeVHpOBEZEgwscbOue08KgtcUB5iQXtdRQJTEx3JZAAoiEP2a?=
 =?us-ascii?Q?oetn+uJhlyp9jjqEb5hbbgtVwgq9R7Z4Q2f3kuKW9fORj+1+6ylyvSHa9aJG?=
 =?us-ascii?Q?bM9q6fojMhjX0GZqk/3mE9vsJuowYwCgGcvyGdEddaCqW7q5VQNF1vJwBH8N?=
 =?us-ascii?Q?/4LSM9Mv0IG1me10FJT1u7TlgR++OetaNCQolpcsOf4rKhXFIz9+iX3JqbTW?=
 =?us-ascii?Q?/U4I5qgd09covYPh34eF2nBPhh66rewUH611eghC2wYipm9HRYvUMO11+M+o?=
 =?us-ascii?Q?+8WRjvKT6o60IWMTWuKDIo0qkvri4Cl/OrAJD+l8oVSTzWo2DJcN8dFjO10T?=
 =?us-ascii?Q?9GtsRdufhX+w4VTccvMr/uTuRWF0ryNu0dCPd0TuFqEr9ra4CeK8rtgzoR7t?=
 =?us-ascii?Q?56fqixMNBGMk5DoeCXX8iqZx24S7p7TkbzmTsdiP9Mj5SFISpgEQo4cZfZSx?=
 =?us-ascii?Q?fluLq929tCZnEPufxtF+oXTh8DpzYMS9eXUu0wN4Lm/y5N6PtOMfzHvNaHv1?=
 =?us-ascii?Q?mN9eyKbazkVyp9YWzghCPF56B3bxKWZs8+4E4RgV8Li7SbfWQoXNJgY4NxwJ?=
 =?us-ascii?Q?S0AtGO8AaGvg9dB3hxvFPofyCWvkUPfNklODQf/91SB/ywMOT0fLgpvapRdP?=
 =?us-ascii?Q?OfeddwT3Yo6sytwu90vmtGnOfHk2+jgEvev+/5SGH2dQl2Dc9QF7Fs2ziG6i?=
 =?us-ascii?Q?1kFW3N/RAKYuWO+GcDnC5CHATND80tgWjEY0AAp+sm7UoFpIFnDaX2htzFdQ?=
 =?us-ascii?Q?FDdv1MJ9MDGLbtE1Ca28E7Ovgn3BtGG9LwkGTZeYhbxDM419xWRrjvrgtoCr?=
 =?us-ascii?Q?8M9hi//LlwVxLNVbFtdK05chYVy1vZOtwrzTzpiJCSCXR3qzeJ5d8WJSKUlM?=
 =?us-ascii?Q?ljEM2wXX8fLjZuxP0b5DN/aoQp6mNZ0nAfCJzLG0cNKmyIoC/SPyg67ZE2m0?=
 =?us-ascii?Q?sxULdozClNJnTEE5V5Ph12neu0XweHw9Ec8zYNG7Xw882FwQyOeE+ezZAgWh?=
 =?us-ascii?Q?92h6HUvbtHJ8AEkAiGKa0uELoDeaLYTA3hIJFC4GEk5XHRy796bSVz24oRm1?=
 =?us-ascii?Q?xsizJSxPbWsT0mTx6n5nmkCz+nF3SKoLshGOrX3syJCQNuERJM8eQVKrCwb/?=
 =?us-ascii?Q?hbjE1S61Mu2KdA7FZb0Khpr/mqMDKWe5CPOjigduAevjdIg2IwTkd3ZG6jYM?=
 =?us-ascii?Q?aMZrvwLqvEAhQ3qX4tpCjl6eufuMCzIPZSqdoalP5jRE2Y7eeTOhqLbHRNRm?=
 =?us-ascii?Q?JnzyB9ABy0yhxk8TdtuGdKjSvoH5ejbWIREzMRUyoiF9fV3AwSU/tgq7ap3z?=
 =?us-ascii?Q?pqha10Dum/SGwvRzIElKoQkC4VsCaxLwr4EkCcw09KP6nHh9VvkpOGHHFxui?=
 =?us-ascii?Q?OsFOIBGbO3A1RjWqTyaRH2/7c4m9VCTaHwCynvfNDdi5nNFWVEWijA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ajgskhvVL5DdaBWkO56ISMV9VPYe9RCbHyUNOfDJDpov7Z+OlrIod+qEHxVu?=
 =?us-ascii?Q?VDPZvApwlLe118ve2MN/hLh7FelPLxp5GgcxvaV1Mf+c/vkkjyr6GlY0l7ty?=
 =?us-ascii?Q?lSmIikXiRALkiNAsnTgnYoEQSNPq4TnHYEIejPGwZUP9K3KWvYRyZSIm4E9a?=
 =?us-ascii?Q?DONmxtj2WHH/51jGA36LDJFAdVBl1tYn4p3djrj6hQCV28D4xHp5Z+m4aevK?=
 =?us-ascii?Q?ltLPdu/SdANcaBCJuL7EzlOcPiew8eQvtCpj9Q7u0LYDq0lv15UPdE593hHH?=
 =?us-ascii?Q?ziWpkCB6IfZxKt6bVOxP5i4aWDCHbrzE6aUYPvroDvK5Ceag1/Iqe778Iv4Y?=
 =?us-ascii?Q?H7q9WCnK5pweI8BY+bWoxp4b7hHaC3MkL9NbdwCODpYTnCdb3f5+L1eGTXdG?=
 =?us-ascii?Q?qa5w3mbzzf5umXB8Wjv2O4/pXzsQLZ4iq6DpkPMJJVTH5lswwkT3wve1Wusf?=
 =?us-ascii?Q?gJB1mZX0tW8SkrRhlQLPBXOF+F1iYzRQdRhxtC4vBc2NhDtqWjVk8yyissR7?=
 =?us-ascii?Q?Neb/7LX9yBtlWxN6gaRs2DSKsfgmnuSweo6kBfkQVFPAhdJ4ajxIX5V+Rxp0?=
 =?us-ascii?Q?9eOqquuKlWLxvBxZSZvHx/Wxa5dN/hAnjIGeeA8PksXA+dkdmv1SOxILQZKW?=
 =?us-ascii?Q?IGQBzKyjtjhyZUhteOSgD3t1lbipL0svgf0JgrOtb20B3uS5yu+0bgxAk9Nh?=
 =?us-ascii?Q?h6HPYajWCxDIO5Wix6PNyTzU3wvJGpp3igNgybLNgRTmfY185HcfwLK7/57v?=
 =?us-ascii?Q?PXM7iGgU4tTjkF7e+180XpyeJ8FMjRJKwPFR/LMLP6dkOyc6Zbwvo0ghV3yy?=
 =?us-ascii?Q?C5e5hXAHGlufIzDZuDdk9oA9rbYPdXSkOwZg8kPut+4qLCBhiXqSdBN99Iyu?=
 =?us-ascii?Q?nB37HLf58G7M9X3YA3z/ebMkFlIRrBSQRXI2jLMzLcXJWvcuORsfpUUgEVQr?=
 =?us-ascii?Q?Ox1OuqvaTE+Vqlyq0Zm9unos3n3iCIAQpOyhoZDII/q3SJeAD37jlRaYjiqv?=
 =?us-ascii?Q?UIULoV9nt4uCFs7wyUiyk56b6kqtVJeQzJETvuH17YItpmlrfabFsGOmjm1Z?=
 =?us-ascii?Q?jyqEWxVPwTBBTnRRCu5+msy1DuhqITEHsI1neeqGb4GZTmol4ENkFAsMmeKm?=
 =?us-ascii?Q?p6JGD7PiJevTS6NTmx4uAjfBKZnF3drf7vlX/voHGz3isSv1U0aDGUmlG0bI?=
 =?us-ascii?Q?o56QzX8WByYTddwzRB8+4DmuDHaZ5nTePK09uGFiOdskwQC+EqdY5KKVkYDw?=
 =?us-ascii?Q?ezCBaLXtjXI9lq8RhalNxLs7M6UqnYsfHGATJtpRHmbpXKhZ9wEND94vRRCl?=
 =?us-ascii?Q?i8s0WCAVwnai2xpQK3WZBaaENguS8ObMBSRrN6hNst0azPUWjRrnDU2zdhEf?=
 =?us-ascii?Q?8bCGbhETSL+fGGR4VCGvBCOo6oqIr7gTF7AzHsVxASYdwtb2gsD1e2nFe48h?=
 =?us-ascii?Q?5pP+IhYIzykNTqADLHpMfpzdwnhDsnIaeMAAvgtVgHL/M5MPD4twvBXN8jx9?=
 =?us-ascii?Q?BeIVYjvGmp9XWzPUwZ8VIBs/arfbhWyQT51CQckUQkD2RHq6Xly3oPXxTihA?=
 =?us-ascii?Q?/AQpWJz2c5CkxUehIpeQDLW26iN5SZbuYIg3kpjH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5371e4-6bad-4fd8-209a-08ddb93a2807
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:19.0373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQyN7MAYjiDWZXxYsjHmlOl8a5HtFjimMXiszmXQf42k/Mvd9w2gbfkgsc+ISw9rhoXnwwyvWONdf9ABu4cVnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864dfd0 cx=c_pps a=G/B0QxK1bSvZD8IHvtZvbQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=pMHwIdcmaKMaBpIqFFUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oNrM35qxJ4JG5P3qdeeBz3-uzWyV0TyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfX7rF0Ro0UM4sL 0mGG/8oi5obllsyty+SIy5p4QoQerRQhrjeSUJNAt511K/ESGpe/66blKUNp0R8Wtg2I9PmiTA2 TItn2wZxOY3nBkloTwBJA0kb0AL9DBrSbByo0l+wVFBNmpny3rXxJVEu3+LTTu4n03RSN+N6cXz
 xlhuaAwKYYW/glYb8bcjZLs/s7EHL3U0REYEeJxIeB0qSxewlP3nmaEFpAYWQCO010SeBcuNjRY CPu3rfJV5t0nsB1zOuzyNdC7ym6f+qxoSdxxJEJQlmio+N/ims9EvGSUzXg4fvzvA3k7FPSjmXz mdkN+qsKg5RK6hfjLyLeb378vpWUkp6+YdIfClBUFhW7UomLEmrJwzPt0LbTgsngWP4mFX1Xl2z
 0HppCkQlmaun6G5N+4ye7Zo2tZUzPySBh+STc7WtKSpfpUxYN6gvuxTQUIngFebBXT/ezmep
X-Proofpoint-ORIG-GUID: oNrM35qxJ4JG5P3qdeeBz3-uzWyV0TyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=791
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219798

Include drop-unknown-suffix.inc to remove unknown suffix from version in
pc file.

Befor the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libassuan/libassuan_3.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
index f0b7746284..0d2ccce989 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -26,6 +26,8 @@ BINCONFIG = "${bindir}/libassuan-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
 
+require recipes-support/gnupg/drop-unknown-suffix.inc
+
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/*.m4
-- 
2.34.1


