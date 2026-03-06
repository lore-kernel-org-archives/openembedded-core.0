Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DB3F01829
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 11:37:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67206.1772797030717075969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 03:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rKmAveqB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752549a871=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6265tWJd3350504
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 03:37:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=kQhP05p2E
	o8SQpthDquR5lEdyE2fba2m+fmGIiWSThc=; b=rKmAveqBUJdZjU76xSXsh9QeY
	d/CqhkuW7oztFlyxYzg6O+s4CeQ5DL3zD3sKXowLgIoCQdRZiunnr2FiGsdS7vsG
	mxYnBrqkeIZaN9ll4NOB4B9+IzZBszK9q3kp9gf6dcIPzhN1BeTyWO2sVwnD3CNY
	V9XQVrvaZz2wxV9+pn7eHimNawt6A2kBJu4EuwEHrR3nkiofiuuFhuodjdLw2N/i
	1LgtsbenS8SJHZJAJTkHG/pvtlBRa3KuMxrFyPoGENlaIuopIjwUM6toBSbGs1xl
	+NWvK0M0rHYLp8HbxocQHlTLWt/OM0w+2HTCrezA07M+eMfAbbBuyTD2k2Dzg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgqbge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 03:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtE8PKnzSM/kuzW3wEs44yhqWXMv4UBFYeoZquR8Tewo62oI34YMpz/osiY22YawzhPWrUpenv+G3cPQcCXYnLgvOtgaBZm8oKztAEMAtyZv/8qcpn5hW7I3rnBRujVAvBIKGCuuGGfhNa9RWsrdVxfXQ5AKDSk98YNgZXSdZPjjG1i6QU59K0iOp7m6WEdUZajHDmnU646aqqGuCOxrWzomgGLywFwmDpaZQA89pHyPfFS0DDgkp5XSvzPjL6R3Is3cGhUdvmk2zQup5abwRr8fesnILMLiPe/OJPLclo8OwnjE0fiTLUIJnOg1dxKUEYiC2XnwCg8eNjmf0BodHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQhP05p2Eo8SQpthDquR5lEdyE2fba2m+fmGIiWSThc=;
 b=DIynIK5Qiear0Y2vRwW4PZ/R2cwwemX+4s4TWqhq/1Aln/c4kVVzOy2Y1K2QyfJpEasMQslRL3pw1GH/c1xWqrljwCz4KH4n9kD0+p5ZMKN5m8LU+NSnVN2AJUUyDOgjdeUDRLX6SR/ykmBQTBctHwv+5zhY+dl2P61ZCSHz4a62BxIH6wKYW5z5svpiJZJG0Ho+P/Iev2i260oOWOw7RbHO849lR1xV50sb/y9uPnAymH8TCJ8C1NTSnEjUEt/50MAFkvqATAQNJ6UdanoP0g8lfABJUQyBI7s4VegalpUe37W8wbOeOwEE5yr8rHv9qP9vE6fBBGb+yuBSlHwsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 11:35:43 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 11:35:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Drop revert-link-std-statically-in-rustc_driver-feature.patch
