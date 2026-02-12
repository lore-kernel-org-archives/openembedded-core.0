Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772B3EB491F
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51751.1770919877389597616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j7btAn+h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CBxsAs3786310
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:11:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Xu8vJTLSy5rL3ICPVUleT460u0tP/o3rs48VuHP1IFk=; b=
	j7btAn+hOe94EbpYXmf1UygzXLBb1sTfe5D0ftKZ72LJbWqLVCjdALBuwFuDzG71
	wZArlNFR9Pq/efdBp755DnpE4MriugAl+IR1EWuxpEpMmY56X7dDnKQbWtWAX8NL
	xRQZbx9dhupS+9fKF9AhHIAA5pXP4TEn//hUQA0oNFLXwlZRl0XHHFFxprrpYny/
	SPqqqkFbjjK6+igrJu0sYpIPstltea6wqMHTDKv0QvozK4/C7X0crrhobAw+GD8S
	7f+LXUuiBTOazNjv/8xpiEVOpKhxCljAGEqZasqZdBMcwRt1ffg6u3lmD5imazY7
	H19vtAYTtNZII6NVPyI+UQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4xatn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nARywDzNwnlzcz8edwsV2PqVuARVyw4Nx4E6SfzGPu3zk/bsili9/jMXraTa/vA0bmpURcR/hL9Omx+Wev08RCrflaoynxc7P0q2zesn6FrF4O8yUQmuXhHB9Pgbsz7U05bUsDeqCSwCjgDNX/hRsopVvSgJDhe2iMHJ8EJrKY7QTHTKvxPN4RRq2XPSaH9EcvNS2d82n6GkYc0o5TRZhAj5eiIGsOA8EfzgcJL6MdznJtl2nCFQmm1vno9zMDyGIDU9j4A8dBOoPFI1cwzP4OXq6hoS+/ab6euAyp32sD+2Th5t2/TRIIxk/Y8GRGdC5SrImfzpcNZ+uuGc69q3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xu8vJTLSy5rL3ICPVUleT460u0tP/o3rs48VuHP1IFk=;
 b=itdj+LdNNClfPk3afAWkog2JMtgAOwUSuIy9QLVWwQeJu9VsFuGNPQbjhgtOHjWvjF7M3p2Jj6UJekLkNpmmOBzEJBa2O/rbUAdcWgz5juRpgJ/me0c8s9Fd7QuE7/NIKO2sP1tfl03Q319CX6ipHLdTwq/AyPl8OqawxQ5g4atn9KyO+ZvQ09cP4CirI9F20IEWRpup7Cl6GRKEax9M83f9F/4gJK205ddpL4ULMPMq+0GRUiFVkF95VmJjrwBynM6ZA3pWnVS4YM0X2kLAhVfH4N0z4WIJOyJeJ/xD0vu7cjt7s6aunQ/1eGZTUPp+Iq1TOX1WDDLQJ0qh7BIUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:13 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 08/14] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Thu, 12 Feb 2026 10:10:33 -0800
