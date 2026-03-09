Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D845DFCA170
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20767.1773078280702473477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KglrSfW9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296LbHI4160785
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NwgnCuty17uTHhUfVoCmfuXde0r180ExWZdswjYJrYI=; b=
	KglrSfW9/NtmoL5tPUSSvnOjQQzwvOvYiFbD58UXTjhRciY2joQFVZT8YWW5p4Wl
	fRD/QQDIcuOmZ3hsBH/FfbGO5lpJ8F6rFHRN71Tr67ax1GTGibxYzezzv/8f2KAz
	TnrZb9OcaFhXMSIqFT8sCPARxJN47yQUZNtevX1IfGx1PF9OFVKvdmiIbCT2eMaO
	I/4Q0H1Y3x2Ua2ukirfmzMpbIq7LbtEbZhw56DVtqzVo2vNktVCKBkVrM7P6sTnU
	6lckDSp0kthhIwXbHX8X3DjS6TKDUSLiECkP4uOfCJjkemjM/LoFwaF+M78sl0I5
	bTMKo7hbnPEnppCLYwe+lA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278m-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVzUR72TnYnSSJyBCh6S2EU1r4vOsaRiOhw8RKZ1ykVpoDUmV+1/xDPJGydP0SrTdyRQKUclJZtGWwL/8geCZz86lGG80ZLiRieGXAFrn8ayiwUaoKFLlb2tt9ScFbzuITksMFWn3tep2NEfwXk08m2UV7rEtepkaovXcfmLAv2W1A48NuCYlmEgUSDqMta0H4trXke9/nDdYWqnI7xlRjZuwnjts+sRnizQFpcrVGZltHx7W5HtLwKoKX0ypxSXmmO/M2vm11bWNmRjGZV/TYfcPIr77kzVxJ7xVCzhxLijTFEZo+7ax+y8VZOIwb/jxvyt/W6yrBuuKBHVBKiLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwgnCuty17uTHhUfVoCmfuXde0r180ExWZdswjYJrYI=;
 b=AsBhPFK9Kge63E68qZQjoOkT9lUdexiHfNzmcTMQqoKaNdkLdKtRv81PKRkM5cxFD8geFr0nDdGGNlIRNAqc6uj1SY8W83kVg60NmPb4/+pi1dJXbRRQwuHw5z1XPRoa1O9J8TPcgvRlCoSaiGSAq/b5+2QdYrj9IojicXLGkqHZE7jm0ATRLZmUcfbGih3X1OEgORF/mVEvgnlfiB7m9/8Nxq4bCjMLeykznLrj4Fzd8jPSrnLiga39s1cfajAfV2FL7YBzgAkHAMv6Q40d8CFca+l8vaRLVWYaFNDRVpd+TioqvwXhV4ehBnhWsYCU2oJ/f9+/9DONM2HSkHb2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:25 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 09/14] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Mon,  9 Mar 2026 10:43:41 -0700
