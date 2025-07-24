Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23865C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 07:56:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7222.1753343808621336353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 00:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=930074213d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O5K2HG244849
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 07:56:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483duq04j5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 07:56:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB0oZRq5N11oa2N7VnRwP77P7i6F2YOW6sUyhLwaFESDd3ZzKHCCJeSZWno0gvENRWVphoHbAOn33C/VdaWtqC1jwMoPLq3swQoFe5E9qc+qIgmBKCY7dvBXwKKxN47JtjKGVLt+HYfmbeFmd9Q90q25x/Akoi0BnxzrQ5wh/uI/Ap6OcGV20r1B9yq297cHWddYCSXGCasDgScOHTYot2ELiqJXpbvsOcNOS4gtFzI2uOAV0kRkoB7wfeCGyugJHBOy+YFOAbnM7FAcAXYfelDN6z5xV0b7bx1LeI/+dyQYAIyjti6PE7rbKFgQVbR046ZD32MY6eNeV3LCFrAeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVznu73LgcElXyYbItzlv50HNvojbCNuZTC89BhbrXI=;
 b=cQS5IDx0w5mR0BxncH0wmt/pJZNkqFZZDUu8BpfhxgDxw3+YQi4EmlWNINa6AOt7cQPVSexUDXd19+EbrOhaW3eFTcsBNnNeZdsXyeKYLPmPl7oBS8J8QV5DAtSA7b5an1+WgPnzq2bY8jroObmwjvqWk6JEPkhTeFkM+cE7peGIK4yOr3gqMHaII9szt2bT2APSI4XTv/T1G/bEa0RAZVCLUiCttEylYy+4xmawcMzqYHo51ha8UPNzR5cWzRVuZeVTNUlQeEdjRUKhpiad1Z7j7RFj7cz7O1qlX/aHytTpSvFzSwKkd6RvADCPnsVQ8zOKQdtxeZWcJjxDNn6JqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 07:56:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 07:56:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Thu, 24 Jul 2025 00:56:27 -0700
