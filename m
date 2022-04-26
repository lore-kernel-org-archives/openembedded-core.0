Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEB2C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 03:59:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2184.1650945575257681822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZQgV1lmI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1115f13a8e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q3rCeZ000968
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:59:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=PPS06212021;
 bh=XRO7T0llyblyQHBIko0b5W4oxZdJmam4O/oqjVq2JQE=;
 b=ZQgV1lmI23IQkXimrLmFmKUA4M2J5VUMYumypR7UQL+6bYmJMD662AZkYvwz79y05yzu
 LIaRxMmcqcTjYbryKcUgWp5Ak3eanLSMJlrgomPr5gAb0t2Tq7eCpuHYP8JOpG2cTzW9
 AZmL02wH9BIoeBp0qOGWRqYlA5ZRjfT0o6BJeTvdotRP0djB9fiy1q1IGTnCKovsVbDr
 3XQUGZg2ID2GHbQrW2HpMO9/6+btOeD6gwYvW79TdsUYnhGuhF7n5b5aYkPyCxbDRKd4
 WsGiIEfZDLMfNOtFtZ1kdxtZcS9MuEJvCSXQRWfAdyO1aUgMgHcHmlTuaOobVOF5Ar3U 0w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr49yvq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD8nOaEk/HSa3SBZMxxt9Z1ujQimz4MlV7B/scOjTUnLT/ufSOeWe8AuTdaCP6GTcmlS/Slt2hB33xL3TAaoKR2+G95R+H9efobH4sT4YjGgKIOJJexGHTkAWZUmzjhpLxoKcp8UAO5MoEhi2T0nKssKveApHRFZFxwcDtAksT8arSoLy1B+Ryvl21ejT13QnH5GIwieddlXrFV5XaFd7nfdsKa/lBWVy2UsqmBiYOBqLMQO5UM4AzWztYpRA4AIj7qx3OiKWN9EKeEVFg4+ELgBS0gTqT/VXVvJLdC5hwNS2FKRE/SDqiKtRKXEvvehDp+TpjTTpb5w2qxOrfWVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRO7T0llyblyQHBIko0b5W4oxZdJmam4O/oqjVq2JQE=;
 b=J5rIRzWn4JiCKLEdQueOMEzzvyXV2OYyyMBp7M8mYIQkzKVeqtzqIPgDP38gkMjBS2Hijhdl1XilNwGaA+Yf1QZR7MXhr2Fr5u4QxyN6wKoRwhiQH/ZN7YFPhoW2QkVikhV39maFcMrBrwJ4q4hYu3q5dDhNTagKYQIqnjxR85JBMT41p5/u2egO8hafU/8ylsckn7oi3p+13z1kmiv7MUULDeMOvy+mj/2qqwa8Qx0GWZI48najg6XfmxsX+aR/6VlmipSpwN2PCJi1ijRrjIoX7Gamy3/BTM4pK6fzoDB2YMUkLKOfIRqaiF5QqqJiSa9telPoy8LqH8wmCbNIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 03:59:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 03:59:32 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH 2/2] go.bbclass: disable the use
 of the default configuration file