Message-ID: <20260309174346.3384212-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eaf9cba-4808-47d6-6b50-08de7e038129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	5ergMkmo8ptEZTei8MqSsW9UotyVuq4dbqtSLjQKtY+C/rsdBmKiowRW5L6av34sQfWjdt+3HdFPZ4ah/lbp2pYN5ic42h+ceJA9tvoRDwF0/Qv161Von2PAkYr8uRz2zcNbvG/DmxYDmAP8otGdZSPhMekUIhUxtiEr1ddtTDZT6XV5rk4mpwElLCn6fbFsFHrGR0/8T2nl40yD1NemviNt5NzkVZuH49ax+LMsIk/Fw2QHqyglqrzQWHfFvz5CgoxpKwfmLYYOB7o2CPEGKwf27VwzYQH38T6WlBGF+ECFyTWjaFIwM0+dXzjLiDiD7cc/6l3ERTm0KaAn4yewWgYe31DO2uGSIpgXcNaxPfUr0NfSnUwXefuvI4y2aUPQ+QBviw74dmYQDSYfhEvyEA36HpG56hO/oxbhDwQZvrZCPmaiL8ITXz+Up6fXUFCoq2sRRNqYZsGreAuuBxJ4RB25fvn13aCySn33RjoFnPGB6Ivq5Bzezqn6an2Ohuo9Zv3nzGOd17On5SMbbH0dHFLXS+jfB4ibl8R6H6m4x/I3lU+LGoj6KVf1AAr5UM0CHB+mTAVeLPFe51pHXplx79+mjGjmdXd42o8d1IGqA5+dr0muK0fWlQZmA+fu0TKXCZxLrLmwm5RqEcMlZG7VZ4zV8DY/5An/6hfmsAoge9T47h7m4344epQSqpCSck5iI0m//cCRnCPSorGhqgK9AEhtba9bj4l1G4v2B1iczoTD9814rznSbnj5bWUT0cy5e44eZ/wBqaGUhQYwZMI1ZK1JecxX1K5XlYG9Yg8nVqA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jvr79wtPquuVPpsKIA9LNhnarjzd4kLi8gtXgFVRjF5ZA2v1KmCevf0HPj/B?=
 =?us-ascii?Q?xpH8oubuudC1CU32eiPvHCNoBIkoqkkoYe6J3AIPFbwSTMBXIrS9/N/jq+6g?=
 =?us-ascii?Q?lxnRPNC3uAW//LaFweYyX3mfqlOB8tMOZ62p9EvIm8kSMnjUiENrn/A6j8E0?=
 =?us-ascii?Q?z5Lc59JmDdce5yk4zUAHmmQFdSswNspOynY9pRQRc/Z1KilT361tIttUZ9gs?=
 =?us-ascii?Q?fJVzFNBbyMi/K7zwwOvKQW/psVuFRGmYB1tH051hNjn+1i1kej60uY777EKr?=
 =?us-ascii?Q?vRZui07aSj2ROdtumlUjf3yCo2wpM9i8KyfPqox6YXkZwcqYJnUA4i27HYp4?=
 =?us-ascii?Q?S3ak9K4DdOz1cYr21QRWdEuuzxutwxU4uL3owSskLCs7a56aa+6u7m2NTbiz?=
 =?us-ascii?Q?HjanLAu+L5PwzQKtCKqa7EPyR3Lr7T5zPG3pV1XmteMsDdfsOlYEif4/9wTb?=
 =?us-ascii?Q?BplkpwqAxhFXg+wx1TZwGxXaUEmg/i3NgR/scpzWBN9/a6Br1nyfdHkL3G1x?=
 =?us-ascii?Q?VWxHNqsX1iIAxSgFzdfdiKixMxDOJ7oL/F+IbeA1qdBMaQAeBv+bJx5NFps7?=
 =?us-ascii?Q?RxKQPWL+V603CPvR0Fhc/eoTD93hYV2tDANVi83jYcJIDu2/Qgrh9je66k72?=
 =?us-ascii?Q?kphbIQ+9Y8qCFrNs5tjq8pcQPDNuJZ2U8ow6UrDFIdQK6sqQWDrzEM7TZMET?=
 =?us-ascii?Q?38r9DedwwZb7eTd1funhIJWt/H+nWtgqZhlvaibs8SaEy1+02Kj9vBoN/iwN?=
 =?us-ascii?Q?pel8kmgq7x4N7ni7ITiX9kvjlP0noyO+5zGX3nyy0S4abUzIfgKogiiVR1fk?=
 =?us-ascii?Q?U/nzIRi+yNKDwvwZAEzZ2U55T0TxYL+mVXjHggLygBwOPSG7SP4J03WKZPtL?=
 =?us-ascii?Q?qRp3HA2ULRidK7V/4gLbT9eiLtQiEiNliDKbvXm7X7Fa1/ased8dY2buWRp3?=
 =?us-ascii?Q?JVD7c78mOfOeGtbllvcfrxqd0/BraHSk9SmXGYJa2pqlIdn3h6jFLM/MkGJ2?=
 =?us-ascii?Q?wFyDiYwXDrcTjJPrvlqExicz4ptQnv6Rt/SM1fqk5JU0e1SP5DRi4E8K2aZd?=
 =?us-ascii?Q?+cUgLHZiT0ZACRZhr9d+ihDZ5TWzGNIbB57Fnzd1CHhO6VsmYhgJbeEGWnJ6?=
 =?us-ascii?Q?b8Fi7kQOPtK5B/atP9es6MX5Do+W3bG43SykoEqqZcQ5zDMSUednHHAn/n0V?=
 =?us-ascii?Q?tKTu55HJTnljxkOW3XxUvtfFNfIDCn8Xc98T8tn2ukmaxblS6/y+zbhcMu12?=
 =?us-ascii?Q?4s0wAV8zGMcEj5o+ieg20LdRllA5kBdG31k27oScj/t0vVDYjKxLpXKY7OQP?=
 =?us-ascii?Q?JwaIVl7UQPaBOdQ1NrCoWGc9g8g4j8bqLsLKcJ8Kt/46Kp/8wvR5aVYfPxFh?=
 =?us-ascii?Q?bH5CTirxJfOLtaN/K3Cauf3Ft44l+BjgMM3RySm6abS9bBrkFUvlTI6qI2OO?=
 =?us-ascii?Q?UXIEtxDkZGWiXJ+kPMCj6zrXf1/AZLaD5kk9GRitDE29eUaDvTZ5ruZOryHn?=
 =?us-ascii?Q?hTnF7SC56KEit6rFw5rRooZocg/N/M+bGsiJBi3SJS6hSDDWIjo+/+uI8GsV?=
 =?us-ascii?Q?MitZukP8urWsgJqm6cfYCdF7qKWOff0+c7axmdFwGYelGzPi9MVJ2ReBJj+Y?=
 =?us-ascii?Q?Hf67058mUz7aYnULxqlMebb9O1yK+HZei56v3+6qVJnEdJ7wXyUQzPd1u1FU?=
 =?us-ascii?Q?Vas8ue3xlczXFaxbTv69U4nlXMivBJvU6sHQHPz0gqxNx445vRzKaiiYvGY1?=
 =?us-ascii?Q?Mf4RpjwBpBGpNfdH8lgPBdIMgrebQiE=3D?=