Message-ID: <20250724075627.2132259-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: e37a7387-bfe0-4bd1-dcb9-08ddca87a14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?swz14oQre6v/QjblLs7PWcCLD4heg57DmV5XvIEM1Z+64y9YhCS1tsDSRZbl?=
 =?us-ascii?Q?4PcPyTI6IhmrLWY/Cix2ei6f9ViWlP6JTvi0uVZoJ3L+FXx8th3rsqaET8KE?=
 =?us-ascii?Q?bW2VzDLecC6S2v2JAMPdU+cXSMxjq7HA0ful8++bFxXvZW+m7Wcv76Zkl9jw?=
 =?us-ascii?Q?GXZHdDgNh9s0itnY+ps1O8pzNzuZK/gNfr6214Mih0hFWrCAggfGH+W8xTrS?=
 =?us-ascii?Q?ZhrT1mxtjPwGw74Bl3KegEEFuRixnM3WYCW+1FChGM5XiOAsFSajxLmwejH5?=
 =?us-ascii?Q?4aOhH/NZ528jlm9Dn2MFABo1ziQvHGnTlEOqKxNKfLSNSNP5AYUQDxSySfs6?=
 =?us-ascii?Q?AjgXmoM8OSxNbsbJDvMMYqFbuGA8oM8HyqHq8pJQuZ6d5nfXhfmuS5VBWGU0?=
 =?us-ascii?Q?jfd1WPmnsMgMzQt0/8oYZMMGHNulWw8qWvlWUMLGJs3pE9piYpWpsjJIXuVz?=
 =?us-ascii?Q?n5m+VmPEYJybZUFTyb6tb/DlIv0enyFmhjTAq/ZqeJnZIyQp9zewEtZjt2LX?=
 =?us-ascii?Q?CSrbg7Myds9zzDGQ2rmCnllujeyce0piBxQAp7nQcfReHDj/VXh12Sc7xUxw?=
 =?us-ascii?Q?nKTPkQjimXo1Y/RKD83qeowVLe6ai4sOaRTln4gmTuvWn2ZCWWhfV588rg69?=
 =?us-ascii?Q?2J2aH7xyapZ2tPOjYLGBJaTRBXWzvt/Ut4HbXLLHHFAWaun196vCb9hxkoeE?=
 =?us-ascii?Q?TkcZwNVCvJrQIYX1A8+pW9LOgcVj3uVbgzFUPa67AkWSvNXRBdmNKRsPnADJ?=
 =?us-ascii?Q?j6YP9m0AhxJgAaRCdnUksx7AAvHoZx7GY9+i6k8apO3MFuRe7WVNglbt+ux1?=
 =?us-ascii?Q?Y2V/UIWJEMZH8jAVRUHPzETWQuLFjU9JD93F3AyZ3rqImRp2ZbFRyU0QsE/d?=
 =?us-ascii?Q?LSGqVF+PpXJ1HlOTqG4JZIu91kCbuCiKsFpU2LTt++2LSpvoYAdOJkuv4opy?=
 =?us-ascii?Q?e5Ipe/mDcbgl6DIqrl51dGzg+/tTfiJ6CZ3L8SgFfvXZZCfC1mjkYJfDr2Ha?=
 =?us-ascii?Q?MZbyKRntcN48rxZCtTLWcgXvHyNdU7DaL7NbjpsLFY4qW6xEV5jvmZUy4WQ7?=
 =?us-ascii?Q?XWY6zz+DPGjBsz1cQg6velgViRHjOHgBO8roULLAZLdfvIJO0mHRjUweGGzM?=
 =?us-ascii?Q?QBPoq8MMxI3FrJb5FA2xt2kwLiFcdqu5ecohZw5NGP+A2AX6DHbnVnc6koU7?=
 =?us-ascii?Q?/g9eIAt+HK/0LRasG8AyXogSiaGTpSNYsU2L7q0cMGmaS1Yp51YuWUrrBEaq?=
 =?us-ascii?Q?khBhEP3txj6nNqxV2Tu9Re83/7lo2AVAJvzZhcBckSX7MpsJh10W7norMQCX?=
 =?us-ascii?Q?RD2pQSKQSAG99zQ+JlqibUXP6tqWDvbs2U/9uD3+D+djUX+eZo3bzz088NX0?=
 =?us-ascii?Q?bv2yehW5Z/JEfoTw+EucpfOA0WavXwNXmFJG1JowcXk7q+jd+MvG4fL+7XaN?=
 =?us-ascii?Q?JkfcPPnRDX7wYwOEE4j2lSb0DCpukK+tUoiBwHhkShWQvNAZtdDQ8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cZkwJcBgca5LfkeEFqdkqWLpQdCe5VlqrYRPS/6gPqscPpahA326FBNBKBtW?=
 =?us-ascii?Q?wxlK1dXcb239mcNOI1DXlilRpxgGApvX8f3OlXtb2OR9GZyRxqCdpcwHPYkc?=
 =?us-ascii?Q?ciYJP3f+ygkn1px89W/0HQpuwc/52nYdsoMLlItrvTetEjf5hUp2hC3ydFHx?=
 =?us-ascii?Q?jYlUy2Rbic0IZP2zXxtBYB+RObxknn/ywsCjE8N3TlMAqt93At21X0gCFPrY?=
 =?us-ascii?Q?ZQIqgQC9EI4tK//EZhVgfWt60idhZa+GXsutBOjLfxQjqpMOwT1cQqtgD59u?=
 =?us-ascii?Q?qrPlk/kI5ih068FtwboV+ED07nUWrnqSCoXbWpocDeFT9FUQU+fUyuY/fhXu?=
 =?us-ascii?Q?dj8IHClf5IqWiQsEuR9ZKR8o/0jL84sW8+xhbqDNL6Bx8MKR5A6QM3IyetLj?=
 =?us-ascii?Q?1HhifXWpkSfCVtVW5XgwpmUatRfAt8++rTslWNj3iVwVWwVAV72EvEoe8vdq?=
 =?us-ascii?Q?/1TlN5tfL0SjyGVILeuycmPWxa9carUpQuWHIQMrSJW803ZKlHzmcdzVLgpH?=
 =?us-ascii?Q?wFwxggwl22ukP7ZyqljSKNeyN2BdlS8glNrtCDCcgzkRi2xyv3aqfEywEmZ4?=
 =?us-ascii?Q?hRnQ8IPD8KJexxX/C/nFPDDWdA0Ch77rmHm2XZQPt4pXwKLz5ZyHa8T0hGIZ?=
 =?us-ascii?Q?223+Vsyx89jTz2HqYEFYkauJ/7TtN9wUcLvYq2fuCNSaqdS5k302fftLYrN2?=
 =?us-ascii?Q?0aZDp/1ZQ2+l8k4XYrjsa972muL3Eqi5FCmdoepvHuagChuUbf4p1guZPQPP?=
 =?us-ascii?Q?Eyk3LQaNncL/IshSJjjZJdGd6ySc20mnYZdWIYAc5HE2FGo+pzrM7ee80BN/?=
 =?us-ascii?Q?y+XiooxO5AjRzUvsdL8lcOfZ+kVH6RHYFiAUubwFyhf42rbzpkfk4wV0uADa?=
 =?us-ascii?Q?rSVyEKAkqaizymIedU7ASO3iZMwdYHIaGo3/8NCb4c144IsMhtwXNAG5nFFp?=
 =?us-ascii?Q?UNpIrz2GjGU7u6kKPFjaKLXla08+F9WAuFIx7WhiU5OHpe5O2IZWOvH91l+B?=
 =?us-ascii?Q?vghUortNr4Ycvesr8HM3mEVKET3+izrQK04eGQcusQrpLvT/x7p8vZQBiEx5?=
 =?us-ascii?Q?n7PSzrscFFazaLxEOjPah4alrFczCcxT3i6m8WIEXszPyLgq7blVgcyGlGnG?=
 =?us-ascii?Q?T+u/jdON2umsKj02LgeeM3lRdl3rlDQzHeCqJAg0FXSk80Ys+LJJvtxBWP0+?=
 =?us-ascii?Q?rFtkfnPeFpyxqSbgH4KQivdNAbXhklrQOXVVaxWlZKLCYDhH8vCffz0Abqjq?=
 =?us-ascii?Q?AGWS4VB2dvmEUx+sqZv0sThFrfwUab2ILePwLZaJFIz8OJGHPLlmaq6DkIDd?=
 =?us-ascii?Q?NjVNfW5kQozhr8d0mK0OiKZSps2d+0UtXXTVC7sOkJm9Aagpx6OeuTb5WX07?=
 =?us-ascii?Q?zcrZ4eMcY4ofddKiE9Dfu9Iiwgk8NgJGlUcyC1ggSa78DhoJ/Gb5bnBOFTjG?=
 =?us-ascii?Q?m1WLWh64eoy4BLdq/i9+G1ypZ2dxryjVfoSfi+W1Md+YCXIsLiQKSe8sXGVr?=
 =?us-ascii?Q?s677UNntrgoJocR/QJyb7PGwtXSam3iMZ0jvzB6BeQs3cFaoL1gg2QGsP0JB?=
 =?us-ascii?Q?oNA73aoh+BXY8t869dNdyqjAFnIouiY2OeMXuuJzoNeWw7A2Tz313wdZzx6x?=
 =?us-ascii?Q?AHsJRJgP0AKHplseWJ5k5Zc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37a7387-bfe0-4bd1-dcb9-08ddca87a14e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:56:43.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N83li/fFp8Gv9Ax0EKnKlUfbRGnHArGU4P0Fo5KZlvGvvIgv2jBrXjyQ8t+a2rpJ0rPbENzTMweqQ0yOITEmCN77GpNr9qZwEMaYLsvTzGUYrkEhPTqWZepKEV5GxBku
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
X-Authority-Analysis: v=2.4 cv=f/tIBPyM c=1 sm=1 tr=0 ts=6881e73d cx=c_pps
 a=5dH3eB2WuaaY2nYAHY1uIw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=xWCpMIOAV1nlCTjOYB8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: -YU1JOfq3qQY1QgIT5CEvVtHJfSVmlbm
