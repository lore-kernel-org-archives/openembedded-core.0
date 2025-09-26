Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEBACAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:37:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12134.1758872243289759595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ELsHiyEI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364bc4f4b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q4tDG91645808
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oJvIjs280WkjaM8c3jgl
	8eFR35mi/ASLuYiNiwYMhq8=; b=ELsHiyEIgHs4Fn4+sOTsK4G5p/imQpfrgR5q
	12SvMc1ugmc1iBTsW6+YahFwLXvJcJPJc2UILMd0+Ywp2RqVTcFIKqEodsTW9uFz
	cJahKAY97J6nyi52paqfd3fsooa87GD8QodPSAjYYwnY7sN/FdYXRJYSE6QDFrIr
	0R7J3/OSTTBiTdYEOGogaruAK3q6YKk4IH4XY8xnzEYled+luGCQM5QY/cJMvm2y
	dloTgVDyNTLQmp5M6Il7n7GKDjzOtWdD0wyNOmNpf4fqflNXvmeVlRnZDcG9COSG
	fWQZlySPusvUFFapkoIkr2c9ynr6qiKbggWA+bLXrsZNdJAR8A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8h5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:37:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wD+8SLFwDXTOuUoY/69TxaynsJunDfT7BMD9ql8y6uhG4Bctw3faGQjbBArFlejzYylFpED1QpNFE5sTGy/qcxREWWyqFzCyLrmGqC8RXrlXfZRNaZ1udZuAtoKnb2mfk7ur/MGokSkASkm4K4tIMhmB+BW2FXxj10yqMb6AWO7qjOGZ/nygQFvmrB9o/yYBgRsqlw+2woO4bb+6kDQ6g5u0Cos5Q4eAZQbzTpZ/5Oy5NqYx6sM4ugVmPHqfBRB/8d+cAkt+X/aeuQeL+aPwoOarkqdLjTOFymFTrR2lfp7Xe1L0OQlWV/R9dNnE+4U1hz9u7ITafejI9w9BFRNyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJvIjs280WkjaM8c3jgl8eFR35mi/ASLuYiNiwYMhq8=;
 b=KziabCgHskI9O2GHXm3T4PIuPJENYrm5OkXXUPGH5JY+IBZIJJ8tGjWIBWqNvIT+yLw+YnfdhU6Rk+1tq23O33E7UwAWwkvhuPrhxkdjRKVEAvIYJ+fRxwACNJzKNYM59qS9j8kRRwJ9WL559glBK/E1GR1+BzjFAEtoDYnWnlXyY8iY4CmJ52eiNIoWw+Jm5fFrVpTYIleJKnaEwBX74FZNYJD6YL3NF9O1QjAyUDyVpdKp8SgJPPCpaHelI+lkhZWsE6bkYZyWSwClMYskzBWrD47Q+QSnOTmUvCiCU/xhRfoudXwzI0lxEH1MLOU5NdrgJyNukly2os2DqFp6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 07:37:19 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 07:37:19 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] syslinux: clean old object and dependency files before do_install