X-Exchange-RoutingPolicyChecked: 
	XLcTtCO9izsorK1ISz3vY3iEos0+JvpFQfADQ1Bfknx4QWF99PhGYekSm0t/w2edUOA7/9xG3ZUe9hJn+8ZbcOm4M7WFnY70huq9vrAQdcpzp4QG5Ym15MpYiq+POfr/Q0CbFCcrCarKAmnrsByVjbyYml90InhPybVTNO4WapGLQZ2YuyZmqjbRW/J8GeKPbAkeciIOskNXxI8z8YhoZvCtm8xWxn5LJrRA4YkcX4bqm6Kjo2dhWKLGe7HpPOmCRUlQl58yZ7Y8pu6Uq+rSMJg3cOukimdqD94HqlmLMhnzifWdabpIlczUk3JhdAHbrOnY3mNkxrL8XTEv/Evfdg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaf9cba-4808-47d6-6b50-08de7e038129
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:25.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y4G8XwdwfcfRjMtnCRFGKWv/u2FtK19/2JbTKXgFDPdS1mTUvx9/KkB32Cbw/PiqcrmnEWtGLrjfZTSYjKQA/jr2I6Vd1UtoeTN4vLSyN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: xhqEuqCFrmTbJi7asZwgoKfdZV9Cjwc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfXztE2lPo2i9pf
 xeebd7jJPlnYNrKUTNfYsIdB5YvQPlnDAYrWV15Cpm4nhvUJeLwuxEhAhnROtKUOHJsnBNIFW5F
 Bjt63O1F+GNDgIrNPV75UZ6v5kmGKMdMU6CebLd/DCt8JRwui3CwejLWobx1paXwzVWD9b46MTF
 Z/AFHZ7a+ov7Mdf3a+bB/zkUzM8L4h0cLG2DM6s0Zp546w1KOwsDAwH4KqG5S4YLz/ajaDlCJsP
 ZCxHK3aMTpteqHLadR2fcD1shhxxQ/PQvm9TAY+elQ5RasdrPaL/XCfIh++5L6NDSv2llRm/QT2
 BJJqHrUf8WSFSq0yTF5D3OQIH5tSACyMRznKh83Vj14TrYNL1jPlfl/N3HDso5mTDNngRj2yK2J
 SirQ8eWxckfS8/XY82l2UGwHS88yZgEWJUVCIIiTw0bCYT9HYRiJ7uvxkD/Aj15n2TP1/47nYYU
 5w6YSmNNliRXUC+kXWQ==
X-Proofpoint-ORIG-GUID: Sja4UDQxeM-e3eguFWMHDphjJJ2uk-0U
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0707 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232745

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..6b7cd45684 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,30 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                KERNEL_RUST_SUPPORT = 'True'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                #Disable status check due to intermittent failures on armhost/qemuarm64.
+                #The module loads successfully, but qemu.run_serial() occasionally
+                #returns an incorrect status.
+                #Bug report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189
+                #self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
-- 
2.49.0


