Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01321C624D2
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:40:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7141.1788266415665818648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=prNJQTo7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37045bcb16=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681BGusX1415452
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Sep 2026 12:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3w5FItJtn
	VxqU9Y0R3DfBS7amScS/X6SlWGE22vn9uk=; b=prNJQTo7oBXk9jXrbDRpUP99f
	kXcP/Io5Jt+hvWLF8FA0mt+C7aL95Ycsv7aRIfHRxihr5y1uDIXtvFyIvekbFAVb
	+7M0ja5TPRmAPfQ1SKu09nFpdlmwB6sOy1bh+x/SQtlMnm2XttsYzluVkuoMVq3v
	+481A5Ow+z90MBSIXeQJFi4QaC9WcAesdeS0zK6HSo3S0s4mFSwBF3ME3Z2n30gz
	0XgsOE8uFwmdl+0M4khMKhTdaBe6dbP2zsjBb+C0cRzSBYpxdfJzWOwBQWkE8vnd
	nF4tItcubC0QOb6kF2mG7crbH3J3ni/u9ZTtsUR2BMUftRxkmR02bcsXEo1sA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022105.outbound.protection.outlook.com [40.93.195.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7vb16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:40:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDqhNUM7bq4mQSPQuouaA7MNTu56s0G+CDjfdlMI4lA5U5ephX/4WG18QB0dYQZsjeEhOP6kre/CONRuBELdW8UOOEtVX52eT1+VtQmOW6e5KJLmrGLElphoOJh0PxGrpp34s+ywzjC/Ue/fi/I3p5cEOmIxXK6CJrgzi12WbxJcsojOaI+qBQ2ppkgZxT2w6mnr27Icfj49BG63kZrpqlCt9HtxmkxyadRPuDsk+uEEatFfD6UCsj8rliqFMjzb4sYuNGpkJOKw7VDkXZwu+kUIHo12hmq5SY/GNUBLolCCi+C9eXtzEP0rGJrHmB3RwnLJwl27AP2GLI739YPhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w5FItJtnVxqU9Y0R3DfBS7amScS/X6SlWGE22vn9uk=;
 b=ewacHrScKXqAhMCaG9LJ9UHWMUadWF9Xa3k/RqP7IMW2FAXKVMKFt5cP4nqJkwXR8TpYXhhUKUJvoA6KmaWen7+7+zGxlk5zL4w+dNU3ThnHgiMARjNH+0QP46WNyHtWiQFOWVMdKHcimfRYkZjy9Dl9ZELGKg2/mdwGKG+hcoeXj6zPHqgNswdm82HWP8kpA9mOoynZKxcqStxXrJtVQoiJpBIA9AbXtyEPrShZttbyOBKNios5Z4t5UGN3SNFNI1oHUsrcQv369ALGd6sGBFMwvR3UsU3q/bjr4ds6Uj06sdbNNhFLkVrQO0B4myIEaikDubWxFc9JBqq0/cxEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DSVPR11MB9556.namprd11.prod.outlook.com (2603:10b6:8:389::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Tue, 1 Sep 2026 12:40:11 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 12:40:11 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] binutils-testsuite: Set CC_FOR_TARGET and CXX_FOR_TARGET in site.exp
Date: Tue,  1 Sep 2026 05:39:49 -0700
Message-ID: <20260901123949.1932035-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DSVPR11MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 541c1872-5923-4a94-183c-08df082629e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|6133799003|56012099006|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	jtSRnuPC1jPJQntdZUIILLaljR275WQxHsK0JmNt4R5w8kkVKbVtlWzt2+KGexodYmBOH6QruBQ7HLtM6lY1Epoia/3CpCuEXz45RYjl2VkW+IqK3lL3gcGP+w8FvYeFgDsWusd/tjoZTpMTLUgVOg6wXUREEukyGFqmoNd922fFUsFhl2wOgZW4jDImcIYCdqamLyxOpN9A/2I+E6ugctQ1ZQuDfPm//wjWUKVsVykNKUSTT2sK1gB3J2VhMq7AVzsvrlSAaJ0+uLZMNGnosn6zokp3EYaGKQmTrdv4hwNaTYDebSkpw+3bZhoIijMpZkKzeHkb7aXWlG3T1/+bIv0Oc2s4RtrCAAQ0WvA/V7eMG/enSQ+UhqT8HjmW6tuEnDujk4q9tRe2zkr3oyfPKboLt0sZSMlzhotk5CZRjqbavHFMnZMAAbT3sESzWP62cypAozpe6mc2zpPHGaVriSVfjQR8u/QSFt+rN300Vi1u4snf/T7Ztj1IIaKAosOCq8BJzvuZ233HkjawakYQPFT7MDSPVEKSM53a7eKbIB2Kt5g9JwlVkIqDvHbUpqfUb1Hy2HjnKWmMqY98M5KWeIx5vzm9bKJ+wH3PXVn8DDx+Nl2hEgO3ohntR9eemG7Lx3a7n0yjJkM+i4TbybPYE/Z5okW9qIVgX2SZc1heBMc42rUD8BD/TINU8+ThXdPt5Wlv8U5mGpgbTTjOwQjzyVOGSAltThhTxLeMbbQqQgI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(6133799003)(56012099006)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BpukR3Y++X9yeDwucYjxXs/fMgEUYvRozMCL4oAUr9BRfxghydjN3QTqVAau?=
 =?us-ascii?Q?12s3/rxf4v1Zltw/bm4AWMVu1AfpJnf3l+ZE3AIne8yk/C6WhIZv6hA/X9aQ?=
 =?us-ascii?Q?kCIXEzTX1E45bZn3ANXp+/2eUMVwfw42wRdM9wDlZSSNWROVXSR7u/C+LpCe?=
 =?us-ascii?Q?/Aov9G9891eL0ICEAoEzKrULNnWIWZ7iPvvRa3Fq9G3MjL7gCfzfjFludULO?=
 =?us-ascii?Q?+zL+41Gyzf5a4vFVau/WRGu1BPRdMJVObOyJ3G1vGpMd6MPZlHZ72HFaqEim?=
 =?us-ascii?Q?WpgQ1yJq5uyRrfnQlgCd/dL8JxNZwC+wzBlVu2y8vHhqpXpVdY/UEuI5efkR?=
 =?us-ascii?Q?jYGuz7AV9I8bop7Eg/O1fNahK8UMTiaq7kd8gzUriYJHZM8LmGxcLJ/jhjQZ?=
 =?us-ascii?Q?WK8YD7fc81uYqrE0e2xiSnvhwgOvYEcsEINTrc8cWgVVTfiYSN82eagqs1DR?=
 =?us-ascii?Q?5+yA8UWbz+1ysNIXWiq8uiNSuuawZw3v+x8A6UorB3DKbMaaBryEG9n/jKjy?=
 =?us-ascii?Q?yxlPNVc3M1i4B2S5G/1N2VGj6EvKIkHbdJLEbmevi0igMaBnxt5jC5CV1zXK?=
 =?us-ascii?Q?rfV/1HLum8+tAE286GKs56g7oGeMbQCrZwOUtV6yVkPrG0dB2EHGslu4UGUr?=
 =?us-ascii?Q?9AFBFjvJ3S9LwrikgRbsol4Y2YQvKGK/O3ybwQwYQPfh+ChYfE3bkElHQRCU?=
 =?us-ascii?Q?5JmXfgaT4TWUNLDQfDedElcxXTnIuWMY5spNfZ1vIZpXHTSCVEZV3ly47j5a?=
 =?us-ascii?Q?/ZvNoDI7tEZnToNK3CprZKi/+CDLdG4JHFHQ1Wvp5QT2+MhGo/my53dgZ2aM?=
 =?us-ascii?Q?c3diITTYxz8CfuwaNTNXELbdQSUjmKet++B2o0Nc/fyJ4R53DtVd38qB59K8?=
 =?us-ascii?Q?lilazOms6hFmCu+RpoMc3fx9k0g1120UToEcDYtiqs9Rl2Yccv1TMa3DNka7?=
 =?us-ascii?Q?b0FimZTKgWUKXaIsHYerkIEIrzE7KiyqfZsZNO+3KcxNUDYuSCFXXJiAFlxg?=
 =?us-ascii?Q?xgb5qOa5TIY/W2nqqE3X4ilpwcakPhL3wbPSfaJGmSMpmL55C5eEmBrffrOV?=
 =?us-ascii?Q?UWuZogg6mALLyz8oUiP0p6HcqDRsV0+FhktxMaor325xoZJf9OKuCIdvEe0Z?=
 =?us-ascii?Q?xidSa1Jp1R+THQWPQmDeNWCWvxgaB+yAiAODJrJxHumFye9LuBWIpC5vUpT9?=
 =?us-ascii?Q?xD+3JZZfxXbw4KNJMnXgA9Xyrwbl1z8ptTZL7vK3NxA4U5xmYXbFOHeXs9WK?=
 =?us-ascii?Q?PIvK1xjkIJrj/+3DgvmKZUjXaVVi6g7q5bIp2jw6r1VVOPiDNRAZ26Lf/yI+?=
 =?us-ascii?Q?TgiMbXxDYHBmwQt+PQAT3Wf8R/R7alEac3DxkeyUCVstpVCou8NRT35to6/M?=
 =?us-ascii?Q?udpVv7ICX/B8p14f/qdiWvJ0iDnG26QnjP88Fyj2YtemnhOamEWgM4UgRrD2?=
 =?us-ascii?Q?jJtAGbqN4iYWUMIOyK+a16xcNI13v3OHVqApBL7KJ+L3R967NInuYT6mpSKW?=
 =?us-ascii?Q?6D8zJIgcdRMiODglokh1enGwaG8T0XzDHfOfEMjZYl7rm7xb/a4KYxnIwynh?=
 =?us-ascii?Q?uPjaXHV3oTlcpga4BMa2+hSiD0L/ZW+l4XbySmWBfZAYPRUl59roS7JDg2fZ?=
 =?us-ascii?Q?JH3Jpni7mpJ42F3KAkmSIebNaGd+AYAQg/plmxLSJJD+rjRn9AthSfr4Qx9d?=
 =?us-ascii?Q?+kbmWkYYGiSkh+Fwv7dbw4E41vocN1yLvSCB6g4ap4fQQIIhDdo+9mxWdfQz?=
 =?us-ascii?Q?lZOFFyXqkN7ySFIeodEyyRzQZZyc5nk=3D?=
X-Exchange-RoutingPolicyChecked: 
	HqMewqNuQaLH3TB+lpvL5vzbt3+ZMQfk11+LjP4DQvNyGpa3BUDcHdgUTVzk/KI3efBqtWu3gOui4SQuNEjjImdc9k98whhMC4E1A5QAOyYc8Lgsi2U661+pU/c4cWd04MObyDL/QWWX1Tvm0eDq2GVvWCyrio1KRhysqYIGl+bdVhypjBDrFFE4vNjV1qrUeu6N1DFGn1PLXX8x875zJGh7Yr/jg2tQiYRJFI4w9hUir3uzOGv8y4L9LWwDYV8ZzoqH01c3fNxvF1jTOM7PtI3jOiIkC+WbzbBexRAVJ4SshzGnfww/VmeRCO4eS+t5DQ2Amq/sgugyNBufYlhPug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541c1872-5923-4a94-183c-08df082629e8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:40:11.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5XJb01/LROMbRVLwL9LPJAufjQk2dPlLOvJn3xFIJUI+Ot7nCAK335DCumvYQmh7xxpoecP1Ldom+cnhxr2hQkZv2YhbQKp6IK9BChvhQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9556
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a96c7ae cx=c_pps
 a=Akw1P2YqGpCvPVCIaa5zZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=PNh-RsFIFxOGUrQNIs4A:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfX/uCIXX1YKaiC
 /qaO51EJqvP2nTH3DFdBNpu0qqYvm9MpBjY/G+jjwbll1gyy67jY73EyMDg7xgh6vVsraSz8fLL
 XGitLksTzA4Adnby110TAtKNPGB20mVM0bEfsLAzD6KVlwdDaScT80Eb74mqGEdqXJFcUBElQ+C
 AHW9g/owUo7xe0tMROs5bgBn3r3w/e/qXuOAja0JjIEEhjJDN/pHyTupMVyEebD/x6fKAVaE7IN
 NubX4BCdiMrS048hZ6x2ncjKv+K+slHCSgqpxXaWLgPS+37DMEYhI7BKkefTkxR8w2XCNuqor2x
 t4N2+3fCiPFqTfMIORd+kqOLE7K27ySy9oRUGdOLXyGj7YXMMEU7/XtyY1Wi67minhGeW+EXD3/
 iHupwX8QiByq86jFvISPK3EbkFC8thsXqWzRJhtEydBuv625kbmnEau5Db81T7Iih27MHYpP2ea
 Mh+DLDZcxAGLym88obw==
X-Proofpoint-ORIG-GUID: mUbLB_Nlt-UAgoRKWMbP9N6ha1viZbGj
X-Proofpoint-GUID: mUbLB_Nlt-UAgoRKWMbP9N6ha1viZbGj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfX1cZSTDGCwlsV
 1m3nSv8vJODiUtLeZWAR8j0SaXVWz1ub9CM+9E7f7U8gzufZudQZqG0hh7X37y1H9xhcxhfBoJR
 d7oHsAk4pW78Lnt/fhBLJpMjYW4lKAj195/YpvBZ+s+RxYW1kJBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244825

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

The recipe calls runtest directly, bypassing upstream's Makefile which
normally passes CC_FOR_TARGET/CXX_FOR_TARGET to the test harness.
Without them, dejagnu falls back to find_gcc() returning the bare
compiler name without --sysroot.

On ARM, ld-selective/selective.exp calls $CC_FOR_TARGET directly to
query -print-libgcc-file-name. Without --sysroot, OE's poisoned
cross-gcc cannot locate libgcc.a, failing selective1/2/3.

Set CC_FOR_TARGET/CXX_FOR_TARGET the same way CC/CXX already are.

Tested on qemuarm:

 ld:
  +--------------+--------+--------+------+
  | Result       | Before | After  | Diff |
  +--------------+--------+--------+------+
  | PASS         | 1173   | 1879   | +706 |
  | FAIL         | 3      | 0      | -3   |
  | XFAIL        | 8      | 57     | +49  |
  | XPASS        | 0      | 6      | +6   |
  | UNTESTED     | 22     | 4      | -18  |
  | UNSUPPORTED  | 153    | 417    | +264 |
  +--------------+--------+--------+------+

selective1/2/3 are ARM-specific and are fixed here. The larger
test-count increase is not ARM-specific: CC_FOR_TARGET without --sysroot
made check_compiler_available fail, silently skipping many sub-tests
across all architectures. With the fix those tests run. Upstream bug
tracking the silent skipping:
https://sourceware.org/bugzilla/show_bug.cgi?id=34580

[YOCTO #16342]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb
index 5369333434..2219da7c7a 100644
--- a/meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.47.bb
@@ -51,6 +51,8 @@ python check_prepare() {
         content.append(d.expand('set CXXFILT "${TARGET_PREFIX}c++filt"'))
         content.append(d.expand('set CC "${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
         content.append(d.expand('set CXX "${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
+        content.append(d.expand('set CC_FOR_TARGET "${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
+        content.append(d.expand('set CXX_FOR_TARGET "${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
         content.append(d.expand('set CFLAGS_FOR_TARGET "--sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
         content.append(d.expand('set LD "${TARGET_PREFIX}ld ${TUNE_LDARGS}"'))
         content.append(d.expand('set LDFLAGS_FOR_TARGET "${TUNE_LDARGS}"'))
-- 
2.49.0


