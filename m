Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39073CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 07:56:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17515.1758095804676906714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 00:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=afZuRdEZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1355ed6f99=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58H7N93o4031346
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 00:56:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eEi2HY+LEWmN2jnqzTkF
	EaQiU1kO/+vL/Z3tEyWmJVk=; b=afZuRdEZ5tokJi1Ne+TpVavt4ISV5iyeRPXf
	LYWvFxdAilqSQ+Hj0ZpevYAxwuwbb/+EzxYHaUgxI3vVNh9VlzKJ657/xshbInaP
	0e2UOF5ZrE6zE4iEYok69UqY99fZLPrqjK3M8hYPaM05O96sdPWVJ5p/V7adm0BX
	D+JzpB9baGyqvrscGMtxGZKIUAP26a5S/JkAkykLhWcwjk3MMNsTdrfY2e4wsimu
	tZv/F2fpmijHi0WzcBxd7IoDz6Jq+Ii3slUqwcqo0twiCfisrB3FMiVxTasyN7Tj
	e2WYai0DJC3TZHBjIOrMdShA6uZSkm++1LqAG4W4lVWnI99eVw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr0cb6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 00:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7RFIu/uZESGz/q8J5JXmdBgCyi6RuGylljYSElrfv4xwcKopIN6jHVZz1fh2CDwMpbqsqz8d9hiQjNik/KwCmMcAyDEfyQMlMrFpoQh7ZZaHmpZtrKJYhBVIyaFqgnK68xWiFK7x+WBwtNtuFVAVukwvJtWvDfu9RMRLpw60EJnMx4beBjHzbMgA5v80yDQf0a8RhTnO5jn7S2r4IT+t4EfybMZGmoys6nNZcIHUVkc03yAaR3e1BNyedlfY84yoXWWneVv1zfjCwpbgdf7yNE4TTxF3gd4lXLwQ1FiDSOXAx+WPZ0nMFAENH5yL6ktZ3Xmb76kfH2nall6Li2sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEi2HY+LEWmN2jnqzTkFEaQiU1kO/+vL/Z3tEyWmJVk=;
 b=sFAo77IB64HdKw/MnSTzHQsfz8eGQ9x0GxuOnnHnRTKDatcV3bFY/8f/TYqdwCFRgCxdTV8js9Al+l9ARiY8w0N9L43lsRPjYL/AqsB2OCIgfGLWLzg9dpNirBs3P3QLZuXh/vMT6WsO4K2Raf+tVWfnq0ceVN3lLmaAZIQlWGv0rUsSSHRas4sxzTvqRyFWYScwigeFoIQzBJBGpungy2+oGOsN8hOY/5RiywCInF8RNNYNhE+jdSkgxx2tS+hoKpAhPp1R2M2rAipF/yacm682vwCBX19V9FVEnGlfLyxnOgIVXjNPTwJTJThfZZnn0+F8s8PIwm4/iaQm8rNm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 07:56:40 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:56:34 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] buildtools-tarball: fix unbound variable issues under 'set -u'