X-Proofpoint-ORIG-GUID: -YU1JOfq3qQY1QgIT5CEvVtHJfSVmlbm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1NCBTYWx0ZWRfX1nkNGQJij3H7
 asFFo69COGo8NFTgyeZxiSENxrL96gBYT/4PyYLwu/GgbrmGknOfK7UTd5oDPj94S1HTPiSn6Xd
 cvK+ReHPqc7EmkvDigF62d9PETzK8RnklJoemP+Qx3gQj6VRqb0QXjbtzEBJDq+2VdgzEQt6CcS
 mZb52FPJjaTwg72N9lxmhnNnuZAhGAtsv5r9XjpouuZ0TqF7as43xd4/ENcLMWIpghCPd4hpTX2
 YEPezU57Vvn8hycsz7maMFcBB9XFkmvh1LVOLMyEDBKSHE/VHIHh7C1xaVkixMj4WeRPW7OD81L
 m+vyfACOY8bzl/UbvsxWvMGecZ1H9b6DIGUJiTt2ku5IemNCixqhVoT8c8UwlIEoF62KgkXByTu
 E8kj1CLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507240025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 07:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220823

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.35 stable branch are updated.

git log --oneline d2febe7c407665c18cfea1930c65f41899ab3aa3..80401002011f470d9c6eb604bf734715e9b3a8c2
8040100201 Fix error reporting (false negatives) in SGID tests
c6ec750be5 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
c9e44b6467 support: Don't fail on fchown when spawning sgid processes
621c65ccf1 elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
c7ff2bc297 Revert "elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static"
8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)
08aea7712d support: Add support_record_failure_barrier
901e24b128 support: Use const char * argument in support_capture_subprogram_self_sgid
bff3b0f16c elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static

