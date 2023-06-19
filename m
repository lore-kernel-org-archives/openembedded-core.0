Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26923EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 07:41:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2804.1687160494352208836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WM/Xm/A9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J6TfgS003709
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=IK0FfvqyX1rrbUwWsxwohvAtIKYTPSlEsqwC7sBvC+E=;
 b=WM/Xm/A9AK3k1IQ9GY19yrBSN10ybidJ1rpB68MVAHC3JSoDr640Oyvv0qJBN7ilQJ0N
 Y1zyJ4oJm1X283qGtWEuvZd3j7zHSQg9NkfqO2YvLD1ThAZEfPgjqhA824BB6wcvlyzw
 uM1ro9qvlNeXM9v0pPxkNrcIM4ZLfz9uDJKKIrTUrBRNxJJJyBCHZD+DyqTFzHOwp7wH
 PrYNFPtO0YPoS+4Jqp8b1w5TprrmYV/JAB1pGt76pFQ846TXqMzLMPWyWWbn+EBSUXDV
 HY3GB4Qx35U0sk91k1dTFLK5pcq+ndEEb4hfueHqeCwNmdK+wxDn0j/0eZco2q32/Flp UA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220he5j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eflmQhXRgqtudjl48zIYtdihFfyH4bJ4LMWdqQ3iZ+chkKve7v9SqMuCKGXmV4/gGuPqFH/LeYLHDT2/8UueIB1lL+Wy2fxlmtEZSo6OLoEa203YCa/iZv++/o8SV6ekYXUJHX8hjfHIxxt7QaL4IN/aHv8gsTyKXaK86ahiitbS6W/FrKh8SMp1PsxJ4dkDWOs7LQ0HJkcQzi/jQjZ9eRTQooJl7swMnD0kx4UIIKemsaR/MlgFbYE/0x2NInzsSi8uZ7pGdElDD//6aDzcmSskb0Ox9t40wOLC/8Y4mNU8BXudBPvvv41089Vcv59+8ZZy2ttxRgMHk+wk+FUSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK0FfvqyX1rrbUwWsxwohvAtIKYTPSlEsqwC7sBvC+E=;
 b=dowozOZKlhOHMjgmhH/t8GNZKJ/nA0nnR/4BlmLQwEboeZONhkALGeJMKrUt93S+bjRw2HvnuArUrAWi+bSX9v5WK1vJOtm9CnVl6bfOYrdQ8re5PHRGLg5Xd6dKgNRlQCNSFM25j+yuwC0vllSaLWpxLxQ1ETU2LedFG/B8LVd6zVGbaHuA6QLLJCDZXYbHFZ2wbpLizK0FbrjmnRX95S70t8ODYCF4chHaDAk7WcQlJUQSRQaYLEKtFhOIk/b5Js6ZBLJ8g5R0Czyf/IT+5a8/CfdbWUN1nFV61sqVTPNk9Q+ODZ6o4Yk09fuKmiNa55c+Z0z0Z0scbFG7oJLm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 19 Jun
 2023 07:41:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 07:41:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] sdk.py: error out when moving file fails