Date: Wed, 17 Sep 2025 15:56:13 +0800
Message-Id: <20250917075613.403604-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:3:18::28) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaefcd8-830c-41ea-5561-08ddf5bfb85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AYiYySRDpWOCPIDDX6pCUn+Q/YfMH2WaFLIhqtm7hV/EdCbMJA5EQW7nxjgQ?=
 =?us-ascii?Q?gz0SAJkLzMzkTYgrrA95DHOoUt70tjuXLKPSIZJXIhqWQQhpfvWpjU/Gz2TL?=
 =?us-ascii?Q?nk8C+oSQTMZk43fIT9rMw51JeMTC45XhrufZjBrItzvj1AHtE+yaMDfLBp7q?=
 =?us-ascii?Q?adKpEsDfJdNk90f818seu2VbUmfK8bp6dS8LA9EmKU5Qg8FvDVT/d/MI5K/A?=
 =?us-ascii?Q?8UvzVHab4RU9V+g8n1EItMb2UNah8r2udbM2EKYcXUv8rR/5JP3uWOMRbN+q?=
 =?us-ascii?Q?H5tOtm2e3ydvXLfJ34JQ+7RQ44dhj3hFX/bD0m/TKcCMuINDpiOBJgFWrAgD?=
 =?us-ascii?Q?DQsGLLp3ThoZBgzBmqhWsLQbDo2kmA7GOqwUFKzAF7S5EkDgDwOft3VeBrJJ?=
 =?us-ascii?Q?tZkc5wSo0r4U4v+hwXv47HB0kx2LcS26F/YeCTI3+/EbqTus/eYjdpUp/JKY?=
 =?us-ascii?Q?ThQAseWV/b1UY7YSdwGB8ix0KxWtqhc8pPtIDVFj5atOnzyG8S9rfO2FZGN6?=
 =?us-ascii?Q?Cb0fU06qC1JSwDNwaxJGG6ma57jQTCLLgKQsGVKyGhxnsThLPKZCfbDIUGLx?=
 =?us-ascii?Q?yomRuBzVR7t4X/HUTo3PWqsgDJNslCkyzYDGQZlgo+Xl0qXshZ6Q0+PqvG17?=
 =?us-ascii?Q?0pE8bZpa/FSf7NEGXjWtcsceBjpXvnC0CmLQKkYfT1wfp1KDumrOVMSnIYAK?=
 =?us-ascii?Q?xCLouAJ3HJHAFvgJf0as823LX2dFWJIWFlqqL8tkwNyDZAwl3TZu/vFPhzlW?=
 =?us-ascii?Q?klaY3+WTBePRMMgzoJ+wSkl9mNXGMt6CfFeg2xmJe9H0RbsWMUNF+FIP+OAQ?=
 =?us-ascii?Q?cFPdg4N+FtXN2TcP3cQCNAtwSxMiwrk5NJV9LQRMiyY+1Gy2vbwXRTqLVySE?=
 =?us-ascii?Q?Q0ng9xfAPv3e+sGePejhzmcvTdQ20+/ThkZWOup3mH1hYPd6A+33aU56MJie?=
 =?us-ascii?Q?M/u8bIbgDLRmKGJ5mSNMB1xbGFwD2wZDDivbg47MV/vrz+wa+kebUq/cGFdK?=
 =?us-ascii?Q?N61CE+XR40/SqVq5gOyLTdjTRUMU9p5rJ4GFAqjku4/pSS+jtNZyu5XLKNEG?=
 =?us-ascii?Q?gaFqzS0L7BTQf/AMDYak4weexsmxeKdpNxcbaI1sCKajRrRTHN7RQ3DDpJcr?=
 =?us-ascii?Q?0O/2R7qfrICWDSnrOoF76S3Cnxlx3pH7QXmVt5tSS8AhBMOqFQ6ZpdtKTwFk?=
 =?us-ascii?Q?OF/ZgM+p1J5Te7cwjRMjbr9vJvPhRM7fx2wX17C9GcczGErkUvq6C6H1navi?=
 =?us-ascii?Q?cXMliplvCPi7NrsBogfJY2oD3tmXhyJy4oUVtrNQv8d9pf6x98CqFtj6NYGV?=
 =?us-ascii?Q?AdQ7ulm3qjlFzLBc0DSMuoPT2nSuzF+WWuwvj/bByAkImgl1/imwnM7aok1f?=
 =?us-ascii?Q?D9ZsKAqWy435+MLdNHWyfdQgmfFZfsE1rP2MnC5R2DGUiaJPSIIQapVa2fLk?=
 =?us-ascii?Q?YeFjd9UmLgK0M6Di38xtC1uT8uekphOpN/u+fVQ2bBM3/f+RqF1+sA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y92tqnxP/+BcDe3gQ0rllPoYQzABoqwHJwFbnxHR1uPHVfWLz6eqYjHhKOYr?=
 =?us-ascii?Q?bGVQvSvp+CqhshUZ1JitfYbwEJoDbW5Z/N49tkp1vRSD+WJymOLFpAOQSsBE?=
 =?us-ascii?Q?vmJNvxI2wV6c6NUugKY0zFF6Ll4hECPwjA9F17isED3So3hoheP8rBDEe9js?=
 =?us-ascii?Q?gRc61/Jz1LSvJFbAmmFbwjQOn6hDxBYy0hxKv+g4T0C7p3NC+69smJLGqh2S?=
 =?us-ascii?Q?T8D7wltC2MqxcFoKioVUfK3tsUS+alKSCeIIbW7NzEg+x/HUGNOfuBNfuh8x?=
 =?us-ascii?Q?mRKX2KZ9GaAOkIDmfrNhzLK7gp4+FoekQwHCjD707tZoba1F3wD3eBILuNsb?=
 =?us-ascii?Q?QaFU9HMnvYPTdazyaYs5cousuNgSCVAQ1Vggx7LIJu3mJxHt26U1+n/L4DkT?=
 =?us-ascii?Q?s7ZmHiKWgJ0swXlnzD1HiNWfLNlO4iuW01uhZjDbrgsIPPQBvna+SsXgwb/y?=
 =?us-ascii?Q?8R7Wipf1qV/Otc1z9h6ltnkwTQR0x27IE3O/sTmq03l433jtGrFWoLOWyfIU?=
 =?us-ascii?Q?ATD7OyeMWdqwRQeHHOZRzAPVo342fbnX3wJbo5rHCYcURc4Dl3CihewxD88f?=
 =?us-ascii?Q?XXpU0PtkKg7XSFySbrISdjl+SJLp0B6jQlvg8kQL3uuLe6ibSwGDw7xwiVkb?=
 =?us-ascii?Q?/Iy81H5mOadvEBggp6YW+vd+flYktJgMTDNwf79n7r1XOmO2wXuqkk6F268z?=
 =?us-ascii?Q?llVd6MouvWZFMJCOwOuMFFcUFxkYQ6SfY0S6+Rv4ZxqbAPXN37WhuW31BI9f?=
 =?us-ascii?Q?yO0atK3mQHvZh5yxNR8SdvbYToahrPJrM3hNI/K62H1UUffVJy5PfjT62NoL?=
 =?us-ascii?Q?ZM17S5GYd6+HA7HW15OQnUah4EZzNWiqqEoYAsg5fhly5lpNss+HUX066H8r?=
 =?us-ascii?Q?OZUPuYDl4jJGCkUoTlWUmD3RFd+4TtyUWQJygh3ub1XyhZaa5+c2dOtiCsIW?=
 =?us-ascii?Q?cbPXrZybY4qgy62Tmnb5t6qH6pi53x+OPqpl2MAakrp5bTFucuPixbcsauCQ?=
 =?us-ascii?Q?GQy8i8LBJtv+ei8+zCs/YjbFSTaXSSxgWq681IiGQ0yvDHdgt4RA8hXl1cXE?=
 =?us-ascii?Q?kxo1kW6CqNOSHh+rgdz7VvA8vibAm9qbTx3UuGl56BFH6P4e65LTCmSSaY8i?=
 =?us-ascii?Q?h3eQ+sWiP4LM1a2CeS1chsu0b/PTcNMrcHUE67kpwcCuEu6qzJDwTJXkAdu8?=
 =?us-ascii?Q?crObJxDW5d7lnzuYkEjxfM4CJWVGTfevmVSCsRdfPYljptZj52vRmuR94to5?=
 =?us-ascii?Q?y37vB9L8RB3UME5DSJoLnjLGpqEzlbFGiMa2Y+cE/y10VLaIdlOhDZZZ5vhC?=
 =?us-ascii?Q?N4JN9jlM2qe0lhPdt86qdn0+BfBUsztuXNe/njGwHfJNN7OPB5j7L+i9cZLT?=
 =?us-ascii?Q?/9azxYCNBbABr4eLSUXQtf96pG2bfVnDMTglkswpeeuEBu580Et+N4UPwDt4?=
 =?us-ascii?Q?NWCmglfilnf+9t0U1jLYVNYG9pr8C1qwUYULAouzB22l9oe4STubfVDDuBn5?=
 =?us-ascii?Q?t0m6mOQmlCs20+q/5XE3/vxr+6PdQooAowWRC+mctU9q/rzA3NRIrE6llm2I?=
 =?us-ascii?Q?MHz/Yqxq57UnIPcbpfnAfKLiEMn9IV+91hFfTsMiCck/+1Xe84A2fq+zZ71G?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaefcd8-830c-41ea-5561-08ddf5bfb85f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:56:33.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBzKJV9JAxnnOp2wYoryl7kaU2x5QVoA1wdLdYpR2PuFONffMnGTbDRHpYPJbiIfWoWKk9d+uY+HzUE0YlXIKRBbcrYRiMZU3aQyvnyLWBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68ca69bc cx=c_pps
 a=1QNZTIC90Jmhh4/qmb3rWg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=G8RaOm78J5cyyXkNedkA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDA3NiBTYWx0ZWRfX+dHiNIA1Ropl
 AYIWY3aXTC/yUf+ysG6OjomXA3ac3RkJY1agoo044w7J7qRNclF6R/co4tFG8uZgqOZ48wP2+pN
 8EwUMXBg83UGmm8ZqZiTVlduCYAN+bLmERw6LtoiaDjlElLKsQfR3GrU+y2+vzBUYJdyW7/2/ry
 ThuFZLfV6Mo3zJtCRewYxwRdfhOH3Lu7mQtPEVDWY6bK4AaUQEv2ddAy4DA7csKlt5pRBxagZe/
 CDEs9PNJ0Z/yYzjbucMN17BnojQ58puEIxyV6Mc0MEuQDNHcLZJqux0Io3rwyLuhhIZz011Elz6
 8B2zKKRoGVVOrAiRJesUjN/dF6L1ehzy+2v8di397hUIi5ol/nQTjHsJtRLnlg=
