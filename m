Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E34EC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39170.1786095096375048150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jtfujAgt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26790c084f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6774ttdP2139394
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Aug 2026 02:31:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Fsoy/+gm6
	IVrRoA9QncoB0bjGNB30yd7DUh7Tb8XPG4=; b=jtfujAgtdgW0PchmZt2R7LoQs
	NKcT9ILSXgNjaikqaV1/VPRaYWO3I2o1pnIolgZ5b3fPMfBi+hqUcGsx4Hom3cNP
	J6DzKv6YygVCO7Efe+OEFi//qD7tk3zu9VQjod/AqVgvgaKS3Qni2poJNfaOFClU
	E0DXSTOdbr0Jgr//P3Ssz541BSRGYvtZYtS5jv6tdwM3lR6WvtKyFV5mFEYa86z1
	RNIu9Xo3sjNaDZJayy76xgtxpwmFYIoi7rEo40wswR34enJ1aT+bxXuAqPQspKB3
	TFLlGJVUz9+P+Pyq1Xn75VPYRYB4IHxoD1TBsyqKSfHAJ4Os3LbB3Q4p1li4A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgahavwn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 02:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JM8uCCpOiq9e3R/xAS/6ImvOIWcN/5m5ppHCSFCAFcwNfQmpXJbxMsSLmm4SayZ6YJhyUU28qEqV3No+UjHup8kSME88tzfGXrk67yCcRidJ+GVZGZewWwSlBM3I9u/pTW1vNtlD2YSbMPiw4irKANz85qkwBXzwezie51axuvo6vtvzkcBL5CX7atTgVoRCdDQAsn85od66KRHNBjUdqTxpw+sdMcSLq5hfoDd9UF6MWFCaoDx20avZPYl+oSHw1hNOaewzuKPXrfNSOddN58QfyDMfj+/lv6MHxbRAK1pBPB91ZUna42e+E1uc0mDm01wNtyWFXKFgviaqR+SaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fsoy/+gm6IVrRoA9QncoB0bjGNB30yd7DUh7Tb8XPG4=;
 b=qwR3eroefNZ3TuBba1NI/6YEu4Qmxn73OBWRrzyfu1SnRzyPs9dQN33ZRDBYdQxz5rHq6baJGiA4cS9ekqrSrMVyWgKAR9ceDkA5/QfN/DeilwggeWGdqgaX91QooCt0SHaC+/pcoAO+U4OvnJALPl9N31FednBuMFqjtOMTTQHXw4cRFtZwfcgvYM1sfi3uNItxtsHYsIIpSEhhEWkuIUCbEsUB+hZAazEzHaNE8/xayZXKlmhsqVkrSECXYlD/CaE95+PQZ15RywkbensnU9DekpPr0QJ+cCm66cO1P6zJaZwbXy+cuLRahWEcYmaFj9Aahf9wkJ8Fi1m2unbrEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 09:31:33 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 09:31:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/3] rust-cross-canadian: install target-specific env scripts and fix rustlib lookup
