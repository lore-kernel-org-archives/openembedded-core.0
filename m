Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2C6C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24320.1789481941760452679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DyaaF1AT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0WU53537455
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:19:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=T5oIfbguW
	waOkTkUUmWT/XjNdNZ6mPwNdFtYhHl3Q90=; b=DyaaF1ATCh5XwYtJLw7aKXRcq
	7e6BqKzT+Qnr+hzCXarg9XC8wHw53ulPO3OfrClmF3p/E1CE5VEqrDxwCc+AJxvU
	uO5cSfLqQNvuNdpKp+mxga90k03x/BJNSJeMW1EF9Dpuh9YgnU32YIg5xb58vw+J
	tj6BDu7JWRbmGTqokYBTmZPTgWtIXeoJpAu0IdhiKbbCWRJPPwe1zZ+HpqRty2dQ
	ET3gDVxeJxNBJufxNq4f4X+uCK9auVYbxy38HT7C3aKWmlnR1YnxgNPKuUfp00a9
	QvcisI+l3lxJdMnONA9qzfNz9aGrvnAIeBrpDa2aRpaPkilkhqmQAWmisEsOQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022121.outbound.protection.outlook.com [52.101.48.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn68g5a6b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkIE7+iNB+Mf3wnGpruwv2z1hFWPX9KxcY92/CWR/JFPbftAy5At85YcV/O2fHRAZPvO+v8+gK1m4TjZfoO4dvBsjQJfm2J+5otAaZ6IRMJjhqUFF/1yZcDeJgn27M/ESo7QURfjsEzyGNW4Pfnok0gjqCkYTlkh17oi0mKRaplbKkTtlQDs2bjG5gssyYkDv9ykR3e9YQGG8xYu/QWm/VigmD/Bu9a4oe2UH2OeBfQXvL477RoVDtELbJtjRtIOm9u5Hy2QbfhVukYqrmwxgVWg8QCg3FW3Ybm8/4Zj3qxITzcwbnSCfYjh7AnvZ4uI/jJKKvz0gHS7qX1QLanFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5oIfbguWwaOkTkUUmWT/XjNdNZ6mPwNdFtYhHl3Q90=;
 b=GztEuQNjhUI/OvbgO3XG0yJPaEgAN2BYn3MdwF+kiFyOQVnz54jSJqHby2IhLF7byinRlNT5VQAQtsyIY1+75o9zkd69edwlLjBHk+nGFaitVqvoWgzCtx1ySkAQQ1M3zE2gSFGpJk9C6WuOYX9to+bqt8IMUAI2fjBPp8IAanRdsQ9pnbSuHMZRipj6RYpOazjmPETqIf3z9YWxiR+Cwik+YGpDBDXyN1HlTkG5QUHCOliTYBPtzqv8kcjroRzoH8/doAQ+ZjAr+QfUvXLPMwiuSwbvRQJKIdRm2jCdFEmXQWawoGVP1xCAWRAZKocv2tlYwR28GSR+hBTWsQ6VDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:18:56 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:18:56 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Randy.Macleod@windriver.com,
        alejandro@enedino.org
Subject: [PATCH 0/5] rust: reproducibility fixes for arm build hosts
Date: Tue, 15 Sep 2026 19:48:29 +0530
Message-ID: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c414a4-3f54-40a9-6e4c-08df13344708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|6133799003|18002099003|3023799007|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	6pju1unRmeWSw3vFrw8qElruqGoWWUTwGp4QajCTNDiM+El4Tvshgg4hNjZ5vtKZor/1/d1eHBHfjRINNfbiM4NjfFSpk+nx8nfOBPk5KERvdI7L6pngU1hCszcF3mJ+ePzDcu6W0C6IS2nWz5Qccgfq763dv0rKwNyQDR14OUV1Q4aqpgOK3Vfdn56HbdVnRa7Z841J+FYRehc/NIvESIRRlituV6FEtg+tRz/CacvnZgobnEqGIAnREvz8UGwEPC1WjEWL8jSszmEyPwAogUgDvaeqrXu42Dvu40uDyZjTyJSiG+LwsPeVdg6kSEHXB9ucw3lFl4oQHRnMSbu2wsiu1AePtuMXFQsEVqs1DcpYQujIoec0qFBYw31db6HRhsdaF1YZGZOMizffDK2pwpqiOveQL1Z3fLxiE8kCzqfllhKtNq6XrullBfYOdk0sJotpLNAZcVShXN9XG6lP2cGr95g0NGh2RgHbWLqtWqTvmooo49GWoJMpQe8XY64zH2/kcBEMJCrZ+/lVxCyYIZYGldI2hjS7xwOuKXTskxNCSJ4ZD4MnOZo91+Kud1+yb7XSopZHT6zHaAYXvgB9KYBJkrML8tPxWzuxrcR+SCgYEofeTJWkjOYVRQoLbOYXLjlYhCdNTeobc1yptfvT3IOhAueYbECs/IeyBzxGIYg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dvqgq+JnNEYh81dl3qJxC7SyWoQzBhQXyqCKXicwkHAjh4St3Wc71gxzktak?=
 =?us-ascii?Q?FBZthflMnytyAo3+QvaeS3kXCf5CL3u0qMZsCxVufvrGvlaaYjLCwIPAnQ+J?=
 =?us-ascii?Q?op6Uye6LEuzDXNqF4VUXZRWmndznoDZ4tVD+yrHVDWfeGxBysHdQ97nnhW3b?=
 =?us-ascii?Q?z+SvOfdXe3yn7PyNI5zt2IUzgh40ecfUYMBrfA8QXZfTx+LRbR0RZypeP6Zj?=
 =?us-ascii?Q?RAH6IoIRnzksevdNxbdVi1kBusWygS1YXR/s40zXMRXnyFEw5Vk2tn6SPswf?=
 =?us-ascii?Q?9NTS1ZUzIaEwvHb1zKMFVsdU1uiB+E0rslehyPthtL+x21Sf2ArozPEwPSud?=
 =?us-ascii?Q?FZMmf2hARSsT84zGd0cPyOPc9bIVbuKgfK9ksUqPmgRcZSmVzlxVZJLd6A6x?=
 =?us-ascii?Q?uX6UghIzq6VIQo9qxuh5qKiVoY9e+gOi6lPiZa+cdWx+R31Bk+Gs0AMi3slQ?=
 =?us-ascii?Q?/XaBJkvYEG8YiqNbDqejvpBDMSA7Tw3wT/GNqhRMPrlb6bDuu8zO9LA//MoK?=
 =?us-ascii?Q?69LIhWAgCCAwQbTg2MoV61J1xYKNk4UXmgHl5UXtlbteDMEF5bnrEpcWlSYt?=
 =?us-ascii?Q?uj5tPsO7K50/XeYB0V19hXvijcyyb+JyTU3+63UU8u3qeF4QqpSJGgzdVa7O?=
 =?us-ascii?Q?nHT45JmtAdnZa3dHOHcPcQ+5swZLA8KNz4lBmUuV1Dy+XRm2RF+O51f+UGkt?=
 =?us-ascii?Q?eibHEe1TF45Lm/JeLeomWV+juXbjZ4oW6NCThQqYe8PWMHMEO0tuXBjf4bwp?=
 =?us-ascii?Q?aH8LNm+tq+2pElXUUZbLWGtvTRf5pS6kTJDowmMrX3ZOKIIpusqIOeqwwbdT?=
 =?us-ascii?Q?t9kOiwwI8fLMgJ8d1CD9AQJxra9rnp5oyFZ4PPmZxG9iw+p1RC5eWVUcOUVA?=
 =?us-ascii?Q?D8CU5+oIRvzKsEV3aoWR5WzStPsctwvOsxxDcZIxexd02Hxgmw9UZY5wYsE2?=
 =?us-ascii?Q?KXr682YzLWHQBxMpL8COW4tXr6BY8lQk4dEYxxDMwMcUccE+dUpemnPr+Hyx?=
 =?us-ascii?Q?9Clz5Eo+43ow4HtibbAbOOTCd9Tj1DPYTnJZ/2dsi48Il0M1xJVyBM3UpQwp?=
 =?us-ascii?Q?rpy1q5rzfYMn8U1Vl4ozDV/t0v4iXoAz5AG5jplRTAYI0eHxuvC1+sQuDheA?=
 =?us-ascii?Q?+oWDe1BYYRxyhT2Dte/3Utof/4nkf/lhVOd5EM4auS5n6CUEYx+w91Vdg5Oq?=
 =?us-ascii?Q?NzfYbmkQEMSdVBkQz8I2Ua2oOs82l+Kp+tESn/xq2YaaHVSQ3AbHGKfez1md?=
 =?us-ascii?Q?L0xMmuFaNPIuSlH8DwZP1zPr7PifGsFwECrn20coAfCMWQIaeLDdzVHr4e/N?=
 =?us-ascii?Q?Ktmn4FHV/z8BMv96a6DqkrXbK6yeFuVlrwrPO+lH3BHr11bY8sfnbRgPcfoM?=
 =?us-ascii?Q?iursNoiNHyopgtBMAXXsYyb865Skiuukno2ZiAb5LpKEEkpFwy5IjWJud0AY?=
 =?us-ascii?Q?4kTBJoLmbKmj5u8NTfLOpgwJnGacVw7tQmrtxlVB5a6mY89REz/d/bnldI+a?=
 =?us-ascii?Q?DlY862u7kBEc1mKrRtY2uLzC/DXgVmeIRi2RNTU2o+SU/F2pQ+wujGJq7oQ1?=
 =?us-ascii?Q?UZgRpTeU78fd2/DdNgcpkT00LMTMzAsBeU0xwXGCd85OOSgXsqtQkUREYuL2?=
 =?us-ascii?Q?mmHXiiTTpJvD3o+YcF2hj5e4pc5CcDxyEV0iL2m9zrDJWiS7j6hTUaL9AWon?=
 =?us-ascii?Q?6P2T5L+al6fO+lxCyatTsqp6r7xq4eu1EsATRXPGKP7A/0tav5/GxHiQzFJ9?=
 =?us-ascii?Q?dDe6cMBwoyAB/ujCWwDPOSvXVrAQiA0=3D?=
X-Exchange-RoutingPolicyChecked: 
	u1Uk857HonjJWhYdv+51f4TmGk0R2wUWfBCpuODzzIXD9loKyPkvnq7XU3ZB1WucvK1DOD9j7RGsyud27fqxD3zEEfttoQVXaB71apgE54Gwq0UzfBFMeh+ktHF65ZgptG1MJeNWlKDp9xZbJuxmBtBPA8voTX9ORAARxkl8nEJ2u45i57OFNUKqsP/thuP/0nXVxkt0BX4eCWq8zDGfl1ueFQ23Dveu8/t73SASRTulsXjK5ZfBc5CX5Z8DH/1tZ8vf8dJKxdxEYk6HDpw15tjar6+QWUaSuLZKCFoVno7a6x2JG8Mxa81oRyDwFSPuknD0FKcUU0yAofJNm6tJ3Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c414a4-3f54-40a9-6e4c-08df13344708
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:18:56.2865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjcIpdznpO9NMQ+fQY6WEYiHmB8oB3mc1tBPO/LtiDO3HBf9uL1Xz0SG5+AJPPTIF9nO0EjOxL/TvFwT3ePl2U147163iqVCRxMlL0E0w4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: z-XdyRtkOsiYvg3T-U5kk5Sk8QSsD2RE
X-Authority-Analysis: v=2.4 cv=cswOAF4i c=1 sm=1 tr=0 ts=6aa953d4 cx=c_pps
 a=jtibSCz00SxEcFhpBRTXcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Vs_BcMrPl2SSw5UGpO8A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6Qo2kg-ja36JGamqZph8mPE3-1yY8crh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX4y3D7W3aIqS7
 JVhOjuBuhBsKAExFTKhAX+vnahPNv5YQGj7/U6dUW4W+cAAC3Rx26PMt844UkUB19pe/60BxLHK
 /fS6YKlYPOQ5Nfp8WPUfRyuLwse2FIGDW/5udtt4/o+qSyxR2TaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX50+1RNsv4PHu
 dhgUKAEhzDLkCuco0hazJXbBt1W9T79hTrHR3KmxfzOiLl/jt6DUftPGUAgZOnIoYdAcCqyfT8R
 DdCtVxzRkUt91wLz8NG6XG3wT32MzNkG0s2ugNzcV10eKDvAx0lmPsC7B7FCevQx6NRT4kuCoME
 /K8Gipi8aXfDFdK9DGwytZ5uI8zGnOJVimCo/76RJ3ipv5C+EsLqWNylng16eC7q5Z6Rvwyco/H
 hfZCIb09nrpfVGqzeXv0HFmri3KM85wA2L7Ey+3zbu8WvTffsClZJL3fLR1Z6oWRYcH6dEM0cGB
 fiYyDe1AjPjCdF7jgST1oQQu8Pk9slH1Psd1ZZSCOQII5I6YgUcIHreOZezCpuQSBla2fLKDfhi
 ttD+6ts4Jsh8lumJLxHSXM/XFyt+EHzTCR8/OaIH1JS7D7TaTWKqMo0azSzAf0QeAcZEHen2ZR7
 v15qqhXlamdqJ0gsOFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245843

From: Sunil Dora <sunilkumar.dora@windriver.com>

The reproducible selftest fails for rust on the arm workers
([YOCTO #16376]). This series fixes that.

rust: drop the cc object-name reproducibility patch
rust: hash cc object names relative to their source roots

  The patch we carried trimmed the build path by matching the string
  "rustc", and the shared-source rework broke that for one of the two
  sets of sources cc compiles. The replacement strips the roots the
  sources actually come from. The OUT_DIR part is proposed upstream as
  https://github.com/rust-lang/cc-rs/pull/1902.
  The RUST_COMPILER_RT_ROOT part is specific to rust's own build
  system, so it is not part of that pull request.

rust: keep the build host triple out of cargo unit metadata

  From Alejandro Enedino Hernandez Samaniego's strict-version-hash
  series, carried with his sign-off:
  https://lists.openembedded.org/g/openembedded-core/topic/120939810
  cargo mixes the "host:" line of "rustc -vV" into build script and
  proc-macro metadata, and target crates inherit it.
  Upstream report: https://github.com/rust-lang/cargo/issues/8140

rust: backport deterministic DocLinkResMap serialisation

  Upstream commit f9d9939 by jprochazk and mejrs. It is in rust 1.99,
  so this drops out at the next rust upgrade.

rust: sort hygiene data before it is encoded

  Also from Alejandro's series. Upstream is fixing the same problem
  with a different approach in
  https://github.com/rust-lang/rust/pull/161450, which is still open.

Alejandro's StableCrateId patch is not included: the value it pins is
already host-independent in our builds, and it broke three rust test
suite cases when the autobuilder tested it.

Tested on the autobuilder: the x86 reproducible builder green with
zero differing packages, the rust test suite green, and on both arm
builders rust, rust-dbg, rust-rustdoc and libstd-rs-dev gone from the
failing list.


Sunil Dora (5):
  rust: drop the cc object-name reproducibility patch
  rust: hash cc object names relative to their source roots
  rust: keep the build host triple out of cargo unit metadata
  rust: backport deterministic DocLinkResMap serialisation
  rust: sort hygiene data before it is encoded

 ...-host-triple-from-unit-metadata-hash.patch |  62 ++++++++++
 ...oc-link-metadata-order-deterministic.patch |  40 ++++++
 ...hygiene-encoding-order-deterministic.patch |  58 +++++++++
 ...ject-names-relative-to-source-roots.patch} | 116 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   5 +-
 5 files changed, 224 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
 rename meta/recipes-devtools/rust/files/{repro-issue-fix-with-cc-crate-hashmap.patch => cc-hash-object-names-relative-to-source-roots.patch} (70%)

-- 
2.43.0