Date: Fri,  6 Mar 2026 03:35:25 -0800
Message-ID: <20260306113525.3776820-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: a421850b-9bc6-46dc-57df-08de7b748017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	OgomCWy/9Hcn83eLupN0WLh8mOTjLMzbffezMIM8FjQ3b4NW5Nk2EidOG71rCfq/5WAAhK3vL6piCx7QuehnGWBGFNHAtMnRww7MIJAkMQ+Pebfda2wIeQUSfvl9hc+sqHZICrb8/GBBo2HSJu2qswnE7xI5S+T1yE3GUMlfIq6vzSfjDCsxHPIciw61awXfJsANivHfCvL1nWfMQqTwz1IXoVXkNpjb4QsQ9Fj4HjBCLNy1EEC/R/x137/V+xlNfAgZsIYA+BNFBbU6WLRLTKxAvinMk89JiUL8+ypR3jxza+MFBAE4P6rpN6eOq8LUUV8/QAaVngGWsiouvwUWhcGf0/EfFUV8CXGZf+Mg1VP1fjwLapX7k0Aooy7/ZR21W89RaLz7p+CDi7uJOBmiQzmwWIef0q9GrJfnFxoV4jOkcmvSr8tN1f4azgAjqlwBRmy3Dg3+khE3UeWQybCC7L4qk1+fcXYZSlsAJaMunZg64R41v8gi8wyNKbIKX344sa4Y/kytIoI4wmGni2LGbPprkWYs+kSTm0u+e+kTKF1W4rWAjfUbC1V+e3xxdeAK0Notv/x6EFHZ2+KFq8iGL9Lvtu0AxCIxAsA9zKbrE/iyg5rtmnNLPbJJAFfDPOyw1f1hOPBz5uciRR57BlaBXHGGmMgcLNL/o9AkEnCZ7KJ3NzMm2ctqLNacXRfbCiaIm/W1/79RCzeTKNGVobMooPkPnsDxk6yIhxMEaveneUNRWAmqj0BX3Om7DyKhAKJLYU+lxt9FqH1Y+3QoDtKKKjKtuoHiHVRspnSG549ZadoPcSJZGp0vASk2nBCwZZnZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3nv9jRK5g44I1uvlf37X/NlxJRAf3FnWLMKdOQGeqOxLjKLHceI6v8DzF+3X?=
 =?us-ascii?Q?Rypenp+kkbRAyuxAZsjmffSfr7HLC3JKnU9PhNyKGDIavNloMPKwT5kitu8L?=
 =?us-ascii?Q?EmbYyGxZnG8Ag6HFfK+GVgvTv9tQepLLXrhN0SFPHRrxd9z8seD+poHAlDag?=
 =?us-ascii?Q?SWufnK63bd1D0WoXejUNeF2tjpxIbG6qJ5RNfkWmFyW43NcpB3oscGmcLPb0?=
 =?us-ascii?Q?x2RQSQ/lLR9ec4UW+/GkW3td90wBtI7K368XTP2MZIO6BBaRpgxGk39YIoX+?=
 =?us-ascii?Q?+QBKRgdnKSoUPRqyhu0gtd5I6UQbwkpf1fhC3sOaD+K86xE5gGVSJG3Dxkie?=
 =?us-ascii?Q?eE4pmRfx/I3g4MUD//4jWxJN3M5tYpjVDKJLLd4U5nAPk8GCOPIVnPkucCsB?=
 =?us-ascii?Q?BJdPVOHPE+YvdBFSGrBWarlpejMV+dWQ/jIp3hYiv6LxuRylcKzKocov70z5?=
 =?us-ascii?Q?R8+UkjghWf7PwAefMtP/CyqEzf6G3PeoYLIpldJBd0yUF03lPr2B+QECJF+o?=
 =?us-ascii?Q?g6Pg+fl5Cw6pnMphl+aI5csYJ61N1Qz2FY7GMeDcDUYS1+2RI8H0ErZjugoq?=
 =?us-ascii?Q?zlgmI9+iuOXr3qn5rHpuqgXetmoDHO6scMuicR5ySmTgfEV1/ZsxXxgPNmJa?=
 =?us-ascii?Q?GNKvX2+dz0i4YT/557KXuqMlxUWcuEj/mklEjPC7PPKPAjJlP+xUuhg4vtVa?=
 =?us-ascii?Q?f46dYIzF+JLyhZvKECm/54z7xThpP/94pZdzg4MPR2ONWHC3u5TjRrDyQgGN?=
 =?us-ascii?Q?ZfjCGq68NOjHF3Eqzt1C6bEh+roKfPpE2VQFFpd2VraAVTuUXNTghIVYqMsg?=
 =?us-ascii?Q?07cRzB+pH8CXrdDIhKqkDqafglEgFxmrh4w4ZAFdxKnjHIs5kbDbfWVE/B9s?=
 =?us-ascii?Q?i6owbRUxtVa4lqgPgBP7wuwKStqVKgktfN81ne6MeTaHbpTGw2iGASilL38X?=
 =?us-ascii?Q?9Cp2AxF2foWmAQ8BETwug6M621qAyTr9zZfGKseZCKORXu7Iz6wMkUifbSFN?=
 =?us-ascii?Q?F2zAJuA+QBYQoCFFBAoFVACRomh1VTsNmC0jhe8yD+7uJHsxCGBc9lAxWf48?=
 =?us-ascii?Q?BZX+SYhdP9TvCJ9A+zar84YI7hmkJY6lLgvoJ9Y1jZBrMZMxS1rAutCUTN3u?=
 =?us-ascii?Q?+1AHPW7+pVFaQbXBCuNlvyLBw2qKcXVmeyPPQIoyGtB5RvGlaLXouml8a/Xw?=
 =?us-ascii?Q?jdEzh83TZhUHhw0exn0P0b5O0hp+osyguQ1renOns2AEjTPKiwHj6YdgeZcp?=
 =?us-ascii?Q?/26iLFuH0HzXztSV83a3AkERXWheU1//j9XSANtczW4pcGf2WylLV3EvyO5B?=
 =?us-ascii?Q?OVgdr89YqTUjSkyhWpn65RXgG6UIzQFxewuUGJrti60Xla7Wb+IsQrsE7Ee6?=
 =?us-ascii?Q?6lkYNPZbf9Mwdl72lxX2InWZJjA8yjM+erRTmKcr8t4KUJNHYkc1ASb/at6p?=
 =?us-ascii?Q?dq+OxG/iPihK88Txa0Zct4obE+xiSx3+MljuGA5eUAdQ7ZTP5JSyR9Ib/KG5?=
 =?us-ascii?Q?IUZyz2mChdaibTagD+eYBP2qw5Dgz+OuiUwF9z6pv3uyRJKjr3azHVMQLvTh?=
 =?us-ascii?Q?ejP0aXxb8Q/w/TymOiUowIII3BK1WXbqV9Iqf5EiKDBV7w65L02V0IRntIgD?=
 =?us-ascii?Q?mqBNfaxZHguBP++7aDK37RlnufH3ZHHmIsUnvsziwHbZCVTkuze8e3nU5enJ?=
 =?us-ascii?Q?YTHo7SfN6fDriWn8dNCVpLJGUMs8rn1iEiyVHzVIg+xSfsuTTPsTvNp5y2Xb?=
 =?us-ascii?Q?XpPCfTegbdsnqGTVI9DYI5ukhrt99NWbkc1Zmog97XFS4APlUkAd?=
