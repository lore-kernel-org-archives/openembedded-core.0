Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1189CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:27:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2127.1778657229147731190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AX8Kikgv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95933ffc80=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3rO5I241244
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 00:27:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=g+EwCg5Jifmswccup6Yx
	3os1baDeuYr4vD2GwNmFoDo=; b=AX8Kikgv6mvBV8S2JgqA6hAaYGMYwkLCaZzN
	WcYmGcNy07hs1g7dMRRqQL6+n47TqzqTjygP+CPTfluqDagSGeojnA3xwnwsUfpj
	mpXoNeiIzZvHIoZa7xhC3Epdkjlz5B74xxjhd5ynvJrrN2JNT1qV63WiE0uWtoB7
	d23Lnp69b07Yg+ZpNA5UJn6QksCG7qeuqXj+4ucbGdUEPZzzOnhDYy+ZYbHqQ9p2
	JTMscL6CruFHs1+ZwqhMCRoN+G5wNt7QPeWWcAzfdqOF8O8arkOgUd8ytTXww4oI
	jtSq9u5bA6mzoNtnn7o+OLUencnzRFd9vI4BGi+0AkrlmXtztQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb8bej-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 00:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0CLEQeUnbZiILQJfmj1s24pNfRn0z6ne5mj8gxVCb837GqVZVoV908Uda5EEoq2AXXT6ceNKqFW4kfbgDzqGlRiOg8Yaw/U/Crh8SbOw1uXTxCbyBa+7PX3EKnRLhI21QDokJO2s4t0VIx3vh5CgAiGrfC4sZ0JxvAxmmoH9fTgN1q3MBPNWH8zYBmTn9TmQ5QjFSQ45WrherA9TUuT8rHHFDpqAB7IQn04+viHpGeif/0rEjOdIDcf3lhZddwQl8V6rqvZbT+BLVs4FKJt7b6rPHLgxUPRJ3Lz17cdsX7+ni3xt7zKDITjs8a4jsjHYKHV2oFD8qDqFiYaGZhv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+EwCg5Jifmswccup6Yx3os1baDeuYr4vD2GwNmFoDo=;
 b=FGno4Jg8e/clyid8gy4mni+U7wzOmXbwLfE6qADwmQo9NAZFPSCWEm8+HVSHyDCDbZeEc0TZlSwiL8mWPmxxP+nn26bRHb5VhHVMuhDfYS4FrraVJFON1agMOgOrxDUareHhUF8VIxZiow2uGvTgCIXy8K4Al/v5EHQ2BdwyXF1DvDpoIabdWIqF0p+Z3YXa0bRL1IvMph329S2EaauoosHZFviwWsq5SRK7iysCu1qp4tS0zjdvQIg5oW5+ifClxkCF73ebi1bm0WCShjq187+8QVZFWojvQZhVt5IBXnbBdMcaHBxYKNw/QCbt72l9CmaZV8RRjZUSD75jgzDYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 07:27:06 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 07:27:05 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-selftest][PATCH] meta-selftest/files: add postfix/vmail/postgrop to static-passwd/-group
