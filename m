Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97654F5140B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 06:35:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63968.1772778928772236084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G11kOqpU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752549a871=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6265Toes2779952
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 06:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LC6nVy+U2
	/tYJZBRaZh/1uoH4kMZHjGlBII8XmM37yI=; b=G11kOqpUQIP139cgizYsDx7CB
	0Rm7fe/t49utRHi9lZJYMBBqIdroNUcHfJ5Lq7abJX/9HLLx21uw8Y0IvB6Gr5mY
	3itfpQEXzAij5aHtk53aNKCiZclbi1bBBO9cCc4Ga1dPYOvjFTe+KUJ0/8ekEeuE
	nP3mxVBgyVwRjcesC7sCVUbSVh6bLjGle1Z+HYdyiHyqr0bR2s2T0oUYynf3opr3
	qSw7DDKZU0ZcS7tZRhXm6FBgs1skJKhyrnSQ/MRt6tnvM10t/uKlfTpD+JBeQ2cw
	WS4lLVDbrKZiubr52dPLkBqYza3a4RP9ckbXr7jONJIs+jfEtAQk1RryNu0FA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvqm9s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:35:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sbnrk1kXSxdmCwdb5YAJBByqsbadQvh+wVhsbQ8L4X+8WSKdlIfz0Dta5qT1pu6WKEseBK9VXLnh7efjdCOSd8WDWeQaZliBxXCJgVxs0W+WmXr/49JboRrZi3uUdYBgK6ZmeFGD5kE4nAaet9aLMhH3webhbf0tguUngtNLOp3odr1hZYvNk3po7n5rI0evIc5+nNua7F3/fCDYprNx5pPvG3vXzvdlhT/DH+HymFml5X+Qot1/lxCR6LUTHrOGZpThunHXfKSrLro2IV7BzfSRJmYkDIVkb1tNfxbYtUGhAMXymi1YcnMjVCA3FyaVM491olhgHngzMUZH3Ec0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC6nVy+U2/tYJZBRaZh/1uoH4kMZHjGlBII8XmM37yI=;
 b=Q3pISnU3U8Z6zuKVZVaujv5gwhNuv30049erX+b6VsncBK9F7Ia/+/o6IyIy2i9HxJvU/CmLZ+MpjCMCU9WLBWNLNs1PfDf73cpgQUTQ5h0oof5VEZFO/sVuDqKOeyIerzgN7AEKGbFIi+BsBbN2DmTGmtfAIDWQmAOklu9vnbQVZ0MQF0Q3ifMZROKcPfkj9Ox6Yrt9RpIc7//HR+DsYsIu9D8IM4KnoAcVAx7213RFKnhN2NwMxretZKCZfJm+t1Jwyw/N4I0yIZYKkF111L0JmcpcvPtxVCgw/Gfmi3ORu8eyiXe+q4U0xrlsLdLaZsU6nh27YwuX38R0EJ2ujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 06:35:24 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 06:35:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Upgrade 1.93.0 -> 1.94.0