Dropped :
0025-CVE-2025-4802.patch
ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)

Test results:

             Before    after    diff
PASS          4833      4839      +6
XPASS            6         6       0
FAIL           133       130      -3
XFAIL           16        16       0
UNSUPPORTED    200       197      -3

Following commits improved test results:

8040100201 Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates.

8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
Fixed tst-dlopen-sgid false positives by correctly handling subprocess exit status (bug 32987).
Ensured test fails on abnormal or non-zero child exits.
This commit restores reliability in SGID testing and is the first step toward centralized SGID test error handling.

UNSUPPORTED tests changes
-UNSUPPORTED: elf/tst-env-setuid
-UNSUPPORTED: elf/tst-env-setuid-tunables
-UNSUPPORTED: stdlib/tst-secure-getenv

FAILed tests changes
-FAIL: elf/tst-dlopen-sgid
-FAIL: misc/tst-error1
-FAIL: resolv/tst-resolv-aliases

PASSed tests changes
+PASS: elf/tst-env-setuid
+PASS: elf/tst-env-setuid-tunables
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-dlopen-sgid
+PASS: misc/tst-error1
+PASS: resolv/tst-resolv-aliases

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc              | 2 +-
 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch | 3 ++-
 meta/recipes-core/glibc/glibc_2.35.bb                  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 34b199c02b..b269518af4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "d2febe7c407665c18cfea1930c65f41899ab3aa3"
+SRCREV_glibc ?= "80401002011f470d9c6eb604bf734715e9b3a8c2"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
index 0298f5a865..a1197c0318 100644
--- a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
@@ -81,7 +81,7 @@ index 09079c12..c2baed69 100644
 -		  NULL, NULL);
 -
 -  /* Remember the last search directory added at startup.  */
--  _dl_init_all_dirs = GL(dl_all_dirs);
+_dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;-  _dl_init_all_dirs = GL(dl_all_dirs);
 -
 -  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
 -
@@ -97,6 +97,7 @@ index 09079c12..c2baed69 100644
    if (__libc_enable_secure)
      {
        static const char unsecure_envvars[] =
+ setup_vdso_pointers ();
 @@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
  #endif
      }
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3023e9c1ed..df5f14984a 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -27,6 +27,7 @@ CVE_CHECK_IGNORE += "CVE-2023-4527"
 CVE_CHECK_IGNORE += " \
     CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
     CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
+    CVE-2025-4802 \
 "
 
 DEPENDS += "gperf-native bison-native"
@@ -61,7 +62,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0025-CVE-2025-4802.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
-- 
2.49.0