Date: Wed, 13 May 2026 15:26:51 +0800
Message-Id: <20260513072651.2235181-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0166.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e060e8-d621-4c82-1312-08deb0c108d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	/u0EsBjVym3GlQgtVUTPnpSXemZlmH5gzb/a4a1t8Jho5EGDXcuQ0v8WhYPZi/sQHduBJBlrDV9zZINrJBPu/OiB2PidW3KNtXwC8+ZDfNrLmssWjwYXqwnTYEesDIMV1n6ITBRfIPz2lkxPGGT7SYpR807N80Nwf6ZU6Zc+bzR+mJGtqY0rACPubRjuHzZAWu5N9mT/IG6lV+nw+xcff3yppFi9YlRKheu71KW7zelBVhjjmgeFSEa1Ji1/Z+9AtMV2hy3jJtwYvoDz4BHiyRVk1TvcQ7yQ6+gnqZGbEF2eksOCAepEcQbVM2XpPJ6IU6yfC4BgZzFBNyMZFvrUgVMwBeGF5AZMkMqK3HeGtZqiNIOKfzyb8aJVgKIuKnMMb5aZpUf8CnGCG4J62uBnp+hbrQbxN/mN8oy/koLZuc1+5O0D/+v2bB0e4F1nyL86K04DgCROHVMeXr3RQWCgKrtgs1djImAHyDREpR2ATdgTRXNbQfzyfaPofg5T0qaAVbuvAnmphvH6YAyqB3WEMnN291t9HnpOYC7JQflA2uBhyjmZ7Gc+OxotFgRjxiJVDUXopMinrdnpQZIR2kd9CXCMPoCfPoSJgY8m70zR2hv/W8gkHhyc/lAPpHDIZ2cWpzdGK3u5rI4KXAOmdbfN3YW1XyYKvaBTLQeii3GCll2FQIlcvvuuagaD4suIxd9kXBpdYCCoJRDychddF9BfVpezpZhoCDX7kQmcj3hPXNO9YM+ubUiy68GRJgV5YRGV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bba6zL1yI63uhAn8NdR7YPXNReQkIQmSUkDDQYnQ4AVCAJ+V25gJtc1w3bQc?=
 =?us-ascii?Q?TR5wVwMjiz4GrwAGY6vGnVllroL2MdYJ6HAf+2P/CJEVCC5/ioaXqOOIeB9W?=
 =?us-ascii?Q?a7U0AKFeXAaoH9+Vn06NUzVlVKghNwYhBPdrohkTYVwSAz/C9DaIxQxZ2Rcn?=
 =?us-ascii?Q?WYW8x73MR8pIk1bWL7mu2t1oF4ru/sNz0bbcNN3absGG6iKdbSUfb8g/fro1?=
 =?us-ascii?Q?cpE0KLO+tux0Gh00fYMhUgc+4VBbLVjkbnOoFZonbjEZB+jJGZtYPXsfgry6?=
 =?us-ascii?Q?XHO4kfF9nJEN8EcndGBQG39JMI8WeYZDXS0LAGSIqIP7fZIacqXr7eYcDISo?=
 =?us-ascii?Q?NfibvtcYVH7/11cb54g8/56zsqNAN6JJtX+I/d7PQ9c8EIBV8ClHM5h23hgS?=
 =?us-ascii?Q?mEXsNAjKfGdF3enCH0oALlw6EvS7WCJGFneAt/XrRk/Rx2sxHXjUu37tU1oR?=
 =?us-ascii?Q?bDgDFbIWJ1SNeOZRj+/FRHE1tTm7fJLtAJWsViHuoVZ1TNLDeTzy6gsMngHG?=
 =?us-ascii?Q?HmedxcJ8IZNqQsOrszUrKPsAATLSRfr4iNQqmyiRqdHUc4Lwo/AbxHgknJh6?=
 =?us-ascii?Q?96GsoTB7HUtLCpVEDalmsQn6aYKgB9rwfULyO8tmjEj6ZJiC5Rh41/kA26kC?=
 =?us-ascii?Q?I4T2FqYCUu0R5QGy7Ceeqo1CrKvc0fUh6GjBKzg3IZYteo46o/r8AtW09yCz?=
 =?us-ascii?Q?YBpqFS2T84YSDeubVNCjxQ4/bFmXvXWvWY37buaENTqJr1LEdz2qwJyeuqBS?=
 =?us-ascii?Q?O0F53orzTOdd+hAER8/vCjA1VT14UN7NrGSVa2icTmAVFN+LEiBicjA2mZc0?=
 =?us-ascii?Q?n6vICnHD/7xRS1JQ2Vy3BVzFUYHYUdfFplDa5FB6Mx6rw6SdUxokty5oRJ6O?=
 =?us-ascii?Q?r85Dte/VgAE3yuCTKWouRTXbcjlaHE3biDJ7NRdvG3mgyWLobgvyyz7MOxPe?=
 =?us-ascii?Q?bADu3FXo6qs+zbkKFC3ax0COOQ4UKFuiRBREYvczIwUsBQtGGB+5UBx36x4/?=
 =?us-ascii?Q?HXXpSfoVTOuHl7VTMuRAu+jS9nzI2fmlDKuUWoOEimQ48bdMrV/ebNiiShlr?=
 =?us-ascii?Q?XKiV32TEvzeU+dA/zq/Qt4gS8PU8GW4VGWW1aqb5bvWc1EWG/Iaa5eUXULGF?=
 =?us-ascii?Q?cdZxgvcgCh1LeeLhbRT8l2utTYpSxOfnEhogM8bNyYrnFfCc9avZ0bw7aA3x?=
 =?us-ascii?Q?WPK6Du5/rDFwuHqq4/Iw7PX/DA67kF1ME2HOKxgyxFGS+M67OXaF4HXf9RLK?=
 =?us-ascii?Q?Hsr2OZTdWwZIX9FQ40j63q9+FY6HNHnC6CbHuPnvCCNbxOzQ1sLvHFV/DN5z?=
 =?us-ascii?Q?zNvVRHW1PcPWz76wKvT2SpT2aNrt4LzDgvdltPoiWFYLlJ8xADDwYkkrX7pX?=
 =?us-ascii?Q?TI4/XuxUO2odstjp9qjiFPJ3hSP/OoN4umrySmnaaU/161S+Bjv3uH1nq5Ik?=
 =?us-ascii?Q?cHYTTtg1cZp6ECHs5IcKnFLy8q0jyccHvO+BWMe6xxBELxUnQHtxSJ7tIPL6?=
 =?us-ascii?Q?9iU2l34ANkhUgk2oRSe31+EGFBB7I0OiGhpjDiL2FWbahoCJ6YSbAMJRvuNy?=
 =?us-ascii?Q?hBQs6V2hBO/5Na974INK4TzbHBWYUhBlc8I5S+7aph1l4v1LWZ5C4ZVioSTq?=
 =?us-ascii?Q?YmYK2A0CFCh57J+RelCvwdsjsChAs1Cd6bf8UGdPXu2JB1LoZ43hT6YtkOHn?=
 =?us-ascii?Q?u71Ej7mAr+pyA3Du7wDKVmCteKkXlP16mHxeM+L9Qng8+zZlPhWx5ju9KNm8?=
 =?us-ascii?Q?zhZD+qmkVTbKfFE9k8kVPgsTzv3QUio=3D?=