Date: Thu,  5 Mar 2026 22:35:02 -0800
Message-ID: <20260306063502.2712881-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b63fb35-0e13-4c79-9818-08de7b4a8c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/lt/QeaNnxRck1tRszEbiqP4k3zAkDJkCL70Ou5E5/UuxVfyMfD36ZgjrcDrl5NYQc291shYah81Azb9/nqCWfi7PrjqjQbFdv7idBbz1vGeEZX8l+GeOR5Ehg0jIi/2qILwOP5T9daEHaUmosQdde/94+umc5DBXKhb9BY7zgzylRW08oJH2ifUzoeG8GSjKguMGWJJRMNuP35owjQlEkoSEKbYgRx4r+XlU/XDTWEat3ZIAS1Xp8WIsyceDT3xkqq1W2KhI6bV7kWiwnu5QEcGUu9Ha278QQmYuEbsYm0AdQllXknFIK8osXkrqPLl/c1yOmEdVqdbcIPF5qkon1jkRAC1q9SWAF9WgbKM0/uLq/hP3JKxBCNvnmpc7QHGpKU1XUqC9uqhez6rWphn1i2yTtVFzrwLgDz7lY2uG88XjoZCGNoQQnsMtuO22alpokprHE8tGznGazpdgXG7VByKgCi4cst7FCMtkfultD24gOlTqwAhw14S8qAVgJaEGdJKZRfs6AkbI26KAqs391pfoOd54hPQpAf9MrfSIev9QDHB2kcnWjp2IMgsvTeDga7WXqHRH/Z5dF93kw6oAAR2/Qk46xV0vDEmSqv/S/pU+QX9YUDlJw76HIPp+Vw2uc7y9htzqn5epxePpR5PiDn/fNGrzn7FhOQhrT1ByCgU34zYHF4wufOiGJxYlC7mhqT4vc/tAPEAsm1Tzj4wyO8hKjoO7F8Igh3HVxTyBHvE3YasXlxPTQ/6PhmXOZxX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2wkUQzDZT6oJ25XDy0jtKFYkbW9PeeRMTNDKqt5EXaRM8RtkdmjrNVxsPjsf?=
 =?us-ascii?Q?QGLHB6UIXidnchftVp8spAWhUkqcRWHmwsw7Xvm+hdPzdBe9AACs3zUcqZn5?=
 =?us-ascii?Q?QsqANbin0/REFJNOlZZFxyPKArFCq7Ij5/3tnfxfWolSqkcMZQ4Ru9Qi82Xx?=
 =?us-ascii?Q?BJhN50t6miKkgFfYt4+b5ywLxqg989Ub6DhVWt6OSC+WwrS8Df3iB9cyU00Y?=
 =?us-ascii?Q?Dl1Tze+8WmZu63FH80BhFeleERHoQ7jspVMOU/BvjP38C1fGzgD8y9nVg1gZ?=
 =?us-ascii?Q?3W7dsmVOJz2pSLA6WWFGvWf7uslVtL94sbLK6UEImxqON/3BfbYTV5EFgM9/?=
 =?us-ascii?Q?BXslbhQRw/VyA8mZ4KZqp+Nwo4tTwGSHNteJ9TiPnKSSb3WSrOr6Ggs1cXm+?=
 =?us-ascii?Q?5aZvcmoe7h557/9dfSt66/gk95k84+LttKOv+wj6jfu+CzioR1GkFFYlD8vH?=
 =?us-ascii?Q?/+/xBjGgGM/GN5agmetdZtR4mvKrQAUZV9WIyPkrdXmIwwr7RMsI75GrJRin?=
 =?us-ascii?Q?uu1nj/G/TPLlePG/NEPPh84lthfU0FXDkGk1yiDqcX/e+Klhx7eBTs6Iy66v?=
 =?us-ascii?Q?VeVtvT4AOQBSxq/wA9WfRrhdHcSPd1u2aDtb7SobpL8ox5FzTZ0URgfa2xS1?=
 =?us-ascii?Q?gsK1raGPyASgRVb89wpnmK8JLmNLNbhKYhp//zjBVBtBexzECAHn/X9eLD80?=
 =?us-ascii?Q?gseAkeMyVIfiEInze6XG/zzt3qc3gkcrY015J+0hguZYsThlWYzbzxXh0zar?=
 =?us-ascii?Q?mWCyf81MBgFKMRkLuRqfgLPOWb0I6KhLPiVNYLJQquIahemglZ2j8SmRYP8A?=
 =?us-ascii?Q?rne7olgqOqiaAGh71Kc6fty80+sG81f2i5o3g1gnGuIFE7qrvohq+0kOhhAE?=
 =?us-ascii?Q?Q5aGjoIj1YGEZ5HjLbp4I2Q3bofEfUeNdIpA11r/6XYYknDRx4JzwIWjE3Z3?=
 =?us-ascii?Q?KI5IOotR+lT0qlX186DS1kJNe1Vip+VVW5DCiEBNbEqkrEWWZwOlMs7s43mu?=
 =?us-ascii?Q?eht8Ar0sjSIO147g1AFgmlcXLZzrZF1rC/wQ67m6RnZZhvYrSQPGRJeJyPJb?=
 =?us-ascii?Q?R49dRFnmL6Cj5/tb3tbtTysPniZePveAScuzBv8k4tgBTOELtPraaXzqaRA0?=
 =?us-ascii?Q?o42EIP42lDW8G6iQThNIwXvErkACm0/E3w2xMXT6hNErJNB4Q0iObquvLOTG?=
 =?us-ascii?Q?2Mu1b8fwVRsgTO1C4fqAgvTVrrT5BPsE2nDaEvDn82rfOTjZ+XRvy/5vDlYq?=
 =?us-ascii?Q?zazxUWM2R004zRKYfBOcbpX0KqQqS31k/Jw3ScpNwk6t0moCG32rG2KaM+qT?=
 =?us-ascii?Q?dU4fGtpBE9aEGxlyOnjAksoQQ4LRVnuMB+13PkoZLZdUV8msBFYg+BNEvFbX?=
 =?us-ascii?Q?faFe/SzwlpTk5HGSmmuVDguft03lHnlaV+Kwz+S1LhAEJ/PuCuWGCpWpVGDQ?=
 =?us-ascii?Q?01cojNKUhH750Hd1uaA1RJJO77eKePWuXYHuD9jPw2R3DBJppw/aFn/hPoNN?=
 =?us-ascii?Q?WXad7ILKynsYAFfHfsQC1+ET3zUcD/bQKl9r0Kd8vC/t034Z76v3pDTsvWi6?=
 =?us-ascii?Q?9KjqRZ5sTO0GjAWKMRII9hu4+UEREdhz0NgIe8RCXtdT1w00JrqLWylOvi18?=
 =?us-ascii?Q?ToncCQFPnlFACU1L4mUf9SwsMABiCp+8azKXOG30/uekXYmRmHy2J3qjpI0x?=
 =?us-ascii?Q?doWs3nTIowzSZ8/jRPxh7TLi7Hg7Z6DsUdGLyLkMgjn+6ZRx6HVR8War8cD7?=
 =?us-ascii?Q?ilQ0gv/G3TuHQd6LyCO7xk8PF50vMDvztHv+qBP94waMUg4gzWfb?=