X-Exchange-RoutingPolicyChecked: 
	OAIB/2548hGpdo+IaUhbV2G0IYUu8rnqBLX37Rb6ho+qWb7VRaPMIlaFbeYmg2ulXcm8G1rI9L0HAAaX2gxX2qw+9G5iSk37YAUMTwzNkSWT/N02q8+lKzaM6anEbGhQMem1yQBSPFLwBM46oFA+qwum0SurJzkezkoYpR6CSQ9wmpRizgGt7FS9oUwFGzkJWfA/cLKUa/CHibM6DfNL35eJI+Cxz2b1aLAZutgyN8iM/vSMCkFIfpjzs8xdwzdLLu9QC7+u7mxxvTE3KoKzbEeN1xW6MPOSg6/GS6unW0yI6VMs7kKtwqtr0Idl+ttATrjZ9yKydyLaUSld9vyYaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a421850b-9bc6-46dc-57df-08de7b748017
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 11:35:42.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtKoyBCrclVgNvh09SfEaZ8ejeFRPIqjPz8q/YCwL8UY1gB8G4IHopL0QzJW9EzVICMWa7j6QUJdFFER7BHsB4k7KHLbn7AKGOuMTAlenAnOoQ2Yyh6oIDAR+qWwt1vm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
X-Proofpoint-GUID: W7R7TJdvIZEBnhWCDNyS02mVqaqhJeTb
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69aabc65 cx=c_pps
 a=y6Y39UqQ09MdvbCyrKLMTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=Fg9b57R7TjaxO2mNtXMA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: W7R7TJdvIZEBnhWCDNyS02mVqaqhJeTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEwOSBTYWx0ZWRfX/aoYa7SjqLj0
 I2Ig1OjmnRIZmQWlMXl+DIzit0MAiAss7mPokh4veYuhc9MSRe8iKKOr4Zojire2NY8atUTDRRJ
 E1fPvevhEpU4gLUcOu/jaeZT/+B/LoqY5Cnv/3VSYXO1djypum23O0MFCyyDhq8H95Ds8oGINqb
 4dJTFDWOTVc130lJ9e+inGlKhEzWDLmcG7iqlwZKA2iDu+giHDJGzHUmn5CdjgimNs9l06vKi+Y
 1llLaAcMZl/PSNnzOZ2/LwXH9P24nHPTHho4XX5ZUjcvGMmMtLms9RcUYD7stjIS90gdpGM0v1P
 bmDLzHZTOmQ5wsHlFTqNixAuqToKhppZLTryjjagnEkwuO0vSAd2RiurgCe3wvhtaLfOYWvPA7x
 OBCtg6bGPK2PnSVirXGKuvEOs/cWrBkC5MIuPmWfzCoiPIqH1lXLfRucffOsWKj+HGLVyWU5+xU
 C/OKq9J1m8ahyZkyMEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 11:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232563

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Starting from Rust 1.82, std is statically linked with rustc_driver.so.
This change affected the runtime dependencies of the rustc_main test
binary, causing tests to fail in QEMU because librustc_driver*.so is
not shipped and cannot be found.

