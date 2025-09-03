Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AE9CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 08:11:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7068.1756887088157242378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 01:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h9965Vgz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13417acdf0=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5834f4T63447094
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Sep 2025 01:11:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=KabVlWf3NihCA1rgzHIG
	s+WH8zSRjX+sTwSJLSDD02I=; b=h9965Vgz4z2ZiXOAwzXOVx0dBS0KSftf9od2
	YpWrfLZXlFEj6TD4qPqGE66eG6/T7CqLMG+MC/YP2SJssvD7/t55h0oOQIiCt0Qc
	tA34xkw1Q9oECUNP8mg0fufTVfffQL5U5LJC630ZFR9sRoglUhNm86a4VEc8OuaO
	vZQDmWP0XNnAHTiBuRWKQbietdNQ0xWBtGrgQ0R6d5WjpQkXgVse1WmDFKjTvfAU
	oOEiym1s7awV9J3e+GtUlC/+n7CuY16dsDbiW8Z3RIfMV9eqP5U8dJyoXT02EQLM
	cksWXl18De32w3wjpfE9GtgsfzibaYanaHTy3BhCuOylc5hp7w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48v0tfkhje-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 01:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGxxVsHRbJrBV7unKZXDsqKo7LoRCvJmo/ubkk+rr+5sioToPpBjYAuUBestSWQsFSEUCRIFJyEZkgUK3xtf+SKvTPPwHuRk4hJcYTYWt8Gvl87ZaFX96gkbegvZfVg8kqInBUpqMdN2LPz5LznSpOo3446BXnkoB59oapK8bGF5PJRMzDEg021+l4RoZA8BwwboKGntKnQi8KrEDGfRxA+MWfkQLXbCdSi6EF/Vj4qf3i/+2BPfmDEmQAyLPfSPL1w+C9j4KpjH1e7Esv1pPNn9JR1ggJhQ7ZL8Ygcj/yJLZ9eQsFMMB7NAx1qniSO5I2++pzeo43VnLnd7hA3qog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KabVlWf3NihCA1rgzHIGs+WH8zSRjX+sTwSJLSDD02I=;
 b=jITTj51QoIQ6joqAMliZy6/Y4MaKcBxJpVPJ7kN6GTl0btU9ittM/PjtYw9DUoFeStnDn0bRa9DDuv9N0Z0yE7lLE5ISGtWyWHOph+0R6O5k8XU26RzCY9JnbaN3zdHr87U/T5df0Df5Wae60BRFCpN8qPQMpM7Ot3P2u3dYkTWTUmEjyAAaxNvE+md4+IpyujaqW+ohY3CR0qGDT5bnEK/XoZCFydCw8etXC+WNbtzDSJyC8kom/25j7zf1Fg/dwLz0QKUoMoZR6WfUjncEN0Pdu/K9wclXyPykWJ2O8aw9wInEShjgGbLPwTGtFUcuJXQuTqNgyu5Pyrc8zCD4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:11:25 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:11:25 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound variable with 'set -u'