X-Exchange-RoutingPolicyChecked: 
	gv6FiqESYpxuYo0kXX5qy5O90ED1IN9wxiYdbo5i9sG0Rjm9pDHzrsYTlQ0L9iyhTfu59ZdVyXWB10Ocl/2BHlacEuHjpShSPM93XNWLmrDQQRoz10uuXSwLKH4ZJUhA7A1IxUS3A5CuVMZdCt3D8Rgtno6WYTjtVO5lMsFkPprxr8NlxTFLXokX65fK/BELQh7wwynvi43kBw56y7yRKYq2GualZfJZSkw8SKP5UoNwwNeahpoJy1eN1tjzmBsx/UaYJZugQPs7so+jpMAe/nO7tZinbrXWsHtAyzwEvnqN63OPTP2b/Nop3+xI4wmg6NuMbOIfbrkzAAwdpaG3Hw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b63fb35-0e13-4c79-9818-08de7b4a8c39
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:35:24.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxcMjHsu013kpU7ZrQQYMv9pUKHgfh5EfCk/Ae+sb2T1vbv+ZDiIzF6aemGWLQgOoPDbsjLFz/7ffaYEYju1UTWrYOhmPfCEBahoLw3K0qpXE1B1GNElXGOU+Zb4lnbC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
X-Proofpoint-GUID: U8Pz5zk7IQNG_GtcTDjOOvRplZRcFo-U
X-Proofpoint-ORIG-GUID: U8Pz5zk7IQNG_GtcTDjOOvRplZRcFo-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA2MSBTYWx0ZWRfX5a8+2zILibuG
 zdAlxHd1zXgY4YPqZLwHqnOmfx8YwCU09/d5OAizb51QHX9huWGoozwKUIhrbRrmUwkOv4iVB/B
 Kp+go5G64hcRmvFExPhepHAIkE/4tcubFAAtlXvxAz5r9AFOr7jcM7QiwNnoGje5Gfg6mDWRhkW
 TDy6JlDeHzymEP2+SZqGH+W4o0TNCQrtlhdW5VM9JXXjEvZD1blLSeyVJyMQWl5Ww7wtOsgs5vD
 I/z+nzYID+W77zjBjE+snj7n+/gxAbdiddTzVxk684wNKs6yMtKQh/yQcAowViIp73jno/MGbV4
 7P0i2MaTkYukLQ7C8fxSuZV//TmP2S8TiCmeQcak1gpqgM4L5lkosCAiif1GyEu9g4mAiYsibnH
 33Wz1vfe4aAuxVEbfMlA9OYzZ8SaaPNVCpk8Wyux43aLXe8dIlDOalGeeTkbVrsd3FUz5iatlnn
 hyl8fJRId+D0YuzsL6Q==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69aa75af cx=c_pps
 a=nYaA4L0hYP7ZHAKl0WLIGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=ei4SEBeUAAAA:8
 a=j57RdskLAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=gIehTGONNNwsOgDHBaIA:9 a=4vBCUijPwtmRX65I:21 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232533

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://blog.rust-lang.org/2026/03/05/Rust-1.94.0/

Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.94.0

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-194-2026-03-05