X-Exchange-RoutingPolicyChecked: 
	iMZxubSzlml1IN0P2K49ae83AsV5gKyAsUIpyz5VdF1RooIEtrpCFAJ+BDD8x+fU/VWtZlTzqQW2eWmMoLTn/M2sqwS7AytRZ25U3UeA+LSl9/NvhuyPH2rt5MFKD4o0DV7+0ss9aQ2/a5fU1nhusl3DH1AP2vSw0rEkPTNpLdXsofKvhb8CaIIcwdYCdWak5kgLH671h6trTk0ByD77PnJYt83MT5P01zVvi8cTdwpgAWJkqpgGekg6Y+VYUFgMmmx7B+bddRZ48RI9eZWy2woysWYaElwGVmT+DKxjdG3GbbBCgOiKj5Ae9yZ/5ixrpM8ER1SXkmpDKwRTGe1cZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e060e8-d621-4c82-1312-08deb0c108d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:27:05.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNJEiVlvtQ3MwXJGA8R116GuhfGPFuU/3She2Wp2KUaQwW1BoKPq9nqmwQuzEGqjsc0c2gMsg6UuOIyqMyc720cK0+uEbTUU8dtKM2BX2Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NSBTYWx0ZWRfXyFlQT20YxTis
 42dGJA+Typnea3EvZYnVkrJRB9VyJ5aSwDdl5DcXu2fZKcZNl5GlpPLmeulzxGULGnzLbIXqXCk
 rOACujwPLf8t2sXobAxnSIYlhcTwgjf+QXpxWeYOYi2EFSCjGrFjPpKFQ/OWx7+BWF9Mc0zIl0G
 zfcoA8CBl+eNwyY+B+x0nMRezFMqkwCl1vJFj78s5ZGr7pHlk48l1bcadZAAxtCPLbelRr2u5s9
 KYjDmrYPHJEppOR9IdqogRsTNXR1B4kiCGK+X/AM6PkzzKavU5hypTbAjON3aAqVLUauto3VWGv
 +Or/Ht+oLF2W15rAJQLSyhxc/q5UQVYn9Ya9obPlHhPN3n/tyU2fetmjxUAAt0iuC9DkibdddNo
 JoZcFMGvVG/GufFappkZrF+2Iod83KTQkY3rIbkv7hDbeQSp/Q7NyP5LCxczU2ZIUv96Oc9XDI3
 Rfxu8XKhgiJ1/3aOF4g==
X-Proofpoint-GUID: cW268XU2cTrPcB3u-vtmoMIr1VduP-4I
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a0427cc cx=c_pps
 a=gX+0JOXwNCEsWCXnQOdOsg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=fVQ758Ja4iSgnM3UZ8UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cW268XU2cTrPcB3u-vtmoMIr1VduP-4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236936

Package postfix-bin create postfix/vmail, and group
postfix/vmail/postgrop, add them in static-passwd/-group to fix the
failure as below:
2026-05-13 15:16:49,656 - oe-selftest - INFO -       ERROR: Nothing PROVIDES 'postfix'
2026-05-13 15:16:49,656 - oe-selftest - INFO -       postfix was skipped: Recipe postfix, package postfix-bin: system username "postfix" does not have a static ID defined. Add postfix to one of these files: /build-st/meta-selftest/files/static-passwd

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-selftest/files/static-group  | 3 +++
 meta-selftest/files/static-passwd | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a8..914d387ee1 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -31,4 +31,7 @@ audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+postfix:x:536:
+vmail:x:537:
+postgrop:x:538:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c8153..3a75aea754 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -21,3 +21,5 @@ ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+postfix:x:536:536::/:/bin/nologin
+vmail:x:537:537::/:/bin/nologin
-- 
2.34.1