Date: Wed,  3 Sep 2025 16:11:13 +0800
Message-Id: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|IA4PR11MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c50696-b11a-42e7-0bbf-08ddeac179b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ve76D8b1EkFOWmSjssyGl110WruMJnqgV8I4BU6ubuVbQmEJ4s4UcfCqvMKl?=
 =?us-ascii?Q?kvSyXG5E7T0mLJdiL6tw6S5VeTSVX5PZ24CAAczCrD/iK1p8qzNccRlu/p32?=
 =?us-ascii?Q?v4lJtHdOPacAsWrHfH78VOoebt4OavE6P+0Lr5DLsfL3zYAsQIIXiAv8TXYZ?=
 =?us-ascii?Q?Sk+C3vfhO3zT3CCeorobXryRR59+70bW6FM1klsx7FikkcLsCqXGeRXTLaIt?=
 =?us-ascii?Q?V2SNzbqPC0ixC7A+k+0QwjG7yCz/m/F+Jx6s+XYP5mNM1TWkZ92vwkFTR81w?=
 =?us-ascii?Q?fZ4/057r2vlQZHI4KprOntCtUvwrayINPfS2nz+EpfYx0bPZ2fyEzefxSWDk?=
 =?us-ascii?Q?ZUmo51ObSs+J98K7W6IqYmMsTpiHGfOtvFjVRhgMhCibM9j8mu/GKAbW2JVb?=
 =?us-ascii?Q?BKuaAEekdcG/8xEwsp8m0hi9a2PnnnvbE7qk/ueVJpWnizJfCi2cF7tDDDN6?=
 =?us-ascii?Q?b8CXNAwM08hMZQGQav5nbm6b8nCXFjD9Nml3Mkbp1JTQomzg0XmmyUtTp35d?=
 =?us-ascii?Q?ER7Pmcx+SBuSS/wKd0ylv3GaKMHF5fqZhQhAk0OQkHfFYsqNvi5S9aB3lhG1?=
 =?us-ascii?Q?QuBuWpZp/q2u+DKoS6cZa9dfdglBWcfQKQjAY+Gxw9gl4NPs0J9xXGa5KExS?=
 =?us-ascii?Q?FLgkAKWyVJis69/Hm71AWIY7gxRvoLi6NIho95Fc0PddVt2lx/4db5ipjyTf?=
 =?us-ascii?Q?dfNxmVyNnxi2TojDSZanleUzxgybv0vWDcA097fK+5pgmbrv9pwNDlQn3kiM?=
 =?us-ascii?Q?qN88ysl9A4oHkW00iMuPKlLGSuEb9JLhbibF9xhFC4nRb1f2eB0xpoCRl9/E?=
 =?us-ascii?Q?2WraSWwZmnD71fEQ763Fh4EvsMZ/bTs7bB81ngATcpbrrF8k5ZCNQyQc4EtQ?=
 =?us-ascii?Q?/G9m2Nm9TqqNAuOAWPtMOGtfX04EKVkFxi/21CQm/pbT1CPdH7jygytV2LAJ?=
 =?us-ascii?Q?cOtkNpB0U4imitiCNchBPRAlPQFLL16ITTfgAPcaD/dhmFCJQ9x4BtZxNweu?=
 =?us-ascii?Q?F6yemfbfaH3bynfFxnLN1zd0B3KhI3bjB0MNXk0D/adQoxgU4rUhatvfK7D8?=
 =?us-ascii?Q?FzCcDUo0X0QZ9Zx9CWGpkz6ouvVBOGg+4JpyR3J/h9QaKLofY0QSBitLuheN?=
 =?us-ascii?Q?pS92bkg9BSEqXvSLlrRK6IDzNIka2Y29WGEVYl+BtkBUkqQvETmQnJe5EEXy?=
 =?us-ascii?Q?1MkejbqCRIpuY+lQAbuMxHgYiEOIu2Y0H4ZxqX9dAarZ3sQ/KEbdFYHcdDWt?=
 =?us-ascii?Q?7fUeT73OqjnIdIbFccTCbeTdY0eMaREp+805NDHvYEH3jrBfopTCLPKq/Uxr?=
 =?us-ascii?Q?/5rtkENLzDxHk5iPoMFtc7JFN7aXo05mKt4JULwaE71OzOWzSA3SEGsESQ54?=
 =?us-ascii?Q?rMvXuCRKYjz9MzWzg65bQqG1+8lopoOH3fTMnJwTTwoeL1p6s6+D1Ex/RDgP?=
 =?us-ascii?Q?NwOUmFnaoAxZH77rnmkp1njSlsXRA4bxc+c5QwpQ7Wg7CNKT/hsk2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i4JSf6ivTA0277OSs40gVs/oluQv1LAAVpePi3C1IxQt8DWUjfsU78e/xKgl?=
 =?us-ascii?Q?W7Cj68exwnMgk56+YO4NdUAz0+vQ31Y+YivqQTR+DB12O1NX6jk2GYwBnCWa?=
 =?us-ascii?Q?IhLQMEj+q9W3ohwQuyFwNE74jIhQ6F4WKrQ2ES6klIG8whsnXH0dEk3um0G5?=
 =?us-ascii?Q?pg/w30Qx4wJDTN+NmOQaBngVv9mt0OLBJuIq9x8EWujGOZfOSoZvkZuvEh+h?=
 =?us-ascii?Q?KhTF6qillZ1xPLcjGLbZirTf4dcIj3mL1SqTux0ROS7sTA5pKM6fpqHgGR6E?=
 =?us-ascii?Q?RsnCuC95b9Xe1dsuMD50Xq8EytFhCGbOn73uoqL+pwkKZdiWt29bu3Eq3NLS?=
 =?us-ascii?Q?9hCKJb1IYtCC2bzFpgDkld13nwq0XACxb7R7ohceODSbqeUbpZsJnpqcd+jj?=
 =?us-ascii?Q?UMu65stCOK1eLS+ZcYPwJuRVPR4K+dQosmsL9AhhVc/VMAJ2Q+VdHfENLvdn?=
 =?us-ascii?Q?wZQaJYLCbsqu8z/X0hESwTBU+wVqR/eJjiZUvmacLVrBs+QYQ3xTOuAr8xlb?=
 =?us-ascii?Q?dX9Ji7SjfP3zEgjnxMp+ce4x0jP8CDXqHYhmYTX4f8ulGjUMSfD60uectib/?=
 =?us-ascii?Q?i5v8yU//tGu/d1IBbl1+axZ9zM9AJT9DKht874w9ZCoyr0+YSI+o3HVevxYH?=
 =?us-ascii?Q?S4lf7xJe175+g22ZcOj0JBIMEbhZ7Eog7dDzrgrGvxipf9WcLH/8MKcU+50p?=
 =?us-ascii?Q?AjUvJ9ID2mzdyjVIUR+GyTbqrdpnZ/EobwY6eNHEGp1UsdsDhqI+Yb9lnWTG?=
 =?us-ascii?Q?MGmf2C5Bx2rPOj1LLC3sKrnvv1Jd4Gt+8MwUobq5as0eDw/jHQMniwLMNgJW?=
 =?us-ascii?Q?jZCyyPOj5S7uCn3nxCfewqOuR9eLPqPVScUNiO3JtU6XmSIPbWDaPJxAmudS?=
 =?us-ascii?Q?MihMc2YGOq3a0GfFLM1+19IMqvughDXXJtmb4VZtpOZYkcv3g9fwXornmniu?=
 =?us-ascii?Q?eIRyXrQysGeCjKB0gOvJeAOzl3y6eP7uEkyVBH+5RsqStms0c8qs2WeGE7zP?=
 =?us-ascii?Q?hVkw8majW+LgOT33sqIFP1guDXX0ZXoOkSvZa03QOipmNdsc37CTUI1gSXtY?=
 =?us-ascii?Q?FIm0cLYnCaHd/Tf2jwJo6Yz+LYDnJVxhXKNyJ1Ko0a7zim7LbS+V2Q/d3Zvz?=
 =?us-ascii?Q?naH1uHMH/c7xA+agbrc0gwamMDrijiY5z3uGc7kuEjgSKQzf8coXkqOvny6c?=
 =?us-ascii?Q?odIzSDukSByB9Jhtezk2NLA/2ZNvRQNAgmGiNs81KZepVmNPAi0ZwUCfxWjX?=
 =?us-ascii?Q?WX7Qo8YFidhxPRmoaJoOQxX80mnNf2cWe2hxf8oHSdXqsWFp3fSK8/bkAi1V?=
 =?us-ascii?Q?Gw7gYBVDvPghjvqrFbSRYnzzGzztDP6IDQn5FiSypL5O71Fwf75tzWUy3MqO?=
 =?us-ascii?Q?DxayRN4vO1/orP1ZDteHuKzCPlDJHzZXHksKse9V7+XiGEG84o9J84G2Ccne?=
 =?us-ascii?Q?zZpHVZbOKvKPOL88gT7BhkebvtOlBkrd5Aq46aqk718u8GDM9xXDMf8O41sO?=
 =?us-ascii?Q?iNPDzTZg+dblTHd6zYdb85mWJtF24OCAp6VPWbRmXLD+68sCJ8N7va/knZ9R?=
 =?us-ascii?Q?t7vcwCkpwpYxGQ2gPePLj5DPhH+G6MBIT+prYelfDCXanKfWKaB2ss577KQe?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c50696-b11a-42e7-0bbf-08ddeac179b3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:11:25.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBhCbK9XckVvLPOjr9q6FZdkLU1k/C68FDG6V7gNNLiiWaN4zrwrBG/nt9ZoP5HJU4upEns6HypC4gE0OwOh2qHqQ0lUyNH1fYjt0nHSDj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