Rebased patch:
rust-oe-selftest.patch

Backported patch:
0001-Update-call-llvm-intrinsics-test.patch
To fix riscv64 oe-selftest failure with 1.94.0

Test results:

rust v1.94.0
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  21910  |   659   |
| qemux86     |  21657  |   912   |
| qemuarm64   |  21722  |   847   |
| qemuarm     |  21638  |   931   |
| qemuriscv64 |  21684  |   885   |
+-------------+---------+---------+

Test results difference (1.94.0 - 1.93.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +221  |   +13   |
| qemux86     |  +218  |   +16   |
| qemuarm64   |  +227  |   +7    |
| qemuarm     |  +217  |   +17   |
| qemuriscv64 |  +218  |   +16   |
+-------------+--------+---------+

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.93.0.bb => cargo_1.94.0.bb} |   0
 ...001-Update-call-llvm-intrinsics-test.patch |  86 +++++++++++++++
 .../rust/files/rust-oe-selftest.patch         |  54 +++++-----
 ...ibstd-rs_1.93.0.bb => libstd-rs_1.94.0.bb} |   0
 ....93.0.bb => rust-cross-canadian_1.94.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 102 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   3 +-
 .../rust/{rust_1.93.0.bb => rust_1.94.0.bb}   |   0
 9 files changed, 168 insertions(+), 79 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.93.0.bb => cargo_1.94.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.93.0.bb => libstd-rs_1.94.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.93.0.bb => rust-cross-canadian_1.94.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.93.0.bb => rust_1.94.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0c82a81de6..bd4eb87ba7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.42%"
