Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB234C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 21:25:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.48.1641590705493790261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WqudXncW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80063e4491=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207LIM9m022964
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=mybti3GnvXs+GiDwYG3gmRgeurEeCTP+xcqcOMZuwQI=;
 b=WqudXncWwaL2WrRbpUZLyU6XMkziCJYU/i1hhNkP+Zr74Gf9nN0QZVY0CGKXK/zAgBbd
 2kS8lkfu+tLEHcPkglv86/qeC+Ks7FoGErr+cptC4Wf7d4VuJEfUSUaON8dF5UEbR8tb
 uU+9Pe3hbwDOFj7IanBdyD4+5w9K2MgHlqn9toNOTaSjv2tRoVkMx+MWWDq8fVUlkwu8
 zN9vjp8n343n4ZQ1upHHOoiCokBo+h5ncCcAYMQDHu5lxkVzPLEJ4Exdap+Z+LxVEHGp
 +5ngJnxoe25oad2gKLw57EQ23HfzKg8JZAACqkfSSdgZvL3W2veeJa/GGqxNVAvZ/8fC 6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:03 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 207LP3Or001096
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:03 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwa5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jan 2022 13:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMGS0NQdypL5TdivdrrbCpCII5xFXfeJxSe4JkRPlbnZ5cp2HiUB7tDbOchKdg/wDdVhanrSutyZECxSIks46Nc7Z6kDUsd7HFHpyc0RkMJ44dKU5XsmlQD9OEScG8Byjg25YHanxxYu3Seh+I4qicVuIxxZxewDWRoDOndIELNE7RYiuiLpJI/TqVQs7biGOfnkl22XnleMtHxrzOxZ/GbPFok6doWL10hlK8SdKs6sSfJmEApqY6+zvPl6syQhkRTbFzsYL5giy9QkhEFQvzj6BTpFL9eB7MPEL9OCNqRH6tVIrGyH6i0c9xT9wFNAc7DNsWtnf0vjOOa9lgTqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mybti3GnvXs+GiDwYG3gmRgeurEeCTP+xcqcOMZuwQI=;
 b=WjLkYJ3d7/2wrluUlxPcm0KUVRP6NkvJxQiYeHWzbL2OHTYx212czFcyTemkCW4Pmdx9dpbUj7DiDOPATo/6FsZHXFylAB5CyxSgsSYcm7lJMkh7ZxyYE9fboy4YbbcOhL3EbH6d11muHtuiJdNxBEyGPoXABowjEl7b9bD95bGMU4va1jVQkSXgpgGnRDcL8GccNASxs4XOd47cPVHmdQYGsCC8qdIRH+gohbl65aKw6YiinIm5HA4KsPG9060k4H7xwKpgqEw4QASuqZhqKlUyTGVofUpNAli4mzDSAo94Z2GqkPIDWSBhksdKAyysOkH7zPTDpx63Tjz1CWoRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 7 Jan
 2022 21:25:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 21:25:01 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
        bruce.ashfield@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH 1/3] create-spdx: Add kernel work-shared source