Date: Tue, 26 Apr 2022 11:59:09 +0800
Message-Id: <20220426035909.26021-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426035909.26021-1-Qi.Chen@windriver.com>
References: <20220426035909.26021-1-Qi.Chen@windriver.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c83056c8-c9c8-42d1-3ad5-08da27392b4f
X-MS-TrafficTypeDiagnostic: MW3PR11MB4538:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB453816651CB822CF18F22FD0EDFB9@MW3PR11MB4538.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YcCU/i/s0nHVE8inbQzhzWcJ7qPddaixArRvJ2XK7WntXz6xu+wK2d0Gh7cpGR25sOqEa9slTXnhlKtbvZGAbHOycLBPjbnTX0SzgnlmBZCHonp7l0YWOsREwoLChMok7g8Ox2licMxwcOAkYS1sNErc/nAsI+4fzXVT9iv1Z2vCOHlXCRA5E9+chRtMJ4yidJv6UVVAWA+xvyNlyxhvc8kU3nzBqJsjA/EpCaW9NGF8jokDNyAc2+JxMJqmSV/RcV7/H30eJytjcOtTdmz3HqR6QpkA/yI143UGfBvyIBsbnjQC5cCcNppoqv/8C2qFfeWEGtYJmTkOpWcwfK0yiefMuknuN6R0OPlcird4mJvB0pPbYfWL042E/lX/sSN7vC4Qvh4x+KYaCaudtaaUlf1xQqIqTqkm+P0I6BuTlbcL28eixFNBawjrTR+25NSffEP8ilKExrQ5uVsXhYis0GAkT1ry9Njvr2SNWBENwCSiSLnz5kARlqCDMXNYahWsl9b0pG9WU0ERNQQxiBjHB1A807WT/j9dltnumhjBIryCA17wDWRZfuJzEIE6wifOK/cc9rQQDtpn7apQKPBrzEQxaROTBQaM1vLJU2jra6E3Kl+LX2W92J9GtosygMH7iizHzTzQTP6LiGC2OLfvjzjj7Y/VZKDXE++smSu378Q+aZ18Hniytlkpw3oUwT5e5R4QteHsmFUywODBlmxy8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(52116002)(6486002)(66946007)(66556008)(66476007)(316002)(6916009)(8676002)(86362001)(2616005)(6666004)(8936002)(508600001)(186003)(1076003)(38350700002)(38100700002)(2906002)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wntUYvtRr6bIM7CEz6zNSQU2MiKMcy+ljTRUnQRTbvLejL8hr6NUDBoj5ELB?=
 =?us-ascii?Q?xqjJrWB+CYYCLNIvLr2DLM0ANPeu5GXaobHGIF/8ZTHMTL8xealWEoocrrIx?=
 =?us-ascii?Q?BBIqlnlXeNjHMCuTACp67Ib/Wn/zJfzEB5STX5d34EbSZQEHohbBtRC2kqcJ?=
 =?us-ascii?Q?xfTXHMdZlP+EvTN6w3FG6kERdAvQ3L6SyvOFepHh7bWoGChz4GPPjPh4KFK/?=
 =?us-ascii?Q?u7JNoz7IYnep7Q2iYN+7ms5PyrpRJnBhlY95UqhoNuxELMexiZbTMkesV8a1?=
 =?us-ascii?Q?W8bNCGeU4NlkNJNj5jpEm/pUQ+47kunnUX2Idth/+9qtZZG/qvyQ3F+UrmVQ?=
 =?us-ascii?Q?zBtJ6AzpUpt7/sMtGwWdGewkonNCyWUWjo1nIszaAYY3yY0IEq2khICeomQR?=
 =?us-ascii?Q?gO/m4VSa0opqUTNdQkQAcXQG2qOyJgGuhlFK49+dlx4ZdTv5zN1zhIolwYmN?=
 =?us-ascii?Q?zyEgPqGkhN8TWKg4Ah0qjbWMhoa+1MgHOPK1FZRDCL/R/DHCn6ndHCYYilOv?=
 =?us-ascii?Q?m12Xvz7pGNtA7hjGAckR/uUJrFyQBtZrEsp49A8S1SM5RK2LckoIc0bD1YhO?=
 =?us-ascii?Q?nCnlo6UEOyEmE1fMcB0YjUwnGRAvfolZfo+hE1dzEXaYhwrXVkNhjaWQS8At?=
 =?us-ascii?Q?OiU0wlq2ovSixsCIiECJQiLMV5nGCdtW3q1ubNiPVca5uvflXBexq2klbDyW?=
 =?us-ascii?Q?pIUpcHGYSKQhEdyqzxQtow5LcrExSDotlZ6ovlafXxFpRzEmhjjP50BFGBgs?=
 =?us-ascii?Q?c4p88OsGwx//A3Zc6AuylqKzzcCM4TVr1yW958ZwpNmWS5+IJectQjnm/TGk?=
 =?us-ascii?Q?MSX152EoJd/59QQrhyZGakoB4xAe7+I9J2Xv0qsBasnRn4o0VbkjJpLh/0vN?=
 =?us-ascii?Q?6NyzPrgVdm6XsTJU9eV5N7io/bu9Ra9djf2GXIVF+VMsFBA+wQ9K8jDZemcV?=
 =?us-ascii?Q?xYrBkJL5bMvC+gkTqQcZCs2frp3XPDGHhBgdVjcyZXbIT5l56Kj/5p3qwguI?=
 =?us-ascii?Q?5tjTwxP9nTK0G9zdDvJalUFWBUU+a2HlLAU6Zd+vaj2SQLhlGzVol1ri4bXt?=
 =?us-ascii?Q?NGS1Q08MU/HgQSqo4WcXvbOY0bx0FX4q308Nys6EZP5xn9qbUMpt8tgNlmLS?=
 =?us-ascii?Q?Q8VdJCVdvaHLAc9/wFd5E5YttNYyPpymVuN5HiqPRTNPuLdvrvqHGPb3k2mW?=
 =?us-ascii?Q?uiHTD2j+27RyGvEy2NYucHjV3EfU5Na6HX7SANekVrAC127KO5TUgIXP077C?=
 =?us-ascii?Q?jWdWVGLcm+9OaWQgGgfnRcTRJMgiZyD26IG6TITDJcBVoXnAQYlzIVMxw/5G?=
 =?us-ascii?Q?1ZB45dx7H2soML4PRpD6wDA1qh2ym6emy2UNYHbBBcQDiWDk58ic6MbTAXug?=
 =?us-ascii?Q?nYEms1omoFVbmQG7QpGkci7Zn/gvGNxBXFHbisd3T4IqBeSYOTTgBXErUPiK?=
 =?us-ascii?Q?1hWN/DjLQV49x0uQDf1q8mG35ZQ/mXQzIC42ZLAH/YTL6HpXQJS7mVPolHW2?=
 =?us-ascii?Q?/wXINJiJgX/JPS8/KyUTZFb0xn4bVqz2zSezALIA0hbRZ3GQQGTtp/nNLnWL?=
 =?us-ascii?Q?MV2wYjiksCwG8nfnoUtoVbyTVEpMDYKcH3Hyxxivdjlt4C1PBRDICT0o893b?=
 =?us-ascii?Q?VkcK32Vj0zPJVrPhaIFzksv5wq3bSREcAQsDcKX754S97YdxZDqFcWk80hwk?=
 =?us-ascii?Q?ngVLm4xE/uO6f+ZC4B8mxCjqAQ3Vm9Rx/nEkb2RHabqfKV6y3fsNA6+14x4z?=
 =?us-ascii?Q?zlE/i27XNQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c83056c8-c9c8-42d1-3ad5-08da27392b4f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 03:59:32.4837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IC9P/qhLQM1/+EetuL1+lXodt1A0BPCBxLQeX3p08CJnErGKrrzSFPdDHHRhu/yt5fn2sn/YaI2FgdNMKEc8QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-Proofpoint-GUID: Q1nEMXk6qRBM2VLVPgRWMqr4dEj_PCQ_
X-Proofpoint-ORIG-GUID: Q1nEMXk6qRBM2VLVPgRWMqr4dEj_PCQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_01,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=911 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 03:59:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164856

We need to disable the use the default configuration file. This is
to ensure that user settings do not mess things up when building go
recipes.

For example, if I set 'GOBIN=./relative/path' in $HOME/.config/go/env,
then go-runtime fails to build with error like below:

  cannot install, GOBIN must be an absolute path

According to `go help environment',
"""
Setting GOENV=off in the environment disables the use of the default
configuration file.
"""

We can explicitly disable the configuration file by setting GOENV to off.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index df8d4db26d..1a9a0bc1d4 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -68,6 +68,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
+export GOENV = "off"
 export GOTMPDIR ?= "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] = ""
 
-- 
2.17.1


