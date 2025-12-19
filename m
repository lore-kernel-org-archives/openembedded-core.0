Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38843D74971
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:50:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13674.1766137834454326883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 01:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XKh3eTJU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4448c0fa6c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIMhf1c1863984
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 01:50:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=I1X5/9sqn
	wZEqxCPFA2lvLH9KXpVu/DLVDYCdlvLGws=; b=XKh3eTJUJDFBlFjLOOWGe/b79
	5NSLkOCqWSo7nNHsi5KFXbtrsgZkiCB52dyNSPIj35PSisRW7aZJgecYMoz7zLep
	RcCh2TJqO6fOUozs0VlQDYeYOJvCFQu6xDZS1cFsdtmkL2hNCD7mXmW5kOTbCa3E
	eHo0njebBxfEPwqivddJQRtblZlLKgfHtZGpy05WS4L7E7FzGhWsZW5SFX2FTN9v
	LQfyyaDftRWlc1IYtio4R7bck3fHyRBXsaJlmjwZDOKE07MjHNjkt/JObaxD88P6
	JeIRzG1/j/jcbizDwuehonZ/wi8g5O7iDASpXSLxh71GvjK/50R7hFgZdpPRw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2urpbn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 01:50:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJm67Y3L3tD3/ZjcbAjpUjryYf+G84mIyubpzc9rCNVz5rmRBRFslNCy0veronCsENfyu4rXIoIYA6RNvwZK4cW1VFFL3715oMcyHONGpiUoHbne/aY7GwljqIIrMgEySHR6CSDEWEfKRMS4tJ0DNedu7tq0UIijMqQwzuOWV7b/KzNTP/wov4stW8cBHTvwqhXmXlRskhZT9eRSCN+CV2iP0biIq2ZkL9HsBhs1HhdFXZuczsALFP6QYsf/+jpJ3enTXwXCbj+O0jTh+qm1FRJYEIO5gTUAcfjiom1HvL/2t7djQJbN7dlP7tlLCJtauIy0SmRzrh6T8YQjy6ISUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1X5/9sqnwZEqxCPFA2lvLH9KXpVu/DLVDYCdlvLGws=;
 b=m6n/ziDt2E9UAQJrWvWYAsfzYvqBNUusvJU51ypnp5hm2oCjG+I7aqePCIBTeMc1vwHlW/sjddhfJZWAX3FFU0VsMn3VwuMXKdDD7CI+eTR4KMbQp8uWG36bfVoyskvsUTjNBV9p5UL2cTTS1ANFcX2BpjWsKMLruCuKYy7TBUq0697XDJglVkSrSAkyHJGtH1QXMhhpzB+pEaELAgCRQmfEV/hhKSIln0s55Ayqn/Ma06OpveYsEZzvAobY9uvMvt3vudNBV9iEDhzF6RgPecdGWmnNJUVzTIYYlmESW9P6v5AzfXQ8AuzkdxzR8lUrFpo0qEne9l0Hb5IH05lvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 09:50:31 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 09:50:31 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH 1/2] binutils: fix CVE-2025-11839