-RUSTVERSION ?= "1.93.0%"
+RUSTVERSION ?= "1.94.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.93.0.bb b/meta/recipes-devtools/rust/cargo_1.94.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.93.0.bb
rename to meta/recipes-devtools/rust/cargo_1.94.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch b/meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
new file mode 100644
index 0000000000..9fa91c0002
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
@@ -0,0 +1,86 @@
+From 1d678f6b0859ea25c2abc22eb4104a025a5737e4 Mon Sep 17 00:00:00 2001
+From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+Date: Mon, 2 Mar 2026 04:22:23 -0800
+Subject: [PATCH] Update call-llvm-intrinsics test for Rust 1.94.0 IR and
+ multi-target CI
+
+Rust 1.94 now passes constants directly to llvm.sqrt.f32 instead of
+storing/loading via the stack.
+
+- Updated the FileCheck pattern to match the new IR:
+    // CHECK: call float @llvm.sqrt.f32(float 4.000000e+00)
+  The test intent is unchanged: it still ensures the intrinsic is
+  emitted as a 'call' (not 'invoke').
+
+- Removed unnecessary local variables and Drop usage to work in
+  `#![no_core]` mode with minicore.
+
+- Added required crate attributes:
+    #![feature(no_core, lang_items)]
+    #![no_std]
+    #![no_core]
+
+- Replaced `//@ only-riscv64` (host-based execution) with explicit
+  revisions for:
+      riscv32gc-unknown-linux-gnu
+      riscv64gc-unknown-linux-gnu
+  This ensures deterministic multi-target coverage in CI without
+  relying on the host architecture.
+
+- Added `//@ needs-llvm-components: riscv` and
+  `//@ min-llvm-version: 21` for CI compatibility.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/153285]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ .../riscv-abi/call-llvm-intrinsics.rs         | 26 +++++++++----------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs b/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs
+index e72a649a530..fb520d38df3 100644
+--- a/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs
++++ b/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs
+@@ -1,17 +1,20 @@
++//@ add-minicore
+ //@ compile-flags: -C no-prepopulate-passes
+-
+-//@ only-riscv64
++//@ revisions: riscv32gc riscv64gc
++//@ [riscv32gc] compile-flags: --target riscv32gc-unknown-linux-gnu
++//@ [riscv32gc] needs-llvm-components: riscv
++//@ [riscv64gc] compile-flags: --target riscv64gc-unknown-linux-gnu
++//@ [riscv64gc] needs-llvm-components: riscv
++//@ min-llvm-version: 21
+
+ #![feature(link_llvm_intrinsics)]
++#![feature(no_core, lang_items)]
++#![no_std]
++#![no_core]
+ #![crate_type = "lib"]
+
+-struct A;
+-
+-impl Drop for A {
+-    fn drop(&mut self) {
+-        println!("A");
+-    }
+-}
++extern crate minicore;
++use minicore::*;
+
+ extern "C" {
+     #[link_name = "llvm.sqrt.f32"]
+@@ -19,12 +22,9 @@ fn drop(&mut self) {
+ }
+
+ pub fn do_call() {
+-    let _a = A;
+-
+     unsafe {
+         // Ensure that we `call` LLVM intrinsics instead of trying to `invoke` them
+-        // CHECK: store float 4.000000e+00, ptr %{{.}}, align 4
+-        // CHECK: call float @llvm.sqrt.f32(float %{{.}}
++        // CHECK: call float @llvm.sqrt.f32(float 4.000000e+00)
+         sqrt(4.0);
+     }
+ }
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index dc4ed9d94e..e96598fcce 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -10,7 +10,7 @@ Signed-off-by: Peter Tatrai <Peter.Tatrai@siemens.com>
 diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_errors/src/markdown/tests/term.rs
 --- a/compiler/rustc_errors/src/markdown/tests/term.rs
 +++ b/compiler/rustc_errors/src/markdown/tests/term.rs
-@@ -62,6 +62,7 @@ fn test_wrapping_write() {
+@@ -60,6 +60,7 @@ fn test_wrapping_write() {
  }
 
  #[test]
@@ -119,7 +119,7 @@ diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
 diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/mutex.rs
 --- a/library/std/tests/sync/mutex.rs
 +++ b/library/std/tests/sync/mutex.rs
-@@ -472,6 +472,7 @@
+@@ -440,6 +440,7 @@
  
  #[test]
  #[cfg_attr(not(panic = "unwind"), ignore = "test requires unwinding support")]
@@ -127,7 +127,7 @@ diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/mutex.rs
  fn test_mutex_arc_poison_mapped() {
      let arc = Arc::new(Mutex::new(1));
      assert!(!arc.is_poisoned());
-@@ -388,6 +389,7 @@
+@@ -457,6 +458,7 @@
  
  #[test]
  #[cfg_attr(not(panic = "unwind"), ignore = "test requires unwinding support")]
@@ -230,30 +230,30 @@ diff --git a/library/std_detect/src/detect/os/linux/aarch64/tests.rs b/library/s
 index a3562f2fd93..d4e52ed91be 100644
 --- a/library/std_detect/src/detect/os/linux/aarch64/tests.rs
 +++ b/library/std_detect/src/detect/os/linux/aarch64/tests.rs
-@@ -27,6 +27,7 @@ fn baseline_hwcaps() -> AtHwcap {
-     }
- 
-     #[test]
-+    #[ignore]
-     fn linux_empty_hwcap2_aarch64() {
-         let file = concat!(
-             env!("CARGO_MANIFEST_DIR"),
-@@ -39,6 +40,7 @@ fn linux_empty_hwcap2_aarch64() {
-         assert_eq!(AtHwcap::from(v), baseline_hwcaps());
-     }
-     #[test]
-+    #[ignore]
-     fn linux_no_hwcap2_aarch64() {
-         let file = concat!(
-             env!("CARGO_MANIFEST_DIR"),
-@@ -51,6 +53,7 @@ fn linux_no_hwcap2_aarch64() {
-         assert_eq!(AtHwcap::from(v), baseline_hwcaps());
-     }
-     #[test]
-+    #[ignore]
-     fn linux_hwcap2_aarch64() {
-         let file =
-             concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_data/linux-hwcap2-aarch64.auxv");
+@@ -23,6 +23,7 @@ fn baseline_hwcaps() -> AtHwcap {
+ }
+
+ #[test]
++#[ignore]
+ fn linux_empty_hwcap2_aarch64() {
+     let file = concat!(
+         env!("CARGO_MANIFEST_DIR"),
+@@ -35,6 +36,7 @@ fn linux_empty_hwcap2_aarch64() {
+     assert_eq!(AtHwcap::from(v), baseline_hwcaps());
+ }
+ #[test]
++#[ignore]
+ fn linux_no_hwcap2_aarch64() {
+     let file =
+         concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_data/linux-no-hwcap2-aarch64.auxv");
+@@ -45,6 +47,7 @@ fn linux_no_hwcap2_aarch64() {
+     assert_eq!(AtHwcap::from(v), baseline_hwcaps());
+ }
+ #[test]
++#[ignore]
+ fn linux_hwcap2_aarch64() {
+     let file =
+         concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_data/linux-hwcap2-aarch64.auxv");
 diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-runs.rs
 index af44dfe..e6674e5 100644
 --- a/tests/ui/no_std/simple-runs.rs
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.93.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.94.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.94.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.94.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 7a0049c45d..cd4cce316f 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,58 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = "1.92.0"
-
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "7c8706fad4c038b5eacab0092e15db54d2b365d5f3323ca046fe987f814e7826"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "ce2ab42c09d633b0a8b4b65a297c700ae0fad47aae890f75894782f95be7e36d"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "cb2ce6be6411b986e25c71ad8a813f9dfbe3461738136fd684e3644f8dd75df4"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] = "333ab38c673b589468b8293b525e5704fb52515d9d516ee28d3d34dd5a63d3c3"
-
-SRC_URI[rustc-snapshot-i686.sha256sum] = "c1c920cd59e255e5dcf844af22b80483fe4b04ff04f143be6da69314bd6733f8"
-SRC_URI[rust-std-snapshot-i686.sha256sum] = "abc840631a4462a4c8ec61341110ff653ab2ef86ef3b10f84489d00cc8a9310d"
-SRC_URI[cargo-snapshot-i686.sha256sum] = "63001bbde1c036fae9ad624807bfb18117c7e7cb4a04de81adc4acc7e8580c07"
-SRC_URI[clippy-snapshot-i686.sha256sum] = "f21090ddb01503ab7e326ff8b1ab44121611121e83572aa2dba2c5ceffe12d22"
-
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "6207ea209b332c01437fe742c2ef2bc914c88b6d4f9a23a43bc01ad924f6e4a8"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "62e2568ebf6f1addc750a8c32dd1fa4fef8d27679cbac33b837afeb54f204819"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "32f4b393f1471d7d50c9a50512f02116187b3ea6a885c26ff2d74f87fa72baa8"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "70783e0b31682938db53b78f87c948acfe589e3ece5dee6ae6aa5b667a384f3c"
-
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = "961cb6b8c2b5e969ad8eb0256fee43b88608b27310d946a7df3c9e9577139cae"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "c3e809a324b00eb53096c58df38645bb496c6560de334dfe04ed0b77c0605aaa"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = "1249c64f95d8187b3a89cf8429329bdbc98f53a9fc538e898c95c487e3234d90"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] = "93ed9fdd6fc2655c7789ed096d57a47178532b6bda1ec4480adca7920563e934"
-
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "357dd4745f978080d35dbb6192ecfea331abbb93d88be7d70407856b30722a40"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "2ce706afa4a46b6773340854de877fc63618a40e351298a4e3da8eb482619863"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "e94a8f97c3143158e285b4f8ade1fae844961caca30c0eeed44f6c14da484f05"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "7912584254f455b90ed6ce6089c4efded33bb753d1bf948286ef2f4f782d2f30"
-
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f48a214ff6fa36a77de8a0a2ee009be8aa48ba1533792450aca5edac29497606"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "eba59766c2d9805c0a1fc82fd723acbb36569e1bec1088c037bba84d965f70ba"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "49dd01f5d10e3f368181223db0fbf7dc191161f7d80a295de4909bf87e53da58"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "873047278043e6506f5c98b8f633a9b96dc49ff83869a86a151fe5b1b9455044"
-
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "729f4c074ccda30bff493fa94f255bcfcec1be594fecd8a4d0f57da845121c64"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "8ee20dcf3b1063fa6069b3ce85e1fcf42794dfa783263314865cb53fff42d9e4"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "e8708d0a929ad15941ecde368e8a156911927a805b492afafc737124b6aa55d4"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "bdedabeedd48080e6ef70376c52338fbb45ff80d1fbb12a81aa2d8cabbb706c8"
-
-SRC_URI[rustc-snapshot-s390x.sha256sum] = "6a8cf614a74f7469c70d32b378f0163633e6bbe19624b248b758501c5bcdfe84"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = "ebf944dc95015498d322504a54e4f9cdb28590f7790aa3a9eb86d6cf4b6c93ff"
-SRC_URI[cargo-snapshot-s390x.sha256sum] = "a290edf359a5632dfda3b2325a309d9edeb58c97de97e3cc67274335b58adf05"
-SRC_URI[clippy-snapshot-s390x.sha256sum] = "41aa44f1cf37cac87b83e450eb19148c539ff266bb40dc146207ad5b9e1e1acc"
-
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "78b2dd9c6b1fcd2621fa81c611cf5e2d6950690775038b585c64f364422886e0"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "5f106805ed86ebf8df287039e53a45cf974391ef4d088c2760776b05b8e48b5d"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "e5e12be2c7126a7036c8adf573078a28b92611f5767cc9bd0a6f7c83081df103"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] = "2c1bf6e7da8ec50feba03fe188fc9a744ba59e2c6ece7970c13e201d08defa9a"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] = "8b984b31ffca1f27d32ee77ec2cc4c2ab59e72beab67bfce13bbd926dbea8715"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "d85afb14120c3c7367338a565a920db653dccd4bc5062398791d7b62b89fd1fd"
+SNAPSHOT_VERSION = "1.93.0"
+
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "1a9045695892ec08d8e9751bf7cf7db71fe27a6202dd12ce13aca48d0602dbde"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "84e82ff52c39c64dfd0e1c2d58fd3d5309d1d2502378131544c0d486b44af20a"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "5998940b8b97286bb67facb1a85535eeb3d4d7a61e36a85e386e5c0c5cfe5266"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] = "872ae6d68d625946d281b91d928332e6b74f6ab269b6af842338df4338805a60"
+
+SRC_URI[rustc-snapshot-i686.sha256sum] = "72038681a14fe632e2b550392b83dadf40325c472dabecfff40a9efdc2d8e201"
+SRC_URI[rust-std-snapshot-i686.sha256sum] = "b8b7020a61418b95c1ea26badaf8db6979778e28dbadddc81fb5010fe27c935b"
+SRC_URI[cargo-snapshot-i686.sha256sum] = "2c6fb5893b4abcdf6af9dc3c4f60abc072318b0cb13f2bd969585910b7ba048b"
+SRC_URI[clippy-snapshot-i686.sha256sum] = "e8f6b16356548e2dbad3d380c07cd7b3654b49c513a15a2ceb9d17a49ac0aa04"
+
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "d5762adb6e1dec7e6af4a7347cde45c12fec3f0ceba8a05aff6ef00390105739"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "4c5e2e8fcc43aced123283e3c8c99771c99750b5c7ecdf95a45258f5e26618b2"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "cf1af58dad1098c1f56d3df11f884b8d87b0db30ef038d1527872b7cdd7c9785"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "41f588aefa9e8bcdb4969afc14d18b19b4bd524defc026aca8c0275c19d183ac"
+
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = "b31f5408c198756b57f0491961cf6dc84bfd96ff1c73627798015f27ecea6ef5"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "e851c0fa3e726ce3f7139c5803198a1aa9723594394734ac9e373c93d92e5ea3"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = "f8472c773385820a9c8fe375f766b6918bb659eb2d517db72eff86a44c59546d"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] = "9f48807b761998db304ade11573742f52dcd61bf62f3e339eb9975ec33feab65"
+
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "b483c5324966b7138fb3f6180f7e4a2e9a5162179a83e58bb52d1ee5036009ee"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "f729bb7d95705e12a92eb072e494b93d8822ca40aa4802ca780b0cf33b56d401"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "662a9d454073c178c052bbb001f7440ded82134185c7c656ba8fc37468799383"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "2242d23c8472b4d7efe6e2e538157f0b25d9ac99f6362b2cd534ba5030b2a71f"
+
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "fa0705079ee9eeaeee2e4f12a3ffb35ccc3d4334cccd3eb3106a3f59b96e88aa"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "d209ac698a69ca9b9035adb97a0ed8e60a08db52960198c3e03b9ee714c1a46b"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "a587e9dab9385ea0651dd45a6cb6101d6028ccf578a3e1140ce083fe9419921a"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "283b76a665927a7737dbf422d3a3459eb85e873a49f6a2de8cc0ab5a5c3a8350"
+
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "804b19ccf61e8aec4c0c6d3f115961982b155d96925eb34b651aa7f6493a2e8b"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "b769fb6c9f3e0419a6bd0b7b79f9191bbd7a48a9f243b23eb7d135711aa6de1b"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "1f0fc840db26c426b26ce8a943b887756e9552974a39248ad0166960fa169f62"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "1c8bbbd36200f525949a2a3b1446ddc863b99bdc2552b818919fd64cc27b64d2"
+
+SRC_URI[rustc-snapshot-s390x.sha256sum] = "756c25d32d6539a7485a278216f3058c1571fd503c638e1179b74a68611dd1a4"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = "41a65db45a288eb3eedb187b366f132d5b3615767de7ce994b123b342ac7a848"
+SRC_URI[cargo-snapshot-s390x.sha256sum] = "7d0281d26142bf124c0393a99e73b7b8ae6cb579cb7ebe50f696da6922d2129a"
+SRC_URI[clippy-snapshot-s390x.sha256sum] = "1cf85452916d4f5696d93e45849a99aba23884a3bd3d886d0179a1b2cf7d2858"
+
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "00c6e6740ea6a795e33568cd7514855d58408a1180cd820284a7bbf7c46af715"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "a849a418d0f27e69573e41763c395e924a0b98c16fcdc55599c1c79c27c1c777"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "c23de3ae709ff33eed5e4ae59d1f9bcd75fa4dbaa9fb92f7b06bfb534b8db880"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] = "793108977514b15c0f45ade28ae35c58b05370cb0f22e89bd98fdfa61eabf55d"
+
+SRC_URI[rust-std-snapshot-i586.sha256sum] = "03534ebbd698f7580cfb08798a7451e86bd9ec46327f4b41ccf2c2f8f1998438"
+
+SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] = "2a625e37c5b943c6c63dad7f52187572d1a65854e3950a8fa26e593f8231d711"
+
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "360f0a4eb41c3cd3792dbe756c0c5b5a36a5b41e3771b8a12d5bbc97bf51fdd3"
 
 SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 514f3fec1e..2fdc35e083 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,8 +8,9 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
+            file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "e30d898272c587a22f77679f03c5e8192b5645c7c9ccc3407ad1106761507cea"
+SRC_URI[rust.sha256sum] = "0b53ae34f5c0c3612cfe1de139f9167a018cd5737bc2205664fd69ba9b25f600"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.94.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.93.0.bb
rename to meta/recipes-devtools/rust/rust_1.94.0.bb
-- 
2.49.0