Date: Fri,  7 Jan 2022 13:24:44 -0800
Message-Id: <20220107212446.132386-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107212446.132386-1-saul.wold@windriver.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 031eef3d-65da-4736-f533-08d9d22429c9
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4602E67E8E2CE5DEA30F1CEAEE4D9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MmQTstW8EaQhyMXF22t1TLDpLCYo6Ol5ta/n+MLpJSQbk7+SQB++KzSfbog6ztYy8RpnmOdT4q88L201kCaqEj8PrSVG8p59+XiobZW8yCU/+LjLcFspQn6KcMbeTAzUrgd3hxMCdM9ZjbEexPEHrkbn8RlLdVUZrMkxX8Be0CG/RRsWbgkmSljif0H5V9QWGti5K8GL+l1R3lOXiZRvDUryjAu5BBC4UrpmxUO4pzPV/pKsqIkPY8xOgxpau3xfC3HNSJbJDcrZWVSlr1uTx5+/R4BmKs88Q+NIUhn7tYL2hYoYyy1dECOD4eY04aniOcEej4N5wzDB9dEq5yLlYFCF4atZScO2mB90Gm2w0ofCXq/MpDv7OuoFowxXYcZPHDbhdRM85/LRO9mtmYjaHVTLOg/m+E0zxee8emQU6F3rGZPwZi3Jm65h+mYnZGYrcQpwiYpvVLu9ziOvI6pDQxZ60hzi2t6ukqRFZobIZZzBdIXYCsDMXOD6rRzzlCYh27qAW229ZMKrWNbQ2ij8YzWTJUyZfYeJyLl/JjaBT6eU9t338mHFUkN9ck52m2DQyvGtZle1VI0m83VWHKCY/ZJ+xNcUEkDcAgm3Cn5WN4CPVYzfcU4+w1ut7aTGrafwEbgKAhMxzS5TUANn4qPhaqmJYNUnM2j8ikpgcjXEgR84nv9EYUlDZYgUlENcWlS3MYyqZjwZ9fqWbjS/g5zuQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(44832011)(66556008)(1076003)(66946007)(508600001)(6666004)(6486002)(8676002)(5660300002)(26005)(6512007)(36756003)(186003)(6506007)(4326008)(38350700002)(52116002)(316002)(83380400001)(86362001)(2616005)(2906002)(107886003)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BpfPtodcYKUqlpIiB1g1h0ptuiALJ0ZAhlgw8wI23jxU/uBPqtsW59yz7MR8?=
 =?us-ascii?Q?q1ph3cKuAAPHAHDbrsKJM6VBDsJaI8JrrlTDLWVy9ymktdWpJEPr6Ao8zbgY?=
 =?us-ascii?Q?sh/emO/53HpZsgvR13ljfJSPMJ4ZzK5lVuynNJFe/5U29/Wn/i5wBHtBDIcs?=
 =?us-ascii?Q?mB8m244p9x/KdadT+eoHFYlDBrGdp5N2Oj42/n4TwSEid/wyg9vVG4+t6mo3?=
 =?us-ascii?Q?xQqcbF3766kOiKAdbombjb1pvR44L1VGM4MYPOK7O+f3DJrorj7kCNZVKJPJ?=
 =?us-ascii?Q?Muk8y5DrU9f5Y9PrsapXrpMJCDpoARJ04jeWWpmH02WivS7s8/xr+MbzaD9e?=
 =?us-ascii?Q?1YtTuSuUsdIoSwJPWx83PaWQildPgwdqIaxdaQofrqXnMnmUZjgLtmI+qDRO?=
 =?us-ascii?Q?pAPF7EXrBHBpW9boj3aaut0iQVAwB3vtTQ7CpGRN3f9ZZRwSsIEItLVbdtWf?=
 =?us-ascii?Q?yNFAgu+kSrT/S75A6E0JasRIt3Zl9NMpoe0Lp7+wANM+LPYOT+Tub6Gv4HNX?=
 =?us-ascii?Q?dnjcUk55PK/STOlGJq09CMKUVJ0fUJvIkWzDQBVq+r0t28WhCGbpemqC/N6X?=
 =?us-ascii?Q?4xkK0kHuSeLFrV2RKI6LlBkAGBQEsNTHvEhqcCPTqkXgKTqjBg+mVoozdtU6?=
 =?us-ascii?Q?+KqgmH6tNNdhAEhXmS7xUbfiN4ahAXIkIrUZ1WChpXqugvBtoxHwoKlqc4of?=
 =?us-ascii?Q?X4KgQtDNTYxQmnh4p6zHf47JsRhX7jgHRdSZDbHyd5Z77VLsvYapzRJDQmr8?=
 =?us-ascii?Q?iG/pmHfjyCdnl4+0hFR6wbGjstwKLU4ICFdINjBqQeZkeTL6ap3YT0gMORrv?=
 =?us-ascii?Q?RtWbjaXqw01MvS6NEGqQQhnllBIcPT5I0IdkAqgWNnoM8D3yMO/xjyrIqsQK?=
 =?us-ascii?Q?A9duJs0JgtE7gXfFGLuU9OZwMwNrG4r/7OaE0eNwF62y5Nwp2zQUfsS4j0/s?=
 =?us-ascii?Q?6F/BJASF8Sn+ROJx5JOtmYNMVJBFnRPBF/WCaHzMfeNVIOCplSZE0OkRdiaH?=
 =?us-ascii?Q?S9i3PbPIIhAcZFj+cWoUnIQJK/XysbHcObnpRW7N0Jnbd/nOK3T00tqgjvb+?=
 =?us-ascii?Q?U6mM0I8F7tZP5VTCAoxgav8PV4lKi3WCNVzRqK/FdHXn84iO+deVsE3L7alz?=
 =?us-ascii?Q?9C3A36vTfyR8/YncMyVgfls8PxNc0whM/0oJ1Pv3pYf95vZ53/DQjZPzfI5Q?=
 =?us-ascii?Q?OWNeizW+AoqPjrs5fP7BL44+KN3R5Fghg27gj1MNXIEBPiZ32IP84HGVB1Ar?=
 =?us-ascii?Q?+MUuKmKyd+chf2RjLTayJZuUwdSIwn9n/vpBMkbkywa1eEimF+WcgPwpCusy?=
 =?us-ascii?Q?Q/uF9AQgsxxQaMfY/eld93u/euy1hWkj9ras5ujduX6exWUA8w1rtmoeR5dc?=
 =?us-ascii?Q?IIrTTO9O8e7DdagHUXoON60fI5Gb8yySUgHXp6X6VF2TQCQFZu0C/mH53Wu3?=
 =?us-ascii?Q?GxFqmXSptAu15d+4zbh9WxkucpWR5mBGwWy4lu95E0BwVr4DDUjS/TrlVLaj?=
 =?us-ascii?Q?0rzxmABVXGNHhVjbT2wgUo0MSlte7gs6ipqx3tveeO82tRgALu2f8siUVAIk?=
 =?us-ascii?Q?5cxyDbCLVX4t7DzI7IOMiCNe9YGcQV0b3RT/eRsdv8roy78vgmej5Xqyb5q8?=
 =?us-ascii?Q?CgEsAN5jeCZujtoFISqPASQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 031eef3d-65da-4736-f533-08d9d22429c9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:25:01.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xQPHBRx6rKcTSpeQujb+8n226X0SWTGlqYcsXatNh8PIVDL1PSNa++LJcxaorWguFTZ1VCKnNFtXTegMUxpWew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-ORIG-GUID: 389goawKAEqGxjdst7Dz_0GfXYp_tqyR
X-Proofpoint-GUID: OIbwsPkOT7nfTOxZv6vJLmKd_3OB9Jpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_09,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=858 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 21:25:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160268

Since the kernel source is stored in work-shared, we need to add it
to the search path so the kernel and kernel-modules source code can
be found correctly.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 0a4db80aba5..e1ff2bbb787 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -254,6 +254,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
         Path(d.getVar('PKGD')),
         Path(d.getVar('STAGING_DIR_TARGET')),
         Path(d.getVar('STAGING_DIR_NATIVE')),
+        Path(d.getVar('STAGING_KERNEL_DIR')),
     ]
 
     pkg_data = oe.packagedata.read_subpkgdata_extended(package, d)
@@ -275,7 +276,10 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
         for debugsrc in file_data["debugsrc"]:
             ref_id = "NOASSERTION"
             for search in debug_search_paths:
-                debugsrc_path = search / debugsrc.lstrip("/")
+                if debugsrc.startswith("/usr/src/kernel"):
+                    debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
+                else:
+                    debugsrc_path = search / debugsrc.lstrip("/")
                 if not debugsrc_path.exists():
                     continue
 
-- 
2.31.1