Date: Fri, 19 Dec 2025 01:50:15 -0800
Message-ID: <20251219095016.497666-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 7657fe2a-0f99-4ee2-995e-08de3ee40c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4JZX5UHdgK9G7IvGd6Lpw/JkI25efJ8WelAO40qyfLYwNI8994H+li1JFQkX?=
 =?us-ascii?Q?sQSueNIMR8Vi94h4CO+VtScenWp8d1coq2wTQaCVmlGw0YnmMBM8dm5l3tAt?=
 =?us-ascii?Q?VHGLE9PVCtV0IzwwOHq+yqU+cD9MGkH+tbOfLpwcn5goDZbYH+0j5+clfgiB?=
 =?us-ascii?Q?8qgaRXEHTA2kNhWUsva8IkmVJNFjtnrFeJZaedCKSSoAH+Qx2O0qixnIQe6E?=
 =?us-ascii?Q?HuzDUjk2e7pubiDdoFxe5CZfPGCtQVAsOY+7OQ0kLcyqauGMM6/YBTpg7MT2?=
 =?us-ascii?Q?eYOeXtfykhGCWfUJ/zxcF9gNsgyopcysH4FjLQ0ez10ORNg4qOe0db/u015A?=
 =?us-ascii?Q?5oNQeUEgFf9Et8/RH2avsVJj4T0jMLXgRoTTZ+K+li5xoBXpY7EUQhb5aYcf?=
 =?us-ascii?Q?7PGC80XLZ3V2y3Al7yL2qYzR+HQ4OhUpt27w4Cz+KstjKVcNzCpSABd7M4PP?=
 =?us-ascii?Q?pz+tO09cN1FqAWJlzeDpJX3tnh96y2+Kk3/ECgJDbhB+aQvs+G43yqpt4PZb?=
 =?us-ascii?Q?rxDymqMs0t2OSmoM+0VJxkhNvU2s1FEBRqJOafegneMkpZlguBpqUK7WtsXX?=
 =?us-ascii?Q?hHeCWBc3ztjM/9CK3tpMR2+c3I5JJvfSJZRhzI1gO4vJgzGv7eJku9MLiLeZ?=
 =?us-ascii?Q?9Xd2fB21hAJfqLme8l5fi3EHk1v8SuQAr/Q8M8+TCVIWBPpkUKzlBjxJObud?=
 =?us-ascii?Q?oX+eE41N0QfTIJcHbmXQSXOhE/GHao3kMsbeXnSA3AzLbX18WtJVorVycR9j?=
 =?us-ascii?Q?5fojrLUCoFH4CViCwmJ8v+8qVQoh18aOUvdL4uo+sygskLo6eHZ/jiS1US/+?=
 =?us-ascii?Q?+zM+ckOkYgcvehkHklwUNiawtg/nFwx/eGuH9bnB7pFLQAb7579bubfDFv5q?=
 =?us-ascii?Q?TMaWTd+dUQaRrJei4V5sI8xfErwjMq/rM/x8S4LU4Vd3BrNxr85Vj6qi74tT?=
 =?us-ascii?Q?Ap0UDuQz5lvD6YmswXcXzHYGKAaxQCPehLLHeL4JsZWF5ZYy/6jF/zhr0WOJ?=
 =?us-ascii?Q?uvThuysMdyssiJssPgPdV5zs/1pXAQUDZRQ+JAOz+iIOBphpNrKJqLDfoLyO?=
 =?us-ascii?Q?Ee1fcEYXVXYw4ZhkdgY65oc6Xutitr8fYpbkWAudNVVDhThnUAZD4UA4to9n?=
 =?us-ascii?Q?2Moka0JNaqOvtJ8ekCa7b4KBCjhn8Zjb1AL6OwuI2xN7+kLsha67FUuhm9XS?=
 =?us-ascii?Q?siFngAw3CMUFWsoeUy1nrQUdDcoX+dd/gsWzk5k0k2pBHVKtgB989hRliDsv?=
 =?us-ascii?Q?K9VS8dkGGWiw3K69RMoZkY21vqUXBDlJB9Aemzb0U8dGaMae5WQbTmOfYPDw?=
 =?us-ascii?Q?jKUT4Cm6P4Lkv/k5EjIYK879XI2kuXNUArvI5stoe0Nnj0kElWVvwVdUQNB4?=
 =?us-ascii?Q?/jcWv6YBE0oXvNSWkJhAE2zb1bRvF6Qn5nmcnMOBrGlOJh86dEWYmoC8PYtD?=
 =?us-ascii?Q?L4p20epQSqLgTQ6TiiKBve7a+77kfCtVmu/fjaG+dIGK0usWPhRlOw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sWfvVTKWc8QDWG8x/ud8VVRe7VvlEANWCZ8XiGLHhnfHTB4ugBQ1f7iF3Zqw?=
 =?us-ascii?Q?QWTP6lmVSqJLtsjmmgDUl0JCI98bJRnvrgHhztwbgQy+8aqiWBuwdbpZwsYq?=
 =?us-ascii?Q?7s3eVaeVkcoxDH1di7b5bPtL+bK6YRfqgp2XOp44qLeaT3iDAJs53lp+6Xiy?=
 =?us-ascii?Q?mmPfp/OVwb/fOX3ZH7dj2RuRswfYMycfonnfOFIMgBkJm1xxEyZI/TTOnzOY?=
 =?us-ascii?Q?yUcIXHt4JShsEtTJxJAiRtA1kLZ4Phvq4mHGGNdWgv9hJzo6dBOo5CaW7rl+?=
 =?us-ascii?Q?n1Zr/SheeWM2LRQRY9SgSNCxpXIPuksfdMYjyrDcdbCiqiQMqWrxGo6dXPnK?=
 =?us-ascii?Q?ViE4mhS90XCc6F1/Tf1L2rAtvoEjcgwKa+5YDeJSXk/5Kum5+T+XiFIIh6De?=
 =?us-ascii?Q?1QWITNhlgjrVQ9q0CELvsexOwBdRCCQtvxNQr89zcaNInqbwzyJv8F5MCtYe?=
 =?us-ascii?Q?xyhYvVArsW07V1HowxGfTUJeaaNeFlK4u8gwJTiWXlYGqsgogAtmDudkGrid?=
 =?us-ascii?Q?1aldyzYflBAQ/Ktd6CYEkoEXMPCJ8QA5qX9GxUlJtbNFWrfTeGqbkvWLtQpQ?=
 =?us-ascii?Q?7cJ0NgjLAFzQIjLgbsk/myE6dzaVEj9kmTHv8f73qOenw9eJ+vitDOlMX0RE?=
 =?us-ascii?Q?DhZyjMkJhRu7CEDOgnNq+5iIY+cCBlAtXhIiHxZBM5Z7G2KPPcgLQRs89Qgr?=
 =?us-ascii?Q?f0hl2/2ec4f+kLud8tZ0JfTNOI7PGWYmMTKxBCN04u5cTH4Fn1nE44c1MNIw?=
 =?us-ascii?Q?FwBz50DiT1fiFHdiPYLDyeXkgyBERKB7u/BK+1Y2d0KeeAzpognYbpBD3nk1?=
 =?us-ascii?Q?93FG8felS7G1tfIaAmORsrISULp2tT9vemclNNc5XTskspgEkkgW0iCfC4W3?=
 =?us-ascii?Q?Zpghrg6KyfJ57mRUFWNrdkNIWMvxttNh+vZV2JUfF5RdQ+8TIbRWuFhs4zro?=
 =?us-ascii?Q?G8Q9tqIsY1+AYuXEC6qYYMm6TRTj8YHu9H/qaATnbWzpqlPbgR4in6cnudCK?=
 =?us-ascii?Q?G+c8cBs/B43sZ1/3alC2Bi6ftjO4fFw3Yn92QA0LMi5Nlc1m1mFdOdzyTqJk?=
 =?us-ascii?Q?5nupDtWVia7W8P9SAJ8p8yt2hRh03eT62fcSyuRGjqrHuwA37xBPlGzzqbnw?=
 =?us-ascii?Q?vY8qni2Dt7t17LAq6rj3kqi6g2cbX4lQdz/pE9COxJ8JBLZFMjdKNMqAmnT1?=
 =?us-ascii?Q?mTeOn6RyJFSE1PEAZok6FNXUwfgPemuCqypSb17E6gsAEPdyDKGERI40HCJu?=
 =?us-ascii?Q?u6rzzKMz0w4tzuyMPnizf1oDvyOGbi112eXHkJLulkhmN6BSVZ1x74TFZjs4?=
 =?us-ascii?Q?GnhOAFmKMCO6ajjCEqyg/Xp7FCvTRCApFcBzDoScBUoNx8JMUPt1kbtGvRPr?=
 =?us-ascii?Q?z9uH7/QFKO2Cc6Po69Gzz6nf1STAjgFRdYW2HH7mxIRqtwcEDDbdgk49IGBJ?=
 =?us-ascii?Q?VmXiHsCZh31d5MKhjyyGN0zXfSBeo9UBzOFtHGQrN4IoJcxhuTkRA73wQPqc?=
 =?us-ascii?Q?Nzue1wEW8CBkOponXPJJO9WgPfa1zI5FDn7I+qaRBmaHNRSvplMfO9UlDH+0?=
 =?us-ascii?Q?ROdG4+FK7nVLKFxXfTF18XisoYbEd/u1+30bSfWDQBgPYo2xBikIQKht35F1?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7657fe2a-0f99-4ee2-995e-08de3ee40c17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:50:31.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypK5tUzMQxPdmNJpFR1xYGSEwG3uxXAL1kKR2p5RiMDHkjCcdC5YAckh/vxupFlzCXcf7Yw7IF4KSMsG8sUk5pYzdaOOzc3bGrKXDf2gefs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: rUn-gu9ScFxCTOyXOcEL_2Yx0Ht_tfeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3OSBTYWx0ZWRfXwNsWB2evF+Vt
 8m7bpAP5DK7SCq7QLeUohQ7ViyKaakSAgrtHm852ci5xu3js5lZqKKLDOjeyjNgXKNOlLU9VmOO
 87WKBAWShkmD5u7eP3aAy1Eo8HjkmeUX7bJAm0YOKgCqDVKtprAErLP/4jQBlCG/a3Yd1U0r96y
 4PfeBwPFjaY5X5Ffy+tLwgqOs4z3z1ilnH9lwqEAg+0PH/uom/tdL6z4YQObguhe6o+/bvAJd+4
 Q2B1Tw+l6CjqMSPRP4FTuGS7oSW9Rn249cBW8NUGS3v6F4kySrCtqWVQfICqVnfBULXfpJkgAgO
 N9JvFwG4PhsDsE00E58YrPT7APypXMrHI1Ft8zUMFXL8DCqo9QCyFNuWBoBslePPM+htcrVb4ox
 GQdjHuyhM8vZFWnCPwXLNGt7hNUu6wI7cFGZJzl5MBUsDjhwFYZM3iRLGyuXk8EghLInp/4zWgh
 fgPjwu5iQaPPZFGGGcQ==
X-Authority-Analysis: v=2.4 cv=H43WAuYi c=1 sm=1 tr=0 ts=69451fe9 cx=c_pps
 a=cMwMxZTj1NM3F6QoWJDe6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=dHwC8glK4a3Alx4pFYEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1fi9MzQSKHMegz2Pjq97EEP8a51qxiCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228203

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0029-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 69c5eddefb..e045ccf00d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -67,5 +67,6 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://0028-CVE-2025-11494.patch \
+     file://0029-CVE-2025-11839.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.49.0