Date: Mon, 19 Jun 2023 00:41:08 -0700
Message-Id: <20230619074110.2831977-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a3e462-98b9-40c0-7ab8-08db709892fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nXJE8fzj+7XVyp2pzG5ceD70a/5hVSMleiVhhSFvmpoLQzDyAlfHqiQLACo5zRKC9poV78DaO6I8KbTwKXZT+JLUbsHrIYOhXln0hL/Gf4pQr0UPw5RlNPnYPgp1V3CZu5myUXwBdgfGsGTLdf1Bw19h5yhR67Oky9XUSJso79VssEY/wQJKwqaAFQ3D/bCy7YYfi5VSftPDr2aSnYIEw/6lAhMvpd1IbY2kpUF5o/MOa5xRaWjw7h1BOKEA3+jBq5MdM/F09k2LyZ5nrdS3GT5DJgM7A0/JUJTfz8GSkaKinjQIu/zlPrYrAwQl7gUnHJRqU2NZQmL+WiHzGnGlWKyeCOrL/8cD7wRMPyb8M21lCaWaq8mWYxJmTx8YPiFHQDN24U9qU4v0nyM7OpmD5IG8t46qMnGG1VDCz75cBJjhAFNcz1QTXPA3VZNiqWCly3oPXZbxLUDjeifChZZvz3zKGsorVbETdf1TWWwWXmXqgO95P2xNCNECbxN92hR54pV67tssNqRQP1RzxAiHIKA0A+xc8U6v33dxnOcKxOHc04gIPryBH8p+KxFSAhPm1KwEPYocJXmzFst0lN/AJHvhmOzqBGgctbcjmVqX/MO/tjVHbCj5JkCwDdBCEdPE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(366004)(376002)(346002)(136003)(451199021)(6916009)(66946007)(66556008)(36756003)(186003)(478600001)(2616005)(2906002)(66476007)(4744005)(316002)(8676002)(41300700001)(6666004)(86362001)(6486002)(6506007)(9686003)(1076003)(8936002)(83380400001)(26005)(38350700002)(38100700002)(52116002)(5660300002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4DBEeN6BMWEwAaBCzw39nWiiUlPo0Y46pyuVrvj/FHTIMbUnBQdUH903ilfs?=
 =?us-ascii?Q?8jw5N1RDOZ5snH6/QNRG46xAD689spHHqusFbhbq/W4hZhEWIcCcxP3LbGYJ?=
 =?us-ascii?Q?VXQZ/rdi1vwAOLRy2uRVvGFOKcfBuO6eD5mZkksl5ATBGmqx0Bs2A4DCsyDK?=
 =?us-ascii?Q?4Y+5/9ZxS920HIfcFdaOETuaV70EAGO2KwzDkahK2jhf/QWwYBAAz7pk3D2w?=
 =?us-ascii?Q?UlvrmQ4nHGOv8W3RCcaeZ/GqePjBZL9r2dgn+6J2SsLu8CpJyhCoBSC6c/MR?=
 =?us-ascii?Q?0egufcHG+6MudgSCUSSGPT6jVL/QpcGR2lcQ1DcmSmHDsyCVJEKxDXDIGyvV?=
 =?us-ascii?Q?mfRSiHzoRT5iVTfDdmzQXgmGpnEXrZrL6BTV6mlPwOSvFTz3Hi5WZ7bTBLA4?=
 =?us-ascii?Q?+5r5Xg/zid/8dKWAMGIzOUrr4Uz24rL1lxvHlXSlAFNl2u/8AUzlHscBBmpG?=
 =?us-ascii?Q?CTQ5LnV/PovOntjIVHnTrHpVRLQaa5nWhfp2JI5bcoeugFNc779Hhae+Hdcl?=
 =?us-ascii?Q?j4xL0ppnBFpMKxTbj6rHnxkiWnB3poF1IoUwglpLzczv/JAJRMcugYtcIbcc?=
 =?us-ascii?Q?TjZk2Fy7/F/2n8AMGHK3YXa4MS8zPOgd4AfnE/7vPxWR3nNUapHDJHF/bos6?=
 =?us-ascii?Q?+4TAD044/8eJIL58E2ntIaV/BEFq3GTSo+e20z0f98gct9HYSG0d3kMmTtUc?=
 =?us-ascii?Q?vVTwVGpdBs5tOXIdOsFIGQZThydeno4O/Uq83B6wDOBjNlcORRBpekCmsGdF?=
 =?us-ascii?Q?2KOg3msNEfq9kIoBi5Nn8EdBhqcWL2z5HiePdVC0WXXVx/rstp85guVSi6KB?=
 =?us-ascii?Q?kK1xffGmiJjy/XM8SnAx07mLG1jSbe6o/zQ4nXhMCaciGyhs3gtHk7XdPoVC?=
 =?us-ascii?Q?x9aOrgi52AbnnLO6hcL5tEjL8HJ+hM8iIZ6yswtpxSnEGuTCcZ/AOhp56BJk?=
 =?us-ascii?Q?q1Eq56saN5zZ/SR0dWdlJ9cyd0Ap/yNhO5qJUqwRhMzNxRmDUJNSXzabj6Lg?=
 =?us-ascii?Q?su+ttjnVaEc1bKK7+is4s+qTv9M6HxV/i/7Tyz0Kup7Cm+8mAalfE1+1p90R?=
 =?us-ascii?Q?zd5hj5EiQ/zd/eiR4Ua1IrlQhiZX8Zvathr5VpESxNknTYLxffEQBBphJL6L?=
 =?us-ascii?Q?SLblNvNaJx7HEuQrb+ZHH732vON7cFhFzznUVbglPPbeCa8IV/n1R8BobZ+S?=
 =?us-ascii?Q?pCc/yG8V5cv1/XEAOuvONujXZt+B4tIcYwMBB+aULJYL3BTZRvwKmluweJZS?=
 =?us-ascii?Q?WzXr4TtCuKNthGF5Q0vkIkM+V4z4f02mdmgryDEIN6s1EL6YpJLvrjD95mdk?=
 =?us-ascii?Q?hY0oz7D4m8K8DpHNknBpyjqC/OE9TAmCucRG0TeEnnOg215sFWTrW3LzYFz8?=
 =?us-ascii?Q?jRZKdar3jmhUPfvzIec208zqRHIpDQ3/pQJLQXbPc6MbGPl1iUalVcs1YP+H?=
 =?us-ascii?Q?DZHsvFOukc/DsHYhvO07mG8zzNr0g7glXBIA6puBKRnVEZ0B90v6QFnuvnZC?=
 =?us-ascii?Q?q6z0SXSzXa5MVx804jHlEI1klYXHDA3TO62faNzIRlSIDOK085Y6mdEKnyYv?=
 =?us-ascii?Q?+Nrxathc+lMUAFr4KOgT9BC+yjmObQQkHmzd5e8mVyONFBd3mI3VwkNWP5jK?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a3e462-98b9-40c0-7ab8-08db709892fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 07:41:20.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jAH7N78Noh9kRaNUX18xVplEsSG8jStZ/8iVP2zoYoOhjjf90PlLhWW6SKneqZ8KJ+2aIWulw7GY4/zBwUG5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
X-Proofpoint-GUID: XHaFUvOuKoPH2KLT7nWvKWJvJKoLdb7T
X-Proofpoint-ORIG-GUID: XHaFUvOuKoPH2KLT7nWvKWJvJKoLdb7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=845 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183094

From: Chen Qi <Qi.Chen@windriver.com>

Instead of printing an error message and continuing, we should just
error out when moving file fails.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 81fcf15371..3dc3672210 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -70,7 +70,7 @@ class Sdk(object, metaclass=ABCMeta):
         #FIXME: using umbrella exc catching because bb.utils method raises it
         except Exception as e:
             bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
-            bb.error("unable to place %s in final SDK location" % sourcefile)
+            bb.fatal("unable to place %s in final SDK location" % sourcefile)
 
     def mkdirhier(self, dirpath):
         try:
-- 
2.40.0