Message-ID: <20260212181039.1826154-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ac4062-78ec-45a2-470e-08de6a621bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8Ivr3g9AVOK0PTsYWCai+oMwQTe3N2SsaEF/aqkQEjN1KP8OUWmhdlHc4SkC?=
 =?us-ascii?Q?xvulx9rwFWppxyAe8eC/8lG656CH2KYz7jRfuN9+BZcOBccTeQF8WXmVU/sP?=
 =?us-ascii?Q?1wn7T33KNfD3YKFF3h0RX1hO4WB5sBUygLhTNwoA7YA15Jmu3CxQf2P5k1jM?=
 =?us-ascii?Q?e57BXWF+s3HiIHUPA5Nzy+9coFMOhd9mMDXUfNmdtoALgdvZhBKhX2dajTA7?=
 =?us-ascii?Q?3XwefXB1S70EB58JDuxaHkZL40Xw3JR3NpUquY5CsCT0TGFsNazV7qW1qu4t?=
 =?us-ascii?Q?MJ56bqGAl1eY01wzSDJzMaCj2f7Vi5DjTmYkjsmTvi4ydnuzGH0y4ZU14DK0?=
 =?us-ascii?Q?3b15j6SI5ixwtW39N/5Q/tjrf3Ihs20ihsduJ7DswEgtsE/ij4orLsbCSUCi?=
 =?us-ascii?Q?sz4Ysrxxi62z9oyE9p97Ke9t+JP6e7hSsysnqnZpZeL5vI+fBKL385xAPW7Z?=
 =?us-ascii?Q?58783KV4S2Otd5GCncWlLziz6m/sd1QiqSMPnRMV6425kfKTvDehmq0haXis?=
 =?us-ascii?Q?kFi8OPZUsym5CK29V5/ao3q0uFOrv4+bGCfioe5XKsSpwG7IJ2CPMhxYJv0q?=
 =?us-ascii?Q?8ZLgcizlYlzTjmI+sEyLlrtpPZCMwdJkyx8tECQSJg0Vh5I6F0o2D3VscI9G?=
 =?us-ascii?Q?JJAYdfDbvd030RHqIXsGdo2GD6C7mNrmPuy/fScKrqQ0sFhc8iGOsfO4BwOX?=
 =?us-ascii?Q?7vX2/HkAfnQk0UU5C3ZfecimZjv5Cy/B4vz26B6cs1HJg071orBLzGP0pWVB?=
 =?us-ascii?Q?mQVaMw9MiOVAsDjuOw8uCiCyBJH9E2OZX4N/G3CN1DOHEcmk8sWwyEGk7xDz?=
 =?us-ascii?Q?ydNzut5R/SNpgQuvCNpg+SXKd+q+ulN5Ef0dRLxpQaZtWsVBw8cGk4CV82bP?=
 =?us-ascii?Q?2Z2PqNBCi60VvBpbbd9/76ZAvBJuHCC+XB9tliz/AUxdrcnEhnPi8Ijx37OO?=
 =?us-ascii?Q?6rqCh3GXB7jWh1XdiDFn1EvfOnAztogB2D4jRcqx4Rv/aptyAvqEGIC8Q/eU?=
 =?us-ascii?Q?1d1G/oHOz2DgcPGU2bo18I/9y/LrPZoafHmYuiBGqkcoc6XwWMQze0SKpyop?=
 =?us-ascii?Q?D7Os8aORmyrc/tBUcdo7Bd90iwEq+cA7CLSgGzcPxDHxi962S/uHFhQ8N3Zm?=
 =?us-ascii?Q?vDQvF9Trc+wHNDiBnJzNcxOil6cuUdVGQvMYhhp3b15/qQ1zC2ftG5mjcr/S?=
 =?us-ascii?Q?+JhG2Xdfq/M+hUECmW8ietiZQel1uHLTzSwa17MizSr+MLtH92clEg3/2msj?=
 =?us-ascii?Q?p9Vvuo0gZHmUiJWnKcTLPr2UG/CWvDcgflo5FtMpXVZ3/cvJyZSXO6ZNapHq?=
 =?us-ascii?Q?A12kqrpEXcBGeYVrXTeN9Ewmh+F4eDkzouF3T6lMxW3yfwpPTiaGNMHq+3ZJ?=
 =?us-ascii?Q?eJg7YgL21ODlRjk1X5jIsXtqh6PH+4h0YUm1s9dES+e9xzwzJPMSI6HKWcR8?=
 =?us-ascii?Q?CaDhUTPgLFEih11lev3qGOyixCThRx5axvfyZHJ0/IErtXLqQojehma6xX2K?=
 =?us-ascii?Q?C07ZFyVma4w2w+KhRDt4kjHxGXDPFwuiYuDD8NhcM02+NWENtr0zmT69qrK7?=
 =?us-ascii?Q?Hb8iSb0xCk7WJAPyM8jmG0k2E7lVnTjGoBgEbjEuyxkA0KG3dDkHlJuekYDm?=
 =?us-ascii?Q?Iid45qR2CnISJetkYDtjp0Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5LMFdWeN/ulhrf1nkq5gJpG68/IZfCAJ7SBCx93pF5GSXsour1Ug5PEL+XL+?=
 =?us-ascii?Q?GJk78Ypm6QBvg+AOHHstJLlpGwOt2eIhXP77v0E7fxuB9oUSB3dFkNEHBbOb?=
 =?us-ascii?Q?YT6W6xVw36ME9A3iQTs1qRQOENA9Xp7GE9jZpboAu9ULeiJnWTnGUyOWhBHf?=
 =?us-ascii?Q?sc3C/2Ms5QsoxYn4lw90N5v6hs+SpmUfLDADKMg7uVP5hJZcqViq0/RzaUvf?=
 =?us-ascii?Q?y3x1Rvaq7HCiWTRKIYQvnCua+DDaiKjP0Jse0DsObUOhHFPKef/apZKaZekk?=
 =?us-ascii?Q?R3u2cbvKs6xEMb0d7Ph06UMTeWPszDSuw+f2abAeQSerCsW7M0r/5DGcEPBg?=
 =?us-ascii?Q?GJHUlrZDKbFPh9YAiVAsViXglZgQmCpA9TqeycM44LEhg/aSQ4V9xWB1vP+H?=
 =?us-ascii?Q?rzvfWwNtM7ieNhBH+k9islF3qQPDav3jXvGdsjTCOHVrEQJ9cTMA1V4QcTM4?=
 =?us-ascii?Q?dTtiMM0z0dLmkO8Qdj3xysR1mzu8CST9ORhVR/EJuWrQ06OhfsFBX3hR3NUk?=
 =?us-ascii?Q?6yL9yiuxqVqCpx2UqYyeL1UdyBQSZbsJSamJSfXaxw52XRn3y2mxqD9l8o/3?=
 =?us-ascii?Q?ftbNTklqANhFrLRfYtcmqX9hzgx9HaPSRTdAPrUCoPJ2FcOGKMCwPYGil6ai?=
 =?us-ascii?Q?maqOXNnF8xL5irxx8GHNIai0BFNrNw5exh4+pJ9F1RveYkFCQc72LbYKVKRm?=
 =?us-ascii?Q?VXTB8NrDPZaHu5abESswlW+tGKFHfMWNSS5wflhA978GC8qEYJtXP928JtVe?=
 =?us-ascii?Q?HZF/JWUHK8j9jawchQ+3XDcQxxD0BmyWRhcxcJI7tQ2uuJuOUKzCIC8J9DiW?=
 =?us-ascii?Q?9KWKQJxlruRhQPfXO5Id9chSxVro7blkTotbwvJLshsmsZsxw0ZBXH7YccAe?=
 =?us-ascii?Q?Js5qSStBm3DoGXH8EQ2rnfCeonxD8q/iF7FhBKqpCOPn1wGucFeupsCmayDz?=
 =?us-ascii?Q?Jo9Oxyv0mj1/DMllYKsqePMSHYwyZ7P2apeBys6qsXNs8cXoXGBJysGfLM0H?=
 =?us-ascii?Q?j1ORNYt6XtkD9gko4lpFfyPIQG2WiGGjB+DpfprTMFnJ1gYQ4OoNW0LZULZF?=
 =?us-ascii?Q?4vxsUNBAJNmLtW2gIHsGUEO0Vk4h9zrLiGosuGBwI6GW0KTIAHiU8iIZ1Yv9?=
 =?us-ascii?Q?12OGGMa4+Ni+0lYcpEwrOL/J8v6qqT25JBxkTYTk9/e5lrDNZD/HFYmNS0VM?=
 =?us-ascii?Q?qGCR7yBXlZEPPijWvrQJtPCZLmHjkk/xYlIKsEmlNtvBB2TLUIfyeMikksOo?=
 =?us-ascii?Q?JkkZJgyfQG2ZDjHaIDMfD3xxpKdGjm/07h2Vu5jGeSluLiNJ3ttdDqhN8ali?=
 =?us-ascii?Q?1Jjos6GnBy+iYuWcQ2kLHqJ0qJWA6xGlOok7rmEqNFVZnZIuf2N5UpW3ObbR?=
 =?us-ascii?Q?EFD3tTHYcsHumgkYkaXQEBamzdB9W3RH/0oOFO38/rYpkJf50VtRzSlfqrnZ?=
 =?us-ascii?Q?19rZhZWIP7Xu69fil8v0AA6wRDseIctUGQbKmUE0R7jULSGMge3wYK2HeoLO?=
 =?us-ascii?Q?cua8O7aPolGFO95CtmW0cqohSAdnvQMCIpsF0WcI3d4GXk1+dJpZy2VoTTjM?=
 =?us-ascii?Q?fHSU7HofBP7becFn9L4gcjxP/yYdUNofP2Adg8W7/6qeMOJm23oAELbtW31V?=
 =?us-ascii?Q?OagUkeKP6Ib8VnqR91enObFYTnf5XYkzAcF9XJ5u5gB837WKjS9DWegNyDXf?=
 =?us-ascii?Q?VvcI1NV/Lr3mWA7p9ao7fJxg4suqnPxliHnRqmBh9fksnrmBE+jVn5SKbyxy?=
 =?us-ascii?Q?olgNy7awZBc8jkScQzIt6t1ryvRuGe0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ac4062-78ec-45a2-470e-08de6a621bb4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:13.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiKFPVP6LoL309jY2h1TFNQoWd9yzaDFB5HSSDbHz9Bb8/tCN/MtksjRksvo5j37GuSiJE5v31Izg1jp/WWfwdkc0p8QkRBV5AqzqrAilCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698e17c4 cx=c_pps
 a=qaGWf3H7ZUycNCJ7m3WmPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=VuBSspvWkCZ0bjgt3uMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QRPSBdYfQkgW5veQ_KAx9t86FN0FLOwi