Date: Fri, 26 Sep 2025 15:36:18 +0800
Message-Id: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CYYPR11MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 699f5254-fd83-450a-a444-08ddfccf8597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xQKkLpH8vS7cUMYOfh73p+iUaYfnKjoVYzTnFIgazfrJ/BK3cQoI5qLuqpvU?=
 =?us-ascii?Q?J0YmGRhuBKj7yg6sEE+UmFg1EVRIi/y3uLS3SXhAeTswiBOFqzaIG4dr/oul?=
 =?us-ascii?Q?Jx5ah6gTyN/mDXvFfm4+P+NTUmT9NJ43nVs+k7WaBIM5FQlwxJLCDQN6mlBw?=
 =?us-ascii?Q?ufaiZc9RgxJbXDGSgRCXMhbqC31PhaCy7DbR4GUcIlwGeQZzn8eMsA4zkVSm?=
 =?us-ascii?Q?M+dHKoc9vvuQjmXC7u6uKPQ8/yaI2q85gaPcc9EJkf1UPlQ91iCtt+EGNovw?=
 =?us-ascii?Q?QQtOneZ5zvsUhfVXnRQ2ptKaOefc5/0904N7jG11JB4Gms9t6UkBJRy5odaf?=
 =?us-ascii?Q?inDl5l+WL6zV9eEpnDUvp3oRZgd7YosucsxeFGtk490HhpkuGeHtywiZWewX?=
 =?us-ascii?Q?HmMDhdFYe+wbd5PLgpBPE+u8M0a9YVHMjHhlHC6jc2YDtIuGVyD5xwtjOLI6?=
 =?us-ascii?Q?NGz8P2nQuIzaLNNbkXAffG0f41G0GRxcLNfRH6IyXKhrmsvirKyMDNCjILWh?=
 =?us-ascii?Q?oOKezy3ngbYZPE0GuMr1UjORswmNBRz58M/ta4Uj5R87g0/7DAatyJtaay5/?=
 =?us-ascii?Q?+hW9150b/Miht20ux4EDUxuKnAM1UjdISa3FSstOJQFvcOJcdfCMvZeP2oDq?=
 =?us-ascii?Q?g73nBS6SVNO3apCC0aPfSTM6sMCPDUIWpbsh+B7TR/Jv+mFXECz9+tjwycQO?=
 =?us-ascii?Q?cDij8qiSXHbYwfSVC+vrgZ+jOuFOfa/bYUy7kxJzh/kuzw4Np/hcEDmd/bfS?=
 =?us-ascii?Q?2w6+fPfcuu6Pvv3yMFx79+M/ua0/11wG3gxgigSdnmyFPqf7n3fRjealcUU5?=
 =?us-ascii?Q?OBWzP4IRV2ZuE2CZUICZ4tsk4F5qUBrEXkI7KoyqsRMX9sgBoC3uv1mh/Xpi?=
 =?us-ascii?Q?8+SQCcI3Y9HNWO+g3j1/XK5J2ndF1/u+7VxaR+rwDZY9j7kBCGLEpNtMW1H6?=
 =?us-ascii?Q?N/TjA/61+l1DTV5gnbiRGluddpmwyKa6Iomcup0ZmhRll3e0ewyfnUKRBWDw?=
 =?us-ascii?Q?Q3FTv4sEYD+QYtyfYQsQ7n0rKmy9S3Sr1Gk0D9ZTz7+uh6qFh/Q+caErtJNQ?=
 =?us-ascii?Q?bsNvWm3Xv2bpihzplREwg1udR/HjQ0mI2nozuIy2qvVHRZaE7y25RsegJofk?=
 =?us-ascii?Q?xGSIHN3lDpkyMrvP0ELHaw7R2jAFu4LDTPxbjvzfznix21EDik1Ov50oyH+W?=
 =?us-ascii?Q?boZNgJl0P5PQFW1bzMPIiiUaM76TtSy/0Ti2T++5zOBlR4TjoBANWHuwtH5y?=
 =?us-ascii?Q?jAP3lUTl6b3Zzq7VBeAxxikmsY+tPf51fqRAjvB4RLdCie/Za3RcxpKIBsk7?=
 =?us-ascii?Q?Mn6OEOnmG4J2Z7WSS3/mUqKFp6wnU173hvCHTWNynTg/e0fvPHkYeCN2tWfc?=
 =?us-ascii?Q?u0w52UOnEY1IWYlZc5xKOHfrKTQKKMDM8wFVc6kxNBuf8yEGdVx3FFncg7cq?=
 =?us-ascii?Q?dUytYjF2uS5ToWJQOaSwreBpPf93ScAEF1m00o25c/jP1r+qiQGz9A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ie9HLsc4APlPKLB7z3wkbkQt8wN7iHCvekCHcaQBzXbePjFT0DI+fmNicROJ?=
 =?us-ascii?Q?p5MPtYJXn17vPK5qxu91sQ2imvby1+En5SuDscfluoSIrNFWpwCk2SwrkuDi?=
 =?us-ascii?Q?00ZS34OK6O3mbayptM9I9S8l6yd/MzWm8EUSfk5lK/dezaGgBdantk+xfFYR?=
 =?us-ascii?Q?NSPGKySar8D8sgEAlB59PyfiZ6MUY6NOJmHkZA9IXw/l+cj51ctd41+A5sgl?=
 =?us-ascii?Q?KtAY7LWrVH9XEBqHNHubzqKsgxw9ukHSldDjJns6MBfeE1wichf6ni0Pc5kA?=
 =?us-ascii?Q?XuJXs05UasnCLsr1tVRPQkFrLYtViP/WR6EpQPXqINcIVT8Wk+wOJayO9HNP?=
 =?us-ascii?Q?iLHiXh7nOl6gRFo/y7r93UBF9IyJtbai8fl30tIXxgwSRIM72Wt6Tv/7ayzV?=
 =?us-ascii?Q?bnUldlm2jDOuiTGyC7V/2PFn9r0oMXJfnxchjxAJlloDed868JMDC3xvT/S3?=
 =?us-ascii?Q?KCBj1bP0WMBt1pwxDQa67YSYVUZ/885ZocqiPuGLHsb4XsKtusXMQeCM6v8j?=
 =?us-ascii?Q?wcOUtXxdiKDMgDgUy9tlHYLVJe//x7aOUFfn+ewLQxCUF5N/m2Qdz+g0KE7/?=
 =?us-ascii?Q?cKloSInh6JmgPKD1fcvVtzEP1+axU9abexQpT0issBqC9himSMaETaBVqWW6?=
 =?us-ascii?Q?JLISltwDBmePTnLhayEzNC4dleHnE/dwl+FwcfDJNQJUntOI8uPvpOMvXOQv?=
 =?us-ascii?Q?Hr/AdNlxGPTMM+38VHp5h1mpl4R6zKRLiwClVnvOuUbXk5LEiwwatmAZ5CTb?=
 =?us-ascii?Q?z+TlG1B/I4TCxATQ8z9ZeIBH78jswrpRNtV2MZq3g1E+VeaVT3R8NiE9aexr?=
 =?us-ascii?Q?6cbjdcNDTmoYHANobQ6134HdUM2LbjJuUWKV2/aXRTIhRMiSkj3PDD+w1xcT?=
 =?us-ascii?Q?1VSVXVzTjGk5Em36iHfso/Abm0btKVJRMnz4NLBkIBjTFWb0desS8kXrKd2u?=
 =?us-ascii?Q?EAnPNwoXY1IzQhgRWj/pqJKW2t6hC1MfZaaac5hNHhe1Fg704Hq8zfyY39/L?=
 =?us-ascii?Q?Vppp4FXAvpJVxMkRh0N8BxOeeI+HeOl0SMi0Z8i+6Ad3kXk00efR8tNUr+Rs?=
 =?us-ascii?Q?bm1+YdQd7e/wNvcpH/+t9l41BWMCYclY8oRTaURKCT+zWMuGeCnnyC27/DMq?=
 =?us-ascii?Q?HTZ7XAXYSz8H66bD+AwkhCRzCvoyOxVsrbkRU+gAyfxujgq5yRBCtnT92PeL?=
 =?us-ascii?Q?tRSyZzfGteITn9T0wVK2f5tCNshp2csQgk4jx+RTOeYyswDCtSdRR2iSJqqI?=
 =?us-ascii?Q?kOEqlpb/qhENqN9oL0rDO6gyCbecjo6i4llWYQkUppLmhamnS7xClVe5tV5n?=
 =?us-ascii?Q?n1/DkdgKr00kw38iT/J+9yGDWYo9Q27WdSJNK7CpvObFCG3dhMm2x2ivqV9F?=
 =?us-ascii?Q?ms1Y10XhI5T4v9c/RZrgwVwN++oB5AMZWM4zpUf318Fb7xhuv0LjAHD2gUQj?=
 =?us-ascii?Q?7HmXcmuzSTP7Tj2k+FNmoUGaaOV+QDerwspuiqROB2MdocZMn1MsjkXor9Vb?=
 =?us-ascii?Q?Lgrn239P6g/y9F6VJflA8tZy0cVWubfK4hW9DMnxUZMhJ20hDZD1DhBAwPr9?=
 =?us-ascii?Q?f2puSFkLPNlk3x31wKT5nifrdLzz/VxuK+D6CkI1N4htdHnZJ2TiBAgkLDOu?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699f5254-fd83-450a-a444-08ddfccf8597
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:37:19.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwUdfDl5Rgeci+eXazCIssEJAjAOd3ZRfwzl1ocMlvMFTqzDbXvBJodxttf8lJ6Nok/BF57DTpeC1Fy1/SZ/1uIMJD3tEAgG4CeXSUxBO2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
X-Proofpoint-GUID: BtdolGTSf2TFq86-b00-F2rbGyHkHEDp
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d642b2 cx=c_pps
 a=wMiyO8M9v1WpSot1jLKY+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=McLmhcULq_OhQfsdZ_0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BtdolGTSf2TFq86-b00-F2rbGyHkHEDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA2OSBTYWx0ZWRfX1dOI0BzLkvfO
 NGCBFkL1Rgz+YhfvwqiWLquEvdhei+OcNDc4aVQ2LTyJCtAKVKELUILRyV3IQVDP18L+WaWCwcZ
 d8tGBaMlnVlCECpoqxIOIeGNJPP784x+TyMCtHaM0E907232joiYAU5c6b8ccAcMwd7d/BwWgKH
 MmdVzTbWhixT7vP8O9H6XjzebO2ODw0zwrMamt5+2Qt/YlQJMAy5cWDSqGcc3ZxPo7LjdAZiuqe
 uEQRYTrzZO+LioSQHrLJ7iIhoCYU+uEe/ViTeLe4R0H/FGU28+Nj+b4+pe/dfxKzdiYPQCW2rcl
 2bLF4yuhKmC9vptQutH/W+oD4IHqS4oS5Y6r1c6/UhREfLuQ5HEimBoctrZ962o/6Tpt3rqLPNl
 pBoxdHvK61lfHzR+dyV8nKT8Y+KQxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224058

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Remove all previous .o and .d files from OBJ directories before
running do_install. This prevents stale build artifacts from
interfering with the installation of new binaries and modules,
especially after GCC upgrades that can invalidate existing dependency
files, such as:

make[4]: *** No rule to make target
'/build/tmp-glibc/work/corei7-64-wrs-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/
usr/lib/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.4.0/include/stdarg.h',
needed by 'zlib/adler32.o'.  Stop.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 449a75ebf8ab..ea4bf6e6a88b 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -107,6 +107,7 @@ do_compile:class-target() {
 }
 
 do_install:class-target() {
+	oe_runmake firmware="bios" clean
 	oe_runmake firmware="bios" install INSTALLROOT="${D}"
 
 	install -d ${D}${datadir}/syslinux/
-- 
2.34.1