Date: Fri,  7 Aug 2026 02:31:14 -0700
Message-ID: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:408:143::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca1b3b4-149b-4c6c-ebbd-08def466ab98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zC2YKuC6pYXRLHfD8rG2u695zRi7AeYTK5NlMBI/b0+/6c7nMamdhb4uMOJ14kMMn4YSbsIGG8FoBPCaxACN6hg/cn/zjpztpfhcrI9PfZktg9enDAnf4POCjX3+oiaAPNdERKaiYf1NZewmY/CeRvCSr0QFGav6yAJcNlgqapUImUsPDGoIZxo2Jng4jSApLtgf8d5LtNDrT2o5m+9Hv3lJwcLhp31QmFVz0sV9EbXSjGrik8BDmHunC7N6qXhx5+bzWWD8KKYmpRY18MxPDu0lnPY5/yiQzf40EZ/OP0kzbnjHNlrY22UKBkIE5+dhAq8PhHemeX/t3vsBo0AlqPslPJIgvefgEVx7VMXrfPU21l8EPuddvUWwzmLladr4ScKJIJbVouEVuSkhNEB1tND6GpSLPZeZr+WsgYcD9nlq1rrZqMqlweCqKIlWgMKhXkVu3a1pEDDIqcH8f/5KZ0LBVVN5A8IjtAwgkFdho0S4yOt+KJtfPB4Z6hZUtSUSj5RACEUV0cxFhWItQdSsrTSZWoCsliDtV0p3gyr+z6KCzX3qGTOjlBQNzVr+yb8jJPOQm06EXJ5ug+3zshx8InWn5FCWFjC3qzXps383+qU0KX8s7lBZ/XZnRNyM+W+kBB69TeSdCw3M+Ue5Oz0CNz5kphJHkySBGPxAed/BOdt5KQelLmOaeVc6TXFWmIJsFA0bvumYDJfFTPsuFbLCBFGZoAXerTh22IjeYLY8jiY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HqIk58/xdfNBXyvsQPj/y/WGAVIUGjNda9KEReznf7rnKvtK0fAjTtOdhueM?=
 =?us-ascii?Q?ePRMiCbHJs42DQ/VqPJ2c3mjFuW6N6ryYRpPOzIAnPTMEsz0FJRH3Rk43B2N?=
 =?us-ascii?Q?qtfdbHFzWYuTBIfJ9pANKv16h8oX4+N7CB2Scit8ZkXPf24lF7DFyAjA8zvw?=
 =?us-ascii?Q?mSzUxiJg6hxL/KM+5v7hjYLMZC63y1/cBp/diZd5SRhB8q0a8IVgbvq7z+vg?=
 =?us-ascii?Q?Vz6YcQM4/QQbevjcW1gvwqSjoFZ/uk8X3sLKjzsMJ4viodXUQS1Sx28QzFkk?=
 =?us-ascii?Q?fnoPBJTgAt2iOoxM8ZGb9jx9YDISjSaMwQIBGiKSkWhbgU6WrdHDvgYMwjXD?=
 =?us-ascii?Q?9qYDOOo/ZcVOltMmPrwUfXW37kAQDzXviQmqPaotZSC31E+Fny7DHWTB0RHN?=
 =?us-ascii?Q?79V0dY4ry9SzHqyA1zKXcv2hDNNHKXnj3l64UY7KhnGPsMVmtmKxjgTcu1LC?=
 =?us-ascii?Q?LucVS3omZ/WILavA8vkMStVr3ai6aL/BoPH2a+ESs9xaLxRSMOZ1C5sLuojO?=
 =?us-ascii?Q?BnnGr5XIdK4y8jWE1AJOh5SXQHN4O+GovUKekP4957fOPAC9a7Cfi52x4kBk?=
 =?us-ascii?Q?y+xupQaYND7w8+gq/+F3tyqkcZwsmp3Z73Ys2SsVsDWDLiISgPWN7O+zlRRA?=
 =?us-ascii?Q?0nQnvmBYqnY2uu2PX4JulK9UpBjvqVqi40E6o/ELWY8hgGM9WiAhNdBcqluZ?=
 =?us-ascii?Q?lFDH7AumSXEaSAoKBQHliWgV4Y7ZfSKyfR0NY4q9emEBG8ZKYluGrFG0sRJm?=
 =?us-ascii?Q?5YrSyLfoOgI8ZlHz8ugZdhqfhBGqcg6SswA8Zk9238KWvYCpPJ8AoXWtwLHD?=
 =?us-ascii?Q?NtKxKTDgX4LwlMzkPtindKavnhXsHPplRd6AOEs5bXYKhucEWZRI2Ck1ETwy?=
 =?us-ascii?Q?YmS1CyzkjMrV9ewkGchKAFafyM+S6m9ilkEG1XTQV7sjyRyDXAE700SK4uxz?=
 =?us-ascii?Q?kAG5JTuVjornoqz4xJgy4OO/wlKCzRgCRqh2FXRGRaybZtEiAOzovKOezPaw?=
 =?us-ascii?Q?WsqZiVcPrsn5QhZ2fsYVdfVggVE8NqzXdh8uCvBXyL4oqdnovJqjczX0sDSr?=
 =?us-ascii?Q?8p+NLNWMXliXL/DTU8SuGrPhQ2J2y1YFalkk882PLzl9hDFsOu+T9BmdjLAR?=
 =?us-ascii?Q?Oq/oBCgxkQFO5K5x6RlZJ8RW7jmZC3aAZhYgAWG1DEGNrcv5R2KDeU/0IlTI?=
 =?us-ascii?Q?DO/HqbzOhpAgjc6ifBnLdXGwMRMgoBITxftRyqvIJR3OAhlkKZpVKbOPSdfg?=
 =?us-ascii?Q?onjao2tQe6I3+JoiGTUoqoxb/MY0gFEp2V/onx69jL6G9azWuueU/fa4yp13?=
 =?us-ascii?Q?ULyZlGQMTTWyVzDmx0Sz0RL1UormkJWb1uj1TdgOuK0sQS5tdHcOGiUooMQL?=
 =?us-ascii?Q?4FNxKeTd7Bitg2rxx09vJwUnY2fKcSF5g2qJg29p013Mwd20gmj48Lfnf4vG?=
 =?us-ascii?Q?AekTSOTwt8YefKshCZT/9aYPSaPT8XsHcCXsGeRGWNx2/sMgTMA6lwZXB877?=
 =?us-ascii?Q?oofqNIZiNfRuCN4orhd4FX9T7lpj69aaHzf2WkkUum+LNrrBjvK4D8tLS5tl?=
 =?us-ascii?Q?IlBRRCaCOW66VkafDZFEZxaA1qyQdg7sCi0XOePJJ6pl3rzbnthjEsF30W+C?=
 =?us-ascii?Q?CQiyw2nLpaSjCT9/zOoxIIJVBcxJrp/K6+Cfcr3aHUBqtquKLYSOmZwccO7H?=
 =?us-ascii?Q?YVDcotT3fEDno+oNZTdqzqTDmMWs5hL+S7I8Qs9o3I4zlK1yKQN9A1Y/wTyz?=
 =?us-ascii?Q?H6G5n/pef1d7+1Gp/YrI2C296HdpzPQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	J0RVFTVkiDup67tfEFRi83g/fAEBZ3LNy4aX7HLuH1YouS2hwryYI6zdY4rd3nu1+TupucHYkvO6blMsQ7gkQSvgfVTm9gJ6SoVDxemnpurHvbdqdy1yM8/J57tZIs/SaX9d7B3sPA+PgRhDPWl/jcda1iOqrSWBY4FyOKhwn4R2RW0bzXVa/fHwy7JHLCX1mNBIbb00z0HwrJBBmREeI2yz95GLvjKKbvKIgkXq8Xi+5cXJahAKcYySIZqFBIWtT24nqsgDIwATEyeIRuHX446DcEUVpXTlzPGOGRhSpyGGMq52iR2+UtfEKa7pV41joaIrmwLJnXRkOud9YCPAag==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca1b3b4-149b-4c6c-ebbd-08def466ab98
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:31:33.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjbTaYojpKRRpHXbGkMcq9lF64xRyquxJM3N/T/XlvV//7Tva2j0hWdPE2WBe1ZwVy45ctvMcJhR8dv7MA7IOMsF9OzRlDTFq3TyYqoRQUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a75a5f7 cx=c_pps
 a=COQGWIG0gBNyFO/LkKr7KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=dP0rivtKMYtKtO4shKIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfXydPAi1JZyRmR
 flM7tk5L1xABVtIJKDWd+nTDKWCpAi42rGBrNPDFgdNRXzVcZCIRt7TfZ8/fcM91FGvF46nFBp/
 Wib/aXX8vDxgWftzxq9N5h0d4JHV7lsMcGxkEfL/6TWXruRrO5lgpLzbV2Lt/5a9it+Eq58Vu89
 ikhmlJF+K2hveJU4CN5IIHZ2NckQ8nMbBxejuyctBqzPfjOMCdhOjFoIwRWZiqB2DsRzoAM9uzo
 aFfoSEsXSFmvhIVewEwbXkxPcjzoKcQ1PtKdJIbGkun9bjhASiaaRk6Gsz11EtnHR2//7MMP9xV
 kp/l1OUbKCnJFQVdG/0KzmnJHHKmhK5pmUp5B3h/FECwAHG26pcWALZ0Lds62pEOGD+uyVAiaxz
 9WFumnoycueOd/2FU1IZMCnnv28e4RZkc6fykNUxwUKKyTm6kwAOSg/LLcYqvg3VdigU8V+f8Gv
 10KS8K+hNxICetF3LOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX4VsSD7YYvlU+
 G5Gi5o8MjKvcsvdgOljjbDvE0kMDRWv110u/bwIbUbIMMhvlCeLMAYxZr8bPygU1cZTLOKaQmyd
 BXQ/SUBNwH4If9676nFjJ3hQwexyM61Co207YDhH3A1RKJC4fcDg
X-Proofpoint-ORIG-GUID: y9-hZYK3UUtPzJoOuSMMSWyG0Ngs3HjR
X-Proofpoint-GUID: y9-hZYK3UUtPzJoOuSMMSWyG0Ngs3HjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242992

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]

Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.

Store the generated environment setup script in a target-specific
subdirectory so that sourcing the SDK environment always loads the
matching script for the selected target, avoiding accidental reuse of
the 64-bit configuration when building for a 32-bit target.

Also update `CARGO_TARGET_<TRIPLE>_RUSTFLAGS` to add an explicit
`-L` search path to the target `rustlib` directory inside the sysroot.
This ensures Cargo can locate the correct target-specific Rust libraries
during cross-compilation with the cross-canadian toolchain.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f083bcda82..bdc63e221f 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,15 +51,17 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_SYS}
+    mkdir -p "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
+	export RUST_TARGET_SYS_VALUE="${RUST_TARGET_SYS}"
+	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
+        export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
-- 
2.51.0