X-Proofpoint-GUID: PmVwpxNWzgXtu1IutybuIm6LnNp4UQQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfX/vFeU2SvkV+T
 58ehoXejJ9CR3rmc1JTm8kjyHPjx17TVDfwIp9EAOPCu3psXyzIHYO4CLz08qbNqzkL2U6GDXwG
 j1RQjmYBnY9VKNEHT7M+QsGE+oamja2Nba4mX5snMj8YzdnjVCMBd5eap33niD3h2qdNFJNm3sR
 di0K5DSDZahAB60vJYbHqZ0cOzFONZvI77OCo+yWw2E1pScZejNZTEohCArOtVaIGKbIzusJsbz
 EzQl4lIslHaX0uKLjMm8cEUapiYjhN0eRs+j6e1SdG21o1fitmJ2vK67i6+mjohmQEMT8OtgrLj
 Aj7KVWdPI7NUJa7KQWV7nzXkuxcpiXVVNXU33JRSHBR4MtiRiFHvfp44r4x0KlrpvS1ixqkiIcf
 1fR5qEVtvYT/2nuU+mPOy+EMqoXLZrmiDMc953QZP59LDPffLBl1rn+VAyqyNhBs36KlT8I8MSr
 JBqCQgDfb2DAjpt7yvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231064

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..d9b09a3d9a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -140,6 +140,15 @@ do_install() {
 
         cp -a scripts $kerneldir/build
 
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
+
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
-- 
2.49.0