After discussing with upstream, the patch is removed, and the test is
skipped using #[cfg(not(test))]. The rustc_main function does not include
any test code,so this safely restores the feature without impacting tests.

Upstream Discussion:
https://github.com/rust-lang/rust/pull/153409

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...d-statically-in-rustc_driver-feature.patch | 229 ------------------
 .../rust/files/rust-oe-selftest.patch         |  13 +
 meta/recipes-devtools/rust/rust-source.inc    |   1 -
 3 files changed, 13 insertions(+), 230 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch

diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
deleted file mode 100644
index 9d345bc8b9..0000000000
--- a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-rust: oe-selftest issue fix with v1.82
-
-A new feature "Link std statically in rustc_driver" was introduced 
-in rust_1.82 [https://github.com/rust-lang/rust/pull/122362],and 
-which is causing the below failure in oe-selftest.
-
-Running unittests src/main.rs (build/x86_64-unknown-linux-gnu/stage1-rustc/
-x86_64-poky-linux-gnu/release/deps/rustc_main-92223b15c9f2d827)
-uploaded ".../build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-poky-linux-gnu/
-release/deps/rustc_main-92223b15c9f2d827", waiting for result
-/tmp/work/test4056/rustc_main-92223b15c9f2d827: error while loading shared 
-libraries: librustc_driver-fb0866b1cd913c20.so: cannot open shared object file: No 
-such file or directory
-
-The rustc_main binary depends on the librustc_driver-*.so file. However, 
-this file has not been copied to QEMU. If we manually copy the file into 
-QEMU and export the LD_LIBRARY_PATH, the issue does not occur. Issue 
-reprorted to upstream and reverted the buggy code as a workaround.
-
-Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/rust/issues/136237]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-diff --git a/compiler/rustc/src/main.rs b/compiler/rustc/src/main.rs
-index e9a7397557..29766fc9d8 100644
---- a/compiler/rustc/src/main.rs
-+++ b/compiler/rustc/src/main.rs
-@@ -1,5 +1,3 @@
--// We need this feature as it changes `dylib` linking behavior and allows us to link to `rustc_driver`.
--#![feature(rustc_private)]
- // Several crates are depended upon but unused so that they are present in the sysroot
- #![expect(unused_crate_dependencies)]
-
-diff --git a/compiler/rustc_metadata/src/dependency_format.rs b/compiler/rustc_metadata/src/dependency_format.rs
-index 39fa23766b..51d86b4009 100644
---- a/compiler/rustc_metadata/src/dependency_format.rs
-+++ b/compiler/rustc_metadata/src/dependency_format.rs
-@@ -51,7 +51,7 @@
- //! Additionally, the algorithm is geared towards finding *any* solution rather
- //! than finding a number of solutions (there are normally quite a few).
-
--use rustc_data_structures::fx::{FxHashMap, FxHashSet};
-+use rustc_data_structures::fx::FxHashMap;
- use rustc_hir::def_id::{CrateNum, LOCAL_CRATE};
- use rustc_index::IndexVec;
- use rustc_middle::bug;
-@@ -159,46 +159,19 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) -> DependencyList {
-         }
-         Linkage::Dynamic | Linkage::IncludedFromDylib => {}
-     }
--
--    let all_dylibs = || {
--        tcx.crates(()).iter().filter(|&&cnum| {
--            !tcx.dep_kind(cnum).macros_only()
--                && (tcx.used_crate_source(cnum).dylib.is_some()
--                    || tcx.used_crate_source(cnum).sdylib_interface.is_some())
--        })
--    };
--
--    let mut upstream_in_dylibs = FxHashSet::default();
--
--    if tcx.features().rustc_private() {
--        // We need this to prevent users of `rustc_driver` from linking dynamically to `std`
--        // which does not work as `std` is also statically linked into `rustc_driver`.
--
--        // Find all libraries statically linked to upstream dylibs.
--        for &cnum in all_dylibs() {
--            let deps = tcx.dylib_dependency_formats(cnum);
--            for &(depnum, style) in deps.iter() {
--                if let RequireStatic = style {
--                    upstream_in_dylibs.insert(depnum);
--                }
--            }
--        }
--    }
--
-     let mut formats = FxHashMap::default();
-
-     // Sweep all crates for found dylibs. Add all dylibs, as well as their
-     // dependencies, ensuring there are no conflicts. The only valid case for a
-     // dependency to be relied upon twice is for both cases to rely on a dylib.
--    for &cnum in all_dylibs() {
--        if upstream_in_dylibs.contains(&cnum) {
--            info!("skipping dylib: {}", tcx.crate_name(cnum));
--            // If this dylib is also available statically linked to another dylib
--            // we try to use that instead.
-+    for &cnum in tcx.crates(()).iter() {
-+        if tcx.dep_kind(cnum).macros_only() {
-             continue;
-         }
-
-         let name = tcx.crate_name(cnum);
-+        let src = tcx.used_crate_source(cnum);
-+        if src.dylib.is_some() {
-         info!("adding dylib: {}", name);
-         add_library(tcx, cnum, RequireDynamic, &mut formats, &mut unavailable_as_static);
-         let deps = tcx.dylib_dependency_formats(cnum);
-@@ -207,6 +182,7 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) -> DependencyList {
-             add_library(tcx, depnum, style, &mut formats, &mut unavailable_as_static);
-         }
-     }
-+    }
-
-     // Collect what we've got so far in the return vector.
-     let last_crate = tcx.crates(()).len();
-diff --git a/src/bootstrap/src/bin/rustc.rs b/src/bootstrap/src/bin/rustc.rs
-index d04e2fbeb7..011c289d93 100644
---- a/src/bootstrap/src/bin/rustc.rs
-+++ b/src/bootstrap/src/bin/rustc.rs
-@@ -92,24 +92,6 @@ fn main() {
-         rustc_real
-     };
-
--    // Get the name of the crate we're compiling, if any.
--    let crate_name = parse_value_from_args(&orig_args, "--crate-name");
--
--    // When statically linking `std` into `rustc_driver`, remove `-C prefer-dynamic`
--    if env::var("RUSTC_LINK_STD_INTO_RUSTC_DRIVER").unwrap() == "1"
--        && crate_name == Some("rustc_driver")
--    {
--        if let Some(pos) = args.iter().enumerate().position(|(i, a)| {
--            a == "-C" && args.get(i + 1).map(|a| a == "prefer-dynamic").unwrap_or(false)
--        }) {
--            args.remove(pos);
--            args.remove(pos);
--        }
--        if let Some(pos) = args.iter().position(|a| a == "-Cprefer-dynamic") {
--            args.remove(pos);
--        }
--    }
--
-     let mut cmd = match env::var_os("RUSTC_WRAPPER_REAL") {
-         Some(wrapper) if !wrapper.is_empty() => {
-             let mut cmd = Command::new(wrapper);
-@@ -120,6 +102,9 @@ fn main() {
-     };
-     cmd.args(&args).env(dylib_path_var(), env::join_paths(&dylib_path).unwrap());
-
-+    // Get the name of the crate we're compiling, if any.
-+    let crate_name = parse_value_from_args(&orig_args, "--crate-name");
-+
-     if let Some(crate_name) = crate_name
-         && let Some(target) = env::var_os("RUSTC_TIME")
-         && (target == "all"
-diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/core/builder/cargo.rs
-index 0688a1d689..066e6bf53f 100644
---- a/src/bootstrap/src/core/builder/cargo.rs
-+++ b/src/bootstrap/src/core/builder/cargo.rs
-@@ -1146,7 +1146,7 @@ impl Builder<'_> {
-         // When we build Rust dylibs they're all intended for intermediate
-         // usage, so make sure we pass the -Cprefer-dynamic flag instead of
-         // linking all deps statically into the dylib.
--        if matches!(mode, Mode::Std) {
-+        if matches!(mode, Mode::Std | Mode::Rustc) {
-             rustflags.arg("-Cprefer-dynamic");
-         }
-         if matches!(mode, Mode::Rustc) && !self.link_std_into_rustc_driver(target) {
-diff --git a/src/tools/clippy/src/main.rs b/src/tools/clippy/src/main.rs
-index c9853e53f3..c9af2138a7 100644
---- a/src/tools/clippy/src/main.rs
-+++ b/src/tools/clippy/src/main.rs
-@@ -1,6 +1,3 @@
--// We need this feature as it changes `dylib` linking behavior and allows us to link to
--// `rustc_driver`.
--#![feature(rustc_private)]
- // warn on lints, that are included in `rust-lang/rust`s bootstrap
- #![warn(rust_2018_idioms, unused_lifetimes)]
-
-diff --git a/src/tools/clippy/tests/compile-test.rs b/src/tools/clippy/tests/compile-test.rs
-index 9754254cdd..dd95cc71cd 100644
---- a/src/tools/clippy/tests/compile-test.rs
-+++ b/src/tools/clippy/tests/compile-test.rs
-@@ -1,4 +1,4 @@
--#![feature(rustc_private)]
-+// warn on lints, that are included in `rust-lang/rust`s bootstrap
- #![warn(rust_2018_idioms, unused_lifetimes)]
- #![allow(unused_extern_crates)]
-
-diff --git a/src/tools/rustdoc/main.rs b/src/tools/rustdoc/main.rs
-index d4099cafe5..5b499a1fa1 100644
---- a/src/tools/rustdoc/main.rs
-+++ b/src/tools/rustdoc/main.rs
-@@ -1,6 +1,3 @@
--// We need this feature as it changes `dylib` linking behavior and allows us to link to `rustc_driver`.
--#![feature(rustc_private)]
--
- fn main() {
-     rustdoc::main()
- }
-diff --git a/src/tools/rustfmt/src/git-rustfmt/main.rs b/src/tools/rustfmt/src/git-rustfmt/main.rs
-index b8b0432aa9..b5bd71e015 100644
---- a/src/tools/rustfmt/src/git-rustfmt/main.rs
-+++ b/src/tools/rustfmt/src/git-rustfmt/main.rs
-@@ -1,7 +1,3 @@
--// We need this feature as it changes `dylib` linking behavior and allows us to link to
--// `rustc_driver`.
--#![feature(rustc_private)]
--
- use std::env;
- use std::io::stdout;
- use std::path::{Path, PathBuf};
-diff --git a/src/bootstrap/src/core/build_steps/compile.rs b/src/bootstrap/src/core/build_steps/compile.rs
-index 27bbc8bd8f..a6fc4df2eb 100644
---- a/src/bootstrap/src/core/build_steps/compile.rs
-+++ b/src/bootstrap/src/core/build_steps/compile.rs
-@@ -2158,23 +2158,7 @@
-         for f in builder.read_dir(&src_libdir) {
-             let filename = f.file_name().into_string().unwrap();
- 
--            let is_proc_macro = proc_macros.contains(&filename);
--            let is_dylib_or_debug = is_dylib(&f.path()) || is_debug_info(&filename);
--
--            // If we link statically to stdlib, do not copy the libstd dynamic library file
--            // FIXME: Also do this for Windows once incremental post-optimization stage0 tests
--            // work without std.dll (see https://github.com/rust-lang/rust/pull/131188).
--            let can_be_rustc_dynamic_dep = if builder
--                .link_std_into_rustc_driver(target_compiler.host)
--                && !target_compiler.host.is_windows()
--            {
--                let is_std = filename.starts_with("std-") || filename.starts_with("libstd-");
--                !is_std
--            } else {
--                true
--            };
--
--            if is_dylib_or_debug && can_be_rustc_dynamic_dep && !is_proc_macro {
-+            if (is_dylib(Path::new(&filename)) || is_debug_info(&filename)) && !proc_macros.contains(&filename) {
-                 builder.copy_link(&f.path(), &rustc_libdir.join(&filename), FileType::Regular);
-             }
-         }
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index e96598fcce..9cbfc62b35 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -6,6 +6,7 @@ Upstream-Status: Inappropriate [OE testing specific]
 Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
 # added executable-no-mangle-strip.rs ignore
 Signed-off-by: Peter Tatrai <Peter.Tatrai@siemens.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
 ---
 diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_errors/src/markdown/tests/term.rs
 --- a/compiler/rustc_errors/src/markdown/tests/term.rs
@@ -266,3 +267,15 @@ index af44dfe..e6674e5 100644
  //@ ignore-wasm different `main` convention
  
  #![feature(lang_items)]
+diff --git a/compiler/rustc/src/main.rs b/compiler/rustc/src/main.rs
+index 89c61cd..144ea0e 100644
+--- a/compiler/rustc/src/main.rs
++++ b/compiler/rustc/src/main.rs
+@@ -38,6 +38,7 @@
+ #[cfg(feature = "jemalloc")]
+ use tikv_jemalloc_sys as _;
+
++#[cfg(not(test))]
+ fn main() {
+     rustc_driver::main()
+ }
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 2fdc35e083..04204969ba 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,7 +6,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
-            file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
             file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
 "
-- 
2.49.0