X-Proofpoint-GUID: eKabRaL4b28o5aQXpmNChucFk3acmWDp
X-Proofpoint-ORIG-GUID: eKabRaL4b28o5aQXpmNChucFk3acmWDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 07:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223584

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When Bash runs with 'set -u' (nounset), accessing an unset variable
directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
is never triggered and the script aborts.

The current code assumes these variables may be unset or empty, but does
not guard against 'set -u'. This breaks builds in stricter shell
environments or when users explicitly enable 'set -u'.

Fix this by using parameter expansion with a default value, e.g.
"${SSL_CERT_FILE:-}", so that unset variables are treated as empty
strings. This preserves the intended logic (respect host env first, then
CAFILE/CAPATH, then buildtools defaults) and makes the script robust
under 'set -u'.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d880c2eccd534133a2a4e6579d955605c0956ec)
---
 .../openssl/files/environment.d-openssl.sh                | 8 ++++----
 meta/recipes-devtools/git/git/environment.d-git.sh        | 8 ++++----
 .../python3-requests/environment.d-python3-requests.sh    | 4 ++--
 meta/recipes-support/curl/curl/environment.d-curl.sh      | 8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 71d378734c2d..0e75e34f9d92 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -5,16 +5,16 @@ export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_C
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export SSL_CERT_FILE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export SSL_CERT_DIR="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 9c7b5a92512a..fdfa721c3b2e 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,15 +1,15 @@
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$GIT_SSL_CAINFO" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${GIT_SSL_CAINFO:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$GIT_SSL_CAPATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${GIT_SSL_CAPATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export GIT_SSL_CAPATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 492177a9c377..400972814b6e 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,7 +1,7 @@
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$REQUESTS_CA_BUNDLE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 7c2971b3dad1..581108ef35d8 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,15 +1,15 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export CURL_CA_PATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
-- 
2.34.1