X-Proofpoint-GUID: bTRZUjNx4BSH4_pUHWfiG-kZ9SGWqph_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA4MCBTYWx0ZWRfX715K4gnUz/l1
 yRa11mJUQ1706Oi95x/4Do2gyoc/N8u3JewW/8n6nx5xIoleQrJA+I+KJ1dtCb12NAkJRxMVES5
 DxHRVQeLepW8vv/+Ycspj1gD+NMU0xQH0YHAww1rP/RTGljK2K1cYIUOJ4hTwITinkqMKsVn3f5
 BFtmIQkR1SXXAZjQfF0NhuT1/5MshyYU+a9Mmjtb3xcvj8myQcX+1dPsfxop0vuhiCuB3zh0Gyd
 s+j+H5bbL4XXE1bcCKyPGVDFOR/U25BVLX3hFYIiZBcXhNKpxs1dMU1kyPgx0MLalHiPDnSdSnK
 +vRtEwnrJaRCSQtN+mqxJqQ8sVhz4pplqrMRZuOfwKaPKsWJJ0LObfWDqZWlQw=
X-Authority-Analysis: v=2.4 cv=XJ0wSRhE c=1 sm=1 tr=0 ts=68b7f82f cx=c_pps
 a=IlNV5R6BeUB3P+g5y+cQKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=G8RaOm78J5cyyXkNedkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bTRZUjNx4BSH4_pUHWfiG-kZ9SGWqph_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 08:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222850

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

Note: environment.d-curl.sh, environment.d-python3-requests.sh,
and environment.d-git.sh have the same issue and should be fixed
similarly.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh                | 8 ++++----
 meta/recipes-devtools/git/git/environment.d-git.sh        | 8 ++++----
 .../python3-requests/environment.d-python3-requests.sh    | 4 ++--
 meta/recipes-support/curl/curl/environment.d-curl.sh      | 8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index c635be8acab3..d989a2279183 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -4,16 +4,16 @@ export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-   if [ -n "$CAFILE" ];then
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+   if [ -n "${CAFILE:-}" ];then
        export SSL_CERT_FILE="$CAFILE"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
    fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-   if [ -n "$CAPATH" ];then
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+   if [ -n "${CAPATH:-}" ];then
        export SSL_CERT_DIR="$CAPATH"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
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


